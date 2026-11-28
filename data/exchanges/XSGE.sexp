;;;; SHFE — base-metals template (copper / aluminium night to 01:00). Holidays: calendars/XSGE.sexp.
;;;; The night leg (21:00, previous evening) belongs to the next trading day (:labeled-by :close).
(
 :mic "XSGE"
 :name "Shanghai Futures Exchange"
 :zone "Asia/Shanghai"
 :calendar "XSGE"
 :kind :commodities
 :source "SHFE trading-hours table; SHFE notices 2013-11-25 (base-metals night session), 2013-06-07 (no night session before a holiday), 2020-02-02 / 2020-04-24 (COVID-19 suspension)"
 :eras (
   (:from (1999 1 4) :to (2013 12 20)
    :sessions (
               (:open (9 0) :close (10 15))
               (:open (10 30) :close (11 30))
               (:open (13 30) :close (15 0)))
    :authority "SHFE day session 09:00-10:15 / 10:30-11:30 / 13:30-15:00 https://www.shfe.com.cn/services/calenderandholidays/tradinghours/ (pre-2013 day hours not re-sourced). Base metals had no night session before the evening of 2013-12-20.")
   (:from (2013 12 23)
    :sessions ((:open (21 0) :close (1 0) :overnight t :labeled-by :close)
               (:open (9 0) :close (10 15))
               (:open (10 30) :close (11 30))
               (:open (13 30) :close (15 0)))
    :authority "Base-metals night session 21:00-01:00 from the evening of 2013-12-20 (first labelled trading day 2013-12-23): SHFE notice https://www.shfe.com.cn/publicnotice/notice/201311/t20131125_790028.html ; day session as before"))
 :late-open-rules (
   (:kind :after-weekday-closure :open (9 0) :regular t :overnight nil :from (2013 12 23)
    :authority "No night session on the evening before a statutory holiday (法定节假日(不包含双休日)前第一个工作日的连续交易不再交易): SHFE notice https://www.shfe.com.cn/publicnotice/notice/201306/t20130607_789661.html , repeated in every yearly 休市安排 notice. The first trading day after a weekday holiday has the day session only.")
   (:kind :every-day :open (9 0) :regular t :overnight nil :from (2020 2 3) :to (2020 5 6)
    :authority "COVID-19: night sessions suspended from trading day 2020-02-03 (https://www.shfe.com.cn/publicnotice/notice/202002/t20200202_795584.html), resumed from the evening of 2020-05-06 (https://www.shfe.com.cn/publicnotice/notice/202004/t20200424_795871.html)")))
