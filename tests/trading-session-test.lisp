(in-package #:cl-stack-calendars/tests)

;;;; Trading hours: each boundary is resolved independently against historical
;;;; zone rules, so DST transition days change absolute session length.

(deftest nyse-rth-normal-day
  (let* ((cal (us-federal-holidays-calendar))
         (session (make-trading-session
                   :name "NYSE-RTH"
                   :zone "America/New_York"
                   :open '(9 30)
                   :close '(16 0)
                   :calendar cal))
         (date (make-date 2024 6 3))) ; Monday, no holiday
    (multiple-value-bind (open close) (session-bounds session date)
      (ok (instantp open))
      (ok (instantp close))
      (ok (< open close))
      ;; 6.5 trading hours = 23400 seconds on a non-DST-transition day
      (ok (= (duration-seconds (session-duration session date)) 23400))
      (ok (session-open-p session open :date date))
      (ng (session-open-p session close :date date)) ; half-open
      (ok (= (trading-day session open) date)))))

(deftest nyse-rth-dst-spring-forward
  ;; 2024-03-10 America/New_York: clocks jump 02:00 → 03:00.
  ;; RTH 09:30–16:00 still 6.5 wall hours, but absolute duration is still
  ;; 23400s because both bounds are after the gap. Pick a session that
  ;; *contains* the gap to see length change: overnight Globex-style.
  (let* ((session (make-trading-session
                   :name "overnight-across-spring-forward"
                   :zone "America/New_York"
                   :open '(1 0)
                   :close '(4 0)
                   :overnight nil))
         (date (make-date 2024 3 10)))
    (multiple-value-bind (open close) (session-bounds session date)
      (let ((secs (duration-seconds (session-duration session date))))
        ;; Wall clock says 3 hours; spring-forward removes 1 hour → 2h absolute.
        (ok (= secs 7200))
        (ok (< open close))))))

(deftest nyse-rth-dst-fall-back
  ;; 2024-11-03 America/New_York: 01:00–02:00 repeats.
  (let* ((session (make-trading-session
                   :name "overnight-across-fall-back"
                   :zone "America/New_York"
                   :open '(0 30)
                   :close '(3 0)
                   :overnight nil
                   :on-overlap :earlier))
         (date (make-date 2024 11 3)))
    (multiple-value-bind (open close) (session-bounds session date)
      (let ((secs (duration-seconds (session-duration session date))))
        ;; Wall 2.5h; fall-back adds 1h → 3.5h = 12600s
        (ok (= secs 12600))
        (ok (< open close))))))

(deftest holiday-blocks-session
  (let* ((cal (us-federal-holidays-calendar))
         (session (make-trading-session
                   :name "NYSE-RTH"
                   :zone "America/New_York"
                   :open '(9 30)
                   :close '(16 0)
                   :calendar cal)))
    (ok (signals (session-bounds session (make-date 2024 7 4))
                 'calendar-error))))

(deftest overnight-labeled-by-open
  (let* ((session (make-trading-session
                   :name "CME"
                   :zone "America/Chicago"
                   :open '(17 0)
                   :close '(16 0)
                   :overnight t
                   :labeled-by :open))
         (date (make-date 2024 6 3)))
    (multiple-value-bind (open close) (session-bounds session date)
      (let* ((open-local (instant-in-zone open (resolve-zone-id "America/Chicago")))
             (close-local (instant-in-zone close (resolve-zone-id "America/Chicago"))))
        (ok (= (zoned-moment-date open-local) date))
        (ok (= (zoned-moment-date close-local) (+ date 1)))
        (ok (= (trading-day session open) date))))))

(deftest historical-offset-independence
  ;; Endpoints must not share a single offset: verify open and close
  ;; zoned-moments can carry different offsets on a DST transition day.
  (let* ((session (make-trading-session
                   :name "cross-dst"
                   :zone "America/New_York"
                   :open '(1 0)
                   :close '(4 0)))
         (date (make-date 2024 3 10))
         (open-i (session-bounds session date))
         (close-i (nth-value 1 (session-bounds session date)))
         (oz (instant-in-zone open-i (resolve-zone-id "America/New_York")))
         (cz (instant-in-zone close-i (resolve-zone-id "America/New_York"))))
    (ok (/= (zoned-moment-offset-seconds oz) (zoned-moment-offset-seconds cz)))
    (ok (= (zoned-moment-offset-seconds oz) -18000))  ; EST
    (ok (= (zoned-moment-offset-seconds cz) -14400)))) ; EDT
