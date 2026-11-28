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
    ("CN" . china-holidays-calendar)
    ("TH" . thailand-holidays-calendar)
    ("IN" . india-holidays-calendar)
    ("BD" . bangladesh-holidays-calendar)
    ("PK" . pakistan-holidays-calendar)
    ("IR" . iran-holidays-calendar)
    ("EG" . egypt-holidays-calendar)
    ("DZ" . algeria-holidays-calendar)
    ("MA" . morocco-holidays-calendar)
    ("KZ" . kazakhstan-holidays-calendar)
    ("SN" . senegal-holidays-calendar)
    ("ZA" . south-africa-holidays-calendar)
    ("KE" . kenya-holidays-calendar)
    ("NG" . nigeria-holidays-calendar)
    ("ZW" . zimbabwe-holidays-calendar)
    ("ZM" . zambia-holidays-calendar)
    ("MW" . malawi-holidays-calendar)
    ("MG" . madagascar-holidays-calendar)
    ("IT" . italy-holidays-calendar)
    ("NL" . netherlands-holidays-calendar)
    ("DE" . germany-holidays-calendar)
    ("IE" . ireland-holidays-calendar)
    ("PT" . portugal-holidays-calendar)
    ("HR" . croatia-holidays-calendar)
    ("SI" . slovenia-holidays-calendar)
    ("SK" . slovakia-holidays-calendar)
    ("CZ" . czechia-holidays-calendar)
    ("HU" . hungary-holidays-calendar)
    ("PL" . poland-holidays-calendar)
    ("RO" . romania-holidays-calendar)
    ("BG" . bulgaria-holidays-calendar)
    ("GR" . greece-holidays-calendar)
    ("CY" . cyprus-holidays-calendar)
    ("EE" . estonia-holidays-calendar)
    ("LV" . latvia-holidays-calendar)
    ("LT" . lithuania-holidays-calendar))
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
and no 上班 days, and the statutory days of the wrong era; #26. TH: Buddhist
days off the Thai lunar calendar (Asalha Bucha 2024-07-19 for 07-20), no
วันหยุดชดเชย and no Cabinet special days; #40. IN: no festival or Islamic
day at all, only Republic Day, Good Friday, 14 April, Independence Day,
Gandhi Jayanti and Christmas; #42. BD: 17 March and 15 August in 2025, one
Eid day, no executive-order days, Durga Puja 2025-10-08 for 10-02; PK:
Iqbal Day 2015–2021 and Youm-e-Takbeer every year, one-day Eids on the
tabular dates (Eid-ul-Adha 2024-06-16 for 06-17–19); #47. EG, DZ, MA: one
day for each Eid, on the estimated date (Eid al-Adha 2024-06-16; EG declared
15–20 June, DZ 16–18 June, MA 17–18 June), no moved days (EG 1 May 2024 kept
on 05-01, moved to 05-05), DZ without the 19 June of 2000–2004, MA without
14 January from 2024; IR: lunar days a day off the official calendar in
years such as 2024 (Eid al-Adha 06-16 for 06-17, Arbaeen 08-24 for 08-25);
#44. KZ: Kurban ait before 2006 (2000-03-16), weekend carry-overs before law
267 (2000-12-18), no transfer decrees; SN: the Grand Magal on 18 Rabi'
al-awwal (2000-05-22) instead of 18 Safar, and before loi 2013-06; #43. ZA:
no s. 2A days (2021-11-01, 2022-12-27); KE: Easter Sunday and the Sunday Eid
itself (2020-05-24 for the gazetted 05-25), no Idd-ul-Azha notices; NG:
estimated Eid days (2020-05-24 for the declared 05-25–26), no in-lieu
declarations; ZW: no Easter Saturday, Youth Day or polling days; ZM: Women's
Day on 2021-03-09 for 03-08, no Holy Saturday or Easter Sunday; MW: Saturday
holidays kept as well as moved (2021-05-01), no Easter Saturday; MG: Africa
Day (2020-05-25), no Pentecost Sunday, Eid days on estimated dates; #45.
IT: 2 June 2000 (the festa was Sunday 4 June, L. 336/2000), Easter Sunday,
no first Sundays of L. 54/1977; NL: Easter and Whit Sunday, Oudejaarsavond
(:bank); DE: Heiliger Abend and Silvester (:bank); IE: Good Friday, Easter
Sunday and weekend substitutes (:bank), none in the Act, no 2001-09-14 or
2022-03-18; PT: Corpo de Deus, 5 October, 1 November and 1 December in
2013-2015, suspended by Lei 23/2012; #24. HR: the 2002-2019 days in 2000-2001
(25 June, 8 October, Tijelovo) and 6 January 2002; SI: no 2 January
2000-2012, no 2023-08-14; SK: 17 November 2000, no 8 May / 15 September from
2027; CZ: Velký pátek 2000-2015; HU: Easter and Whit Sunday, no munkarend
transfers, no Szenteste 2026; PL: no 2018-11-12; #23. RO: 24 January, 1 June,
Vinerea Mare, 6-7 January, 30 November, Rusalii and 15 August back-dated to
2000, no 2 January; BG: no 26 December, Good Friday before 2010, no Holy
Saturday, no чл. 154(2) days or Council of Ministers transfers; GR: no 1 May
moves (2024-05-01 kept); CY: Clean Monday on the Tuesday and Pentecost Sunday
for Whit Monday; #22. EE: jõululaupäev before 2005; LV: 24 December before
2007 and 4 May before 2002, no Cabinet transfers; LT: Joninės before 2003;
#21). The corpus file stays as shipped; its days are no longer consulted.")

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
