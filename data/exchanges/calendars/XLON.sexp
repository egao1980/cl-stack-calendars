;;;; XLON — London Stock Exchange trading days (research draft, cl-stack-calendars #49).
;;;; Sources cached under ~/.cache/cl-stack-calendars/exchanges/xlon/ (wb-<timestamp>-*.html = Wayback
;;;; snapshots; live*.doc = LSE Service Announcements; n1622.pdf = Market Notice N16/22).
;;;; Finding: every LSE list found (2003-2014 on londonstockexchange.com, 2014-2020 on lseg.com,
;;;; 2020-2023 and 2026-2029 on londonstockexchange.com) closes exactly on the England & Wales
;;;; public/bank holidays, incl. the special ones in the lists (2011-04-29, 2012-06-04/05,
;;;; 2020-05-08, 2022-06-02/03, 2022-09-19). No LSE-only closure and no session on an
;;;; England & Wales bank holiday was found. => base calendar GBLO, no extra rules.
(:name "XLON"
 :title "London Stock Exchange trading days"
 :authority "London Stock Exchange, \"What are our business days?\" (Business days page): \"London Stock Exchange generally operates its Trading Services each weekday. It does however, recognise the Public and Bank Holidays of England & Wales\""
 :authority-uri "https://www.londonstockexchange.com/en/resources/markets-products/business-days"
 :bases ((:calendar "GBLO" :from nil :to nil
          :authority "LSE Business days page (2010 wording): \"The Exchange operates its Trading Services each weekday excluding Public and Bank Holidays in England & Wales\" https://web.archive.org/web/20101203104856/http://www.londonstockexchange.com/about-the-exchange/company-overview/business-days/business-days.htm ; 2004 wording: \"The Public and Bank Holidays in England and Wales for 2004/05 are set out below. We will be closed for business on these dates.\" https://web.archive.org/web/20041208055430/http://www.londonstockexchange.com:80/en-gb/about/cooverview/businessdays.htm"))
 :rules ()
 :notices
 ((:title "Service Announcement Live 60/03: Christmas and New Year service arrangements 2003/2004"
   :year 2003
   :uri "http://www.londonstockexchange.com/products-and-services/technical-library/service-announcements/2003/live6003-xmas2003servicearrangementsdoc.doc"
   :issued (2003 10 27) :issued-uri "https://web.archive.org/web/2006/http://www.londonstockexchange.com/products-and-services/technical-library/service-announcements/2003/live6003-xmas2003servicearrangementsdoc.doc"
   :published (2003 10 27) :published-uri "https://web.archive.org/web/2006/http://www.londonstockexchange.com/products-and-services/technical-library/service-announcements/2003/live6003-xmas2003servicearrangementsdoc.doc"
   :published-in "LSE Service Announcement (Trading and LMIL), Live 60/03" :dates-note nil
   :closed () :open ()
   :early-closes (((2003 12 24) (12 30) "Markets close from 12.30; SETS closing auction call 12:30, execution 12:35")
                  ((2003 12 31) (12 30) "Markets close from 12.30"))
   :late-opens ()
   :note "Confirms 25, 26 Dec 2003 and 1 Jan 2004 closed all day (= GBLO). SETS order book trading starts 08:00 on these days.")
  (:title "LSE Business days 2004/05"
   :year 2004
   :uri "https://web.archive.org/web/20041208055430/http://www.londonstockexchange.com:80/en-gb/about/cooverview/businessdays.htm"
   :issued nil :issued-uri nil
   :published (2004 12 8) :published-uri "https://web.archive.org/web/20041208055430/http://www.londonstockexchange.com:80/en-gb/about/cooverview/businessdays.htm"
   :published-in "exchange website (Wayback snapshot)"
   :dates-note "Page is undated; :published = Wayback capture date. Lists 2004: 1 Jan, 9 Apr, 12 Apr, 3 May, 31 May, 30 Aug, 27 Dec, 28 Dec; 2005: 3 Jan. Early closes for 2004 not stated on the page (the 'Christmas and New Year service arrangements 2004/05' link, Live 66/04, was not retrievable)."
   :closed () :open () :early-closes () :late-opens ())
  (:title "LSE Business days 2005 + Christmas and New Year service arrangements 2005/06"
   :year 2005
   :uri "https://web.archive.org/web/20051107173624/http://www.londonstockexchange.com:80/en-gb/about/cooverview/businessdays/Christmas+and+New+Year+trading+days/"
   :issued (2005 11 7) :issued-uri "https://web.archive.org/web/2006/http://www.londonstockexchange.com/products-and-services/technical-library/service-announcements/2005/live6605christmasandnewyearservicearrangementsdoc.doc"
   :published (2005 11 7) :published-uri "https://web.archive.org/web/20051107173624/http://www.londonstockexchange.com:80/en-gb/about/cooverview/businessdays/Christmas+and+New+Year+trading+days/"
   :published-in "exchange website; Service Announcement Live 66/05"
   :dates-note "2005 holiday list from https://web.archive.org/web/20050903125908/http://www.londonstockexchange.com:80/en-gb/about/cooverview/businessdays.htm : 3 Jan, 25 Mar, 28 Mar, 2 May, 30 May, 29 Aug, 26 Dec, 27 Dec (= GBLO). That snapshot misprints 2004 Summer as 'Monday 20 August'; the 2004 snapshot has 30 August."
   :closed () :open ()
   :early-closes (((2005 12 23) (12 30) "Markets close at 12.30") ((2005 12 30) (12 30) "Markets close at 12.30"))
   :late-opens ())
  (:title "LSE Business days 2006 + Christmas and New Year service arrangements 2006/07"
   :year 2006
   :uri "https://web.archive.org/web/20061210005744/http://www.londonstockexchange.com:80/en-gb/about/cooverview/businessdays/Christmas+and+New+Year+trading+days/"
   :issued (2006 10 20) :issued-uri "https://web.archive.org/web/2006/http://www.londonstockexchange.com/products-and-services/technical-library/service-announcements/2006/live4106-xmasandnewyearservicearrangementsdoc.doc"
   :published (2005 12 5) :published-uri "https://web.archive.org/web/20051205084423/http://www.londonstockexchange.com:80/en-gb/about/cooverview/businessdays/"
   :published-in "exchange website; Service Announcement Live 41/06 (20 Oct 2006); Live 70/05 (30 Nov 2005) announced the 2006 schedule"
   :dates-note "2006 list (snapshot 2005-12-05): 2 Jan, 14 Apr, 17 Apr, 1 May, 29 May, 28 Aug, 25 Dec, 26 Dec (= GBLO)."
   :closed () :open ()
   :early-closes (((2006 12 22) (12 30) "Markets close at 12.30") ((2006 12 29) (12 30) "Markets close at 12.30"))
   :late-opens ())
  (:title "LSE Business days 2007 + Christmas and New Year Service Arrangements 2007/08"
   :year 2007
   :uri "https://web.archive.org/web/20071223161453/http://www.londonstockexchange.com:80/en-gb/about/cooverview/businessdays/Christmas+and+New+Year+trading+days/"
   :issued nil :issued-uri nil
   :published (2006 12 7) :published-uri "https://web.archive.org/web/20061207174604/http://www.londonstockexchange.com:80/en-gb/about/cooverview/businessdays/"
   :published-in "exchange website (Wayback); Christmas page cites 'Live 108/2007'"
   :dates-note "2007 list (snapshot 2006-12-07): 1 Jan, 6 Apr, 9 Apr, 7 May, 28 May, 27 Aug, 25 Dec, 26 Dec. Live 108/2007 itself not retrieved."
   :closed () :open ()
   :early-closes (((2007 12 24) (12 30) "Markets close from 12.30") ((2007 12 31) (12 30) "Markets close from 12.30"))
   :late-opens ())
  (:title "LSE Business days 2008 + Christmas and New Year Service Arrangements 2008/09"
   :year 2008
   :uri "https://web.archive.org/web/20081202072630/http://www.londonstockexchange.com/en-gb/about/cooverview/businessdays/Christmas+and+New+Year+trading+days/"
   :issued nil :issued-uri nil
   :published (2007 12 21) :published-uri "https://web.archive.org/web/20071221022222/http://www.londonstockexchange.com:80/en-gb/about/cooverview/businessdays/"
   :published-in "exchange website (Wayback)"
   :dates-note "2008 list (snapshot 2007-12-21): 1 Jan, 21 Mar, 24 Mar, 5 May, 26 May, 25 Aug, 25 Dec, 26 Dec."
   :closed () :open ()
   :early-closes (((2008 12 24) (12 30) "Markets close from 12.30") ((2008 12 31) (12 30) "Markets close from 12.30"))
   :late-opens ())
  (:title "LSE Business days 2009"
   :year 2009
   :uri "https://web.archive.org/web/20081211184506/https://www.londonstockexchange.com/en-gb/about/cooverview/businessdays/"
   :issued nil :issued-uri nil
   :published (2008 12 11) :published-uri "https://web.archive.org/web/20081211184506/https://www.londonstockexchange.com/en-gb/about/cooverview/businessdays/"
   :published-in "exchange website (Wayback)"
   :dates-note "2009 list: 1 Jan, 10 Apr, 13 Apr, 4 May, 25 May, 31 Aug, 25 Dec, 28 Dec; 2010: 1 Jan. Also https://web.archive.org/web/20091204105803/http://www.londonstockexchange.com/about-the-exchange/company-overview/business-days/business-days.htm"
   :closed () :open ()
   :early-closes (((2009 12 24) (12 30) "all Exchange markets will close from 12:30 London time onwards")
                  ((2009 12 31) (12 30) "all Exchange markets will close from 12:30 London time onwards"))
   :late-opens ())
  (:title "LSE Business days 2010"
   :year 2010
   :uri "https://web.archive.org/web/20091204105803/http://www.londonstockexchange.com/about-the-exchange/company-overview/business-days/business-days.htm"
   :issued nil :issued-uri nil
   :published (2009 12 4) :published-uri "https://web.archive.org/web/20091204105803/http://www.londonstockexchange.com/about-the-exchange/company-overview/business-days/business-days.htm"
   :published-in "exchange website (Wayback)"
   :dates-note "2010 list: 1 Jan, 2 Apr, 5 Apr, 3 May, 31 May, 30 Aug, 27 Dec, 28 Dec; 2011: 3 Jan."
   :closed () :open ()
   :early-closes (((2010 12 24) (12 30) "close from 12:30 London time onwards") ((2010 12 31) (12 30) "close from 12:30 London time onwards"))
   :late-opens ())
  (:title "LSE Business days 2011 (incl. Royal Wedding)"
   :year 2011
   :uri "https://web.archive.org/web/20101203104856/http://www.londonstockexchange.com/about-the-exchange/company-overview/business-days/business-days.htm"
   :issued nil :issued-uri nil
   :published (2010 12 3) :published-uri "https://web.archive.org/web/20101203104856/http://www.londonstockexchange.com/about-the-exchange/company-overview/business-days/business-days.htm"
   :published-in "exchange website (Wayback)"
   :dates-note "2011 list: 3 Jan, 22 Apr, 25 Apr, Royal Wedding Fri 29 Apr, 2 May, 30 May, 29 Aug, 26 Dec, 27 Dec (= GBLO incl. 2011-04-29)."
   :closed () :open ()
   :early-closes (((2011 12 23) (12 30) "close from 12:30 London time onwards") ((2011 12 30) (12 30) "close from 12:30 London time onwards"))
   :late-opens ())
  (:title "LSE Business days 2012 (incl. Diamond Jubilee)"
   :year 2012
   :uri "https://web.archive.org/web/20111227075826/http://www.londonstockexchange.com/about-the-exchange/company-overview/business-days/business-days.htm"
   :issued nil :issued-uri nil
   :published (2011 12 27) :published-uri "https://web.archive.org/web/20111227075826/http://www.londonstockexchange.com/about-the-exchange/company-overview/business-days/business-days.htm"
   :published-in "exchange website (Wayback)"
   :dates-note "2012 list: 2 Jan, 6 Apr, 9 Apr, 7 May, Spring Mon 4 Jun, Queen's Diamond Jubilee Tue 5 Jun, 27 Aug, 25 Dec, 26 Dec (= GBLO)."
   :closed () :open ()
   :early-closes (((2012 12 24) (12 30) "close from 12.30 London time onwards") ((2012 12 31) (12 30) "close from 12.30 London time onwards"))
   :late-opens ())
  (:title "LSE Business days 2013"
   :year 2013
   :uri "https://web.archive.org/web/20121215073643/http://www.londonstockexchange.com/about-the-exchange/company-overview/business-days/business-days.htm"
   :issued nil :issued-uri nil
   :published (2012 12 15) :published-uri "https://web.archive.org/web/20121215073643/http://www.londonstockexchange.com/about-the-exchange/company-overview/business-days/business-days.htm"
   :published-in "exchange website (Wayback)"
   :dates-note "2013 list: 1 Jan, 29 Mar, 1 Apr, 6 May, 27 May, 26 Aug, 25 Dec, 26 Dec."
   :closed () :open ()
   :early-closes (((2013 12 24) (12 30) "Markets closing process commences from 12:30 London time") ((2013 12 31) (12 30) "Markets closing process commences from 12:30 London time"))
   :late-opens ())
  (:title "LSE Business days 2014"
   :year 2014
   :uri "https://web.archive.org/web/20131224192557/http://www.londonstockexchange.com:80/about-the-exchange/company-overview/business-days/business-days.htm"
   :issued nil :issued-uri nil
   :published (2013 12 24) :published-uri "https://web.archive.org/web/20131224192557/http://www.londonstockexchange.com:80/about-the-exchange/company-overview/business-days/business-days.htm"
   :published-in "exchange website (Wayback)"
   :dates-note "2014 list: 1 Jan, 18 Apr, 21 Apr, 5 May, 26 May, 25 Aug, 25 Dec, 26 Dec."
   :closed () :open ()
   :early-closes (((2014 12 24) (12 30) "Markets closing process commences from 12:30") ((2014 12 31) (12 30) "Markets closing process commences from 12:30"))
   :late-opens ())
  (:title "LSE Business days 2015 (lseg.com)"
   :year 2015
   :uri "https://web.archive.org/web/20141209182034/http://www.lseg.com/areas-expertise/our-markets/london-stock-exchange/equities-markets/trading-services/business-days"
   :issued nil :issued-uri nil
   :published (2014 12 9) :published-uri "https://web.archive.org/web/20141209182034/http://www.lseg.com/areas-expertise/our-markets/london-stock-exchange/equities-markets/trading-services/business-days"
   :published-in "exchange website (lseg.com, Wayback)"
   :dates-note "2015 list: 1 Jan, 3 Apr, 6 Apr, 4 May, 25 May, 31 Aug, 25 Dec, 28 Dec (Boxing Day holiday)."
   :closed () :open ()
   :early-closes (((2015 12 24) (12 30) "Markets closing process commences from 12:30") ((2015 12 31) (12 30) "Markets closing process commences from 12:30"))
   :late-opens ())
  (:title "LSE Business days 2016 (lseg.com)"
   :year 2016
   :uri "https://web.archive.org/web/20151221080205/http://www.lseg.com/areas-expertise/our-markets/london-stock-exchange/equities-markets/trading-services/business-days"
   :issued nil :issued-uri nil
   :published (2015 12 21) :published-uri "https://web.archive.org/web/20151221080205/http://www.lseg.com/areas-expertise/our-markets/london-stock-exchange/equities-markets/trading-services/business-days"
   :published-in "exchange website (lseg.com, Wayback)"
   :dates-note "2016 list: 1 Jan, 25 Mar, 28 Mar, 2 May, 30 May, 29 Aug, 26 Dec, 27 Dec; 2017: 2 Jan."
   :closed () :open ()
   :early-closes (((2016 12 23) (12 30) "Markets closing process commences from 12:30") ((2016 12 30) (12 30) "Markets closing process commences from 12:30"))
   :late-opens ())
  (:title "LSE Business days 2017 (lseg.com)"
   :year 2017
   :uri "https://web.archive.org/web/20161111204916/http://www.lseg.com/areas-expertise/our-markets/london-stock-exchange/equities-markets/trading-services/business-days"
   :issued nil :issued-uri nil
   :published (2016 11 11) :published-uri "https://web.archive.org/web/20161111204916/http://www.lseg.com/areas-expertise/our-markets/london-stock-exchange/equities-markets/trading-services/business-days"
   :published-in "exchange website (lseg.com, Wayback)"
   :dates-note "2017 list: 2 Jan, 14 Apr, 17 Apr, 1 May, 29 May, 28 Aug, 25 Dec, 26 Dec; 2018: 1 Jan."
   :closed () :open ()
   :early-closes (((2017 12 22) (12 30) "Markets closing process commences from 12:30") ((2017 12 29) (12 30) "Markets closing process commences from 12:30"))
   :late-opens ())
  (:title "LSE Business days 2018 (lseg.com)"
   :year 2018
   :uri "https://web.archive.org/web/20181001173859/http://www.lseg.com/areas-expertise/our-markets/london-stock-exchange/equities-markets/trading-services/business-days"
   :issued nil :issued-uri nil
   :published (2017 8 11) :published-uri "https://web.archive.org/web/20170811193820/http://www.lseg.com/areas-expertise/our-markets/london-stock-exchange/equities-markets/trading-services/business-days"
   :published-in "exchange website (lseg.com, Wayback)"
   :dates-note "2018 list across snapshots 2017-08-11, 2018-03-03, 2018-10-01: 1 Jan, 30 Mar, 2 Apr, 7 May, 28 May, 27 Aug, 25 Dec, 26 Dec."
   :closed () :open ()
   :early-closes (((2018 12 24) (12 30) "Markets closing process commences from 12:30") ((2018 12 31) (12 30) "Markets closing process commences from 12:30"))
   :late-opens ())
  (:title "LSE Business days 2019 (lseg.com)"
   :year 2019
   :uri "https://web.archive.org/web/20190614074153/http://www.lseg.com/areas-expertise/our-markets/london-stock-exchange/equities-markets/trading-services/business-days"
   :issued nil :issued-uri nil
   :published (2018 10 1) :published-uri "https://web.archive.org/web/20181001173859/http://www.lseg.com/areas-expertise/our-markets/london-stock-exchange/equities-markets/trading-services/business-days"
   :published-in "exchange website (lseg.com, Wayback)"
   :dates-note "2019 list across snapshots 2018-10-01, 2019-06-14: 1 Jan, 19 Apr, 22 Apr, 6 May, 27 May, 26 Aug, 25 Dec, 26 Dec."
   :closed () :open ()
   :early-closes (((2019 12 24) (12 30) "Markets closing process commences from 12:30") ((2019 12 31) (12 30) "Markets closing process commences from 12:30"))
   :late-opens ())
  (:title "LSE Business days 2020 (incl. VE Day move)"
   :year 2020
   :uri "https://web.archive.org/web/20200605131703/http://www.lseg.com/areas-expertise/our-markets/london-stock-exchange/equities-markets/trading-services/business-days"
   :issued nil :issued-uri nil
   :published (2019 6 14) :published-uri "https://web.archive.org/web/20190614074153/http://www.lseg.com/areas-expertise/our-markets/london-stock-exchange/equities-markets/trading-services/business-days"
   :published-in "exchange website (lseg.com, Wayback)"
   :dates-note "2020 list: 1 Jan, 10 Apr, 13 Apr, 'Early May Bank Holiday (VE Day)' Fri 8 May, 25 May, 31 Aug, 25 Dec, 28 Dec (Boxing Day substitute). The 8 May entry is already on the 2019-06-14 snapshot. Mon 4 May 2020 is not listed (trading day), consistent with GBLO's 2020 transfer."
   :closed () :open ()
   :early-closes (((2020 12 24) (12 30) "Markets closing process commences from 12:30") ((2020 12 31) (12 30) "Markets closing process commences from 12:30"))
   :late-opens ())
  (:title "LSE Business days 2021"
   :year 2021
   :uri "https://web.archive.org/web/20201221145636/https://www.londonstockexchange.com/trade/trading-access/business-days"
   :issued nil :issued-uri nil
   :published (2020 12 21) :published-uri "https://web.archive.org/web/20201221145636/https://www.londonstockexchange.com/trade/trading-access/business-days"
   :published-in "exchange website (Wayback)"
   :dates-note "2021 list: 1 Jan, 2 Apr, 5 Apr, 3 May, 31 May, 30 Aug, 27 Dec (Christmas Day substitute), 28 Dec (Boxing Day substitute); 2022: 3 Jan."
   :closed () :open ()
   :early-closes (((2021 12 24) (12 30) "Markets closing process commences from 12:30") ((2021 12 31) (12 30) "Markets closing process commences from 12:30"))
   :late-opens ())
  (:title "LSE Business days 2022 (incl. Platinum Jubilee)"
   :year 2022
   :uri "https://web.archive.org/web/20211223102811/https://www.londonstockexchange.com/trade/trading-access/business-days"
   :issued nil :issued-uri nil
   :published (2021 12 23) :published-uri "https://web.archive.org/web/20211223102811/https://www.londonstockexchange.com/trade/trading-access/business-days"
   :published-in "exchange website (Wayback)"
   :dates-note "2022 list: 3 Jan, 15 Apr, 18 Apr, 2 May, Spring Thu 2 Jun, Platinum Jubilee Fri 3 Jun, 29 Aug, 26 Dec, 27 Dec (Christmas Day substitute); 2023: 2 Jan. 19 Sep 2022 added later by N16/22 (separate notice)."
   :closed () :open ()
   :early-closes (((2022 12 23) (12 30) "Christmas Holiday half day; closing process from 12:30") ((2022 12 30) (12 30) "New Year Holiday half day; closing process from 12:30"))
   :late-opens ())
  (:title "Market Notice N16/22 - Trading Update (State Funeral of Queen Elizabeth II)"
   :uri "https://docs.londonstockexchange.com/sites/default/files/documents/n1622.pdf"
   :issued (2022 9 12) :issued-uri "https://web.archive.org/web/20260327035706/https://docs.londonstockexchange.com/sites/default/files/documents/n1622.pdf"
   :published (2022 9 12) :published-uri "https://web.archive.org/web/20260327035706/https://docs.londonstockexchange.com/sites/default/files/documents/n1622.pdf"
   :published-in "LSE Market Notice N16/22" :dates-note "Live URL now returns 403; text from Wayback copy."
   :closed () :open () :early-closes () :late-opens ()
   :note "\"The day of the funeral ... 19 September 2022, has been declared a UK bank holiday, therefore, London Stock Exchange ... on Exchange markets will be closed.\" Already produced by GBLO (proclamation), so no :closed row needed.")
  (:title "LSE Business days 2023 (partial: published before the Coronation bank holiday was proclaimed)"
   :year 2023
   :uri "https://web.archive.org/web/20220707035146/https://www.londonstockexchange.com/trade/trading-access/business-days"
   :issued nil :issued-uri nil
   :published (2022 7 7) :published-uri "https://web.archive.org/web/20220707035146/https://www.londonstockexchange.com/trade/trading-access/business-days"
   :published-in "exchange website (Wayback)"
   :dates-note "Lists 2 Jan, 7 Apr, 10 Apr, 1 May, 29 May, 28 Aug 2023. Mon 8 May 2023 (Coronation) and Christmas 2023 are NOT covered: all later Wayback captures of this page (2022-12 .. 2026-03) are JavaScript shells without the table, and no LSE notice for the Coronation was found."
   :closed () :open () :early-closes () :late-opens ())
  (:title "LSE Anticipated settlement calendar 2026 (settlement holidays)"
   :year 2026
   :uri "https://www.londonstockexchange.com/content/dam/lse/en_us/documents/guides/settlement-calendar.xlsx"
   :issued (2026 1 28) :issued-uri "https://www.londonstockexchange.com/content/dam/lse/en_us/documents/guides/settlement-calendar.xlsx"
   :published (2026 1 28) :published-uri "https://www.londonstockexchange.com/content/dam/lse/en_us/documents/guides/settlement-calendar.xlsx"
   :published-in "exchange website (XLSX, 'Last updated 28 January 2026')"
   :dates-note "Settlement (not trading) calendar; GBP column marks 1 Jan, 3 Apr, 6 Apr, 4 May, 25 May, 31 Aug, 25 Dec, 28 Dec 2026 = GBLO 2026. Used as the best available 2026 evidence before the Dec-2026 page."
   :closed () :open () :early-closes () :late-opens ())
  (:title "LSE Business days (current page) Dec 2026 - Jan 2029"
   :year 2027
   :uri "https://www.londonstockexchange.com/en/resources/markets-products/business-days"
   :issued nil :issued-uri nil
   :published (2026 11 28) :published-uri "https://www.londonstockexchange.com/en/resources/markets-products/business-days"
   :published-in "exchange website (fetched 2026-11-28; Wayback has 20261025222621)"
   :dates-note "Covers 24 Dec 2026 .. 1 Jan 2029. 2027: 1 Jan, 26 Mar, 29 Mar, 3 May, 31 May, 30 Aug, 27 Dec (Christmas Day substitute), 28 Dec (Boxing Day substitute); 2028: 3 Jan, 14 Apr, 17 Apr, 1 May, 29 May, 28 Aug, 25 Dec, 26 Dec; 2029: 1 Jan."
   :closed () :open ()
   :early-closes (((2026 12 24) (12 30) "Christmas Holiday half day") ((2026 12 31) (12 30) "New Year's Holiday half day")
                  ((2027 12 24) (12 30) "Christmas Holiday half day") ((2027 12 31) (12 30) "New Year's Holiday half day")
                  ((2028 12 22) (12 30) "Christmas Holiday half day") ((2028 12 29) (12 30) "New Year's Holiday half day"))
   :late-opens ())))
