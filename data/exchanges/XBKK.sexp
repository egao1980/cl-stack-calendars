;;;; SET cash (MIC XBKK).
(
 :mic "XBKK"
 :name "Stock Exchange of Thailand"
 :zone "Asia/Bangkok"
 :calendar "TH"
 :kind :equity
 :source "SET News 22/2024 — afternoon from 14:00 on 2024-03-25"
 :eras (
   (:from (1991 1 2) :to (2024 3 22)
    :sessions ((:open (10 0) :close (12 30))
               (:open (14 30) :close (16 30)))
    :authority "SET 10:00–12:30 / 14:30–16:30 through 2024-03-22")
   (:from (2024 3 25)
    :sessions ((:open (10 0) :close (12 30))
               (:open (14 0) :close (16 30)))
    :authority "SET News 22/2024: afternoon continuous from 14:00 effective 2024-03-25")))
