;;;; XMAT - Euronext Paris commodity derivatives (MATIF milling wheat, rapeseed, corn). No ec calendar exists.
;;;; Follows EURONEXT trading days (the yearly notices cover 'cash and derivatives markets'); 2000 MATIF list differs from
;;;; Paris cash (open Whit Monday and 14 July 2000). Caveat: 1 May 2003 likely traded (see notice); 1 May 2007-2014 the
;;;; Liffe press releases keep only interest-rate, UK-commodity and some equity derivatives open, i.e. Paris commodities closed.
;;;; Early closes on 24/31 Dec: derivatives 'close at various times' - commodity-specific times found only for 2011 and 2020.
(:name "XMAT"
 :title "Euronext Paris commodity derivatives (MATIF) trading days"
 :authority "Euronext derivatives holiday calendars (same notices as EURONEXT)" :authority-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
 :include ("EURONEXT")
 :rules ((:fixed "Labour Day (pre-harmonisation)" 5 1 :from 2000 :to 2001 :authority "https://www.euronext.com/sites/www.euronext.com/files/nouveau_marche_calendar_of_business_day.pdf"))
 :notices (
   (:title "Calendrier des marches an 2000 - section 2: MATIF and MONEP index derivatives"
    :uri "https://www.euronext.com/sites/www.euronext.com/files/nouveau_marche_calendar_of_business_day.pdf"
    :year 2000
    :issued (1999 10 5) :issued-uri "https://www.euronext.com/sites/www.euronext.com/files/nouveau_marche_calendar_of_business_day.pdf"
    :published (1999 10 5) :published-uri "https://www.euronext.com/sites/www.euronext.com/files/nouveau_marche_calendar_of_business_day.pdf"
    :published-in "SBF-ParisBourse Bulletin du Nouveau Marche N 99-R-068" :dates-note "MATIF closed only 21+24 Apr, 1 May, 25+26 Dec 2000 (unlike cash: open 12 Jun and 14 Jul 2000)."
    :closed (((2000 5 1) "Fete du Travail"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Euronext calendar for cash and derivatives markets in 2001 (press release)"
    :uri "https://web.archive.org/web/2004id_/http://www.euronext.com:80/en/news/news_archive/calendars/news.jsp?newsId=27&language=EN"
    :year 2001
    :issued (2000 11 7) :issued-uri "https://web.archive.org/web/2004id_/http://www.euronext.com:80/en/news/news_archive/calendars/news.jsp?newsId=27&language=EN"
    :published (2000 11 7) :published-uri "https://web.archive.org/web/2004id_/http://www.euronext.com:80/en/news/news_archive/calendars/news.jsp?newsId=27&language=EN"
    :published-in "Euronext press release" :dates-note "Derivatives in Paris closed 1 May 2001 (assumed from 'Paris ... will be closed'); 4 Jun and 31 Dec 2001 come from EURONEXT."
    :closed (((2001 5 1) "Labour Day (Paris)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "2003 calendar of Euronext markets (press release) - Euronext.liffe section"
    :uri "https://www.euronext.com/sites/www.euronext.com/files/press_release.pdf"
    :year 2003
    :issued (2002 11 8) :issued-uri "https://www.euronext.com/sites/www.euronext.com/files/press_release.pdf"
    :published (2002 11 8) :published-uri "https://www.euronext.com/sites/www.euronext.com/files/press_release.pdf"
    :published-in "Euronext press release" :dates-note "1 May 2003: only derivatives on Euronext-cash securities unavailable, 'other products will be available' - so Paris commodity futures presumably traded (inferred, not explicit). 24 Dec 2003: only equity-based derivatives stop at 14:00 CET."
    :closed ()
    :open (((2003 5 1) "Labour Day - non-equity derivatives available (inferred for MATIF commodities)"))
    :early-closes ()
    :late-opens ())
   (:title "NYSE Euronext 2011 holiday calendar (press release) - derivatives on 23/30 Dec 2011"
    :uri "https://www.euronext.com/sites/www.euronext.com/files/holiday_calendar_and_early_closing_dates_for_european_markets_press_release.pdf"
    :year 2011
    :issued (2010 11 10) :issued-uri "https://www.euronext.com/sites/www.euronext.com/files/holiday_calendar_and_early_closing_dates_for_european_markets_press_release.pdf"
    :published (2010 11 10) :published-uri "https://www.euronext.com/sites/www.euronext.com/files/holiday_calendar_and_early_closing_dates_for_european_markets_press_release.pdf"
    :published-in "NYSE Euronext press release" :dates-note "'London and Paris based Commodity Contracts will commence closing from midday GMT onwards' on Fri 23 and Fri 30 Dec 2011."
    :closed ()
    :open ()
    :early-closes (((2011 12 23) (13 0) "commence closing from 12:00 GMT (13:00 CET)") ((2011 12 30) (13 0) "commence closing from 12:00 GMT (13:00 CET)"))
    :late-opens ())
   (:title "Trading hours Euronext cash & derivatives markets 23 Dec 2020 - 4 Jan 2021 (notice ON20201124CADE)"
    :uri "https://connect2.euronext.com/sites/default/files/documentation/projects-notices/ON20201124CADE%20Trading%20Hours%20Euronext%20Cash%20and%20Derivatives%20Markets%2023%20December%202020%20to%204%20January%202021_0.pdf"
    :year 2020
    :issued (2020 11 24) :issued-uri "https://connect2.euronext.com/sites/default/files/documentation/projects-notices/ON20201124CADE%20Trading%20Hours%20Euronext%20Cash%20and%20Derivatives%20Markets%2023%20December%202020%20to%204%20January%202021_0.pdf"
    :published (2020 11 24) :published-uri "https://connect2.euronext.com/sites/default/files/documentation/projects-notices/ON20201124CADE%20Trading%20Hours%20Euronext%20Cash%20and%20Derivatives%20Markets%2023%20December%202020%20to%204%20January%202021_0.pdf"
    :published-in "Euronext operational notice ON20201124CADE" :dates-note "Paris commodity products close at 14:00 CET on Thu 24 Dec 2020 (and 31 Dec 2020 per the same half-day regime)."
    :closed ()
    :open ()
    :early-closes (((2020 12 24) (14 0) "Paris commodity products close 14:00 CET") ((2020 12 31) (14 0) "half day; commodity close 14:00 CET assumed same as 24 Dec"))
    :late-opens ())
   (:title "Extended trading hours for Euronext Commodities futures (from 13 April 2026)"
    :uri "https://live.euronext.com/en/products/commodities"
    :year 2026
    :issued nil :issued-uri "https://live.euronext.com/en/products/commodities"
    :published nil :published-uri "https://live.euronext.com/en/products/commodities"
    :published-in "live.euronext.com commodities page (fetched 2026-11-28)" :dates-note "Hours change, not a holiday: EBM/ECO/EMA futures add an 18:30-20:15 CET session from Mon 13 Apr 2026 (not on the last 3 days of the front expiry). See XMAT-hours.md."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
 ))
