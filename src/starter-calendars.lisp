(in-package #:cl-stack-calendars)

;;;; Starter calendars. Rules approximate published schedules; exchange-data
;;;; maintenance pipelines are a follow-up.

(define-calendar weekend-only-calendar (:register "WEEKEND")
  ;; no holiday rules — Saturday/Sunday only
  )

(define-calendar target-calendar (:register "TARGET")
  (:fixed "New Year's Day" 1 1)
  (:fixed "Labour Day" 5 1)
  (:fixed "Christmas Day" 12 25)
  (:fixed "Christmas Holiday" 12 26)
  (:easter "Good Friday" -2)
  (:easter "Easter Monday" 1))

(define-calendar us-federal-holidays-calendar (:register "USFED")
  (:fixed "New Year's Day" 1 1 :observed :nearest-weekday)
  (:nth-weekday "Martin Luther King Jr. Day" 1 :monday 3)
  (:nth-weekday "Washington's Birthday" 2 :monday 3)
  (:nth-weekday "Memorial Day" 5 :monday -1)
  (:fixed "Juneteenth" 6 19 :observed :nearest-weekday :from 2021)
  (:fixed "Independence Day" 7 4 :observed :nearest-weekday)
  (:nth-weekday "Labor Day" 9 :monday 1)
  (:nth-weekday "Columbus Day" 10 :monday 2)
  (:fixed "Veterans Day" 11 11 :observed :nearest-weekday)
  (:nth-weekday "Thanksgiving Day" 11 :thursday 4)
  (:fixed "Christmas Day" 12 25 :observed :nearest-weekday))

(define-calendar uk-bank-holidays-calendar (:register "GBLO")
  (:fixed "New Year's Day" 1 1 :observed :next-weekday)
  (:easter "Good Friday" -2)
  (:easter "Easter Monday" 1)
  (:nth-weekday "Early May Bank Holiday" 5 :monday 1)
  (:nth-weekday "Spring Bank Holiday" 5 :monday -1)
  (:nth-weekday "Summer Bank Holiday" 8 :monday -1)
  (:fixed "Christmas Day" 12 25 :observed :next-weekday)
  (:fixed "Boxing Day" 12 26 :observed :next-weekday))

(defun weekend-only-calendar () (make-instance 'weekend-only-calendar))
(defun target-calendar () (make-instance 'target-calendar))
(defun us-federal-holidays-calendar () (make-instance 'us-federal-holidays-calendar))
(defun uk-bank-holidays-calendar () (make-instance 'uk-bank-holidays-calendar))
