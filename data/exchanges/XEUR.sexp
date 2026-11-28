;;;; Eurex derivatives (MIC XEUR). Holidays: calendars/XEUR.sexp.
(
 :mic "XEUR"
 :name "Eurex"
 :zone "Europe/Berlin"
 :calendar "XEUR"
 :kind :commodities
 :source "Eurex trading calendars; product hours vary"
 :eras (
   (:from (1998 11 23)
    :sessions ((:open (8 0) :close (22 0)))
    :authority "Eurex hours are product-specific (Eurex trading calendar 2026: https://www.eurex.com/resource/blob/4873184/0ca7669a8cb9a2f917d99a801fb3f2de/data/tradingcalendar_2026_en.pdf — FGBL/FESX 01:10–22:00, index options 08:50–17:30, EURIBOR 08:00–19:00). 08:00–22:00 is a documented simplification of the exchange-wide window, not one product's hours. No exchange-wide early close (Eurex circular 233/10: products follow their underlying markets on the last trading day).")))
