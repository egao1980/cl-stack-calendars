;;;; XOSE -- Osaka Exchange (JPX derivatives: index futures/options, commodities since TOCOM
;;;; integration) trading days (#49). No exchange_calendars gold.
;;;; Cached sources: ~/.cache/cl-stack-calendars/exchanges/xose/ (and xtks/ for the JPX calendar).
;;;; Finding: the JPX non-business days (Sat, Sun, JP national holidays, Jan 2-3, Dec 31) apply to
;;;; OSE as to TSE ("JPX markets are closed on ..."). Since 2022-09-23 OSE runs HOLIDAY TRADING on
;;;; most non-business weekdays: only for index futures/options and commodity futures/options (not
;;;; JGB futures, interest-rate futures, securities options). Jan 1 is never eligible; Dec 31 and
;;;; Jan 2 'not eligible for the time being'; some holidays are skipped (BCP tests, contract
;;;; month/SQ constraints). Holiday-trading days are listed below as :open, one notice per year,
;;;; from JPX's 'List of Finalized Holiday Trading Days' (xlsx). A holiday-trading session belongs
;;;; to the trading day of the next business day (JPX holiday trading page).
;;;; For a product that is NOT eligible (JGB futures) the calendar is the XTKS one without the :open lists.
(:name "XOSE"
 :title "Osaka Exchange (JPX derivatives) trading days"
 :authority "JPX Market Holidays page (TSE/OSE/TOCOM common non-business days) and OSE/TOCOM Holiday Trading page"
 :authority-uri "https://www.jpx.co.jp/english/derivatives/rules/holidaytrading/index.html"
 :bases ((:calendar "JP" :from nil :to nil
          :authority "JPX Market Holidays: \"JPX markets are closed on Saturdays, Sundays, national holidays, and on the dates indicated below\"; \"there is no Night Session on non-business days\" https://www.jpx.co.jp/english/corporate/about-jpx/calendar/index.html"))
 :rules ((:fixed "New Year holiday (Jan 2)" 1 2 :authority "JPX Market Holidays page (Jan 2 Market Holiday) https://www.jpx.co.jp/english/corporate/about-jpx/calendar/index.html")
         (:fixed "New Year holiday (Jan 3)" 1 3 :authority "JPX Market Holidays page (Jan 3 Market Holiday); holiday trading on Jan 3 since 2023 is in the notices")
         (:fixed "Year-end holiday (Dec 31)" 12 31 :authority "JPX Market Holidays page (Dec 31 Market Holiday); not eligible for holiday trading 'for the time being'"))
 :gaps ((:years "2000-2025"
         :note "No OSE yearly non-business-day list found (pre-2014 OSE was a separate exchange, ose.or.jp; web.archive.org unreachable). OSE Business Regulations not fetched; the JPX Market Holidays page states the common rule for JPX markets today. Pre-2014 OSE closures assumed = TSE closures (not verified).")
        (:years "2027 (Jul-Dec)"
         :note "Holiday trading days for Jul-Dec 2027 are only 'Scheduled' (finalized in December 2026); listed in a separate notice."))
 :notices
 ((:title "OSE/TOCOM Holiday Trading: launch on 2022-09-23 (Autumnal Equinox Day)"
   :uri "https://www.jpx.co.jp/english/corporate/news/news-releases/0060/20220923-02.html"
   :issued (2022 9 23) :issued-uri "https://www.jpx.co.jp/english/corporate/news/news-releases/0060/20220923-02.html"
   :published (2022 9 23) :published-uri "https://www.jpx.co.jp/english/corporate/news/news-releases/0060/20220923-02.html"
   :published-in "JPX News Release" :dates-note nil
   :closed () :open () :early-closes () :late-opens ())
  (:title "Night session of 2021-09-17 not conducted (J-GATE 3.0 migration)"
   :uri "https://www.jpx.co.jp/english/news/2040/20210917-01.html"
   :issued (2021 9 17) :issued-uri "https://www.jpx.co.jp/english/news/2040/20210917-01.html"
   :published (2021 9 17) :published-uri "https://www.jpx.co.jp/english/news/2040/20210917-01.html"
   :published-in "JPX Market News"
   :dates-note "Day session held normally; the night session starting on the evening of 2021-09-17 was cancelled (index futures/options suspended from 15:50). Modelled as that day's own hours: the day session only."
   :closed () :open ()
   :sessions (((2021 9 17) ((:open (8 45) :close (15 15))) "J-GATE 3.0 migration: day session only, no night session"))
   :early-closes () :late-opens ())
  (:title "List of Finalized Holiday Trading Days (2022)" :year 2022
   :uri "https://www.jpx.co.jp/english/derivatives/rules/holidaytrading/b5b4pj0000050353-att/List_of_Finalized_Holiday_Trading_Days_E.xlsx"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.jpx.co.jp/english/derivatives/rules/holidaytrading/index.html"
   :published-in "JPX Holiday Trading page (xlsx, page updated 2026-06-26)"
   :dates-note "Cumulative list; per-year finalization dates (June / December announcements) not captured."
   :closed ()
   :open (((2022 9 23) "Holiday trading: Autumnal Equinox Day") ((2022 10 10) "Holiday trading: Sports Day") ((2022 11 3) "Holiday trading: Culture Day") ((2022 11 23) "Holiday trading: Labor Thanksgiving Day"))
   :early-closes () :late-opens ())
  (:title "List of Finalized Holiday Trading Days (2023)" :year 2023
   :uri "https://www.jpx.co.jp/english/derivatives/rules/holidaytrading/b5b4pj0000050353-att/List_of_Finalized_Holiday_Trading_Days_E.xlsx"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.jpx.co.jp/english/derivatives/rules/holidaytrading/index.html"
   :published-in "JPX Holiday Trading page (xlsx)"
   :dates-note "Not open: 2023-01-02, 2023-01-09, 2023-11-03."
   :closed ()
   :open (((2023 1 3) "Holiday trading: New Year Holidays") ((2023 2 23) "Holiday trading: Emperor's Birthday") ((2023 3 21) "Holiday trading: Vernal Equinox Day") ((2023 5 3) "Holiday trading: Constitution Memorial Day") ((2023 5 4) "Holiday trading: Greenery Day") ((2023 5 5) "Holiday trading: Children's Day") ((2023 7 17) "Holiday trading: Marine Day") ((2023 8 11) "Holiday trading: Mountain Day") ((2023 9 18) "Holiday trading: Respect for the Aged Day") ((2023 10 9) "Holiday trading: Sports Day") ((2023 11 23) "Holiday trading: Labor Thanksgiving Day"))
   :early-closes () :late-opens ())
  (:title "List of Finalized Holiday Trading Days (2024)" :year 2024
   :uri "https://www.jpx.co.jp/english/derivatives/rules/holidaytrading/b5b4pj0000050353-att/List_of_Finalized_Holiday_Trading_Days_E.xlsx"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.jpx.co.jp/english/derivatives/rules/holidaytrading/index.html"
   :published-in "JPX Holiday Trading page (xlsx)"
   :dates-note "Not open: 2024-01-02, 01-08, 08-12, 09-16, 11-04, 12-31."
   :closed ()
   :open (((2024 1 3) "Holiday trading: New Year Holidays") ((2024 2 12) "Holiday trading: Substitute Holiday of National Foundation Day") ((2024 2 23) "Holiday trading: Emperor's Birthday") ((2024 3 20) "Holiday trading: Vernal Equinox Day") ((2024 4 29) "Holiday trading: Showa Day") ((2024 5 3) "Holiday trading: Constitution Memorial Day") ((2024 5 6) "Holiday trading: Substitute Holiday of Children's Day") ((2024 7 15) "Holiday trading: Marine Day") ((2024 9 23) "Holiday trading: Substitute Holiday of Autumnal Equinox Day") ((2024 10 14) "Holiday trading: Sports Day"))
   :early-closes () :late-opens ())
  (:title "List of Finalized Holiday Trading Days (2025)" :year 2025
   :uri "https://www.jpx.co.jp/english/derivatives/rules/holidaytrading/b5b4pj0000050353-att/List_of_Finalized_Holiday_Trading_Days_E.xlsx"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.jpx.co.jp/english/derivatives/rules/holidaytrading/index.html"
   :published-in "JPX Holiday Trading page (xlsx)"
   :dates-note "Not open: 2025-01-02, 01-13, 09-15, 12-31."
   :closed ()
   :open (((2025 1 3) "Holiday trading: New Year Holidays") ((2025 2 11) "Holiday trading: National Foundation Day") ((2025 2 24) "Holiday trading: Substitute Holiday of Emperor's Birthday") ((2025 3 20) "Holiday trading: Vernal Equinox Day") ((2025 4 29) "Holiday trading: Showa Day") ((2025 5 5) "Holiday trading: Children's Day") ((2025 5 6) "Holiday trading: Substitute Holiday of Greenery Day") ((2025 7 21) "Holiday trading: Marine Day") ((2025 8 11) "Holiday trading: Mountain Day") ((2025 9 23) "Holiday trading: Autumnal Equinox Day") ((2025 10 13) "Holiday trading: Sports Day") ((2025 11 3) "Holiday trading: Culture Day") ((2025 11 24) "Holiday trading: Substitute Holiday of Labor Thanksgiving Day"))
   :early-closes () :late-opens ())
  (:title "List of Finalized Holiday Trading Days (2026)" :year 2026
   :uri "https://www.jpx.co.jp/english/derivatives/rules/holidaytrading/b5b4pj0000050353-att/List_of_Finalized_Holiday_Trading_Days_E.xlsx"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.jpx.co.jp/english/derivatives/rules/holidaytrading/index.html"
   :published-in "JPX Holiday Trading page (xlsx)"
   :dates-note "Not open: 2026-01-02, 11-23 (JPX group BCP test 21-23 Nov), 12-31."
   :closed ()
   :open (((2026 1 12) "Holiday trading: Coming of Age Day") ((2026 2 11) "Holiday trading: National Foundation Day") ((2026 2 23) "Holiday trading: Emperor's Birthday") ((2026 3 20) "Holiday trading: Vernal Equinox Day") ((2026 4 29) "Holiday trading: Showa Day") ((2026 5 4) "Holiday trading: Greenery Day") ((2026 5 5) "Holiday trading: Children's Day") ((2026 5 6) "Holiday trading: Substitute Holiday of Constitution Memorial Day") ((2026 7 20) "Holiday trading: Marine Day") ((2026 8 11) "Holiday trading: Mountain Day") ((2026 9 21) "Holiday trading: Respect for the Aged Day") ((2026 9 22) "Holiday trading: Holiday") ((2026 9 23) "Holiday trading: Autumnal Equinox Day") ((2026 10 12) "Holiday trading: Sports Day") ((2026 11 3) "Holiday trading: Culture Day"))
   :early-closes () :late-opens ())
  (:title "List of Finalized Holiday Trading Days (2027, Jan-Jun finalized)" :year 2027
   :uri "https://www.jpx.co.jp/english/derivatives/rules/holidaytrading/b5b4pj0000050353-att/List_of_Finalized_Holiday_Trading_Days_E.xlsx"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.jpx.co.jp/english/derivatives/rules/holidaytrading/index.html"
   :published-in "JPX Holiday Trading page (xlsx)"
   :dates-note "Cumulative list on the JPX Holiday Trading page; the xlsx carries no issue date and the June/December finalization announcements were not captured."
   :closed ()
   :open (((2027 1 11) "Holiday trading: Coming of Age Day") ((2027 2 11) "Holiday trading: National Foundation Day") ((2027 2 23) "Holiday trading: Emperor's Birthday") ((2027 3 22) "Holiday trading: Vernal Equinox Day") ((2027 4 29) "Holiday trading: Showa Day") ((2027 5 3) "Holiday trading: Constitution Memorial Day") ((2027 5 4) "Holiday trading: Greenery Day") ((2027 5 5) "Holiday trading: Children's Day"))
   :early-closes () :late-opens ())
  (:title "Derivatives Holiday Trading Days 2027 (Jul-Dec: Scheduled, not yet finalized)" :year 2027
   :uri "https://www.jpx.co.jp/english/derivatives/rules/holidaytrading/index.html"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.jpx.co.jp/english/derivatives/rules/holidaytrading/index.html"
   :published-in "JPX Holiday Trading page (updated 2026-06-26)"
   :dates-note "Status 'Scheduled'; second-half finalization is announced in December. Not open: 2027-09-20 (BCP test 18-20 Sep), 2027-12-31."
   :confidence :scheduled
   :closed ()
   :open (((2027 7 19) "Holiday trading (scheduled): Marine Day") ((2027 8 11) "Holiday trading (scheduled): Mountain Day") ((2027 9 23) "Holiday trading (scheduled): Autumnal Equinox Day") ((2027 10 11) "Holiday trading (scheduled): Sports Day") ((2027 11 3) "Holiday trading (scheduled): Culture Day") ((2027 11 23) "Holiday trading (scheduled): Labor Thanksgiving Day"))
   :early-closes () :late-opens ())))
