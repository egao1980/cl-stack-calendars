(
 :mic "XWAR"
 :name "Warsaw Stock Exchange"
 :zone "Europe/Warsaw"
 :calendar "PL"
 :kind :equity
 :source "GPW cash continuous to 16:50"
 :eras (
   (:from (1991 4 16)
    :sessions ((:open (9 0) :close (16 50)))
    :authority "GPW cash 09:00–16:50 (closing auction ~17:00)"))
 :early-close-rules (
   (:kind :christmas-eve-or-preceding-friday :from (1991 4 16) :close (13 0)
    :authority "GPW Christmas Eve early close")
   (:kind :new-years-eve-or-preceding-friday :from (1991 4 16) :close (13 0)
    :authority "GPW New Year's Eve early close")))
