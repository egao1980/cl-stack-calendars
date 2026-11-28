;;;; XSWX draft (cl-stack-calendars #49). Rules = ec closures for 2000-2028 exactly; per-year evidence 2012-2022
;;;; (SIX Exfeed holiday messages) and 2026-2027 (SIX trading calendar). No early closes.
;;;; The registered CH civil calendar must NOT be the base: it lacks Good Friday, Easter Monday, 1 May, Ascension,
;;;; Whit Monday, 2 Jan, 24/26/31 Dec (see SCRATCH/diffs/XSWX.txt).

(:name "XSWX"
 :title "SIX Swiss Exchange trading days"
 :authority "SIX Swiss Exchange, Trading & Currency Holiday Calendar / Trading Guide; Directive 3: Trading (exchange days)" :authority-uri "https://www.six-group.com/en/market-data/news-tools/trading-currency-holiday-calendar.html"
 :rules ((:fixed "New Year's Day" 1 1 :authority "SIX trading calendars 2026/2027 and Exfeed holiday messages 2012-2022")
         (:fixed "Berchtoldstag" 1 2 :authority "SIX trading calendars 2026/2027 and Exfeed holiday messages 2012-2022")
         (:easter "Good Friday" -2 :authority "SIX trading calendars 2026/2027 and Exfeed holiday messages 2012-2022")
         (:easter "Easter Monday" 1 :authority "SIX trading calendars 2026/2027 and Exfeed holiday messages 2012-2022")
         (:fixed "Labour Day" 5 1 :authority "SIX trading calendars 2026/2027 and Exfeed holiday messages 2012-2022")
         (:easter "Ascension Day" 39 :authority "SIX trading calendars 2026/2027 and Exfeed holiday messages 2012-2022")
         (:easter "Whit Monday" 50 :authority "SIX trading calendars 2026/2027 and Exfeed holiday messages 2012-2022")
         (:fixed "Swiss National Day" 8 1 :authority "SIX trading calendars 2026/2027 and Exfeed holiday messages 2012-2022")
         (:fixed "Christmas Eve" 12 24 :authority "SIX trading calendars 2026/2027 and Exfeed holiday messages 2012-2022")
         (:fixed "Christmas Day" 12 25 :authority "SIX trading calendars 2026/2027 and Exfeed holiday messages 2012-2022")
         (:fixed "St. Stephen's Day" 12 26 :authority "SIX trading calendars 2026/2027 and Exfeed holiday messages 2012-2022")
         (:fixed "New Year's Eve" 12 31 :authority "SIX trading calendars 2026/2027 and Exfeed holiday messages 2012-2022"))
 :notices (
   (:title "SIX Exfeed Message 05/2012: exchange holidays" :year 2012
    :uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2012/exfeed-message-2012-05.pdf"
    :issued (2012 3 2) :issued-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2012/exfeed-message-2012-05.pdf"
    :published (2012 3 2) :published-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2012/exfeed-message-2012-05.pdf"
    :published-in "SIX Exfeed message (market-data vendor notice citing the SIX trading calendar)"
    :dates-note "Vendor notice from SIX's market-data arm; it restates the official SIX Swiss Exchange trading calendar for that period."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "SIX Swiss Exchange not available: 06.04, 09.04, 01.05, 17.05 (Ascension), 28.05 (Whit Monday), 01.08.2012.")
   (:title "SIX Exfeed Message 23/2012: exchange holidays" :year 2012
    :uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2012/exfeed-message-2012-23.pdf"
    :issued (2012 11 22) :issued-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2012/exfeed-message-2012-23.pdf"
    :published (2012 11 22) :published-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2012/exfeed-message-2012-23.pdf"
    :published-in "SIX Exfeed message (market-data vendor notice citing the SIX trading calendar)"
    :dates-note "Vendor notice from SIX's market-data arm; it restates the official SIX Swiss Exchange trading calendar for that period."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Last exchange trading day in 2012: Friday 28 December; first in 2013: Thursday 3 January (i.e. 24, 25, 26, 31 Dec 2012 and 1, 2 Jan 2013 closed).")
   (:title "SIX Exfeed Message 17/2013: exchange holidays" :year 2013
    :uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2013/exfeed-message-2013-17.pdf"
    :issued (2013 11 22) :issued-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2013/exfeed-message-2013-17.pdf"
    :published (2013 11 22) :published-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2013/exfeed-message-2013-17.pdf"
    :published-in "SIX Exfeed message (market-data vendor notice citing the SIX trading calendar)"
    :dates-note "Vendor notice from SIX's market-data arm; it restates the official SIX Swiss Exchange trading calendar for that period."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "SIX Swiss exchange not available 24, 25, 26, 31.12.2013 and 01, 02.01.2014. Last trading day 2013: Monday 30 December; first 2014: Friday 3 January.")
   (:title "SIX Exfeed Message 16/2014: exchange holidays" :year 2014
    :uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2014/exfeed-message-2014-16.pdf"
    :issued (2014 11 18) :issued-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2014/exfeed-message-2014-16.pdf"
    :published (2014 11 18) :published-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2014/exfeed-message-2014-16.pdf"
    :published-in "SIX Exfeed message (market-data vendor notice citing the SIX trading calendar)"
    :dates-note "Vendor notice from SIX's market-data arm; it restates the official SIX Swiss Exchange trading calendar for that period."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "XSWX n.a. 24, 25, 26, 31.12.2014 and 01, 02.01.2015 (06.01.2015 available). Last trading day 2014: Tuesday 30 December; first 2015: Monday 5 January.")
   (:title "SIX Exfeed Message 02/2015: exchange holidays" :year 2015
    :uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2015/exfeed-message-2015-02.pdf"
    :issued (2015 3 13) :issued-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2015/exfeed-message-2015-02.pdf"
    :published (2015 3 13) :published-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2015/exfeed-message-2015-02.pdf"
    :published-in "SIX Exfeed message (market-data vendor notice citing the SIX trading calendar)"
    :dates-note "Vendor notice from SIX's market-data arm; it restates the official SIX Swiss Exchange trading calendar for that period."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange holidays 03.04, 06.04, 01.05, 14.05 (Ascension), 25.05.2015 (Whit Monday).")
   (:title "SIX Exfeed Message 15/2015: exchange holidays" :year 2015
    :uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2015/exfeed-message-2015-15.pdf"
    :issued (2015 12 3) :issued-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2015/exfeed-message-2015-15.pdf"
    :published (2015 12 3) :published-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2015/exfeed-message-2015-15.pdf"
    :published-in "SIX Exfeed message (market-data vendor notice citing the SIX trading calendar)"
    :dates-note "Vendor notice from SIX's market-data arm; it restates the official SIX Swiss Exchange trading calendar for that period."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Last exchange trading day in 2015: Wednesday 30 December; first in 2016: Monday 4 January.")
   (:title "SIX Exfeed Message 02/2016: exchange holidays" :year 2016
    :uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2016/exfeed-message-2016-02.pdf"
    :issued (2016 2 8) :issued-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2016/exfeed-message-2016-02.pdf"
    :published (2016 2 8) :published-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2016/exfeed-message-2016-02.pdf"
    :published-in "SIX Exfeed message (market-data vendor notice citing the SIX trading calendar)"
    :dates-note "Vendor notice from SIX's market-data arm; it restates the official SIX Swiss Exchange trading calendar for that period."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange holidays 25.03, 28.03, 01.05 (Sunday), 05.05 (Ascension), 16.05 (Whit Monday), 01.08.2016.")
   (:title "SIX Exfeed Message 19/2016: exchange holidays" :year 2016
    :uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2016/exfeed-message-2016-19.pdf"
    :issued (2016 10 28) :issued-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2016/exfeed-message-2016-19.pdf"
    :published (2016 10 28) :published-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2016/exfeed-message-2016-19.pdf"
    :published-in "SIX Exfeed message (market-data vendor notice citing the SIX trading calendar)"
    :dates-note "Vendor notice from SIX's market-data arm; it restates the official SIX Swiss Exchange trading calendar for that period."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "SIX Swiss Exchange n.a. 24-26 Dec 2016 and 31 Dec 2016-2 Jan 2017; last trading day 2016: Friday 30 December (no early close stated); first 2017: Tuesday 3 January.")
   (:title "SIX Exfeed Message 02/2017: exchange holidays" :year 2017
    :uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2017/exfeed-message-2017-02.pdf"
    :issued (2017 2 8) :issued-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2017/exfeed-message-2017-02.pdf"
    :published (2017 2 8) :published-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2017/exfeed-message-2017-02.pdf"
    :published-in "SIX Exfeed message (market-data vendor notice citing the SIX trading calendar)"
    :dates-note "Vendor notice from SIX's market-data arm; it restates the official SIX Swiss Exchange trading calendar for that period."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "SIX Swiss Exchange n.a. on Good Friday, Easter Monday, Labour Day, Ascension Day, Whit Monday, National Holiday 2017 (14.04, 17.04, 01.05, 25.05, 05.06, 01.08).")
   (:title "SIX Exfeed Message 23/2017: exchange holidays" :year 2017
    :uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2017/exfeed-message-2017-23.pdf"
    :issued (2017 10 27) :issued-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2017/exfeed-message-2017-23.pdf"
    :published (2017 10 27) :published-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2017/exfeed-message-2017-23.pdf"
    :published-in "SIX Exfeed message (market-data vendor notice citing the SIX trading calendar)"
    :dates-note "Vendor notice from SIX's market-data arm; it restates the official SIX Swiss Exchange trading calendar for that period."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "SIX Swiss Exchange n.a. Mon 25, Tue 26 Dec 2017, Mon 1, Tue 2 Jan 2018.")
   (:title "SIX Exfeed Message 07/2018: exchange holidays" :year 2018
    :uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2018/exfeed-message-2018-07.pdf"
    :issued (2018 3 21) :issued-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2018/exfeed-message-2018-07.pdf"
    :published (2018 3 21) :published-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2018/exfeed-message-2018-07.pdf"
    :published-in "SIX Exfeed message (market-data vendor notice citing the SIX trading calendar)"
    :dates-note "Vendor notice from SIX's market-data arm; it restates the official SIX Swiss Exchange trading calendar for that period."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "SIX Swiss Exchange n.a. Good Friday, Easter Monday, Labour Day, Ascension Day, Whit Monday 2018 (30.03, 02.04, 01.05, 10.05, 21.05).")
   (:title "SIX Exfeed Message 07/2019: exchange holidays" :year 2019
    :uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2019/exfeed-message-2019-07.pdf"
    :issued (2019 4 12) :issued-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2019/exfeed-message-2019-07.pdf"
    :published (2019 4 12) :published-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2019/exfeed-message-2019-07.pdf"
    :published-in "SIX Exfeed message (market-data vendor notice citing the SIX trading calendar)"
    :dates-note "Vendor notice from SIX's market-data arm; it restates the official SIX Swiss Exchange trading calendar for that period."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange holidays: 19 Apr, 22 Apr, 1 May, 30 May, 10 Jun, 1 Aug 2019 (real-time data N/A).")
   (:title "SIX Exfeed Message 14/2019: exchange holidays" :year 2019
    :uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2019/exfeed-message-2019-14.pdf"
    :issued (2019 11 12) :issued-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2019/exfeed-message-2019-14.pdf"
    :published (2019 11 12) :published-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2019/exfeed-message-2019-14.pdf"
    :published-in "SIX Exfeed message (market-data vendor notice citing the SIX trading calendar)"
    :dates-note "Vendor notice from SIX's market-data arm; it restates the official SIX Swiss Exchange trading calendar for that period."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange holidays: 24, 25, 26, 31 Dec 2019, 1 Jan, 2 Jan 2020 (St. Berchtold's Day).")
   (:title "SIX Exfeed Message 11/2020: exchange holidays" :year 2020
    :uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2020/exfeed-message-2020-11.pdf"
    :issued (2020 3 27) :issued-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2020/exfeed-message-2020-11.pdf"
    :published (2020 3 27) :published-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2020/exfeed-message-2020-11.pdf"
    :published-in "SIX Exfeed message (market-data vendor notice citing the SIX trading calendar)"
    :dates-note "Vendor notice from SIX's market-data arm; it restates the official SIX Swiss Exchange trading calendar for that period."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "XSWX not available: 10 Apr, 13 Apr, 1 May, 21 May, 1 Jun 2020.")
   (:title "SIX Exfeed Message 39/2020: exchange holidays" :year 2020
    :uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2020/exfeed-message-2020-39.pdf"
    :issued (2020 12 2) :issued-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2020/exfeed-message-2020-39.pdf"
    :published (2020 12 2) :published-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2020/exfeed-message-2020-39.pdf"
    :published-in "SIX Exfeed message (market-data vendor notice citing the SIX trading calendar)"
    :dates-note "Vendor notice from SIX's market-data arm; it restates the official SIX Swiss Exchange trading calendar for that period."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "XSWX not available 24.12.2020, 25.12.2020, 31.12.2020, 1.1.2021.")
   (:title "SIX Exfeed Message 08/2021: exchange holidays" :year 2021
    :uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2021/exfeed-message-2021-08.pdf"
    :issued (2021 3 29) :issued-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2021/exfeed-message-2021-08.pdf"
    :published (2021 3 29) :published-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2021/exfeed-message-2021-08.pdf"
    :published-in "SIX Exfeed message (market-data vendor notice citing the SIX trading calendar)"
    :dates-note "Vendor notice from SIX's market-data arm; it restates the official SIX Swiss Exchange trading calendar for that period."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "XSWX not available 02.04, 05.04, 13.05, 24.05.2021.")
   (:title "SIX Exfeed Message 18/2022: exchange holidays" :year 2022
    :uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2022/exfeed-message-2022-18.pdf"
    :issued (2022 7 26) :issued-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2022/exfeed-message-2022-18.pdf"
    :published (2022 7 26) :published-uri "https://www.six-group.com/dam/download/market-data/news/exfeed-messages/2022/exfeed-message-2022-18.pdf"
    :published-in "SIX Exfeed message (market-data vendor notice citing the SIX trading calendar)"
    :dates-note "Vendor notice from SIX's market-data arm; it restates the official SIX Swiss Exchange trading calendar for that period."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "1 August 2022 (Swiss public holiday): SIX Swiss Exchange (XSWX) closed.")
   (:title "SIX Swiss Exchange Trading Calendar 2026 (Trading Guide p. 38)" :year 2026
    :uri "https://www.six-group.com/dam/download/the-swiss-stock-exchange/trading/trading-provisions/regulation/trading-guides/trading-calendar-2026.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.six-group.com/en/market-data/news-tools/trading-currency-holiday-calendar.html"
    :published-in "SIX Trading & Currency Holiday Calendar page"
    :dates-note "Colour-coded grid; PDF CreationDate 2024-12-03."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Market holidays 1, 2 Jan; 3, 6 Apr; 1, 14, 25 May; 24, 25, 31 Dec (1 Aug and 26 Dec are weekend days).")
   (:title "SIX Swiss Exchange Trading Calendar 2027 (Trading Guide p. 38)" :year 2027
    :uri "https://www.six-group.com/dam/download/the-swiss-stock-exchange/trading/trading-provisions/regulation/trading-guides/trading-calendar-2027.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.six-group.com/en/market-data/news-tools/trading-currency-holiday-calendar.html"
    :published-in "SIX Trading & Currency Holiday Calendar page"
    :dates-note "Colour-coded grid; PDF CreationDate 2026-05-20."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Market holidays 1 Jan; 26, 29 Mar; 6, 17 May; 24, 31 Dec (2 Jan, 1 May, 1 Aug, 25/26 Dec on weekends).")
   (:title "SIX Swiss Exchange trading hours page: exchange days"
    :uri "https://www.six-group.com/en/products-services/the-swiss-stock-exchange/trading/trading-provisions/trading-hours.html"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.six-group.com/en/products-services/the-swiss-stock-exchange/trading/trading-provisions/trading-hours.html"
    :published-in "SIX website"
    :dates-note "Fetched 2026-11-28; no date shown."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "'The Swiss Stock Exchange is open from Monday to Friday, except on Swiss public holidays ... In exceptional cases, the Swiss Stock Exchange can also close on other days. All market holidays are listed in the trading and currency holiday calendar.' Shares 09:00-17:30 (closing auction 17:20-17:30).")
 ))
