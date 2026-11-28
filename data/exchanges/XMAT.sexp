;;;; Euronext Paris commodity derivatives, MATIF (MIC XMAT). Holidays: calendars/XMAT.sexp.
(
 :mic "XMAT"
 :name "Euronext Paris commodities"
 :zone "Europe/Paris"
 :calendar "XMAT"
 :kind :commodities
 :source "Euronext milling wheat / rapeseed / corn futures (MATIF)"
 :eras (
   (:from (1998 1 5) :to (2026 4 10)
    :sessions ((:open (10 45) :close (18 30)))
    :authority "Euronext agricultural futures 10:45–18:30 CET (https://live.euronext.com/en/products/commodities); earlier start of these hours not found")
   (:from (2026 4 13)
    :sessions ((:open (10 45) :close (20 15)))
    :authority "From 2026-04-13 milling wheat, rapeseed and corn futures trade 10:45–20:15 CET, except the last three trading days of the front expiry (10:45–18:30, not modeled): contract specification https://live.euronext.com/en/product/commodities-futures/EBM-DPAR/contract-specification")))
