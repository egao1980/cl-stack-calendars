;;;; DRAFT prototype for docs/LOGIC-MIGRATION.md: holiday observance and
;;;; precedence as logic-protocol rules on the Datalog backend. Nothing in the
;;;; primary CL-STACK-CALENDARS system loads or calls this package; the
;;;; released engine is unchanged.

(defpackage #:cl-stack-calendars/logic
  (:use #:cl)
  (:local-nicknames (#:cal #:cl-stack-calendars)
                    (#:dt #:datetime-protocol)
                    (#:lp #:logic-protocol))
  (:export
   ;; rule modules (rules.lisp)
   #:rule-module #:rule-module-name #:rule-module-authority #:rule-module-uri
   #:rule-module-forms #:find-rule-module #:list-rule-modules #:define-rule-module
   #:module-rules
   ;; conditions
   #:unsupported-observance #:unsupported-observance-policy
   #:unsupported-observance-rule #:skip-rule
   ;; facts (facts.lisp)
   #:calendar-year-facts #:calendar-rule-modules #:year-window
   ;; engine (engine.lisp)
   #:year-model #:year-model-year #:year-model-program #:year-model-holidays
   #:year-model-business #:build-year-model #:calendar-year-model #:clear-logic-cache
   #:logic-holiday-p #:logic-business-day-p #:logic-holidays-between
   #:logic-explain-holiday #:proof-authorities
   #:composite-year-model #:logic-composite-holiday-p #:logic-composite-business-day-p))
