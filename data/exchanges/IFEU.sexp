;;;; ICE Futures Europe, Brent crude / oil complex (MIC IFEU). Holidays: calendars/IFEU.sexp.
;;;; Other IFEU products (ex-Liffe financials, softs, UK gas and power) have other calendars.
(
 :mic "IFEU"
 :name "ICE Futures Europe"
 :zone "Europe/London"
 :calendar "IFEU"
 :kind :commodities
 :source "ICE Futures Europe trading schedules (Brent): 01:00–23:00 London"
 :eras (
   (:from (2005 1 3)
    :sessions ((:open (1 0) :close (23 0)))
    :authority "ICE Brent Crude futures 01:00–23:00 London, Monday–Friday (ICE product page https://www.ice.com/products/219/Brent-Crude-Futures). Early closes are in the yearly trading-schedule notices (calendars/IFEU.sexp).")))
