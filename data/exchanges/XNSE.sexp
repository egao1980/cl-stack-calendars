;;;; NSE India cash continuous session (MIC XNSE). Pre-open is not RTH.
(
 :mic "XNSE"
 :name "National Stock Exchange of India"
 :zone "Asia/Kolkata"
 :calendar "IN"
 :source "NSE press 2009-12-17; SEBI pre-open circular 2010"
 :eras (
   (:from (1994 11 3) :to (2010 1 1)
    :sessions ((:open (9 55) :close (15 30)))
    :authority "NSE cash open 09:55 as of 2009 (NSE PR 17 Dec 2009)")
   (:from (2010 1 4) :to (2010 10 15)
    :sessions ((:open (9 0) :close (15 30)))
    :authority "NSE/BSE joint change effective 2010-01-04: continuous from 09:00")
   (:from (2010 10 18)
    :sessions ((:open (9 15) :close (15 30)))
    :authority "SEBI pre-open 09:00–09:15; cash continuous 09:15–15:30 from 2010-10-18")))
