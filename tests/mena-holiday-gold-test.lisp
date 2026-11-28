(in-package #:cl-stack-calendars/tests)

;;;; Middle East and North Africa holidays vs frozen gold,
;;;; data/tests/<cc>-holiday-gold.sexp (scripts/generate_mena_holiday_gold.py;
;;;; egao1980/cl-stack-calendars#44). Same day-by-day check as
;;;; americas-holiday-gold-test.lisp: holiday and business status of every day.

(defmacro define-mena-gold-tests (code constructor first &key (corpus t))
  "The registered calendar, the :YEAR calendars and (when the corpus has the
code) COUNTRY-CALENDAR of CODE against its gold from FIRST to 2040."
  (let ((gold (intern (format nil "*~a-HOLIDAY-GOLD*" code))))
    `(progn
       (defparameter ,gold (load-holiday-gold ,code))
       (deftest ,(intern (format nil "~a-HOLIDAY-GOLD-FIXTURE-SHAPE" code))
         (%check-holiday-gold-shape ,gold ,code :from ,first)
         (ok (getf ,gold :weekends) "weekend eras"))
       (deftest ,(intern (format nil "~a-REGISTERED-CALENDAR-MATCHES-GOLD" code))
         (let ((cal (find-calendar ,code)))
           (%report-holiday-gold ,code (%holiday-gold-mismatches ,gold (constantly cal)))))
       (deftest ,(intern (format nil "~a-YEAR-CALENDARS-MATCH-GOLD" code))
         (%report-holiday-gold ,(format nil "~a :year" code)
                               (%holiday-gold-mismatches ,gold (lambda (y) (,constructor :year y)))))
       ,@(when corpus
           `((deftest ,(intern (format nil "~a-COUNTRY-CALENDAR-MATCHES-GOLD" code))
               (let ((cal (country-calendar ,code)))
                 (ok (eq :normative (calendar-provenance cal)))
                 (%report-holiday-gold ,(format nil "country-calendar ~a" code)
                                       (%holiday-gold-mismatches ,gold (constantly cal))))))))))

;;; --- Kuwait ----------------------------------------------------------------

(define-mena-gold-tests "KW" kuwait-holidays-calendar 2020 :corpus nil)

(deftest kw-secondary-gold-2011-2019-lower-confidence
  "LOWER CONFIDENCE. 2011–2019 against timeanddate and the KUNA items found."
  (let ((gold (read-data-form (data-path "tests/kw-secondary-holiday-gold.sexp"))))
    (ok (eq :secondary (getf gold :confidence)))
    (%report-holiday-gold "KW 2011-2019 (secondary sources)"
                          (%holiday-gold-mismatches gold (constantly (find-calendar "KW"))))))

(deftest kw-issue-44-days
  (let ((kw (find-calendar "KW")))
    (flet ((holiday (y m d) (holiday-p kw (make-date y m d))))
      (ng (holiday 2024 5 1) "1 May is not in Law 6/2010 art. 68 (#44 item 6)")
      (ng (holiday 2023 5 1))
      (ok (holiday 2024 2 8) "Isra wal Mi'raj 2024 (Council of Ministers)")
      (ok (holiday 2024 6 15) "Arafah 2024")
      (ok (holiday 2024 4 12) "Eid al-Fitr: three days"))))

;;; --- Oman --------------------------------------------------------------------

(define-mena-gold-tests "OM" oman-holidays-calendar 2020 :corpus nil)

(deftest om-issue-44-days
  (let ((om (find-calendar "OM")))
    (flet ((holiday (y m d) (holiday-p om (make-date y m d))))
      (ok (holiday 2019 7 23) "Renaissance Day to 2019")
      (ng (holiday 2020 7 23) "not in RD 56/2020 (#44 item 7)")
      (ng (holiday 2022 1 11) "Accession Day from 2023 (RD 88/2022)")
      (ok (holiday 2024 1 11))
      (ok (holiday 2025 11 26) "National Day 2025 moved to 26–27 November")
      (ng (holiday 2025 11 18))
      (ok (holiday 2030 11 20) "RD 15/2025: 20–21 November")
      (ng (holiday 2030 11 18)))))

;;; --- Iraq --------------------------------------------------------------------

(define-mena-gold-tests "IQ" iraq-holidays-calendar 2019 :corpus nil)

(deftest iq-issue-44-days
  (let ((iq (find-calendar "IQ")))
    (flet ((holiday (y m d) (holiday-p iq (make-date y m d))))
      (ng (holiday 2019 10 3) "3 October from 2020 (#44 item 3)")
      (ok (holiday 2023 10 3))
      (ok (holiday 2023 7 14) "14 July under Law 110/1972")
      (ng (holiday 2024 7 14) "not in Law 12/2024")
      (ng (holiday 2023 7 6) "Eid al-Ghadir (18 Dhu al-Hijjah 1444) only from Law 12/2024")
      (ok (holiday 2024 6 25) "Eid al-Ghadir 2024")
      (ok (holiday 2025 3 16) "16 March from 2025"))))

;;; --- Iran --------------------------------------------------------------------

(define-mena-gold-tests "IR" iran-holidays-calendar 2000)

(deftest ir-issue-44-days
  (let ((ir (find-calendar "IR")))
    (flet ((holiday (y m d) (holiday-p ir (make-date y m d))))
      (ok (holiday 2024 3 20) "Nowruz 1403 = 2024-03-20 (#44 item 8)")
      (ng (holiday 2024 3 24))
      (ok (holiday 2024 3 19) "29 Esfand, Oil Nationalization Day")
      (ok (holiday 2024 4 1) "13 Farvardin")
      (ok (holiday 2024 8 25) "Arbaeen")
      (ok (holiday 2024 4 11) "second day of Eid al-Fitr, from 2011")
      (ok (holiday 2025 3 21) "Nowruz 1404 = 2025-03-21"))))

;;; --- every listed MENA calendar -------------------------------------------

;;; --- Algeria -----------------------------------------------------------------

(define-mena-gold-tests "DZ" algeria-holidays-calendar 2021)

(deftest dz-secondary-gold-lower-confidence
  "LOWER CONFIDENCE. 2009, 2011, 2012, 2016–2020 against the ICOP record of
the official month starts."
  (let ((gold (read-data-form (data-path "tests/dz-secondary-holiday-gold.sexp"))))
    (ok (eq :secondary (getf gold :confidence)))
    (%report-holiday-gold "DZ 2009-2020 (secondary sources)"
                          (%holiday-gold-mismatches gold (constantly (find-calendar "DZ"))))))

(deftest dz-issue-44-days
  (let ((dz (find-calendar "DZ")))
    (flet ((holiday (y m d) (holiday-p dz (make-date y m d))))
      (ng (holiday 2024 3 29) "Good Friday is no fête légale (#44 item 2)")
      (ng (holiday 2024 4 1) "Easter Monday: Christian staff only (Loi 63-278 art. 3)")
      (ok (holiday 2004 6 19) "19 June to 2004 (Ord. 66-153)")
      (ng (holiday 2005 6 19) "dropped by Loi 05-06")
      (ok (holiday 2024 4 12) "Aïd el-Fitr 3 days from 2024 (Loi 23-10)")
      (ok (holiday 2023 6 30) "Aïd el-Adha 3 days from 2023"))))

;;; --- Morocco -----------------------------------------------------------------

(define-mena-gold-tests "MA" morocco-holidays-calendar 2003)

(deftest ma-gold-is-lower-confidence
  "LOWER CONFIDENCE: the Habous communiqués only as the press reported them."
  (ok (eq :secondary (getf *ma-holiday-gold* :confidence)))
  (ok (eq :secondary (mena-confidence "MA" 2024))))

(deftest ma-issue-44-days
  (let ((ma (find-calendar "MA")))
    (flet ((holiday (y m d) (holiday-p ma (make-date y m d))))
      (ok (holiday 2024 1 14) "Nouvel an amazigh from 2024 (#44 item 5)")
      (ng (holiday 2023 1 14))
      (ok (holiday 2026 10 31) "Fête de l'Unité from 2026")
      (ng (holiday 2025 10 31)))))

;;; --- Egypt -------------------------------------------------------------------

(define-mena-gold-tests "EG" egypt-holidays-calendar 2017)

(deftest eg-secondary-gold-2014-2016-lower-confidence
  "LOWER CONFIDENCE. 2014–2016 against youm7 reports of the Cabinet decisions."
  (let ((gold (read-data-form (data-path "tests/eg-secondary-holiday-gold.sexp"))))
    (ok (eq :secondary (getf gold :confidence)))
    (%report-holiday-gold "EG 2014-2016 (secondary sources)"
                          (%holiday-gold-mismatches gold (constantly (find-calendar "EG"))))))

(deftest eg-issue-44-days
  (let ((eg (find-calendar "EG")))
    (flet ((holiday (y m d) (holiday-p eg (make-date y m d))))
      (ok (holiday 2024 5 6) "Sham el-Nessim 2024 (#44 item 4)")
      (ok (holiday 2030 4 29) "Sham el-Nessim: the Monday after Orthodox Easter 2030-04-28")
      (ng (holiday 2024 5 1) "1 May 2024 moved to Sunday 5 May")
      (ok (holiday 2024 5 5))
      (ok (holiday 2024 6 15) "Arafah 2024")
      (ok (holiday 2024 6 19) "Eid al-Adha block 2024 to 20 June")
      (ok (holiday 2024 6 20)))))

(deftest mena-confidence-and-provisional-years
  (dolist (code '("KW" "OM" "IQ" "IR" "DZ" "EG"))
    (ng (mena-provisional-year-p code 2026) code)
    (ok (mena-provisional-year-p code 2027) code)
    (ok (eq :primary (mena-confidence code 2024)) code)
    (ok (eq :provisional (mena-confidence code 2030)) code))
  (ok (eq :secondary (mena-confidence "KW" 2015)))
  (ok (eq :estimated (mena-confidence "KW" 2005)))
  (ok (eq :estimated (mena-confidence "DZ" 2010))))

(deftest mena-decree-rows-carry-issued-and-published
  "Every block and row has :ISSUED and :PUBLISHED, or a :DATES-NOTE saying
why one is NIL (#93); every statute era has :IN-FORCE or a :DATES-NOTE."
  (let ((bad '()))
    (dolist (code '("KW" "OM" "IQ" "IR" "DZ" "MA" "EG"))
      (dolist (row (mena-decree-rows code))
        (unless (and (getf row :uri)
                     (or (and (getf row :issued) (getf row :published)) (getf row :dates-note)))
          (push row bad))))
    (dolist (row *mena-statute-eras*)
      (unless (or (getf row :in-force) (getf row :dates-note))
        (push row bad)))
    (ok (null bad) (format nil "~d rows lack dates: ~s" (length bad) (subseq bad 0 (min 3 (length bad)))))))
