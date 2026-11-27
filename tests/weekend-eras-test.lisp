(in-package #:cl-stack-calendars/tests)

;;;; Era-aware weekends and the country-calendar cache (#31, #44).

(deftest country-calendar-cache-honours-weekend-days
  (calendar-weekend-days (country-calendar "AE"))
  (ok (equal '(5 6) (calendar-weekend-days (country-calendar "AE" :weekend-days '(5 6)))))
  (ok (weekend-day-p (country-calendar "AE" :weekend-days '(5 6)) (make-date 2024 4 19)))
  (ok (equal '(6 7) (calendar-weekend-days (country-calendar "AE")))))

(deftest weekend-era-saudi-arabia
  "Royal Order of 2013-06-23: Thu–Fri → Fri–Sat from 2013-06-29."
  (dolist (sa (list (find-calendar "SA") (country-calendar "SA")))
    (ok (weekend-day-p sa (make-date 2012 6 7)) "2012 Thursday")
    (ok (business-day-p sa (make-date 2012 6 9)) "2012 Saturday")
    (ok (weekend-day-p sa (make-date 2013 6 27)) "last Thu–Fri weekend")
    (ok (weekend-day-p sa (make-date 2013 6 29)) "first Saturday off")
    (ng (business-day-p sa (make-date 2024 4 19)) "2024 Friday")
    (ok (business-day-p sa (make-date 2024 4 18)) "2024 Thursday")
    (ok (equal '(5 6) (calendar-weekend-days sa)))
    (ok (equal '(4 5) (weekend-days-on sa (make-date 2010 1 1))))))

(deftest weekend-era-uae
  "Thu–Fri; Fri–Sat from 2006-09-01; Sat–Sun from 2022-01-01 (WAM, 2021-12-07)."
  (let ((ae (find-calendar "AE")))
    (ok (weekend-day-p ae (make-date 2005 6 2)) "2005 Thursday")
    (ok (weekend-day-p ae (make-date 2021 12 31)) "2021 Friday")
    (ok (business-day-p ae (make-date 2021 12 26)) "2021 Sunday")
    (ok (business-day-p ae (make-date 2022 1 7)) "2022 Friday")
    (ok (weekend-day-p ae (make-date 2022 1 9)) "2022 Sunday")))

(deftest weekend-current-for-mena-and-south-asia
  "Weekend on 2024-06-03 (week of Mon 3 June 2024) for the #44 starters, and
for the corpus calendar where the corpus has the code."
  (let ((corpus-codes (country-calendar-codes)))
    (dolist (row '(("SA" (5 6)) ("AE" (6 7)) ("EG" (5 6)) ("IQ" (5 6)) ("BD" (5 6))
                   ("DZ" (5 6)) ("YE" (5 6)) ("SY" (5 6)) ("SD" (5 6)) ("KW" (5 6))
                   ("OM" (5 6)) ("JO" (5 6)) ("LY" (5 6)) ("IL" (5 6)) ("IR" (5))
                   ("AF" (5)) ("NP" (6)) ("BH" (5 6)) ("QA" (5 6))))
      (destructuring-bind (code days) row
        (ok (equal days (weekend-days-at (country-weekend-days code) (make-date 2024 6 3)))
            (format nil "~a table weekend ~s" code days))
        (let ((starter (find-calendar code :errorp nil)))
          (when starter
            (ok (equal days (weekend-days-on starter (make-date 2024 6 3)))
                (format nil "~a starter weekend ~s" code days))))
        (when (member code corpus-codes :test #'string=)
          (ok (equal days (weekend-days-on (country-calendar code) (make-date 2024 6 3)))
              (format nil "~a corpus weekend ~s" code days)))))))

(deftest weekend-eras-are-cited
  (dolist (code (weekend-era-codes))
    (ok (stringp (weekend-era-source code)) (format nil "~a has a source" code))))

(define-calendar probe-weekend-era-substitute ()
  (:fixed "H" 6 29 :observed :next-weekday :authority "x"))

(deftest weekend-era-drives-observance
  "A rule calendar with eras moves a weekend holiday by the weekend of its own year."
  (let ((cal (make-instance 'probe-weekend-era-substitute
                            :weekend-days '((nil 4 5) ((2013 6 29) 5 6)))))
    ;; 2012-06-29 is a Friday (weekend Thu–Fri) → Saturday 30 June.
    (ok (holiday-p cal (make-date 2012 6 30)))
    ;; 2013-06-29 is a Saturday (weekend Fri–Sat) → Sunday 30 June.
    (ok (holiday-p cal (make-date 2013 6 30)))
    ;; 2018-06-29 is a Friday (weekend Fri–Sat) → Sunday 1 July.
    (ok (holiday-p cal (make-date 2018 7 1)))
    (ng (holiday-p cal (make-date 2018 6 30)))))
