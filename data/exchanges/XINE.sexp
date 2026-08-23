(
 :mic "XINE"
 :name "Shanghai International Energy Exchange"
 :zone "Asia/Shanghai"
 :calendar "CN"
 :kind :commodities
 :source "INE SC crude: night 21:00–02:30 + SHFE-style day"
 :eras (
   (:from (2018 3 26)
    :sessions ((:open (21 0) :close (2 30) :overnight t :labeled-by :close)

               (:open (9 0) :close (10 15))
               (:open (10 30) :close (11 30))
               (:open (13 30) :close (15 0)))

    :authority "INE crude oil night 21:00–02:30 (previous day) + day session")))
