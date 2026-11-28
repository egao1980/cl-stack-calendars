;;;; Nasdaq Stockholm equities (MIC XSTO). Holidays: calendars/XSTO.sexp.
(
 :mic "XSTO"
 :name "Nasdaq Stockholm"
 :zone "Europe/Stockholm"
 :calendar "XSTO"
 :kind :equity
 :source "Nasdaq Nordic Market Model — Stockholm equities"
 :eras (
   (:from (1990 1 2) :to (2004 9 24)
    :sessions ((:open (9 30) :close (17 30)))
    :authority "09:30–17:30 in force on 2004-03-26: Stockholmsbörsen and Helsinki Exchanges release of 2004-03-26 ('trading day will be extended by 30 minutes in the morning at Stockholmsborsen', https://rss.globenewswire.com/news-release/2004/03/26/308222/1092/en/Stockholmsborsen-and-Helsinki-Exchanges-to-Harmonize-Trading-Hours.html). Start of this era not established.")
   (:from (2004 9 27)
    :sessions ((:open (9 0) :close (17 30)))
    :authority "09:00–17:30 from the SAXESS harmonisation of 2004-09-27 (https://nasdaqbaltic.com/news/tallinn-helsinki-and-riga-stock-exchanges-successfully-switched-over-to-the-new-trading-system-saxess/); 2009: continuous to 17:20, closing call to 17:30 (https://web.archive.org/web/20090207122443/http://nasdaqomxnordic.com:80/tradinghours). The modeled close is the end of the closing call."))
 :early-close-rules (
   (:kind :fixed-weekday :month 1 :day 5 :from (2008 1 1) :close (13 0)
    :authority "Half trading day (equities to 13:00) on the day before Epiphany when a weekday: Nasdaq Nordic exchange holiday schedules 2008–2027 (nasdaqomxnordic.com/tradinghours via web.archive.org, e.g. https://web.archive.org/web/20110217191231/http://www.nasdaqomxnordic.com/tradinghours/; https://www.nasdaq.com/european-market-activity/trading-hours)")
   (:kind :easter :offset -3 :from (2008 1 1) :close (13 0)
    :authority "Half trading day on Maundy Thursday: Nasdaq Nordic exchange holiday schedules 2008–2027 (nasdaqomxnordic.com/tradinghours via web.archive.org, e.g. https://web.archive.org/web/20110217191231/http://www.nasdaqomxnordic.com/tradinghours/; https://www.nasdaq.com/european-market-activity/trading-hours)")
   (:kind :fixed-weekday :month 4 :day 30 :from (2008 1 1) :close (13 0)
    :authority "Half trading day on Walpurgis Eve (30 April) when a weekday: Nasdaq Nordic exchange holiday schedules 2008–2027 (nasdaqomxnordic.com/tradinghours via web.archive.org, e.g. https://web.archive.org/web/20110217191231/http://www.nasdaqomxnordic.com/tradinghours/; https://www.nasdaq.com/european-market-activity/trading-hours)")
   (:kind :easter :offset 38 :from (2008 1 1) :close (13 0)
    :authority "Half trading day on the day before Ascension: Nasdaq Nordic exchange holiday schedules 2008–2027 (nasdaqomxnordic.com/tradinghours via web.archive.org, e.g. https://web.archive.org/web/20110217191231/http://www.nasdaqomxnordic.com/tradinghours/; https://www.nasdaq.com/european-market-activity/trading-hours)")
   (:kind :function :function friday-before-swedish-all-saints :from (2008 1 1) :close (13 0)
    :authority "Half trading day on the Friday before All Saints' Day: Nasdaq Nordic exchange holiday schedules 2008–2027 (nasdaqomxnordic.com/tradinghours via web.archive.org, e.g. https://web.archive.org/web/20110217191231/http://www.nasdaqomxnordic.com/tradinghours/; https://www.nasdaq.com/european-market-activity/trading-hours). 23/30 December and 5 June half days are Stockholm fixed income only.")))
