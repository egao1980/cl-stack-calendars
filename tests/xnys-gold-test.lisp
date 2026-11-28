(in-package #:cl-stack-calendars/tests)

;;;; XNYS / XNAS sessions and early closes vs data/tests/xnys-gold.sexp
;;;; (Python exchange_calendars XNYS, 1970–2030; see scripts/generate_xnys_gold.py).
;;;; The fixture lists weekday closures; every other weekday is a session.

(defun load-xnys-gold (&optional (path (data-path "tests/xnys-gold.sexp")))
  (read-data-form path))

(defparameter *xnys-gold* (load-xnys-gold))

;;; Intentional differences from exchange_calendars: (MIC (Y M D) KIND).
;;; Empty — every session date and early close in range agrees.
(defparameter *xnys-gold-allow* '())

(defun %xnys-gold-allowed-p (mic date kind)
  (member (list mic (%date-key date) kind) *xnys-gold-allow* :test #'equal))

(defun %xnys-gold-closed-table ()
  "Closed weekdays of the gold: rows (Y M D) or, 1953-1969, (Y M D NAME URL…)."
  (let ((table (make-hash-table)))
    (dolist (row (getf *xnys-gold* :closed) table)
      (setf (gethash (date-rd (apply #'make-date (subseq row 0 3))) table)
            (or (fourth row) t)))))

(defun %xnys-gold-day-table (key)
  "Rows ((Y M D) (H M) [URL NOTE]) of the gold's KEY (:EARLY-CLOSES, :LATE-OPENS)
by day: RD → (H M)."
  (let ((table (make-hash-table)))
    (dolist (row (getf *xnys-gold* key) table)
      (destructuring-bind (ymd hm &rest source) row
        (declare (ignore source))
        (setf (gethash (date-rd (apply #'make-date ymd)) table) hm)))))

(defun %xnys-gold-regular-hours (date)
  "The gold's regular (OPEN CLOSE) hours era on DATE, as ((H M) (H M)), or NIL."
  (loop for (from to open close) in (getf *xnys-gold* :hours)
        when (and (<= (apply #'make-date from) date)
                  (or (null to) (<= date (apply #'make-date to))))
          return (list open close)))

(defun %compare-exchange-with-xnys-gold (mic from)
  "Return (values SESSIONS MISMATCHES) comparing MIC with the gold from FROM:
every session date, early close, late open and the session's hours (the
regular hours era of the gold, cut by its early close and late open)."
  (let* ((ex (find-exchange mic))
         (closed (%xnys-gold-closed-table))
         (early (%xnys-gold-day-table :early-closes))
         (late (%xnys-gold-day-table :late-opens))
         (end (apply #'make-date (getf *xnys-gold* :to)))
         (sessions 0)
         (bad 0))
    (flet ((miss (date kind fmt &rest args)
             (unless (%xnys-gold-allowed-p mic date kind)
               (incf bad)
               (when (<= bad 12)
                 (ok nil (format nil "~a ~a ~a: ~?" mic (%date-key date) kind fmt args))))))
      (loop for date = from then (+ date 1)
            while (<= date end)
            do (let ((gold-session (and (<= (date-day-of-week date) 5)
                                        (not (gethash (date-rd date) closed))))
                     (ours (exchange-trading-day-p ex date)))
                 (when gold-session (incf sessions))
                 (unless (eq gold-session ours)
                   (miss date :session "gold ~a, ours ~a" gold-session ours))
                 (when (and gold-session ours)
                   (let ((gold-hm (gethash (date-rd date) early))
                         (our-tod (exchange-early-close ex date))
                         (gold-late (gethash (date-rd date) late))
                         (our-late (exchange-late-open ex date))
                         (regular (%xnys-gold-regular-hours date)))
                     (unless (equal gold-hm (and our-tod (%hm our-tod)))
                       (miss date :early-close "gold ~a, ours ~a"
                             gold-hm (and our-tod (%hm our-tod))))
                     (unless (equal gold-late (and our-late (%hm our-late)))
                       (miss date :late-open "gold ~a, ours ~a"
                             gold-late (and our-late (%hm our-late))))
                     (let ((gold-hours (list (list (or gold-late (first regular))
                                                   (or gold-hm (second regular)))))
                           (our-hours (%session-hms mic date)))
                       (unless (equal gold-hours our-hours)
                         (miss date :hours "gold ~a, ours ~a" gold-hours our-hours))))))))
    (values sessions bad)))

(deftest xnys-gold-every-session-and-early-close
  "Every XNYS session date, its hours, early close and late open 1953–2030
match the gold: the NYSE's own record 1953–1969 (#50), exchange_calendars
1970–2030."
  (ok (equal (getf *xnys-gold* :from) '(1953 1 1)) "gold starts in 1953")
  (multiple-value-bind (sessions bad)
      (%compare-exchange-with-xnys-gold "XNYS"
                                        (apply #'make-date (getf *xnys-gold* :from)))
    (ok (= sessions (getf *xnys-gold* :session-count))
        (format nil "gold session checksum ~d" sessions))
    (ok (zerop bad) (format nil "XNYS mismatches: ~d" bad))))

(deftest xnas-follows-nyse-gold
  "Nasdaq follows the NYSE holiday schedule (exchange_calendars XNAS = XNYS since 1990)."
  (multiple-value-bind (sessions bad)
      (%compare-exchange-with-xnys-gold "XNAS" (make-date 1990 1 1))
    (ok (> sessions 10000))
    (ok (zerop bad) (format nil "XNAS mismatches: ~d" bad))))

(deftest nyse-calendar-issue-11
  "egao1980/cl-stack-calendars#11: NYSE holidays, not US federal ones."
  (let ((ex (find-exchange "XNYS"))
        (nyse (find-calendar "NYSE")))
    (ok (string= (exchange-hours-calendar-name ex) "NYSE"))
    (ok (string= (exchange-hours-calendar-name (find-exchange "XNAS")) "NYSE"))
    ;; Thanksgiving and Christmas 2026: closed everywhere.
    (dolist (d (list (make-date 2026 11 26) (make-date 2026 12 25)))
      (ng (exchange-trading-day-p ex d))
      (ok (null (exchange-sessions-for-date ex d)))
      (ok (signals (exchange-session-bounds "XNYS" d) 'calendar-error)))
    ;; Good Friday closed; Columbus Day and Veterans Day open.
    (ok (holiday-p nyse (make-date 2026 4 3)))
    (ng (exchange-trading-day-p ex (make-date 2026 4 3)))
    (dolist (d (list (make-date 2026 10 12) (make-date 2026 11 11)))
      (ok (exchange-trading-day-p ex d))
      (ok (exchange-session-bounds "XNYS" d)))
    ;; Day after Thanksgiving 2026: 13:00 early close kept.
    (ok (equal (%session-hms "XNYS" (make-date 2026 11 27)) '(((9 30) (13 0)))))
    ;; NYSE Rule 7.2: Saturday New Year's Day is not observed on Friday Dec 31.
    (ok (exchange-trading-day-p ex (make-date 2021 12 31)))
    (ng (holiday-p nyse (make-date 2021 12 31)))
    (ok (exchange-trading-day-p ex (make-date 2027 12 31)))
    ;; …but other Saturday holidays close the Friday before.
    (ok (holiday-p nyse (make-date 2027 6 18)))   ; Juneteenth Sat 2027-06-19
    (ok (holiday-p nyse (make-date 2026 7 3)))    ; Independence Day Sat 2026
    (ok (holiday-p nyse (make-date 2022 6 20)))   ; Juneteenth Sun → Mon
    (ng (holiday-p nyse (make-date 2021 6 18)))   ; Juneteenth only from 2022
    (ng (holiday-p nyse (make-date 1997 1 20)))   ; MLK only from 1998
    (ok (holiday-p nyse (make-date 1998 1 19)))
    ;; Special closures.
    (dolist (ymd '((2001 9 11) (2001 9 14) (2004 6 11) (2007 1 2) (2012 10 29)
                   (2012 10 30) (2018 12 5) (2025 1 9)))
      (multiple-value-bind (hp name) (holiday-p nyse (apply #'make-date ymd))
        (ok hp (format nil "NYSE closed ~a" ymd))
        (ok (stringp name) (format nil "closure ~a has a name" ymd))))))

(deftest xnys-gold-pre-1970-rows-cite-sources
  "#50: every 1953–1969 closed day, early close and late open of the gold
names the URL it comes from."
  (let ((cutoff (make-date 1970 1 1)))
    (dolist (row (getf *xnys-gold* :closed))
      (when (< (apply #'make-date (subseq row 0 3)) cutoff)
        (ok (and (stringp (fourth row)) (stringp (fifth row))
                 (search "://" (fifth row)))
            (format nil "closed ~a cites a source" (subseq row 0 3)))))
    (dolist (key '(:early-closes :late-opens))
      (dolist (row (getf *xnys-gold* key))
        (when (< (apply #'make-date (first row)) cutoff)
          (ok (and (stringp (third row)) (search "://" (third row)))
              (format nil "~(~a~) ~a cites a source" key (first row))))))))

(deftest nyse-calendar-coverage-issue-50
  "#50: the NYSE calendar is modeled from 1953 (the first full year of the
five-day week); before that it signals CALENDAR-OUT-OF-RANGE."
  (let ((nyse (find-calendar "NYSE"))
        (ex (find-exchange "XNYS")))
    (ok (typep nyse 'exchange-holiday-calendar))
    (ok (eq (calendar-provenance nyse) :exchange))
    (ok (equal (calendar-coverage nyse) '(1953)))
    (ok (signals (holiday-p nyse (make-date 1952 12 31)) 'calendar-out-of-range))
    (ok (signals (exchange-trading-day-p ex (make-date 1950 6 5)) 'calendar-out-of-range))
    (ok (signals (exchange-trading-day-p ex (make-date 1952 9 29)) 'calendar-out-of-range))
    (ng (handler-bind ((calendar-out-of-range #'continue))
          (holiday-p nyse (make-date 1952 12 25))))
    (ng (holiday-p nyse (make-date 1953 1 2)))
    (ok (exchange-trading-day-p ex (make-date 1953 1 2)))
    (ok (exchange-trading-day-p ex (make-date 2030 12 31)))))

(deftest nyse-1953-1969-closures-issue-50
  "#50: the NYSE's closings 1953–1969 by name, and the hours of the
paperwork crisis."
  (let ((nyse (find-calendar "NYSE"))
        (ex (find-exchange "XNYS")))
    (flet ((closed (y m d) (not (exchange-trading-day-p ex (make-date y m d))))
           (name (y m d) (nth-value 1 (holiday-p nyse (make-date y m d)))))
      ;; Last year of Lincoln's Birthday, Columbus Day and Armistice Day.
      (ok (closed 1953 2 12)) (ok (closed 1953 10 12)) (ok (closed 1953 11 11))
      (ng (closed 1954 2 12)) (ng (closed 1954 10 12)) (ng (closed 1954 11 11))
      ;; Saturday holidays closed no Friday before the 1959-07-03 policy.
      (ng (closed 1953 5 29)) (ng (closed 1953 7 3)) (ng (closed 1959 5 29))
      (ok (closed 1959 7 3)) (ok (closed 1964 5 29)) (ng (closed 1965 12 31))
      ;; One-off closings.
      (dolist (ymd '((1954 12 24) (1956 12 24) (1958 12 26) (1961 5 29) (1963 11 25)
                     (1965 12 24) (1968 2 12) (1968 4 9) (1968 7 5) (1969 2 10)
                     (1969 3 31) (1969 7 21)))
        (ok (apply #'closed ymd) (format nil "closed ~a" ymd)))
      (ok (search "Kennedy" (name 1963 11 25)))
      (ok (search "Eisenhower" (name 1969 3 31)))
      (ok (search "King" (name 1968 4 9)))
      (ok (search "lunar" (name 1969 7 21)))
      (ok (search "snow" (name 1969 2 10)))
      ;; 1968 four-day weeks: 23 Wednesdays; Veterans Day stands in for Nov 13.
      (ok (= 23 (loop for d = (make-date 1968 6 12) then (+ d 1)
                      while (<= d (make-date 1968 12 31))
                      count (equal (name (date-year d) (date-month d) (date-day d))
                                   "Paperwork crisis (four-day week)"))))
      (ok (closed 1968 11 11)) (ng (closed 1968 11 13))
      (ng (closed 1968 7 3)) (ng (closed 1968 9 4)) (ng (closed 1968 11 6))
      ;; Hours.
      (ok (equal (%session-hms "XNYS" (make-date 1962 12 24)) '(((10 0) (15 30)))))
      (ok (equal (%session-hms "XNYS" (make-date 1963 11 22)) '(((10 0) (14 7)))))
      (ok (equal (%session-hms "XNYS" (make-date 1967 2 7)) '(((10 15) (14 0)))))
      (ok (equal (%session-hms "XNYS" (make-date 1968 2 1)) '(((10 0) (14 0)))))
      (ok (equal (%session-hms "XNYS" (make-date 1968 3 4)) '(((10 0) (15 30)))))
      (ok (equal (%session-hms "XNYS" (make-date 1969 3 3)) '(((10 0) (14 0)))))
      (ok (equal (%session-hms "XNYS" (make-date 1969 8 4)) '(((10 0) (14 30)))))
      (ok (equal (%session-hms "XNYS" (make-date 1970 1 5)) '(((10 0) (15 0)))))
      (ok (equal (%session-hms "XNYS" (make-date 1970 5 4)) '(((10 0) (15 30)))))
      (ok (equal (%session-hms "XNYS" (make-date 1970 12 24)) '(((10 0) (14 0))))))))

(deftest nyse-closures-are-bitemporal-notices
  "#50, #93: every NYSE closure day is a notice row with :ISSUED / :PUBLISHED
(or a :DATES-NOTE), from 1953 to the latest one."
  (let* ((nyse (find-calendar "NYSE"))
         (days (loop for notice in (exchange-calendar-notices nyse)
                     append (mapcar #'first (getf notice :closed)))))
    (dolist (ymd '((1963 11 25) (1968 6 12) (1968 11 11) (1969 7 21) (1972 12 28)
                   (2001 9 11) (2012 10 30) (2018 12 5) (2025 1 9)))
      (ok (member ymd days :test #'equal) (format nil "notice closes ~a" ymd)))
    (dolist (notice (exchange-calendar-notices nyse))
      (dolist (key '(:issued :issued-uri :published :published-uri :published-in :dates-note))
        (ok (member key notice) (format nil "~a has ~(~a~)" (getf notice :title) key))))))

(deftest exchange-days-between-eras-are-closed
  "Eras end on the last trading day: the weekend / holiday before an hours
change is in no era. Those days are closed, not an error — unless they lie
before the exchange calendar's coverage (XNYS before 1953, #50), where the
calendar signals CALENDAR-OUT-OF-RANGE."
  (dolist (mic (list-exchanges))
    (let* ((ex (find-exchange mic))
           (coverage (let ((cal (exchange-calendar ex))) (and cal (calendar-coverage cal))))
           (eras (sort (copy-list (exchange-hours-eras ex))
                       (lambda (a b)
                         (or (null (exchange-era-from a))
                             (and (exchange-era-from b)
                                  (< (exchange-era-from a) (exchange-era-from b))))))))
      (loop for (a b) on eras
            while (and b (exchange-era-to a))
            do (loop for d = (+ (exchange-era-to a) 1) then (+ d 1)
                     while (< d (exchange-era-from b))
                     do (if (date-covered-p coverage d)
                            (ng (exchange-trading-day-p ex d)
                                (format nil "~a closed between eras on ~a" mic d))
                            (ok (signals (exchange-trading-day-p ex d) 'calendar-out-of-range)
                                (format nil "~a out of range on ~a" mic d))))))))
