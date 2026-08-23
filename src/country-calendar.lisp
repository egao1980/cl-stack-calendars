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

(defvar *country-calendar-cache* (make-hash-table :test #'equal)
  "CODE → COUNTRY-HOLIDAY-CALENDAR instances.")

(defclass country-holiday-calendar (holiday-calendar)
  ((code :initarg :code :reader country-calendar-code)
   (name :initarg :name :accessor calendar-name)
   (source :initarg :source :initform nil :reader country-calendar-source)
   (license :initarg :license :initform nil :reader country-calendar-license)
   (note :initarg :note :initform nil :reader country-calendar-note)
   (year-range :initarg :year-range :initform nil :reader country-calendar-year-range)
   (weekend-days :initarg :weekend-days :initform '(6 7) :accessor calendar-weekend-days)
   (holidays :initarg :holidays :initform (make-hash-table :test #'eql)
             :accessor calendar-holidays-table
             :documentation "RD → (name . type)"))
  (:documentation "Precomputed public/bank holidays for an ISO country or
territory code. Provenance is COUNTRY-CALENDAR-SOURCE / LICENSE."))

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

(defun load-country-calendar (code &key (weekend-days '(6 7)))
  "Load (or return cached) COUNTRY-HOLIDAY-CALENDAR for CODE (e.g. \"DE\", \"TW\", \"XK\")."
  (let* ((cc (string-upcase code))
         (cached (gethash cc *country-calendar-cache*)))
    (or cached
        (let* ((plist (%load-country-plist cc))
               (table (make-hash-table :test #'eql))
               (years (%plist-get plist :years))
               (cal (make-instance 'country-holiday-calendar
                                   :code cc
                                   :name (or (%plist-get plist :name) cc)
                                   :source (%plist-get plist :source)
                                   :license (%plist-get plist :license)
                                   :note (%plist-get plist :note)
                                   :year-range years
                                   :weekend-days weekend-days
                                   :holidays table)))
          (%ingest-country-days table (%plist-get plist :days))
          (setf (gethash cc *country-calendar-cache*) cal)
          cal))))

(defun country-calendar (code &rest args)
  (apply #'load-country-calendar code args))

(defmethod holiday-p ((calendar country-holiday-calendar) date)
  (let ((v (gethash (date-rd date) (calendar-holidays-table calendar))))
    (if v
        (values t (car v))
        (values nil nil))))

(defun clear-country-calendar-cache ()
  (clrhash *country-calendar-cache*)
  (setf *country-index* nil))
