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

(defparameter *country-calendar-normative*
  '(("RU" . russian-holidays-calendar)
    ("CO" . colombia-holidays-calendar)
    ("CL" . chile-holidays-calendar)
    ("PE" . peru-holidays-calendar)
    ("AR" . argentina-holidays-calendar)
    ("KR" . south-korea-holidays-calendar)
    ("HK" . hong-kong-holidays-calendar)
    ("TW" . taiwan-holidays-calendar)
    ("PH" . philippines-holidays-calendar)
    ("ID" . indonesia-holidays-calendar)
    ("MY" . malaysia-holidays-calendar)
    ("VN" . vietnam-holidays-calendar)
    ("CN" . china-holidays-calendar))
  "Corpus codes whose COUNTRY-CALENDAR defers to a hand starter: alist CODE →
starter constructor. The date-holidays dump for these codes is known to be
wrong (RU: no 2–5 January from 2005, no ТК ст. 112 transfers or decrees,
4 November before 2005; egao1980/cl-stack-calendars#13. CO: lists Easter
Sunday, which Ley 51/1983 does not make a festivo; #15. CL: Virgen del Carmen
before 2007, 31 October before 2008, no Ley 19.668 moves; #16. PE: lists
Easter Sunday, which DL 713 art. 6 does not make a feriado; #19. AR: misses
the DNU 810/2003 and Res. JGM 139/2025 moves, Güemes kept on a Friday
(Decreto 789/2021), 17 June 2016 and the 2026 decree days; #18. KR: keeps
one day of each three-day 설날 and 추석, no 대체공휴일 rules and no election
days; #39. HK: the post-2011 fourth day of Lunar New Year in 2010 instead of
the day preceding, no Cap. 149 s. 6(2) day 2010-04-06; TW: misses 調整放假
days such as 2024-02-08 and has no 補行上班; PH: no Black Saturday or other
proclaimed special days, Ninoy Aquino Day 2024 not moved; ID: Islamic days
off the SKB (Idul Adha 2024-06-16, SKB 06-17), no election days; #41. MY:
counts the state day 1 January, has the Agong's birthday on the first Monday
of June before 2017 and Malaysia Day before 2010, and misses Wesak and
Deepavali in years such as 2008; VN: Giỗ Tổ before 2007, no nghỉ bù, no
five-day Tết, no hoán đổi or làm bù; #40. CN: no State Council 放假 windows
and no 上班 days, and the statutory days of the wrong era; #26). The corpus
file stays as shipped; its days are no longer consulted.")

(defclass normative-country-calendar (country-holiday-calendar)
  ((normative :initarg :normative :reader country-calendar-normative
              :documentation "The hand starter calendar that answers every query."))
  (:documentation "A COUNTRY-CALENDAR for a code in *COUNTRY-CALENDAR-NORMATIVE*.
It keeps the corpus metadata (code, name, source, year range) but answers
HOLIDAY-P, BUSINESS-DAY-P, weekends and coverage from the normative starter,
and reports :NORMATIVE provenance."))

(defun %normative-country-starter (code constructor weekend-days)
  "The starter calendar for CODE: the registered one, or a fresh one from
CONSTRUCTOR when WEEKEND-DAYS overrides its weekend."
  (if weekend-days
      (let ((cal (funcall constructor)))
        (setf (calendar-weekend-days cal) weekend-days)
        cal)
      (find-calendar code)))

(defmethod holiday-p ((calendar normative-country-calendar) date)
  (holiday-p (country-calendar-normative calendar) date))

(defmethod business-day-p ((calendar normative-country-calendar) date)
  (business-day-p (country-calendar-normative calendar) date))

(defmethod weekend-day-p ((calendar normative-country-calendar) date)
  (weekend-day-p (country-calendar-normative calendar) date))

(defmethod weekend-days-on ((calendar normative-country-calendar) date)
  (weekend-days-on (country-calendar-normative calendar) date))

(defmethod calendar-weekend-days ((calendar normative-country-calendar))
  (calendar-weekend-days (country-calendar-normative calendar)))

(defmethod holidays-between ((calendar normative-country-calendar) start end)
  (holidays-between (country-calendar-normative calendar) start end))

(defmethod calendar-coverage ((calendar normative-country-calendar))
  (calendar-coverage (country-calendar-normative calendar)))

(defmethod calendar-provenance ((calendar normative-country-calendar))
  "The hand starter answers: its provenance (:NORMATIVE for RU)."
  (calendar-provenance (country-calendar-normative calendar)))

(defun load-country-calendar (code &key weekend-days (strict t))
  "Load (or return cached) COUNTRY-HOLIDAY-CALENDAR for CODE (e.g. \"DE\", \"TW\", \"XK\").
WEEKEND-DAYS (a weekday list or an era list) overrides the country's weekend
from COUNTRY-WEEKEND-DAYS. STRICT (default T) makes HOLIDAY-P signal
CALENDAR-OUT-OF-RANGE outside the corpus years and for stubs; STRICT NIL
answers NIL there instead. The cache is keyed on CODE, WEEKEND-DAYS and
STRICT. A code in *COUNTRY-CALENDAR-NORMATIVE* gives a
NORMATIVE-COUNTRY-CALENDAR, which answers from the hand starter."
  (let* ((cc (string-upcase code))
         (key (list cc weekend-days (and strict t)))
         (cached (gethash key *country-calendar-cache*)))
    (or cached
        (let* ((plist (%load-country-plist cc))
               (table (make-hash-table :test #'eql))
               (years (%plist-get plist :years))
               (days (%plist-get plist :days))
               (normative (cdr (assoc cc *country-calendar-normative* :test #'string=)))
               (cal (apply #'make-instance
                           (if normative 'normative-country-calendar 'country-holiday-calendar)
                           :code cc
                           :name (or (%plist-get plist :name) cc)
                           :source (%plist-get plist :source)
                           :license (%plist-get plist :license)
                           :note (%plist-get plist :note)
                           :year-range years
                           :stub-p (null days)
                           :strict strict
                           :weekend-days (or weekend-days (country-weekend-days cc))
                           :holidays table
                           (when normative
                             (list :normative (%normative-country-starter cc normative weekend-days))))))
          (%ingest-country-days table days)
          (setf (gethash key *country-calendar-cache*) cal)
          cal))))

(defun country-calendar (code &rest args)
  (apply #'load-country-calendar code args))

(defmethod calendar-coverage ((calendar country-holiday-calendar))
  (if (country-calendar-stub-p calendar)
      :none
      (country-calendar-year-range calendar)))

(defmethod calendar-provenance ((calendar country-holiday-calendar))
  "The date-holidays corpus table: :CORPUS."
  :corpus)

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
