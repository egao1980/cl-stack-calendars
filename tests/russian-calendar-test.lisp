(in-package #:cl-stack-calendars/tests)

(deftest ru-era-2005-replaces-nov7-with-nov4
  "ФЗ-201: с 2005 — 4 ноября вместо 7 ноября и 12 декабря."
  (let ((cal (russian-holidays-calendar)))
    (ok (holiday-p cal (make-date 2004 11 7)))
    (ok (holiday-p cal (make-date 2004 12 12)))
    (ng (holiday-p cal (make-date 2005 11 7)))
    (ng (holiday-p cal (make-date 2005 12 12)))
    (ok (holiday-p cal (make-date 2005 11 4)))))

(deftest ru-era-2013-extends-january
  "ФЗ-35: с 2013 в каникулах 6 и 8 января."
  (let ((cal (russian-holidays-calendar)))
    (ng (holiday-p cal (make-date 2012 1 6)))
    (ng (holiday-p cal (make-date 2012 1 8)))
    (ok (holiday-p cal (make-date 2013 1 6)))
    (ok (holiday-p cal (make-date 2013 1 7)))
    (ok (holiday-p cal (make-date 2013 1 8)))))

(deftest ru-tk-112-may9-on-saturday
  "9 мая 2020 — суббота → перенос на понедельник 11 мая (ст. 112)."
  (let ((cal (russian-holidays-calendar)))
    (ok (holiday-p cal (make-date 2020 5 9)))
    (ok (holiday-p cal (make-date 2020 5 11)))
    (ng (business-day-p cal (make-date 2020 5 11)))))

(deftest ru-jan-block-no-automatic-tk-transfer
  "1–8 января не дают автоперенос ст. 112 — только постановление."
  (let ((cal (make-instance 'rule-calendar
               :name "jan-only"
               :rules (list (make-fixed-holiday-rule
                             :name "Новый год"
                             :month 1 :day 1
                             :observed :ru-tk-112-transfer
                             :authority "ТК РФ ст. 112")))))
    ;; 2022-01-01 Saturday — without exception would add Monday 3rd
    (ok (holiday-p cal (make-date 2022 1 1)))
    (ng (holiday-p cal (make-date 2022 1 3)))))

(deftest ru-decree-2026-long-new-year
  "Постановление № 1466: 3→9 янв, 4 янв→31 дек."
  (let ((cal (russian-holidays-calendar :year 2026)))
    (ok (holiday-p cal (make-date 2026 1 9)))
    (ok (holiday-p cal (make-date 2026 12 31)))
    ;; FROM weekends become working (override), but 3–4 Jan remain holidays
    (ok (holiday-p cal (make-date 2026 1 3)))
    (ng (weekend-day-p cal (make-date 2026 1 3)))
    (ng (business-day-p cal (make-date 2026 1 3)))))

(deftest ru-decree-2024-compensatory-saturday
  "Постановление № 1314: с 27 апреля на 29 апреля — работа в субботу 27.04."
  (let ((cal (russian-holidays-calendar :year 2024)))
    (ok (holiday-p cal (make-date 2024 4 29)))
    (ok (business-day-p cal (make-date 2024 4 27)))
    (ng (weekend-day-p cal (make-date 2024 4 27)))))

(deftest ru-decree-2023-pre-2024
  "Постановление № 1505 (до 2024): 1 янв → 24 фев, 8 янв → 8 мая."
  (let ((cal (russian-holidays-calendar :year 2023)))
    (ok (holiday-p cal (make-date 2023 2 24)))
    (ok (holiday-p cal (make-date 2023 5 8)))
    (ok (ru-decree-for-year 2023))
    (ok (ru-decree-for-year 2014))
    (ok (ru-decree-for-year 1991))
    (ng (ru-decree-for-year 2004))
    (ng (ru-decree-for-year 1998))))

(deftest ru-decree-2018-long-may
  "Постановление № 1250: 28 апр → 30 апр (работа в субботу)."
  (let ((cal (russian-holidays-calendar :year 2018)))
    (ok (holiday-p cal (make-date 2018 4 30)))
    (ok (business-day-p cal (make-date 2018 4 28)))
    (ok (holiday-p cal (make-date 2018 3 9)))))

(deftest ru-decree-corpus-span
  "Discretionary acts encoded from 1991 through current horizon."
  (ok (ru-decree-for-year 1991))
  (ok (ru-decree-for-year 2000))            ; ФЗ-217, not a постановление
  (ok (ru-decree-for-year 2005))
  (ok (ru-decree-for-year 2012))
  (ok (ru-decree-for-year 2026))
  (ok (>= (length (ru-transfer-decrees)) 30)))

(deftest ru-decree-1992-january
  "ПП № 1: 4 янв → 6 янв."
  (let ((cal (russian-holidays-calendar :year 1992)))
    (ok (holiday-p cal (make-date 1992 1 6)))
    (ok (business-day-p cal (make-date 1992 1 4)))))

(deftest ru-decree-2000-federal-law
  "ФЗ-217: 6 мая → 8 мая."
  (let ((cal (russian-holidays-calendar :year 2000)))
    (ok (holiday-p cal (make-date 2000 5 8)))
    (ok (business-day-p cal (make-date 2000 5 6)))))

(deftest ru-decree-2005-may-bridge
  "ПП № 262: 14 мая → 10 мая."
  (let ((cal (russian-holidays-calendar :year 2005)))
    (ok (holiday-p cal (make-date 2005 5 10)))
    (ok (business-day-p cal (make-date 2005 5 14)))))

(deftest ru-decree-2012-amended-may
  "ПП № 581 ред. № 201: 5 мая → 7 мая, 12 мая → 8 мая."
  (let ((cal (russian-holidays-calendar :year 2012)))
    (ok (holiday-p cal (make-date 2012 5 7)))
    (ok (holiday-p cal (make-date 2012 5 8)))
    (ok (business-day-p cal (make-date 2012 5 5)))
    (ok (business-day-p cal (make-date 2012 5 12)))))

(deftest ru-decree-cross-year-1993-1994
  "ПП № 1317: 4 янв 1994 → 31 дек 1993 (touches both years)."
  (let ((cal-93 (russian-holidays-calendar :year 1993))
        (cal-94 (russian-holidays-calendar :year 1994)))
    (ok (holiday-p cal-93 (make-date 1993 12 31)))
    (ok (business-day-p cal-94 (make-date 1994 1 4)))
    (ok (holiday-p cal-94 (make-date 1994 3 7)))))

(deftest ussr-victory-day-from-1965
  (let ((cal (ussr-holidays-calendar)))
    (ng (holiday-p cal (make-date 1964 5 9)))
    (ok (holiday-p cal (make-date 1965 5 9)))
    (ok (holiday-p cal (make-date 1980 11 7)))
    (ok (holiday-p cal (make-date 1980 10 7))))) ; Constitution Day 1978+
