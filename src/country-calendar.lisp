(in-package #:cl-stack-calendars)

;;;; Country / territory holiday calendars.
;;;;
;;;; Corpus: data/countries/<CC>.sexp — frozen dump of commenthol/date-holidays
;;;; (CC BY-SA 3.0). Rebuild index: scripts/generate-country-holidays.lisp.
;;;; See data/countries/ATTRIBUTION.md.
;;;; Hand-maintained starters (USFED, GBLO, RU, TARGET, …) remain the
;;;; normative source when both exist; COUNTRY-CALENDAR is the broad corpus.

(defvar *country-index* nil
  "Cached list of (CODE NAME DAY-COUNT) from index.sexp.")

(defvar *country-calendar-cache*
  #+sbcl (make-hash-table :test #'equal :synchronized t)
  #-sbcl (make-hash-table :test #'equal)
  "(CODE WEEKEND-DAYS STRICT) → COUNTRY-HOLIDAY-CALENDAR. Synchronized: safe
for concurrent first use; two racing loads build equal calendars.")

(defclass country-holiday-calendar (weekend-spec-mixin holiday-calendar)
  ((code :initarg :code :reader country-calendar-code)
   (name :initarg :name :accessor calendar-name)
   (source :initarg :source :initform nil :reader country-calendar-source)
   (license :initarg :license :initform nil :reader country-calendar-license)
   (note :initarg :note :initform nil :reader country-calendar-note)
   (year-range :initarg :year-range :initform nil :reader country-calendar-year-range)
   (stub-p :initarg :stub-p :initform nil :reader country-calendar-stub-p
           :documentation "True for a placeholder file with no holiday data.")
   (strict :initarg :strict :initform t :reader calendar-strict-p
           :documentation "When true, HOLIDAY-P outside CALENDAR-COVERAGE signals.")
   (holidays :initarg :holidays :initform (make-hash-table :test #'eql)
             :accessor calendar-holidays-table
             :documentation "RD → (name . type)"))
  (:documentation "Precomputed public/bank holidays for an ISO country or
territory code. Provenance is COUNTRY-CALENDAR-SOURCE / LICENSE. The weekend
defaults to COUNTRY-WEEKEND-DAYS of the code (era-aware). HOLIDAY-P signals
CALENDAR-OUT-OF-RANGE outside COUNTRY-CALENDAR-YEAR-RANGE and for stubs,
unless the calendar was loaded with :STRICT NIL."))

(defun %countries-index-path ()
  (sp:join (countries-data-directory) "index.sexp"))

(defun %country-data-path (code)
  (sp:join (countries-data-directory)
           (format nil "~a.sexp" (string-upcase code))))

(defun list-country-calendars (&optional (force nil))
  "Return list of (CODE NAME DAY-COUNT) for every shipped country/territory."
  (when (or force (null *country-index*))
    (setf *country-index* (read-data-form (%countries-index-path))))
  *country-index*)

(defun country-calendar-codes ()
  (mapcar #'first (list-country-calendars)))

(defun %plist-get (plist key)
  (getf plist key))

(defun %load-country-plist (code)
  (let ((path (%country-data-path code)))
    (unless (data-file-exists-p path)
      (error 'calendar-not-found :calendar-name (string-upcase code)))
    (read-data-form path)))

(defun %ingest-country-days (table days)
  (dolist (entry days)
    (destructuring-bind (y m d name &optional type) entry
      (setf (gethash (date-rd (make-date y m d)) table)
            (cons name (or type :public))))))

(defun load-country-calendar (code &key weekend-days (strict t))
  "Load (or return cached) COUNTRY-HOLIDAY-CALENDAR for CODE (e.g. \"DE\", \"TW\", \"XK\").
WEEKEND-DAYS (a weekday list or an era list) overrides the country's weekend
from COUNTRY-WEEKEND-DAYS. STRICT (default T) makes HOLIDAY-P signal
CALENDAR-OUT-OF-RANGE outside the corpus years and for stubs; STRICT NIL
answers NIL there instead. The cache is keyed on CODE, WEEKEND-DAYS and
STRICT."
  (let* ((cc (string-upcase code))
         (key (list cc weekend-days (and strict t)))
         (cached (gethash key *country-calendar-cache*)))
    (or cached
        (let* ((plist (%load-country-plist cc))
               (table (make-hash-table :test #'eql))
               (years (%plist-get plist :years))
               (days (%plist-get plist :days))
               (cal (make-instance 'country-holiday-calendar
                                   :code cc
                                   :name (or (%plist-get plist :name) cc)
                                   :source (%plist-get plist :source)
                                   :license (%plist-get plist :license)
                                   :note (%plist-get plist :note)
                                   :year-range years
                                   :stub-p (null days)
                                   :strict strict
                                   :weekend-days (or weekend-days (country-weekend-days cc))
                                   :holidays table)))
          (%ingest-country-days table days)
          (setf (gethash key *country-calendar-cache*) cal)
          cal))))

(defun country-calendar (code &rest args)
  (apply #'load-country-calendar code args))

(defmethod calendar-coverage ((calendar country-holiday-calendar))
  (if (country-calendar-stub-p calendar)
      :none
      (country-calendar-year-range calendar)))

(defmethod holiday-p ((calendar country-holiday-calendar) date)
  (call-with-coverage
   calendar date (calendar-strict-p calendar)
   (lambda ()
     (let ((v (gethash (date-rd date) (calendar-holidays-table calendar))))
       (if v
           (values t (car v))
           (values nil nil))))))

(defun clear-country-calendar-cache ()
  (clrhash *country-calendar-cache*)
  (setf *country-index* nil))
