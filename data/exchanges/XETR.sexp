;;;; Deutsche Börse Xetra cash (MIC XETR).
(
 :mic "XETR"
 :name "Xetra"
 :zone "Europe/Berlin"
 :calendar "DE"
 :source "Deutsche Börse Xetra cash trading hours"
 :eras (
   (:from (1997 11 28)
    :sessions ((:open (9 0) :close (17 30)))
    :authority "Xetra cash continuous 09:00–17:30 (system launched 1997-11-28)"))
 :early-close-rules (
   (:kind :christmas-eve-or-preceding-friday :from (1997 11 28) :close (14 0)
    :authority "Xetra Christmas Eve (or preceding Friday) early close 14:00")
   (:kind :new-years-eve-or-preceding-friday :from (1997 11 28) :close (14 0)
    :authority "Xetra New Year's Eve (or preceding Friday) early close 14:00")))
