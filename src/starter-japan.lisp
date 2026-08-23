(in-package #:cl-stack-calendars)

;;;; Japan — research window from 1900, with day-precise era transitions.
;;;;
;;;; Imperial 祝祭日: 休日ニ関スル件 (大正元年勅令19号 / 昭和2年勅令25号),
;;;; abolished 1948-07-20 when 国民の祝日に関する法律 took effect.
;;;;
;;;; Observance eras:
;;;;   Art. 3(2) 振替休日 — from 1973-04-12 (昭和48年法律第10号): Sunday → 翌日.
;;;;   Chain over consecutive 祝日 from 2007-01-01 (平成19年法律第5号).
;;;;   Art. 3(3) 国民の休日 — 昭和60年法律第103号 施行 1985-12-27; first GW 1986.
;;;;
;;;; Emperor / 年号 transitions (天長節・天皇誕生日・先帝祭):
;;;;   Meiji → Taisho 1912-07-30; Taisho → Showa 1926-12-25;
;;;;   Showa → Heisei 1989-01-08; Heisei → Reiwa 2019-05-01.
;;;;
;;;; Special years: 2019 即位 (天皇の即位の日等を定める法律);
;;;; 2020–2021 Olympic 特別措置 (海の日 / スポーツの日 / 山の日 moves).
;;;; 春分の日 / 秋分の日: astronomical equinox civil date at Tokyo (JST).

(define-calendar japan-holidays-calendar
    (:register "JP"
     :sandwich-holidays-p t
     :sandwich-from 1986
     :sandwich-authority "国民の祝日に関する法律第3条第3項（国民の休日・昭和60年法律第103号、施行1985-12-27）"
  :furikae-chain-p t
  :furikae-from (1973 4 12)
  :furikae-chain-from (2007 1 1))

  ;;; ========== Imperial 祝祭日 (to 1948-07-19) ==========

  (:fixed "元始祭" 1 3 :from 1900 :to (1948 7 19)
   :authority "休日ニ関スル件 — 元始祭（1月3日）")
  (:fixed "新年宴会" 1 5 :from 1900 :to (1948 7 19)
   :authority "休日ニ関スル件 — 新年宴会（1月5日）")
  (:fixed "孝明天皇祭" 1 30 :from 1900 :to (1912 7 29)
   :authority "年中祭日祝日ノ休暇日ヲ定ム / 休日ニ関スル件 — 孝明天皇祭（明治）")
  (:fixed "紀元節" 2 11 :from 1900 :to (1948 7 19)
   :authority "休日ニ関スル件 — 紀元節；1948廃止、1967建国記念の日として復活")
  (:computed "春季皇霊祭"
   (lambda (y) (spring-equinox-date y :location +tokyo+))
   :from 1900 :to (1948 7 19)
   :authority "休日ニ関スル件 — 春季皇霊祭（春分日）")
  (:fixed "神武天皇祭" 4 3 :from 1900 :to (1948 7 19)
   :authority "休日ニ関スル件 — 神武天皇祭（4月3日）")

  ;; 天長節 / 先帝祭 follow 年号 transitions at day precision.
  (:fixed "天長節" 11 3 :from 1900 :to (1912 7 29)
   :authority "休日ニ関スル件 — 天長節・明治天皇誕生日（11月3日）")
  (:fixed "明治天皇祭" 7 30 :from (1913 7 30) :to (1926 12 24)
   :authority "休日ニ関スル件（大正）— 明治天皇祭（7月30日）")
  (:fixed "天長節" 8 31 :from (1912 8 31) :to (1926 12 24)
   :authority "休日ニ関スル件（大正）— 天長節（8月31日）")
  (:fixed "天長節祝日" 10 31 :from (1913 10 31) :to (1926 12 24)
   :authority "大正2年勅令第259号 — 天長節祝日（10月31日）")
  (:fixed "天長節" 4 29 :from (1927 4 29) :to (1948 7 19)
   :authority "昭和2年勅令第25号 — 天長節（4月29日）")
  (:fixed "明治節" 11 3 :from (1927 11 3) :to (1948 7 19)
   :authority "昭和2年勅令第25号 — 明治節（11月3日）")
  (:fixed "大正天皇祭" 12 25 :from (1927 12 25) :to (1948 7 19)
   :authority "昭和2年勅令第25号 — 大正天皇祭（12月25日）")

  (:fixed "神嘗祭" 10 17 :from 1900 :to (1948 7 19)
   :authority "休日ニ関スル件 — 神嘗祭（10月17日）")
  (:computed "秋季皇霊祭"
   (lambda (y) (autumn-equinox-date y :location +tokyo+))
   :from 1900 :to (1948 7 19)
   :authority "休日ニ関スル件 — 秋季皇霊祭（秋分日）")
  (:fixed "新嘗祭" 11 23 :from 1900 :to (1948 7 19)
   :authority "休日ニ関スル件 — 新嘗祭（11月23日）")

  ;;; ========== 国民の祝日に関する法律 (from 1948-07-20) ==========
  ;;; 振替休日 Art. 3(2): :observed-from (1973 4 12)

  (:fixed "元日" 1 1 :from 1949
   :observed :jp-furikae :observed-from (1973 4 12)
   :authority "国民の祝日に関する法律第2条（元日）；施行1948-07-20 → 初回1949")
  (:fixed "成人の日" 1 15 :from 1949 :to 1999
   :observed :jp-furikae :observed-from (1973 4 12)
   :authority "国民の祝日に関する法律第2条（成人の日・1月15日）")
  (:nth-weekday "成人の日" 1 :monday 2 :from 2000
   :authority "平成10年改正・ハッピーマンデー（成人の日・1月第2月曜日）")

  (:fixed "建国記念の日" 2 11 :from 1967
   :observed :jp-furikae :observed-from (1973 4 12)
   :authority ("国民の祝日に関する法律第2条（建国記念の日）"
               "政令で定める日＝2月11日；旧紀元節"))

  ;; 天皇誕生日 — Showa / Heisei / Reiwa (2019 had none).
  (:fixed "天皇誕生日" 4 29 :from 1949 :to 1988
   :observed :jp-furikae :observed-from (1973 4 12)
   :authority "国民の祝日に関する法律第2条（天皇誕生日・昭和）；旧天長節")
  (:fixed "天皇誕生日" 12 23 :from 1989 :to 2018
   :observed :jp-furikae :observed-from (1973 4 12)
   :authority "国民の祝日に関する法律第2条（天皇誕生日・平成）")
  (:fixed "天皇誕生日" 2 23 :from 2020
   :observed :jp-furikae :observed-from (1973 4 12)
   :authority "国民の祝日に関する法律第2条（天皇誕生日・令和・2月23日）")

  (:computed "春分の日"
   (lambda (y) (spring-equinox-date y :location +tokyo+))
   :from 1949 :observed :jp-furikae :observed-from (1973 4 12)
   :authority "国民の祝日に関する法律第2条（春分の日）；国立天文台算定・閣議決定")

  (:fixed "みどりの日" 4 29 :from 1989 :to 2006
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（みどりの日・4月29日・〜平成18年）")
  (:fixed "昭和の日" 4 29 :from 2007
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（昭和の日）")

  (:fixed "憲法記念日" 5 3 :from 1949
   :observed :jp-furikae :observed-from (1973 4 12)
   :authority "国民の祝日に関する法律第2条（憲法記念日）")
  ;; 5/4: 国民の休日 via sandwich 1985–2006; statutory みどりの日 from 2007.
  (:fixed "みどりの日" 5 4 :from 2007
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（みどりの日・5月4日）")
  (:fixed "こどもの日" 5 5 :from 1949
   :observed :jp-furikae :observed-from (1973 4 12)
   :authority "国民の祝日に関する法律第2条（こどもの日）")

  ;; 2019 年号変更 — 天皇の即位の日等を定める法律（平成30年法律第83号）
  (:fixed "天皇の即位の日" 5 1 :from 2019 :to 2019
   :authority "天皇の即位の日等を定める法律 — 2019-05-01（即位）；GW中の国民の休日は Art.3(3)")
  (:fixed "即位礼正殿の儀の行われる日" 10 22 :from 2019 :to 2019
   :authority "天皇の即位の日等を定める法律 — 2019-10-22")
  ;; One-off 皇室儀礼 (内閣府 CSV names 結婚の儀 / 大喪の礼 / 即位礼正殿の儀)
  (:fixed "結婚の儀" 4 10 :from 1959 :to 1959
   :authority "皇太子明仁親王の結婚の儀 — 1959-04-10")
  (:fixed "大喪の礼" 2 24 :from 1989 :to 1989
   :authority "大喪の礼 — 1989-02-24（昭和天皇）")
  (:fixed "即位礼正殿の儀の行われる日" 11 12 :from 1990 :to 1990
   :authority "即位礼正殿の儀 — 1990-11-12（平成）")
  (:fixed "結婚の儀" 6 9 :from 1993 :to 1993
   :authority "皇太子徳仁親王の結婚の儀 — 1993-06-09")

  ;; 海の日 — Happy Monday; Olympic specials 2020–2021
  (:fixed "海の日" 7 20 :from 1996 :to 2002
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（海の日・7月20日）")
  (:nth-weekday "海の日" 7 :monday 3 :from 2003 :to 2019
   :authority "ハッピーマンデー（海の日・7月第3月曜日）")
  (:fixed "海の日" 7 23 :from 2020 :to 2020
   :authority "五輪特別措置法 — 2020年海の日（7月23日）")
  (:fixed "海の日" 7 22 :from 2021 :to 2021
   :authority "五輪特別措置法 — 2021年海の日（7月22日）")
  (:nth-weekday "海の日" 7 :monday 3 :from 2022
   :authority "ハッピーマンデー（海の日・7月第3月曜日）")

  ;; 山の日 — Olympic specials 2020–2021
  (:fixed "山の日" 8 11 :from 2016 :to 2019
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（山の日）")
  (:fixed "山の日" 8 10 :from 2020 :to 2020
   :authority "五輪特別措置法 — 2020年山の日（8月10日）")
  (:fixed "山の日" 8 8 :from 2021 :to 2021
   :observed :jp-furikae
   :authority "五輪特別措置法 — 2021年山の日（8月8日）")
  (:fixed "山の日" 8 11 :from 2022
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（山の日）")

  (:fixed "敬老の日" 9 15 :from 1966 :to 2002
   :observed :jp-furikae :observed-from (1973 4 12)
   :authority "国民の祝日に関する法律第2条（敬老の日・9月15日）")
  (:nth-weekday "敬老の日" 9 :monday 3 :from 2003
   :authority "ハッピーマンデー（敬老の日・9月第3月曜日）")

  (:computed "秋分の日"
   (lambda (y) (autumn-equinox-date y :location +tokyo+))
   :from (1948 7 20) :observed :jp-furikae :observed-from (1973 4 12)
   :authority "国民の祝日に関する法律第2条（秋分の日）；国立天文台算定・閣議決定")

  ;; 体育の日 / スポーツの日 — Happy Monday; Olympic specials 2020–2021
  (:fixed "体育の日" 10 10 :from 1966 :to 1999
   :observed :jp-furikae :observed-from (1973 4 12)
   :authority "国民の祝日に関する法律第2条（体育の日・10月10日）")
  (:nth-weekday "体育の日" 10 :monday 2 :from 2000 :to 2019
   :authority "ハッピーマンデー（体育の日・10月第2月曜日）")
  (:fixed "スポーツの日" 7 24 :from 2020 :to 2020
   :authority "五輪特別措置法 — 2020年スポーツの日（7月24日）")
  (:fixed "スポーツの日" 7 23 :from 2021 :to 2021
   :authority "五輪特別措置法 — 2021年スポーツの日（7月23日）")
  (:nth-weekday "スポーツの日" 10 :monday 2 :from 2022
   :authority "国民の祝日に関する法律第2条（スポーツの日・10月第2月曜日）")

  (:fixed "文化の日" 11 3 :from (1948 7 20)
   :observed :jp-furikae :observed-from (1973 4 12)
   :authority "国民の祝日に関する法律第2条（文化の日）；旧明治節")
  (:fixed "勤労感謝の日" 11 23 :from (1948 7 20)
   :observed :jp-furikae :observed-from (1973 4 12)
   :authority "国民の祝日に関する法律第2条（勤労感謝の日）；旧新嘗祭"))

(defun japan-holidays-calendar ()
  (make-instance 'japan-holidays-calendar))
