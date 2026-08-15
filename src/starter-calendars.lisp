(in-package #:cl-stack-calendars)

;;;; Starter calendars. Rules carry civil :FROM/:TO validity windows from
;;;; published statutes / central-bank calendars. Versioned as-of snapshots
;;;; (what was *known* at booking time) are a separate axis — see
;;;; VERSIONED-CALENDAR.

(define-calendar weekend-only-calendar (:register "WEEKEND")
  ;; no holiday rules — Saturday/Sunday only
  )

;;;; TARGET (ECB Trans-European Automated Real-time Gross settlement Express
;;;; Transfer) — euro settlement calendar from TARGET go-live 1999-01-04.
;;;; https://www.ecb.europa.eu/paym/target/target2/html/index.en.html
(define-calendar target-calendar (:register "TARGET")
  (:fixed "New Year's Day" 1 1 :from 1999)
  (:fixed "Labour Day" 5 1 :from 1999)
  (:fixed "Christmas Day" 12 25 :from 1999)
  (:fixed "Christmas Holiday" 12 26 :from 1999)
  (:easter "Good Friday" -2 :from 1999)
  (:easter "Easter Monday" 1 :from 1999))

;;;; US federal legal public holidays (5 U.S.C. § 6103), with Uniform Monday
;;;; Holiday Act (effective 1971-01-01) and later statute dates.
;;;; https://www.congress.gov/crs-product/R41990
(define-calendar us-federal-holidays-calendar (:register "USFED")
  (:fixed "New Year's Day" 1 1 :observed :nearest-weekday)
  ;; Pub. L. 98-144; first observance 1986-01-20
  (:nth-weekday "Martin Luther King Jr. Day" 1 :monday 3 :from 1986)
  (:fixed "Washington's Birthday" 2 22 :observed :nearest-weekday :to 1970)
  (:nth-weekday "Washington's Birthday" 2 :monday 3 :from 1971)
  (:fixed "Memorial Day" 5 30 :observed :nearest-weekday :to 1970)
  (:nth-weekday "Memorial Day" 5 :monday -1 :from 1971)
  ;; Pub. L. 117-17 signed 2021-06-17; first federal observance 2021-06-18
  ;; (Saturday Juneteenth observed Friday under nearest-weekday).
  (:fixed "Juneteenth" 6 19 :observed :nearest-weekday :from (2021 6 18))
  (:fixed "Independence Day" 7 4 :observed :nearest-weekday)
  (:nth-weekday "Labor Day" 9 :monday 1 :from 1894)
  (:nth-weekday "Columbus Day" 10 :monday 2 :from 1971)
  (:fixed "Veterans Day" 11 11 :observed :nearest-weekday :to 1970)
  (:nth-weekday "Veterans Day" 10 :monday 4 :from 1971 :to 1977)
  (:fixed "Veterans Day" 11 11 :observed :nearest-weekday :from 1978)
  (:nth-weekday "Thanksgiving Day" 11 :thursday 4 :from 1941)
  (:fixed "Christmas Day" 12 25 :observed :nearest-weekday))

;;;; England & Wales bank holidays (Banking and Financial Dealings Act 1971
;;;; and later proclamations). Early May bank holiday from 1978.
;;;; https://www.gov.uk/bank-holidays
(define-calendar uk-bank-holidays-calendar (:register "GBLO")
  (:fixed "New Year's Day" 1 1 :observed :next-weekday :from 1974)
  (:easter "Good Friday" -2)
  (:easter "Easter Monday" 1)
  (:nth-weekday "Early May Bank Holiday" 5 :monday 1 :from 1978)
  (:nth-weekday "Spring Bank Holiday" 5 :monday -1 :from 1971)
  (:nth-weekday "Summer Bank Holiday" 8 :monday -1 :from 1971)
  (:fixed "Christmas Day" 12 25 :observed :next-weekday)
  (:fixed "Boxing Day" 12 26 :observed :next-weekday))

(defun weekend-only-calendar () (make-instance 'weekend-only-calendar))
(defun target-calendar () (make-instance 'target-calendar))
(defun us-federal-holidays-calendar () (make-instance 'us-federal-holidays-calendar))
(defun uk-bank-holidays-calendar () (make-instance 'uk-bank-holidays-calendar))
