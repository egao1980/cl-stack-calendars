(in-package #:cl-stack-calendars)

;;;; Weekend specs and per-country weekend eras (#31, #44).
;;;;
;;;; A WEEKEND SPEC is either a plain list of ISO weekdays (1=Mon .. 7=Sun),
;;;; e.g. (6 7), or a list of ERAS (FROM . DAYS) in date order: FROM is NIL
;;;; (open start), a year, a DATE or a (Y M D) list, and DAYS holds from FROM
;;;; until the next era. *COUNTRY-WEEKEND-ERAS* is the cited table both the
;;;; starters (DEFINE-CALENDAR :REGISTER) and the corpus (COUNTRY-CALENDAR)
;;;; read; codes it does not list keep (6 7).

(defun weekend-eras-spec-p (spec)
  "True when SPEC is an era list rather than a plain weekday list."
  (and (consp spec) (consp (first spec))))

(defun %era-start (from)
  (cond ((null from) nil)
        ((integerp from) (make-date from 1 1))
        ((typep from 'date) from)
        ((and (consp from) (= (length from) 3)) (apply #'make-date from))
        (t (error 'invalid-holiday-rule
                  :message (format nil "invalid weekend era start ~s" from)))))

(defun normalize-weekend-spec (spec)
  "SPEC with era starts as DATEs (sorted), or a plain weekday list unchanged.
Signals INVALID-HOLIDAY-RULE for a malformed spec."
  (flet ((check-days (days)
           (unless (and (listp days) (every (lambda (d) (and (integerp d) (<= 1 d 7))) days))
             (error 'invalid-holiday-rule
                    :message (format nil "invalid weekend days ~s (want ISO weekdays 1-7)" days)))
           days))
    (if (weekend-eras-spec-p spec)
        (sort (mapcar (lambda (era)
                        (cons (%era-start (car era)) (check-days (cdr era))))
                      spec)
              (lambda (a b)
                (cond ((null (car a)) (car b))
                      ((null (car b)) nil)
                      (t (< (car a) (car b))))))
        (check-days spec))))

(defun weekend-days-at (spec date)
  "The weekday list SPEC gives for DATE."
  (if (weekend-eras-spec-p spec)
      (let ((days '()))
        (dolist (era spec days)
          (if (or (null (car era)) (<= (car era) date))
              (setf days (cdr era))
              (return days))))
      spec))

(defun weekend-spec-current-days (spec)
  "The weekday list of SPEC's latest era (or SPEC itself)."
  (if (weekend-eras-spec-p spec)
      (cdr (car (last spec)))
      spec))

(defparameter *country-weekend-eras*
  '(("SA" ((nil 4 5) ((2013 6 29) 5 6))
     "Royal Order A/185 of 2013-06-23 (SPA): Fri–Sat from 2013-06-29 — https://www.arabnews.com/news/455923 ; https://www.crowell.com/en/insights/client-alerts/saudi-arabia-changes-weekend-to-friday-saturday-from-29-june-2013")
    ("AE" ((nil 4 5) ((2006 9 1) 5 6) ((2022 1 1) 6 7))
     "Federal Cabinet 2006 (Fri–Sat from 2006-09-01) — https://www.dawn.com/news/208523 ; WAM 2021-12-07 (Sat–Sun, Friday half day, from 2022-01-01) — https://wam.ae/en/article/hszrdpi4-uae-government-announces-four-and-half-day-working ; https://www.mediaoffice.ae/en/news/2021/December/07-12/The-changes-to-the-working-week-system (Sharjah government: Fri–Sun)")
    ("BH" ((nil 4 5) ((2006 9 1) 5 6))
     "Cabinet Decision No. 45 of 2006 (Fri–Sat from 2006-09-01) — https://www.lloc.gov.bh/Legislation/HTM/RCAB4506 ; https://www.dawn.com/news/208523")
    ("QA" ((nil 4 5) ((2003 8 1) 5 6))
     "Cabinet decision 2003-07-20 (QNA), Fri–Sat from 2003-08-01 — https://www.arabnews.com/node/234601")
    ("KW" ((nil 4 5) ((2007 9 1) 5 6))
     "Cabinet decision 2007 (KUNA), Fri–Sat from 2007-09-01 — https://en-archive.aawsat.com/2007/05/27/kuwait-switches-to-friday-saturday-weekend/ ; https://www.dawn.com/news/263128")
    ("OM" ((nil 4 5) ((2013 5 1) 5 6))
     "Royal Decree, April 2013 (ONA), Fri–Sat from 2013-05-01 — https://gulfnews.com/world/gulf/oman/oman-to-follow-uniform-friday-saturday-weekend-1.1167447")
    ("JO" ((nil 4 5) ((2000 1 1) 5 6))
     "Government decision effective January 2000 (month only; APD 2000-01-05) — http://archive.wfn.org/2000/01/msg00078.html")
    ("YE" ((nil 4 5) ((2013 8 15) 5 6))
     "Council of Ministers Resolution No. 179 of 2013 (Ministry of Civil Service): Thursday a working day from 2013-08-15 — Yemen Post, August 2013 (https://www.yemenpost.net/Detail123456789.aspx?ID=3&SubID=7132&MainCat=3)")
    ("DZ" ((nil 4 5) ((2009 8 14) 5 6))
     "Décret exécutif n° 09-244 du 22 juillet 2009 (JORA n° 44, 2009-07-26), Fri–Sat from 2009-08-14 — https://archive.gazettes.africa/archive/dz/2009/dz-government-gazette-dated-2009-07-26-no-44.pdf ; http://news.bbc.co.uk/2/hi/africa/8198365.stm")
    ("LY" ((nil 4 5) ((2012 1 15) 5) ((2012 8 3) 5 6))
     "Decree 1257/1990 (Thu–Fri); Cabinet Decree 10/2012 (Friday rest) — https://security-legislation.ly/latest-laws/decree-no-10-of-2012-on-adopting-certain-provisions-on-official-hours ; Cabinet Decision 356/2012 of 2012-08-03 (Fri–Sat) — https://anba.com.br/en/libyans-two-resting-days-a-week/")
    ("IQ" ((nil 5) ((2005 2 26) 5 6))
     "Interim government decision, February 2005: Saturday added to Friday (AP 2005-02-26, first-ever two-day weekend) — https://www.nbcnews.com/id/wbna7036528 ; Official Holidays Law 2024 art. 1 (Fri–Sat) — https://moj.gov.iq/upload/pdf/4777_453.pdf")
    ("SD" ((nil 5) ((2008 1 26) 5 6))
     "Council of Ministers, January 2008: Fri–Sat from 2008-01-26 — https://sudantribune.com/?p=25544")
    ("BD" ((nil 5) ((1997 6 1) 5 6) ((2001 11 5) 5) ((2005 9 9) 5 6))
     "Fri–Sat from June 1997 (month only), cancelled 2001-11-05 (Xinhua) — http://en.people.cn/200509/06/eng20050906_206869.html ; Cabinet 2005-09-05: Fri–Sat from 2005-09-09 — https://www.dawn.com/news/155564")
    ("EG" (5 6)
     "Government Fri–Sat week (ministerial decree of 2006-01-04; start date unconfirmed, so no era) — https://www.thenationalnews.com/mena/2021/12/07/when-is-the-weekend-in-the-arab-world")
    ("SY" (5 6)
     "Fri–Sat (Ministry of Administrative Development, 2024; start year unconfirmed, so no era) — https://www.enabbaladi.net/730701")
    ("IL" (5 6)
     "Hours of Work and Rest Law 5711-1951 (Saturday rest); public sector Sun–Thu since 1989 — https://www.jta.org/archive/cabinet-okays-in-principle-a-5-day-work-week-for-civil-servants")
    ("IR" (5)
     "Friday weekly rest; government Thursday half day (2025 Thu–Fri bill not in force) — https://www.dawn.com/news/1833771")
    ("AF" (5)
     "Government offices Sat–Wed full days, Thursday half day, Friday rest (Ministry of Labour, 2026) — https://atlaspress.news/en/2026/09/16/taliban-sets-government-office-hours-second-half-year/")
    ("NP" ((nil 6) ((2022 5 15) 6 7) ((2022 6 15) 6) ((2026 4 6) 6 7))
     "Saturday rest; Cabinet 2022-04-26 trial Sat–Sun 2022-05-15, rolled back from 2022-06-15 — https://kathmandupost.com/national/2022/04/27/government-decides-two-days-public-holiday-in-a-week ; https://kathmandupost.com/national/2022/06/06/government-rolls-back-sunday-holiday-rule ; Cabinet 2026-04-05: Sat–Sun from 2026-04-06 — https://kathmandupost.com/national/2026/04/05/government-announces-two-day-weekend-amid-fuel-crisis"))
  "Rows (CODE SPEC SOURCE): official weekend eras (government/banking week)
since 1990, with the decree or report each change rests on. Secondary
sources are named where no primary text was reachable.")

(defun %country-weekend-row (code)
  (assoc (string-upcase code) *country-weekend-eras* :test #'string=))

(defun country-weekend-days (code)
  "The weekend SPEC (normalized) for country CODE, or (6 7) when unlisted."
  (let ((row (%country-weekend-row code)))
    (if row (normalize-weekend-spec (second row)) (list 6 7))))

(defun weekend-era-codes ()
  "Country codes with a cited entry in *COUNTRY-WEEKEND-ERAS*."
  (mapcar #'first *country-weekend-eras*))

(defun weekend-era-source (code)
  "The citation string for CODE's weekend, or NIL."
  (third (%country-weekend-row code)))

(defclass weekend-spec-mixin ()
  ((weekend-spec :initarg :weekend-days :initform (list 6 7)
                 :reader calendar-weekend-spec
                 :documentation "Weekend SPEC: weekday list or eras."))
  (:documentation "A calendar whose weekend may change by era (see
NORMALIZE-WEEKEND-SPEC). :WEEKEND-DAYS takes a plain list or an era list."))

(defmethod initialize-instance :after ((calendar weekend-spec-mixin) &key)
  (setf (slot-value calendar 'weekend-spec)
        (normalize-weekend-spec (slot-value calendar 'weekend-spec))))

(defmethod calendar-weekend-days ((calendar weekend-spec-mixin))
  (weekend-spec-current-days (calendar-weekend-spec calendar)))

(defmethod (setf calendar-weekend-days) (spec (calendar weekend-spec-mixin))
  (setf (slot-value calendar 'weekend-spec) (normalize-weekend-spec spec)))

(defmethod weekend-days-on ((calendar weekend-spec-mixin) date)
  (weekend-days-at (calendar-weekend-spec calendar) date))

(defun calendar-weekend-eras (calendar)
  "CALENDAR's weekend eras as (FROM . DAYS), or NIL when it has one weekend."
  (let ((spec (and (typep calendar 'weekend-spec-mixin) (calendar-weekend-spec calendar))))
    (and (weekend-eras-spec-p spec) (copy-list spec))))
