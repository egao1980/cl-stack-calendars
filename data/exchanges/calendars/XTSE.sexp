;;;; XTSE exchange trading-day calendar (#49).
;;;; Rules verified from Toronto Stock Exchange / TSX Group / TMX Group documents: TSE notices 2000-2006 (web.archive.org copies of
;;;; tse.com/tsx.com), the TSX/TMX 'Market Hours & Holidays' page 2008-2012, TMX news releases 2013-2026 and TMX Ops Notices
;;;; 2021-2026 (tsx.com), and the tsx.com Calendar page (2026, 2027). The rules reproduce every TMX-listed closure 2000-2027.
;;;; Remembrance Day and the National Day for Truth and Reconciliation are NOT closures (TMX: banking holidays only, TSX open).
;;;; Early close: Christmas Eve (weekday) 13:00, given per year below; New Year's Eve has regular hours (see XTSE-hours.md).

(:name "XTSE"
 :title "Toronto Stock Exchange trading days"
 :authority "TMX Group / TSX Inc., Toronto Stock Exchange market holidays (Calendars & Trading Hours) and holiday notices"
 :authority-uri "https://www.tsx.com/en/trading/calendars-and-trading-hours/calendar"
 :rules ((:fixed "New Year's Day" 1 1 :observed :substitute-next :authority "TSE/TSX/TMX holiday notices and lists 2000-2027; weekend New Year's Day closed the next Monday (2000-01-03, 2005-01-03, 2006-01-02, 2011-01-03, 2012-01-02, 2017-01-02, 2022-01-03, 2023-01-02)")
         (:nth-weekday "Family Day" 2 :monday 3 :from 2008 :authority "TSX Group Market Hours & Holidays 2008 (Family Day - February 18, 2008, new Ontario holiday); TMX Family Day closure releases 2013-2026")
         (:easter "Good Friday" -2 :authority "TSE/TSX/TMX Good Friday closure notices and releases 2001-2026")
         (:computed "Victoria Day" ca-victoria-day :authority "TSE/TSX/TMX Victoria Day closure notices and releases 2000-2026 (Monday before 25 May)")
         (:fixed "Canada Day" 7 1 :observed :substitute-next :authority "TSE/TSX/TMX Canada Day notices; Sunday/Saturday 1 July closed the next Monday (2001-07-02, 2006-07-03, 2012-07-02, 2017-07-03, 2018-07-02, 2023-07-03)")
         (:nth-weekday "Civic Holiday" 8 :monday 1 :authority "TSE/TSX/TMX Civic Holiday closure notices and releases 2001-2026")
         (:nth-weekday "Labour Day" 9 :monday 1 :authority "TSE/TSX/TMX Labour Day closure notices and releases 2000-2026")
         (:nth-weekday "Thanksgiving Day" 10 :monday 2 :authority "TSE/TSX/TMX Thanksgiving closure notices and releases 2001-2026")
         (:fixed "Christmas Day" 12 25 :observed :substitute-next :authority "TSE/TSX/TMX year-end notices and Holiday Operating Schedule releases 2001-2026; weekend Christmas closed in lieu (2004-12-27, 2005-12-27, 2010-12-27, 2011-12-26, 2016-12-26, 2021-12-27, 2022-12-26, 2027-12-27)")
         (:fixed "Boxing Day" 12 26 :observed :substitute-next :authority "TSE/TSX/TMX year-end notices and releases; weekend Boxing Day closed in lieu (2004-12-28, 2009-12-28, 2010-12-28, 2015-12-28, 2016-12-27, 2020-12-28, 2021-12-28, 2026-12-28, 2027-12-28)"))
 :rules-note ":observed :substitute-next = keep the nominal date and add the next weekday not already a holiday (DEFINE-CALENDAR semantics). This yields TMX's in-lieu days: Christmas on Saturday -> Mon 27 + Boxing Tue 28; Christmas on Sunday -> Boxing Mon 26 + Christmas-in-lieu Tue 27 (TMX labels Mon 26 'Christmas (in lieu)', Tue 27 'Boxing Day (in lieu)'; same dates). Victoria Day uses the existing ca-victoria-day."
 :notices (
   (:title "TSE Notice to Members 99-189: Revised Christmas closings 1999/2000" :year 2000
    :uri "https://web.archive.org/web/2001id_/http://tse.com:80/mregs/notices/930252793__Christmas.Holidays.1999.2000.html"
    :issued (1999 6 25) :issued-uri "https://web.archive.org/web/2001id_/http://tse.com:80/mregs/notices/930252793__Christmas.Holidays.1999.2000.html"
    :published (1999 6 25) :published-uri "https://web.archive.org/web/2001id_/http://tse.com:80/mregs/notices/930252793__Christmas.Holidays.1999.2000.html"
    :published-in "TSE Notice to Members 99-189 (Board of Governors order of 22 June 1999)"
    :dates-note "Closed Mon 27 and Tue 28 Dec 1999 (in lieu of Christmas/Boxing Day) and Mon 3 Jan 2000 (in lieu of New Year's Day); Fri 24 and Fri 31 Dec 1999 closed at 1:00 p.m. Only the 3 Jan 2000 closure is in range; it is produced by the New Year's Day :substitute-next rule."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "TSE Notice 2000-140: Exchange closing - Victoria Day" :year 2000
    :uri "https://web.archive.org/web/2001id_/http://www.tse.com:80/mregs/notices/956949986__Notice.to.Members.Re-May.22.Holiday.html"
    :issued (2000 4 25) :issued-uri "https://web.archive.org/web/2001id_/http://www.tse.com:80/mregs/notices/956949986__Notice.to.Members.Re-May.22.Holiday.html"
    :published (2000 4 25) :published-uri "https://web.archive.org/web/2001id_/http://www.tse.com:80/mregs/notices/956949986__Notice.to.Members.Re-May.22.Holiday.html"
    :published-in "TSE Regulatory Notice to Participating Organizations 2000-140"
    :dates-note "Closed Mon 22 May 2000 (Victoria Day). Also notice 2000-158 (4 May 2000, operating schedule) in :also-uris."
    :also-uris ("https://web.archive.org/web/2001id_/http://www.tse.com:80/mregs/notices/957467665__050400-Victoria.Day-T&S.html")
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "TSE Notice 2000-234: Exchange closing - Civic Holiday" :year 2000
    :uri "https://web.archive.org/web/2001id_/http://www.tse.com:80/mregs/notices/jul10-civic.html"
    :issued (2000 7 10) :issued-uri "https://web.archive.org/web/2001id_/http://www.tse.com:80/mregs/notices/jul10-civic.html"
    :published (2000 7 10) :published-uri "https://web.archive.org/web/2001id_/http://www.tse.com:80/mregs/notices/jul10-civic.html"
    :published-in "TSE Regulatory Notice to Participating Organizations 2000-234"
    :dates-note "Closed Mon 7 Aug 2000 (Civic Holiday)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "TSE Notice 2000-279: Exchange closing - Labour Day" :year 2000
    :uri "https://web.archive.org/web/2001id_/http://www.tse.com:80/mregs/notices/965761827__Notice.to.Members.Re-Labour.Day.(Sept.4).html"
    :issued (2000 8 8) :issued-uri "https://web.archive.org/web/2001id_/http://www.tse.com:80/mregs/notices/965761827__Notice.to.Members.Re-Labour.Day.(Sept.4).html"
    :published (2000 8 8) :published-uri "https://web.archive.org/web/2001id_/http://www.tse.com:80/mregs/notices/965761827__Notice.to.Members.Re-Labour.Day.(Sept.4).html"
    :published-in "TSE Regulatory Notice to Participating Organizations 2000-279"
    :dates-note "Closed Mon 4 Sep 2000 (Labour Day)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "TSE Notice 2001-228: Year-end holiday closings 2001/2002" :year 2001
    :uri "https://web.archive.org/web/2010id_/http://www.tsx.com:80/en/pdf/notices/2001/999016868__27Aug01.Holiday.Schedule..228.kd.pdf"
    :issued (2001 8 27) :issued-uri "https://web.archive.org/web/2010id_/http://www.tsx.com:80/en/pdf/notices/2001/999016868__27Aug01.Holiday.Schedule..228.kd.pdf"
    :published (2001 8 27) :published-uri "https://web.archive.org/web/2010id_/http://www.tsx.com:80/en/pdf/notices/2001/999016868__27Aug01.Holiday.Schedule..228.kd.pdf"
    :published-in "TSE Notice to Participating Organizations 2001-228"
    :dates-note "Closed 25 Dec 2001, 26 Dec 2001, 1 Jan 2002; 'the Exchange will close at 1:00 p.m. on Monday, December 24th, 2001. Regular business hours will be in effect on Monday, December 31, 2001.' Other 2001 closing notices in :also-uris: 2001-084 Good Friday 13 Apr, 2001-117 Victoria Day 21 May, 2001-154/159 Canada Day Mon 2 Jul (1 Jul a Sunday), 2001-194/204 Civic Holiday 6 Aug, 2001-218/219 Labour Day 3 Sep, 2001-243 Thanksgiving 8 Oct; 2001-284 (5 Nov 2001) Remembrance Day 12 Nov is a banking holiday only, Nov 12 listed as a trade date. New Year's Day 1 Jan 2001: no notice found."
    :also-uris ("https://web.archive.org/web/2010id_/http://www.tsx.com:80/en/pdf/notices/2001/986241282__040201-good.friday.notice.to.PO's-md.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/2001/988826785__2May01.Victoria.Day.Closing.kd.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com:80/en/pdf/notices/2001/992356675__12June01CanadaDay.Closing.kd.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com:80/en/pdf/notices/2001/992622879__15June01.Cdn.Day.Operating.Schedule..159.-.kd.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/2001/994956554__12July01.CivicHoliday..194.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com:80/en/pdf/notices/2001/996260989__27.July.01.CivicDayHoliday.Aug.6..204.kd.pdf"
                "https://web.archive.org/web/2010id_/http://tsx.com:80/en/pdf/notices/2001/997726961__13.Aug.01.Labour.Day.Holiday..218.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com:80/en/pdf/notices/2001/997808686__14.Aug.01.Labour.Day.Holiday..219.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com:80/en/pdf/notices/2001/999880921__7.Sept.01.Thanksgiving..243.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com:80/en/pdf/notices/2001/1004979587__5.Nov.01.Operating.Schedule..284.pdf")
    :closed ()
    :open ()
    :early-closes (((2001 12 24) (13 0) "Christmas Eve: close 13:00"))
    :late-opens ())
   (:title "TSE press releases: market closed 11 Sep 2001, remains closed 12 Sep, reopens 13 Sep 2001" :year 2001
    :uri "https://mondovisione.com/news/toronto-stock-exchange-market-is-closed-2011124"
    :issued (2001 9 11) :issued-uri "https://mondovisione.com/news/toronto-stock-exchange-market-is-closed-2011124"
    :published (2001 9 11) :published-uri "https://mondovisione.com/news/toronto-stock-exchange-market-is-closed-2011124"
    :published-in "TSE press releases (reproduced by Mondo Visione)"
    :confidence :secondary
    :dates-note "'In response to the events today in the United States, the Toronto Stock Exchange has closed' (11 Sep 2001; trading had opened and was halted in the morning - the release quotes the TSE 300 'at the close of trading'). 12 Sep 2001 release: 'the TSE will reopen both markets in the usual manner on Thursday, September 13, 2001.' No TSE original found (2001 notice series 2001-244..245 has no closure notice). Treated as closed both days, matching ec."
    :also-uris ("https://mondovisione.com/news/toronto-stock-exchange-cdnx-to-reopen-thursday-september-13-2001-2011124")
    :closed (((2001 9 11) "Markets closed after the 11 September attacks (halted in the morning)") ((2001 9 12) "Markets closed after the 11 September attacks"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "TSE Notice 2002-241: Year-end holiday closings 2002/2003" :year 2002
    :uri "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/November13-2002_ChristmasNewYearClosing-241.pdf"
    :issued (2002 11 13) :issued-uri "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/November13-2002_ChristmasNewYearClosing-241.pdf"
    :published (2002 11 13) :published-uri "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/November13-2002_ChristmasNewYearClosing-241.pdf"
    :published-in "TSE Notice to Participating Organizations 2002-241"
    :dates-note "Closed 25, 26 Dec 2002 and 1 Jan 2003; 'the Exchange will close at 1:00 p.m. (EST) on Tuesday, December 24th, 2002. Regular business hours will be in effect on Tuesday, December 31, 2002.' Notice 2002-262 (11 Dec 2002): Extended Trading Session until 1:30 p.m. on 24 Dec. Other 2002 notices in :also-uris: 2002-068/074 Good Friday 29 Mar, 2002-127 Victoria Day 20 May, 2002-135/151 Canada Day 1 Jul, 2002-179/181 Civic Holiday 5 Aug, 2002-186/196 Labour Day 2 Sep, 2002-206/222 Thanksgiving 14 Oct; 2002-234: 'TSX Markets will be opened as usual on Monday, November 11, 2002' (banking holiday only). New Year's Day 1 Jan 2002 from notice 2001-228."
    :also-uris ("https://web.archive.org/web/2005id_/http://www.tsx.com/en/pdf/notices/December11-2002_ChangeinOperatingSchedule-262.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/March19-ExchangeClosingsGoodFriday-068.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/March25-ChangeinOperatingSchedule-EasterHoliday-074.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/May9-2002-VictoriaDayHoliday-127.pdf"
                "https://web.archive.org/web/2010id_/http://tsx.com:80/en/pdf/notices/June3-2002_CanadaDayClosing-135.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/June25-2002_CanadaDayHoliday-151.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/July30-2002_CivicHoliday-179.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/July30-2002_ChangeInOperatingScheduleForCivicHoliday-181.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/August7-2002_LabourDayHoliday-186.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/August23-2002_LabourDayHolidaySchedule-196.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/September9-2002_ThanksgivingDay-206.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/October4-2002_ThanksgivingHoliday-222.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/November1-2002_ChangeInOperatingSchedule-234.pdf")
    :closed ()
    :open ()
    :early-closes (((2002 12 24) (13 0) "Christmas Eve: close 13:00"))
    :late-opens ())
   (:title "TSX Notice 2003-173: Year-end holiday closings 2003/2004" :year 2003
    :uri "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/November26-2003_YearEndHolidayClosings-173.pdf"
    :issued (2003 11 26) :issued-uri "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/November26-2003_YearEndHolidayClosings-173.pdf"
    :published (2003 11 26) :published-uri "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/November26-2003_YearEndHolidayClosings-173.pdf"
    :published-in "TSX Notice to Participating Organizations (and Members) 2003-173"
    :dates-note "Closed 25, 26 Dec 2003 and 1 Jan 2004; 'the Exchange will close at 1:00 p.m. (EST) on Wednesday, December 24th, 2003' with a 30-minute last-sale session to 1:30 p.m.; 'Regular business hours will be in effect on Wednesday, December 31, 2003.' Other 2003 notices in :also-uris: 2003-175 (12 Dec) year-end schedule, 2003-058 Good Friday 18 Apr, 2003-073 Victoria Day 19 May, 2003-089/103 Canada Day 1 Jul, 2003-132 Civic Holiday 4 Aug, 2003-147 Labour Day 1 Sep, 2003-158 Thanksgiving 13 Oct. New Year's Day 1 Jan 2003 from notices 2002-241/262."
    :also-uris ("https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/December12-2003_ChangeinOperatingSchedule-175.pdf"
                "https://web.archive.org/web/2010id_/http://tsx.com:80/en/pdf/notices/April9-2003_ChangeInOperatingSchedule-058.pdf"
                "https://web.archive.org/web/2003id_/http://www.tsx.com/en/pdf/notices/May12-2003_VictoriaDayHoliday-073.pdf"
                "https://web.archive.org/web/2010id_/http://tsx.com:80/en/pdf/notices/June10-2003_CanadaDayClosing-089.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/June24-2003_ChangeInOperatingSchedule-103.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/July30-2003_ChangeInOperatingSchedule-132.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/August22-2003_ChangeInOperatingSchedule-LabourDay-147.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/September10-2003_ThanksgivingDay-158.pdf")
    :closed ()
    :open ()
    :early-closes (((2003 12 24) (13 0) "Christmas Eve: close 13:00"))
    :late-opens ())
   (:title "TSX Notice 2004-036: Change in operating schedule for the Christmas and New Year's Day holiday" :year 2004
    :uri "https://web.archive.org/web/2005id_/http://www.tsx.com:80/en/pdf/notices/December3-2004_YearEndHolidaySettlementsBulletin-036.pdf"
    :issued (2004 12 3) :issued-uri "https://web.archive.org/web/2005id_/http://www.tsx.com:80/en/pdf/notices/December3-2004_YearEndHolidaySettlementsBulletin-036.pdf"
    :published (2004 12 3) :published-uri "https://web.archive.org/web/2005id_/http://www.tsx.com:80/en/pdf/notices/December3-2004_YearEndHolidaySettlementsBulletin-036.pdf"
    :published-in "TSX Notice to Participating Organizations (and Members) 2004-036"
    :dates-note "Closed Mon 27 and Tue 28 Dec 2004 (Christmas Day and Boxing Day on Sat/Sun) and Mon 3 Jan 2005 (New Year's Day on Sat); 'will close at 1:00 PM on Friday, December 24, 2004, with an Extended Trading Session until 1:30 p.m.' Other 2004 notices in :also-uris: 2004-009 Good Friday 9 Apr, 2004-016 Victoria Day 24 May, 2004-020 Civic Holiday 2 Aug, 2004-028 Thanksgiving 11 Oct; 2004-033: 'TSX Markets will be open for business as usual on Thursday, November 11, 2004' (banking holiday). New Year's Day 1 Jan 2004 from 2003-173/175. Canada Day (1 Jul) and Labour Day (6 Sep) 2004: notices not retrievable (Labour Day notice 2004-024 listed in the web archive but not served)."
    :also-uris ("https://web.archive.org/web/2004id_/http://www.tsx.com:80/en/pdf/notices/March5-2004_EasterHoliday-009.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com:80/en/pdf/notices/May17-2004_VictoriaDayHoliday-016.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com:80/en/pdf/notices/July22-2004_CivicDaySettlements-020.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com:80/en/pdf/notices/October4-2004_ThanksgivingDayHoliday-028.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com:80/en/pdf/notices/November4-2004_RemembranceDaySettlementSchedule-033.pdf")
    :closed ()
    :open ()
    :early-closes (((2004 12 24) (13 0) "Christmas Eve: close 13:00"))
    :late-opens ())
   (:title "TSX Notice 2005-043: Change in operating schedule for the Christmas and New Year's Day holidays" :year 2005
    :uri "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/December19-2005_ChristmasNewYears-043.pdf"
    :issued (2005 12 19) :issued-uri "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/December19-2005_ChristmasNewYears-043.pdf"
    :published (2005 12 19) :published-uri "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/December19-2005_ChristmasNewYears-043.pdf"
    :published-in "TSX Notice to Participating Organizations (and Members) 2005-043"
    :dates-note "Closed Mon 26 and Tue 27 Dec 2005 (Christmas Day on Sunday) and Mon 2 Jan 2006; 'the Exchanges will be open for business as usual on Friday, December 23, 2005 and Friday, December 30, 2005' (no early close). Other 2005 notices in :also-uris: 2005-011 Good Friday 25 Mar, 2005-016 Victoria Day 23 May, 2005-019 Canada Day 1 Jul, 2005-026 Civic Holiday 1 Aug, 2005-031 Labour Day 5 Sep. New Year's Day: Mon 3 Jan 2005 from notice 2004-036. Thanksgiving 10 Oct 2005: notice 2005-034 listed in the web archive but not retrievable."
    :also-uris ("https://web.archive.org/web/2010id_/http://www.tsx.com:80/en/pdf/notices/March16-2005_GoodFridayHoliday-011.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/May17-2005_VictoriaDayHoliday-016.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com:80/en/pdf/notices/June24-05_CanadaDayHolidaySettlementDates-019.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/July22-2005_CivicDayHoliday-026.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/August24-2005_LabourDayHoliday-031.pdf")
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "TSX Group news release 13 Dec 2005: Christmas holiday closures and 2006 stock exchange holiday schedule" :year 2006
    :uri "https://web.archive.org/web/2006id_/http://www.tsx.com/en/news_events/news_releases/12-13-2005_TSX-ChristmasHolidayClosures.html"
    :issued (2005 12 13) :issued-uri "https://web.archive.org/web/2006id_/http://www.tsx.com/en/news_events/news_releases/12-13-2005_TSX-ChristmasHolidayClosures.html"
    :published (2005 12 13) :published-uri "https://web.archive.org/web/2006id_/http://www.tsx.com/en/news_events/news_releases/12-13-2005_TSX-ChristmasHolidayClosures.html"
    :published-in "TSX Group news release"
    :dates-note "Holiday schedule 2006: New Year's Day Mon 2 Jan (in lieu of Sun 1 Jan), Good Friday 14 Apr, Victoria Day 22 May, Canada Day Mon 3 Jul (in lieu of Sat 1 Jul), Civic Day 7 Aug, Labour Day 4 Sep, Thanksgiving 9 Oct, Christmas Day 25 Dec, Boxing Day 26 Dec. Confirmed by notices 2006-020 (Victoria), 2006-025 (Canada Day 3 Jul), 2006-026 (Civic), 2006-030 (Labour), 2006-033 (Thanksgiving), release of 3 Apr 2006 (Good Friday) and release of 15 Dec 2006 ('closed ... Monday, December 25 and Tuesday, December 26, 2006 ... Monday, January 1, 2007 ... regular trading hours on Friday, December 22 and Friday December 29, 2006')."
    :also-uris ("https://web.archive.org/web/2006id_/http://www.tsx.com/en/news_events/news_releases/4-3-2006_TSX-GoodFridayHoliday.html"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/May15-2006_VictoriaDayHoliday-020.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/June26-2006_CanadaDayHoliday-025.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/July28-2006_CivicDayHoliday-026.pdf"
                "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/August28-2006_LabourDayHoliday-030.pdf"
                "https://web.archive.org/web/2006id_/http://www.tsx.com/en/pdf/notices/October2-2006_ThanksgivingDay-033.pdf"
                "https://web.archive.org/web/2007id_/http://www.tsx.com/en/news_events/news_releases/12-15-2006_TSX-ChristmasNewYearsClosures.html")
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "TSX Group news release 11 May 2007: Victoria Day holiday closures" :year 2007
    :uri "https://web.archive.org/web/2007id_/http://tsx.com:80/en/news_events/news_releases/5-11-2007_TSX-VictoriaDayHoliday.html"
    :issued (2007 5 11) :issued-uri "https://web.archive.org/web/2007id_/http://tsx.com:80/en/news_events/news_releases/5-11-2007_TSX-VictoriaDayHoliday.html"
    :published (2007 5 11) :published-uri "https://web.archive.org/web/2007id_/http://tsx.com:80/en/news_events/news_releases/5-11-2007_TSX-VictoriaDayHoliday.html"
    :published-in "TSX Group news release"
    :dates-note "Closed Mon 21 May 2007 (Victoria Day). New Year's Day Mon 1 Jan 2007 from the release of 15 Dec 2006. No other 2007 TSX holiday document found (no 2007 year-end release or notice in the web archive); the remaining 2007 dates follow the rules."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "TSX Group 'Stock Market Hours & Holidays' page (2008 and 2009 holidays)" :year 2008
    :uri "https://web.archive.org/web/20081121id_/http://www.tsx.com/en/about_tsx/market_hours.html"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20081121id_/http://www.tsx.com/en/about_tsx/market_hours.html"
    :published-in "tsx.com Market Hours & Holidays page (web.archive.org snapshot 2008-11-21)"
    :dates-note "2008: New Year's Day 1 Jan, Family Day 18 Feb, Good Friday 21 Mar, Victoria Day 19 May, Canada Day 1 Jul, Civic Day 4 Aug, Labour Day 1 Sep, Thanksgiving 13 Oct, 'Christmas Eve - December 24, 2008 - markets close at 1:00 p.m. ET', Christmas 25 Dec, Boxing Day 26 Dec. 2009 list on the same page: 1 Jan, Family Day 16 Feb, Good Friday 10 Apr, Victoria Day 18 May, Canada Day 1 Jul, Civic Day 3 Aug, Labour Day 7 Sep, Thanksgiving 12 Oct, Christmas 25 Dec, Boxing Day Mon 28 Dec (in lieu of 26 Dec). Family Day first closed 2008 (new Ontario holiday). Page undated; snapshot date is the upper bound of publication. No 2009 Christmas-Eve hours found. Page carries no issue date (snapshot/fetch date is an upper bound)."
    :closed ()
    :open ()
    :early-closes (((2008 12 24) (13 0) "Christmas Eve: close 13:00"))
    :late-opens ())
   (:title "TSX Group 'Stock Market Hours & Holidays' page (2009 holidays)" :year 2009
    :uri "https://web.archive.org/web/20081121id_/http://www.tsx.com/en/about_tsx/market_hours.html"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20081121id_/http://www.tsx.com/en/about_tsx/market_hours.html"
    :published-in "tsx.com Market Hours & Holidays page (web.archive.org snapshot 2008-11-21)"
    :dates-note "2009 list (see the 2008 notice for the dates): matches the rules. Christmas Eve 2009 (Thursday) hours not stated on this snapshot; no later 2009 TMX document found (12-2-2009 holiday-schedule release listed in the archive but not served). Page carries no issue date (snapshot/fetch date is an upper bound)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "TMX Group 'Stock Market Hours & Holidays' page (2010 and 2011 holidays)" :year 2010
    :uri "https://web.archive.org/web/20101130id_/http://tmx.com/en/about_tsx/market_hours.html"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20101130id_/http://tmx.com/en/about_tsx/market_hours.html"
    :published-in "tmx.com Market Hours & Holidays page (web.archive.org snapshot 2010-11-30)"
    :dates-note "2010: 1 Jan, Family Day 15 Feb, Good Friday 2 Apr, Victoria Day 24 May, Canada Day 1 Jul, Civic Day 2 Aug, Labour Day 6 Sep, Thanksgiving 11 Oct, Christmas Day Mon 27 Dec (in lieu of 25 Dec), Boxing Day Tue 28 Dec (in lieu of 26 Dec); 'the TSX and the TSX Venture Markets will close at 1:00 p.m. on Friday, December 24, 2010. The Extended Hours will begin at 1:10 p.m. until 1:30 p.m.'; 'On December 31, 2010 regular trading hours will be observed.' 2011 list: New Year's Day Mon 3 Jan, Family Day 21 Feb, Good Friday 22 Apr, Victoria Day 23 May, Canada Day 1 Jul, Civic Holiday 1 Aug, Labour Day 5 Sep, Thanksgiving 10 Oct, Christmas Mon 26 Dec (in lieu of 25 Dec), Boxing Day Tue 27 Dec (in lieu of 26 Dec). Page carries no issue date (snapshot/fetch date is an upper bound)."
    :closed ()
    :open ()
    :early-closes (((2010 12 24) (13 0) "Christmas Eve: close 13:00"))
    :late-opens ())
   (:title "TMX Group 'Stock Market Hours & Holidays' page (2011 and 2012 holidays)" :year 2011
    :uri "https://web.archive.org/web/20111004id_/http://tmx.com/en/about_tsx/market_hours.html"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20111004id_/http://tmx.com/en/about_tsx/market_hours.html"
    :published-in "tmx.com Market Hours & Holidays page (web.archive.org snapshot 2011-10-04)"
    :dates-note "2011 list as on the 2010-11-30 snapshot (matches the rules; 24 Dec 2011 a Saturday). 2012 list: New Year's Day Mon 2 Jan (in lieu of 1 Jan), Family Day 20 Feb, Good Friday 6 Apr, Victoria Day 21 May, Canada Day Mon 2 Jul (in lieu of 1 Jul), Civic Holiday 6 Aug, Labour Day 3 Sep, Thanksgiving 8 Oct, Christmas 25 Dec, Boxing Day 26 Dec. Page carries no issue date (snapshot/fetch date is an upper bound)."
    :also-uris ("https://web.archive.org/web/20120113id_/http://tmx.com/en/about_tsx/market_hours.html")
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "TMX Group news release 28 Nov 2012: Holiday Operating Schedule" :year 2012
    :uri "https://web.archive.org/web/2013id_/http://tmx.com/en/news_events/news/news_releases/2012/11-28-2012_TMXGroup-TMX-Group-Holiday-Operating-Schedule.html"
    :issued (2012 11 28) :issued-uri "https://web.archive.org/web/2013id_/http://tmx.com/en/news_events/news/news_releases/2012/11-28-2012_TMXGroup-TMX-Group-Holiday-Operating-Schedule.html"
    :published (2012 11 28) :published-uri "https://web.archive.org/web/2013id_/http://tmx.com/en/news_events/news/news_releases/2012/11-28-2012_TMXGroup-TMX-Group-Holiday-Operating-Schedule.html"
    :published-in "TMX Group news release"
    :dates-note "Closed 25 Dec 2012, 26 Dec 2012, 1 Jan 2013; TSX/TSXV 'Monday, December 24, 2012 Open until 1:00 p.m. (EST)'; 'Monday, December 31, 2012 Open'. The 2012 list on the tmx.com Market Hours & Holidays page (snapshots 2011-10-04, 2012-01-13, :also-uris) gives the other 2012 closures; it also lists 2013."
    :also-uris ("https://web.archive.org/web/20111004id_/http://tmx.com/en/about_tsx/market_hours.html"
                "https://web.archive.org/web/20120113id_/http://tmx.com/en/about_tsx/market_hours.html")
    :closed ()
    :open ()
    :early-closes (((2012 12 24) (13 0) "Christmas Eve: close 13:00"))
    :late-opens ())
   (:title "TMX Group news release: Holiday Operating Schedule 2013, with the 2013 holiday closure releases" :year 2013
    :uri "https://www.tsx.com/en/news?id=96"
    :issued (2013 12 3) :issued-uri "https://www.tsx.com/en/news?id=96"
    :published (2013 12 3) :published-uri "https://www.tsx.com/en/news?id=96"
    :published-in "TMX Group news release (tsx.com/en/news)"
    :dates-note "December release: Christmas/Boxing Day 2013 and New Year's Day 2014 closures (with in-lieu days). Christmas Eve TSX/TSXV 'Open until 1:00 p.m. (EST)'. 31 Dec listed 'Open' (regular hours). Per-holiday closure releases of 2013 (Family Day, Good Friday, Victoria Day, Canada Day, Civic Holiday, Labour Day, Thanksgiving) in :also-uris; all dates match the rules. Issue dates are in each release (dateline)."
    :also-uris ("https://www.tsx.com/en/news?id=32"
                "https://www.tsx.com/en/news?id=55"
                "https://www.tsx.com/en/news?id=67"
                "https://www.tsx.com/en/news?id=73"
                "https://www.tsx.com/en/news?id=79"
                "https://www.tsx.com/en/news?id=87")
    :closed ()
    :open ()
    :early-closes (((2013 12 24) (13 0) "Christmas Eve: close 13:00"))
    :late-opens ())
   (:title "TMX Group news release: Holiday Operating Schedule 2014, with the 2014 holiday closure releases" :year 2014
    :uri "https://www.tsx.com/en/news?id=191"
    :issued (2014 12 2) :issued-uri "https://www.tsx.com/en/news?id=191"
    :published (2014 12 2) :published-uri "https://www.tsx.com/en/news?id=191"
    :published-in "TMX Group news release (tsx.com/en/news)"
    :dates-note "December release: Christmas/Boxing Day 2014 and New Year's Day 2015 closures (with in-lieu days). Christmas Eve TSX/TSXV 'Open until 1:00 p.m. (EST)'. 31 Dec listed 'Open' (regular hours). Per-holiday closure releases of 2014 (Family Day, Good Friday, Victoria Day, Canada Day, Civic Holiday, Labour Day, Thanksgiving) in :also-uris; all dates match the rules. Issue dates are in each release (dateline)."
    :also-uris ("https://www.tsx.com/en/news?id=107"
                "https://www.tsx.com/en/news?id=127"
                "https://www.tsx.com/en/news?id=137"
                "https://www.tsx.com/en/news?id=150"
                "https://www.tsx.com/en/news?id=156"
                "https://www.tsx.com/en/news?id=162")
    :closed ()
    :open ()
    :early-closes (((2014 12 24) (13 0) "Christmas Eve: close 13:00"))
    :late-opens ())
   (:title "TMX Group news release: Holiday Operating Schedule 2015, with the 2015 holiday closure releases" :year 2015
    :uri "https://www.tsx.com/en/news?id=294"
    :issued (2015 12 1) :issued-uri "https://www.tsx.com/en/news?id=294"
    :published (2015 12 1) :published-uri "https://www.tsx.com/en/news?id=294"
    :published-in "TMX Group news release (tsx.com/en/news)"
    :dates-note "December release: Christmas/Boxing Day 2015 and New Year's Day 2016 closures (with in-lieu days). Christmas Eve TSX/TSXV 'Open until 1:00 p.m. (EST)'. 31 Dec listed 'Open' (regular hours). Per-holiday closure releases of 2015 (Family Day, Good Friday, Victoria Day, Canada Day, Civic Holiday, Labour Day, Thanksgiving) in :also-uris; all dates match the rules. Issue dates are in each release (dateline)."
    :also-uris ("https://www.tsx.com/en/news?id=200"
                "https://www.tsx.com/en/news?id=220"
                "https://www.tsx.com/en/news?id=233"
                "https://www.tsx.com/en/news?id=245"
                "https://www.tsx.com/en/news?id=256"
                "https://www.tsx.com/en/news?id=264"
                "https://www.tsx.com/en/news?id=274")
    :closed ()
    :open ()
    :early-closes (((2015 12 24) (13 0) "Christmas Eve: close 13:00"))
    :late-opens ())
   (:title "TMX Group news release: Holiday Operating Schedule 2016, with the 2016 holiday closure releases" :year 2016
    :uri "https://www.tsx.com/en/news?id=433"
    :issued (2016 11 30) :issued-uri "https://www.tsx.com/en/news?id=433"
    :published (2016 11 30) :published-uri "https://www.tsx.com/en/news?id=433"
    :published-in "TMX Group news release (tsx.com/en/news)"
    :dates-note "December release: Christmas/Boxing Day 2016 and New Year's Day 2017 closures (with in-lieu days). No early close (24 Dec a Saturday). Per-holiday closure releases of 2016 (Family Day, Good Friday, Victoria Day, Canada Day, Civic Holiday, Labour Day, Thanksgiving) in :also-uris; all dates match the rules. Issue dates are in each release (dateline)."
    :also-uris ("https://www.tsx.com/en/news?id=311"
                "https://www.tsx.com/en/news?id=329"
                "https://www.tsx.com/en/news?id=360"
                "https://www.tsx.com/en/news?id=368"
                "https://www.tsx.com/en/news?id=381"
                "https://www.tsx.com/en/news?id=397"
                "https://www.tsx.com/en/news?id=411")
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "TMX Group news release: Holiday Operating Schedule 2017, with the 2017 holiday closure releases" :year 2017
    :uri "https://www.tsx.com/en/news?id=557"
    :issued (2017 12 6) :issued-uri "https://www.tsx.com/en/news?id=557"
    :published (2017 12 6) :published-uri "https://www.tsx.com/en/news?id=557"
    :published-in "TMX Group news release (tsx.com/en/news)"
    :dates-note "December release: Christmas/Boxing Day 2017 and New Year's Day 2018 closures (with in-lieu days). No early close (24 Dec a Sunday). Per-holiday closure releases of 2017 (Family Day, Good Friday, Victoria Day, Canada Day, Civic Holiday, Labour Day, Thanksgiving) in :also-uris; all dates match the rules. Issue dates are in each release (dateline)."
    :also-uris ("https://www.tsx.com/en/news?id=454"
                "https://www.tsx.com/en/news?id=472"
                "https://www.tsx.com/en/news?id=488"
                "https://www.tsx.com/en/news?id=497"
                "https://www.tsx.com/en/news?id=509"
                "https://www.tsx.com/en/news?id=525"
                "https://www.tsx.com/en/news?id=537")
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "TMX Group news release: Holiday Operating Schedule 2018, with the 2018 holiday closure releases" :year 2018
    :uri "https://www.tsx.com/en/news?id=664"
    :issued (2018 11 26) :issued-uri "https://www.tsx.com/en/news?id=664"
    :published (2018 11 26) :published-uri "https://www.tsx.com/en/news?id=664"
    :published-in "TMX Group news release (tsx.com/en/news)"
    :dates-note "December release: Christmas/Boxing Day 2018 and New Year's Day 2019 closures (with in-lieu days). Christmas Eve TSX/TSXV 'Open until 1:00 p.m. (EST)'. Per-holiday closure releases of 2018 (Family Day, Good Friday, Victoria Day, Canada Day, Civic Holiday, Labour Day, Thanksgiving) in :also-uris; all dates match the rules. Issue dates are in each release (dateline)."
    :also-uris ("https://www.tsx.com/en/news?id=572"
                "https://www.tsx.com/en/news?id=585"
                "https://www.tsx.com/en/news?id=601"
                "https://www.tsx.com/en/news?id=620"
                "https://www.tsx.com/en/news?id=628"
                "https://www.tsx.com/en/news?id=636"
                "https://www.tsx.com/en/news?id=648")
    :closed ()
    :open ()
    :early-closes (((2018 12 24) (13 0) "Christmas Eve: close 13:00"))
    :late-opens ())
   (:title "TMX Group news release: Holiday Operating Schedule 2019, with the 2019 holiday closure releases" :year 2019
    :uri "https://www.tsx.com/en/news?id=728"
    :issued (2019 12 12) :issued-uri "https://www.tsx.com/en/news?id=728"
    :published (2019 12 12) :published-uri "https://www.tsx.com/en/news?id=728"
    :published-in "TMX Group news release (tsx.com/en/news)"
    :dates-note "December release: Christmas/Boxing Day 2019 and New Year's Day 2020 closures (with in-lieu days). Christmas Eve TSX/TSXV 'Open until 1:00 p.m. (EST)'. Per-holiday closure releases of 2019 (Family Day, Good Friday, Victoria Day, Canada Day, Civic Holiday, Labour Day, Thanksgiving) in :also-uris; all dates match the rules. Issue dates are in each release (dateline)."
    :also-uris ("https://www.tsx.com/en/news?id=673"
                "https://www.tsx.com/en/news?id=684"
                "https://www.tsx.com/en/news?id=689"
                "https://www.tsx.com/en/news?id=699"
                "https://www.tsx.com/en/news?id=703"
                "https://www.tsx.com/en/news?id=709"
                "https://www.tsx.com/en/news?id=720")
    :closed ()
    :open ()
    :early-closes (((2019 12 24) (13 0) "Christmas Eve: close 13:00"))
    :late-opens ())
   (:title "TMX Group news release: Holiday Operating Schedule 2020, with the 2020 holiday closure releases" :year 2020
    :uri "https://www.tsx.com/en/news?id=797"
    :issued (2020 11 24) :issued-uri "https://www.tsx.com/en/news?id=797"
    :published (2020 11 24) :published-uri "https://www.tsx.com/en/news?id=797"
    :published-in "TMX Group news release (tsx.com/en/news)"
    :dates-note "December release: Christmas/Boxing Day 2020 and New Year's Day 2021 closures (with in-lieu days). Christmas Eve TSX/TSXV 'Open until 1:00 p.m. (EST)'. Per-holiday closure releases of 2020 (Family Day, Good Friday, Victoria Day, Canada Day, Civic Holiday, Labour Day, Thanksgiving) in :also-uris; all dates match the rules. Issue dates are in each release (dateline)."
    :also-uris ("https://www.tsx.com/en/news?id=735"
                "https://www.tsx.com/en/news?id=751"
                "https://www.tsx.com/en/news?id=758"
                "https://www.tsx.com/en/news?id=766"
                "https://www.tsx.com/en/news?id=771"
                "https://www.tsx.com/en/news?id=777"
                "https://www.tsx.com/en/news?id=787")
    :closed ()
    :open ()
    :early-closes (((2020 12 24) (13 0) "Christmas Eve: close 13:00"))
    :late-opens ())
   (:title "TMX Ops Notice 2021-033: Operating schedule for National Day for Truth and Reconciliation" :year 2021
    :uri "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=47"
    :issued (2021 6 30) :issued-uri "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=47"
    :published (2021 6 30) :published-uri "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=47"
    :published-in "TMX Operational Notice 2021-033"
    :dates-note "'the Toronto Stock Exchange, TSX Venture Exchange, and TSX Alpha Exchange will be open for trading on National Day of Truth and Reconciliation and regular operating hours will be in effect' (from 30 Sep 2021; non-settlement day). Repeated yearly: Ops Notices 2022-021, 2023-030, 2024-051, 2025-040, 2026-039."
    :also-uris ("https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=246"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=496"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=706"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=935"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=1187")
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "TMX Ops Notice 2021-050: Early close on Christmas Eve 2021" :year 2021
    :uri "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=122"
    :issued (2021 11 3) :issued-uri "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=122"
    :published (2021 11 3) :published-uri "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=122"
    :published-in "TMX Operational Notice 2021-050"
    :dates-note "Early market close Fri 24 Dec 2021: MOC imbalance 12:50, post-open market close 13:00, last-sale 13:10-13:30. Same schedule in Ops Notices 2024-062 (24 Dec 2024) and 2025-058 (24 Dec 2025)."
    :also-uris ("https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=732"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=995")
    :closed ()
    :open ()
    :early-closes (((2021 12 24) (13 0) "Christmas Eve: close 13:00"))
    :late-opens ())
   (:title "TMX Group news release: Holiday Operating Schedule 2021, with the 2021 holiday closure releases" :year 2021
    :uri "https://www.tsx.com/en/news?id=870"
    :issued (2021 11 30) :issued-uri "https://www.tsx.com/en/news?id=870"
    :published (2021 11 30) :published-uri "https://www.tsx.com/en/news?id=870"
    :published-in "TMX Group news release (tsx.com/en/news)"
    :dates-note "December release: Christmas/Boxing Day 2021 and New Year's Day 2022 closures (with in-lieu days). Christmas Eve TSX/TSXV 'Open until 1:00 p.m. (EST)'. Per-holiday closure releases of 2021 (Family Day, Good Friday, Victoria Day, Canada Day, Civic Holiday, Labour Day, Thanksgiving) in :also-uris; all dates match the rules. TMX Ops Notices for 2021 in :also-uris (holiday settlement schedules; Remembrance Day and National Day for Truth and Reconciliation notices state TSX is open for trading). Issue dates are in each release (dateline)."
    :also-uris ("https://www.tsx.com/en/news?id=809"
                "https://www.tsx.com/en/news?id=822"
                "https://www.tsx.com/en/news?id=837"
                "https://www.tsx.com/en/news?id=844"
                "https://www.tsx.com/en/news?id=848"
                "https://www.tsx.com/en/news?id=855"
                "https://www.tsx.com/en/news?id=861"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=75"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=63"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=53"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=49"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=46"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=98"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=47"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=104"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=111"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=122"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=123"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=144")
    :closed ()
    :open ()
    :early-closes (((2021 12 24) (13 0) "Christmas Eve: close 13:00"))
    :late-opens ())
   (:title "TMX Ops Notice 2022-019: Federal Holiday, September 19, 2022" :year 2022
    :uri "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=238"
    :issued (2022 9 13) :issued-uri "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=238"
    :published (2022 9 13) :published-uri "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=238"
    :published-in "TMX Operational Notice 2022-019"
    :dates-note "'the Toronto Stock Exchange, TSX Venture Exchange, and TSX Alpha Exchange will be open for trading on Monday, September 19, 2022 and regular operating hours will be in effect' (federal day of mourning for Queen Elizabeth II). No rule closes it; recorded as evidence."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "TMX Group news release: Holiday Operating Schedule 2022, with the 2022 holiday closure releases" :year 2022
    :uri "https://www.tsx.com/en/news?id=931"
    :issued (2022 12 7) :issued-uri "https://www.tsx.com/en/news?id=931"
    :published (2022 12 7) :published-uri "https://www.tsx.com/en/news?id=931"
    :published-in "TMX Group news release (tsx.com/en/news)"
    :dates-note "December release: Christmas/Boxing Day 2022 and New Year's Day 2023 closures (with in-lieu days). No early close (24 Dec a Saturday). Per-holiday closure releases of 2022 (Family Day, Good Friday, Victoria Day, Canada Day, Civic Holiday, Labour Day, Thanksgiving) in :also-uris; all dates match the rules. TMX Ops Notices for 2022 in :also-uris (holiday settlement schedules; Remembrance Day and National Day for Truth and Reconciliation notices state TSX is open for trading). Ops Notices 2022-019/020: TSX open with regular hours on Mon 19 Sep 2022 (federal holiday for the funeral of Queen Elizabeth II). Issue dates are in each release (dateline)."
    :also-uris ("https://www.tsx.com/en/news?id=881"
                "https://www.tsx.com/en/news?id=890"
                "https://www.tsx.com/en/news?id=899"
                "https://www.tsx.com/en/news?id=906"
                "https://www.tsx.com/en/news?id=911"
                "https://www.tsx.com/en/news?id=916"
                "https://www.tsx.com/en/news?id=921"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=156"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=188"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=201"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=211"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=235"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=238"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=239"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=246"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=256"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=292"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=312")
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "TMX Group news release: Holiday Operating Schedule 2023, with the 2023 holiday closure releases" :year 2023
    :uri "https://www.tsx.com/en/news?id=996"
    :issued (2023 12 5) :issued-uri "https://www.tsx.com/en/news?id=996"
    :published (2023 12 5) :published-uri "https://www.tsx.com/en/news?id=996"
    :published-in "TMX Group news release (tsx.com/en/news)"
    :dates-note "December release: Christmas/Boxing Day 2023 and New Year's Day 2024 closures (with in-lieu days). No early close (24 Dec a Sunday). Per-holiday closure releases of 2023 (Family Day, Good Friday, Victoria Day, Canada Day, Civic Holiday, Labour Day, Thanksgiving) in :also-uris; all dates match the rules. TMX Ops Notices for 2023 in :also-uris (holiday settlement schedules; Remembrance Day and National Day for Truth and Reconciliation notices state TSX is open for trading). 2023: TSX open on Mon 2 Oct 2023 (NDTR observed) and Mon 13 Nov 2023 (Remembrance Day observed). Issue dates are in each release (dateline)."
    :also-uris ("https://www.tsx.com/en/news?id=943"
                "https://www.tsx.com/en/news?id=952"
                "https://www.tsx.com/en/news?id=964"
                "https://www.tsx.com/en/news?id=971"
                "https://www.tsx.com/en/news?id=977"
                "https://www.tsx.com/en/news?id=982"
                "https://www.tsx.com/en/news?id=987"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=343"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=392"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=417"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=450"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=473"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=487"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=496"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=504"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=524"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=543")
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "TMX Group news release: Holiday Operating Schedule 2024, with the 2024 holiday closure releases" :year 2024
    :uri "https://www.tsx.com/en/news?id=1067"
    :issued (2024 12 2) :issued-uri "https://www.tsx.com/en/news?id=1067"
    :published (2024 12 2) :published-uri "https://www.tsx.com/en/news?id=1067"
    :published-in "TMX Group news release (tsx.com/en/news)"
    :dates-note "December release: Christmas/Boxing Day 2024 and New Year's Day 2025 closures (with in-lieu days). Christmas Eve TSX/TSXV 'Open until 1:00 p.m. (EST)'. Per-holiday closure releases of 2024 (Family Day, Good Friday, Victoria Day, Canada Day, Civic Holiday, Labour Day, Thanksgiving) in :also-uris; all dates match the rules. TMX Ops Notices for 2024 in :also-uris (holiday settlement schedules; Remembrance Day and National Day for Truth and Reconciliation notices state TSX is open for trading). Issue dates are in each release (dateline)."
    :also-uris ("https://www.tsx.com/en/news?id=1009"
                "https://www.tsx.com/en/news?id=1017"
                "https://www.tsx.com/en/news?id=1030"
                "https://www.tsx.com/en/news?id=1037"
                "https://www.tsx.com/en/news?id=1042"
                "https://www.tsx.com/en/news?id=1049"
                "https://www.tsx.com/en/news?id=1056"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=590"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=601"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=622"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=654"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=678"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=691"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=706"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=715"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=732"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=734"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=749")
    :closed ()
    :open ()
    :early-closes (((2024 12 24) (13 0) "Christmas Eve: close 13:00"))
    :late-opens ())
   (:title "TMX Group news release: Holiday Operating Schedule 2025, with the 2025 holiday closure releases" :year 2025
    :uri "https://www.tsx.com/en/news?id=1134"
    :issued (2025 12 3) :issued-uri "https://www.tsx.com/en/news?id=1134"
    :published (2025 12 3) :published-uri "https://www.tsx.com/en/news?id=1134"
    :published-in "TMX Group news release (tsx.com/en/news)"
    :dates-note "December release: Christmas/Boxing Day 2025 and New Year's Day 2026 closures (with in-lieu days). Christmas Eve TSX/TSXV 'Open until 1:00 p.m. (EST)'. Per-holiday closure releases of 2025 (Family Day, Good Friday, Victoria Day, Canada Day, Civic Holiday, Labour Day, Thanksgiving) in :also-uris; all dates match the rules. TMX Ops Notices for 2025 in :also-uris (holiday settlement schedules; Remembrance Day and National Day for Truth and Reconciliation notices state TSX is open for trading). Issue dates are in each release (dateline)."
    :also-uris ("https://www.tsx.com/en/news?id=1081"
                "https://www.tsx.com/en/news?id=1096"
                "https://www.tsx.com/en/news?id=1102"
                "https://www.tsx.com/en/news?id=1108"
                "https://www.tsx.com/en/news?id=1112"
                "https://www.tsx.com/en/news?id=1118"
                "https://www.tsx.com/en/news?id=1127"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=800"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=837"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=863"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=893"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=906"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=915"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=935"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=945"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=976"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=995"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=996")
    :closed ()
    :open ()
    :early-closes (((2025 12 24) (13 0) "Christmas Eve: close 13:00"))
    :late-opens ())
   (:title "tsx.com Calendar: 2026 Stock Market Holidays" :year 2026
    :uri "https://www.tsx.com/en/trading/calendars-and-trading-hours/calendar"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.tsx.com/en/trading/calendars-and-trading-hours/calendar"
    :published-in "tsx.com Calendars & Trading Hours - Calendar page (fetched 2026-11-28)"
    :dates-note "New Year's Day 1 Jan, Family Day 16 Feb, Good Friday 3 Apr, Victoria Day 18 May, Canada Day 1 Jul, Civic Holiday 3 Aug, Labour Day 7 Sep, Thanksgiving 12 Oct, 'Christmas Eve - Thursday, December 24, 2026* ... Closing at 1:00 PM (TSX/TSXV)', Christmas Day 25 Dec, In Lieu of Boxing Day Mon 28 Dec. Confirmed by the 2026 closure releases and Ops Notices in :also-uris. Page undated. Page carries no issue date (snapshot/fetch date is an upper bound)."
    :also-uris ("https://www.tsx.com/en/news?id=1145"
                "https://www.tsx.com/en/news?id=1152"
                "https://www.tsx.com/en/news?id=1163"
                "https://www.tsx.com/en/news?id=1170"
                "https://www.tsx.com/en/news?id=1177"
                "https://www.tsx.com/en/news?id=1185"
                "https://www.tsx.com/en/news?id=1192"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=1049"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=1080"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=1114"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=1134"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=1149"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=1173"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=1187"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=1199"
                "https://www.tsx.com/en/trading/toronto-stock-exchange/trading-notices?id=1223")
    :closed ()
    :open ()
    :early-closes (((2026 12 24) (13 0) "Christmas Eve: close 13:00"))
    :late-opens ())
   (:title "tsx.com Calendar: 2027 Stock Market Holidays" :year 2027
    :uri "https://www.tsx.com/en/trading/calendars-and-trading-hours/calendar"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.tsx.com/en/trading/calendars-and-trading-hours/calendar"
    :published-in "tsx.com Calendars & Trading Hours - Calendar page (fetched 2026-11-28)"
    :dates-note "New Year's Day 1 Jan, Family Day 15 Feb, Good Friday 26 Mar, Victoria Day 24 May, Canada Day 1 Jul, Civic Holiday 2 Aug, Labour Day 6 Sep, Thanksgiving 11 Oct, 'Christmas Eve - Friday, December 24, 2027*' closing at 1:00 PM, In Lieu of Christmas Day Mon 27 Dec, In Lieu of Boxing Day Tue 28 Dec. Page undated. Page carries no issue date (snapshot/fetch date is an upper bound)."
    :closed ()
    :open ()
    :early-closes (((2027 12 24) (13 0) "Christmas Eve: close 13:00"))
    :late-opens ())
 )
 :gaps ((:years "2000" :note "Partial: TSE notices found for 3 Jan (99-189), Victoria Day (2000-140/158) and Labour Day (2000-279). Civic Holiday 7 Aug (2000-234). Good Friday 21 Apr, Canada Day Mon 3 Jul (1 Jul a Saturday), Thanksgiving 9 Oct, Christmas/Boxing Day 25/26 Dec: no TSE document retrieved (tse.com mregs Thanksgiving notices of 11 Sep and 28 Sep 2000 are listed in the web archive but were not served; no Good Friday, Canada Day or 2000/2001 year-end notice is listed). Dates follow the rules and ec. 24 Dec 2000 was a Sunday.")
        (:years "2001-01-01" :note "New Year's Day 2001: no TSE notice found (year-end 2000/2001 notice not in the archive).")
        (:years "2004" :note "Canada Day 1 Jul and Labour Day 6 Sep 2004: notices not retrievable (2004-024 Labour Day listed in the web archive but not served).")
        (:years "2005-10-10" :note "Thanksgiving 2005: notice 2005-034 listed in the web archive but not served.")
        (:years "2007" :note "Only Victoria Day (release 11 May 2007) and New Year's Day (release 15 Dec 2006) found. Searched web.archive.org CDX for tsx.com/tmx.com news_releases and pdf/notices of 2007 (only listing/index notices). Christmas Eve Mon 24 Dec 2007: hours unknown (13:00 by the rule; ec: regular).")
        (:years "2009-12-24" :note "Christmas Eve Thu 24 Dec 2009: hours unknown. The 2009 list (tsx.com 2008-11-21) has no Christmas-Eve line; the 2 Dec 2009 TMX holiday-schedule release is in the CDX index but every fetch returned 404/nothing. 13:00 by the rule; ec: regular.")
        (:years "2028" :note "No TMX list published yet (tsx.com calendar shows 2026 and 2027). Rules extrapolated.")))
