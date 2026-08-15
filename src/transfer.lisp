(in-package #:cl-stack-calendars)

;;;; Government decree weekend transfers (перенос выходных) and compensatory
;;;; working Saturdays — Russia/China-style rearrangements that are not
;;;; expressible as fixed annual recurrence.

(defstruct (calendar-transfer (:constructor %make-calendar-transfer))
  (from nil :type (or null date))
  (to nil :type date)
  (name nil :type (or null string))
  (authority nil))

(defun make-calendar-transfer (&key from to name authority)
  (%make-calendar-transfer
   :from (when from (normalize-rule-bound from))
   :to (normalize-rule-bound to)
   :name name
   :authority authority))

(defstruct (calendar-working-day (:constructor %make-calendar-working-day))
  (date nil :type date)
  (authority nil))

(defun make-calendar-working-day (&key date authority)
  (%make-calendar-working-day
   :date (normalize-rule-bound date)
   :authority authority))

(defun %ymd (spec)
  "SPEC is DATE, (Y M D), or already a date."
  (normalize-rule-bound spec))
