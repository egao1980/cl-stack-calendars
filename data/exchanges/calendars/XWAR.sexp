;; Draft: GPW (Warsaw Stock Exchange) Main Market trading days.
;; GPW publishes "Dni bez sesji" (session-free days) on its website; it is the full list of non-session
;; weekdays (civil holidays + exchange-only days). Lists are often published as preliminary (civil
;; holidays only) and completed later (Good Friday, 24 Dec, 31 Dec, one-offs added) - compare the
;; 2020 list in the 2019-04 snapshot with the 2020-12 snapshot, and 2013 before/after.
;; Years with a GPW list found: 2003-2005, 2007-2008, 2010-2017, 2019-2027. Missing: 2000-2002, 2006, 2009, 2018.
(:name "XWAR"
 :title "GPW Main Market trading days"
 :authority "GPW, 'Dni bez sesji' (session-free days) page"
 :authority-uri "https://www.gpw.pl/szczegoly-sesji"
 :bases ((:calendar "PL" :from nil :to nil :authority "GPW lists contain every Polish statutory holiday falling on a weekday"))
 :rules ((:easter "Good Friday" -2 :from 2000
          :authority "Listed every year in GPW lists 2003-2027, e.g. https://web.archive.org/web/20031231191821/http://www.gpw.pl:80/gpw.asp?cel=ogieldzie&k=8&i=/dniwolne/dniwolne ; https://www.gpw.pl/szczegoly-sesji (2025-2027). 2000-2002: ec only.")
         (:fixed "Christmas Eve" 12 24 :from 2001 :to 2024
          :authority "Exchange-only closure until it became a PL statutory holiday in 2025. Listed 2003, 2007, 2008, 2010, 2012-2015, 2019-2021, 2024 (Mon-Fri cases); NOT listed for Fri 2004-12-24 (see notice). 2001-2002 ec only. https://web.archive.org/web/20101223103838/http://new.gpw.pl/dni_bez_sesji")
         (:fixed "New Year's Eve" 12 31 :from 2012
          :authority "First listed 2012 (https://web.archive.org/web/20120106124005/http://www.gpw.pl/dni_bez_sesji); listed every weekday case since. Weekday 31 Dec in 2003, 2008, 2010 not listed (sessions).")) 
 :notices (
   (:title "GPW Dni bez sesji 2003" :year 2003
    :uri "https://web.archive.org/web/20031231191821/http://www.gpw.pl:80/gpw.asp?cel=ogieldzie&k=8&i=/dniwolne/dniwolne"
    :issued nil :issued-uri nil :published (2003 12 31) :published-uri "https://web.archive.org/web/20031231191821/http://www.gpw.pl:80/gpw.asp?cel=ogieldzie&k=8&i=/dniwolne/dniwolne"
    :published-in "GPW website, web.archive.org snapshot"
    :dates-note "Page shows no issue date; snapshot date is the earliest proof of publication."
    :closed () :open () :early-closes () :late-opens ())
   (:title "GPW Dni bez sesji 2004" :year 2004
    :uri "https://web.archive.org/web/20041216045916/http://www.gpw.pl:80/gpw.asp?cel=ogieldzie&k=8&i=/dniwolne/dniwolne"
    :issued nil :issued-uri nil :published (2003 12 31) :published-uri "https://web.archive.org/web/20031231191821/http://www.gpw.pl:80/gpw.asp?cel=ogieldzie&k=8&i=/dniwolne/dniwolne"
    :published-in "GPW website, web.archive.org snapshots 2003-12-31 and 2004-12-16"
    :dates-note "Same 2004 list in both snapshots; Fri 24 Dec 2004 is absent in the 2004-12-16 snapshot (8 days before), so it was a session. ec agrees."
    :closed () :open (((2004 12 24) "Not on GPW 2004 list (Friday)")) :early-closes () :late-opens ())
   (:title "GPW Dni bez sesji 2005" :year 2005
    :uri "https://web.archive.org/web/20041216045916/http://www.gpw.pl:80/gpw.asp?cel=ogieldzie&k=8&i=/dniwolne/dniwolne"
    :issued nil :issued-uri nil :published (2004 12 16) :published-uri "https://web.archive.org/web/20041216045916/http://www.gpw.pl:80/gpw.asp?cel=ogieldzie&k=8&i=/dniwolne/dniwolne"
    :published-in "GPW website, web.archive.org snapshot" :dates-note "Preliminary-era snapshot; ec also closes Fri 2005-04-08 (funeral of Pope John Paul II) - not in this list (published before the event); no GPW notice found."
    :closed () :open () :early-closes () :late-opens ())
   (:title "GPW Dni bez sesji 2007" :year 2007
    :uri "https://web.archive.org/web/20070518224721/http://www.gpw.pl:80/gpw.asp?cel=ogieldzie&k=11&i=/dniwolne/dniwolne&sky=1"
    :issued nil :issued-uri nil :published (2007 5 18) :published-uri "https://web.archive.org/web/20070518224721/http://www.gpw.pl:80/gpw.asp?cel=ogieldzie&k=11&i=/dniwolne/dniwolne&sky=1"
    :published-in "GPW website, web.archive.org snapshots 2007-05-18 and 2007-10-07"
    :dates-note "List starts at 6 Apr (earlier dates had rolled off). Mon 31 Dec 2007 not listed in the 2007-10-07 snapshot; ec closes it - unresolved."
    :closed () :open () :early-closes () :late-opens ())
   (:title "GPW Dni bez sesji 2008" :year 2008
    :uri "https://web.archive.org/web/20071007200820/http://www.gpw.pl/gpw.asp?cel=ogieldzie&k=11&i=/dniwolne/dniwolne&sky=1"
    :issued nil :issued-uri nil :published (2007 10 7) :published-uri "https://web.archive.org/web/20071007200820/http://www.gpw.pl/gpw.asp?cel=ogieldzie&k=11&i=/dniwolne/dniwolne&sky=1"
    :published-in "GPW website, web.archive.org snapshot"
    :dates-note "Early (Oct 2007) list. ec also closes Fri 2008-05-02 - not in this list; no later 2008 list found."
    :closed () :open () :early-closes () :late-opens ())
   (:title "GPW Dni bez sesji 2010" :year 2010
    :uri "https://web.archive.org/web/20101223103838/http://new.gpw.pl/dni_bez_sesji"
    :issued nil :issued-uri nil :published (2010 12 23) :published-uri "https://web.archive.org/web/20101223103838/http://new.gpw.pl/dni_bez_sesji"
    :published-in "GPW website, web.archive.org snapshot"
    :dates-note "Only the remaining 2010 date (Fri 24 Dec) is shown; Fri 31 Dec 2010 not listed (session)."
    :closed () :open () :early-closes () :late-opens ())
   (:title "GPW Dni bez sesji 2011" :year 2011
    :uri "https://web.archive.org/web/20110921053248/http://www.gpw.pl/dni_bez_sesji"
    :issued nil :issued-uri nil :published (2010 12 23) :published-uri "https://web.archive.org/web/20101223103838/http://new.gpw.pl/dni_bez_sesji"
    :published-in "GPW website, web.archive.org snapshots 2010-12-23 and 2011-09-21"
    :dates-note "Full-year list. Fri 23 Dec and Fri 30 Dec 2011 are ordinary sessions (no early close found)."
    :closed () :open () :early-closes () :late-opens ())
   (:title "GPW Dni bez sesji 2012" :year 2012
    :uri "https://web.archive.org/web/20120106124005/http://www.gpw.pl/dni_bez_sesji"
    :issued nil :issued-uri nil :published (2011 9 21) :published-uri "https://web.archive.org/web/20110921053248/http://www.gpw.pl/dni_bez_sesji"
    :published-in "GPW website, web.archive.org snapshots" :dates-note "First year listing 31 Dec."
    :closed () :open () :early-closes () :late-opens ())
   (:title "GPW Dni bez sesji 2013" :year 2013
    :uri "https://web.archive.org/web/20131204235252/http://www.gpw.pl/dni_bez_sesji"
    :issued nil :issued-uri nil :published (2012 10 31) :published-uri "https://web.archive.org/web/20121031081806/http://www.gpw.pl/dni_bez_sesji"
    :published-in "GPW website, web.archive.org snapshots 2012-10-31, 2013-04-20, 2013-12-04"
    :dates-note "2012-10-31 version lacked 16 Apr and 31 Dec; 16 Apr (Tuesday after the UTP launch) appears by 2013-04-20, 31 Dec by 2013-12-04 (https://web.archive.org/web/20130420091745/http://www.gpw.pl/dni_bez_sesji)."
    :closed (((2013 4 16) "No session (added to GPW list in April 2013)")) :open () :early-closes () :late-opens ())
   (:title "GPW Dni bez sesji 2014" :year 2014
    :uri "https://web.archive.org/web/20141109091425/http://www.gpw.pl/dni_bez_sesji"
    :issued nil :issued-uri nil :published (2013 12 4) :published-uri "https://web.archive.org/web/20131204235252/http://www.gpw.pl/dni_bez_sesji"
    :published-in "GPW website, web.archive.org snapshots" :dates-note "2013-12 version lacked 31 Dec; present by 2014-11-09."
    :closed () :open () :early-closes () :late-opens ())
   (:title "GPW Dni bez sesji 2015" :year 2015
    :uri "https://web.archive.org/web/20151205212220/http://www.gpw.pl/dni_bez_sesji"
    :issued nil :issued-uri nil :published (2014 11 9) :published-uri "https://web.archive.org/web/20141109091425/http://www.gpw.pl/dni_bez_sesji"
    :published-in "GPW website, web.archive.org snapshots" :dates-note "The GPW page gives the list without an issue date (the GPW Management Board resolution was not found); :published is the earliest web.archive.org capture showing the list, an upper bound."
    :closed () :open () :early-closes () :late-opens ())
   (:title "GPW Dni bez sesji 2016" :year 2016
    :uri "https://web.archive.org/web/20161123204112/http://www.gpw.pl/dni_bez_sesji"
    :issued nil :issued-uri nil :published (2015 12 5) :published-uri "https://web.archive.org/web/20151205212220/http://www.gpw.pl/dni_bez_sesji"
    :published-in "GPW website, web.archive.org snapshots" :dates-note "24/31 Dec on weekend; Fri 23 and Fri 30 Dec are ordinary sessions."
    :closed () :open () :early-closes () :late-opens ())
   (:title "GPW Dni bez sesji 2017" :year 2017
    :uri "https://web.archive.org/web/20170713095440/http://www.gpw.pl/dni_bez_sesji"
    :issued nil :issued-uri nil :published (2016 11 23) :published-uri "https://web.archive.org/web/20161123204112/http://www.gpw.pl/dni_bez_sesji"
    :published-in "GPW website, web.archive.org snapshots" :dates-note "The GPW page gives the list without an issue date (the GPW Management Board resolution was not found); :published is the earliest web.archive.org capture showing the list, an upper bound."
    :closed () :open () :early-closes () :late-opens ())
   (:title "No GPW session on 2 January 2018 (MiFID II go-live), as reported by Bankier.pl" :year 2018
    :uri "https://www.bankier.pl/wiadomosc/Tym-beda-zyly-rynki-nowy-rok-nowe-dane-7564309.html"
    :issued nil :issued-uri nil
    :published (2017 12 29) :published-uri "https://www.bankier.pl/wiadomosc/Tym-beda-zyly-rynki-nowy-rok-nowe-dane-7564309.html"
    :published-in "Bankier.pl, 2017-12-29 ('2 stycznia jest dniem bez handlu na GPW'); secondary copy"
    :confidence :secondary
    :dates-note "No GPW page for 2018 archived (gpw.pl/dni_bez_sesji last snapshot 2017-07; new site first snapshot 2019-04); the GPW decision itself was not found, so :issued is NIL."
    :closed (((2018 1 2) "No session - MiFID II go-live")) :open () :early-closes () :late-opens ())
   (:title "GPW Exchange holidays 2019" :year 2019
    :uri "https://web.archive.org/web/20190430114521/https://www.gpw.pl/session-details"
    :issued nil :issued-uri nil :published (2019 4 30) :published-uri "https://web.archive.org/web/20190430114521/https://www.gpw.pl/session-details"
    :published-in "GPW website (Session details - Exchange holidays), web.archive.org snapshot" :dates-note "The GPW page gives the list without an issue date (the GPW Management Board resolution was not found); :published is the earliest web.archive.org capture showing the list, an upper bound."
    :closed () :open () :early-closes () :late-opens ())
   (:title "GPW Dni bez sesji 2020" :year 2020
    :uri "https://web.archive.org/web/20201218045436/https://www.gpw.pl/szczegoly-sesji"
    :issued nil :issued-uri nil :published (2019 4 30) :published-uri "https://web.archive.org/web/20190430114521/https://www.gpw.pl/session-details"
    :published-in "GPW website, web.archive.org snapshots" :dates-note "2019-04 preliminary version had only civil holidays; final (2020-12) adds Good Friday 10 Apr, 24 and 31 Dec."
    :closed () :open () :early-closes () :late-opens ())
   (:title "GPW Dni bez sesji 2021" :year 2021
    :uri "https://web.archive.org/web/20210725084603/https://www.gpw.pl/szczegoly-sesji/"
    :issued nil :issued-uri nil :published (2020 12 18) :published-uri "https://web.archive.org/web/20201218045436/https://www.gpw.pl/szczegoly-sesji"
    :published-in "GPW website, web.archive.org snapshots" :dates-note "The GPW page gives the list without an issue date (the GPW Management Board resolution was not found); :published is the earliest web.archive.org capture showing the list, an upper bound."
    :closed () :open () :early-closes () :late-opens ())
   (:title "GPW Dni bez sesji 2022" :year 2022
    :uri "https://web.archive.org/web/20230414204828/https://www.gpw.pl/szczegoly-sesji"
    :issued nil :issued-uri nil :published (2021 7 25) :published-uri "https://web.archive.org/web/20210725084603/https://www.gpw.pl/szczegoly-sesji/"
    :published-in "GPW website, web.archive.org snapshots" :dates-note "Fri 23 and Fri 30 Dec 2022 are ordinary sessions."
    :closed () :open () :early-closes () :late-opens ())
   (:title "GPW Dni bez sesji 2023" :year 2023
    :uri "https://web.archive.org/web/20230414204828/https://www.gpw.pl/szczegoly-sesji"
    :issued nil :issued-uri nil :published (2022 6 23) :published-uri "https://web.archive.org/web/20220623121547/https://www.gpw.pl/session-details"
    :published-in "GPW website, web.archive.org snapshots" :dates-note "Fri 22 and Fri 29 Dec 2023 are ordinary sessions."
    :closed () :open () :early-closes () :late-opens ())
   (:title "GPW Dni bez sesji 2024 (preliminary)" :year 2024
    :uri "https://web.archive.org/web/20230414204828/https://www.gpw.pl/szczegoly-sesji"
    :issued nil :issued-uri nil :published (2023 4 14) :published-uri "https://web.archive.org/web/20230414204828/https://www.gpw.pl/szczegoly-sesji"
    :published-in "GPW website, web.archive.org snapshot"
    :dates-note "Only a preliminary 2024 list (civil holidays) was found; final list not archived. Good Friday 29 Mar, 24 Dec, 31 Dec follow from the rules (ec agrees)."
    :closed () :open () :early-closes () :late-opens ())
   (:title "GPW Dni bez sesji 2025" :year 2025 :uri "https://www.gpw.pl/szczegoly-sesji"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.gpw.pl/szczegoly-sesji"
    :published-in "GPW website (Szczegoly sesji - Dni bez sesji), fetched 2026-11-28"
    :dates-note "GPW Management Board resolution for the 2025 calendar reported as Uchwala Nr 701/2024 (search result only, not retrieved)."
    :closed () :open () :early-closes () :late-opens ())
   (:title "GPW Dni bez sesji 2026" :year 2026 :uri "https://www.gpw.pl/szczegoly-sesji"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.gpw.pl/szczegoly-sesji"
    :published-in "GPW website, fetched 2026-11-28" :dates-note "The GPW session-details page gives the list without an issue or publication date (the GPW Management Board resolution was not found)."
    :closed () :open () :early-closes () :late-opens ())
   (:title "GPW Dni bez sesji 2027" :year 2027 :uri "https://www.gpw.pl/szczegoly-sesji"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.gpw.pl/szczegoly-sesji"
    :published-in "GPW website, fetched 2026-11-28" :dates-note "The GPW session-details page gives the list without an issue or publication date (the GPW Management Board resolution was not found)."
    :closed () :open () :early-closes () :late-opens ())))
