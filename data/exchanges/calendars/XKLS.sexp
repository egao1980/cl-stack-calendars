;;;; XKLS exchange trading-day calendar (#49). Bursa Malaysia (KLSE until 2004)
;;;; equities. Primary: the exchange's own yearly holiday page, 2001-2026 (web.archive.org snapshots of
;;;; klse.com.my / bursamalaysia.com), plus Bursa media releases 2021-2024. 2000, 2010, 2027-2028: no
;;;; exchange list (gaps; base MY assumed). Self-contained: fixed-date rules + one notice per year with the
;;;; lunar holidays and Sunday-replacement days. Half-day (afternoon closed, 12:30) eves of CNY and
;;;; Hari Raya Puasa: 9 Sep 2010 - 31 Jan 2022; normal hours on those eves from 2024 (see XKLS-hours.md).
;;;; Federal Territory Day (1 Feb) and Thaipusam (from 2008) are closures: Bursa follows Kuala Lumpur
;;;; holidays, which the federal MY calendar in data/my does not hold.

(:name "XKLS"
 :title "Bursa Malaysia (KLSE) trading days"
 :authority "Bursa Malaysia Berhad, yearly 'Bursa Malaysia Holidays' list ('The non-trading days of the Exchange are in line with the national public holidays of Malaysia'); KLSE Holidays 2001-2004"
 :authority-uri "https://www.bursamalaysia.com/about_bursa/about_us/calendar"
 :bases ((:calendar "MY" :from (2000 1 1) :to (2000 12 31)
          :authority "ASSUMPTION: no KLSE holiday list for 2000 found (earliest holidays page snapshot 2001-12-12). Federal Territory Day 2000 comes from the rule (assumed).")
         (:calendar "MY" :from (2010 1 1) :to (2010 12 31)
          :authority "ASSUMPTION: no Bursa holidays page snapshot for 2010 (gap 2009-09-04 .. 2011-08-09); MY federal list 2010 plus secondary Bursa notices below")
         (:calendar "MY" :from (2027 1 1) :to nil
          :authority "ASSUMPTION: Bursa lists for 2027+ not yet published; Thaipusam (KL) is not in MY and is missing for these years"))
 :rules ((:fixed "New Year's Day" 1 1 :from 2001 :authority "KLSE/Bursa holiday lists 2001-2026 (web.archive.org); see yearly notices")
         (:fixed "Federal Territory Day" 2 1 :from 2000 :authority "KLSE/Bursa holiday lists 2001-2025 (2000 assumed: Kuala Lumpur holiday since 1974, not in base MY) (Bursa follows Kuala Lumpur holidays); 2026 list omits it (falls on Sunday with Thaipusam)")
         (:fixed "Labour Day" 5 1 :from 2001 :authority "KLSE/Bursa holiday lists 2001-2026 ('Labour Day' / 'Workers' Day')")
         (:fixed "National Day" 8 31 :from 2001 :authority "KLSE/Bursa holiday lists 2001-2026")
         (:fixed "Malaysia Day" 9 16 :from 2011 :authority "Bursa holiday lists 2011-2026 (2010 via base MY)")
         (:fixed "Christmas Day" 12 25 :from 2001 :authority "KLSE/Bursa holiday lists 2001-2026"))
 :gaps ((:years "2000" :note "No KLSE holiday list found: klse.com.my/website/aboutus/holidays.htm first archived 2001-12-12 (lists 2001-2002); CDX search of klse.com.my to 2001 shows no other holiday page. ec 2000 closures (10 Jan, 1 Feb, 7 Feb, 16 Mar, 6 Apr, 1 May, 14 Jun, 31 Aug, 25 Dec, 27-28 Dec) and early closes 7 Jan, 4 Feb, 26 Dec unverified.")
        (:years "2010" :note "No snapshot of the Bursa 'Our Holidays' page between 2009-09-04 and 2011-08-09 (klse.com.my and bursamalaysia.com URLs both). Secondary Bursa notices (Mondo Visione reprints) give 9 Sep 2010 half day, 10 Sep, 16 Sep, 31 Dec 2010 closures.")
        (:years "2000-2009 early closes" :note "No exchange evidence of half-day eves before Sep 2010: the KLSE/Bursa holiday lists 2001-2009 show none, and the 30 Sep 2010 notice introduces the half day closure 'with immediate effect' after industry requests. ec early closes 2000-01-07, 2000-02-04, 2000-12-26, 2002-12-04, 2005-02-08, 2005-11-02, 2007-10-12, 2008-02-06, 2008-09-30 are unverified (left as full sessions here).")
        (:years "2027-2028" :note "Bursa lists not yet published (latest calendar snapshot 2026-09-11 lists 2026 only). Standing note b (2025, 2026 lists): normal trading hours on eves of CNY and Hari Raya Aidilfitri."))
 :notices (
   (:title "Bursa Malaysia / KLSE holidays 2001" :year 2001
    :uri "https://web.archive.org/web/20011212194147/http://www.klse.com.my/website/aboutus/holidays.htm"
    :issued (2001 11 28) :issued-uri "https://web.archive.org/web/20011212194147/http://www.klse.com.my/website/aboutus/holidays.htm"
    :published nil :published-uri "https://web.archive.org/web/20011212194147/http://www.klse.com.my/website/aboutus/holidays.htm"
    :published-in "KLSE website, About us: Holidays (web.archive.org snapshot 20011212194147)"
    :dates-note "Page \"Last updated: 28/11/01\" (lists 2001 and 2002); snapshot 2001-12-12. The page lists observed weekday dates (e.g. 2003 National Day as Mon 1 Sep); no substitution note."
    :closed (((2001 1 23) "Chinese New Year") ((2001 1 24) "Chinese New Year") ((2001 1 25) "Chinese New Year") ((2001 3 6) "Hari Raya Haji") ((2001 3 26) "Awal Muharram") ((2001 5 7) "Wesak Day") ((2001 6 4) "Birthday of Prophet Muhammad") ((2001 11 14) "Deepavali") ((2001 12 17) "Hari Raya Puasa") ((2001 12 18) "Hari Raya Puasa") ((2001 12 19) "Hari Raya Puasa"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2002" :year 2002
    :uri "https://web.archive.org/web/20021006135355/http://www.klse.com.my/website/aboutus/holidays.htm"
    :issued (2002 4 22) :issued-uri "https://web.archive.org/web/20021006135355/http://www.klse.com.my/website/aboutus/holidays.htm"
    :published nil :published-uri "https://web.archive.org/web/20021006135355/http://www.klse.com.my/website/aboutus/holidays.htm"
    :published-in "KLSE website, About us: Holidays (web.archive.org snapshot 20021006135355)"
    :dates-note "Page \"Last updated: 22/4/02\"; snapshot 2002-10-06. Hari Raya Puasa 6, 7* Dec marked subject to change; no later 2002 snapshot. The page lists observed weekday dates (e.g. 2003 National Day as Mon 1 Sep); no substitution note."
    :closed (((2002 2 11) "Chinese New Year") ((2002 2 12) "Chinese New Year") ((2002 2 13) "Chinese New Year") ((2002 3 15) "Awal Muharram") ((2002 4 25) "Installation of the King") ((2002 5 27) "Wesak Day") ((2002 11 4) "Deepavali") ((2002 12 6) "Hari Raya Puasa"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2003" :year 2003
    :uri "https://web.archive.org/web/20031209160400/http://www.klse.com.my/website/aboutus/holidays.htm"
    :issued (2003 12 1) :issued-uri "https://web.archive.org/web/20031209160400/http://www.klse.com.my/website/aboutus/holidays.htm"
    :published nil :published-uri "https://web.archive.org/web/20031209160400/http://www.klse.com.my/website/aboutus/holidays.htm"
    :published-in "KLSE website, About us: Holidays (web.archive.org snapshot 20031209160400)"
    :dates-note "Page \"Last updated: 1/12/03\" (lists 2004 and 2003); snapshot 2003-12-09, after the 2003 holidays. The page lists observed weekday dates (e.g. 2003 National Day as Mon 1 Sep); no substitution note."
    :closed (((2003 1 31) "Chinese New Year") ((2003 2 3) "Chinese New Year") ((2003 2 4) "Federal Territory Day") ((2003 2 12) "Hari Raya Haji") ((2003 3 4) "Awal Muharram") ((2003 5 14) "Birthday of Prophet Muhammad") ((2003 5 15) "Wesak Day") ((2003 9 1) "National Day") ((2003 10 24) "Deepavali") ((2003 11 25) "Hari Raya Puasa") ((2003 11 26) "Hari Raya Puasa"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2004" :year 2004
    :uri "https://web.archive.org/web/20041011074234/http://www.klse.com/website/aboutus/holidays.htm"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20041011074234/http://www.klse.com/website/aboutus/holidays.htm"
    :published-in "Bursa Malaysia (ex-KLSE) website, About us: Holidays (web.archive.org snapshot 20041011074234)"
    :dates-note "Undated page; snapshot 2004-10-11. Deepavali 11* Nov and Hari Raya Puasa 15, 16* Nov marked subject to change. The page lists observed weekday dates (e.g. 2003 National Day as Mon 1 Sep); no substitution note."
    :closed (((2004 1 21) "Chinese New Year") ((2004 1 22) "Chinese New Year") ((2004 1 23) "Chinese New Year") ((2004 2 2) "Hari Raya Haji") ((2004 2 3) "Federal Territory Day") ((2004 2 23) "Awal Muharram") ((2004 5 3) "Birthday of Prophet Muhammad") ((2004 5 4) "Wesak Day") ((2004 11 11) "Deepavali") ((2004 11 15) "Hari Raya Puasa") ((2004 11 16) "Hari Raya Puasa"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2005" :year 2005
    :uri "https://web.archive.org/web/20051222144204/http://www.bursamalaysia.com/website/aboutus/holidays.htm"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20051222144204/http://www.bursamalaysia.com/website/aboutus/holidays.htm"
    :published-in "Bursa Malaysia website, About us: Holidays (web.archive.org snapshot 20051222144204)"
    :dates-note "Undated page; snapshot 2005-12-22 (lists 2005 and 2006). Sunday holidays replaced by the next free day per the page note; listed Saturday holidays not replaced."
    :closed (((2005 1 21) "Hari Raya Haji") ((2005 2 9) "Chinese New Year") ((2005 2 10) "Chinese New Year") ((2005 2 11) "Awal Muharram") ((2005 4 21) "Birthday of Prophet Muhammad") ((2005 5 2) "Workers' Day (replacement)") ((2005 5 23) "Wesak Day (replacement)") ((2005 11 1) "Deepavali") ((2005 11 3) "Hari Raya Puasa") ((2005 11 4) "Hari Raya Puasa") ((2005 12 26) "Christmas Day (replacement)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2006" :year 2006
    :uri "https://web.archive.org/web/20061211215127/http://www.klse.com.my/website/bm/about_us/our_holidays.html"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20061211215127/http://www.klse.com.my/website/bm/about_us/our_holidays.html"
    :published-in "Bursa Malaysia website, Our Holidays (web.archive.org snapshot 20061211215127)"
    :dates-note "Undated page; snapshot 2006-12-11 (lists 2006 and 2007), after the 2006 holidays. Sunday holidays replaced by the next free day per the page note; listed Saturday holidays not replaced."
    :closed (((2006 1 2) "New Year's Day (replacement)") ((2006 1 10) "Hari Raya Haji") ((2006 1 30) "Chinese New Year") ((2006 1 31) "Awal Muharram") ((2006 2 2) "Chinese New Year (replacement)") ((2006 4 11) "Birthday of Prophet Muhammad") ((2006 5 12) "Wesak Day") ((2006 10 23) "Hari Raya Puasa") ((2006 10 24) "Hari Raya Puasa") ((2006 10 25) "Hari Raya Puasa"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2007" :year 2007
    :uri "https://web.archive.org/web/20071112045423/http://www.klse.com.my/website/bm/about_us/our_holidays.html"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20071112045423/http://www.klse.com.my/website/bm/about_us/our_holidays.html"
    :published-in "Bursa Malaysia website, Our Holidays (web.archive.org snapshot 20071112045423)"
    :dates-note "Undated page; snapshot 2007-11-12 (lists 2007 and 2008). Sunday holidays replaced by the next free day per the page note; listed Saturday holidays not replaced."
    :closed (((2007 1 2) "Hari Raya Haji 31 Dec 2006 (replacement)") ((2007 2 19) "Chinese New Year") ((2007 2 20) "Chinese New Year (replacement)") ((2007 4 26) "Installation of the King") ((2007 10 15) "Hari Raya Puasa (replacement)") ((2007 11 8) "Deepavali") ((2007 12 20) "Hari Raya Haji"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2008" :year 2008
    :uri "https://web.archive.org/web/20081217102440/http://www.klse.com.my/website/bm/about_us/our_holidays.html"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20081217102440/http://www.klse.com.my/website/bm/about_us/our_holidays.html"
    :published-in "Bursa Malaysia website, Our Holidays (web.archive.org snapshot 20081217102440)"
    :dates-note "Undated page; snapshot 2008-12-17 (lists 2009 and 2008). Sunday holidays replaced by the next free day per the page note; listed Saturday holidays not replaced."
    :closed (((2008 1 10) "Awal Muharram") ((2008 1 23) "Thaipusam") ((2008 2 7) "Chinese New Year") ((2008 2 8) "Chinese New Year") ((2008 3 20) "Birthday of Prophet Muhammad") ((2008 5 19) "Wesak Day") ((2008 9 1) "National Day (replacement)") ((2008 10 1) "Hari Raya Puasa") ((2008 10 2) "Hari Raya Puasa") ((2008 10 27) "Deepavali") ((2008 12 8) "Hari Raya Haji") ((2008 12 29) "Awal Muharram"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2009" :year 2009
    :uri "https://web.archive.org/web/20090904105849/http://www.klse.com.my/website/bm/about_us/our_holidays.html"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20090904105849/http://www.klse.com.my/website/bm/about_us/our_holidays.html"
    :published-in "Bursa Malaysia website, Our Holidays (web.archive.org snapshot 20090904105849)"
    :dates-note "Undated page; snapshot 2009-09-04. Sunday holidays replaced by the next free day per the page note; listed Saturday holidays not replaced."
    :closed (((2009 1 26) "Chinese New Year") ((2009 1 27) "Chinese New Year") ((2009 2 2) "Federal Territory Day (replacement)") ((2009 2 9) "Thaipusam (replacement)") ((2009 3 9) "Birthday of Prophet Muhammad") ((2009 9 21) "Hari Raya Puasa") ((2009 9 22) "Hari Raya Puasa (replacement)") ((2009 11 27) "Hari Raya Haji") ((2009 12 18) "Awal Muharram"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2011" :year 2011
    :uri "https://web.archive.org/web/20111004142745/http://www.klse.com.my/website/bm/about_us/our_holidays.html"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20111004142745/http://www.klse.com.my/website/bm/about_us/our_holidays.html"
    :published-in "Bursa Malaysia website, Our Holidays (web.archive.org snapshot 20111004142745)"
    :dates-note "Undated page; snapshot 2011-10-04 (lists 2011 and 2012). Sunday holidays replaced by the next free day per the page note; listed Saturday holidays not replaced."
    :closed (((2011 1 20) "Thaipusam") ((2011 2 3) "Chinese New Year") ((2011 2 4) "Chinese New Year") ((2011 2 15) "Birthday of Prophet Muhammad") ((2011 5 2) "Workers' Day (replacement)") ((2011 5 17) "Wesak Day") ((2011 8 30) "Hari Raya Puasa") ((2011 10 26) "Deepavali") ((2011 11 7) "Hari Raya Haji (replacement)") ((2011 11 28) "Awal Muharram (replacement)") ((2011 12 26) "Christmas Day (replacement)"))
    :open ()
    :early-closes (((2011 2 2) (12 30) "Chinese New Year eve: no afternoon session (half day trading closure)") ((2011 8 29) (12 30) "Hari Raya Puasa eve: no afternoon session (half day trading closure)"))
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2012" :year 2012
    :uri "https://web.archive.org/web/20120505072142/http://www.bursamalaysia.com/website/bm/about_us/our_holidays.html"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20120505072142/http://www.bursamalaysia.com/website/bm/about_us/our_holidays.html"
    :published-in "Bursa Malaysia website, Our Holidays (web.archive.org snapshot 20120505072142)"
    :dates-note "Undated page; snapshot 2012-05-05. Sunday holidays replaced by the next free day per the page note; listed Saturday holidays not replaced."
    :closed (((2012 1 2) "New Year's Day (replacement)") ((2012 1 23) "Chinese New Year") ((2012 1 24) "Chinese New Year") ((2012 2 6) "Birthday of Prophet Muhammad (replacement)") ((2012 2 7) "Thaipusam") ((2012 4 11) "Installation of Yang di-Pertuan Agong") ((2012 8 20) "Hari Raya Puasa") ((2012 8 21) "Hari Raya Puasa (replacement)") ((2012 9 17) "Malaysia Day (replacement)") ((2012 10 26) "Hari Raya Haji") ((2012 11 13) "Deepavali") ((2012 11 15) "Awal Muharram"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2013" :year 2013
    :uri "https://web.archive.org/web/20130807070817/http://www.bursamalaysia.com/corporate/about-us/holidays/"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20130807070817/http://www.bursamalaysia.com/corporate/about-us/holidays/"
    :published-in "Bursa Malaysia corporate website, About Us: Holidays (web.archive.org snapshot 20130807070817)"
    :dates-note "Undated page; snapshot 2013-08-07 (lists 2013 and 2014). Sunday holidays replaced by the next free day per the page note; listed Saturday holidays not replaced."
    :closed (((2013 1 24) "Birthday of Prophet Muhammad") ((2013 1 28) "Thaipusam (replacement)") ((2013 2 11) "Chinese New Year") ((2013 2 12) "Chinese New Year (replacement)") ((2013 5 24) "Wesak Day") ((2013 8 8) "Hari Raya Puasa") ((2013 8 9) "Hari Raya Puasa") ((2013 10 15) "Hari Raya Haji") ((2013 11 5) "Awal Muharram"))
    :open ()
    :early-closes (((2013 8 7) (12 30) "Hari Raya Puasa eve: no afternoon session (half day trading closure)"))
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2014" :year 2014
    :uri "https://web.archive.org/web/20140806184651/http://www.bursamalaysia.com/corporate/about-us/holidays/"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20140806184651/http://www.bursamalaysia.com/corporate/about-us/holidays/"
    :published-in "Bursa Malaysia corporate website, About Us: Holidays (web.archive.org snapshot 20140806184651)"
    :dates-note "Undated page; snapshot 2014-08-06. Note: \"February 3 has been declared a holiday by the Government\". Sunday holidays replaced by the next free day per the page note; listed Saturday holidays not replaced."
    :closed (((2014 1 14) "Birthday of Prophet Muhammad") ((2014 1 17) "Thaipusam") ((2014 1 31) "Chinese New Year") ((2014 2 3) "Chinese New Year (declared holiday)") ((2014 5 13) "Wesak Day") ((2014 7 15) "Nuzul Al-Quran") ((2014 7 28) "Hari Raya Puasa") ((2014 7 29) "Hari Raya Puasa") ((2014 9 1) "National Day (replacement)") ((2014 10 6) "Hari Raya Haji (replacement)") ((2014 10 22) "Deepavali"))
    :open ()
    :early-closes (((2014 1 30) (12 30) "Chinese New Year eve: no afternoon session (half day trading closure)"))
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2015" :year 2015
    :uri "https://web.archive.org/web/20150810161201/http://www.bursamalaysia.com/corporate/about-us/holidays/"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20150810161201/http://www.bursamalaysia.com/corporate/about-us/holidays/"
    :published-in "Bursa Malaysia corporate website, About Us: Holidays (web.archive.org snapshot 20150810161201)"
    :dates-note "Undated page; snapshot 2015-08-10. Sunday holidays replaced by the next free day per the page note; listed Saturday holidays not replaced."
    :closed (((2015 2 2) "Federal Territory Day (replacement)") ((2015 2 3) "Thaipusam") ((2015 2 19) "Chinese New Year") ((2015 2 20) "Chinese New Year") ((2015 5 4) "Wesak Day (replacement)") ((2015 7 17) "Hari Raya Puasa") ((2015 9 24) "Hari Raya Haji") ((2015 10 14) "Awal Muharram") ((2015 11 10) "Deepavali") ((2015 12 24) "Birthday of Prophet Muhammad"))
    :open ()
    :early-closes (((2015 2 18) (12 30) "Chinese New Year eve: no afternoon session (half day trading closure)") ((2015 7 16) (12 30) "Hari Raya Puasa eve: no afternoon session (half day trading closure)"))
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2016" :year 2016
    :uri "https://web.archive.org/web/20161202124124/http://www.bursamalaysia.com/corporate/about-us/holidays/"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20161202124124/http://www.bursamalaysia.com/corporate/about-us/holidays/"
    :published-in "Bursa Malaysia corporate website, About Us: Holidays (web.archive.org snapshot 20161202124124)"
    :dates-note "Undated page; snapshot 2016-12-02 (lists 2016 and 2017). Sunday holidays replaced by the next free day per the page note; listed Saturday holidays not replaced."
    :closed (((2016 1 25) "Thaipusam (replacement)") ((2016 2 8) "Chinese New Year") ((2016 2 9) "Chinese New Year") ((2016 5 2) "Workers' Day (replacement)") ((2016 6 22) "Nuzul Al-Quran") ((2016 7 6) "Hari Raya Puasa") ((2016 7 7) "Hari Raya Puasa") ((2016 9 12) "Hari Raya Haji") ((2016 10 3) "Awal Muharram (replacement)") ((2016 12 12) "Birthday of Prophet Muhammad") ((2016 12 26) "Christmas Day (replacement)"))
    :open ()
    :early-closes (((2016 7 5) (12 30) "Hari Raya Puasa eve: no afternoon session (half day trading closure)"))
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2017" :year 2017
    :uri "https://web.archive.org/web/20171209201256/http://www.bursamalaysia.com/corporate/about-us/holidays/"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20171209201256/http://www.bursamalaysia.com/corporate/about-us/holidays/"
    :published-in "Bursa Malaysia corporate website, About Us: Holidays (web.archive.org snapshot 20171209201256)"
    :dates-note "Undated page; snapshot 2017-12-09 (lists 2017 and 2018). 4 Sep 2017 special holiday not on the list. Sunday holidays replaced by the next free day per the page note; listed Saturday holidays not replaced."
    :closed (((2017 1 2) "New Year's Day (replacement)") ((2017 1 30) "Chinese New Year (replacement)") ((2017 2 9) "Thaipusam") ((2017 4 24) "Installation of Yang di-Pertuan Agong") ((2017 5 10) "Wesak Day") ((2017 6 12) "Nuzul Al-Quran") ((2017 6 26) "Hari Raya Puasa") ((2017 6 27) "Hari Raya Puasa (replacement)") ((2017 9 1) "Hari Raya Haji") ((2017 9 22) "Awal Muharram") ((2017 10 18) "Deepavali") ((2017 12 1) "Birthday of Prophet Muhammad"))
    :open ()
    :early-closes (((2017 1 27) (12 30) "Chinese New Year eve: no afternoon session (half day trading closure)"))
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2018" :year 2018
    :uri "https://web.archive.org/web/20181224130446/http://www.bursamalaysia.com/corporate/about-us/holidays/"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20181224130446/http://www.bursamalaysia.com/corporate/about-us/holidays/"
    :published-in "Bursa Malaysia corporate website, About Us: Holidays (web.archive.org snapshot 20181224130446)"
    :dates-note "Undated page; snapshot 2018-12-24 (lists 2018 and 2019), incl. GE14 9 May and special holiday 10-11 May. Sunday holidays replaced by the next free day per the page note; listed Saturday holidays not replaced."
    :closed (((2018 1 31) "Thaipusam") ((2018 2 16) "Chinese New Year") ((2018 5 9) "Malaysia's 14th General Election") ((2018 5 10) "Special Holiday") ((2018 5 11) "Special Holiday") ((2018 5 29) "Wesak Day") ((2018 6 15) "Hari Raya Puasa") ((2018 8 22) "Hari Raya Haji") ((2018 9 10) "Yang Dipertuan Agong's Birthday (replacement)") ((2018 9 11) "Awal Muharram") ((2018 9 17) "Malaysia Day (replacement)") ((2018 11 6) "Deepavali") ((2018 11 20) "Birthday of Prophet Muhammad"))
    :open ()
    :early-closes (((2018 2 15) (12 30) "Chinese New Year eve: no afternoon session (half day trading closure)") ((2018 6 14) (12 30) "Hari Raya Puasa eve: no afternoon session (half day trading closure)"))
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2019" :year 2019
    :uri "https://web.archive.org/web/20191210044334/https://www.bursamalaysia.com/about_bursa/about_us/calendar"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20191210044334/https://www.bursamalaysia.com/about_bursa/about_us/calendar"
    :published-in "Bursa Malaysia website, About Bursa: Calendar (web.archive.org snapshot 20191210044334)"
    :dates-note "Undated page; snapshot 2019-12-10 (lists 2019 and 2020). Sunday holidays replaced by the next free day per the page note; listed Saturday holidays not replaced."
    :closed (((2019 1 21) "Thaipusam") ((2019 2 5) "Chinese New Year") ((2019 2 6) "Chinese New Year") ((2019 5 20) "Wesak Day (replacement)") ((2019 5 22) "Nuzul Al-Quran") ((2019 6 5) "Hari Raya Puasa") ((2019 6 6) "Hari Raya Puasa") ((2019 7 30) "Installation of Yang di-Pertuan Agong") ((2019 8 12) "Hari Raya Haji (replacement)") ((2019 9 2) "Awal Muharram (replacement)") ((2019 9 9) "Yang Dipertuan Agong's Birthday") ((2019 10 28) "Deepavali (replacement)"))
    :open ()
    :early-closes (((2019 2 4) (12 30) "Chinese New Year eve: no afternoon session (half day trading closure)") ((2019 6 4) (12 30) "Hari Raya Puasa eve: no afternoon session (half day trading closure)"))
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2020" :year 2020
    :uri "https://web.archive.org/web/20201202033753/https://www.bursamalaysia.com/about_bursa/about_us/calendar"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20201202033753/https://www.bursamalaysia.com/about_bursa/about_us/calendar"
    :published-in "Bursa Malaysia website, About Bursa: Calendar (web.archive.org snapshot 20201202033753)"
    :dates-note "Undated page; snapshot 2020-12-02 (lists 2020 and 2021). Sunday holidays replaced by the next free day per the page note; listed Saturday holidays not replaced."
    :closed (((2020 1 27) "Chinese New Year (replacement)") ((2020 5 7) "Wesak Day") ((2020 5 11) "Nuzul Al-Quran (replacement)") ((2020 5 25) "Hari Raya Puasa") ((2020 5 26) "Hari Raya Puasa (replacement)") ((2020 6 8) "Yang Dipertuan Agong's Birthday") ((2020 7 31) "Hari Raya Haji") ((2020 8 20) "Awal Muharram") ((2020 10 29) "Birthday of Prophet Muhammad"))
    :open ()
    :early-closes (((2020 1 24) (12 30) "Chinese New Year eve: no afternoon session (half day trading closure)"))
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2021" :year 2021
    :uri "https://web.archive.org/web/20210916182752/https://www.bursamalaysia.com/about_bursa/about_us/calendar"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20210916182752/https://www.bursamalaysia.com/about_bursa/about_us/calendar"
    :published-in "Bursa Malaysia website, About Bursa: Calendar (web.archive.org snapshot 20210916182752)"
    :dates-note "Undated page; snapshot 2021-09-16. 3 Dec 2021 Federal Territories holiday announced later (separate notice). Sunday holidays replaced by the next free day per the page note; listed Saturday holidays not replaced."
    :closed (((2021 1 28) "Thaipusam") ((2021 2 12) "Chinese New Year") ((2021 4 29) "Nuzul Al-Quran") ((2021 5 13) "Hari Raya Puasa") ((2021 5 14) "Hari Raya Puasa") ((2021 5 26) "Wesak Day") ((2021 6 7) "Yang Dipertuan Agong's Birthday") ((2021 7 20) "Hari Raya Haji") ((2021 8 10) "Awal Muharram") ((2021 10 19) "Birthday of Prophet Muhammad") ((2021 11 4) "Deepavali"))
    :open ()
    :early-closes (((2021 2 11) (12 30) "Chinese New Year eve: no afternoon session (half day trading closure)") ((2021 5 12) (12 30) "Hari Raya Puasa eve: no afternoon session (half day trading closure)"))
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2022" :year 2022
    :uri "https://web.archive.org/web/20220111170725/https://www.bursamalaysia.com/about_bursa/about_us/calendar"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20220111170725/https://www.bursamalaysia.com/about_bursa/about_us/calendar"
    :published-in "Bursa Malaysia website, About Bursa: Calendar (web.archive.org snapshot 20220111170725)"
    :dates-note "Undated page; snapshot 2022-01-11. One-off closures 16 May, 18 Nov, 28 Nov 2022 from Bursa media releases (separate notices). Sunday holidays replaced by the next free day per the page note; listed Saturday holidays not replaced."
    :closed (((2022 1 18) "Thaipusam") ((2022 2 2) "Chinese New Year") ((2022 4 19) "Nuzul Al-Quran") ((2022 5 2) "Workers' Day (replacement)") ((2022 5 3) "Hari Raya Puasa") ((2022 5 4) "Hari Raya Puasa") ((2022 6 6) "Yang Dipertuan Agong's Birthday") ((2022 7 11) "Hari Raya Haji (replacement)") ((2022 10 10) "Birthday of Prophet Muhammad (replacement)") ((2022 10 24) "Deepavali") ((2022 12 26) "Christmas Day (replacement)"))
    :open ()
    :early-closes (((2022 1 31) (12 30) "Chinese New Year eve: no afternoon session (half day trading closure)"))
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2023" :year 2023
    :uri "https://web.archive.org/web/20231202225428/https://www.bursamalaysia.com/about_bursa/about_us/calendar"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20231202225428/https://www.bursamalaysia.com/about_bursa/about_us/calendar"
    :published-in "Bursa Malaysia website, About Bursa: Calendar (web.archive.org snapshot 20231202225428)"
    :dates-note "Undated page; snapshot 2023-12-02 (lists 2023 and 2024), incl. SPECIAL PUBLIC HOLIDAY 21 Apr 2023. Sunday holidays replaced by the next free day per the page note; listed Saturday holidays not replaced."
    :closed (((2023 1 2) "New Year's Day (replacement)") ((2023 1 23) "Chinese New Year") ((2023 1 24) "Chinese New Year (replacement)") ((2023 2 6) "Thaipusam (replacement)") ((2023 4 21) "Special public holiday (additional Hari Raya Aidilfitri)") ((2023 4 24) "Hari Raya Puasa (replacement)") ((2023 5 4) "Wesak Day") ((2023 6 5) "Yang Dipertuan Agong's Birthday") ((2023 6 29) "Hari Raya Haji") ((2023 7 19) "Awal Muharram") ((2023 9 28) "Birthday of Prophet Muhammad") ((2023 11 13) "Deepavali (replacement)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2024" :year 2024
    :uri "https://web.archive.org/web/20240801151606/https://www.bursamalaysia.com/about_bursa/about_us/calendar"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20240801151606/https://www.bursamalaysia.com/about_bursa/about_us/calendar"
    :published-in "Bursa Malaysia website, About Bursa: Calendar (web.archive.org snapshot 20240801151606)"
    :dates-note "Undated page; snapshot 2024-08-01. Eve half-day rows and note removed (cf. 2023-12-02 snapshot). Sunday holidays replaced by the next free day per the page note; listed Saturday holidays not replaced."
    :closed (((2024 1 25) "Thaipusam") ((2024 2 12) "Chinese New Year (replacement)") ((2024 3 28) "Nuzul Al-Quran") ((2024 4 10) "Hari Raya Puasa") ((2024 4 11) "Hari Raya Puasa") ((2024 5 22) "Wesak Day") ((2024 6 3) "Yang Dipertuan Agong's Birthday") ((2024 6 17) "Hari Raya Haji") ((2024 7 8) "Awal Muharram (replacement)") ((2024 10 31) "Deepavali"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2025" :year 2025
    :uri "https://web.archive.org/web/20250205181612/https://www.bursamalaysia.com/about_bursa/about_us/calendar"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20250205181612/https://www.bursamalaysia.com/about_bursa/about_us/calendar"
    :published-in "Bursa Malaysia website, About Bursa: Calendar (web.archive.org snapshot 20250205181612)"
    :dates-note "Undated page; snapshot 2025-02-05. Note b: normal trading hours on the eves of CNY and Hari Raya Aidilfitri. 15 Sep 2025 additional holiday announced later (separate notice). Sunday holidays replaced by the next free day per the page note; listed Saturday holidays not replaced."
    :closed (((2025 1 29) "Chinese New Year") ((2025 1 30) "Chinese New Year") ((2025 2 11) "Thaipusam") ((2025 3 18) "Nuzul Al-Quran") ((2025 3 31) "Hari Raya Puasa") ((2025 4 1) "Hari Raya Puasa") ((2025 5 12) "Wesak Day") ((2025 6 2) "Yang Dipertuan Agong's Birthday") ((2025 6 27) "Awal Muharram") ((2025 9 1) "National Day (replacement)") ((2025 9 5) "Birthday of Prophet Muhammad") ((2025 10 20) "Deepavali"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Bursa Malaysia / KLSE holidays 2026" :year 2026
    :uri "https://web.archive.org/web/20260911115934/https://www.bursamalaysia.com/about_bursa/about_us/calendar"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20260911115934/https://www.bursamalaysia.com/about_bursa/about_us/calendar"
    :published-in "Bursa Malaysia website, About Bursa: Calendar (web.archive.org snapshot 20260911115934)"
    :dates-note "Undated page; snapshot 2026-09-11. Lists Thaipusam 1 Feb (Sun) but no separate Federal Territory Day row; 20 Mar 2026 additional Aidilfitri holiday from a separate notice. Sunday holidays replaced by the next free day per the page note; listed Saturday holidays not replaced."
    :closed (((2026 2 17) "Chinese New Year") ((2026 2 18) "Chinese New Year") ((2026 5 27) "Hari Raya Haji") ((2026 6 1) "Yang Dipertuan Agong's Birthday") ((2026 6 17) "Awal Muharram") ((2026 8 25) "Birthday of Prophet Muhammad") ((2026 11 9) "Deepavali (replacement)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Bursa Malaysia: closure of Exchange on Hari Raya Aidilfitri, half day trading on 9 September 2010"
    :uri "https://mondovisione.com/news/bursa-malaysia-closure-of-exchange-on-hari-raya-aidilfitri-half-day-trading-on-t-2011124"
    :issued (2010 9 3) :issued-uri "https://mondovisione.com/news/bursa-malaysia-closure-of-exchange-on-hari-raya-aidilfitri-half-day-trading-on-t-2011124"
    :published (2010 9 3) :published-uri "https://mondovisione.com/news/bursa-malaysia-closure-of-exchange-on-hari-raya-aidilfitri-half-day-trading-on-t-2011124"
    :published-in "Bursa Malaysia announcement as reprinted by Mondo Visione (original not archived)"
    :dates-note "Dated 3 Sep 2010: equities close 12:30 (derivatives 12:45) on Thu 9 Sep 2010, offices closed Fri 10 Sep, resume Mon 13 Sep 2010. Bursa original not found on web.archive.org."
    :closed (((2010 9 10) "Hari Raya Puasa"))
    :open ()
    :early-closes (((2010 9 9) (12 30) "Hari Raya Puasa eve: equities closed from 12:30 (derivatives 12:45)"))
    :late-opens ()
    :confidence :secondary)
   (:title "Trading on Bursa Malaysia to close half day on eves of Hari Raya Aidilfitri and Chinese New Year"
    :uri "https://mondovisione.com/media-and-resources/news/trading-on-bursa-malaysia-to-close-half-day-on-eves-of-hari-raya-aidilfitri-and--2011124/"
    :issued (2010 9 30) :issued-uri "https://mondovisione.com/media-and-resources/news/trading-on-bursa-malaysia-to-close-half-day-on-eves-of-hari-raya-aidilfitri-and--2011124/"
    :published (2010 9 30) :published-uri "https://mondovisione.com/media-and-resources/news/trading-on-bursa-malaysia-to-close-half-day-on-eves-of-hari-raya-aidilfitri-and--2011124/"
    :published-in "Bursa Malaysia announcement as reprinted by Mondo Visione (original not archived)"
    :dates-note "Rule evidence only: half day trading closure on the eves of Hari Raya Aidilfitri and Chinese New Year with immediate effect (dated 30 Sep 2010); the broking industry had frequently requested it."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :confidence :secondary)
   (:title "Closure of Bursa Malaysia Berhad on 31 December 2010"
    :uri "https://mondovisione.com/news/closure-of-bursa-malaysia-berhad-on-31-december-2010-2011124"
    :issued (2010 12 30) :issued-uri "https://mondovisione.com/news/closure-of-bursa-malaysia-berhad-on-31-december-2010-2011124"
    :published (2010 12 30) :published-uri "https://mondovisione.com/news/closure-of-bursa-malaysia-berhad-on-31-december-2010-2011124"
    :published-in "Bursa Malaysia announcement as reprinted by Mondo Visione (original not archived)"
    :dates-note "Dated 30 Dec 2010; PM declared a public holiday; offices resume Mon 3 Jan 2011."
    :closed (((2010 12 31) "Public holiday declared by the Prime Minister"))
    :open ()
    :early-closes ()
    :late-opens ()
    :confidence :secondary)
   (:title "Closure of Bursa Malaysia in conjunction with Hari Raya Aidil Fitri and National Day 2011"
    :uri "https://mondovisione.com/news/closure-of-bursa-malaysia-in-conjunction-with-hari-raya-aidil-fitri-and-national-201188"
    :issued (2011 8 8) :issued-uri "https://mondovisione.com/news/closure-of-bursa-malaysia-in-conjunction-with-hari-raya-aidil-fitri-and-national-201188"
    :published (2011 8 8) :published-uri "https://mondovisione.com/news/closure-of-bursa-malaysia-in-conjunction-with-hari-raya-aidil-fitri-and-national-201188"
    :published-in "Bursa Malaysia announcement as reprinted by Mondo Visione (original not archived)"
    :dates-note "Two scenarios; Hari Raya fell on Tue 30 Aug 2011, so offices closed 30 Aug - 1 Sep and resumed Fri 2 Sep 2011."
    :closed (((2011 9 1) "Hari Raya Puasa / National Day replacement"))
    :open ()
    :early-closes (((2011 8 29) (12 30) "Hari Raya Puasa eve: morning session only"))
    :late-opens ()
    :confidence :secondary)
   (:title "Closure of Bursa Malaysia in conjunction with a special public holiday"
    :uri "https://mondovisione.com/news/closure-of-bursa-malaysia-in-conjunction-with-a-special-public-holiday-2017830"
    :issued (2017 8 30) :issued-uri "https://mondovisione.com/news/closure-of-bursa-malaysia-in-conjunction-with-a-special-public-holiday-2017830"
    :published (2017 8 30) :published-uri "https://mondovisione.com/news/closure-of-bursa-malaysia-in-conjunction-with-a-special-public-holiday-2017830"
    :published-in "Bursa Malaysia announcement as reprinted by Mondo Visione (original not archived)"
    :dates-note "Dated 30 Aug 2017; resume Tue 5 Sep 2017."
    :closed (((2017 9 4) "Special public holiday (SEA Games)"))
    :open ()
    :early-closes ()
    :late-opens ()
    :confidence :secondary)
   (:title "Closure of Bursa Malaysia in conjunction with Chinese New Year 2021"
    :uri "https://web.archive.org/web/20210208113423/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-chinese-new-year-2021"
    :issued (2021 2 8) :issued-uri "https://web.archive.org/web/20210208113423/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-chinese-new-year-2021"
    :published (2021 2 8) :published-uri "https://web.archive.org/web/20210208113423/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-chinese-new-year-2021"
    :published-in "Bursa Malaysia media release (web.archive.org snapshot 20210208113423)"
    :dates-note nil
    :closed (((2021 2 12) "Chinese New Year"))
    :open ()
    :early-closes (((2021 2 11) (12 30) "Chinese New Year eve: morning session only"))
    :late-opens ())
   (:title "Closure of Bursa Malaysia in conjunction with public holiday for Federal Territories"
    :uri "https://mondovisione.com/media-and-resources/news/closure-of-bursa-malaysia-in-conjunction-with-public-holiday-for-federal-territo-2021122"
    :issued (2021 12 2) :issued-uri "https://mondovisione.com/media-and-resources/news/closure-of-bursa-malaysia-in-conjunction-with-public-holiday-for-federal-territo-2021122"
    :published (2021 12 2) :published-uri "https://mondovisione.com/media-and-resources/news/closure-of-bursa-malaysia-in-conjunction-with-public-holiday-for-federal-territo-2021122"
    :published-in "Bursa Malaysia announcement as reprinted by Mondo Visione (original not archived)"
    :dates-note "Dated 2 Dec 2021; closed Fri 3 Dec, resume Mon 6 Dec 2021."
    :closed (((2021 12 3) "Federal Territories special public holiday"))
    :open ()
    :early-closes ()
    :late-opens ()
    :confidence :secondary)
   (:title "Closure of Bursa Malaysia in conjunction with Federal Territory Day and Chinese New Year holidays"
    :uri "https://web.archive.org/web/20220118125212/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjuction-with-federal-territory-day-and-chinese-new-year-holidays"
    :issued (2022 1 17) :issued-uri "https://web.archive.org/web/20220118125212/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjuction-with-federal-territory-day-and-chinese-new-year-holidays"
    :published (2022 1 17) :published-uri "https://web.archive.org/web/20220118125212/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjuction-with-federal-territory-day-and-chinese-new-year-holidays"
    :published-in "Bursa Malaysia media release (web.archive.org snapshot 20220118125212)"
    :dates-note "Closed Tue 1 Feb and Wed 2 Feb 2022 (FT Day and CNY coincide on 1 Feb); resume Thu 3 Feb 2022 - no extra replacement day."
    :closed (((2022 2 2) "Chinese New Year"))
    :open ()
    :early-closes (((2022 1 31) (12 30) "Chinese New Year eve: morning session only"))
    :late-opens ())
   (:title "Closure of Bursa Malaysia in conjunction with the Wesak Day replacement holiday"
    :uri "https://web.archive.org/web/20220513071850/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-the-wesak-day-replacement-holiday"
    :issued (2022 5 11) :issued-uri "https://web.archive.org/web/20220513071850/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-the-wesak-day-replacement-holiday"
    :published (2022 5 11) :published-uri "https://web.archive.org/web/20220513071850/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-the-wesak-day-replacement-holiday"
    :published-in "Bursa Malaysia media release (web.archive.org snapshot 20220513071850)"
    :dates-note nil
    :closed (((2022 5 16) "Wesak Day (replacement)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Closure of Bursa Malaysia in conjunction with the special holiday"
    :uri "https://web.archive.org/web/20221115141728/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-the-special-holiday"
    :issued (2022 11 15) :issued-uri "https://web.archive.org/web/20221115141728/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-the-special-holiday"
    :published (2022 11 15) :published-uri "https://web.archive.org/web/20221115141728/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-the-special-holiday"
    :published-in "Bursa Malaysia media release (web.archive.org snapshot 20221115141728)"
    :dates-note nil
    :closed (((2022 11 18) "Special holiday (GE15)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Closure of Bursa Malaysia in conjunction with the special public holiday"
    :uri "https://web.archive.org/web/20221125041505/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-the-special-public-holiday"
    :issued (2022 11 25) :issued-uri "https://web.archive.org/web/20221125041505/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-the-special-public-holiday"
    :published (2022 11 25) :published-uri "https://web.archive.org/web/20221125041505/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-the-special-public-holiday"
    :published-in "Bursa Malaysia media release (web.archive.org snapshot 20221125041505)"
    :dates-note nil
    :closed (((2022 11 28) "Special public holiday"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Closure of Bursa Malaysia in conjunction with Chinese New Year 2023"
    :uri "https://web.archive.org/web/20230118071117/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-chinese-new-year-2023"
    :issued (2023 1 18) :issued-uri "https://web.archive.org/web/20230118071117/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-chinese-new-year-2023"
    :published (2023 1 18) :published-uri "https://web.archive.org/web/20230118071117/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-chinese-new-year-2023"
    :published-in "Bursa Malaysia media release (web.archive.org snapshot 20230118071117)"
    :dates-note "Fri 20 Jan 2023 normal trading."
    :closed (((2023 1 23) "Chinese New Year") ((2023 1 24) "Chinese New Year (replacement)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Closure of Bursa Malaysia in conjunction with Federal Territory Day and Thaipusam"
    :uri "https://web.archive.org/web/20230130072507/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-federal-territory-day-and-thaipusam"
    :issued (2023 1 30) :issued-uri "https://web.archive.org/web/20230130072507/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-federal-territory-day-and-thaipusam"
    :published (2023 1 30) :published-uri "https://web.archive.org/web/20230130072507/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-federal-territory-day-and-thaipusam"
    :published-in "Bursa Malaysia media release (web.archive.org snapshot 20230130072507)"
    :dates-note nil
    :closed (((2023 2 6) "Thaipusam (replacement)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Closure of Bursa Malaysia in conjunction with Hari Raya Aidilfitri 2023"
    :uri "https://web.archive.org/web/20230513074139/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-hari-raya-aidilfitri-2023"
    :issued (2023 4 18) :issued-uri "https://web.archive.org/web/20230513074139/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-hari-raya-aidilfitri-2023"
    :published (2023 4 18) :published-uri "https://web.archive.org/web/20230513074139/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-hari-raya-aidilfitri-2023"
    :published-in "Bursa Malaysia media release (web.archive.org snapshot 20230513074139)"
    :dates-note "Thu 20 Apr 2023 full day trading as normal."
    :closed (((2023 4 21) "Additional Hari Raya Aidilfitri holiday") ((2023 4 24) "Hari Raya Puasa (replacement)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Full day trading on the eve of Chinese New Year; closure of Bursa Malaysia in conjunction with Chinese New Year 2024"
    :uri "https://mondovisione.com/news/full-day-trading-on-the-eve-of-chinese-new-year-closure-of-bursa-malaysia-in-co-2024126"
    :issued (2024 1 26) :issued-uri "https://mondovisione.com/news/full-day-trading-on-the-eve-of-chinese-new-year-closure-of-bursa-malaysia-in-co-2024126"
    :published (2024 1 26) :published-uri "https://mondovisione.com/news/full-day-trading-on-the-eve-of-chinese-new-year-closure-of-bursa-malaysia-in-co-2024126"
    :published-in "Bursa Malaysia announcement as reprinted by Mondo Visione (original not archived)"
    :dates-note "Bursa reinstates full-day trading on CNY eve Fri 9 Feb 2024 (normal trading hours; no derivatives T+1 night session); closed Mon 12 Feb 2024."
    :closed (((2024 2 12) "Chinese New Year (replacement)"))
    :open ()
    :early-closes ()
    :late-opens ()
    :confidence :secondary)
   (:title "Closure of Bursa Malaysia in conjunction with Nuzul Al-Quran"
    :uri "https://web.archive.org/web/20240627133942/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-nuzul-al-quran-5"
    :issued (2024 3 26) :issued-uri "https://web.archive.org/web/20240627133942/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-nuzul-al-quran-5"
    :published (2024 3 26) :published-uri "https://web.archive.org/web/20240627133942/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-nuzul-al-quran-5"
    :published-in "Bursa Malaysia media release (web.archive.org snapshot 20240627133942)"
    :dates-note "Closed Thu 28 Mar 2024; Wed 27 Mar 2024 is a trading day."
    :closed (((2024 3 28) "Nuzul Al-Quran"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Closure of Bursa Malaysia in conjunction with Hari Raya Aidilfitri 2024"
    :uri "https://web.archive.org/web/20240510103445/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-hari-raya-aidilfitri-2024"
    :issued (2024 4 8) :issued-uri "https://web.archive.org/web/20240510103445/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-hari-raya-aidilfitri-2024"
    :published (2024 4 8) :published-uri "https://web.archive.org/web/20240510103445/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-hari-raya-aidilfitri-2024"
    :published-in "Bursa Malaysia media release (web.archive.org snapshot 20240510103445)"
    :dates-note "Scenario notice: normal trading hours on Tue 9 Apr 2024 (eve); closed 10-11 Apr 2024 (Hari Raya fell on 10 Apr, per the calendar page)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Closure of Bursa Malaysia in conjunction with upcoming public holidays in September 2025"
    :uri "https://mondovisione.com/media-and-resources/news/closure-of-bursa-malaysia-in-conjunction-with-upcoming-public-holidays-in-septem-2025825/"
    :issued (2025 8 25) :issued-uri "https://mondovisione.com/media-and-resources/news/closure-of-bursa-malaysia-in-conjunction-with-upcoming-public-holidays-in-septem-2025825/"
    :published (2025 8 25) :published-uri "https://mondovisione.com/media-and-resources/news/closure-of-bursa-malaysia-in-conjunction-with-upcoming-public-holidays-in-septem-2025825/"
    :published-in "Bursa Malaysia announcement as reprinted by Mondo Visione (original not archived)"
    :dates-note "Closed 1, 5, 15 and 16 Sep 2025; resume 17 Sep 2025."
    :closed (((2025 9 1) "National Day (replacement)") ((2025 9 5) "Birthday of Prophet Muhammad") ((2025 9 15) "Additional public holiday (Malaysia Day)"))
    :open ()
    :early-closes ()
    :late-opens ()
    :confidence :secondary)
   (:title "Closure of Bursa Malaysia in conjunction with the Federal Territory and Thaipusam public holidays"
    :uri "https://mondovisione.com/news/closure-of-bursa-malaysia-in-conjunction-with-the-federal-territory-and-thaipusa-2026120"
    :issued (2026 1 20) :issued-uri "https://mondovisione.com/news/closure-of-bursa-malaysia-in-conjunction-with-the-federal-territory-and-thaipusa-2026120"
    :published (2026 1 20) :published-uri "https://mondovisione.com/news/closure-of-bursa-malaysia-in-conjunction-with-the-federal-territory-and-thaipusa-2026120"
    :published-in "Bursa Malaysia announcement as reprinted by Mondo Visione (original not archived)"
    :dates-note "Closed Mon 2 Feb 2026 only; resume Tue 3 Feb 2026."
    :closed (((2026 2 2) "Thaipusam / Federal Territory Day (replacement)"))
    :open ()
    :early-closes ()
    :late-opens ()
    :confidence :secondary)
   (:title "Closure of Bursa Malaysia in conjunction with Hari Raya Aidilfitri public holiday"
    :uri "https://mondovisione.com/media-and-resources/news/closure-of-bursa-malaysia-in-conjunction-with-hari-raya-aidilfitri-public-holida-2026318"
    :issued (2026 3 18) :issued-uri "https://mondovisione.com/media-and-resources/news/closure-of-bursa-malaysia-in-conjunction-with-hari-raya-aidilfitri-public-holida-2026318"
    :published (2026 3 18) :published-uri "https://mondovisione.com/media-and-resources/news/closure-of-bursa-malaysia-in-conjunction-with-hari-raya-aidilfitri-public-holida-2026318"
    :published-in "Bursa Malaysia announcement as reprinted by Mondo Visione (original not archived)"
    :dates-note "Closed Fri 20 and Mon 23 Mar 2026; Thu 19 Mar normal trading hours; resume Tue 24 Mar 2026."
    :closed (((2026 3 20) "Additional Hari Raya Aidilfitri holiday") ((2026 3 23) "Hari Raya Puasa (replacement)"))
    :open ()
    :early-closes ()
    :late-opens ()
    :confidence :secondary)
   (:title "Closure of Bursa Malaysia in conjunction with Aidiladha, the birthday of His Majesty and Wesak Day"
    :uri "https://mondovisione.com/news/closure-of-bursa-malaysia-in-conjunction-with-the-aidiladha-birthday-of-his-maj-2026520/"
    :issued (2026 5 20) :issued-uri "https://mondovisione.com/news/closure-of-bursa-malaysia-in-conjunction-with-the-aidiladha-birthday-of-his-maj-2026520/"
    :published (2026 5 20) :published-uri "https://mondovisione.com/news/closure-of-bursa-malaysia-in-conjunction-with-the-aidiladha-birthday-of-his-maj-2026520/"
    :published-in "Bursa Malaysia announcement as reprinted by Mondo Visione (original not archived)"
    :dates-note "Closed 27 May, 1 Jun and 2 Jun 2026; resume 3 Jun 2026."
    :closed (((2026 6 2) "Wesak Day (replacement)"))
    :open ()
    :early-closes ()
    :late-opens ()
    :confidence :secondary)))
