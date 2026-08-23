(
 :mic "XCSE"
 :name "Nasdaq Copenhagen"
 :zone "Europe/Copenhagen"
 :calendar "DK"
 :kind :equity
 :source "Nasdaq Nordic Market Model — Copenhagen equities 09:00–17:00"
 :eras (
   (:from (1990 1 2)
    :sessions ((:open (9 0) :close (17 0)))
    :authority "Nasdaq Copenhagen cash 09:00–17:00"))
 :early-close-rules (
   (:kind :christmas-eve-or-preceding-friday :from (1990 1 2) :close (13 0)
    :authority "Nasdaq Nordic half-day 13:00")
   (:kind :new-years-eve-or-preceding-friday :from (1990 1 2) :close (13 0)
    :authority "Nasdaq Nordic half-day 13:00")))
