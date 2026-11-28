;;;; SIX Swiss Exchange cash (MIC XSWX). Continuous to 17:20; official close 17:30.
;;;; Holidays: calendars/XSWX.sexp.
(
 :mic "XSWX"
 :name "SIX Swiss Exchange"
 :zone "Europe/Zurich"
 :calendar "XSWX"
 :kind :equity
 :source "SIX trading hours — shares 09:00–17:30 (auction 17:20–17:30)"
 :eras (
   (:from (1995 1 2)
    :sessions ((:open (9 0) :close (17 30)))
    :authority "SIX shares / funds 09:00–17:30 CET, continuous to 17:20 then closing auction (SIX trading hours: https://www.six-group.com/en/products-services/the-swiss-stock-exchange/trading/trading-provisions/trading-hours.html; Business Day Overview 2026-07-01). No early closes: 24 and 31 Dec are exchange holidays and the day before trades normally (SIX Exfeed messages 2013–2020; trading calendars 2026/2027). Eras before 2026 not checked.")))
