(in-package #:cl-stack-calendars)

;;;; Exchange trading-holiday calendars: one per MIC (or exchange family),
;;;; from the exchange's own published holiday lists and notices, not the
;;;; national civil calendar.
;;;;
;;;; Data: data/exchanges/calendars/<NAME>.sexp
;;;;   (:name "XPAR" :title "…" :authority "…" :authority-uri "…"
;;;;    :weekend (6 7)
;;;;    :include ("EURONEXT")           ; family files whose rules, bases and
;;;;                                    ; notices also apply (before ours)
;;;;    :bases ((:calendar "FR" :from (Y M D) :to (Y M D) :except ("…")
;;;;             :authority "…") …)     ; civil holidays the exchange follows
;;;;    :rules ((:fixed "Christmas Day" 12 25 :from 2001 :authority "…") …)
;;;;    :notices ((:title "…" :uri "…" :issued (Y M D) :issued-uri "…"
;;;;               :published (Y M D) :published-uri "…" :published-in "…"
;;;;               :dates-note "…"
;;;;               :closed (((Y M D) "name") …) :open (((Y M D) "why") …)
;;;;               :early-closes (((Y M D) (H M) "note") …)
;;;;               :late-opens (((Y M D) (H M) "note") …)) …))
;;;;
;;;; A day is closed when a notice closes it, else open when a notice opens
;;;; it, else closed when a rule or an active base (minus its :EXCEPT names)
;;;; has a holiday. Rules use DEFINE-CALENDAR clause syntax; :COMPUTED takes
;;;; a function name. CALENDAR-PROVENANCE is :EXCHANGE.

(defun %holiday-rule-from-clause (clause)
  "The holiday-rule struct for one DEFINE-CALENDAR rule CLAUSE read as data."
  (destructuring-bind (kind name &rest args) clause
    (flet ((common (rest)
             (destructuring-bind (&key observed observed-from bridge from to authority
                                    orthodox)
                 rest
               (declare (ignore orthodox))
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
                  :compute (fdefinition function) (common rest))))))))

(defclass exchange-holiday-calendar (weekend-spec-mixin holiday-calendar)
  ((name :initarg :name :initform nil :accessor calendar-name)
   (title :initarg :title :initform nil :reader exchange-calendar-title)
   (authority :initarg :authority :initform nil :reader exchange-calendar-authority)
   (authority-uri :initarg :authority-uri :initform nil
                  :reader exchange-calendar-authority-uri)
   (rules :initarg :rules :initform nil :reader exchange-calendar-rules
          :documentation "A RULE-CALENDAR of the exchange's recurring closures, or NIL.")
   (bases :initarg :bases :initform nil :reader exchange-calendar-bases
          :documentation "Plists (:CALENDAR :FROM :TO :EXCEPT :AUTHORITY): the
exchange also closes on the holidays of the registered calendar :CALENDAR
between :FROM and :TO (dates, NIL = open-ended), except those named in :EXCEPT.")
   (notices :initarg :notices :initform nil :reader exchange-calendar-notices
            :documentation "Notice plists, as in the data file.")
   (closures :initform (make-hash-table) :reader %exchange-closures)
   (openings :initform (make-hash-table) :reader %exchange-openings)
   (early-closes :initform (make-hash-table) :reader %exchange-notice-early-closes)
   (late-opens :initform (make-hash-table) :reader %exchange-notice-late-opens))
  (:documentation "A HOLIDAY-CALENDAR for one exchange: its own recurring
rules, the civil calendars it follows by era (:BASES), and its notices of
one-off closures, sessions on holidays, early closes and late opens. See
src/exchange-calendar.lisp for the data format."))

(defmethod initialize-instance :after ((calendar exchange-holiday-calendar) &key)
  (flet ((tod (spec) (if (eq spec :none) :none (%tod-list spec))))
    (dolist (notice (exchange-calendar-notices calendar))
      (flet ((put (table rows value-fn)
               (dolist (row rows)
                 (setf (gethash (date-rd (%ymd->date (first row))) table)
                       (funcall value-fn row)))))
        (put (%exchange-closures calendar) (getf notice :closed)
             (lambda (row) (list (second row) notice)))
        (put (%exchange-openings calendar) (getf notice :open)
             (lambda (row) (list (second row) notice)))
        (put (%exchange-notice-early-closes calendar) (getf notice :early-closes)
             (lambda (row) (list (tod (second row)) (third row) notice)))
        (put (%exchange-notice-late-opens calendar) (getf notice :late-opens)
             (lambda (row) (list (tod (second row)) (third row) notice)))))))

(defmethod calendar-provenance ((calendar exchange-holiday-calendar))
  :exchange)

(defun %base-active-p (base date)
  (let ((from (getf base :from))
        (to (getf base :to)))
    (and (or (null from) (<= (%ymd->date from) date))
         (or (null to) (<= date (%ymd->date to))))))

(defmethod holiday-p ((calendar exchange-holiday-calendar) date)
  (let ((rd (date-rd date)))
    (let ((closure (gethash rd (%exchange-closures calendar))))
      (when closure
        (return-from holiday-p (values t (first closure)))))
    (when (gethash rd (%exchange-openings calendar))
      (return-from holiday-p (values nil nil)))
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
             :bases (merged :bases)
             :notices (append (loop for p in included append (getf p :notices))
                              own-notices)
             plist))))

(defun load-exchange-calendar (name)
  "Build the EXCHANGE-HOLIDAY-CALENDAR from data/exchanges/calendars/NAME.sexp."
  (let* ((plist (%read-exchange-calendar-plist name))
         (weekend (or (getf plist :weekend) '(6 7)))
         (clauses (getf plist :rules)))
    (make-instance 'exchange-holiday-calendar
                   :name (getf plist :name)
                   :title (getf plist :title)
                   :authority (getf plist :authority)
                   :authority-uri (getf plist :authority-uri)
                   :weekend-days weekend
                   :rules (when clauses
                            (make-instance 'rule-calendar
                                           :name (getf plist :name)
                                           :provenance :exchange
                                           :weekend-days weekend
                                           :rules (mapcar #'%holiday-rule-from-clause
                                                          clauses)))
                   :bases (getf plist :bases)
                   :notices (getf plist :notices))))

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
