(in-package #:cl-stack-calendars)

;;;; Exchange trading-holiday calendars: one per MIC (or exchange family),
;;;; from the exchange's own published holiday lists and notices, not the
;;;; national civil calendar.
;;;;
;;;; Data: data/exchanges/calendars/<NAME>.sexp
;;;;   (:name "XPAR" :title "…" :authority "…" :authority-uri "…"
;;;;    :weekend (6 7)                  ; or eras ((NIL 5 6) ((2026 1 4) 6 7))
;;;;    :include ("EURONEXT")           ; family files whose rules, bases and
;;;;                                    ; notices also apply (before ours)
;;;;    :product-group :equity          ; take this section of :GROUPS notices
;;;;    :bases ((:calendar "FR" :from (Y M D) :to (Y M D) :except ("…")
;;;;             :authority "…") …)     ; civil holidays the exchange follows
;;;;    :rules ((:fixed "Christmas Day" 12 25 :from 2001 :authority "…") …)
;;;;    :no-settlement-rules (…)        ; same syntax: trading days without a
;;;;                                    ; settlement (CME Globex holidays)
;;;;    :notices ((:title "…" :uri "…" :issued (Y M D) :issued-uri "…"
;;;;               :published (Y M D) :published-uri "…" :published-in "…"
;;;;               :dates-note "…"
;;;;               :closed (((Y M D) "name") …) :open (((Y M D) "why") …)
;;;;               :sessions (((Y M D) ((:open (H M) :close (H M)) …) "note") …)
;;;;               :special-sessions (((Y M D) ((:open (H M) :close (H M))) "note") …)
;;;;               :early-closes (((Y M D) (H M) "note") …)
;;;;               :late-opens (((Y M D) (H M) "note") …)
;;;;               :no-settlement (((Y M D) "name") …)
;;;;               :settlement (((Y M D) "why") …)
;;;;               :groups ((:equity :early-closes (…) …) …)) …))
;;;;
;;;; A day is closed when a notice closes it, else open when a notice opens
;;;; it (:OPEN, or :SESSIONS, which also gives that day's hours in place of
;;;; the hours era's), else closed when a rule or an active base (minus its
;;;; :EXCEPT names) has a holiday. A notice that opens a weekend day (TWSE
;;;; make-up Saturdays) makes it a trading day with the era's weekday hours.
;;;; :SPECIAL-SESSIONS (NSE/BSE Muhurat) are held apart from regular trading
;;;; and do not open the day (EXCHANGE-SPECIAL-SESSIONS-FOR-DATE). A day of
;;;; :NO-SETTLEMENT-RULES or a notice's :NO-SETTLEMENT row may trade but has
;;;; no settlement: its trades clear on the next trade date (a :SETTLEMENT row
;;;; revokes the rule for one day; EXCHANGE-TRADE-DATE). A notice of a family
;;;; file can carry per-product-group rows under :GROUPS (one CME Globex
;;;; holiday schedule covers equity, interest-rate, FX, energy, metals and
;;;; grains); a calendar with :PRODUCT-GROUP sees its own section. Rules use
;;;; DEFINE-CALENDAR clause syntax; :COMPUTED takes a function name
;;;; (src/exchange-date-functions.lisp). CALENDAR-PROVENANCE is :EXCHANGE.

;;; Date functions that exchange calendar files name in :COMPUTED rules and
;;; :FUNCTION early-close rules (data is read without evaluation).

(defun swedish-midsummer-eve (year)
  "Midsommarafton: the Friday before Midsommardagen (the Saturday of 20–26 June)."
  (- (%saturday-in-range year 6 20 6 26) 1))

(defun friday-before-swedish-all-saints (year)
  "The Friday before Alla helgons dag (the Saturday of 31 October – 6 November)."
  (- (%saturday-in-range year 10 31 11 6) 1))

(defun exchange-date-function (designator)
  "The function a data file names with DESIGNATOR, a symbol or string read in
any package: the function of that name in CL-STACK-CALENDARS. Signals
CALENDAR-ERROR for an unknown name."
  (let ((symbol (find-symbol (string-upcase (string designator)) '#:cl-stack-calendars)))
    (if (and symbol (fboundp symbol))
        (fdefinition symbol)
        (error 'calendar-error
               :message (format nil "exchange data names unknown date function ~s"
                                designator)))))

(defun %holiday-rule-from-clause (clause)
  "The holiday-rule struct for one DEFINE-CALENDAR rule CLAUSE read as data.
A :COMPUTED clause names its date function (EXCHANGE-DATE-FUNCTION)."
  (destructuring-bind (kind name &rest args) clause
    (flet ((common (rest)
             (destructuring-bind (&key observed observed-from bridge from to authority
                                       &allow-other-keys)
                 rest
               (list :name name :observed observed
                     :observed-from (normalize-rule-bound observed-from)
                     :bridge bridge :authority authority
                     :from (normalize-rule-bound from) :to (normalize-rule-bound to)))))
      (ecase kind
        (:fixed
         (destructuring-bind (month day &rest rest) args
           (apply #'make-fixed-holiday-rule :month month :day day (common rest))))
        (:nth-weekday
         (destructuring-bind (month weekday nth &rest rest) args
           (apply #'make-nth-weekday-holiday-rule
                  :month month :weekday (normalize-weekday weekday) :nth nth
                  (common rest))))
        (:easter
         (destructuring-bind (offset &rest rest) args
           (apply #'make-easter-holiday-rule
                  :offset offset :orthodox (getf rest :orthodox) (common rest))))
        (:computed
         (destructuring-bind (function &rest rest) args
           (apply #'make-computed-holiday-rule
                  :compute (exchange-date-function function) (common rest))))))))

(defclass exchange-holiday-calendar (weekend-spec-mixin holiday-calendar)
  ((name :initarg :name :initform nil :accessor calendar-name)
   (title :initarg :title :initform nil :reader exchange-calendar-title)
   (authority :initarg :authority :initform nil :reader exchange-calendar-authority)
   (authority-uri :initarg :authority-uri :initform nil
                  :reader exchange-calendar-authority-uri)
   (rules :initarg :rules :initform nil :reader exchange-calendar-rules
          :documentation "A RULE-CALENDAR of the exchange's recurring closures, or NIL.")
   (no-settlement-rules :initarg :no-settlement-rules :initform nil
                        :reader exchange-calendar-no-settlement-rules
                        :documentation "A RULE-CALENDAR of the recurring days the
exchange trades without a settlement (CME Globex holiday sessions), or NIL.")
   (bases :initarg :bases :initform nil :reader exchange-calendar-bases
          :documentation "Plists (:CALENDAR :FROM :TO :EXCEPT :AUTHORITY): the
exchange also closes on the holidays of the registered calendar :CALENDAR
between :FROM and :TO (dates, NIL = open-ended), except those named in :EXCEPT.")
   (notices :initarg :notices :initform nil :reader exchange-calendar-notices
            :documentation "Notice plists, as in the data file.")
   (closures :initform (make-hash-table) :reader %exchange-closures)
   (openings :initform (make-hash-table) :reader %exchange-openings)
   (no-settlement :initform (make-hash-table) :reader %exchange-notice-no-settlement)
   (early-closes :initform (make-hash-table) :reader %exchange-notice-early-closes)
   (late-opens :initform (make-hash-table) :reader %exchange-notice-late-opens)
   (sessions :initform (make-hash-table) :reader %exchange-notice-sessions)
   (special-sessions :initform (make-hash-table)
                     :reader %exchange-notice-special-sessions))
  (:documentation "A HOLIDAY-CALENDAR for one exchange: its own recurring
rules, the civil calendars it follows by era (:BASES), and its notices of
one-off closures, sessions on holidays and weekend days, per-day hours,
special sessions, early closes, late opens and days without a settlement.
See src/exchange-calendar.lisp for the data format."))

(defmethod initialize-instance :after ((calendar exchange-holiday-calendar) &key)
  (flet ((tod (spec) (if (eq spec :none) :none (%tod-list spec))))
    (loop for notice in (exchange-calendar-notices calendar)
          for index from 0
          do (flet ((put (table rows value-fn)
                      (dolist (row rows)
                        (setf (gethash (date-rd (%ymd->date (first row))) table)
                              (funcall value-fn row)))))
               ;; Closures and openings keep the notice's position (third),
               ;; so a later notice can revoke an earlier one's closure.
               (put (%exchange-closures calendar) (getf notice :closed)
                    (lambda (row) (list (second row) notice index)))
               (put (%exchange-openings calendar) (getf notice :open)
                    (lambda (row) (list (second row) notice index)))
               ;; A day with its own hours (:SESSIONS) trades, weekend or holiday.
               (put (%exchange-openings calendar) (getf notice :sessions)
                    (lambda (row) (list (third row) notice index)))
               (put (%exchange-notice-sessions calendar) (getf notice :sessions)
                    (lambda (row) (list (second row) (third row) notice)))
               (put (%exchange-notice-special-sessions calendar) (getf notice :special-sessions)
                    (lambda (row) (list (second row) (third row) notice)))
               (put (%exchange-notice-early-closes calendar) (getf notice :early-closes)
                    (lambda (row) (list (tod (second row)) (third row) notice)))
               (put (%exchange-notice-late-opens calendar) (getf notice :late-opens)
                    (lambda (row) (list (tod (second row)) (third row) notice)))
               ;; :NO-SETTLEMENT rows mark a trading day without a settlement;
               ;; :SETTLEMENT rows (later in the same or a later notice) revoke one
               ;; a rule gives.
               (put (%exchange-notice-no-settlement calendar) (getf notice :no-settlement)
                    (lambda (row) (list t (second row) notice)))
               (put (%exchange-notice-no-settlement calendar) (getf notice :settlement)
                    (lambda (row) (list nil (second row) notice)))))))

(defmethod calendar-provenance ((calendar exchange-holiday-calendar))
  :exchange)

(defun %base-active-p (base date)
  (let ((from (getf base :from))
        (to (getf base :to)))
    (and (or (null from) (<= (%ymd->date from) date))
         (or (null to) (<= date (%ymd->date to))))))

(defun %notice-day-state (calendar rd)
  "What CALENDAR's notices say about the day RD: (values :CLOSED row),
(values :OPEN row) or NIL. A closure wins over an opening of the same or an
earlier notice; an opening in a later notice (a partial-modification
circular moving a holiday) revokes the closure."
  (let ((closure (gethash rd (%exchange-closures calendar)))
        (opening (gethash rd (%exchange-openings calendar))))
    (cond ((and closure opening (> (third opening) (third closure)))
           (values :open opening))
          (closure (values :closed closure))
          (opening (values :open opening)))))

(defmethod holiday-p ((calendar exchange-holiday-calendar) date)
  (let ((rd (date-rd date)))
    (multiple-value-bind (state row) (%notice-day-state calendar rd)
      (case state
        (:closed (return-from holiday-p (values t (first row))))
        (:open (return-from holiday-p (values nil nil)))))
    (let ((rules (exchange-calendar-rules calendar)))
      (when rules
        (multiple-value-bind (hp name) (holiday-p rules date)
          (when hp
            (return-from holiday-p (values t name))))))
    (dolist (base (exchange-calendar-bases calendar))
      (when (%base-active-p base date)
        (multiple-value-bind (hp name)
            (holiday-p (find-calendar (getf base :calendar)) date)
          (when (and hp (not (member name (getf base :except) :test #'equal)))
            (return-from holiday-p (values t name))))))
    (values nil nil)))

(defun exchange-calendar-opened-p (calendar date)
  "True when a notice of CALENDAR opens DATE (:OPEN or :SESSIONS) and no
notice closes it after that (%NOTICE-DAY-STATE): the exchange trades that
day even on a weekend day or holiday. Second value is the notice's note."
  (when (typep calendar 'exchange-holiday-calendar)
    (multiple-value-bind (state row) (%notice-day-state calendar (date-rd date))
      (when (eq state :open)
        (values t (first row))))))

(defun exchange-calendar-no-settlement-p (calendar date)
  "True when CALENDAR says the exchange holds no settlement on DATE although
it may trade (a CME Globex holiday session: trading halts early and the
day's trades clear on the next trade date). A notice's :NO-SETTLEMENT row
says so, a :SETTLEMENT row says the day settles after all, else a
:NO-SETTLEMENT-RULES holiday. Second value is the name or note. Says nothing
about whether DATE trades (EXCHANGE-SETTLEMENT-DAY-P)."
  (when (typep calendar 'exchange-holiday-calendar)
    (let ((row (gethash (date-rd date) (%exchange-notice-no-settlement calendar))))
      (when row
        (return-from exchange-calendar-no-settlement-p
          (if (first row) (values t (second row)) (values nil nil)))))
    (let ((rules (exchange-calendar-no-settlement-rules calendar)))
      (if rules
          (holiday-p rules date)
          (values nil nil)))))

(defmethod weekend-day-p ((calendar exchange-holiday-calendar) date)
  "A weekend day that a notice opens (a make-up Saturday) is not a weekend day."
  (and (not (exchange-calendar-opened-p calendar date))
       (call-next-method)))

(defun %notice-row-values (table date)
  (let ((row (gethash (date-rd date) table)))
    (when row
      (values (first row) (second row) (getf (third row) :clock)))))

(defun exchange-calendar-sessions (calendar date)
  "The hours a notice of CALENDAR gives DATE in place of the era's regular
sessions: (values SESSION-PLISTS NOTE CLOCK), or NIL. SESSION-PLISTS are
(:OPEN (H M) :CLOSE (H M) …) as in an hours era; CLOCK as for
EXCHANGE-CALENDAR-EARLY-CLOSE."
  (when (typep calendar 'exchange-holiday-calendar)
    (%notice-row-values (%exchange-notice-sessions calendar) date)))

(defun exchange-calendar-special-sessions (calendar date)
  "Special sessions a notice of CALENDAR holds on DATE apart from regular
trading (NSE/BSE Muhurat): (values SESSION-PLISTS NOTE CLOCK), or NIL. They
do not make DATE a trading day."
  (when (typep calendar 'exchange-holiday-calendar)
    (%notice-row-values (%exchange-notice-special-sessions calendar) date)))

(defun exchange-calendar-early-close (calendar date)
  "The early close CALENDAR's notices give DATE: (values TIME-OF-DAY NOTE
CLOCK), or NIL. CLOCK is the zone the notice wrote the time in, or NIL for
the exchange's own zone."
  (when (typep calendar 'exchange-holiday-calendar)
    (let ((row (gethash (date-rd date) (%exchange-notice-early-closes calendar))))
      (when row
        (values (first row) (second row) (getf (third row) :clock))))))

(defun exchange-calendar-late-open (calendar date)
  "The late open CALENDAR's notices give DATE: (values TIME-OF-DAY NOTE
CLOCK), or NIL. CLOCK as for EXCHANGE-CALENDAR-EARLY-CLOSE."
  (when (typep calendar 'exchange-holiday-calendar)
    (let ((row (gethash (date-rd date) (%exchange-notice-late-opens calendar))))
      (when row
        (values (first row) (second row) (getf (third row) :clock))))))

(defun %wall-time-in-zone (date tod from-zone to-zone)
  "TOD on DATE in FROM-ZONE as a wall time in TO-ZONE."
  (if (or (null from-zone) (equal from-zone to-zone))
      tod
      (zoned-moment-time
       (instant-in-zone
        (zoned-moment-to-instant
         (moment-in-zone (make-moment date tod) (resolve-zone-id from-zone)))
        (resolve-zone-id to-zone)))))

(defun %exchange-calendars-directory ()
  (sp:join (exchanges-data-directory) "calendars/"))

(defun %exchange-calendar-path (name)
  (sp:join (%exchange-calendars-directory) (format nil "~a.sexp" name)))

(defun %read-exchange-calendar-plist (name &optional seen)
  "The plist of calendar NAME with its :INCLUDE files merged in front. A file's
:CLOCK (the zone its notice times are written in) is copied onto each of its
notices that names none, so an included family file keeps its own clock."
  (when (member name seen :test #'string=)
    (error 'calendar-error
           :message (format nil "exchange calendar ~a includes itself" name)))
  (let* ((plist (read-data-form (%exchange-calendar-path name)))
         (clock (getf plist :clock))
         (own-notices (mapcar (lambda (notice)
                                (if (and clock (not (getf notice :clock)))
                                    (list* :clock clock notice)
                                    notice))
                              (getf plist :notices)))
         (included (mapcar (lambda (n)
                             (%read-exchange-calendar-plist n (cons name seen)))
                           (getf plist :include))))
    (flet ((merged (key)
             (append (loop for p in included append (getf p key))
                     (getf plist key))))
      (list* :rules (merged :rules)
             :no-settlement-rules (merged :no-settlement-rules)
             :bases (merged :bases)
             :notices (append (loop for p in included append (getf p :notices))
                              own-notices)
             plist))))

(defun make-exchange-calendar (plist)
  "Build an EXCHANGE-HOLIDAY-CALENDAR from PLIST, the data-file format above
with any :INCLUDE files already merged in (as LOAD-EXCHANGE-CALENDAR does)."
  (let ((weekend (or (getf plist :weekend) '(6 7))))
    (flet ((rule-calendar (clauses)
             (when clauses
               (make-instance 'rule-calendar
                              :name (getf plist :name)
                              :provenance :exchange
                              :weekend-days weekend
                              :rules (mapcar #'%holiday-rule-from-clause clauses)))))
      (make-instance 'exchange-holiday-calendar
                     :name (getf plist :name)
                     :title (getf plist :title)
                     :authority (getf plist :authority)
                     :authority-uri (getf plist :authority-uri)
                     :weekend-days weekend
                     :rules (rule-calendar (getf plist :rules))
                     :no-settlement-rules (rule-calendar (getf plist :no-settlement-rules))
                     :bases (getf plist :bases)
                     :notices (getf plist :notices)))))

(defparameter *exchange-notice-row-keys*
  '(:closed :open :sessions :special-sessions :early-closes :late-opens
    :no-settlement :settlement)
  "Notice keys whose values are lists of day rows.")

(defun %notice-for-product-group (notice group)
  "NOTICE with the rows of its :GROUPS section for product GROUP appended to
its own. A family notice (CME: one holiday schedule for every product group)
lists per-group rows as :GROUPS ((:EQUITY :EARLY-CLOSES (…) …) …); a
calendar with :PRODUCT-GROUP GROUP sees its section, others see none."
  (let ((groups (getf notice :groups)))
    (if (null groups)
        notice
        (let ((section (cdr (assoc group groups)))
              (merged (copy-list notice)))
          (dolist (key *exchange-notice-row-keys* merged)
            (let ((rows (getf section key)))
              (when rows
                (setf (getf merged key) (append (getf merged key) rows)))))))))

(defun load-exchange-calendar (name)
  "Build the EXCHANGE-HOLIDAY-CALENDAR from data/exchanges/calendars/NAME.sexp.
A file with :PRODUCT-GROUP takes that group's section of every notice that
has :GROUPS (%NOTICE-FOR-PRODUCT-GROUP), its included family files' too."
  (let* ((plist (%read-exchange-calendar-plist name))
         (group (getf plist :product-group)))
    (make-exchange-calendar
     (list* :notices (mapcar (lambda (notice) (%notice-for-product-group notice group))
                             (getf plist :notices))
            plist))))

(defun exchange-calendar-names ()
  "Names of the calendars in data/exchanges/calendars/."
  (let ((dir (%exchange-calendars-directory)))
    (when (sp:exists-p dir)
      (sort (mapcar #'sp:stem
                    (remove-if-not (lambda (p) (string-equal (sp:extension p) "sexp"))
                                   (sp:iterdir dir)))
            #'string<))))

(defun register-exchange-calendars ()
  "Register a constructor for every exchange calendar data file."
  (dolist (name (exchange-calendar-names))
    (let ((name name))
      (register-calendar-constructor name (lambda () (load-exchange-calendar name))))))

(defun exchange-notice-rows (&optional (names (exchange-calendar-names)))
  "Every notice row of the exchange calendars NAMES (own rows, not included
ones), as (NAME . NOTICE-PLIST)."
  (loop for name in names
        append (mapcar (lambda (notice) (cons name notice))
                       (getf (read-data-form (%exchange-calendar-path name)) :notices))))

(register-exchange-calendars)
