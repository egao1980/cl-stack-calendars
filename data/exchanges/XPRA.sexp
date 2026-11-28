;;;; Prague Stock Exchange cash (MIC XPRA). Holidays: calendars/XPRA.sexp.
(
 :mic "XPRA"
 :name "Prague Stock Exchange"
 :zone "Europe/Prague"
 :calendar "XPRA"
 :kind :equity
 :source "PSE Harmonogram burzovního dne"
 :eras (
   (:from (1993 4 6) :to (2020 11 27)
    :sessions ((:open (9 0) :close (16 20)))
    :authority "Prague Stock Exchange cash 09:00–16:20 (not checked against a PSE schedule before 2020-11-30)")
   (:from (2020 11 30)
    :sessions ((:open (9 0) :close (16 15)))
    :authority "PSE Harmonogram burzovního dne (updated 2020-11-30): opening auction 08:50–09:00, continuous 09:00–16:10, closing auction 16:10–16:15, trading at close 16:15–16:25 (https://www.pse.cz/obchodovani/informace-o-obchodovani/kalendar-burzovnich-dni). The modeled close is the end of the closing auction; the effective date of this schedule is the page's update date.")))
