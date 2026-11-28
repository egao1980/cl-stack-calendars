;;;; XPHS exchange trading-day calendar (#49, SEA family).
;;;; PSE closes on the PH regular holidays and nationwide special (non-working) days by proclamation
;;;; (registered civil calendar "PH"), and on days when PhilPaSS / BSP clearing is closed (typhoons,
;;;; quakes) or when PSE suspends or cancels trading. NCR-only special days and government work
;;;; suspensions do not close PSE unless PhilPaSS is closed (CN-2015-0067, CN-2017-0061, CN-2018-0063).
;;;; Exchange memoranda (CN series, documents.pse.com.ph) found for 2013-2026; holiday memoranda from 2015.
;;;; First year with exchange lists: 2015. Gaps: 2000-2014 (see :gaps).
(:name "XPHS"
 :title "Philippine Stock Exchange trading days"
 :authority "The Philippine Stock Exchange, Inc., Memoranda CN series ('Non-Trading Days', 'Trading Suspension'); PSE 'Trading Hours & Holidays' page" :authority-uri "https://www.pse.com.ph/investing-at-pse/#investing2"
 :bases ((:calendar "PH" :from nil :to nil
          :authority "PSE memoranda 2015-2026 declare 'no trading' 'in view of Proclamation No. ...' on each regular holiday and nationwide special non-working day, e.g. CN-2015-0140 https://documents.pse.com.ph/CircularOPSPDF/CN-2015-0140.pdf ; PSE investing FAQ: trading 'except Saturdays, Sundays, legal holidays and days when the Bangko Sentral ng Pilipinas Clearing Office is closed' https://www.pse.com.ph/investing-at-pse/#investing2 . All 2016-2026 weekday holidays of data/ph match the memoranda. 2000-2014: assumed."))
 :rules ()
 :gaps ((:years "2000-2014" :note "No PSE holiday list or memorandum found: the CN memoranda on documents.pse.com.ph start in 2011, and holiday notices appear in them only from Jan 2015 (2011-2014 CN subjects and OCR of scanned ones checked). Only the 2013-08-19 and 2014-12-08 suspensions are documented. Wayback CDX searches of pse.com.ph / pse.org.ph for holiday pages timed out. ec 2000-2001 treats nearly every PH holiday as a session, which is implausible but unverified. ec-only closures 2003-05-02, 2003-08-22, 2003-12-26, 2004-12-03, 2005-03-23, 2005-07-25, 2005-08-29, 2006-07-24, 2006-09-28, 2006-09-29, 2009-07-17, 2009-09-07, 2011-09-27, 2012-08-07, 2013-08-20, 2014-07-16, 2014-09-19 (typhoon / PhilPaSS closures?) are unverified.")
        (:years "2015" :note "Jan-Jun 2015 holidays and APEC 18-19 Nov 2015 (ec closed) have no memorandum."))
 :notices (
   (:title "PSE CN-2013-0033 Trading Suspension (19 Aug 2013)"
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2013-0033.pdf"
    :issued (2013 8 19) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2013-0033.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2013-0033.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "Issue date from the memorandum DATE line; posting date on the PSE site not recorded."
    :closed (((2013 8 19) "No trading: suspension of clearing and settlement in the Philippine banking system"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE CN-2014-0059 Trading Suspension (8 Dec 2014)"
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2014-0059.pdf"
    :issued (2014 12 8) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2014-0059.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2014-0059.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "Issue date from the memorandum DATE line; posting date on the PSE site not recorded."
    :closed (((2014 12 8) "No trading: suspension of clearing and settlement in the Philippine banking system"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE CN-2015-0064 Non-Trading Days, as updated by CN-2015-0067 (Papal visit, Proclamation 936)"
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2015-0067.pdf"
    :issued (2015 1 12) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2015-0067.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2015-0067.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "CN-2015-0064 (7 Jan 2015, https://documents.pse.com.ph/CircularOPSPDF/CN-2015-0064.pdf) declared 15, 16 and 19 Jan 2015 non-trading; CN-2015-0067 (12 Jan 2015) restored 19 Jan as REGULAR TRADING because PhilPaSS and BSP stay open. 19 Jan is not a holiday in the PH base, so no :open row is needed."
    :closed (((2015 1 15) "No trading: special non-working day in NCR (Proclamation 936)") ((2015 1 16) "No trading: special non-working day in NCR (Proclamation 936)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE CN-2015-0128 Schedule of Trading Today (30 Sep 2015)"
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2015-0128.pdf"
    :issued nil :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2015-0128.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2015-0128.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "Issue date from the memorandum DATE line; posting date on the PSE site not recorded."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens (((2015 9 30) (10 35) "Adjusted schedule: pre-open 10:20, market open 10:35; recess 12:00, resume 13:30, close 15:30")))
   (:title "PSE CN-2017-0020 Trading Schedule for April 27 & 28, 2017 (30th ASEAN Summit)"
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2017-0020.pdf"
    :issued (2017 4 21) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2017-0020.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2017-0020.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "27 Apr 2017 regular trading."
    :closed (((2017 4 28) "No trading: work suspended in Metro Manila (Malacanang MC 18), PhilPaSS closed"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE CN-2017-0050 Trading Suspension (12 Sep 2017)"
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2017-0050.pdf"
    :issued nil :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2017-0050.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2017-0050.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "Issue date from the memorandum DATE line; posting date on the PSE site not recorded."
    :closed (((2017 9 12) "No trading: suspension of clearing and settlement in the Philippine banking system"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE CN-2017-0059 Trading Suspension (16 Oct 2017)"
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2017-0059.pdf"
    :issued (2017 10 15) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2017-0059.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2017-0059.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "CN-2017-0061 (17 Oct 2017) confirms regular trading on 17 Oct despite the government work suspension."
    :closed (((2017 10 16) "No trading: PhilPaSS suspension of operations"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE CN-2017-0078 Non-Trading Days (updated; Malacanang MC 37)"
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2017-0078.pdf"
    :issued (2017 12 19) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2017-0078.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2017-0078.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "Supersedes CN-2017-0076 (13 Dec 2017)."
    :closed (((2017 12 26) "No Trading (Malacanang MC 37)") ((2018 1 2) "No Trading (Malacanang MC 37)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE CN-2018-0060 Delay in Market Opening (3 Dec 2018)"
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2018-0060.pdf"
    :issued nil :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2018-0060.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2018-0060.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "Issue date from the memorandum DATE line; posting date on the PSE site not recorded."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens (((2018 12 3) (10 15) "Market opened at 10:15 after a system failure; regular hours otherwise")))
   (:title "PSE CN-2019-0045 Trading Schedule (9 Oct 2019)"
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2019-0045.pdf"
    :issued nil :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2019-0045.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2019-0045.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "Issue date from the memorandum DATE line; posting date on the PSE site not recorded."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens (((2019 10 9) (9 45) "Pre-open 9:30, market open 9:45")))
   (:title "PSE CN-2020-0002 Trading Suspension (13 Jan 2020, Taal Volcano)"
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2020-0002.pdf"
    :issued (2020 1 13) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2020-0002.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2020-0002.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "Issue date from the memorandum DATE line; posting date on the PSE site not recorded."
    :closed (((2020 1 13) "No trading: Taal Volcano ash emission"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE CN-2020-0021 Trading Suspension starting March 17, 2020; CN-2020-0025 Resumption on March 19, 2020"
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2020-0021.pdf"
    :issued (2020 3 16) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2020-0021.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2020-0021.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "CN-2020-0025 (17 Mar 2020, https://documents.pse.com.ph/CircularOPSPDF/CN-2020-0025.pdf) resumes trading on Thursday 19 Mar 2020 with shortened hours 09:30-13:00."
    :closed (((2020 3 17) "No trading: COVID-19 enhanced community quarantine") ((2020 3 18) "No trading: COVID-19 enhanced community quarantine"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE CN-2020-0096 No Trading Today (12 Nov 2020, Typhoon Ulysses)"
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2020-0096.pdf"
    :issued (2020 11 12) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2020-0096.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2020-0096.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "Supersedes CN-2020-0095 (11 Nov 2020); CN-2020-0097 confirms regular trading 13 Nov 2020."
    :closed (((2020 11 12) "No trading and no clearing/settlement"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE CN-2021-0063 Half-Day Trading on December 24 & 31, 2021"
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2021-0063.pdf"
    :issued nil :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2021-0063.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2021-0063.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "Market phases: pre-open 09:00, open 09:30, pre-close 11:55, run-off 12:00, close 12:10. The PH base has no holiday on these days (they were not special non-working days in 2021)."
    :closed ()
    :open ()
    :early-closes (((2021 12 24) (12 10) "Half-day: run-off 12:00, market close 12:10") ((2021 12 31) (12 10) "Half-day: run-off 12:00, market close 12:10"))
    :late-opens ())
   (:title "PSE CN-2022-0002 Cancellation of Trading (4 Jan 2022)"
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2022-0002.pdf"
    :issued (2022 1 4) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2022-0002.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2022-0002.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "Preceded by CN-2022-0001 / CN-2021-0068 'Delay in market opening and trading' the same day."
    :closed (((2022 1 4) "Trading cancelled: trading engine / front-end connection failure"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE CN-2022-0035 Trading Suspension (26 Sep 2022, Super Typhoon Karding)"
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2022-0035.pdf"
    :issued (2022 9 25) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2022-0035.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2022-0035.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "Issue date from the memorandum DATE line; posting date on the PSE site not recorded."
    :closed (((2022 9 26) "No trading and no clearing/settlement"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE CN-2024-0038 Trading Suspension (24 Jul 2024, Typhoon Carina)"
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2024-0038.pdf"
    :issued (2024 7 24) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2024-0038.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2024-0038.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "CN-2024-0039 (25 Jul 2024) Trading Resumption."
    :closed (((2024 7 24) "No trading"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE CN-2024-0061 Adjusted Trading Schedule for Today (9 Dec 2024)"
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2024-0061.pdf"
    :issued nil :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2024-0061.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2024-0061.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "After CN-2024-0060 'Delayed pre-open period'."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens (((2024 12 9) (9 55) "Pre-open 09:40, pre-open no cancel 09:50, market open 09:55")))
   (:title "PSE CN-2025-0015 Adjusted Trading Schedule for Today (24 Mar 2025)"
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2025-0015.pdf"
    :issued nil :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2025-0015.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2025-0015.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "After CN-2025-0011..0014 'Delayed market open'."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens (((2025 3 24) (11 10) "Pre-open no cancel 11:05, market open 11:10")))
   (:title "PSE non-trading-day memoranda 2015 (CN series)" :year 2015
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2015-0140.pdf"
    :issued (2015 12 15) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2015-0140.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2015-0140.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "PSE announces each holiday by memorandum citing the presidential proclamations (regular holidays, nationwide special non-working days, Eid dates); every such day of 2015 is a holiday of the PH base. Memoranda for 2015: CN-2015-0064, CN-2015-0099, CN-2015-0107, CN-2015-0122, CN-2015-0138, CN-2015-0140 (https://documents.pse.com.ph/CircularOPSPDF/<no>.pdf). Issue date is that of CN-2015-0140. No memoranda found for Jan-Jun 2015 holidays (1-2 Jan, 19 Feb, 2-3 Apr, 9 Apr, 1 May, 12 Jun 2015) and none for APEC 18-19 Nov 2015 (ec closed); CN numbering 2015 starts at 0063."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE non-trading-day memoranda 2016 (CN series)" :year 2016
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2016-0083.pdf"
    :issued (2016 12 14) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2016-0083.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2016-0083.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "PSE announces each holiday by memorandum citing the presidential proclamations (regular holidays, nationwide special non-working days, Eid dates); every such day of 2016 is a holiday of the PH base. Memoranda for 2016: CN-2016-0004, CN-2016-0012, CN-2016-0028, CN-2016-0040, CN-2016-0044, CN-2016-0049, CN-2016-0057, CN-2016-0064, CN-2016-0073, CN-2016-0077, CN-2016-0083 (https://documents.pse.com.ph/CircularOPSPDF/<no>.pdf). Issue date is that of CN-2016-0083."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE non-trading-day memoranda 2017 (CN series)" :year 2017
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2017-0078.pdf"
    :issued (2017 12 19) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2017-0078.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2017-0078.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "PSE announces each holiday by memorandum citing the presidential proclamations (regular holidays, nationwide special non-working days, Eid dates); every such day of 2017 is a holiday of the PH base. Memoranda for 2017: CN-2017-0014, CN-2017-0021, CN-2017-0026, CN-2017-0032, CN-2017-0041, CN-2017-0044, CN-2017-0053, CN-2017-0056, CN-2017-0061, CN-2017-0062, CN-2017-0065, CN-2017-0076, CN-2017-0078 (https://documents.pse.com.ph/CircularOPSPDF/<no>.pdf). Issue date is that of CN-2017-0078. 2017: no memorandum closes 8 Dec 2017 (Immaculate Conception became a holiday only from 2018, RA 10966); PSE issued CN-2017-0074 that day; ec closes it."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE non-trading-day memoranda 2018 (CN series)" :year 2018
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2018-0063.pdf"
    :issued (2018 12 21) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2018-0063.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2018-0063.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "PSE announces each holiday by memorandum citing the presidential proclamations (regular holidays, nationwide special non-working days, Eid dates); every such day of 2018 is a holiday of the PH base. Memoranda for 2018: CN-2018-0008, CN-2018-0018, CN-2018-0021, CN-2018-0025, CN-2018-0027, CN-2018-0033, CN-2018-0034, CN-2018-0039, CN-2018-0053, CN-2018-0059, CN-2018-0062, CN-2018-0063 (https://documents.pse.com.ph/CircularOPSPDF/<no>.pdf). Issue date is that of CN-2018-0063."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE non-trading-day memoranda 2019 (CN series)" :year 2019
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2019-0053.pdf"
    :issued (2019 11 26) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2019-0053.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2019-0053.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "PSE announces each holiday by memorandum citing the presidential proclamations (regular holidays, nationwide special non-working days, Eid dates); every such day of 2019 is a holiday of the PH base. Memoranda for 2019: CN-2019-0005, CN-2019-0014, CN-2019-0018, CN-2019-0019, CN-2019-0021, CN-2019-0025, CN-2019-0026, CN-2019-0039, CN-2019-0041, CN-2019-0048, CN-2019-0053 (https://documents.pse.com.ph/CircularOPSPDF/<no>.pdf). Issue date is that of CN-2019-0053."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE non-trading-day memoranda 2020 (CN series)" :year 2020
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2020-0098.pdf"
    :issued (2020 11 23) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2020-0098.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2020-0098.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "PSE announces each holiday by memorandum citing the presidential proclamations (regular holidays, nationwide special non-working days, Eid dates); every such day of 2020 is a holiday of the PH base. Memoranda for 2020: CN-2020-0003, CN-2020-0029, CN-2020-0040, CN-2020-0049, CN-2020-0050, CN-2020-0073, CN-2020-0074, CN-2020-0094, CN-2020-0097, CN-2020-0098 (https://documents.pse.com.ph/CircularOPSPDF/<no>.pdf). Issue date is that of CN-2020-0098."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE non-trading-day memoranda 2021 (CN series)" :year 2021
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2021-0060.pdf"
    :issued (2021 11 23) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2021-0060.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2021-0060.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "PSE announces each holiday by memorandum citing the presidential proclamations (regular holidays, nationwide special non-working days, Eid dates); every such day of 2021 is a holiday of the PH base. Memoranda for 2021: CN-2021-0006, CN-2021-0022, CN-2021-0031, CN-2021-0044, CN-2021-0045, CN-2021-0054, CN-2021-0060 (https://documents.pse.com.ph/CircularOPSPDF/<no>.pdf). Issue date is that of CN-2021-0060."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE non-trading-day memoranda 2022 (CN series)" :year 2022
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2022-0050.pdf"
    :issued (2022 12 23) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2022-0050.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2022-0050.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "PSE announces each holiday by memorandum citing the presidential proclamations (regular holidays, nationwide special non-working days, Eid dates); every such day of 2022 is a holiday of the PH base. Memoranda for 2022: CN-2022-0006, CN-2022-0018, CN-2022-0019, CN-2022-0028, CN-2022-0032, CN-2022-0038, CN-2022-0040, CN-2022-0046, CN-2022-0050 (https://documents.pse.com.ph/CircularOPSPDF/<no>.pdf). Issue date is that of CN-2022-0050. No memorandum found for Maundy Thursday / Good Friday 14-15 Apr 2022 (base closes them; ec too)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE non-trading-day memoranda 2023 (CN series)" :year 2023
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2023-0067.pdf"
    :issued (2023 12 13) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2023-0067.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2023-0067.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "PSE announces each holiday by memorandum citing the presidential proclamations (regular holidays, nationwide special non-working days, Eid dates); every such day of 2023 is a holiday of the PH base. Memoranda for 2023: CN-2023-0008, CN-2023-0013, CN-2023-0018, CN-2023-0019, CN-2023-0024, CN-2023-0029, CN-2023-0037, CN-2023-0052, CN-2023-0059, CN-2023-0065, CN-2023-0067 (https://documents.pse.com.ph/CircularOPSPDF/<no>.pdf). Issue date is that of CN-2023-0067."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE non-trading-day memoranda 2024 (CN series)" :year 2024
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2024-0059.pdf"
    :issued (2024 11 25) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2024-0059.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2024-0059.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "PSE announces each holiday by memorandum citing the presidential proclamations (regular holidays, nationwide special non-working days, Eid dates); every such day of 2024 is a holiday of the PH base. Memoranda for 2024: CN-2024-0007, CN-2024-0013, CN-2024-0018, CN-2024-0020, CN-2024-0026, CN-2024-0030, CN-2024-0032, CN-2024-0041, CN-2024-0045, CN-2024-0056, CN-2024-0059 (https://documents.pse.com.ph/CircularOPSPDF/<no>.pdf). Issue date is that of CN-2024-0059. CN-2024-0045 (16 Aug 2024) supersedes CN-2024-0041: Ninoy Aquino Day moved to 23 Aug 2024 (Proclamation 665); 21 Aug 2024 is a trading day."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE non-trading-day memoranda 2025 (CN series)" :year 2025
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2025-0043.pdf"
    :issued (2025 11 24) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2025-0043.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2025-0043.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "PSE announces each holiday by memorandum citing the presidential proclamations (regular holidays, nationwide special non-working days, Eid dates); every such day of 2025 is a holiday of the PH base. Memoranda for 2025: CN-2025-0010, CN-2025-0018, CN-2025-0020, CN-2025-0022, CN-2025-0033, CN-2025-0038, CN-2025-0043 (https://documents.pse.com.ph/CircularOPSPDF/<no>.pdf). Issue date is that of CN-2025-0043."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "PSE non-trading-day memoranda 2026 (CN series)" :year 2026
    :uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2026-0059.pdf"
    :issued (2026 11 23) :issued-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2026-0059.pdf"
    :published nil :published-uri "https://documents.pse.com.ph/CircularOPSPDF/CN-2026-0059.pdf"
    :published-in "PSE Memorandum (CN series), documents.pse.com.ph"
    :dates-note "PSE announces each holiday by memorandum citing the presidential proclamations (regular holidays, nationwide special non-working days, Eid dates); every such day of 2026 is a holiday of the PH base. Memoranda for 2026: CN-2026-0008, CN-2026-0010, CN-2026-0011, CN-2026-0016, CN-2026-0023, CN-2026-0027, CN-2026-0034, CN-2026-0043, CN-2026-0052, CN-2026-0059 (https://documents.pse.com.ph/CircularOPSPDF/<no>.pdf). Issue date is that of CN-2026-0059. CN-2026-0043/0044/0051: 16-18 Nov 2026 are regular trading days."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())))
