;;;; Euronext Dublin cash — LSE-like hours (not 09:00–17:30 CET).
(
 :mic "XDUB"
 :name "Euronext Dublin"
 :zone "Europe/Dublin"
 :calendar "IE"
 :kind :equity
 :source "Euronext Dublin cash; continuous ends ~16:30 local"
 :eras (
   (:from (1995 1 2)
    :sessions ((:open (8 0) :close (16 30)))
    :authority "Euronext Dublin equities 08:00–16:30 Europe/Dublin"))
 :early-close-rules (
   (:kind :christmas-eve-or-preceding-friday :from (1995 1 2) :close (12 30)
    :authority "Euronext Dublin Christmas Eve (or preceding Friday) 12:30")
   (:kind :new-years-eve-or-preceding-friday :from (1995 1 2) :close (12 30)
    :authority "Euronext Dublin New Year's Eve (or preceding Friday) 12:30")))
