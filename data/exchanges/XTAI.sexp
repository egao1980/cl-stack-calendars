;;;; TWSE cash (MIC XTAI).
(
 :mic "XTAI"
 :name "Taiwan Stock Exchange"
 :zone "Asia/Taipei"
 :calendar "TW"
 :kind :equity
 :source "TWSE timeline 2001-01-02 hour extension"
 :eras (
   (:from (1962 2 9) :to (2000 12 30)
    :sessions ((:open (9 0) :close (12 0)))
    :authority "TWSE regular session 09:00–12:00 through 2000")
   (:from (2001 1 2)
    :sessions ((:open (9 0) :close (13 30)))
    :authority "TWSE timeline 2001-01-02: extended to 09:00–13:30")))
