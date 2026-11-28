(in-package #:cl-stack-calendars)

;;;; Middle East and North Africa: calendars with yearly lists
;;;; (egao1980/cl-stack-calendars#44).
;;;;
;;;; "KW"  government-sector official holidays: Law 6/2010 art. 68 at the dates
;;;;       the Council of Ministers / Civil Service Commission declared, with
;;;;       their rest and bridge days (data/kw/holidays.sexp; KUNA and Central
;;;;       Bank of Kuwait notices 2020–2026 :primary, 2011–2019 :secondary).
;;;; "OM"  official holidays: Royal Decrees 56/2020, 88/2022 and 15/2025 at the
;;;;       dates the Ministry of Labour announced (data/om/holidays.sexp,
;;;;       2020–2026 :primary).
;;;; "IQ"  federal official holidays: Law 110/1972 as amended, the Official
;;;;       Holidays Law No. 12 of 2024, 3 October and 10 December, at the dates
;;;;       the Council of Ministers declared (data/iq/holidays.sexp, 2019–2026
;;;;       :primary).
;;;; "IR"  official holidays: the Solar Hijri days as rules on the astronomical
;;;;       calendar (datetime-protocol), the lunar days and closures of the
;;;;       Calendar Center's yearly lists (data/ir/holidays.sexp, 2000–2026
;;;;       :primary).
;;;;
;;;; A year with no list has the fixed days of its era and tabular estimates of
;;;; the Islamic days, named "(estimated)". The gold is
;;;; data/tests/<cc>-holiday-gold.sexp (scripts/generate_mena_holiday_gold.py).

(defvar *mena-blocks* (make-hash-table :test #'equal)
  "Code → the data/<cc>/holidays.sexp blocks (LOAD-SOUTH-ASIA-BLOCKS format).")

(defparameter *mena-last-list-year*
  '(("KW" . 2026) ("OM" . 2026) ("IQ" . 2026) ("IR" . 2026) ("DZ" . 2026) ("MA" . 2026) ("EG" . 2026)
    ("KZ" . 2026) ("SN" . 2026))
  "Code → the last year with a list in data/<cc>/holidays.sexp (the MENA
codes here, KZ and SN in starter-yearly-lists.lisp).")

(defun mena-blocks (code)
  (or (gethash code *mena-blocks*)
      (setf (gethash code *mena-blocks*)
            (load-south-asia-blocks (data-path (format nil "~(~a~)/holidays.sexp" code))))))

(defun mena-estimated-year-p (code year)
  "True when data/<code> has no list for YEAR: the Islamic days are tabular
estimates."
  (null (assoc year (mena-blocks code))))

(defun mena-provisional-year-p (code year)
  "True after the last list of CODE."
  (> year (cdr (assoc code *mena-last-list-year* :test #'string=))))

(defun mena-confidence (code year)
  ":PRIMARY or :SECONDARY (the list's sources), :PROVISIONAL after the last
list, :ESTIMATED for an earlier year with no list."
  (cond ((mena-provisional-year-p code year) :provisional)
        ((mena-estimated-year-p code year) :estimated)
        (t (getf (cdr (assoc year (mena-blocks code))) :confidence))))

(defun mena-decree-rows (code)
  "Every block head and row of data/<code>/holidays.sexp as a plist with
:CALENDAR CODE. Each carries :ISSUED and :PUBLISHED (#93)."
  (%south-asia-decree-rows code (mena-blocks code)))

(defun mena-listed-p (code year &optional key)
  "True when data/<code> has a list for YEAR that covers the rule KEY. A
block with :COVERS (a list of keys, e.g. SN's (\"magal\")) lists only those
rules; one without :COVERS lists every day of the year."
  (let ((block (assoc year (mena-blocks code))))
    (and block
         (let ((covers (getf (getf (cdr block) :block) :covers)))
           (or (null covers) (and key (member key covers :test #'string=) t))))))

(defun %mena-estimate (code year month day offsets &optional key)
  "The days OFFSETS after the tabular Hijri MONTH/DAY occurrence of YEAR (see
*HIJRI-OCCURRENCE*), when CODE has no list for YEAR that covers KEY
(MENA-LISTED-P)."
  (unless (mena-listed-p code year key)
    (let ((d (islamic-date-in-gregorian-year year month day)))
      (and d (mapcar (lambda (k) (+ d k)) offsets)))))

(defun %solar (month day)
  "A compute function: the Gregorian dates of Solar Hijri MONTH/DAY in a year."
  (lambda (year) (datetime-protocol:persian-dates-in-gregorian-year year month day)))

(defparameter *mena-statute-eras*
  '((:calendar "KW" :from (2010 2 21) :to nil
     :authority "القانون رقم 6 لسنة 2010 في شأن العمل في القطاع الأهلي، المادة 68: the 13 official holidays"
     :uri "https://www.alkarama.org/sites/default/files/2017-06/Law%20Of%20Labor_AR.pdf"
     :issued nil :published (2010 2 21)
     :published-in "الكويت اليوم 963 of 21 Feb 2010 (per press and ILO citations; gazette PDF not read)"
     :in-force nil
     :dates-note "Text read from a 2017 print of the Public Authority for Manpower page; the signature date is not on that copy and no start is stated, so :FROM is the gazette date.")
    (:calendar "OM" :from (1996 10 1) :to (2020 4 19)
     :authority "المرسوم السلطاني رقم 76/96 بتحديد أيام العطلات الرسمية"
     :uri "https://qanoon.om/p/1996/rd1996076/"
     :issued (1996 9 28) :issued-uri "https://qanoon.om/p/1996/rd1996076/"
     :published (1996 10 1) :published-uri "https://decree.om/1996/rd19960076/"
     :published-in "الجريدة الرسمية 584 (1 Oct 1996)" :in-force (1996 10 1))
    (:calendar "OM" :from (2020 4 20) :to (2022 12 6)
     :authority "المرسوم السلطاني رقم 56/2020 بتحديد أيام الإجازات الرسمية (no Renaissance Day)"
     :uri "https://qanoon.om/p/2020/rd2020056/"
     :issued (2020 4 20) :issued-uri "https://omannews.gov.om/topics/ar/112/show/377750"
     :published (2020 4 26) :published-uri "https://qanoon.om/p/2020/rd2020056/"
     :published-in "الجريدة الرسمية 1339 (26 Apr 2020)" :in-force (2020 4 20))
    (:calendar "OM" :from (2022 12 7) :to nil
     :authority "المرسوم السلطاني رقم 88/2022 بتحديد أيام الإجازات الرسمية (Accession Day from 2023)"
     :uri "https://qanoon.om/p/2022/rd2022088/"
     :issued (2022 12 7) :issued-uri "https://omannews.gov.om/topics/ar/85/show/411345"
     :published (2022 12 11) :published-uri "https://qanoon.om/p/2022/rd2022088/"
     :published-in "الجريدة الرسمية 1471 (11 Dec 2022)" :in-force (2022 12 7))
    (:calendar "OM" :from (2025 1 21) :to nil
     :authority "المرسوم السلطاني رقم 15/2025 بتعديل بعض أحكام المرسوم السلطاني رقم 88/2022 (National Day 20–21 November)"
     :uri "https://qanoon.om/p/2025/rd2025015/"
     :issued (2025 1 21) :issued-uri "https://qanoon.om/p/2025/rd2025015/"
     :published (2025 1 26) :published-uri "https://qanoon.om/p/2025/rd2025015/"
     :published-in "الجريدة الرسمية 1581 (26 Jan 2025)" :in-force (2025 1 21))
    (:calendar "IQ" :from (1972 9 19) :to (2024 5 26)
     :authority "قانون العطلات الرسمية رقم (110) لسنة 1972, as amended"
     :uri "https://web.archive.org/web/20240820010527/https://wiki.dorar-aliraq.net/iraqilaws/law/5663.html"
     :issued (1972 9 11)
     :issued-uri "https://web.archive.org/web/20240820010527/https://wiki.dorar-aliraq.net/iraqilaws/law/5663.html"
     :published (1972 9 19)
     :published-uri "https://web.archive.org/web/20240820010527/https://wiki.dorar-aliraq.net/iraqilaws/law/5663.html"
     :published-in "الوقائع العراقية 2184 (19 Sep 1972), as the dorar-aliraq legal wiki quotes it"
     :in-force (1972 9 19))
    (:calendar "IQ" :from (2024 5 27) :to nil
     :authority "قانون العطلات الرسمية رقم (12) لسنة 2024"
     :uri "https://www.moj.gov.iq/upload/pdf/4777_453.pdf"
     :issued (2024 5 27) :issued-uri "https://www.moj.gov.iq/upload/pdf/4777_453.pdf"
     :published (2024 5 27) :published-uri "https://www.moj.gov.iq/upload/pdf/4777_453.pdf"
     :published-in "الوقائع العراقية 4777 (27 May 2024)" :in-force (2024 5 27)))
  "The statute of each era of the KW, OM and IQ lists, with :ISSUED,
:PUBLISHED and :IN-FORCE, or a :DATES-NOTE for a missing one (#93). The
fixed-day rules of the starters cite them.")

(define-calendar kuwait-holidays-calendar (:register "KW" :constructor kuwait-holidays-calendar)
  ;; Fixed days of Law 6/2010 art. 68; the Islamic, rest and bridge days of
  ;; each listed year are data/kw/holidays.sexp rows.
  (:fixed "رأس السنة الميلادية" 1 1 :from 1961 :authority "Law 6/2010 art. 68")
  (:fixed "العيد الوطني" 2 25 :from 1962 :authority "Law 6/2010 art. 68")
  (:fixed "يوم التحرير" 2 26 :from 1992 :authority "Law 6/2010 art. 68")
  (:computed "الإسراء والمعراج (estimated)" (lambda (y) (%mena-estimate "KW" y 7 27 '(0))) :from 1961
   :authority "Tabular 27 Rajab, only in years with no list")
  (:computed "عيد الفطر (estimated)" (lambda (y) (%mena-estimate "KW" y 10 1 '(0 1 2))) :from 1961
   :authority "Tabular 1–3 Shawwal, only in years with no list")
  (:computed "يوم الوقوف بعرفة (estimated)" (lambda (y) (%mena-estimate "KW" y 12 9 '(0))) :from 1961
   :authority "Tabular 9 Dhu al-Hijjah, only in years with no list")
  (:computed "عيد الأضحى (estimated)" (lambda (y) (%mena-estimate "KW" y 12 10 '(0 1 2))) :from 1961
   :authority "Tabular 10–12 Dhu al-Hijjah, only in years with no list")
  (:computed "رأس السنة الهجرية (estimated)" (lambda (y) (%mena-estimate "KW" y 1 1 '(0))) :from 1961
   :authority "Tabular 1 Muharram, only in years with no list")
  (:computed "المولد النبوي الشريف (estimated)" (lambda (y) (%mena-estimate "KW" y 3 12 '(0))) :from 1961
   :authority "Tabular 12 Rabi' al-awwal, only in years with no list"))

(define-calendar oman-holidays-calendar (:register "OM" :constructor oman-holidays-calendar)
  ;; Statutory days of each Royal Decree; the announced Islamic days, moves
  ;; and compensation days of each listed year are data/om/holidays.sexp rows.
  (:fixed "يوم النهضة المباركة" 7 23 :from 1970 :to 2019
   :authority "Granted yearly by the Minister of the Diwan of Royal Court (not in RD 76/96); not in RD 56/2020")
  (:fixed "العيد الوطني المجيد" 11 18 :from 1970 :to 2024 :authority "RD 76/96, 56/2020, 88/2022")
  (:fixed "العيد الوطني المجيد" 11 19 :from 1970 :to 2024 :authority "RD 76/96, 56/2020, 88/2022")
  (:fixed "اليوم الوطني لسلطنة عمان" 11 20 :from 2025 :authority "RD 15/2025")
  (:fixed "اليوم الوطني لسلطنة عمان" 11 21 :from 2025 :authority "RD 15/2025")
  (:fixed "يوم تولي السلطان مقاليد الحكم" 1 11 :from 2023 :authority "RD 88/2022")
  (:computed "رأس السنة الهجرية (estimated)" (lambda (y) (%mena-estimate "OM" y 1 1 '(0))) :from 1970
   :authority "Tabular 1 Muharram, only in years with no list")
  (:computed "المولد النبوي الشريف (estimated)" (lambda (y) (%mena-estimate "OM" y 3 12 '(0))) :from 1970
   :authority "Tabular 12 Rabi' al-awwal, only in years with no list")
  (:computed "الإسراء والمعراج (estimated)" (lambda (y) (%mena-estimate "OM" y 7 27 '(0))) :from 1970
   :authority "Tabular 27 Rajab, only in years with no list")
  (:computed "عيد الفطر المبارك (estimated)" (lambda (y) (%mena-estimate "OM" y 9 29 '(0 1))) :from 1970
   :authority "Tabular 29–30 Ramadan, only in years with no list")
  (:computed "عيد الفطر المبارك (estimated)" (lambda (y) (%mena-estimate "OM" y 10 1 '(0 1 2))) :from 1970
   :authority "Tabular 1–3 Shawwal, only in years with no list")
  (:computed "عيد الأضحى المبارك (estimated)" (lambda (y) (%mena-estimate "OM" y 12 9 '(0 1 2 3))) :from 1970
   :authority "Tabular 9–12 Dhu al-Hijjah, only in years with no list"))

(define-calendar iraq-holidays-calendar (:register "IQ" :constructor iraq-holidays-calendar)
  ;; Statutory days by era; the declared Islamic days and Eid extensions of
  ;; each listed year are data/iq/holidays.sexp rows.
  (:fixed "رأس السنة الميلادية" 1 1 :from 1972 :authority "Law 110/1972; Law 12/2024")
  (:fixed "عيد الجيش" 1 6 :from 1972 :authority "Law 110/1972; Law 12/2024")
  (:fixed "ثورة 8 شباط" 2 8 :from 1972 :to 2003 :authority "Law 110/1972; abolished by Governing Council decision 1/2003")
  (:fixed "ذكرى جرائم البعث الصدامي" 3 16 :from 2025 :authority "Law 12/2024")
  (:fixed "عيد نوروز" 3 21 :from 1972 :authority "Law 110/1972; Law 12/2024")
  (:fixed "عيد التحرير (الفاو)" 4 17 :from 1989 :to 2002 :authority "RCC decision 210/1989; abolished 2003")
  (:fixed "عيد العمال العالمي" 5 1 :from 1972 :authority "Law 110/1972; Law 12/2024")
  (:fixed "ثورة 14 تموز" 7 14 :from 1972 :to 2023 :authority "Law 110/1972; not in Law 12/2024")
  (:fixed "ثورة 17 تموز" 7 17 :from 1972 :to 2002 :authority "Law 110/1972, RCC 886/1979; abolished 2003")
  (:fixed "عيد النصر" 8 8 :from 1989 :to 2002 :authority "RCC decision 210/1989; abolished 2003")
  (:fixed "العيد الوطني لجمهورية العراق" 10 3 :from 2020
   :authority "Council of Ministers decision of 1 Sep 2020: 3 October the national day every year")
  (:fixed "يوم النصر على داعش" 12 10 :from 2017
   :authority "Prime Minister's declaration of 9 Dec 2017: 10 December a holiday every year")
  (:computed "رأس السنة الهجرية (estimated)" (lambda (y) (%mena-estimate "IQ" y 1 1 '(0))) :from 1972
   :authority "Tabular 1 Muharram, only in years with no list")
  (:computed "عاشوراء (estimated)" (lambda (y) (%mena-estimate "IQ" y 1 10 '(0))) :from 1972
   :authority "Tabular 10 Muharram, only in years with no list")
  (:computed "المولد النبوي الشريف (estimated)" (lambda (y) (%mena-estimate "IQ" y 3 12 '(0))) :from 1972
   :authority "Tabular 12 Rabi' al-awwal, only in years with no list")
  (:computed "عيد الفطر (estimated)" (lambda (y) (%mena-estimate "IQ" y 10 1 '(0 1 2))) :from 1972
   :authority "Tabular 1–3 Shawwal, only in years with no list")
  (:computed "عيد الأضحى (estimated)" (lambda (y) (%mena-estimate "IQ" y 12 10 '(0 1 2 3))) :from 1972
   :authority "Tabular 10–13 Dhu al-Hijjah, only in years with no list")
  (:computed "عيد الغدير (estimated)" (lambda (y) (%mena-estimate "IQ" y 12 18 '(0))) :from 2024
   :authority "Law 12/2024: tabular 18 Dhu al-Hijjah, only in years with no list"))

(define-calendar iran-holidays-calendar (:register "IR" :constructor iran-holidays-calendar)
  ;; Solar Hijri days on the astronomical calendar; the lunar days and
  ;; closures of each listed year are data/ir/holidays.sexp rows.
  (:computed "عید نوروز" (%solar 1 1) :from 1980 :authority "Official holidays act 1359: 1–4 Farvardin")
  (:computed "عید نوروز" (%solar 1 2) :from 1980 :authority "Official holidays act 1359")
  (:computed "عید نوروز" (%solar 1 3) :from 1980 :authority "Official holidays act 1359")
  (:computed "عید نوروز" (%solar 1 4) :from 1980 :authority "Official holidays act 1359")
  (:computed "روز جمهوری اسلامی ایران" (%solar 1 12) :from 1980 :authority "12 Farvardin")
  (:computed "روز طبیعت" (%solar 1 13) :from 1980 :authority "13 Farvardin")
  (:computed "رحلت حضرت امام خمینی" (%solar 3 14) :from 1990 :authority "14 Khordad")
  (:computed "قیام ۱۵ خرداد" (%solar 3 15) :from 1980 :authority "15 Khordad")
  (:computed "پیروزی انقلاب اسلامی ایران" (%solar 11 22) :from 1980 :authority "22 Bahman")
  (:computed "روز ملی شدن صنعت نفت ایران" (%solar 12 29) :from 1980
   :authority "29 Esfand: in every Calendar Center list 1378–1405")
  (:computed "تاسوعای حسینی (estimated)" (lambda (y) (%mena-estimate "IR" y 1 9 '(0))) :from 1980
   :authority "Tabular 9 Muharram, only in years with no list")
  (:computed "عاشورای حسینی (estimated)" (lambda (y) (%mena-estimate "IR" y 1 10 '(0))) :from 1980
   :authority "Tabular 10 Muharram, only in years with no list")
  (:computed "اربعین حسینی (estimated)" (lambda (y) (%mena-estimate "IR" y 2 20 '(0))) :from 1980
   :authority "Tabular 20 Safar, only in years with no list")
  (:computed "رحلت رسول اکرم و شهادت امام حسن (estimated)" (lambda (y) (%mena-estimate "IR" y 2 28 '(0)))
   :from 1980 :authority "Tabular 28 Safar, only in years with no list")
  (:computed "شهادت امام رضا (estimated)" (lambda (y) (%mena-estimate "IR" y 2 29 '(0))) :from 1980
   :authority "The last day of Safar (tabular 29 Safar), only in years with no list")
  (:computed "شهادت امام حسن عسکری (estimated)" (lambda (y) (%mena-estimate "IR" y 3 8 '(0))) :from 2017
   :authority "Law on Permanent Provisions of the Development Plans art. 37(h): tabular 8 Rabi' al-awwal")
  (:computed "میلاد رسول اکرم و امام جعفر صادق (estimated)" (lambda (y) (%mena-estimate "IR" y 3 17 '(0)))
   :from 1980 :authority "Tabular 17 Rabi' al-awwal, only in years with no list")
  (:computed "شهادت حضرت فاطمه زهرا (estimated)" (lambda (y) (%mena-estimate "IR" y 6 3 '(0))) :from 2000
   :authority "Amendment of 1378: tabular 3 Jumada al-thani")
  (:computed "ولادت امام علی (estimated)" (lambda (y) (%mena-estimate "IR" y 7 13 '(0))) :from 1980
   :authority "Tabular 13 Rajab, only in years with no list")
  (:computed "مبعث رسول اکرم (estimated)" (lambda (y) (%mena-estimate "IR" y 7 27 '(0))) :from 1980
   :authority "Tabular 27 Rajab, only in years with no list")
  (:computed "نیمه شعبان (estimated)" (lambda (y) (%mena-estimate "IR" y 8 15 '(0))) :from 1980
   :authority "Tabular 15 Sha'ban, only in years with no list")
  (:computed "شهادت حضرت علی (estimated)" (lambda (y) (%mena-estimate "IR" y 9 21 '(0))) :from 1980
   :authority "Tabular 21 Ramadan, only in years with no list")
  (:computed "عید سعید فطر (estimated)" (lambda (y) (%mena-estimate "IR" y 10 1 '(0))) :from 1980
   :authority "Tabular 1 Shawwal, only in years with no list")
  (:computed "تعطیل به مناسبت عید سعید فطر (estimated)" (lambda (y) (%mena-estimate "IR" y 10 2 '(0)))
   :from 2011 :authority "Law of 1390 (2011): 2 Shawwal")
  (:computed "شهادت امام جعفر صادق (estimated)" (lambda (y) (%mena-estimate "IR" y 10 25 '(0))) :from 1980
   :authority "Tabular 25 Shawwal, only in years with no list")
  (:computed "عید سعید قربان (estimated)" (lambda (y) (%mena-estimate "IR" y 12 10 '(0))) :from 1980
   :authority "Tabular 10 Dhu al-Hijjah, only in years with no list")
  (:computed "عید سعید غدیر خم (estimated)" (lambda (y) (%mena-estimate "IR" y 12 18 '(0))) :from 1980
   :authority "Tabular 18 Dhu al-Hijjah, only in years with no list"))

(define-calendar algeria-holidays-calendar (:register "DZ" :constructor algeria-holidays-calendar)
  ;; Fêtes légales of Loi 63-278 as amended; the declared Hijri days of each
  ;; listed year are data/dz/holidays.sexp rows. No Christian holiday is a
  ;; fête légale for all (Easter Monday and others are for Christian staff
  ;; only, art. 3).
  (:fixed "Premier janvier" 1 1 :from 1963 :authority "Loi 63-278")
  (:fixed "Yennayer (jour de l'An amazigh)" 1 12 :from 2018
   :authority "Conseil des ministres 27 Dec 2017; Loi 18-12 (JORADP 46 of 29 Jul 2018)")
  (:fixed "Fête du Travail" 5 1 :from 1963 :authority "Loi 63-278")
  (:fixed "Dix-neuf juin" 6 19 :from 1966 :to 2004
   :authority "Ord. 66-153 (JORADP 52 of 17 Jun 1966); dropped by Loi 05-06 (JORADP 30 of 27 Apr 2005)")
  (:fixed "Fête de l'Indépendance" 7 5 :from 1963 :authority "Loi 63-278; Loi 05-06")
  (:fixed "Fête de la Révolution" 11 1 :from 1963 :authority "Loi 63-278")
  (:computed "Awal Moharram (estimated)" (lambda (y) (%mena-estimate "DZ" y 1 1 '(0))) :from 1963
   :authority "Tabular 1 Muharram, only in years with no list")
  (:computed "Achoura (estimated)" (lambda (y) (%mena-estimate "DZ" y 1 10 '(0))) :from 1963
   :authority "Tabular 10 Muharram, only in years with no list")
  (:computed "El-Mawlid Ennabawi (estimated)" (lambda (y) (%mena-estimate "DZ" y 3 12 '(0))) :from 1963
   :authority "Tabular 12 Rabi' al-awwal, only in years with no list")
  (:computed "Aïd El Fitr (estimated)" (lambda (y) (%mena-estimate "DZ" y 10 1 '(0 1))) :from 1963
   :authority "Tabular 1–2 Shawwal (Loi 63-278), only in years with no list")
  (:computed "Aïd El Fitr (estimated)" (lambda (y) (%mena-estimate "DZ" y 10 3 '(0))) :from 2024
   :authority "Loi 23-10 (JORADP 43 of 27 Jun 2023): a third day; tabular 3 Shawwal")
  (:computed "Aïd El Adha (estimated)" (lambda (y) (%mena-estimate "DZ" y 12 10 '(0 1))) :from 1968
   :authority "Tabular 10–11 Dhu al-Hijjah (Ord. 68-419), only in years with no list")
  (:computed "Aïd El Adha (estimated)" (lambda (y) (%mena-estimate "DZ" y 12 12 '(0))) :from 2023
   :authority "Loi 23-10: a third day; tabular 12 Dhu al-Hijjah"))

(define-calendar morocco-holidays-calendar (:register "MA" :constructor morocco-holidays-calendar)
  ;; Jours fériés of the public administrations (décret 2-77-169 as amended);
  ;; the declared Hijri days of each listed year are data/ma/holidays.sexp rows.
  (:fixed "Nouvel an" 1 1 :from 1977 :authority "Décret 2-77-169")
  (:fixed "Manifeste de l'Indépendance" 1 11 :from 1977 :authority "Décret 2-77-169")
  (:fixed "Nouvel an amazigh" 1 14 :from 2024
   :authority "Royal Cabinet communiqué 3 May 2023; décret 2-23-688 (BO 7256 of 14 Dec 2023)")
  (:fixed "Fête du Travail" 5 1 :from 1977 :authority "Décret 2-77-169")
  (:fixed "Fête du Trône" 3 3 :from 1977 :to 1999 :authority "Décret 2-77-169 (Hassan II)")
  (:fixed "Fête du Trône" 7 30 :from 2000 :authority "Décret 2-00-166 of 10 May 2000")
  (:fixed "Allégeance Oued Eddahab" 8 14 :from 1979 :authority "Décret 2-77-169 as amended")
  (:fixed "Révolution du Roi et du Peuple" 8 20 :from 1977 :authority "Décret 2-77-169")
  (:fixed "Fête de la Jeunesse" 8 21 :from 2000 :authority "Décret 2-00-166 of 10 May 2000")
  (:fixed "Fête de l'Unité" 10 31 :from 2026
   :authority "Royal Office statement 4 Nov 2025; décret 2-25-1140 (BO 7480 of 5 Feb 2026)")
  (:fixed "Marche Verte" 11 6 :from 1977 :authority "Décret 2-77-169")
  (:fixed "Fête de l'Indépendance" 11 18 :from 1977 :authority "Décret 2-77-169")
  (:computed "1er Moharram (estimated)" (lambda (y) (%mena-estimate "MA" y 1 1 '(0))) :from 1977
   :authority "Tabular 1 Muharram, only in years with no list")
  (:computed "Aïd Al Mawlid (estimated)" (lambda (y) (%mena-estimate "MA" y 3 12 '(0 1))) :from 1977
   :authority "Tabular 12–13 Rabi' al-awwal, only in years with no list")
  (:computed "Aïd Al Fitr (estimated)" (lambda (y) (%mena-estimate "MA" y 10 1 '(0 1))) :from 1977
   :authority "Tabular 1–2 Shawwal, only in years with no list")
  (:computed "Aïd Al Adha (estimated)" (lambda (y) (%mena-estimate "MA" y 12 10 '(0 1))) :from 1977
   :authority "Tabular 10–11 Dhu al-Hijjah, only in years with no list"))

(define-calendar egypt-holidays-calendar (:register "EG" :constructor egypt-holidays-calendar)
  ;; Fixed days of each list and Sham el-Nessim; the Eid blocks, Hijri days
  ;; and moves of each listed year are data/eg/holidays.sexp rows (a moved
  ;; fixed day is :suppressed there).
  (:fixed "عيد الميلاد المجيد" 1 7 :from 2003 :authority "PM decree 2052/2002; PM 1193/2018")
  (:fixed "عيد الشرطة" 1 25 :from 2010 :to 2011 :authority "PM decree 387/2009")
  (:fixed "عيد ثورة 25 يناير وعيد الشرطة" 1 25 :from 2012 :authority "PM decree 1355/2011; PM 1193/2018")
  (:fixed "عيد تحرير سيناء" 4 25 :from 1983 :authority "PM decree 454/1987; PM 1193/2018")
  (:fixed "عيد العمال" 5 1 :from 1953 :authority "PM decree 454/1987; PM 1193/2018")
  (:fixed "ذكرى ثورة 30 يونيو" 6 30 :from 2015
   :authority "Yearly PM decrees 2015–2017 (1723/2015 …); PM 1193/2018. No holiday in 2014")
  (:fixed "عيد ثورة 23 يوليو" 7 23 :from 1953 :authority "PM decree 454/1987; PM 1193/2018")
  (:fixed "عيد القوات المسلحة" 10 6 :from 1974 :authority "PM decree 454/1987; PM 1193/2018")
  (:easter "شم النسيم" 1 :orthodox t :from 1987
   :authority "The Monday after Orthodox Easter (PM 454/1987; PM 1193/2018 item 7); never moved")
  (:computed "رأس السنة الهجرية (estimated)" (lambda (y) (%mena-estimate "EG" y 1 1 '(0))) :from 1953
   :authority "Tabular 1 Muharram, only in years with no list")
  (:computed "المولد النبوي الشريف (estimated)" (lambda (y) (%mena-estimate "EG" y 3 12 '(0))) :from 1953
   :authority "Tabular 12 Rabi' al-awwal, only in years with no list")
  (:computed "عيد الفطر المبارك (estimated)" (lambda (y) (%mena-estimate "EG" y 10 1 '(-1 0 1 2))) :from 1958
   :authority "Presidential decree of 1958 / PM 1193/2018: the eve and three days; tabular, only in years with no list")
  (:computed "عيد الأضحى المبارك (estimated)" (lambda (y) (%mena-estimate "EG" y 12 10 '(-1 0 1 2 3))) :from 1958
   :authority "Presidential decree of 1958 / PM 1193/2018: Arafah and four days; tabular, only in years with no list"))

(defun %mena-calendar (class code year transfers suppressed working-days)
  (%south-asia-calendar class (mena-blocks code) year transfers suppressed working-days))

(defun egypt-holidays-calendar (&key year transfers suppressed working-days)
  "Official holidays of the Egyptian government (\"EG\"): the fixed days of
each list, Sham el-Nessim, and the Eid blocks, Hijri days and moves of the
yearly PM decrees, data/eg/holidays.sexp. Confidence by year:
MENA-CONFIDENCE."
  (%mena-calendar 'egypt-holidays-calendar "EG" year transfers suppressed working-days))

(defun algeria-holidays-calendar (&key year transfers suppressed working-days)
  "Fêtes légales of Algeria (\"DZ\"): the fixed days of Loi 63-278 as amended
and the declared Hijri days of data/dz/holidays.sexp. Confidence by year:
MENA-CONFIDENCE."
  (%mena-calendar 'algeria-holidays-calendar "DZ" year transfers suppressed working-days))

(defun morocco-holidays-calendar (&key year transfers suppressed working-days)
  "Jours fériés of the Moroccan public administrations (\"MA\"): the fixed
days of décret 2-77-169 as amended and the declared Hijri days of
data/ma/holidays.sexp (all :secondary). Confidence by year: MENA-CONFIDENCE."
  (%mena-calendar 'morocco-holidays-calendar "MA" year transfers suppressed working-days))

(defun kuwait-holidays-calendar (&key year transfers suppressed working-days)
  "Official holidays of the Kuwaiti government sector (\"KW\"): the fixed days
of Law 6/2010 art. 68 and the declared Islamic, rest and bridge days of
data/kw/holidays.sexp. Without YEAR every listed year applies; with YEAR only
that year's rows. Confidence by year: MENA-CONFIDENCE."
  (%mena-calendar 'kuwait-holidays-calendar "KW" year transfers suppressed working-days))

(defun oman-holidays-calendar (&key year transfers suppressed working-days)
  "Official holidays of Oman (\"OM\"): the statutory days of each Royal
Decree and the announced days, moves and compensation days of
data/om/holidays.sexp. Confidence by year: MENA-CONFIDENCE."
  (%mena-calendar 'oman-holidays-calendar "OM" year transfers suppressed working-days))

(defun iraq-holidays-calendar (&key year transfers suppressed working-days)
  "Federal official holidays of Iraq (\"IQ\"): the statutory days by era and
the declared Islamic days and Eid extensions of data/iq/holidays.sexp.
Confidence by year: MENA-CONFIDENCE."
  (%mena-calendar 'iraq-holidays-calendar "IQ" year transfers suppressed working-days))

(defun iran-holidays-calendar (&key year transfers suppressed working-days)
  "Official holidays of Iran (\"IR\"): the Solar Hijri days on the
astronomical calendar and the lunar days and closures of the Calendar
Center's yearly lists, data/ir/holidays.sexp. Confidence by year:
MENA-CONFIDENCE."
  (%mena-calendar 'iran-holidays-calendar "IR" year transfers suppressed working-days))
