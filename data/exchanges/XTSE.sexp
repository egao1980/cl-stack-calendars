;;;; Toronto Stock Exchange cash (MIC XTSE).
(
 :mic "XTSE"
 :name "Toronto Stock Exchange"
 :zone "America/Toronto"
 :calendar "XTSE"
 :source "TSX / TMX Market Hours & Holidays pages; TSE Regulatory Notice 2000-011"
 :eras (
   (:from (1980 1 2)
    :sessions ((:open (9 30) :close (16 0)))
    :authority "TSX continuous trading 09:30-16:00 ET: tsx.com Market Hours & Holidays (2008-11-21 snapshot) https://web.archive.org/web/20081121id_/http://www.tsx.com/en/about_tsx/market_hours.html and today's trading-hours page https://www.tsx.com/en/trading/calendars-and-trading-hours/trading-hours ; 16:00 close in 2000 per TSE Regulatory Notice 2000-011; the 09:30 open before 2008 is not stated by a TSE source"))
 :early-close-rules (
   (:kind :christmas-eve-weekday :from (1980 1 2) :close (13 0)
    :authority "Christmas Eve on a weekday: continuous trading ends 13:00 (TSE/TSX notices 2001-2004, 2008, 2010, 2012-2015, 2018-2021, 2024-2027 in calendars/XTSE.sexp). New Year's Eve has regular hours (TSE notices 2001-228, 2002-241, 2003-173; TMX Holiday Operating Schedules 2012-2015).")))
