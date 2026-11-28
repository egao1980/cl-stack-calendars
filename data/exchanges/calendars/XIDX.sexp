;;;; XIDX exchange trading-day calendar (#49, SEA family).
;;;; IDX/JSX "Kalender Libur Bursa" = the SKB 3 Menteri hari libur nasional (registered civil calendar "ID")
;;;; + the cuti bersama days IDX adopts (listed per year below, they are not in "ID")
;;;; + exchange-only "Libur Bursa" days (31 Dec when a weekday from 2010; 8 and 14 Sep 2010; 26 Dec 2005).
;;;; Exchange lists found: 2005, 2006, 2007, 2010-2022, 2026, 2027 (primary); 2025 (secondary).
;;;; First year with an exchange list: 2005. Gaps: 2000-2004, 2008-2009, 2023-2024 (see :gaps).
(:name "XIDX"
 :title "Indonesia Stock Exchange (IDX / BEI; JSX / BEJ before 2007-12) trading days"
 :authority "PT Bursa Efek Indonesia (and PT Bursa Efek Jakarta), yearly Pengumuman 'Kalender Libur Bursa' (IDX Trading Holiday sheets)" :authority-uri "https://web.archive.org/web/20121219163825/http://www.idx.co.id:80/en-us/home/newsannouncement/tradingholiday.aspx"
 :bases ((:calendar "ID" :from nil :to nil
          :authority "Every IDX list cites the SKB 3 Menteri 'Hari Libur Nasional dan Cuti Bersama' of its year as its basis (e.g. 2010 Peng-00361/BEI.PSH/11-2009: 'Mengacu pada Surat Keputusan Bersama ... tentang HARI-HARI LIBUR NASIONAL DAN CUTI BERSAMA TAHUN 2010'); every hari libur nasional on a weekday in data/id 2005-2027 is on the IDX list of that year, except 27 Jun 2018 (open, see 2018 notice). https://web.archive.org/web/20110124234648/http://www.idx.co.id:80/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2010.pdf")
         (:calendar "ID-CUTI" :from (2008 1 1) :to (2009 12 31)
          :authority "No IDX list for 2008-2009: every IDX list closes on the cuti bersama days of its year's SKB 3 Menteri (see the 2010 list's citation), so the SKB's cuti bersama (data/id/skb.sexp) stand in. Late SKB amendments were not always followed (2011, 2018).")
         (:calendar "ID-CUTI" :from (2023 1 1) :to (2024 12 31)
          :authority "No IDX list for 2023-2024: the SKB cuti bersama stand in, as for 2008-2009."))
 :rules ((:fixed "Libur Bursa (akhir tahun)" 12 31 :from 2010
          :authority "IDX lists 2010, 2012, 2013, 2014, 2015, 2018, 2019, 2021, 2026, 2027 close 31 Dec as 'Libur Bursa' / 'Trading Holiday' whenever it is a weekday (2020: substitute cuti bersama); no replacement day when 31 Dec falls on a weekend (2011, 2016, 2017, 2022 lists). Not on the 2005-2007 lists. e.g. https://web.archive.org/web/20261107155341/https://www.idx.co.id/StaticData/NewsAndAnnouncement/ANNOUNCEMENTSTOCK/Exchange/Peng-00171%20Libur%20Bursa%202026-No.%20Peng-00171BEI.POP09-2025.pdf"))
 :gaps ((:years "2000-2004" :note "No JSX holiday list retrieved. JSX 'Kalender Perdagangan' page (www.jsx.co.id/trading.asp?cmd=menu3, Wayback 2002-10-28 .. 2007-06-30) shows images libur_bursa_2003.gif, calender_dag-ind1.gif (2002), libur_bursa1/2.gif, kalender2004a.gif; the image captures failed to load from web.archive.org in this session (CDX lists kalender2004a.gif 2004-07-13). ec 2000-2001 has almost no holidays and differs from data/id in nearly every movable feast; unverified.")
        (:years "2008-2009" :note "IDX 2008/2009 lists not found (TradingHoliday/ folder starts with 2010.pdf; no Wayback copy of the 2008-2009 site holiday page retrieved). ec closes 2008-02-08, 2008-10-09, 2008-10-10 (IDX trading suspension after 8 Oct 2008 halt, secondary), 2008-12-31, 2009-12-31; data/id cuti bersama 2008-01-11, 09-29, 09-30, 10-03, 12-26 and 2009-01-02, 09-18, 09-23, 12-24 are likely IDX closures but unverified.")
        (:years "2023-2024" :note "IDX 2023 and 2024 calendars (2024: original Sept 2023 notice; Peng-00030/BEI.POP/02-2024 adding 14 Feb 2024 election day; Nov 2024 notice adding 27 Nov Pilkada and 31 Dec 2024) are only known from news (bisnis.com 403 to fetch). ec equals data/id hari libur + cuti bersama + 31 Dec 2024 for both years. Recommended (unverified) notice closures = data/id cuti bersama: 2023-01-23, 03-23, 04-19, 04-20, 04-21, 04-24, 04-25, 06-02, 06-28, 06-30, 12-26; 2024-02-09, 03-12, 04-08, 04-09, 04-12, 04-15, 05-10, 05-24, 06-18, 12-26."))
 :notices (
   (:title "BEJ Kalender Libur Bursa Tahun 2005 (Lampiran Peng-58/BEJ-DAG/U/04-2005)" :year 2005
    :uri "https://web.archive.org/web/20061012054454/http://www.jsx.co.id/misc/revisi%20libur%202006.gif"
    :issued (2005 4 27) :issued-uri "https://web.archive.org/web/20061012054454/http://www.jsx.co.id/misc/revisi%20libur%202006.gif"
    :published nil :published-uri "https://web.archive.org/web/20061012054454/http://www.jsx.co.id/misc/revisi%20libur%202006.gif"
    :published-in "JSX website, trading.asp?cmd=menu3 (Kalender Perdagangan), image"
    :dates-note "Issue date from the attachment header (Tanggal 27 April 2005). Copy is the image 'revisi libur 2006.gif' that carries the 2006 and 2005 calendars; Wayback capture 2006-10-12. The 2005 table prints '26-12-2004 Senin Libur Bursa' in December: a typo for Monday 26-12-2005 (26-12-2004 was a Sunday and the row sits in the 2005 December line)."
    :closed (((2005 11 2) "Cuti Bersama") ((2005 11 7) "Cuti Bersama (7 dan 8 November fakultatif)") ((2005 11 8) "Cuti Bersama (7 dan 8 November fakultatif)") ((2005 12 26) "Libur Bursa"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "BEJ Kalender Libur Bursa Tahun 2006 (Lampiran Peng-398/BEJ-DAG/U/10-2005, with PENG-030/BEJ-DAG/U/03-2006 and PENG-042/BEJ-DAG/U/04-2006)" :year 2006
    :uri "https://web.archive.org/web/20061019130208/http://www.jsx.co.id/misc/libur%20bursa2007-2006.png"
    :issued (2005 10 4) :issued-uri "https://web.archive.org/web/20061019130208/http://www.jsx.co.id/misc/libur%20bursa2007-2006.png"
    :published nil :published-uri "https://web.archive.org/web/20061019130208/http://www.jsx.co.id/misc/libur%20bursa2007-2006.png"
    :published-in "JSX website, Kalender Perdagangan image"
    :dates-note "Issued 4 Oct 2005; cuti bersama 31 Mar, 26 May and 18 Aug 2006 added by Pengumuman PENG-030/BEJ-DAG/U/03-2006 and PENG-042/BEJ-DAG/U/04-2006 (SKB 3 Menteri 22 Mar 2006), as the sheet's notes say. Same table also in 'revisi libur 2006.gif'."
    :closed (((2006 3 31) "Cuti bersama") ((2006 5 26) "Cuti bersama") ((2006 8 18) "Cuti bersama") ((2006 10 23) "Cuti bersama") ((2006 10 26) "Cuti bersama") ((2006 10 27) "Cuti bersama"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "BEJ Kalender Libur Bursa Tahun 2007 (Lampiran Peng-397/BEJ-DAG/10-2006)" :year 2007
    :uri "https://web.archive.org/web/20061019130208/http://www.jsx.co.id/misc/libur%20bursa2007-2006.png"
    :issued (2006 10 17) :issued-uri "https://web.archive.org/web/20061019130208/http://www.jsx.co.id/misc/libur%20bursa2007-2006.png"
    :published nil :published-uri "https://web.archive.org/web/20061019130208/http://www.jsx.co.id/misc/libur%20bursa2007-2006.png"
    :published-in "JSX website, Kalender Perdagangan image"
    :dates-note "Issued 17 Oct 2006 per the SKB of 24 Jul 2006. Later 2007 revisions (the civil SKB moved the Idul Fitri cuti to 17-19 Oct and added 26 Dec in data/id) were not found from the exchange; this list closes 12, 15, 16 Oct and 21, 24 Dec. No 31 Dec 2007 closure on the list."
    :closed (((2007 5 18) "Cuti Bersama menyambung hari libur Kenaikan Yesus Kristus") ((2007 10 12) "Cuti Bersama sebelum dan sesudah Hari Raya Idul Fitri 1 Syawal 1428 Hijriyah") ((2007 10 15) "Cuti Bersama sebelum dan sesudah Hari Raya Idul Fitri 1 Syawal 1428 Hijriyah") ((2007 10 16) "Cuti Bersama sebelum dan sesudah Hari Raya Idul Fitri 1 Syawal 1428 Hijriyah") ((2007 12 21) "Cuti Bersama menyambung hari libur Hari Raya Idul Adha") ((2007 12 24) "Cuti Bersama sebelum Natal"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "IDX Pengumuman Kalender Libur Bursa Tahun 2010, Peng-00361/BEI.PSH/11-2009" :year 2010
    :uri "https://web.archive.org/web/20110124234648/http://www.idx.co.id:80/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2010.pdf"
    :issued (2009 11 4) :issued-uri "https://web.archive.org/web/20110124234648/http://www.idx.co.id:80/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2010.pdf"
    :published nil :published-uri "https://web.archive.org/web/20110124234648/http://www.idx.co.id:80/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2010.pdf"
    :published-in "IDX website, News & Announcement > Trading Holiday"
    :dates-note "Scanned PDF, OCR read; 8 and 14 Sep and 31 Dec 2010 are 'Libur Bursa' (exchange-only)."
    :closed (((2010 9 8) "Libur Bursa") ((2010 9 9) "Cuti Bersama Idul Fitri") ((2010 9 13) "Cuti Bersama Idul Fitri") ((2010 9 14) "Libur Bursa") ((2010 12 24) "Cuti Bersama Hari Raya Natal"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "IDX Pengumuman Kalender Libur Bursa Tahun 2011, Peng-00536/BEI.PSH/11-2010" :year 2011
    :uri "https://web.archive.org/web/20110105105249/http://www.idx.co.id:80/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2011.pdf"
    :issued (2010 11 2) :issued-uri "https://web.archive.org/web/20110105105249/http://www.idx.co.id:80/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2011.pdf"
    :published nil :published-uri "https://web.archive.org/web/20110105105249/http://www.idx.co.id:80/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2011.pdf"
    :published-in "IDX website, Trading Holiday"
    :dates-note "Scanned PDF, OCR read. Later 2011 SKB changes (cuti 16 May and 3 Jun in data/id) not on this list; no IDX amendment found."
    :closed (((2011 8 29) "Cuti Bersama Idul Fitri 1 Syawal 1432 Hijriyah") ((2011 9 1) "Cuti Bersama Idul Fitri 1 Syawal 1432 Hijriyah") ((2011 9 2) "Cuti Bersama Idul Fitri 1 Syawal 1432 Hijriyah") ((2011 12 26) "Cuti Bersama Hari Raya Natal"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "IDX Pengumuman Kalender Libur Bursa Tahun 2012, Peng-00492/BEI.PSH/08-2011" :year 2012
    :uri "https://web.archive.org/web/20120813101327/http://www.idx.co.id:80/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2012Eng.pdf"
    :issued (2011 8 26) :issued-uri "https://web.archive.org/web/20120813101327/http://www.idx.co.id:80/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2012Eng.pdf"
    :published nil :published-uri "https://web.archive.org/web/20120813101327/http://www.idx.co.id:80/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2012Eng.pdf"
    :published-in "IDX website, Trading Holiday"
    :dates-note "Scanned PDF (file name 2012Eng.pdf, Indonesian text), OCR read. 31 Dec 2012 'Libur Bursa'."
    :closed (((2012 5 18) "Cuti Bersama Kenaikan Yesus Kristus") ((2012 8 21) "Cuti Bersama Idul Fitri 1 Syawal 1433 Hijriyah") ((2012 8 22) "Cuti Bersama Idul Fitri 1 Syawal 1433 Hijriyah") ((2012 11 16) "Cuti Bersama Tahun Baru Hijriyah 1434") ((2012 12 24) "Cuti Bersama Hari Raya Natal"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "IDX Kalender Libur Bursa Tahun 2013 / Trading Holiday 2013" :year 2013
    :uri "https://web.archive.org/web/20121224031531/http://www.idx.co.id:80/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2013.pdf"
    :issued nil :issued-uri "https://web.archive.org/web/20121224031531/http://www.idx.co.id:80/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2013.pdf"
    :published nil :published-uri "https://web.archive.org/web/20121224031531/http://www.idx.co.id:80/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2013.pdf"
    :published-in "IDX website, Trading Holiday"
    :dates-note "Sheet carries no announcement number or date; Wayback first capture 2012-12-24 (upper bound). English copy 2013Eng.pdf captured 2012-12-25."
    :closed (((2013 8 5) "Cuti Bersama Hari Raya Idul Fitri 1434 H") ((2013 8 6) "Cuti Bersama Hari Raya Idul Fitri 1434 H") ((2013 8 7) "Cuti Bersama Hari Raya Idul Fitri 1434 H") ((2013 10 14) "Cuti Bersama Hari Raya Idul Adha 1434 H") ((2013 12 26) "Cuti Bersama Hari Raya Natal"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "IDX Trading Holiday 2014" :year 2014
    :uri "https://web.archive.org/web/20140402131913/http://www.idx.co.id/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2014Eng.pdf"
    :issued nil :issued-uri "https://web.archive.org/web/20140402131913/http://www.idx.co.id/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2014Eng.pdf"
    :published nil :published-uri "https://web.archive.org/web/20140402131913/http://www.idx.co.id/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2014Eng.pdf"
    :published-in "IDX website, Trading Holiday"
    :dates-note "No issue date on the sheet; Indonesian 2014.pdf captured 2013-12-28 (upper bound); announcement Peng-00558 of 2013-09-24 per the file name 20130924_Peng-00558_Libur-Bursa-2014.pdf in the IDX news folder (not retrieved). The list predates Keppres for the 9 Jul 2014 presidential election, which the ID base closes (ec also closed)."
    :closed (((2014 7 30) "Cuti Bersama Hari Raya Idul Fitri 1435 Hijriah") ((2014 7 31) "Cuti Bersama Hari Raya Idul Fitri 1435 Hijriah") ((2014 8 1) "Cuti Bersama Hari Raya Idul Fitri 1435 Hijriah") ((2014 12 26) "Cuti Bersama Hari Raya Natal"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "IDX Trading Holiday 2015" :year 2015
    :uri "https://web.archive.org/web/20211027044111/https://www.idx.co.id/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2015Eng.pdf"
    :issued nil :issued-uri "https://web.archive.org/web/20211027044111/https://www.idx.co.id/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2015Eng.pdf"
    :published nil :published-uri "https://web.archive.org/web/20211027044111/https://www.idx.co.id/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2015Eng.pdf"
    :published-in "IDX website, Trading Holiday"
    :dates-note "No issue date on the sheet; includes 9 Dec 2015 regional-election day (Keppres 25/2015). Indonesian 2015.pdf captured 2015-10-10."
    :closed (((2015 7 16) "Cuti Bersama Hari Raya Idul Fitri 1436 Hijriyah") ((2015 7 20) "Cuti Bersama Hari Raya Idul Fitri 1436 Hijriyah") ((2015 7 21) "Cuti Bersama Hari Raya Idul Fitri 1436 Hijriyah"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "IDX Kalender Libur Bursa Tahun 2016" :year 2016
    :uri "https://web.archive.org/web/20190917224753/https://www.idx.co.id/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2016.pdf"
    :issued nil :issued-uri "https://web.archive.org/web/20190917224753/https://www.idx.co.id/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2016.pdf"
    :published nil :published-uri "https://web.archive.org/web/20190917224753/https://www.idx.co.id/Portals/0/StaticData/NewsAndAnnouncement/TradingHoliday/2016.pdf"
    :published-in "IDX website, Trading Holiday"
    :dates-note "No issue date on the sheet. No 30 Dec 2016 closure (31 Dec is a Saturday)."
    :closed (((2016 7 4) "Cuti Bersama Hari Raya Idul Fitri 1437 Hijriyah") ((2016 7 5) "Cuti Bersama Hari Raya Idul Fitri 1437 Hijriyah") ((2016 7 8) "Cuti Bersama Hari Raya Idul Fitri 1437 Hijriyah") ((2016 12 26) "Cuti Bersama Hari Raya Natal"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "IDX Trading Holiday 2017" :year 2017
    :uri "https://web.archive.org/web/20191119051710/https://www.idx.co.id/media/3055/2017eng.jpg"
    :issued nil :issued-uri "https://web.archive.org/web/20191119051710/https://www.idx.co.id/media/3055/2017eng.jpg"
    :published nil :published-uri "https://web.archive.org/web/20191119051710/https://www.idx.co.id/media/3055/2017eng.jpg"
    :published-in "IDX website, News > Trading Holiday (image)"
    :dates-note "Image, OCR read; note cites Keppres 10/2017 (19 Apr 2017 Jakarta gubernatorial run-off, holiday in DKI Jakarta) and Keppres 18/2017. No year-end closure (31 Dec is a Sunday; 29 Dec open)."
    :closed (((2017 1 2) "Cuti Bersama Tahun Baru 2017 Masehi") ((2017 4 19) "Pemungutan suara Pilkada DKI Jakarta putaran 2 (Keppres 10/2017)") ((2017 6 23) "Cuti Bersama Hari Raya Idul Fitri 1438 Hijriyah (Keppres 18/2017, PNS)") ((2017 6 27) "Cuti Bersama Hari Raya Idul Fitri 1438 Hijriyah") ((2017 6 28) "Cuti Bersama Hari Raya Idul Fitri 1438 Hijriyah") ((2017 6 29) "Cuti Bersama Hari Raya Idul Fitri 1438 Hijriyah") ((2017 6 30) "Cuti Bersama Hari Raya Idul Fitri 1438 Hijriyah") ((2017 12 26) "Cuti Bersama Hari Raya Natal"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "IDX Trading Holiday 2018" :year 2018
    :uri "https://web.archive.org/web/20191119051710/https://www.idx.co.id/media/3056/2018eng.jpg"
    :issued nil :issued-uri "https://web.archive.org/web/20191119051710/https://www.idx.co.id/media/3056/2018eng.jpg"
    :published nil :published-uri "https://web.archive.org/web/20191119051710/https://www.idx.co.id/media/3056/2018eng.jpg"
    :published-in "IDX website, News > Trading Holiday (image)"
    :dates-note "Image, OCR read; cites SKB 223/2018 (amendment). June: 13 trading days, i.e. 27 Jun 2018 (Pilkada, Keppres 15/2018 national holiday) is a trading day and 20 Jun (cuti in the civil SKB) is not on the list. News reports IDX announcement Peng-00504/BEI-OPP/06-2018 (25 Jun 2018) keeping 27 Jun open (secondary, not retrieved)."
    :closed (((2018 6 11) "Cuti Bersama Hari Raya Idul Fitri 1439 Hijriyah") ((2018 6 12) "Cuti Bersama Hari Raya Idul Fitri 1439 Hijriyah") ((2018 6 13) "Cuti Bersama Hari Raya Idul Fitri 1439 Hijriyah") ((2018 6 14) "Cuti Bersama Hari Raya Idul Fitri 1439 Hijriyah") ((2018 6 18) "Cuti Bersama Hari Raya Idul Fitri 1439 Hijriyah") ((2018 6 19) "Cuti Bersama Hari Raya Idul Fitri 1439 Hijriyah") ((2018 12 24) "Cuti Bersama Hari Raya Natal"))
    :open (((2018 6 27) "IDX list: trading day despite Hari Pemungutan Suara Pilkada 2018 (Keppres 15/2018)"))
    :early-closes ()
    :late-opens ())
   (:title "IDX Trading Holiday 2019 (rev)" :year 2019
    :uri "https://web.archive.org/web/20221003144151/https://www.idx.co.id/media/7182/2019_eng_rev.jpg"
    :issued nil :issued-uri "https://web.archive.org/web/20221003144151/https://www.idx.co.id/media/7182/2019_eng_rev.jpg"
    :published nil :published-uri "https://web.archive.org/web/20221003144151/https://www.idx.co.id/media/7182/2019_eng_rev.jpg"
    :published-in "IDX website, News > Trading Holiday (image)"
    :dates-note "Image, OCR read; 7 Mar (Nyepi) and 6 Jun row dates lost in OCR, restored from weekday + label + SKB 617/2018."
    :closed (((2019 6 3) "Cuti Bersama Hari Raya Idul Fitri 1440 Hijriyah") ((2019 6 4) "Cuti Bersama Hari Raya Idul Fitri 1440 Hijriyah") ((2019 6 7) "Cuti Bersama Hari Raya Idul Fitri 1440 Hijriyah") ((2019 12 24) "Cuti Bersama Hari Raya Natal"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "IDX Trading Holiday 2020 (v3)" :year 2020
    :uri "https://web.archive.org/web/20221003144151/https://www.idx.co.id/media/9398/2020_eng-v3.jpg"
    :issued nil :issued-uri "https://web.archive.org/web/20221003144151/https://www.idx.co.id/media/9398/2020_eng-v3.jpg"
    :published nil :published-uri "https://web.archive.org/web/20221003144151/https://www.idx.co.id/media/9398/2020_eng-v3.jpg"
    :published-in "IDX website, News > Trading Holiday (image)"
    :dates-note "Image, OCR read; cites SKB of 1 Dec 2020 (fourth amendment). 7 May (Vesak) row date lost in OCR, restored from weekday. 22 May 2020 is 'Commemoration of Eid al-Fitr' on the list though not in data/id cuti; 31 Dec 2020 is the substitute cuti."
    :closed (((2020 5 22) "Cuti bersama Idul Fitri 1441 H (IDX list)") ((2020 8 21) "Cuti Bersama Tahun Baru Islam 1442 Hijriyah") ((2020 10 28) "Cuti Bersama Maulid Nabi Muhammad SAW") ((2020 10 30) "Cuti Bersama Maulid Nabi Muhammad SAW") ((2020 12 24) "Cuti Bersama Hari Raya Natal"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "IDX Trading Holiday 2021 (ver03)" :year 2021
    :uri "https://web.archive.org/web/20221003144151/https://www.idx.co.id/media/9939/2021_eng-ver03.jpg"
    :issued nil :issued-uri "https://web.archive.org/web/20221003144151/https://www.idx.co.id/media/9939/2021_eng-ver03.jpg"
    :published nil :published-uri "https://web.archive.org/web/20221003144151/https://www.idx.co.id/media/9939/2021_eng-ver03.jpg"
    :published-in "IDX website, News > Trading Holiday (image)"
    :dates-note "Image, OCR read; cites SKB 712/2021 of 18 Jun 2021 (second amendment). 31 Dec 2021 'Trading Holiday'."
    :closed (((2021 5 12) "Cuti Bersama Hari Raya Idul Fitri 1442 Hijriah"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "IDX Trading Holiday 2022 (v2)" :year 2022
    :uri "https://web.archive.org/web/20221003144151/https://www.idx.co.id/media/10970/2022_eng-v2.jpg"
    :issued nil :issued-uri "https://web.archive.org/web/20221003144151/https://www.idx.co.id/media/10970/2022_eng-v2.jpg"
    :published nil :published-uri "https://web.archive.org/web/20221003144151/https://www.idx.co.id/media/10970/2022_eng-v2.jpg"
    :published-in "IDX website, News > Trading Holiday (image)"
    :dates-note "Image, OCR read; cites SKB 375/2022 of 7 Apr 2022. No December closures (31 Dec is a Saturday)."
    :closed (((2022 4 29) "Cuti Bersama Hari Raya Idul Fitri 1443 Hijriah") ((2022 5 4) "Cuti Bersama Hari Raya Idul Fitri 1443 Hijriah") ((2022 5 5) "Cuti Bersama Hari Raya Idul Fitri 1443 Hijriah") ((2022 5 6) "Cuti Bersama Hari Raya Idul Fitri 1443 Hijriah"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "IDX Pengumuman Kalender Libur Bursa Tahun 2026, Peng-00171/BEI.POP/09-2025" :year 2026
    :uri "https://web.archive.org/web/20261107155341/https://www.idx.co.id/StaticData/NewsAndAnnouncement/ANNOUNCEMENTSTOCK/Exchange/Peng-00171%20Libur%20Bursa%202026-No.%20Peng-00171BEI.POP09-2025.pdf"
    :issued (2025 9 23) :issued-uri "https://web.archive.org/web/20261107155341/https://www.idx.co.id/StaticData/NewsAndAnnouncement/ANNOUNCEMENTSTOCK/Exchange/Peng-00171%20Libur%20Bursa%202026-No.%20Peng-00171BEI.POP09-2025.pdf"
    :published nil :published-uri "https://web.archive.org/web/20261107155341/https://www.idx.co.id/StaticData/NewsAndAnnouncement/ANNOUNCEMENTSTOCK/Exchange/Peng-00171%20Libur%20Bursa%202026-No.%20Peng-00171BEI.POP09-2025.pdf"
    :published-in "IDX website, Pengumuman Bursa"
    :dates-note "Text PDF. 31 Dec 2026 'Libur Bursa'."
    :closed (((2026 2 16) "Cuti Bersama Tahun Baru Imlek 2577 Kongzili") ((2026 3 18) "Cuti Bersama Hari Suci Nyepi (Tahun Baru Saka 1948)") ((2026 3 20) "Cuti Bersama Hari Raya Idul Fitri 1447 H") ((2026 3 23) "Cuti Bersama Hari Raya Idul Fitri 1447 H") ((2026 3 24) "Cuti Bersama Hari Raya Idul Fitri 1447 H") ((2026 5 15) "Cuti Bersama Kenaikan Yesus Kristus") ((2026 5 28) "Cuti Bersama Idul Adha 1447 H") ((2026 12 24) "Cuti Bersama Kelahiran Yesus Kristus"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "IDX Pengumuman Kalender Libur Bursa Tahun 2027, Peng-00169/BEI.POP/09-2026" :year 2027
    :uri "https://web.archive.org/web/20261107161932/https://www.idx.co.id/StaticData/NewsAndAnnouncement/ANNOUNCEMENTSTOCK/Exchange/Libur%20Bursa%20Peng-00169%20ID-No.%20Peng-00169BEI.POP09-2026.pdf"
    :issued nil :issued-uri "https://web.archive.org/web/20261107161932/https://www.idx.co.id/StaticData/NewsAndAnnouncement/ANNOUNCEMENTSTOCK/Exchange/Libur%20Bursa%20Peng-00169%20ID-No.%20Peng-00169BEI.POP09-2026.pdf"
    :published nil :published-uri "https://web.archive.org/web/20261107161932/https://www.idx.co.id/StaticData/NewsAndAnnouncement/ANNOUNCEMENTSTOCK/Exchange/Libur%20Bursa%20Peng-00169%20ID-No.%20Peng-00169BEI.POP09-2026.pdf"
    :published-in "IDX website, Pengumuman Bursa"
    :dates-note "Text PDF; issue day not printed in the extracted attachment header (No. Peng-00169/BEI.POP/09-2026, i.e. September 2026). 31 Dec 2027 'Libur Bursa'."
    :closed (((2027 2 5) "Cuti Bersama Tahun Baru Imlek 2578 Kongzili") ((2027 3 9) "Cuti Bersama Hari Raya Idulfitri 1448 Hijriah") ((2027 3 12) "Cuti Bersama Hari Raya Idulfitri 1448 Hijriah") ((2027 3 15) "Cuti Bersama Hari Raya Idulfitri 1448 Hijriah") ((2027 3 25) "Cuti Bersama Wafat Yesus Kristus") ((2027 5 18) "Cuti Bersama Iduladha 1448 H") ((2027 5 19) "Cuti Bersama Waisak 2571 BE") ((2027 12 24) "Cuti Bersama Kelahiran Yesus Kristus (Natal)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "IDX Kalender Libur Bursa 2025 (Peng-00213/BEI.POP/10-2024), as reported by Katadata" :year 2025
    :uri "https://katadata.co.id/amp/finansial/bursa/6710918af17cc/simak-jadwal-libur-bursa-efek-indonesia-bei-untuk-2025/"
    :issued (2024 10 16) :issued-uri "https://katadata.co.id/amp/finansial/bursa/6710918af17cc/simak-jadwal-libur-bursa-efek-indonesia-bei-untuk-2025/"
    :published nil :published-uri "https://katadata.co.id/amp/finansial/bursa/6710918af17cc/simak-jadwal-libur-bursa-efek-indonesia-bei-untuk-2025/"
    :published-in "Katadata (news), 17 Oct 2024, reproducing the IDX table" :confidence :secondary
    :dates-note "Announcement number Peng-00213/BEI.POP/10-2024 dated 16 Oct 2024 is quoted by Republika (fetched) as the 2025 calendar that the August 2025 change revises; the IDX PDF itself was not reachable (idx.co.id behind Cloudflare, no Wayback copy found). The table equals data/id 2025 hari libur + cuti bersama + 31 Dec Libur Bursa."
    :closed (((2025 1 28) "Cuti Bersama Tahun Baru Imlek 2576 Kongzili") ((2025 3 28) "Cuti Bersama Hari Suci Nyepi (Tahun Baru Saka 1947)") ((2025 4 2) "Cuti Bersama Idul Fitri 1446 Hijriah") ((2025 4 3) "Cuti Bersama Idul Fitri 1446 Hijriah") ((2025 4 4) "Cuti Bersama Idul Fitri 1446 Hijriah") ((2025 4 7) "Cuti Bersama Idul Fitri 1446 Hijriah") ((2025 5 13) "Cuti Bersama Hari Raya Waisak 2569 BE") ((2025 5 30) "Cuti Bersama Kenaikan Yesus Kristus") ((2025 6 9) "Cuti Bersama Idul Adha 1446 Hijriah") ((2025 12 26) "Cuti Bersama Kelahiran Yesus Kristus"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "IDX sets 18 Aug 2025 as Hari Libur Bursa (revision of Peng-00213/BEI.POP/10-2024), as reported by Republika" :year 2025
    :uri "https://ekonomi.republika.co.id/berita/t0obef423/bei-tetapkan-18-agustus-2025-libur-perdagangan-bursa"
    :issued nil :issued-uri "https://ekonomi.republika.co.id/berita/t0obef423/bei-tetapkan-18-agustus-2025-libur-perdagangan-bursa"
    :published (2025 8 8) :published-uri "https://ekonomi.republika.co.id/berita/t0obef423/bei-tetapkan-18-agustus-2025-libur-perdagangan-bursa"
    :published-in "Republika (news), 8 Aug 2025" :confidence :secondary
    :dates-note "Search snippets name the IDX notice Peng-00149/BEI.POP/08-2025 of 8 Aug 2025 (not retrieved, not confirmed in the fetched article). Follows the government's added cuti bersama 18 Aug 2025."
    :closed (((2025 8 18) "Cuti Bersama Proklamasi Kemerdekaan (Libur Bursa)"))
    :open ()
    :early-closes ()
    :late-opens ())))
