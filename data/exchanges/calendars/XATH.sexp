;; Draft: Athens Exchange (ATHEX, since 2025 Euronext Athens) cash market trading days.
;; Sources: ASE holiday pages 2000-2007 (archived) and the Euronext Athens "Market Holiday" database
;; (https://athens.euronext.com/en/trade/trading-model/calendar, 31 pages, 1997-2027; complete per-year
;; lists from 2012, movable dates only for 1997-2011 plus an undated recurring fixed-date list).
;; 2008-2011: no year-specific list of fixed dates - 24 Dec closure from 2009 rests on ec + the recurring entry.
(:name "XATH"
 :title "Athens Exchange (Euronext Athens) trading days"
 :authority "Euronext Athens, Trading Calendar - Market Holidays; Athens Stock Exchange Market Holidays (archived)"
 :authority-uri "https://athens.euronext.com/en/trade/trading-model/calendar"
 :bases ((:calendar "GR" :from nil :to nil :authority "All Greek public holidays incl. Clean Monday, Orthodox Good Friday/Easter Monday, Whit (Holy Spirit) Monday, 26 Dec, and moved Labour Day"))
 :rules ((:easter "Good Friday (Western/Catholic)" -2 :from 2001
          :authority "Listed whenever it differs from the Orthodox date: 2002, 2003, 2006, 2008, 2009, 2012, 2013, 2015, 2018-2024, 2026, 2027 (Euronext Athens database; ASE lists 2002/2003/2006). Not closed in 2000 (ASE 2000 list).")
         (:easter "Easter Monday (Western/Catholic)" 1 :from 2001
          :authority "As Western Good Friday; also 28 Mar 2005, 28 Mar 2016.")
         (:fixed "Christmas Eve" 12 24 :from 2009
          :authority "Listed 2012-2015, 2018-2021, 2024-2027 in the Euronext Athens database; 2009-2010 per recurring entry + ec. Not closed 2001-2007 (ASE lists).")) 
 :notices (
   (:title "ASE/ATHEX Market Holidays 2000" :year 2000 :uri "https://web.archive.org/web/20000312085823/http://www.ase.gr/Announce/Holidays.htm"
    :issued nil :issued-uri nil :published (2000 3 12) :published-uri "https://web.archive.org/web/20000312085823/http://www.ase.gr/Announce/Holidays.htm"
    :published-in "Athens Stock Exchange website, web.archive.org snapshot"
    :dates-note "Issue date not shown; snapshot = earliest proof of publication. Western Good Friday 21 Apr / Easter Monday 24 Apr 2000 are NOT listed (sessions); ec closes them."
    :closed () :open () :early-closes () :late-opens ())
   (:title "ASE/ATHEX Market Holidays 2001" :year 2001 :uri "https://web.archive.org/web/20011217235444/http://www.ase.gr/content/en/about/holidays/"
    :issued nil :issued-uri nil :published (2001 12 17) :published-uri "https://web.archive.org/web/20011217235444/http://www.ase.gr/content/en/about/holidays/"
    :published-in "Athens Stock Exchange website, web.archive.org snapshot"
    :dates-note "Issue date not shown; snapshot = earliest proof of publication. Tue 2 Jan 2001 listed as a market holiday. 31 Dec 2001 not yet listed on 2001-12-17; the Euronext Athens holiday database lists 31/12/2001 'EURO' (euro changeover)."
    :closed (((2001 1 2) "Market holiday (ASE list)") ((2001 12 31) "Euro changeover (Euronext Athens holiday database)")) :open () :early-closes () :late-opens ())
   (:title "ASE/ATHEX Market Holidays 2002" :year 2002 :uri "https://web.archive.org/web/20021015152017/http://www.ase.gr/content/en/about/holidays/Default.asp"
    :issued nil :issued-uri nil :published (2002 10 15) :published-uri "https://web.archive.org/web/20021015152017/http://www.ase.gr/content/en/about/holidays/Default.asp"
    :published-in "Athens Stock Exchange website, web.archive.org snapshot"
    :dates-note "Issue date not shown; snapshot = earliest proof of publication. Lists Fri 29 Mar / Mon 1 Apr (Western Easter) and Tue 7 May 2002."
    :closed (((2002 5 7) "Market holiday (ASE list)")) :open () :early-closes () :late-opens ())
   (:title "ASE/ATHEX Market Holidays 2003" :year 2003 :uri "https://web.archive.org/web/20031229124803/http://www.ase.gr/content/en/about/holidays/Default.asp"
    :issued nil :issued-uri nil :published (2003 12 29) :published-uri "https://web.archive.org/web/20031229124803/http://www.ase.gr/content/en/about/holidays/Default.asp"
    :published-in "Athens Stock Exchange website, web.archive.org snapshot"
    :dates-note "Issue date not shown; snapshot = earliest proof of publication. Lists Western Easter 18/21 Apr and Orthodox Easter 25/28 Apr."
    :closed () :open () :early-closes () :late-opens ())
   (:title "ASE/ATHEX Market Holidays 2004" :year 2004 :uri "https://web.archive.org/web/20041204203658/http://www.ase.gr/content/en/about/holidays/"
    :issued nil :issued-uri nil :published (2004 12 4) :published-uri "https://web.archive.org/web/20041204203658/http://www.ase.gr/content/en/about/holidays/"
    :published-in "Athens Stock Exchange website, web.archive.org snapshot"
    :dates-note "Issue date not shown; snapshot = earliest proof of publication. Lists Fri 13 Aug 2004 (Olympic Games opening)."
    :closed (((2004 8 13) "Olympic Games opening day")) :open () :early-closes () :late-opens ())
   (:title "ASE/ATHEX Market Holidays 2005" :year 2005 :uri "https://web.archive.org/web/20051231080432/http://www.ase.gr/content/en/about/holidays/"
    :issued nil :issued-uri nil :published (2005 12 31) :published-uri "https://web.archive.org/web/20051231080432/http://www.ase.gr/content/en/about/holidays/"
    :published-in "Athens Stock Exchange website, web.archive.org snapshot"
    :dates-note "Issue date not shown; snapshot = earliest proof of publication. Lists Mon 28 Mar (Western Easter Monday). No 24 Dec closure (Saturday)."
    :closed () :open () :early-closes () :late-opens ())
   (:title "ASE/ATHEX Market Holidays 2006" :year 2006 :uri "https://web.archive.org/web/20061206203712/http://www.ase.gr/content/en/about/holidays/"
    :issued nil :issued-uri nil :published (2006 12 6) :published-uri "https://web.archive.org/web/20061206203712/http://www.ase.gr/content/en/about/holidays/"
    :published-in "Athens Stock Exchange website, web.archive.org snapshot"
    :dates-note "Issue date not shown; snapshot = earliest proof of publication. 24 Dec on Sunday."
    :closed () :open () :early-closes () :late-opens ())
   (:title "ASE/ATHEX Market Holidays 2007" :year 2007 :uri "https://web.archive.org/web/20071007231609/http://www.ase.gr/content/en/about/holidays/"
    :issued nil :issued-uri nil :published (2007 10 7) :published-uri "https://web.archive.org/web/20071007231609/http://www.ase.gr/content/en/about/holidays/"
    :published-in "Athens Stock Exchange website, web.archive.org snapshot"
    :dates-note "Issue date not shown; snapshot = earliest proof of publication. Mon 24 Dec 2007 not listed in the Oct-2007 snapshot (session per ec)."
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext Athens (ATHEX) Market Holidays 2008" :year 2008 :uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :published-in "Euronext Athens website, Trading Calendar - Market Holiday list (paginated ?page=0..31), fetched 2026-11-28"
    :dates-note "Issue/publication dates not shown. Database lists only movable dates for 2008 (Ash Monday 10 Mar, Western Easter 21/24 Mar, Orthodox Easter 25/28 Apr, Whit Monday 16 Jun) plus Tue 4 Mar 2008; fixed dates come from an undated recurring list (1/1, 6/1, 25/3, 1/5, 15/8, 28/10, 24/12, 25/12 - no 26/12). Wed 5 Mar 2008 not listed (ec closes it)."
    :closed (((2008 3 4) "Market holiday (Euronext Athens database)")) :open () :early-closes () :late-opens ())
   (:title "Euronext Athens (ATHEX) Market Holidays 2009" :year 2009 :uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :published-in "Euronext Athens website, Trading Calendar - Market Holiday list (paginated ?page=0..31), fetched 2026-11-28"
    :dates-note "Issue/publication dates not shown. Movable dates only (2 Mar, 10/13 Apr, 17/20 Apr, 8 Jun); fixed dates from the undated recurring list incl. 24 Dec."
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext Athens (ATHEX) Market Holidays 2010" :year 2010 :uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :published-in "Euronext Athens website, Trading Calendar - Market Holiday list (paginated ?page=0..31), fetched 2026-11-28"
    :dates-note "Issue/publication dates not shown. Movable dates only (15 Feb, 2/5 Apr, 24 May)."
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext Athens (ATHEX) Market Holidays 2011" :year 2011 :uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :published-in "Euronext Athens website, Trading Calendar - Market Holiday list (paginated ?page=0..31), fetched 2026-11-28"
    :dates-note "Issue/publication dates not shown. Movable dates only (7 Mar, 22/25 Apr, 13 Jun)."
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext Athens (ATHEX) Market Holidays 2012" :year 2012 :uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :published-in "Euronext Athens website, Trading Calendar - Market Holiday list (paginated ?page=0..31), fetched 2026-11-28"
    :dates-note "Issue/publication dates not shown. 27 Feb, 6/9 Apr (Western), 13/16 Apr (Orthodox), 1 May, 4 Jun, 15 Aug, 24-26 Dec."
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext Athens (ATHEX) Market Holidays 2013" :year 2013 :uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :published-in "Euronext Athens website, Trading Calendar - Market Holiday list (paginated ?page=0..31), fetched 2026-11-28"
    :dates-note "Issue/publication dates not shown. Lists 1 May AND 7 May 2013 (Labour Day moved), Western Easter 29 Mar/1 Apr, Orthodox 3/6 May, 24 Dec."
    :closed (((2013 5 1) "Labour Day (market closed; civil holiday moved to 7 May)")) :open () :early-closes () :late-opens ())
   (:title "Euronext Athens (ATHEX) Market Holidays 2014" :year 2014 :uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :published-in "Euronext Athens website, Trading Calendar - Market Holiday list (paginated ?page=0..31), fetched 2026-11-28"
    :dates-note "Issue/publication dates not shown. 24-26 Dec listed; 31 Dec 2014 NOT listed (ec closes it)."
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext Athens (ATHEX) Market Holidays 2015" :year 2015 :uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :published-in "Euronext Athens website, Trading Calendar - Market Holiday list (paginated ?page=0..31), fetched 2026-11-28"
    :dates-note "Issue/publication dates not shown. Bank holiday / capital controls: market closed 29 Jun - 31 Jul 2015 ('Banking Holiday' 29 Jun-17 Jul, 'Holiday' 20-31 Jul). Western Easter 3/6 Apr."
    :closed (((2015 6 29) "Banking holiday (capital controls)") ((2015 6 30) "Banking holiday (capital controls)") ((2015 7 1) "Banking holiday (capital controls)") ((2015 7 2) "Banking holiday (capital controls)") ((2015 7 3) "Banking holiday (capital controls)") ((2015 7 6) "Banking holiday (capital controls)") ((2015 7 7) "Banking holiday (capital controls)") ((2015 7 8) "Banking holiday (capital controls)") ((2015 7 9) "Banking holiday (capital controls)") ((2015 7 10) "Banking holiday (capital controls)") ((2015 7 13) "Banking holiday (capital controls)") ((2015 7 14) "Banking holiday (capital controls)") ((2015 7 15) "Banking holiday (capital controls)") ((2015 7 16) "Banking holiday (capital controls)") ((2015 7 17) "Banking holiday (capital controls)") ((2015 7 20) "Holiday (market remained closed)") ((2015 7 21) "Holiday (market remained closed)") ((2015 7 22) "Holiday (market remained closed)") ((2015 7 23) "Holiday (market remained closed)") ((2015 7 24) "Holiday (market remained closed)") ((2015 7 27) "Holiday (market remained closed)") ((2015 7 28) "Holiday (market remained closed)") ((2015 7 29) "Holiday (market remained closed)") ((2015 7 30) "Holiday (market remained closed)") ((2015 7 31) "Holiday (market remained closed)")) :open () :early-closes () :late-opens ())
   (:title "Euronext Athens (ATHEX) Market Holidays 2016" :year 2016 :uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :published-in "Euronext Athens website, Trading Calendar - Market Holiday list (paginated ?page=0..31), fetched 2026-11-28"
    :dates-note "Issue/publication dates not shown. Western Good Friday coincides with 25 Mar; Western Easter Monday 28 Mar; Orthodox 29 Apr/2 May; Labour Day moved to 3 May."
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext Athens (ATHEX) Market Holidays 2017" :year 2017 :uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :published-in "Euronext Athens website, Trading Calendar - Market Holiday list (paginated ?page=0..31), fetched 2026-11-28"
    :dates-note "Issue/publication dates not shown. Easter coincides."
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext Athens (ATHEX) Market Holidays 2018" :year 2018 :uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :published-in "Euronext Athens website, Trading Calendar - Market Holiday list (paginated ?page=0..31), fetched 2026-11-28"
    :dates-note "Issue/publication dates not shown. Western 30 Mar/2 Apr, Orthodox 6/9 Apr, 24 Dec."
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext Athens (ATHEX) Market Holidays 2019" :year 2019 :uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :published-in "Euronext Athens website, Trading Calendar - Market Holiday list (paginated ?page=0..31), fetched 2026-11-28"
    :dates-note "Issue/publication dates not shown. Western 19/22 Apr, Orthodox 26/29 Apr, 24 Dec."
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext Athens (ATHEX) Market Holidays 2020" :year 2020 :uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :published-in "Euronext Athens website, Trading Calendar - Market Holiday list (paginated ?page=0..31), fetched 2026-11-28"
    :dates-note "Issue/publication dates not shown. Western 10/13 Apr, Orthodox 17/20 Apr, 24 Dec."
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext Athens (ATHEX) Market Holidays 2021" :year 2021 :uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :published-in "Euronext Athens website, Trading Calendar - Market Holiday list (paginated ?page=0..31), fetched 2026-11-28"
    :dates-note "Issue/publication dates not shown. Labour Day on Tue 4 May 2021 (moved); Western 2/5 Apr; 24 Dec."
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext Athens (ATHEX) Market Holidays 2022" :year 2022 :uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :published-in "Euronext Athens website, Trading Calendar - Market Holiday list (paginated ?page=0..31), fetched 2026-11-28"
    :dates-note "Issue/publication dates not shown. Labour Day on Mon 2 May 2022; Western 15/18 Apr."
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext Athens (ATHEX) Market Holidays 2023" :year 2023 :uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :published-in "Euronext Athens website, Trading Calendar - Market Holiday list (paginated ?page=0..31), fetched 2026-11-28"
    :dates-note "Issue/publication dates not shown. Western 7/10 Apr, Orthodox 14/17 Apr."
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext Athens (ATHEX) Market Holidays 2024" :year 2024 :uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :published-in "Euronext Athens website, Trading Calendar - Market Holiday list (paginated ?page=0..31), fetched 2026-11-28"
    :dates-note "Issue/publication dates not shown. Lists both 1 May and 7 May 2024 (Labour Day moved); Western 29 Mar/1 Apr; 24 Dec."
    :closed (((2024 5 1) "Labour Day (market closed; civil holiday moved to 7 May)")) :open () :early-closes () :late-opens ())
   (:title "Euronext Athens (ATHEX) Market Holidays 2025" :year 2025 :uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :published-in "Euronext Athens website, Trading Calendar - Market Holiday list (paginated ?page=0..31), fetched 2026-11-28"
    :dates-note "Issue/publication dates not shown. Easter coincides; 24 Dec; 31 Dec 2025 not listed (session)."
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext Athens (ATHEX) Market Holidays 2026" :year 2026 :uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :published-in "Euronext Athens website, Trading Calendar - Market Holiday list (paginated ?page=0..31), fetched 2026-11-28"
    :dates-note "Issue/publication dates not shown. Western 3/6 Apr, Orthodox 10/13 Apr, 24 Dec; 31 Dec 2026 not listed (session)."
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext Athens (ATHEX) Market Holidays 2027" :year 2027 :uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://athens.euronext.com/en/trade/trading-model/calendar"
    :published-in "Euronext Athens website, Trading Calendar - Market Holiday list (paginated ?page=0..31), fetched 2026-11-28"
    :dates-note "Issue/publication dates not shown. Western 26/29 Mar, Orthodox 30 Apr/3 May, 24 Dec AND 31 Dec 2027 (New Year's Eve) - first year with 31 Dec."
    :closed (((2027 12 31) "New Year's Eve (Euronext Athens)")) :open () :early-closes () :late-opens ())))
