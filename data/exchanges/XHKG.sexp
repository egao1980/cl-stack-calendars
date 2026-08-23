;;;; HKEX securities continuous trading (MIC XHKG).
(
 :mic "XHKG"
 :name "Hong Kong Exchanges and Clearing"
 :zone "Asia/Hong_Kong"
 :calendar "HK"
 :source "HKEX news 2011-01-24 / 2011-03-03; SFC-approved hour extension"
 :eras (
   (:from (1986 4 2) :to (2011 3 4)
    :sessions ((:open (10 0) :close (12 30))
               (:open (14 30) :close (16 0)))
    :authority "HKEX securities CTS 10:00–12:30 / 14:30–16:00 through 2011-03-04")
   (:from (2011 3 7) :to (2012 3 2)
    :sessions ((:open (9 30) :close (12 0))
               (:open (13 30) :close (16 0)))
    :authority "HKEX phase 1 2011-03-07: 09:30–12:00 / 13:30–16:00 (1.5h lunch)")
   (:from (2012 3 5)
    :sessions ((:open (9 30) :close (12 0))
               (:open (13 0) :close (16 0)))
    :authority "HKEX phase 2 2012-03-05: afternoon from 13:00 (1h lunch)"))
 :early-close-rules (
   (:kind :hk-half-day-eves :from (1986 4 2) :to (2011 3 4) :close (12 30)
    :authority "HKEX Christmas / NY Eve weekday: morning session only (close 12:30)")
   (:kind :hk-half-day-eves :from (2011 3 7) :close (12 0)
    :authority "HKEX Christmas / NY Eve weekday: morning session only (close 12:00)")))
