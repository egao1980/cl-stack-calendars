(in-package #:cl-stack-calendars)

;;;; Trading / business hours.
;;;;
;;;; A TRADING-SESSION is a wall-clock interval in a named (or fixed-offset)
;;;; zone, evaluated against a HOLIDAY-CALENDAR for which dates are trading
;;;; days. Absolute open/close INSTANTs are produced by resolving each wall
;;;; time independently through datetime-protocol:MOMENT-IN-ZONE — so DST
;;;; transitions and historical zone-definition changes mid-session are
;;;; handled correctly:
;;;;
;;;;   * Spring-forward gap at the open  → :ON-GAP (:later|:earlier|:error)
;;;;   * Fall-back overlap at a boundary → :ON-OVERLAP
;;;;   * Political offset change between open and close → each endpoint uses
;;;;     the TZif transition table at *that* wall time, not "today's" offset
;;;;   * Overnight sessions (close wall-clock ≤ open, or :OVERNIGHT T) span
;;;;     two calendar dates; label convention is :LABELED-BY :OPEN or :CLOSE
;;;;
;;;; Pin :TZ-REPOSITORY (or construct the zone against a specific
;;;; cl-stack-tzdata repository) when reconstructing "was the market open at
;;;; T as of booking-time B" — zone *definition* revisions are versioned the
;;;; same way holiday calendars are.

(define-condition session-boundary-error (calendar-error)
  ((session :initarg :session :reader session-boundary-error-session)
   (date :initarg :date :reader session-boundary-error-date)
   (boundary :initarg :boundary :reader session-boundary-error-boundary))
  (:documentation "Signaled when a session open/close wall time cannot be
resolved under the configured gap/overlap policy.")
  (:report (lambda (c s)
             (format s "~a (~a on ~a)"
                     (or (calendar-error-message c) "session boundary error")
                     (session-boundary-error-boundary c)
                     (session-boundary-error-date c)))))

(defclass trading-session ()
  ((name :initarg :name :initform nil :reader trading-session-name)
   (zone :initarg :zone :reader trading-session-zone
         :documentation "A ZONE-ID (named-zone or fixed-offset-zone).")
   (open-tod :initarg :open :reader trading-session-open
             :documentation "Wall-clock TIME-OF-DAY for the session open.")
   (close-tod :initarg :close :reader trading-session-close
              :documentation "Wall-clock TIME-OF-DAY for the session close.")
   (overnight-p :initarg :overnight :initform :auto
                :reader trading-session-overnight-p
                :documentation "T force overnight; NIL force same-day; :AUTO
infer (overnight when close TOD ≤ open TOD).")
   (labeled-by :initarg :labeled-by :initform :open
               :reader trading-session-labeled-by
               :documentation ":OPEN or :CLOSE — which calendar date names
the trading day for overnight sessions.")
   (on-gap :initarg :on-gap :initform :later
           :reader trading-session-on-gap)
   (on-overlap :initarg :on-overlap :initform :earlier
               :reader trading-session-on-overlap)
   (calendar :initarg :calendar :initform nil
             :reader trading-session-calendar
             :documentation "Optional HOLIDAY-CALENDAR; when set,
SESSION-BOUNDS / SESSION-OPEN-P refuse non-business days."))
  (:documentation "Wall-clock trading hours in a zone, with explicit DST
gap/overlap policy and optional holiday calendar."))

(defun trading-session-p (x) (typep x 'trading-session))

(defun make-trading-session (&key name zone open close
                               (overnight :auto)
                               (labeled-by :open)
                               (on-gap :later)
                               (on-overlap :earlier)
                               calendar)
  "Build a TRADING-SESSION. ZONE may be a ZONE-ID, a zone-id string, or an
integer offset in seconds (fixed). OPEN/CLOSE are TIME-OF-DAY values or
(hour [minute [second [nano]]]) lists."
  (make-instance 'trading-session
                 :name name
                 :zone (%coerce-session-zone zone)
                 :open (%coerce-tod open)
                 :close (%coerce-tod close)
                 :overnight overnight
                 :labeled-by labeled-by
                 :on-gap on-gap
                 :on-overlap on-overlap
                 :calendar calendar))

(defun %coerce-tod (x)
  (cond ((time-of-day-p x) x)
        ((and (consp x) (integerp (first x)))
         (apply #'make-time-of-day x))
        ((integerp x) (make-time-of-day x))
        (t (error 'calendar-error
                  :message (format nil "not a time-of-day: ~s" x)))))

(defun %coerce-session-zone (zone)
  (cond ((zone-id-p zone) zone)
        ((stringp zone) (resolve-zone-id zone))
        ((integerp zone) (make-fixed-offset-zone zone))
        (t (error 'calendar-error
                  :message (format nil "not a zone: ~s" zone)))))

(defun %session-overnight-p (session)
  (let ((flag (trading-session-overnight-p session)))
    (ecase flag
      ((t) t)
      ((nil) nil)
      (:auto (<= (trading-session-close session) (trading-session-open session))))))

(defun %resolve-boundary (session date tod boundary)
  "Resolve DATE+TOD in SESSION's zone to an INSTANT.
   Each boundary is resolved independently against historical zone rules at
   that wall time — never by applying a single 'session day offset'."
  (handler-case
      (let* ((moment (make-moment date tod))
             (zm (moment-in-zone moment (trading-session-zone session)
                                 :on-gap (trading-session-on-gap session)
                                 :on-overlap (trading-session-on-overlap session))))
        (zoned-moment-to-instant zm))
    (nonexistent-local-time (c)
      (error 'session-boundary-error
             :session session :date date :boundary boundary
             :message (format nil "nonexistent local time at ~a: ~a" boundary c)))
    (ambiguous-local-time (c)
      (error 'session-boundary-error
             :session session :date date :boundary boundary
             :message (format nil "ambiguous local time at ~a: ~a" boundary c)))))

(defgeneric session-bounds (session date)
  (:documentation "Return (values OPEN-INSTANT CLOSE-INSTANT) for the trading
day labeled DATE. OPEN/CLOSE are absolute instants; their wall-clock offsets
may differ when a DST or zone-definition transition falls inside the session.
Signals SESSION-BOUNDARY-ERROR when a boundary cannot be resolved, or
CALENDAR-ERROR when SESSION has a calendar and DATE is not a business day."))

(defmethod session-bounds ((session trading-session) date)
  (let ((cal (trading-session-calendar session)))
    (when (and cal (not (business-day-p cal date)))
      (error 'calendar-error
             :message (format nil "~a is not a trading day for ~a"
                              date (or (trading-session-name session)
                                       (calendar-name cal))))))
  (let* ((overnight (%session-overnight-p session))
         (open-date (ecase (trading-session-labeled-by session)
                      (:open date)
                      (:close (if overnight (- date 1) date))))
         (close-date (ecase (trading-session-labeled-by session)
                       (:open (if overnight (+ date 1) date))
                       (:close date)))
         (open-i (%resolve-boundary session open-date
                                    (trading-session-open session) :open))
         (close-i (%resolve-boundary session close-date
                                     (trading-session-close session) :close)))
    (unless (< open-i close-i)
      (error 'calendar-error
             :message (format nil "session ~s on ~a has non-positive duration (~a .. ~a)"
                              (trading-session-name session) date open-i close-i)))
    (values open-i close-i)))

(defgeneric session-open-p (session instant &key date)
  (:documentation "True if INSTANT lies in the half-open interval [open, close)
of the session for DATE (default: the trading day containing INSTANT)."))

(defmethod session-open-p ((session trading-session) instant &key (date nil datep))
  (let ((d (if datep date (trading-day session instant))))
    (when d
      (handler-case
          (multiple-value-bind (open close) (session-bounds session d)
            (and (<= open instant) (< instant close)))
        (calendar-error () nil)))))

(defgeneric trading-day (session instant)
  (:documentation "The calendar DATE that labels the trading day containing
INSTANT under SESSION's :LABELED-BY convention, or NIL if INSTANT falls in no
session window within a small search (±1 day around the local date in the
session zone)."))

(defmethod trading-day ((session trading-session) instant)
  (let* ((local (instant-in-zone instant (trading-session-zone session)))
         (local-date (zoned-moment-date local))
         ;; Candidate labels: local date and neighbours cover overnight wrap.
         (candidates (list (- local-date 1) local-date (+ local-date 1))))
    (dolist (d candidates)
      (handler-case
          (multiple-value-bind (open close) (session-bounds session d)
            (when (and (<= open instant) (< instant close))
              (return-from trading-day d)))
        (calendar-error ())))
    nil))

(defgeneric next-session-open (session instant)
  (:documentation "The open INSTANT of the next session strictly after INSTANT."))

(defmethod next-session-open ((session trading-session) instant)
  (let* ((local (instant-in-zone instant (trading-session-zone session)))
         (d (zoned-moment-date local)))
    (loop for i from 0 below 400
          for date = (+ d i)
          do (handler-case
                 (multiple-value-bind (open _) (session-bounds session date)
                   (declare (ignore _))
                   (when (> open instant)
                     (return-from next-session-open open)))
               (calendar-error ())))
    (error 'calendar-error
           :message (format nil "no session open after ~a for ~s"
                            instant (trading-session-name session)))))

(defgeneric session-duration (session date)
  (:documentation "DURATION of the session on DATE (absolute time, not wall
clock). Differs from wall-clock span on DST transition days."))

(defmethod session-duration ((session trading-session) date)
  (multiple-value-bind (open close) (session-bounds session date)
    (- close open)))
