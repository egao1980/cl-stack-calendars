(in-package #:cl-stack-calendars)

;;;; Global named registry of HOLIDAY-CALENDAR instances, e.g. "TARGET",
;;;; "USFED", "GBLO" (see starter-calendars.lisp).

(defvar *calendar-registry* (make-hash-table :test 'equal)
  "Maps registered calendar names (strings) to HOLIDAY-CALENDAR instances.")

(defun register-calendar (name calendar)
  "Register CALENDAR (any HOLIDAY-CALENDAR) under the string NAME, replacing
any previous registration under that name. Returns CALENDAR."
  (check-type name string)
  (setf (gethash name *calendar-registry*) calendar))

(defun find-calendar (name &key (errorp t))
  "Look up the calendar registered under NAME. Signals CALENDAR-NOT-FOUND
unless ERRORP is NIL, in which case NIL is returned instead."
  (multiple-value-bind (calendar presentp) (gethash name *calendar-registry*)
    (cond (presentp calendar)
          (errorp (error 'calendar-not-found :calendar-name name))
          (t nil))))

(defun unregister-calendar (name)
  "Remove NAME's registration, if any. Returns T if a calendar was removed."
  (remhash name *calendar-registry*))

(defun list-registered-calendars ()
  "All currently registered calendar names."
  (loop for name being the hash-keys of *calendar-registry* collect name))
