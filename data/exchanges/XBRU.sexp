;;;; Euronext Brussels cash (MIC XBRU). Holidays: calendars/XBRU.sexp (includes EURONEXT).
(
 :mic "XBRU"
 :name "Euronext Brussels"
 :zone "Europe/Brussels"
 :calendar "XBRU"
 :kind :equity
 :source "Euronext cash trading hours and yearly holiday notices"
 :eras (
   (:from ( 1995 1 2)
    :sessions ((:open (9 0) :close (17 30)))
    :authority "Euronext cash 09:00 open; continuous trading to 17:25 with closing auction 17:30 until 2007-02-16, continuous to 17:30 with closing auction 17:35 and trading at last to 17:40 from 2007-02-19 (Euronext notice of 2007-02-16, seen as a Mondo Visione copy: https://mondovisione.com/news/new-trading-hours-for-euronext-2011124). The modeled close is the closing-auction call / end of continuous trading, 17:30 in both eras. Before 2000 not checked."))
 :early-close-rules (
   (:kind :christmas-eve-weekday :from (2028 1 1) :close (14 5)
    :authority "Half trading days on 24 and 31 December when they fall Monday–Friday (no preceding-Friday rule: 2005, 2011, 2016, 2017, 2022, 2023 Fridays traded a full day). The yearly Euronext notices in calendars/EURONEXT.sexp give each year 2002–2027 (14:00 CET to 2013, \"closing by 14:05 CET\" from 2014); this rule is for later years: https://www.euronext.com/en/trading/trading-hours-holidays")
   (:kind :new-years-eve-weekday :from (2028 1 1) :close (14 5)
    :authority "Half trading days on 24 and 31 December when they fall Monday–Friday (no preceding-Friday rule: 2005, 2011, 2016, 2017, 2022, 2023 Fridays traded a full day). The yearly Euronext notices in calendars/EURONEXT.sexp give each year 2002–2027 (14:00 CET to 2013, \"closing by 14:05 CET\" from 2014); this rule is for later years: https://www.euronext.com/en/trading/trading-hours-holidays")))
