;; Draft: Prague Stock Exchange (BCPP/PSE) trading days.
;; PSE "Kalendar burzovnich dni": "Na BCPP se obchoduje ve vsedni dny ... Neburzovnimi dny jsou krome vikendu
;; take:" + Czech public holidays + 31 Dec ("Silvestr (burzovni volno)").
;; Lists found: H2 2003, 2004-2014, 2017-2027. Missing: 2000-2002, H1 2003, 2015, 2016.
(:name "XPRA"
 :title "Prague Stock Exchange trading days"
 :authority "Burza cennych papiru Praha, Kalendar burzovnich dni / Trading Calendar"
 :authority-uri "https://www.pse.cz/en/trading/trading-information/trading-calendar"
 :bases ((:calendar "CZ" :from nil :to nil :authority "PSE lists every Czech public holiday (incl. 24 Dec, Good Friday from 2016)"))
 :rules ((:fixed "New Year's Eve (exchange holiday)" 12 31 :from 2001
          :authority "In every PSE list 2003-2027, e.g. https://www.pse.cz/userfiles/related_documents/en/trading-calendar-PSE2021.pdf ('with the exception of December 31 and public holidays'); 2001-2002 from ec only")
         (:easter "Good Friday (exchange holiday before CZ civil 2016)" -2 :from 2013 :to 2015
          :authority "https://web.archive.org/web/20160327124358/http://www.pse.cz/dokument.aspx?k=Kalendar-BD-2013 and ...Kalendar-BD-2014; 2015 from ec only. Good Friday traded in 2007, 2008, 2009, 2010, 2012 per PSE lists."))
 :gaps ((:years "2000-2003" :note "No PSE list for 2000-2002 and the first half of 2003. exchange_calendars closes Wed 2002-08-14 (Vltava floods); no PSE notice found.") (:years "2015-2016" :note "No PSE list found; exchange_calendars closes Good Friday 2015."))
 :notices (
   (:title "PSE trading calendar 2003" :year 2003 :uri "https://web.archive.org/web/20031229210657/http://www.pse.cz:80/obchodovani/kalendar.asp"
    :issued nil :issued-uri nil :published (2003 12 29) :published-uri "https://web.archive.org/web/20031229210657/http://www.pse.cz:80/obchodovani/kalendar.asp"
    :published-in "PSE website, web.archive.org snapshot"
    :dates-note "Issue date not shown; snapshot date = earliest proof of publication. H2 2003 only: 126 exchange days; non-exchange days 28 Oct, 17 Nov, 24-26 Dec and 31 Dec 2003."
    :closed () :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2004" :year 2004 :uri "https://web.archive.org/web/20041211021604/http://www.pse.cz:80/obchodovani/kalendar.asp"
    :issued nil :issued-uri nil :published (2003 12 29) :published-uri "https://web.archive.org/web/20041211021604/http://www.pse.cz:80/obchodovani/kalendar.asp"
    :published-in "PSE website, web.archive.org snapshot"
    :dates-note "Issue date not shown; snapshot date = earliest proof of publication. H1 list (2003-12 snapshot): trading days 1 Jan-30 Jun 2004 'with the exception of 2 January'; H2 list (2004-12 snapshot): non-exchange 5-6 Jul, 28 Sep, 28 Oct, 17 Nov, 24 Dec and 'working day 31 December 2004'."
    :closed (((2004 1 2) "Exchange holiday (PSE H1 2004 calendar)")) :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2005" :year 2005 :uri "https://web.archive.org/web/20051210174317/http://www.pse.cz:80/obchodovani/kalendar.asp"
    :issued nil :issued-uri nil :published (2004 12 11) :published-uri "https://web.archive.org/web/20051210174317/http://www.pse.cz:80/obchodovani/kalendar.asp"
    :published-in "PSE website, web.archive.org snapshot"
    :dates-note "Issue date not shown; snapshot date = earliest proof of publication. H1 2005: 128 exchange days = all working days 1 Jan-30 Jun except 28 Mar, so Mon 3 Jan 2005 was a session (ec closes it). H2 2005: non-exchange 5-6 Jul, 28 Sep, 28 Oct, 17 Nov, 26 Dec."
    :closed () :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2006" :year 2006 :uri "https://web.archive.org/web/20061215192610/http://www.pse.cz/dokument.aspx?k=Kalendar-BD"
    :issued nil :issued-uri nil :published (2005 12 10) :published-uri "https://web.archive.org/web/20061215192610/http://www.pse.cz/dokument.aspx?k=Kalendar-BD"
    :published-in "PSE website, web.archive.org snapshot"
    :dates-note "Issue date not shown; snapshot date = earliest proof of publication. H1 2006 (2005-12 snapshot): non-exchange 17 Apr; H2 2006: 5-6 Jul, 28 Sep, 17 Nov, 25-26 Dec (31 Dec Sunday)."
    :closed () :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2007" :year 2007 :uri "https://web.archive.org/web/20160327135636/http://www.pse.cz/dokument.aspx?k=Kalendar-BD-2007"
    :issued nil :issued-uri nil :published nil :published-uri "https://web.archive.org/web/20160327135636/http://www.pse.cz/dokument.aspx?k=Kalendar-BD-2007"
    :published-in "PSE website, web.archive.org snapshot"
    :dates-note "Issue date not shown; 250 exchange days; non-trading 1 Jan, 9 Apr, 1 and 8 May, 5-6 Jul, 28 Sep, 24-26 and 31 Dec. Good Friday 6 Apr 2007 traded."
    :closed () :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2008" :year 2008 :uri "https://web.archive.org/web/20160327132536/http://www.pse.cz/dokument.aspx?k=Kalendar-BD-2008"
    :issued nil :issued-uri nil :published nil :published-uri "https://web.archive.org/web/20160327132536/http://www.pse.cz/dokument.aspx?k=Kalendar-BD-2008"
    :published-in "PSE website, web.archive.org snapshot"
    :dates-note "Issue date not shown; Closed 1 Jan, 24 Mar, 1 and 8 May, 28 Oct, 17 Nov, 24-26 Dec and 31 Dec. Good Friday 21 Mar 2008 traded."
    :closed () :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2009" :year 2009 :uri "https://web.archive.org/web/20090324054149/http://www.pse.cz/dokument.aspx?k=Kalendar-BD"
    :issued nil :issued-uri nil :published (2009 3 24) :published-uri "https://web.archive.org/web/20090324054149/http://www.pse.cz/dokument.aspx?k=Kalendar-BD"
    :published-in "PSE website, web.archive.org snapshot"
    :dates-note "Issue date not shown; snapshot date = earliest proof of publication. 250 exchange days; non-exchange 1 Jan, 13 Apr, 1 and 8 May, 6 Jul, 28 Sep, 28 Oct, 17 Nov, 24-25 Dec and 31 Dec."
    :closed () :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2010" :year 2010 :uri "https://web.archive.org/web/20101031191724/http://www.pse.cz/dokument.aspx?k=Kalendar-BD"
    :issued nil :issued-uri nil :published (2010 10 31) :published-uri "https://web.archive.org/web/20101031191724/http://www.pse.cz/dokument.aspx?k=Kalendar-BD"
    :published-in "PSE website, web.archive.org snapshot"
    :dates-note "Issue date not shown; snapshot date = earliest proof of publication. 252 exchange days; non-exchange 1 Jan, 5 Apr, 5-6 Jul, 28 Sep, 28 Oct, 17 Nov, 24 Dec and 31 Dec."
    :closed () :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2011" :year 2011 :uri "https://web.archive.org/web/20111118155710/http://www.pse.cz/dokument.aspx?k=Kalendar-BD"
    :issued nil :issued-uri nil :published (2011 11 18) :published-uri "https://web.archive.org/web/20111118155710/http://www.pse.cz/dokument.aspx?k=Kalendar-BD"
    :published-in "PSE website, web.archive.org snapshot"
    :dates-note "Issue date not shown; snapshot date = earliest proof of publication. 253 exchange days; non-exchange 25 Apr, 5-6 Jul, 28 Sep, 28 Oct, 17 Nov, 26 Dec."
    :closed () :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2012" :year 2012 :uri "https://web.archive.org/web/20120606075650/http://www.pse.cz/dokument.aspx?k=Kalendar-BD"
    :issued nil :issued-uri nil :published (2012 6 6) :published-uri "https://web.archive.org/web/20120606075650/http://www.pse.cz/dokument.aspx?k=Kalendar-BD"
    :published-in "PSE website, web.archive.org snapshot"
    :dates-note "Issue date not shown; snapshot date = earliest proof of publication. 251 exchange days; non-exchange 9 Apr, 1 and 8 May, 5-6 Jul, 28 Sep, 24-26 and 31 Dec. Good Friday 6 Apr 2012 traded."
    :closed () :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2013" :year 2013 :uri "https://web.archive.org/web/20160327124358/http://www.pse.cz/dokument.aspx?k=Kalendar-BD-2013"
    :issued nil :issued-uri nil :published nil :published-uri "https://web.archive.org/web/20160327124358/http://www.pse.cz/dokument.aspx?k=Kalendar-BD-2013"
    :published-in "PSE website, web.archive.org snapshot"
    :dates-note "Issue date not shown; 'open Monday through Friday with the exception of March 29, December 31 and public holidays'; 250 days. Good Friday closed (exchange-only)."
    :closed () :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2014" :year 2014 :uri "https://web.archive.org/web/20160422094839/http://www.pse.cz/dokument.aspx?k=Kalendar-BD-2014"
    :issued nil :issued-uri nil :published nil :published-uri "https://web.archive.org/web/20160422094839/http://www.pse.cz/dokument.aspx?k=Kalendar-BD-2014"
    :published-in "PSE website, web.archive.org snapshot"
    :dates-note "Issue date not shown; 'with the exception of April 18, December 31 and public holidays'; 250 days."
    :closed () :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2017" :year 2017 :uri "https://web.archive.org/web/20170325224323/https://www.pse.cz/obchodovani/informace-o-obchodovani/kalendar-burzovnich-dni/"
    :issued nil :issued-uri nil :published (2017 3 25) :published-uri "https://web.archive.org/web/20170325224323/https://www.pse.cz/obchodovani/informace-o-obchodovani/kalendar-burzovnich-dni/"
    :published-in "PSE website, web.archive.org snapshot"
    :dates-note "Issue date not shown; snapshot date = earliest proof of publication. Weekday holidays only; 24 and 31 Dec fall on Sundays."
    :closed () :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2018" :year 2018 :uri "https://web.archive.org/web/20190111194612/https://www.pse.cz/obchodovani/informace-o-obchodovani/kalendar-burzovnich-dni/"
    :issued nil :issued-uri nil :published (2019 1 11) :published-uri "https://web.archive.org/web/20190111194612/https://www.pse.cz/obchodovani/informace-o-obchodovani/kalendar-burzovnich-dni/"
    :published-in "PSE website, web.archive.org snapshot"
    :dates-note "Issue date not shown; snapshot date = earliest proof of publication. Includes '31.12. Silvestr (burzovni volno)'."
    :closed () :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2019" :year 2019 :uri "https://web.archive.org/web/20190111194612/https://www.pse.cz/obchodovani/informace-o-obchodovani/kalendar-burzovnich-dni/"
    :issued nil :issued-uri nil :published (2019 1 11) :published-uri "https://web.archive.org/web/20190111194612/https://www.pse.cz/obchodovani/informace-o-obchodovani/kalendar-burzovnich-dni/"
    :published-in "PSE website, web.archive.org snapshot"
    :dates-note "Issue date not shown; snapshot date = earliest proof of publication. Includes 31.12. Silvestr (burzovni volno)."
    :closed () :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2020" :year 2020 :uri "https://web.archive.org/web/20200704090746/https://www.pse.cz/obchodovani/informace-o-obchodovani/kalendar-burzovnich-dni"
    :issued nil :issued-uri nil :published (2020 7 4) :published-uri "https://web.archive.org/web/20200704090746/https://www.pse.cz/obchodovani/informace-o-obchodovani/kalendar-burzovnich-dni"
    :published-in "PSE website, web.archive.org snapshot"
    :dates-note "Issue date not shown; snapshot date = earliest proof of publication. Includes 31.12. Silvestr (burzovni volno)."
    :closed () :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2021" :year 2021 :uri "https://www.pse.cz/userfiles/related_documents/en/trading-calendar-PSE2021.pdf"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.pse.cz/userfiles/related_documents/en/trading-calendar-PSE2021.pdf"
    :published-in "PSE website"
    :dates-note "Issue date not shown; 'open Monday through Friday with the exception of December 31 and public holidays'; 251 days. Also archived page https://web.archive.org/web/20210126205846/https://www.pse.cz/obchodovani/informace-o-obchodovani/kalendar-burzovnich-dni"
    :closed () :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2022" :year 2022 :uri "https://www.pse.cz/userfiles/related_documents/en/trading-calendar-PSE2022.pdf"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.pse.cz/userfiles/related_documents/en/trading-calendar-PSE2022.pdf"
    :published-in "PSE website"
    :dates-note "Issue date not shown; 252 days; 31 Dec on Saturday."
    :closed () :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2023" :year 2023 :uri "https://www.pse.cz/userfiles/related_documents/en/trading-calendar-PSE-2023.pdf"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.pse.cz/userfiles/related_documents/en/trading-calendar-PSE-2023.pdf"
    :published-in "PSE website"
    :dates-note "Issue date not shown; 250 days; 31 Dec on Sunday."
    :closed () :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2024" :year 2024 :uri "https://www.pse.cz/userfiles/related_documents/en/trading-calendar-PSE-2024-eng.pdf"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.pse.cz/userfiles/related_documents/en/trading-calendar-PSE-2024-eng.pdf"
    :published-in "PSE website"
    :dates-note "Issue date not shown; 251 days. Text lists 'September 28' (a Saturday) but omits October 28 (Monday); 251 days only adds up if 28 Oct is closed - text typo, 28 Oct closed (ec agrees)."
    :closed () :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2025" :year 2025 :uri "https://www.pse.cz/userfiles/related_documents/en/Kalendar-Calendar-PSE-2025.pdf"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.pse.cz/userfiles/related_documents/en/Kalendar-Calendar-PSE-2025.pdf"
    :published-in "PSE website"
    :dates-note "Issue date not shown; 'Non Trading Days are weekends, December 31 and public holidays'."
    :closed () :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2026" :year 2026 :uri "https://www.pse.cz/en/trading/trading-information/trading-calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.pse.cz/en/trading/trading-information/trading-calendar"
    :published-in "PSE website"
    :dates-note "Issue date not shown; Web page fetched 2026-11-28; PDF https://www.pse.cz/userfiles/related_documents/en/Kalendar-obchodnich-dnu-2026-Trading-callendar-2026.pdf"
    :closed () :open () :early-closes () :late-opens ())
   (:title "PSE trading calendar 2027" :year 2027 :uri "https://www.pse.cz/en/trading/trading-information/trading-calendar"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.pse.cz/en/trading/trading-information/trading-calendar"
    :published-in "PSE website"
    :dates-note "Issue date not shown; Web page fetched 2026-11-28; PDF https://www.pse.cz/userfiles/related_documents/en/Kalendar-obchodnich-dnu-2027-Trading-callendar-2027.pdf"
    :closed () :open () :early-closes () :late-opens ())))
