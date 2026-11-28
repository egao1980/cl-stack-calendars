;;;; XEUR draft (cl-stack-calendars #49). Exchange-wide closures only; product-level holidays
;;;; (German equity/index derivatives on FWB non-trading days, foreign-market products) are not modelled.

(:name "XEUR"
 :title "Eurex (Eurex Deutschland) exchange-wide trading days"
 :authority "Eurex Frankfurt AG, yearly Eurex trading calendar ('Overview of holidays by countries'), archive 2012-2026" :authority-uri "https://www.eurex.com/ex-en/trade/trading-calendar/holiday-regulations"
 :rules ((:fixed "New Year's Day" 1 1 :authority "Eurex trading calendars 2012-2026: closed for trading and clearing in all derivatives")
         (:easter "Good Friday" -2 :authority "Eurex trading calendars 2012-2026")
         (:easter "Easter Monday" 1 :authority "Eurex trading calendars 2012-2026")
         (:fixed "Labour Day" 5 1 :authority "Eurex trading calendars 2012-2026")
         (:fixed "Christmas Eve" 12 24 :authority "Eurex trading calendars: closed for trading in all derivatives (clearing open since 2008, circular 233/10)")
         (:fixed "Christmas Day" 12 25 :authority "Eurex trading calendars 2012-2026")
         (:fixed "Boxing Day" 12 26 :authority "Eurex trading calendars 2012-2026")
         (:fixed "New Year's Eve" 12 31 :authority "Eurex trading calendars: closed for trading in all derivatives"))
 :notices (
   (:title "Eurex circular 086/06: holiday regulations 25 May, 29 May, 5 June, 23 June 2006"
    :uri "https://www.eurex.com/resource/blob/298718/49c7e463e9c98db2fd210556070f48e6/data/cf0862006e.pdf.pdf"
    :issued (2006 5 4) :issued-uri "https://www.eurex.com/resource/blob/298718/49c7e463e9c98db2fd210556070f48e6/data/cf0862006e.pdf.pdf"
    :published (2006 5 4) :published-uri "https://www.eurex.com/resource/blob/298718/49c7e463e9c98db2fd210556070f48e6/data/cf0862006e.pdf.pdf"
    :published-in "Eurex circular 086/06"
    :dates-note nil
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Ascension (25 May 2006) and Whit Monday (5 June 2006): Eurex open; only Swiss (and Finnish) products not traded. Evidence that German Ascension/Whit Monday were Eurex trading days in 2006.")
   (:title "Eurex circular 233/10: trading hours at year-end 2010; 24 and 31 December 2010" :year 2010
    :uri "https://www.eurex.com/ex-en/find/circulars/Trading-Hours-at-Eurex-Year-End-2010-Clearing-Settlement-and-Cash-Payments-on-December-24-30-and-31-2010-198668"
    :issued (2010 11 30) :issued-uri "https://www.eurex.com/resource/blob/198658/16309891b8dd4aa9c035564b0de1baff/data/cf2332010e.pdf.pdf"
    :published (2010 11 30) :published-uri "https://www.eurex.com/ex-en/find/circulars/Trading-Hours-at-Eurex-Year-End-2010-Clearing-Settlement-and-Cash-Payments-on-December-24-30-and-31-2010-198668"
    :published-in "Eurex circular 233/10"
    :dates-note nil
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Last exchange trading day 30 Dec 2010; 24 and 31 Dec 2010 settlement days with no trading in any product (since 2008 they are settlement days). Year-end trading phases on the last trading day are product-specific (attachment), so no exchange-wide early close is modelled.")
   (:title "Eurex trading calendar 2012, holiday overview" :year 2012
    :uri "https://www.eurex.com/resource/blob/284994/e988f1cef4437150c0a74a5a8f285d64/data/tradingcalendar_2012_en.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.eurex.com/ex-en/trade/trading-calendar/trading-calendar-archive"
    :published-in "Eurex trading calendar (archive)"
    :dates-note "No issue date on the sheet; PDF CreationDate 2012-09-26 (this copy may be a later revision)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange-wide: 'closed for trading and clearing (exercise, settlement and cash) in all derivatives: Apr 6, Apr 9, May 1, Dec 25, Dec 26'; 'closed for trading in all derivatives: Dec 24, Dec 31'.")
   (:title "Eurex trading calendar 2013, holiday overview" :year 2013
    :uri "https://www.eurex.com/resource/blob/244836/3ad19654e330995e7d07e4da214ccecd/data/tradingcalendar_2013_en.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.eurex.com/ex-en/trade/trading-calendar/trading-calendar-archive"
    :published-in "Eurex trading calendar (archive)"
    :dates-note "No issue date on the sheet; PDF CreationDate 2013-10-02 (this copy may be a later revision)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange-wide: 'closed for trading and clearing (exercise, settlement and cash) in all derivatives: Jan 1, Mar 29, Apr 1, May 1, Dec 25, Dec 26'; 'closed for trading in all derivatives: Dec 24, Dec 31'.")
   (:title "Eurex trading calendar 2014, holiday overview" :year 2014
    :uri "https://www.eurex.com/resource/blob/249120/6fadad3fe12a3cc3fa392442532d4414/data/tradingcalendar_2014_en.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.eurex.com/ex-en/trade/trading-calendar/trading-calendar-archive"
    :published-in "Eurex trading calendar (archive)"
    :dates-note "No issue date on the sheet; PDF CreationDate 2014-11-10 (this copy may be a later revision)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange-wide: 'closed for trading and clearing (exercise, settlement and cash) in all derivatives: 1 Jan, 18 Apr, 21 Apr, 1 May, 25 Dec, 26 Dec'; 'closed for trading in all derivatives: 24 Dec, 31 Dec'. Product-level only (exchange open): 'closed for trading and exercise in German equity (and equity index) derivatives ... based on Xetra listings: 3 October'.")
   (:title "Eurex trading calendar 2015, holiday overview" :year 2015
    :uri "https://www.eurex.com/resource/blob/243714/8c6cea18bbe820e719a578e3bd94976c/data/tradingcalendar_2015_en.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.eurex.com/ex-en/trade/trading-calendar/trading-calendar-archive"
    :published-in "Eurex trading calendar (archive)"
    :dates-note "No issue date on the sheet; PDF CreationDate 2015-10-28 (this copy may be a later revision)."
    :closed (((2015 5 25) "Whit Monday: Eurex closed for trading in all derivatives"))
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange-wide: 'closed for trading and clearing (exercise, settlement and cash) in all derivatives: 1 Jan, 3 Apr, 6 Apr, 1 May, 25 Dec, 26 Dec'; 'closed for trading in all derivatives: 25 May, 24 Dec, 31 Dec'.")
   (:title "Eurex trading calendar 2016, holiday overview" :year 2016
    :uri "https://www.eurex.com/resource/blob/1260/f42d8f907b73ce30a66148cc287f2fe8/data/tradingcalendar_2016_en.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.eurex.com/ex-en/trade/trading-calendar/trading-calendar-archive"
    :published-in "Eurex trading calendar (archive)"
    :dates-note "No issue date on the sheet; PDF CreationDate 2016-07-07 (this copy may be a later revision)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange-wide: 'closed for trading and clearing (exercise, settlement and cash) in all derivatives: 1 Jan, 25 Mar, 28 Mar, 26 Dec'; 'closed for trading in all derivatives: (none listed: 24/31 Dec are Saturdays)'. Product-level only (exchange open): 'closed for trading and exercise in German equity (and equity index) derivatives ... based on Xetra listings: 16 May, 3 October'.")
   (:title "Eurex trading calendar 2017, holiday overview" :year 2017
    :uri "https://www.eurex.com/resource/blob/241960/7dc968da8ed8d80fa004bd695ac9b648/data/tradingcalendar_2017_en.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.eurex.com/ex-en/trade/trading-calendar/trading-calendar-archive"
    :published-in "Eurex trading calendar (archive)"
    :dates-note "No issue date on the sheet; PDF CreationDate 2017-09-26 (this copy may be a later revision)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange-wide: 'closed for trading and clearing (exercise, settlement and cash) in all derivatives: 14 Apr, 17 Apr, 1 May, 25 Dec, 26 Dec'; 'closed for trading in all derivatives: (none listed: 24/31 Dec are Sundays)'. Product-level only (exchange open): 'closed for trading and exercise in German equity (and equity index) derivatives ... based on Xetra listings: 5 June, 3 October, 31 October'.")
   (:title "Eurex trading calendar 2018, holiday overview" :year 2018
    :uri "https://www.eurex.com/resource/blob/2806/32828d43772ac5ee3dd3d77a79743b47/data/tradingcalendar_2018_en.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.eurex.com/ex-en/trade/trading-calendar/trading-calendar-archive"
    :published-in "Eurex trading calendar (archive)"
    :dates-note "No issue date on the sheet; PDF CreationDate 2018-10-29 (this copy may be a later revision)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange-wide: 'closed for trading and clearing (exercise, settlement and cash) in all derivatives: 1 Jan, 30 Mar, 2 Apr, 1 May, 25 Dec, 26 Dec'; 'closed for trading in all derivatives: 24 Dec, 31 Dec'. Product-level only (exchange open): 'closed for trading and exercise in German equity (and equity index) derivatives ... based on Xetra listings: 21 May, 3 October'.")
   (:title "Eurex trading calendar 2019, holiday overview" :year 2019
    :uri "https://www.eurex.com/resource/blob/1396378/2915487ad1e2f7d56508e1bd2f056995/data/tradingcalendar_2019_en.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.eurex.com/ex-en/trade/trading-calendar/trading-calendar-archive"
    :published-in "Eurex trading calendar (archive)"
    :dates-note "No issue date on the sheet; PDF CreationDate 2019-02-12 (this copy may be a later revision)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange-wide: 'closed for trading and clearing (exercise, settlement and cash) in all derivatives: 1 Jan, 19 Apr, 22 Apr, 1 May, 25 Dec, 26 Dec'; 'closed for trading in all derivatives: 24 Dec, 31 Dec'. Product-level only (exchange open): 'closed for trading and exercise in German equity (and equity index) derivatives ... based on Xetra listings: 10 June, 3 October (index futures trade)'.")
   (:title "Eurex trading calendar 2020, holiday overview" :year 2020
    :uri "https://www.eurex.com/resource/blob/1690338/91db2a4864f0634f3ff1695ff0dddde5/data/tradingcalendar_2020_en.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.eurex.com/ex-en/trade/trading-calendar/trading-calendar-archive"
    :published-in "Eurex trading calendar (archive)"
    :dates-note "No issue date on the sheet; PDF CreationDate 2020-10-01 (this copy may be a later revision)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange-wide: 'closed for trading and clearing (exercise, settlement and cash) in all derivatives: 1 Jan, 10 Apr, 13 Apr, 1 May, 25 Dec'; 'closed for trading in all derivatives: 24 Dec, 31 Dec'. Product-level only (exchange open): 'closed for trading and exercise in German equity (and equity index) derivatives ... based on Xetra listings: 1 June (index futures trade)'.")
   (:title "Eurex trading calendar 2021, holiday overview" :year 2021
    :uri "https://www.eurex.com/resource/blob/2348622/f4f9a1b370f2e74462532319f2b15ddb/data/tradingcalendar_2021_en.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.eurex.com/ex-en/trade/trading-calendar/trading-calendar-archive"
    :published-in "Eurex trading calendar (archive)"
    :dates-note "No issue date on the sheet; PDF CreationDate 2021-12-10 (this copy may be a later revision)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange-wide: 'closed for trading and clearing (exercise, settlement and cash) in all derivatives: 1 Jan, 2 Apr, 5 Apr'; 'closed for trading in all derivatives: 24 Dec, 31 Dec'. Product-level only (exchange open): 'closed for trading and exercise in German equity (and equity index) derivatives ... based on Xetra listings: 24 May (index futures trade)'.")
   (:title "Eurex trading calendar 2022, holiday overview" :year 2022
    :uri "https://www.eurex.com/resource/blob/2886140/a13cf78f8e10f826df3bf79278dd518a/data/tradingcalendar_2022_en.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.eurex.com/ex-en/trade/trading-calendar/trading-calendar-archive"
    :published-in "Eurex trading calendar (archive)"
    :dates-note "No issue date on the sheet; PDF CreationDate 2022-09-13 (this copy may be a later revision)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange-wide: 'closed for trading and clearing (exercise, settlement and cash) in all derivatives: 15 Apr, 18 Apr, 26 Dec'; 'closed for trading in all derivatives: (none listed: 24/31 Dec are Saturdays)'.")
   (:title "Eurex trading calendar 2023, holiday overview" :year 2023
    :uri "https://www.eurex.com/resource/blob/3378814/910cf372738890f691bc1bfbccfd3aef/data/tradingcalendar_2023_en.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.eurex.com/ex-en/trade/trading-calendar/trading-calendar-archive"
    :published-in "Eurex trading calendar (archive)"
    :dates-note "No issue date on the sheet; PDF CreationDate 2023-04-28 (this copy may be a later revision)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange-wide: 'closed for trading and clearing (exercise, settlement and cash) in all derivatives: 7 Apr, 10 Apr, 1 May, 25 Dec, 26 Dec'; 'closed for trading in all derivatives: (none listed: 24/31 Dec are Sundays)'.")
   (:title "Eurex trading calendar 2024, holiday overview" :year 2024
    :uri "https://www.eurex.com/resource/blob/3816864/92a1dacec4476fdef2819750d932968a/data/tradingcalendar_2024_en.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.eurex.com/ex-en/trade/trading-calendar/trading-calendar-archive"
    :published-in "Eurex trading calendar (archive)"
    :dates-note "No issue date on the sheet; PDF CreationDate 2024-01-09 (this copy may be a later revision)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange-wide: 'closed for trading and clearing (exercise, settlement and cash) in all derivatives: 1 Jan, 29 Mar, 1 Apr, 1 May, 25 Dec, 26 Dec'; 'closed for trading in all derivatives: 24 Dec, 31 Dec'.")
   (:title "Eurex trading calendar 2025, holiday overview" :year 2025
    :uri "https://www.eurex.com/resource/blob/4242284/1c8da6dc2702d508ee2a4740654ea77d/data/tradingcalendar_2025_en.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.eurex.com/ex-en/trade/trading-calendar/trading-calendar-archive"
    :published-in "Eurex trading calendar (archive)"
    :dates-note "No issue date on the sheet; PDF CreationDate 2024-12-23 (this copy may be a later revision)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange-wide: 'closed for trading and clearing (exercise, settlement and cash) in all derivatives: 1 Jan, 18 Apr, 21 Apr, 1 May, 25 Dec, 26 Dec'; 'closed for trading in all derivatives: 24 Dec, 31 Dec'.")
   (:title "Eurex trading calendar 2026, holiday overview" :year 2026
    :uri "https://www.eurex.com/resource/blob/4873184/0ca7669a8cb9a2f917d99a801fb3f2de/data/tradingcalendar_2026_en.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.eurex.com/ex-en/trade/trading-calendar/trading-calendar-archive"
    :published-in "Eurex trading calendar (archive)"
    :dates-note "No issue date on the sheet; PDF CreationDate 2026-07-01 (this copy may be a later revision)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange-wide: 'closed for trading and clearing (exercise, settlement and cash) in all derivatives: 1 Jan, 3 Apr, 6 Apr, 1 May, 25 Dec'; 'closed for trading in all derivatives: 24 Dec, 31 Dec'. Product-level only (exchange open): 'closed for trading and exercise in German equity (and equity index) derivatives ... based on Xetra listings: to be announced'.")
   (:title "Eurex circular 164/14: no trading on Whit Monday 25 May 2015; 3 Oct 2014 German products" :year 2015
    :uri "https://www.eurex.com/ex-en/find/circulars/Trading-calendar-Holiday-regulation-for-25-May-2015-Whit-Monday-adjustment-for-3-October-2014-German-Unification-Day--185982"
    :issued (2014 7 25) :issued-uri "https://www.eurex.com/resource/blob/186010/a8dbd6d9c0663715b0b2c170520c30e2/data/er14164e.pdf"
    :published (2014 7 25) :published-uri "https://www.eurex.com/ex-en/find/circulars/Trading-calendar-Holiday-regulation-for-25-May-2015-Whit-Monday-adjustment-for-3-October-2014-German-Unification-Day--185982"
    :published-in "Eurex circular 164/2014"
    :dates-note nil
    :closed (((2015 5 25) "Whit Monday: 'as an exception, not to offer any trading'"))
    :open ()
    :early-closes ()
    :late-opens ()
    :note "3 Oct 2014: only German equity options/SSF, DAX-family index options and futures, Xetra-based ETF/ETC derivatives suspended; all other products traded.")
   (:title "Eurex circular 004/16: 16 May 2016 and 3 Oct 2016, German products suspended" :year 2016
    :uri "https://www.eurex.com/ex-en/find/circulars/Trading-calendar-Adjustment-for-16-May-2016-Whit-Monday-and-3-October-2016-German-Unification-Day--183350"
    :issued (2016 1 6) :issued-uri "https://www.eurex.com/resource/blob/183364/479fcc460e0f752e301294d44d061d19/data/er16004e.pdf"
    :published (2016 1 6) :published-uri "https://www.eurex.com/ex-en/find/circulars/Trading-calendar-Adjustment-for-16-May-2016-Whit-Monday-and-3-October-2016-German-Unification-Day--183350"
    :published-in "Eurex circular 004/2016"
    :dates-note nil
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange open; only German equity/index derivatives suspended because FWB closed.")
   (:title "Eurex circular 148/17: 21 May 2018 German products suspended" :year 2018
    :uri "https://www.eurex.com/ex-en/find/circulars/Trading-calendar-Adjustment-for-21-May-2018-Whit-Monday--217568"
    :issued (2017 12 18) :issued-uri "https://www.eurex.com/resource/blob/217580/ca6c67dadd6d3229728c2360ae4b22af/data/er17148e.pdf"
    :published (2017 12 18) :published-uri "https://www.eurex.com/ex-en/find/circulars/Trading-calendar-Adjustment-for-21-May-2018-Whit-Monday--217568"
    :published-in "Eurex circular 148/2017"
    :dates-note nil
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange open; only German equity/index derivatives suspended.")
 ))
