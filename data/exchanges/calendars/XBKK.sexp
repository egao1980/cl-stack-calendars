;;;; XBKK exchange trading-day calendar (#49), Stock Exchange of Thailand.
;;;; SET closes on the Bank of Thailand financial-institution holidays: SET holiday page note (2012-2021
;;;; snapshots): "การเปลี่ยนแปลงวันหยุดทำการของตลาดหลักทรัพย์แห่งประเทศไทย เป็นไปตามประกาศของธนาคารแห่งประเทศไทย
;;;; และสำนักงานคณะกรรมการ ก.ล.ต." (changes to SET holidays follow BOT and SEC announcements). The SET lists
;;;; 2012-2023 (Wayback copies cached in ~/.cache/cl-stack-calendars/exchanges/xbkk/) equal the BOT lists
;;;; (TH-BANK) date for date; the only BOT change after the 2023 snapshot (29 Dec 2023) is also in ec.
;;;; set.or.th is behind Incapsula (403 to curl) and web.archive.org is unreachable now, so 2024-2027 SET
;;;; lists could not be read; TH-BANK (BOT) is the base there too.

(:name "XBKK"
 :title "Stock Exchange of Thailand trading days"
 :authority "SET holiday calendar (set.or.th/set/holiday.do, /api/set/holiday/year) - follows BOT financial-institution holidays and SEC announcements" :authority-uri "https://www.set.or.th/set/holiday.do"
 :bases ((:calendar "TH-BANK" :from nil :to nil
          :authority "SET holiday page 2012-2021 note: SET holiday changes follow BOT and SEC announcements; SET lists 2012-2023 identical to BOT FI holiday lists. https://web.archive.org/web/20170713142428/https://www.set.or.th/set/holiday.do?year=2012"))
 :rules ()
 :gaps (
   (:years "2000-2011" :note "No SET yearly holiday list retrieved (set.or.th holiday.do Wayback captures start 2016 with year pages from 2012; web.archive.org unreachable in this session). Best evidence: BOT FI holiday pages 2000-2011 (Wayback, cached ~/.cache/cl-stack-calendars/th/bot-wayback/) via the TH-BANK base. ec disagrees with BOT on 2000-02-21, 2000-05-17/18, 2000-07-17, 2001-05-08, 2001-07-05/06 - unresolved by an SET source.")
   (:years "2024-2027" :note "SET holiday pages for these years are client-rendered (Nuxt, data from /api/set/holiday/year/<Y>, 403 behind Incapsula); cached page shells 2024-2026 carry no dates. Base TH-BANK (BOT notifications) used; evidence for specific dates in notices below is secondary."))
 :notices (
   (:title "SET holiday calendar 2012" :year 2012
    :uri "https://web.archive.org/web/20170713142428/https://www.set.or.th/set/holiday.do?year=2012"
    :issued nil :issued-uri nil :published nil :published-uri "https://web.archive.org/web/20170713142428/https://www.set.or.th/set/holiday.do?year=2012"
    :published-in "SET website, holiday calendar (Wayback capture 20170713)"
    :dates-note "Undated web list. SET holidays 2012: 2012-01-02, 2012-01-03, 2012-03-07, 2012-04-06, 2012-04-09, 2012-04-13, 2012-04-16, 2012-05-01, 2012-05-07, 2012-06-04, 2012-08-02, 2012-08-13, 2012-10-23, 2012-12-05, 2012-12-10, 2012-12-31. Identical to the BOT FI list."
    :closed () :open () :early-closes () :late-opens ())
   (:title "SET holiday calendar 2013" :year 2013
    :uri "https://web.archive.org/web/20190405080826/https://www.set.or.th/set/holiday.do?year=2013"
    :issued nil :issued-uri nil :published nil :published-uri "https://web.archive.org/web/20190405080826/https://www.set.or.th/set/holiday.do?year=2013"
    :published-in "SET website, holiday calendar (Wayback capture 20190405)"
    :dates-note "Undated web list. SET holidays 2013: 2013-01-01, 2013-02-25, 2013-04-08, 2013-04-15, 2013-04-16, 2013-05-01, 2013-05-06, 2013-05-24, 2013-07-01, 2013-07-22, 2013-08-12, 2013-10-23, 2013-12-05, 2013-12-10, 2013-12-30, 2013-12-31. Identical to the BOT FI list."
    :closed () :open () :early-closes () :late-opens ())
   (:title "SET holiday calendar 2014" :year 2014
    :uri "https://web.archive.org/web/20190917124926/https://www.set.or.th/set/holiday.do?year=2014"
    :issued nil :issued-uri nil :published nil :published-uri "https://web.archive.org/web/20190917124926/https://www.set.or.th/set/holiday.do?year=2014"
    :published-in "SET website, holiday calendar (Wayback capture 20190917)"
    :dates-note "Undated web list. SET holidays 2014: 2014-01-01, 2014-02-14, 2014-04-07, 2014-04-14, 2014-04-15, 2014-05-01, 2014-05-05, 2014-05-13, 2014-07-01, 2014-07-11, 2014-08-11, 2014-08-12, 2014-10-23, 2014-12-05, 2014-12-10, 2014-12-31. Identical to the BOT FI list."
    :closed () :open () :early-closes () :late-opens ())
   (:title "SET holiday calendar 2015" :year 2015
    :uri "https://web.archive.org/web/20190917124210/https://www.set.or.th/set/holiday.do?year=2015"
    :issued nil :issued-uri nil :published nil :published-uri "https://web.archive.org/web/20190917124210/https://www.set.or.th/set/holiday.do?year=2015"
    :published-in "SET website, holiday calendar (Wayback capture 20190917)"
    :dates-note "Undated web list. SET holidays 2015: 2015-01-01, 2015-01-02, 2015-03-04, 2015-04-06, 2015-04-13, 2015-04-14, 2015-04-15, 2015-05-01, 2015-05-04, 2015-05-05, 2015-06-01, 2015-07-01, 2015-07-30, 2015-08-12, 2015-10-23, 2015-12-07, 2015-12-10, 2015-12-31. Identical to the BOT FI list."
    :closed () :open () :early-closes () :late-opens ())
   (:title "SET holiday calendar 2016" :year 2016
    :uri "https://web.archive.org/web/20210818094920/https://www.set.or.th/set/holiday.do?year=2016"
    :issued nil :issued-uri nil :published nil :published-uri "https://web.archive.org/web/20210818094920/https://www.set.or.th/set/holiday.do?year=2016"
    :published-in "SET website, holiday calendar (Wayback capture 20210818)"
    :dates-note "Undated web list. SET holidays 2016: 2016-01-01, 2016-02-22, 2016-04-06, 2016-04-13, 2016-04-14, 2016-04-15, 2016-05-02, 2016-05-05, 2016-05-06, 2016-05-20, 2016-07-01, 2016-07-18, 2016-07-19, 2016-08-12, 2016-10-24, 2016-12-05, 2016-12-12. Identical to the BOT FI list."
    :closed () :open () :early-closes () :late-opens ())
   (:title "SET holiday calendar 2017" :year 2017
    :uri "https://web.archive.org/web/20210818093849/https://www.set.or.th/set/holiday.do?year=2017"
    :issued nil :issued-uri nil :published nil :published-uri "https://web.archive.org/web/20210818093849/https://www.set.or.th/set/holiday.do?year=2017"
    :published-in "SET website, holiday calendar (Wayback capture 20210818)"
    :dates-note "Undated web list. SET holidays 2017: 2017-01-02, 2017-01-03, 2017-02-13, 2017-04-06, 2017-04-13, 2017-04-14, 2017-05-01, 2017-05-10, 2017-07-10, 2017-07-28, 2017-08-14, 2017-10-13, 2017-10-23, 2017-10-26, 2017-12-05, 2017-12-11. Identical to the BOT FI list."
    :closed () :open () :early-closes () :late-opens ())
   (:title "SET holiday calendar 2018" :year 2018
    :uri "https://web.archive.org/web/20200806072749/https://www.set.or.th/set/holiday.do?year=2018"
    :issued nil :issued-uri nil :published nil :published-uri "https://web.archive.org/web/20200806072749/https://www.set.or.th/set/holiday.do?year=2018"
    :published-in "SET website, holiday calendar (Wayback capture 20200806)"
    :dates-note "Undated web list. SET holidays 2018: 2018-01-01, 2018-01-02, 2018-03-01, 2018-04-06, 2018-04-13, 2018-04-16, 2018-05-01, 2018-05-29, 2018-07-27, 2018-07-30, 2018-08-13, 2018-10-15, 2018-10-23, 2018-12-05, 2018-12-10, 2018-12-31. Identical to the BOT FI list."
    :closed () :open () :early-closes () :late-opens ())
   (:title "SET holiday calendar 2019" :year 2019
    :uri "https://web.archive.org/web/20210818094046/https://www.set.or.th/set/holiday.do?year=2019"
    :issued nil :issued-uri nil :published nil :published-uri "https://web.archive.org/web/20210818094046/https://www.set.or.th/set/holiday.do?year=2019"
    :published-in "SET website, holiday calendar (Wayback capture 20210818)"
    :dates-note "Undated web list. SET holidays 2019: 2019-01-01, 2019-02-19, 2019-04-08, 2019-04-15, 2019-04-16, 2019-05-01, 2019-05-06, 2019-05-20, 2019-06-03, 2019-07-16, 2019-07-29, 2019-08-12, 2019-10-14, 2019-10-23, 2019-12-05, 2019-12-10, 2019-12-31. Identical to the BOT FI list."
    :closed () :open () :early-closes () :late-opens ())
   (:title "SET holiday calendar 2020" :year 2020
    :uri "https://web.archive.org/web/20210818095853/https://www.set.or.th/set/holiday.do?year=2020"
    :issued nil :issued-uri nil :published nil :published-uri "https://web.archive.org/web/20210818095853/https://www.set.or.th/set/holiday.do?year=2020"
    :published-in "SET website, holiday calendar (Wayback capture 20210818)"
    :dates-note "Undated web list. SET holidays 2020: 2020-01-01, 2020-02-10, 2020-04-06, 2020-05-01, 2020-05-04, 2020-05-06, 2020-06-03, 2020-07-06, 2020-07-27, 2020-07-28, 2020-08-12, 2020-09-04, 2020-09-07, 2020-10-13, 2020-10-23, 2020-12-07, 2020-12-10, 2020-12-11, 2020-12-31. Identical to the BOT FI list. Songkran 13-15 Apr 2020 postponed (not SET holidays); substitutes 27 Jul, 4 Sep, 7 Sep and special 11 Dec 2020 are SET holidays."
    :closed () :open () :early-closes () :late-opens ())
   (:title "SET holiday calendar 2021" :year 2021
    :uri "https://web.archive.org/web/20210818093150/https://www.set.or.th/set/holiday.do?year=2021"
    :issued nil :issued-uri nil :published nil :published-uri "https://web.archive.org/web/20210818093150/https://www.set.or.th/set/holiday.do?year=2021"
    :published-in "SET website, holiday calendar (Wayback capture 20210818)"
    :dates-note "Undated web list. SET holidays 2021: 2021-01-01, 2021-02-12, 2021-02-26, 2021-04-06, 2021-04-13, 2021-04-14, 2021-04-15, 2021-05-03, 2021-05-04, 2021-05-26, 2021-06-03, 2021-07-26, 2021-07-28, 2021-08-12, 2021-09-24, 2021-10-13, 2021-10-22, 2021-12-06, 2021-12-10, 2021-12-31. Identical to the BOT FI list. Chulalongkorn Day (Sat 23 Oct) substituted on Fri 22 Oct 2021 (not Mon 25 Oct)."
    :closed () :open () :early-closes () :late-opens ())
   (:title "SET holiday calendar 2022" :year 2022
    :uri "https://web.archive.org/web/20230110135324/https://www.set.or.th/api/set/holiday/year/2022?lang=en"
    :issued nil :issued-uri nil :published nil :published-uri "https://web.archive.org/web/20230110135324/https://www.set.or.th/api/set/holiday/year/2022?lang=en"
    :published-in "SET website holiday API (Wayback capture 20230110)"
    :dates-note "Undated web list. SET holidays 2022: 2022-01-03, 2022-02-16, 2022-04-06, 2022-04-13, 2022-04-14, 2022-04-15, 2022-05-02, 2022-05-04, 2022-05-16, 2022-06-03, 2022-07-13, 2022-07-28, 2022-07-29, 2022-08-12, 2022-10-13, 2022-10-14, 2022-10-24, 2022-12-05, 2022-12-12. Identical to the BOT FI list."
    :closed () :open () :early-closes () :late-opens ())
   (:title "SET holiday calendar 2023" :year 2023
    :uri "https://web.archive.org/web/20230620111333/https://www.set.or.th/api/set/holiday/year/2023?lang=en"
    :issued nil :issued-uri nil :published nil :published-uri "https://web.archive.org/web/20230620111333/https://www.set.or.th/api/set/holiday/year/2023?lang=en"
    :published-in "SET website holiday API (Wayback capture 20230620)"
    :dates-note "Undated web list. SET holidays 2023: 2023-01-02, 2023-03-06, 2023-04-06, 2023-04-13, 2023-04-14, 2023-05-01, 2023-05-04, 2023-05-05, 2023-06-05, 2023-07-28, 2023-08-01, 2023-08-14, 2023-10-13, 2023-10-23, 2023-12-05, 2023-12-11. Identical to the BOT FI list except BOT's later 29 Dec 2023 (added Nov 2023, after this capture)."
    :closed () :open () :early-closes () :late-opens ())
   (:title "Thai Bourse Closes Today (SET announcement, 20 Sep 2006)" :year 2006
    :uri "https://mondovisione.com/news/thai-bourse-closes-today-2011124"
    :issued (2006 9 20) :issued-uri "https://mondovisione.com/news/thai-bourse-closes-today-2011124"
    :published (2006 9 20) :published-uri "https://mondovisione.com/news/thai-bourse-closes-today-2011124"
    :published-in "SET press announcement as republished by Mondo Visione"
    :dates-note "Text: 'The Stock Exchange of Thailand (SET) announces the market close today (Wed. Sep. 20). This will include trading on the SET, mai, and BEX.' Resumption notice same day: https://mondovisione.com/news/thai-bourse-to-resume-trading-on-thursday-september-21-2011124 . Not a BOT FI holiday (BOT 2006 list has no September day)."
    :confidence :secondary
    :closed (((2006 9 20) "Market closed after the 19 Sep 2006 coup (military-declared holiday)"))
    :open () :early-closes () :late-opens ())
   (:title "SEC special holiday for securities firms: Fri 16 Oct 2026 (IMF/World Bank meetings, Bangkok)" :year 2026
    :uri "https://www.pptvhd36.com/wealth/stock-investment/278867"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.pptvhd36.com/wealth/stock-investment/278867"
    :published-in "PPTV HD36 report of the SEC announcement (SEC/SET originals not reachable)"
    :dates-note "Cabinet 19 May 2026 added a Bangkok-only government holiday; BOT notification 26/2569 (TH-BANK) and the SEC both made it a holiday for financial institutions / securities firms. The base already closes it; notice kept as evidence that SET follows."
    :confidence :secondary
    :closed () :open () :early-closes () :late-opens ())
   (:title "SEC special holiday for securities firms and TFEX: Wed 16 Dec 2026" :year 2026
    :uri "https://www.posttoday.com/business/stockholder/752147"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.posttoday.com/business/stockholder/752147"
    :published-in "Post Today report of the SEC announcement"
    :dates-note "BOT notification 61/2569 (TH-BANK) closes 16 Dec 2026; base already closes it."
    :confidence :secondary
    :closed () :open () :early-closes () :late-opens ())
   (:title "SET traded Tue 2 Jan 2024 (first session of 2024)" :year 2024
    :uri "https://www.thairath.co.th/money/investment/stocks/2752222"
    :issued nil :issued-uri nil :published nil :published-uri "https://www.thairath.co.th/money/investment/stocks/2752222"
    :published-in "Thai Rath market report"
    :dates-note "SET index 2 Jan 2024 closed at 1,433.38 (+17.53), value THB 43,272 m - a trading day. BOT moved the substitute year-end holiday from 2 Jan 2024 to 29 Dec 2023 (TH-BANK :suppressed); SET followed. Base already opens it."
    :confidence :secondary
    :closed () :open () :early-closes () :late-opens ())))
