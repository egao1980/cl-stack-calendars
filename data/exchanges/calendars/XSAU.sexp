;;;; XSAU exchange trading-day calendar (#49).
;;;; Saudi Exchange (Tadawul). Recurring rules: National Day 23 Sep, Founding Day 22 Feb (from 2022).
;;;; Eid al-Fitr / Eid al-Adha are lunar (Umm al-Qura) and every closure is announced by Tadawul,
;;;; so they are given per year as notice :closed dates (no Hijri rule kind; see XSAU-hours.md).
;;;; Exchange lists: 2003-2004 (old "Announcements" page, Tadawul's own notices, via web.archive.org),
;;;; 2020-2029 (Tadawul events calendar / Saudi Exchange holiday calendar, via web.archive.org) and the
;;;; 2021 Ramadan/Eid press release. 2015-2020 Eid closures only from secondary copies (Argaam,
;;;; Mondo Visione reproductions of Tadawul releases): :confidence :secondary.
;;;; Gold (ec) starts 2021; from 2021 every year has an exchange list.
;;;; Weekend eras: Thursday sessions are documented in 2003-2004 (Saturday-Thursday week, Friday rest);
;;;; Saturday-Wednesday by 2007-10 (Tadawul trading-times page); Sunday-Thursday from 2013-06-30.
;;;; The 2006 switch date is month-level from a secondary lead only (see XSAU-hours.md, open question).

(:name "XSAU"
 :title "Saudi Exchange (Tadawul) trading days"
 :authority "Saudi Exchange / Tadawul: 'Trading Times' page (official holidays: National Day 23 September, Eid Al-Fitr and Eid Al-Adha announced on the Tadawul website) and the Saudi Exchange Holiday Calendar"
 :authority-uri "https://web.archive.org/web/20071028135837id_/http://www.tadawul.com.sa/static/pages/en/TradingTimes/tradingtimes.html"
 :weekend ((nil 5) ((2006 9 1) 4 5) ((2013 6 29) 5 6))
 :rules ((:fixed "National Day" 9 23 :from 2006
          :authority "Tadawul Trading Times page 2007-10 / 2009 / 2011 / 2013 / 2014 / 2016 ('National Day of Saudi Arabia (23 September) ... Market will be closed during these holidays'): https://web.archive.org/web/20071028135837id_/http://www.tadawul.com.sa/static/pages/en/TradingTimes/tradingtimes.html ; https://web.archive.org/web/20140603012846id_/http://www.tadawul.com.sa/static/pages/en/TradingTimes/tradingtimes.html . Weekend substitutes (2022 Thu 22 Sep, 2023 Sun 24 Sep) are notices. 2006 closure itself not verified.")
         (:fixed "Founding Day" 2 22 :from 2022
          :authority "Saudi Exchange Holiday Calendar: 'Founding Day of Saudi Arabia is on 22/02/2022' (and 2023, 2024, 2026, 2027): https://web.archive.org/web/20260719180652id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar . 2025 (Saturday) moved to Sunday 23 Feb by notice."))
 :notices (
   ;; ---------------------------------------------------------------- 2003-2004: old Tadawul site
   (:title "Tadawul announcement: market closed for Eid Al-Fitr 28/09/1424 - 03/10/1424 (Umm al-Qura), reopening Saturday 05/10/1424 = 29/11/2003" :year 2003
    :uri "https://web.archive.org/web/20031204075533id_/http://www.tadawul.com.sa:80/reports/Announcements.ASP"
    :issued (2003 11 15) :issued-uri "https://web.archive.org/web/20031204075533id_/http://www.tadawul.com.sa:80/reports/Announcements.ASP"
    :published (2003 11 15) :published-uri "https://web.archive.org/web/20031204075533id_/http://www.tadawul.com.sa:80/reports/Announcements.ASP"
    :published-in "Tadawul website, 'Last 20 announcements' (issuer 'تداول'); reminder repeated 2003-11-19"
    :dates-note "Arabic text: 'سوف يغلق السوق خلال عطلة عيد الفطر المبارك خلال الفترة من28/09/1424هـ إلى 03/10/1424هـ حسب تقويم ام القرى. وسوف يعاد افتتاح السوق يوم السبت 05/10/1424هـ الموافق 29/11/2003م'. Umm al-Qura conversion (hijri-converter): 28/09/1424 = Sat 2003-11-22, 03/10/1424 = Thu 2003-11-27. Thursday was a trading day in 2003 (Saturday-Thursday week)."
    :closed (((2003 11 22) "Eid Al-Fitr") ((2003 11 23) "Eid Al-Fitr") ((2003 11 24) "Eid Al-Fitr")
             ((2003 11 25) "Eid Al-Fitr") ((2003 11 26) "Eid Al-Fitr") ((2003 11 27) "Eid Al-Fitr"))
    :open () :early-closes () :late-opens ())
   (:title "Tadawul announcement: market closed for Eid Al-Fitr 28/09/1425 - 06/10/1425 (Umm al-Qura), reopening Saturday 07/10/1425 = 20/11/2004" :year 2004
    :uri "https://web.archive.org/web/20041101003016id_/http://www.tadawul.com.sa:80/reports/Announcements.ASP"
    :issued (2004 10 30) :issued-uri "https://web.archive.org/web/20041101003016id_/http://www.tadawul.com.sa:80/reports/Announcements.ASP"
    :published (2004 10 30) :published-uri "https://web.archive.org/web/20041101003016id_/http://www.tadawul.com.sa:80/reports/Announcements.ASP"
    :published-in "Tadawul website, 'Last 20 announcements' (issuer 'تداول')"
    :dates-note "Arabic text: 'سوف يغلق السوق خلال عطلة عيد الفطر المبارك خلال الفترة من28/09/1425هـ إلى06/10/1425هـ حسب تقويم ام القرى. وسوف يعاد افتتاح السوق يوم السبت 07/10/1425هـ الموافق 20/11/2004م'. 28/09/1425 = Thu 2004-11-11, 06/10/1425 = Fri 2004-11-19 (Umm al-Qura). Eid Al-Adha 2004 notice (2004-01-27: last trading day Wednesday 28/1/2004, evening period) gives no resumption date, see :gaps."
    :closed (((2004 11 11) "Eid Al-Fitr") ((2004 11 13) "Eid Al-Fitr") ((2004 11 14) "Eid Al-Fitr")
             ((2004 11 15) "Eid Al-Fitr") ((2004 11 16) "Eid Al-Fitr") ((2004 11 17) "Eid Al-Fitr")
             ((2004 11 18) "Eid Al-Fitr"))
    :open () :early-closes () :late-opens ())
   ;; ---------------------------------------------------------------- 2015-2020: secondary copies
   (:title "The Saudi Stock Exchange (Tadawul): market closure during Eid Al-Fitr holiday 2015 (reproduced by Mondo Visione)" :year 2015
    :uri "https://mondovisione.com/news/the-saudi-stock-exchange-market-closure-during-eid-al-fitr-holiday-201571"
    :issued (2015 7 1) :issued-uri "https://mondovisione.com/news/the-saudi-stock-exchange-market-closure-during-eid-al-fitr-holiday-201571"
    :published (2015 7 1) :published-uri "https://mondovisione.com/news/the-saudi-stock-exchange-market-closure-during-eid-al-fitr-holiday-201571"
    :published-in "Tadawul announcement, reproduced by Mondo Visione"
    :confidence :secondary
    :dates-note "'the Eid Al Fitr holiday will commence at the end of the trading day, effective Wednesday 15 July 2015. Trading will resume after the holiday on Wednesday 22 July 2015.' Eid Al-Adha 2015 not found."
    :closed (((2015 7 16) "Eid Al-Fitr") ((2015 7 19) "Eid Al-Fitr") ((2015 7 20) "Eid Al-Fitr") ((2015 7 21) "Eid Al-Fitr"))
    :open () :early-closes () :late-opens ())
   (:title "Tadawul to close 9 days for Eid holiday (Argaam, 2016-08-31)" :year 2016
    :uri "https://www.argaam.com/en/article/articledetail/id/442628"
    :issued nil :issued-uri nil
    :published (2016 8 31) :published-uri "https://www.argaam.com/en/article/articledetail/id/442628"
    :published-in "Argaam (news report of a Tadawul statement)"
    :confidence :secondary
    :dates-note "'will be closed for nine days between Sept. 9 and Sept. 17 ... Trading will resume on Sunday, Sept. 18.' (Eid Al-Adha). Tadawul's own statement not found. Eid Al-Fitr 2016 not found."
    :closed (((2016 9 11) "Eid Al-Adha") ((2016 9 12) "Eid Al-Adha") ((2016 9 13) "Eid Al-Adha") ((2016 9 14) "Eid Al-Adha") ((2016 9 15) "Eid Al-Adha"))
    :open () :early-closes () :late-opens ())
   (:title "Tadawul's Eid al-Fitr holiday begins June 23 (Argaam, 2017-06-17)" :year 2017
    :uri "https://www.argaam.com/en/article/articledetail/id/491743"
    :issued nil :issued-uri nil
    :published (2017 6 17) :published-uri "https://www.argaam.com/en/article/articledetail/id/491743"
    :published-in "Argaam (news report of a Tadawul statement)"
    :confidence :secondary
    :dates-note "'Eid al-Fitr holiday ... will start on June 23, 2017. Trading will resume after the holiday on Sunday, July 2.' 23 June 2017 is a Friday, so the last session is Thursday 22 June."
    :closed (((2017 6 25) "Eid Al-Fitr") ((2017 6 26) "Eid Al-Fitr") ((2017 6 27) "Eid Al-Fitr") ((2017 6 28) "Eid Al-Fitr") ((2017 6 29) "Eid Al-Fitr"))
    :open () :early-closes () :late-opens ())
   (:title "Tadawul to resume trading on Sep. 6 after Eid holiday (Argaam, 2017-08-23)" :year 2017
    :uri "https://www.argaam.com/en/article/articledetail/id/501885"
    :issued nil :issued-uri nil
    :published (2017 8 23) :published-uri "https://www.argaam.com/en/article/articledetail/id/501885"
    :published-in "Argaam (news report of a Tadawul statement extending the Eid Al-Adha holiday by one day)"
    :confidence :secondary
    :dates-note "'The market will be off after close of trading on Aug. 29, until Sep. 5.' 'Trading will resume on Wednesday, Sep. 6.'"
    :closed (((2017 8 30) "Eid Al-Adha") ((2017 8 31) "Eid Al-Adha") ((2017 9 3) "Eid Al-Adha") ((2017 9 4) "Eid Al-Adha") ((2017 9 5) "Eid Al-Adha"))
    :open () :early-closes () :late-opens ())
   (:title "Tadawul to close 7 days for Eid holiday (Argaam, 2018-06-07)" :year 2018
    :uri "https://www.argaam.com/en/article/articledetail/id/553248"
    :issued nil :issued-uri nil
    :published (2018 6 7) :published-uri "https://www.argaam.com/en/article/articledetail/id/553248"
    :published-in "Argaam (news report of a Tadawul statement)"
    :confidence :secondary
    :dates-note "Eid Al-Fitr: closed 'June 12-19', 'Trading resumes on Wednesday, June 20'."
    :closed (((2018 6 12) "Eid Al-Fitr") ((2018 6 13) "Eid Al-Fitr") ((2018 6 14) "Eid Al-Fitr")
             ((2018 6 17) "Eid Al-Fitr") ((2018 6 18) "Eid Al-Fitr") ((2018 6 19) "Eid Al-Fitr"))
    :open () :early-closes () :late-opens ())
   (:title "Tadawul Eid Al-Adha holiday (Argaam, 2018-07-31)" :year 2018
    :uri "https://www.argaam.com/en/article/articledetail/id/563041"
    :issued nil :issued-uri nil
    :published (2018 7 31) :published-uri "https://www.argaam.com/en/article/articledetail/id/563041"
    :published-in "Argaam (news report of a Tadawul statement)"
    :confidence :secondary
    :dates-note "Closes after trading ends on Aug. 16 (Thu), closed through Aug. 25, 'Trading will resume on Sunday, Aug. 26'."
    :closed (((2018 8 19) "Eid Al-Adha") ((2018 8 20) "Eid Al-Adha") ((2018 8 21) "Eid Al-Adha") ((2018 8 22) "Eid Al-Adha") ((2018 8 23) "Eid Al-Adha"))
    :open () :early-closes () :late-opens ())
   ;; ---------------------------------------------------------------- 2020-2029: Tadawul / Saudi Exchange calendars
   (:title "Tadawul Events & Calendar: Eid Al-Fitr holiday 2020 (ends Thursday 28/9/1441 = 21/5/2020, resumes Sunday 8/10/1441 = 31/5/2020)" :year 2020
    :uri "https://web.archive.org/web/20201006020218id_/https://www.tadawul.com.sa/wps/portal/tadawul/about/about_events/events_calendar?locale=en"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20201006020218id_/https://www.tadawul.com.sa/wps/portal/tadawul/about/about_events/events_calendar?locale=en"
    :published-in "Tadawul website, Events & Calendar (holidays); same entry kept on the Saudi Exchange Holiday Calendar"
    :dates-note "Entry date 21/05/2020 - 31/05/2020 = last trading day / resumption day. Issue date not shown. Eid Al-Adha 2020 is not on the calendar: see the secondary notice below. National Day 2020 (Wed 23 Sep) from the rule (no 2020 entry on the calendar)."
    :closed (((2020 5 24) "Eid Al-Fitr") ((2020 5 25) "Eid Al-Fitr") ((2020 5 26) "Eid Al-Fitr") ((2020 5 27) "Eid Al-Fitr") ((2020 5 28) "Eid Al-Fitr"))
    :open () :early-closes () :late-opens ())
   (:title "Tadawul to close 7 days for Eid Al-Adha holiday (Argaam, 2020-06-30)" :year 2020
    :uri "https://www.argaam.com/en/article/articledetail/id/1387677"
    :issued nil :issued-uri nil
    :published (2020 6 30) :published-uri "https://www.argaam.com/en/article/articledetail/id/1387677"
    :published-in "Argaam (news report of a Tadawul statement)"
    :confidence :secondary
    :dates-note "'from the close of trading on July 28 to Aug. 4, 2020', trading resumes Wednesday, Aug. 5, 2020."
    :closed (((2020 7 29) "Eid Al-Adha") ((2020 7 30) "Eid Al-Adha") ((2020 8 2) "Eid Al-Adha") ((2020 8 3) "Eid Al-Adha") ((2020 8 4) "Eid Al-Adha"))
    :open () :early-closes () :late-opens ())
   (:title "Tadawul: Trading hours during Ramadan and Eid Al-Fitr holiday 2021 (ends Monday 28/9/1442 = 10/5/2021, resumes Monday 5/10/1442 = 17/5/2021)" :year 2021
    :uri "https://web.archive.org/web/20210406130525id_/https://www.tadawul.com.sa/wps/portal/tadawul/markets/Press-Release/news-details/!ut/p/z1/vVLLcoJAEPyaHKkd3ngkIIIixogPuFArrJEEF8QN5POzYA5egkmlKnuamereeXSjGO1QTHGTv2CWlxQXaIVrXotiLQlc33LBkGbgSjaY2ng2sy1VAllDGxSjOKWsYkcUMZzh9r1ICH2ACxa-0j6u6jwlF0yznGaER32RkvYanHD9Rtg1TdlNKkggiaCAltT4xL-jmNKuY1GmuCAo4iPyrErzDEV7Vc8OmSIL2gGrgqIACKPMIIKe6qqmyICNPaBtv5D3NFFEjy9khNojmGvLD-xgJYKqoXh43ytfkixDHCngT7xAB3NpuhtnE8owkf_GB-VnfPjmmXCPH3G-fgMIx5w1X0ydZ3UqLhb8QE1OWrSmZX3qPPDL83L01pony_X4mXe6UckFNL03Gzdb_no-xyZ3VEkZ-WBo90-W2naT3zFGDxhSfhDQSdsDBrSrjlUTqE3hOI7RhiRKbP-w8nLzE-VgIpc!/dz/d5/L2dBISEvZ0FBIS9nQSEh/?locale=ar"
    :issued (2021 4 6) :issued-uri "https://mondovisione.com/media-and-resources/news/trading-hours-during-the-holy-month-of-ramadan-eid-al-fiter-holiday-for-the-saud-202146/"
    :published (2021 4 6) :published-uri "https://web.archive.org/web/20210406130525id_/https://www.tadawul.com.sa/wps/portal/tadawul/markets/Press-Release/news-details/!ut/p/z1/vVLLcoJAEPyaHKkd3ngkIIIixogPuFArrJEEF8QN5POzYA5egkmlKnuamereeXSjGO1QTHGTv2CWlxQXaIVrXotiLQlc33LBkGbgSjaY2ng2sy1VAllDGxSjOKWsYkcUMZzh9r1ICH2ACxa-0j6u6jwlF0yznGaER32RkvYanHD9Rtg1TdlNKkggiaCAltT4xL-jmNKuY1GmuCAo4iPyrErzDEV7Vc8OmSIL2gGrgqIACKPMIIKe6qqmyICNPaBtv5D3NFFEjy9khNojmGvLD-xgJYKqoXh43ytfkixDHCngT7xAB3NpuhtnE8owkf_GB-VnfPjmmXCPH3G-fgMIx5w1X0ydZ3UqLhb8QE1OWrSmZX3qPPDL83L01pony_X4mXe6UckFNL03Gzdb_no-xyZ3VEkZ-WBo90-W2naT3zFGDxhSfhDQSdsDBrSrjlUTqE3hOI7RhiRKbP-w8nLzE-VgIpc!/dz/d5/L2dBISEvZ0FBIS9nQSEh/?locale=ar"
    :published-in "Tadawul market news / press release (Arabic), archived 2021-04-06; English copy on Mondo Visione"
    :dates-note "'ينتهي التداول بنهاية يوم الإثنين 28/9/1442 هـ ... الموافق 10/5/2021 م - يستأنف التداول بعد الإجازة يوم الإثنين 5/10/1442 هـ ... 17/5/2021 م'. The Saudi Exchange Holiday Calendar entry ('First day of Eid Al Fiter is 13/5/2021. Last day ... 16/5/2021') names the public Eid days, not the market closure; Argaam 2021-05-11 (https://www.argaam.com/en/article/articledetail/id/1466918): 'closed ... starting from today, May 11, 2021 ... Trading will resume on Monday, May 17'. Ramadan hours unchanged (10:00-15:00)."
    :closed (((2021 5 11) "Eid Al-Fitr") ((2021 5 12) "Eid Al-Fitr") ((2021 5 13) "Eid Al-Fitr") ((2021 5 16) "Eid Al-Fitr"))
    :open () :early-closes () :late-opens ())
   (:title "Saudi Exchange Holiday Calendar 2021: Eid Al-Adha (ends 15/7/2021, resumes 25/7/2021); National Day 23/9/2021" :year 2021
    :uri "https://web.archive.org/web/20230401222718id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20210210020418id_/https://www.tadawul.com.sa/wps/portal/tadawul/about/about_events/events_calendar?locale=ar"
    :published-in "Tadawul Events & Calendar (2021-02 snapshot: provisional Eid days) / Saudi Exchange Holiday Calendar (final entries)"
    :dates-note "The Feb-2021 calendar gave Eid Al-Adha as 19/7-23/7/2021 and National Day as 'ends Thursday 22/9/2021, resumes Sunday 26/9/2021' (22/9/2021 is a Wednesday; typo). Final entries: 'Trading will discontinue at the end of trading day 15/7/2021. Trading will resume after the holiday on 25/7/2021.'; 'National Day of Saudi Arabia is on 23/9/2021.' National Day comes from the rule."
    :closed (((2021 7 18) "Eid Al-Adha") ((2021 7 19) "Eid Al-Adha") ((2021 7 20) "Eid Al-Adha") ((2021 7 21) "Eid Al-Adha") ((2021 7 22) "Eid Al-Adha"))
    :open () :early-closes () :late-opens ())
   (:title "Saudi Exchange: Ramadan trading hours and Eid Al-Fitr holiday 2022 (ends Thursday 28 April 2022 / 27 Ramadan 1443, resumes Sunday 8 May 2022 / 7 Shawwal 1443)" :year 2022
    :uri "https://mondovisione.com/media-and-resources/news/trading-hours-during-the-holy-month-of-ramadan-eid-al-fiter-holiday-for-the-saud-1-2022320"
    :issued (2022 3 17) :issued-uri "https://mondovisione.com/media-and-resources/news/trading-hours-during-the-holy-month-of-ramadan-eid-al-fiter-holiday-for-the-saud-1-2022320"
    :published (2022 3 17) :published-uri "https://mondovisione.com/media-and-resources/news/trading-hours-during-the-holy-month-of-ramadan-eid-al-fiter-holiday-for-the-saud-1-2022320"
    :published-in "Saudi Exchange announcement, reproduced by Mondo Visione"
    :confidence :secondary
    :dates-note "Trading discontinues at the end of Thursday 28 April 2022 and resumes Sunday 8 May 2022. The Saudi Exchange Holiday Calendar writes the same period as 'First day of Eid Al Fiter is 28/4/2022. Last day of Eid Al Fiter is 8/5/2022' (range 28/04/2022 - 08/05/2022 = last trading day / resumption day). Ramadan hours unchanged."
    :closed (((2022 5 1) "Eid Al-Fitr") ((2022 5 2) "Eid Al-Fitr") ((2022 5 3) "Eid Al-Fitr") ((2022 5 4) "Eid Al-Fitr") ((2022 5 5) "Eid Al-Fitr"))
    :open () :early-closes () :late-opens ())
   (:title "Saudi Exchange Holiday Calendar 2022: Founding Day 22/02/2022; Eid Al-Adha (ends 6/7/2022, resumes 13/7/2022); National Day on 22/9/2022" :year 2022
    :uri "https://web.archive.org/web/20230401222718id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20230401222718id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar"
    :published-in "Saudi Exchange website, Holiday Calendar"
    :dates-note "'Trading will discontinue at the end of trading day 6/7/2022. Trading will resume after the holiday on 13/7/2022.' 'National Day of Saudi Arabia is on 22/9/2022.' (23 Sep 2022 is a Friday; Thursday 22 Sep closed instead.) Founding Day 22 Feb from the rule."
    :closed (((2022 7 7) "Eid Al-Adha") ((2022 7 10) "Eid Al-Adha") ((2022 7 11) "Eid Al-Adha") ((2022 7 12) "Eid Al-Adha")
             ((2022 9 22) "National Day (23 Sep is a Friday)"))
    :open () :early-closes () :late-opens ())
   (:title "Saudi Exchange Holiday Calendar 2023: Founding Day; Eid Al-Fitr (ends 17-04-2023, resumes 25-04-2023); Eid Al-Adha (ends Thursday 22-06-2023, resumes Sunday 02-07-2023); National Day (ends 21-09-2023, resumes 25-09-2023)" :year 2023
    :uri "https://web.archive.org/web/20260719180652id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20230401222718id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar"
    :published-in "Saudi Exchange website, Holiday Calendar"
    :dates-note "The 2023-04-01 snapshot had a provisional Eid Al-Adha entry 'Trading will discontinue at the end of trading day 26-06-2023. Trading will resume after the holiday on 02-07-2023' and National Day 'on 23-09-2023 ** Date will be updated according to official announcement'. The final entries (2025/2026 snapshots) read 'Thursday 22-06-2023' / 'Sunday 02-07-2023' and 'discontinue at the end of trading day 21-09-2023 ... resume ... 25-09-2023' (23 Sep 2023 is a Saturday; Sunday 24 Sep closed)."
    :closed (((2023 4 18) "Eid Al-Fitr") ((2023 4 19) "Eid Al-Fitr") ((2023 4 20) "Eid Al-Fitr") ((2023 4 23) "Eid Al-Fitr") ((2023 4 24) "Eid Al-Fitr")
             ((2023 6 25) "Eid Al-Adha") ((2023 6 26) "Eid Al-Adha") ((2023 6 27) "Eid Al-Adha") ((2023 6 28) "Eid Al-Adha") ((2023 6 29) "Eid Al-Adha")
             ((2023 9 24) "National Day (23 Sep is a Saturday)"))
    :open () :early-closes () :late-opens ())
   (:title "Saudi Exchange Holiday Calendar 2024: Founding Day 22/02/2024; Eid Al-Fitr (ends 04/04/2024, resumes 14/04/2024); Eid Al-Adha (ends 13/06/2024, resumes 23/06/2024); National Day 23/09/2024" :year 2024
    :uri "https://web.archive.org/web/20250317103459id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20250317103459id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar"
    :published-in "Saudi Exchange website, Holiday Calendar"
    :dates-note "Ranges '04/04/2024 - 14/04/2024' and '13/06/2024 - 23/06/2024' are last trading day / resumption day ('Trading will discontinue at the end of trading day 04/04/2024. Trading will resume after the holiday on 14/04/2024.'). Founding Day and National Day from the rules."
    :closed (((2024 4 7) "Eid Al-Fitr") ((2024 4 8) "Eid Al-Fitr") ((2024 4 9) "Eid Al-Fitr") ((2024 4 10) "Eid Al-Fitr") ((2024 4 11) "Eid Al-Fitr")
             ((2024 6 16) "Eid Al-Adha") ((2024 6 17) "Eid Al-Adha") ((2024 6 18) "Eid Al-Adha") ((2024 6 19) "Eid Al-Adha") ((2024 6 20) "Eid Al-Adha"))
    :open () :early-closes () :late-opens ())
   (:title "Saudi Exchange Holiday Calendar 2025: Founding Day on 23/02/2025; Eid Al-Fitr (ends 27/03/2025, resumes 03/04/2025); Eid Al-Adha (ends 04/06/2025, resumes 11/06/2025); National Day 23/09/2025" :year 2025
    :uri "https://web.archive.org/web/20260719180652id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20250317103459id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar"
    :published-in "Saudi Exchange website, Holiday Calendar"
    :dates-note "Founding Day 22 Feb 2025 is a Saturday: 'Founding Day of Saudi Arabia is on 23/02/2025' (Sunday closed; Argaam 2025-02-16, https://www.argaam.com/en/article/articledetail/id/1790408: 'closed on Sunday, Feb. 23 ... resume on Monday, Feb. 24'). Eid Al-Fitr: 'discontinue at the end of trading day 27/03/2025 ... resume ... 03/04/2025' (27 Mar is a session although the range reads 27/03/2025 - 02/04/2025). Eid Al-Adha: the 2025-03-17 snapshot said 'resume ... 14/06/2025' (provisional, a Saturday); final '... 04/06/2025 ... resume ... 11/06/2025'."
    :closed (((2025 2 23) "Founding Day (22 Feb is a Saturday)")
             ((2025 3 30) "Eid Al-Fitr") ((2025 3 31) "Eid Al-Fitr") ((2025 4 1) "Eid Al-Fitr") ((2025 4 2) "Eid Al-Fitr")
             ((2025 6 5) "Eid Al-Adha") ((2025 6 8) "Eid Al-Adha") ((2025 6 9) "Eid Al-Adha") ((2025 6 10) "Eid Al-Adha"))
    :open () :early-closes () :late-opens ())
   (:title "Saudi Exchange Holiday Calendar 2026: Founding Day 22/02/2026; Eid Al-Fitr (ends 16/03/2026, resumes 24/03/2026); Eid Al-Adha (ends 21/05/2026, resumes 31/05/2026); National Day 23/09/2026" :year 2026
    :uri "https://web.archive.org/web/20260719180652id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20260719180652id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar"
    :published-in "Saudi Exchange website, Holiday Calendar (Eid Al-Fitr also in the market notice of 2026-02-09 on Ramadan hours, not fetchable: HTTP 403)"
    :dates-note "Founding Day 22 Feb 2026 is a Sunday (rule). National Day Wed 23 Sep (rule)."
    :closed (((2026 3 17) "Eid Al-Fitr") ((2026 3 18) "Eid Al-Fitr") ((2026 3 19) "Eid Al-Fitr") ((2026 3 22) "Eid Al-Fitr") ((2026 3 23) "Eid Al-Fitr")
             ((2026 5 24) "Eid Al-Adha") ((2026 5 25) "Eid Al-Adha") ((2026 5 26) "Eid Al-Adha") ((2026 5 27) "Eid Al-Adha") ((2026 5 28) "Eid Al-Adha"))
    :open () :early-closes () :late-opens ())
   (:title "Saudi Exchange Holiday Calendar 2027 (planned, Umm al-Qura): Founding Day 22/02/2027; Eid Al-Fitr (ends 04/03/2027, resumes 14/03/2027); Eid Al-Adha (ends 13/05/2027, resumes 23/05/2027); National Day 23/09/2027" :year 2027
    :uri "https://web.archive.org/web/20260719180652id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20260719180652id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar"
    :published-in "Saudi Exchange website, Holiday Calendar ('* According to the UMM AL-QURA calendar')"
    :dates-note "Planned dates; earlier years show Tadawul revising Eid entries after the official announcement (2023, 2025), so re-check before relying on them."
    :closed (((2027 3 7) "Eid Al-Fitr") ((2027 3 8) "Eid Al-Fitr") ((2027 3 9) "Eid Al-Fitr") ((2027 3 10) "Eid Al-Fitr") ((2027 3 11) "Eid Al-Fitr")
             ((2027 5 16) "Eid Al-Adha") ((2027 5 17) "Eid Al-Adha") ((2027 5 18) "Eid Al-Adha") ((2027 5 19) "Eid Al-Adha") ((2027 5 20) "Eid Al-Adha"))
    :open () :early-closes () :late-opens ())
   (:title "Saudi Exchange Holiday Calendar 2028 (planned, Umm al-Qura): Eid Al-Fitr (ends 24/02/2028, resumes 05/03/2028); Eid Al-Adha (ends 02/05/2028, resumes 10/05/2028)" :year 2028
    :uri "https://web.archive.org/web/20260719180652id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://web.archive.org/web/20260719180652id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar"
    :published-in "Saudi Exchange website, Holiday Calendar ('* According to the UMM AL-QURA calendar')"
    :dates-note "Planned dates. No 2028 Founding Day (Tue 22 Feb, rule) or National Day entry yet; 23 Sep 2028 is a Saturday, so a substitute day (Thu 21 or Sun 24 Sep) is likely but unannounced. Calendar also lists 2029 Eids (Fitr: ends 11/02/2029, resumes 19/02/2029; Adha: ends 19/04/2029, resumes 29/04/2029)."
    :closed (((2028 2 27) "Eid Al-Fitr") ((2028 2 28) "Eid Al-Fitr") ((2028 2 29) "Eid Al-Fitr") ((2028 3 1) "Eid Al-Fitr") ((2028 3 2) "Eid Al-Fitr")
             ((2028 5 3) "Eid Al-Adha") ((2028 5 4) "Eid Al-Adha") ((2028 5 7) "Eid Al-Adha") ((2028 5 8) "Eid Al-Adha") ((2028 5 9) "Eid Al-Adha"))
    :open () :early-closes () :late-opens ())
 )
 :gaps ((:years "2001-2002" :note "No Tadawul list found: the old site's Announcements.ASP page is archived only from 2003-04 (web.archive.org CDX tadawul.com.sa/reports/Announcements.ASP*). Eid closures unknown.")
        (:years "2004 (Eid Al-Adha)" :note "Tadawul announcement 2004-01-27 (https://web.archive.org/web/20040206011051id_/http://www.tadawul.com.sa:80/reports/announcements.asp): last trading day before Eid Al-Adha is Wednesday 28/1/2004 (end of the evening period). Resumption date not in any archived snapshot (2004-02-06 page: market closed; trading again by Saturday 2004-02-14). Not encoded.")
        (:years "2005-2014" :note "No exchange list found. Searched: web.archive.org CDX for tadawul.com.sa (Announcements.ASP snapshots stop 2005-05 and later ones are 'Information not available'; the 2007-2015 portal announcements are opaque ANNOUNCEMENT_NO URLs; homepage snapshots sparse), WebSearch (Argaam/Mondo Visione) for each Eid. The Tadawul Trading Times pages (2007-2014) confirm the rule 'Eid Al-Fitr and Eid Al-Adha ... announced on Tadawul website' but not the dates.")
        (:years "2015-2019 (partly)" :note "Only secondary copies found for: 2015 Fitr, 2016 Adha, 2017 Fitr+Adha, 2018 Fitr+Adha (notices above). Missing: 2015 Adha, 2016 Fitr, 2019 Fitr+Adha. Tadawul press-release snapshots 2018-2021 on web.archive.org (998 URLs) were sampled (about 140 fetched), no Eid notice for 2019 among them.")
        (:years "National Day weekend substitutes before 2022" :note "When 23 Sep fell on a weekend (e.g. Fri 2016, Sat 2017) a substitute closure may have applied; not verified."))
)
