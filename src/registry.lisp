(in-package #:cl-stack-calendars)

;;;; Global named registry of HOLIDAY-CALENDAR instances, e.g. "TARGET",
;;;; "USFED", "GBLO" (see starter-calendars.lisp).

(defvar *calendar-registry*
  #+sbcl (make-hash-table :test 'equal :synchronized t)
  #-sbcl (make-hash-table :test 'equal)
  "Maps registered calendar names (strings) to HOLIDAY-CALENDAR instances.
Synchronized, so lookups may run while another thread registers.")

(defun register-calendar (name calendar)
  "Register CALENDAR (any HOLIDAY-CALENDAR) under the string NAME, replacing
any previous registration under that name. Returns CALENDAR."
  (check-type name string)
  (setf (gethash name *calendar-registry*) calendar))

(defstruct (%calendar-constructor
            (:constructor %make-calendar-constructor (function)))
  "A registry entry that builds its calendar on demand. BUILT is
(GENERATION . CALENDAR), replaced as one cons so a reader never pairs one
generation with another's calendar."
  (function nil :read-only t)
  (built nil))

(defun register-calendar-constructor (name function)
  "Register FUNCTION, a function designator of no arguments that returns a
HOLIDAY-CALENDAR, under the string NAME. FIND-CALENDAR calls it on the first
lookup and keeps the calendar until CLEAR-DATA-CACHES (or SET-DATA-ROOT) runs,
then builds it again. Use it for calendars whose data comes from data files
(proclamations, decrees, gazettes), so the registered calendar carries every
year of that data under the current data root. Returns NAME."
  (check-type name string)
  (setf (gethash name *calendar-registry*) (%make-calendar-constructor function))
  name)

(defun %resolve-registry-entry (entry)
  "The calendar for registry ENTRY, building a constructor entry when it was
never built or was built under an older *DATA-GENERATION*. Two threads may
both build it; they build equal calendars and the later one is kept."
  (if (%calendar-constructor-p entry)
      (let ((built (%calendar-constructor-built entry))
            (generation *data-generation*))
        (if (and built (eql (car built) generation))
            (cdr built)
            (let ((calendar (funcall (%calendar-constructor-function entry))))
              (setf (%calendar-constructor-built entry) (cons generation calendar))
              calendar)))
      entry))

(defun calendar-registered-p (name)
  "True when some calendar is registered under NAME. Unlike FIND-CALENDAR,
this never builds a constructor entry."
  (nth-value 1 (gethash name *calendar-registry*)))

(defun find-calendar (name &key (errorp t))
  "Look up the calendar registered under NAME. Signals CALENDAR-NOT-FOUND
unless ERRORP is NIL, in which case NIL is returned instead. A name
registered with REGISTER-CALENDAR-CONSTRUCTOR is built on first lookup and
again after CLEAR-DATA-CACHES."
  (multiple-value-bind (entry presentp) (gethash name *calendar-registry*)
    (cond (presentp (%resolve-registry-entry entry))
          (errorp (error 'calendar-not-found :calendar-name name))
          (t nil))))

(defun unregister-calendar (name)
  "Remove NAME's registration, if any. Returns T if a calendar was removed."
  (remhash name *calendar-registry*))

(defun list-registered-calendars ()
  "All currently registered calendar names."
  (loop for name being the hash-keys of *calendar-registry* collect name))
