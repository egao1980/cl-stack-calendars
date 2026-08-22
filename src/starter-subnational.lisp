(in-package #:cl-stack-calendars)

;;;; Subnational public-holiday calendars — composite with national base.

(define-calendar california-state-holidays-calendar ()
  (:fixed "César Chávez Day" 3 31 :from 2000
   :authority "California Gov. Code § 6701")
  (:computed "Day after Thanksgiving"
   (lambda (y) (+ (nth-weekday-of-month y 11 5 4) 1))
   :from 2000
   :authority "California — day after Thanksgiving (state holiday)"))

(define-calendar bavaria-state-holidays-calendar ()
  (:fixed "Heilige Drei Könige" 1 6 :from 1900
   :authority "Bayern — gesetzlicher Feiertag (Art. 1 Abs. 1 FTG)")
  (:easter "Fronleichnam" 60 :from 1900
   :authority "Bayern — gesetzlicher Feiertag")
  (:fixed "Mariä Himmelfahrt" 8 15 :from 1900
   :authority "Bayern — gesetzlicher Feiertag")
  (:fixed "Allerheiligen" 11 1 :from 1900
   :authority "Bayern — gesetzlicher Feiertag"))

(define-calendar catalonia-regional-holidays-calendar ()
  (:fixed "Dia de Sant Jordi" 4 23 :from 1900
   :authority "Catalunya — festiu (Llei 5/1991)")
  (:fixed "Festa Nacional de Catalunya" 9 11 :from 1900
   :authority "Catalunya — festiu nacional")
  (:fixed "Dia de la Mercè" 9 24 :from 1900
   :authority "Barcelona — festiu local (La Mercè)"))

(defun %register-subnational-composite (code national state &optional name)
  (register-calendar code
                     (make-composite-calendar (list national state)
                                              :name (or name code)
                                              :mode :union)))

(defun register-subnational-calendars ()
  "Register US-CA, DE-BY, ES-CT composite calendars."
  (%register-subnational-composite
   "US-CA"
   (us-federal-holidays-calendar)
   (make-instance 'california-state-holidays-calendar)
   "United States — California")
  (%register-subnational-composite
   "DE-BY"
   (germany-holidays-calendar)
   (make-instance 'bavaria-state-holidays-calendar)
   "Germany — Bavaria")
  (%register-subnational-composite
   "ES-CT"
   (spain-holidays-calendar)
   (make-instance 'catalonia-regional-holidays-calendar)
   "Spain — Catalonia"))

(register-subnational-calendars)
