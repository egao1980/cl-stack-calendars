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

(deftest japan-imperial-era-1900-1947
  "休日ニ関スル件 — research window from 1900; day-precise 年号 bounds."
  (let ((cal (japan-holidays-calendar)))
    (ok (holiday-p cal (make-date 1900 2 11)))  ; 紀元節
    (ok (holiday-p cal (make-date 1900 11 3)))  ; 天長節 Meiji
    (ok (holiday-p cal (make-date 1915 8 31)))  ; 天長節 Taisho
    (ok (holiday-p cal (make-date 1915 10 31))) ; 天長節祝日
    (ok (holiday-p cal (make-date 1930 4 29)))  ; 天長節 Showa
    (ok (holiday-p cal (make-date 1930 11 3)))  ; 明治節
    (ok (holiday-p cal (make-date 1948 2 11)))  ; still 紀元節 (law from Jul 20)
    (ng (holiday-p cal (make-date 1948 1 1)))   ; 元日 only from 1949
    (ok (holiday-p cal (make-date 1949 1 1)))
    (ng (holiday-p cal (make-date 1949 2 11)))  ; 紀元節 gone; 建国 from 1967
    (ok (holiday-p cal (make-date 1967 2 11)))
    (ng (holiday-p cal (make-date 1912 11 3)))  ; Meiji 天長節 ends Jul 29 1912
    (ok (holiday-p cal (make-date 1912 8 31))))) ; Taisho 天長節

(deftest japan-reiwa-accession-2019
  "天皇の即位の日等を定める法律 — 2019 GW + 即位礼."
  (let ((cal (japan-holidays-calendar)))
    (ok (holiday-p cal (make-date 2019 4 29))) ; 昭和の日
    (ok (holiday-p cal (make-date 2019 4 30))) ; 国民の休日 (sandwich)
    (ok (holiday-p cal (make-date 2019 5 1)))  ; 即位の日
    (ok (holiday-p cal (make-date 2019 5 2)))  ; 国民の休日 (sandwich)
    (ok (holiday-p cal (make-date 2019 5 3)))
    (ok (holiday-p cal (make-date 2019 5 4)))
    (ok (holiday-p cal (make-date 2019 5 5)))
    (ok (holiday-p cal (make-date 2019 5 6)))  ; 振替 (こども Sunday)
    (ok (holiday-p cal (make-date 2019 10 22)))
    (ng (holiday-p cal (make-date 2019 12 23))) ; no 天皇誕生日 in 2019
    (ng (holiday-p cal (make-date 2019 2 23)))))

(deftest japan-olympic-special-2020-2021
  (let ((cal (japan-holidays-calendar)))
    (ok (holiday-p cal (make-date 2020 7 23))) ; 海の日
    (ok (holiday-p cal (make-date 2020 7 24))) ; スポーツの日
    (ok (holiday-p cal (make-date 2020 8 10))) ; 山の日
    (ng (holiday-p cal (make-date 2020 7 20))) ; not 3rd Mon Jul 2020 (=20)
    (ok (holiday-p cal (make-date 2021 7 22)))
    (ok (holiday-p cal (make-date 2021 7 23)))
    (ok (holiday-p cal (make-date 2021 8 8)))
    (ok (holiday-p cal (make-date 2021 8 9)))  ; 振替
    (ok (holiday-p cal (make-date 2022 7 18))))) ; back to 3rd Mon

(deftest japan-furikae-from-1973
  "振替休日 Art. 3(2) from 昭和48年改正."
  (let ((cal (japan-holidays-calendar)))
    ;; 1972-01-01 Saturday — no 振替 yet
    (ok (holiday-p cal (make-date 1972 1 1)))
    (ng (holiday-p cal (make-date 1972 1 2)))
    ;; 1978-01-01 Sunday → 振替 1/2
    (ok (holiday-p cal (make-date 1978 1 1)))
    (ok (holiday-p cal (make-date 1978 1 2)))))

(deftest japan-sandwich-from-1985
  "国民の休日 Art. 3(3) from 昭和60年改正."
  (let ((cal (japan-holidays-calendar)))
    ;; 1984: 5/3 Thu + 5/5 Sat — mid 5/4 Fri is not yet 国民の休日
    (ok (holiday-p cal (make-date 1984 5 3)))
    (ng (holiday-p cal (make-date 1984 5 4)))
    ;; 1988: 5/3 Tue + 5/5 Thu → sandwich 5/4 Wed
    (ok (holiday-p cal (make-date 1988 5 3)))
    (ok (holiday-p cal (make-date 1988 5 4)))
    (ok (holiday-p cal (make-date 1988 5 5)))))

(deftest gb-bank-holidays-act-1871-eras
  "Bank Holidays Act 1871 → BFDA 1971 stagger."
  (let ((cal (uk-bank-holidays-calendar)))
    (ok (holiday-p cal (make-date 1950 4 10))) ; Easter Monday 1950
    (ok (holiday-p cal (make-date 1960 6 6)))  ; Whit Monday 1960 (Easter+50)
    (ng (holiday-p cal (make-date 1965 6 7)))  ; Whit gone; Spring BH instead
    (ok (holiday-p cal (make-date 1960 8 1)))  ; first Monday Aug 1960
    (ng (holiday-p cal (make-date 1965 8 2)))  ; first Mon Aug gone
    (ok (holiday-p cal (make-date 1965 8 30))) ; last Mon Aug 1965
    (ok (holiday-p cal (make-date 1900 12 25)))
    (ng (holiday-p cal (make-date 1970 1 1)))  ; NY from 1974
    (ok (holiday-p cal (make-date 1974 1 1)))))

(deftest germany-unity-day-eras
  (let ((cal (germany-holidays-calendar)))
    (ok (holiday-p cal (make-date 1980 6 17)))
    (ng (holiday-p cal (make-date 1980 10 3)))
    (ok (holiday-p cal (make-date 1990 10 3)))
    (ng (holiday-p cal (make-date 1991 6 17)))))

(deftest france-labour-armistice-eras
  (let ((cal (france-holidays-calendar)))
    (ng (holiday-p cal (make-date 1910 5 1)))
    (ok (holiday-p cal (make-date 1919 5 1)))
    (ng (holiday-p cal (make-date 1920 11 11)))
    (ok (holiday-p cal (make-date 1922 11 11)))))

(deftest fifty-million-plus-history-to-floor
  "≥50M normative starters reach civil research floor (no >5y earliest-:from gap)."
  (ok (null (major-history-gaps 50))))

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
    (ok (holiday-p cal (make-date 2026 12 25)))
    (ng (holiday-p cal (make-date 1948 1 26))) ; Republic Day from 1950
    (ok (holiday-p cal (make-date 1950 1 26)))
    (ok (holiday-p cal (eid-al-fitr 2026)))))

(deftest india-dopt-hindu-corpus
  (ok (in-dopt-for-year 2020))
  (ok (in-dopt-for-year 2024))
  (ok (in-dopt-for-year 2026))
  (ok (>= (length (in-dopt-holidays)) 7)))

(deftest india-dopt-diwali-2024
  (let ((cal (india-holidays-calendar :year 2024))
        (bare (india-holidays-calendar)))
    (ok (holiday-p cal (make-date 2024 11 1)))
    (ok (holiday-p cal (make-date 2024 3 25))) ; Holi
    (ng (holiday-p bare (make-date 2024 11 1)))))

(deftest twenty-million-plus-all-normative
  "Every ≥20M population code has a hand starter (not corpus)."
  (dolist (row (normative-coverage-by-population))
    (destructuring-bind (code pop name &key status) row
      (declare (ignore name))
      (when (>= pop 20)
        (ok (eq status :normative) (format nil "~a (≥~aM) normative" code pop))))))

(deftest twenty-million-samples
  (let ((mz (mozambique-holidays-calendar))
        (cl (chile-holidays-calendar))
        (kp (north-korea-holidays-calendar))
        (kz (kazakhstan-holidays-calendar)))
    (ok (holiday-p mz (make-date 1975 6 25)))
    (ok (holiday-p cl (make-date 2021 6 21))) ; Pueblos Indígenas
    (ng (holiday-p cl (make-date 2020 6 21)))
    (ok (holiday-p kp (make-date 1948 9 9)))
    (ok (holiday-p kz (make-date 1991 12 16)))))

(deftest colombia-emiliani-2025
  (let ((cal (colombia-holidays-calendar)))
    ;; Reyes 2025: Jan 6 is Monday → stays Jan 6
    (ok (holiday-p cal (make-date 2025 1 6)))
    ;; 2025 Jul 20 Sunday → Emiliani Monday Jul 21 is in puente corpus
    (ok (holiday-p (colombia-holidays-calendar :year 2025) (make-date 2025 7 21)))))

(deftest chile-bridge-2024
  (let ((cal (chile-holidays-calendar :year 2024))
        (bare (chile-holidays-calendar)))
    (ok (holiday-p cal (make-date 2024 9 20)))
    (ng (holiday-p bare (make-date 2024 9 20)))))

(deftest philippines-proclamation-2025
  (let ((cal (philippines-holidays-calendar :year 2025))
        (bare (philippines-holidays-calendar)))
    (ok (holiday-p cal (make-date 2025 4 11))) ; Holy Week bridge
    (ng (holiday-p bare (make-date 2025 4 11)))
    (ok (holiday-p cal (make-date 2025 12 26))) ; Rizal bridge
    (ng (holiday-p bare (make-date 2025 12 26)))))

(deftest thailand-songkran-2025
  (let ((cal (thailand-holidays-calendar :year 2025)))
    (ok (holiday-p cal (make-date 2025 4 12)))
    (ok (holiday-p cal (make-date 2025 4 16)))
    (ok (holiday-p cal (make-date 2025 4 13)))))

(deftest malaysia-bridge-2025
  (let ((cal (malaysia-holidays-calendar :year 2025)))
    (ok (holiday-p cal (make-date 2025 2 11)))
    (ok (holiday-p cal (make-date 2025 12 26)))))

(deftest next-gaps-skips-twenty-million
  (let* ((gaps (next-normative-gaps 5))
         (codes (mapcar #'car gaps)))
    (ok (not (member "MZ" codes :test #'string=)))
    (ok (not (member "CL" codes :test #'string=)))
    (ok (not (member "NP" codes :test #'string=))
        "≥20M tier filled — next gaps below 20M")))

(deftest population-order-all-normative
  "Every code in population-order.sexp has a hand starter (not corpus)."
  (dolist (row (normative-coverage-by-population))
    (destructuring-bind (code pop name &key status) row
      (declare (ignore pop name))
      (ok (eq status :normative) (format nil "~a normative" code)))))

(deftest small-country-samples
  (let ((gt (guatemala-holidays-calendar))
        (sn (senegal-holidays-calendar))
        (il (israel-holidays-calendar))
        (ch (switzerland-holidays-calendar))
        (hk (hong-kong-holidays-calendar)))
    (ok (holiday-p gt (make-date 2000 9 15)))
    (ok (holiday-p sn (make-date 1960 4 4)))
    (ok (holiday-p il (make-date 2024 4 23))) ; Passover 2024
    (ok (holiday-p ch (make-date 2000 8 1)))
    (ok (holiday-p hk (make-date 1997 7 1)))))

(deftest fifty-million-plus-all-normative
  "Every ≥50M population code has a hand starter (not corpus)."
  (dolist (row (normative-coverage-by-population))
    (destructuring-bind (code pop name &key status) row
      (declare (ignore name))
      (when (>= pop 50)
        (ok (eq status :normative) (format nil "~a (≥~aM) normative" code pop))))))

(deftest thirty-five-million-plus-all-normative
  "Every ≥35M population code has a hand starter (not corpus)."
  (dolist (row (normative-coverage-by-population))
    (destructuring-bind (code pop name &key status) row
      (declare (ignore name))
      (when (>= pop 35)
        (ok (eq status :normative) (format nil "~a (≥~aM) normative" code pop))))))

(deftest sudan-iraq-angola-uzbekistan-samples
  (let ((sd (sudan-holidays-calendar))
        (iq (iraq-holidays-calendar))
        (ao (angola-holidays-calendar))
        (uz (uzbekistan-holidays-calendar))
        (af (afghanistan-holidays-calendar)))
    (ok (holiday-p sd (make-date 1956 1 1)))
    (ok (holiday-p sd (make-date 2019 12 19)))
    (ng (holiday-p sd (make-date 2018 12 19)))
    (ok (holiday-p iq (make-date 1932 10 3)))
    (ok (holiday-p iq (make-date 2018 12 10)))
    (ok (holiday-p ao (make-date 1975 11 11)))
    (ok (holiday-p ao (make-date 2002 4 4)))
    (ng (holiday-p ao (make-date 2018 3 23)))
    (ok (holiday-p ao (make-date 2019 3 23)))
    (ok (holiday-p uz (make-date 1991 9 1)))
    (ok (holiday-p uz (make-date 1991 3 21)))
    (ok (holiday-p af (make-date 1919 8 19)))
    (ok (holiday-p af (make-date 2020 3 21)))
    (ng (holiday-p af (make-date 2022 3 21)))))

(deftest vietnam-hung-kings-and-national-day-era
  (let* ((cal (vietnam-holidays-calendar))
         (hk-06 (chinese-lunar-date 2006 3 10 :location +beijing+))
         (hk-07 (chinese-lunar-date 2007 3 10 :location +beijing+)))
    (ng (holiday-p cal hk-06))
    (ok (holiday-p cal hk-07))
    (ng (holiday-p cal (make-date 2020 9 3)))
    (ok (holiday-p cal (make-date 2021 9 3)))))

(deftest philippines-ninoy-and-edsa
  (let ((cal (philippines-holidays-calendar)))
    (ng (holiday-p cal (make-date 2003 8 21)))
    (ok (holiday-p cal (make-date 2004 8 21)))
    (ok (holiday-p cal (make-date 1986 2 25)))))

(deftest ethiopia-fasika-patriots-enkutatash
  (let ((cal (ethiopia-holidays-calendar)))
    (ok (holiday-p cal (make-date 2024 5 5)))   ; Fasika 2024 = Patriots' Day too
    (ok (holiday-p cal (make-date 2024 9 12)))  ; Enkutatash in Gregorian leap year
    (ok (holiday-p cal (make-date 2023 9 11)))  ; Enkutatash non-leap
    (ok (holiday-p cal (make-date 2024 3 2))))) ; Adwa

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
    (ok (not (member "GT" codes :test #'string=)))
    (ok (not (member "IL" codes :test #'string=)))
    (ok (>= (civil-research-from-year "NG") 1960))
    (ok (= (civil-research-from-year "US") 1900))))
