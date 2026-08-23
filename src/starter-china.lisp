(in-package #:cl-stack-calendars)

;;;; China — 《全国年节及纪念日放假办法》+ annual 国办调休通知.
;;;; Statutory festival dates: fixed Gregorian + astronomical Chinese lunar
;;;; (Beijing locus). 调休 rearrangements are decree transfers (like RF
;;;; постановления), not automatic weekend in-lieu.
;;;;
;;;; 2024-11 revision (国务院令): 春节 includes 除夕; 劳动节 May 1–2; etc.

(defun %parse-cn-transfer-entry (entry)
  (destructuring-bind (from to &optional name) entry
    (make-calendar-transfer :from from :to to :name name)))

(defun load-cn-transfer-notices (&optional (path (data-path "cn/transfers.sexp")))
  "Return alist YEAR → (:authority A :transfers … :working …)."
  (let ((form (read-data-form path)))
    (mapcar
     (lambda (block)
       (let* ((year (getf block :year))
              (auth (getf block :authority))
              (transfers (mapcar (lambda (e)
                                   (let ((tr (%parse-cn-transfer-entry e)))
                                     (setf (calendar-transfer-authority tr) auth)
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

(defun %cn-transfer-touches-year-p (tr year)
  (or (let ((to (calendar-transfer-to tr)))
        (and to (= (date-year to) year)))
      (let ((from (calendar-transfer-from tr)))
        (and from (= (date-year from) year)))))

(defun cn-transfers-for-year (year)
  "All 调休 TO days whose date falls in YEAR (any notice block)."
  (loop for (_y . plist) in (cn-transfer-notices)
        nconc (remove-if-not (lambda (tr) (%cn-transfer-touches-year-p tr year))
                             (getf plist :transfers))))

(defun cn-working-days-for-year (year)
  "上班 days that fall in YEAR (any notice block)."
  (loop for (_y . plist) in (cn-transfer-notices)
        nconc (loop for wd in (getf plist :working)
                    when (= (date-year (calendar-working-day-date wd)) year)
                    collect wd)))

(define-calendar china-holidays-calendar (:register "CN")
  (:fixed "元旦" 1 1 :from 1949
   :authority "全国年节及纪念日放假办法（元旦）")
  ;; 春节: 除夕 from 2025 revision; 初一–初三 historically / confirmed in 办法
  (:computed "除夕"
   (lambda (y) (chinese-new-year-eve-date y :location +beijing+))
   :from 2025
   :authority "全国年节及纪念日放假办法（2024年修订 — 春节含除夕）")
  (:computed "春节" (lambda (y) (chinese-new-year-date y :location +beijing+))
   :from 1949
   :authority "全国年节及纪念日放假办法（春节 — 农历正月初一）")
  (:computed "春节"
   (lambda (y) (+ (chinese-new-year-date y :location +beijing+) 1))
   :from 1949
   :authority "全国年节及纪念日放假办法（春节 — 农历正月初二）")
  (:computed "春节"
   (lambda (y) (+ (chinese-new-year-date y :location +beijing+) 2))
   :from 1949
   :authority "全国年节及纪念日放假办法（春节 — 农历正月初三）")
  (:computed "清明节" (lambda (y) (qingming-date y :location +beijing+))
   :from 2008
   :authority "全国年节及纪念日放假办法（清明节 — 太阳黄经15° / 北京）")
  (:fixed "劳动节" 5 1 :from 1949
   :authority "全国年节及纪念日放假办法（劳动节）")
  (:fixed "劳动节" 5 2 :from 2025
   :authority "全国年节及纪念日放假办法（2024年修订 — 劳动节放假2天）")
  (:computed "端午节" (lambda (y) (duanwu-date y :location +beijing+))
   :from 2008
   :authority "全国年节及纪念日放假办法（端午节 — 农历五月初五）")
  (:computed "中秋节" (lambda (y) (zhongqiu-date y :location +beijing+))
   :from 2008
   :authority "全国年节及纪念日放假办法（中秋节 — 农历八月十五）")
  (:fixed "国庆节" 10 1 :from 1949
   :authority "全国年节及纪念日放假办法（国庆节）")
  (:fixed "国庆节" 10 2 :from 1999
   :authority "全国年节及纪念日放假办法（国庆节）")
  (:fixed "国庆节" 10 3 :from 1999
   :authority "全国年节及纪念日放假办法（国庆节）"))

(defun china-holidays-calendar (&key year transfers working-days)
  "PRC holiday calendar. YEAR attaches every 国办调休 TO/上班 day that
falls in that year (cross-year NY blocks included)."
  (let ((tr (or transfers (when year (cn-transfers-for-year year))))
        (wd (or working-days (when year (cn-working-days-for-year year)))))
    (make-instance 'china-holidays-calendar
                   :transfers tr
                   :working-days wd)))
