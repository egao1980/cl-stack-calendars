;;;; Euronext Brussels cash (MIC XBRU).
(
 :mic "XBRU"
 :name "Euronext Brussels"
 :zone "Europe/Brussels"
 :calendar "BE"
 :kind :equity
 :source "Euronext Brussels cash 09:00–17:30"
 :eras (
   (:from (1995 1 2)
    :sessions ((:open (9 0) :close (17 30)))
    :authority "Euronext Brussels cash 09:00–17:30"))

 :early-close-rules (
   (:kind :christmas-eve-or-preceding-friday :from (1995 1 2) :close (14 0)
    :authority "Euronext Christmas Eve (or preceding Friday) early close 14:00")
   (:kind :new-years-eve-or-preceding-friday :from (1995 1 2) :close (14 0)
    :authority "Euronext New Year's Eve (or preceding Friday) early close 14:00"))
)
