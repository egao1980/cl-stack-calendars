;;;; Wiener Börse cash (MIC XWBO). Holidays: calendars/XWBO.sexp.
(
 :mic "XWBO"
 :name "Wiener Börse"
 :zone "Europe/Vienna"
 :calendar "XWBO"
 :kind :equity
 :source "Wiener Börse trading hours — continuous 09:00–17:30, closing auction to 17:35"
 :eras (
   (:from (1999 1 4)
    :sessions ((:open (9 0) :close (17 30)))
    :authority "Wiener Börse equities continuous trading 09:00–17:30 with a 3-minute intraday auction at 12:00 (not modeled) and closing auction 17:30–17:35: https://www.wienerborse.at/en/trading/trading-information/trading-hours/. Eras before 2026 not checked."))
 :early-close-rules (
   (:kind :last-weekday-before-new-years-eve :from (2017 1 1) :close (14 15)
    :authority "Last trading day of the year: closing auction from 14:15 (Wiener Börse notices 2019–2026, calendars/XWBO.sexp; 2017–2018 from exchange_calendars, no notice found)")))
