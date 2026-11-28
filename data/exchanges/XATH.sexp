;;;; Athens Exchange / Euronext Athens cash (MIC XATH). Holidays: calendars/XATH.sexp.
(
 :mic "XATH"
 :name "Athens Stock Exchange"
 :zone "Europe/Athens"
 :calendar "XATH"
 :kind :equity
 :source "Euronext Athens Cash Markets Schedule (March 2026)"
 :eras (
   (:from (1995 1 2)
    :sessions ((:open (10 15) :close (17 20)))
    :authority "Main Market: opening auction from 10:15, continuous 10:30–17:00, closing auction 17:00–17:10, trading at close to 17:20 (Euronext Athens Cash Markets Schedule, March 2026: https://athens.euronext.com/sites/default/files/2026-04/Euronext_Athens_PRD_OASIS_Cash_Markets_Schedule_March2026_ver3_0.pdf). The modeled day runs from the opening auction to the end of trading at close. Earlier ASE/ATHEX schedules were not found; no early closes or late opens in any ASE or Euronext Athens holiday list.")))
