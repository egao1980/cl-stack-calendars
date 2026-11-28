;;;; TWSE cash (MIC XTAI). Holidays and Saturday sessions: calendars/XTAI.sexp.
(
 :mic "XTAI"
 :name "Taiwan Stock Exchange"
 :zone "Asia/Taipei"
 :calendar "XTAI"
 :kind :equity
 :source "TWSE 60th-anniversary book; TWSE Annual Report 2001"
 :eras (
   (:from (1962 2 9) :to (2000 12 30)
    :sessions ((:open (9 0) :close (12 0)))
    :authority "TWSE regular session 09:00-12:00 through 2000; trading Saturdays (alternate Saturdays in 2000) also 09:00-12:00 ('自87年4月4日起將星期六交易時間延長至中午12時') https://www.twse.com.tw/staticFiles/product/publication/twse60/html/178/")
   (:from (2001 1 2)
    :sessions ((:open (9 0) :close (13 30)))
    :authority "TWSE Annual Report 2001: '自九十年元月二日起延長證券市場交易時間為每週一至週五上午九時至下午一時三十分' https://wwwc.twse.com.tw/downloads/zh/about/company/Annual/90/10.pdf ; 60th book chronology: Saturday trading ended https://www.twse.com.tw/staticFiles/product/publication/twse60/html/408/")))
