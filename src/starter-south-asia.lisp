(in-package #:cl-stack-calendars)

;;;; Bangladesh and Pakistan (egao1980/cl-stack-calendars#47, with the BD and
;;;; PK items of #43 and #44).
;;;;
;;;; "BD"  public holidays of government offices: the general (সাধারণ ছুটি) and
;;;;       executive-order (নির্বাহী আদেশে ছুটি) days of each year's holiday list
;;;;       with its amendments and Eid notices (data/bd/holidays.sexp; Ministry
;;;;       of Public Administration lists 2013–2027 :primary, Bangladesh Bank
;;;;       copies 2002–2008 and 2010–2012 :secondary), the fixed days by era,
;;;;       and the Friday–Saturday weekend of each era (weekends.lisp).
;;;; "PK"  federal public holidays: the yearly circular and the notifications
;;;;       that fix the Eid, Ashura and Milad days after the Ruet-e-Hilal
;;;;       sighting (data/pk/holidays.sexp; Cabinet Division 2022–2026
;;;;       :primary, SBP circulars, PID releases and news 2004–2021
;;;;       :secondary), and the fixed days by era.
;;;;
;;;; Years with no list are estimated: the fixed days and tabular Islamic days,
;;;; named "(estimated)".

(defun load-south-asia-blocks (path)
  "Alist YEAR → plist of a data/bd or data/pk block file: :AUTHORITY :URI
:CONFIDENCE, :TRANSFERS (the :HOLIDAYS rows as CALENDAR-TRANSFERs),
:SUPPRESSED (the dates of the :SUPPRESSED rows), :WORKING (the :WORKING rows
as CALENDAR-WORKING-DAYs), :ROWS (every row as written, with :ROW :HOLIDAY,
:SUPPRESSED or :WORKING added; a holiday row's own :KIND is :GENERAL,
:EXECUTIVE …) and :BLOCK (the block head, rows left out)."
  (mapcar
   (lambda (block)
     (let ((auth (getf block :authority)))
       (cons (getf block :year)
             (list :authority auth
                   :uri (getf block :uri)
                   :confidence (getf block :confidence)
                   :transfers (mapcar (lambda (row)
                                        (make-calendar-transfer :to (getf row :date)
                                                                :name (getf row :name)
                                                                :authority (or (getf row :authority) auth)))
                                      (getf block :holidays))
                   :suppressed (mapcar (lambda (row) (apply #'make-date (getf row :date)))
                                       (getf block :suppressed))
                   :working (mapcar (lambda (row)
                                      (make-calendar-working-day :date (getf row :date)
                                                                 :authority (or (getf row :authority) auth)))
                                    (getf block :working))
                   :rows (loop for (key kind) in '((:holidays :holiday) (:suppressed :suppressed)
                                                   (:working :working))
                               append (mapcar (lambda (r) (list* :row kind r)) (getf block key)))
                   :block (loop for (k v) on block by #'cddr
                                unless (member k '(:holidays :suppressed :working))
                                  append (list k v))))))
   (read-data-form path)))

(defvar *bd-holidays* nil)

(defvar *pk-holidays* nil)

(defun bd-blocks ()
  (or *bd-holidays* (setf *bd-holidays* (load-south-asia-blocks (data-path "bd/holidays.sexp")))))

(defun pk-blocks ()
  (or *pk-holidays* (setf *pk-holidays* (load-south-asia-blocks (data-path "pk/holidays.sexp")))))

(defun %south-asia-decree-rows (code blocks)
  (loop for (nil . plist) in blocks
        append (cons (list* :calendar code (getf plist :block))
                     (mapcar (lambda (r) (list* :calendar code r)) (getf plist :rows)))))

(defun bd-decree-rows ()
  "Every block head and row of data/bd/holidays.sexp as a plist with
:CALENDAR \"BD\". Each carries :ISSUED and :PUBLISHED (#93)."
  (%south-asia-decree-rows "BD" (bd-blocks)))

(defun pk-decree-rows ()
  "Every block head and row of data/pk/holidays.sexp as a plist with
:CALENDAR \"PK\". Each carries :ISSUED and :PUBLISHED (#93)."
  (%south-asia-decree-rows "PK" (pk-blocks)))

(defparameter *bd-last-list-year* 2027
  "The last year with a holiday list in data/bd/holidays.sexp.")

(defparameter *pk-last-list-year* 2026
  "The last year with a holiday circular in data/pk/holidays.sexp.")

(defun bd-estimated-year-p (year)
  "True when data/bd has no list for YEAR (2000, 2001, 2009, after
*BD-LAST-LIST-YEAR*): the Islamic general days are tabular estimates, and
there are no executive-order, Hindu or Buddhist days."
  (null (assoc year (bd-blocks))))

(defun pk-estimated-year-p (year)
  "True when data/pk has no circular for YEAR (before 2004, after
*PK-LAST-LIST-YEAR*): the Eid, Ashura and Milad days are tabular estimates."
  (null (assoc year (pk-blocks))))

(defun bd-provisional-year-p (year)
  (> year *bd-last-list-year*))

(defun pk-provisional-year-p (year)
  (> year *pk-last-list-year*))

(defun bd-confidence (year)
  ":PRIMARY (Ministry of Public Administration lists, 2013–2027), :SECONDARY
(Bangladesh Bank copies and news, 2002–2008, 2010–2012), :PROVISIONAL after
the last list, :ESTIMATED for an earlier year with no list."
  (cond ((bd-provisional-year-p year) :provisional)
        ((bd-estimated-year-p year) :estimated)
        (t (getf (cdr (assoc year (bd-blocks))) :confidence))))

(defun pk-confidence (year)
  ":PRIMARY (Cabinet Division circulars and notifications, 2022–2026),
:SECONDARY (SBP circulars, PID releases and news, 2004–2021), :PROVISIONAL
after the last circular, :ESTIMATED for an earlier year with no circular."
  (cond ((pk-provisional-year-p year) :provisional)
        ((pk-estimated-year-p year) :estimated)
        (t (getf (cdr (assoc year (pk-blocks))) :confidence))))

(defun bd-jumatul-bida-estimates (year)
  "Tabular estimates of Jumatul Bida, the last Friday of Ramadan, that fall
in YEAR (a Ramadan ending in early January puts it in the year before)."
  (loop for y in (list year (cl:1+ year))
        append (loop for eid in (datetime-protocol:islamic-dates-in-gregorian-year y 10 1)
                     for k = (mod (cl:- (date-day-of-week eid) 5) 7)
                     for friday = (- eid (if (zerop k) 7 k))
                     when (cl:= year (date-year friday))
                       collect friday)))

(define-calendar bangladesh-holidays-calendar (:register "BD" :constructor bangladesh-holidays-calendar)
  ;; Fixed days by era; the lunar, executive-order and one-off days of each
  ;; listed year are data/bd/holidays.sexp rows.
  (:fixed "Shaheed Day and International Mother Language Day" 2 21 :from 1972
   :authority "Holiday lists (MoPA): general holiday")
  (:fixed "Birthday of Sheikh Mujibur Rahman" 3 17 :from 1997 :to 2001
   :authority "National Children's Day holiday under the Awami League government (start year from secondary sources); absent from the 2002 list")
  (:fixed "Birthday of Sheikh Mujibur Rahman" 3 17 :from 2010 :to 2024
   :authority "Cabinet 23 Nov 2009 (2010 list); cancelled by the Cabinet Division circular of 16 Oct 2024 and absent from the 2025 list")
  (:fixed "Independence and National Day" 3 26 :from 1972 :authority "Holiday lists (MoPA): general holiday")
  (:fixed "Bengali New Year" 4 14 :from 1972
   :authority "Holiday lists (MoPA): general holiday, executive-order holiday in the 2025 and 2027 lists")
  (:fixed "May Day" 5 1 :from 1972 :authority "Holiday lists (MoPA): general holiday")
  (:fixed "July Mass Uprising Day" 8 5 :from 2025
   :authority "Cabinet Division প্রজ্ঞাপন of 2 Jul 2025: a general holiday every year")
  (:fixed "National Mourning Day" 8 15 :from 1996 :to 2001
   :authority "Declared 8 Aug 1996; absent from the 2002 list (cancelled 2002)")
  (:fixed "National Mourning Day" 8 15 :from 2008 :to 2023
   :authority "Restored Aug 2008 after the High Court verdict of 27 Jul 2008; the 2024 day was cancelled by MoPA on 13 Aug 2024")
  (:fixed "National Revolution and Solidarity Day" 11 7 :from 2002 :to 2007
   :authority "Bank-holiday lists 2002–2007; dropped from the 2008 list")
  (:fixed "National Revolution and Solidarity Day" 11 7 :from 2026
   :authority "MoPA memo of 7 Oct 2026: a general holiday every year")
  (:fixed "Victory Day" 12 16 :from 1972 :authority "Holiday lists (MoPA): general holiday")
  (:fixed "Christmas Day" 12 25 :from 1972 :authority "Holiday lists (MoPA): general holiday")
  (:computed "Eid-ul-Fitr (estimated)" (lambda (y) (when (bd-estimated-year-p y) (eid-al-fitr y))) :from 1972
   :authority "Tabular 1 Shawwal, only in years with no list")
  (:computed "Eid-ul-Adha (estimated)" (lambda (y) (when (bd-estimated-year-p y) (eid-al-adha y))) :from 1972
   :authority "Tabular 10 Dhu al-Hijjah, only in years with no list")
  (:computed "Eid-e-Milad-un-Nabi (estimated)" (lambda (y) (when (bd-estimated-year-p y) (mawlid-date y)))
   :from 1972 :authority "Tabular 12 Rabi' al-awwal, only in years with no list")
  (:computed "Jumatul Bida (estimated)" (lambda (y) (when (bd-estimated-year-p y) (bd-jumatul-bida-estimates y)))
   :from 1972 :authority "The last Friday before tabular 1 Shawwal, only in years with no list"))

(define-calendar pakistan-holidays-calendar (:register "PK" :constructor pakistan-holidays-calendar)
  ;; Fixed days by era; the Eid, Ashura, Milad and one-off days of each
  ;; listed year are data/pk/holidays.sexp rows.
  (:fixed "Kashmir Day" 2 5 :from 1990 :authority "Yearly public-holiday circulars")
  (:fixed "Pakistan Day" 3 23 :from 1947 :authority "Yearly public-holiday circulars")
  (:fixed "Labour Day" 5 1 :from 1947 :authority "Yearly public-holiday circulars")
  (:fixed "Youm-e-Takbeer" 5 28 :from 2025
   :authority "Cabinet Division circulars for 2025 and 2026 (2024: one-off press release No. 10-01/2024-Min-II of 27 May 2024)")
  (:fixed "Independence Day" 8 14 :from 1947 :authority "Yearly public-holiday circulars")
  (:fixed "Allama Iqbal Day" 11 9 :from 1947 :to 2014
   :authority "Yearly circulars; the 2015 day was cancelled by the Ministry of Interior circular of 4 Nov 2015")
  (:fixed "Allama Iqbal Day" 11 9 :from 2022
   :authority "Cabinet Division circular No. 10/01/2022-Min-II of 8 Nov 2022; yearly circulars from 2023")
  (:fixed "Quaid-e-Azam Day / Christmas" 12 25 :from 1947 :authority "Yearly public-holiday circulars")
  (:computed "Eid-ul-Fitr (estimated)" (lambda (y) (when (pk-estimated-year-p y) (eid-al-fitr y))) :from 1947
   :authority "Tabular 1 Shawwal, only in years with no circular")
  (:computed "Eid-ul-Fitr (estimated)"
   (lambda (y) (when (pk-estimated-year-p y) (let ((d (eid-al-fitr y))) (and d (+ d 1))))) :from 1947
   :authority "Tabular 2 Shawwal")
  (:computed "Eid-ul-Fitr (estimated)"
   (lambda (y) (when (pk-estimated-year-p y) (let ((d (eid-al-fitr y))) (and d (+ d 2))))) :from 1947
   :authority "Tabular 3 Shawwal")
  (:computed "Eid-ul-Azha (estimated)" (lambda (y) (when (pk-estimated-year-p y) (eid-al-adha y))) :from 1947
   :authority "Tabular 10 Dhu al-Hijjah, only in years with no circular")
  (:computed "Eid-ul-Azha (estimated)"
   (lambda (y) (when (pk-estimated-year-p y) (let ((d (eid-al-adha y))) (and d (+ d 1))))) :from 1947
   :authority "Tabular 11 Dhu al-Hijjah")
  (:computed "Eid-ul-Azha (estimated)"
   (lambda (y) (when (pk-estimated-year-p y) (let ((d (eid-al-adha y))) (and d (+ d 2))))) :from 1947
   :authority "Tabular 12 Dhu al-Hijjah")
  (:computed "Ashura (estimated)" (lambda (y) (when (pk-estimated-year-p y) (islamic-date-in-gregorian-year y 1 9)))
   :from 1947 :authority "Tabular 9 Muharram, only in years with no circular")
  (:computed "Ashura (estimated)" (lambda (y) (when (pk-estimated-year-p y) (islamic-date-in-gregorian-year y 1 10)))
   :from 1947 :authority "Tabular 10 Muharram, only in years with no circular")
  (:computed "Eid Milad-un-Nabi (estimated)" (lambda (y) (when (pk-estimated-year-p y) (mawlid-date y)))
   :from 1947 :authority "Tabular 12 Rabi' al-awwal, only in years with no circular"))

(defun %south-asia-calendar (class blocks year transfers suppressed working-days)
  (flet ((of-year (key)
           (loop for (nil . plist) in blocks
                 append (remove-if-not (lambda (x)
                                         (or (null year)
                                             (cl:= year (date-year (etypecase x
                                                                     (date x)
                                                                     (calendar-working-day (calendar-working-day-date x)))))))
                                       (getf plist key)))))
    (make-instance class
                   :transfers (or transfers
                                  (if year
                                      (transfers-touching-year blocks year)
                                      (all-block-transfers blocks)))
                   :suppressed-dates (or suppressed (of-year :suppressed))
                   :working-days (or working-days (of-year :working)))))

(defun bangladesh-holidays-calendar (&key year transfers suppressed working-days)
  "Public holidays of Bangladeshi government offices (\"BD\"): the fixed days
by era, and the general and executive-order days, cancellations and working
Saturdays of data/bd/holidays.sexp. Without YEAR every listed year applies
(the registered calendar); with YEAR only that year's rows. Confidence by
year: BD-CONFIDENCE."
  (%south-asia-calendar 'bangladesh-holidays-calendar (bd-blocks) year transfers suppressed working-days))

(defun pakistan-holidays-calendar (&key year transfers suppressed)
  "Federal public holidays of Pakistan (\"PK\"): the fixed days by era, and
the declared Eid, Ashura, Milad and one-off days of data/pk/holidays.sexp.
Without YEAR every listed year applies (the registered calendar); with YEAR
only that year's rows. Confidence by year: PK-CONFIDENCE."
  (%south-asia-calendar 'pakistan-holidays-calendar (pk-blocks) year transfers suppressed nil))
