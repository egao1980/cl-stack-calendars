;;;; Euronext Milan cash (MIC XMIL).
(
 :mic "XMIL"
 :name "Euronext Milan"
 :zone "Europe/Rome"
 :calendar "IT"
 :kind :equity
 :source "Borsa Italiana / Euronext Milan cash 09:00–17:30"
 :eras (
   (:from (1994 1 3)
    :sessions ((:open (9 0) :close (17 30)))
    :authority "Borsa Italiana / Euronext Milan cash 09:00–17:30"))

 :early-close-rules (
   (:kind :christmas-eve-or-preceding-friday :from (1995 1 2) :close (14 0)
    :authority "Euronext Christmas Eve (or preceding Friday) early close 14:00")
   (:kind :new-years-eve-or-preceding-friday :from (1995 1 2) :close (14 0)
    :authority "Euronext New Year's Eve (or preceding Friday) early close 14:00"))
)
