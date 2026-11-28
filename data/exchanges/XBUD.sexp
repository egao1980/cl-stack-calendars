;;;; Budapest Stock Exchange cash (MIC XBUD). Holidays: calendars/XBUD.sexp.
(
 :mic "XBUD"
 :name "Budapest Stock Exchange"
 :zone "Europe/Budapest"
 :calendar "XBUD"
 :kind :equity
 :source "BSE trading hours for the cash market"
 :eras (
   (:from (1990 6 21)
    :sessions ((:open (9 0) :close (17 0)))
    :authority "BSE cash: opening auction to 09:00, continuous trading to 17:00, closing auction 17:00–17:05 (https://www.bse.hu/Products-and-Services/Trading-information/Trading-hours). Eras before 2026 not checked. No early closes in any BSE resolution 2018–2026.")))
