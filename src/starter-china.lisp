(in-package #:cl-stack-calendars)

;;;; China — 《全国年节及纪念日放假办法》 第二条 of each era + the yearly
;;;; 国务院办公厅 放假调休 notices (egao1980/cl-stack-calendars#26).
;;;; Statutory days: fixed Gregorian + astronomical Chinese lunar (Beijing
;;;; locus), as rules. Each notice's other window days (补休, 调休, weekend
;;;; 休息日) are decree transfers named after their festival, and its 上班
;;;; Saturdays and Sundays are working days (data/cn/transfers.sexp).
;;;; Notices 2007–2027 are the www.gov.cn texts (:primary); 2000–2006 are
;;;; Xinhua / Wikisource texts (:secondary, tagged in each day's authority).
;;;; Years after 2027 are provisional: statute days only (cn-provisional-year-p).

(defun %parse-cn-transfer-entry (entry)
  "(FROM TO NAME [AUTHORITY]) → CALENDAR-TRANSFER. AUTHORITY, when given, is
the amending notice of that day (2003 五一, 2015 纪念日, 2019 劳动节, 2020 春节)."
  (destructuring-bind (from to &optional name authority) entry
    (let ((tr (make-calendar-transfer :from from :to to :name name)))
      (values tr authority))))

(defparameter +cn-secondary-authority-tag+
  "（低可信度：新华社电稿、转载或维基文库转录，www.gov.cn 未载原文）"
  "Appended to the authority of every day of a :CONFIDENCE :SECONDARY notice
block (2000–2006).")

(defun %cn-block-authority (block authority)
  "AUTHORITY, tagged lower-confidence when BLOCK is a secondary-source notice."
  (if (eq (getf block :confidence) :secondary)
      (concatenate 'string authority +cn-secondary-authority-tag+)
      authority))

(defun load-cn-transfer-notices (&optional (path (data-path "cn/transfers.sexp")))
  "Return alist YEAR → (:authority A :uri U :confidence C :transfers … :working …).
:CONFIDENCE is :PRIMARY (the notice on www.gov.cn, 2007–2027, and the 1999
澳门回归 notice) or :SECONDARY (Xinhua dispatches and republications, Wikisource
transcriptions, 2000–2006); a secondary block's authorities carry
+CN-SECONDARY-AUTHORITY-TAG+."
  (let ((form (read-data-form path)))
    (mapcar
     (lambda (block)
       (let* ((year (getf block :year))
              (auth (%cn-block-authority block (getf block :authority)))
              (transfers (mapcar (lambda (e)
                                   (multiple-value-bind (tr own) (%parse-cn-transfer-entry e)
                                     (setf (calendar-transfer-authority tr)
                                           (if own (%cn-block-authority block own) auth))
                                     tr))
                                 (getf block :transfers)))
              (working (mapcar (lambda (d)
                                 (make-calendar-working-day
                                  :date (if (and (listp d) (not (typep d 'date)))
                                            (apply #'make-date d)
                                            d)
                                  :authority auth))
                               (getf block :working))))
         (cons year (list :authority auth
                          :confidence (getf block :confidence)
                          :transfers transfers
                          :working working
                          :uri (getf block :uri)))))
     form)))

(defvar *cn-transfer-notices* nil)

(defun cn-transfer-notices ()
  (or *cn-transfer-notices*
      (setf *cn-transfer-notices* (load-cn-transfer-notices))))

(defun cn-notice-for-year (year)
  "Plist for the notice block keyed by YEAR, or NIL."
  (cdr (assoc year (cn-transfer-notices))))

(defun cn-transfers-for-year (year)
  "All 调休 TO days whose date falls in YEAR (any notice block)."
  (transfers-touching-year (cn-transfer-notices) year))

(defun cn-working-days-for-year (year)
  "上班 days that fall in YEAR (any notice block)."
  (loop for (_y . plist) in (cn-transfer-notices)
        nconc (loop for wd in (getf plist :working)
                    when (= (date-year (calendar-working-day-date wd)) year)
                    collect wd)))

(defparameter *cn-last-notice-year* 2027
  "The last year with a State Council notice in data/cn/transfers.sexp
(国办发明电〔2026〕10号).")

(defun cn-provisional-year-p (year)
  "True for a year after the last notice: only the 放假办法 第二条 days are in
it, with no 放假 window, 补休, 调休 or 上班 day."
  (> year *cn-last-notice-year*))

(defun cn-notice-confidence (year)
  "How YEAR's days off are known: :PRIMARY (the State Council notice on
www.gov.cn, 2007–2027), :SECONDARY (2000–2006: Xinhua dispatches and
republications, Wikisource transcriptions; no 2000 春节 or 劳动节 text was
found, those are the statute days), :PROVISIONAL (after the last notice:
statute days only), or NIL before 2000."
  (cond ((cn-provisional-year-p year) :provisional)
        ((getf (cn-notice-for-year year) :confidence))
        (t nil)))

(define-calendar china-holidays-calendar (:register "CN" :constructor china-holidays-calendar)
  ;; 第二条 of each era: 1949 (政务院), 1999-09-18 (国务院令第270号), 2008-01-01
  ;; (第513号), 2014-01-01 (第644号), 2025-01-01 (第795号). The 2000–2006 notices are
  ;; known only from secondary texts, so the rules valid in those years say so.
  (:fixed "元旦" 1 1 :from 1949
   :authority "全国年节及纪念日放假办法 第二条（元旦，1月1日）")
  (:computed "春节（除夕）"
             (lambda (y) (chinese-new-year-eve-date y :location +beijing+))
   :from 2008 :to 2013
   :authority "全国年节及纪念日放假办法（国务院令第513号，2008年1月1日起）第二条：春节放假3天（农历除夕、正月初一、初二）")
  (:computed "春节（除夕）"
             (lambda (y) (chinese-new-year-eve-date y :location +beijing+))
   :from 2025
   :authority "全国年节及纪念日放假办法（国务院令第795号，2025年1月1日起）第二条：春节放假4天（农历除夕、正月初一至初三）")
  (:computed "春节" (lambda (y) (chinese-new-year-date y :location +beijing+))
   :from 1949
   :authority "全国年节及纪念日放假办法 第二条（春节，农历正月初一）")
  (:computed "春节"
             (lambda (y) (+ (chinese-new-year-date y :location +beijing+) 1))
   :from 1949
   :authority "全国年节及纪念日放假办法 第二条（春节，农历正月初二）")
  (:computed "春节"
             (lambda (y) (+ (chinese-new-year-date y :location +beijing+) 2))
   :from 1949 :to 2007
   :authority "全国年节及纪念日放假办法（1999年修订，国务院令第270号）第二条：春节放假3天（农历正月初一、初二、初三）；2000–2006年度通知仅见新华社/维基文库文本（低可信度）")
  (:computed "春节"
             (lambda (y) (+ (chinese-new-year-date y :location +beijing+) 2))
   :from 2014
   :authority "全国年节及纪念日放假办法（国务院令第644号，2014年1月1日起）第二条：春节放假3天（农历正月初一、初二、初三）")
  (:computed "清明节" (lambda (y) (qingming-date y :location +beijing+))
   :from 2008
   :authority "全国年节及纪念日放假办法（国务院令第513号）第二条（清明节，太阳黄经15° / 北京）")
  (:fixed "劳动节" 5 1 :from 1949
   :authority "全国年节及纪念日放假办法 第二条（劳动节，5月1日）")
  (:fixed "劳动节" 5 2 :from 2000 :to 2007
   :authority "全国年节及纪念日放假办法（1999年修订，国务院令第270号）第二条：劳动节放假3天（5月1日、2日、3日）；2000–2006年度通知仅见新华社/维基文库文本（低可信度）")
  (:fixed "劳动节" 5 3 :from 2000 :to 2007
   :authority "全国年节及纪念日放假办法（1999年修订，国务院令第270号）第二条：劳动节放假3天（5月1日、2日、3日）；2000–2006年度通知仅见新华社/维基文库文本（低可信度）")
  (:fixed "劳动节" 5 2 :from 2025
   :authority "全国年节及纪念日放假办法（国务院令第795号）第二条：劳动节放假2天（5月1日、2日）")
  (:computed "端午节" (lambda (y) (duanwu-date y :location +beijing+))
   :from 2008
   :authority "全国年节及纪念日放假办法（国务院令第513号）第二条（端午节，农历五月初五）")
  (:computed "中秋节" (lambda (y) (zhongqiu-date y :location +beijing+))
   :from 2008
   :authority "全国年节及纪念日放假办法（国务院令第513号）第二条（中秋节，农历八月十五）")
  (:fixed "国庆节" 10 1 :from 1949
   :authority "全国年节及纪念日放假办法 第二条（国庆节）")
  (:fixed "国庆节" 10 2 :from 1949
   :authority "全国年节及纪念日放假办法 第二条（国庆节）")
  (:fixed "国庆节" 10 3 :from 1999
   :authority "全国年节及纪念日放假办法（1999年修订，国务院令第270号）第二条：国庆节放假3天（10月1日、2日、3日）"))

(defun china-holidays-calendar (&key year transfers working-days)
  "PRC holiday calendar with the 国办调休 notices of data/cn/transfers.sexp
(TO → day off; 上班 → working day). Without YEAR, every notice in the file
applies (this is the registered \"CN\" calendar); with YEAR, only the days
that fall in that year (cross-year NY blocks included). TRANSFERS and
WORKING-DAYS, when given, replace the file's lists."
  (let ((tr (or transfers
                (if year
                    (cn-transfers-for-year year)
                    (all-block-transfers (cn-transfer-notices)))))
        (wd (or working-days
                (if year
                    (cn-working-days-for-year year)
                    (all-block-working-days (cn-transfer-notices))))))
    (make-instance 'china-holidays-calendar
                   :transfers tr
                   :working-days wd)))
