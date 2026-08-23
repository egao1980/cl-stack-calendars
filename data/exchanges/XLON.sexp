;;;; London Stock Exchange cash continuous session (SETS / SEAQ).
(
 :mic "XLON"
 :name "London Stock Exchange"
 :zone "Europe/London"
 :calendar "GBLO"
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
    :authority "SETS 1997-10-20: continuous + auctions 08:00–16:30"))
 :early-close-rules (
   (:kind :christmas-eve-or-preceding-friday :from (1997 10 20) :close (12 30)
    :authority "LSE Christmas Eve (or preceding Friday) early close 12:30")
   (:kind :new-years-eve-or-preceding-friday :from (1997 10 20) :close (12 30)
    :authority "LSE New Year's Eve (or preceding Friday) early close 12:30")))
