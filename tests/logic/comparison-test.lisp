(in-package #:cl-stack-calendars/logic/tests)

;;;; The prototype against the current engine, 2000-2040, for USFED (in
;;;; lieu), GBLO (exclusive substitutes), JP (振替休日 + 国民の休日) and RU
;;;; (ТК РФ ст. 112, registered and with each year's decree attached).
;;;;
;;;; Every difference is adjudicated below with its reason. The test fails on
;;;; any difference that is not in the list, and on any listed one that went
;;;; away, so the list is the exact record of where the engines disagree.

;;; --- harness ---------------------------------------------------------------

(defun iso (date)
  (format nil "~4,'0d-~2,'0d-~2,'0d" (dt:date-year date) (dt:date-month date) (dt:date-day date)))

(defun day-diffs (calendar y0 y1)
  "Days in Y0..Y1 where HOLIDAY-P or BUSINESS-DAY-P differ between the engine
and the prototype: (ISO OLD-HOLIDAY-NAME NEW-HOLIDAY-NAME OLD-BUSINESS NEW-BUSINESS)."
  (loop for rd from (dt:date-rd (dt:make-date y0 1 1)) to (dt:date-rd (dt:make-date y1 12 31))
        for d = (dt:date-from-rd rd)
        for (oh on) = (multiple-value-list (cal:holiday-p calendar d))
        for (nh nn) = (multiple-value-list (logic-holiday-p calendar d))
        for ob = (and (cal:business-day-p calendar d) t)
        for nb = (and (logic-business-day-p calendar d) t)
        unless (and (eq (not oh) (not nh)) (eq ob nb))
          collect (list (iso d) (and oh (or on t)) (and nh (or nn t)) ob nb)))

(defun name-diffs (calendar y0 y1)
  "Holidays on the same date whose names differ: (ISO OLD NEW)."
  (let ((new (make-hash-table)))
    (dolist (o (logic-holidays-between calendar (dt:make-date y0 1 1) (dt:make-date y1 12 31)))
      (setf (gethash (dt:date-rd (cal:holiday-observance-date o)) new)
            (cal:holiday-observance-name o)))
    (loop for o in (cal:holidays-between calendar (dt:make-date y0 1 1) (dt:make-date y1 12 31))
          for rd = (dt:date-rd (cal:holiday-observance-date o))
          for n = (gethash rd new)
          when (and n (not (equal n (cal:holiday-observance-name o))))
            collect (list (iso (cal:holiday-observance-date o)) (cal:holiday-observance-name o) n))))

(defun ru-decree-diffs (y0 y1)
  "DAY-DIFFS of (RUSSIAN-HOLIDAYS-CALENDAR :YEAR Y) over Y alone, per year."
  (loop for y from y0 to y1
        append (day-diffs (cal:russian-holidays-calendar :year y) y y)))

;;; --- adjudicated differences, 2000-2040 ------------------------------------

(defparameter *expected-day-diffs*
  '(("USFED" ())
    ("GBLO" ())
    ("JP" ())
    ("RU" ())
    ;; ТК РФ ст. 112 ч. 5: the year's decree moves the coinciding weekend
    ;; itself, so ч. 2 does not move it again. The engine moves it twice.
    ;; Prototype right: 2019-02-25, 2025-02-24 and 2025-03-10 were working
    ;; days (Постановления № 1163 от 01.10.2018 and № 1335 от 04.10.2024:
    ;; 23 февраля → 10 мая 2019; 23 февраля → 8 мая, 8 марта → 13 июня 2025).
    ("RU decree"
     (("2019-02-25" "День защитника Отечества" nil nil t)
      ("2025-02-24" "День защитника Отечества" nil nil t)
      ("2025-03-10" "Международный женский день" nil nil t))))
  "Code → the exact DAY-DIFFS list.")

(defparameter *expected-gblo-name-diffs*
  ;; gov.uk: when 25 December is a Sunday, 26 December is Boxing Day and
  ;; 27 December is "Christmas Day (substitute day)". The engine moves Boxing
  ;; Day off its own weekday date because Christmas claimed it first (#27).
  ;; Same dates, prototype names right.
  (loop for y in '(2005 2011 2016 2022 2033 2039)
        append (list (list (format nil "~d-12-26" y) "Christmas Day" "Boxing Day")
                     (list (format nil "~d-12-27" y) "Boxing Day" "Christmas Day"))))

(deftest registered-calendars-2000-2040
  (dolist (code '("USFED" "GBLO" "JP" "RU"))
    (testing code
      (ok (equal (day-diffs (cal:find-calendar code) 2000 2040)
                 (second (assoc code *expected-day-diffs* :test #'string=)))))))

(deftest ru-decree-calendars-2000-2040
  (ok (equal (ru-decree-diffs 2000 2040)
             (second (assoc "RU decree" *expected-day-diffs* :test #'string=)))))

(deftest gblo-substitute-names
  (ok (equal (name-diffs (cal:find-calendar "GBLO") 2000 2040) *expected-gblo-name-diffs*))
  (ok (equal (name-diffs (cal:find-calendar "USFED") 2000 2040) '()))
  (ok (equal (name-diffs (cal:find-calendar "JP") 2000 2040) '())))

(deftest ru-2024-working-saturday
  (let ((ru (cal:russian-holidays-calendar :year 2024)))
    (ok (logic-business-day-p ru (dt:make-date 2024 4 27)) "Sat 27 Apr 2024 works by decree")
    (ok (logic-holiday-p ru (dt:make-date 2024 4 29)) "Mon 29 Apr 2024 is the day off")
    (ok (logic-holiday-p ru (dt:make-date 2024 12 31)) "31 Dec 2024 (from 7 Jan)")
    (ok (not (logic-business-day-p ru (dt:make-date 2024 1 6))) "a holiday beats the decree's FROM mark")))

;;; --- #27: order dependence disappears -------------------------------------

(cal:define-calendar probe-ab ()
  (:fixed "A" 5 1 :observed :ru-tk-112-transfer :authority "x")
  (:fixed "B" 5 2 :authority "x"))
(cal:define-calendar probe-ba ()
  (:fixed "B" 5 2 :authority "x")
  (:fixed "A" 5 1 :observed :ru-tk-112-transfer :authority "x"))
(cal:define-calendar probe-nearest ()
  (:fixed "Eve" 12 24 :authority "x")
  (:fixed "Xmas" 12 25 :observed :us-federal-in-lieu :authority "x"))
(cal:define-calendar probe-ny ()
  (:fixed "NYE" 12 31 :observed :uk-proclamation-substitute :authority "x")
  (:fixed "NY" 1 1 :observed :uk-proclamation-substitute :authority "x"))

(defun listing (calendar y0 m0 d0 y1 m1 d1)
  (mapcar (lambda (o) (list (iso (cal:holiday-observance-date o)) (cal:holiday-observance-name o)))
          (logic-holidays-between calendar (dt:make-date y0 m0 d0) (dt:make-date y1 m1 d1))))

(deftest ru-1994-may-3
  ;; #27: 1 May 1994 (Sunday) moves to the next *working* day. 2 May is a
  ;; holiday itself, so the substitute is 3 May. The engine loses it.
  (let ((ru (cal:find-calendar "RU")))
    (ok (equal (listing ru 1994 4 30 1994 5 12)
               '(("1994-05-01" "Праздник Весны и Труда") ("1994-05-02" "Праздник Весны и Труда")
                 ("1994-05-03" "Праздник Весны и Труда") ("1994-05-09" "День Победы"))))
    (ok (cal:business-day-p ru (dt:make-date 1994 5 3)) "the current engine still says business day")))

(deftest substitutes-ignore-clause-order
  (let ((ab (listing (make-instance 'probe-ab) 2022 4 30 2022 5 6))
        (ba (listing (make-instance 'probe-ba) 2022 4 30 2022 5 6)))
    (ok (equal ab ba))
    (ok (equal ab '(("2022-05-01" "A") ("2022-05-02" "B") ("2022-05-03" "A"))))))

(deftest in-lieu-never-vanishes
  (ok (equal (listing (make-instance 'probe-nearest) 2021 12 20 2021 12 31)
             '(("2021-12-24" "Eve / Xmas")))))

(deftest substitutes-cross-new-year
  (ok (equal (listing (make-instance 'probe-ny) 2022 12 28 2023 1 6)
             '(("2023-01-02" "NYE") ("2023-01-03" "NY")))))

;;; --- #29: composite precedence --------------------------------------------

(deftest composite-keeps-working-days
  (let ((ru (cal:russian-holidays-calendar :year 2024))
        (sat (dt:make-date 2024 4 27)))
    (ok (logic-composite-business-day-p (list ru) :union sat))
    (ok (not (cal:business-day-p (cal:make-composite-calendar (list ru)) sat))
        "the current composite drops the override")
    (ok (not (logic-composite-business-day-p (list ru (cal:weekend-only-calendar)) :union sat))
        "union: a constituent that rests on Saturday closes it")
    (ok (logic-composite-business-day-p (list ru (cal:weekend-only-calendar)) :intersection sat))
    (ok (not (logic-composite-holiday-p '() :intersection (dt:make-date 2024 3 5)))
        "empty intersection: no holidays")))

;;; --- explanations ------------------------------------------------------------

(deftest proofs-cite-statutes
  (let* ((e (first (logic-explain-holiday (cal:find-calendar "RU") (dt:make-date 1994 5 3))))
         (authorities (third e)))
    (ok (typep (second e) 'lp:proof))
    (ok (find-if (lambda (a) (search "ст. 112 ч. 2" a)) authorities))
    (format t "~&;; proof height for RU 1994-05-03: ~d~%" (lp:proof-height (second e))))
  (let* ((e (first (logic-explain-holiday (cal:find-calendar "JP") (dt:make-date 2020 5 6)))))
    (ok (equal (first e) "振替休日"))
    (ok (find-if (lambda (a) (search "第3条第2項" a)) (third e))))
  (let* ((ru (cal:russian-holidays-calendar :year 2019))
         (p (year-model-program (build-year-model ru 2019 :keep-program t))))
    (ok (typep (lp:explain p (list 'cl-stack-calendars/logic::holiday
                                   (dt:date-rd (dt:make-date 2019 2 25)) "День защитника Отечества"))
               'lp:why-not)
        "why 2019-02-25 is not a holiday: the decree moved 23 Feb itself")))

;;; --- performance -----------------------------------------------------------

(defun seconds (thunk)
  (let ((t0 (get-internal-real-time)))
    (funcall thunk)
    (/ (- (get-internal-real-time) t0) (float internal-time-units-per-second))))

(deftest year-models-are-cheap
  (dolist (code '("USFED" "GBLO" "JP" "RU"))
    (let ((c (cal:find-calendar code)))
      (clear-logic-cache)
      (let ((s (seconds (lambda () (logic-holidays-between c (dt:make-date 2000 1 1) (dt:make-date 2040 12 31))))))
        (format t "~&;; ~a: 41 year models + listing in ~,1f ms~%" code (* 1000 s))
        (ok (< s 10.0) code)))))

;;; --- full sweep (opt-in) --------------------------------------------------

(defun old-year-holidays (calendar year)
  "RD → name as the engine's HOLIDAY-P sees YEAR (the year maps of YEAR-1,
YEAR and YEAR+1, suppressed dates removed), built 3 times instead of 3 × 365."
  (let ((h (make-hash-table))
        (lo (dt:date-rd (dt:make-date year 1 1)))
        (hi (dt:date-rd (dt:make-date year 12 31))))
    (dolist (y (list (1+ year) year (1- year)) h)
      (maphash (lambda (rd name)
                 (when (and (<= lo rd hi)
                            (not (cal::%suppressed-date-p calendar (dt:date-from-rd rd))))
                   (setf (gethash rd h) name)))
               (cal::%rule-calendar-year-map calendar y)))))

(defun fast-day-diffs (calendar y0 y1)
  "DAY-DIFFS through OLD-YEAR-HOLIDAYS and the year models directly."
  (loop for y from y0 to y1
        for old = (old-year-holidays calendar y)
        for m = (calendar-year-model calendar y)
        append (loop for rd from (dt:date-rd (dt:make-date y 1 1)) to (dt:date-rd (dt:make-date y 12 31))
                     for d = (dt:date-from-rd rd)
                     for on = (gethash rd old)
                     for nn = (gethash rd (year-model-holidays m))
                     for ob = (and (not on) (not (cal:weekend-day-p calendar d)))
                     for nb = (and (gethash rd (year-model-business m)) t)
                     unless (and (eq (not on) (not nn)) (eq ob nb))
                       collect (list (iso d) on nn ob nb))))

(defun sweep-registered (y0 y1 &key (stream *standard-output*) (codes nil codes-p))
  "FAST-DAY-DIFFS over Y0..Y1 for every registered RULE-CALENDAR (or CODES).
Prints one line per calendar with a difference, then a summary (calendars,
days that keep several names, seconds spent building year models on each
side); returns ((CODE COUNT DIFFS) …)."
  (let ((pairs '()) (multi 0) (multi-cals 0) (t-old 0.0) (t-new 0.0))
    (maphash (lambda (k c)
               (when (and (typep c 'cal::rule-calendar)
                          (or (not codes-p) (member k codes :test #'string=)))
                 (push (cons k c) pairs)))
             cal::*calendar-registry*)
    (prog1
        (loop for (code . c) in (setf pairs (sort pairs #'string< :key #'car))
              for diffs = (progn
                            (clear-logic-cache)
                            (incf t-new (seconds (lambda () (loop for y from y0 to y1
                                                                  do (calendar-year-model c y)))))
                            (incf t-old (seconds (lambda () (loop for y from y0 to y1
                                                                  do (old-year-holidays c y)))))
                            (let ((here 0))
                              (loop for y from y0 to y1
                                    do (maphash (lambda (rd names)
                                                  (declare (ignore rd))
                                                  (when (cdr names) (incf here)))
                                                (year-model-holidays (calendar-year-model c y))))
                              (when (plusp here) (incf multi-cals) (incf multi here)))
                            (fast-day-diffs c y0 y1))
              when diffs
                collect (progn (format stream "~&;; ~a ~d ~s~%" code (length diffs)
                                       (subseq diffs 0 (min 3 (length diffs))))
                          (list code (length diffs) diffs)))
      (format stream "~&;; sweep ~d-~d: ~d calendars; ~d days keep several names in ~d calendars; ~
year models ~,1f s (logic) vs ~,1f s (engine, 3 maps per year)~%"
              y0 y1 (length pairs) multi multi-cals t-new t-old))))

(deftest sweep-all-registered-1990-2050
  ;; Every registered RULE-CALENDAR (228 on 0.4.1), 1990-2050. Measured: the
  ;; only day where holiday or business status differs is RU 1994-05-03
  ;; (#27, prototype right). Several minutes; opt-in.
  (if (uiop:getenv "CAL_LOGIC_SWEEP")
      (ok (equal (mapcar (lambda (r) (list (first r) (third r))) (sweep-registered 1990 2050))
                 '(("RU" (("1994-05-03" nil ("Праздник Весны и Труда") t nil))))))
      (skip "set CAL_LOGIC_SWEEP=1 for the 1990-2050 sweep of every registered calendar")))
