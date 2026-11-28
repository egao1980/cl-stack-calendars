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

(deftest yearly-list-decree-rows-carry-issued-and-published
  "Every block and row has :ISSUED and :PUBLISHED, or a :DATES-NOTE saying
why one is NIL (#93); every statute has :IN-FORCE or a :DATES-NOTE."
  (let ((bad '()))
    (dolist (code '("KZ" "SN" "ZA" "KE" "NG" "ZW" "ZM" "MW" "MG"))
      (dolist (row (mena-decree-rows code))
        (unless (and (getf row :uri)
                     (or (and (getf row :issued) (getf row :published)) (getf row :dates-note)))
          (push row bad))))
    (dolist (row (cl-stack-calendars::yearly-list-statute-eras))
      (unless (and (getf row :uri) (or (getf row :in-force) (getf row :dates-note)))
        (push row bad)))
    (ok (null bad) (format nil "~d rows lack dates: ~s" (length bad) (subseq bad 0 (min 3 (length bad)))))))

;;; --- Africa (#45) ------------------------------------------------------------

(defmacro define-secondary-gold-test (name code label)
  `(deftest ,name
     ,(format nil "LOWER CONFIDENCE. ~a" label)
     (let ((gold (read-data-form (data-path ,(format nil "tests/~(~a~)-secondary-holiday-gold.sexp" code)))))
       (ok (eq :secondary (getf gold :confidence)))
       (%report-holiday-gold ,(format nil "~a (secondary sources)" code)
                             (%holiday-gold-mismatches gold (constantly (find-calendar ,code)))))))

(define-mena-gold-tests "ZA" south-africa-holidays-calendar 2000)

(deftest za-issue-45-days
  (let ((za (find-calendar "ZA")))
    (flet ((holiday (y m d) (holiday-p za (make-date y m d))))
      (ok (holiday 2021 3 22) "s. 2(1): Human Rights Day on a Sunday (#45 item 5)")
      (ok (holiday 2021 12 27))
      (ok (holiday 2022 5 2))
      (ng (holiday 2005 12 27) "no further day when the Monday is Day of Goodwill")
      (ng (holiday 2033 12 27))
      (ok (holiday 2016 12 27) "Proclamation 58/2016 (s. 2A)")
      (ok (holiday 2000 12 5) "Proc. R. 72/2000, municipal elections"))))

(define-mena-gold-tests "KE" kenya-holidays-calendar 2005)

(define-secondary-gold-test ke-secondary-gold-lower-confidence "KE"
  "2000–2004, 2006, 2008, 2011 (Idd-ul-Fitr estimated) and 2026.")

(deftest ke-issue-45-days
  (let ((ke (find-calendar "KE")))
    (flet ((holiday (y m d) (holiday-p ke (make-date y m d))))
      (ok (holiday 2021 12 13) "s. 4: Jamhuri Day on a Sunday (#45 item 5)")
      (ok (holiday 2022 5 2))
      (ok (holiday 2022 12 27) "Christmas on a Sunday: Tuesday 27 December")
      (ng (holiday 2016 10 10) "Moi Day not observed 2010–2017 (#45 item 6)")
      (ok (holiday 2019 10 10))
      (ok (holiday 2024 10 10) "Mazingira Day from 2024")
      (ng (holiday 2017 9 1) "Idd-ul-Azha only when gazetted; none in 2017")
      (ok (holiday 2024 6 17)))))

(define-mena-gold-tests "NG" nigeria-holidays-calendar 2016)

(define-secondary-gold-test ng-secondary-gold-lower-confidence "NG"
  "2015 from newspapers; 2000–2014 statutory days and estimates.")

(deftest ng-issue-45-days
  (let ((ng (find-calendar "NG")))
    (flet ((holiday (y m d) (holiday-p ng (make-date y m d))))
      (ok (holiday 2018 5 29) "Democracy Day 2018 was still 29 May (#45 item 4)")
      (ng (holiday 2018 6 12))
      (ok (holiday 2019 6 12))
      (ok (holiday 2020 12 28) "declared for Boxing Day on a Saturday"))))

(define-mena-gold-tests "ZW" zimbabwe-holidays-calendar 2004)

(define-secondary-gold-test zw-secondary-gold-lower-confidence "ZW"
  "2008, 2012 (no annual list) and statute-only 2000–2003, 2007, 2011.")

(deftest zw-issue-45-days
  (let ((zw (find-calendar "ZW")))
    (flet ((holiday (y m d) (holiday-p zw (make-date y m d))))
      (ok (holiday 2024 8 12) "Heroes' Day: the second Monday of August (#45 item 2)")
      (ok (holiday 2024 8 13))
      (ng (holiday 2024 8 5))
      (ok (holiday 2021 4 19) "s. 2(1): Independence Day on a Sunday")
      (ok (holiday 2018 2 21) "Youth Day from 2018")
      (ok (holiday 2026 9 15) "Munhumutapa Day from 2026")
      (ng (holiday 2026 4 20) "a Saturday holiday is not moved"))))

(define-mena-gold-tests "ZM" zambia-holidays-calendar 2013)

(define-secondary-gold-test zm-secondary-gold-lower-confidence "ZM"
  "2026 (SI 73/2026 from news) and statute-only 2000–2012.")

(deftest zm-issue-45-days
  (let ((zm (find-calendar "ZM")))
    (flet ((holiday (y m d) (holiday-p zm (make-date y m d))))
      (ok (holiday 2021 10 25) "s. 2(2): Independence Day on a Sunday (#45 item 5)")
      (ok (holiday 2024 4 29) "Kenneth Kaunda Day on a Sunday")
      (ok (holiday 2023 10 18) "Prayer Day 2016–2025")
      (ok (holiday 2026 12 29) "29 December from 2026"))))

(define-mena-gold-tests "MW" malawi-holidays-calendar 2000)

(deftest mw-issue-45-days
  (let ((mw (find-calendar "MW")))
    (flet ((holiday (y m d) (holiday-p mw (make-date y m d))))
      (ok (holiday 2024 5 14) "Kamuzu Day 14 May (#45 item 3)")
      (ng (holiday 2024 5 20))
      (ok (holiday 2024 10 15) "Mother's Day 15 October")
      (ng (holiday 2024 10 14))
      (ok (holiday 2024 12 26) "Boxing Day"))
    (ok (eq :secondary (getf *mw-holiday-gold* :confidence)))))

(define-mena-gold-tests "MG" madagascar-holidays-calendar 2006)

(define-secondary-gold-test mg-secondary-gold-lower-confidence "MG"
  "2001, 2004, 2005, 2010 (one-off decrees only), 2023 (news), 2000–2003 (no decree).")

(deftest mg-issue-45-days
  (let ((mg (find-calendar "MG")))
    (flet ((holiday (y m d) (holiday-p mg (make-date y m d))))
      (ok (holiday 2024 5 9) "Ascension (#45 item 7)")
      (ok (holiday 2024 5 20) "Whit Monday")
      (ng (holiday 2023 5 25) "no Africa Day")
      (ok (holiday 2024 4 10) "Eid al-Fitr is on the lists from 2013")
      (ng (holiday 2012 10 26) "no Eid before 2013"))))

(deftest et-enkutatash-meskel-leap-shift
  "Enkutatash and Meskel fall on 12 and 28 September in the Gregorian year
before a leap year (Pagume 6), on datetime-protocol's Ethiopian calendar (#45
item 1). (2023-09-27 is the tabular Mawlid, so it is not checked.)"
  (let ((et (find-calendar "ET")))
    (flet ((holiday (y m d) (holiday-p et (make-date y m d))))
      (ok (holiday 2023 9 12))
      (ng (holiday 2023 9 11))
      (ok (holiday 2024 9 11))
      (ng (holiday 2024 9 12))
      (ok (holiday 2023 9 28))
      (ok (holiday 2024 9 27))
      (ok (holiday 2027 9 12))
      (ok (holiday 2027 9 28))
      (ok (holiday 2028 9 11))
      (ok (holiday 2024 1 20) "Timkat 11 Ter in a Gregorian leap year")
      (ok (holiday 2025 1 19) "Timkat 2025 (11 Ter 2017 EC)"))))
