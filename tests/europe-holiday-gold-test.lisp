(in-package #:cl-stack-calendars/tests)

;;;; European national holidays vs frozen gold, data/tests/<cc>-holiday-gold.sexp
;;;; (scripts/generate_mena_holiday_gold.py from scripts/europe/<cc>.py, which
;;;; never reads the Lisp; egao1980/cl-stack-calendars#20-#24). Same day-by-day
;;;; check as mena-holiday-gold-test.lisp: holiday and business status.

;;; --- #24: Italy, Netherlands, Germany, Ireland, Portugal, TARGET -------------

(define-mena-gold-tests "IT" italy-holidays-calendar 2000)

(deftest it-issue-24-days
  (let ((it (find-calendar "IT")))
    (flet ((holiday (y m d) (holiday-p it (make-date y m d))))
      (ng (holiday 2000 6 2) "2 June 2000 was a working day (L. 336/2000: from 2001) (#24 item 1)")
      (ok (holiday 2000 6 4) "the festa nazionale on the first Sunday of June 1977-2000 (L. 54/1977)")
      (ok (holiday 2001 6 2))
      (ok (holiday 2011 3 17) "D.L. 5/2011 (#24 item 2)")
      (ng (holiday 2012 3 17))
      (ng (holiday 2025 10 4) "San Francesco from 2026 (L. 151/2025) (#24 item 3)")
      (ok (holiday 2026 10 4))
      (ok (holiday 2027 10 4) "the first weekday case")
      (ok (business-day-p it (make-date 2024 11 4)) "4 November: no civil effects (L. 27/2024)")
      (ng (holiday 2024 3 31) "Easter Sunday is not named by L. 260/1949"))))

(define-mena-gold-tests "NL" netherlands-holidays-calendar 2000)

(deftest nl-issue-24-days
  (let ((nl (find-calendar "NL")))
    (flet ((holiday (y m d) (holiday-p nl (make-date y m d))))
      (ok (holiday 2000 4 29) "Koninginnedag on a Sunday moves to Saturday 29 April (#24)")
      (ng (holiday 2000 4 30))
      (ok (holiday 2006 4 29))
      (ng (holiday 2006 4 30))
      (ok (holiday 2013 4 30))
      (ok (holiday 2014 4 26) "Koningsdag 27 April on a Sunday: 26 April")
      (ok (holiday 2024 5 5) "5 May every year (Algemene termijnenwet art. 3(1); #25 item 4)")
      (ng (holiday 2024 3 29) "Goede Vrijdag only for time limits (art. 3(2))"))))

(define-mena-gold-tests "DE" germany-holidays-calendar 2000)

(deftest de-issue-24-days
  (let ((de (find-calendar "DE")))
    (flet ((holiday (y m d) (holiday-p de (make-date y m d))))
      (ok (holiday 2017 10 31) "Reformationstag 2017 in all 16 Länder (#24)")
      (ng (holiday 2018 10 31) "only some Länder from 2018")
      (ng (holiday 2024 12 24) "Heiliger Abend is no Feiertag")
      (ok (holiday 2024 10 3)))
    (ok (holiday-p (find-calendar "DE-BY") (make-date 2017 10 31)) "DE-BY carries the national day")))

(define-secondary-gold-test de-secondary-gold-lower-confidence "DE"
  "2017: Reformationstag in all 16 Länder; the RP, SL and SH instruments and the MV, ST and TH texts were read only on secondary pages.")

(define-mena-gold-tests "IE" ireland-holidays-calendar 2000)

(deftest ie-issue-24-days
  (let ((ie (find-calendar "IE")))
    (flet ((holiday (y m d) (holiday-p ie (make-date y m d))))
      (ok (holiday 2022 3 18) "S.I. 50/2022 (#24 item 1)")
      (ok (holiday 2001 9 14) "S.I. 419/2001 (#24 item 2)")
      (ng (holiday 2011 9 14))
      (ok (holiday 2023 2 6) "St Brigid's Day: the first Monday in February")
      (ok (holiday 2030 2 1) "... or 1 February when it is a Friday")
      (ng (holiday 2024 3 18) "no substitute for St Patrick's Day on a Sunday (#25 item 9)")
      (ng (holiday 2024 3 29) "Good Friday is no public holiday"))))

(define-mena-gold-tests "PT" portugal-holidays-calendar 2009)

(define-secondary-gold-test pt-secondary-gold-lower-confidence "PT"
  "2000-2008: the 2003 Código do Trabalho and DL 874/76 lists were not read.")

(deftest pt-issue-24-days
  (let ((pt (find-calendar "PT"))
        (corpus (country-calendar "PT")))
    (dolist (cal (list pt corpus))
      (flet ((holiday (y m d) (holiday-p cal (make-date y m d))))
        (ng (holiday 2014 6 19) "Corpo de Deus suspended 2013-2015 (Lei 23/2012) (#24)")
        (ng (holiday 2014 10 5))
        (ng (holiday 2013 11 1))
        (ng (holiday 2015 12 1))
        (ok (holiday 2016 10 5) "restored by Lei 8/2016")
        (ok (holiday 2024 3 31) "Domingo de Páscoa is named by art. 234.º")))))

(define-mena-gold-tests "TARGET" target-calendar 1999 :corpus nil)

(deftest target-issue-24-days
  (let ((target (find-calendar "TARGET")))
    (flet ((holiday (y m d) (holiday-p target (make-date y m d))))
      (ok (holiday 2001 12 31) "euro cash changeover (ECB, 25 May 2000) (#24 item 1)")
      (ok (holiday 1999 12 31) "Y2K (ECB, 31 Mar 1999)")
      (ng (holiday 2002 12 31))
      (ng (holiday 1999 4 2) "Good Friday from 2000 (#24 item 2)")
      (ng (holiday 1999 4 5))
      (ok (holiday 2000 4 21))
      (ok (business-day-p target (make-date 1999 5 3)))
      (ng (holiday 1999 12 27) "26 December from 2000"))))

;;; --- #23: Croatia, Slovenia, Slovakia, Czechia, Hungary, Poland --------------

(define-mena-gold-tests "HR" croatia-holidays-calendar 2000)

(deftest hr-issue-23-days
  (let ((hr (find-calendar "HR")))
    (flet ((holiday (y m d) (holiday-p hr (make-date y m d))))
      (ok (holiday 2000 5 30) "Dan državnosti 30 May to 2001 (NN 33/1996) (#23)")
      (ok (holiday 2001 5 30))
      (ng (holiday 2001 6 25) "25 June from 2002 (NN 96/2001)")
      (ng (holiday 2001 10 8))
      (ok (holiday 2002 10 8))
      (ng (holiday 2001 6 14) "Tijelovo from 2002")
      (ok (holiday 2002 5 30) "Tijelovo 2002")
      (ng (holiday 2002 1 6) "no Bogojavljenje 15 Nov 2001 - 15 Feb 2002 (NN 96/2001, NN 13/2002)")
      (ok (holiday 2001 1 6))
      (ok (holiday 2003 1 6))
      (ok (holiday 2020 5 30))
      (ng (holiday 2020 6 25)))))

(define-mena-gold-tests "SI" slovenia-holidays-calendar 2000)

(deftest si-issue-23-days
  (let ((si (find-calendar "SI")))
    (flet ((holiday (y m d) (holiday-p si (make-date y m d))))
      (ok (holiday 2012 1 2) "2 January to 2012 (#23 item 1)")
      (ng (holiday 2013 1 2) "not 2013-2016 (ZUJF 82. člen)")
      (ng (holiday 2016 1 2))
      (ok (holiday 2017 1 2) "restored by ZPDPD-D")
      (ok (holiday 2023 8 14) "dan solidarnosti (ZOPNN-F 15. člen) (#23 item 2)")
      (ng (holiday 2024 8 14))
      (ng (holiday 2024 9 15) "a praznik that is not a day off"))))

(define-mena-gold-tests "SK" slovakia-holidays-calendar 2000)

(deftest sk-issue-23-days
  (let ((sk (find-calendar "SK")))
    (flet ((holiday (y m d) (holiday-p sk (make-date y m d))))
      (ng (holiday 2000 11 17) "17 November from 15 Nov 2001 (442/2001) (#23 item 3)")
      (ok (holiday 2001 11 17))
      (ok (holiday 2024 11 17))
      (ng (holiday 2025 11 17) "not a day of rest from 1 Nov 2025 (261/2025) (#23 item 1)")
      (ng (holiday 2026 5 8) "§ 4b (#23 item 2)")
      (ng (holiday 2026 9 15))
      (ok (holiday 2027 5 8))
      (ok (holiday 2027 9 15))
      (ok (holiday 2018 10 30) "§ 4a (#23 item 4)")
      (ok (holiday 2023 9 1) "1 September to 2023")
      (ng (holiday 2024 9 1))
      (ng (holiday 2024 10 28) "28 October is no day of rest"))))

(define-mena-gold-tests "CZ" czechia-holidays-calendar 2000)

(deftest cz-issue-23-days
  (let ((cz (find-calendar "CZ"))
        (corpus (country-calendar "CZ")))
    (dolist (cal (list cz corpus))
      (flet ((holiday (y m d) (holiday-p cal (make-date y m d))))
        (ng (holiday 2015 4 3) "Velký pátek from 2016 (359/2015 Sb.) (#23)")
        (ng (holiday 2000 4 21))
        (ok (holiday 2016 3 25))
        (ok (holiday 2000 11 17) "245/2000 Sb. in force 9 Aug 2000")))))

(define-mena-gold-tests "HU" hungary-holidays-calendar 2000)

(deftest hu-issue-23-days
  (let ((hu (find-calendar "HU")))
    (flet ((holiday (y m d) (holiday-p hu (make-date y m d)))
           (business (y m d) (business-day-p hu (make-date y m d))))
      (ok (holiday 2026 12 24) "Szenteste from 14 Nov 2026 (2026. évi LXXII. tv.) (#23 item 1)")
      (ok (holiday 2030 12 24))
      (ng (holiday 2025 12 22))
      (ok (holiday 2025 5 2) "munkarend transfer, 11/2024. NGM (#23 item 2)")
      (ok (business 2025 5 17) "... and its working Saturday")
      (ok (holiday 2025 10 24))
      (ok (holiday 2025 12 24))
      (ok (holiday 2026 1 2))
      (ok (holiday 2026 8 21))
      (ng (business 2026 12 12) "the 2026 December pair was repealed by 4/2026. SZCSM")
      (ok (business 2009 3 28) "1/2009. SZMM moved the working Saturday to 28 March")
      (ng (business 2009 1 10))
      (ok (holiday 2012 12 31) "28/2012. NGM")
      (ng (holiday 2024 3 31) "Easter Sunday is not a munkaszüneti nap"))))

(define-mena-gold-tests "PL" poland-holidays-calendar 2000)

(deftest pl-issue-23-days
  (let ((pl (find-calendar "PL")))
    (flet ((holiday (y m d) (holiday-p pl (make-date y m d))))
      (ok (holiday 2018 11 12) "Dz.U. 2018 poz. 2117 (#23)")
      (ng (holiday 2019 11 12))
      (ok (holiday 2024 5 19) "Zielone Świątki: art. 1 pkt 1 lit. g")
      (ok (holiday 2025 12 24) "Wigilia from 2025")
      (ng (holiday 2024 12 24)))))

(deftest europe-rows-and-statutes-carry-issued-and-published
  "Every block, row and act of the European lists has :ISSUED and :PUBLISHED
(or a :DATES-NOTE) and every act :IN-FORCE (or a :DATES-NOTE) (#93)."
  (let ((bad '()))
    (dolist (code cl-stack-calendars::*europe-list-codes*)
      (dolist (row (mena-decree-rows code))
        (unless (and (getf row :uri)
                     (or (and (getf row :issued) (getf row :published)) (getf row :dates-note)))
          (push row bad))))
    (dolist (row (cl-stack-calendars::europe-statute-eras))
      (unless (and (getf row :uri) (or (getf row :in-force) (getf row :dates-note)))
        (push row bad)))
    (ok (cl-stack-calendars::europe-statute-eras))
    (ok (null bad) (format nil "~d rows lack dates: ~s" (length bad) (subseq bad 0 (min 3 (length bad)))))))
