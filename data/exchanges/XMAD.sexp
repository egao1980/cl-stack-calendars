;;;; Bolsa de Madrid cash (MIC XMAD). Holidays: calendars/XMAD.sexp.
(
 :mic "XMAD"
 :name "Bolsa de Madrid"
 :zone "Europe/Madrid"
 :calendar "XMAD"
 :kind :equity
 :source "BME / Bolsa de Madrid SIBE cash 09:00–17:30"
 :eras (
   (:from (1995 1 2)
    :sessions ((:open (9 0) :close (17 30)))
    :authority "BME SIBE equities continuous 09:00–17:30, closing auction 17:30–17:35: https://www.bolsasymercados.es/en/bme-exchange/trading-hours.html. Eras before 2026 not checked."))
 :early-close-rules (
   (:kind :christmas-eve-weekday :from (2012 1 1) :close (14 0)
    :authority "24 Dec, when a weekday, trades until 14:00: BME 2024–2026 trading calendar press releases (calendars/XMAD.sexp); 2012–2023 from exchange_calendars, no BME notice found")
   (:kind :new-years-eve-weekday :from (2012 1 1) :close (14 0)
    :authority "31 Dec, when a weekday, trades until 14:00: BME 2024–2026 trading calendar press releases; 2012–2023 from exchange_calendars")))
