(in-package #:cl-stack-calendars)

;;;; Japan — 国民の祝日に関する法律（昭和23年法律第178号）.
;;;; Observance: Art. 3(2) 振替休日 (:jp-furikae, Sunday only);
;;;; Art. 3(3) 国民の休日 (:sandwich-holidays-p).
;;;; 春分の日 / 秋分の日: astronomical equinox civil date at Tokyo (JST).

(define-calendar japan-holidays-calendar
    (:register "JP"
     :sandwich-holidays-p t
     :sandwich-authority "国民の祝日に関する法律第3条第3項（国民の休日）")
  (:fixed "元日" 1 1 :from 1948
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（元日）")
  (:fixed "成人の日" 1 15 :from 1948 :to 1999
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（成人の日・1月15日）")
  (:nth-weekday "成人の日" 1 :monday 2 :from 2000
   :authority "平成10年改正・ハッピーマンデー（成人の日・1月第2月曜日）")
  (:fixed "建国記念の日" 2 11 :from 1967
   :observed :jp-furikae
   :authority ("国民の祝日に関する法律第2条（建国記念の日）"
               "政令で定める日＝2月11日"))
  (:fixed "天皇誕生日" 12 23 :from 1989 :to 2018
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（天皇誕生日・平成）")
  (:fixed "天皇誕生日" 2 23 :from 2020
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（天皇誕生日・令和・2月23日）")
  (:computed "春分の日"
   (lambda (y) (spring-equinox-date y :location +tokyo+))
   :from 1948 :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（春分の日＝春分日）；国立天文台算定・閣議決定")
  (:fixed "天皇誕生日" 4 29 :from 1948 :to 1988
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（天皇誕生日・昭和）")
  (:fixed "みどりの日" 4 29 :from 1989 :to 2006
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（みどりの日・4月29日・〜平成18年）")
  (:fixed "昭和の日" 4 29 :from 2007
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（昭和の日）")
  (:fixed "憲法記念日" 5 3 :from 1948
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（憲法記念日）")
  (:fixed "みどりの日" 5 4 :from 2007
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（みどりの日・5月4日）")
  (:fixed "こどもの日" 5 5 :from 1948
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（こどもの日）")
  (:fixed "海の日" 7 20 :from 1996 :to 2002
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（海の日・7月20日）")
  (:nth-weekday "海の日" 7 :monday 3 :from 2003
   :authority "ハッピーマンデー（海の日・7月第3月曜日）")
  (:fixed "山の日" 8 11 :from 2016
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（山の日）")
  (:fixed "敬老の日" 9 15 :from 1966 :to 2002
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（敬老の日・9月15日）")
  (:nth-weekday "敬老の日" 9 :monday 3 :from 2003
   :authority "ハッピーマンデー（敬老の日・9月第3月曜日）")
  (:computed "秋分の日"
   (lambda (y) (autumn-equinox-date y :location +tokyo+))
   :from 1948 :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（秋分の日＝秋分日）；国立天文台算定・閣議決定")
  (:fixed "体育の日" 10 10 :from 1966 :to 1999
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（体育の日・10月10日）")
  (:nth-weekday "体育の日" 10 :monday 2 :from 2000 :to 2019
   :authority "ハッピーマンデー（体育の日・10月第2月曜日）")
  (:nth-weekday "スポーツの日" 10 :monday 2 :from 2020
   :authority "国民の祝日に関する法律第2条（スポーツの日・10月第2月曜日）")
  (:fixed "文化の日" 11 3 :from 1948
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（文化の日）")
  (:fixed "勤労感謝の日" 11 23 :from 1948
   :observed :jp-furikae
   :authority "国民の祝日に関する法律第2条（勤労感謝の日）"))

(defun japan-holidays-calendar ()
  (make-instance 'japan-holidays-calendar))
