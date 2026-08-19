(in-package #:cl-stack-calendars)

;;;; Middle East / North Africa / Pakistan / Turkey / Iran —
;;;; research window max(1900, formation) → present.

(define-calendar pakistan-holidays-calendar (:register "PK")
  (:fixed "Kashmir Day" 2 5 :from 1990
   :authority "Public holiday — Kashmir Solidarity Day")
  (:fixed "Pakistan Day" 3 23 :from 1947
   :authority "Lahore Resolution / Pakistan Day — public holiday")
  (:fixed "Labour Day" 5 1 :from 1947 :authority "Public holiday")
  (:fixed "Independence Day" 8 14 :from 1947
   :authority "Independence 14 August 1947")
  (:fixed "Iqbal Day" 11 9 :from 1947 :to 2014
   :authority "Iqbal Day — was public holiday; removed from holidays then partially restored in practice")
  (:fixed "Quaid-e-Azam Day / Christmas" 12 25 :from 1947
   :authority "Birthday of Jinnah / Christmas — public holiday")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1947 :authority "Public holiday (tabular)")
  (:computed "Eid al-Fitr"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 1))))
   :from 1947 :authority "Eid Day 2")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1947 :authority "Public holiday (tabular)")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 1))))
   :from 1947 :authority "Eid al-Adha Day 2")
  (:computed "Ashura"
   (lambda (y) (islamic-date-in-gregorian-year y 1 10))
   :from 1947 :authority "10 Muharram (tabular)")
  (:computed "Eid Milad-un-Nabi" #'mawlid-date :from 1947
   :authority "Public holiday (tabular)"))

(define-calendar egypt-holidays-calendar (:register "EG")
  (:fixed "Coptic Christmas" 1 7 :from 2003
   :authority "Public holiday (Coptic Christmas) from early 2000s recognition")
  (:fixed "January 25 Revolution Day" 1 25 :from 2012
   :authority "Public holiday — 2011 revolution")
  (:fixed "Sinai Liberation Day" 4 25 :from 1982
   :authority "Public holiday — Sinai return 1982")
  (:fixed "Labour Day" 5 1 :from 1953 :authority "Public holiday")
  (:fixed "June 30 Revolution Day" 6 30 :from 2014
   :authority "Public holiday")
  (:fixed "July 23 Revolution Day" 7 23 :from 1953
   :authority "1952 Revolution — public holiday")
  (:fixed "Armed Forces Day" 10 6 :from 1974
   :authority "Public holiday — October War 1973")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1953 :authority "Public holiday (tabular)")
  (:computed "Eid al-Fitr"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 1))))
   :from 1953 :authority "Eid Day 2")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1953 :authority "Public holiday (tabular)")
  (:computed "Islamic New Year" #'islamic-new-year-date :from 1953
   :authority "Public holiday (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1953 :authority "Public holiday (tabular)"))

(define-calendar turkey-holidays-calendar (:register "TR")
  (:fixed "Yılbaşı" 1 1 :from 1926
   :authority "Ulusal bayram / resmi tatil — New Year (Gregorian adoption era)")
  (:fixed "Ulusal Egemenlik ve Çocuk Bayramı" 4 23 :from 1921
   :authority "23 Nisan — National Sovereignty and Children's Day")
  (:fixed "Emek ve Dayanışma Günü" 5 1 :from 2009
   :authority "1 Mayıs — public holiday restored 2009")
  (:fixed "Atatürk'ü Anma Gençlik ve Spor Bayramı" 5 19 :from 1938
   :authority "19 Mayıs — Commemoration of Atatürk, Youth and Sports Day")
  (:fixed "Demokrasi ve Millî Birlik Günü" 7 15 :from 2017
   :authority "15 Temmuz — Democracy and National Unity Day")
  (:fixed "Zafer Bayramı" 8 30 :from 1926
   :authority "30 Ağustos — Victory Day")
  (:fixed "Cumhuriyet Bayramı" 10 29 :from 1923
   :authority "29 Ekim — Republic Day")
  (:computed "Ramazan Bayramı" #'eid-al-fitr :from 1923
   :authority "Dini bayram (tabular Hijri)")
  (:computed "Ramazan Bayramı"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 1))))
   :from 1923 :authority "Ramazan Bayramı 2. gün")
  (:computed "Ramazan Bayramı"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 2))))
   :from 1923 :authority "Ramazan Bayramı 3. gün")
  (:computed "Kurban Bayramı" #'eid-al-adha :from 1923
   :authority "Dini bayram (tabular Hijri)")
  (:computed "Kurban Bayramı"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 1))))
   :from 1923 :authority "Kurban 2. gün")
  (:computed "Kurban Bayramı"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 2))))
   :from 1923 :authority "Kurban 3. gün")
  (:computed "Kurban Bayramı"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 3))))
   :from 1923 :authority "Kurban 4. gün"))

(define-calendar iran-holidays-calendar (:register "IR")
  ;; Civil Gregorian approximations for Iranian national days; Nowruz ≈ 1 Farvardin.
  (:fixed "پیروزی انقلاب اسلامی" 2 11 :from 1979
   :authority "Islamic Revolution Victory Day (22 Bahman)")
  (:fixed "نوروز" 3 21 :from 1900
   :authority "Nowruz — 1 Farvardin (≈ 21 Mar; astronomical ±1)")
  (:fixed "نوروز" 3 22 :from 1900 :authority "Nowruz holiday")
  (:fixed "نوروز" 3 23 :from 1900 :authority "Nowruz holiday")
  (:fixed "نوروز" 3 24 :from 1900 :authority "Nowruz holiday")
  (:fixed "روز جمهوری اسلامی" 4 1 :from 1979
   :authority "Islamic Republic Day (12 Farvardin)")
  (:fixed "روز طبیعت" 4 2 :from 1900
   :authority "Sizdah Bedar (13 Farvardin ≈ 2 Apr)")
  (:fixed "درگذشت امام خمینی" 6 4 :from 1990
   :authority "Death of Khomeini (14 Khordad)")
  (:fixed "قیام ۱۵ خرداد" 6 5 :from 1979
   :authority "15 Khordad anniversary")
  (:computed "تاسوعا"
   (lambda (y) (islamic-date-in-gregorian-year y 1 9))
   :from 1979 :authority "9 Muharram (tabular)")
  (:computed "عاشورا"
   (lambda (y) (islamic-date-in-gregorian-year y 1 10))
   :from 1979 :authority "10 Muharram (tabular)")
  (:computed "عید فطر" #'eid-al-fitr :from 1979 :authority "Eid (tabular)")
  (:computed "عید قربان" #'eid-al-adha :from 1979 :authority "Eid (tabular)"))

(define-calendar saudi-arabia-holidays-calendar (:register "SA")
  (:fixed "Founding Day" 2 22 :from 2022
   :authority "Royal decree — Founding Day public holiday from 2022")
  (:fixed "National Day" 9 23 :from 2005
   :authority "Saudi National Day — public holiday from 2005 (unification 1932)")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1932 :authority "Eid (tabular; sighting official)")
  (:computed "Eid al-Fitr"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 1))))
   :from 1932 :authority "Eid Day 2")
  (:computed "Eid al-Fitr"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 2))))
   :from 1932 :authority "Eid Day 3")
  (:computed "Eid al-Fitr"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 3))))
   :from 1932 :authority "Eid Day 4")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1932 :authority "Eid (tabular)")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 1))))
   :from 1932 :authority "Eid Adha Day 2")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 2))))
   :from 1932 :authority "Eid Adha Day 3")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 3))))
   :from 1932 :authority "Eid Adha Day 4"))

(define-calendar algeria-holidays-calendar (:register "DZ")
  (:fixed "Yennayer" 1 12 :from 2018
   :authority "Amazigh New Year — public holiday from 2018")
  (:fixed "Jour de l'an" 1 1 :from 1962 :authority "Fête nationale / légale")
  (:easter "Vendredi saint" -2 :from 1962 :authority "Fête légale")
  (:easter "Lundi de Pâques" 1 :from 1962 :authority "Fête légale")
  (:fixed "Fête de la Révolution" 11 1 :from 1962
   :authority "1er novembre 1954 — fête nationale")
  (:fixed "Fête de l'Indépendance" 7 5 :from 1962
   :authority "Indépendance 5 juillet 1962")
  (:fixed "Fête du Travail" 5 1 :from 1962 :authority "Fête légale")
  (:computed "Aïd el-Fitr" #'eid-al-fitr :from 1962 :authority "Fête légale (tabular)")
  (:computed "Aïd el-Adha" #'eid-al-adha :from 1962 :authority "Fête légale (tabular)")
  (:computed "Nouvel An Hégirien" #'islamic-new-year-date :from 1962
   :authority "Fête légale (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1962 :authority "Fête légale (tabular)")
  (:computed "Ashura"
   (lambda (y) (islamic-date-in-gregorian-year y 1 10))
   :from 1962 :authority "Fête légale (tabular)"))

(define-calendar morocco-holidays-calendar (:register "MA")
  (:fixed "Nouvel An" 1 1 :from 1956 :authority "Fête légale")
  (:fixed "Présentation du Manifeste de l'Indépendance" 1 11 :from 1956
   :authority "Fête nationale")
  (:fixed "Fête du Travail" 5 1 :from 1956 :authority "Fête légale")
  (:fixed "Fête du Trône" 7 30 :from 1999
   :authority "Fête du Trône — Mohammed VI (30 juillet)")
  (:fixed "Fête du Trône" 3 3 :from 1963 :to 1998
   :authority "Fête du Trône — Hassan II era (3 mars)")
  (:fixed "Oued Ed-Dahab" 8 14 :from 1979 :authority "Fête nationale")
  (:fixed "Révolution du Roi et du Peuple" 8 20 :from 1956 :authority "Fête nationale")
  (:fixed "Fête de la Jeunesse" 8 21 :from 1956 :authority "Fête nationale")
  (:fixed "Marche Verte" 11 6 :from 1975 :authority "Fête nationale")
  (:fixed "Fête de l'Indépendance" 11 18 :from 1956 :authority "Fête nationale")
  (:computed "Aïd al-Fitr" #'eid-al-fitr :from 1956 :authority "Fête légale (tabular)")
  (:computed "Aïd al-Adha" #'eid-al-adha :from 1956 :authority "Fête légale (tabular)")
  (:computed "1er Moharram" #'islamic-new-year-date :from 1956 :authority "Fête légale")
  (:computed "Mawlid" #'mawlid-date :from 1956 :authority "Fête légale (tabular)"))

(define-calendar ukraine-holidays-calendar (:register "UA")
  (:fixed "Новий рік" 1 1 :from 1991 :authority "Закон про святкові дні")
  (:fixed "Різдво Христове" 1 7 :from 1991 :to 2022
   :authority "Orthodox Christmas 7 Jan — observed through 2022")
  (:fixed "Різдво Христове" 12 25 :from 2017
   :authority "Christmas 25 Dec — public holiday from 2017; sole Christmas from 2023")
  (:fixed "День праці" 5 1 :from 1991 :authority "Labour Day")
  (:fixed "День перемоги над нацизмом" 5 9 :from 1991 :to 2023
   :authority "Victory Day 9 May — reformed 2023–24")
  (:fixed "День перемоги над нацизмом у Другій світовій війні" 5 8 :from 2024
   :authority "Day of Remembrance and Victory over Nazism — 8 May from 2024")
  (:fixed "День Конституції" 6 28 :from 1996
   :authority "Constitution Day")
  (:fixed "День Української Державності" 7 15 :from 2022 :to 2023
   :authority "Statehood Day briefly 15 Jul then moved")
  (:fixed "День Української Державності" 7 28 :from 2024
   :authority "Statehood Day — 28 July from 2024")
  (:fixed "День Незалежності" 8 24 :from 1991
   :authority "Independence Day 24 August 1991")
  (:fixed "День захисників і захисниць України" 10 14 :from 2015 :to 2022
   :authority "Defenders Day 14 Oct until move to 1 Oct")
  (:fixed "День захисників і захисниць України" 10 1 :from 2023
   :authority "Defenders Day — 1 October from 2023")
  (:easter "Великдень (православний)" 0 :orthodox t :from 1991
   :authority "Orthodox Easter — public holiday")
  (:easter "Трійця (православна)" 49 :orthodox t :from 1991
   :authority "Orthodox Pentecost"))

;;; Sudan (independence 1956)
(define-calendar sudan-holidays-calendar (:register "SD")
  (:fixed "Independence Day" 1 1 :from 1956
   :authority "Independence 1 January 1956")
  (:fixed "Coptic Christmas" 1 7 :from 1956
   :authority "Coptic Christmas — public holiday")
  (:easter "Coptic Easter" 0 :orthodox t :from 1956
   :authority "Coptic / Orthodox Easter — public holiday")
  (:fixed "Revolution Day" 12 19 :from 2019
   :authority "December Revolution Day — public holiday from 2019")
  (:fixed "Christmas Day" 12 25 :from 1956
   :authority "Public holiday (Christmas)")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1956 :authority "Public holiday (tabular)")
  (:computed "Eid al-Fitr"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 1))))
   :from 1956 :authority "Eid al-Fitr Day 2")
  (:computed "Eid al-Fitr"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 2))))
   :from 1956 :authority "Eid al-Fitr Day 3")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1956 :authority "Public holiday (tabular)")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 1))))
   :from 1956 :authority "Eid al-Adha Day 2")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 2))))
   :from 1956 :authority "Eid al-Adha Day 3")
  (:computed "Islamic New Year" #'islamic-new-year-date :from 1956
   :authority "1 Muharram (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1956
   :authority "Prophet's Birthday (tabular)"))

;;; Iraq (independence 1932)
(define-calendar iraq-holidays-calendar (:register "IQ")
  (:fixed "New Year's Day" 1 1 :from 1932 :authority "Public holiday")
  (:fixed "Army Day" 1 6 :from 1921
   :authority "Iraqi Army Day")
  (:fixed "Nowruz" 3 21 :from 1932
   :authority "Nowruz — public holiday")
  (:fixed "Labour Day" 5 1 :from 1932 :authority "Public holiday")
  (:fixed "National Day" 10 3 :from 1932
   :authority "Independence from UK 3 October 1932")
  (:fixed "Victory Day" 12 10 :from 2018
   :authority "Victory over ISIS — public holiday from late 2010s")
  (:fixed "Christmas Day" 12 25 :from 1932
   :authority "Public holiday (recognized)")
  (:computed "Islamic New Year" #'islamic-new-year-date :from 1932
   :authority "1 Muharram (tabular)")
  (:computed "Ashura"
   (lambda (y) (islamic-date-in-gregorian-year y 1 10))
   :from 1932 :authority "10 Muharram (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1932
   :authority "Prophet's Birthday (tabular)")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1932 :authority "Public holiday (tabular)")
  (:computed "Eid al-Fitr"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 1))))
   :from 1932 :authority "Eid Day 2")
  (:computed "Eid al-Fitr"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 2))))
   :from 1932 :authority "Eid Day 3")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1932 :authority "Public holiday (tabular)")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 1))))
   :from 1932 :authority "Eid Adha Day 2")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 2))))
   :from 1932 :authority "Eid Adha Day 3")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 3))))
   :from 1932 :authority "Eid Adha Day 4")
  (:computed "Eid al-Ghadir"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 8))))
   :from 1932
   :authority "18 Dhu al-Hijjah — Eid al-Ghadir (tabular)"))

;;; Afghanistan (independence 1919; regime changes — durable civil set)
(define-calendar afghanistan-holidays-calendar (:register "AF")
  (:fixed "Nowruz" 3 21 :from 1919 :to 2020
   :authority "Nowruz — public holiday until Taliban suspension (2021–)")
  (:fixed "Labour Day" 5 1 :from 1978
   :authority "International Workers' Day")
  (:fixed "Independence Day" 8 19 :from 1919
   :authority "Independence / Treaty of Rawalpindi 19 August 1919")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1919 :authority "Public holiday (tabular)")
  (:computed "Eid al-Fitr"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 1))))
   :from 1919 :authority "Eid Day 2")
  (:computed "Eid al-Fitr"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 2))))
   :from 1919 :authority "Eid Day 3")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1919 :authority "Public holiday (tabular)")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 1))))
   :from 1919 :authority "Eid Adha Day 2")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 2))))
   :from 1919 :authority "Eid Adha Day 3")
  (:computed "Ashura"
   (lambda (y) (islamic-date-in-gregorian-year y 1 10))
   :from 1919 :authority "10 Muharram (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1919
   :authority "Prophet's Birthday (tabular)")
  (:computed "Islamic New Year" #'islamic-new-year-date :from 1919
   :authority "1 Muharram (tabular)"))

(defun pakistan-holidays-calendar () (make-instance 'pakistan-holidays-calendar))
(defun egypt-holidays-calendar () (make-instance 'egypt-holidays-calendar))
(defun turkey-holidays-calendar () (make-instance 'turkey-holidays-calendar))
(defun iran-holidays-calendar () (make-instance 'iran-holidays-calendar))
(defun saudi-arabia-holidays-calendar () (make-instance 'saudi-arabia-holidays-calendar))
(defun algeria-holidays-calendar () (make-instance 'algeria-holidays-calendar))
(defun morocco-holidays-calendar () (make-instance 'morocco-holidays-calendar))
(defun ukraine-holidays-calendar () (make-instance 'ukraine-holidays-calendar))
(defun sudan-holidays-calendar () (make-instance 'sudan-holidays-calendar))
(defun iraq-holidays-calendar () (make-instance 'iraq-holidays-calendar))
(defun afghanistan-holidays-calendar () (make-instance 'afghanistan-holidays-calendar))

;;; --- ≥20M tier (MENA / Asia overlap) ----------------------------------

(define-calendar yemen-holidays-calendar (:register "YE")
  (:fixed "Labour Day" 5 1 :from 1990 :authority "Public holiday")
  (:fixed "Unity Day" 5 22 :from 1990
   :authority "Yemeni unification — 22 May 1990")
  (:fixed "Revolution Day" 9 26 :from 1962
   :authority "26 September Revolution (YAR)")
  (:fixed "Independence Day" 11 30 :from 1967
   :authority "Independence of South Yemen — 30 November 1967")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1990 :authority "Public holiday (tabular)")
  (:computed "Eid al-Fitr"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 1))))
   :from 1990 :authority "Eid al-Fitr Day 2")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1990 :authority "Public holiday (tabular)")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 1))))
   :from 1990 :authority "Eid al-Adha Day 2")
  (:computed "Islamic New Year" #'islamic-new-year-date :from 1990
   :authority "1 Muharram (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1990 :authority "Public holiday (tabular)"))

(define-calendar syria-holidays-calendar (:register "SY")
  (:fixed "Revolution Day" 3 8 :from 1963
   :authority "8 March Revolution / Ba'ath — public holiday")
  (:fixed "Evacuation Day" 4 17 :from 1946
   :authority "Evacuation of French forces — Independence Day")
  (:fixed "Labour Day" 5 1 :from 1946 :authority "Public holiday")
  (:fixed "Martyrs' Day" 5 6 :from 1946 :authority "Public holiday")
  (:fixed "October Liberation War Day" 10 6 :from 1973
   :authority "October War / Yom Kippur War anniversary")
  (:fixed "Christmas Day" 12 25 :from 1946
   :authority "Public holiday (Christmas)")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1946 :authority "Public holiday (tabular)")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1946 :authority "Public holiday (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1946 :authority "Public holiday (tabular)"))

(defun yemen-holidays-calendar () (make-instance 'yemen-holidays-calendar))
(defun syria-holidays-calendar () (make-instance 'syria-holidays-calendar))
