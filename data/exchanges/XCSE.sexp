;;;; Nasdaq Copenhagen equities (MIC XCSE). Holidays: calendars/XCSE.sexp.
(
 :mic "XCSE"
 :name "Nasdaq Copenhagen"
 :zone "Europe/Copenhagen"
 :calendar "XCSE"
 :kind :equity
 :source "Nasdaq Nordic Market Model — Copenhagen equities 09:00–17:00"
 :eras (
   (:from (1990 1 2)
    :sessions ((:open (9 0) :close (17 0)))
    :authority "Nasdaq Copenhagen 09:00–17:00 (2009: continuous to 16:50, closing call to 17:00, https://web.archive.org/web/20090207122443/http://nasdaqomxnordic.com:80/tradinghours; 2011 https://web.archive.org/web/20110217191231/http://www.nasdaqomxnordic.com/tradinghours/). Before 2009 not checked. No half days: every Copenhagen list 2008–2027 has 'Half day trading: -'.")))
