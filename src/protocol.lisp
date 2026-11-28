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

(defgeneric weekend-days-on (calendar date)
  (:documentation "The ISO weekday list CALENDAR treats as weekend on DATE.
Differs from CALENDAR-WEEKEND-DAYS (the current list) when the weekend
changed by era, e.g. AE Fri–Sat → Sat–Sun on 2022-01-01."))

(defmethod weekend-days-on ((calendar holiday-calendar) date)
  (declare (ignore date))
  (calendar-weekend-days calendar))

(defgeneric weekend-day-p (calendar date)
  (:documentation "True if DATE's weekday is one of CALENDAR's weekend days
on DATE (see WEEKEND-DAYS-ON)."))

(defmethod weekend-day-p ((calendar holiday-calendar) date)
  (and (member (date-day-of-week date) (weekend-days-on calendar date)) t))

;;; --- calendar identity --------------------------------------------------

(defgeneric calendar-name (calendar)
  (:documentation "A human-readable name for CALENDAR, used in diagnostics
and in COMPOSITE-CALENDAR holiday names when a constituent holiday has none
of its own."))

(defmethod calendar-name ((calendar holiday-calendar))
  (string (class-name (class-of calendar))))

(defgeneric calendar-provenance (calendar)
  (:documentation "Where CALENDAR's holidays come from:

  :NORMATIVE       hand-maintained rules, each citing its statute, decree or
                   proclamation in :AUTHORITY (DEFINE-CALENDAR starters);
  :EXCHANGE        an exchange's own trading-holiday rules and notices
                   (EXCHANGE-HOLIDAY-CALENDAR, data/exchanges/calendars/);
  :CORPUS-DERIVED  rules inferred from the date-holidays corpus by
                   recurrence, checked against no statute;
  :CORPUS          the corpus table itself (COUNTRY-CALENDAR);
  NIL              not stated (a user calendar, or a composite)."))

(defmethod calendar-provenance ((calendar holiday-calendar))
  nil)

;;; --- holiday-observance value type ---------------------------------------

(defclass holiday-observance ()
  ((date :initarg :date :reader holiday-observance-date :type date)
   (name :initarg :name :initform nil :reader holiday-observance-name)
   (type :initarg :type :initform nil :reader holiday-observance-type
         :documentation "The holiday's type when the calendar knows it: one
of *HOLIDAY-TYPE-PRECEDENCE* (:PUBLIC, :BANK, …), else NIL."))
  (:documentation "A single holiday occurrence: DATE plus an optional
human-readable NAME and TYPE. Returned by HOLIDAYS-BETWEEN and HOLIDAY-INFO."))

(defun holiday-observance-p (x) (typep x 'holiday-observance))

(defun make-holiday-observance (date &optional name type)
  (make-instance 'holiday-observance :date date :name name :type type))

(defmethod print-object ((o holiday-observance) stream)
  (print-unreadable-object (o stream :type t)
    (format stream "~a~@[ ~s~]~@[ ~s~]" (holiday-observance-date o)
            (holiday-observance-name o) (holiday-observance-type o))))

;;; --- HOLIDAY-P / BUSINESS-DAY-P -------------------------------------------

(defgeneric holiday-p (calendar date)
  (:documentation "Returns (values GENERALIZED-BOOLEAN NAME-OR-NIL): true
(with an optional holiday NAME as the second value) when DATE is an official
holiday for CALENDAR, independent of weekend status. Every concrete calendar
kind must implement this."))

;;; --- data coverage -------------------------------------------------------

(defgeneric calendar-coverage (calendar)
  (:documentation "The years CALENDAR has holiday data for: NIL when it is not
bounded (rule calendars built from statute), (FROM-YEAR . TO-YEAR) for a
data-derived calendar, (FROM-YEAR . NIL) for one modeled from FROM-YEAR on
(the NYSE from 1953), or :NONE for an empty stub. A strict calendar signals
CALENDAR-OUT-OF-RANGE from HOLIDAY-P outside its coverage."))

(defmethod calendar-coverage ((calendar holiday-calendar))
  nil)

(defun date-covered-p (coverage date)
  "True when DATE lies inside COVERAGE (see CALENDAR-COVERAGE). A NIL TO-YEAR
is open-ended: (1953) covers 1953 onward."
  (cond ((null coverage) t)
        ((eq coverage :none) nil)
        (t (and (<= (car coverage) (date-year date))
                (or (null (cdr coverage)) (<= (date-year date) (cdr coverage)))))))

(defun call-with-coverage (calendar date strict thunk)
  "Call THUNK (HOLIDAY-P's body) when DATE is covered or STRICT is NIL.
Otherwise signal CALENDAR-OUT-OF-RANGE, with USE-VALUE (return that value)
and CONTINUE (not a holiday) restarts."
  (let ((coverage (calendar-coverage calendar)))
    (if (or (not strict) (date-covered-p coverage date))
        (funcall thunk)
        (restart-case (error 'calendar-out-of-range
                             :calendar calendar :date date :coverage coverage)
          (use-value (value)
            :report "Return a value for HOLIDAY-P."
            :interactive (lambda () (list (read)))
            (values value nil))
          (continue ()
            :report "Treat the date as not a holiday."
            (values nil nil))))))

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

;;; --- HOLIDAY-INFO / holiday types -------------------------------------------

(defparameter *holiday-type-precedence* '(:public :bank :optional :observance)
  "Holiday types, strongest first. A date with rows of several types
resolves to the first of them here (a :PUBLIC row beats a :BANK one). The
date-holidays corpus carries :PUBLIC and :BANK only; its generator dropped
optional and observance days.")

(deftype holiday-type ()
  "A keyword in *HOLIDAY-TYPE-PRECEDENCE*."
  '(member :public :bank :optional :observance))

(defgeneric holiday-info (calendar date)
  (:documentation "List of HOLIDAY-OBSERVANCE for DATE, one per holiday
CALENDAR keeps on it, strongest type first (a corpus date can carry several
rows: GT 2000-06-30 is both a :PUBLIC and a :BANK holiday). NIL when DATE is
not a holiday. Each observance carries the TYPE when CALENDAR knows it, else
NIL. Signals like HOLIDAY-P outside a strict calendar's coverage."))

(defmethod holiday-info ((calendar holiday-calendar) date)
  (multiple-value-bind (holidayp name) (holiday-p calendar date)
    (when holidayp
      (list (make-holiday-observance date name)))))

(defgeneric calendar-holiday-types (calendar)
  (:documentation "The holiday types CALENDAR counts, strongest first, or
NIL when the calendar does not type its holidays."))

(defmethod calendar-holiday-types ((calendar holiday-calendar))
  nil)

;;; --- business-day navigation ----------------------------------------------

(defparameter *business-day-search-limit* 366
  "Most days NEXT-BUSINESS-DAY / PREVIOUS-BUSINESS-DAY walk before signaling
NO-BUSINESS-DAY.")

(defun %search-business-day (calendar date step)
  "First business day of CALENDAR strictly after (STEP 1) or before (STEP -1)
DATE, within *BUSINESS-DAY-SEARCH-LIMIT* days; else signal NO-BUSINESS-DAY."
  (loop for k from 1 to *business-day-search-limit*
        for d = (+ date (* step k))
        when (business-day-p calendar d)
          do (return-from %search-business-day d))
  (error 'no-business-day :calendar calendar :date date
                          :direction (if (plusp step) :after :before)
                          :limit *business-day-search-limit*))

(defgeneric next-business-day (calendar date)
  (:documentation "The first business day of CALENDAR strictly after DATE."))

(defmethod next-business-day ((calendar holiday-calendar) date)
  (%search-business-day calendar date 1))

(defgeneric previous-business-day (calendar date)
  (:documentation "The first business day of CALENDAR strictly before DATE."))

(defmethod previous-business-day ((calendar holiday-calendar) date)
  (%search-business-day calendar date -1))

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

(defmethod adjust-date ((calendar holiday-calendar) date convention)
  "Unknown CONVENTION: signal INVALID-CONVENTION; USE-VALUE retries with another."
  (restart-case (error 'invalid-convention :convention convention)
    (use-value (other)
      :report "Adjust with another convention."
      :interactive (lambda () (list (read)))
      (adjust-date calendar date other))))

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

;;; --- EVENT-SCHEDULE (datetime-protocol extension) -------------------------

(defmethod event-schedule ((calendar holiday-calendar) (event (eql :holiday)) &key)
  (predicate-schedule (lambda (date) (holiday-p calendar date))))

(defmethod event-schedule ((calendar holiday-calendar) (event (eql :business-day)) &key)
  (predicate-schedule (lambda (date) (business-day-p calendar date))))

(defmethod event-schedule ((calendar holiday-calendar) (event (eql :weekend)) &key)
  (predicate-schedule (lambda (date) (weekend-day-p calendar date))))
