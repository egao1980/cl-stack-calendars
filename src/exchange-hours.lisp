(in-package #:cl-stack-calendars)

;;;; Major-exchange business hours — versioned eras + early closes.
;;;;
;;;; Data: data/exchanges/<MIC>.sexp
;;;;   (:mic "XNYS" :name "…" :zone "America/New_York" :calendar "USFED"
;;;;    :kind :equity   ; or :commodities
;;;;    :weekend (6 7)  ; ISO dow; Fri–Sat markets use (5 6)
;;;;    :eras ((:from (Y M D) :to (Y M D)
;;;;            :sessions ((:open (H M) :close (H M) :overnight t :labeled-by :close) …)
;;;;            :friday (…) :saturday (…) :weekend (7) :authority "…") …)
;;;;    :early-close-rules ((:kind :black-friday :from … :close (13 0) :authority "…") …)
;;;;    :early-closes (((Y M D) (H M) "note") …))
;;;;
;;;; Regular hours are exchange-rule eras (not TZ — TZ is resolved per
;;;; boundary via TRADING-SESSION). Early closes override the last segment.
;;;; Overnight segments use TRADING-SESSION :OVERNIGHT / :LABELED-BY.

(defvar *exchange-hours-cache* (make-hash-table :test #'equal)
  "MIC → EXCHANGE-HOURS.")

(defstruct (exchange-session-spec (:constructor %make-exchange-session-spec))
  (open nil :type time-of-day)
  (close nil :type time-of-day)
  (overnight nil)
  (labeled-by :open))

(defstruct (exchange-era (:constructor %make-exchange-era))
  from to sessions friday saturday weekend authority)

(defstruct (exchange-early-close-rule (:constructor %make-exchange-early-close-rule))
  kind from to close authority)

(defstruct (exchange-hours (:constructor %make-exchange-hours))
  mic name zone calendar-name kind weekend eras early-close-rules early-closes
  source)

(defun %ymd->date (ymd)
  (when ymd
    (destructuring-bind (y m d) ymd
      (make-date y m d))))

(defun %tod-list (tod)
  (etypecase tod
    (time-of-day tod)
    (cons (apply #'make-time-of-day tod))))

(defun %parse-session-specs (sessions)
  (mapcar (lambda (s)
            (%make-exchange-session-spec
             :open (%tod-list (getf s :open))
             :close (%tod-list (getf s :close))
             :overnight (getf s :overnight)
             :labeled-by (or (getf s :labeled-by)
                             (if (getf s :overnight) :close :open))))
          sessions))

(defun %parse-era (plist)
  (%make-exchange-era
   :from (%ymd->date (getf plist :from))
   :to (%ymd->date (getf plist :to))
   :sessions (%parse-session-specs (getf plist :sessions))
   :friday (let ((fri (getf plist :friday)))
             (when fri (%parse-session-specs fri)))
   :saturday (let ((sat (getf plist :saturday)))
               (when sat (%parse-session-specs sat)))
   :weekend (getf plist :weekend)
   :authority (getf plist :authority)))

(defun %parse-early-rule (plist)
  (%make-exchange-early-close-rule
   :kind (getf plist :kind)
   :from (%ymd->date (getf plist :from))
   :to (%ymd->date (getf plist :to))
   :close (%tod-list (getf plist :close))
   :authority (getf plist :authority)))

(defun %parse-early-closes (rows)
  (mapcar (lambda (row)
            (destructuring-bind (ymd tod &optional note) row
              (list (%ymd->date ymd) (%tod-list tod) note)))
          rows))

(defun load-exchange-hours-plist (plist)
  (%make-exchange-hours
   :mic (string-upcase (getf plist :mic))
   :name (getf plist :name)
   :zone (getf plist :zone)
   :calendar-name (getf plist :calendar)
   :kind (or (getf plist :kind) :equity)
   :weekend (or (getf plist :weekend) '(6 7))
   :eras (mapcar #'%parse-era (getf plist :eras))
   :early-close-rules (mapcar #'%parse-early-rule (getf plist :early-close-rules))
   :early-closes (%parse-early-closes (getf plist :early-closes))
   :source (getf plist :source)))

(defun load-exchange-hours-file (path)
  (load-exchange-hours-plist (read-data-form path)))

(defun %exchange-data-path (mic)
  (sp:join (exchanges-data-directory)
           (format nil "~a.sexp" (string-upcase mic))))

(defun list-exchange-hours-files ()
  (sp:glob (exchanges-data-directory) "*.sexp"))

(defun load-all-exchange-hours (&optional (force nil))
  "Load every data/exchanges/*.sexp into *EXCHANGE-HOURS-CACHE*."
  (when (or force (zerop (hash-table-count *exchange-hours-cache*)))
    (clrhash *exchange-hours-cache*)
    (dolist (path (list-exchange-hours-files))
      (let ((ex (load-exchange-hours-file path)))
        (setf (gethash (exchange-hours-mic ex) *exchange-hours-cache*) ex))))
  *exchange-hours-cache*)

(defun find-exchange (mic &key (errorp t))
  "Look up EXCHANGE-HOURS by ISO 10383 MIC (e.g. \"XNYS\")."
  (load-all-exchange-hours)
  (let ((ex (gethash (string-upcase mic) *exchange-hours-cache*)))
    (cond (ex ex)
          (errorp (error 'calendar-not-found :calendar-name (string-upcase mic)
                         :message (format nil "no exchange hours for MIC ~s" mic)))
          (t nil))))

(defun list-exchanges ()
  (load-all-exchange-hours)
  (sort (loop for mic being the hash-keys of *exchange-hours-cache*
              collect mic)
        #'string<))

(defun %era-covers-p (era date)
  (and (or (null (exchange-era-from era)) (<= (exchange-era-from era) date))
       (or (null (exchange-era-to era)) (<= date (exchange-era-to era)))))

(defun exchange-era-for-date (exchange date)
  (or (find-if (lambda (era) (%era-covers-p era date))
               (exchange-hours-eras exchange))
      (error 'calendar-error
             :message (format nil "~a has no hours era covering ~a"
                              (exchange-hours-mic exchange) date))))

(defun %thanksgiving-date (year)
  "US Thanksgiving — fourth Thursday in November."
  (loop for d from 22 to 28
        for date = (make-date year 11 d)
        when (= (date-day-of-week date) 4)
          return date))

(defun %rule-in-window-p (rule date)
  (and (or (null (exchange-early-close-rule-from rule))
           (<= (exchange-early-close-rule-from rule) date))
       (or (null (exchange-early-close-rule-to rule))
           (<= date (exchange-early-close-rule-to rule)))))

(defun %weekday-p (date)
  (<= 1 (date-day-of-week date) 5))

(defun %early-close-from-rule (rule date)
  (when (%rule-in-window-p rule date)
    (ecase (exchange-early-close-rule-kind rule)
      (:black-friday
       (when (= date (+ (%thanksgiving-date (date-year date)) 1))
         (exchange-early-close-rule-close rule)))
      (:christmas-eve-weekday
       (when (and (= (date-month date) 12) (= (date-day date) 24)
                  (%weekday-p date))
         (exchange-early-close-rule-close rule)))
      (:new-years-eve-weekday
       (when (and (= (date-month date) 12) (= (date-day date) 31)
                  (%weekday-p date))
         (exchange-early-close-rule-close rule)))
      (:new-years-eve-or-preceding-friday
       (let ((nye (make-date (date-year date) 12 31)))
         (when (= date (if (%weekday-p nye) nye
                           (loop for d = nye then (- d 1)
                                 when (= (date-day-of-week d) 5) return d)))
           (exchange-early-close-rule-close rule))))
      (:christmas-eve-or-preceding-friday
       (let ((eve (make-date (date-year date) 12 24)))
         (when (= date (if (%weekday-p eve) eve
                           (loop for d = eve then (- d 1)
                                 when (= (date-day-of-week d) 5) return d)))
           (exchange-early-close-rule-close rule))))
      (:july-3-mon-tue-thu
       (when (and (= (date-month date) 7) (= (date-day date) 3)
                  (member (date-day-of-week date) '(1 2 4)))
         (exchange-early-close-rule-close rule)))
      (:july-5-friday
       (when (and (= (date-month date) 7) (= (date-day date) 5)
                  (= (date-day-of-week date) 5))
         (exchange-early-close-rule-close rule)))
      (:hk-half-day-eves
       ;; Christmas / NY / Lunar NY eve — morning only. Lunar NY is adhoc.
       (when (or (and (= (date-month date) 12) (= (date-day date) 24)
                      (%weekday-p date))
                 (and (= (date-month date) 12) (= (date-day date) 31)
                      (%weekday-p date)))
         (exchange-early-close-rule-close rule))))))

(defun exchange-early-close (exchange date)
  "TIME-OF-DAY early close on DATE, or NIL.
Second value is the note / rule authority when an early close applies.
Adhoc rows are (DATE TOD NOTE); TOD is the close, not the note."
  (let ((row (find date (exchange-hours-early-closes exchange)
                   :key #'first :test #'=)))
    (when row
      (return-from exchange-early-close
        (values (second row) (or (third row) "adhoc early close")))))
  (loop for rule in (exchange-hours-early-close-rules exchange)
        for tod = (%early-close-from-rule rule date)
        when tod
          return (values tod (exchange-early-close-rule-authority rule))))

(defun %apply-early-close (sessions early)
  "Drop/shorten same-day segments so the last remaining close is EARLY.
Overnight legs (open wall-clock after close) are kept; their close TOD is
shortened when EARLY is before that close on the label date."
  (if (null early)
      sessions
      (let ((out '()))
        (dolist (seg sessions)
          (cond
            ((exchange-session-spec-overnight seg)
             (push (if (< early (exchange-session-spec-close seg))
                       (%make-exchange-session-spec
                        :open (exchange-session-spec-open seg)
                        :close early
                        :overnight t
                        :labeled-by (exchange-session-spec-labeled-by seg))
                       seg)
                   out))
            ((< (exchange-session-spec-close seg) early)
             (push seg out))
            ((< (exchange-session-spec-open seg) early)
             (push (%make-exchange-session-spec
                    :open (exchange-session-spec-open seg)
                    :close early
                    :overnight nil
                    :labeled-by (exchange-session-spec-labeled-by seg))
                   out)
             (return))
            (t (return))))
        (or (nreverse out)
            (error 'calendar-error
                   :message (format nil "early close ~a precedes all session opens"
                                    early))))))

(defun exchange-sessions-for-date (exchange date)
  "List of EXCHANGE-SESSION-SPEC for DATE (after early-close overlay)."
  (let* ((era (exchange-era-for-date exchange date))
         (dow (date-day-of-week date))
         (weekend (or (exchange-era-weekend era)
                      (exchange-hours-weekend exchange)))
         (friday (exchange-era-friday era))
         (saturday (exchange-era-saturday era)))
    (cond
      ((and (= dow 5) friday)
       (%apply-early-close friday (exchange-early-close exchange date)))
      ((and (= dow 6) saturday)
       (%apply-early-close saturday (exchange-early-close exchange date)))
      ((member dow weekend)
       nil)
      (t
       (%apply-early-close (exchange-era-sessions era)
                           (exchange-early-close exchange date))))))

(defun exchange-calendar (exchange)
  (let ((name (exchange-hours-calendar-name exchange)))
    (when name (find-calendar name :errorp nil))))

(defun exchange-trading-day-p (exchange date)
  "True if DATE has at least one cash-session segment."
  (and (exchange-sessions-for-date exchange date) t))

(defun make-exchange-session (mic &key date calendar)
  "TRADING-SESSION spanning first open → last close of MIC on DATE
(defaults to today). Lunch-break interiors are still 'open' at the
composite level — use EXCHANGE-SESSION-BOUNDS / EXCHANGE-OPEN-P for
segment-accurate queries."
  (let* ((ex (find-exchange mic))
         (d (or date (today)))
         (segs (or (exchange-sessions-for-date ex d)
                   (error 'calendar-error
                          :message (format nil "~a is not a trading day for ~a"
                                           d (exchange-hours-mic ex))))))
    (let ((first (first segs))
          (last (car (last segs))))
      (make-trading-session
       :name (format nil "~a-~a" (exchange-hours-mic ex) d)
       :zone (exchange-hours-zone ex)
       :open (exchange-session-spec-open first)
       :close (exchange-session-spec-close last)
       :overnight (or (exchange-session-spec-overnight first)
                      (exchange-session-spec-overnight last))
       :labeled-by (exchange-session-spec-labeled-by first)
       :calendar (or calendar (exchange-calendar ex))))))

(defun exchange-session-bounds (mic date)
  "Return (values FIRST-OPEN LAST-CLOSE) instants for MIC on DATE.
Also returns the list of per-segment (open close) instant pairs as the
third value."
  (let* ((ex (find-exchange mic))
         (cal (exchange-calendar ex))
         (segs (exchange-sessions-for-date ex date)))
    (unless segs
      (error 'calendar-error
             :message (format nil "~a is not a trading day for ~a"
                              date (exchange-hours-mic ex))))
    ;; Hours encode the trading week (incl. Sun–Thu / historical Saturday).
    ;; The civil calendar overlay only blocks holidays, not weekend-day-p.
    (when (and cal (holiday-p cal date))
      (error 'calendar-error
             :message (format nil "~a is a holiday for ~a calendar"
                              date (exchange-hours-calendar-name ex))))
    (let ((pairs
           (mapcar (lambda (seg)
                     (let ((s (make-trading-session
                               :name (exchange-hours-mic ex)
                               :zone (exchange-hours-zone ex)
                               :open (exchange-session-spec-open seg)
                               :close (exchange-session-spec-close seg)
                               :overnight (exchange-session-spec-overnight seg)
                               :labeled-by (exchange-session-spec-labeled-by seg))))
                       (multiple-value-list (session-bounds s date))))
                   segs)))
      (values (first (first pairs))
              (second (car (last pairs)))
              pairs))))

(defun %open-on-date-p (mic instant date)
  (handler-case
      (multiple-value-bind (_ __ pairs) (exchange-session-bounds mic date)
        (declare (ignore _ __))
        (some (lambda (pair)
                (destructuring-bind (open close) pair
                  (and (<= open instant) (< instant close))))
              pairs))
    (calendar-error () nil)))

(defun exchange-open-p (mic instant &key (date nil datep))
  "True if INSTANT falls in any session segment of MIC.
Without :DATE, search local-date ± 1 so overnight Globex/SHFE legs
that start on the previous calendar day still match."
  (if datep
      (%open-on-date-p mic instant date)
      (let* ((ex (find-exchange mic))
             (local (zoned-moment-date
                     (instant-in-zone instant
                                      (resolve-zone-id (exchange-hours-zone ex))))))
        (or (%open-on-date-p mic instant local)
            (%open-on-date-p mic instant (- local 1))
            (%open-on-date-p mic instant (+ local 1))))))

(defun exchange-session-duration (mic date)
  "Absolute duration of all cash-session segments on DATE (lunch excluded)."
  (multiple-value-bind (_ __ pairs) (exchange-session-bounds mic date)
    (declare (ignore _ __))
    (reduce #'+ pairs :key (lambda (p) (- (second p) (first p)))
            :initial-value (make-duration 0))))
