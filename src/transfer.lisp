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

(defun make-extra-day-transfer (entry &optional authority)
  "ENTRY is (TO) or (TO NAME) where TO is DATE or (Y M D).
Nil FROM — decree extra leave (cuti bersama, 임시공휴일, proclamation)."
  (destructuring-bind (to &optional name) (if (and (listp entry) (not (typep entry 'date)))
                                              entry
                                              (list entry))
    (make-calendar-transfer :from nil :to to :name name :authority authority)))

(defun %transfer-touches-year-p (tr year)
  (or (let ((to (calendar-transfer-to tr)))
        (and to (= (date-year to) year)))
      (let ((from (calendar-transfer-from tr)))
        (and from (= (date-year from) year)))))

(defun transfers-touching-year (blocks year)
  "A fresh list of the CALENDAR-TRANSFERs in BLOCKS whose FROM or TO falls in
YEAR. BLOCKS is a cached corpus ((KEY . PLIST) …) with the transfers under
:TRANSFERS. The result never shares structure with BLOCKS, so callers may
modify it (CLHS lets REMOVE-IF-NOT return its argument or share its tail,
which made the old NCONC over these lists destructive)."
  (loop for (nil . plist) in blocks
        append (loop for tr in (getf plist :transfers)
                     when (%transfer-touches-year-p tr year)
                       collect tr)))
