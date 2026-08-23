;;;; Korea Exchange KOSPI cash (MIC XKRX).
(
 :mic "XKRX"
 :name "Korea Exchange"
 :zone "Asia/Seoul"
 :calendar "KR"
 :source "KRX notices 2000 lunch abolition; 2016-08-01 close extension"
 :eras (
   (:from (1990 1 3) :to (1999 12 30)
    :sessions ((:open (9 0) :close (12 0))
               (:open (13 0) :close (15 0)))
    :authority "KOSPI two-session day with lunch through 1999")
   (:from (2000 1 3) :to (2016 7 29)
    :sessions ((:open (9 0) :close (15 0)))
    :authority "KRX abolished the lunch break in 2000; cash 09:00–15:00")
   (:from (2016 8 1)
    :sessions ((:open (9 0) :close (15 30)))
    :authority "KRX 2016-08-01: close extended to 15:30 (Korea Herald / KRX)")))
