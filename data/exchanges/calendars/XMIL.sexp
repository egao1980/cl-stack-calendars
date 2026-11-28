;;;; XMIL - Borsa Italiana / Euronext Milan cash (MTA / Euronext Milan). Own calendar, not the EURONEXT harmonised one.
;;;; Years without a primary list found: 2000, 2001, 2002, 2004, 2005 (old PDFs calendario2002it5407 / 2004 / 2005 are 404 live;
;;;; wayback not tried for all). 2009 graphic PDF exists (calendario2009.pdf) but was not checked.
(:name "XMIL"
 :title "Euronext Milan (Borsa Italiana) trading days"
 :authority "Borsa Italiana yearly trading calendar (Calendario di Borsa)" :authority-uri "https://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.en.htm"
 :rules ((:fixed "Capodanno" 1 1 :authority "Borsa Italiana yearly trading calendars")
         (:easter "Venerdi Santo" -2 :authority "Borsa Italiana yearly trading calendars")
         (:easter "Lunedi dell'Angelo" 1 :authority "Borsa Italiana yearly trading calendars")
         (:fixed "Festa del Lavoro" 5 1 :authority "Borsa Italiana yearly trading calendars")
         (:fixed "Assunzione (Ferragosto)" 8 15 :authority "Borsa Italiana yearly trading calendars 2006-2025")
         (:fixed "Vigilia di Natale" 12 24 :authority "Borsa Italiana yearly trading calendars; 2027: open (half day), TAH only closed")
         (:fixed "Natale" 12 25 :authority "Borsa Italiana yearly trading calendars")
         (:fixed "Santo Stefano" 12 26 :authority "Borsa Italiana yearly trading calendars")
         (:fixed "San Silvestro" 12 31 :authority "Borsa Italiana yearly trading calendars; 2027: open (half day), TAH only closed"))
 :notices (
   (:title "Calendario 2003 Borsa, Nuovo Mercato, Mercato Ristretto e IDEM (graphic calendar)"
    :uri "https://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario2003i.pdf"
    :year 2003
    :issued nil :issued-uri "https://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario2003i.pdf"
    :published nil :published-uri "https://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario2003i.pdf"
    :published-in "Borsa Italiana trading calendar PDF" :dates-note "Graphic calendar; closed days shown in red (visual check: 1 Jan, 18+21 Apr, 1 May, 15 Aug, 24-26 Dec, 31 Dec), consistent with rules. Issue date not shown."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Avviso n.14910 - Calendario operativo dei mercati per l'anno 2006 (Provvedimento n. 4334 del 16 novembre 2005)"
    :uri "https://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario2006.pdf"
    :year 2006
    :issued (2005 11 16) :issued-uri "https://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario2006.pdf"
    :published (2005 11 17) :published-uri "https://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario2006.pdf"
    :published-in "Borsa Italiana Avviso n.14910" :dates-note "Closures 14+17 Apr, 1 May, 15 Aug, 25+26 Dec 2006 (1 Jan, 24 Dec, 31 Dec on Sundays)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Avviso n.16036 - Determinazione dei giorni di chiusura dei mercati per l'anno 2007 (Provvedimento n. 4943 del 6 novembre 2006)"
    :uri "https://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario2007.pdf"
    :year 2007
    :issued (2006 11 6) :issued-uri "https://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario2007.pdf"
    :published (2006 11 6) :published-uri "https://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario2007.pdf"
    :published-in "Borsa Italiana Avviso n.16036" :dates-note "Closures 1 Jan, 6+9 Apr, 1 May, 15 Aug, 24, 25, 26, 31 Dec 2007."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Calendario di negoziazione 2008 (graphic calendar)"
    :uri "https://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario2008.pdf"
    :year 2008
    :issued nil :issued-uri "https://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario2008.pdf"
    :published nil :published-uri "https://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario2008.pdf"
    :published-in "Borsa Italiana trading calendar PDF" :dates-note "Graphic calendar (low-resolution visual check only): closures shown on 1 Jan, 21+24 Mar, 15 Aug, 24-26 Dec, 31 Dec; 1 May not clearly legible."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Borsa Italiana - Calendario di Borsa anno 2010 (calendar page)"
    :uri "https://web.archive.org/web/20110819122547id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :year 2010
    :issued nil :issued-uri "https://web.archive.org/web/20110819122547id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published (2011 8 19) :published-uri "https://web.archive.org/web/20110819122547id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published-in "borsaitaliana.it Calendario di Borsa e Orari di Negoziazione page (web.archive.org snapshot)" :dates-note "Issue date not on page; published = snapshot date. List matches the rules."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Borsa Italiana - Calendario di Borsa anno 2011 (calendar page)"
    :uri "https://web.archive.org/web/20120504140900id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :year 2011
    :issued nil :issued-uri "https://web.archive.org/web/20120504140900id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published (2012 5 4) :published-uri "https://web.archive.org/web/20120504140900id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published-in "borsaitaliana.it Calendario di Borsa e Orari di Negoziazione page (web.archive.org snapshot)" :dates-note "Issue date not on page; published = snapshot date. List matches the rules."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Borsa Italiana - Calendario di Borsa anno 2012 (calendar page)"
    :uri "https://web.archive.org/web/20130507183003id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :year 2012
    :issued nil :issued-uri "https://web.archive.org/web/20130507183003id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published (2013 5 7) :published-uri "https://web.archive.org/web/20130507183003id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published-in "borsaitaliana.it Calendario di Borsa e Orari di Negoziazione page (web.archive.org snapshot)" :dates-note "Issue date not on page; published = snapshot date. List matches the rules."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Borsa Italiana - Calendario di Borsa anno 2013 (calendar page)"
    :uri "https://web.archive.org/web/20140707150641id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :year 2013
    :issued nil :issued-uri "https://web.archive.org/web/20140707150641id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published (2014 7 7) :published-uri "https://web.archive.org/web/20140707150641id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published-in "borsaitaliana.it Calendario di Borsa e Orari di Negoziazione page (web.archive.org snapshot)" :dates-note "Issue date not on page; published = snapshot date. List matches the rules."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Borsa Italiana - Calendario di Borsa anno 2014 (calendar page)"
    :uri "https://web.archive.org/web/20150318104815id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :year 2014
    :issued nil :issued-uri "https://web.archive.org/web/20150318104815id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published (2015 3 18) :published-uri "https://web.archive.org/web/20150318104815id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published-in "borsaitaliana.it Calendario di Borsa e Orari di Negoziazione page (web.archive.org snapshot)" :dates-note "Issue date not on page; published = snapshot date. List matches the rules."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Borsa Italiana - Calendario di Borsa anno 2015 (calendar page)"
    :uri "https://web.archive.org/web/20160610175255id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :year 2015
    :issued nil :issued-uri "https://web.archive.org/web/20160610175255id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published (2016 6 10) :published-uri "https://web.archive.org/web/20160610175255id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published-in "borsaitaliana.it Calendario di Borsa e Orari di Negoziazione page (web.archive.org snapshot)" :dates-note "Issue date not on page; published = snapshot date. List matches the rules."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Borsa Italiana - Calendario di Borsa anno 2016 (calendar page)"
    :uri "https://web.archive.org/web/20160610175255id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :year 2016
    :issued nil :issued-uri "https://web.archive.org/web/20160610175255id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published (2016 6 10) :published-uri "https://web.archive.org/web/20160610175255id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published-in "borsaitaliana.it Calendario di Borsa e Orari di Negoziazione page (web.archive.org snapshot)" :dates-note "Issue date not on page; published = snapshot date. List matches the rules."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Borsa Italiana - Calendario di Borsa anno 2017 (calendar page)"
    :uri "https://web.archive.org/web/20170607143401id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :year 2017
    :issued nil :issued-uri "https://web.archive.org/web/20170607143401id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published (2017 6 7) :published-uri "https://web.archive.org/web/20170607143401id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published-in "borsaitaliana.it Calendario di Borsa e Orari di Negoziazione page (web.archive.org snapshot)" :dates-note "Issue date not on page; published = snapshot date. List matches the rules."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Borsa Italiana - Calendario di Borsa anno 2018 (calendar page)"
    :uri "https://web.archive.org/web/20180605171124id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :year 2018
    :issued nil :issued-uri "https://web.archive.org/web/20180605171124id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published (2018 6 5) :published-uri "https://web.archive.org/web/20180605171124id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published-in "borsaitaliana.it Calendario di Borsa e Orari di Negoziazione page (web.archive.org snapshot)" :dates-note "Issue date not on page; published = snapshot date. List matches the rules."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Borsa Italiana - Calendario di Borsa anno 2019 (calendar page)"
    :uri "https://web.archive.org/web/20191127210152id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :year 2019
    :issued nil :issued-uri "https://web.archive.org/web/20191127210152id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published (2019 11 27) :published-uri "https://web.archive.org/web/20191127210152id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published-in "borsaitaliana.it Calendario di Borsa e Orari di Negoziazione page (web.archive.org snapshot)" :dates-note "Issue date not on page; published = snapshot date. List matches the rules."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Borsa Italiana - Calendario di Borsa anno 2020 (calendar page)"
    :uri "https://web.archive.org/web/20191127210152id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :year 2020
    :issued nil :issued-uri "https://web.archive.org/web/20191127210152id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published (2019 11 27) :published-uri "https://web.archive.org/web/20191127210152id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published-in "borsaitaliana.it Calendario di Borsa e Orari di Negoziazione page (web.archive.org snapshot)" :dates-note "Issue date not on page; published = snapshot date. List matches the rules."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Borsa Italiana - Calendario di Borsa anno 2021 (calendar page)"
    :uri "https://web.archive.org/web/20210731183820id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :year 2021
    :issued nil :issued-uri "https://web.archive.org/web/20210731183820id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published (2021 7 31) :published-uri "https://web.archive.org/web/20210731183820id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published-in "borsaitaliana.it Calendario di Borsa e Orari di Negoziazione page (web.archive.org snapshot)" :dates-note "Issue date not on page; published = snapshot date. List matches the rules. Page says 'Borsa Italiana propone' (proposed)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Borsa Italiana - Calendario di Borsa anno 2022 (calendar page)"
    :uri "https://web.archive.org/web/20230727112018id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :year 2022
    :issued nil :issued-uri "https://web.archive.org/web/20230727112018id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published (2023 7 27) :published-uri "https://web.archive.org/web/20230727112018id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published-in "borsaitaliana.it Calendario di Borsa e Orari di Negoziazione page (web.archive.org snapshot)" :dates-note "Issue date not on page; published = snapshot date. List matches the rules."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Borsa Italiana - Calendario di Borsa anno 2023 (calendar page)"
    :uri "https://web.archive.org/web/20230727112018id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :year 2023
    :issued nil :issued-uri "https://web.archive.org/web/20230727112018id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published (2023 7 27) :published-uri "https://web.archive.org/web/20230727112018id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published-in "borsaitaliana.it Calendario di Borsa e Orari di Negoziazione page (web.archive.org snapshot)" :dates-note "Issue date not on page; published = snapshot date. List matches the rules."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Borsa Italiana - Calendario di Borsa anno 2024 (calendar page)"
    :uri "https://web.archive.org/web/20240627014345id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :year 2024
    :issued nil :issued-uri "https://web.archive.org/web/20240627014345id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published (2024 6 27) :published-uri "https://web.archive.org/web/20240627014345id_/http://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.htm"
    :published-in "borsaitaliana.it Calendario di Borsa e Orari di Negoziazione page (web.archive.org snapshot)" :dates-note "Issue date not on page; published = snapshot date. List matches the rules."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Euronext Trading Hours & Holidays page: calendar of business days 2025 (Milan column)"
    :uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :year 2025
    :issued nil :issued-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published nil :published-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published-in "euronext.com Trading Hours & Holidays page (fetched 2026-11-28)" :dates-note "Milan closed 1 Jan, GF, EM, 1 May, 15 Aug (2025), 24, 25, 26 (2025), 31 Dec. Borsa Italiana 2026 PDF: https://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/tradingcalendar-2026.en.pdf"
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Euronext Trading Hours & Holidays page: calendar of business days 2026 (Milan column)"
    :uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :year 2026
    :issued nil :issued-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published nil :published-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published-in "euronext.com Trading Hours & Holidays page (fetched 2026-11-28)" :dates-note "Milan closed 1 Jan, GF, EM, 1 May, 15 Aug (2025), 24, 25, 26 (2025), 31 Dec. Borsa Italiana 2026 PDF: https://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/tradingcalendar-2026.en.pdf"
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Borsa Italiana - Trading Calendars Year 2027"
    :uri "https://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.en.htm"
    :year 2027
    :issued (2026 11 6) :issued-uri "https://www.euronext.com/en/media/16439/download"
    :published nil :published-uri "https://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.en.htm"
    :published-in "borsaitaliana.it Trading Calendar and Hours page (fetched 2026-11-28); Euronext 2027 holiday calendar Info-Flash" :dates-note "2027 closing days: 1 Jan, GF 26 Mar, EM 29 Mar (others on weekends); 24 and 31 Dec 2027 closed for Trading After Hours only. Euronext Info-Flash table: Milan 'Half Trading Day, No TAH' on Fri 24 and Fri 31 Dec 2027. Half-day close time not yet published (end-of-year appendix). Issued = Euronext Info-Flash date; Borsa page publish date not shown."
    :closed ()
    :open (((2027 12 24) "Vigilia di Natale: half trading day (first time)") ((2027 12 31) "San Silvestro: half trading day (first time)"))
    :early-closes ()
    :late-opens ())
 ))
