(in-package #:cl-stack-calendars)

;;;; Major-exchange business hours — versioned eras + early closes.
;;;;
;;;; Data: data/exchanges/<MIC>.sexp
;;;;   (:mic "XNYS" :name "…" :zone "America/New_York" :calendar "USFED"
;;;;    :kind :equity   ; or :commodities
;;;;    :weekend (6 7)  ; ISO dow; Fri–Sat markets use (5 6)
;;;;    :eras ((:from (Y M D) :to (Y M D)
;;;;            :sessions ((:open (H M) :close (H M) :overnight t :labeled-by :close) …)
;;;;            :friday (…) :saturday (…) :sunday (…)   ; one weekday's own sessions
;;;;            :days ((ISO-WEEKDAY (:open (H M) :close (H M)) …) …) ; same, any weekday
;;;;            :weekend (7) :authority "…") …)
;;;;    :early-close-rules ((:kind :black-friday :from … :close (13 0) :authority "…") …)
;;;;    :early-closes (((Y M D) (H M) "note") …))
;;;;
;;;; Regular hours are exchange-rule eras (not TZ — TZ is resolved per
;;;; boundary via TRADING-SESSION). A notice of the exchange calendar can give
;;;; one day its own hours (:SESSIONS), open a weekend day with the era's
;;;; weekday hours (:OPEN), or hold special sessions apart from regular trading
;;;; (:SPECIAL-SESSIONS, EXCHANGE-SPECIAL-SESSIONS-FOR-DATE). Early closes
;;;; override the last segment. Overnight segments use TRADING-SESSION
;;;; :OVERNIGHT / :LABELED-BY.

(defvar *exchange-hours-cache*
  #+sbcl (make-hash-table :test #'equal :synchronized t)
  #-sbcl (make-hash-table :test #'equal)
  "MIC → EXCHANGE-HOURS. Synchronized for concurrent first use.")

(defstruct (exchange-session-spec (:constructor %make-exchange-session-spec))
  (open nil :type time-of-day)
  (close nil :type time-of-day)
  (overnight nil)
  (labeled-by :open))

(defstruct (exchange-era (:constructor %make-exchange-era))
  from to sessions friday saturday weekend authority
  ;; ((ISO-WEEKDAY . SESSION-SPECS) …): sessions of one weekday that differ
  ;; from :SESSIONS (:FRIDAY, :SATURDAY, :SUNDAY and :DAYS in the data).
  days)

(defstruct (exchange-early-close-rule (:constructor %make-exchange-early-close-rule))
  kind from to close authority args)

(defstruct (exchange-hours (:constructor %make-exchange-hours))
  mic name zone calendar-name kind weekend eras early-close-rules early-closes
  late-open-rules late-opens source)

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

(defun %parse-era-days (plist)
  "The era's weekday-specific sessions as ((ISO-WEEKDAY . SPECS) …): :DAYS rows
(WEEKDAY SESSION-PLIST …), then :FRIDAY (5), :SATURDAY (6) and :SUNDAY (7)."
  (let ((days (mapcar (lambda (row)
                        (cons (first row) (%parse-session-specs (rest row))))
                      (getf plist :days))))
    (loop for (key dow) in '((:friday 5) (:saturday 6) (:sunday 7))
          for specs = (getf plist key)
          when (and specs (not (assoc dow days)))
            do (push (cons dow (%parse-session-specs specs)) days))
    (sort days #'< :key #'car)))

(defun %parse-era (plist)
  (%make-exchange-era
   :from (%ymd->date (getf plist :from))
   :to (%ymd->date (getf plist :to))
   :sessions (%parse-session-specs (getf plist :sessions))
   :friday (let ((fri (getf plist :friday)))
             (when fri (%parse-session-specs fri)))
   :saturday (let ((sat (getf plist :saturday)))
               (when sat (%parse-session-specs sat)))
   :days (%parse-era-days plist)
   :weekend (getf plist :weekend)
   :authority (getf plist :authority)))

(defun %parse-early-rule (plist)
  "An early-close (or, with :OPEN, a late-open) rule from its data PLIST."
  (%make-exchange-early-close-rule
   :kind (getf plist :kind)
   :from (%ymd->date (getf plist :from))
   :to (%ymd->date (getf plist :to))
   :close (%tod-list (or (getf plist :close) (getf plist :open)))
   :authority (getf plist :authority)
   :args plist))

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
   :late-open-rules (mapcar #'%parse-early-rule (getf plist :late-open-rules))
   :late-opens (%parse-early-closes (getf plist :late-opens))
   :source (getf plist :source)))

(defun load-exchange-hours-file (path)
  (load-exchange-hours-plist (read-data-form path)))

(defun %exchange-data-path (mic)
  (sp:join (exchanges-data-directory)
           (format nil "~a.sexp" (string-upcase mic))))

(defun list-exchange-hours-files ()
  (remove-if-not (lambda (p) (string-equal (sp:extension p) "sexp"))
                 (sp:iterdir (exchanges-data-directory))))

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

(defun %era-gap-p (exchange date)
  "True when DATE falls between two hours eras (eras are cut at the last
trading day, so the weekend or holiday before a change is in no era)."
  (let ((eras (exchange-hours-eras exchange)))
    (and (some (lambda (era)
                 (let ((to (exchange-era-to era)))
                   (and to (< to date))))
               eras)
         (some (lambda (era)
                 (let ((from (exchange-era-from era)))
                   (and from (< date from))))
               eras))))

(defun exchange-era-for-date (exchange date &key (errorp t))
  "The hours era covering DATE. Outside every era: signal CALENDAR-ERROR,
or return NIL when ERRORP is NIL."
  (or (find-if (lambda (era) (%era-covers-p era date))
               (exchange-hours-eras exchange))
      (when errorp
        (error 'calendar-error
               :message (format nil "~a has no hours era covering ~a"
                                (exchange-hours-mic exchange) date)))))

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
    (let ((args (exchange-early-close-rule-args rule)))
      (ecase (exchange-early-close-rule-kind rule)
        (:easter
         ;; (:kind :easter :offset N): Easter Sunday + N days (Ash Wednesday -46).
         (when (= date (+ (easter-western (date-year date)) (getf args :offset)))
           (exchange-early-close-rule-close rule)))
        (:fixed-weekday
         ;; (:kind :fixed-weekday :month M :day D): that day when a weekday.
         (when (and (= (date-month date) (getf args :month))
                    (= (date-day date) (getf args :day))
                    (%weekday-p date))
           (exchange-early-close-rule-close rule)))
        (:function
         ;; (:kind :function :function NAME): NAME names a function (YEAR) → DATE
         ;; (EXCHANGE-DATE-FUNCTION).
         (when (= date (funcall (exchange-date-function (getf args :function))
                                (date-year date)))
           (exchange-early-close-rule-close rule)))
        (:last-weekday-before-new-years-eve
         ;; The last weekday of 27–30 December: the year's last trading day
         ;; where 24–26 and 31 December are closed (Xetra, Wiener Börse).
         (when (and (= (date-month date) 12) (<= 27 (date-day date) 30)
                    (%weekday-p date)
                    (loop for d from (1+ (date-day date)) to 30
                          never (%weekday-p (make-date (date-year date) 12 d))))
           (exchange-early-close-rule-close rule)))
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
        (:july-3-wednesday
         (when (and (= (date-month date) 7) (= (date-day date) 3)
                    (= (date-day-of-week date) 3))
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
           (exchange-early-close-rule-close rule)))))))

(defun exchange-early-close (exchange date)
  "TIME-OF-DAY early close on DATE, or NIL.
Second value is the note / rule authority when an early close applies.
Adhoc rows are (DATE TOD NOTE); TOD is the close, not the note. Then the
notices of the exchange calendar (a notice written on another zone's clock,
such as Euronext's CET for Lisbon, is converted to the exchange zone), then
the early-close rules. A notice close of :NONE cancels a rule's early close
that day."
  (let ((row (find date (exchange-hours-early-closes exchange)
                   :key #'first :test #'=)))
    (when row
      (return-from exchange-early-close
        (values (second row) (or (third row) "adhoc early close")))))
  (multiple-value-bind (tod note clock)
      (exchange-calendar-early-close (exchange-calendar exchange) date)
    (when tod
      (return-from exchange-early-close
        (if (eq tod :none)
            (values nil nil)
            (values (%wall-time-in-zone date tod clock (exchange-hours-zone exchange))
                    note)))))
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

(defun %notice-session-specs (exchange date plists clock)
  "Session PLISTS a calendar notice gives DATE as specs on EXCHANGE's clock
(a notice written on another zone's CLOCK is converted)."
  (let ((zone (exchange-hours-zone exchange)))
    (mapcar (lambda (spec)
              (%make-exchange-session-spec
               :open (%wall-time-in-zone date (exchange-session-spec-open spec) clock zone)
               :close (%wall-time-in-zone date (exchange-session-spec-close spec) clock zone)
               :overnight (exchange-session-spec-overnight spec)
               :labeled-by (exchange-session-spec-labeled-by spec)))
            (%parse-session-specs plists))))

(defun %notice-sessions (exchange date)
  "The hours a notice of EXCHANGE's calendar gives DATE (:SESSIONS), or NIL."
  (multiple-value-bind (plists note clock)
      (exchange-calendar-sessions (exchange-calendar exchange) date)
    (declare (ignore note))
    (when plists
      (%notice-session-specs exchange date plists clock))))

(defun exchange-special-sessions-for-date (exchange date)
  "Special sessions EXCHANGE holds on DATE apart from regular trading (NSE/BSE
Muhurat), from its calendar's notices: (values SPECS NOTE), or NIL. They do
not make DATE a trading day: EXCHANGE-TRADING-DAY-P and
EXCHANGE-SESSIONS-FOR-DATE leave them out."
  (multiple-value-bind (plists note clock)
      (exchange-calendar-special-sessions (exchange-calendar exchange) date)
    (when plists
      (values (%notice-session-specs exchange date plists clock) note))))

(defun %regular-rule-p (rule)
  "True for a late-open rule marked :REGULAR T: the later open is part of the
day's regular hours (KRX first trading day), not an overlay on them."
  (getf (exchange-early-close-rule-args rule) :regular))

(defun %after-weekday-closure-p (exchange date)
  "True when a weekday holiday of EXCHANGE's calendar falls between DATE and
the trading day before it (DATE is the first trading day after a holiday,
not after a plain weekend). Looks back at most 31 days."
  (let ((calendar (exchange-calendar exchange)))
    (and calendar
         (loop for d = (- date 1) then (- d 1)
               repeat 31
               until (business-day-p calendar d)
               thereis (and (%weekday-p d) (holiday-p calendar d))))))

(defun %regular-rule-open (exchange rule date)
  "The open a :REGULAR late-open RULE gives DATE, or NIL. Besides the
early-close rule kinds: :EVERY-DAY (each day of the rule's window) and
:AFTER-WEEKDAY-CLOSURE (the first trading day after a weekday holiday: SHFE
and INE hold no night session on the evening before a statutory holiday)."
  (when (%rule-in-window-p rule date)
    (case (exchange-early-close-rule-kind rule)
      (:every-day (exchange-early-close-rule-close rule))
      (:after-weekday-closure
       (when (%after-weekday-closure-p exchange date)
         (exchange-early-close-rule-close rule)))
      (t (%early-close-from-rule rule date)))))

(defun %regular-late-open (exchange date)
  "The open a :REGULAR late-open rule of EXCHANGE gives DATE, or NIL. Second
value is true when that rule has :OVERNIGHT NIL: the day has no overnight
(night) leg either."
  (loop for rule in (exchange-hours-late-open-rules exchange)
        for tod = (and (%regular-rule-p rule) (%regular-rule-open exchange rule date))
        when tod
          return (let ((args (exchange-early-close-rule-args rule)))
                   (values tod (and (member :overnight args)
                                    (not (getf args :overnight)))))))

(defun %era-week-sessions (exchange date)
  "The regular segments for DATE (no holidays, no early close or late open):
the hours a calendar notice gives the day (:SESSIONS), else the hours era's
sessions for DATE's weekday, opened later by a :REGULAR late-open rule (one
with :OVERNIGHT NIL also drops the night leg). NIL on a weekend of the era,
unless a calendar notice opens the day (then the era's weekday hours), or
between eras."
  (let ((override (%notice-sessions exchange date)))
    (when override
      (return-from %era-week-sessions override)))
  (let ((era (exchange-era-for-date exchange date
                                    :errorp (not (%era-gap-p exchange date)))))
    (when era
      (let* ((dow (date-day-of-week date))
             (weekend (or (exchange-era-weekend era)
                          (exchange-hours-weekend exchange)))
             (sessions (or (cdr (assoc dow (exchange-era-days era)))
                           (if (member dow weekend)
                               (when (exchange-calendar-opened-p
                                      (exchange-calendar exchange) date)
                                 (exchange-era-sessions era))
                               (exchange-era-sessions era)))))
        (when sessions
          (multiple-value-bind (late no-overnight) (%regular-late-open exchange date)
            (%apply-late-open (if no-overnight
                                  (remove-if #'exchange-session-spec-overnight sessions)
                                  sessions)
                              late)))))))

(defun %apply-late-open (sessions late)
  "Drop/shorten segments so the first remaining open is LATE (same-day
segments only; an overnight leg is kept as it is)."
  (if (null late)
      sessions
      (or (loop for seg in sessions
                for open = (exchange-session-spec-open seg)
                for close = (exchange-session-spec-close seg)
                if (exchange-session-spec-overnight seg)
                  collect seg
                else if (<= late open)
                       collect seg
                else if (< late close)
                       collect (%make-exchange-session-spec
                                :open late :close close :overnight nil
                                :labeled-by (exchange-session-spec-labeled-by seg)))
          (error 'calendar-error
                 :message (format nil "late open ~a follows all session closes" late)))))

(defun exchange-late-open (exchange date)
  "TIME-OF-DAY late open on DATE, or NIL. Second value is the note or rule
authority. Adhoc rows are (DATE TOD NOTE), then the exchange calendar's
notices (converted from their clock; :NONE cancels a rule's late open), then
the late-open rules that are not :REGULAR (those shape the regular hours, see
%REGULAR-LATE-OPEN)."
  (let ((row (find date (exchange-hours-late-opens exchange)
                   :key #'first :test #'=)))
    (when row
      (return-from exchange-late-open
        (values (second row) (or (third row) "adhoc late open")))))
  (multiple-value-bind (tod note clock)
      (exchange-calendar-late-open (exchange-calendar exchange) date)
    (when tod
      (return-from exchange-late-open
        (if (eq tod :none)
            (values nil nil)
            (values (%wall-time-in-zone date tod clock (exchange-hours-zone exchange))
                    note)))))
  (loop for rule in (exchange-hours-late-open-rules exchange)
        for tod = (and (not (%regular-rule-p rule)) (%early-close-from-rule rule date))
        when tod
          return (values tod (exchange-early-close-rule-authority rule))))

(defun %weekly-sessions-for-date (exchange date)
  "Session specs from the hours era's trading week alone (no holidays),
after the late-open and early-close overlays. NIL for a day between two eras."
  (let ((sessions (%era-week-sessions exchange date)))
    (when sessions
      (%apply-early-close (%apply-late-open sessions (exchange-late-open exchange date))
                          (exchange-early-close exchange date)))))

(defun exchange-holiday-p (exchange date)
  "True when DATE is a holiday on EXCHANGE's attached holiday calendar.
Second value is the holiday name. Only holidays close the Exchange: the
hours era encodes the trading week (Sun–Thu, historical Saturdays)."
  (let ((cal (exchange-calendar exchange)))
    (if cal (holiday-p cal date) (values nil nil))))

(defun exchange-sessions-for-date (exchange date)
  "List of EXCHANGE-SESSION-SPEC for DATE (after early-close overlay).
NIL on a weekend of the hours era or a holiday of the exchange calendar."
  (unless (exchange-holiday-p exchange date)
    (%weekly-sessions-for-date exchange date)))

(defun exchange-regular-sessions-for-date (exchange date)
  "The regular segments of EXCHANGE on DATE, without the early-close and
late-open overlays. NIL on a weekend of the hours era or a holiday of the
exchange calendar."
  (unless (exchange-holiday-p exchange date)
    (%era-week-sessions exchange date)))

(defun exchange-calendar (exchange)
  (let ((name (exchange-hours-calendar-name exchange)))
    (when name (find-calendar name :errorp nil))))

(defun exchange-trading-day-p (exchange date)
  "True if DATE has at least one cash-session segment: a trading-week day
of the hours era that is not a holiday of the exchange calendar."
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
third value. Signals CALENDAR-ERROR when DATE has no session (weekend of
the hours era or holiday of the exchange calendar)."
  (let ((ex (find-exchange mic)))
    (when (exchange-holiday-p ex date)
      (error 'calendar-error
             :message (format nil "~a is a holiday for ~a calendar"
                              date (exchange-hours-calendar-name ex))))
    (let ((segs (exchange-sessions-for-date ex date)))
      (unless segs
        (error 'calendar-error
               :message (format nil "~a is not a trading day for ~a"
                                date (exchange-hours-mic ex))))
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
                pairs)))))

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
