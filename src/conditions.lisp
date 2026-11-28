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

(define-condition exchange-product-group-not-found (calendar-error)
  ((mic :initarg :mic :initform nil :reader exchange-product-group-not-found-mic)
   (product-group :initarg :product-group :initform nil
                  :reader exchange-product-group-not-found-product-group)
   (known :initarg :known :initform nil
          :reader exchange-product-group-not-found-known
          :documentation "The product groups the MIC has."))
  (:documentation "Signaled by FIND-EXCHANGE (and every exchange function
taking :PRODUCT-GROUP) when the MIC has no such product group. Restart
USE-VALUE retries with another group (NIL = the headline one).")
  (:report (lambda (condition stream)
             (format stream "~a has no product group ~s (it has ~{~s~^ ~})"
                     (exchange-product-group-not-found-mic condition)
                     (exchange-product-group-not-found-product-group condition)
                     (or (exchange-product-group-not-found-known condition)
                         '(:none))))))

(define-condition duplicate-snapshot-version (calendar-error)
  ((calendar :initarg :calendar :initform nil
             :reader duplicate-snapshot-version-calendar)
   (version-tag :initarg :version-tag :initform nil
                :reader duplicate-snapshot-version-tag))
  (:documentation "Signaled by ADD-CALENDAR-SNAPSHOT when the versioned
calendar already holds a snapshot with the same VERSION-TAG. Restarts:
REPLACE-SNAPSHOT drops the existing snapshot(s) with that tag and adds the new
one; CONTINUE keeps both (CALENDAR-AS-OF :VERSION then returns the one with the
latest RECORDED-AT).")
  (:report (lambda (condition stream)
             (format stream "versioned calendar already has a snapshot tagged ~s"
                     (duplicate-snapshot-version-tag condition)))))

(define-condition invalid-holiday-rule (calendar-error)
  ()
  (:documentation "Signaled for malformed DEFINE-CALENDAR rule clauses or
malformed data-calendar sexp files."))

(define-condition invalid-convention (calendar-error)
  ((convention :initarg :convention :reader invalid-convention-convention))
  (:documentation "Signaled by ADJUST-DATE for a CONVENTION it does not know.
Restart USE-VALUE retries with another convention.")
  (:report (lambda (condition stream)
             (format stream "unknown business-day convention ~s (want :following, :modified-following, :preceding, :modified-preceding, :nearest or :unadjusted)"
                     (invalid-convention-convention condition)))))

(define-condition no-business-day (calendar-error)
  ((calendar :initarg :calendar :reader no-business-day-calendar)
   (date :initarg :date :reader no-business-day-date)
   (direction :initarg :direction :reader no-business-day-direction)
   (limit :initarg :limit :reader no-business-day-limit))
  (:documentation "Signaled by NEXT-BUSINESS-DAY / PREVIOUS-BUSINESS-DAY when no
business day lies within LIMIT days of DATE (a calendar whose weekend is every
day, or an unbroken run of holidays).")
  (:report (lambda (condition stream)
             (format stream "no business day within ~d days ~(~a~) of ~a"
                     (no-business-day-limit condition)
                     (no-business-day-direction condition)
                     (no-business-day-date condition)))))

(define-condition calendar-out-of-range (calendar-error)
  ((calendar :initarg :calendar :reader calendar-out-of-range-calendar)
   (date :initarg :date :reader calendar-out-of-range-date)
   (coverage :initarg :coverage :initform nil :reader calendar-out-of-range-coverage
             :documentation "(FROM-YEAR . TO-YEAR), (FROM-YEAR . NIL) when
open-ended, or :NONE for a stub."))
  (:documentation "Signaled by HOLIDAY-P when DATE lies outside the years a
data-derived calendar covers (see CALENDAR-COVERAGE), or the calendar is an
empty stub. Restarts: USE-VALUE (return that as HOLIDAY-P's value) and
CONTINUE (treat DATE as not a holiday). Build the calendar with :STRICT NIL to
get NIL without a signal.")
  (:report (lambda (condition stream)
             (let ((coverage (calendar-out-of-range-coverage condition)))
               (format stream "~a: ~a is outside the calendar's data (~a)"
                       (calendar-name (calendar-out-of-range-calendar condition))
                       (calendar-out-of-range-date condition)
                       (cond ((and (consp coverage) (cdr coverage))
                              (format nil "covers ~d–~d" (car coverage) (cdr coverage)))
                             ((consp coverage)
                              (format nil "covers ~d onward" (car coverage)))
                             (t "stub with no holiday data")))))))
