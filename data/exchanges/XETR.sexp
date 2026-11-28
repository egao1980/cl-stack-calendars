;;;; Deutsche Börse Xetra cash (MIC XETR). Holidays: calendars/XETR.sexp.
(
 :mic "XETR"
 :name "Xetra"
 :zone "Europe/Berlin"
 :calendar "XETR"
 :source "Deutsche Börse / FWB trading calendars and Xetra trading hours"
 :eras (
   (:from (1997 11 28) :to (2000 6 1)
    :sessions ((:open (9 0) :close (17 30)))
    :authority "Xetra launched 1997-11-28 (Deutsche Börse, Geschichte des Xetra-Handels: https://live.deutsche-boerse.com/wissen/ueber/geschichte-der-frankfurter-wertpapierboerse/geschichte-des-xetra-handels, first hours 08:30–17:00); 09:00–17:30 by 2000 (Deutsche Börse press release, February 2000, seen only as a mondovisione.com reproduction). The date of the 08:30–17:00 → 09:00–17:30 change is not found; this era uses 09:00–17:30 throughout.")
   (:from (2000 6 2) :to (2003 10 31)
    :sessions ((:open (9 0) :close (20 0)))
    :authority "Xetra continuous trading to 20:00 from 2000-06-02 (Deutsche Börse press release, April 2000, seen only as a mondovisione.com reproduction); back to 17:30 from 2003-11-03 (Eurex circular 116/03 of 2003-10-31 harmonises Eurex equity options 'with Xetra' at 17:30: https://www.eurex.com/resource/blob/294630/0f1d69ec085846ab4fc215e24d592449/data/cf1162003e.pdf.pdf)")
   (:from (2003 11 3)
    :sessions ((:open (9 0) :close (17 30)))
    :authority "Xetra continuous trading 09:00–17:30 CET from 2003-11-03 (Eurex circular 116/03); Deutsche Börse trading calendar and trading hours page: https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours. The Extended Xetra Retail Service (08:00–08:55, 17:35–22:00, from 2025-12-01, circular 052/25) is not the regular session."))
 :early-close-rules (
   (:kind :last-weekday-before-new-years-eve :from (2010 1 1) :close (14 0)
    :authority "Xetra's last trading day of the year (24–26 and 31 Dec are closed) ends continuous trading at 14:00: Deutsche Börse 'Final trading session' notices 2020–2026 (calendars/XETR.sexp). 2010–2019: no Deutsche Börse notice found; exchange_calendars has the same rule from 2010.")))
