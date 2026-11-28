;;;; Euronext Dublin cash (MIC XDUB), the Irish Stock Exchange until Euronext's
;;;; migration of 2019-02-04. Holidays: calendars/XDUB.sexp.
(
 :mic "XDUB"
 :name "Euronext Dublin"
 :zone "Europe/Dublin"
 :calendar "XDUB"
 :kind :equity
 :source "Euronext Dublin trading hours and holiday notices"
 :eras (
   (:from (1995 1 2)
    :sessions ((:open (8 0) :close (16 28)))
    :authority "08:00 open; continuous trading ends 16:28, then the closing auction ends at random between 16:28 and 16:30 Dublin time. The modeled close is the end of continuous trading, as for the other Euronext markets (17:30 CET). Euronext gives the half-day analogue explicitly: 'For Dublin, Equity instruments will close between 13:28 - 13:30 CET (12:28 - 12:30 Dublin time)' (https://www.euronext.com/en/trading/trading-hours-holidays). Irish Stock Exchange hours before 2019 not checked."))
 :early-close-rules (
   (:kind :christmas-eve-or-preceding-friday :from (2028 1 1) :close (12 28)
    :authority "Euronext Dublin half trading day on 24 December, or the Friday before when it falls on a weekend (2022-12-23, 2023-12-22 in the Euronext tables); 2019–2027 from the notices in calendars/XDUB.sexp")
   (:kind :new-years-eve-or-preceding-friday :from (2028 1 1) :close (12 28)
    :authority "Euronext Dublin half trading day on 31 December, or the Friday before (2022-12-30, 2023-12-29)")))
