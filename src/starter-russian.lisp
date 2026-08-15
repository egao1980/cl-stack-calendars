(in-package #:cl-stack-calendars)

;;;; Historical Russian / Soviet non-working holidays.
;;;; Fixed dates from КЗоТ / ТК РФ with :FROM/:TO eras; annual Government
;;;; decree transfers loaded from data/ru/transfers.sexp.
;;;;
;;;; Observance: :RU-TK-112-TRANSFER (ТК РФ ст. 112 ч. 2) except Jan 1–8,
;;;; which are rearranged only by постановление Правительства.

(defparameter *ru-transfers-path*
  (merge-pathnames "data/ru/transfers.sexp"
                   (asdf:system-source-directory "cl-stack-calendars"))
  "Sexp index of verified RF Government weekend-transfer decrees.")

(defun %parse-transfer-entry (entry)
  "ENTRY is ((Y M D) (Y M D) [name]) → CALENDAR-TRANSFER."
  (destructuring-bind (from to &optional name) entry
    (make-calendar-transfer :from from :to to :name name)))

(defun load-ru-transfer-decrees (&optional (path *ru-transfers-path*))
  "Return alist YEAR → (:authority A :transfers (transfer…) :working (working-day…)).
Each FROM weekend is also recorded as a compensatory WORKING day."
  (with-open-file (in path)
    (let ((form (read in)))
      (mapcar
       (lambda (block)
         (let* ((year (getf block :year))
                (auth (getf block :authority))
                (transfers (mapcar (lambda (e)
                                     (let ((tr (%parse-transfer-entry e)))
                                       (setf (calendar-transfer-authority tr) auth)
                                       tr))
                                   (getf block :transfers)))
                (working (mapcar (lambda (tr)
                                   (make-calendar-working-day
                                    :date (calendar-transfer-from tr)
                                    :authority auth))
                                 (remove nil transfers :key #'calendar-transfer-from))))
           (cons year (list :authority auth
                            :transfers transfers
                            :working working
                            :uri (getf block :uri)))))
       form))))

(defvar *ru-transfer-decrees* nil
  "Cached result of LOAD-RU-TRANSFER-DECREES.")

(defun ru-transfer-decrees ()
  (or *ru-transfer-decrees*
      (setf *ru-transfer-decrees* (load-ru-transfer-decrees))))

(defun ru-decree-for-year (year)
  "Plist for the decree block keyed by YEAR, or NIL if none was issued that year.
   Cross-year transfers (e.g. 1993-12-31 ← 1994-01-04) still apply via
   RU-TRANSFERS-FOR-YEAR / RU-WORKING-DAYS-FOR-YEAR."
  (cdr (assoc year (ru-transfer-decrees))))

(defun %transfer-touches-year-p (tr year)
  (or (let ((to (calendar-transfer-to tr)))
        (and to (= (date-year to) year)))
      (let ((from (calendar-transfer-from tr)))
        (and from (= (date-year from) year)))))

(defun ru-transfers-for-year (year)
  "All decree transfers whose FROM or TO falls in YEAR (any decree block)."
  (loop for (_year . plist) in (ru-transfer-decrees)
        nconc (remove-if-not (lambda (tr) (%transfer-touches-year-p tr year))
                             (getf plist :transfers))))

(defun ru-working-days-for-year (year)
  "Compensatory working days (FROM dates) that fall in YEAR."
  (loop for tr in (ru-transfers-for-year year)
        for from = (calendar-transfer-from tr)
        when (and from (= (date-year from) year))
        collect (make-calendar-working-day
                 :date from
                 :authority (calendar-transfer-authority tr))))

;;;; --- USSR (late Soviet non-working holidays; settlement-oriented) --------
;;;; List follows common post-1965 / 1977-Constitution practice. Earlier
;;;; Soviet calendars (1920s–1950s) differed; extend with :FROM/:TO as needed.

(define-calendar ussr-holidays-calendar (:register "USSR")
  (:fixed "Новый год" 1 1 :from 1918 :to 1991
   :authority "КЗоТ СССР / практика нерабочих дней (Новый год)")
  (:fixed "Международный женский день" 3 8 :from 1965 :to 1991
   :authority "Указ Президиума ВС СССР 08.05.1965 (Международный женский день — нерабочий)")
  (:fixed "День международной солидарности трудящихся" 5 1 :from 1918 :to 1991
   :authority "КЗоТ СССР (1 мая)")
  (:fixed "День международной солидарности трудящихся" 5 2 :from 1918 :to 1991
   :authority "КЗоТ СССР (2 мая)")
  (:fixed "День Победы" 5 9 :from 1965 :to 1991
   :authority "Указ Президиума ВС СССР 26.04.1965 (День Победы — нерабочий)")
  (:fixed "День Конституции СССР" 12 5 :from 1937 :to 1977
   :authority "Конституция СССР 1936 г. (День Конституции — 5 декабря)")
  (:fixed "День Конституции СССР" 10 7 :from 1978 :to 1991
   :authority "Конституция СССР 1977 г. (День Конституции — 7 октября)")
  (:fixed "Годовщина Великой Октябрьской социалистической революции" 11 7
   :from 1927 :to 1991
   :authority "КЗоТ СССР (7 ноября)")
  (:fixed "Годовщина Великой Октябрьской социалистической революции" 11 8
   :from 1927 :to 1991
   :authority "КЗоТ СССР (8 ноября)"))

;;;; --- Russian Federation (ТК РФ ст. 112 eras) -----------------------------

(define-calendar russian-holidays-calendar (:register "RU")
  ;; --- New Year block ---
  (:fixed "Новый год" 1 1 :from 1992
   :observed :ru-tk-112-transfer
   :authority "ТК РФ ст. 112 (Новогодние каникулы / Новый год)")
  (:fixed "Новогодние каникулы" 1 2 :from 1992 :to 2004
   :observed :ru-tk-112-transfer
   :authority "ТК РФ ст. 112 (до ФЗ-201: 1–2 января)")
  (:fixed "Новогодние каникулы" 1 2 :from 2005
   :authority "ФЗ от 29.12.2004 № 201-ФЗ; ТК РФ ст. 112")
  (:fixed "Новогодние каникулы" 1 3 :from 2005
   :authority "ФЗ от 29.12.2004 № 201-ФЗ; ТК РФ ст. 112")
  (:fixed "Новогодние каникулы" 1 4 :from 2005
   :authority "ФЗ от 29.12.2004 № 201-ФЗ; ТК РФ ст. 112")
  (:fixed "Новогодние каникулы" 1 5 :from 2005
   :authority "ФЗ от 29.12.2004 № 201-ФЗ; ТК РФ ст. 112")
  (:fixed "Новогодние каникулы" 1 6 :from 2013
   :authority "ФЗ от 23.04.2012 № 35-ФЗ; ТК РФ ст. 112")
  (:fixed "Рождество Христово" 1 7 :from 1991
   :authority "Указ Президента РСФСР / ТК РФ ст. 112 (Рождество — 7 января)")
  (:fixed "Новогодние каникулы" 1 8 :from 2013
   :authority "ФЗ от 23.04.2012 № 35-ФЗ; ТК РФ ст. 112")

  ;; --- Rest of year ---
  (:fixed "День защитника Отечества" 2 23 :from 2002
   :observed :ru-tk-112-transfer
   :authority "ТК РФ ст. 112 (23 февраля)")
  (:fixed "Международный женский день" 3 8 :from 1992
   :observed :ru-tk-112-transfer
   :authority "ТК РФ ст. 112 (8 марта)")
  (:fixed "Праздник Весны и Труда" 5 1 :from 1992
   :observed :ru-tk-112-transfer
   :authority "ТК РФ ст. 112 (1 мая)")
  (:fixed "Праздник Весны и Труда" 5 2 :from 1992 :to 2004
   :observed :ru-tk-112-transfer
   :authority "ТК РФ ст. 112 (2 мая — до ФЗ-201)")
  (:fixed "День Победы" 5 9 :from 1992
   :observed :ru-tk-112-transfer
   :authority "ТК РФ ст. 112 (9 мая)")
  (:fixed "День России" 6 12 :from 1992
   :observed :ru-tk-112-transfer
   :authority "ТК РФ ст. 112 (12 июня); ранее — День принятия Декларации о суверенитете")
  (:fixed "День согласия и примирения" 11 7 :from 1992 :to 2004
   :observed :ru-tk-112-transfer
   :authority "ТК РФ ст. 112 (7 ноября — до ФЗ-201)")
  (:fixed "День народного единства" 11 4 :from 2005
   :observed :ru-tk-112-transfer
   :authority "ФЗ от 29.12.2004 № 201-ФЗ; ТК РФ ст. 112 (4 ноября)")
  (:fixed "День Конституции Российской Федерации" 12 12 :from 1994 :to 2004
   :observed :ru-tk-112-transfer
   :authority "ТК РФ ст. 112 (12 декабря — до ФЗ-201)"))

(defun ussr-holidays-calendar ()
  (make-instance 'ussr-holidays-calendar))

(defun russian-holidays-calendar (&key year transfers working-days)
  "RF holiday calendar. When YEAR is given, attach every decree transfer
whose FROM or TO falls in that year (FROM → working; TO → extra day off)."
  (let ((tr (or transfers (when year (ru-transfers-for-year year))))
        (wd (or working-days (when year (ru-working-days-for-year year)))))
    (make-instance 'russian-holidays-calendar
                   :transfers tr
                   :working-days wd)))

(defun make-russian-holidays-calendar (&rest args)
  (apply #'russian-holidays-calendar args))
