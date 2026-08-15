(in-package #:cl-stack-calendars)

;;;; Core HOLIDAY-CALENDAR protocol. Concrete calendar kinds (rule-calendar,
;;;; data-calendar, composite-calendar, versioned-calendar) specialize
;;;; HOLIDAY-P and usually CALENDAR-WEEKEND-DAYS; every other generic function
;;;; here has a default method built on top of just those two, so a new
;;;; calendar kind only has to implement HOLIDAY-P to get a working
;;;; BUSINESS-DAY-P / ADJUST-DATE / ... for free.

(defclass holiday-calendar ()
  ()
  (:documentation "Base protocol class for all calendar kinds in
cl-stack-calendars."))

;;; --- weekend policy ---------------------------------------------------

(defgeneric calendar-weekend-days (calendar)
  (:documentation "List of ISO weekday numbers (1=Monday .. 7=Sunday) that
CALENDAR treats as non-business weekend days, independent of holidays.
Default is Saturday/Sunday, i.e. (6 7)."))

(defmethod calendar-weekend-days ((calendar holiday-calendar))
  '(6 7))

(defgeneric weekend-day-p (calendar date)
  (:documentation "True if DATE's weekday is one of CALENDAR's weekend days."))

(defmethod weekend-day-p ((calendar holiday-calendar) date)
  (and (member (date-day-of-week date) (calendar-weekend-days calendar)) t))

;;; --- calendar identity --------------------------------------------------

(defgeneric calendar-name (calendar)
  (:documentation "A human-readable name for CALENDAR, used in diagnostics
and in COMPOSITE-CALENDAR holiday names when a constituent holiday has none
of its own."))

(defmethod calendar-name ((calendar holiday-calendar))
  (string (class-name (class-of calendar))))

;;; --- holiday-observance value type ---------------------------------------

(defclass holiday-observance ()
  ((date :initarg :date :reader holiday-observance-date :type date)
   (name :initarg :name :initform nil :reader holiday-observance-name))
  (:documentation "A single holiday occurrence: DATE plus an optional
human-readable NAME. Returned by HOLIDAYS-BETWEEN."))

(defun holiday-observance-p (x) (typep x 'holiday-observance))

(defun make-holiday-observance (date &optional name)
  (make-instance 'holiday-observance :date date :name name))

(defmethod print-object ((o holiday-observance) stream)
  (print-unreadable-object (o stream :type t)
    (format stream "~a~@[ ~s~]" (holiday-observance-date o) (holiday-observance-name o))))

;;; --- HOLIDAY-P / BUSINESS-DAY-P -------------------------------------------

(defgeneric holiday-p (calendar date)
  (:documentation "Returns (values GENERALIZED-BOOLEAN NAME-OR-NIL): true
(with an optional holiday NAME as the second value) when DATE is an official
holiday for CALENDAR, independent of weekend status. Every concrete calendar
kind must implement this."))

(defgeneric business-day-p (calendar date)
  (:documentation "True when DATE is neither a weekend day nor a holiday for
CALENDAR."))

(defmethod business-day-p ((calendar holiday-calendar) date)
  (and (not (weekend-day-p calendar date))
       (not (holiday-p calendar date))))

;;; --- HOLIDAYS-BETWEEN ------------------------------------------------------

(defgeneric holidays-between (calendar start end)
  (:documentation "List of HOLIDAY-OBSERVANCE, ordered by date, for every
holiday of CALENDAR in the closed interval [START, END]."))

(defmethod holidays-between ((calendar holiday-calendar) start end)
  (loop for d = start then (+ d 1)
        while (<= d end)
        for (holidayp name) = (multiple-value-list (holiday-p calendar d))
        when holidayp collect (make-holiday-observance d name)))

;;; --- business-day navigation ----------------------------------------------

(defgeneric next-business-day (calendar date)
  (:documentation "The first business day of CALENDAR strictly after DATE."))

(defmethod next-business-day ((calendar holiday-calendar) date)
  (loop for d = (+ date 1) then (+ d 1)
        when (business-day-p calendar d) return d))

(defgeneric previous-business-day (calendar date)
  (:documentation "The first business day of CALENDAR strictly before DATE."))

(defmethod previous-business-day ((calendar holiday-calendar) date)
  (loop for d = (- date 1) then (- d 1)
        when (business-day-p calendar d) return d))

(defgeneric add-business-days (calendar date n)
  (:documentation "DATE shifted by N business days of CALENDAR: forward if N
is positive, backward if negative, unchanged if zero. Does not check whether
DATE itself is a business day before shifting."))

(defmethod add-business-days ((calendar holiday-calendar) date n)
  (let ((result date))
    (cond ((plusp n) (dotimes (i n) (setf result (next-business-day calendar result))))
          ((minusp n) (dotimes (i (- n)) (setf result (previous-business-day calendar result)))))
    result))

(defgeneric business-days-between (calendar start end)
  (:documentation "Number of business days of CALENDAR in the half-open range
[START, END): positive when START < END, negative (the count for [END,
START)) when START > END, zero when START and END are the same date."))

(defun %count-business-days-forward (calendar from to)
  "Business days of CALENDAR in the half-open range [FROM, TO); assumes
FROM <= TO."
  (loop for d = from then (+ d 1)
        while (< d to)
        count (business-day-p calendar d)))

(defmethod business-days-between ((calendar holiday-calendar) start end)
  (cond ((= start end) 0)
        ((< start end) (%count-business-days-forward calendar start end))
        (t (- (%count-business-days-forward calendar end start)))))

;;; --- ADJUST-DATE ------------------------------------------------------

(defgeneric adjust-date (calendar date convention)
  (:documentation "Adjust DATE to a business day of CALENDAR under CONVENTION,
one of :FOLLOWING, :MODIFIED-FOLLOWING, :PRECEDING, :MODIFIED-PRECEDING,
:NEAREST, or :UNADJUSTED. DATE is returned unchanged whenever it is already a
business day."))

(defmethod adjust-date ((calendar holiday-calendar) date (convention (eql :unadjusted)))
  date)

(defmethod adjust-date ((calendar holiday-calendar) date (convention (eql :following)))
  (if (business-day-p calendar date) date (next-business-day calendar date)))

(defmethod adjust-date ((calendar holiday-calendar) date (convention (eql :preceding)))
  (if (business-day-p calendar date) date (previous-business-day calendar date)))

(defmethod adjust-date ((calendar holiday-calendar) date (convention (eql :modified-following)))
  (let ((adjusted (adjust-date calendar date :following)))
    (if (= (date-month adjusted) (date-month date))
        adjusted
        (adjust-date calendar date :preceding))))

(defmethod adjust-date ((calendar holiday-calendar) date (convention (eql :modified-preceding)))
  (let ((adjusted (adjust-date calendar date :preceding)))
    (if (= (date-month adjusted) (date-month date))
        adjusted
        (adjust-date calendar date :following))))

(defmethod adjust-date ((calendar holiday-calendar) date (convention (eql :nearest)))
  (if (business-day-p calendar date)
      date
      (let ((following (adjust-date calendar date :following))
            (preceding (adjust-date calendar date :preceding)))
        (if (<= (- following date) (- date preceding))
            following
            preceding))))

;;; --- CALENDAR-AS-OF (default: identity) -----------------------------------

(defgeneric calendar-as-of (calendar &key version as-of)
  (:documentation "Return the calendar snapshot in effect given :VERSION (a
version-tag, compared with EQUAL) or :AS-OF (an INSTANT). Calendars that are
not versioned just return themselves regardless of the arguments."))

(defmethod calendar-as-of ((calendar holiday-calendar) &key version as-of)
  (declare (ignore version as-of))
  calendar)
