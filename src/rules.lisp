(in-package #:cl-stack-calendars)

;;;; Internal rule representation backing RULE-CALENDAR / DEFINE-CALENDAR.
;;;; These structs and RULE-OCCURRENCE are the implementation of the
;;;; declarative rule DSL; calendars never consult them except through
;;;; RULE-OCCURRENCE.

(defstruct holiday-rule
  (name nil :type (or null string))
  ;; Civil validity window for the rule itself (not versioned “as-of” knowledge).
  ;; Integer = Gregorian year bound; DATE = inclusive day bound. NIL = open.
  (from nil :type (or null integer date))
  (to nil :type (or null integer date)))

(defstruct (fixed-holiday-rule (:include holiday-rule))
  "A holiday on a fixed MONTH/DAY every year (e.g. Christmas), optionally
rearranged via OBSERVED when it falls on a weekend and/or BRIDGE'd to make
a continuous holiday block."
  (month 1 :type (integer 1 12))
  (day 1 :type (integer 1 31))
  (observed nil :type (member nil :nearest-weekday :next-weekday :previous-weekday
                                  :monday :substitute-next))
  (bridge nil :type (member nil :adjacent)))

(defstruct (nth-weekday-holiday-rule (:include holiday-rule))
  "A holiday on the NTH occurrence of WEEKDAY in MONTH every year (e.g. the
3rd Monday of January); NTH may be 1-5, or -1 for the last occurrence."
  (month 1 :type (integer 1 12))
  (weekday 1 :type (integer 1 7))
  (nth 1 :type integer)
  (observed nil :type (member nil :nearest-weekday :next-weekday :previous-weekday
                                  :monday :substitute-next))
  (bridge nil :type (member nil :adjacent)))

(defstruct (easter-holiday-rule (:include holiday-rule))
  "A holiday OFFSET days from Western (or, if ORTHODOX, Orthodox) Easter
Sunday every year (e.g. Good Friday is offset -2)."
  (offset 0 :type integer)
  (orthodox nil)
  (observed nil :type (member nil :nearest-weekday :next-weekday :previous-weekday
                                  :monday :substitute-next))
  (bridge nil :type (member nil :adjacent)))

(defun normalize-rule-bound (bound)
  "Accept NIL, a Gregorian year integer, a DATE, or a (YEAR MONTH DAY) list."
  (cond ((null bound) nil)
        ((typep bound 'date) bound)
        ((integerp bound) bound)
        ((and (consp bound) (= (length bound) 3))
         (destructuring-bind (y m d) bound
           (make-date y m d)))
        (t (error 'invalid-holiday-rule
                  :message (format nil "invalid :from/:to bound ~s (want year, date, or (y m d))"
                                   bound)))))

(defun rule-valid-at-p (rule date)
  "True when DATE falls inside RULE's inclusive civil validity window.
Year bounds apply to DATE's Gregorian year; date bounds compare by RD."
  (flet ((from-ok (bound)
           (cond ((null bound) t)
                 ((integerp bound) (>= (date-year date) bound))
                 (t (>= date bound))))
         (to-ok (bound)
           (cond ((null bound) t)
                 ((integerp bound) (<= (date-year date) bound))
                 (t (<= date bound)))))
    (and (from-ok (holiday-rule-from rule))
         (to-ok (holiday-rule-to rule)))))

;;; Backward-compatible alias used by older call sites / tests.
(defun rule-active-p (rule year)
  (rule-valid-at-p rule (make-date year 7 1)))

;;; --- weekday keywords ----------------------------------------------------

(defparameter *weekday-keywords*
  '((:monday . 1) (:tuesday . 2) (:wednesday . 3) (:thursday . 4)
    (:friday . 5) (:saturday . 6) (:sunday . 7))
  "ISO weekday numbers (1=Monday..7=Sunday) for the keyword spellings accepted
by DEFINE-CALENDAR's :NTH-WEEKDAY clause.")

(defun normalize-weekday (weekday)
  "Accepts either an ISO weekday integer (1-7) or a keyword like :MONDAY."
  (etypecase weekday
    (integer weekday)
    (keyword (or (cdr (assoc weekday *weekday-keywords*))
                 (error 'invalid-holiday-rule
                        :message (format nil "unknown weekday keyword ~s" weekday))))))

(defun nth-weekday-of-month (year month weekday nth)
  "The NTH occurrence of WEEKDAY (1=Monday..7=Sunday) in YEAR/MONTH. NTH may
be 1-5, or -1 for the last occurrence in the month."
  (if (eql nth -1)
      (loop for d = (make-date year month (days-in-gregorian-month year month))
              then (- d 1)
            until (= (date-day-of-week d) weekday)
            finally (return d))
      (let* ((first-date (make-date year month 1))
             (offset (mod (- weekday (date-day-of-week first-date)) 7)))
        (+ first-date (+ offset (* 7 (1- nth)))))))

;;; --- Observance: weekend moves, substitutes, bridges ----------------------
;;;;
;;;; Countries rearrange working days when a holiday coincides with a weekend
;;;; and/or to create a continuous holiday block (puente / long weekend):
;;;;
;;;;   :NEAREST-WEEKDAY   US federal — Sat→Fri, Sun→Mon (move)
;;;;   :NEXT-WEEKDAY      move to first following non-weekend day
;;;;   :PREVIOUS-WEEKDAY  move to first preceding non-weekend day
;;;;   :MONDAY            Commonwealth “Mondayise” — Sat/Sun → following Monday
;;;;   :SUBSTITUTE-NEXT   keep the nominal date *and* add the next weekday when
;;;;                      nominal falls on a weekend (Japan 振替休日 style)
;;;;
;;;; :BRIDGE :ADJACENT adds a weekday that closes a gap to the weekend:
;;;;   observed on Tuesday → also Monday; on Thursday → also Friday.
;;;;
;;;; When several rules share a year (UK Christmas + Boxing Day), observance
;;;; can be exclusive: already-claimed weekdays are skipped so two holidays
;;;; don't collapse onto the same Monday.

(defun weekendp (date weekend-days)
  (and (member (date-day-of-week date) weekend-days) t))

(defun shift-forward-past-weekend (date weekend-days)
  "DATE, or the first following day that is not a WEEKEND-DAYS weekday."
  (loop for d = date then (+ d 1)
        while (weekendp d weekend-days)
        finally (return d)))

(defun shift-backward-past-weekend (date weekend-days)
  "DATE, or the first preceding day that is not a WEEKEND-DAYS weekday."
  (loop for d = date then (- d 1)
        while (weekendp d weekend-days)
        finally (return d)))

(defun shift-nearest-past-weekend (date weekend-days)
  "US-style nearest weekday: Sat→Fri, Sun→Mon for a contiguous weekend."
  (if (not (weekendp date weekend-days))
      date
      (let ((previous (- date 1)))
        (if (not (weekendp previous weekend-days))
            previous
            (shift-forward-past-weekend date weekend-days)))))

(defun shift-forward-past-weekend-and-claimed (date weekend-days claimed)
  "First day >= DATE that is neither a weekend day nor in CLAIMED (list of dates)."
  (loop for d = (shift-forward-past-weekend date weekend-days) then (+ d 1)
        unless (or (weekendp d weekend-days)
                   (member d claimed :test #'=))
          return d))

(defun apply-move-observed (date observed weekend-days claimed)
  "Single moved observance date, or NIL when OBSERVED is additive (:SUBSTITUTE-NEXT)."
  (ecase observed
    ((nil) date)
    (:nearest-weekday (shift-nearest-past-weekend date weekend-days))
    (:next-weekday (shift-forward-past-weekend-and-claimed date weekend-days claimed))
    (:previous-weekday (shift-backward-past-weekend date weekend-days))
    (:monday
     (if (weekendp date weekend-days)
         (shift-forward-past-weekend-and-claimed date weekend-days claimed)
         date))
    (:substitute-next nil)))

(defun apply-bridge-days (dates weekend-days bridge)
  "Possibly extend DATES with bridge weekdays for a continuous holiday block."
  (ecase bridge
    ((nil) dates)
    (:adjacent
     (let ((extra '()))
       (dolist (d dates)
         (unless (weekendp d weekend-days)
           (case (date-day-of-week d)
             (2 (push (- d 1) extra))   ; Tuesday → also Monday
             (4 (push (+ d 1) extra))))) ; Thursday → also Friday
       (remove-duplicates (append dates (nreverse extra)) :test #'=)))))

(defun observe-dates (nominal observed bridge weekend-days &optional claimed)
  "Return the list of holiday dates produced from NOMINAL under OBSERVED/BRIDGE.
CLAIMED (other holidays already taken this year) makes :NEXT-WEEKDAY / :MONDAY
exclusive. Validity of NOMINAL itself is the caller's responsibility."
  (let* ((base
          (ecase observed
            ((nil) (list nominal))
            ((:nearest-weekday :next-weekday :previous-weekday :monday)
             (list (apply-move-observed nominal observed weekend-days claimed)))
            (:substitute-next
             (if (weekendp nominal weekend-days)
                 (list nominal
                       (shift-forward-past-weekend-and-claimed nominal weekend-days claimed))
                 (list nominal)))))
         (bridged (apply-bridge-days base weekend-days bridge)))
    (remove-if (lambda (d) (member d claimed :test #'=)) bridged)))

;;; --- RULE-OCCURRENCES -------------------------------------------------

(defgeneric rule-nominal-date (rule year)
  (:documentation "Nominal (pre-observance) DATE of RULE in YEAR, or NIL."))

(defmethod rule-nominal-date ((rule fixed-holiday-rule) year)
  (make-date year (fixed-holiday-rule-month rule) (fixed-holiday-rule-day rule)))

(defmethod rule-nominal-date ((rule nth-weekday-holiday-rule) year)
  (nth-weekday-of-month year (nth-weekday-holiday-rule-month rule)
                         (nth-weekday-holiday-rule-weekday rule)
                         (nth-weekday-holiday-rule-nth rule)))

(defmethod rule-nominal-date ((rule easter-holiday-rule) year)
  (+ (if (easter-holiday-rule-orthodox rule) (easter-orthodox year) (easter-western year))
     (easter-holiday-rule-offset rule)))

(defgeneric rule-observed (rule)
  (:method ((rule fixed-holiday-rule)) (fixed-holiday-rule-observed rule))
  (:method ((rule nth-weekday-holiday-rule)) (nth-weekday-holiday-rule-observed rule))
  (:method ((rule easter-holiday-rule)) (easter-holiday-rule-observed rule)))

(defgeneric rule-bridge (rule)
  (:method ((rule fixed-holiday-rule)) (fixed-holiday-rule-bridge rule))
  (:method ((rule nth-weekday-holiday-rule)) (nth-weekday-holiday-rule-bridge rule))
  (:method ((rule easter-holiday-rule)) (easter-holiday-rule-bridge rule)))

(defgeneric rule-occurrences (rule year weekend-days &optional claimed)
  (:documentation "List of DATEs RULE produces in YEAR after OBSERVED/BRIDGE
rearrangement. CLAIMED dates (already taken by earlier rules) make exclusive
:NEXT-WEEKDAY / :MONDAY observance skip collisions. Empty when the nominal
date is outside RULE's civil validity window."))

(defmethod rule-occurrences ((rule holiday-rule) year weekend-days &optional claimed)
  (let ((nominal (rule-nominal-date rule year)))
    (when (and nominal (rule-valid-at-p rule nominal))
      (observe-dates nominal (rule-observed rule) (rule-bridge rule)
                     weekend-days claimed))))

;;; Compatibility: single primary occurrence (first of RULE-OCCURRENCES).
(defun rule-occurrence (rule year weekend-days &optional claimed)
  (first (rule-occurrences rule year weekend-days claimed)))
