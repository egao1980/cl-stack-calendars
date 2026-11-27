(in-package #:cl-stack-calendars/logic)

;;;; Base facts for one RULE-CALENDAR and one Gregorian year.
;;;;
;;;; The window runs from 1 December of YEAR-1 to 31 January of YEAR+1, and
;;;; nominals of YEAR-1, YEAR and YEAR+1 that fall inside it are asserted, so
;;;; a substitute or in-lieu day that crosses New Year (#27 item 3) sees the
;;;; other year's holidays. Only holidays inside YEAR are read back.

(define-condition unsupported-observance (cal:calendar-error)
  ((policy :initarg :policy :reader unsupported-observance-policy)
   (rule :initarg :rule :initform nil :reader unsupported-observance-rule))
  (:documentation "The prototype has no rule module for a rule's OBSERVED
policy or :BRIDGE. Restart SKIP-RULE drops the rule from this year's facts.")
  (:report (lambda (c s)
             (format s "logic prototype: no rule module for observance ~s~@[ (rule ~s)~]"
                     (unsupported-observance-policy c)
                     (let ((r (unsupported-observance-rule c)))
                       (and r (cal:holiday-rule-name r)))))))

(defparameter *policy-modules*
  '((:none :nominal-observance)
    (:us-federal-in-lieu :us-federal-in-lieu)
    (:uk-proclamation-substitute :substitute-queue :uk-proclamation-substitute)
    (:ru-tk-112-transfer :substitute-queue :ru-tk-112-transfer))
  "Statute keyword → rule modules that implement it. Data, read once per
year: which modules a calendar loads is a lookup, not a decision chain.")

(defconstant +counter-limit+ 64
  "SUCC facts 0..64: more pending substitutes than this in one window would
leave the queue stuck (no calendar comes close: the worst is about 10).")

(defun year-window (year)
  "Inclusive RD bounds of YEAR's fact window."
  (values (dt:date-rd (dt:make-date (1- year) 12 1))
          (dt:date-rd (dt:make-date (1+ year) 1 31))))

(defun %bound-rd (bound default)
  "A :FROM-style bound (NIL, year integer or DATE) as an RD integer."
  (cond ((null bound) default)
        ((integerp bound) (dt:date-rd (dt:make-date bound 1 1)))
        (t (dt:date-rd bound))))

(defun %rule-policy (calendar rule nominal)
  "The statute keyword RULE observes on NOMINAL (a DATE), or :NONE."
  (cond ((cal::calendar-furikae-chain-p calendar) :none) ; calendar-level 第3条 modules
        ((cal::%observed-applies-at-p (cal::rule-observed-from rule) nominal)
         (or (cal::rule-observed rule) :none))
        (t :none)))

(defun %nominal-facts (calendar lo hi)
  (let ((facts '()))
    (dolist (rule (cal:calendar-rules calendar) facts)
      (restart-case
          (loop with year0 = (dt:date-year (dt:date-from-rd lo))
                for y from year0 to (+ year0 2)
                for nominal = (cal::rule-nominal-date rule y)
                when (and nominal
                          (<= lo (dt:date-rd nominal) hi)
                          (cal::rule-valid-at-p rule nominal))
                  do (let ((policy (%rule-policy calendar rule nominal)))
                       (unless (and (assoc policy *policy-modules*)
                                    (null (cal::rule-bridge rule)))
                         (error 'unsupported-observance
                                :policy (or (cal::rule-bridge rule) policy) :rule rule))
                       (push (list 'nominal (dt:date-rd nominal)
                                   (or (cal:holiday-rule-name rule) "") policy)
                             facts)))
        (skip-rule ()
          :report "Leave this rule out of the logic facts."
          nil)))))

(defun calendar-rule-modules (calendar facts)
  "Rule module names CALENDAR needs, given its year FACTS."
  (let ((modules (list :core-precedence :nominal-observance :decree-transfers)))
    (dolist (f facts)
      (when (eq (first f) 'nominal)
        (dolist (m (cdr (assoc (fourth f) *policy-modules*)))
          (pushnew m modules))))
    (when (cal::calendar-furikae-chain-p calendar)
      (pushnew :jp-shukujitsu modules)
      (pushnew :jp-furikae modules))
    (when (cal::calendar-sandwich-holidays-p calendar)
      (pushnew :jp-shukujitsu modules)
      (pushnew :jp-kokumin-no-kyujitsu modules))
    (nreverse modules)))

(defun calendar-year-facts (calendar year)
  "Base facts (a list of ground atoms) for CALENDAR's YEAR window."
  (multiple-value-bind (lo hi) (year-window year)
    (let ((facts (%nominal-facts calendar lo hi))
          (weekend (cal:calendar-weekend-days calendar)))
      (flet ((in-window-p (date) (and date (<= lo (dt:date-rd date) hi))))
        (loop for rd from lo to hi
              for date = (dt:date-from-rd rd)
              for dow = (dt:date-day-of-week date)
              do (push (list 'day rd) facts)
                 (push (list 'weekday rd dow) facts)
                 (push (list 'month-day rd (dt:date-month date) (dt:date-day date)) facts)
                 (when (member dow weekend) (push (list 'weekend-dow rd) facts))
                 (when (< rd hi) (push (list 'next-day rd (1+ rd)) facts)))
        (push (list 'window-start lo) facts)
        (dolist (wd (cal:calendar-working-days calendar))
          (let ((d (cal:calendar-working-day-date wd)))
            (when (in-window-p d) (push (list 'working-override (dt:date-rd d)) facts))))
        (dolist (d (cal:calendar-suppressed-dates calendar))
          (when (in-window-p d) (push (list 'suppressed (dt:date-rd d)) facts)))
        (dolist (tr (cal:calendar-transfers calendar))
          (let ((to (cal:calendar-transfer-to tr))
                (from (cal:calendar-transfer-from tr)))
            (when (in-window-p to)
              (push (list 'transfer-to (dt:date-rd to)
                          (or (cal:calendar-transfer-name tr) "перенос выходного"))
                    facts))
            (when (in-window-p from)
              (push (list 'transfer-from (dt:date-rd from)) facts))))
        ;; Eras. A missing bound means "always"; a DATE bound is honoured
        ;; to the day (the engine ignores it for :SANDWICH-FROM, #36 item 3).
        (when (cal::calendar-sandwich-holidays-p calendar)
          (push (list 'era :sandwich-from (%bound-rd (cal::calendar-sandwich-from calendar) 0))
                facts))
        (when (cal::calendar-furikae-chain-p calendar)
          (push (list 'era :furikae-from (%bound-rd (cal::calendar-furikae-from calendar) 0)) facts)
          (push (list 'era :furikae-chain-from
                      (%bound-rd (cal::calendar-furikae-chain-from calendar) 0))
                facts))
        (loop for n from 0 below +counter-limit+
              do (push (list 'succ n (1+ n)) facts))
        facts))))
