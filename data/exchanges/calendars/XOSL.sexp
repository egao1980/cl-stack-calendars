;; Draft research data (cl-stack-calendars #49). Oslo Børs own lists (2002-2015) and Euronext calendars (2020-2027; Oslo Børs part of Euronext since 2019).
;; :listed-closed / :listed-early-closes = list as published (per-year evidence). See XOSL-hours.md / XOSL-differences.sexp.
(:name "XOSL"
 :title "Oslo Børs / Euronext Oslo trading days (equities)"
 :authority "Oslo Børs closed-days lists (Opening hours page, kalender) and Euronext holiday calendars"
 :authority-uri "https://live.euronext.com/en/resources/trading-hours-holidays"
 :bases ((:calendar "NO" :from nil :to nil :authority "every listed Oslo closure is a Norwegian public holiday (incl. Kristi himmelfartsdag) or 24/12, 31/12"))
 :rules (
   (:fixed "Julaften" 12 24 :from 2002 :authority "Oslo Børs stengt 24.12.2002 (https://web.archive.org/web/20020420023438/http://www.oslobors.no:80/asp/calendar.asp?lang=&hendelse=Oslo+B%F8rs+stengt); every later list; Euronext: Oslo Børs closed for the entire day (https://live.euronext.com/en/resources/trading-hours-holidays)")
   (:fixed "Nyttårsaften" 12 31 :from 2002 :authority "Oslo Børs stengt 31.12.2002 (https://web.archive.org/web/20020420023438/http://www.oslobors.no:80/asp/calendar.asp?lang=&hendelse=Oslo+B%F8rs+stengt); every later list; Euronext 2020/2021: closed for the entire day (https://live.euronext.com/en/resources/trading-hours-holidays)"))
 :local-calendar-kept "Oslo Børs, 01/11/2019: We have decided to keep the opening hours on Oslo Børs, and the local trading calendar will be kept too. https://web.archive.org/web/20191119230529/https://www.oslobors.no/ob_eng/Oslo-Boers/About-Oslo-Boers/News-from-Oslo-Boers/No-changes-in-opening-hours"
 :notices (
   (:title "Oslo Børs kalender: Oslo Børs stengt (2002)" :year 2002
    :uri "https://web.archive.org/web/20020420023438/http://www.oslobors.no:80/asp/calendar.asp?lang=&hendelse=Oslo+B%F8rs+stengt"
    :issued nil :issued-uri nil :published (2002 4 20) :published-uri "https://web.archive.org/web/20020420023438/http://www.oslobors.no:80/asp/calendar.asp?lang=&hendelse=Oslo+B%F8rs+stengt"
    :published-in "Oslo Børs website, nyhetstjenesten: kalender, event type \"Oslo Børs stengt\" (web.archive.org snapshot)"
    :dates-note "Undated list; :published is the capture date (an upper bound). Page also states: Onsdag før påsken avsluttes kontinuerlig omsetning kl. 13.00 i aksjemarkedet; Aksjer kont. handel 10.00-16.00."
    :listed-closed ((2002 1 1) (2002 3 28) (2002 3 29) (2002 4 1) (2002 5 1) (2002 5 9) (2002 5 17) (2002 5 20) (2002 12 24) (2002 12 25) (2002 12 26) (2002 12 31))
    :listed-early-closes (((2002 3 27) (13 0)))
    :closed () :open () :early-closes () :late-opens ())
   (:title "Oslo Børs kalender: Oslo Børs stengt (2003)" :year 2003
    :uri "https://web.archive.org/web/20030202101617/http://www.oslobors.no:80/asp/calendar.asp?symbol=&lang=&hendelse=Oslo+B%F8rs+stengt"
    :issued nil :issued-uri nil :published (2003 2 2) :published-uri "https://web.archive.org/web/20030202101617/http://www.oslobors.no:80/asp/calendar.asp?symbol=&lang=&hendelse=Oslo+B%F8rs+stengt"
    :published-in "Oslo Børs website, nyhetstjenesten: kalender, event type \"Oslo Børs stengt\" (web.archive.org snapshot)"
    :dates-note "Undated list; :published is the capture date (an upper bound). Same 13.00 Wednesday-before-Easter statement; Aksjer kont. handel 10.00-16.00."
    :listed-closed ((2003 1 1) (2003 4 17) (2003 4 18) (2003 4 21) (2003 5 1) (2003 5 29) (2003 6 9) (2003 12 24) (2003 12 25) (2003 12 26) (2003 12 31))
    :listed-early-closes (((2003 4 16) (13 0)))
    :closed () :open () :early-closes () :late-opens ())
   (:title "Oslo Børs Opening Hours: closed days 2009" :year 2009
    :uri "https://web.archive.org/web/20090509192023/http://www.oslobors.no/ob_eng/Oslo-Boers/About-us/Opening-Hours"
    :issued nil :issued-uri nil :published (2009 5 9) :published-uri "https://web.archive.org/web/20090509192023/http://www.oslobors.no/ob_eng/Oslo-Boers/About-us/Opening-Hours"
    :published-in "Oslo Børs website (web.archive.org snapshot)"
    :dates-note "Undated list; :published is the capture date (an upper bound). Half day 08.04.2009: page says Wednesday before Easter trading closes at 13.10 for equities."
    :listed-closed ((2009 1 1) (2009 4 9) (2009 4 10) (2009 4 13) (2009 5 1) (2009 5 21) (2009 6 1) (2009 12 24) (2009 12 25) (2009 12 31))
    :listed-early-closes (((2009 4 8) (13 10)))
    :closed () :open () :early-closes (((2009 4 8) (13 10) "Wednesday before Easter: page gives 13.10 (13.00 in 2002/2003/2011+)")) :late-opens ())
   (:title "Oslo Børs Opening hours: closed days 2011" :year 2011
    :uri "https://web.archive.org/web/20110724183430/http://www.oslobors.no/ob_eng/Oslo-Boers/About-us/Opening-Hours"
    :issued nil :issued-uri nil :published (2011 7 24) :published-uri "https://web.archive.org/web/20110724183430/http://www.oslobors.no/ob_eng/Oslo-Boers/About-us/Opening-Hours"
    :published-in "Oslo Børs website (web.archive.org snapshot)"
    :dates-note "Undated list; :published is the capture date (an upper bound). 1/1, 24/12, 25/12, 31/12 2011 fall on weekends and are not listed."
    :listed-closed ((2011 4 21) (2011 4 22) (2011 4 25) (2011 5 17) (2011 6 2) (2011 6 13) (2011 12 26))
    :listed-early-closes (((2011 4 20) (13 0)))
    :closed () :open () :early-closes () :late-opens ())
   (:title "Oslo Børs Opening hours: closed days 2012" :year 2012
    :uri "https://web.archive.org/web/20120105213229/http://www.oslobors.no/ob_eng/Oslo-Boers/About-us/Opening-Hours"
    :issued nil :issued-uri nil :published (2012 1 5) :published-uri "https://web.archive.org/web/20120105213229/http://www.oslobors.no/ob_eng/Oslo-Boers/About-us/Opening-Hours"
    :published-in "Oslo Børs website (web.archive.org snapshot)"
    :dates-note "Undated list; :published is the capture date (an upper bound). Ascension 17.05.2012 coincides with Constitution Day."
    :listed-closed ((2012 4 5) (2012 4 6) (2012 4 9) (2012 5 1) (2012 5 17) (2012 5 28) (2012 12 24) (2012 12 25) (2012 12 26) (2012 12 31))
    :listed-early-closes (((2012 4 4) (13 0)))
    :closed () :open () :early-closes () :late-opens ())
   (:title "Oslo Børs Opening hours: closed days 2013" :year 2013
    :uri "https://web.archive.org/web/20120105213229/http://www.oslobors.no/ob_eng/Oslo-Boers/About-us/Opening-Hours"
    :issued nil :issued-uri nil :published (2012 1 5) :published-uri "https://web.archive.org/web/20120105213229/http://www.oslobors.no/ob_eng/Oslo-Boers/About-us/Opening-Hours"
    :published-in "Oslo Børs website (web.archive.org snapshot)"
    :dates-note "Undated list; :published is the capture date (an upper bound). The 2013 block on this capture has typos (17.05.2012, 20.05.2012 for Constitution Day / Whit Monday 2013; 24-31.12.2012 repeated); read as 2013. Whit Monday 2013 is 20 May."
    :listed-closed ((2013 1 1) (2013 3 28) (2013 3 29) (2013 4 1) (2013 5 1) (2013 5 9) (2013 5 17) (2013 5 20) (2013 12 24) (2013 12 25) (2013 12 26) (2013 12 31))
    :listed-early-closes (((2013 3 27) (13 0)))
    :closed () :open () :early-closes () :late-opens ())
   (:title "Oslo Børs Opening hours: closed days 2015" :year 2015
    :uri "https://web.archive.org/web/20150214034223/http://www.oslobors.no/ob_eng/Oslo-Boers/About-us/Opening-Hours"
    :issued nil :issued-uri nil :published (2015 2 14) :published-uri "https://web.archive.org/web/20150214034223/http://www.oslobors.no/ob_eng/Oslo-Boers/About-us/Opening-Hours"
    :published-in "Oslo Børs website (web.archive.org snapshot)"
    :dates-note "Undated list; :published is the capture date (an upper bound)."
    :listed-closed ((2015 1 1) (2015 4 2) (2015 4 3) (2015 4 6) (2015 5 1) (2015 5 14) (2015 5 25) (2015 12 24) (2015 12 25) (2015 12 31))
    :listed-early-closes (((2015 4 1) (13 0)))
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext calendar of business days 2020 (Oslo Børs 24 and 31 December)" :year 2020
    :uri "https://live.euronext.com/en/resources/trading-hours-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://live.euronext.com/en/resources/trading-hours-holidays"
    :published-in "Euronext trading hours & holidays page, archive section \"Calendar of business days 2020\" (fetched 2026-11-28)"
    :dates-note "Page undated; it states: On Thursday 24 December 2020 and on Thursday 31 December 2020, trading will be half day trading, with the exception of Oslo Børs which will be closed for the entire day. Other 2020 Oslo-only closures are not listed in this section."
    :listed-closed ((2020 12 24) (2020 12 31))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext calendar of business days 2021 (Oslo Børs)" :year 2021
    :uri "https://live.euronext.com/en/resources/trading-hours-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://live.euronext.com/en/resources/trading-hours-holidays"
    :published-in "Euronext trading hours & holidays page, archive section \"Calendar of business days 2021\" (fetched 2026-11-28)"
    :dates-note "Page undated. Lists Oslo-only closures 1 Apr, 13 May, 17 May, 24 May; Euronext-wide 1 Jan, 2 Apr, 5 Apr; Oslo closed the entire day 24 and 31 Dec; half day 31 Mar."
    :listed-closed ((2021 1 1) (2021 4 1) (2021 4 2) (2021 4 5) (2021 5 13) (2021 5 17) (2021 5 24) (2021 12 24) (2021 12 31))
    :listed-early-closes (((2021 3 31) (13 0)))
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext 2022 holiday calendar (Oslo Børs half day)" :year 2022
    :uri "https://live.euronext.com/en/resources/trading-hours-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://live.euronext.com/en/resources/trading-hours-holidays"
    :published-in "Euronext trading hours & holidays page, 2022 section (fetched 2026-11-28)"
    :dates-note "Only the Oslo half-day sentence was machine-readable (On Wednesday 13 April 2022, trading will be half day trading for Oslo Børs); the 2022 table could not be parsed column-safely. Closures cross-checked with Nasdaq's Norway row for 2022 (https://web.archive.org/web/20211204044702/http://www.nasdaqomxnordic.com/tradinghours), which matches exchange_calendars."
    :listed-closed ()
    :listed-early-closes (((2022 4 13) (13 0)))
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext 2023 holiday calendar (Oslo column)" :year 2023
    :uri "https://live.euronext.com/en/resources/trading-hours-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://live.euronext.com/en/resources/trading-hours-holidays"
    :published-in "Euronext trading hours & holidays page, 2023 table (fetched 2026-11-28)"
    :dates-note "Page undated. Oslo column: closed 6, 7, 10 Apr, 1 May, 17 May, 18 May (Ascension), 29 May, 25-26 Dec; half day 5 Apr. 1 Jan, 24 Dec, 31 Dec 2023 are Sundays."
    :listed-closed ((2023 4 6) (2023 4 7) (2023 4 10) (2023 5 1) (2023 5 17) (2023 5 18) (2023 5 29) (2023 12 25) (2023 12 26))
    :listed-early-closes (((2023 4 5) (13 0)))
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext 2024 holiday calendar for cash and derivatives markets (Oslo column)" :year 2024
    :uri "https://live.euronext.com/en/resources/trading-hours-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://live.euronext.com/en/resources/trading-hours-holidays"
    :published-in "Euronext trading hours & holidays page, 2024 table (fetched 2026-11-28)"
    :dates-note "Page undated; tables give Oslo Closed / Half Trading Day per date. Same dates in Nasdaq's Norway row (https://www.nasdaq.com/european-market-activity/trading-hours). 17 May 2024 listed."
    :listed-closed ((2024 1 1) (2024 3 28) (2024 3 29) (2024 4 1) (2024 5 1) (2024 5 9) (2024 5 17) (2024 5 20) (2024 12 24) (2024 12 25) (2024 12 26) (2024 12 31))
    :listed-early-closes (((2024 3 27) (13 0)))
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext 2025 holiday calendar for cash and derivatives markets (Oslo column)" :year 2025
    :uri "https://live.euronext.com/en/resources/trading-hours-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://live.euronext.com/en/resources/trading-hours-holidays"
    :published-in "Euronext trading hours & holidays page, 2025 table (fetched 2026-11-28)"
    :dates-note "Page undated; tables give Oslo Closed / Half Trading Day per date. Same dates in Nasdaq's Norway row (https://www.nasdaq.com/european-market-activity/trading-hours). 17 May 2025 is a weekend day."
    :listed-closed ((2025 1 1) (2025 4 17) (2025 4 18) (2025 4 21) (2025 5 1) (2025 5 29) (2025 6 9) (2025 12 24) (2025 12 25) (2025 12 26) (2025 12 31))
    :listed-early-closes (((2025 4 16) (13 0)))
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext 2026 holiday calendar for cash and derivatives markets (Oslo column)" :year 2026
    :uri "https://live.euronext.com/en/resources/trading-hours-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://live.euronext.com/en/resources/trading-hours-holidays"
    :published-in "Euronext trading hours & holidays page, 2026 table (fetched 2026-11-28)"
    :dates-note "Page undated; tables give Oslo Closed / Half Trading Day per date. Same dates in Nasdaq's Norway row (https://www.nasdaq.com/european-market-activity/trading-hours). 17 May 2026 is a weekend day."
    :listed-closed ((2026 1 1) (2026 4 2) (2026 4 3) (2026 4 6) (2026 5 1) (2026 5 14) (2026 5 25) (2026 12 24) (2026 12 25) (2026 12 31))
    :listed-early-closes (((2026 4 1) (13 0)))
    :closed () :open () :early-closes () :late-opens ())
   (:title "Euronext 2027 holiday calendar for cash and derivatives markets (Oslo column)" :year 2027
    :uri "https://live.euronext.com/en/resources/trading-hours-holidays"
    :issued nil :issued-uri nil :published nil :published-uri "https://live.euronext.com/en/resources/trading-hours-holidays"
    :published-in "Euronext trading hours & holidays page, 2027 table (fetched 2026-11-28)"
    :dates-note "Page undated; tables give Oslo Closed / Half Trading Day per date. Same dates in Nasdaq's Norway row (https://www.nasdaq.com/european-market-activity/trading-hours). 17 May 2027 listed."
    :listed-closed ((2027 1 1) (2027 3 25) (2027 3 26) (2027 3 29) (2027 5 6) (2027 5 17) (2027 12 24) (2027 12 31))
    :listed-early-closes (((2027 3 24) (13 0)))
    :closed () :open () :early-closes () :late-opens ())))
