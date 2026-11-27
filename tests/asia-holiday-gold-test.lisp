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
