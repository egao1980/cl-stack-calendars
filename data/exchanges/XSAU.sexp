;;;; Tadawul — weekend flipped 2013-06-29 (Thu/Fri → Fri/Sat).
(
 :mic "XSAU"
 :name "Saudi Exchange (Tadawul)"
 :zone "Asia/Riyadh"
 :calendar "SA"
 :kind :equity
 :weekend (5 6)
 :source "Tadawul 10:00–15:00; weekend change 2013-06-29"
 :eras (
   (:from (2001 10 6) :to (2013 6 26)
    :sessions ((:open (10 0) :close (15 0)))
    :weekend (4 5)
    :authority "Tadawul Sat–Wed 10:00–15:00; weekend Thu–Fri until 2013-06-26")
   (:from (2013 6 27) :to (2013 6 29)
    :sessions ((:open (10 0) :close (15 0)))
    :weekend (1 2 3 4 5 6 7)
    :authority "Tadawul weekend transition 2013-06-27–29 — no session")
   (:from (2013 6 30)
    :sessions ((:open (10 0) :close (15 0)))
    :weekend (5 6)
    :authority "Tadawul Sun–Thu 10:00–15:00 from 2013-06-30 (weekend Fri–Sat)")))
