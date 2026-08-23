;;;; BSE cash — same SEBI hour changes as NSE.
(
 :mic "XBOM"
 :name "BSE Ltd."
 :zone "Asia/Kolkata"
 :calendar "IN"
 :kind :equity
 :source "BSE/NSE joint hour change 2010-01-04; SEBI pre-open 2010-10-18"
 :eras (
   (:from (1995 1 2) :to (2010 1 1)
    :sessions ((:open (9 55) :close (15 30)))
    :authority "BSE cash open 09:55 as of 2009")
   (:from (2010 1 4) :to (2010 10 15)
    :sessions ((:open (9 0) :close (15 30)))
    :authority "BSE/NSE joint change 2010-01-04: continuous from 09:00")
   (:from (2010 10 18)
    :sessions ((:open (9 15) :close (15 30)))
    :authority "SEBI pre-open 09:00–09:15; cash continuous 09:15–15:30")))
