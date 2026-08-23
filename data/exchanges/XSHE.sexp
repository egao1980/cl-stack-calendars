;;;; Shenzhen Stock Exchange cash A-share continuous session.
(
 :mic "XSHE"
 :name "Shenzhen Stock Exchange"
 :zone "Asia/Shanghai"
 :calendar "CN"
 :source "SZSE trading rules (aligned with SSE cash hours)"
 :eras (
   (:from (1991 7 3)
    :sessions ((:open (9 30) :close (11 30))
               (:open (13 0) :close (15 0)))
    :authority "SZSE cash 09:30–11:30 / 13:00–15:00 from 1991-07-03")))
