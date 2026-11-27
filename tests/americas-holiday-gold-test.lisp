(in-package #:cl-stack-calendars/tests)

;;;; Americas national holidays vs frozen gold, data/tests/<cc>-holiday-gold.sexp
;;;; (scripts/generate_americas_holiday_gold.py; egao1980/cl-stack-calendars#15-#19).
;;;; Every day of the gold range is checked: a gold day is a holiday, any other
;;;; day is not, and a weekday that is no holiday is a business day.

(defun load-holiday-gold (code)
  (read-data-form (data-path (format nil "tests/~(~a~)-holiday-gold.sexp" code))))

(defun %holiday-gold-days (gold)
  "Hash ISO date string → name of every holiday in GOLD."
  (let ((table (make-hash-table :test #'equal)))
    (dolist (row (getf gold :days) table)
      (destructuring-bind (y m d name) row
        (setf (gethash (format nil "~4,'0d-~2,'0d-~2,'0d" y m d) table) name)))))

(defun %holiday-gold-mismatches (gold calendar-for-year &key (from (getf gold :from))
                                                             (to (getf gold :to)))
  "Every (ISO KIND GOLD OURS) where the calendar disagrees with GOLD in
FROM..TO. CALENDAR-FOR-YEAR maps a year to the calendar to ask."
  (let ((days (%holiday-gold-days gold))
        (bad '()))
    (loop for year from from to to
          for cal = (funcall calendar-for-year year)
          do (loop for date = (make-date year 1 1) then (+ date 1)
                   while (= (date-year date) year)
                   do (let* ((gold-holiday (and (gethash (suite-date-iso date) days) t))
                             (gold-business (and (not gold-holiday)
                                                 (<= (date-day-of-week date) 5)))
                             (holiday (and (holiday-p cal date) t))
                             (business (and (business-day-p cal date) t)))
                        (unless (eq gold-holiday holiday)
                          (push (list (suite-date-iso date) :holiday gold-holiday holiday) bad))
                        (unless (eq gold-business business)
                          (push (list (suite-date-iso date) :business gold-business business)
                                bad)))))
    (nreverse bad)))

(defun %report-holiday-gold (label bad)
  (loop for row in bad
        for i from 0 below 25
        do (ok nil (format nil "~a ~{~a ~a gold ~a ours ~a~}" label row)))
  (ok (null bad) (format nil "~a: ~d disagreements with the gold" label (length bad))))

(defun %check-holiday-gold-shape (gold code)
  (ok (string= code (getf gold :country)))
  (ok (= 2000 (getf gold :from)))
  (ok (= 2040 (getf gold :to)))
  (ok (getf gold :sources))
  (ok (every (lambda (s) (getf s :uri)) (getf gold :sources))))

;;; --- Colombia (#15) --------------------------------------------------------

(defparameter *co-holiday-gold* (load-holiday-gold "CO"))

(deftest co-holiday-gold-fixture-shape
  (%check-holiday-gold-shape *co-holiday-gold* "CO"))

(deftest co-registered-calendar-matches-gold
  "find-calendar \"CO\" agrees with Ley 51/1983 + Ley 2578/2026 on every day 2000–2040."
  (let ((co (find-calendar "CO")))
    (%report-holiday-gold "CO" (%holiday-gold-mismatches *co-holiday-gold* (constantly co)))))

(deftest co-year-calendars-match-gold
  (%report-holiday-gold "CO :year"
                        (%holiday-gold-mismatches *co-holiday-gold*
                                                  (lambda (y) (colombia-holidays-calendar :year y)))))

(deftest co-country-calendar-matches-gold
  "country-calendar \"CO\" defers to the starter: the corpus lists Easter Sunday."
  (let ((co (country-calendar "CO")))
    (ok (eq :normative (calendar-provenance co)))
    (%report-holiday-gold "country-calendar CO"
                          (%holiday-gold-mismatches *co-holiday-gold* (constantly co)))))

(deftest co-ley-emiliani-moves
  "Ley 51/1983 art. 1 inciso 2: which festivos move to Monday and which stay (#15 items 1–3)."
  (let ((co (find-calendar "CO")))
    (flet ((holiday (y m d) (holiday-p co (make-date y m d))))
      ;; Ascensión, Corpus Christi, Sagrado Corazón: Easter +43 / +64 / +71.
      (ok (holiday 2025 6 2))
      (ok (holiday 2025 6 23))
      (ok (holiday 2025 6 30))
      (ng (holiday 2025 5 29))
      (ng (holiday 2025 6 19))
      (ng (holiday 2025 6 27))
      ;; 8 December is fixed.
      (ok (holiday 2024 12 8))
      (ng (holiday 2024 12 9))
      (ok (holiday 2026 12 8))
      (ng (holiday 2026 12 14))
      ;; 11 November moves.
      (ok (holiday 2025 11 17))
      (ng (holiday 2025 11 11))
      (ok (holiday 2026 11 16))
      ;; 20 July and 7 August are fixed.
      (ok (holiday 2025 7 20))
      (ng (holiday 2025 7 21)))))

(deftest co-chiquinquira-from-2026
  "Ley 2578 de 2026 art. 6: 9 July, moved under Ley 51/1983 (#15 item 5)."
  (let ((co (find-calendar "CO")))
    (ok (holiday-p co (make-date 2026 7 13)))
    (ng (holiday-p co (make-date 2026 7 9)))
    (ok (holiday-p co (make-date 2027 7 12)))
    (ng (holiday-p co (make-date 2025 7 14)))
    (ng (holiday-p co (make-date 2025 7 9)))))

;;; --- Chile (#16) -----------------------------------------------------------

(defparameter *cl-holiday-gold* (load-holiday-gold "CL"))

(deftest cl-holiday-gold-fixture-shape
  (%check-holiday-gold-shape *cl-holiday-gold* "CL"))

(deftest cl-registered-calendar-matches-gold
  "find-calendar \"CL\" agrees with the BCN statute texts on every day 2000–2040."
  (let ((cl (find-calendar "CL")))
    (%report-holiday-gold "CL" (%holiday-gold-mismatches *cl-holiday-gold* (constantly cl)))))

(deftest cl-year-calendars-match-gold
  (%report-holiday-gold "CL :year"
                        (%holiday-gold-mismatches *cl-holiday-gold*
                                                  (lambda (y) (chile-holidays-calendar :year y)))))

(deftest cl-statute-calendar-matches-gold-outside-one-off-laws
  "Every recurring CL holiday is a rule: the bare starter (no data file) misses
only the one-off laws of data/cl/transfers.sexp."
  (let ((bare (make-instance 'chile-holidays-calendar))
        (one-off '("2002-04-24" "2004-09-17" "2010-09-17" "2010-09-20" "2017-04-19" "2022-09-16")))
    (ok (equal one-off
               (mapcar #'first
                       (remove-if-not (lambda (row) (eq (second row) :holiday))
                                      (%holiday-gold-mismatches *cl-holiday-gold* (constantly bare))))))))

(deftest cl-country-calendar-matches-gold
  "country-calendar \"CL\" defers to the starter: the corpus has Virgen del
Carmen before 2007, 31 Oct before 2008 and no Ley 19.668 moves."
  (let ((cl (country-calendar "CL")))
    (ok (eq :normative (calendar-provenance cl)))
    (%report-holiday-gold "country-calendar CL"
                          (%holiday-gold-mismatches *cl-holiday-gold* (constantly cl)))))

(deftest-parametrize cl-statutory-days
    ((y m d holiday) :rows
     '(;; Sábado Santo (Ley 2.977 art. 1 n.º 3).
       (2025 4 19 t) (2026 4 4 t)
       ;; Corpus Christi until 2006 (Ley 19.668, Ley 20.148), Virgen del Carmen from 2007.
       (2000 6 19 t) (2006 6 12 t) (2006 7 16 nil) (2007 7 16 t) (2007 6 4 nil)
       ;; Ley 19.668: Tue/Wed/Thu → Monday of that week, Fri → next Monday, Sat/Sun stay.
       (2000 6 26 t) (2000 6 29 nil) (2000 10 9 t) (2005 6 27 t) (2005 7 4 nil)
       (2005 10 10 t) (2008 6 29 t) (2008 6 30 nil) (2025 6 29 t) (2025 6 30 nil)
       (2025 10 12 t) (2025 10 13 nil)
       ;; Ley 20.299 art. 2: Tue → previous Friday, Wed → next Friday.
       (2017 10 27 t) (2017 10 31 nil) (2018 11 2 t) (2018 10 31 nil) (2007 10 31 nil)
       ;; Ley 21.357: winter solstice in continental Chile; 2021 is 21 June.
       (2021 6 21 t) (2024 6 20 t) (2024 6 21 nil) (2025 6 20 t) (2026 6 21 t)
       (2028 6 20 t) (2032 6 20 t) (2020 6 21 nil)
       ;; Ley 20.215 and Ley 20.983 Fiestas Patrias days.
       (2007 9 17 t) (2012 9 17 t) (2013 9 20 t) (2021 9 17 t) (2027 9 17 t) (2030 9 20 t)
       (2025 9 17 nil) (2026 9 17 nil) (2016 9 16 nil)
       ;; Ley 20.983: 2 January after a Sunday New Year, from 2017.
       (2017 1 2 t) (2023 1 2 t) (2034 1 2 t) (2040 1 2 t) (2012 1 2 nil)
       ;; One-off laws.
       (2002 4 24 t) (2004 9 17 t) (2010 9 17 t) (2010 9 20 t) (2017 4 19 t) (2022 9 16 t)
       ;; Día de la Unidad Nacional 2000–2001 (Ley 19.588, repealed by Ley 19.793).
       (2000 9 4 t) (2001 9 3 t) (2002 9 2 nil)
       ;; 31 December is a bank holiday only.
       (2024 12 31 nil) (2025 12 31 nil) (2026 12 31 nil)))
  (let ((date (make-date y m d)))
    (ok (eq holiday (and (holiday-p (find-calendar "CL") date) t))
        (format nil "CL ~d-~2,'0d-~2,'0d ~:[no holiday~;holiday~]" y m d holiday))))

;;; --- Canada, federal (#17) ---------------------------------------------------

(defparameter *ca-holiday-gold* (load-holiday-gold "CA"))

(deftest ca-holiday-gold-fixture-shape
  (%check-holiday-gold-shape *ca-holiday-gold* "CA"))

(deftest ca-registered-calendar-matches-gold
  "find-calendar \"CA\" is the Canada Labour Code general holidays on every day 2000–2040."
  (let ((ca (find-calendar "CA")))
    (%report-holiday-gold "CA" (%holiday-gold-mismatches *ca-holiday-gold* (constantly ca)))))

(deftest-parametrize ca-federal-days
    ((y m d holiday) :rows
     '(;; Victoria Day: the first Monday immediately preceding 25 May (Holidays Act s. 4).
       (2025 5 19 t) (2025 5 26 nil) (2026 5 18 t) (2026 5 25 nil) (2020 5 18 t) (2021 5 24 t)
       ;; Canada Day: 2 July when 1 July is a Sunday (Holidays Act s. 2).
       (2018 7 2 t) (2018 7 1 nil) (2029 7 2 t) (2025 7 1 t) (2025 7 2 nil)
       ;; National Day for Truth and Reconciliation from 2021 (S.C. 2021, c. 11).
       (2021 9 30 t) (2025 9 30 t) (2020 9 30 nil)
       ;; Remembrance Day, Boxing Day, Thanksgiving.
       (2025 11 11 t) (2025 12 26 t) (2025 10 13 t)
       ;; Not federal general holidays: Easter Monday, Civic Holiday, Family Day.
       (2025 4 21 nil) (2025 8 4 nil) (2025 2 17 nil)
       ;; CLC s. 193(2) gives the working day before or after: no fixed substitute day.
       (2022 1 3 nil) (2021 12 27 nil)))
  (ok (eq holiday (and (holiday-p (find-calendar "CA") (make-date y m d)) t))
      (format nil "CA ~d-~2,'0d-~2,'0d ~:[no holiday~;holiday~]" y m d holiday)))

;;; --- Australia, national (#17) -----------------------------------------------

(defparameter *au-holiday-gold* (load-holiday-gold "AU"))

(deftest au-holiday-gold-fixture-shape
  (%check-holiday-gold-shape *au-holiday-gold* "AU"))

(deftest au-registered-calendar-matches-gold
  "find-calendar \"AU\" is the national subset (Fair Work Act s. 115, every State and Territory) on every day 2000–2040."
  (let ((au (find-calendar "AU")))
    (%report-holiday-gold "AU" (%holiday-gold-mismatches *au-holiday-gold* (constantly au)))))

(deftest-parametrize au-national-days
    ((y m d holiday) :rows
     '(;; No fixed 3 June and no June Monday: the King's Birthday is a state day.
       (2025 6 3 nil) (2025 6 9 nil) (2024 6 3 nil) (2024 6 10 nil)
       ;; Substitute days every jurisdiction gives.
       (2025 1 27 t) (2019 1 28 t) (2022 1 3 t) (2017 1 2 t)
       (2021 12 27 t) (2021 12 28 t) (2022 12 26 t) (2022 12 27 t) (2020 12 28 t)
       ;; The weekend day itself stays a holiday.
       (2022 12 25 t) (2025 1 26 t)
       ;; Anzac Day has no national substitute.
       (2021 4 26 nil) (2026 4 27 nil)
       ;; National Day of Mourning for Queen Elizabeth II.
       (2022 9 22 t)))
  (ok (eq holiday (and (holiday-p (find-calendar "AU") (make-date y m d)) t))
      (format nil "AU ~d-~2,'0d-~2,'0d ~:[no holiday~;holiday~]" y m d holiday)))

;;; --- Mexico (#19) ------------------------------------------------------------

(defparameter *mx-holiday-gold* (load-holiday-gold "MX"))

(deftest mx-holiday-gold-fixture-shape
  (%check-holiday-gold-shape *mx-holiday-gold* "MX"))

(deftest mx-registered-calendar-matches-gold
  "find-calendar \"MX\" is the LFT art. 74 días de descanso obligatorio on every day 2000–2040."
  (let ((mx (find-calendar "MX")))
    (%report-holiday-gold "MX" (%holiday-gold-mismatches *mx-holiday-gold* (constantly mx)))))

(deftest-parametrize mx-lft-days
    ((y m d holiday) :rows
     '(;; Transmisión del Poder Ejecutivo Federal: 1 Dec to 2018, 1 Oct from 2024
       ;; (LFT art. 74 fr. VII, reformada DOF 30-09-2024).
       (2000 12 1 t) (2006 12 1 t) (2012 12 1 t) (2018 12 1 t)
       (2024 10 1 t) (2030 10 1 t) (2036 10 1 t)
       (2024 12 2 nil) (2030 12 2 nil) (2019 12 2 nil) (2025 10 1 nil)
       ;; DOF 17-01-2006: Monday moves from 2006, but fr. III only from 2007
       ;; (transitorio segundo, Juárez bicentennial): 2006-03-21 stays.
       (2005 2 5 t) (2006 2 6 t) (2006 2 5 nil) (2006 3 21 t) (2006 3 20 nil)
       (2007 3 19 t) (2007 3 21 nil) (2006 11 20 t) (2007 11 19 t) (2007 11 20 nil)
       ;; Bank-only days are not LFT days.
       (2025 4 17 nil) (2025 4 18 nil) (2025 11 2 nil) (2025 12 12 nil)))
  (ok (eq holiday (and (holiday-p (find-calendar "MX") (make-date y m d)) t))
      (format nil "MX ~d-~2,'0d-~2,'0d ~:[no holiday~;holiday~]" y m d holiday)))

(deftest mx-corpus-inauguration-day
  "The corpus country-calendar \"MX\" has the 1 October inauguration day from 2024."
  (let ((mx (country-calendar "MX")))
    (dolist (y '(2024 2030 2036))
      (ok (holiday-p mx (make-date y 10 1)) (format nil "corpus MX ~d-10-01" y))
      (ng (holiday-p mx (make-date y 12 1)) (format nil "corpus MX ~d-12-01" y)))
    (ok (holiday-p mx (make-date 2018 12 1)))))

;;; --- Peru (#19) --------------------------------------------------------------

(defparameter *pe-holiday-gold* (load-holiday-gold "PE"))

(deftest pe-holiday-gold-fixture-shape
  (%check-holiday-gold-shape *pe-holiday-gold* "PE"))

(deftest pe-registered-calendar-matches-gold
  "find-calendar \"PE\" is the DL 713 art. 6 feriados plus Leyes 31381, 31530, 31822 and 31788 on every day 2000–2040."
  (let ((pe (find-calendar "PE")))
    (%report-holiday-gold "PE" (%holiday-gold-mismatches *pe-holiday-gold* (constantly pe)))))

(deftest pe-country-calendar-matches-gold
  "country-calendar \"PE\" defers to the starter: the corpus lists Easter Sunday."
  (let ((pe (country-calendar "PE")))
    (ok (eq :normative (calendar-provenance pe)))
    (%report-holiday-gold "country-calendar PE"
                          (%holiday-gold-mismatches *pe-holiday-gold* (constantly pe)))))

(deftest-parametrize pe-feriados
    ((y m d holiday) :rows
     '(;; Ley 31381: 9 December from 2022; Ley 31530: 6 August from 2022.
       (2021 12 9 nil) (2022 12 9 t) (2021 8 6 nil) (2022 8 6 t)
       ;; Ley 31822: 23 July from 2023; Ley 31788 (published 2023-06-15): 7 June from 2024.
       (2022 7 23 nil) (2023 7 23 t) (2023 6 7 nil) (2024 6 7 t) (2025 6 7 t)
       ;; Feriados stay on their date (Ley 26331); no Monday moves.
       (2025 6 30 nil) (2024 12 9 t)
       ;; Easter Sunday and días no laborables (DS 042-2025-PCM: 2 Jan 2026) are not feriados.
       (2025 4 20 nil) (2026 1 2 nil) (2024 11 15 nil)))
  (ok (eq holiday (and (holiday-p (find-calendar "PE") (make-date y m d)) t))
      (format nil "PE ~d-~2,'0d-~2,'0d ~:[no holiday~;holiday~]" y m d holiday)))

;;; --- Brazil (#19) ------------------------------------------------------------

(defparameter *br-holiday-gold* (load-holiday-gold "BR"))

(deftest br-holiday-gold-fixture-shape
  (%check-holiday-gold-shape *br-holiday-gold* "BR"))

(deftest br-registered-calendar-matches-gold
  "find-calendar \"BR\" is the feriados nacionais (Lei 662/1949, 6.802/1980, 10.607/2002, 14.759/2023) on every day 2000–2040."
  (let ((br (find-calendar "BR")))
    (%report-holiday-gold "BR" (%holiday-gold-mismatches *br-holiday-gold* (constantly br)))))

(deftest-parametrize br-feriados-nacionais
    ((y m d holiday) :rows
     '(;; Corpus Christi and Carnaval are pontos facultativos, not feriados.
       (2025 6 19 nil) (2026 6 4 nil) (2025 3 3 nil) (2025 3 4 nil) (2026 2 17 nil)
       ;; Paixão de Cristo: feriado nacional in the federal portarias (ponto
       ;; facultativo only in 2008, 2011 and 2012); Lei 9.093 art. 2 names it.
       (2025 4 18 t) (2026 4 3 t)
       ;; Lei 14.759/2023: Consciência Negra from 2024.
       (2023 11 20 nil) (2024 11 20 t) (2025 11 20 t)
       ;; Dia do Servidor Público (ponto facultativo) is no holiday.
       (2025 10 28 nil)
       (2000 11 2 t) (2025 10 12 t)))
  (ok (eq holiday (and (holiday-p (find-calendar "BR") (make-date y m d)) t))
      (format nil "BR ~d-~2,'0d-~2,'0d ~:[no holiday~;holiday~]" y m d holiday)))

;;; --- Argentina (#18) ---------------------------------------------------------

(defparameter *ar-holiday-gold* (load-holiday-gold "AR"))

(deftest ar-holiday-gold-fixture-shape
  (%check-holiday-gold-shape *ar-holiday-gold* "AR"))

(deftest ar-registered-calendar-matches-gold
  "find-calendar \"AR\" is the feriados nacionales, turísticos and one-off feriados on every day 2000–2040."
  (let ((ar (find-calendar "AR")))
    (%report-holiday-gold "AR" (%holiday-gold-mismatches *ar-holiday-gold* (constantly ar)))))

(deftest ar-year-calendars-match-gold
  (%report-holiday-gold "AR :year"
                        (%holiday-gold-mismatches *ar-holiday-gold*
                                                  (lambda (y) (argentina-holidays-calendar :year y)))))

(deftest ar-country-calendar-matches-gold
  "country-calendar \"AR\" defers to the starter: the corpus misses decree moves and the 2026 days."
  (let ((ar (country-calendar "AR")))
    (ok (eq :normative (calendar-provenance ar)))
    (%report-holiday-gold "country-calendar AR"
                          (%holiday-gold-mismatches *ar-holiday-gold* (constantly ar)))))

(deftest ar-statute-calendar-matches-gold-outside-decree-days
  "Every recurring AR feriado is a rule: the bare starter (no data file) misses
only the turísticos and one-off days of data/ar/transfers.sexp."
  (let* ((bare (make-instance 'argentina-holidays-calendar))
         (missing (mapcar #'first
                          (remove-if-not (lambda (row) (eq (second row) :holiday))
                                         (%holiday-gold-mismatches *ar-holiday-gold* (constantly bare)))))
         (data-days (loop for (nil . notice) in (ar-transfers)
                          append (loop for tr in (getf notice :transfers)
                                       collect (suite-date-iso (calendar-transfer-to tr))))))
    (ok (= 49 (length data-days)))
    (ok (null (set-difference missing data-days :test #'string=)))
    (ok (null (set-difference data-days missing :test #'string=)))))

(deftest-parametrize ar-feriados
    ((y m d holiday) :rows
     '(;; 24 March, inamovible from 2006 (Ley 26.085).
       (2005 3 24 nil) (2006 3 24 t) (2025 3 24 t)
       ;; Malvinas: 10 June in 2000; 2 April trasladable 2001–2006 (Ley 23.555).
       (2000 6 10 t) (2000 4 2 nil) (2002 4 1 t) (2003 3 31 t) (2004 4 5 t) (2004 4 2 nil)
       (2020 3 31 t) (2020 4 2 nil)
       ;; 20 June and 17 August on the third Monday until 2010 (Ley 24.445 art. 4).
       (2000 6 19 t) (2000 6 20 nil) (2000 8 21 t) (2010 6 21 t) (2011 6 20 t)
       ;; Ley 27.399 art. 6 trasladables.
       (2018 10 15 t) (2018 10 12 nil) (2024 11 18 t) (2025 11 24 t) (2026 11 23 t)
       (2025 6 16 t) (2026 6 15 t) (2026 6 17 nil) (2025 8 17 t) (2025 8 18 nil)
       ;; Decreto 789/2021: 17 June on a Friday stays (Monday 20 June is inamovible).
       (2022 6 17 t) (2033 6 17 t) (2039 6 17 t)
       ;; Decree moves: DNU 810/2003, DNU 521/2011, DNU 2226/2015, Res. JGM 139/2025.
       (2003 10 13 t) (2011 8 22 t) (2011 8 15 nil) (2015 11 27 t) (2015 11 23 nil)
       (2025 10 10 t) (2025 10 13 nil)
       ;; Turísticos and one-off feriados.
       (2024 6 21 t) (2025 8 15 t) (2025 11 21 t) (2010 5 24 t) (2022 12 20 t) (2026 11 9 t)
       ;; Días no laborables are not feriados: Jueves Santo; 10 Nov 2026 is provincial.
       (2025 4 17 nil) (2026 11 10 nil)))
  (ok (eq holiday (and (holiday-p (find-calendar "AR") (make-date y m d)) t))
      (format nil "AR ~d-~2,'0d-~2,'0d ~:[no holiday~;holiday~]" y m d holiday)))
