;;;; Korea Exchange KOSPI cash (MIC XKRX). Holidays: calendars/XKRX.sexp.
;;;; One-day hours (CSAT day) are :sessions rows of the calendar's notices.
(
 :mic "XKRX"
 :name "Korea Exchange"
 :zone "Asia/Seoul"
 :calendar "XKRX"
 :source "Global KRX Trading Hours page; KIND market notices; 2016-08-01 close extension"
 :eras (
   (:from (1990 1 3) :to (2000 5 19)
    :sessions ((:open (9 0) :close (12 0))
               (:open (13 0) :close (15 0)))
    :authority "KOSPI two-session day with a 12:00-13:00 lunch break until 2000-05-19 (abolished in May 2000 per Kyunghyang Shinmun 2016-05-24; no KRX notice found, secondary)")
   (:from (2000 5 22) :to (2016 7 29)
    :sessions ((:open (9 0) :close (15 0)))
    :authority "Continuous 09:00-15:00 from 2000-05-22 (lunch break abolished; secondary, no KRX notice found)")
   (:from (2016 8 1)
    :sessions ((:open (9 0) :close (15 30)))
    :authority "Global KRX Trading Hours: regular session 09:00-15:30 https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp ; the 2016-08-01 start comes from press reports of the KRX decision of 2016-05-24 (secondary)"))
 :late-open-rules (
   (:kind :function :function krx-first-trading-day :open (10 0) :regular t :from (2001 1 1)
    :authority "First trading day of the year: the regular session opens at 10:00 after the market opening ceremony and closes at the usual time. KIND market notice for 2025-01-02 https://kind.krx.co.kr/external/2024/12/17/000102/20241216000236/70780.htm ; KRX notices for the other years were not reachable, the rule is applied from 2001 (2000-01-04 not established).")))
