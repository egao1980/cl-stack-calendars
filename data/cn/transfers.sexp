;;;; Annual 国务院办公厅 调休 notices (国办发明电).
;;;; WORKING days are weekends that are 上班; TRANSFERS' TO dates are extra
;;;; days off beyond the statutory 放假办法 list. FROM may be NIL when the
;;;; notice only lists 上班 without a paired FROM→TO phrase.
;;;;
;;;; Verified against www.gov.cn texts.

(
 (:year 2026
  :authority "国办发明电〔2025〕7号"
  :uri "https://www.gov.cn/zhengce/content/202511/content_7047090.htm"
  :working ((2026 1 4) (2026 2 14) (2026 2 28) (2026 5 9) (2026 9 20) (2026 10 10))
  :transfers (;; 元旦: 1–3 off; statutory 1/1 → extra 1/2, 1/3
              (nil (2026 1 2) "元旦调休")
              (nil (2026 1 3) "元旦调休")
              ;; 春节: 2/15–23; statutory 除夕+初一–初三 = 2/16–19
              (nil (2026 2 15) "春节调休")
              (nil (2026 2 20) "春节调休")
              (nil (2026 2 21) "春节调休")
              (nil (2026 2 22) "春节调休")
              (nil (2026 2 23) "春节调休")
              ;; 清明: 4/4–6; statutory 4/5
              (nil (2026 4 4) "清明调休")
              (nil (2026 4 6) "清明调休")
              ;; 劳动节: 5/1–5; statutory 5/1–2
              (nil (2026 5 3) "劳动节调休")
              (nil (2026 5 4) "劳动节调休")
              (nil (2026 5 5) "劳动节调休")
              ;; 端午: 6/19–21; statutory 6/19
              (nil (2026 6 20) "端午调休")
              (nil (2026 6 21) "端午调休")
              ;; 中秋: 9/25–27; statutory 9/25
              (nil (2026 9 26) "中秋调休")
              (nil (2026 9 27) "中秋调休")
              ;; 国庆: 10/1–7; statutory 10/1–3
              (nil (2026 10 4) "国庆调休")
              (nil (2026 10 5) "国庆调休")
              (nil (2026 10 6) "国庆调休")
              (nil (2026 10 7) "国庆调休")))
)
