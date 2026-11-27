(in-package #:cl-stack-calendars)

;;;; Internal rule representation backing RULE-CALENDAR / DEFINE-CALENDAR.
;;;; These structs and RULE-OCCURRENCE are the implementation of the
;;;; declarative rule DSL; calendars never consult them except through
;;;; RULE-OCCURRENCE.

(defstruct holiday-rule
  (name nil :type (or null string))
  ;; Civil validity window for the rule itself (not versioned “as-of” knowledge).
  ;; Integer = Gregorian year bound; DATE = inclusive day bound. NIL = open.
  (from nil :type (or null integer date))
  (to nil :type (or null integer date))
  ;; Normative citation(s): statute, EO, ECB decision, proclamation, etc.
  ;; Source of truth for WHEN the holiday exists and HOW it is observed.
  (authority nil :type (or null string list)))

(defparameter *observed-policies*
  '((:us-federal-in-lieu
     :implements (:nearest-weekday)
     :authority ("5 U.S.C. § 6103(b) (Saturday → preceding Friday)"
                 "Exec. Order No. 11582 § 3(a) (Sunday → following Monday)")
     :uri ("https://uscode.house.gov/view.xhtml?req=granuleid:USC-prelim-title5-section6103"
           "https://www.federalregister.gov/executive-order/11582"))
    (:nyse-rule-7-2
     :implements (:nyse-rule-7-2)
     :authority ("NYSE Rule 7.2 (Holidays) — Saturday holiday → preceding Friday closed, Sunday holiday → following Monday closed, unless unusual business conditions exist such as the ending of a monthly or yearly accounting period (a Saturday New Year's Day leaves Friday Dec 31 open)")
     :uri ("https://www.nyse.com/markets/hours-calendars"))
    (:uk-proclamation-substitute
     :implements (:next-weekday)
     :authority ("Banking and Financial Dealings Act 1971 s.1 & Sch.1; Royal Proclamations (substitute weekday when a bank holiday falls on a weekend — normally the following Monday; exclusive across Christmas/Boxing)"
                 "https://www.legislation.gov.uk/ukpga/1971/80"
                 "https://www.gov.uk/bank-holidays"))
    (:jp-furikae
     :implements (:jp-furikae)
     :authority ("国民の祝日に関する法律（昭和23年法律第178号）第3条第2項 — 祝日が日曜日に当たるとき、その日後においてその日に最も近い国民の祝日でない日を休日とする（土曜は振替なし）")
     :uri ("https://www8.cao.go.jp/chosei/shukujitsu/gaiyou.html"))
    (:jp-kokumin-no-kyujitsu
     :implements (:sandwich)
     :authority ("国民の祝日に関する法律第3条第3項 — その前日及び翌日が国民の祝日である日は休日とする")
     :uri ("https://www8.cao.go.jp/chosei/shukujitsu/gaiyou.html"))
    (:ru-tk-112-transfer
     :implements (:ru-tk-112-transfer)
     ;; ч. 5: a decree that moves the weekend day itself replaces the ч. 2 transfer.
     :decree-cancels-substitute t
     :authority ("Трудовой кодекс РФ ст. 112 ч. 2 — при совпадении выходного и нерабочего праздничного дня выходной переносится на следующий после праздничного рабочий день; с 2013 г. (ФЗ от 23.04.2012 № 35-ФЗ) — за исключением выходных, совпадающих с праздниками 1–8 января"
                 "Трудовой кодекс РФ ст. 112 ч. 5 — Правительство РФ переносит выходные дни нормативным актом; перенесённый постановлением выходной не переносится повторно по ч. 2")
     :uri ("http://www.consultant.ru/document/cons_doc_LAW_34683/")))
  "Normative observance policies. Prefer these over mechanical primitives in
starter calendars; primitives exist only as implementation atoms.
:DECREE-CANCELS-SUBSTITUTE T means a calendar transfer whose FROM is the
nominal date or its substitute day replaces the substitute.")

(defun observed-policy-decree-cancels-substitute-p (observed)
  "True when a decree transfer from a holiday or its substitute day cancels the
substitute that OBSERVED would place (see *OBSERVED-POLICIES*)."
  (getf (cdr (assoc observed *observed-policies*)) :decree-cancels-substitute))

(defstruct (fixed-holiday-rule (:include holiday-rule))
  "A holiday on a fixed MONTH/DAY every year (e.g. Christmas), optionally
rearranged via a statute-backed OBSERVED policy when it falls on a weekend."
  (month 1 :type (integer 1 12))
  (day 1 :type (integer 1 31))
  (observed nil)
  ;; When set, OBSERVED applies only on/after this year or date (e.g. JP 振替 from 1973).
  (observed-from nil :type (or null integer date))
  (bridge nil :type (member nil :adjacent)))

(defstruct (nth-weekday-holiday-rule (:include holiday-rule))
  "A holiday on the NTH occurrence of WEEKDAY in MONTH every year (e.g. the
3rd Monday of January); NTH may be 1-5, or -1 for the last occurrence."
  (month 1 :type (integer 1 12))
  (weekday 1 :type (integer 1 7))
  (nth 1 :type integer)
  (observed nil)
  (observed-from nil :type (or null integer date))
  (bridge nil :type (member nil :adjacent)))

(defstruct (easter-holiday-rule (:include holiday-rule))
  "A holiday OFFSET days from Western (or, if ORTHODOX, Orthodox) Easter
Sunday every year (e.g. Good Friday is offset -2)."
  (offset 0 :type integer)
  (orthodox nil)
  (observed nil)
  (observed-from nil :type (or null integer date))
  (bridge nil :type (member nil :adjacent)))

(defstruct (computed-holiday-rule (:include holiday-rule))
  "Holiday whose nominal date is produced by COMPUTE, a function of one
argument (Gregorian YEAR) returning a DATE. Used for astronomical equinoxes,
Chinese lunar festivals, and sunrise/sunset-bound festivals. COMPUTE should
close over an ASTRO-LOCATION (lat/lon/zone) when the rule depends on local
solar day boundaries — see datetime-protocol:+TOKYO+, +BEIJING+, +DELHI+,
+JERUSALEM+."
  (compute nil :type (or function symbol))
  (observed nil)
  (observed-from nil :type (or null integer date))
  (bridge nil :type (member nil :adjacent)))
(defun normalize-rule-bound (bound)
  "Accept NIL, a Gregorian year integer, a DATE, or a (YEAR MONTH DAY) list."
  (cond ((null bound) nil)
        ((typep bound 'date) bound)
        ((integerp bound) bound)
        ((and (consp bound) (= (length bound) 3))
         (destructuring-bind (y m d) bound
           (make-date y m d)))
        (t (error 'invalid-holiday-rule
                  :message (format nil "invalid :from/:to bound ~s (want year, date, or (y m d))"
                                   bound)))))

(defun rule-valid-at-p (rule date)
  "True when DATE falls inside RULE's inclusive civil validity window.
Year bounds apply to DATE's Gregorian year; date bounds compare by RD."
  (flet ((from-ok (bound)
           (cond ((null bound) t)
                 ((integerp bound) (>= (date-year date) bound))
                 (t (>= date bound))))
         (to-ok (bound)
           (cond ((null bound) t)
                 ((integerp bound) (<= (date-year date) bound))
                 (t (<= date bound)))))
    (and (from-ok (holiday-rule-from rule))
         (to-ok (holiday-rule-to rule)))))

;;; --- weekday keywords ----------------------------------------------------

(defparameter *weekday-keywords*
  '((:monday . 1) (:tuesday . 2) (:wednesday . 3) (:thursday . 4)
    (:friday . 5) (:saturday . 6) (:sunday . 7))
  "ISO weekday numbers (1=Monday..7=Sunday) for the keyword spellings accepted
by DEFINE-CALENDAR's :NTH-WEEKDAY clause.")

(defun normalize-weekday (weekday)
  "Accepts either an ISO weekday integer (1-7) or a keyword like :MONDAY."
  (etypecase weekday
    (integer weekday)
    (keyword (or (cdr (assoc weekday *weekday-keywords*))
                 (error 'invalid-holiday-rule
                        :message (format nil "unknown weekday keyword ~s" weekday))))))

(defun nth-weekday-of-month (year month weekday nth)
  "The NTH occurrence of WEEKDAY (1=Monday..7=Sunday) in YEAR/MONTH. NTH may
be 1-5, or -1 for the last occurrence in the month."
  (if (eql nth -1)
      (loop for d = (make-date year month (days-in-gregorian-month year month))
              then (- d 1)
            until (= (date-day-of-week d) weekday)
            finally (return d))
      (let* ((first-date (make-date year month 1))
             (offset (mod (- weekday (date-day-of-week first-date)) 7)))
        (+ first-date (+ offset (* 7 (1- nth)))))))

;;; --- Observance (normative policies → mechanical atoms) -------------------
;;;;
;;;; Prefer statute-named OBSERVED keywords in starter calendars:
;;;;
;;;;   :US-FEDERAL-IN-LIEU          5 U.S.C. § 6103(b) + EO 11582 § 3(a)
;;;;   :UK-PROCLAMATION-SUBSTITUTE  BFDA 1971 + Royal Proclamations / gov.uk
;;;;   :JP-FURIKAE                  祝日法第3条第2項 (Sunday only → next free day)
;;;;
;;;; Mechanical primitives (implementation atoms, not country defaults):
;;;;   :NEAREST-WEEKDAY :NEXT-WEEKDAY :PREVIOUS-WEEKDAY :MONDAY :SUBSTITUTE-NEXT
;;;;
;;;; :BRIDGE :ADJACENT is NOT a general legal default (Spanish “puente” is
;;;; typically customary / collective-agreement). Only attach it when the
;;;; rule's :AUTHORITY cites a normative bridge. Japan’s continuous holiday
;;;; block is :SANDWICH on the calendar (祝日法第3条第3項), not :BRIDGE.

(defun weekendp (date weekend-days)
  "True when DATE is a weekend day under WEEKEND-DAYS, a weekday list or an
era list (see WEEKEND-DAYS-AT), so observance shifts follow the weekend in
force on each day."
  (and (member (date-day-of-week date) (weekend-days-at weekend-days date)) t))

(defun sundayp (date)
  (= (date-day-of-week date) 7))

(defun shift-forward-past-weekend (date weekend-days)
  "DATE, or the first following day that is not a WEEKEND-DAYS weekday.
Signals CALENDAR-ERROR when WEEKEND-DAYS covers every day of a week."
  (loop for k from 0 below 8
        for d = (+ date k)
        unless (weekendp d weekend-days)
          do (return-from shift-forward-past-weekend d))
  (error 'calendar-error
         :message (format nil "weekend ~s covers every weekday after ~a" weekend-days date)))

(defun last-weekday-of-month-p (date weekend-days)
  "True when DATE is the last non-WEEKEND-DAYS day of its month."
  (/= (date-month (shift-forward-past-weekend (+ date 1) weekend-days))
      (date-month date)))

(defun shift-nyse-rule-7-2 (date weekend-days)
  "NYSE Rule 7.2: a Saturday holiday closes the preceding Friday, a Sunday
holiday the following Monday — unless the Friday ends a monthly or yearly
accounting period (so a Saturday New Year's Day leaves Dec 31 open)."
  (cond ((not (weekendp date weekend-days)) date)
        ((weekendp (- date 1) weekend-days)
         (shift-forward-past-weekend date weekend-days))
        ((last-weekday-of-month-p (- date 1) weekend-days) date)
        (t (- date 1))))

(defun canonicalize-observed (observed)
  "Map statute-named policies onto mechanical atoms (or leave specialty policies)."
  (case observed
    (:us-federal-in-lieu :nearest-weekday)
    (:uk-proclamation-substitute :next-weekday)
    (otherwise observed)))

(defun ru-new-year-holiday-block-p (date)
  "ТК РФ ст. 112 ч. 2 (ред. ФЗ от 23.04.2012 № 35-ФЗ, с 2013 г.): выходные,
совпадающие с нерабочими праздничными днями 1–8 января, исключены из
автоматического переноса на следующий рабочий день — их переносит
Правительство РФ постановлением (ч. 5). До 2013 г. январские праздники,
выпавшие на выходной, переносились по общему правилу ч. 2 (КЗоТ ст. 65)."
  (and (>= (date-year date) 2013)
       (= (date-month date) 1)
       (<= 1 (date-day date) 8)))

(defun apply-bridge-days (dates weekend-days bridge)
  "Extend DATES only when an AUTHORITY-cited :BRIDGE is present."
  (ecase bridge
    ((nil) dates)
    (:adjacent
     (let ((extra '()))
       (dolist (d dates)
         (unless (weekendp d weekend-days)
           (case (date-day-of-week d)
             (2 (push (- d 1) extra))
             (4 (push (+ d 1) extra)))))
       (remove-duplicates (append dates (nreverse extra)) :test #'=)))))

(defun observance-moves (nominal observed weekend-days)
  "How the (possibly statute-named) OBSERVED policy treats NOMINAL.
Returns (values KEEP-NOMINAL-P DIRECTION): KEEP-NOMINAL-P is true when NOMINAL
itself stays a holiday; DIRECTION is NIL (no substitute), :FORWARD or
:BACKWARD (one substitute placed by PLACE-SUBSTITUTE). A pure function of the
policy and the weekday: it never looks at other rules or their order."
  (let ((weekend (weekendp nominal weekend-days)))
    (ecase (canonicalize-observed observed)
      ((nil) (values t nil))
      (:nearest-weekday
       (cond ((not weekend) (values t nil))
             ((weekendp (- nominal 1) weekend-days) (values nil :forward))
             (t (values nil :backward))))
      ((:next-weekday :monday)
       (if weekend (values nil :forward) (values t nil)))
      (:previous-weekday
       (if weekend (values nil :backward) (values t nil)))
      (:sunday-to-monday
       ;; Sunday → following weekday; a Saturday holiday is not moved.
       (if (sundayp nominal) (values nil :forward) (values t nil)))
      (:nyse-rule-7-2
       (let ((shifted (shift-nyse-rule-7-2 nominal weekend-days)))
         (cond ((= shifted nominal) (values t nil))
               ((< shifted nominal) (values nil :backward))
               (t (values nil :forward)))))
      (:substitute-next
       (values t (and weekend :forward)))
      (:jp-furikae
       (values t (and (sundayp nominal) :forward)))
      (:ru-tk-112-transfer
       ;; ТК РФ ст. 112 ч. 2: weekend∩holiday → next workday,
       ;; except Jan 1–8 (Government decree transfers those).
       (values t (and weekend
                      (not (ru-new-year-holiday-block-p nominal))
                      :forward))))))

(defparameter *substitute-search-limit* 366
  "Most days PLACE-SUBSTITUTE walks before it gives up and signals.")

(defun place-substitute (nominal direction weekend-days claimedp)
  "The substitute day for NOMINAL: the first day after (DIRECTION :FORWARD)
or before (:BACKWARD) NOMINAL that is neither a WEEKEND-DAYS weekday nor
CLAIMEDP. CLAIMEDP is a predicate on dates (days already taken). Signals
CALENDAR-ERROR when no such day lies within *SUBSTITUTE-SEARCH-LIMIT* days."
  (let ((step (ecase direction (:forward 1) (:backward -1))))
    (loop for k from 1 to *substitute-search-limit*
          for d = (+ nominal (* step k))
          unless (or (weekendp d weekend-days) (funcall claimedp d))
            do (return-from place-substitute d))
    (error 'calendar-error
           :message (format nil "no free day within ~d days ~(~a~) of ~a"
                            *substitute-search-limit* direction nominal))))

(defun observe-dates (nominal observed bridge weekend-days &optional claimed)
  "Holiday dates from NOMINAL under a (possibly statute-named) OBSERVED policy,
for one rule on its own. CLAIMED (list of dates) are days a substitute must
skip. RULE-CALENDAR does not call this: it places every rule's substitute
against every rule's nominal date (see %RULE-CALENDAR-YEAR-MAP)."
  (multiple-value-bind (keep direction) (observance-moves nominal observed weekend-days)
    (let ((base (append (when keep (list nominal))
                        (when direction
                          (list (place-substitute
                                 nominal direction weekend-days
                                 (lambda (d) (member d claimed :test #'=))))))))
      (apply-bridge-days base weekend-days bridge))))

(defun apply-sandwich-holidays (date-name-alist &optional from)
  "祝日法第3条第3項: a day whose previous and next days are both holidays
becomes a holiday (国民の休日), including Saturday. DATE-NAME-ALIST is a
list of (DATE . NAME); returns an extended alist. FROM (a DATE or NIL)
bounds the sandwich days: none before FROM is added."
  (let* ((dates (sort (mapcar #'car date-name-alist) #'<))
         (set dates)
         (extra '()))
    (dolist (d dates)
      (let ((mid (+ d 1)))
        (when (and (or (null from) (>= mid from))
                   (not (member mid set :test #'=))
                   (member (+ mid 1) set :test #'=)
                   (/= (date-day-of-week mid) 7))
          ;; Sunday is already 休日; treating it as 国民の休日 would 振替 the next day.
          ;; Saturday 国民の休日 is listed in the 内閣府 CSV from the 1990s.
          (push (cons mid "国民の休日") extra)
          (push mid set))))
    (append date-name-alist (nreverse extra))))

(defun apply-jp-furikae-chain (date-name-alist &optional from chain-from)
  "祝日法第3条第2項 振替休日.

   昭和48年法律第10号 (FROM, 1973-04-12): a Sunday 祝日 observes on the next
   calendar day. If that day is already a 祝日, no extra day is inserted
   (1987/1992/1998 Golden Week: Sun 5/3 → Mon 5/4 みどりの日, no Tue 5/6).

   平成19年法律第5号 (CHAIN-FROM, 2007-01-01): observe on the next day that
   is not already a 国民の祝日 (chains over consecutive 祝日 — 2008/2020-05-06).
   NIL CHAIN-FROM keeps the post-2007 wording. Does not walk past a 振替 that
   per-rule observance already inserted."
  (let* ((dates (sort (remove-duplicates (mapcar #'car date-name-alist) :test #'=) #'<))
         (original dates)
         (extra '()))
    (flet ((insert-obs (obs)
             (unless (or (member obs original :test #'=)
                         (member obs dates :test #'=))
               (push (cons obs "振替休日") extra))))
      (dolist (d dates)
        (when (and (sundayp d)
                   (or (null from) (>= d from)))
          (if (or (null chain-from) (>= d chain-from))
              (loop for n = (+ d 1) then (+ n 1)
                    unless (member n original :test #'=)
                      do (insert-obs n)
                         (return))
              (insert-obs (+ d 1))))))
    (append date-name-alist (nreverse extra))))

;;; --- RULE-OCCURRENCES -------------------------------------------------

(defgeneric rule-nominal-date (rule year)
  (:documentation "Nominal (pre-observance) DATE of RULE in YEAR, or NIL."))

(defmethod rule-nominal-date ((rule fixed-holiday-rule) year)
  (make-date year (fixed-holiday-rule-month rule) (fixed-holiday-rule-day rule)))

(defmethod rule-nominal-date ((rule nth-weekday-holiday-rule) year)
  (nth-weekday-of-month year (nth-weekday-holiday-rule-month rule)
                         (nth-weekday-holiday-rule-weekday rule)
                         (nth-weekday-holiday-rule-nth rule)))

(defmethod rule-nominal-date ((rule easter-holiday-rule) year)
  (+ (if (easter-holiday-rule-orthodox rule) (easter-orthodox year) (easter-western year))
     (easter-holiday-rule-offset rule)))

(defmethod rule-nominal-date ((rule computed-holiday-rule) year)
  (first (rule-nominal-dates rule year)))

;;; --- several nominal dates per year (computed rules, Hijri dates) --------
;;;;
;;;; A Hijri year is about 11 days shorter than a Gregorian one, so a Hijri
;;;; date falls twice in some Gregorian years (Eid al-Fitr 2000, 2033; Eid
;;;; al-Adha 2006, 2039; …). The helpers below shadow datetime-protocol's
;;;; single-date versions: they return occurrence *HIJRI-OCCURRENCE* (0 = the
;;;; earlier) and note that a Hijri date was asked for. RULE-NOMINAL-DATES
;;;; calls a computed rule's COMPUTE once per occurrence, so the existing
;;;; starter forms such as (+ (eid-al-adha y) 2) yield both blocks, including
;;;; days that run past 31 December.

(defvar *hijri-occurrence* 0
  "Index (0 = earlier) of the Hijri occurrence the helpers return.")

(defvar *hijri-consulted* nil
  "Set to T when an occurrence-aware Hijri helper is called.")

(defun islamic-date-in-gregorian-year (g-year month day)
  "Occurrence *HIJRI-OCCURRENCE* of tabular Islamic MONTH/DAY in Gregorian
G-YEAR, or NIL when the year holds fewer occurrences."
  (setf *hijri-consulted* t)
  (nth *hijri-occurrence*
       (datetime-protocol:islamic-dates-in-gregorian-year g-year month day)))

(defun eid-al-fitr (g-year)
  "1 Shawwal (tabular) in Gregorian G-YEAR; see *HIJRI-OCCURRENCE*."
  (islamic-date-in-gregorian-year g-year 10 1))

(defun eid-al-adha (g-year)
  "10 Dhu al-Hijjah (tabular) in Gregorian G-YEAR; see *HIJRI-OCCURRENCE*."
  (islamic-date-in-gregorian-year g-year 12 10))

(defun islamic-new-year-date (g-year)
  "1 Muharram (tabular) in Gregorian G-YEAR; see *HIJRI-OCCURRENCE*."
  (islamic-date-in-gregorian-year g-year 1 1))

(defun mawlid-date (g-year)
  "12 Rabiʿ al-awwal (tabular) in Gregorian G-YEAR; see *HIJRI-OCCURRENCE*."
  (islamic-date-in-gregorian-year g-year 3 12))

(defun %compute-dates (value)
  "COMPUTE's VALUE as a list of dates: NIL, one DATE, or a list of them."
  (if (listp value) (remove nil value) (list value)))

(defgeneric rule-nominal-dates (rule year)
  (:documentation "Every nominal (pre-observance) DATE of RULE for YEAR, in
order. Most rules have at most one; a computed rule may have several.")
  (:method ((rule holiday-rule) year)
    (let ((date (rule-nominal-date rule year)))
      (and date (list date))))
  (:method ((rule computed-holiday-rule) year)
    (let* ((compute (computed-holiday-rule-compute rule))
           (*hijri-consulted* nil)
           (dates (let ((*hijri-occurrence* 0))
                    (%compute-dates (funcall compute year)))))
      ;; A Gregorian year holds at most two occurrences of a Hijri date.
      (when *hijri-consulted*
        (let ((*hijri-occurrence* 1))
          (setf dates (append dates (%compute-dates (funcall compute year))))))
      (remove-duplicates dates :test #'= :from-end t))))

(defgeneric rule-observed (rule)
  (:method ((rule fixed-holiday-rule)) (fixed-holiday-rule-observed rule))
  (:method ((rule nth-weekday-holiday-rule)) (nth-weekday-holiday-rule-observed rule))
  (:method ((rule easter-holiday-rule)) (easter-holiday-rule-observed rule))
  (:method ((rule computed-holiday-rule)) (computed-holiday-rule-observed rule)))

(defgeneric rule-observed-from (rule)
  (:method ((rule holiday-rule)) nil)
  (:method ((rule fixed-holiday-rule)) (fixed-holiday-rule-observed-from rule))
  (:method ((rule nth-weekday-holiday-rule)) (nth-weekday-holiday-rule-observed-from rule))
  (:method ((rule easter-holiday-rule)) (easter-holiday-rule-observed-from rule))
  (:method ((rule computed-holiday-rule)) (computed-holiday-rule-observed-from rule)))

(defun %observed-applies-at-p (observed-from date)
  "True when OBSERVED-FROM is NIL or DATE is on/after that bound."
  (cond ((null observed-from) t)
        ((integerp observed-from) (>= (date-year date) observed-from))
        (t (>= date observed-from))))

(defgeneric rule-bridge (rule)
  (:method ((rule fixed-holiday-rule)) (fixed-holiday-rule-bridge rule))
  (:method ((rule nth-weekday-holiday-rule)) (nth-weekday-holiday-rule-bridge rule))
  (:method ((rule easter-holiday-rule)) (easter-holiday-rule-bridge rule))
  (:method ((rule computed-holiday-rule)) (computed-holiday-rule-bridge rule)))

(defgeneric rule-authority (rule)
  (:method ((rule holiday-rule)) (holiday-rule-authority rule)))

(defgeneric rule-occurrences (rule year weekend-days &optional claimed)
  (:documentation "List of DATEs RULE produces in YEAR after statute-backed
OBSERVED rearrangement. CLAIMED dates make exclusive substitutes skip
collisions. Empty when the nominal date is outside RULE's civil validity
window. See HOLIDAY-RULE-AUTHORITY for the normative citation."))

(defmethod rule-occurrences ((rule holiday-rule) year weekend-days &optional claimed)
  (loop for nominal in (rule-nominal-dates rule year)
        when (rule-valid-at-p rule nominal)
          append (let ((observed (when (%observed-applies-at-p (rule-observed-from rule) nominal)
                                   (rule-observed rule))))
                   (observe-dates nominal observed (rule-bridge rule)
                                  weekend-days claimed))))

;;; Compatibility: single primary occurrence (first of RULE-OCCURRENCES).
(defun rule-occurrence (rule year weekend-days &optional claimed)
  (first (rule-occurrences rule year weekend-days claimed)))
