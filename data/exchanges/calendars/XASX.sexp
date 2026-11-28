;;;; XASX — ASX Trade (cash market) trading days.
;;;; Sources cached under ~/.cache/cl-stack-calendars/exchanges/xasx/ (wb-YYYY.html = Wayback snapshots of
;;;; asx.com.au/about/asx-trading-calendar-YYYY.htm; *.pdf = ASX Trade calendar PDFs; n-*.html = ASX Online notices).
;;;; Finding: every ASX calendar found (2009-2011, 2013-2018, 2020, 2022-2027) closes ASX Trade only on the
;;;; NATIONAL public holidays (listed "ALL" states): New Year's Day, Australia Day, Good Friday, Easter Monday,
;;;; ANZAC Day, Queen's/King's Birthday (2nd Monday of June, "ALL except WA"), Christmas Day, Boxing Day —
;;;; each with the observed/substitute weekday shown in the calendar. State-only holidays (Labour Day,
;;;; Melbourne Cup, Royal shows, WA Queen's Birthday, ...) are OPEN. => base = civil "AU" national subset
;;;; PLUS a rule for the June King's/Queen's Birthday (missing from AU; our current model = session there).
;;;; One-off closure: 2022-09-22 National Day of Mourning (notice 0984.22.09).
;;;; ANZAC Day on a weekend: substitute Monday CLOSED in 2010 (Mon 26 Apr 2010 "ANZAC Day Holiday"), but
;;;; OPEN in 2027 (Mon 26 Apr 2027 "OPEN, Substitute for Sunday 25 April"); 2011: Tue 26 Apr closed "in
;;;; recognition of the congruence of Anzac Day and Easter Monday". 2015/2020 (Saturday) no substitute.
;;;; => Anzac substitution is per-year: AU base has none; 2010-04-26 and 2011-04-26 are notice closures.
(:name "XASX"
 :title "ASX Trade (cash market) trading days"
 :authority "ASX, ASX Trade calendar (\"A Trading Day means ASX Trade is open for trading\"; \"ASX Limited reserves the right to declare additional Non-Business Days\") and yearly ASX Online notice \"ASX Trade - Trading calendar YYYY\" (\"lists national public holidays ... whether those public holidays are declared by ASX as being Trading/non-Trading Days\")"
 :authority-uri "https://www.asx.com.au/markets/market-resources/trading-hours-calendar/cash-market-trading-hours/trading-calendar"
 :bases ((:calendar "AU" :from nil :to nil
          :authority "ASX Trade calendars list exactly the national (\"ALL\" states) public holidays as CLOSED, with the same substitute Mondays/weekdays as the AU national subset (New Year's Day, Australia Day, Good Friday, Easter Monday, ANZAC Day, Christmas, Boxing Day; 2022-09-22 Day of Mourning). E.g. 2022: \"New Year's Day Monday 3 January3 CLOSED ... 3 Substitute for Saturday 1 January\" https://asxonline.com/content/dam/asxonline/public/notices/2021/September/ASXTrade2022attach.pdf ; 2020: \"Australia Day Monday 27 January ... As 26 Jan falls on a Sunday, the following Monday is observed\" https://www.asxonline.com/content/dam/asxonline/public/notices/2019/Sept/asx-trade-2020-calendar.pdf"))
 :rules ((:nth-weekday "Queen's / King's Birthday" 6 :monday 2
          :authority "ASX Trade calendars 2009-2027: \"Queen's Birthday Monday 8 June ALL except WA CLOSED\" (2009, https://web.archive.org/web/20110707053534/http://asx.com.au/about/asx-trading-calendar-2009.htm); \"King's Birthday Monday 10 June CLOSED\" (2024, https://asxonline.com/content/dam/asxonline/public/notices/2023/august/asx-trade-2024-calendar.pdf). Not in the AU national subset (state holiday; WA/QLD keep other dates) but ASX closes."))
 :notices
 ((:title "ASX Trading Calendar - 2009"
   :year 2009
   :uri "https://web.archive.org/web/20110707053534/http://asx.com.au/about/asx-trading-calendar-2009.htm"
   :issued nil :issued-uri nil
   :published (2011 7 7) :published-uri "https://web.archive.org/web/20110707053534/http://asx.com.au/about/asx-trading-calendar-2009.htm"
   :published-in "exchange website (Wayback snapshot)"
   :dates-note "Undated page; :published = Wayback capture date (page captured after the year). CLOSED: 1 Jan, 26 Jan, 10 Apr, 13 Apr, 8 Jun (Queen's Birthday, ALL except WA), 25 Dec, 28 Dec. ANZAC Day Sat 25 Apr: no weekday closure. Footnotes 21/22: \"Normal trading ceases at 14:10 (Sydney time)\"."
   :closed () :open ()
   :early-closes (((2009 12 24) (14 10) "Last Business Day before Christmas Day: Normal trading ceases at 14:10 (Sydney time)")
                  ((2009 12 31) (14 10) "Last Business Day of the Year: Normal trading ceases at 14:10 (Sydney time)"))
   :late-opens ())
  (:title "ASX Trading calendar - 2010"
   :year 2010
   :uri "https://web.archive.org/web/20110223195018/http://www.asx.com.au/about/asx-trading-calendar-2010.htm"
   :issued nil :issued-uri nil
   :published (2011 2 23) :published-uri "https://web.archive.org/web/20110223195018/http://www.asx.com.au/about/asx-trading-calendar-2010.htm"
   :published-in "exchange website (Wayback snapshot)"
   :dates-note "Undated page; :published = Wayback capture date. CLOSED: 1 Jan, 26 Jan, 2 Apr, 5 Apr, Mon 26 Apr (\"ANZAC Day Holiday\", ALL), 14 Jun, 27 Dec, 28 Dec."
   :closed (((2010 4 26) "ANZAC Day Holiday (Anzac Day Sunday 25 April)"))
   :open ()
   :early-closes (((2010 12 24) (14 10) "Normal trading ceases at 14:10 (Sydney time)")
                  ((2010 12 31) (14 10) "Normal trading ceases at 14:10 (Sydney time)"))
   :late-opens ())
  (:title "ASX Trading calendar - 2011"
   :year 2011
   :uri "https://web.archive.org/web/20110525134520/http://www.asx.com.au/about/asx-trading-calendar-2011.htm"
   :issued nil :issued-uri nil
   :published (2011 5 25) :published-uri "https://web.archive.org/web/20110525134520/http://www.asx.com.au/about/asx-trading-calendar-2011.htm"
   :published-in "exchange website (Wayback snapshot)"
   :dates-note "Undated page; :published = Wayback capture date. CLOSED: 3 Jan, 26 Jan, 22 Apr, Mon 25 Apr (Easter Monday / ANZAC Day Holiday), Tue 26 Apr (footnote 7: \"In recognition of the congruence of Anzac Day and Easter Monday\"), 13 Jun, 26 Dec, 27 Dec."
   :closed (((2011 4 26) "Easter Tuesday / Public Holiday (congruence of Anzac Day and Easter Monday)"))
   :open ()
   :early-closes (((2011 12 23) (14 10) "Normal trading ceases at 14:10 (Sydney time)")
                  ((2011 12 30) (14 10) "Normal trading ceases at 14:10 (Sydney time)"))
   :late-opens ())
  (:title "ASX Trading calendar - 2013"
   :year 2013
   :uri "https://web.archive.org/web/20131007101528/http://www.asx.com.au/about/asx-trading-calendar-2013.htm"
   :issued nil :issued-uri nil
   :published (2013 10 7) :published-uri "https://web.archive.org/web/20131007101528/http://www.asx.com.au/about/asx-trading-calendar-2013.htm"
   :published-in "exchange website (Wayback snapshot)"
   :dates-note "Undated page; :published = Wayback capture date. CLOSED: 1 Jan, Mon 28 Jan, 29 Mar, 1 Apr, 25 Apr, 10 Jun, 25 Dec, 26 Dec."
   :closed () :open ()
   :early-closes (((2013 12 24) (14 10) "Normal trading ceases at 14:10 (Sydney time)")
                  ((2013 12 31) (14 10) "Normal trading ceases at 14:10 (Sydney time)"))
   :late-opens ())
  (:title "ASX Trading calendar - 2014"
   :year 2014
   :uri "https://web.archive.org/web/20140627160402/http://www.asx.com.au/about/asx-trading-calendar-2014.htm"
   :issued nil :issued-uri nil
   :published (2014 6 27) :published-uri "https://web.archive.org/web/20140627160402/http://www.asx.com.au/about/asx-trading-calendar-2014.htm"
   :published-in "exchange website (Wayback snapshot)"
   :dates-note "Undated page; :published = Wayback capture date. CLOSED: 1 Jan, Mon 27 Jan, 18 Apr, 21 Apr, 25 Apr, 9 Jun, 25 Dec, 26 Dec."
   :closed () :open ()
   :early-closes (((2014 12 24) (14 10) "Normal trading ceases at 14:10 (Sydney time)")
                  ((2014 12 31) (14 10) "Normal trading ceases at 14:10 (Sydney time)"))
   :late-opens ())
  (:title "ASX Trading calendar - 2015"
   :year 2015
   :uri "https://web.archive.org/web/20150526072951/http://www.asx.com.au/about/asx-trading-calendar-2015.htm"
   :issued nil :issued-uri nil
   :published (2015 5 26) :published-uri "https://web.archive.org/web/20150526072951/http://www.asx.com.au/about/asx-trading-calendar-2015.htm"
   :published-in "exchange website (Wayback snapshot)"
   :dates-note "Undated page; :published = Wayback capture date. CLOSED: 1 Jan, 26 Jan, 3 Apr, 6 Apr, ANZAC Day Saturday 25 Apr (no substitute), 8 Jun, 25 Dec, Mon 28 Dec (Boxing Day)."
   :closed () :open ()
   :early-closes (((2015 12 24) (14 10) "Normal trading ceases at 14:10 (Sydney time)")
                  ((2015 12 31) (14 10) "Normal trading ceases at 14:10 (Sydney time)"))
   :late-opens ())
  (:title "ASX Trading calendar - 2016"
   :year 2016
   :uri "https://web.archive.org/web/20160707164311/http://www.asx.com.au/about/asx-trading-calendar-2016.htm"
   :issued nil :issued-uri nil
   :published (2016 7 7) :published-uri "https://web.archive.org/web/20160707164311/http://www.asx.com.au/about/asx-trading-calendar-2016.htm"
   :published-in "exchange website (Wayback snapshot); ASX Online event page for 23 Dec 2016"
   :dates-note "Undated page; :published = Wayback capture date. CLOSED: 1 Jan, 26 Jan, 25 Mar, 28 Mar, 25 Apr, 13 Jun, Mon 26 Dec (substitute for Sunday 25th), Tue 27 Dec. Early close confirmed by https://asxonline.com/content/asxonline/public/events/2016/dec/last-business-day-before-christmas-day-2016-operating-hours.html (\"ASX Market: Normal trading ceases at 14:10 (Sydney time)\")."
   :closed () :open ()
   :early-closes (((2016 12 23) (14 10) "Last Business Day before Christmas Day: Normal trading ceases at 14:10")
                  ((2016 12 30) (14 10) "Last Business Day of the Year: Normal trading ceases at 14:10"))
   :late-opens ())
  (:title "ASX Online notice 1357.16.11: Trading calendar 2017 (early-close policy change)"
   :year 2017
   :uri "https://asxonline.com/public/notices/2016/nov/1357.16.11.html"
   :issued (2016 11 15) :issued-uri "https://asxonline.com/public/notices/2016/nov/1357.16.11.html"
   :published (2016 11 15) :published-uri "https://asxonline.com/public/notices/2016/nov/1357.16.11.html"
   :published-in "ASX Online notice 1357.16.11"
   :dates-note "Notice text: \"From 2017 ASX will only close early when the last trading day before Christmas and New Year's Holidays are the respective Eve of these holidays. As such ASX trade will not observe an early close on the 22nd or 29th December 2017.\" Calendar page (Wayback https://web.archive.org/web/20170701181036/http://www.asx.com.au/about/asx-trading-calendar-2017.htm) lists CLOSED: Mon 2 Jan, 26 Jan, 14 Apr, 17 Apr, 25 Apr, 12 Jun, 25 Dec, 26 Dec and no CLOSE EARLY row."
   :closed () :open () :early-closes () :late-opens ())
  (:title "ASX Trading calendar - 2018"
   :year 2018
   :uri "https://web.archive.org/web/20171231173726/http://www.asx.com.au/about/asx-trading-calendar-2018.htm"
   :issued nil :issued-uri nil
   :published (2017 12 31) :published-uri "https://web.archive.org/web/20171231173726/http://www.asx.com.au/about/asx-trading-calendar-2018.htm"
   :published-in "exchange website (Wayback snapshot)"
   :dates-note "Undated page; :published = Wayback capture date. CLOSED: 1 Jan, 26 Jan, 30 Mar, 2 Apr, 25 Apr, 11 Jun, 25 Dec, 26 Dec."
   :closed () :open ()
   :early-closes (((2018 12 24) (14 10) "Normal trading ceases at 14:10 (Sydney time)")
                  ((2018 12 31) (14 10) "Normal trading ceases at 14:10 (Sydney time)"))
   :late-opens ())
  (:title "ASX Trade 2020 calendar"
   :year 2020
   :uri "https://www.asxonline.com/content/dam/asxonline/public/notices/2019/Sept/asx-trade-2020-calendar.pdf"
   :issued nil :issued-uri nil
   :published (2019 9 1) :published-uri "https://www.asxonline.com/content/dam/asxonline/public/notices/2019/Sept/asx-trade-2020-calendar.pdf"
   :published-in "ASX Online notice attachment"
   :dates-note "Attachment to a September 2019 notice (path .../notices/2019/Sept/); exact notice number/day not retrieved, :published day set to 1 Sep as month-level date. CLOSED: 1 Jan, Mon 27 Jan, 10 Apr, 13 Apr, ANZAC Sat 25 Apr, 8 Jun, 25 Dec, Mon 28 Dec."
   :closed () :open ()
   :early-closes (((2020 12 24) (14 10) "Normal trading ceases at 14:10 (Sydney time)")
                  ((2020 12 31) (14 10) "Normal trading ceases at 14:10 (Sydney time)"))
   :late-opens ())
  (:title "ASX Online notice 1639.21.11: ASX Trade trading hours for Christmas and New Year 2021/2022"
   :year 2021
   :uri "https://www.asxonline.com/public/notices/2021/November/1639.21.11.html"
   :issued (2021 11 17) :issued-uri "https://www.asxonline.com/public/notices/2021/November/1639.21.11.html"
   :published (2021 11 17) :published-uri "https://www.asxonline.com/public/notices/2021/November/1639.21.11.html"
   :published-in "ASX Online notice 1639.21.11"
   :dates-note "\"trading hours on Friday 24 December and Friday 31 December will be shortened. On 24 and 31 December, the CSPA for the Cash Markets will occur at 14:10:30±30 seconds.\" Mon 27 / Tue 28 Dec 2021 and Mon 3 Jan 2022 closed. The 2021 holiday list itself (notice 1320.20.10, https://asxonline.com/public/notices/2020/oct/1320.20.10.html) was found but its attachment was not retrieved."
   :closed () :open ()
   :early-closes (((2021 12 24) (14 10) "CSPA at 14:10:30±30s") ((2021 12 31) (14 10) "CSPA at 14:10:30±30s"))
   :late-opens ())
  (:title "ASX Trade - Trading calendar 2022 (notice 1287.21.09) + Christmas/New Year 2022/2023 (notice 1253.22.11)"
   :year 2022
   :uri "https://asxonline.com/content/dam/asxonline/public/notices/2021/September/ASXTrade2022attach.pdf"
   :issued (2021 9 17) :issued-uri "https://asxonline.com/public/notices/2021/September/1287.21.09.html"
   :published (2021 9 17) :published-uri "https://asxonline.com/public/notices/2021/September/1287.21.09.html"
   :published-in "ASX Online notice 1287.21.09 (attachment); notice 1253.22.11 (11 Nov 2022); reminder 1438.22.12"
   :dates-note "CLOSED: Mon 3 Jan (substitute for Sat 1 Jan), 26 Jan, 15 Apr, 18 Apr, 25 Apr, 13 Jun, 26 Dec, Tue 27 Dec (substitute for Sun 25 Dec). \"Last Business day before Christmas Day Friday 23 December OPEN\", \"Last Business day of the Year Friday 30 December OPEN\"; notice 1253.22.11: \"normal trading hours will apply on Friday 23 December and Friday 30 December\" https://asxonline.com/public/notices/2022/november/1253.22.11.html"
   :closed () :open () :early-closes () :late-opens ())
  (:title "ASX Online notice 0984.22.09: ASX to close on 22 September 2022 to observe National Day of Mourning and Public Holiday"
   :year 2022
   :uri "https://asxonline.com/public/notices/2022/september/0984.22.09.html"
   :issued (2022 9 12) :issued-uri "https://asxonline.com/public/notices/2022/september/0984.22.09.html"
   :published (2022 9 12) :published-uri "https://asxonline.com/public/notices/2022/september/0984.22.09.html"
   :published-in "ASX Online notice 0984.22.09"
   :dates-note "\"Australia will hold a National Day of Mourning and Public Holiday to commemorate Her Majesty, Queen Elizabeth II on Thursday 22 September 2022. As a result, ASX has declared that the ASX Trade Market will be closed on that day.\""
   :closed () :open () :early-closes () :late-opens ()
   :note "2022-09-22 is already produced by the AU base (National Day of Mourning rule); this notice is the exchange's confirmation.")
  (:title "ASX Trade 2023 calendar (notice attachment)"
   :year 2023
   :uri "https://asxonline.com/content/dam/asxonline/public/notices/2022/august/asx-trade-2023-notice-attachment.pdf"
   :issued nil :issued-uri nil
   :published (2022 8 1) :published-uri "https://asxonline.com/content/dam/asxonline/public/notices/2022/august/asx-trade-2023-notice-attachment.pdf"
   :published-in "ASX Online notice attachment (August 2022)"
   :dates-note "Notice number/day not retrieved; :published = month of the attachment path. CLOSED: Mon 2 Jan (substitute for Sun 1 Jan), 26 Jan, 7 Apr, 10 Apr, 25 Apr, 12 Jun, 25 Dec, 26 Dec. \"Last Business day before Christmas Day Friday 22 December OPEN\"; \"Last Business day of the Year Friday 29 December OPEN\" (no early close)."
   :closed () :open () :early-closes () :late-opens ())
  (:title "ASX Trade 2024 calendar (notice attachment)"
   :year 2024
   :uri "https://asxonline.com/content/dam/asxonline/public/notices/2023/august/asx-trade-2024-calendar.pdf"
   :issued nil :issued-uri nil
   :published (2023 8 1) :published-uri "https://asxonline.com/content/dam/asxonline/public/notices/2023/august/asx-trade-2024-calendar.pdf"
   :published-in "ASX Online notice attachment (August 2023)"
   :dates-note "Notice number/day not retrieved; :published = month of the attachment path. CLOSED: 1 Jan, 26 Jan, 29 Mar, 1 Apr, 25 Apr, King's Birthday 10 Jun, 25 Dec, 26 Dec. Early closes also in notice 1097.24.09 (25 Sep 2024): CSPA 14:10:30±30s https://asxonline.com/public/notices/2024/september/1097.24.09.html"
   :closed () :open ()
   :early-closes (((2024 12 24) (14 10) "Normal trading ceases at 14:10 (Sydney time)")
                  ((2024 12 31) (14 10) "Normal trading ceases at 14:10 (Sydney time)"))
   :late-opens ())
  (:title "ASX Trade - Trading calendar 2025 (notice 0957.24.08)"
   :year 2025
   :uri "https://asxonline.com/content/dam/asxonline/public/notices/2024/august/asx-trade-2025-attach.pdf"
   :issued (2024 8 22) :issued-uri "https://asxonline.com/public/notices/2024/august/0957.24.08.html"
   :published (2024 8 22) :published-uri "https://asxonline.com/public/notices/2024/august/0957.24.08.html"
   :published-in "ASX Online notice 0957.24.08 (attachment); Christmas notice 1402.25.11"
   :dates-note "CLOSED: 1 Jan, Mon 27 Jan, 18 Apr, 21 Apr, 25 Apr, 9 Jun, 25 Dec, 26 Dec. Notice 1402.25.11 (3 Nov 2025): \"On 24 and 31 December, the CSPA for the Cash Markets will occur at 14:10:00+30 seconds\" https://asxonline.com/public/notices/2025/november/1402.25.11.html"
   :closed () :open ()
   :early-closes (((2025 12 24) (14 10) "Normal trading ceases at 14:10 (Sydney time)")
                  ((2025 12 31) (14 10) "Normal trading ceases at 14:10 (Sydney time)"))
   :late-opens ())
  (:title "ASX Trade calendar 2026"
   :year 2026
   :uri "https://www.asx.com.au/markets/market-resources/trading-hours-calendar/cash-market-trading-hours/trading-calendar"
   :issued nil :issued-uri nil
   :published (2026 11 28) :published-uri "https://www.asx.com.au/markets/market-resources/trading-hours-calendar/cash-market-trading-hours/trading-calendar"
   :published-in "exchange website (live page, retrieved 2026-11-28)"
   :dates-note "Live page, undated; :published = retrieval date. CLOSED: 1 Jan, 26 Jan, 3 Apr, 6 Apr, ANZAC Sat 25 Apr, King's Birthday 8 Jun, 25 Dec, Mon 28 Dec."
   :closed () :open ()
   :early-closes (((2026 12 24) (14 10) "Normal trading ceases at 14:10 (Sydney time)")
                  ((2026 12 31) (14 10) "Normal trading ceases at 14:10 (Sydney time)"))
   :late-opens ())
  (:title "ASX Trade calendar 2027"
   :year 2027
   :uri "https://www.asx.com.au/markets/market-resources/trading-hours-calendar/cash-market-trading-hours/trading-calendar"
   :issued nil :issued-uri nil
   :published (2026 11 28) :published-uri "https://www.asx.com.au/markets/market-resources/trading-hours-calendar/cash-market-trading-hours/trading-calendar"
   :published-in "exchange website (live page, retrieved 2026-11-28)"
   :dates-note "Live page, undated; :published = retrieval date. CLOSED: 1 Jan, 26 Jan, 26 Mar, 29 Mar, King's Birthday 14 Jun, Mon 27 Dec (substitute for Sat 25 Dec), Tue 28 Dec (substitute for Sun 26 Dec). \"ANZAC Day Monday 26 April OPEN [3] Substitute for Sunday 25 April\"."
   :closed () :open ()
   :early-closes (((2027 12 24) (14 10) "Normal trading ceases at 14:10 (Sydney time)")
                  ((2027 12 31) (14 10) "Normal trading ceases at 14:10 (Sydney time)"))
   :late-opens ()))
 :gaps ((:years "2000-2008" :note "No ASX calendar page found for these years: the asx.com.au/about/asx-trading-calendar-YYYY.htm series starts with 2009 in Wayback; web.archive.org CDX queries timed out/were unreachable for most of the session, so older URL patterns could not be enumerated. Rules (national holidays + 2nd-Monday-June Queen's Birthday) assumed to apply; early closes before 2009 unknown.")
        (:years "2012, 2019" :note "Wayback snapshots of asx-trading-calendar-2012.htm / -2019.htm not retrievable (web.archive.org connection failures). 2019: only the ASX 24 calendar notice 1193.18.10 was found.")
        (:years "2021" :note "Holiday-list attachment of notice 1320.20.10 not retrieved; only the Christmas/New Year notice 1639.21.11.")
        (:years "2028" :note "Not yet published (live page shows 2026-2027).")))
