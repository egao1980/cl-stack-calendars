;;;; Euronext Lisbon cash (MIC XLIS). Holidays: calendars/XLIS.sexp (includes EURONEXT).
;;;; Euronext trades Lisbon on the CET clock: 09:00–17:30 CET = 08:00–16:30 Lisbon.
(
 :mic "XLIS"
 :name "Euronext Lisbon"
 :zone "Europe/Lisbon"
 :calendar "XLIS"
 :kind :equity
 :source "Euronext cash trading hours (CET clock) and yearly holiday notices"
 :eras (
   (:from (1995 1 2)
    :sessions ((:open (8 0) :close (16 30)))
    :authority "Euronext Amsterdam, Brussels, Lisbon and Paris trade on one CET clock ('Trading hours in CET', Euronext end-of-year trading-manual appendix 2015: https://www.euronext.com/sites/www.euronext.com/files/appendix_to_euronext_instructions_4-01_4-02_4-03_trading_manuals_eoy_0.xlsx; 2010 notice 'All locations … 14:00 CET'), so 09:00–17:30 CET is 08:00–16:30 Lisbon time. In force by 2003 (first common calendar with Lisbon); the BVLP hours before 2003 were not found."))
 :early-close-rules (
   (:kind :christmas-eve-weekday :from (2028 1 1) :close (13 5)
    :authority "Euronext half trading day on 24 December (weekday) closing by 14:05 CET = 13:05 Lisbon; 2003–2027 from the yearly notices in calendars/EURONEXT.sexp (written in CET, converted)")
   (:kind :new-years-eve-weekday :from (2028 1 1) :close (13 5)
    :authority "Euronext half trading day on 31 December (weekday) closing by 14:05 CET = 13:05 Lisbon")))
