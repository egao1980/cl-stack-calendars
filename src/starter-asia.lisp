(in-package #:cl-stack-calendars)

;;;; Normative starters — Asia (population order), civil :FROM =
;;;; max(1900, formation) or later statute introduction.

;;; --- Indonesia cuti bersama (SKB 3 Menteri / Keppres) ---------------

(defun load-id-cuti-bersama (&optional (path (data-path "id/cuti-bersama.sexp")))
  "Return alist YEAR → (:authority A :transfers … :uri …)."
  (let ((form (read-data-form path)))
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
     form)))

(defvar *id-cuti-bersama* nil)

(defun id-cuti-bersama ()
  (or *id-cuti-bersama*
      (setf *id-cuti-bersama* (load-id-cuti-bersama))))

(defun id-notice-for-year (year)
  "Plist for the cuti bersama block keyed by YEAR, or NIL."
  (cdr (assoc year (id-cuti-bersama))))

(defun id-transfers-for-year (year)
  "Cuti bersama TO days whose date falls in YEAR."
  (transfers-touching-year (id-cuti-bersama) year))

;;; Indonesia (formation 1945)
(define-calendar indonesia-holidays-calendar (:register "ID" :constructor indonesia-holidays-calendar)
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
(define-calendar philippines-holidays-calendar (:register "PH" :constructor philippines-holidays-calendar)
  ;; EO 292 (Administrative Code of 1987) Book I, Chapter 7, Sec. 26 as
  ;; amended by RA 9177, 9256, 9492, 9849 and 10966. The yearly
  ;; proclamations (moves, special days, Eid dates) are in data/ph.
  ;; https://lawphil.net/statutes/repacts/ra2007/ra_9492_2007.html
  (:fixed "New Year's Day" 1 1 :from 1946 :authority "EO 292 Sec. 26 (1)(a) — regular holiday")
  (:fixed "EDSA People Power Revolution Anniversary" 2 25 :from 1986 :to 1999
   :authority "Special day by yearly proclamation; from 2000 in data/ph (absent 2001, 2007, 2024; a special working day from 2025)")
  (:easter "Maundy Thursday" -3 :from 1946 :authority "EO 292 Sec. 26 — regular holiday")
  (:easter "Good Friday" -2 :from 1946 :authority "EO 292 Sec. 26 — regular holiday")
  (:fixed "Araw ng Kagitingan" 4 9 :from 1946 :authority "EO 292 Sec. 26 — regular holiday (9 April)")
  (:fixed "Labor Day" 5 1 :from 1946 :authority "EO 292 Sec. 26 — regular holiday")
  (:fixed "Independence Day" 6 12 :from 1962
   :authority "Independence Day moved to 12 June (Diosdado Macapagal, 1962); was 4 July 1946–1961")
  (:fixed "Independence Day" 7 4 :from 1946 :to 1961
   :authority "Philippine Independence Day (4 July) until 1961")
  (:fixed "Ninoy Aquino Day" 8 21 :from 2004
   :authority "RA 9256 (2004) — Ninoy Aquino Day, 21 August, special non-working")
  (:nth-weekday "National Heroes Day" 8 :sunday -1 :from 1946 :to 2006
   :authority "EO 292 Sec. 26 — National Heroes Day, last Sunday of August")
  (:nth-weekday "National Heroes Day" 8 :monday -1 :from 2007
   :authority "RA 9492 (2007) — National Heroes Day, last Monday of August")
  (:fixed "All Saints' Day" 11 1 :from 1946 :authority "EO 292 Sec. 26 (2) — nationwide special day")
  (:fixed "Bonifacio Day" 11 30 :from 1946 :authority "EO 292 Sec. 26 — regular holiday")
  (:fixed "Feast of the Immaculate Conception" 12 8 :from 2018
   :authority "RA 10966 (2017) — 8 December, special non-working holiday")
  (:fixed "Christmas Day" 12 25 :from 1946 :authority "EO 292 Sec. 26 — regular holiday")
  (:fixed "Rizal Day" 12 30 :from 1946 :authority "EO 292 Sec. 26 — regular holiday")
  (:fixed "Last Day of the Year" 12 31 :from 1988 :authority "EO 292 Sec. 26 (2) — nationwide special day")
  (:computed "Eid'l Fitr (estimated)"
             (lambda (y) (when (ph-provisional-year-p y) (eid-al-fitr y)))
   :from 2002
   :authority "RA 9177 (2002) — Eid'l Fitr a regular holiday, its date proclaimed yearly (data/ph); tabular estimate in years with no proclamation")
  (:computed "Eid'l Adha (estimated)"
             (lambda (y) (when (ph-provisional-year-p y) (eid-al-adha y)))
   :from 2010
   :authority "RA 9849 (2009) — Eid'l Adha a regular holiday, its date proclaimed yearly (data/ph); tabular estimate in years with no proclamation"))

;;; Vietnam (1945)
(define-calendar vietnam-holidays-calendar (:register "VN")
  (:fixed "Tết Dương lịch" 1 1 :from 1945
   :authority "Ngày nghỉ lễ — New Year")
  (:computed "Giao thừa / Tết"
             (lambda (y) (chinese-new-year-eve-date y :zone +vietnam-lunisolar-zone+))
   :from 1945
   :authority "Giao thừa — ngày cuối năm Âm lịch (UTC+7 from 1968, Quyết định 121-CP)")
  (:computed "Tết Nguyên Đán"
             (lambda (y) (chinese-new-year-date y :zone +vietnam-lunisolar-zone+))
   :from 1945
   :authority "Tết — Âm lịch mùng 1 (UTC+7 from 1968, Quyết định 121-CP)")
  (:computed "Tết"
             (lambda (y) (+ (chinese-new-year-date y :zone +vietnam-lunisolar-zone+) 1))
   :from 1945 :authority "Tết mùng 2")
  (:computed "Tết"
             (lambda (y) (+ (chinese-new-year-date y :zone +vietnam-lunisolar-zone+) 2))
   :from 1945 :authority "Tết mùng 3")
  (:computed "Giỗ Tổ Hùng Vương"
             (lambda (y) (chinese-lunar-date y 3 10 :zone +vietnam-lunisolar-zone+))
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
(define-calendar thailand-holidays-calendar (:register "TH" :constructor thailand-holidays-calendar)
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

(defun load-kr-temporary-holidays (&optional (path (data-path "kr/temporary-holidays.sexp")))
  "Return alist YEAR → (:authority A :transfers … :uri …)."
  (let ((form (read-data-form path)))
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
     form)))

(defvar *kr-temporary-holidays* nil)

(defun kr-temporary-holidays ()
  (or *kr-temporary-holidays*
      (setf *kr-temporary-holidays* (load-kr-temporary-holidays))))

(defun kr-notice-for-year (year)
  "Plist for the 임시공휴일 block keyed by YEAR, or NIL."
  (cdr (assoc year (kr-temporary-holidays))))

(defun kr-transfers-for-year (year)
  "임시공휴일 TO days whose date falls in YEAR."
  (transfers-touching-year (kr-temporary-holidays) year))

;;; --- Philippines Malacañang proclamations (bridge / special days) -----

(defun load-ph-proclamations (&optional (path (data-path "ph/proclamations.sexp")))
  "Return alist YEAR → (:authority A :transfers … :suppressed … :uri …):
the proclaimed days the statutory rules do not give, and the statutory
dates the proclamations did not keep."
  (let ((form (read-data-form path)))
    (mapcar
     (lambda (block)
       (let* ((year (getf block :year))
              (auth (getf block :authority))
              (transfers (mapcar (lambda (e)
                                   (make-extra-day-transfer e auth))
                                 (getf block :holidays))))
         (cons year (list :authority auth
                          :transfers transfers
                          :suppressed (mapcar (lambda (d) (apply #'make-date d))
                                              (getf block :suppressed))
                          :uri (getf block :uri)))))
     form)))

(defvar *ph-proclamations* nil)

(defun ph-proclamations ()
  (or *ph-proclamations*
      (setf *ph-proclamations* (load-ph-proclamations))))

(defun ph-notice-for-year (year)
  (cdr (assoc year (ph-proclamations))))

(defun ph-transfers-for-year (year)
  (transfers-touching-year (ph-proclamations) year))

(defun ph-suppressed-for-year (&optional year)
  "Statutory dates the proclamations did not keep, in YEAR (or every year)."
  (loop for (nil . plist) in (ph-proclamations)
        append (remove-if-not (lambda (d) (or (null year) (= year (date-year d))))
                              (getf plist :suppressed))))

(defparameter *ph-last-eid-year* 2026
  "The latest year whose Eid'l Fitr and Eid'l Adha are proclaimed (data/ph).")

(defun ph-provisional-year-p (year)
  "True when YEAR has no Eid'l Fitr / Eid'l Adha proclamation yet: its Eid
days are tabular estimates and, after the last yearly proclamation (2027),
only the statutory days are in it."
  (> year *ph-last-eid-year*))

;;; --- Thailand Royal Gazette substitute / bridge days ------------------

(defun load-th-transfers (&optional (path (data-path "th/transfers.sexp")))
  (let ((form (read-data-form path)))
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
     form)))

(defvar *th-transfers* nil)

(defun th-transfers ()
  (or *th-transfers*
      (setf *th-transfers* (load-th-transfers))))

(defun th-notice-for-year (year)
  (cdr (assoc year (th-transfers))))

(defun th-transfers-for-year (year)
  (transfers-touching-year (th-transfers) year))

;;; --- Malaysia JPM / PMO additional public holidays --------------------

(defun load-my-transfers (&optional (path (data-path "my/transfers.sexp")))
  (let ((form (read-data-form path)))
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
     form)))

(defvar *my-transfers* nil)

(defun my-transfers ()
  (or *my-transfers*
      (setf *my-transfers* (load-my-transfers))))

(defun my-notice-for-year (year)
  (cdr (assoc year (my-transfers))))

(defun my-transfers-for-year (year)
  (transfers-touching-year (my-transfers) year))

;;; --- Gazette corpora (Dashain, Poya, Vesak/Deepavali, …) --------------

(defvar *np-gazette* nil)
(defvar *lk-poya* nil)
(defvar *sg-gazette* nil)

(defun np-gazette () (or *np-gazette* (setf *np-gazette* (load-gazette-corpus (data-path "np/gazette-holidays.sexp")))))
(defun lk-poya () (or *lk-poya* (setf *lk-poya* (load-gazette-corpus (data-path "lk/poya-days.sexp")))))
(defun sg-gazette () (or *sg-gazette* (setf *sg-gazette* (load-gazette-corpus (data-path "sg/gazette-holidays.sexp")))))

(defun np-gazette-for-year (year) (gazette-corpus-for-year (np-gazette) year))
(defun lk-poya-for-year (year) (gazette-corpus-for-year (lk-poya) year))
(defun sg-gazette-for-year (year) (gazette-corpus-for-year (sg-gazette) year))

(defun np-gazette-transfers-for-year (year)
  (gazette-transfers-for-year (np-gazette) year))

(defun lk-poya-transfers-for-year (year)
  (gazette-transfers-for-year (lk-poya) year))

(defun sg-gazette-transfers-for-year (year)
  (gazette-transfers-for-year (sg-gazette) year))

;;; --- South Korea: 대체공휴일 (규정 제3조) and 선거일 (공직선거법 제34조) ---

(defparameter *kr-holiday-kinds*
  '(("3·1절" . :national) ("광복절" . :national) ("개천절" . :national)
    ("한글날" . :national) ("제헌절" . :national)
    ("설날 전날" . :seol) ("설날" . :seol) ("설날 다음 날" . :seol)
    ("추석 전날" . :chuseok) ("추석" . :chuseok) ("추석 다음 날" . :chuseok)
    ("석가탄신일" . :buddha) ("부처님오신날" . :buddha) ("노동절" . :labor)
    ("어린이날" . :children) ("기독탄신일" . :xmas))
  "The 규정 제2조 item each holiday name stands for, as 제3조 refers to them:
:NATIONAL 제2호 (국경일), :SEOL 제4호, :BUDDHA 제5호 (제6호 before 2026),
:LABOR 제6호, :CHILDREN 제7호, :CHUSEOK 제9호, :XMAS 제10호. Any other name
(1월 1일, 현충일, 선거일) is a 공휴일 that has no 대체공휴일.")

(defun kr-substitute-kinds (date)
  "The kinds of 규정 제3조 in force on DATE, as four values: kinds that get a
대체공휴일 on a Saturday, on a Sunday, when two 공휴일 coincide on a weekday,
and whether a 대체공휴일 may fall on a Saturday.

- before 2013-11-05: no 대체공휴일.
- 대통령령 제24828호 (2013. 11. 5.): 설날·추석 when they coincide with another
  공휴일 (a Sunday is one); 어린이날 on a Saturday or another 공휴일.
- 대통령령 제31930호 (2021. 8. 4.): 국경일 and 어린이날 on a Saturday or
  Sunday; 설날·추석 on a Sunday; any of them on a weekday with another
  공휴일; a Saturday 대체공휴일 moves on (제3조 ③).
- 대통령령 제33448호 (2023. 5. 4.): adds 부처님오신날 and 기독탄신일.
- 대통령령 제36290호 (2026. 5. 1.): adds 노동절."
  (cond ((< date (make-date 2013 11 5)) (values '() '() '() t))
        ((< date (make-date 2021 8 4))
         (values '(:children) '(:seol :chuseok :children) '(:seol :chuseok :children) t))
        (t
         (let ((weekend (append '(:national :children)
                                (when (>= date (make-date 2023 5 4)) '(:buddha :xmas))
                                (when (>= date (make-date 2026 5 1)) '(:labor)))))
           (values weekend (append weekend '(:seol :chuseok))
                   (append weekend '(:seol :chuseok)) nil)))))

(defun kr-daeche-gonghyuil-pass (calendar year pairs)
  "관공서의 공휴일에 관한 규정 제3조: PAIRS (DATE . NAME) of YEAR with each
대체공휴일 added. A holiday of a kind KR-SUBSTITUTE-KINDS names that falls on a
Saturday or Sunday, or that coincides with another 공휴일 on a weekday (one
day for each coinciding holiday after the first: 2025-05-05 gives 05-06
only), gets the first 비공휴일 after it: a day that is no Sunday and no
공휴일 of 제2조 — a rule day, a 임시공휴일 of CALENDAR's transfers or a
대체공휴일 placed before it (제3조 ②) — and, from 2021-08-04, no Saturday
(제3조 ③). Substitutes are placed in date order."
  (let ((by-day (make-hash-table :test #'eql))
        (taken (make-hash-table :test #'eql))
        (extra '()))
    (dolist (pair pairs)
      (pushnew (cdr pair) (gethash (date-rd (car pair)) by-day) :test #'equal)
      (setf (gethash (date-rd (car pair)) taken) t))
    (dolist (tr (calendar-transfers calendar))
      (let ((to (calendar-transfer-to tr)))
        (when (and to (= (date-year to) year))
          (setf (gethash (date-rd to) taken) t))))
    (flet ((kind (name) (cdr (assoc name *kr-holiday-kinds* :test #'equal)))
           (free-p (d saturday-ok)
             (not (or (gethash (date-rd d) taken)
                      (= (date-day-of-week d) 7)
                      (and (= (date-day-of-week d) 6) (not saturday-ok))))))
      (dolist (rd (sort (loop for rd being the hash-keys of by-day collect rd) #'cl:<))
        (let* ((date (date-from-rd rd))
               (names (gethash rd by-day))
               (dow (date-day-of-week date)))
          (multiple-value-bind (saturday-kinds sunday-kinds overlap-kinds saturday-ok)
              (kr-substitute-kinds date)
            (let ((lost (cond ((= dow 6) (count-if (lambda (n) (member (kind n) saturday-kinds)) names))
                              ((= dow 7) (count-if (lambda (n) (member (kind n) sunday-kinds)) names))
                              ((and (>= (length names) 2)
                                    (some (lambda (n) (member (kind n) overlap-kinds)) names))
                               (1- (length names)))
                              (t 0))))
              (loop repeat lost
                    do (let ((d (+ date 1)))
                         (loop until (free-p d saturday-ok)
                               do (setf d (+ d 1)))
                         (setf (gethash (date-rd d) taken) t)
                         (push (cons d "대체공휴일") extra))))))))
    (append pairs (nreverse extra))))

(defparameter *kr-president-term-ends* '((2008 2 24) (2013 2 24) (2022 5 9))
  "임기만료일 of the presidential terms that ended at term (the 2017 and 2025
elections were 궐위선거 under 공직선거법 제35조, data/kr). From the 21st term
(2025-06-04) a term ends on 3 June every five years from 2030.")

(defvar *kr-election-base* nil
  "A KR calendar without election days, for the 공직선거법 제34조 ② check.")

(defvar *kr-in-election-check* nil)

(defun kr-election-days (year)
  "Term-expiry election days (공직선거법 제34조) whose date falls in YEAR: the
first Wednesday on or after the 임기만료일 less 70 days (대통령), 50 days
(국회의원, terms ending 29 May every four years from 2008) or 30 days (지방,
30 June every four years from 2010); a week later when that Wednesday or the
day before or after is a 공휴일 (②)."
  (unless *kr-in-election-check*
    (let* ((*kr-in-election-check* t)
           (base (or *kr-election-base*
                     (setf *kr-election-base*
                           (make-instance 'south-korea-holidays-calendar
                                          :transfers (all-block-transfers (kr-temporary-holidays))))))
           (starts '()))
      (dolist (end (append *kr-president-term-ends*
                           (loop for y from 2030 to (+ year 1) by 5 collect (list y 6 3))))
        (push (- (apply #'make-date end) 70) starts))
      (when (and (>= year 2008) (zerop (mod year 4)))
        (push (- (make-date year 5 29) 50) starts))
      (when (and (>= year 2010) (= 2 (mod year 4)))
        (push (- (make-date year 6 30) 30) starts))
      (loop for start in starts
            when (= (date-year start) year)
              collect (let ((d (+ start (mod (- 3 (date-day-of-week start)) 7))))
                        (if (or (holiday-p base d) (holiday-p base (- d 1)) (holiday-p base (+ d 1)))
                            (+ d 7)
                            d))))))

(defparameter *kr-last-almanac-year* 2027
  "The latest year with a published 월력요항 (우주항공청 공고 제2026-0078호, 관보
2026-06-29).")

(defun kr-provisional-year-p (year)
  "True when YEAR is after the last 월력요항: its days follow the 규정 and
공직선거법 제34조, but no 임시공휴일 can be known yet."
  (> year *kr-last-almanac-year*))

(define-calendar south-korea-holidays-calendar (:register "KR" :constructor south-korea-holidays-calendar
                                                :observance-pass kr-daeche-gonghyuil-pass)
  ;; 관공서의 공휴일에 관한 규정 제2조 of each era; 제3조 대체공휴일 in
  ;; KR-DAECHE-GONGHYUIL-PASS; 제11호 임시공휴일 (and the election days before
  ;; 제10의2호) in data/kr/temporary-holidays.sexp. Sundays are weekend days.
  ;; https://www.law.go.kr/법령/관공서의공휴일에관한규정
  (:fixed "1월 1일" 1 1 :from 1949 :authority "관공서의 공휴일에 관한 규정 제2조제3호 — 1월 1일")
  (:fixed "1월 2일" 1 2 :from 1949 :to 1998
   :authority "1월 1일~3일 (1949); 1월 2일 삭제, 대통령령 제15939호 (1999. 1. 1. 시행)")
  (:fixed "1월 3일" 1 3 :from 1949 :to 1990
   :authority "1월 3일 삭제, 대통령령 제13155호 (1991. 1. 1. 시행)")
  (:computed "민속의 날" (lambda (y) (chinese-new-year-date y :zone +korea-lunisolar-zone+))
   :from 1985 :to 1988 :authority "대통령령 제11615호 (1985. 1. 21.) — 민속의 날 (음력 1월 1일) 하루")
  (:computed "설날 전날" (lambda (y) (- (chinese-new-year-date y :zone +korea-lunisolar-zone+) 1))
   :from 1989 :authority "대통령령 제12616호 (1989. 2. 1.); 규정 제2조제4호 — 음력 12월 말일 (KASI)")
  (:computed "설날" (lambda (y) (chinese-new-year-date y :zone +korea-lunisolar-zone+))
   :from 1989 :authority "규정 제2조제4호 — 음력 1월 1일 (KASI)")
  (:computed "설날 다음 날" (lambda (y) (+ (chinese-new-year-date y :zone +korea-lunisolar-zone+) 1))
   :from 1989 :authority "규정 제2조제4호 — 음력 1월 2일 (KASI)")
  (:fixed "3·1절" 3 1 :from 1949 :authority "국경일에 관한 법률; 규정 제2조제2호")
  (:fixed "식목일" 4 5 :from 1949 :to 2005
   :authority "식목일 삭제, 대통령령 제18893호 (2005. 6. 30. 공포·시행)")
  (:fixed "노동절" 5 1 :from (2026 5 1)
   :authority "대통령령 제36290호 (2026. 4. 30.) 제2조제6호 — 노동절 (2026. 5. 1. 시행)")
  (:computed "석가탄신일" (lambda (y) (chinese-lunar-date y 4 8 :zone +korea-lunisolar-zone+))
   :from 1975 :to 2017 :authority "대통령령 제7538호 (1975. 1. 27.) — 석가탄신일 (음력 4월 8일)")
  (:computed "부처님오신날" (lambda (y) (chinese-lunar-date y 4 8 :zone +korea-lunisolar-zone+))
   :from 2018 :authority "대통령령 제28394호 (2017. 10. 17.) 제2조제6호 — 부처님오신날 (음력 4월 8일)")
  (:fixed "어린이날" 5 5 :from 1975 :authority "대통령령 제7538호 (1975. 1. 27.); 규정 제2조제7호")
  (:fixed "현충일" 6 6 :from 1956 :authority "대통령령 제1145호 (1956. 6. 6.); 규정 제2조제8호")
  (:fixed "제헌절" 7 17 :from 1949 :to 2007
   :authority "국경일에 관한 법률; 대통령령 제18893호 부칙 ② — 제헌절은 2007년 12월 31일까지 공휴일")
  (:fixed "제헌절" 7 17 :from (2026 5 11)
   :authority "대통령령 제36290호 제2조제2호 (「국경일에 관한 법률」에 따른 국경일), 2026. 5. 11. 시행")
  (:fixed "광복절" 8 15 :from 1949 :authority "국경일에 관한 법률; 규정 제2조제2호")
  (:computed "추석" (lambda (y) (zhongqiu-date y :zone +korea-lunisolar-zone+))
   :from 1949 :authority "규정 제2조제9호 — 음력 8월 15일 (KASI)")
  (:computed "추석 다음 날" (lambda (y) (+ (zhongqiu-date y :zone +korea-lunisolar-zone+) 1))
   :from 1986 :authority "대통령령 제11962호 (1986. 9. 11.); 규정 제2조제9호 — 음력 8월 16일")
  (:computed "추석 전날" (lambda (y) (- (zhongqiu-date y :zone +korea-lunisolar-zone+) 1))
   :from 1989 :authority "대통령령 제12616호 (1989. 2. 1.); 규정 제2조제9호 — 음력 8월 14일")
  (:fixed "국군의 날" 10 1 :from 1976 :to 1990
   :authority "대통령령 제8235호 (1976. 9. 3.); 삭제 대통령령 제13155호 (1991. 1. 1.)")
  (:fixed "개천절" 10 3 :from 1949 :authority "국경일에 관한 법률; 규정 제2조제2호")
  (:fixed "한글날" 10 9 :from 1949 :to 1990
   :authority "한글날 삭제, 대통령령 제13155호 (1991. 1. 1. 시행)")
  (:fixed "한글날" 10 9 :from 2013
   :authority "대통령령 제24273호 (2012. 12. 28.) — 국경일 중 한글날")
  (:fixed "기독탄신일" 12 25 :from 1949 :authority "규정 제2조제10호 — 기독탄신일 (12월 25일)")
  (:computed "선거일" #'kr-election-days :from (2006 9 6)
   :authority ("대통령령 제19674호 (2006. 9. 6.) 규정 제2조제10의2호 — 「공직선거법」 제34조에 따른 임기만료에 의한 선거의 선거일"
               "공직선거법 제34조 ① 대통령선거 임기만료일전 70일, 국회의원선거 50일, 지방선거 30일 이후 첫번째 수요일; ② 민속절·공휴일이거나 그 전일·다음날이 공휴일이면 그 다음주의 수요일")))

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
(define-calendar malaysia-holidays-calendar (:register "MY" :constructor malaysia-holidays-calendar)
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

;;; --- Taiwan: 調整放假 / 補行上班 and 補假 ----------------------------------

(defun load-tw-adjustments (&optional (path (data-path "tw/adjustments.sexp")))
  "Return alist YEAR → (:authority A :transfers … :working … :uri …)."
  (mapcar
   (lambda (block)
     (let ((auth (getf block :authority)))
       (cons (getf block :year)
             (list :authority auth
                   :transfers (mapcar (lambda (e) (make-extra-day-transfer e auth))
                                      (getf block :holidays))
                   :working (mapcar (lambda (d)
                                      (make-calendar-working-day :date (apply #'make-date d)
                                                                 :authority auth))
                                    (getf block :working))
                   :uri (getf block :uri)))))
   (read-data-form path)))

(defvar *tw-adjustments* nil)

(defun tw-adjustments ()
  (or *tw-adjustments* (setf *tw-adjustments* (load-tw-adjustments))))

(defun tw-transfers-for-year (year)
  "調整放假 days whose date falls in YEAR."
  (transfers-touching-year (tw-adjustments) year))

(defun tw-working-days-for-year (year)
  "補行上班 days that fall in YEAR."
  (loop for (nil . plist) in (tw-adjustments)
        append (remove-if-not (lambda (wd) (= year (date-year (calendar-working-day-date wd))))
                              (getf plist :working))))

(defparameter *tw-last-calendar-year* 2027
  "The latest year with a published DGPA 政府行政機關辦公日曆表 (116年, 2026-07).")

(defun tw-provisional-year-p (year)
  "True when YEAR is after the last DGPA calendar: its days follow the statute
and the 補假 rules, but no 調整放假 can be known yet."
  (> year *tw-last-calendar-year*))

(defparameter *tw-spring-names* '("小年夜" "農曆除夕" "春節")
  "The 春節 days: on a weekend, 補假 on the following workdays.")

(defun tw-bujia-pass (calendar year pairs)
  "補假 for the days off of YEAR in PAIRS (DATE . NAME):

- 除夕/春節 (and 小年夜 from 2026) on a Saturday or Sunday: one day each on
  the workdays after the last of them, from 2003 (週休二日實施辦法 第3條,
  2002-08-30 修正).
- Any other day off on a Saturday: the workday before; on a Sunday: the
  workday after, from 2015 (實施辦法 第5條之1; 條例 第8條). A 1 January on a
  Saturday gives 31 December of YEAR.
- 兒童節 on 民族掃墓節, from 2013 (實施辦法 第5條): the day before, or the day
  after when it is a Thursday; that day, if a weekend day, moves as above.

A workday is a Monday–Friday that is no day off and no 調整放假 of CALENDAR."
  (let ((taken (make-hash-table :test #'eql))
        (extra '()))
    (dolist (pair pairs)
      (setf (gethash (date-rd (car pair)) taken) t))
    (dolist (tr (calendar-transfers calendar))
      (let ((to (calendar-transfer-to tr)))
        (when to (setf (gethash (date-rd to) taken) t))))
    (labels ((weekend-p (d) (>= (date-day-of-week d) 6))
             (free-p (d) (not (or (weekend-p d) (gethash (date-rd d) taken))))
             (step-to (d by)
               (loop do (setf d (+ d by)) until (free-p d))
               d)
             (place (d name)
               (setf (gethash (date-rd d) taken) t)
               (push (cons d name) extra))
             (by-date (list)
               ;; Date order, ties by name, so the result is the same for any
               ;; rule order (兒童節 takes its day before 民族掃墓節 does).
               (sort (copy-list list)
                     (lambda (a b)
                       (or (cl:< (date-rd (car a)) (date-rd (car b)))
                           (and (= (date-rd (car a)) (date-rd (car b)))
                                (string< (princ-to-string (cdr a)) (princ-to-string (cdr b)))
                                t))))))
      (let ((qingming (car (find "民族掃墓節" pairs :key #'cdr :test #'equal)))
            (children (make-date year 4 4)))
        (dolist (pair (by-date pairs))
          (let ((d (car pair)) (name (cdr pair)))
            (unless (member name *tw-spring-names* :test #'equal)
              (block one
                (when (and (equal name "兒童節") (>= year 2013) qingming
                           (= (date-rd qingming) (date-rd children)))
                  (setf d (+ children (if (= 4 (date-day-of-week children)) 1 -1)))
                  (unless (weekend-p d)
                    (place d "兒童節 (與民族掃墓節同日)")
                    (return-from one)))
                (when (and (weekend-p d) (>= year 2015))
                  (place (step-to d (if (= 6 (date-day-of-week d)) -1 1))
                         (format nil "補假 (~a)" name)))))))
        (when (>= year 2003)
          (let* ((spring (by-date (remove-if-not (lambda (p) (member (cdr p) *tw-spring-names* :test #'equal))
                                                 pairs)))
                 (last (car (car (last spring)))))
            (dolist (pair spring)
              (when (weekend-p (car pair))
                (setf last (step-to last 1))
                (place last "補假 (春節)")))))
        (let ((new-year (make-date (1+ year) 1 1)))
          (when (and (>= (1+ year) 2015) (= 6 (date-day-of-week new-year)))
            (place (step-to new-year -1) "補假 (開國紀念日)")))))
    (append pairs (nreverse extra))))

;;; Taiwan (ROC post-1945) — national holidays under ROC calendar law
(define-calendar taiwan-holidays-calendar (:register "TW" :constructor taiwan-holidays-calendar
                                           :observance-pass tw-bujia-pass)
  ;; 行政機關放假日: 公務人員週休二日實施辦法 第3條 and 紀念日及節日實施辦法
  ;; (2001-2025), 紀念日及節日實施條例 第4條、第6條 (from 2025-05-28); 補假
  ;; in TW-BUJIA-PASS; 調整放假 / 補行上班 in data/tw/adjustments.sexp.
  ;; Lunar dates and 清明 at UTC+8. https://law.moj.gov.tw/LawClass/LawAll.aspx?pcode=D0020095
  (:fixed "開國紀念日" 1 1 :from 1945 :authority "週休二日實施辦法 第3條; 條例 第4條 — 開國紀念日 (1月1日)")
  (:computed "小年夜" (lambda (y) (- (chinese-new-year-eve-date y) 1)) :from 2026
   :authority "紀念日及節日實施條例 第6條 — 春節: 農曆除夕前一日至正月初三 (2025-05-28; 2023-2025 by yearly decision)")
  (:computed "農曆除夕" #'chinese-new-year-eve-date :from 1945 :authority "民俗節日 — 農曆除夕")
  (:computed "春節" #'chinese-new-year-date :from 1945 :authority "民俗節日 — 春節 (正月初一)")
  (:computed "春節" (lambda (y) (+ (chinese-new-year-date y) 1)) :from 1945 :authority "春節 (正月初二)")
  (:computed "春節" (lambda (y) (+ (chinese-new-year-date y) 2)) :from 1945 :authority "春節 (正月初三)")
  (:fixed "和平紀念日" 2 28 :from 1997 :authority "二二八和平紀念日 — 放假 from 1997")
  (:fixed "兒童節" 4 4 :from 2011
   :authority "紀念日及節日實施辦法 第5條 (2010-11-02 修正); 週休二日實施辦法 第3條 (2011-04-01) — 兒童節放假 from 2011")
  (:computed "民族掃墓節" #'qingming-date :from 1945 :authority "民俗節日 — 民族掃墓節 (清明, solar term)")
  (:fixed "勞動節" 5 1 :from 2026
   :authority "紀念日及節日實施條例 第6條 — 勞動節 (行政機關 from 2026; before, labourers only)")
  (:computed "端午節" #'duanwu-date :from 1945 :authority "民俗節日 — 端午節 (農曆五月五日)")
  (:computed "中秋節" #'zhongqiu-date :from 1945 :authority "民俗節日 — 中秋節 (農曆八月十五日)")
  (:fixed "孔子誕辰紀念日" 9 28 :from (2025 5 28)
   :authority "紀念日及節日實施條例 第4條 — 孔子誕辰紀念日 (9月28日), 2025-05-28 施行")
  (:fixed "國慶日" 10 10 :from 1945 :authority "國慶日 (10月10日)")
  (:fixed "臺灣光復暨金門古寧頭大捷紀念日" 10 25 :from (2025 5 28)
   :authority "紀念日及節日實施條例 第4條 — 10月25日, 2025-05-28 施行")
  (:fixed "國父誕辰紀念日" 11 12 :from 1945 :to 2000
   :authority "公務人員週休二日實施辦法 第3條 (2001-01-01): 國父誕辰紀念日 no longer a day off")
  (:fixed "行憲紀念日" 12 25 :from 1945 :to 2000
   :authority "公務人員週休二日實施辦法 第3條 (2001-01-01): 行憲紀念日 no longer a day off")
  (:fixed "行憲紀念日" 12 25 :from (2025 5 28)
   :authority "紀念日及節日實施條例 第4條 — 行憲紀念日 (12月25日), 2025-05-28 施行"))

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
  "Indonesian national holidays with the cuti bersama days of
data/id/cuti-bersama.sexp. Without YEAR, every year in the file applies (the
registered \"ID\" calendar); with YEAR, only that year's days."
  (let ((tr (or transfers
                (if year
                    (id-transfers-for-year year)
                    (all-block-transfers (id-cuti-bersama))))))
    (make-instance 'indonesia-holidays-calendar :transfers tr)))

(defun bangladesh-holidays-calendar () (make-instance 'bangladesh-holidays-calendar))

(defun philippines-holidays-calendar (&key year transfers suppressed-dates)
  "Philippine regular holidays and nationwide special (non-working) days: the
statutory days, changed by the proclamations of data/ph/proclamations.sexp
(days added, statutory dates moved or not kept). Without YEAR, every year in
the file applies (the registered \"PH\" calendar); with YEAR, only that
year's. Special working days are not holidays. PH-PROVISIONAL-YEAR-P years
have estimated Eid days."
  (make-instance 'philippines-holidays-calendar
                 :transfers (or transfers
                                (if year
                                    (ph-transfers-for-year year)
                                    (all-block-transfers (ph-proclamations))))
                 :suppressed-dates (or suppressed-dates (ph-suppressed-for-year year))))

(defun vietnam-holidays-calendar () (make-instance 'vietnam-holidays-calendar))

(defun thailand-holidays-calendar (&key year transfers)
  "Thai public holidays with the Royal Gazette substitute/bridge days of
data/th/transfers.sexp. Without YEAR, every year in the file applies (the
registered \"TH\" calendar); with YEAR, only that year's days."
  (let ((tr (or transfers
                (if year
                    (th-transfers-for-year year)
                    (all-block-transfers (th-transfers))))))
    (make-instance 'thailand-holidays-calendar :transfers tr)))

(defun south-korea-holidays-calendar (&key year transfers)
  "ROK 관공서의 공휴일 (관공서의 공휴일에 관한 규정 of each era, its 제3조
대체공휴일 and the 공직선거법 제34조 election days) with the 임시공휴일 of
data/kr/temporary-holidays.sexp. Without YEAR, every year in the file applies
(the registered \"KR\" calendar); with YEAR, only that year's days. Years
after the last 월력요항 are provisional (KR-PROVISIONAL-YEAR-P)."
  (let ((tr (or transfers
                (if year
                    (kr-transfers-for-year year)
                    (all-block-transfers (kr-temporary-holidays))))))
    (make-instance 'south-korea-holidays-calendar :transfers tr)))

(defun myanmar-holidays-calendar () (make-instance 'myanmar-holidays-calendar))

(defun malaysia-holidays-calendar (&key year transfers)
  "Malaysian federal holidays with the JPM/PMO additional days of
data/my/transfers.sexp. Without YEAR, every year in the file applies (the
registered \"MY\" calendar); with YEAR, only that year's days."
  (let ((tr (or transfers
                (if year
                    (my-transfers-for-year year)
                    (all-block-transfers (my-transfers))))))
    (make-instance 'malaysia-holidays-calendar :transfers tr)))
(defun taiwan-holidays-calendar (&key year transfers working-days)
  "ROC government-office days off (行政機關放假日) with the 調整放假 and
補行上班 of data/tw/adjustments.sexp. Without YEAR, every year in the file
applies (the registered \"TW\" calendar); with YEAR, only that year's days.
Years after the last DGPA calendar are provisional (TW-PROVISIONAL-YEAR-P)."
  (make-instance 'taiwan-holidays-calendar
                 :transfers (or transfers
                                (if year
                                    (tw-transfers-for-year year)
                                    (all-block-transfers (tw-adjustments))))
                 :working-days (or working-days
                                   (if year
                                       (tw-working-days-for-year year)
                                       (loop for (nil . plist) in (tw-adjustments)
                                             append (getf plist :working))))))
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

(define-calendar nepal-holidays-calendar (:register "NP" :constructor nepal-holidays-calendar)
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

(define-calendar sri-lanka-holidays-calendar (:register "LK" :constructor sri-lanka-holidays-calendar)
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
  "Nepal public holidays with the MoHA gazetted Dashain/Tihar blocks of
data/np/gazette-holidays.sexp. Without YEAR, every year in the file applies
(the registered \"NP\" calendar); with YEAR, only that year's days."
  (let ((tr (or transfers
                (if year
                    (np-gazette-transfers-for-year year)
                    (all-block-transfers (np-gazette))))))
    (make-instance 'nepal-holidays-calendar :transfers tr)))

(defun sri-lanka-holidays-calendar (&key year transfers)
  "Sri Lanka public holidays. With YEAR, attaches that year's days from
data/lk/poya-days.sexp. Without YEAR (the registered \"LK\" calendar) the file
is not applied: its Poya dates are new-moon dates, not the full-moon Poya days
the gazettes appoint (2024 Vesak is listed as 1 May; it was 23 May), so all
years of it would make the calendar worse (#61)."
  (let ((tr (or transfers
                (when year (lk-poya-transfers-for-year year)))))
    (make-instance 'sri-lanka-holidays-calendar :transfers tr)))

(defun kazakhstan-holidays-calendar () (make-instance 'kazakhstan-holidays-calendar))
