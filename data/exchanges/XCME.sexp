;;;; CME Globex (equity / FX / energy template) — electronic Globex session labeled by close date.
(
 :mic "XCME"
 :name "CME Globex (equity / FX / energy template)"
 :zone "America/Chicago"
 :calendar "USFED"
 :kind :commodities
 :source "CME Globex 17:00–16:00 CT Sun–Fri; daily maintenance 16:00–17:00"
 :eras (
   (:from (2007 1 2)
    :sessions ((:open (17 0) :close (16 0) :overnight t :labeled-by :close))
    :authority "ES/NQ/6E-style 17:00–16:00 CT; CME CFTC hours: open 17:00 CT, close 16:00 CT next day"))

 :early-close-rules (
   (:kind :christmas-eve-weekday :from (2007 1 1) :close (12 0)
    :authority "CME Globex typical holiday early close 12:00 CT")
   (:kind :new-years-eve-weekday :from (2007 1 1) :close (12 0)
    :authority "CME Globex typical NYE early close 12:00 CT")
   (:kind :black-friday :from (2007 1 1) :close (12 15)
    :authority "CME equity/energy Globex Friday-after-Thanksgiving shortened close"))
)
