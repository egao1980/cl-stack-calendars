(in-package #:cl-stack-calendars/tests)

;;;; Exchange-calendar engine features the Asia-Pacific and MENA MICs need
;;;; (#49): weekend sessions opened by a notice, per-day hours overrides,
;;;; special sessions, weekday-specific hours and named date functions.

(defparameter *engine-test-calendar*
  '(:name "TEST-ENGINE" :title "Engine test exchange" :authority "test fixture"
    :weekend (6 7)
    :rules ((:computed "Year-end closing day" krx-year-end-closing-day))
    :notices ((:title "Engine test notices" :uri "about:test"
               :issued nil :issued-uri nil :published nil :published-uri nil
               :published-in "test fixture" :dates-note "synthetic"
               :closed (((2024 3 4) "One-off closure"))
               :open (((2002 9 28) "Make-up Saturday session"))
               :sessions (((2021 11 18) ((:open (10 0) :close (16 30)))
                           "CSAT: the session moves one hour later")
                          ((2024 3 2) ((:open (9 15) :close (10 0))
                                       (:open (11 30) :close (12 30)))
                           "Saturday disaster-recovery session"))
               :special-sessions (((2026 11 8) ((:open (18 0) :close (19 0)))
                                   "Muhurat trading")
                                  ((2024 3 4) ((:open (18 0) :close (19 0)))
                                   "Special session on a closed day"))
               :early-closes () :late-opens ())))
  "A synthetic exchange calendar: one row of each notice kind.")

(defparameter *engine-test-hours*
  '(:mic "TSTE" :name "Engine test exchange" :zone "Asia/Seoul"
    :calendar "TEST-ENGINE"
    :eras ((:from (2000 1 1) :sessions ((:open (9 0) :close (15 30)))
            :authority "test fixture"))))

(defparameter *engine-test-sunday-hours*
  '(:mic "TSTS" :name "Sun-Thu test exchange" :zone "Asia/Jerusalem"
    :weekend (5 6)
    :eras ((:from (2020 3 8) :to (2026 1 1)
            :sessions ((:open (9 59) :close (17 15)))
            :sunday ((:open (9 59) :close (15 40)))
            :weekend (5 6) :authority "test fixture")
           (:from (2026 1 5)
            :sessions ((:open (9 59) :close (17 15)))
            :days ((5 (:open (9 59) :close (13 35))))
            :weekend (6 7) :authority "test fixture"))))

(defun %segments-hm (segs)
  (mapcar (lambda (s) (list (%hm (exchange-session-spec-open s))
                            (%hm (exchange-session-spec-close s))))
          segs))

(defmacro with-engine-test-exchange ((var) &body body)
  `(progn
     (register-calendar-constructor
      "TEST-ENGINE" (lambda () (make-exchange-calendar *engine-test-calendar*)))
     (unwind-protect
          (let ((,var (cl-stack-calendars::load-exchange-hours-plist *engine-test-hours*)))
            ,@body)
       (unregister-calendar "TEST-ENGINE"))))

(deftest exchange-weekend-session-by-notice
  "A notice :OPEN on a weekend day is a session with the era's weekday hours."
  (with-engine-test-exchange (ex)
    (let ((cal (exchange-calendar ex)))
      (ok (exchange-trading-day-p ex (make-date 2002 9 28)) "Saturday 2002-09-28 trades")
      (ok (equal (%segments-hm (exchange-sessions-for-date ex (make-date 2002 9 28)))
                 '(((9 0) (15 30)))))
      (ok (business-day-p cal (make-date 2002 9 28)) "business day on the calendar")
      (ok (exchange-calendar-opened-p cal (make-date 2002 9 28)))
      (ok (not (exchange-trading-day-p ex (make-date 2002 9 29))) "Sunday stays closed")
      (ok (not (business-day-p cal (make-date 2002 9 29)))))))

(deftest exchange-per-day-hours-override
  "A notice :SESSIONS row replaces the day's regular hours, and opens a weekend day."
  (with-engine-test-exchange (ex)
    (ok (equal (%segments-hm (exchange-sessions-for-date ex (make-date 2021 11 18)))
               '(((10 0) (16 30)))))
    (ok (equal (%segments-hm (exchange-regular-sessions-for-date ex (make-date 2021 11 18)))
               '(((10 0) (16 30))))
        "the override is the day's regular hours (not an early close)")
    (ok (null (exchange-early-close ex (make-date 2021 11 18))))
    (ok (equal (%segments-hm (exchange-sessions-for-date ex (make-date 2021 11 17)))
               '(((9 0) (15 30))))
        "the day before keeps the era hours")
    (ok (equal (%segments-hm (exchange-sessions-for-date ex (make-date 2024 3 2)))
               '(((9 15) (10 0)) ((11 30) (12 30))))
        "a Saturday with its own hours trades")
    (ok (equal (cl-stack-calendars::exchange-calendar-sessions
                (exchange-calendar ex) (make-date 2021 11 18))
               '((:open (10 0) :close (16 30)))))))

(deftest exchange-special-sessions
  "Special sessions (Muhurat) are listed apart and do not make a trading day."
  (with-engine-test-exchange (ex)
    (multiple-value-bind (segs note)
        (exchange-special-sessions-for-date ex (make-date 2026 11 8))
      (ok (equal (%segments-hm segs) '(((18 0) (19 0)))))
      (ok (equal note "Muhurat trading")))
    (ok (not (exchange-trading-day-p ex (make-date 2026 11 8))) "Sunday Muhurat day")
    (ok (null (exchange-sessions-for-date ex (make-date 2026 11 8))))
    (ok (not (exchange-trading-day-p ex (make-date 2024 3 4))) "closed by notice")
    (ok (equal (%segments-hm (exchange-special-sessions-for-date ex (make-date 2024 3 4)))
               '(((18 0) (19 0))))
        "a special session on a closed day is still listed")
    (ok (null (exchange-special-sessions-for-date ex (make-date 2026 11 9))))))

(deftest exchange-weekday-specific-hours
  "An era's :SUNDAY (or :DAYS) sessions apply on that weekday only."
  (let ((ex (cl-stack-calendars::load-exchange-hours-plist *engine-test-sunday-hours*)))
    (ok (equal (%segments-hm (exchange-sessions-for-date ex (make-date 2024 6 2)))
               '(((9 59) (15 40))))
        "Sunday 2024-06-02 closes 15:40")
    (ok (equal (%segments-hm (exchange-sessions-for-date ex (make-date 2024 6 3)))
               '(((9 59) (17 15))))
        "Monday closes 17:15")
    (ok (null (exchange-sessions-for-date ex (make-date 2024 6 7))) "Friday is weekend")
    (ok (equal (%segments-hm (exchange-sessions-for-date ex (make-date 2026 1 9)))
               '(((9 59) (13 35))))
        "Friday 2026-01-09 closes 13:35 (:days)")
    (ok (null (exchange-sessions-for-date ex (make-date 2026 1 11)))
        "Sunday is weekend from 2026")
    (ok (equal (mapcar #'car (exchange-era-days
                              (exchange-era-for-date ex (make-date 2024 6 2))))
               '(7))
        "EXCHANGE-ERA-DAYS lists the weekday-specific sessions")))

(deftest exchange-date-functions
  "Named date functions for exchange rules, against the exchanges' own lists."
  ;; KRX year-end closing day (연말휴장일), KRX lists: 2005-12-30, 2006-12-29,
  ;; 2022-12-30, 2023-12-29; 31 Dec on a weekday otherwise.
  (ok (equal (mapcar (lambda (y) (%date-key (krx-year-end-closing-day y)))
                     '(2005 2006 2022 2023 2024))
             '((2005 12 30) (2006 12 29) (2022 12 30) (2023 12 29) (2024 12 31))))
  ;; B3 last business day of the year: 30 Dec 2011, 2016, 2022; 29 Dec 2017, 2023.
  (ok (equal (mapcar (lambda (y) (%date-key (last-weekday-of-year y)))
                     '(2011 2016 2017 2022 2023 2025))
             '((2011 12 30) (2016 12 30) (2017 12 29) (2022 12 30) (2023 12 29)
               (2025 12 31))))
  ;; HKEX: the day before Lunar New Year's Day (2027 eve 02-05; 2024 eve 02-09).
  (ok (equal (mapcar (lambda (y) (%date-key (hk-lunar-new-year-eve y)))
                     '(2024 2025 2027))
             '((2024 2 9) (2025 1 28) (2027 2 5))))
  ;; The functions resolve by name from data files.
  (ok (functionp (cl-stack-calendars::exchange-date-function "hk-lunar-new-year-eve"))))

(defun %tase-hebrew-gold ()
  ;; Not named *-gold.sexp: that suffix is the exchange_calendars fixtures.
  (read-data-form (data-path "tests/exchanges/XTAE-hebrew-dates.sexp")))

(deftest tase-hebrew-dates-gold
  "Every holiday eve (date function) and festival (IL calendar) on the TASE
yearly Vacation Schedules 2013-2028 (scripts/generate_tase_hebrew_gold.py)."
  (let ((rows (getf (%tase-hebrew-gold) :rows))
        (il (find-calendar "IL"))
        (bad 0))
    (ok (> (length rows) 200) "TASE gold rows")
    (dolist (row rows)
      (destructuring-bind (y m d name kind target) row
        (let* ((date (make-date y m d))
               (good (ecase kind
                       (:eve (let ((got (funcall (cl-stack-calendars::exchange-date-function
                                                  target)
                                                 y)))
                               (and got (= got date))))
                       (:festival (multiple-value-bind (hp hname) (holiday-p il date)
                                    (and hp (equal hname target)))))))
          (unless good
            (incf bad)
            (when (<= bad 12)
              (ok nil (format nil "TASE ~a ~a ~a ~a" (list y m d) name kind target)))))))
    (ok (zerop bad) (format nil "TASE Hebrew-date mismatches: ~d" bad))))
