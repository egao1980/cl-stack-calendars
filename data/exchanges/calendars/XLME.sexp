;;;; XLME — London Metal Exchange (LMEselect electronic window, as modelled in data/exchanges/XLME.sexp).
;;;; Research draft for cl-stack-calendars #49. Sources cached under ~/.cache/cl-stack-calendars/exchanges/xlme/.
;;;; LME rule (Notices 21/191 .. 26/231): "the UK banking holidays ... during which the LME will be closed.
;;;; Consequently, these days are not 'Business Days', as defined in the LME Rulebook". So the base is GBLO, with
;;;; two documented deviations: an extra closure on Christmas Eve 2007 and trading on the 2022 State Funeral bank holiday.
(:name "XLME"
 :title "London Metal Exchange trading days"
 :authority "LME Notice 26/231 (21 Sep 2026) 'LME non-business days for the remainder of 2026 and for 2027', para 9"
 :authority-uri "https://www.lme.com/-/media/files/news/notices/2026/09/calendar-and-market-holiday-26-231-nonbusiness-days-for-the-remainder-of-2026-and-for-2027.pdf"
 :bases ((:calendar "GBLO" :from nil :to nil
          :authority "LME notices 21/191, 22/247, 23/229, 24/249, 26/231: 'The table below lists the UK banking holidays ... during which the LME will be closed'; LME Exchange Holidays pages 2003-2012 (lme.co.uk / lme.com, Wayback) list the England & Wales bank holidays as Exchange closed"))
 :rules ()
 :notices
 ((:title "LME Exchange Holidays: trading during the holiday period 2003/04"
   :year 2003
   :uri "https://web.archive.org/web/20031228212220/http://www.lme.com/who_tradingcalendar_holidays.asp"
   :issued nil :issued-uri nil
   :published (2003 12 28) :published-uri "https://web.archive.org/web/20031228212220/http://www.lme.com/who_tradingcalendar_holidays.asp"
   :published-in "exchange website (Wayback); page links a 'full notice' (not retrieved)"
   :dates-note "Undated page; :published = capture date. 25, 26 Dec 2003 and 1 Jan 2004 'Exchange closed' (= GBLO). The 2003 trading-calendar page also says 'On 24 and 31 December trading ends at 13.30 hours' (https://web.archive.org/web/20041001002517/http://www.lme.co.uk/who_tradingcalendar2003.asp)."
   :closed () :open ()
   :early-closes (((2003 12 24) (13 30) "Christmas Eve - ring trading and Select trading will cease at 13.30 (London time)")
                  ((2003 12 31) (13 30) "New Year's Eve - ring trading and Select trading will cease at 13.30 (London time)"))
   :late-opens ())
  (:title "LME Exchange Holidays rest of 2004 and 2005"
   :year 2005
   :uri "https://web.archive.org/web/20050818052530/http://www.lme.com/who_tradingcalendar_holidays.asp"
   :issued nil :issued-uri nil
   :published (2005 8 18) :published-uri "https://web.archive.org/web/20050818052530/http://www.lme.com/who_tradingcalendar_holidays.asp"
   :published-in "exchange website (Wayback)"
   :dates-note "'for the rest of 2004 and for 2005 the Exchange will be closed on': 27, 28 Dec 2004; 3 Jan, 25 Mar, 28 Mar, 2 May, 30 May, 29 Aug, 26, 27 Dec 2005; 2 Jan 2006 (= GBLO). No early-close statement."
   :closed () :open () :early-closes () :late-opens ())
  (:title "LME Exchange Holidays 2006/7"
   :year 2007
   :uri "https://web.archive.org/web/20061129070819/http://www.lme.co.uk/who_tradingcalendar_holidays.asp"
   :issued nil :issued-uri nil
   :published (2006 11 29) :published-uri "https://web.archive.org/web/20061129070819/http://www.lme.co.uk/who_tradingcalendar_holidays.asp"
   :published-in "exchange website (Wayback)"
   :dates-note "25, 26 Dec 2006; 1 Jan, 6 Apr, 9 Apr, 7 May, 28 May, 27 Aug, 25, 26 Dec 2007; 1 Jan 2008. 24 Dec 2007 closure added later (next notice)."
   :closed () :open () :early-closes () :late-opens ())
  (:title "LME Exchange Holidays 2007/8 (Exchange closed Christmas Eve 2007)"
   :year 2008
   :uri "https://web.archive.org/web/20071001220807/http://www.lme.com/who_tradingcalendar_holidays.asp"
   :issued nil :issued-uri nil
   :published (2007 10 1) :published-uri "https://web.archive.org/web/20071001220807/http://www.lme.com/who_tradingcalendar_holidays.asp"
   :published-in "exchange website (Wayback)"
   :dates-note "List: Christmas Eve Mon 24 Dec 07, 25, 26 Dec 07, 1 Jan 08, 21 Mar, 24 Mar, 5 May, 26 May, 25 Aug, 25, 26 Dec 08, 1 Jan 09. 'Please note that as the Exchange is closed on Monday 24 December 2007 the three month prompt date for Monday 24, Tuesday 25 and Wednesday 26 September 2007 will be Thursday 27 December 2007.' The underlying LME notice was not retrieved."
   :closed (((2007 12 24) "Christmas Eve (LME closure, not a bank holiday)"))
   :open ()
   :early-closes (((2008 12 24) (14 0) "the Ring will close at 13:30 hours after Kerb 1 with LME Select operating until 14:00 hours"))
   :late-opens ())
  (:title "LME Exchange Holidays 2008/9"
   :year 2009
   :uri "https://web.archive.org/web/20090525141139/http://www.lme.com/who_tradingcalendar_holidays.asp"
   :issued nil :issued-uri nil
   :published (2008 12 17) :published-uri "https://web.archive.org/web/20081217150816/http://www.lme.com/who_tradingcalendar_holidays.asp"
   :published-in "exchange website (Wayback)"
   :dates-note "2009 list: 10 Apr, 13 Apr, 4 May, 25 May, 31 Aug, 25, 28 Dec 09; 1 Jan 10 (= GBLO). The Dec-2008 capture said 24 Dec 2009 LME Select until 14:00; the May-2009 capture (used) says 24 and 31 Dec 2009 Ring closes 14:00 and LME Select operates until 16:00. 31 Dec 2008: not stated in either capture."
   :closed () :open ()
   :early-closes (((2009 12 24) (16 0) "Ring will close at 14:00 after Kerb 1 with LME Select operating until 16:00")
                  ((2009 12 31) (16 0) "Ring will close at 14:00 after Kerb 1 with LME Select operating until 16:00"))
   :late-opens ())
  (:title "LME Exchange Holidays 2010 (related notice 09/280:A274 'Closure of Exchange 2009 & 2010')"
   :year 2010
   :uri "https://web.archive.org/web/20100526092908/http://www.lme.com/who_tradingcalendar_holidays.asp"
   :issued nil :issued-uri nil
   :published (2010 5 26) :published-uri "https://web.archive.org/web/20100526092908/http://www.lme.com/who_tradingcalendar_holidays.asp"
   :published-in "exchange website (Wayback); LME notice 09/280 not archived"
   :dates-note "2010 list: 1 Jan, 2 Apr, 5 Apr, 3 May, 31 May, 30 Aug, 27, 28 Dec 10; 3 Jan 11 (= GBLO)."
   :closed () :open ()
   :early-closes (((2010 12 24) (16 0) "Ring will close at 14:00 after Kerb 1 with LMEselect operating until 16:00")
                  ((2010 12 31) (16 0) "Ring will close at 14:00 after Kerb 1 with LMEselect operating until 16:00"))
   :late-opens ())
  (:title "LME Exchange Holidays 2011 and 2012 (incl. Diamond Jubilee)"
   :year 2012
   :uri "https://web.archive.org/web/20111223042814/http://www.lme.com/who_tradingcalendar_holidays.asp"
   :issued nil :issued-uri nil
   :published (2011 12 23) :published-uri "https://web.archive.org/web/20111223042814/http://www.lme.com/who_tradingcalendar_holidays.asp"
   :published-in "exchange website (Wayback); related notices 10/379:A370, 11/219:A213 'Closure of Exchange' not archived"
   :dates-note "From 29 Aug 2011: 29 Aug, 26, 27 Dec 11; 2 Jan, 6 Apr, 9 Apr, 7 May, Diamond Jubilee Mon 4 Jun and Tue 5 Jun, 27 Aug, 25, 26 Dec 12; 1 Jan 13 (= GBLO). Jan-Aug 2011, incl. the Royal Wedding 29 Apr 2011, is not covered by any retrieved capture."
   :closed () :open ()
   :early-closes (((2012 12 24) (16 0) "Ring will close at 14:00 after Kerb 1 with LMEselect operating until 16:00")
                  ((2012 12 31) (16 0) "Ring will close at 14:00 after Kerb 1 with LMEselect operating until 16:00"))
   :late-opens ())
  (:title "LME Notice 21/191: LME non-business days for the remainder of 2021 and for 2022"
   :year 2022
   :uri "https://www.lme.com/-/media/Files/News/Notices/2021/10/CALENDAR-AND-MARKET-HOLIDAY-21-191-NON-BUSINESS-DAYS-FOR-THE-REMAINDER-OF-2021-AND-FOR-2022.pdf"
   :issued (2021 10 8) :issued-uri "https://www.lme.com/-/media/Files/News/Notices/2021/10/CALENDAR-AND-MARKET-HOLIDAY-21-191-NON-BUSINESS-DAYS-FOR-THE-REMAINDER-OF-2021-AND-FOR-2022.pdf"
   :published (2021 10 8) :published-uri "https://www.lme.com/-/media/Files/News/Notices/2021/10/CALENDAR-AND-MARKET-HOLIDAY-21-191-NON-BUSINESS-DAYS-FOR-THE-REMAINDER-OF-2021-AND-FOR-2022.pdf"
   :published-in "LME Notice 21/191" :dates-note nil
   :closed () :open () :early-closes () :late-opens ()
   :note "27, 28 Dec 21; 3 Jan, 15 Apr, 18 Apr, 2 May, 2 Jun (Spring), 3 Jun (Platinum Jubilee), 29 Aug, 26, 27 Dec 22; 2 Jan 23 (= GBLO). 24 and 31 Dec 2021: Ring closes early at 14:40, 'LMEselect will continue to operate until 7.00 pm for trading in Base Contracts' -> no LMEselect early close.")
  (:title "LME Notice 22/226: Passing of Her Majesty Queen Elizabeth II - Bank Holiday arrangements"
   :uri "https://www.lme.com/-/media/Files/News/Notices/2022/09/22-226-PASSING-OF-HER-MAJESTY-QUEEN-ELIZABETH-II---BANK-HOLIDAY-ARRANGEMENTS.pdf"
   :issued (2022 9 13) :issued-uri "https://www.lme.com/-/media/Files/News/Notices/2022/09/22-226-PASSING-OF-HER-MAJESTY-QUEEN-ELIZABETH-II---BANK-HOLIDAY-ARRANGEMENTS.pdf"
   :published (2022 9 13) :published-uri "https://www.lme.com/-/media/Files/News/Notices/2022/09/22-226-PASSING-OF-HER-MAJESTY-QUEEN-ELIZABETH-II---BANK-HOLIDAY-ARRANGEMENTS.pdf"
   :published-in "LME Notice 22/226" :dates-note nil
   :closed ()
   :open (((2022 9 19) "State Funeral bank holiday: 'the Bank Holiday will constitute a Business Day for the purposes of the LME and LME Clear Rules, and the markets themselves will remain open'; Ring 1 cancelled, LMEselect available as normal"))
   :early-closes () :late-opens ())
  (:title "LME Notice 22/247: LME non-business days for the remainder of 2022 and for 2023"
   :year 2023
   :uri "https://www.lme.com/-/media/Files/News/Notices/2022/11/Calendar-and-Market-Holiday-22-247-Non-Business-Days-for-the-Remainder-of-2022-and-for-2023.pdf"
   :issued (2022 10 31) :issued-uri "https://www.lme.com/-/media/Files/News/Notices/2022/11/Calendar-and-Market-Holiday-22-247-Non-Business-Days-for-the-Remainder-of-2022-and-for-2023.pdf"
   :published (2022 10 31) :published-uri "https://www.lme.com/-/media/Files/News/Notices/2022/11/Calendar-and-Market-Holiday-22-247-Non-Business-Days-for-the-Remainder-of-2022-and-for-2023.pdf"
   :published-in "LME Notice 22/247" :dates-note "Issued before the Coronation bank holiday was proclaimed; see the Monthly Prompt notice below for 8 May 2023."
   :closed () :open () :early-closes () :late-opens ()
   :note "27 Dec (Christmas), 26 Dec (Boxing) 22; 2 Jan, 7 Apr, 10 Apr, 1 May, 29 May, 28 Aug, 25, 26 Dec 23; 1 Jan 24 (= GBLO). 23 and 30 Dec 2022: LMEselect operates as normal until 19:00.")
  (:title "The Monthly Prompt, December 2022: Coronation of King Charles III - 8 May 2023"
   :year 2023
   :uri "https://lme.com/-/media/Files/News/Monthly-prompt/Archive/The-Monthly-Prompt---December-2022.pdf"
   :issued nil :issued-uri nil
   :published (2022 12 1) :published-uri "https://web.archive.org/web/20250708060741/https://www.lme.com/-/media/Files/News/Monthly-prompt/Archive/The-Monthly-Prompt---December-2022.pdf"
   :published-in "LME newsletter 'The Monthly Prompt' (December 2022)"
   :dates-note "Issue month only (day set to 1). Live URL returns 403; text from Wayback copy. The newsletter links a notice that was not retrieved."
   :closed () :open () :early-closes () :late-opens ()
   :note "'the LME market will be closed on this day and that it will no longer be considered a Business Day' (= GBLO 2023-05-08).")
  (:title "LME Notice 23/229: LME non-business days for the remainder of 2023 and for 2024"
   :year 2024
   :uri "https://www.lme.com/-/media/Files/News/Notices/2023/12/CALENDAR-AND-MARKET-HOLIDAY-23-229-NONBUSINESS-DAYS-FOR-THE-REMAINDER-OF-2023-AND-FOR-2024.pdf"
   :issued (2023 12 5) :issued-uri "https://www.lme.com/-/media/Files/News/Notices/2023/12/CALENDAR-AND-MARKET-HOLIDAY-23-229-NONBUSINESS-DAYS-FOR-THE-REMAINDER-OF-2023-AND-FOR-2024.pdf"
   :published (2023 12 5) :published-uri "https://www.lme.com/-/media/Files/News/Notices/2023/12/CALENDAR-AND-MARKET-HOLIDAY-23-229-NONBUSINESS-DAYS-FOR-THE-REMAINDER-OF-2023-AND-FOR-2024.pdf"
   :published-in "LME Notice 23/229" :dates-note nil
   :closed () :open () :early-closes () :late-opens ()
   :note "25, 26 Dec 23; 1 Jan, 29 Mar, 1 Apr, 6 May, 27 May, 26 Aug, 25, 26 Dec 24; 1 Jan 25 (= GBLO). 22 and 29 Dec 2023: LMEselect as normal until 19:00.")
  (:title "LME Notice 24/249: LME non-business days for the remainder of 2024 and for 2025"
   :year 2025
   :uri "https://www.lme.com/-/media/Files/News/Notices/2024/09/CALENDAR-AND-MARKET-HOLIDAY-24-249-NONBUSINESS-DAYS-FOR-THE-REMAINDER-OF-2024-AND-FOR-2025.pdf"
   :issued (2024 9 17) :issued-uri "https://www.lme.com/-/media/Files/News/Notices/2024/09/CALENDAR-AND-MARKET-HOLIDAY-24-249-NONBUSINESS-DAYS-FOR-THE-REMAINDER-OF-2024-AND-FOR-2025.pdf"
   :published (2024 9 17) :published-uri "https://www.lme.com/-/media/Files/News/Notices/2024/09/CALENDAR-AND-MARKET-HOLIDAY-24-249-NONBUSINESS-DAYS-FOR-THE-REMAINDER-OF-2024-AND-FOR-2025.pdf"
   :published-in "LME Notice 24/249" :dates-note nil
   :closed () :open () :early-closes () :late-opens ()
   :note "25, 26 Dec 24; 1 Jan, 18 Apr, 21 Apr, 5 May, 26 May, 25 Aug, 25, 26 Dec 25; 1 Jan 26 (= GBLO). 24 and 31 Dec 2024: Ring closes 14:40; LMEselect as normal until 19:00 for Base Contracts.")
  (:title "LME Notice 26/231: LME non-business days for the remainder of 2026 and for 2027"
   :year 2027
   :uri "https://www.lme.com/-/media/files/news/notices/2026/09/calendar-and-market-holiday-26-231-nonbusiness-days-for-the-remainder-of-2026-and-for-2027.pdf"
   :issued (2026 9 21) :issued-uri "https://www.lme.com/-/media/files/news/notices/2026/09/calendar-and-market-holiday-26-231-nonbusiness-days-for-the-remainder-of-2026-and-for-2027.pdf"
   :published (2026 9 21) :published-uri "https://www.lme.com/-/media/files/news/notices/2026/09/calendar-and-market-holiday-26-231-nonbusiness-days-for-the-remainder-of-2026-and-for-2027.pdf"
   :published-in "LME Notice 26/231" :dates-note "Full 2026 list is in Notice 25/163 (16 Sep 2025), which returned 403 and wasn't retrieved."
   :closed () :open () :early-closes () :late-opens ()
   :note "25, 28 Dec 26; 1 Jan, 26 Mar, 29 Mar, 3 May, 31 May, 30 Aug, 27, 28 Dec 27; 3 Jan 28 (= GBLO). 24 and 31 Dec 2026: Ring closes 14:40; 'LMEselect will operate as normal until 19:00 for trading'.")))
