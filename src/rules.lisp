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
  (to nil :type (or null integer date))
  ;; Normative citation(s): statute, EO, ECB decision, proclamation, etc.
  ;; Source of truth for WHEN the holiday exists and HOW it is observed.
  (authority nil :type (or null string list)))

(defparameter *observed-policies*
  '((:us-federal-in-lieu
     :implements (:nearest-weekday)
     :authority ("5 U.S.C. § 6103(b) (Saturday → preceding Friday)"
                 "Exec. Order No. 11582 § 3(a) (Sunday → following Monday)")
     :uri ("https://uscode.house.gov/view.xhtml?req=granuleid:USC-prelim-title5-section6103"
           "https://www.federalregister.gov/executive-order/11582"))
    (:uk-proclamation-substitute
     :implements (:next-weekday)
     :authority ("Banking and Financial Dealings Act 1971 s.1 & Sch.1; Royal Proclamations (substitute weekday when a bank holiday falls on a weekend — normally the following Monday; exclusive across Christmas/Boxing)"
                 "https://www.legislation.gov.uk/ukpga/1971/80"
                 "https://www.gov.uk/bank-holidays"))
    (:jp-furikae
     :implements (:jp-furikae)
     :authority ("国民の祝日に関する法律（昭和23年法律第178号）第3条第2項 — 祝日が日曜日に当たるとき、その日後においてその日に最も近い国民の祝日でない日を休日とする（土曜は振替なし）")
     :uri ("https://www8.cao.go.jp/chosei/shukujitsu/gaiyou.html"))
    (:jp-kokumin-no-kyujitsu
     :implements (:sandwich)
     :authority ("国民の祝日に関する法律第3条第3項 — その前日及び翌日が国民の祝日である日は休日とする")
     :uri ("https://www8.cao.go.jp/chosei/shukujitsu/gaiyou.html"))
    (:ru-tk-112-transfer
     :implements (:ru-tk-112-transfer)
     :authority ("Трудовой кодекс РФ ст. 112 ч. 2 — при совпадении выходного и нерабочего праздничного дня выходной переносится на следующий рабочий день, за исключением праздников 1–8 января (их переносит Правительство РФ)")
     :uri ("http://www.consultant.ru/document/cons_doc_LAW_34683/")))
  "Normative observance policies. Prefer these over mechanical primitives in
starter calendars; primitives exist only as implementation atoms.")

(defstruct (fixed-holiday-rule (:include holiday-rule))
  "A holiday on a fixed MONTH/DAY every year (e.g. Christmas), optionally
rearranged via a statute-backed OBSERVED policy when it falls on a weekend."
  (month 1 :type (integer 1 12))
  (day 1 :type (integer 1 31))
  (observed nil)
  (bridge nil :type (member nil :adjacent)))

(defstruct (nth-weekday-holiday-rule (:include holiday-rule))
  "A holiday on the NTH occurrence of WEEKDAY in MONTH every year (e.g. the
3rd Monday of January); NTH may be 1-5, or -1 for the last occurrence."
  (month 1 :type (integer 1 12))
  (weekday 1 :type (integer 1 7))
  (nth 1 :type integer)
  (observed nil)
  (bridge nil :type (member nil :adjacent)))

(defstruct (easter-holiday-rule (:include holiday-rule))
  "A holiday OFFSET days from Western (or, if ORTHODOX, Orthodox) Easter
Sunday every year (e.g. Good Friday is offset -2)."
  (offset 0 :type integer)
  (orthodox nil)
  (observed nil)
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

;;; --- Observance (normative policies → mechanical atoms) -------------------
;;;;
;;;; Prefer statute-named OBSERVED keywords in starter calendars:
;;;;
;;;;   :US-FEDERAL-IN-LIEU          5 U.S.C. § 6103(b) + EO 11582 § 3(a)
;;;;   :UK-PROCLAMATION-SUBSTITUTE  BFDA 1971 + Royal Proclamations / gov.uk
;;;;   :JP-FURIKAE                  祝日法第3条第2項 (Sunday only → next free day)
;;;;
;;;; Mechanical primitives (implementation atoms, not country defaults):
;;;;   :NEAREST-WEEKDAY :NEXT-WEEKDAY :PREVIOUS-WEEKDAY :MONDAY :SUBSTITUTE-NEXT
;;;;
;;;; :BRIDGE :ADJACENT is NOT a general legal default (Spanish “puente” is
;;;; typically customary / collective-agreement). Only attach it when the
;;;; rule's :AUTHORITY cites a normative bridge. Japan’s continuous holiday
;;;; block is :SANDWICH on the calendar (祝日法第3条第3項), not :BRIDGE.

(defun weekendp (date weekend-days)
  (and (member (date-day-of-week date) weekend-days) t))

(defun sundayp (date)
  (= (date-day-of-week date) 7))

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
  "Sat→Fri, Sun→Mon for a contiguous Sat/Sun weekend (5 U.S.C. § 6103(b) +
EO 11582 § 3(a) for a Monday–Friday basic workweek)."
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

(defun canonicalize-observed (observed)
  "Map statute-named policies onto mechanical atoms (or leave specialty policies)."
  (case observed
    (:us-federal-in-lieu :nearest-weekday)
    (:uk-proclamation-substitute :next-weekday)
    (otherwise observed)))

(defun ru-new-year-holiday-block-p (date)
  "ТК РФ ст. 112: нерабочие праздничные дни 1–8 января исключены из
автоматического переноса выходного на следующий рабочий день —
их переносит Правительство РФ отдельным постановлением."
  (and (= (date-month date) 1)
       (<= 1 (date-day date) 8)))

(defun apply-move-observed (date observed weekend-days claimed)
  "Single moved observance date for move-style policies."
  (ecase observed
    ((nil) date)
    (:nearest-weekday (shift-nearest-past-weekend date weekend-days))
    (:next-weekday (shift-forward-past-weekend-and-claimed date weekend-days claimed))
    (:previous-weekday (shift-backward-past-weekend date weekend-days))
    (:monday
     (if (weekendp date weekend-days)
         (shift-forward-past-weekend-and-claimed date weekend-days claimed)
         date))))

(defun apply-bridge-days (dates weekend-days bridge)
  "Extend DATES only when an AUTHORITY-cited :BRIDGE is present."
  (ecase bridge
    ((nil) dates)
    (:adjacent
     (let ((extra '()))
       (dolist (d dates)
         (unless (weekendp d weekend-days)
           (case (date-day-of-week d)
             (2 (push (- d 1) extra))
             (4 (push (+ d 1) extra)))))
       (remove-duplicates (append dates (nreverse extra)) :test #'=)))))

(defun observe-dates (nominal observed bridge weekend-days &optional claimed)
  "Holiday dates from NOMINAL under a (possibly statute-named) OBSERVED policy.
CLAIMED makes exclusive next-weekday substitutes skip collisions (UK Christmas
+ Boxing under proclamations)."
  (let* ((policy (canonicalize-observed observed))
         (base
          (ecase policy
            ((nil) (list nominal))
            ((:nearest-weekday :next-weekday :previous-weekday :monday)
             (list (apply-move-observed nominal policy weekend-days claimed)))
            (:substitute-next
             (if (weekendp nominal weekend-days)
                 (list nominal
                       (shift-forward-past-weekend-and-claimed nominal weekend-days claimed))
                 (list nominal)))
            (:jp-furikae
             (if (sundayp nominal)
                 (list nominal
                       (shift-forward-past-weekend-and-claimed nominal weekend-days claimed))
                 (list nominal)))
            (:ru-tk-112-transfer
             ;; ТК РФ ст. 112 ч. 2: weekend∩holiday → next workday,
             ;; except Jan 1–8 (Government decree transfers those).
             (cond ((not (weekendp nominal weekend-days))
                    (list nominal))
                   ((ru-new-year-holiday-block-p nominal)
                    (list nominal))
                   (t (list nominal
                            (shift-forward-past-weekend-and-claimed
                             nominal weekend-days claimed)))))))
         (bridged (apply-bridge-days base weekend-days bridge)))
    (remove-if (lambda (d) (member d claimed :test #'=)) bridged)))

(defun apply-sandwich-holidays (date-name-alist)
  "祝日法第3条第3項: a non-holiday weekday whose previous and next days are
both holidays becomes a holiday (国民の休日). DATE-NAME-ALIST is a list of
(DATE . NAME); returns an extended alist."
  (let* ((dates (sort (mapcar #'car date-name-alist) #'<))
         (set dates)
         (extra '()))
    (dolist (d dates)
      (let ((mid (+ d 1)))
        (when (and (not (member mid set :test #'=))
                   (member (+ mid 1) set :test #'=)
                   (not (weekendp mid '(6 7))))
          (push (cons mid "国民の休日") extra)
          (push mid set))))
    (append date-name-alist (nreverse extra))))

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

(defgeneric rule-authority (rule)
  (:method ((rule holiday-rule)) (holiday-rule-authority rule)))

(defgeneric rule-occurrences (rule year weekend-days &optional claimed)
  (:documentation "List of DATEs RULE produces in YEAR after statute-backed
OBSERVED rearrangement. CLAIMED dates make exclusive substitutes skip
collisions. Empty when the nominal date is outside RULE's civil validity
window. See HOLIDAY-RULE-AUTHORITY for the normative citation."))

(defmethod rule-occurrences ((rule holiday-rule) year weekend-days &optional claimed)
  (let ((nominal (rule-nominal-date rule year)))
    (when (and nominal (rule-valid-at-p rule nominal))
      (observe-dates nominal (rule-observed rule) (rule-bridge rule)
                     weekend-days claimed))))

;;; Compatibility: single primary occurrence (first of RULE-OCCURRENCES).
(defun rule-occurrence (rule year weekend-days &optional claimed)
  (first (rule-occurrences rule year weekend-days claimed)))
