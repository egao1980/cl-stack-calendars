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
