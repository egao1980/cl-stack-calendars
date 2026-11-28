;;;; London Stock Exchange cash continuous session (SETS / SEAQ). Holidays: calendars/XLON.sexp.
(
 :mic "XLON"
 :name "London Stock Exchange"
 :zone "Europe/London"
 :calendar "XLON"
 :source "LSE Big Bang / SETS notices"
 :eras (
   (:from (1900 1 1) :to (1986 10 24)
    :sessions ((:open (9 30) :close (15 30)))
    :authority "Pre–Big Bang official list / jobbing hours ≈ 09:30–15:30")
   (:from (1986 10 27) :to (1997 10 17)
    :sessions ((:open (9 0) :close (17 0)))
    :authority "Big Bang 1986-10-27: SEAQ screen hours 09:00–17:00")
   (:from (1997 10 20)
    :sessions ((:open (8 0) :close (16 30)))
    :authority "SETS 1997-10-20: continuous 08:00–16:30, closing auction call 16:30 (Millennium Exchange & TRADEcho Business Parameters, tab Trading Service Breakdown: https://www.londonstockexchange.com/content/dam/lse/en_us/documents/technical-library/millennium-exchange-and-tradecho-business-parameters.xlsx); 08:00 open confirmed for 2003 by Service Announcement Live 60/03. SETS hours at launch not verified."))
 :early-close-rules (
   (:kind :christmas-eve-or-preceding-friday :from (1997 10 20) :close (12 30)
    :authority "Business Parameters, tab Trading Cycles: early close day = final trading day before Christmas, regular trading 08:00–12:30, closing auction call 12:30; yearly LSE lists 2003–2028 in calendars/XLON.sexp. 1997–2002 not verified.")
   (:kind :new-years-eve-or-preceding-friday :from (1997 10 20) :close (12 30)
    :authority "Business Parameters, tab Trading Cycles: early close day = final trading day of the calendar year, 08:00–12:30. 1997–2002 not verified.")))
