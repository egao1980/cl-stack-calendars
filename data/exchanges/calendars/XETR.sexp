;;;; XETR draft calendar (research for cl-stack-calendars #49). Rules verified year by year 2003-2027
;;;; from the FWB trading calendar archive. 2000-2002: no primary list reachable (web.archive.org blocked
;;;; from this environment); the same rules are a plausible extension, see XETR-hours.md.
;;;; Early close: last trading day of the year (the weekday before 31 Dec) closes 14:00; notices 2020-2026.

(:name "XETR"
 :title "Xetra (Frankfurter Wertpapierbörse) trading days"
 :authority "Deutsche Börse AG / FWB, yearly trading calendar 'Applies to the trading venues Xetra and Börse Frankfurt' (archive 2003-2027)" :authority-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours"
 :rules ((:fixed "New Year's Day" 1 1 :from 2003 :authority "FWB trading calendars 2003-2027: https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar")
         (:easter "Good Friday" -2 :from 2003 :authority "FWB trading calendars 2003-2027")
         (:easter "Easter Monday" 1 :from 2003 :authority "FWB trading calendars 2003-2027")
         (:fixed "Labour Day" 5 1 :from 2003 :authority "FWB trading calendars 2003-2027")
         (:fixed "Christmas Eve" 12 24 :from 2003 :authority "FWB trading calendars 2003-2027 (settlement day since 2008)")
         (:fixed "Christmas Day" 12 25 :from 2003 :authority "FWB trading calendars 2003-2027")
         (:fixed "Boxing Day" 12 26 :from 2003 :authority "FWB trading calendars 2003-2027")
         (:fixed "New Year's Eve" 12 31 :from 2003 :authority "FWB trading calendars 2003-2027 (settlement day since 2008)"))
 :notices (
   (:title "FWB trading calendar 2003 (Xetra and Börse Frankfurt)" :year 2003
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/281596/5b55d45d540890eca7203536c2dba5ad/data/trading-calendar-2003.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2003-04-14 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 1 January, 18 April, 21 April, 1 May, 24-26 December and 31 December."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2004 (Xetra and Börse Frankfurt)" :year 2004
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/286010/e0ff72fcb9036a40eca9030e82d83549/data/trading-calendar-2004.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2003-10-29 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 1 January, 9 April, 12 April, 24 December and 31 December."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2005 (Xetra and Börse Frankfurt)" :year 2005
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/286002/47ddd319590963d891277839a9f0748c/data/trading-calendar-2005.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2004-11-26 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 25 March, 28 March and 26 December."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2006 (Xetra and Börse Frankfurt)" :year 2006
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/281580/cc6ce175449badd3fb8a5e05a220fa0a/data/trading-calendar-2006.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2005-11-24 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 14 April, 17 April, 1 May, 25 December and 26 December."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2007 (Xetra and Börse Frankfurt)" :year 2007
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/285982/a5d5a6044baa59bb7f1d574dc17591a1/data/trading-calendar-2007.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2006-11-03 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 1 January, 6 April, 9 April, 1 May, 28 May, 24 December, 25 December, 26 December and 31 December."
    :closed (((2007 5 28) "Whit Monday (FWB non-trading day)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2008 (Xetra and Börse Frankfurt)" :year 2008
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/281570/d69b8163f1cf22dfd0147f56b7c4b557/data/trading-calendar-2008.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2007-11-15 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 1 January, 21 March, 24 March, 1 May, 24, 25, 26 and 31 December."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2009 (Xetra and Börse Frankfurt)" :year 2009
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/285992/ae41d04bf3c9163bf0190fdd43ed053e/data/trading-calendar-2009.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2009-04-29 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 1 January, 10 April, 13 April, 1 May, 24 December, 25 December and 31 December."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2010 (Xetra and Börse Frankfurt)" :year 2010
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/286014/22da6e6e049dfccee1e394cf2181b757/data/trading-calendar-2010.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2009-08-21 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 1 January, 2 April, 5 April, 24 December and 31 December."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2011 (Xetra and Börse Frankfurt)" :year 2011
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/285988/816cf6168a13ed9d2f06964a4ac29d1f/data/trading-calendar-2011.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2010-08-26 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 22 April, 25 April and 26 December."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2012 (Xetra and Börse Frankfurt)" :year 2012
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/281590/2420eeaa55be56d9f11a165184e34597/data/trading-calendar-2012.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2011-09-02 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 6 April, 9 April, 1 May, 24, 25, 26 and 31 December."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2013 (Xetra and Börse Frankfurt)" :year 2013
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/286022/49f43e63783f95e0039204ddf618e9ad/data/trading-calendar-2013.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2012-08-20 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 1 January, 29 March, 1 April, 1 May, 24, 25, 26 and 31 December."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2014 (Xetra and Börse Frankfurt)" :year 2014
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/281576/967747fbc75fa120c2142e05d2e40711/data/trading-calendar-2014.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2013-11-29 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 1 January, 18 April, 21 April, 1 May, 3 October, 24, 25, 26 and 31 December."
    :closed (((2014 10 3) "German Unity Day (FWB non-trading day; settlement day)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2015 (Xetra and Börse Frankfurt)" :year 2015
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/252786/26a3eefdbb8b939be91ec1d3d1986347/data/trading-calendar-2015.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2014-10-01 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 1 January, 3 April, 6 April, 1 May, 25 May, 24, 25 and 31 December."
    :closed (((2015 5 25) "Whit Monday (FWB non-trading day; settlement day)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2016 (Xetra and Börse Frankfurt)" :year 2016
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/259998/85c710e77ed5d595695f5b1d6418eac7/data/trading-calendar-2016.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2015-11-13 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 1 January, 25 March, 28 March, 16 May, 3 October, 26 December."
    :closed (((2016 5 16) "Whit Monday (settlement day)")
             ((2016 10 3) "German Unity Day (settlement day)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2017 (Xetra and Börse Frankfurt)" :year 2017
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/336572/247517da046f56e5b4dae39723f29b00/data/trading-calendar-2017.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2016-10-18 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 14 April, 17 April, 1 May, 5 June, 3 October, 31 October, 25 and 26 December."
    :closed (((2017 6 5) "Whit Monday (settlement day)")
             ((2017 10 3) "German Unity Day (settlement day)")
             ((2017 10 31) "Reformation Day, 500th anniversary (settlement day)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2018 (Xetra and Börse Frankfurt)" :year 2018
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/154430/366c1c9be4ce7cdb923bbf246db1d1bf/data/trading-calendar-2018.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2018-03-14 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 1 January, 30 March, 2 April, 1 May, 21 May, 3 October, 24, 25, 26 and 31 December."
    :closed (((2018 5 21) "Whit Monday (settlement day)")
             ((2018 10 3) "German Unity Day (settlement day)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2019 (Xetra and Börse Frankfurt)" :year 2019
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/1406548/6de0eba301a5433abb110fa3c96a5778/data/xetra-trading-calendar-2019.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2018-10-18 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 1 January, 19 April, 22 April, 1 May, 10 June, 3 October, 24, 25, 26 and 31 December."
    :closed (((2019 6 10) "Whit Monday (settlement day)")
             ((2019 10 3) "German Unity Day (settlement day)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2020 (Xetra and Börse Frankfurt)" :year 2020
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/1665534/112856375187d3e93671aa3d731d09d3/data/xetra-trading-calendar-2020.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2019-08-15 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 1 January, 10 April, 13 April, 1 May, 1 June, 24, 25 and 31 December."
    :closed (((2020 6 1) "Whit Monday (settlement day)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2021 (Xetra and Börse Frankfurt)" :year 2021
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/2344982/ddbcd31a616628a7ffa09dc709467ec4/data/xetra-trading-calendar-2021.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2020-08-04 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 1 January, 2 April, 5 April, 24 May, 24 December and 31 December."
    :closed (((2021 5 24) "Whit Monday (settlement day)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2022 (Xetra and Börse Frankfurt)" :year 2022
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/2833162/2f53999770c09ce9c0bee8194c1fe60d/data/xetra-trading-calendar-2022.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2021-09-15 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 15 April, 18 April and 26 December."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2023 (Xetra and Börse Frankfurt)" :year 2023
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/3317408/4c8fbfbfeea62fd44600f6fe3f14f84e/data/xetra-trading-calendar-2023.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2022-08-19 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 7 April, 10 April, 1 May, 25 December and 26 December."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2024 (Xetra and Börse Frankfurt)" :year 2024
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/3559262/98ebe1fde231df56c9f116bc766533b2/data/xetra-trading-calendar-2024.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2023-12-05 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 1 January, 29 March, 1 April, 1 May, 24, 25, 26 and 31 December."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2025 (Xetra and Börse Frankfurt)" :year 2025
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/4302124/bc43304f7bdce4d4fe4f38eb2bd79d00/data/xetra-trading-calendar-2025.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2025-05-28 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 1 January, 18 April, 21 April, 1 May, 24, 25, 26 and 31 December."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2026 (Xetra and Börse Frankfurt)" :year 2026
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/4481276/1b643791fcb4d60bdd7f25efad3f4626/data/deutsche-boerse-trading-calendar-2026.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2026-01-09 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of 1 January, 3 April, 6 April, 1 May, 24 December, 25 December and 31 December."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "FWB trading calendar 2027 (Xetra and Börse Frankfurt)" :year 2027
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/5674438/db983db1c0f7a3819ff84f8460793062/data/deutsche-boerse-trading-calendar-2027.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours"
    :published-in "Deutsche Börse cash market website, trading calendar (archive)"
    :dates-note "Calendar sheet carries no issue date; PDF CreationDate 2026-11-27 (upper bound for publication of this copy). Text: trading Mondays to Fridays with the exception of January 1, March 26, March 29, December 24 and December 31."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Final trading session 2020 (FWB circular: Xetra closing auction call from 14:00 CET)" :year 2020
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/2344984/7a707684270bd7eeb2bad7cc278033df/data/Final%20trading%20session%202020.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website (final trading session announcement)"
    :dates-note "Announcement PDF has no issue date; PDF CreationDate 2020-11-18. Continuous trading ends 14:00 CET (closing auction call; price determination not before 14:05, trade-at-close to 14:10/14:15)."
    :closed ()
    :open ()
    :early-closes (((2020 12 30) (14 0) "last trading day of the year: Xetra closing auction call from 14:00 CET"))
    :late-opens ())
   (:title "Final trading session 2021 (FWB circular: Xetra closing auction call from 14:00 CET)" :year 2021
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/2833324/1209e3c0d43c27b69f223f70245dcd9a/data/Final%20trading%20session%202021.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website (final trading session announcement)"
    :dates-note "Announcement PDF has no issue date; PDF CreationDate 2021-10-08. Continuous trading ends 14:00 CET (closing auction call; price determination not before 14:05, trade-at-close to 14:10/14:15)."
    :closed ()
    :open ()
    :early-closes (((2021 12 30) (14 0) "last trading day of the year: Xetra closing auction call from 14:00 CET"))
    :late-opens ())
   (:title "Final trading session 2022 (FWB circular: Xetra closing auction call from 14:00 CET)" :year 2022
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/3317552/ef392d7e63636f8cbb7bdb2093e8477e/data/Final%20trading%20session%202022.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website (final trading session announcement)"
    :dates-note "Announcement PDF has no issue date; PDF CreationDate 2022-10-07. Continuous trading ends 14:00 CET (closing auction call; price determination not before 14:05, trade-at-close to 14:10/14:15)."
    :closed ()
    :open ()
    :early-closes (((2022 12 30) (14 0) "last trading day of the year: Xetra closing auction call from 14:00 CET"))
    :late-opens ())
   (:title "Final trading session 2023 (FWB circular: Xetra closing auction call from 14:00 CET)" :year 2023
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/3735776/e53cb5552fd069e20dc3faaf343c9c2d/data/Final%20trading%20session%202023.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website (final trading session announcement)"
    :dates-note "Announcement PDF has no issue date; PDF CreationDate 2023-10-02. Continuous trading ends 14:00 CET (closing auction call; price determination not before 14:05, trade-at-close to 14:10/14:15)."
    :closed ()
    :open ()
    :early-closes (((2023 12 29) (14 0) "last trading day of the year: Xetra closing auction call from 14:00 CET"))
    :late-opens ())
   (:title "Final trading session 2024 (FWB circular: Xetra closing auction call from 14:00 CET)" :year 2024
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/4064970/4beb98bd98c44f58e1fb68e3f3bb9746/data/Final%20trading%20session%202024.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website (final trading session announcement)"
    :dates-note "Announcement PDF has no issue date; PDF CreationDate 2024-05-24. Continuous trading ends 14:00 CET (closing auction call; price determination not before 14:05, trade-at-close to 14:10/14:15)."
    :closed ()
    :open ()
    :early-closes (((2024 12 30) (14 0) "last trading day of the year: Xetra closing auction call from 14:00 CET"))
    :late-opens ())
   (:title "Final trading session 2025 (FWB circular: Xetra closing auction call from 14:00 CET)" :year 2025
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/4580834/14d7f01321cb1d949020067efd2ee174/data/Final%20trading%20session%202025.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours/trading-calendar"
    :published-in "Deutsche Börse cash market website (final trading session announcement)"
    :dates-note "Announcement PDF has no issue date; PDF CreationDate 2025-05-14. Continuous trading ends 14:00 CET (closing auction call; price determination not before 14:05, trade-at-close to 14:10/14:15)."
    :closed ()
    :open ()
    :early-closes (((2025 12 30) (14 0) "last trading day of the year: Xetra closing auction call from 14:00 CET"))
    :late-opens ())
   (:title "Final trading session 2026 (FWB circular: Xetra closing auction call from 14:00 CET)" :year 2026
    :uri "https://www.cashmarket.deutsche-boerse.com/resource/blob/5673886/22764993c4b1617c5f465186066344e6/data/Final%20trading%20session%202026.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.cashmarket.deutsche-boerse.com/cash-en/trading/trading-calendar-and-trading-hours"
    :published-in "Deutsche Börse cash market website (final trading session announcement)"
    :dates-note "Announcement PDF has no issue date; PDF CreationDate 2026-10-29. Continuous trading ends 14:00 CET (closing auction call; price determination not before 14:05, trade-at-close to 14:10/14:15)."
    :closed ()
    :open ()
    :early-closes (((2026 12 30) (14 0) "last trading day of the year: Xetra closing auction call from 14:00 CET"))
    :late-opens ())
   (:title "Deutsche Börse Circular 052/25: Extended Xetra Retail Service (early and late trading) from 1 December 2025"
    :uri "https://cashmarket.deutsche-boerse.com/cash-en/Stay-Informed/circulars-newsletters/deutsche-boerse-circulars/Introduction-of-the-Extended-Xetra-Retail-Service-early-and-late-trading-Planned-changes-to-the-trading-process-valid-from-1-December-2025-4793480"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://cashmarket.deutsche-boerse.com/cash-en/Stay-Informed/circulars-newsletters/deutsche-boerse-circulars/Introduction-of-the-Extended-Xetra-Retail-Service-early-and-late-trading-Planned-changes-to-the-trading-process-valid-from-1-December-2025-4793480"
    :published-in "Deutsche Börse Circular 052/25"
    :dates-note "Circular page shows no date in the extracted text; effective 2025-12-01."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Hours, not holidays: opening auction 08:55 for all; retail-only early trading 08:00-08:55 and late trading 17:35/17:40-22:00 (Extended Xetra Retail Service; prices do not form Xetra open/close/high/low). Main Xetra continuous trading stays 09:00-17:30.")
 ))
