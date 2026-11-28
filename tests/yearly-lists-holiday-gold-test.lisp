(in-package #:cl-stack-calendars/tests)

;;;; Calendars with yearly lists outside the MENA file: Kazakhstan and Senegal
;;;; (egao1980/cl-stack-calendars#43) vs frozen gold,
;;;; data/tests/<cc>-holiday-gold.sexp (scripts/generate_mena_holiday_gold.py,
;;;; transcriptions in scripts/asia/kz.py and scripts/africa/sn.py). Same
;;;; day-by-day check as mena-holiday-gold-test.lisp.

;;; --- Kazakhstan --------------------------------------------------------------

(define-mena-gold-tests "KZ" kazakhstan-holidays-calendar 2000)

(deftest kz-secondary-gold-2006-2018-lower-confidence
  "LOWER CONFIDENCE. 2006–2018: the Kurban ait dates from secondary sources;
the statutory days and transfer decrees are primary."
  (let ((gold (read-data-form (data-path "tests/kz-secondary-holiday-gold.sexp"))))
    (ok (eq :secondary (getf gold :confidence)))
    (%report-holiday-gold "KZ 2006-2018 (secondary sources)"
                          (%holiday-gold-mismatches gold (constantly (find-calendar "KZ"))))))

(deftest kz-issue-43-days
  (let ((kz (find-calendar "KZ")))
    (flet ((holiday (y m d) (holiday-p kz (make-date y m d))))
      (ng (holiday 2024 4 10) "Ораза айт is no holiday (#43 item 4)")
      (ng (holiday 2023 4 21))
      (ok (holiday 2024 6 16) "Kurban ait, first day only (law 109 of 2005)")
      (ng (holiday 2024 6 17))
      (ng (holiday 2005 1 7) "7 January from 2006")
      (ok (holiday 2006 1 7))
      (ok (holiday 2006 12 31) "the second Kurban ait of 2006")
      (ok (holiday 2008 10 27) "Republic Day 1995–2008: Sat 25 Oct 2008 carried to Monday (art. 5)")
      (ng (holiday 2015 10 26) "no Republic Day 2009–2021 (law 152-IV)")
      (ok (holiday 2022 10 25) "Republic Day again from 2022 (law 143-VII)")
      (ok (holiday 2012 12 3) "1 December 2012 (Saturday), carried to Monday")
      (ng (holiday 2022 12 1) "no Day of the First President from 2022")
      (ng (holiday 2012 5 7) "Defender of the Fatherland Day from 2013")
      (ok (holiday 2013 5 7))
      (ok (holiday 2021 12 17) "the second Independence Day to 2021")
      (ok (holiday 2023 12 18) "Sat 16 Dec 2023 carried to Monday ...")
      (ng (holiday 2023 12 19) "... and no second day: 16 December is one day from 2022")
      (ng (holiday 2008 3 21) "Nauryz 21–23 March from 2010")
      (ok (holiday 2010 3 23))
      (ok (holiday 2008 7 7) "6 July from 2008 (Sunday), carried to Monday")
      (ng (holiday 2026 8 31) "no Constitution Day in 2026 (law 306-VIII)")
      (ok (holiday 2027 3 15) "Constitution Day 15 March from 2027"))))

;;; --- Senegal -----------------------------------------------------------------

(define-mena-gold-tests "SN" senegal-holidays-calendar 2025)

(deftest sn-secondary-gold-2000-2024-lower-confidence
  "LOWER CONFIDENCE. 2000–2024: the Magal dates from national press,
Wikipedia or timeanddate."
  (let ((gold (read-data-form (data-path "tests/sn-secondary-holiday-gold.sexp"))))
    (ok (eq :secondary (getf gold :confidence)))
    (%report-holiday-gold "SN 2000-2024 (secondary sources)"
                          (%holiday-gold-mismatches gold (constantly (find-calendar "SN"))))))

(deftest sn-issue-43-days
  (let ((sn (find-calendar "SN")))
    (flet ((holiday (y m d) (holiday-p sn (make-date y m d))))
      (ok (holiday 2024 8 23) "Grand Magal de Touba 2024 = 18 Safar 1446 (#43 item 3)")
      (ng (holiday 2024 9 22) "not 18 Rabi' I")
      (ok (holiday 2025 8 13))
      (ok (holiday 2026 8 2) "Magal on a Sunday 2026 ...")
      (ng (holiday 2026 8 3) "... and no Monday: the Sunday rule is for Korité and Tabaski only")
      (ok (holiday 2018 10 29) "décret 2018-1942")
      (ok (holiday 2022 12 26) "Conseil des ministres of 22 Dec 2022")
      (ng (holiday 2010 2 2) "no Magal holiday before loi 2013-06 (tabular 18 Safar 1431)")
      (ng (holiday 2010 2 3)))
    (ok (eq :primary (mena-confidence "SN" 2025)))
    (ok (eq :secondary (mena-confidence "SN" 2024)))
    (ok (eq :provisional (mena-confidence "SN" 2027)))))

(deftest sn-kz-decree-rows-carry-issued-and-published
  "Every block and row has :ISSUED and :PUBLISHED, or a :DATES-NOTE saying
why one is NIL (#93)."
  (let ((bad '()))
    (dolist (code '("KZ" "SN"))
      (dolist (row (mena-decree-rows code))
        (unless (and (getf row :uri)
                     (or (and (getf row :issued) (getf row :published)) (getf row :dates-note)))
          (push row bad))))
    (dolist (row cl-stack-calendars::*yearly-list-statute-eras*)
      (unless (or (getf row :in-force) (getf row :dates-note))
        (push row bad)))
    (ok (null bad) (format nil "~d rows lack dates: ~s" (length bad) (subseq bad 0 (min 3 (length bad)))))))
