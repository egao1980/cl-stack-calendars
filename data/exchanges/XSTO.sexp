(
 :mic "XSTO"
 :name "Nasdaq Stockholm"
 :zone "Europe/Stockholm"
 :calendar "SE"
 :kind :equity
 :source "Nasdaq Nordic Market Model — Stockholm equities 09:00–17:30"
 :eras (
   (:from (1990 1 2)
    :sessions ((:open (9 0) :close (17 30)))
    :authority "Nasdaq Stockholm cash 09:00–17:30"))
 :early-close-rules (
   (:kind :christmas-eve-or-preceding-friday :from (1990 1 2) :close (13 0)
    :authority "Nasdaq Nordic half-day 13:00")
   (:kind :new-years-eve-or-preceding-friday :from (1990 1 2) :close (13 0)
    :authority "Nasdaq Nordic half-day 13:00")))
