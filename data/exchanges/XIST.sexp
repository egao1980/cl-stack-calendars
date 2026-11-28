;;;; Borsa Istanbul equity market (MIC XIST). Holidays and half days: calendars/XIST.sexp.
(
 :mic "XIST"
 :name "Borsa Istanbul"
 :zone "Europe/Istanbul"
 :calendar "XIST"
 :kind :equity
 :source "Borsa Istanbul equity market session schedules"
 :eras (
   (:from (1995 1 2) :to (2016 3 25)
    :sessions ((:open (9 35) :close (12 30))
               (:open (14 15) :close (17 30)))
    :authority "Continuous 09:35–12:30 and 14:15–17:30 in the 2014-01 and 2015-03 snapshots of the Borsa Istanbul trading-hours page (09:45 in 2013-05: https://web.archive.org/web/20130506012657/http://www.borsaistanbul.com/en/products-and-markets/markets/equity-market/trading-hours; https://web.archive.org/web/20150309011007/http://www.borsaistanbul.com/en/products-and-markets/markets/equity-market/trading-hours). Earlier ISE hours not found; not verified.")
   (:from (2016 3 28) :to (2016 11 11)
    :sessions ((:open (9 35) :close (13 0))
               (:open (14 0) :close (17 30)))
    :authority "Schedule 'Updated on March 28, 2016': continuous 09:35–13:00 and 14:00–17:30, closing auction to 17:35 (https://web.archive.org/web/20160911035301/http://www.borsaistanbul.com/images/default-source/kurumsal/equity-market-session-schedule-continuous-trading-normal-days.png?sfvrsn=6)")
   (:from (2016 11 14) :to (2019 10 3)
    :sessions ((:open (10 0) :close (13 0))
               (:open (14 0) :close (18 0)))
    :authority "Effective 2016-11-14: continuous 10:00–13:00, midday auction 13:00–13:55, continuous 14:00–18:00, closing auction 18:00–18:05 (https://web.archive.org/web/20161117175157/http://www.borsaistanbul.com/images/default-source/kurumsal/equity-market-continuous-trading-normal-days-november-14-2016.jpg?sfvrsn=0)")
   (:from (2019 10 4)
    :sessions ((:open (10 0) :close (18 0)))
    :authority "Lunch break removed from 2019-10-04: Borsa Istanbul notice 2019/56 (https://borsaistanbul.com/duyuru/11644/pay-piyasasi-seansinda-ogle-arasinin-kaldirilmasi-hk-201956-sayili-duyuru-tekrar). Half days (eves of Ramazan and Kurban Bayramı, 28 October) close at 12:30, in the yearly notices of calendars/XIST.sexp."))
 :early-close-rules (
   (:kind :fixed-weekday :month 10 :day 28 :from (2027 1 1) :close (12 30)
    :authority "Republic Day eve (28 October) half day, equities to 12:30 (every ISE/BIST list 2000-2026, in calendars/XIST.sexp; equity half-day schedule effective 2016-11-14). Rule for years without a list.")))
