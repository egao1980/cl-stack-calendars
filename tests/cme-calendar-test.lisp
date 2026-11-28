(in-package #:cl-stack-calendars/tests)

;;;; CME Group (#48): product groups, no-settlement Globex holidays, and every
;;;; day of CME's own 2009-2022 Globex holiday schedules
;;;; (data/tests/exchanges/CME-notices.sexp, extracted from the schedules;
;;;; each row cites its Wayback copy).

(defparameter *cme-group-exchanges*
  '((:equity "XCME" nil) (:interest-rate "XCME" :interest-rate) (:fx "XCME" :fx)
    (:energy "XNYM" nil) (:metals "XCEC" nil) (:grains "XCBT" nil))
  "Schedule group → (MIC PRODUCT-GROUP) whose model the row is checked on.")

(defun load-cme-notices ()
  (read-data-form (data-path "tests/exchanges/CME-notices.sexp")))

(defun %cme-row-exchange (row)
  (destructuring-bind (mic group) (cdr (assoc (getf row :group) *cme-group-exchanges*))
    (find-exchange mic :product-group group)))

(defun %cme-row-problem (row)
  "NIL when the model agrees with schedule ROW, else a short description.
A :HALT row whose trade date is the day itself (the Good Friday 2021
abbreviated equity session: traded for that date, not settled) checks only
the missing settlement: EXCHANGE-TRADE-DATE gives the next settlement day."
  (let* ((ex (%cme-row-exchange row))
         (date (apply #'make-date (getf row :date)))
         (segs (exchange-sessions-for-date ex date))
         (status (getf row :status))
         (close (and segs (%hm (exchange-session-spec-close (car (last segs))))))
         (open (and segs (%hm (exchange-session-spec-open (first segs)))))
         (settles (exchange-settlement-day-p ex date))
         (trade-date (exchange-trade-date ex date))
         (row-trade-date (getf row :trade-date)))
    (flet ((want (test what) (unless test (return-from %cme-row-problem what))))
      (case status
        (:closed (want (null segs) "trades"))
        (t
         (want segs "closed")
         (when (getf row :time) (want (equal close (getf row :time)) (format nil "close ~a" close)))
         (when (getf row :open) (want (equal open (getf row :open)) (format nil "open ~a" open)))
         (if (eq status :halt)
             (progn (want (not settles) "settles")
               (when (and row-trade-date (> (apply #'make-date row-trade-date) date))
                 (want (equal (%date-key trade-date) row-trade-date)
                       (format nil "trade date ~a" (%date-key trade-date)))))
             (want settles "no settlement"))))
      nil)))

(deftest cme-schedules-day-by-day
  "Every row of CME's Globex holiday schedules 2009-2022 (status, close, open,
settlement and trade date per product group)."
  (let* ((rows (load-cme-notices))
         (bad (loop for row in rows
                    for problem = (%cme-row-problem row)
                    when problem collect (list row problem))))
    (ok (> (length rows) 2000) "schedule rows loaded")
    (loop for (row problem) in bad
          repeat 15
          do (ok nil (format nil "~a ~(~a~) ~(~a~) ~a: ~a" (getf row :date) (getf row :group)
                             (getf row :status) (getf row :time) problem)))
    (ok (null bad) (format nil "~d of ~d schedule rows differ" (length bad) (length rows)))))

(deftest cme-product-groups
  "Product groups of the CME family MICs (EXCHANGE-PRODUCT-GROUPS, :PRODUCT-GROUP)."
  (ok (equal (exchange-product-groups "XCME") '(:equity :interest-rate :fx)))
  (ok (equal (exchange-product-groups "XCBT") '(:grains :interest-rate :equity)))
  (ok (equal (exchange-product-groups "XNYM") '(:energy)))
  (ok (null (exchange-product-groups "XNYS")) "a MIC with one schedule has no groups")
  (ok (eq (exchange-hours-product-group (find-exchange "XCBT")) :grains))
  (ok (eq (exchange-hours-product-group (find-exchange "XCME" :product-group :fx)) :fx))
  (ok (string= (exchange-hours-calendar-name (find-exchange "XCBT" :product-group :interest-rate))
               "CME-INTEREST-RATE"))
  (ok (signals (find-exchange "XNYM" :product-group :equity) 'exchange-product-group-not-found))
  (ok (eq (exchange-hours-product-group
           (handler-bind ((exchange-product-group-not-found
                            (lambda (c) (declare (ignore c)) (invoke-restart 'use-value nil))))
             (find-exchange "XNYM" :product-group :equity)))
          :energy)
      "USE-VALUE NIL falls back to the headline group")
  ;; The same EXCHANGE answers for another group through :PRODUCT-GROUP.
  (let ((ex (find-exchange "XCBT"))
        (mlk (make-date 2024 1 15)))
    (ng (exchange-trading-day-p ex mlk) "grains closed on MLK Day")
    (ok (exchange-trading-day-p ex mlk :product-group :interest-rate))
    (ok (equal (%hm (exchange-early-close ex mlk :product-group :interest-rate)) '(12 0)))))

(deftest cme-no-settlement-holidays
  "Globex trades on a no-settlement holiday, halts early, and its trades are
for the next trade date; full closures have no session."
  (let ((xcme (find-exchange "XCME"))
        (mlk (make-date 2024 1 15)))
    (ok (exchange-trading-day-p xcme mlk))
    (ok (exchange-no-settlement-p xcme mlk))
    (ng (exchange-settlement-day-p xcme mlk))
    (ok (= (exchange-trade-date xcme mlk) (make-date 2024 1 16)))
    (ok (= (exchange-trade-date xcme (make-date 2024 1 16)) (make-date 2024 1 16)))
    (ok (null (exchange-trade-date xcme (make-date 2024 1 13))) "Saturday: no trading")
    (ok (equal (%hm (exchange-early-close xcme mlk)) '(12 0)))
    (ng (exchange-trading-day-p xcme (make-date 2024 12 25)) "Christmas closed")
    (ng (exchange-trading-day-p xcme (make-date 2024 3 29)) "Good Friday 2024 closed")
    ;; Good Friday with the employment report: equity trades without a
    ;; settlement, interest-rate products settle (CME Clearing 2021 advisory).
    (ok (exchange-trading-day-p xcme (make-date 2021 4 2)))
    (ng (exchange-settlement-day-p xcme (make-date 2021 4 2)))
    (ok (exchange-settlement-day-p xcme (make-date 2021 4 2) :product-group :interest-rate))
    (ok (equal (%hm (exchange-early-close xcme (make-date 2021 4 2) :product-group :fx)) '(10 15))))
  ;; Energy halts at 13:30 on the 2022 holidays; FX trades to its 16:00 close.
  (ok (equal (%hm (exchange-early-close (find-exchange "XNYM") (make-date 2022 7 4))) '(13 30)))
  (ok (null (exchange-early-close (find-exchange "XCME") (make-date 2022 7 4) :product-group :fx)))
  (ng (exchange-settlement-day-p (find-exchange "XCME") (make-date 2022 7 4) :product-group :fx))
  ;; Grains: closed on Thanksgiving, the Friday opens 08:30 with no night session.
  (ok (equal (%session-hms "XCBT" (make-date 2022 11 25)) '(((8 30) (12 5)))))
  (ok (equal (%session-hms "XCBT" (make-date 2024 11 29)) '(((8 30) (12 5)))))
  ;; Columbus Day trades and settles; a MIC without no-settlement days settles
  ;; on every trading day.
  (ok (exchange-settlement-day-p (find-exchange "XCME") (make-date 2024 10 14)))
  (ok (exchange-settlement-day-p (find-exchange "XNYS") (make-date 2024 7 3)))
  (ok (= (exchange-trade-date (find-exchange "XNYS") (make-date 2024 7 3)) (make-date 2024 7 3)))
  ;; MIC-taking functions accept :PRODUCT-GROUP too.
  (ok (= (duration-seconds (exchange-session-duration "XCBT" (make-date 2024 6 4)
                                                      :product-group :interest-rate))
         (* 23 3600))))
