(in-package #:cl-stack-calendars)

;;;; Internal rule representation backing RULE-CALENDAR / DEFINE-CALENDAR.
;;;; These structs and RULE-OCCURRENCE are the implementation of the
;;;; declarative rule DSL; calendars never consult them except through
;;;; RULE-OCCURRENCE.

(defstruct holiday-rule
  (name nil :type (or null string))
  (from nil :type (or null integer))
  (to nil :type (or null integer)))

(defstruct (fixed-holiday-rule (:include holiday-rule))
  "A holiday on a fixed MONTH/DAY every year (e.g. Christmas), optionally
shifted to a nearby weekday via OBSERVED when it falls on a weekend."
  (month 1 :type (integer 1 12))
  (day 1 :type (integer 1 31))
  (observed nil :type (member nil :nearest-weekday :next-weekday :previous-weekday)))

(defstruct (nth-weekday-holiday-rule (:include holiday-rule))
  "A holiday on the NTH occurrence of WEEKDAY in MONTH every year (e.g. the
3rd Monday of January); NTH may be 1-5, or -1 for the last occurrence."
  (month 1 :type (integer 1 12))
  (weekday 1 :type (integer 1 7))
  (nth 1 :type integer))

(defstruct (easter-holiday-rule (:include holiday-rule))
  "A holiday OFFSET days from Western (or, if ORTHODOX, Orthodox) Easter
Sunday every year (e.g. Good Friday is offset -2)."
  (offset 0 :type integer)
  (orthodox nil))

(defun rule-active-p (rule year)
  (and (or (null (holiday-rule-from rule)) (>= year (holiday-rule-from rule)))
       (or (null (holiday-rule-to rule)) (<= year (holiday-rule-to rule)))))

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

;;; --- :OBSERVED weekend-shift helpers ---------------------------------------

(defun shift-forward-past-weekend (date weekend-days)
  "DATE, or the first following day that is not a WEEKEND-DAYS weekday."
  (loop for d = date then (+ d 1)
        while (member (date-day-of-week d) weekend-days)
        finally (return d)))

(defun shift-backward-past-weekend (date weekend-days)
  "DATE, or the first preceding day that is not a WEEKEND-DAYS weekday."
  (loop for d = date then (- d 1)
        while (member (date-day-of-week d) weekend-days)
        finally (return d)))

(defun shift-nearest-past-weekend (date weekend-days)
  "The classic US-style \"nearest weekday\" rule: if DATE is the first day of
a weekend block, shift back to the preceding non-weekend day; otherwise shift
forward to the following non-weekend day. Exact for the common one- or
two-day contiguous weekend case (Saturday->Friday, Sunday->Monday)."
  (if (not (member (date-day-of-week date) weekend-days))
      date
      (let ((previous (- date 1)))
        (if (not (member (date-day-of-week previous) weekend-days))
            previous
            (shift-forward-past-weekend date weekend-days)))))

(defun apply-observed-shift (date observed weekend-days)
  (ecase observed
    ((nil) date)
    (:nearest-weekday (shift-nearest-past-weekend date weekend-days))
    (:next-weekday (shift-forward-past-weekend date weekend-days))
    (:previous-weekday (shift-backward-past-weekend date weekend-days))))

;;; --- RULE-OCCURRENCE --------------------------------------------------

(defgeneric rule-occurrence (rule year weekend-days)
  (:documentation "The DATE RULE falls on in YEAR (after any :OBSERVED
shift), or NIL if RULE is not active in YEAR per its :FROM/:TO range."))

(defmethod rule-occurrence ((rule fixed-holiday-rule) year weekend-days)
  (when (rule-active-p rule year)
    (apply-observed-shift (make-date year (fixed-holiday-rule-month rule) (fixed-holiday-rule-day rule))
                           (fixed-holiday-rule-observed rule)
                           weekend-days)))

(defmethod rule-occurrence ((rule nth-weekday-holiday-rule) year weekend-days)
  (declare (ignore weekend-days))
  (when (rule-active-p rule year)
    (nth-weekday-of-month year (nth-weekday-holiday-rule-month rule)
                           (nth-weekday-holiday-rule-weekday rule)
                           (nth-weekday-holiday-rule-nth rule))))

(defmethod rule-occurrence ((rule easter-holiday-rule) year weekend-days)
  (declare (ignore weekend-days))
  (when (rule-active-p rule year)
    (+ (if (easter-holiday-rule-orthodox rule) (easter-orthodox year) (easter-western year))
       (easter-holiday-rule-offset rule))))
