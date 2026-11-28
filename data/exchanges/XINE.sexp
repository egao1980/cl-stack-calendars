;;;; INE crude oil (SC): night 21:00-02:30 (previous evening) + SHFE day session. Holidays: calendars/XINE.sexp.
(
 :mic "XINE"
 :name "Shanghai International Energy Exchange"
 :zone "Asia/Shanghai"
 :calendar "XINE"
 :kind :commodities
 :source "SHFE/INE trading-hours table (原油 21:00-02:30); INE notices"
 :eras (
   (:from (2018 3 26)
    :sessions ((:open (21 0) :close (2 30) :overnight t :labeled-by :close)
               (:open (9 0) :close (10 15))
               (:open (10 30) :close (11 30))
               (:open (13 30) :close (15 0)))
    :authority "INE crude oil night 21:00-02:30 (previous evening) + day session: https://www.shfe.com.cn/services/calenderandholidays/tradinghours/ (launch date 2018-03-26 not re-sourced)"))
 :late-open-rules (
   (:kind :every-day :open (9 0) :regular t :overnight nil :from (2018 3 26) :to (2018 3 26)
    :authority "Launch day 2018-03-26: trading started with the day session; the first night session was that evening (labelled 2018-03-27); not re-sourced")
   (:kind :after-weekday-closure :open (9 0) :regular t :overnight nil :from (2018 3 26)
    :authority "Same rule as SHFE: no night session on the evening before a statutory holiday; INE yearly 休市安排 notices on shfe.com.cn")
   (:kind :every-day :open (9 0) :regular t :overnight nil :from (2020 2 3) :to (2020 5 6)
    :authority "COVID-19 night-session suspension as SHFE; INE resumed night trading from the evening of 2020-05-06: https://www.shfe.com.cn/publicnotice/notice/202004/t20200424_795874.html")))
