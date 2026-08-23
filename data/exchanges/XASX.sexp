;;;; ASX cash (MIC XASX).
(
 :mic "XASX"
 :name "Australian Securities Exchange"
 :zone "Australia/Sydney"
 :calendar "AU"
 :source "ASX trading hours (SEATS / TradeMatch)"
 :eras (
   (:from (1987 10 19)
    :sessions ((:open (10 0) :close (16 0)))
    :authority "ASX cash 10:00–16:00 from SEATS (1987-10-19)"))
 :early-close-rules (
   (:kind :christmas-eve-or-preceding-friday :from (1987 10 19) :close (14 0)
    :authority "ASX Christmas Eve (or preceding Friday) early close 14:00")
   (:kind :new-years-eve-or-preceding-friday :from (1987 10 19) :close (14 0)
    :authority "ASX New Year's Eve (or preceding Friday) early close 14:00")))
