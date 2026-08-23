;;;; Euronext Paris cash (MIC XPAR).
(
 :mic "XPAR"
 :name "Euronext Paris"
 :zone "Europe/Paris"
 :calendar "FR"
 :source "Euronext cash trading hours"
 :eras (
   (:from (1995 1 2)
    :sessions ((:open (9 0) :close (17 30)))
    :authority "Euronext Paris / NSC cash continuous 09:00–17:30"))
 :early-close-rules (
   (:kind :christmas-eve-or-preceding-friday :from (1995 1 2) :close (14 0)
    :authority "Euronext Christmas Eve (or preceding Friday) early close 14:00")
   (:kind :new-years-eve-or-preceding-friday :from (1995 1 2) :close (14 0)
    :authority "Euronext New Year's Eve (or preceding Friday) early close 14:00")))
