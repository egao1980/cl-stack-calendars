;;;; CBOT grains — overnight electronic + day session (corn/wheat/soy template).
(
 :mic "XCBT"
 :name "CBOT grains"
 :zone "America/Chicago"
 :calendar "USFED"
 :kind :commodities
 :source "CBOT grain hours: night 19:00–07:45 + day 08:30–13:20 CT"
 :eras (
   (:from (1994 1 3) :to (2006 12 29)
    :sessions ((:open (8 30) :close (13 15)))
    :authority "CBOT grain day session 08:30–13:15 (pit / early electronic)")
   (:from (2007 1 2)
    :sessions ((:open (19 0) :close (7 45) :overnight t :labeled-by :close)
               (:open (8 30) :close (13 20)))
    :authority "CBOT grain Globex night 19:00–07:45 + day 08:30–13:20 CT")))
