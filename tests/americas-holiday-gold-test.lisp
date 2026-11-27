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
