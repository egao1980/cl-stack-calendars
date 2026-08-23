;;;; SHFE — base-metals template (CU/AL night to 01:00).
(
 :mic "XSGE"
 :name "Shanghai Futures Exchange"
 :zone "Asia/Shanghai"
 :calendar "CN"
 :kind :commodities
 :source "SHFE trading hours: night previous 21:00; day 09:00–15:00 with 10:15 break"
 :eras (
   (:from (1999 1 4) :to (2013 6 28)
    :sessions (
               (:open (9 0) :close (10 15))
               (:open (10 30) :close (11 30))
               (:open (13 30) :close (15 0)))

    :authority "SHFE day session only (night session introduced later)")
   (:from (2013 7 1)
    :sessions ((:open (21 0) :close (1 0) :overnight t :labeled-by :close)

               (:open (9 0) :close (10 15))
               (:open (10 30) :close (11 30))
               (:open (13 30) :close (15 0)))

    :authority "SHFE: night of previous day 21:00–01:00 (base metals) + day breaks")))
