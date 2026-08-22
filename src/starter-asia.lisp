(in-package #:cl-stack-calendars)

;;;; Normative starters — Asia (population order), civil :FROM =
;;;; max(1900, formation) or later statute introduction.

;;; --- Indonesia cuti bersama (SKB 3 Menteri / Keppres) ---------------

(defparameter *id-cuti-bersama-path*
  (merge-pathnames "data/id/cuti-bersama.sexp"
                   (asdf:system-source-directory "cl-stack-calendars"))
  "Sexp index of verified cuti bersama years (2002–2026).")

(defun load-id-cuti-bersama (&optional (path *id-cuti-bersama-path*))
  "Return alist YEAR → (:authority A :transfers … :uri …)."
  (with-open-file (in path)
    (let ((form (read in)))
      (mapcar
       (lambda (block)
         (let* ((year (getf block :year))
                (auth (getf block :authority))
                (transfers (mapcar (lambda (e)
                                     (make-extra-day-transfer e auth))
                                   (getf block :holidays))))
           (cons year (list :authority auth
                            :transfers transfers
                            :uri (getf block :uri)))))
       form))))

(defvar *id-cuti-bersama* nil)

(defun id-cuti-bersama ()
  (or *id-cuti-bersama*
      (setf *id-cuti-bersama* (load-id-cuti-bersama))))

(defun id-notice-for-year (year)
  "Plist for the cuti bersama block keyed by YEAR, or NIL."
  (cdr (assoc year (id-cuti-bersama))))

(defun id-transfers-for-year (year)
  "Cuti bersama TO days whose date falls in YEAR."
  (loop for (_y . plist) in (id-cuti-bersama)
        nconc (remove-if-not (lambda (tr) (%transfer-touches-year-p tr year))
                             (getf plist :transfers))))

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
  (:computed "Eid ul-Fitr"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 2))))
   :from 1972 :authority "Eid ul-Fitr (3rd day)")
  (:computed "Eid ul-Adha" #'eid-al-adha :from 1972
   :authority "Islamic foundation holidays (tabular Hijri)")
  (:computed "Eid ul-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 1))))
   :from 1972 :authority "Eid ul-Adha (2nd day)")
  (:computed "Eid ul-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 2))))
   :from 1972 :authority "Eid ul-Adha (3rd day)")
  (:computed "Ashura"
   (lambda (y) (islamic-date-in-gregorian-year y 1 10))
   :from 1972 :authority "10 Muharram (tabular)")
  (:computed "Eid-e-Milad-un-Nabi" #'mawlid-date :from 1972
   :authority "Prophet's birthday (tabular)"))

;;; Philippines (1946)
(define-calendar philippines-holidays-calendar (:register "PH")
  (:fixed "New Year's Day" 1 1 :from 1946
   :authority "Republic Act / Proclamation — regular holiday")
  (:fixed "EDSA People Power Revolution Anniversary" 2 25 :from 1986
   :authority "Special non-working holiday — EDSA 1986")
  (:computed "Chinese New Year"
   (lambda (y) (chinese-new-year-date y :location +beijing+))
   :from 2012
   :authority "Special non-working day by proclamation (often; Beijing tabular CNY)")
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
  (:fixed "Ninoy Aquino Day" 8 21 :from 2004
   :authority "RA 9256 — Ninoy Aquino Day (special non-working)")
  (:nth-weekday "National Heroes Day" 8 :monday -1 :from 2007
   :authority "RA 9492 — National Heroes Day last Monday of August")
  (:fixed "All Saints' Day" 11 1 :from 1946
   :authority "Special non-working holiday")
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
  (:computed "Giao thừa / Tết"
   (lambda (y) (chinese-new-year-eve-date y :location +beijing+))
   :from 1945
   :authority "Giao thừa — ngày cuối năm Âm lịch (Beijing tabular; VN may ±0–1)")
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
  (:computed "Giỗ Tổ Hùng Vương"
   (lambda (y) (chinese-lunar-date y 3 10 :location +beijing+))
   :from 2007
   :authority "Bộ luật Lao động 2007 — Giỗ Tổ Hùng Vương (âm lịch 10/3)")
  (:fixed "Ngày thống nhất đất nước" 4 30 :from 1976
   :authority "Liberation / Reunification Day")
  (:fixed "Ngày Quốc tế Lao động" 5 1 :from 1945
   :authority "International Labour Day")
  (:fixed "Quốc khánh" 9 2 :from 1945
   :authority "National Day — Declaration of Independence 2 Sep 1945")
  (:fixed "Quốc khánh" 9 3 :from 2021
   :authority "Bộ luật Lao động — Quốc khánh nghỉ 2 ngày (2–3/9) từ 2021")
  (:fixed "Ngày Văn hóa" 11 24 :from 2026
   :authority "Ngày Văn hóa các dân tộc Việt Nam — nghỉ lễ từ 2026"))

;;; Thailand (floor 1900)
(define-calendar thailand-holidays-calendar (:register "TH")
  (:fixed "New Year's Day" 1 1 :from 1900
   :authority "Public holiday (Gregorian New Year)")
  (:computed "Makha Bucha"
   (lambda (y) (chinese-lunar-date y 3 15 :location +beijing+))
   :from 1900
   :authority "Makha Bucha — lunar 3/15 (Beijing tabular ≈ Thai lunar)")
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
  (:computed "Visakha Bucha"
   (lambda (y) (chinese-lunar-date y 6 15 :location +beijing+))
   :from 1900
   :authority "Visakha Bucha — lunar 6/15 (Beijing tabular ≈ Thai lunar)")
  (:fixed "Queen Suthida's Birthday" 6 3 :from 2019
   :authority "Public holiday (Queen's birthday)")
  (:fixed "Birthday of King Rama X" 7 28 :from 2017
   :authority "Public holiday (King's birthday)")
  (:computed "Asalha Bucha"
   (lambda (y) (chinese-lunar-date y 8 15 :location +beijing+))
   :from 1900
   :authority "Asalha Bucha — lunar 8/15 (Beijing tabular ≈ Thai lunar)")
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

;;; --- Korea 임시공휴일 (관공서의 공휴일에 관한 규정) -----------------

(defparameter *kr-temporary-holidays-path*
  (merge-pathnames "data/kr/temporary-holidays.sexp"
                   (asdf:system-source-directory "cl-stack-calendars"))
  "Sexp index of national 임시공휴일 designations.")

(defun load-kr-temporary-holidays (&optional (path *kr-temporary-holidays-path*))
  "Return alist YEAR → (:authority A :transfers … :uri …)."
  (with-open-file (in path)
    (let ((form (read in)))
      (mapcar
       (lambda (block)
         (let* ((year (getf block :year))
                (auth (getf block :authority))
                (transfers (mapcar (lambda (e)
                                     (make-extra-day-transfer e auth))
                                   (getf block :holidays))))
           (cons year (list :authority auth
                            :transfers transfers
                            :uri (getf block :uri)))))
       form))))

(defvar *kr-temporary-holidays* nil)

(defun kr-temporary-holidays ()
  (or *kr-temporary-holidays*
      (setf *kr-temporary-holidays* (load-kr-temporary-holidays))))

(defun kr-notice-for-year (year)
  "Plist for the 임시공휴일 block keyed by YEAR, or NIL."
  (cdr (assoc year (kr-temporary-holidays))))

(defun kr-transfers-for-year (year)
  "임시공휴일 TO days whose date falls in YEAR."
  (loop for (_y . plist) in (kr-temporary-holidays)
        nconc (remove-if-not (lambda (tr) (%transfer-touches-year-p tr year))
                             (getf plist :transfers))))

;;; --- Philippines Malacañang proclamations (bridge / special days) -----

(defparameter *ph-proclamations-path*
  (merge-pathnames "data/ph/proclamations.sexp"
                   (asdf:system-source-directory "cl-stack-calendars")))

(defun load-ph-proclamations (&optional (path *ph-proclamations-path*))
  (with-open-file (in path)
    (let ((form (read in)))
      (mapcar
       (lambda (block)
         (let* ((year (getf block :year))
                (auth (getf block :authority))
                (transfers (mapcar (lambda (e)
                                     (make-extra-day-transfer e auth))
                                   (getf block :holidays))))
           (cons year (list :authority auth
                            :transfers transfers
                            :uri (getf block :uri)))))
       form))))

(defvar *ph-proclamations* nil)

(defun ph-proclamations ()
  (or *ph-proclamations*
      (setf *ph-proclamations* (load-ph-proclamations))))

(defun ph-notice-for-year (year)
  (cdr (assoc year (ph-proclamations))))

(defun ph-transfers-for-year (year)
  (loop for (_y . plist) in (ph-proclamations)
        nconc (remove-if-not (lambda (tr) (%transfer-touches-year-p tr year))
                             (getf plist :transfers))))

;;; --- Thailand Royal Gazette substitute / bridge days ------------------

(defparameter *th-transfers-path*
  (merge-pathnames "data/th/transfers.sexp"
                   (asdf:system-source-directory "cl-stack-calendars")))

(defun load-th-transfers (&optional (path *th-transfers-path*))
  (with-open-file (in path)
    (let ((form (read in)))
      (mapcar
       (lambda (block)
         (let* ((year (getf block :year))
                (auth (getf block :authority))
                (transfers (mapcar (lambda (e)
                                     (make-extra-day-transfer e auth))
                                   (getf block :holidays))))
           (cons year (list :authority auth
                            :transfers transfers
                            :uri (getf block :uri)))))
       form))))

(defvar *th-transfers* nil)

(defun th-transfers ()
  (or *th-transfers*
      (setf *th-transfers* (load-th-transfers))))

(defun th-notice-for-year (year)
  (cdr (assoc year (th-transfers))))

(defun th-transfers-for-year (year)
  (loop for (_y . plist) in (th-transfers)
        nconc (remove-if-not (lambda (tr) (%transfer-touches-year-p tr year))
                             (getf plist :transfers))))

;;; --- Malaysia JPM / PMO additional public holidays --------------------

(defparameter *my-transfers-path*
  (merge-pathnames "data/my/transfers.sexp"
                   (asdf:system-source-directory "cl-stack-calendars")))

(defun load-my-transfers (&optional (path *my-transfers-path*))
  (with-open-file (in path)
    (let ((form (read in)))
      (mapcar
       (lambda (block)
         (let* ((year (getf block :year))
                (auth (getf block :authority))
                (transfers (mapcar (lambda (e)
                                     (make-extra-day-transfer e auth))
                                   (getf block :holidays))))
           (cons year (list :authority auth
                            :transfers transfers
                            :uri (getf block :uri)))))
       form))))

(defvar *my-transfers* nil)

(defun my-transfers ()
  (or *my-transfers*
      (setf *my-transfers* (load-my-transfers))))

(defun my-notice-for-year (year)
  (cdr (assoc year (my-transfers))))

(defun my-transfers-for-year (year)
  (loop for (_y . plist) in (my-transfers)
        nconc (remove-if-not (lambda (tr) (%transfer-touches-year-p tr year))
                             (getf plist :transfers))))

;;; --- Gazette corpora (Dashain, Poya, Vesak/Deepavali, …) --------------

(defparameter *np-gazette-path*
  (merge-pathnames "data/np/gazette-holidays.sexp"
                   (asdf:system-source-directory "cl-stack-calendars")))

(defparameter *lk-poya-path*
  (merge-pathnames "data/lk/poya-days.sexp"
                   (asdf:system-source-directory "cl-stack-calendars")))

(defparameter *sg-gazette-path*
  (merge-pathnames "data/sg/gazette-holidays.sexp"
                   (asdf:system-source-directory "cl-stack-calendars")))

(defvar *np-gazette* nil)
(defvar *lk-poya* nil)
(defvar *sg-gazette* nil)

(defun np-gazette () (or *np-gazette* (setf *np-gazette* (load-gazette-corpus *np-gazette-path*))))
(defun lk-poya () (or *lk-poya* (setf *lk-poya* (load-gazette-corpus *lk-poya-path*))))
(defun sg-gazette () (or *sg-gazette* (setf *sg-gazette* (load-gazette-corpus *sg-gazette-path*))))

(defun np-gazette-for-year (year) (gazette-corpus-for-year (np-gazette) year))
(defun lk-poya-for-year (year) (gazette-corpus-for-year (lk-poya) year))
(defun sg-gazette-for-year (year) (gazette-corpus-for-year (sg-gazette) year))

(defun np-gazette-transfers-for-year (year)
  (gazette-transfers-for-year (np-gazette) year))

(defun lk-poya-transfers-for-year (year)
  (gazette-transfers-for-year (lk-poya) year))

(defun sg-gazette-transfers-for-year (year)
  (gazette-transfers-for-year (sg-gazette) year))

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
  ;; Thingyan / Myanmar New Year — civil Gregorian band commonly gazetted.
  (:fixed "Thingyan" 4 13 :from 1948 :authority "Thingyan water festival")
  (:fixed "Thingyan" 4 14 :from 1948 :authority "Thingyan")
  (:fixed "Thingyan" 4 15 :from 1948 :authority "Thingyan")
  (:fixed "Thingyan" 4 16 :from 1948 :authority "Thingyan")
  (:fixed "Myanmar New Year" 4 17 :from 1948
   :authority "Myanmar New Year Day (after Thingyan)")
  (:fixed "Labour Day" 5 1 :from 1948
   :authority "May Day")
  (:fixed "Martyrs' Day" 7 19 :from 1948
   :authority "Martyrs' Day")
  (:fixed "National Day" 12 2 :from 1948
   :authority "National Day (approximate fixed; traditionally waxing moon Tazaungmon)")
  (:fixed "Christmas Day" 12 25 :from 1948
   :authority "Public holiday (Christmas)")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1948
   :authority "Islamic holiday (tabular)")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1948
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
   :authority "Federal holiday (tabular Hijri)")
  (:computed "Hari Raya Haji"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 1))))
   :from 1957 :authority "Hari Raya Haji Day 2")
  (:computed "Wesak Day"
   (lambda (y) (chinese-lunar-date y 4 15 :location +beijing+))
   :from 1962
   :authority "Federal holiday — Vesak (Beijing tabular ≈ MY gazette)")
  (:computed "Deepavali"
   (lambda (y) (chinese-lunar-date y 8 1 :location +beijing+))
   :from 1972
   :authority "Federal holiday — Deepavali (Beijing tabular ≈ gazette)"))

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
  (:fixed "行憲紀念日" 12 25 :from 1945 :to 2000
   :authority "Constitution Day on 25 Dec until abolished as holiday 2001")
  (:computed "清明節" (lambda (y) (qingming-date y :location +beijing+))
   :from 1945 :authority "清明節")
  (:fixed "勞動節" 5 1 :from 1945 :authority "勞動節（勞工）")
  (:computed "端午節" (lambda (y) (duanwu-date y :location +beijing+))
   :from 1945 :authority "端午節")
  (:computed "中秋節" (lambda (y) (zhongqiu-date y :location +beijing+))
   :from 1945 :authority "中秋節")
  (:fixed "國慶日" 10 10 :from 1945
   :authority "國慶日 — Double Tenth"))

;;; Uzbekistan (independence 1991)
(define-calendar uzbekistan-holidays-calendar (:register "UZ")
  (:fixed "Yangi Yil" 1 1 :from 1991
   :authority "Yangi Yil Bayrami — New Year")
  (:fixed "Vatan himoyachilari kuni" 1 14 :from 1992
   :authority "Defender of the Fatherland Day")
  (:fixed "Xalqaro Xotin-Qizlar Kuni" 3 8 :from 1991
   :authority "International Women's Day")
  (:fixed "Navro'z" 3 21 :from 1991
   :authority "Navro'z Bayrami")
  (:fixed "Xotira va Qadirlash Kuni" 5 9 :from 1999
   :authority "Day of Remembrance and Honor (9 May)")
  (:fixed "Mustaqillik Kuni" 9 1 :from 1991
   :authority "Independence Day — 1 September 1991")
  (:fixed "O'qituvchi va Murabbiylar Kuni" 10 1 :from 1997
   :authority "Teachers' and Mentors' Day")
  (:fixed "Konstitutsiya Kuni" 12 8 :from 1992
   :authority "Constitution Day")
  (:computed "Ramazon Hayit" #'eid-al-fitr :from 1991
   :authority "Eid al-Fitr (tabular Hijri)")
  (:computed "Qurbon Hayit" #'eid-al-adha :from 1991
   :authority "Eid al-Adha (tabular Hijri)"))

(defun indonesia-holidays-calendar (&key year transfers)
  "Indonesian national holidays. YEAR attaches cuti bersama TO days for that year."
  (let ((tr (or transfers (when year (id-transfers-for-year year)))))
    (make-instance 'indonesia-holidays-calendar :transfers tr)))

(defun bangladesh-holidays-calendar () (make-instance 'bangladesh-holidays-calendar))

(defun philippines-holidays-calendar (&key year transfers)
  "Philippine holidays. YEAR attaches Malacañang proclamation bridge days."
  (let ((tr (or transfers (when year (ph-transfers-for-year year)))))
    (make-instance 'philippines-holidays-calendar :transfers tr)))

(defun vietnam-holidays-calendar () (make-instance 'vietnam-holidays-calendar))

(defun thailand-holidays-calendar (&key year transfers)
  "Thai public holidays. YEAR attaches Royal Gazette substitute/bridge days."
  (let ((tr (or transfers (when year (th-transfers-for-year year)))))
    (make-instance 'thailand-holidays-calendar :transfers tr)))

(defun south-korea-holidays-calendar (&key year transfers)
  "ROK public holidays. YEAR attaches national 임시공휴일 for that year."
  (let ((tr (or transfers (when year (kr-transfers-for-year year)))))
    (make-instance 'south-korea-holidays-calendar :transfers tr)))

(defun myanmar-holidays-calendar () (make-instance 'myanmar-holidays-calendar))

(defun malaysia-holidays-calendar (&key year transfers)
  "Malaysian federal holidays. YEAR attaches JPM/PMO additional days."
  (let ((tr (or transfers (when year (my-transfers-for-year year)))))
    (make-instance 'malaysia-holidays-calendar :transfers tr)))
(defun taiwan-holidays-calendar () (make-instance 'taiwan-holidays-calendar))
(defun uzbekistan-holidays-calendar () (make-instance 'uzbekistan-holidays-calendar))

;;; --- Korea / South Asia / Central Asia (≥20M) -------------------------

(define-calendar north-korea-holidays-calendar (:register "KP")
  (:fixed "New Year's Day" 1 1 :from 1948 :authority "공휴일")
  (:fixed "Day of the Shining Star" 2 16 :from 1982
   :authority "Kim Jong-il birthday — public holiday from 1982")
  (:fixed "Day of the Sun" 4 15 :from 1968
   :authority "Kim Il-sung birthday — public holiday")
  (:fixed "May Day" 5 1 :from 1948 :authority "공휴일")
  (:fixed "Victory Day" 7 27 :from 1953
   :authority "Korean War armistice — 27 July")
  (:fixed "Liberation Day" 8 15 :from 1948
   :authority "Liberation from Japanese rule — 15 August")
  (:fixed "Day of the Foundation of the Republic" 9 9 :from 1948
   :authority "DPRK foundation — 9 September 1948")
  (:fixed "Party Foundation Day" 10 10 :from 1949 :authority "공휴일")
  (:fixed "Constitution Day" 12 27 :from 1972
   :authority "Socialist Constitution promulgated 1972"))

(define-calendar nepal-holidays-calendar (:register "NP")
  (:fixed "New Year's Day" 1 1 :from 1900 :authority "Public holiday")
  (:fixed "Prithvi Jayanti" 1 11 :from 1900 :to 2007
   :authority "King Prithvi Narayan Shah birthday — abolished 2008")
  (:fixed "Martyrs' Day" 1 30 :from 1900 :authority "Public holiday")
  (:fixed "International Women's Day" 3 8 :from 1900 :authority "Public holiday")
  (:fixed "Labour Day" 5 1 :from 1900 :authority "Public holiday")
  (:fixed "Republic Day" 5 28 :from 2008
   :authority "Federal Democratic Republic — 28 May 2008")
  (:fixed "Democracy Day" 2 19 :from 1951
   :authority "Democracy Day — Falgun 7 / 19 February civil date")
  (:fixed "Constitution Day" 9 20 :from 2015
   :authority "Constitution promulgated 20 September 2015")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1900 :authority "Public holiday (tabular)")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1900 :authority "Public holiday (tabular)"))

(define-calendar sri-lanka-holidays-calendar (:register "LK")
  (:fixed "New Year's Day" 1 1 :from 1948 :authority "Public holiday")
  (:fixed "Tamil Thai Pongal Day" 1 15 :from 1948 :authority "Public holiday")
  (:fixed "National Day" 2 4 :from 1948
   :authority "Independence 4 February 1948")
  (:fixed "Labour Day" 5 1 :from 1948 :authority "Public holiday")
  (:fixed "Sinhala and Tamil New Year Eve" 4 13 :from 1948 :authority "Public holiday")
  (:fixed "Sinhala and Tamil New Year" 4 14 :from 1948 :authority "Public holiday")
  (:easter "Good Friday" -2 :from 1948 :authority "Public holiday")
  (:fixed "Christmas Day" 12 25 :from 1948 :authority "Public holiday")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1948 :authority "Public holiday (tabular)")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1948 :authority "Public holiday (tabular)")
  (:computed "Milad-un-Nabi" #'mawlid-date :from 1948 :authority "Public holiday (tabular)"))

(define-calendar kazakhstan-holidays-calendar (:register "KZ")
  (:fixed "Жаңа жыл" 1 1 :from 1991 :authority "Мемлекеттік мереке")
  (:fixed "Жаңа жыл" 1 2 :from 2006
   :authority "Жаңа жыл — 2 күн (2006 ж. реформа)")
  (:fixed "Рождество Христово" 1 7 :from 2007
   :authority "Рождество — мереке 7 қаңтар (2007)")
  (:fixed "Халықаралық әйелдер күні" 3 8 :from 1991 :authority "Мереке")
  (:fixed "Наурыз мейрамы" 3 21 :from 1991 :authority "Наурыз")
  (:fixed "Наурыз мейрамы" 3 22 :from 1991 :authority "Наурыз")
  (:fixed "Наурыз мейрамы" 3 23 :from 1991 :authority "Наурыз")
  (:fixed "Қазақстан халқының бірлігі күні" 5 1 :from 1995
   :authority "1 мамыр — Бірлік күні (1995)")
  (:fixed "Жеңіс күні" 5 9 :from 1991 :authority "Мереке")
  (:fixed "Астана күні" 7 6 :from 1997
   :authority "Астана — 6 шілде (1997)")
  (:fixed "Конституция күні" 8 30 :from 1995 :authority "Мереке")
  (:fixed "Республика күні" 10 25 :from 1995
   :authority "Республика күні — 25 қазан (1995)")
  (:fixed "Тәуелсіздік күні" 12 16 :from 1991
   :authority "Тәуелсіздік — 16 желтоқсан 1991")
  (:computed "Ораза айт" #'eid-al-fitr :from 1991 :authority "Дini мереке (tabular)")
  (:computed "Құрban айт" #'eid-al-adha :from 1991 :authority "Дini мереке (tabular)"))

(defun north-korea-holidays-calendar () (make-instance 'north-korea-holidays-calendar))

(defun nepal-holidays-calendar (&key year transfers)
  "Nepal public holidays. YEAR attaches MoHA gazetted Dashain/Tihar block."
  (let ((tr (or transfers (when year (np-gazette-transfers-for-year year)))))
    (make-instance 'nepal-holidays-calendar :transfers tr)))

(defun sri-lanka-holidays-calendar (&key year transfers)
  "Sri Lanka public holidays. YEAR attaches gazetted Poya/Vesak/Deepavali set."
  (let ((tr (or transfers (when year (lk-poya-transfers-for-year year)))))
    (make-instance 'sri-lanka-holidays-calendar :transfers tr)))

(defun kazakhstan-holidays-calendar () (make-instance 'kazakhstan-holidays-calendar))
