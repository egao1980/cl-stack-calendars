(
 :mic "XHEL"
 :name "Nasdaq Helsinki"
 :zone "Europe/Helsinki"
 :calendar "FI"
 :kind :equity
 :source "Nasdaq Nordic Market Model — Helsinki equities 10:00–18:30 EET"
 :eras (
   (:from (1990 1 2)
    :sessions ((:open (10 0) :close (18 30)))
    :authority "Nasdaq Helsinki cash 10:00–18:30 Europe/Helsinki"))
 :early-close-rules (
   (:kind :christmas-eve-or-preceding-friday :from (1990 1 2) :close (14 0)
    :authority "Nasdaq Helsinki half-day")
   (:kind :new-years-eve-or-preceding-friday :from (1990 1 2) :close (14 0)
    :authority "Nasdaq Helsinki half-day")))
