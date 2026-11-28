;;;; Nasdaq Helsinki equities (MIC XHEL). Holidays: calendars/XHEL.sexp.
(
 :mic "XHEL"
 :name "Nasdaq Helsinki"
 :zone "Europe/Helsinki"
 :calendar "XHEL"
 :kind :equity
 :source "Nasdaq Nordic Market Model — Helsinki equities"
 :eras (
   (:from (1990 1 2) :to (2004 9 24)
    :sessions ((:open (10 0) :close (18 0)))
    :authority "10:00–18:00 in force on 2004-03-26 (the release of that day extends the Helsinki day 'by 30 minutes in the evening': https://rss.globenewswire.com/news-release/2004/03/26/308222/1092/en/Stockholmsborsen-and-Helsinki-Exchanges-to-Harmonize-Trading-Hours.html). Start of this era not established.")
   (:from (2004 9 27)
    :sessions ((:open (10 0) :close (18 30)))
    :authority "10:00–18:30 from SAXESS 2004-09-27 (https://nasdaqbaltic.com/news/tallinn-helsinki-and-riga-stock-exchanges-successfully-switched-over-to-the-new-trading-system-saxess/); 2009: continuous to 18:20, closing call to 18:30. No half days: every Helsinki list 2008–2027 has 'Half day trading: -'.")))
