(in-package #:cl-stack-calendars)

;;;; Normative starters — Asia (population order), civil :FROM =
;;;; max(1900, formation) or later statute introduction.

;;; Indonesia (formation 1945)
(define-calendar indonesia-holidays-calendar (:register "ID")
  (:fixed "Tahun Baru Masehi" 1 1 :from 1946
   :authority "Libur nasional sejak 1946; Keppres tahunan")
  (:computed "Tahun Baru Imlek"
   (lambda (y) (chinese-new-year-date y :location +beijing+))
   :from 2003
   :authority "Keppres — Tahun Baru Imlek sebagai hari libur nasional (sejak 2003)")
  (:fixed "Hari Buruh Internasional" 5 1 :from 2014
   :authority "Keppres — Hari Buruh sebagai libur nasional (diperkuat 2014)")
  (:fixed "Hari Lahir Pancasila" 6 1 :from 2017
   :authority "Keppres No. 24 Tahun 2016 (libur sejak 2017)")
  (:fixed "Hari Kemerdekaan RI" 8 17 :from 1946
   :authority "Proklamasi 17 Agustus 1945; libur nasional sejak 1946")
  (:fixed "Hari Raya Natal" 12 25 :from 1946
   :authority "Libur nasional (Natal)")
  (:easter "Wafat Isa Almasih" -2 :from 1946
   :authority "Libur nasional (Jumat Agung)")
  (:computed "Idul Fitri" #'eid-al-fitr :from 1945
   :authority "Libur nasional — 1 Syawal (tabular Hijri; sighting may ±1)")
  (:computed "Idul Fitri"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 1))))
   :from 1945
   :authority "Libur nasional — 2 Syawal")
  (:computed "Idul Adha" #'eid-al-adha :from 1945
   :authority "Libur nasional — 10 Dhu al-Hijjah (tabular)")
  (:computed "Tahun Baru Islam" #'islamic-new-year-date :from 1945
   :authority "Libur nasional — 1 Muharram (tabular)")
  (:computed "Maulid Nabi" #'mawlid-date :from 1945
   :authority "Libur nasional — 12 Rabiulawal (tabular)"))

;;; Bangladesh (1971)
(define-calendar bangladesh-holidays-calendar (:register "BD")
  (:fixed "Language Movement Day" 2 21 :from 1972
   :authority "Shaheed Day / International Mother Language Day — national holiday")
  (:fixed "Sheikh Mujibur Rahman's Birthday" 3 17 :from 2020
   :authority "National holiday (Mujib's birthday)")
  (:fixed "Independence Day" 3 26 :from 1972
   :authority "Independence of Bangladesh 1971 — national holiday from 1972")
  (:fixed "Bengali New Year" 4 14 :from 1972
   :authority "Pohela Boishakh — national holiday")
  (:fixed "May Day" 5 1 :from 1972
   :authority "International Workers' Day")
  (:fixed "National Mourning Day" 8 15 :from 1972
   :authority "Assassination of Sheikh Mujibur Rahman — national holiday")
  (:fixed "Victory Day" 12 16 :from 1972
   :authority "Victory Day 1971 — national holiday")
  (:fixed "Christmas Day" 12 25 :from 1972
   :authority "Public holiday (Christmas)")
  (:computed "Eid ul-Fitr" #'eid-al-fitr :from 1972
   :authority "Islamic foundation holidays (tabular Hijri)")
  (:computed "Eid ul-Fitr"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 1))))
   :from 1972 :authority "Eid ul-Fitr (2nd day)")
  (:computed "Eid ul-Adha" #'eid-al-adha :from 1972
   :authority "Islamic foundation holidays (tabular Hijri)"))

;;; Philippines (1946)
(define-calendar philippines-holidays-calendar (:register "PH")
  (:fixed "New Year's Day" 1 1 :from 1946
   :authority "Republic Act / Proclamation — regular holiday")
  (:easter "Maundy Thursday" -3 :from 1946
   :authority "Regular holiday (Holy Week)")
  (:easter "Good Friday" -2 :from 1946
   :authority "Regular holiday (Holy Week)")
  (:fixed "Araw ng Kagitingan" 4 9 :from 1946
   :authority "Day of Valor — regular holiday")
  (:fixed "Labor Day" 5 1 :from 1946
   :authority "Regular holiday")
  (:fixed "Independence Day" 6 12 :from 1962
   :authority "Independence Day moved to 12 June (Diosdado Macapagal, 1962); was 4 July 1946–1961")
  (:fixed "Independence Day" 7 4 :from 1946 :to 1961
   :authority "Philippine Independence Day (4 July) until 1961")
  (:nth-weekday "National Heroes Day" 8 :monday -1 :from 2007
   :authority "RA 9492 — National Heroes Day last Monday of August")
  (:fixed "Bonifacio Day" 11 30 :from 1946
   :authority "Regular holiday (Andrés Bonifacio)")
  (:fixed "Christmas Day" 12 25 :from 1946
   :authority "Regular holiday")
  (:fixed "Rizal Day" 12 30 :from 1946
   :authority "Regular holiday (José Rizal)"))

;;; Vietnam (1945)
(define-calendar vietnam-holidays-calendar (:register "VN")
  (:fixed "Tết Dương lịch" 1 1 :from 1945
   :authority "Ngày nghỉ lễ — New Year")
  (:computed "Tết Nguyên Đán"
   (lambda (y) (chinese-new-year-date y :location +beijing+))
   :from 1945
   :authority "Tết — Âm lịch mùng 1 (Beijing tabular Chinese; VN may ±0–1)")
  (:computed "Tết"
   (lambda (y) (+ (chinese-new-year-date y :location +beijing+) 1))
   :from 1945 :authority "Tết mùng 2")
  (:computed "Tết"
   (lambda (y) (+ (chinese-new-year-date y :location +beijing+) 2))
   :from 1945 :authority "Tết mùng 3")
  (:fixed "Ngày thống nhất đất nước" 4 30 :from 1976
   :authority "Liberation / Reunification Day")
  (:fixed "Ngày Quốc tế Lao động" 5 1 :from 1945
   :authority "International Labour Day")
  (:fixed "Quốc khánh" 9 2 :from 1945
   :authority "National Day — Declaration of Independence 2 Sep 1945"))

;;; Thailand (floor 1900)
(define-calendar thailand-holidays-calendar (:register "TH")
  (:fixed "New Year's Day" 1 1 :from 1900
   :authority "Public holiday (Gregorian New Year)")
  (:fixed "Chakri Memorial Day" 4 6 :from 1920
   :authority "Chakri Dynasty memorial — public holiday")
  (:fixed "Songkran" 4 13 :from 1900
   :authority "Songkran (Thai New Year) — public holiday")
  (:fixed "Songkran" 4 14 :from 1900 :authority "Songkran")
  (:fixed "Songkran" 4 15 :from 1900 :authority "Songkran")
  (:fixed "Coronation Day" 5 5 :from 1950 :to 2018
   :authority "Coronation of Rama IX (5 May) — public holiday until era change")
  (:fixed "Coronation Day" 5 4 :from 2019
   :authority "Coronation of Rama X (4 May 2019) — public holiday")
  (:fixed "Queen Suthida's Birthday" 6 3 :from 2019
   :authority "Public holiday (Queen's birthday)")
  (:fixed "Birthday of King Rama X" 7 28 :from 2017
   :authority "Public holiday (King's birthday)")
  (:fixed "Queen Sirikit's Birthday / Mother's Day" 8 12 :from 1976
   :authority "Public holiday")
  (:fixed "Anniversary of the Death of King Bhumibol" 10 13 :from 2017
   :authority "Public holiday")
  (:fixed "Chulalongkorn Day" 10 23 :from 1920
   :authority "Public holiday (King Rama V)")
  (:fixed "Birthday of King Bhumibol / Father's Day" 12 5 :from 1960
   :authority "Public holiday")
  (:fixed "Constitution Day" 12 10 :from 1932
   :authority "Constitution Day — public holiday"))
(define-calendar south-korea-holidays-calendar (:register "KR")
  (:fixed "신정" 1 1 :from 1948
   :authority "관공서의 공휴일에 관한 규정 — New Year")
  (:computed "설날"
   (lambda (y) (- (chinese-new-year-date y :location +beijing+) 1))
   :from 1948 :authority "설날 연휴 (전날)")
  (:computed "설날"
   (lambda (y) (chinese-new-year-date y :location +beijing+))
   :from 1948 :authority "설날 — 농력 1/1")
  (:computed "설날"
   (lambda (y) (+ (chinese-new-year-date y :location +beijing+) 1))
   :from 1948 :authority "설날 연휴 (다음날)")
  (:fixed "삼일절" 3 1 :from 1949
   :authority "3·1절 — Independence Movement Day")
  (:fixed "어린이날" 5 5 :from 1975
   :authority "어린이날 — Children's Day (public holiday from 1975)")
  (:fixed "현충일" 6 6 :from 1956
   :authority "현충일 — Memorial Day")
  (:fixed "광복절" 8 15 :from 1949
   :authority "광복절 — Liberation Day")
  (:computed "추석"
   (lambda (y) (- (zhongqiu-date y :location +beijing+) 1))
   :from 1948 :authority "추석 연휴")
  (:computed "추석" (lambda (y) (zhongqiu-date y :location +beijing+))
   :from 1948 :authority "추석")
  (:computed "추석"
   (lambda (y) (+ (zhongqiu-date y :location +beijing+) 1))
   :from 1948 :authority "추석 연휴")
  (:fixed "개천절" 10 3 :from 1949
   :authority "개천절 — National Foundation Day")
  (:fixed "한글날" 10 9 :from 1949 :to 1990
   :authority "한글날 — was public holiday; reinstated 2013")
  (:fixed "한글날" 10 9 :from 2013
   :authority "한글날 — reinstated as public holiday 2013")
  (:fixed "성탄절" 12 25 :from 1949
   :authority "기독탄신일 — Christmas"))

;;; Myanmar (1948)
(define-calendar myanmar-holidays-calendar (:register "MM")
  (:fixed "Independence Day" 1 4 :from 1948
   :authority "Independence Day (4 January 1948)")
  (:fixed "Union Day" 2 12 :from 1948
   :authority "Union Day")
  (:fixed "Peasants' Day" 3 2 :from 1962
   :authority "Peasants' Day")
  (:fixed "Armed Forces Day" 3 27 :from 1948
   :authority "Tatmadaw Day / Armed Forces Day")
  (:fixed "Labour Day" 5 1 :from 1948
   :authority "May Day")
  (:fixed "Martyrs' Day" 7 19 :from 1948
   :authority "Martyrs' Day")
  (:fixed "National Day" 12 2 :from 1948
   :authority "National Day (approximate fixed; traditionally waxing moon Tazaungmon)")
  (:fixed "Christmas Day" 12 25 :from 1948
   :authority "Public holiday (Christmas)")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1948
   :authority "Islamic holiday (tabular)"))

;;; Malaysia (1957 / 1963)
(define-calendar malaysia-holidays-calendar (:register "MY")
  (:fixed "New Year's Day" 1 1 :from 1957
   :authority "Federal public holiday (most states)")
  (:computed "Chinese New Year"
   (lambda (y) (chinese-new-year-date y :location +beijing+))
   :from 1957 :authority "Federal holiday — CNY")
  (:computed "Chinese New Year"
   (lambda (y) (+ (chinese-new-year-date y :location +beijing+) 1))
   :from 1957 :authority "Federal holiday — CNY Day 2")
  (:fixed "Labour Day" 5 1 :from 1957 :authority "Federal holiday")
  (:fixed "National Day" 8 31 :from 1957
   :authority "Hari Kebangsaan — Independence 31 Aug 1957")
  (:fixed "Malaysia Day" 9 16 :from 2010
   :authority "Hari Malaysia — federal holiday from 2010 (formation 1963)")
  (:fixed "Christmas Day" 12 25 :from 1957 :authority "Federal holiday")
  (:computed "Hari Raya Puasa" #'eid-al-fitr :from 1957
   :authority "Federal holiday (tabular Hijri)")
  (:computed "Hari Raya Puasa"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 1))))
   :from 1957 :authority "Hari Raya Puasa Day 2")
  (:computed "Hari Raya Haji" #'eid-al-adha :from 1957
   :authority "Federal holiday (tabular Hijri)"))

;;; Taiwan (ROC post-1945) — national holidays under ROC calendar law
(define-calendar taiwan-holidays-calendar (:register "TW")
  (:fixed "中華民國開國紀念日" 1 1 :from 1945
   :authority "紀念日及節日實施辦法 — Founding Day / New Year")
  (:computed "農曆春節"
   (lambda (y) (chinese-new-year-eve-date y :location +beijing+))
   :from 1945 :authority "除夕")
  (:computed "農曆春節"
   (lambda (y) (chinese-new-year-date y :location +beijing+))
   :from 1945 :authority "春節")
  (:computed "農曆春節"
   (lambda (y) (+ (chinese-new-year-date y :location +beijing+) 1))
   :from 1945 :authority "春節")
  (:computed "農曆春節"
   (lambda (y) (+ (chinese-new-year-date y :location +beijing+) 2))
   :from 1945 :authority "春節")
  (:fixed "和平紀念日" 2 28 :from 1997
   :authority "二二八和平紀念日 — public holiday from 1997")
  (:computed "清明節" (lambda (y) (qingming-date y :location +beijing+))
   :from 1945 :authority "清明節")
  (:fixed "勞動節" 5 1 :from 1945 :authority "勞動節（勞工）")
  (:computed "端午節" (lambda (y) (duanwu-date y :location +beijing+))
   :from 1945 :authority "端午節")
  (:computed "中秋節" (lambda (y) (zhongqiu-date y :location +beijing+))
   :from 1945 :authority "中秋節")
  (:fixed "國慶日" 10 10 :from 1945
   :authority "國慶日 — Double Tenth"))

(defun indonesia-holidays-calendar () (make-instance 'indonesia-holidays-calendar))
(defun bangladesh-holidays-calendar () (make-instance 'bangladesh-holidays-calendar))
(defun philippines-holidays-calendar () (make-instance 'philippines-holidays-calendar))
(defun vietnam-holidays-calendar () (make-instance 'vietnam-holidays-calendar))
(defun thailand-holidays-calendar () (make-instance 'thailand-holidays-calendar))
(defun south-korea-holidays-calendar () (make-instance 'south-korea-holidays-calendar))
(defun myanmar-holidays-calendar () (make-instance 'myanmar-holidays-calendar))
(defun malaysia-holidays-calendar () (make-instance 'malaysia-holidays-calendar))
(defun taiwan-holidays-calendar () (make-instance 'taiwan-holidays-calendar))
