(in-package #:cl-stack-calendars)

;;;; Condition hierarchy for cl-stack-calendars.

(define-condition calendar-error (error)
  ((message :initarg :message :initform nil :reader calendar-error-message))
  (:documentation "Base condition for all cl-stack-calendars errors.")
  (:report (lambda (condition stream)
             (format stream "~a" (or (calendar-error-message condition) "calendar error")))))

(define-condition calendar-not-found (calendar-error)
  ((calendar-name :initarg :calendar-name :initform nil :reader calendar-not-found-calendar-name))
  (:documentation "Signaled by FIND-CALENDAR (and versioned-calendar snapshot
lookups) when no matching calendar/snapshot exists.")
  (:report (lambda (condition stream)
             (format stream "~a"
                     (or (calendar-error-message condition)
                         (format nil "no calendar registered as ~s" (calendar-not-found-calendar-name condition)))))))

(define-condition invalid-holiday-rule (calendar-error)
  ()
  (:documentation "Signaled for malformed DEFINE-CALENDAR rule clauses or
malformed data-calendar sexp files."))
