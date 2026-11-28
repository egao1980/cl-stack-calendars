;; Draft: Borsa Istanbul (ISE before 2013) equity market trading days.
;; Religious feasts (Ramazan/Kurban Bayramı) and their half-day eves are given per year from the
;; exchange's own lists (ISE 2000-2011, Borsa Istanbul 2012-2026) instead of a computed TR civil
;; calendar: the TR civil model in the repo disagrees with the exchange on several feast days
;; (e.g. 2001-03-09, 2004-02-05, 2017-06-28 are sessions per the exchange).
;; Half days (arife of the two feasts and 28 Oct, Republic Day eve) are :early-closes in the yearly notices.
;; 2027-2028: no exchange list published yet (BIST publishes in Q4 of the prior year).
(:name "XIST"
 :title "Borsa Istanbul equity market trading days"
 :authority "Borsa Istanbul, Official Holidays page and Equity Market Holiday Schedules; ISE Official Holidays pages (archived)"
 :authority-uri "https://www.borsaistanbul.com/en/official-holidays"
 :bases ((:calendar "TR" :from (2027 1 1) :to nil
          :authority "Provisional: Borsa Istanbul has not published its 2027 holiday list yet; from 2027 the Turkish public holidays (Law 2429) stand in for the religious-holiday closures until the list is added (the eve half days are not modeled for those years)."))
 :gaps ((:years "2027-" :note "No Borsa Istanbul holiday list yet; religious-holiday closures follow the TR civil calendar provisionally."))
 :rules ((:fixed "New Year's Day" 1 1 :authority "https://www.borsaistanbul.com/en/official-holidays")
         (:fixed "National Sovereignty and Children's Day" 4 23 :authority "https://www.borsaistanbul.com/en/official-holidays")
         (:fixed "Labour and Solidarity Day" 5 1 :from 2009 :authority "https://web.archive.org/web/20090704124801/http://www.ise.org/markets/holidays.htm (first listed 2009; 2008-05-01 not listed)")
         (:fixed "Commemoration of Atatürk, Youth and Sports Day" 5 19 :authority "https://www.borsaistanbul.com/en/official-holidays")
         (:fixed "Democracy and National Unity Day" 7 15 :from 2017 :authority "https://www.borsaistanbul.com/en/official-holidays (first listed 2017)")
         (:fixed "Victory Day" 8 30 :authority "https://www.borsaistanbul.com/en/official-holidays")
         (:fixed "Republic Day" 10 29 :authority "https://www.borsaistanbul.com/en/official-holidays"))
 :notices (
   (:title "ISE Official Holidays 2000" :year 2000 :uri "https://web.archive.org/web/20001014233705/http://www.ise.org/markets/holidays.htm"
    :issued nil :issued-uri nil :published (2000 10 14) :published-uri "https://web.archive.org/web/20001014233705/http://www.ise.org/markets/holidays.htm"
    :published-in "ISE website (Official Holidays page), web.archive.org snapshot"
    :dates-note "Issue/publication date not shown on the page; snapshot 2000-10-14 proves it was public by then. Half-day close time not stated in the list; (12 30) is the end of the morning session in 2013-2015 schedules and matches ec, unverified for earlier years."
    :closed (((2000 1 3) "New Year's Day (observed Monday)") ((2000 1 10) "Religious holiday (ISE list)") ((2000 3 16) "Religious holiday (ISE list)") ((2000 3 17) "Religious holiday (ISE list)") ((2000 12 27) "Religious holiday (ISE list)") ((2000 12 28) "Religious holiday (ISE list)") ((2000 12 29) "Religious holiday (ISE list)"))
    :open ()
    :early-closes (((2000 1 7) (12 30) "Half day (ISE list)") ((2000 3 15) (12 30) "Half day (ISE list)") ((2000 12 26) (12 30) "Half day (ISE list)"))
    :late-opens ())
   (:title "ISE Official Holidays 2001" :year 2001 :uri "https://web.archive.org/web/20011120005540/http://www.ise.org/markets/holidays.htm"
    :issued nil :issued-uri nil :published (2001 11 20) :published-uri "https://web.archive.org/web/20011120005540/http://www.ise.org/markets/holidays.htm"
    :published-in "ISE website (Official Holidays page), web.archive.org snapshot"
    :dates-note "Issue/publication date not shown on the page; snapshot 2001-11-20 proves it was public by then. Half-day close time not stated in the list; (12 30) is the end of the morning session in 2013-2015 schedules and matches ec, unverified for earlier years."
    :closed (((2001 3 5) "Religious holiday (ISE list)") ((2001 3 6) "Religious holiday (ISE list)") ((2001 3 7) "Religious holiday (ISE list)") ((2001 3 8) "Religious holiday (ISE list)") ((2001 12 17) "Religious holiday (ISE list)") ((2001 12 18) "Religious holiday (ISE list)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "ISE Official Holidays 2002" :year 2002 :uri "https://web.archive.org/web/20031206134923/http://www.ise.org/markets/holidays.htm"
    :issued nil :issued-uri nil :published (2003 12 6) :published-uri "https://web.archive.org/web/20031206134923/http://www.ise.org/markets/holidays.htm"
    :published-in "ISE website (Official Holidays page), web.archive.org snapshot"
    :dates-note "Issue/publication date not shown on the page; snapshot 2003-12-06 proves it was public by then. Half-day close time not stated in the list; (12 30) is the end of the morning session in 2013-2015 schedules and matches ec, unverified for earlier years."
    :closed (((2002 2 22) "Religious holiday (ISE list)") ((2002 2 25) "Religious holiday (ISE list)") ((2002 12 5) "Religious holiday (ISE list)") ((2002 12 6) "Religious holiday (ISE list)"))
    :open ()
    :early-closes (((2002 2 21) (12 30) "Half day (ISE list)") ((2002 10 28) (12 30) "Half day (ISE list)") ((2002 12 4) (12 30) "Half day (ISE list)"))
    :late-opens ())
   (:title "ISE Official Holidays 2003" :year 2003 :uri "https://web.archive.org/web/20031206134923/http://www.ise.org/markets/holidays.htm"
    :issued nil :issued-uri nil :published (2003 12 6) :published-uri "https://web.archive.org/web/20031206134923/http://www.ise.org/markets/holidays.htm"
    :published-in "ISE website (Official Holidays page), web.archive.org snapshot"
    :dates-note "Issue/publication date not shown on the page; snapshot 2003-12-06 proves it was public by then. Half-day close time not stated in the list; (12 30) is the end of the morning session in 2013-2015 schedules and matches ec, unverified for earlier years."
    :closed (((2003 2 11) "Religious holiday (ISE list)") ((2003 2 12) "Religious holiday (ISE list)") ((2003 2 13) "Religious holiday (ISE list)") ((2003 2 14) "Religious holiday (ISE list)") ((2003 11 25) "Religious holiday (ISE list)") ((2003 11 26) "Religious holiday (ISE list)") ((2003 11 27) "Religious holiday (ISE list)"))
    :open ()
    :early-closes (((2003 2 10) (12 30) "Half day (ISE list)") ((2003 10 28) (12 30) "Half day (ISE list)") ((2003 11 24) (12 30) "Half day (ISE list)"))
    :late-opens ())
   (:title "ISE Official Holidays 2004" :year 2004 :uri "https://web.archive.org/web/20041213195258/http://www.ise.org/markets/holidays.htm"
    :issued nil :issued-uri nil :published (2004 12 13) :published-uri "https://web.archive.org/web/20041213195258/http://www.ise.org/markets/holidays.htm"
    :published-in "ISE website (Official Holidays page), web.archive.org snapshot"
    :dates-note "Issue/publication date not shown on the page; snapshot 2004-12-13 proves it was public by then. Half-day close time not stated in the list; (12 30) is the end of the morning session in 2013-2015 schedules and matches ec, unverified for earlier years."
    :closed (((2004 2 2) "Religious holiday (ISE list)") ((2004 2 3) "Religious holiday (ISE list)") ((2004 2 4) "Religious holiday (ISE list)") ((2004 11 15) "Religious holiday (ISE list)") ((2004 11 16) "Religious holiday (ISE list)"))
    :open ()
    :early-closes (((2004 10 28) (12 30) "Half day (ISE list)"))
    :late-opens ())
   (:title "ISE Official Holidays 2005" :year 2005 :uri "https://web.archive.org/web/20060923193003/http://www.ise.org/markets/holidays.htm"
    :issued nil :issued-uri nil :published (2006 9 23) :published-uri "https://web.archive.org/web/20060923193003/http://www.ise.org/markets/holidays.htm"
    :published-in "ISE website (Official Holidays page), web.archive.org snapshot"
    :dates-note "Issue/publication date not shown on the page; snapshot 2006-09-23 proves it was public by then. Half-day close time not stated in the list; (12 30) is the end of the morning session in 2013-2015 schedules and matches ec, unverified for earlier years."
    :closed (((2005 1 20) "Religious holiday (ISE list)") ((2005 1 21) "Religious holiday (ISE list)") ((2005 11 3) "Religious holiday (ISE list)") ((2005 11 4) "Religious holiday (ISE list)"))
    :open ()
    :early-closes (((2005 1 19) (12 30) "Half day (ISE list)") ((2005 10 28) (12 30) "Half day (ISE list)") ((2005 11 2) (12 30) "Half day (ISE list)"))
    :late-opens ())
   (:title "ISE Official Holidays 2006" :year 2006 :uri "https://web.archive.org/web/20060923193003/http://www.ise.org/markets/holidays.htm"
    :issued nil :issued-uri nil :published (2006 9 23) :published-uri "https://web.archive.org/web/20060923193003/http://www.ise.org/markets/holidays.htm"
    :published-in "ISE website (Official Holidays page), web.archive.org snapshot"
    :dates-note "Issue/publication date not shown on the page; snapshot 2006-09-23 proves it was public by then. Half-day close time not stated in the list; (12 30) is the end of the morning session in 2013-2015 schedules and matches ec, unverified for earlier years."
    :closed (((2006 1 10) "Religious holiday (ISE list)") ((2006 1 11) "Religious holiday (ISE list)") ((2006 1 12) "Religious holiday (ISE list)") ((2006 1 13) "Religious holiday (ISE list)") ((2006 10 23) "Religious holiday (ISE list)") ((2006 10 24) "Religious holiday (ISE list)") ((2006 10 25) "Religious holiday (ISE list)"))
    :open ()
    :early-closes (((2006 1 9) (12 30) "Half day (ISE list)"))
    :late-opens ())
   (:title "ISE Official Holidays 2007" :year 2007 :uri "https://web.archive.org/web/20071213030449/http://www.ise.org/markets/holidays.htm"
    :issued nil :issued-uri nil :published (2007 12 13) :published-uri "https://web.archive.org/web/20071213030449/http://www.ise.org/markets/holidays.htm"
    :published-in "ISE website (Official Holidays page), web.archive.org snapshot"
    :dates-note "Issue/publication date not shown on the page; snapshot 2007-12-13 proves it was public by then. Half-day close time not stated in the list; (12 30) is the end of the morning session in 2013-2015 schedules and matches ec, unverified for earlier years."
    :closed (((2007 1 2) "Religious holiday (ISE list)") ((2007 1 3) "Religious holiday (ISE list)") ((2007 10 12) "Religious holiday (ISE list)") ((2007 12 20) "Religious holiday (ISE list)") ((2007 12 21) "Religious holiday (ISE list)"))
    :open ()
    :early-closes (((2007 10 11) (12 30) "Half day (ISE list)") ((2007 12 19) (12 30) "Half day (ISE list)"))
    :late-opens ())
   (:title "ISE Official Holidays 2008" :year 2008 :uri "https://web.archive.org/web/20090704124801/http://www.ise.org/markets/holidays.htm"
    :issued nil :issued-uri nil :published (2009 7 4) :published-uri "https://web.archive.org/web/20090704124801/http://www.ise.org/markets/holidays.htm"
    :published-in "ISE website (Official Holidays page), web.archive.org snapshot"
    :dates-note "Issue/publication date not shown on the page; snapshot 2009-07-04 proves it was public by then. Half-day close time not stated in the list; (12 30) is the end of the morning session in 2013-2015 schedules and matches ec, unverified for earlier years."
    :closed (((2008 9 30) "Religious holiday (ISE list)") ((2008 10 1) "Religious holiday (ISE list)") ((2008 10 2) "Religious holiday (ISE list)") ((2008 12 8) "Religious holiday (ISE list)") ((2008 12 9) "Religious holiday (ISE list)") ((2008 12 10) "Religious holiday (ISE list)") ((2008 12 11) "Religious holiday (ISE list)"))
    :open ()
    :early-closes (((2008 9 29) (12 30) "Half day (ISE list)") ((2008 10 28) (12 30) "Half day (ISE list)"))
    :late-opens ())
   (:title "ISE Official Holidays 2009" :year 2009 :uri "https://web.archive.org/web/20090704124801/http://www.ise.org/markets/holidays.htm"
    :issued nil :issued-uri nil :published (2009 7 4) :published-uri "https://web.archive.org/web/20090704124801/http://www.ise.org/markets/holidays.htm"
    :published-in "ISE website (Official Holidays page), web.archive.org snapshot"
    :dates-note "Issue/publication date not shown on the page; snapshot 2009-07-04 proves it was public by then. Half-day close time not stated in the list; (12 30) is the end of the morning session in 2013-2015 schedules and matches ec, unverified for earlier years."
    :closed (((2009 9 21) "Religious holiday (ISE list)") ((2009 9 22) "Religious holiday (ISE list)") ((2009 11 27) "Religious holiday (ISE list)") ((2009 11 30) "Religious holiday (ISE list)"))
    :open ()
    :early-closes (((2009 10 28) (12 30) "Half day (ISE list)") ((2009 11 26) (12 30) "Half day (ISE list)"))
    :late-opens ())
   (:title "ISE Official Holidays 2010" :year 2010 :uri "https://web.archive.org/web/20111223153424/http://www.ise.org/Markets/holidays2010.aspx?"
    :issued nil :issued-uri nil :published (2011 12 23) :published-uri "https://web.archive.org/web/20111223153424/http://www.ise.org/Markets/holidays2010.aspx?"
    :published-in "ISE website (Official Holidays page), web.archive.org snapshot"
    :dates-note "Issue/publication date not shown on the page; snapshot 2011-12-23 proves it was public by then. Half-day close time not stated in the list; (12 30) is the end of the morning session in 2013-2015 schedules and matches ec, unverified for earlier years."
    :closed (((2010 9 9) "Religious holiday (ISE list)") ((2010 9 10) "Religious holiday (ISE list)") ((2010 11 16) "Religious holiday (ISE list)") ((2010 11 17) "Religious holiday (ISE list)") ((2010 11 18) "Religious holiday (ISE list)") ((2010 11 19) "Religious holiday (ISE list)"))
    :open ()
    :early-closes (((2010 9 8) (12 30) "Half day (ISE list)") ((2010 10 28) (12 30) "Half day (ISE list)") ((2010 11 15) (12 30) "Half day (ISE list)"))
    :late-opens ())
   (:title "ISE Official Holidays 2011" :year 2011 :uri "https://web.archive.org/web/20120421100142/http://www.ise.org/Markets/holidays2011.aspx"
    :issued nil :issued-uri nil :published (2012 4 21) :published-uri "https://web.archive.org/web/20120421100142/http://www.ise.org/Markets/holidays2011.aspx"
    :published-in "ISE website (Official Holidays page), web.archive.org snapshot"
    :dates-note "Issue/publication date not shown on the page; snapshot 2012-04-21 proves it was public by then. Half-day close time not stated in the list; (12 30) is the end of the morning session in 2013-2015 schedules and matches ec, unverified for earlier years."
    :closed (((2011 8 31) "Religious holiday (ISE list)") ((2011 9 1) "Religious holiday (ISE list)") ((2011 11 7) "Religious holiday (ISE list)") ((2011 11 8) "Religious holiday (ISE list)") ((2011 11 9) "Religious holiday (ISE list)"))
    :open ()
    :early-closes (((2011 8 29) (12 30) "Half day (ISE list)") ((2011 10 28) (12 30) "Half day (ISE list)"))
    :late-opens ())
   (:title "Borsa Istanbul Official Holidays 2012" :year 2012 :uri "https://www.borsaistanbul.com/en/official-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.borsaistanbul.com/en/official-holidays"
    :published-in "Borsa Istanbul website (Official Holidays page)"
    :dates-note "Issue date not shown; page fetched 2026-11-28 lists 2012-2026. Half days: equity closes 12:30 (continuous 10:00-12:30, closing auction to 12:35, TAC to 12:40) per session schedule effective 2016-11-14; the table says 'Until 13:00' (market-wide). 2012 list cross-checked in ISE snapshot 2011-12-06."
    :closed (((2012 8 20) "Ramadan Feast") ((2012 8 21) "Ramadan Feast") ((2012 10 25) "Eid Al-Adha (Feast of the Sacrifice)") ((2012 10 26) "Eid Al-Adha (Feast of the Sacrifice)"))
    :open ()
    :early-closes (((2012 10 24) (12 30) "Eid Al-Adha (Feast of the Sacrifice)(Half Day)"))
    :late-opens ())
   (:title "Borsa Istanbul Official Holidays 2013" :year 2013 :uri "https://www.borsaistanbul.com/en/official-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.borsaistanbul.com/en/official-holidays"
    :published-in "Borsa Istanbul website (Official Holidays page)"
    :dates-note "Issue date not shown; page fetched 2026-11-28 lists 2012-2026. Half days: equity closes 12:30 (continuous 10:00-12:30, closing auction to 12:35, TAC to 12:40) per session schedule effective 2016-11-14; the table says 'Until 13:00' (market-wide)."
    :closed (((2013 8 8) "Ramadan Feast") ((2013 8 9) "Ramadan Feast") ((2013 10 15) "Eid Al-Adha (Feast of the Sacrifice)") ((2013 10 16) "Eid Al-Adha (Feast of the Sacrifice)") ((2013 10 17) "Eid Al-Adha (Feast of the Sacrifice)") ((2013 10 18) "Eid Al-Adha (Feast of the Sacrifice)"))
    :open ()
    :early-closes (((2013 8 7) (12 30) "Ramadan Feast (Half Day)") ((2013 10 14) (12 30) "Eid Al-Adha (Feast of the Sacrifice) (Half Day)") ((2013 10 28) (12 30) "Republic Day (Half Day)"))
    :late-opens ())
   (:title "Borsa Istanbul Official Holidays 2014" :year 2014 :uri "https://www.borsaistanbul.com/en/official-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.borsaistanbul.com/en/official-holidays"
    :published-in "Borsa Istanbul website (Official Holidays page)"
    :dates-note "Issue date not shown; page fetched 2026-11-28 lists 2012-2026. Half days: equity closes 12:30 (continuous 10:00-12:30, closing auction to 12:35, TAC to 12:40) per session schedule effective 2016-11-14; the table says 'Until 13:00' (market-wide)."
    :closed (((2014 7 28) "Ramadan Feast") ((2014 7 29) "Ramadan Feast") ((2014 7 30) "Ramadan Feast") ((2014 10 6) "Eid Al-Adha (Feast of the Sacrifice)") ((2014 10 7) "Eid Al-Adha (Feast of the Sacrifice)"))
    :open ()
    :early-closes (((2014 10 3) (12 30) "Eid Al-Adha (Feast of the Sacrifice) (Half Day)") ((2014 10 28) (12 30) "Republic Day (Half Day)"))
    :late-opens ())
   (:title "Borsa Istanbul Official Holidays 2015" :year 2015 :uri "https://www.borsaistanbul.com/en/official-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.borsaistanbul.com/en/official-holidays"
    :published-in "Borsa Istanbul website (Official Holidays page)"
    :dates-note "Issue date not shown; page fetched 2026-11-28 lists 2012-2026. Half days: equity closes 12:30 (continuous 10:00-12:30, closing auction to 12:35, TAC to 12:40) per session schedule effective 2016-11-14; the table says 'Until 13:00' (market-wide)."
    :closed (((2015 7 17) "Ramadan Feast") ((2015 9 24) "Eid Al-Adha (Feast of the Sacrifice)") ((2015 9 25) "Eid Al-Adha (Feast of the Sacrifice)"))
    :open ()
    :early-closes (((2015 7 16) (12 30) "Ramadan Feast (Half Day)") ((2015 9 23) (12 30) "Eid Al-Adha (Feast of the Sacrifice) (Half Day)") ((2015 10 28) (12 30) "Republic Day (Half Day)"))
    :late-opens ())
   (:title "Borsa Istanbul Official Holidays 2016 / Equity Market 2016 Holiday Schedule" :year 2016 :uri "https://www.borsaistanbul.com/en/official-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.borsaistanbul.com/files/2016_pp_en.doc"
    :published-in "Borsa Istanbul website (Official Holidays page, Equity Market holiday schedule)"
    :dates-note "Issue date not shown; page fetched 2026-11-28 lists 2012-2026. Half days: equity closes 12:30 (continuous 10:00-12:30, closing auction to 12:35, TAC to 12:40) per session schedule effective 2016-11-14; the table says 'Until 13:00' (market-wide)."
    :closed (((2016 7 5) "Ramadan Feast") ((2016 7 6) "Ramadan Feast") ((2016 7 7) "Ramadan Feast") ((2016 9 12) "Eid Al-Adha (Feast of the Sacrifice)") ((2016 9 13) "Eid Al-Adha (Feast of the Sacrifice)") ((2016 9 14) "Eid Al-Adha (Feast of the Sacrifice)") ((2016 9 15) "Eid Al-Adha (Feast of the Sacrifice)"))
    :open ()
    :early-closes (((2016 7 4) (12 30) "Ramadan Feast (Half Day)") ((2016 10 28) (12 30) "Republic Day (Half Day)"))
    :late-opens ())
   (:title "Borsa Istanbul Official Holidays 2017 / Equity Market 2017 Holiday Schedule" :year 2017 :uri "https://www.borsaistanbul.com/en/official-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.borsaistanbul.com/files/2017_pp_en.doc"
    :published-in "Borsa Istanbul website (Official Holidays page, Equity Market holiday schedule)"
    :dates-note "Issue date not shown; page fetched 2026-11-28 lists 2012-2026. Half days: equity closes 12:30 (continuous 10:00-12:30, closing auction to 12:35, TAC to 12:40) per session schedule effective 2016-11-14; the table says 'Until 13:00' (market-wide)."
    :closed (((2017 6 26) "Ramadan Feast") ((2017 6 27) "Ramadan Feast") ((2017 9 1) "Eid Al-Adha (Feast of the Sacrifice)") ((2017 9 4) "Eid Al-Adha (Feast of the Sacrifice)"))
    :open ()
    :early-closes (((2017 8 31) (12 30) "Eid Al-Adha (Feast of the Sacrifice) (Half Day)"))
    :late-opens ())
   (:title "Borsa Istanbul Official Holidays 2018 / Equity Market 2018 Holiday Schedule" :year 2018 :uri "https://www.borsaistanbul.com/en/official-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.borsaistanbul.com/files/equity-market-2018-holiday-schedule.pdf"
    :published-in "Borsa Istanbul website (Official Holidays page, Equity Market holiday schedule)"
    :dates-note "Issue date not shown; page fetched 2026-11-28 lists 2012-2026. Half days: equity closes 12:30 (continuous 10:00-12:30, closing auction to 12:35, TAC to 12:40) per session schedule effective 2016-11-14; the table says 'Until 13:00' (market-wide)."
    :closed (((2018 6 15) "Ramadan Feast") ((2018 8 21) "Eid Al-Adha (Feast of the Sacrifice)") ((2018 8 22) "Eid Al-Adha (Feast of the Sacrifice)") ((2018 8 23) "Eid Al-Adha (Feast of the Sacrifice)") ((2018 8 24) "Eid Al-Adha (Feast of the Sacrifice)"))
    :open ()
    :early-closes (((2018 6 14) (12 30) "Ramadan Feast (Half Day)") ((2018 8 20) (12 30) "Eid Al-Adha (Feast of the Sacrifice) (Half Day)"))
    :late-opens ())
   (:title "Borsa Istanbul Official Holidays 2019 / Equity Market 2019 Holiday Schedule" :year 2019 :uri "https://www.borsaistanbul.com/en/official-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.borsaistanbul.com/files/equity-market-2019-holiday-schedule.pdf"
    :published-in "Borsa Istanbul website (Official Holidays page, Equity Market holiday schedule)"
    :dates-note "Issue date not shown; page fetched 2026-11-28 lists 2012-2026. Half days: equity closes 12:30 (continuous 10:00-12:30, closing auction to 12:35, TAC to 12:40) per session schedule effective 2016-11-14; the table says 'Until 13:00' (market-wide)."
    :closed (((2019 6 4) "Ramadan Feast") ((2019 6 5) "Ramadan Feast") ((2019 6 6) "Ramadan Feast") ((2019 8 12) "Eid Al-Adha (Feast of the Sacrifice)") ((2019 8 13) "Eid Al-Adha (Feast of the Sacrifice)") ((2019 8 14) "Eid Al-Adha (Feast of the Sacrifice)"))
    :open ()
    :early-closes (((2019 6 3) (12 30) "Ramadan Feast (Half Day)") ((2019 10 28) (12 30) "Republic Day (Half Day)"))
    :late-opens ())
   (:title "Borsa Istanbul Official Holidays 2020 / Equity Market 2020 Holiday Schedule" :year 2020 :uri "https://www.borsaistanbul.com/en/official-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.borsaistanbul.com/files/equity-market-2020-holiday-schedule.pdf"
    :published-in "Borsa Istanbul website (Official Holidays page, Equity Market holiday schedule)"
    :dates-note "Issue date not shown; page fetched 2026-11-28 lists 2012-2026. Half days: equity closes 12:30 (continuous 10:00-12:30, closing auction to 12:35, TAC to 12:40) per session schedule effective 2016-11-14; the table says 'Until 13:00' (market-wide)."
    :closed (((2020 5 25) "Ramadan Feast") ((2020 5 26) "Ramadan Feast") ((2020 7 31) "Eid Al-Adha (Feast of the Sacrifice)") ((2020 8 3) "Eid Al-Adha (Feast of the Sacrifice)"))
    :open ()
    :early-closes (((2020 7 30) (12 30) "Eid Al-Adha (Feast of the Sacrifice) (Half Day)") ((2020 10 28) (12 30) "Republic Day (Half Day)"))
    :late-opens ())
   (:title "Borsa Istanbul Official Holidays 2021 / Equity Market 2021 Holiday Schedule" :year 2021 :uri "https://www.borsaistanbul.com/en/official-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.borsaistanbul.com/files/EquityMarket2021HolidaySchedule.pdf"
    :published-in "Borsa Istanbul website (Official Holidays page, Equity Market holiday schedule)"
    :dates-note "Issue date not shown; page fetched 2026-11-28 lists 2012-2026. Half days: equity closes 12:30 (continuous 10:00-12:30, closing auction to 12:35, TAC to 12:40) per session schedule effective 2016-11-14; the table says 'Until 13:00' (market-wide)."
    :closed (((2021 5 13) "Ramadan Feast") ((2021 5 14) "Ramadan Feast") ((2021 7 20) "Eid Al-Adha (Feast of the Sacrifice)") ((2021 7 21) "Eid Al-Adha (Feast of the Sacrifice)") ((2021 7 22) "Eid Al-Adha (Feast of the Sacrifice)") ((2021 7 23) "Eid Al-Adha (Feast of the Sacrifice)"))
    :open ()
    :early-closes (((2021 5 12) (12 30) "Ramadan Feast (Half Day)") ((2021 7 19) (12 30) "Eid Al-Adha (Feast of the Sacrifice) (Half Day)") ((2021 10 28) (12 30) "Republic Day (Half Day)"))
    :late-opens ())
   (:title "Borsa Istanbul Official Holidays 2022 / Equity Market 2022 Holiday Schedule" :year 2022 :uri "https://www.borsaistanbul.com/en/official-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.borsaistanbul.com/files/equity-market-2022-holiday-schedule.pdf"
    :published-in "Borsa Istanbul website (Official Holidays page, Equity Market holiday schedule)"
    :dates-note "Issue date not shown; page fetched 2026-11-28 lists 2012-2026. Half days: equity closes 12:30 (continuous 10:00-12:30, closing auction to 12:35, TAC to 12:40) per session schedule effective 2016-11-14; the table says 'Until 13:00' (market-wide)."
    :closed (((2022 5 2) "Ramadan Feast") ((2022 5 3) "Ramadan Feast") ((2022 5 4) "Ramadan Feast") ((2022 7 11) "Eid Al-Adha (Feast of the Sacrifice)") ((2022 7 12) "Eid Al-Adha (Feast of the Sacrifice)"))
    :open ()
    :early-closes (((2022 7 8) (12 30) "Eid Al-Adha (Feast of the Sacrifice) (Half Day)") ((2022 10 28) (12 30) "Republic Day (Half Day)"))
    :late-opens ())
   (:title "Borsa Istanbul Official Holidays 2023 / Equity Market 2023 Holiday Schedule" :year 2023 :uri "https://www.borsaistanbul.com/en/official-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.borsaistanbul.com/files/equity-market-2023-holiday-schedule.pdf"
    :published-in "Borsa Istanbul website (Official Holidays page, Equity Market holiday schedule)"
    :dates-note "Issue date not shown; page fetched 2026-11-28 lists 2012-2026. Half days: equity closes 12:30 (continuous 10:00-12:30, closing auction to 12:35, TAC to 12:40) per session schedule effective 2016-11-14; the table says 'Until 13:00' (market-wide)."
    :closed (((2023 4 21) "Ramadan Feast") ((2023 6 28) "Eid Al-Adha (Feast of the Sacrifice)") ((2023 6 29) "Eid Al-Adha (Feast of the Sacrifice)") ((2023 6 30) "Eid Al-Adha (Feast of the Sacrifice)"))
    :open ()
    :early-closes (((2023 4 20) (12 30) "Ramadan Feast (Half Day)") ((2023 6 27) (12 30) "Eid Al-Adha (Feast of the Sacrifice) (Half Day)"))
    :late-opens ())
   (:title "Borsa Istanbul Official Holidays 2024 / Equity Market 2024 Holiday Schedule" :year 2024 :uri "https://www.borsaistanbul.com/en/official-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.borsaistanbul.com/files/equity-market-2024-holiday-schedule.pdf"
    :published-in "Borsa Istanbul website (Official Holidays page, Equity Market holiday schedule)"
    :dates-note "Issue date not shown; page fetched 2026-11-28 lists 2012-2026. Half days: equity closes 12:30 (continuous 10:00-12:30, closing auction to 12:35, TAC to 12:40) per session schedule effective 2016-11-14; the table says 'Until 13:00' (market-wide)."
    :closed (((2024 4 10) "Ramadan Feast") ((2024 4 11) "Ramadan Feast") ((2024 4 12) "Ramadan Feast") ((2024 6 17) "Eid Al-Adha (Feast of the Sacrifice)") ((2024 6 18) "Eid Al-Adha (Feast of the Sacrifice)") ((2024 6 19) "Eid Al-Adha (Feast of the Sacrifice)"))
    :open ()
    :early-closes (((2024 4 9) (12 30) "Ramadan Feast (Half Day)") ((2024 10 28) (12 30) "Republic Day (Half Day)"))
    :late-opens ())
   (:title "Borsa Istanbul Official Holidays 2025 / Equity Market 2025 Holiday Schedule" :year 2025 :uri "https://www.borsaistanbul.com/en/official-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.borsaistanbul.com/files/equity-market-2025-holiday-schedule.pdf"
    :published-in "Borsa Istanbul website (Official Holidays page, Equity Market holiday schedule)"
    :dates-note "Issue date not shown; page fetched 2026-11-28 lists 2012-2026. Half days: equity closes 12:30 (continuous 10:00-12:30, closing auction to 12:35, TAC to 12:40) per session schedule effective 2016-11-14; the table says 'Until 13:00' (market-wide)."
    :closed (((2025 3 31) "Ramadan Feast") ((2025 4 1) "Ramadan Feast") ((2025 6 6) "Eid Al-Adha (Feast of the Sacrifice)") ((2025 6 9) "Eid Al-Adha (Feast of the Sacrifice)"))
    :open ()
    :early-closes (((2025 6 5) (12 30) "Eid Al-Adha (Feast of the Sacrifice) (Half Day)") ((2025 10 28) (12 30) "Republic Day (Half Day)"))
    :late-opens ())
   (:title "Borsa Istanbul Official Holidays 2026 / Equity Market 2026 Holiday Schedule" :year 2026 :uri "https://www.borsaistanbul.com/en/official-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.borsaistanbul.com/files/equity-market-2026-holiday-schedule.pdf"
    :published-in "Borsa Istanbul website (Official Holidays page, Equity Market holiday schedule)"
    :dates-note "Issue date not shown; page fetched 2026-11-28 lists 2012-2026. Half days: equity closes 12:30 (continuous 10:00-12:30, closing auction to 12:35, TAC to 12:40) per session schedule effective 2016-11-14; the table says 'Until 13:00' (market-wide)."
    :closed (((2026 3 20) "Ramadan Feast") ((2026 5 27) "Eid Al-Adha (Feast of the Sacrifice)") ((2026 5 28) "Eid Al-Adha (Feast of the Sacrifice)") ((2026 5 29) "Eid Al-Adha (Feast of the Sacrifice)"))
    :open ()
    :early-closes (((2026 3 19) (12 30) "Ramadan Feast (Half Day)") ((2026 5 26) (12 30) "Eid Al-Adha (Feast of the Sacrifice) (Half Day)") ((2026 10 28) (12 30) "Republic Day (Half Day)"))
    :late-opens ())
   (:title "Borsa İstanbul A.Ş. Duyurusu: Pay Piyasası ile Vadeli İşlem ve Opsiyon Piyasası Pay ve Pay Endeksi Türev Pazarlarında İşlemlerin Durdurulması (after the 6 February 2023 earthquakes)"
    :uri "https://www.kap.org.tr/tr/Bildirim/1111382"
    :issued (2023 2 8) :issued-uri "https://www.kap.org.tr/tr/Bildirim/1111382"
    :published (2023 2 8) :published-uri "https://www.kap.org.tr/tr/Bildirim/1111382"
    :published-in "KAP (Kamuyu Aydınlatma Platformu), Borsa İstanbul A.Ş. Duyurusu, 08.02.2023 11:01"
    :dates-note "The KAP notice halts trading on 8 February 2023; the five-business-day closure and the cancellation of the 8 February trades are in the Board decision reported the same day (press: medyascope.tv 2023-02-08); trading resumed on 15 February with the measures of the Borsa İstanbul KAP notice of 14.02.2023 (https://www.kap.org.tr/tr/Bildirim/1113112)."
    :closed (((2023 2 8) "Market closed after the earthquakes; trades cancelled") ((2023 2 9) "Market closed after the earthquakes") ((2023 2 10) "Market closed after the earthquakes") ((2023 2 13) "Market closed after the earthquakes") ((2023 2 14) "Market closed after the earthquakes"))
    :open () :early-closes () :late-opens ())))
