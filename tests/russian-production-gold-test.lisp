(in-package #:cl-stack-calendars/tests)

;;;; RU vs the production calendar 2000–2027 (data/tests/ru-production-calendar-gold.sexp,
;;;; scripts/generate_ru_production_gold.py; egao1980/cl-stack-calendars#13).
;;;; One code per day: W working day, R rest day that is not a holiday,
;;;; H holiday (statutory нерабочий праздничный день or a non-working Mon–Fri).

(defun load-ru-production-gold (&optional (path (data-path "tests/ru-production-calendar-gold.sexp")))
  (read-data-form path))

(defparameter *ru-production-gold* (load-ru-production-gold))

(defun %ru-gold-code (date)
  "The gold code character of DATE, or NIL outside the gold years."
  (let ((row (assoc (date-year date) (getf *ru-production-gold* :years))))
    (when row
      (char (second row) (- date (make-date (date-year date) 1 1))))))

(defun %ru-gold-mismatches (calendar-for-year from-year to-year)
  "Every (DATE KIND GOLD OURS) where the calendar disagrees with the gold.
CALENDAR-FOR-YEAR maps a year to the calendar to ask."
  (let ((bad '()))
    (loop for year from from-year to to-year
          for cal = (funcall calendar-for-year year)
          do (loop for date = (make-date year 1 1) then (+ date 1)
                   while (= (date-year date) year)
                   do (let* ((code (%ru-gold-code date))
                             (gold-holiday (char= code #\H))
                             (gold-business (char= code #\W))
                             (holiday (and (holiday-p cal date) t))
                             (business (and (business-day-p cal date) t)))
                        (unless (eq gold-holiday holiday)
                          (push (list (suite-date-iso date) :holiday gold-holiday holiday) bad))
                        (unless (eq gold-business business)
                          (push (list (suite-date-iso date) :business gold-business business) bad)))))
    (nreverse bad)))

(defun %report-ru-gold (label bad)
  (loop for row in bad
        for i from 0 below 25
        do (ok nil (format nil "~a ~{~a ~a gold ~a ours ~a~}" label row)))
  (ok (null bad) (format nil "~a: ~d disagreements with the production calendar" label (length bad))))

(deftest ru-production-gold-fixture-shape
  (ok (= 2000 (getf *ru-production-gold* :from)))
  (ok (= 2027 (getf *ru-production-gold* :to)))
  (loop for year from 2000 to 2027
        for row = (assoc year (getf *ru-production-gold* :years))
        do (ok (and row (= (length (second row))
                           (- (make-date (1+ year) 1 1) (make-date year 1 1))))
               (format nil "gold ~d has every day" year))))

(deftest ru-registered-calendar-matches-production-gold
  "find-calendar \"RU\" (every decree) agrees with the production calendar on every day 2000–2027."
  (let ((ru (find-calendar "RU")))
    (%report-ru-gold "RU" (%ru-gold-mismatches (constantly ru) 2000 2027))))

(deftest ru-year-calendars-match-production-gold
  "(russian-holidays-calendar :year Y) agrees with the production calendar on every day of Y."
  (%report-ru-gold "RU :year"
                   (%ru-gold-mismatches (lambda (y) (russian-holidays-calendar :year y)) 2000 2027)))

(deftest ru-decree-cancels-automatic-transfer
  "ТК ст. 112 ч. 5: a decree that moves a weekend holiday's rest day elsewhere
cancels the automatic ч. 2 transfer to the next working day (#13 item 1)."
  (let ((ru (find-calendar "RU")))
    (dolist (ymd '((2013 2 25) (2014 2 24) (2019 2 25) (2025 2 24) (2025 3 10)))
      (let ((date (apply #'make-date ymd)))
        (ng (holiday-p ru date) (format nil "~a is no holiday" ymd))
        (ok (business-day-p ru date) (format nil "~a is a working day" ymd))
        (ng (holiday-p (russian-holidays-calendar :year (first ymd)) date))))
    (dolist (ymd '((2013 5 10) (2014 11 3) (2019 5 10) (2025 5 8) (2025 6 13)))
      (ok (holiday-p ru (apply #'make-date ymd)) (format nil "~a is the decree's day off" ymd))))
  ;; The decree text names the holiday itself ("с субботы 23 февраля"): same effect.
  (let ((cal (russian-holidays-calendar
              :transfers (list (make-calendar-transfer :from (make-date 2019 2 23)
                                                       :to (make-date 2019 5 10)))
              :working-days '())))
    (ok (business-day-p cal (make-date 2019 2 25)))
    (ok (holiday-p cal (make-date 2019 2 23)))
    (ok (holiday-p cal (make-date 2019 5 10)))))

(deftest ru-decree-from-is-the-cancelled-day
  "2019 and 2025 record FROM as the auto-transferred Monday, as 2013 and 2014 do (#13 item 2)."
  (flet ((froms (year)
           (mapcar (lambda (tr) (%date-key (calendar-transfer-from tr)))
                   (getf (ru-decree-for-year year) :transfers))))
    (ok (member '(2019 2 25) (froms 2019) :test #'equal))
    (ng (member '(2019 2 23) (froms 2019) :test #'equal))
    (ok (member '(2025 2 24) (froms 2025) :test #'equal))
    (ok (member '(2025 3 10) (froms 2025) :test #'equal))
    (ng (member '(2025 3 8) (froms 2025) :test #'equal)))
  (let ((working (mapcar (lambda (w) (%date-key (calendar-working-day-date w)))
                         (ru-working-days-for-year 2025))))
    (ng (member '(2025 3 8) working :test #'equal))
    (ng (member '(2025 2 23) working :test #'equal))))

(deftest ru-january-weekend-holidays-transferred-before-2013
  "The 1–8 January exemption from ст. 112 ч. 2 starts in 2013 (ФЗ от 23.04.2012
№ 35-ФЗ). Before, a January holiday on a weekend moved to the next working day (#13 item 3)."
  (let ((ru (find-calendar "RU"))
        (statute (make-instance 'russian-holidays-calendar)))
    (dolist (ymd '((2000 1 3) (2000 1 4) (2001 1 8) (2005 1 6) (2005 1 10)
                   (2006 1 6) (2006 1 9) (2007 1 8) (2008 1 8) (2009 1 6) (2009 1 8)
                   (2010 1 6) (2010 1 8) (2011 1 6) (2011 1 10) (2012 1 6) (2012 1 9)))
      (let ((date (apply #'make-date ymd)))
        (ok (holiday-p ru date) (format nil "~a is a transferred day off" ymd))
        (ng (business-day-p ru date) (format nil "~a is not a working day" ymd))
        (ok (holiday-p statute date) (format nil "~a comes from ст. 112 ч. 2 itself" ymd))))
    ;; From 2013 the January block moves only by decree.
    (ng (holiday-p statute (make-date 2022 1 10)))
    (ng (holiday-p statute (make-date 2028 1 10)))))

(deftest ru-2027-decree
  "Постановление Правительства РФ от 17.09.2026 № 1187 (#13 item 3)."
  (let ((ru (find-calendar "RU"))
        (y (russian-holidays-calendar :year 2027)))
    (ok (search "1187" (getf (ru-decree-for-year 2027) :authority)))
    (dolist (cal (list ru y))
      (ok (business-day-p cal (make-date 2027 2 20)))
      (dolist (ymd '((2027 1 2) (2027 1 3) (2027 2 22) (2027 11 5) (2027 12 31)))
        (ok (holiday-p cal (apply #'make-date ymd)) (format nil "~a off" ymd))))))

(deftest ru-statute-eras
  "Holiday lists of КЗоТ ст. 65 / ТК ст. 112 by edition (#13 item 6)."
  (let ((statute (make-instance 'russian-holidays-calendar)))
    ;; 23 February non-working from ТК (2002).
    (ng (holiday-p statute (make-date 2001 2 23)))
    (ok (holiday-p statute (make-date 2002 2 23)))
    ;; ФЗ-201 (2005): 2 May, 7 Nov and 12 Dec dropped, 3–5 Jan and 4 Nov added.
    (ok (holiday-p statute (make-date 2004 5 2)))
    (ok (business-day-p statute (make-date 2006 5 2)))
    (ok (holiday-p statute (make-date 2004 11 7)))
    (ok (business-day-p statute (make-date 2006 11 7)))
    (ok (holiday-p statute (make-date 2004 12 12)))
    (ng (holiday-p statute (make-date 2005 12 12)))
    (ng (holiday-p statute (make-date 2004 11 4)))
    (ok (holiday-p statute (make-date 2005 11 4)))
    (ok (business-day-p statute (make-date 2004 1 5)))
    (ok (holiday-p statute (make-date 2005 1 5)))
    ;; ФЗ-35 (2013): 6 and 8 January. Before, 8 January was no holiday of its own.
    (ng (holiday-p statute (make-date 2011 1 8)) "Saturday 2011-01-08 is a plain rest day")
    (ng (holiday-p statute (make-date 2012 1 8)) "Sunday 2012-01-08 is a plain rest day")
    (ok (holiday-p statute (make-date 2014 1 8)))))

(deftest ru-after-last-decree-is-provisional
  "Years after the last decree (2028+) carry the statute and ст. 112 ч. 2 transfers
only, and are flagged provisional."
  (ok (= 2027 (ru-last-decree-year)))
  (ng (ru-provisional-year-p 2027))
  (ok (ru-provisional-year-p 2028))
  (ok (ru-provisional-year-p 2040))
  (let ((ru (find-calendar "RU"))
        (statute (make-instance 'russian-holidays-calendar)))
    (loop for date = (make-date 2028 1 1) then (+ date 1)
          while (<= date (make-date 2040 12 31))
          count (or (not (eq (and (holiday-p ru date) t) (and (holiday-p statute date) t)))
                    (not (eq (and (business-day-p ru date) t) (and (business-day-p statute date) t))))
            into bad
          finally (ok (zerop bad) (format nil "2028–2040 statute-only: ~d differences" bad)))
    ;; 1 January 2028 is a Saturday: no automatic transfer of the January block.
    (ok (business-day-p ru (make-date 2028 1 10)))
    ;; 4 November 2028 is a Saturday: ч. 2 moves it to Monday 6 November.
    (ok (holiday-p ru (make-date 2028 11 6)))
    (ng (business-day-p ru (make-date 2028 11 6)))))

(deftest ru-corpus-defers-to-normative-starter
  "country-calendar \"RU\" answers from the normative starter, not the date-holidays dump (#13 item 5)."
  (let ((corpus (country-calendar "RU"))
        (ru (find-calendar "RU")))
    (ok (string= "RU" (country-calendar-code corpus)))
    (ok (eq :normative (calendar-provenance corpus)))
    (ok (holiday-p corpus (make-date 2026 1 9)))
    (ok (holiday-p corpus (make-date 2004 11 7)))
    (ng (holiday-p corpus (make-date 2003 11 4)))
    (ok (business-day-p corpus (make-date 2024 4 27)))
    (loop for date = (make-date 2000 1 1) then (+ date 1)
          while (<= date (make-date 2040 12 31))
          count (or (not (eq (and (holiday-p corpus date) t) (and (holiday-p ru date) t)))
                    (not (eq (and (business-day-p corpus date) t) (and (business-day-p ru date) t))))
            into bad
          finally (ok (zerop bad) (format nil "corpus RU vs starter: ~d differences" bad)))))
