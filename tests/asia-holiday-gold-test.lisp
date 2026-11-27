(in-package #:cl-stack-calendars/tests)

;;;; East and Southeast Asia national holidays vs frozen gold,
;;;; data/tests/<cc>-holiday-gold.sexp (scripts/generate_asia_holiday_gold.py;
;;;; egao1980/cl-stack-calendars#39, #40, #41, #26). Same day-by-day check as
;;;; americas-holiday-gold-test.lisp.

;;; --- South Korea (#39) -----------------------------------------------------

(defparameter *kr-holiday-gold* (load-holiday-gold "KR"))

(deftest kr-holiday-gold-fixture-shape
  (%check-holiday-gold-shape *kr-holiday-gold* "KR"))

(deftest kr-registered-calendar-matches-gold
  "find-calendar \"KR\" agrees with the 규정, KASI lunar dates, 공직선거법 제34조
and the 임시공휴일 on every day 2000–2040."
  (let ((kr (find-calendar "KR")))
    (%report-holiday-gold "KR" (%holiday-gold-mismatches *kr-holiday-gold* (constantly kr)))))

(deftest kr-year-calendars-match-gold
  (%report-holiday-gold "KR :year"
                        (%holiday-gold-mismatches *kr-holiday-gold*
                                                  (lambda (y) (south-korea-holidays-calendar :year y)))))

(deftest kr-country-calendar-matches-gold
  "country-calendar \"KR\" defers to the starter: the corpus keeps one day of
each three-day 설날 and 추석 (#39 item 7)."
  (let ((kr (country-calendar "KR")))
    (ok (eq :normative (calendar-provenance kr)))
    (%report-holiday-gold "country-calendar KR"
                          (%holiday-gold-mismatches *kr-holiday-gold* (constantly kr)))))

(deftest kr-buddhas-birthday
  "부처님오신날, 음력 4월 8일 (#39 item 1)."
  (let ((kr (find-calendar "KR")))
    (ok (holiday-p kr (make-date 2024 5 15)))
    (ok (holiday-p kr (make-date 2025 5 5)))
    (ok (holiday-p kr (make-date 2026 5 24)))
    (ok (holiday-p kr (make-date 2000 5 11)))))

(deftest kr-daeche-gonghyuil-by-era
  "규정 제3조: 2014 설날·추석·어린이날; 2021-08-04 국경일; 2023-05-04
부처님오신날·기독탄신일; 2026 노동절 (#39 item 2)."
  (let ((kr (find-calendar "KR")))
    (flet ((holiday (y m d) (holiday-p kr (make-date y m d))))
      (ok (holiday 2014 9 10) "추석 on Sunday 2014-09-07")
      (ok (holiday 2017 1 30) "설날 다음 날 on Sunday")
      (ok (holiday 2017 10 6) "추석 전날 on 개천절")
      (ok (holiday 2021 8 16) "광복절 on Sunday, from 2021-08-04")
      (ok (holiday 2021 10 4))
      (ok (holiday 2021 10 11) "한글날 on Saturday")
      (ok (holiday 2022 10 10))
      (ok (holiday 2023 5 29) "부처님오신날 on Saturday, from 2023-05-04")
      (ok (holiday 2024 2 12))
      (ok (holiday 2024 5 6))
      (ok (holiday 2025 3 3))
      (ok (holiday 2025 5 6) "어린이날 and 부처님오신날 on one Monday: one day")
      (ng (holiday 2025 5 7))
      (ok (holiday 2026 3 2))
      (ok (holiday 2026 5 25))
      (ok (holiday 2026 8 17))
      (ok (holiday 2026 10 5))
      (ok (holiday 2027 5 3) "노동절 on Saturday")
      (ok (holiday 2027 7 19) "제헌절 on Saturday")
      (ok (holiday 2027 12 27) "기독탄신일 on Saturday")
      ;; Not before the era of each rule.
      (ng (holiday 2020 10 5) "개천절 on Saturday 2020: no 대체공휴일 before 2021-08-04")
      (ng (holiday 2021 12 27) "기독탄신일 2021 on Saturday: none before 2023")
      (ng (holiday 2022 5 9) "부처님오신날 2022 on Sunday: none before 2023")
      (ng (holiday 2010 9 24) "no 대체공휴일 before 2014"))))

(deftest kr-election-days
  "규정 제2조제10의2호 and 공직선거법 제34조, with ② (#39 item 4)."
  (let ((kr (find-calendar "KR")))
    (dolist (ymd '((2000 4 13) (2002 6 13) (2002 12 19) (2004 4 15) (2006 5 31)
                   (2007 12 19) (2008 4 9) (2010 6 2) (2012 4 11) (2012 12 19)
                   (2014 6 4) (2016 4 13) (2017 5 9) (2018 6 13) (2020 4 15)
                   (2022 3 9) (2022 6 1) (2024 4 10) (2025 6 3) (2026 6 3)
                   (2028 4 12) (2030 3 27) (2030 6 12)))
      (ok (holiday-p kr (apply #'make-date ymd)) (format nil "선거일 ~{~d-~2,'0d-~2,'0d~}" ymd)))
    (ng (holiday-p kr (make-date 2022 3 2)) "2022: the day after 3·1절 moves it a week")
    (ng (holiday-p kr (make-date 2030 6 5)) "2030: the day before 현충일 moves it a week")))

(deftest kr-2026-labor-day-and-constitution-day
  "대통령령 제36290호: 노동절 from 2026-05-01, 제헌절 from 2026-05-11 (#39 item 3)."
  (let ((kr (find-calendar "KR")))
    (ok (holiday-p kr (make-date 2026 5 1)))
    (ok (holiday-p kr (make-date 2026 7 17)))
    (ng (holiday-p kr (make-date 2025 5 1)))
    (ng (holiday-p kr (make-date 2025 7 17)))))

(deftest kr-eras
  "식목일 to 2005, 제헌절 to 2007, 1월 2일 to 1998, 설날 three days from 1989 (#39 item 5)."
  (let ((kr (find-calendar "KR")))
    (ok (holiday-p kr (make-date 2005 4 5)))
    (ng (holiday-p kr (make-date 2006 4 5)))
    (ok (holiday-p kr (make-date 2007 7 17)))
    (ng (holiday-p kr (make-date 2008 7 17)))
    (ok (holiday-p kr (make-date 1998 1 2)))
    (ng (holiday-p kr (make-date 1999 1 2)))
    (ok (holiday-p kr (make-date 1990 1 3)))
    (ng (holiday-p kr (make-date 1991 1 3)))
    (ok (holiday-p kr (make-date 1985 2 20)) "민속의 날 1985")
    (ng (holiday-p kr (make-date 1985 2 19)))
    (ng (holiday-p kr (make-date 1984 2 2)) "no lunar New Year before 1985")
    (ok (holiday-p kr (make-date 1989 2 5)) "설날 전날 from 1989")))

(deftest kr-after-last-almanac-is-provisional
  "Years after the 2027 월력요항 follow the rules only and are flagged provisional."
  (ng (kr-provisional-year-p 2027))
  (ok (kr-provisional-year-p 2028))
  (ok (kr-provisional-year-p 2040)))

;;; --- Hong Kong (#41) -------------------------------------------------------

(defparameter *hk-holiday-gold* (load-holiday-gold "HK"))

(deftest hk-holiday-gold-fixture-shape
  (%check-holiday-gold-shape *hk-holiday-gold* "HK"))

(deftest hk-registered-calendar-matches-gold
  "find-calendar \"HK\" agrees with Cap. 149 and the HKO lunar tables on every
day 2000–2040 (the gold is checked against the gazetted lists 2000–2027)."
  (let ((hk (find-calendar "HK")))
    (%report-holiday-gold "HK" (%holiday-gold-mismatches *hk-holiday-gold* (constantly hk)))))

(deftest hk-country-calendar-matches-gold
  (let ((hk (country-calendar "HK")))
    (ok (eq :normative (calendar-provenance hk)))
    (%report-holiday-gold "country-calendar HK"
                          (%holiday-gold-mismatches *hk-holiday-gold* (constantly hk)))))

(deftest hk-cap149-schedule-2024
  "The six general holidays #41 found missing, and the fourth day of Lunar
New Year for the Sunday 2024-02-11."
  (let ((hk (find-calendar "HK")))
    (dolist (ymd '((2024 3 30) (2024 4 4) (2024 5 15) (2024 6 10) (2024 9 18) (2024 10 11)
                   (2024 2 13)))
      (ok (holiday-p hk (apply #'make-date ymd)) (format nil "~{~d-~2,'0d-~2,'0d~}" ymd)))))

(deftest hk-substitutes-by-era
  "Cap. 149 Schedule before and after 23 of 2011, and s. 6(2)."
  (let ((hk (find-calendar "HK")))
    (flet ((holiday (y m d) (holiday-p hk (make-date y m d))))
      (ok (holiday 2010 2 13) "LNY on a Sunday before 2012: the day preceding")
      (ng (holiday 2010 2 17))
      (ok (holiday 2013 2 13) "LNY on a Sunday from 2012: the fourth day")
      (ng (holiday 2013 2 9))
      (ok (holiday 2009 10 3) "day following Mid-Autumn on a Sunday before 2012: the festival")
      (ng (holiday 2009 10 5))
      (ok (holiday 2014 9 9) "Mid-Autumn 2014-09-08: the day following")
      (ok (holiday 2010 4 6) "Ching Ming on Easter Monday: s. 6(2)")
      (ok (holiday 2015 4 7) "Ching Ming Sunday, its substitute on Easter Monday: s. 6(2)")
      (ok (holiday 2022 12 27) "Christmas on a Sunday: the second weekday after")
      (ok (holiday 2020 12 26) "the first weekday after Christmas may be a Saturday")
      (ok (holiday 2015 9 3) "one-off 2015 general holiday")
      (ok (holiday 2033 10 3) "National Day and Chung Yeung on Saturday 2033-10-01: s. 6(2)"))))

;;; --- Taiwan (#41) ----------------------------------------------------------

(defparameter *tw-holiday-gold* (load-holiday-gold "TW"))

(deftest tw-holiday-gold-fixture-shape
  (%check-holiday-gold-shape *tw-holiday-gold* "TW")
  (ok (getf *tw-holiday-gold* :working-days)))

(deftest tw-registered-calendar-matches-gold
  "find-calendar \"TW\" agrees with the statute, the 補假 rules and the DGPA
調整放假 / 補行上班 on every day 2000–2040 (gold checked against the DGPA
calendars 2000–2027)."
  (let ((tw (find-calendar "TW")))
    (%report-holiday-gold "TW" (%holiday-gold-mismatches *tw-holiday-gold* (constantly tw)))))

(deftest tw-year-calendars-match-gold
  (%report-holiday-gold "TW :year"
                        (%holiday-gold-mismatches *tw-holiday-gold*
                                                  (lambda (y) (taiwan-holidays-calendar :year y)))))

(deftest tw-country-calendar-matches-gold
  (let ((tw (country-calendar "TW")))
    (ok (eq :normative (calendar-provenance tw)))
    (%report-holiday-gold "country-calendar TW"
                          (%holiday-gold-mismatches *tw-holiday-gold* (constantly tw)))))

(deftest tw-childrens-day-and-bujia
  "兒童節 from 2011 with the 清明 rule; 補假 (#41 TW comment)."
  (let ((tw (find-calendar "TW")))
    (flet ((holiday (y m d) (holiday-p tw (make-date y m d))))
      (ok (holiday 2024 4 5) "兒童節 on 清明, a Thursday: the day after")
      (ok (holiday 2025 4 3) "兒童節 on 清明, a Friday: the day before")
      (ok (holiday 2016 4 5) "the day before is a Sunday: the next workday")
      (ok (holiday 2021 4 2) "both on a Sunday: 兒童節 to Friday 4/2")
      (ok (holiday 2021 4 5) "清明 to Monday 4/5")
      (ng (holiday 2010 4 4) "no 兒童節 before 2011 (Sunday anyway)")
      (ok (holiday 2026 4 3) "兒童節 on a Saturday: the Friday before")
      (ok (holiday 2026 4 6) "清明 on a Sunday: the Monday after")
      (ok (holiday 2021 12 31) "1 January 2022 on a Saturday")
      (ok (holiday 2024 2 8) "小年夜 2024 by decision")
      (ok (holiday 2023 1 20))
      (ok (holiday 2023 1 27))
      (ok (business-day-p tw (make-date 2024 2 17)) "補行上班")
      (ok (holiday 2026 5 1) "勞動節 from 2026")
      (ng (holiday 2025 5 1))
      (ok (holiday 2025 9 29) "孔子誕辰紀念日 on Sunday 2025-09-28")
      (ok (holiday 2025 12 25)))))

(deftest tw-after-last-calendar-is-provisional
  (ng (tw-provisional-year-p 2027))
  (ok (tw-provisional-year-p 2028)))

;;; --- Philippines (#41) -----------------------------------------------------

(defparameter *ph-holiday-gold* (load-holiday-gold "PH"))

(deftest ph-holiday-gold-fixture-shape
  (%check-holiday-gold-shape *ph-holiday-gold* "PH"))

(deftest ph-registered-calendar-matches-gold
  "find-calendar \"PH\" agrees with EO 292 s. 26 as amended and every yearly
proclamation 2000–2027 on every day 2000–2040 (Eid days 2027 onward and the
years after 2027 are provisional)."
  (let ((ph (find-calendar "PH")))
    (%report-holiday-gold "PH" (%holiday-gold-mismatches *ph-holiday-gold* (constantly ph)))))

(deftest ph-year-calendars-match-gold
  (%report-holiday-gold "PH :year"
                        (%holiday-gold-mismatches *ph-holiday-gold*
                                                  (lambda (y) (philippines-holidays-calendar :year y)))))

(deftest ph-country-calendar-matches-gold
  (let ((ph (country-calendar "PH")))
    (ok (eq :normative (calendar-provenance ph)))
    (%report-holiday-gold "country-calendar PH"
                          (%holiday-gold-mismatches *ph-holiday-gold* (constantly ph)))))

(deftest ph-issue-41-days
  (let ((ph (find-calendar "PH")))
    (flet ((holiday (y m d) (holiday-p ph (make-date y m d))))
      (ok (holiday 2024 4 10) "Eid'l Fitr 2024")
      (ok (holiday 2024 6 17) "Eid'l Adha 2024")
      (ok (holiday 2024 3 30) "Black Saturday")
      (ok (holiday 2024 12 8) "Immaculate Conception (RA 10966)")
      (ok (holiday 2024 12 31) "Last Day of the Year")
      (ok (holiday 2024 8 23) "Ninoy Aquino Day moved by Proc. 665")
      (ng (holiday 2024 8 21))
      (ng (holiday 2024 2 25) "EDSA not in Proc. 368")
      (ng (holiday 2025 2 25) "EDSA a special working day (Proc. 727)")
      (ng (holiday 2026 2 25))
      (ng (holiday 2027 2 25) "EDSA a special working day (Proc. 1427)")
      (ok (holiday 2027 2 6) "Chinese New Year 2027 (Proc. 1427)")
      (ok (holiday 2023 4 10) "Araw ng Kagitingan moved to Monday (Proc. 90)")
      (ng (holiday 2023 4 9)))))

(deftest ph-provisional-years
  (ng (ph-provisional-year-p 2026))
  (ok (ph-provisional-year-p 2027)))

;;; --- Indonesia (#41) -------------------------------------------------------

(defparameter *id-holiday-gold* (load-holiday-gold "ID"))

(defun %id-gold-with-cuti ()
  "The ID gold with its :CUTI-BERSAMA rows counted as days off."
  (list* :days (append (getf *id-holiday-gold* :days) (getf *id-holiday-gold* :cuti-bersama))
         *id-holiday-gold*))

(deftest id-holiday-gold-fixture-shape
  (%check-holiday-gold-shape *id-holiday-gold* "ID" :from 2005)
  (ok (getf *id-holiday-gold* :cuti-bersama)))

(deftest id-registered-calendar-matches-gold
  "find-calendar \"ID\" holds the hari libur nasional of every SKB 3 Menteri
2005–2027 on every day, and the estimates of 2028–2040."
  (let ((id (find-calendar "ID")))
    (%report-holiday-gold "ID" (%holiday-gold-mismatches *id-holiday-gold* (constantly id)))))

(deftest id-year-calendars-match-gold
  (%report-holiday-gold "ID :year"
                        (%holiday-gold-mismatches *id-holiday-gold*
                                                  (lambda (y) (indonesia-holidays-calendar :year y)))))

(deftest id-cuti-bersama-calendar-matches-gold
  "(indonesia-holidays-calendar :cuti-bersama t) adds exactly the SKB cuti bersama."
  (%report-holiday-gold "ID :cuti-bersama"
                        (%holiday-gold-mismatches (%id-gold-with-cuti)
                                                  (lambda (y) (indonesia-holidays-calendar :year y :cuti-bersama t)))))

(deftest id-country-calendar-matches-gold
  (let ((id (country-calendar "ID")))
    (ok (eq :normative (calendar-provenance id)))
    (%report-holiday-gold "country-calendar ID"
                          (%holiday-gold-mismatches *id-holiday-gold* (constantly id)))))

(deftest id-issue-41-days
  (let ((id (find-calendar "ID")))
    (flet ((holiday (y m d) (holiday-p id (make-date y m d))))
      (ok (holiday 2024 2 8) "Isra Mikraj")
      (ok (holiday 2024 3 11) "Nyepi")
      (ok (holiday 2024 5 9) "Kenaikan")
      (ok (holiday 2024 5 23) "Waisak")
      (ok (holiday 2024 7 7) "Tahun Baru Islam per SKB, not the tabular 07-08")
      (ng (holiday 2024 7 8))
      (ok (holiday 2022 5 2) "Idul Fitri per SKB")
      (ok (holiday 2022 5 3))
      (ng (holiday 2022 5 4))
      (ok (holiday 2024 2 14) "Pemilu 2024")
      (ok (holiday 2024 11 27) "Pilkada serentak 2024")
      (ok (holiday 2027 3 10) "SKB 2027")
      (ng (holiday 2024 2 9) "cuti bersama is not a hari libur")
      (ng (holiday 2016 6 1) "Pancasila from 2017"))))

(deftest id-provisional-years
  (ng (id-provisional-year-p 2027))
  (ok (id-provisional-year-p 2028)))

;;; --- Malaysia (#40) --------------------------------------------------------

(defparameter *my-holiday-gold* (load-holiday-gold "MY"))

(deftest my-holiday-gold-fixture-shape
  (%check-holiday-gold-shape *my-holiday-gold* "MY" :from 2008))

(deftest my-registered-calendar-matches-gold
  "find-calendar \"MY\" holds the federal days of every JPM list 2008–2027,
the s. 3 replacements and the s. 8 days, and the estimates of 2028–2040."
  (let ((my (find-calendar "MY")))
    (%report-holiday-gold "MY" (%holiday-gold-mismatches *my-holiday-gold* (constantly my)))))

(deftest my-year-calendars-match-gold
  (%report-holiday-gold "MY :year"
                        (%holiday-gold-mismatches *my-holiday-gold*
                                                  (lambda (y) (malaysia-holidays-calendar :year y)))))

(deftest my-country-calendar-matches-gold
  (let ((my (country-calendar "MY")))
    (ok (eq :normative (calendar-provenance my)))
    (%report-holiday-gold "country-calendar MY"
                          (%holiday-gold-mismatches *my-holiday-gold* (constantly my)))))

(deftest my-issue-40-days
  (let ((my (find-calendar "MY")))
    (flet ((holiday (y m d) (holiday-p my (make-date y m d))))
      (ok (holiday 2024 10 31) "Deepavali 2024 (Warta No. 19239)")
      (ng (holiday 2024 9 3) "no Deepavali in September")
      (ok (holiday 2025 10 20))
      (ok (holiday 2026 11 8))
      (ok (holiday 2026 11 9) "Deepavali on a Sunday: s. 3")
      (ok (holiday 2024 6 3) "the Agong's birthday, first Monday of June")
      (ok (holiday 2016 6 4) "first Saturday of June to 2016")
      (ok (holiday 2018 9 9) "9 September 2017-2019")
      (ok (holiday 2024 7 7) "Awal Muharam")
      (ok (holiday 2024 7 8) "Awal Muharam on a Sunday: s. 3")
      (ok (holiday 2024 9 16) "Maulidur Rasul and Malaysia Day")
      (ng (holiday 2024 9 17) "two holidays on one weekday give no extra day")
      (ok (holiday 2026 5 31) "Wesak 2026")
      (ok (holiday 2026 6 2) "Wesak on a Sunday, 1 June the Agong's birthday: s. 3 gives 2 June")
      (ng (holiday 2026 5 13) "no Wesak bridge")
      (ok (holiday 2026 3 20) "s. 8 day before Hari Raya Puasa 2026")
      (ok (holiday 2022 5 4) "Labour Day replacement after Hari Raya Puasa 2022 (PMO)")
      (ok (holiday 2018 5 9) "GE14")
      (ng (holiday 2024 1 1) "1 January is a state day")
      (ng (holiday 2024 3 28) "Nuzul Al-Quran is a state / FT day"))))

(deftest my-deepavali-estimate-is-not-lunar-8-1
  "The estimate for years with no list lands in late October or November and
matches the listed dates where the tithi does not shift it."
  (ok (= (date-rd (my-deepavali-estimate 2024)) (date-rd (make-date 2024 10 31))))
  (ok (= (date-rd (my-deepavali-estimate 2026)) (date-rd (make-date 2026 11 8))))
  (ok (= (date-rd (my-wesak-estimate 2026)) (date-rd (make-date 2026 5 31))))
  (loop for y from 2028 to 2040
        for d = (my-deepavali-estimate y)
        do (ok (<= (date-rd (make-date y 10 17)) (date-rd d) (date-rd (make-date y 11 16))))))

(deftest my-provisional-years
  (ng (my-provisional-year-p 2027))
  (ok (my-provisional-year-p 2028))
  (ok (my-estimated-year-p 2007))
  (ng (my-estimated-year-p 2008)))

;;; --- Vietnam (#40) ---------------------------------------------------------

(defparameter *vn-holiday-gold* (load-holiday-gold "VN"))

(deftest vn-holiday-gold-fixture-shape
  (%check-holiday-gold-shape *vn-holiday-gold* "VN")
  (ok (getf *vn-holiday-gold* :working-days)))

(deftest vn-registered-calendar-matches-gold
  "find-calendar \"VN\" agrees with the statute of each era, its nghỉ bù and
the yearly notices (Tết and Quốc khánh placement, hoán đổi, làm bù) on every
day 2000–2040."
  (let ((vn (find-calendar "VN")))
    (%report-holiday-gold "VN" (%holiday-gold-mismatches *vn-holiday-gold* (constantly vn)))))

(deftest vn-year-calendars-match-gold
  (%report-holiday-gold "VN :year"
                        (%holiday-gold-mismatches *vn-holiday-gold*
                                                  (lambda (y) (vietnam-holidays-calendar :year y)))))

(deftest vn-country-calendar-matches-gold
  (let ((vn (country-calendar "VN")))
    (ok (eq :normative (calendar-provenance vn)))
    (%report-holiday-gold "country-calendar VN"
                          (%holiday-gold-mismatches *vn-holiday-gold* (constantly vn)))))

(deftest vn-issue-40-days
  (let ((vn (find-calendar "VN")))
    (flet ((holiday (y m d) (holiday-p vn (make-date y m d))))
      (ok (holiday 2025 1 27) "Tết 2025: 28 tháng Chạp to mùng 3 (TB 6150/TB-BLĐTBXH)")
      (ok (holiday 2025 1 31))
      (ng (holiday 2025 2 3))
      (ok (holiday 2014 2 3) "first five-day Tết (BLLĐ 2012): mùng 4")
      (ok (holiday 2014 2 5) "its nghỉ bù")
      (ng (holiday 2013 2 18) "2013: four Tết days, two nghỉ bù and one hoán đổi, then work")
      (ok (holiday 2025 9 1) "Quốc khánh 2025: 1/9 and 2/9")
      (ng (holiday 2025 9 3))
      (ok (holiday 2024 9 3) "Quốc khánh 2024: 2/9 and 3/9")
      (ok (holiday 2022 9 1))
      (ng (holiday 2020 9 3) "one Quốc khánh day before 2021")
      (ok (holiday 2026 11 24) "Ngày Văn hóa Việt Nam (NQ 28/2026/QH16)")
      (ng (holiday 2025 11 24))
      (ok (holiday 2027 7 27) "27/7 from 1 March 2027")
      (ng (holiday 2026 7 27))
      (ok (holiday 2023 5 2) "Giỗ Tổ on a Saturday, 30/4 on a Sunday: nghỉ bù 2/5 and 3/5")
      (ok (holiday 2023 5 3))
      (ok (holiday 2025 5 2) "hoán đổi")
      (ok (business-day-p vn (make-date 2025 4 26)) "làm bù Saturday")
      (ng (holiday 2025 1 25) "a Saturday in the Tết block is a weekly rest day"))))

(deftest vn-provisional-years
  (ng (vn-provisional-year-p 2027))
  (ok (vn-provisional-year-p 2028)))

;;; --- China (#26) -----------------------------------------------------------

(defparameter *cn-holiday-gold* (load-holiday-gold "CN"))

(deftest cn-holiday-gold-fixture-shape
  (%check-holiday-gold-shape *cn-holiday-gold* "CN" :from 2007)
  (ok (getf *cn-holiday-gold* :working-days)))

(deftest cn-registered-calendar-matches-gold
  "find-calendar \"CN\" agrees with the 放假办法 of each era and every State
Council notice on www.gov.cn 2007–2027 (holiday, business day and 上班 day),
and with the statute days of the provisional years 2028–2040."
  (let ((cn (find-calendar "CN")))
    (%report-holiday-gold "CN" (%holiday-gold-mismatches *cn-holiday-gold* (constantly cn)))))

(deftest cn-year-calendars-match-gold
  (%report-holiday-gold "CN :year"
                        (%holiday-gold-mismatches *cn-holiday-gold*
                                                  (lambda (y) (china-holidays-calendar :year y)))))

(deftest cn-country-calendar-matches-gold
  "country-calendar \"CN\" defers to the starter: the corpus has no 调休 or 上班 days."
  (let ((cn (country-calendar "CN")))
    (ok (eq :normative (calendar-provenance cn)))
    (%report-holiday-gold "country-calendar CN"
                          (%holiday-gold-mismatches *cn-holiday-gold* (constantly cn)))))

(defun %cn-name-mismatches (gold calendar)
  "Every (ISO GOLD-NAME OUR-NAME) where CALENDAR's name for a GOLD day is not
the gold's name. Two festivals on one day are \"中秋节 / 国庆节\" in the gold
and \"中秋节; 国庆节\" in HOLIDAY-P."
  (flet ((parts (string separator)
           (loop for start = 0 then (+ end (length separator))
                 for end = (or (search separator string :start2 start) (length string))
                 collect (subseq string start end)
                 while (< end (length string)))))
    (loop for (y m d gold-name) in (getf gold :days)
          for date = (make-date y m d)
          for ours = (nth-value 1 (holiday-p calendar date))
          unless (and (stringp ours)
                      (equal (sort (parts ours "; ") #'string<)
                             (sort (parts gold-name " / ") #'string<)))
            collect (list (suite-date-iso date) gold-name ours))))

(deftest cn-holiday-names-match-gold
  "Each day off carries its festival name, not \"调休\" (#26, #12): the
statutory day its festival, a 第六条 day （补休）, a weekday swapped for a
上班 day （调休）, a weekend day of a window （休息日）."
  (let ((bad (%cn-name-mismatches *cn-holiday-gold* (find-calendar "CN"))))
    (loop for row in bad for i below 25
          do (ok nil (format nil "CN name ~{~a gold ~s ours ~s~}" row)))
    (ok (null bad) (format nil "CN: ~d names differ from the gold" (length bad)))))

(defparameter *cn-secondary-holiday-gold*
  (read-data-form (data-path "tests/cn-secondary-holiday-gold.sexp")))

(deftest cn-secondary-gold-2000-2006-lower-confidence
  "LOWER CONFIDENCE. 2000–2006 against the Xinhua dispatches and
republications and the zh.wikisource transcriptions of the notices (no
notice of these years is on www.gov.cn): the days only those texts give."
  (let ((gold *cn-secondary-holiday-gold*))
    (ok (string= "CN" (getf gold :country)))
    (ok (eq :secondary (getf gold :confidence)))
    (ok (= 2000 (getf gold :from)))
    (ok (= 2006 (getf gold :to)))
    (%report-holiday-gold "CN 2000-2006 (secondary sources)"
                          (%holiday-gold-mismatches gold (constantly (find-calendar "CN"))))
    (%report-holiday-gold "CN :year 2000-2006 (secondary sources)"
                          (%holiday-gold-mismatches gold (lambda (y) (china-holidays-calendar :year y))))
    (let ((bad (%cn-name-mismatches gold (find-calendar "CN"))))
      (ok (null bad) (format nil "CN 2000-2006 names: ~s" (subseq bad 0 (min 10 (length bad))))))))

(deftest cn-statute-eras
  "第二条 of each 放假办法: 1999 (令第270号) 劳动节 5/1–3 and 春节 初一–初三;
2008 (令第513号) 除夕–初二, 劳动节 one day, 清明 端午 中秋; 2014 (令第644号)
初一–初三; 2025 (令第795号) 除夕–初三, 劳动节 5/1–2. The rules alone, no notice."
  (let ((rules (make-instance 'china-holidays-calendar)))
    (flet ((holiday (y m d) (holiday-p rules (make-date y m d))))
      (ok (holiday 2005 5 2))
      (ok (holiday 2005 5 3))
      (ng (holiday 2008 5 2))
      (ng (holiday 2024 5 2))
      (ok (holiday 2025 5 2))
      (ok (holiday 2010 2 13) "除夕 2010 (令第513号)")
      (ng (holiday 2010 2 16) "初三 2010 is no statutory day")
      (ok (holiday 2005 2 11) "初三 2005")
      (ok (holiday 2016 2 10) "初三 2016")
      (ng (holiday 2016 2 7) "除夕 2016 is no statutory day")
      (ok (holiday 2026 2 16) "除夕 2026 (令第795号)")
      (ng (holiday 2007 4 5) "no 清明 before 2008"))))

(deftest cn-issue-26-days
  "The 2027 notice 国办发明电〔2026〕10号, the 2019 amendment 〔2019〕3号, the 2020
extension 〔2020〕1号, the 2003 SARS amendment and the 2000 国庆 notice."
  (let ((cn (find-calendar "CN")))
    (flet ((holiday (y m d) (holiday-p cn (make-date y m d)))
           (business (y m d) (business-day-p cn (make-date y m d)))
           (name (y m d) (nth-value 1 (holiday-p cn (make-date y m d)))))
      (ok (holiday 2027 2 5) "除夕 2027")
      (ok (holiday 2027 2 12))
      (ok (business 2027 1 31) "上班 Sunday")
      (ok (business 2027 2 14))
      (ok (holiday 2027 5 5))
      (ok (business 2027 5 8))
      (ok (holiday 2027 6 9))
      (ok (business 2027 6 10) "端午 2027 is one day")
      (ok (holiday 2027 9 15))
      (ok (holiday 2027 10 7))
      (ok (business 2027 9 26))
      (ok (business 2027 10 9))
      (ok (holiday 2019 5 2) "劳动节 2019 amended to 5/1–4")
      (ok (holiday 2019 5 3))
      (ok (business 2019 4 28))
      (ok (business 2019 5 5))
      (ok (holiday 2020 2 2) "春节 2020 extended to 2/2")
      (ng (business 2020 2 1))
      (ok (holiday 2003 5 5) "2003 五一 by the statute days (非典)")
      (ok (business 2003 5 6))
      (ng (business 2003 4 26) "the amendment cancels the 4/26–27 上班")
      (ok (holiday 2000 10 4) "2000 国庆 10/1–7")
      (ok (business 2000 9 30))
      (ok (business 2000 10 8))
      (ok (business 2000 1 3) "the 2000 元旦 rest moved to 1999-12-31")
      (ok (holiday 1999 12 31))
      (ok (equal "中秋节" (name 2026 9 25)))
      (ok (equal "国庆节" (name 2026 10 1)))
      (ok (equal "国庆节（调休）" (name 2026 10 6)))
      (ok (equal "国庆节（补休）" (name 2026 10 5)))
      (ok (equal "春节（除夕）" (name 2026 2 16)))
      (ok (equal "春节（休息日）" (name 2026 2 15)))
      (ok (equal "元旦（调休）" (name 2026 1 2)))
      (ok (equal "中秋节" (name 2033 9 8)) "中秋 2033 (#38)"))))

(deftest cn-provisional-years-and-confidence
  "Years after the 2027 notice are provisional: statute days, no 调休 or 上班.
2000–2006 notices are secondary sources, tagged in each day's authority."
  (ng (cn-provisional-year-p 2027))
  (ok (cn-provisional-year-p 2028))
  (ok (eq :primary (cn-notice-confidence 2007)))
  (ok (eq :primary (cn-notice-confidence 2027)))
  (ok (eq :secondary (cn-notice-confidence 2003)))
  (ok (eq :provisional (cn-notice-confidence 2030)))
  (ng (cn-working-days-for-year 2028))
  (let ((tr (find-if (lambda (tr) (= 2003 (date-year (calendar-transfer-to tr))))
                     (cn-transfers-for-year 2003))))
    (ok tr)
    (ok (search "低可信度" (princ-to-string (calendar-transfer-authority tr))))))

;;; --- Thailand (#40) --------------------------------------------------------

(defparameter *th-holiday-gold* (load-holiday-gold "TH"))

(defparameter *th-bank-holiday-gold* (load-holiday-gold "TH-BANK"))

(defparameter *th-secondary-holiday-gold*
  (read-data-form (data-path "tests/th-secondary-holiday-gold.sexp")))

(deftest th-holiday-gold-fixture-shape
  (%check-holiday-gold-shape *th-holiday-gold* "TH" :from 2019))

(deftest th-registered-calendar-matches-gold
  "find-calendar \"TH\" (government offices) agrees with the Cabinet overview
and special days of each year 2019–2026 and the substitute rule of มติ ครม.
1 พ.ค. 2544 / 3 ก.พ. 2547, and with the annual days of the provisional years
2027–2040 (Thai lunar Buddhist days)."
  (let ((th (find-calendar "TH")))
    (%report-holiday-gold "TH" (%holiday-gold-mismatches *th-holiday-gold* (constantly th)))))

(deftest th-year-calendars-match-gold
  (%report-holiday-gold "TH :year"
                        (%holiday-gold-mismatches *th-holiday-gold*
                                                  (lambda (y) (thailand-holidays-calendar :year y)))))

(deftest th-country-calendar-matches-gold
  "country-calendar \"TH\" defers to the starter: the corpus has no Cabinet
special days and Chinese-lunar Buddhist days."
  (let ((th (country-calendar "TH")))
    (ok (eq :normative (calendar-provenance th)))
    (%report-holiday-gold "country-calendar TH"
                          (%holiday-gold-mismatches *th-holiday-gold* (constantly th)))))

(deftest th-secondary-gold-2000-2018-lower-confidence
  "LOWER CONFIDENCE. 2000–2018 against Cabinet releases mirrored by ryt9.com,
news reports, the BOT lists' Buddhist days and the substitute rule of each
era where no document gives the day. Not all Royal Ploughing Days are known."
  (let ((gold *th-secondary-holiday-gold*))
    (ok (string= "TH" (getf gold :country)))
    (ok (eq :secondary (getf gold :confidence)))
    (ok (= 2000 (getf gold :from)))
    (ok (= 2018 (getf gold :to)))
    (%report-holiday-gold "TH 2000-2018 (secondary sources)"
                          (%holiday-gold-mismatches gold (constantly (find-calendar "TH"))))
    (%report-holiday-gold "TH :year 2000-2018 (secondary sources)"
                          (%holiday-gold-mismatches gold (lambda (y) (thailand-holidays-calendar :year y))))))

(deftest th-bank-holiday-gold-fixture-shape
  (%check-holiday-gold-shape *th-bank-holiday-gold* "TH-BANK"))

(deftest th-bank-registered-calendar-matches-gold
  "find-calendar \"TH-BANK\" agrees with every Bank of Thailand
financial-institution list 2000–2027 and with the annual days and
substitutes of the provisional years 2028–2040."
  (let ((bank (find-calendar "TH-BANK")))
    (%report-holiday-gold "TH-BANK" (%holiday-gold-mismatches *th-bank-holiday-gold* (constantly bank)))))

(deftest th-bank-year-calendars-match-gold
  (%report-holiday-gold "TH-BANK :year"
                        (%holiday-gold-mismatches *th-bank-holiday-gold*
                                                  (lambda (y) (thailand-bank-holidays-calendar :year y)))))

(deftest th-lunar-rule-reproduces-the-lists
  "The Thai lunar rule (Suriyayatra athikawan, 19-year athikamat cycle) gives
every Buddhist day the BOT and Cabinet lists print 2000–2027, and the year
types Eade (JSS 88, 2000) tabulates for CS 1320–1340."
  (loop for year from 2000 to 2027
        do (dolist (kind '(:makha :visakha :asalha :khao-phansa))
             (ok (= (thai-buddhist-day year kind) (thai-lunar-rule-day year kind))
                 (format nil "~a ~a" year kind))))
  (loop for (cs type) on '(1320 :athikamat 1321 :athikawan 1322 :normal 1323 :athikamat
                           1325 :athikawan 1330 :athikawan 1335 :athikawan 1340 :athikawan)
        by #'cddr
        do (ok (eq type (thai-lunar-year-type (+ cs 638))) (format nil "CS ~a" cs)))
  (ok (eq :athikamat (thai-lunar-year-type 2012)) "2012 athikamat (BOT 2555 note 2/)")
  (ok (eq :normal (thai-lunar-year-type 2014)) "2014 normal: avoman 137 gives no extra day")
  (ok (eq :athikawan (thai-lunar-year-type 2005)) "2005 athikawan (BOT 2548-2549 lists)")
  (ok (eq :normal (thai-lunar-year-type 2006)))
  (ok (= (make-date 2000 2 19) (thai-buddhist-day 2000 :makha)) "Makha 2000 on a Saturday")
  (ok (= (make-date 2028 2 10) (thai-buddhist-day 2028 :makha)))
  (ok (= (make-date 2040 7 23) (thai-buddhist-day 2040 :asalha)))
  (ok (member 2031 *thai-lunar-uncertain-years*) "2031: tithi 24, as 2012")
  (ok (member 2030 *thai-lunar-uncertain-years*) "2030: athikawan by the rule, 2032 in other tables"))

(deftest th-buddhist-days-are-not-chinese-lunar
  "Visakha Bucha 2007 is 31 May (athikamat: 7/15), not the Chinese 4/15."
  (let ((th (find-calendar "TH")))
    (ok (holiday-p th (make-date 2007 5 31)))
    (ng (holiday-p th (make-date 2007 5 1)))
    (ok (holiday-p th (make-date 2026 7 29)) "Asalha Bucha 2026, 8/8 15")
    (ok (holiday-p th (make-date 2026 7 30)) "Khao Phansa 2026")))

(deftest th-substitute-rule-eras
  "No substitute before 26 Dec 1995; one per holiday under ว 274/2538; one
per weekend from 1 July 2001 (ว 83/2544); BOT: none for the mid-year day,
Songkran one only when two of its days fall on the weekend."
  (let ((th (find-calendar "TH"))
        (bank (find-calendar "TH-BANK")))
    (flet ((gov (y m d) (holiday-p th (make-date y m d)))
           (fi (y m d) (holiday-p bank (make-date y m d))))
      (ok (gov 2000 7 18) "Asalha Sun 16 Jul 2000, Khao Phansa Mon 17: Tue 18 (ว 274)")
      (ok (gov 2001 4 17) "Songkran Sat 14 + Sun 15 Apr 2001: 16 and 17 (ว 274)")
      (ng (fi 2001 4 17) "BOT 2544: one day")
      (ok (gov 2024 7 22) "Asalha Sat + Khao Phansa Sun 2024: one day (ว 83)")
      (ng (gov 2024 7 23))
      (ok (gov 2023 4 17) "Songkran Sat 15 Apr 2023")
      (ng (fi 2023 4 17) "BOT 2566: no Songkran substitute")
      (ok (fi 2024 4 16) "BOT 2567: Songkran Sat 13 + Sun 14")
      (ng (fi 2012 7 2) "mid-year day Sun 1 Jul 2012: none (BOT 2555 note 3/)")
      (ok (fi 2012 7 1))
      (ng (gov 1990 12 11) "no substitute before 26 Dec 1995"))))

(deftest th-issue-40-days
  (let ((th (find-calendar "TH"))
        (bank (find-calendar "TH-BANK")))
    (flet ((gov (y m d) (holiday-p th (make-date y m d)))
           (fi (y m d) (holiday-p bank (make-date y m d))))
      (ng (gov 2020 4 13) "Songkran 2020 postponed (สลค. ว 109/2563)")
      (ng (fi 2020 4 14))
      (ok (gov 2020 7 27) "Songkran 2020 replacement")
      (ok (gov 2020 12 11) "5 Dec 2020 substitute moved from 7 to 11 Dec (สลค. ว 454/2563)")
      (ng (gov 2020 12 7))
      (ok (fi 2020 12 7) "BOT 2563 kept 7 Dec")
      (ok (fi 2023 12 29) "BOT: 2 Jan 2024 moved to 29 Dec 2023")
      (ng (fi 2024 1 2))
      (ok (fi 2021 10 22) "BOT 2564: 25 Oct moved to 22 Oct")
      (ng (fi 2021 10 25))
      (ok (fi 2004 1 2) "BOT 2547: 31 Dec 2003 moved to 2 Jan 2004")
      (ng (fi 2003 12 31))
      (ok (gov 2003 12 31))
      (ok (fi 2026 5 1) "Labour Day: banks")
      (ng (gov 2026 5 1) "not government offices")
      (ok (gov 2025 5 9) "Royal Ploughing Day 2025")
      (ng (fi 2025 5 9))
      (ng (fi 2018 7 2) "mid-year day on Sunday 1 Jul 2018: no substitute")
      (ng (fi 2019 7 1) "mid-year day abolished from 2019")
      (ok (gov 2026 12 16) "royal cremation 2026")
      (ok (fi 2027 7 19) "BOT 2570: Asalha Sun 18 Jul 2027"))))

(deftest th-provisional-years-and-confidence
  (ng (th-provisional-year-p 2026))
  (ok (th-provisional-year-p 2027))
  (ng (th-bank-provisional-year-p 2027))
  (ok (th-bank-provisional-year-p 2028))
  (ok (eq :primary (th-confidence 2019)))
  (ok (eq :primary (th-confidence 2026)))
  (ok (eq :secondary (th-confidence 2010)))
  (ok (eq :provisional (th-confidence 2027)))
  (ok (eq :primary (th-bank-confidence 2000)))
  (ok (eq :provisional (th-bank-confidence 2028))))

(deftest th-xbkk-attaches-th-bank
  "The SET holiday pages 2012–2022 list exactly the BOT financial-institution
days, so XBKK closes on TH-BANK: Labour Day yes, the Royal Ploughing Day and
the Cabinet-only special days no."
  (let ((ex (find-exchange "XBKK")))
    (ok (equal "TH-BANK" (exchange-hours-calendar-name ex)))
    (ok (exchange-holiday-p ex (make-date 2024 5 1)) "Labour Day 2024")
    (ng (exchange-holiday-p ex (make-date 2025 5 9)) "Royal Ploughing Day 2025")
    (ng (exchange-holiday-p ex (make-date 2023 7 31)) "Cabinet-only special day 2023")
    (ok (exchange-holiday-p ex (make-date 2023 12 29)) "BOT: 2 Jan 2024 moved to 29 Dec 2023")))

(deftest th-decree-rows-carry-issued-and-published
  "Bitemporal step 1 (#93): every decree, Cabinet resolution or BOT
announcement row has :ISSUED and :PUBLISHED, each a date with its citation
(:ISSUED-URI, :PUBLISHED-URI) or NIL with a :DATES-NOTE saying why."
  (let ((rows (th-decree-rows)))
    (ok (< 20 (length rows)))
    (dolist (row rows)
      (let ((label (format nil "~s" (or (getf row :date) (getf row :authority)))))
        (dolist (key '(:issued :published))
          (ok (member key row) (format nil "~a has ~s" label key))
          (if (getf row key)
              (ok (getf row (if (eq key :issued) :issued-uri :published-uri))
                  (format nil "~a ~s cited" label key))
              (ok (getf row :dates-note) (format nil "~a ~s NIL with a note" label key))))))
    (dolist (era *th-substitute-eras*)
      (ok (getf era :issued))
      (ok (getf era :published))
      (ok (getf era :in-force)))))

;;; --- India (#42) -----------------------------------------------------------

(defparameter *in-holiday-gold* (load-holiday-gold "IN"))

(defun %in-gold-with-restricted ()
  "The IN gold with its :RESTRICTED rows (Annexure-II) counted as days off."
  (list* :days (append (getf *in-holiday-gold* :days) (getf *in-holiday-gold* :restricted))
         *in-holiday-gold*))

(deftest in-holiday-gold-fixture-shape
  (%check-holiday-gold-shape *in-holiday-gold* "IN" :from 2002)
  (ok (equal '(2005 2006) (getf *in-holiday-gold* :gaps)) "no O.M. found for 2005 and 2006")
  (ok (getf *in-holiday-gold* :restricted)))

(deftest in-registered-calendar-matches-gold
  "find-calendar \"IN\" holds Annexure-I of every DoPT holiday O.M. 2002–2004
and 2007–2027 with the later O.M.s (14 April, moon-sighting changes, the
2010 and 2023 Delhi closures) on every day, and the fixed days, Good Friday
and tabular Islamic estimates of 2028–2040."
  (let ((in (find-calendar "IN")))
    (%report-holiday-gold "IN" (%holiday-gold-mismatches *in-holiday-gold* (constantly in)))))

(deftest in-year-calendars-match-gold
  (%report-holiday-gold "IN :year"
                        (%holiday-gold-mismatches *in-holiday-gold*
                                                  (lambda (y) (india-holidays-calendar :year y)))))

(deftest in-restricted-calendar-matches-gold
  "(india-holidays-calendar :restricted t) adds exactly Annexure-II, with its
corrections (Ganesh Chaturthi 2004, Guru Gobind Singh 2011 and 2014, Maha
Shivratri 2015)."
  (%report-holiday-gold "IN :restricted"
                        (%holiday-gold-mismatches (%in-gold-with-restricted)
                                                  (lambda (y) (india-holidays-calendar :year y :restricted t)))))

(deftest in-country-calendar-matches-gold
  "country-calendar \"IN\" defers to the starter: the corpus has no festival
or Islamic day (#42 item 4)."
  (let ((in (country-calendar "IN")))
    (ok (eq :normative (calendar-provenance in)))
    (%report-holiday-gold "country-calendar IN"
                          (%holiday-gold-mismatches *in-holiday-gold* (constantly in)))))

(deftest in-issue-42-days
  (let ((in (find-calendar "IN")))
    (flet ((holiday (y m d) (holiday-p in (make-date y m d))))
      (ok (holiday 2024 4 21) "Mahavir Jayanti 2024 (item 1)")
      (ok (holiday 2025 4 10) "Mahavir Jayanti 2025")
      (ok (holiday 2024 4 17) "Ram Navami 2024, chosen for Delhi")
      (ok (holiday 2025 2 26) "Maha Shivaratri 2025, chosen for Delhi")
      (ok (holiday 2024 10 31) "Diwali 2024 per the O.M. (item 2)")
      (ng (holiday 2024 11 1))
      (ok (holiday 2025 10 20) "Diwali 2025")
      (ng (holiday 2025 10 21))
      (ok (holiday 2024 4 11) "Id-ul-Fitr 2024 per the O.M., not the tabular 04-10 (item 3)")
      (ng (holiday 2024 4 10))
      (ok (holiday 2027 3 23) "Holi 2027 per O.M. 12/2/2023-JCA of 16.07.2026")
      (ok (holiday 2027 4 19) "Mahavir Jayanti 2027")
      (ok (holiday 2026 4 14) "O.M. 12/4/2020-JCA of 09.04.2026")
      (ok (holiday 2016 7 7) "Id-ul-Fitr 2016 moved by O.M. of 05.07.2016")
      (ng (holiday 2016 7 6))
      (ok (holiday 2018 8 22) "Id-ul-Zuha 2018: the 14.08 move was withdrawn on 20.08")
      (ng (holiday 2018 8 23))
      (ok (holiday 2023 9 8) "G-20 closure of the Delhi offices")
      (ok (holiday 2010 10 14) "Commonwealth Games closing day")
      (ng (holiday 2024 1 22) "the half-day closing is not a holiday")
      (ng (holiday 2024 4 13) "restricted holidays are not office closures")
      (ok (holiday-p (india-holidays-calendar :year 2024 :restricted t) (make-date 2024 4 13))))))

(deftest in-provisional-and-estimated-years
  (ng (in-provisional-year-p 2027))
  (ok (in-provisional-year-p 2028))
  (ok (eq :primary (in-confidence 2002)))
  (ok (eq :primary (in-confidence 2027)))
  (ok (eq :estimated (in-confidence 2005)) "only the 14 April O.M. of 2005 was found")
  (ok (eq :estimated (in-confidence 2001)))
  (ok (eq :provisional (in-confidence 2028)))
  (ok (in-estimated-year-p 2006))
  (ng (in-estimated-year-p 2007))
  (let ((in (find-calendar "IN")))
    (ok (holiday-p in (make-date 2005 4 14)) "O.M. 12/5/2005-JCA")
    (ok (holiday-p in (eid-al-fitr 2005)) "2005 Id-ul-Fitr is a tabular estimate")
    (ok (holiday-p in (eid-al-fitr 2030)) "provisional Id-ul-Fitr")
    (ng (holiday-p in (make-date 2030 10 26)) "no Diwali estimate in provisional years")))

(deftest in-decree-rows-carry-issued-and-published
  "Bitemporal step 1 (#93): every DoPT O.M. block and row has :ISSUED and
:PUBLISHED, each a date with its citation (:ISSUED-URI, :PUBLISHED-URI) or
NIL with a :DATES-NOTE saying why."
  (let ((rows (in-decree-rows)))
    (ok (< 1000 (length rows)))
    (dolist (row rows)
      (let ((label (format nil "~s" (or (getf row :date) (getf row :authority)))))
        (dolist (key '(:issued :published))
          (ok (member key row) (format nil "~a has ~s" label key))
          (if (getf row key)
              (ok (getf row (if (eq key :issued) :issued-uri :published-uri))
                  (format nil "~a ~s cited" label key))
              (ok (getf row :dates-note) (format nil "~a ~s NIL with a note" label key))))))))

;;; --- Bangladesh and Pakistan (#47) ----------------------------------------

(defparameter *bd-holiday-gold* (load-holiday-gold "BD"))

(defparameter *bd-secondary-holiday-gold*
  (read-data-form (data-path "tests/bd-secondary-holiday-gold.sexp")))

(defparameter *pk-holiday-gold* (load-holiday-gold "PK"))

(defparameter *pk-secondary-holiday-gold*
  (read-data-form (data-path "tests/pk-secondary-holiday-gold.sexp")))

(deftest bd-holiday-gold-fixture-shape
  (%check-holiday-gold-shape *bd-holiday-gold* "BD" :from 2013)
  (ok (getf *bd-holiday-gold* :weekends) "Friday–Saturday eras"))

(deftest bd-registered-calendar-matches-gold
  "find-calendar \"BD\" holds the general and executive-order days of every
Ministry of Public Administration list 2013–2027 with its amendments, on the
Friday–Saturday weekend, the working Saturdays of 2016, 2025 and 2026, and
the fixed days and tabular estimates of 2028–2040."
  (let ((bd (find-calendar "BD")))
    (%report-holiday-gold "BD" (%holiday-gold-mismatches *bd-holiday-gold* (constantly bd)))))

(deftest bd-year-calendars-match-gold
  (%report-holiday-gold "BD :year"
                        (%holiday-gold-mismatches *bd-holiday-gold*
                                                  (lambda (y) (bangladesh-holidays-calendar :year y)))))

(deftest bd-country-calendar-matches-gold
  (let ((bd (country-calendar "BD")))
    (ok (eq :normative (calendar-provenance bd)))
    (%report-holiday-gold "country-calendar BD"
                          (%holiday-gold-mismatches *bd-holiday-gold* (constantly bd)))))

(deftest bd-secondary-gold-2002-2012-lower-confidence
  "LOWER CONFIDENCE. 2002–2008 and 2010–2012 against the bank-holiday lists
Bangladesh Bank circulated and news; 2009 has no list."
  (let ((gold *bd-secondary-holiday-gold*))
    (ok (string= "BD" (getf gold :country)))
    (ok (eq :secondary (getf gold :confidence)))
    (ok (equal '(2009) (getf gold :gaps)))
    (%report-holiday-gold "BD 2002-2012 (secondary sources)"
                          (%holiday-gold-mismatches gold (constantly (find-calendar "BD"))))
    (%report-holiday-gold "BD :year 2002-2012 (secondary sources)"
                          (%holiday-gold-mismatches gold (lambda (y) (bangladesh-holidays-calendar :year y))))))

(deftest bd-issue-47-days
  (let ((bd (find-calendar "BD")))
    (flet ((holiday (y m d) (holiday-p bd (make-date y m d)))
           (business (y m d) (business-day-p bd (make-date y m d))))
      (ng (holiday 2025 3 17) "17 March cancelled (Cabinet Division, 16 Oct 2024)")
      (ng (holiday 2025 8 15) "15 August absent from the 2025 list")
      (ng (holiday 2024 8 15) "15 August 2024 cancelled by MoPA, 13 Aug 2024")
      (ok (holiday 2023 8 15))
      (ok (holiday 2024 3 17) "17 March to 2024")
      (ok (holiday 2010 3 17) "17 March restored in the 2010 list")
      (ng (holiday 2008 3 17) "not in the 2008 list")
      (ok (holiday 2025 8 5) "July Mass Uprising Day from 2025")
      (ng (holiday 2023 8 5) "not a holiday before 2025")
      (ok (holiday 2026 11 7) "7 November from 2026 (MoPA, 7 Oct 2026)")
      (ok (holiday 2025 3 31) "Eid-ul-Fitr 2025, general")
      (ok (holiday 2025 4 2) "executive-order Eid days")
      (ok (holiday 2025 4 3) "extra Eid day, MoPA 23 Mar 2025")
      (ok (holiday 2025 10 2) "Bijoya Dashami")
      (ok (holiday 2025 9 6) "Eid-e-Milad moved to 6 Sep")
      (ng (holiday 2025 9 5))
      (ok (holiday 2024 1 7) "election day 2024")
      (ng (holiday 2025 4 13) "Chaitra Sankranti: hill districts only")
      (ok (business 2025 5 17) "working Saturday (MoPA, 7 May 2025)")
      (ng (business 2025 5 10) "Saturday weekend")
      (ng (business 2024 4 19) "Friday weekend")
      (ok (business 2004 5 8) "Saturday 2004: Friday-only weekend 2001-11-10 to 2005-09-08"))))

(deftest bd-provisional-years-and-confidence
  (ng (bd-provisional-year-p 2027))
  (ok (bd-provisional-year-p 2028))
  (ok (eq :primary (bd-confidence 2013)))
  (ok (eq :secondary (bd-confidence 2010)))
  (ok (eq :estimated (bd-confidence 2009)))
  (ok (eq :provisional (bd-confidence 2030)))
  (ok (equal (mapcar #'date-rd (list (make-date 2032 1 9) (make-date 2032 12 31)))
             (mapcar #'date-rd (bd-jumatul-bida-estimates 2032)))
      "tabular Eid-ul-Fitr 2033-01-03: the second Jumatul Bida of 2032"))

(deftest pk-holiday-gold-fixture-shape
  (%check-holiday-gold-shape *pk-holiday-gold* "PK" :from 2022))

(deftest pk-registered-calendar-matches-gold
  "find-calendar \"PK\" holds the federal holidays of the Cabinet Division
circulars and moon-sighting notifications 2022–2026, and the fixed days and
tabular estimates of 2027–2040."
  (let ((pk (find-calendar "PK")))
    (%report-holiday-gold "PK" (%holiday-gold-mismatches *pk-holiday-gold* (constantly pk)))))

(deftest pk-year-calendars-match-gold
  (%report-holiday-gold "PK :year"
                        (%holiday-gold-mismatches *pk-holiday-gold*
                                                  (lambda (y) (pakistan-holidays-calendar :year y)))))

(deftest pk-country-calendar-matches-gold
  (let ((pk (country-calendar "PK")))
    (ok (eq :normative (calendar-provenance pk)))
    (%report-holiday-gold "country-calendar PK"
                          (%holiday-gold-mismatches *pk-holiday-gold* (constantly pk)))))

(deftest pk-secondary-gold-2004-2021-lower-confidence
  "LOWER CONFIDENCE. 2004–2021 against the State Bank of Pakistan closure
circulars, PID releases and news, with the weekend of each era."
  (let ((gold *pk-secondary-holiday-gold*))
    (ok (string= "PK" (getf gold :country)))
    (ok (eq :secondary (getf gold :confidence)))
    (%report-holiday-gold "PK 2004-2021 (secondary sources)"
                          (%holiday-gold-mismatches gold (constantly (find-calendar "PK"))))
    (%report-holiday-gold "PK :year 2004-2021 (secondary sources)"
                          (%holiday-gold-mismatches gold (lambda (y) (pakistan-holidays-calendar :year y))))))

(deftest pk-issue-47-days
  (let ((pk (find-calendar "PK")))
    (flet ((holiday (y m d) (holiday-p pk (make-date y m d))))
      (ok (holiday 2022 11 9) "Iqbal Day restored (Cabinet Division, 8 Nov 2022)")
      (ng (holiday 2015 11 9) "cancelled by the MoI circular of 4 Nov 2015")
      (ng (holiday 2021 11 9))
      (ok (holiday 2014 11 9))
      (ok (holiday 2024 5 28) "Youm-e-Takbeer 2024 (press release, 27 May 2024)")
      (ok (holiday 2025 5 28) "Youm-e-Takbeer in the 2025 list")
      (ng (holiday 2023 5 28))
      (ok (holiday 2026 6 25) "Ashura 9 Muharram")
      (ok (holiday 2026 6 26) "Ashura 10 Muharram")
      (ok (holiday 2026 3 20) "Eid-ul-Fitr 2026 as notified (20–21 Mar)")
      (ng (holiday 2026 3 22) "the list had 21–23 Mar; the notification 20–21 Mar")
      (ok (holiday 2024 2 8) "ECP: general election 2024")
      (ng (holiday 2024 4 13) "six-day-week offices only")
      (ok (business-day-p pk (make-date 2011 10 8)) "Saturday working before 2011-10-15")
      (ng (business-day-p pk (make-date 2011 10 15))))))

(deftest pk-provisional-years-and-confidence
  (ng (pk-provisional-year-p 2026))
  (ok (pk-provisional-year-p 2027))
  (ok (eq :primary (pk-confidence 2022)))
  (ok (eq :secondary (pk-confidence 2015)))
  (ok (eq :estimated (pk-confidence 2002)))
  (ok (eq :provisional (pk-confidence 2027))))

(deftest bd-pk-decree-rows-carry-issued-and-published
  "Bitemporal step 1 (#93): every block and row of data/bd and data/pk has
:ISSUED and :PUBLISHED, each a date with its citation or NIL with a
:DATES-NOTE."
  (let ((rows (append (bd-decree-rows) (pk-decree-rows))))
    (ok (< 900 (length rows)))
    (dolist (row rows)
      (let ((label (format nil "~a ~s" (getf row :calendar) (or (getf row :date) (getf row :authority)))))
        (dolist (key '(:issued :published))
          (ok (member key row) (format nil "~a has ~s" label key))
          (if (getf row key)
              (ok (getf row (if (eq key :issued) :issued-uri :published-uri))
                  (format nil "~a ~s cited" label key))
              (ok (getf row :dates-note) (format nil "~a ~s NIL with a note" label key))))))))
