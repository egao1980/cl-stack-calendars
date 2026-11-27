(in-package #:cl-stack-calendars)

;;;; Thailand (egao1980/cl-stack-calendars#40): two calendars.
;;;;
;;;; "TH"       วันหยุดราชการ, government offices: the annual holidays of the
;;;;            ประกาศสำนักนายกรัฐมนตรี เรื่อง กำหนดเวลาทำงานและวันหยุดราชการ, the
;;;;            Cabinet's yearly overview and special days (data/th/government.sexp),
;;;;            and the substitute rule of each era (TH-GOVERNMENT-SUBSTITUTE-PASS).
;;;;            2019–2026 :primary, 2000–2018 :secondary, after 2026 provisional.
;;;; "TH-BANK"  วันหยุดตามประเพณีของสถาบันการเงิน, the Bank of Thailand list for
;;;;            financial institutions (data/th/bank.sexp, 2000–2027; after 2027
;;;;            provisional). Thai exchanges (XBKK) follow it.
;;;;
;;;; Buddhist days come from the Thai lunar calendar (THAI-BUDDHIST-DAY): the
;;;; listed dates 2000–2027 (data/th/lunar.sexp), the Suriyayatra rule for
;;;; other years (THAI-LUNAR-YEAR-TYPE).

;;; --- Thai lunar calendar ---------------------------------------------------

(defun %th-suriyayatra (cs)
  "Eade, 'Rules for interpolation in the Thai calendar', JSS 88 (2000),
Appendix A stages 1-5, for the astronomical New Year of Chulasakarat CS:
values horakhun, kammacubala, avoman and the New Year tithi."
  (check-type cs integer)
  (multiple-value-bind (q r) (floor (+ (* cs 292207) 373) 800)
    (let* ((horakhun (1+ q))
           (kammacubala (- 800 r))
           (avoman (mod (+ (* horakhun 11) 650) 692))
           (tithi (mod (+ horakhun (floor (+ (* horakhun 11) 650) 692)) 30)))
      (values horakhun kammacubala avoman tithi))))

(defun %th-athikamat-cycle-p (year)
  "The 19-year cycle of the athikamat years the BOT and Cabinet lists imply
2000–2027 (2002 2004 2007 2010 2012 2015 2018 2021 2023 2026)."
  (and (member (mod year 19) '(1 4 7 9 12 15 17)) t))

(defconstant +th-lunar-first-year+ 1800)

(defconstant +th-lunar-last-year+ 2300)

(defvar *th-lunar-year-types* nil
  "Vector of year types +TH-LUNAR-FIRST-YEAR+ … +TH-LUNAR-LAST-YEAR+.")

(defun %th-compute-year-types ()
  (let ((types (make-array (1+ (- +th-lunar-last-year+ +th-lunar-first-year+))))
        (carry nil))
    (loop for year from +th-lunar-first-year+ to +th-lunar-last-year+
          for i from 0
          do (multiple-value-bind (h kammacubala avoman) (%th-suriyayatra (- year 638))
               (declare (ignore h))
               (let ((extra-day (< avoman (if (<= kammacubala 207) 126 137))))
                 (setf (aref types i)
                       (cond ((%th-athikamat-cycle-p year)
                              (setf carry (or carry extra-day))
                              :athikamat)
                             ((or extra-day carry)
                              (setf carry nil)
                              :athikawan)
                             (t :normal))))))
    types))

(defun thai-lunar-year-type (year)
  "The Thai lunar year type of the lunar year whose months 7 and 8 fall in
Gregorian YEAR: :ATHIKAMAT (a second month 8, 384 days), :ATHIKAWAN (month 7
of 30 days, 355) or :NORMAL (354).

Athikamat follows the 19-year cycle of the years the lists imply 2000–2027
(the New Year tithi rule, 25–29 or 0–5, misses 2012, which the official
calendar and BOT made athikamat). Athikawan is the Suriyayatra rule as Eade
(JSS 88, 2000) gives it: a solar leap year when the kammacubala is 207 or
less; the year has the extra day when the avoman is below 126 (leap) or 137
(normal) — Eade writes \"126 or less\" and \"137 or less\", but 2014 (avoman
137) was a normal year in the lists; an athikamat year cannot also be
athikawan, and its extra day passes to the next year. The rule matches
Eade's year types CS 1320–1340 (1958–1978) and every listed year 2000–2027.
After 2027 it is a prediction: see *THAI-LUNAR-UNCERTAIN-YEARS*."
  (check-type year integer)
  (unless (<= +th-lunar-first-year+ year +th-lunar-last-year+)
    (error 'calendar-error
           :message (format nil "Thai lunar year types are computed for ~d–~d, not ~d"
                            +th-lunar-first-year+ +th-lunar-last-year+ year)))
  (aref (or *th-lunar-year-types*
            (setf *th-lunar-year-types* (%th-compute-year-types)))
        (- year +th-lunar-first-year+)))

(defparameter *thai-lunar-uncertain-years* '(2030 2031 2032)
  "Provisional years whose Thai lunar dates the rule cannot settle:
2031 has New Year tithi 24, as 2012 had (the cycle makes it athikamat, the
tithi rule normal); the rule puts the athikawan of this stretch in 2030, the
1757–2157 table that python-holidays copies (myhora.com) in 2032, so the
dates of mid-2030 to mid-2032 may be one day early or late.")

(defparameter *th-lunar-anchor* (make-date 2000 11 27)
  "1 waxing of month 1 of the lunar year of 2001: the listed Makha Bucha
2001-02-08 (3/15 of a normal year) less 73 days.")

(defvar *th-lunar-new-years* nil)

(defun %th-year-length (year)
  (ecase (thai-lunar-year-type year)
    (:normal 354)
    (:athikawan 355)
    (:athikamat 384)))

(defun %th-compute-lunar-new-years ()
  (let ((starts (make-array (1+ (cl:- +th-lunar-last-year+ +th-lunar-first-year+))))
        (anchor (cl:- 2001 +th-lunar-first-year+)))
    (setf (aref starts anchor) *th-lunar-anchor*)
    (loop for i from (1+ anchor) below (length starts)
          do (setf (aref starts i)
                   (+ (aref starts (1- i)) (%th-year-length (cl:+ +th-lunar-first-year+ i -1)))))
    (loop for i downfrom (1- anchor) to 0
          do (setf (aref starts i)
                   (- (aref starts (1+ i)) (%th-year-length (cl:+ +th-lunar-first-year+ i)))))
    starts))

(defun %th-lunar-new-year (year)
  "Date of 1 waxing of month 1 of YEAR's lunar year (in Nov–Dec of YEAR-1),
chained from *TH-LUNAR-ANCHOR* by THAI-LUNAR-YEAR-TYPE (which checks YEAR)."
  (thai-lunar-year-type year)
  (aref (or *th-lunar-new-years*
            (setf *th-lunar-new-years* (%th-compute-lunar-new-years)))
        (cl:- year +th-lunar-first-year+)))

(defun thai-lunar-rule-day (year kind)
  "The Thai lunar rule's date of KIND in YEAR: :MAKHA (3/15, 4/15 in an
athikamat year), :VISAKHA (6/15, 7/15), :ASALHA (8/15, 8/8 15) or
:KHAO-PHANSA (the next day, 1 waning). Months alternate 29 and 30 days from
month 1; month 7 has 30 in an athikawan year; the month 8/8 has 30."
  (let ((type (thai-lunar-year-type year))
        (start (%th-lunar-new-year year)))
    (flet ((at (normal athikamat) (+ start (if (eq type :athikamat) athikamat normal))))
      (ecase kind
        (:makha (at 73 102))
        (:visakha (at 161 191))
        (:asalha (at (if (eq type :athikawan) 221 220) 250))
        (:khao-phansa (+ (thai-lunar-rule-day year :asalha) 1))))))

(defun load-th-lunar (&optional (path (data-path "th/lunar.sexp")))
  "Alist YEAR → plist (:type :makha :visakha :asalha :khao-phansa :listed
:source) with dates as DATEs."
  (mapcar (lambda (block)
            (cons (getf block :year)
                  (loop for (k v) on block by #'cddr
                        unless (eq k :year)
                          append (list k (if (member k '(:makha :visakha :asalha :khao-phansa))
                                             (apply #'make-date v)
                                             v)))))
          (read-data-form path)))

(defvar *th-lunar* nil)

(defun th-lunar ()
  (or *th-lunar* (setf *th-lunar* (load-th-lunar))))

(defun thai-buddhist-day (year kind)
  "Date of the Buddhist day KIND (see THAI-LUNAR-RULE-DAY) in YEAR: the
date data/th/lunar.sexp records for 2000–2027 (the BOT and Cabinet lists),
the Thai lunar rule otherwise; NIL outside the rule's years
(+TH-LUNAR-FIRST-YEAR+ … +TH-LUNAR-LAST-YEAR+), so a calendar has no
Buddhist day there."
  (cond ((getf (cdr (assoc year (th-lunar))) kind))
        ((<= +th-lunar-first-year+ year +th-lunar-last-year+)
         (thai-lunar-rule-day year kind))))

;;; --- data: Cabinet and BOT blocks --------------------------------------------

(defun %th-row-date (row)
  (apply #'make-date (getf row :date)))

(defun %th-row-transfer (row block)
  (make-calendar-transfer :to (%th-row-date row)
                          :name (getf row :name)
                          :authority (or (getf row :authority) (getf block :authority))))

(defun load-th-blocks (path)
  "Alist YEAR → plist of a data/th block file: :AUTHORITY :URI :CONFIDENCE,
:TRANSFERS (the :HOLIDAYS rows as CALENDAR-TRANSFERs), :SUPPRESSED (dates),
:ROWS (every :HOLIDAYS and :SUPPRESSED row as written, with :KIND), :BLOCK
(the block head as written, rows left out)."
  (mapcar
   (lambda (block)
     (let ((head (loop for (k v) on block by #'cddr
                       unless (member k '(:holidays :suppressed))
                         append (list k v))))
       (cons (getf block :year)
             (list :authority (getf block :authority)
                   :uri (getf block :uri)
                   :confidence (getf block :confidence)
                   :transfers (mapcar (lambda (row) (%th-row-transfer row block))
                                      (getf block :holidays))
                   :suppressed (mapcar #'%th-row-date (getf block :suppressed))
                   :rows (append (mapcar (lambda (r) (list* :kind :holiday r)) (getf block :holidays))
                                 (mapcar (lambda (r) (list* :kind :suppressed r)) (getf block :suppressed)))
                   :block head))))
   (read-data-form path)))

(defvar *th-government* nil)

(defvar *th-bank* nil)

(defun th-government-blocks ()
  (or *th-government* (setf *th-government* (load-th-blocks (data-path "th/government.sexp")))))

(defun th-bank-blocks ()
  (or *th-bank* (setf *th-bank* (load-th-blocks (data-path "th/bank.sexp")))))

(defun %th-suppressed (blocks &optional year)
  (loop for (nil . plist) in blocks
        append (remove-if-not (lambda (d) (or (null year) (= year (date-year d))))
                              (getf plist :suppressed))))

(defun th-decree-rows ()
  "Every block head and row of data/th/government.sexp and data/th/bank.sexp
as a plist, with :CALENDAR \"TH\" or \"TH-BANK\". Each carries :ISSUED and
:PUBLISHED (#93, docs/AUTHORITIES.md)."
  (loop for (code blocks) in (list (list "TH" (th-government-blocks))
                                   (list "TH-BANK" (th-bank-blocks)))
        append (loop for (nil . plist) in blocks
                     append (cons (list* :calendar code (getf plist :block))
                                  (mapcar (lambda (r) (list* :calendar code r))
                                          (getf plist :rows))))))

(defparameter *th-last-cabinet-year* 2026
  "The last year with a Cabinet overview in data/th/government.sexp.")

(defparameter *th-last-bot-year* 2027
  "The last year with a BOT list in data/th/bank.sexp (ประกาศ ธปท. 2570).")

(defun th-provisional-year-p (year)
  "True for a government-office year after the last Cabinet overview: the
annual days (no Royal Ploughing Day) and substitutes only."
  (> year *th-last-cabinet-year*))

(defun th-bank-provisional-year-p (year)
  "True for a year after the last BOT list: the annual days and substitutes only."
  (> year *th-last-bot-year*))

(defun th-confidence (year)
  ":PRIMARY (Cabinet resolutions and สลค. circulars, 2019–2026), :SECONDARY
(Cabinet releases mirrored by ryt9.com, news and the rule, 2000–2018),
:PROVISIONAL after the last overview, NIL before 2000."
  (cond ((th-provisional-year-p year) :provisional)
        ((getf (cdr (assoc year (th-government-blocks))) :confidence))))

(defun th-bank-confidence (year)
  ":PRIMARY for a year with a BOT list (2000–2027), :PROVISIONAL after it,
NIL before 2000."
  (cond ((th-bank-provisional-year-p year) :provisional)
        ((getf (cdr (assoc year (th-bank-blocks))) :confidence))))

;;; --- substitute rule ---------------------------------------------------------

(defparameter *th-substitute-eras*
  '((:from (1995 12 26) :to (2001 6 30) :rule :each
     :authority "มติ ครม. 26 ธ.ค. 2538 (หนังสือ สลค. ด่วนที่สุด ที่ นร 0205/ว 274 ลว. 27 ธ.ค. 2538): กรณีมีวันหยุดราชการประจำปีใดตรงกับวันหยุดราชการประจำสัปดาห์ ให้เลื่อนวันหยุดราชการประจำปีวันนั้นไปหยุดในวันทำงานถัดไป (quoted in ว 83/2544)"
     :issued (1995 12 26) :issued-uri "https://www.soc.go.th/wp-content/uploads//slkupload/44v83.pdf"
     :published (1995 12 27) :published-uri "https://www.soc.go.th/wp-content/uploads//slkupload/44v83.pdf"
     :in-force (1995 12 26)
     :dates-note "the ว 274 circular itself was not retrieved; its date and the resolution date are as ว 83/2544 cites them, and no later start is stated")
    (:from (2001 7 1) :to nil :rule :one-per-weekend
     :authority "มติ ครม. 1 พ.ค. 2544 เรื่อง วันหยุดชดเชยของทางราชการ (หนังสือ สลค. ด่วนที่สุด ที่ นร 0205/ว 83 ลว. 11 พ.ค. 2544): ให้เลื่อนวันหยุดราชการประจำปีวันนั้นไปหยุดในวันทำการถัดไป โดยให้หยุดชดเชยได้ไม่เกิน ๑ วัน ทั้งนี้ ให้ถือเป็นหลักปฏิบัติตั้งแต่วันที่ ๑ กรกฎาคม ๒๕๔๔"
     :issued (2001 5 1) :issued-uri "https://www.soc.go.th/wp-content/uploads//slkupload/44v83.pdf"
     :published (2001 5 11) :published-uri "https://www.soc.go.th/wp-content/uploads//slkupload/44v83.pdf"
     :in-force (2001 7 1))
    (:from (2004 2 3) :to nil :rule :one-per-weekend
     :authority "มติ ครม. 3 ก.พ. 2547 เรื่อง การพิจารณาปรับปรุงจำนวนวันหยุดราชการ (หนังสือ สลค. ที่ นร 0504/ว 38 ลว. 20 ก.พ. 2547): the 2544 rule stays; the Cabinet may cancel or move a substitute (data/th :suppressed and :holidays rows)"
     :issued (2004 2 3) :issued-uri "https://www.soc.go.th/wp-content/uploads/slkupload/47v38.pdf"
     :published (2004 2 20) :published-uri "https://www.soc.go.th/wp-content/uploads/slkupload/47v38.pdf"
     :in-force (2004 2 3)))
  "The วันหยุดชดเชย rule of each era (both calendars; BOT's 2555 note 1/
cites the 2547 resolution). Before 26 Dec 1995 there is no substitute (they
were abolished in 1974; earlier practice is not modelled). :RULE :EACH —
each weekend holiday gives the next working day; :ONE-PER-WEEKEND — the
holidays of one weekend give one day. :ISSUED is the resolution date,
:PUBLISHED the สลค. circular date, :IN-FORCE the stated start.")

(defun %th-substitute-rule-at (date)
  (let ((rd (date-rd date)))
    (loop with rule = nil
          for era in *th-substitute-eras*
          when (cl:>= rd (date-rd (apply #'make-date (getf era :from))))
            do (setf rule (getf era :rule))
          finally (return rule))))

(defparameter *th-songkran-name* "Songkran (วันสงกรานต์)"
  "Rule name of the three Songkran days (BOT counts them apart, %TH-SUBSTITUTE-PASS).")

(defparameter *th-mid-year-name* "Mid-year closing day (วันหยุดภาคครึ่งปี)"
  "Rule name of the BOT mid-year closing day, which has no substitute.")

(defun %th-substitute-pass (calendar year pairs bank)
  "Add the วันหยุดชดเชย of the weekend holidays of YEAR in PAIRS: per
*TH-SUBSTITUTE-ERAS*, one day per holiday (:EACH) or per weekend
(:ONE-PER-WEEKEND), each on the first Monday–Friday after that weekend that
is no holiday, rule or data day, of YEAR or YEAR+1. BANK: the mid-year
closing day gives none (BOT 2555 note 3/), and Songkran's weekend days give
one less (one when two of them fall on the weekend: every BOT list
2000–2027)."
  (let ((taken (make-hash-table))
        (groups (make-hash-table))
        (extra '()))
    (flet ((take (date) (setf (gethash (date-rd date) taken) t)))
      (dolist (pair pairs) (take (car pair)))
      (dolist (pair (%observe-rule-entries calendar (1+ year))) (take (car pair)))
      (dolist (tr (calendar-transfers calendar)) (take (calendar-transfer-to tr))))
    (dolist (pair pairs)
      (let* ((d (car pair))
             (dow (date-day-of-week d)))
        (when (and (cl:>= dow 6)
                   (stringp (cdr pair))
                   (not (and bank (string= (cdr pair) *th-mid-year-name*)))
                   (%th-substitute-rule-at d))
          (push pair (gethash (cl:- (date-rd d) (cl:- dow 6)) groups)))))
    (dolist (saturday (sort (loop for k being the hash-keys of groups collect k) #'cl:<))
      (let* ((hols (sort (copy-list (gethash saturday groups))
                         (lambda (a b)
                           (or (cl:< (date-rd (car a)) (date-rd (car b)))
                               (and (cl:= (date-rd (car a)) (date-rd (car b)))
                                    (string< (cdr a) (cdr b)))))))
             (songkran (remove-duplicates
                        (loop for (d . n) in hols when (string= n *th-songkran-name*) collect (date-rd d))))
             (others (remove-duplicates
                      (loop for (d . n) in hols unless (string= n *th-songkran-name*) collect (date-rd d))))
             (count (cl:+ (length others)
                          (if bank (cl:max 0 (1- (length songkran))) (length songkran))))
             (names (remove-duplicates (mapcar #'cdr hols) :test #'string= :from-end t))
             (name (format nil "Substitute for ~{~a~^ and ~}" names))
             (cursor (cl:+ saturday 2)))
        (when (eq (%th-substitute-rule-at (date-from-rd (1+ saturday))) :one-per-weekend)
          (setf count (cl:min count 1)))
        (loop repeat count
              do (loop while (or (cl:>= (date-day-of-week (date-from-rd cursor)) 6)
                                 (gethash cursor taken))
                       do (incf cursor))
                 (setf (gethash cursor taken) t)
                 (push (cons (date-from-rd cursor) name) extra))))
    (append pairs (nreverse extra))))

(defun th-government-substitute-pass (calendar year pairs)
  "วันหยุดชดเชย of government offices (%TH-SUBSTITUTE-PASS)."
  (%th-substitute-pass calendar year pairs nil))

(defun th-bank-substitute-pass (calendar year pairs)
  "วันหยุดชดเชย of financial institutions (%TH-SUBSTITUTE-PASS)."
  (%th-substitute-pass calendar year pairs t))

;;; --- the calendars -------------------------------------------------------------

(define-calendar thailand-holidays-calendar (:register "TH" :constructor thailand-holidays-calendar
                                             :observance-pass th-government-substitute-pass)
  ;; Government offices. The Royal Ploughing Day (set yearly by the Royal
  ;; Household) and the Cabinet's special days are data/th/government.sexp rows.
  (:fixed "New Year's Day (วันขึ้นปีใหม่)" 1 1 :from 1941
   :authority "ประกาศสำนักนายกรัฐมนตรี เรื่อง กำหนดเวลาทำงานและวันหยุดราชการ; Cabinet overviews")
  (:computed "Makha Bucha (วันมาฆบูชา)" (lambda (y) (thai-buddhist-day y :makha)) :from 1900
   :authority "Thai lunar 3/15 (4/15 in an athikamat year): data/th/lunar.sexp 2000–2027, THAI-LUNAR-RULE-DAY otherwise")
  (:fixed "Chakri Memorial Day (วันจักรี)" 4 6 :from 1920
   :authority "วันพระบาทสมเด็จพระพุทธยอดฟ้าจุฬาโลกมหาราชและวันที่ระลึกมหาจักรีบรมราชวงศ์")
  (:fixed "Songkran (วันสงกรานต์)" 4 13 :from 1900 :authority "วันสงกรานต์ 13 เม.ย.")
  (:fixed "Songkran (วันสงกรานต์)" 4 14 :from 1900 :authority "วันสงกรานต์ 14 เม.ย.")
  (:fixed "Songkran (วันสงกรานต์)" 4 15 :from 1900 :authority "วันสงกรานต์ 15 เม.ย.")
  (:fixed "Coronation Day (วันฉัตรมงคล)" 5 5 :from 1950 :to 2016
   :authority "Coronation of Rama IX, 5 May; not a holiday from 2017 (Cabinet 2560)")
  (:fixed "Coronation Day (วันฉัตรมงคล)" 5 4 :from 2020
   :authority "Coronation of Rama X, 4 May 2019; a holiday from 2020 (Cabinet overviews 2563–2569)")
  (:computed "Visakha Bucha (วันวิสาขบูชา)" (lambda (y) (thai-buddhist-day y :visakha)) :from 1900
   :authority "Thai lunar 6/15 (7/15 in an athikamat year)")
  (:fixed "Queen Suthida's Birthday (วันเฉลิมพระชนมพรรษาสมเด็จพระนางเจ้าฯ พระบรมราชินี)" 6 3 :from 2019
   :authority "Cabinet overviews 2562–2569")
  (:computed "Asalha Bucha (วันอาสาฬหบูชา)" (lambda (y) (thai-buddhist-day y :asalha)) :from 1900
   :authority "Thai lunar 8/15 (8/8 15 in an athikamat year)")
  (:computed "Khao Phansa (วันเข้าพรรษา)" (lambda (y) (thai-buddhist-day y :khao-phansa)) :from 1900
   :authority "Thai lunar 1 waning of month 8 (8/8)")
  (:fixed "King Vajiralongkorn's Birthday (วันเฉลิมพระชนมพรรษาพระบาทสมเด็จพระเจ้าอยู่หัว)" 7 28 :from 2017
   :authority "Cabinet overviews 2560–2569")
  (:fixed "Queen Sirikit's Birthday / Mother's Day (วันแม่แห่งชาติ)" 8 12 :from 1976
   :authority "Cabinet overviews")
  (:fixed "King Bhumibol Memorial Day (วันนวมินทรมหาราช)" 10 13 :from 2017
   :authority "Cabinet overviews 2560–2569")
  (:fixed "Chulalongkorn Day (วันปิยมหาราช)" 10 23 :from 1920 :authority "Cabinet overviews")
  (:fixed "King Bhumibol's Birthday / National Day / Father's Day (วันพ่อแห่งชาติ)" 12 5 :from 1960
   :authority "Cabinet overviews")
  (:fixed "Constitution Day (วันรัฐธรรมนูญ)" 12 10 :from 1932 :authority "Cabinet overviews")
  (:fixed "New Year's Eve (วันสิ้นปี)" 12 31 :from 1941 :authority "Cabinet overviews"))

(define-calendar thailand-bank-holidays-calendar (:register "TH-BANK" :constructor thailand-bank-holidays-calendar
                                                  :observance-pass th-bank-substitute-pass)
  ;; Financial institutions (BOT). Special days, moves and cancellations are
  ;; data/th/bank.sexp rows.
  (:fixed "New Year's Day (วันขึ้นปีใหม่)" 1 1 :from 1941 :authority "BOT lists 2543–2570")
  (:computed "Makha Bucha (วันมาฆบูชา)" (lambda (y) (thai-buddhist-day y :makha)) :from 1900
   :authority "Thai lunar 3/15 (4/15 in an athikamat year): data/th/lunar.sexp 2000–2027, THAI-LUNAR-RULE-DAY otherwise")
  (:fixed "Chakri Memorial Day (วันจักรี)" 4 6 :from 1920 :authority "BOT lists 2543–2570")
  (:fixed "Songkran (วันสงกรานต์)" 4 13 :from 1900 :authority "BOT lists 2543–2570")
  (:fixed "Songkran (วันสงกรานต์)" 4 14 :from 1900 :authority "BOT lists 2543–2570")
  (:fixed "Songkran (วันสงกรานต์)" 4 15 :from 1900 :authority "BOT lists 2543–2570")
  (:fixed "Labour Day (วันแรงงานแห่งชาติ)" 5 1 :from 1974
   :authority "BOT lists 2543–2570 (a financial-institution day, not a government-office one)")
  (:fixed "Coronation Day (วันฉัตรมงคล)" 5 5 :from 1950 :to 2016
   :authority "BOT lists to 2559; 2560 cancelled by ฉบับที่ 2")
  (:fixed "Coronation Day (วันฉัตรมงคล)" 5 4 :from 2020 :authority "BOT lists 2563–2570")
  (:computed "Visakha Bucha (วันวิสาขบูชา)" (lambda (y) (thai-buddhist-day y :visakha)) :from 1900
   :authority "Thai lunar 6/15 (7/15 in an athikamat year)")
  (:fixed "Queen Suthida's Birthday (วันเฉลิมพระชนมพรรษาสมเด็จพระนางเจ้าฯ พระบรมราชินี)" 6 3 :from 2019
   :authority "BOT lists 2562–2570")
  (:fixed "Mid-year closing day (วันหยุดภาคครึ่งปี)" 7 1 :from 1974 :to 2018
   :authority "BOT: abolished from 2562 (BOT 2562 หมายเหตุ 2/); no substitute (BOT 2555 หมายเหตุ 3/)")
  (:computed "Khao Phansa (วันเข้าพรรษา)" (lambda (y) (thai-buddhist-day y :khao-phansa)) :from 1900 :to 2006
   :authority "BOT lists 2543–2549: วันเข้าพรรษา, 1 waning of month 8 (8/8)")
  (:computed "Asalha Bucha (วันอาสาฬหบูชา)" (lambda (y) (thai-buddhist-day y :asalha)) :from 2007
   :authority "BOT 2550 หมายเหตุ: from 2550 Asalha Bucha replaces Khao Phansa; Thai lunar 8/15 (8/8 15)")
  (:fixed "King Vajiralongkorn's Birthday (วันเฉลิมพระชนมพรรษาพระบาทสมเด็จพระเจ้าอยู่หัว)" 7 28 :from 2017
   :authority "BOT 2560 ฉบับที่ 2; BOT lists 2561–2570")
  (:fixed "Queen Sirikit's Birthday / Mother's Day (วันแม่แห่งชาติ)" 8 12 :from 1976 :authority "BOT lists")
  (:fixed "King Bhumibol Memorial Day (วันนวมินทรมหาราช)" 10 13 :from 2017
   :authority "BOT 2560 ฉบับที่ 2; BOT lists 2561–2570")
  (:fixed "Chulalongkorn Day (วันปิยมหาราช)" 10 23 :from 1920 :authority "BOT lists")
  (:fixed "King Bhumibol's Birthday / National Day / Father's Day (วันพ่อแห่งชาติ)" 12 5 :from 1960
   :authority "BOT lists")
  (:fixed "Constitution Day (วันรัฐธรรมนูญ)" 12 10 :from 1932 :authority "BOT lists")
  (:fixed "New Year's Eve (วันสิ้นปี)" 12 31 :from 1941 :authority "BOT lists"))

(defun thailand-holidays-calendar (&key year transfers suppressed)
  "Thai government-office holidays (\"TH\"): the annual days, the Cabinet's
special days and cancellations of data/th/government.sexp, and the
substitute rule (*TH-SUBSTITUTE-ERAS*). Without YEAR every year of the file
applies (the registered calendar); with YEAR only that year's rows.
Confidence by year: TH-CONFIDENCE."
  (let ((blocks (th-government-blocks)))
    (make-instance 'thailand-holidays-calendar
                   :transfers (or transfers
                                  (if year
                                      (transfers-touching-year blocks year)
                                      (all-block-transfers blocks)))
                   :suppressed-dates (or suppressed (%th-suppressed blocks year)))))

(defun thailand-bank-holidays-calendar (&key year transfers suppressed)
  "Bank of Thailand financial-institution holidays (\"TH-BANK\"): the annual
days, the special days, moves and cancellations of data/th/bank.sexp, and
the substitute rule. Without YEAR every year of the file applies; with YEAR
only that year's rows. Thai exchanges (XBKK) attach this calendar."
  (let ((blocks (th-bank-blocks)))
    (make-instance 'thailand-bank-holidays-calendar
                   :transfers (or transfers
                                  (if year
                                      (transfers-touching-year blocks year)
                                      (all-block-transfers blocks)))
                   :suppressed-dates (or suppressed (%th-suppressed blocks year)))))
