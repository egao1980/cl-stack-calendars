;;;; Euronext Amsterdam cash (MIC XAMS).
(
 :mic "XAMS"
 :name "Euronext Amsterdam"
 :zone "Europe/Amsterdam"
 :calendar "NL"
 :kind :equity
 :source "Euronext Amsterdam cash 09:00–17:30 (NSC / Optiq)"
 :eras (
   (:from (1998 1 5)
    :sessions ((:open (9 0) :close (17 30)))
    :authority "Euronext Amsterdam cash 09:00–17:30 (NSC / Optiq)"))

 :early-close-rules (
   (:kind :christmas-eve-or-preceding-friday :from (1995 1 2) :close (14 0)
    :authority "Euronext Christmas Eve (or preceding Friday) early close 14:00")
   (:kind :new-years-eve-or-preceding-friday :from (1995 1 2) :close (14 0)
    :authority "Euronext New Year's Eve (or preceding Friday) early close 14:00"))
)
