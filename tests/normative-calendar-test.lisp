(in-package #:cl-stack-calendars/tests)

(deftest japan-equinox-and-furikae
  "春分の日 at Tokyo; 振替 when Sunday."
  (let ((cal (japan-holidays-calendar)))
    (ok (holiday-p cal (make-date 2026 3 20)))
    (ok (holiday-p cal (make-date 2026 5 3)))
    (ok (holiday-p cal (make-date 2026 5 4)))
    (ok (holiday-p cal (make-date 2026 5 5)))
    ;; 2023-01-01 Sunday → 振替 1/2
    (ok (holiday-p cal (make-date 2023 1 1)))
    (ok (holiday-p cal (make-date 2023 1 2)))))

(deftest japan-sandwich-keiro-equinox-2015
  "国民の休日 between 敬老の日 and 秋分の日 (Art. 3(3))."
  (let ((cal (japan-holidays-calendar)))
    (ok (holiday-p cal (make-date 2015 9 21)))
    (ok (holiday-p cal (make-date 2015 9 22)))
    (ok (holiday-p cal (make-date 2015 9 23)))))

(deftest china-statutory-and-tiaoxiu-2026
  (let ((cal (china-holidays-calendar :year 2026)))
    (ok (holiday-p cal (make-date 2026 1 1)))
    (ok (holiday-p cal (make-date 2026 2 16))) ; 除夕
    (ok (holiday-p cal (make-date 2026 2 17))) ; 初一
    (ok (holiday-p cal (make-date 2026 2 15))) ; 调休
    (ok (holiday-p cal (make-date 2026 10 1)))
    (ok (holiday-p cal (make-date 2026 10 7)))
    (ok (business-day-p cal (make-date 2026 2 14))) ; 上班
    (ng (weekend-day-p cal (make-date 2026 2 14)))))

(deftest china-tiaoxiu-corpus-span
  "国办调休 notices encoded 1999–2026."
  (ok (cn-notice-for-year 1999))
  (ok (cn-notice-for-year 2008))            ; first 清明/端午/中秋 year
  (ok (cn-notice-for-year 2015))            ; 抗战胜利日国发明电
  (ok (cn-notice-for-year 2025))
  (ok (cn-notice-for-year 2026))
  (ok (>= (length (cn-transfer-notices)) 28)))

(deftest china-tiaoxiu-2008-qingming
  "国办发明电〔2007〕52号: 清明 4/4–6."
  (let ((cal (china-holidays-calendar :year 2008)))
    (ok (holiday-p cal (make-date 2008 4 4)))
    (ok (holiday-p cal (make-date 2008 4 5)))
    (ok (holiday-p cal (make-date 2008 4 6)))
    (ok (business-day-p cal (make-date 2008 2 2)))
    (ok (holiday-p cal (make-date 2008 2 6))))) ; 除夕 in window

(deftest china-tiaoxiu-2015-victory-day
  "国发明电〔2015〕1号: 9/3–5 off, 9/6 上班."
  (let ((cal (china-holidays-calendar :year 2015)))
    (ok (holiday-p cal (make-date 2015 9 3)))
    (ok (holiday-p cal (make-date 2015 9 4)))
    (ok (holiday-p cal (make-date 2015 9 5)))
    (ok (business-day-p cal (make-date 2015 9 6)))))

(deftest china-tiaoxiu-cross-year-2019-ny
  "2019元旦 window spans 2018-12-30..2019-01-01; 2018-12-29 上班."
  (let ((cal-18 (china-holidays-calendar :year 2018))
        (cal-19 (china-holidays-calendar :year 2019)))
    (ok (holiday-p cal-18 (make-date 2018 12 30)))
    (ok (business-day-p cal-18 (make-date 2018 12 29)))
    (ok (holiday-p cal-19 (make-date 2019 1 1)))))

(deftest china-tiaoxiu-2020-may-golden
  "国办发明电〔2019〕16号: 劳动节 5/1–5, 4/26+5/9 上班."
  (let ((cal (china-holidays-calendar :year 2020)))
    (ok (holiday-p cal (make-date 2020 5 1)))
    (ok (holiday-p cal (make-date 2020 5 5)))
    (ok (business-day-p cal (make-date 2020 4 26)))
    (ok (business-day-p cal (make-date 2020 5 9)))))

(deftest india-national-three
  (let ((cal (india-holidays-calendar)))
    (ok (holiday-p cal (make-date 2026 1 26)))
    (ok (holiday-p cal (make-date 2026 8 15)))
    (ok (holiday-p cal (make-date 2026 10 2)))
    (ok (holiday-p cal (make-date 2026 12 25)))))

(deftest germany-federal-common
  (let ((cal (germany-holidays-calendar)))
    (ok (holiday-p cal (make-date 2026 10 3)))
    (ok (holiday-p cal (make-date 2026 5 1)))
    (ok (holiday-p cal (make-date 2026 4 3)))   ; Karfreitag
    (ok (holiday-p cal (make-date 2026 4 6))))) ; Ostermontag

(deftest france-bastille
  (let ((cal (france-holidays-calendar)))
    (ok (holiday-p cal (make-date 2026 7 14)))
    (ok (holiday-p cal (make-date 2026 5 8)))))

(deftest sweden-midsummer-and-all-saints
  (let ((cal (sweden-holidays-calendar)))
    (ok (holiday-p cal (make-date 2026 6 20)))
    (ok (holiday-p cal (make-date 2026 10 31)))))

(deftest research-window-ph-independence-eras
  "PH research window from 1946: 4 Jul then 12 Jun."
  (let ((cal (philippines-holidays-calendar)))
    (ok (holiday-p cal (make-date 1950 7 4)))
    (ng (holiday-p cal (make-date 1950 6 12)))
    (ok (holiday-p cal (make-date 1962 6 12)))
    (ng (holiday-p cal (make-date 1962 7 4)))))

(deftest research-window-za-pre-and-post-1994
  (let ((cal (south-africa-holidays-calendar)))
    (ok (holiday-p cal (make-date 1980 12 16))) ; Day of the Vow
    (ok (holiday-p cal (make-date 1980 4 6)))   ; Van Riebeeck's Day
    (ok (holiday-p cal (make-date 1995 12 16))) ; Reconciliation
    (ng (holiday-p cal (make-date 1995 4 6))))) ; Van Riebeeck abolished

(deftest brazil-consciencia-negra-from-2024
  (let ((cal (brazil-holidays-calendar)))
    (ng (holiday-p cal (make-date 2023 11 20)))
    (ok (holiday-p cal (make-date 2024 11 20)))
    (ok (holiday-p cal (make-date 1900 9 7)))))

(deftest indonesia-pancasila-from-2017
  (let ((cal (indonesia-holidays-calendar)))
    (ng (holiday-p cal (make-date 2016 6 1)))
    (ok (holiday-p cal (make-date 2017 6 1)))
    (ok (holiday-p cal (make-date 1946 8 17)))))

(deftest indonesia-cuti-bersama-corpus
  "SKB cuti bersama encoded 2002–2026."
  (ok (id-notice-for-year 2002))
  (ok (id-notice-for-year 2014))
  (ok (id-notice-for-year 2025))
  (ok (id-notice-for-year 2026))
  (ok (>= (length (id-cuti-bersama)) 25)))

(deftest indonesia-cuti-bersama-2025
  (let ((cal (indonesia-holidays-calendar :year 2025))
        (bare (indonesia-holidays-calendar)))
    (ok (holiday-p cal (make-date 2025 1 28)))
    (ok (holiday-p cal (make-date 2025 4 7)))
    (ng (holiday-p bare (make-date 2025 1 28)))))

(deftest korea-temporary-holidays-corpus
  (ok (kr-notice-for-year 2015))
  (ok (kr-notice-for-year 2024))
  (ok (kr-notice-for-year 2025))
  (ok (>= (length (kr-temporary-holidays)) 20)))

(deftest korea-temporary-holiday-2024-armed-forces
  "2024-10-01 임시공휴일 (국군의 날)."
  (let ((cal (south-korea-holidays-calendar :year 2024))
        (bare (south-korea-holidays-calendar)))
    (ok (holiday-p cal (make-date 2024 10 1)))
    (ng (holiday-p bare (make-date 2024 10 1)))
    (ok (holiday-p cal (make-date 2024 10 3))))) ; 개천절 still

(deftest gb-proclamations-corpus
  (ok (gb-proclamation-for-year 1995))
  (ok (gb-proclamation-for-year 2011))
  (ok (gb-proclamation-for-year 2022))
  (ok (gb-proclamation-for-year 2023))
  (ok (= (length (gb-proclamations)) 7)))

(deftest gb-platinum-jubilee-2022
  "Spring BH relocated May 30 → Jun 2; extra Jun 3."
  (let ((cal (uk-bank-holidays-calendar :year 2022))
        (bare (uk-bank-holidays-calendar)))
    (ng (holiday-p cal (make-date 2022 5 30)))
    (ok (holiday-p bare (make-date 2022 5 30)))
    (ok (holiday-p cal (make-date 2022 6 2)))
    (ok (holiday-p cal (make-date 2022 6 3)))
    (ng (holiday-p bare (make-date 2022 6 3)))))

(deftest gb-ve-day-2020-relocation
  "Early May BH May 4 → May 8 (VE Day 75)."
  (let ((cal (uk-bank-holidays-calendar :year 2020)))
    (ng (holiday-p cal (make-date 2020 5 4)))
    (ok (holiday-p cal (make-date 2020 5 8)))))

(deftest population-coverage-top-codes-normative
  "Largest countries should resolve to hand starters, not corpus."
  (dolist (code '("ID" "PK" "NG" "BR" "BD" "MX" "ET" "PH" "EG" "VN"
                  "CD" "TR" "IR" "TH" "KR" "US" "GB"))
    (let ((cal (find-calendar code :errorp nil)))
      (ok cal (format nil "~a registered" code))
      (ok (not (typep cal 'country-holiday-calendar))
          (format nil "~a normative" code)))))

(deftest eu27-all-normative
  "All EU-27 ISO codes have hand-maintained starters."
  (dolist (code '("AT" "BE" "BG" "CY" "CZ" "DE" "DK" "EE" "ES" "FI"
                  "FR" "GR" "HR" "HU" "IE" "IT" "LT" "LU" "LV" "MT"
                  "NL" "PL" "PT" "RO" "SE" "SI" "SK"))
    (let ((cal (find-calendar code :errorp nil)))
      (ok cal (format nil "~a registered" code))
      (ok (not (typep cal 'country-holiday-calendar))
          (format nil "~a normative" code)))))

(deftest eu-era-samples
  (let ((pl (poland-holidays-calendar))
        (pt (portugal-holidays-calendar))
        (fr (france-holidays-calendar))
        (dk (denmark-holidays-calendar))
        (hu (hungary-holidays-calendar))
        (hr (croatia-holidays-calendar))
        (nl (netherlands-holidays-calendar))
        (ie (ireland-holidays-calendar)))
    (ng (holiday-p pl (make-date 2010 1 6)))
    (ok (holiday-p pl (make-date 2011 1 6)))
    (ok (holiday-p pl (make-date 2025 12 24)))
    (ng (holiday-p pl (make-date 2024 12 24)))
    (ng (holiday-p pt (make-date 2014 10 5)))
    (ok (holiday-p pt (make-date 2016 10 5)))
    (ng (holiday-p fr (make-date 1970 5 8)))
    (ok (holiday-p fr (make-date 1982 5 8)))
    (ok (holiday-p dk (make-date 2023 5 5))) ; Store bededag 2023 = Easter+26
    (ng (holiday-p dk (make-date 2024 4 26))) ; abolished
    (ng (holiday-p hu (make-date 2016 3 25)))
    (ok (holiday-p hu (make-date 2017 4 14)))
    (ok (holiday-p hr (make-date 2018 6 25)))
    (ng (holiday-p hr (make-date 2020 6 25)))
    (ok (holiday-p hr (make-date 2020 5 30)))
    (ok (holiday-p nl (make-date 2013 4 30)))
    (ok (holiday-p nl (make-date 2014 4 26))) ; Sunday → Sat
    (ok (holiday-p ie (make-date 2023 2 6))))) ; Brigid Monday

(deftest next-gaps-skips-filled
  (let* ((gaps (next-normative-gaps 5))
         (codes (mapcar #'car gaps)))
    (ok (not (member "ID" codes :test #'string=)))
    (ok (not (member "BR" codes :test #'string=)))
    (ok (not (member "DE" codes :test #'string=)))
    (ok (not (member "RO" codes :test #'string=)))
    (ok (>= (civil-research-from-year "NG") 1960))
    (ok (= (civil-research-from-year "US") 1900))))
