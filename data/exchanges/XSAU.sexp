;;;; Saudi Exchange (Tadawul), MIC XSAU. Holidays and weekend eras: calendars/XSAU.sexp
;;;; (Friday-only rest to 2006-08, Thu-Fri from 2006-09, Fri-Sat from 2013-06-29).
(
 :mic "XSAU"
 :name "Saudi Exchange (Tadawul)"
 :zone "Asia/Riyadh"
 :calendar "XSAU"
 :kind :equity
 :weekend (5 6)
 :source "Tadawul Trading Times pages (2007-2016 snapshots); Tadawul releases 2016-02-10, 2020-03-25"
 :eras (
   (:from (2006 9 2) :to (2013 6 26)
    :sessions ((:open (11 0) :close (15 30)))
    :weekend (4 5)
    :authority "Tadawul Trading Times page (2007-10-28): 'Trading Session: 11:00 am - 03:30 pm; Trading Days: Saturday through Wednesday' https://web.archive.org/web/20071028135837id_/http://www.tadawul.com.sa/static/pages/en/TradingTimes/tradingtimes.html . The September 2006 start is month-level from a secondary lead. Before it Tadawul traded Saturday-Thursday in two periods whose times are not established, so no era is modelled before 2006-09.")
   (:from (2013 6 30) :to (2016 3 31)
    :sessions ((:open (11 0) :close (15 30)))
    :weekend (5 6)
    :authority "Tadawul Trading Times 2013-07-23 (ar): Sunday to Thursday 11:00-15:30 https://web.archive.org/web/20130723152052id_/http://www.tadawul.com.sa/static/pages/ar/TradingTimes/tradingtimes.html")
   (:from (2016 4 3) :to (2020 3 25)
    :sessions ((:open (10 0) :close (15 0)))
    :weekend (5 6)
    :authority "Tadawul release 2016-02-10: 10:00-15:00 'in effect starting Sunday April 3rd, 2016' (Mondo Visione reproduction, secondary copy of the exchange release)")
   (:from (2020 3 26) :to (2020 5 28)
    :sessions ((:open (10 0) :close (13 0)))
    :weekend (5 6)
    :authority "COVID-19: temporary 10:00-13:00, Tadawul 2020-03-25 (Mondo Visione reproduction) https://mondovisione.com/news/saudi-stock-exchange-tadawul-announces-a-temporary-reduction-of-trading-ho-2020325")
   (:from (2020 5 31)
    :sessions ((:open (10 0) :close (15 0)))
    :weekend (5 6)
    :authority "Normal hours 10:00-15:00 again from Sunday 2020-05-31 (Tadawul, Mondo Visione reproduction); unchanged in the Ramadan notices 2021-2022")))
