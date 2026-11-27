(in-package #:cl-stack-calendars)

;;;; NYSE holidays — NYSE Rule 7.2 (Holidays) and the NYSE holiday schedule,
;;;; modeled from 1954. Not the US federal list: Good Friday closes the
;;;; Exchange; Columbus Day and Veterans Day do not. Weekend observance is
;;;; :NYSE-RULE-7-2 (Saturday → Friday unless the Friday ends an accounting
;;;; period, so a Saturday New Year's Day is not observed; Sunday → Monday).
;;;; Unscheduled closures (mourning days, weather, 2001-09-11 …) are data:
;;;; data/us/nyse-closures.sexp. Gold: data/tests/xnys-gold.sexp.

(defun %nyse-election-day (year)
  "Election Day closings: every year to 1967, presidential years 1968–1980."
  (when (or (<= year 1967) (zerop (mod year 4)))
    (+ (nth-weekday-of-month year 11 1 1) 1)))

(define-calendar nyse-holidays-calendar ()
  (:fixed "New Year's Day" 1 1 :from 1954
   :observed :nyse-rule-7-2
   :authority "NYSE Rule 7.2 — Saturday New Year's Day not observed (Dec 31 ends the yearly accounting period)")
  (:nth-weekday "Martin Luther King Jr. Day" 1 :monday 3 :from 1998
   :authority "NYSE holiday schedule — Exchange closed for MLK Day from 1998")
  (:fixed "Washington's Birthday" 2 22 :from 1954 :to 1963
   :observed :sunday-to-monday
   :authority "NYSE holiday practice 1954–1963 — Sunday → Monday; Saturday not observed")
  (:fixed "Washington's Birthday" 2 22 :from 1964 :to 1970
   :observed :nyse-rule-7-2
   :authority "NYSE Rule 7.2 weekend observance, 1964–1970")
  (:nth-weekday "Washington's Birthday" 2 :monday 3 :from 1971
   :authority "NYSE holiday schedule; Pub. L. 90-363 Monday holiday from 1971")
  (:easter "Good Friday" -2 :from 1954
   :authority "NYSE Rule 7.2 — Good Friday is an Exchange holiday")
  (:fixed "Memorial Day" 5 30 :from 1954 :to 1963
   :observed :sunday-to-monday
   :authority "NYSE holiday practice 1954–1963 — Sunday → Monday; Saturday not observed")
  (:fixed "Memorial Day" 5 30 :from 1964 :to 1969
   :observed :nearest-weekday
   :authority "NYSE holiday practice 1964–1969 — Saturday → Friday, Sunday → Monday (1970-05-30 Saturday not observed: Friday May 29 ended the month)")
  (:nth-weekday "Memorial Day" 5 :monday -1 :from 1971
   :authority "NYSE holiday schedule; Pub. L. 90-363 last Monday in May from 1971")
  (:fixed "Juneteenth National Independence Day" 6 19 :from 2022
   :observed :nyse-rule-7-2
   :authority "NYSE holiday schedule — Juneteenth from 2022 (NYSE notice 2021); Rule 7.2 observance")
  (:fixed "Independence Day" 7 4 :from 1954
   :observed :nyse-rule-7-2
   :authority "NYSE Rule 7.2")
  (:nth-weekday "Labor Day" 9 :monday 1 :from 1954
   :authority "NYSE Rule 7.2")
  (:computed "Election Day" #'%nyse-election-day :from 1954 :to 1980
   :authority "NYSE Election Day closings: annual to 1967, presidential years 1968–1980")
  (:nth-weekday "Thanksgiving Day" 11 :thursday 4 :from 1954
   :authority "NYSE Rule 7.2")
  (:fixed "Christmas Day" 12 25 :from 1954
   :observed :nyse-rule-7-2
   :authority "NYSE Rule 7.2"))

(defun load-nyse-special-closures (&optional (path (data-path "us/nyse-closures.sexp")))
  "CALENDAR-TRANSFERs (nil FROM) for every unscheduled NYSE closure day."
  (loop for block in (read-data-form path)
        nconc (loop for day in (getf block :days)
                    collect (make-calendar-transfer
                             :from nil :to day
                             :name (getf block :name)
                             :authority (getf block :authority)))))

(defvar *nyse-special-closures* nil)

(defun nyse-special-closures ()
  (or *nyse-special-closures*
      (setf *nyse-special-closures* (load-nyse-special-closures))))

(defmethod calendar-transfers ((calendar nyse-holidays-calendar))
  "Instance transfers plus the special closures from data/us/nyse-closures.sexp
(loaded on first use, so a relocated data root is honoured)."
  (append (slot-value calendar 'transfers) (nyse-special-closures)))

(defun nyse-holidays-calendar () (make-instance 'nyse-holidays-calendar))

(register-calendar "NYSE" (nyse-holidays-calendar))
