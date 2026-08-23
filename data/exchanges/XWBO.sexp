(
 :mic "XWBO"
 :name "Wiener Börse"
 :zone "Europe/Vienna"
 :calendar "AT"
 :kind :equity
 :source "Wiener Börse cash 09:00–17:30"
 :eras (
   (:from (1999 1 4)
    :sessions ((:open (9 0) :close (17 30)))
    :authority "Xetra Vienna / Wiener Börse cash 09:00–17:30"))
 :early-close-rules (
   (:kind :christmas-eve-or-preceding-friday :from (1999 1 4) :close (14 0)
    :authority "Wiener Börse Christmas Eve early close")
   (:kind :new-years-eve-or-preceding-friday :from (1999 1 4) :close (14 0)
    :authority "Wiener Börse New Year's Eve early close")))
