(in-package #:cl-stack-calendars)

;;;; Middle East / North Africa / Pakistan / Turkey / Iran —
;;;; research window max(1900, formation) → present.

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

;;; Afghanistan (independence 1919; regime changes — durable civil set)
(define-calendar afghanistan-holidays-calendar (:register "AF")
  (:computed "Nowruz" (lambda (y) (datetime-protocol:persian-dates-in-gregorian-year y 1 1))
   :from 1919 :to 2021
   :authority "Nowruz (1 Hamal, the astronomical Solar Hijri new year) — public holiday to 2021, suspended after August 2021 (#44 item 9)")
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

(defun turkey-holidays-calendar () (make-instance 'turkey-holidays-calendar))
(defun saudi-arabia-holidays-calendar () (make-instance 'saudi-arabia-holidays-calendar))
(defun ukraine-holidays-calendar () (make-instance 'ukraine-holidays-calendar))
(defun sudan-holidays-calendar () (make-instance 'sudan-holidays-calendar))
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
