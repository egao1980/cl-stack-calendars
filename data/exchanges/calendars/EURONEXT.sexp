;;;; EURONEXT shared calendar - draft research data (cl-stack-calendars #49), not repo code.
;;;; Rules: harmonised closures for Euronext Amsterdam/Brussels/Lisbon/Paris cash + continental derivatives.
;;;; Labour Day from 2002 (2001 was split per market, see XPAR/XAMS/XBRU). Lisbon follows this from 2003 (XLIS).
;;;; No weekend substitution: a holiday on Sat/Sun gives no weekday closure (e.g. 2004, 2005, 2010, 2011).
;;;; Early closes: 24 Dec and 31 Dec only when they fall Mon-Fri (NO preceding-Friday rule: 2005, 2011, 2016,
;;;; 2017, 2022, 2023 Fridays traded full day). Times are CET (Europe/Paris wall clock); Lisbon is 1h earlier local.
;;;; Notices 2002-2013 say "close at 14:00 CET" (closing auction 14:00, trading-at-last to 14:05, see 2010 notice);
;;;; 2014+ say "all instruments closing by 14:05 CET".
(:name "EURONEXT"
 :clock "Europe/Paris"
 :title "Euronext harmonised cash/derivatives trading days (Amsterdam, Brussels, Lisbon, Paris)"
 :authority "Euronext yearly holiday calendars (Trading Announcements / Info-Flashes / press releases)" :authority-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
 :rules ((:fixed "New Year's Day" 1 1 :authority "Euronext yearly calendar notices 2001-2027, e.g. https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2007.pdf")
         (:easter "Good Friday" -2 :authority "Euronext yearly calendar notices 2001-2027")
         (:easter "Easter Monday" 1 :authority "Euronext yearly calendar notices 2001-2027")
         (:fixed "Labour Day" 5 1 :from 2002 :authority "https://www.euronext.com/sites/www.euronext.com/files/paris_bourse_calendar_of_business_days_2.pdf (2002, first harmonised year; 2001 split: Amsterdam open, Paris/Brussels closed)")
         (:fixed "Christmas Day" 12 25 :authority "Euronext yearly calendar notices")
         (:fixed "Boxing Day" 12 26 :authority "Euronext yearly calendar notices"))
 :gaps (
   (:years "2006" :note "No 2006 cash calendar found: the NYSE Euronext calendar archive page (web.archive.org/web/2013id_/http://europeanequities.nyx.com:80/en/trading/nyse-euronext-trading-calendar/archives) lists only the 2006 SRD notice. Rules give GF 14 Apr, EM 17 Apr, 1 May, 25+26 Dec 2006."))
 :notices (
   (:title "Euronext calendar for cash and derivatives markets in 2001 (press release, Paris/Brussels/Amsterdam)"
    :uri "https://web.archive.org/web/2004id_/http://www.euronext.com:80/en/news/news_archive/calendars/news.jsp?newsId=27&language=EN"
    :year 2001
    :issued (2000 11 7) :issued-uri "https://web.archive.org/web/2004id_/http://www.euronext.com:80/en/news/news_archive/calendars/news.jsp?newsId=27&language=EN"
    :published (2000 11 7) :published-uri "https://web.archive.org/web/2004id_/http://www.euronext.com:80/en/news/news_archive/calendars/news.jsp?newsId=27&language=EN"
    :published-in "Euronext press release (euronext.com news archive, via web.archive.org)" :dates-note "States full harmonisation of opening/closing days once system migration completes (end Q3 2001); Amsterdam closed 30 Apr / open 1 May 2001, Paris+Brussels open 30 Apr / closed 1 May 2001 (per-MIC files)."
    :closed (((2001 6 4) "Whit Monday (2001 only)") ((2001 12 31) "New Year's Eve 2001 (euro changeover)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Calendrier des marches / Calendar of business days an 2002 (Decisions et avis N 2001-3888)"
    :uri "https://www.euronext.com/sites/www.euronext.com/files/paris_bourse_calendar_of_business_days_2.pdf"
    :year 2002
    :issued (2001 11 6) :issued-uri "https://www.euronext.com/sites/www.euronext.com/files/paris_bourse_calendar_of_business_days_2.pdf"
    :published (2001 11 6) :published-uri "https://www.euronext.com/sites/www.euronext.com/files/paris_bourse_calendar_of_business_days_2.pdf"
    :published-in "Euronext Paris Decisions et avis N 2001-3888" :dates-note "Issued under Euronext Rule Book I for 'Bourse de Paris' and 'Nouveau Marche'; no Amsterdam/Brussels 2002 list found - assumed identical (harmonised since Q4 2001). 31 Dec 2002 not mentioned as a half day."
    :closed ()
    :open ()
    :early-closes (((2002 12 24) (14 0) "half-day trading, close 14:00 CET (Lisbon local 1h earlier)"))
    :late-opens ())
   (:title "Calendar of cash business days 2003 (Euronext Trading Announcement N 2002-519)"
    :uri "https://www.euronext.com/sites/www.euronext.com/files/euronext_calendar_of_cash_business_days.pdf"
    :year 2003
    :issued (2002 11 8) :issued-uri "https://www.euronext.com/sites/www.euronext.com/files/euronext_calendar_of_cash_business_days.pdf"
    :published (2002 11 8) :published-uri "https://www.euronext.com/sites/www.euronext.com/files/euronext_calendar_of_cash_business_days.pdf"
    :published-in "Euronext Trading Announcement N 2002-519" :dates-note "Covers Euronext Paris, Brussels, Amsterdam, Lisbon. Same-day press release: https://www.euronext.com/sites/www.euronext.com/files/press_release.pdf . 31 Dec 2003 not mentioned as a half day."
    :closed ()
    :open ()
    :early-closes (((2003 12 24) (14 0) "half-day trading, close 14:00 CET (Lisbon local 1h earlier)"))
    :late-opens ())
   (:title "2004 calendar of Euronext markets (press release)"
    :uri "https://www.euronext.com/sites/www.euronext.com/files/press_release_2.pdf"
    :year 2004
    :issued (2003 9 24) :issued-uri "https://www.euronext.com/sites/www.euronext.com/files/press_release_2.pdf"
    :published (2003 9 24) :published-uri "https://www.euronext.com/sites/www.euronext.com/files/press_release_2.pdf"
    :published-in "Euronext press release" :dates-note "1 May 2004 Saturday; 25/26 Dec 2004 weekend: no weekday closure for them."
    :closed ()
    :open ()
    :early-closes (((2004 12 24) (14 0) "close 1:00 pm GMT (2:00 pm CET)") ((2004 12 31) (14 0) "close 1:00 pm GMT (2:00 pm CET)"))
    :late-opens ())
   (:title "Calendar of cash business days 2005 (Euronext Trading Announcement N 2004-378)"
    :uri "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days.pdf"
    :year 2005
    :issued (2004 9 22) :issued-uri "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days.pdf"
    :published (2004 9 22) :published-uri "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days.pdf"
    :published-in "Euronext Trading Announcement N 2004-378" :dates-note "Only GF, EM, 26 Dec on weekdays. No early close on Fri 23/30 Dec 2005. Press release 2004-09-21: https://www.euronext.com/sites/www.euronext.com/files/press_release_3.pdf"
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Calendar of cash business days 2007 (Euronext Trading Announcement N 2006-434)"
    :uri "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2007.pdf"
    :year 2007
    :issued (2006 11 9) :issued-uri "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2007.pdf"
    :published (2006 11 9) :published-uri "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2007.pdf"
    :published-in "Euronext Trading Announcement N 2006-434" :dates-note "Press release 2006-11-20: https://www.euronext.com/sites/www.euronext.com/files/press_release_4.pdf"
    :closed ()
    :open ()
    :early-closes (((2007 12 24) (14 0) "half-day trading, close 14:00 CET (Lisbon local 1h earlier)") ((2007 12 31) (14 0) "half-day trading, close 14:00 CET (Lisbon local 1h earlier)"))
    :late-opens ())
   (:title "Calendar of cash business days 2008 (Euronext Trading Announcement N 2007-355)"
    :uri "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2.pdf"
    :year 2008
    :issued (2007 11 14) :issued-uri "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2.pdf"
    :published (2007 11 14) :published-uri "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2.pdf"
    :published-in "Euronext Trading Announcement N 2007-355" :dates-note "Press release 2007-11-14: https://www.euronext.com/sites/www.euronext.com/files/press_release_3_0.pdf"
    :closed ()
    :open ()
    :early-closes (((2008 12 24) (14 0) "half-day trading, close 14:00 CET (Lisbon local 1h earlier)") ((2008 12 31) (14 0) "half-day trading, close 14:00 CET (Lisbon local 1h earlier)"))
    :late-opens ())
   (:title "Calendar of cash business days 2009 (notice PAR_20081002_03481_EUR)"
    :uri "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_02_oct_2008.pdf"
    :year 2009
    :issued (2008 10 2) :issued-uri "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_02_oct_2008.pdf"
    :published (2008 10 2) :published-uri "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_02_oct_2008.pdf"
    :published-in "NYSE Euronext trading announcement PAR_20081002_03481_EUR" :dates-note "Press release 2008-09-26: https://www.euronext.com/sites/www.euronext.com/files/press_release_26_sep_2008.pdf"
    :closed ()
    :open ()
    :early-closes (((2009 12 24) (14 0) "half-day trading, close 14:00 CET (Lisbon local 1h earlier)") ((2009 12 31) (14 0) "half-day trading, close 14:00 CET (Lisbon local 1h earlier)"))
    :late-opens ())
   (:title "Calendar of cash business days 2010 (notice PAR_20091015_05039_EUR)"
    :uri "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_15_oct_2009.pdf"
    :year 2010
    :issued (2009 10 15) :issued-uri "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_15_oct_2009.pdf"
    :published (2009 10 15) :published-uri "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_15_oct_2009.pdf"
    :published-in "NYSE Euronext trading announcement PAR_20091015_05039_EUR" :dates-note "Hours detail: PAR_20101126_06372_EUR https://www.euronext.com/sites/www.euronext.com/files/european_cash_markets_trading_hours_for_24th_and_31st_december_2010.pdf (continuous to 13:55, closing auction 14:00, trading-at-last 14:00-14:05 CET)."
    :closed ()
    :open ()
    :early-closes (((2010 12 24) (14 0) "half-day trading, close 14:00 CET (Lisbon local 1h earlier)") ((2010 12 31) (14 0) "half-day trading, close 14:00 CET (Lisbon local 1h earlier)"))
    :late-opens ())
   (:title "NYSE Euronext announces its 2011 holiday calendar and early closing dates (press release)"
    :uri "https://www.euronext.com/sites/www.euronext.com/files/holiday_calendar_and_early_closing_dates_for_european_markets_press_release.pdf"
    :year 2011
    :issued (2010 11 10) :issued-uri "https://www.euronext.com/sites/www.euronext.com/files/holiday_calendar_and_early_closing_dates_for_european_markets_press_release.pdf"
    :published (2010 11 10) :published-uri "https://www.euronext.com/sites/www.euronext.com/files/holiday_calendar_and_early_closing_dates_for_european_markets_press_release.pdf"
    :published-in "NYSE Euronext press release" :dates-note "Weekday closures GF, EM, Mon 26 Dec 2011 only (1 Jan/1 May/25 Dec on Sundays). Fri 23 and Fri 30 Dec 2011: cash markets close at the usual time (5.35 pm CET closing auction)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Calendar of cash business days 2012 (notice PAR_20111114_07899_EUR)"
    :uri "https://www.euronext.com/sites/www.euronext.com/files/calendar_2012.pdf"
    :year 2012
    :issued (2011 11 14) :issued-uri "https://www.euronext.com/sites/www.euronext.com/files/calendar_2012.pdf"
    :published (2011 11 14) :published-uri "https://www.euronext.com/sites/www.euronext.com/files/calendar_2012.pdf"
    :published-in "NYSE Euronext trading announcement PAR_20111114_07899_EUR" :dates-note nil
    :closed ()
    :open ()
    :early-closes (((2012 12 24) (14 0) "half-day trading, close 14:00 CET (Lisbon local 1h earlier)") ((2012 12 31) (14 0) "half-day trading, close 14:00 CET (Lisbon local 1h earlier)"))
    :late-opens ())
   (:title "NYSE Euronext 2013 holiday calendar and early closing dates (press release 8 Nov 2012)"
    :uri "https://web.archive.org/web/2013id_/https://europeanequities.nyx.com/en/product-news/2013-holiday-calendar"
    :year 2013
    :issued (2012 11 8) :issued-uri "https://web.archive.org/web/2013id_/https://europeanequities.nyx.com/en/product-news/2013-holiday-calendar"
    :published (2012 11 8) :published-uri "https://web.archive.org/web/2013id_/https://europeanequities.nyx.com/en/product-news/2013-holiday-calendar"
    :published-in "NYSE Euronext press release (europeanequities.nyx.com, via web.archive.org)" :dates-note nil
    :closed ()
    :open ()
    :early-closes (((2013 12 24) (14 0) "half-day trading, close 14:00 CET (Lisbon local 1h earlier)") ((2013 12 31) (14 0) "half-day trading, close 14:00 CET (Lisbon local 1h earlier)"))
    :late-opens ())
   (:title "NYSE Euronext announces its 2014 holiday calendar and early closing dates (press release)"
    :uri "https://www.euronext.com/sites/www.euronext.com/files/press_release_trading_days_2014.pdf"
    :year 2014
    :issued (2013 12 11) :issued-uri "https://www.euronext.com/sites/www.euronext.com/files/press_release_trading_days_2014.pdf"
    :published (2013 12 11) :published-uri "https://www.euronext.com/sites/www.euronext.com/files/press_release_trading_days_2014.pdf"
    :published-in "NYSE Euronext press release; Info-Flash IF131210CADE (not retrieved)" :dates-note "First year worded 'half day trading, with all instruments closing by 14:05 CET'. French version: https://www.euronext.com/sites/www.euronext.com/files/calendrier_des_marches_financiers_2014.pdf"
    :closed ()
    :open ()
    :early-closes (((2014 12 24) (14 5) "half-day trading, close 14:05 CET (Lisbon local 1h earlier)") ((2014 12 31) (14 5) "half-day trading, close 14:05 CET (Lisbon local 1h earlier)"))
    :late-opens ())
   (:title "Euronext Calendar & Hours page: calendar of business days 2015"
    :uri "https://web.archive.org/web/20150412111106id_/https://www.euronext.com/en/trading-calendars-hours"
    :year 2015
    :issued (2014 12 11) :issued-uri "https://web.archive.org/web/2015id_/https://www.euronext.com/sites/www.euronext.com/files/if141211sp__smartpool_detailed_trading_calendar_for_2015.pdf"
    :published (2015 4 12) :published-uri "https://web.archive.org/web/20150412111106id_/https://www.euronext.com/en/trading-calendars-hours"
    :published-in "euronext.com Calendars & Hours page (web.archive.org snapshots 2015-04-12 and 2015-09-10); Info-Flash IF141211SP" :dates-note "Issued date = SmartPool Info-Flash IF141211SP (11 Dec 2014) which repeats the Euronext cash closures incl. Thu 31 Dec 2015; published = earliest archived page snapshot. Still listed in the 2015-09-10 snapshot (https://web.archive.org/web/20150910071331id_/https://www.euronext.com/en/trading-calendars-hours). 26 Dec 2015 Saturday."
    :closed (((2015 12 31) "New Year's Eve 2015 (Euronext closure)"))
    :open ()
    :early-closes (((2015 12 24) (14 5) "half-day trading, close 14:05 CET (Lisbon local 1h earlier)"))
    :late-opens ())
   (:title "Euronext Calendar & Hours page: calendar of business days 2016"
    :uri "https://web.archive.org/web/20160304192247id_/https://www.euronext.com/en/trading-calendars-hours"
    :year 2016
    :issued nil :issued-uri "https://web.archive.org/web/20160304192247id_/https://www.euronext.com/en/trading-calendars-hours"
    :published (2016 3 4) :published-uri "https://web.archive.org/web/20160304192247id_/https://www.euronext.com/en/trading-calendars-hours"
    :published-in "euronext.com Calendars & Hours page (web.archive.org snapshot)" :dates-note "Issue date of the underlying Info-Flash not shown; published = snapshot date. Fri 23 and Fri 30 Dec 2016 close at usual times."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Euronext Calendar & Hours page: calendar of business days 2017"
    :uri "https://web.archive.org/web/20170805202027id_/https://www.euronext.com/en/trading-calendars-hours"
    :year 2017
    :issued nil :issued-uri "https://web.archive.org/web/20170805202027id_/https://www.euronext.com/en/trading-calendars-hours"
    :published (2017 8 5) :published-uri "https://web.archive.org/web/20170805202027id_/https://www.euronext.com/en/trading-calendars-hours"
    :published-in "euronext.com Calendars & Hours page (web.archive.org snapshot)" :dates-note "Issue date not shown; published = snapshot date. Fri 22 and Fri 29 Dec 2017 close at usual times (W&C 17:30 on 29 Dec)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "2018 holiday calendar for Euronext's cash and derivatives markets (Info-Flash IF171020CADE)"
    :uri "https://web.archive.org/web/2018id_/https://www.euronext.com/sites/www.euronext.com/files/if171020cade_2018_holiday_calendar_for_euronexts_cash_and_derivatives_markets.pdf"
    :year 2018
    :issued (2017 10 20) :issued-uri "https://web.archive.org/web/2018id_/https://www.euronext.com/sites/www.euronext.com/files/if171020cade_2018_holiday_calendar_for_euronexts_cash_and_derivatives_markets.pdf"
    :published (2017 10 20) :published-uri "https://web.archive.org/web/2018id_/https://www.euronext.com/sites/www.euronext.com/files/if171020cade_2018_holiday_calendar_for_euronexts_cash_and_derivatives_markets.pdf"
    :published-in "Euronext Info-Flash IF171020CADE" :dates-note nil
    :closed ()
    :open ()
    :early-closes (((2018 12 24) (14 5) "half-day trading, close 14:05 CET (Lisbon local 1h earlier)") ((2018 12 31) (14 5) "half-day trading, close 14:05 CET (Lisbon local 1h earlier)"))
    :late-opens ())
   (:title "2019 holiday calendar for Euronext's cash and derivatives markets (Info-Flash IF181018CADE)"
    :uri "https://web.archive.org/web/2019id_/https://www.euronext.com/sites/www.euronext.com/files/if181018cade_2019_holiday_calendar_for_euronexts_cash_and_derivatives_markets.pdf"
    :year 2019
    :issued (2018 10 18) :issued-uri "https://web.archive.org/web/2019id_/https://www.euronext.com/sites/www.euronext.com/files/if181018cade_2019_holiday_calendar_for_euronexts_cash_and_derivatives_markets.pdf"
    :published (2018 10 18) :published-uri "https://web.archive.org/web/2019id_/https://www.euronext.com/sites/www.euronext.com/files/if181018cade_2019_holiday_calendar_for_euronexts_cash_and_derivatives_markets.pdf"
    :published-in "Euronext Info-Flash IF181018CADE" :dates-note "Also applies to Euronext Dublin from its migration date 4 Feb 2019 (see XDUB)."
    :closed ()
    :open ()
    :early-closes (((2019 12 24) (14 5) "half-day trading, close 14:05 CET (Lisbon local 1h earlier)") ((2019 12 31) (14 5) "half-day trading, close 14:05 CET (Lisbon local 1h earlier)"))
    :late-opens ())
   (:title "Updated 2020 holiday calendar for Euronext's cash and derivatives markets (Info-Flash IF201124CADE)"
    :uri "https://connect2.euronext.com/sites/default/files/2020-11/IF201124CADE%202020%20Updated%20Holiday%20Calendar.pdf"
    :year 2020
    :issued (2019 10 25) :issued-uri nil
    :published (2020 11 24) :published-uri "https://connect2.euronext.com/sites/default/files/2020-11/IF201124CADE%202020%20Updated%20Holiday%20Calendar.pdf"
    :published-in "Euronext Info-Flash (original 25 Oct 2019, updated IF201124CADE 24 Nov 2020)" :dates-note "Original 25 Oct 2019 Info-Flash not retrieved; the update only added Oslo/Dublin dates. Trading-hours notice ON20201124CADE: https://connect2.euronext.com/sites/default/files/documentation/projects-notices/ON20201124CADE%20Trading%20Hours%20Euronext%20Cash%20and%20Derivatives%20Markets%2023%20December%202020%20to%204%20January%202021_0.pdf"
    :closed ()
    :open ()
    :early-closes (((2020 12 24) (14 5) "half-day trading, close 14:05 CET (Lisbon local 1h earlier)") ((2020 12 31) (14 5) "half-day trading, close 14:05 CET (Lisbon local 1h earlier)"))
    :late-opens ())
   (:title "Euronext Trading Hours & Holidays page: calendar of business days 2021"
    :uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :year 2021
    :issued nil :issued-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published nil :published-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published-in "euronext.com Trading Hours & Holidays page (fetched 2026-11-28; same tables on https://live.euronext.com/en/resources/trading-hours-holidays)" :dates-note " Half-day close time: 'all instruments close by 14:05 CET' as stated for 2019-2021; from 2024 the table only says 'Half Trading Day' and refers to the end-of-year appendix to Instructions 4-01/4-03. Issue date of the yearly Info-Flash not shown on the page."
    :closed ()
    :open ()
    :early-closes (((2021 12 24) (14 5) "half-day trading, close 14:05 CET (Lisbon local 1h earlier)") ((2021 12 31) (14 5) "half-day trading, close 14:05 CET (Lisbon local 1h earlier)"))
    :late-opens ())
   (:title "Euronext Trading Hours & Holidays page: calendar of business days 2022"
    :uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :year 2022
    :issued nil :issued-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published nil :published-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published-in "euronext.com Trading Hours & Holidays page (fetched 2026-11-28; same tables on https://live.euronext.com/en/resources/trading-hours-holidays)" :dates-note "24/31 Dec 2022 Saturdays; Fri 23 and 30 Dec full trading days for AMS/BRU/LIS/PAR (Dublin half). Issue date of the yearly Info-Flash not shown on the page."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Euronext Trading Hours & Holidays page: calendar of business days 2023"
    :uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :year 2023
    :issued nil :issued-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published nil :published-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published-in "euronext.com Trading Hours & Holidays page (fetched 2026-11-28; same tables on https://live.euronext.com/en/resources/trading-hours-holidays)" :dates-note "24/31 Dec 2023 Sundays; Fri 22 and 29 Dec full trading days for AMS/BRU/LIS/PAR (Dublin half). Issue date of the yearly Info-Flash not shown on the page."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Euronext Trading Hours & Holidays page: calendar of business days 2024"
    :uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :year 2024
    :issued nil :issued-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published nil :published-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published-in "euronext.com Trading Hours & Holidays page (fetched 2026-11-28; same tables on https://live.euronext.com/en/resources/trading-hours-holidays)" :dates-note " Half-day close time: 'all instruments close by 14:05 CET' as stated for 2019-2021; from 2024 the table only says 'Half Trading Day' and refers to the end-of-year appendix to Instructions 4-01/4-03. Issue date of the yearly Info-Flash not shown on the page."
    :closed ()
    :open ()
    :early-closes (((2024 12 24) (14 5) "half-day trading, close 14:05 CET (Lisbon local 1h earlier)") ((2024 12 31) (14 5) "half-day trading, close 14:05 CET (Lisbon local 1h earlier)"))
    :late-opens ())
   (:title "Euronext Trading Hours & Holidays page: calendar of business days 2025"
    :uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :year 2025
    :issued nil :issued-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published nil :published-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published-in "euronext.com Trading Hours & Holidays page (fetched 2026-11-28; same tables on https://live.euronext.com/en/resources/trading-hours-holidays)" :dates-note " Half-day close time: 'all instruments close by 14:05 CET' as stated for 2019-2021; from 2024 the table only says 'Half Trading Day' and refers to the end-of-year appendix to Instructions 4-01/4-03. Issue date of the yearly Info-Flash not shown on the page."
    :closed ()
    :open ()
    :early-closes (((2025 12 24) (14 5) "half-day trading, close 14:05 CET (Lisbon local 1h earlier)") ((2025 12 31) (14 5) "half-day trading, close 14:05 CET (Lisbon local 1h earlier)"))
    :late-opens ())
   (:title "Euronext Trading Hours & Holidays page: calendar of business days 2026"
    :uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :year 2026
    :issued nil :issued-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published nil :published-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published-in "euronext.com Trading Hours & Holidays page (fetched 2026-11-28; same tables on https://live.euronext.com/en/resources/trading-hours-holidays)" :dates-note " Half-day close time: 'all instruments close by 14:05 CET' as stated for 2019-2021; from 2024 the table only says 'Half Trading Day' and refers to the end-of-year appendix to Instructions 4-01/4-03. Issue date of the yearly Info-Flash not shown on the page."
    :closed ()
    :open ()
    :early-closes (((2026 12 24) (14 5) "half-day trading, close 14:05 CET (Lisbon local 1h earlier)") ((2026 12 31) (14 5) "half-day trading, close 14:05 CET (Lisbon local 1h earlier)"))
    :late-opens ())
   (:title "2027 holiday calendar for Euronext's cash and derivatives markets (Info-Flash, erratum)"
    :uri "https://www.euronext.com/en/media/16439/download"
    :year 2027
    :issued (2026 11 6) :issued-uri nil
    :published (2026 11 19) :published-uri "https://www.euronext.com/en/media/16439/download"
    :published-in "Euronext Info-Flash 6 Nov 2026, erratum 19 Nov 2026" :dates-note "Erratum only changed Dublin 28 Dec 2027. Half-day close times to be set in the end-of-year appendix to Instructions 4-01/4-03."
    :closed ()
    :open ()
    :early-closes (((2027 12 24) (14 5) "half-day trading, close 14:05 CET (Lisbon local 1h earlier)") ((2027 12 31) (14 5) "half-day trading, close 14:05 CET (Lisbon local 1h earlier)"))
    :late-opens ())
 ))
