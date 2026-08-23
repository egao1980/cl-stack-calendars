;;;; LME — LMEselect electronic window (not ring clocks).
(
 :mic "XLME"
 :name "London Metal Exchange"
 :zone "Europe/London"
 :calendar "GBLO"
 :kind :commodities
 :source "LME: LMEselect 01:00–19:00; ring 11:40–17:00"
 :eras (
   (:from (2001 1 2)
    :sessions ((:open (1 0) :close (19 0)))
    :authority "LMEselect 01:00–19:00 London Monday–Friday")))
