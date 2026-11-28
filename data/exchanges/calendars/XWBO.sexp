;;;; XWBO draft (cl-stack-calendars #49). Era to 2018: AT civil + Good Friday, 24 Dec, 31 Dec
;;;; (ec additionally closes the Friday before a weekend 31 Dec in 2000/2005/2006/2011: unsourced).
;;;; From 2019: rules below. Early close 14:15 on the last trading day of the year (notices 2019-2026).

(:name "XWBO"
 :title "Wiener Börse (Vienna Stock Exchange) trading days"
 :authority "Wiener Börse AG, Xetra Trading Rules §3 (version 16 Nov 2026) and yearly 'Holiday schedule & trading on public holidays'" :authority-uri "https://www.wienerboerse.at/uploads/u/cms/files/legal/general-terms-and-conditions/en-agb-2-1.pdf"
 :bases ((:calendar "AT" :from nil :to (2018 12 31) :authority "Press release 2018-09-10: exchange closed on Austrian bank holidays (13 closures in 2017) until 2018 (no pre-2019 list reachable)"))
 :rules ((:easter "Good Friday" -2 :authority "Trading Rules §3(1) https://www.wienerboerse.at/uploads/u/cms/files/legal/general-terms-and-conditions/en-agb-2-1.pdf")
         (:fixed "Christmas Eve" 12 24 :authority "Trading Rules §3(1)")
         (:fixed "New Year's Eve" 12 31 :authority "Trading Rules §3(1)")
         (:fixed "New Year" 1 1 :from 2019 :authority "Trading Rules §3(1): statutory holiday not listed as trading day")
         (:easter "Easter Monday" 1 :from 2019 :authority "Trading Rules §3(1)")
         (:fixed "Labour Day" 5 1 :from 2019 :authority "Trading Rules §3(1)")
         (:easter "Whit Monday" 50 :from 2019 :to 2022 :authority "2018-09-10 press release list omits Whit Monday; no-trading notice 6 Jun 2022; Trading Rules 2026 make it a trading day")
         (:fixed "National Holiday" 10 26 :from 2019 :authority "Trading Rules §3(1); 2026/2027 holiday schedules")
         (:fixed "Christmas Day" 12 25 :from 2019 :authority "Trading Rules §3(1)")
         (:fixed "St. Stephen's Day" 12 26 :from 2019 :authority "Trading Rules §3(1); notice 2022-12-23"))
 :notices (
   (:title "Press release: 2019 Vienna Exchange enables trading on four Austrian public holidays" :year 2019
    :uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/vienna-stock-exchange-extends-trading-schedule-from-2019-onwards/"
    :issued (2018 9 10) :issued-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/vienna-stock-exchange-extends-trading-schedule-from-2019-onwards/"
    :published (2018 9 10) :published-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/vienna-stock-exchange-extends-trading-schedule-from-2019-onwards/"
    :published-in "Wiener Börse press release"
    :dates-note nil
    :closed ()
    :open (((2019 5 30) "Ascension Day")
             ((2019 6 20) "Corpus Christi")
             ((2019 8 15) "Assumption Day")
             ((2019 11 1) "All Saints Day"))
    :early-closes ()
    :late-opens ()
    :note "'The Vienna Stock Exchange closed 13 times last year due to a bank holiday.' From 2019: open on Epiphany, Ascension, Corpus Christi, Assumption, All Saints, Immaculate Conception unless on a weekend. Whit Monday not in this list.")
   (:title "No trading on 19 and 22 April 2019" :year 2019
    :uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/no-trading-on-the-vienna-stock-exchange-on-19-22-april-2019/"
    :issued (2019 4 18) :issued-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/no-trading-on-the-vienna-stock-exchange-on-19-22-april-2019/"
    :published (2019 4 18) :published-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/no-trading-on-the-vienna-stock-exchange-on-19-22-april-2019/"
    :published-in "Wiener Börse news"
    :dates-note nil
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Holiday trading on 15 August 2019" :year 2019
    :uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/holiday-trading-on-15-august-2019/"
    :issued (2019 8 14) :issued-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/holiday-trading-on-15-august-2019/"
    :published (2019 8 14) :published-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/holiday-trading-on-15-august-2019/"
    :published-in "Wiener Börse news"
    :dates-note nil
    :closed ()
    :open (((2019 8 15) "Assumption Day"))
    :early-closes ()
    :late-opens ())
   (:title "Press release: extended trading calendar positively received; 2020 holiday trading days" :year 2020
    :uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/extended-trading-calendar-positively-received-by-trading-participants-807-mn-eur-turnover/"
    :issued (2019 11 4) :issued-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/extended-trading-calendar-positively-received-by-trading-participants-807-mn-eur-turnover/"
    :published (2019 11 4) :published-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/extended-trading-calendar-positively-received-by-trading-participants-807-mn-eur-turnover/"
    :published-in "Wiener Börse press release"
    :dates-note nil
    :closed ()
    :open (((2020 1 6) "Epiphany")
             ((2020 5 21) "Ascension Day")
             ((2020 6 11) "Corpus Christi")
             ((2020 12 8) "Immaculate Conception"))
    :early-closes ()
    :late-opens ())
   (:title "Last trading day 30 December 2019: closing auction from 14:15" :year 2019
    :uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-30-december-2019/"
    :issued (2019 12 20) :issued-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-30-december-2019/"
    :published (2019 12 20) :published-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-30-december-2019/"
    :published-in "Wiener Börse news"
    :dates-note nil
    :closed ()
    :open ()
    :early-closes (((2019 12 30) (14 15) "equities continuous trading: start of closing auction 14:15"))
    :late-opens ())
   (:title "Last trading day 2020-12-30: modified trading hours (closing auction 14:15)" :year 2020
    :uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-12302020/"
    :issued (2020 11 18) :issued-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-12302020/"
    :published (2020 11 18) :published-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-12302020/"
    :published-in "Wiener Börse news"
    :dates-note nil
    :closed ()
    :open ()
    :early-closes (((2020 12 30) (14 15) "equities continuous trading: start of closing auction 14:15"))
    :late-opens ())
   (:title "Last trading day 2021-12-30: modified trading hours (closing auction 14:15)" :year 2021
    :uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-12302021/"
    :issued (2021 11 5) :issued-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-12302021/"
    :published (2021 11 5) :published-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-12302021/"
    :published-in "Wiener Börse news"
    :dates-note nil
    :closed ()
    :open ()
    :early-closes (((2021 12 30) (14 15) "equities continuous trading: start of closing auction 14:15"))
    :late-opens ())
   (:title "Last trading day 2022-12-30: modified trading hours (closing auction 14:15)" :year 2022
    :uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-12302022/"
    :issued (2022 10 14) :issued-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-12302022/"
    :published (2022 10 14) :published-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-12302022/"
    :published-in "Wiener Börse news"
    :dates-note nil
    :closed ()
    :open ()
    :early-closes (((2022 12 30) (14 15) "equities continuous trading: start of closing auction 14:15"))
    :late-opens ())
   (:title "Last trading day 2023-12-29: modified trading hours (closing auction 14:15)" :year 2023
    :uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-12292023/"
    :issued (2023 11 10) :issued-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-12292023/"
    :published (2023 11 10) :published-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-12292023/"
    :published-in "Wiener Börse news"
    :dates-note nil
    :closed ()
    :open ()
    :early-closes (((2023 12 29) (14 15) "equities continuous trading: start of closing auction 14:15"))
    :late-opens ())
   (:title "Last trading day 2024-12-30: modified trading hours (closing auction 14:15)" :year 2024
    :uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-12302024/"
    :issued (2024 10 14) :issued-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-12302024/"
    :published (2024 10 14) :published-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-12302024/"
    :published-in "Wiener Börse news"
    :dates-note nil
    :closed ()
    :open ()
    :early-closes (((2024 12 30) (14 15) "equities continuous trading: start of closing auction 14:15"))
    :late-opens ())
   (:title "Last trading day 2025-12-30: modified trading hours (closing auction 14:15)" :year 2025
    :uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-12302025/"
    :issued (2025 10 13) :issued-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-12302025/"
    :published (2025 10 13) :published-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-12302025/"
    :published-in "Wiener Börse news"
    :dates-note nil
    :closed ()
    :open ()
    :early-closes (((2025 12 30) (14 15) "equities continuous trading: start of closing auction 14:15"))
    :late-opens ())
   (:title "Last trading day 2026-12-30: modified trading hours (closing auction 14:15)" :year 2026
    :uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-12302026/"
    :issued (2026 11 2) :issued-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-12302026/"
    :published (2026 11 2) :published-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/last-trading-day-12302026/"
    :published-in "Wiener Börse news"
    :dates-note nil
    :closed ()
    :open ()
    :early-closes (((2026 12 30) (14 15) "equities continuous trading: start of closing auction 14:15"))
    :late-opens ())
   (:title "Holiday trading on 3 June 2021 (Corpus Christi)" :year 2021
    :uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/holiday-trading-06032021/"
    :issued (2021 6 2) :issued-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/holiday-trading-06032021/"
    :published (2021 6 2) :published-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/holiday-trading-06032021/"
    :published-in "Wiener Börse news"
    :dates-note nil
    :closed ()
    :open (((2021 1 6) "Epiphany")
             ((2021 5 13) "Ascension Day")
             ((2021 6 3) "Corpus Christi"))
    :early-closes ()
    :late-opens ())
   (:title "No trading on 6 June 2022 (Whit Monday)" :year 2022
    :uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/no-trading-06062022/"
    :issued (2022 6 3) :issued-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/no-trading-06062022/"
    :published (2022 6 3) :published-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/no-trading-06062022/"
    :published-in "Wiener Börse news"
    :dates-note nil
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Whit Monday still an exchange holiday in 2022.")
   (:title "No trading on 26 December 2022" :year 2022
    :uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/no-trading-christmas-2022/"
    :issued (2022 12 23) :issued-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/no-trading-christmas-2022/"
    :published (2022 12 23) :published-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/no-trading-christmas-2022/"
    :published-in "Wiener Börse news"
    :dates-note nil
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "No trading on 1 May 2023" :year 2023
    :uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/no-trading-05012023/"
    :issued (2023 4 28) :issued-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/no-trading-05012023/"
    :published (2023 4 28) :published-uri "https://www.wienerborse.at/en/news/vienna-stock-exchange-news/no-trading-05012023/"
    :published-in "Wiener Börse news"
    :dates-note nil
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Holiday schedule & trading on public holidays 2026" :year 2026
    :uri "https://www.wienerborse.at/uploads/u/cms/files/trading/stock-exchange-holidays-2026-en.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.wienerborse.at/en/trading/trading-information/trading-calendar/"
    :published-in "Wiener Börse trading calendar page"
    :dates-note "PDF CreationDate 2025-11-17."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Holidays: 1 Jan, 3 Apr, 6 Apr, 1 May, 26 Oct, 24 Dec, 25 Dec, 31 Dec. Additional holiday trading days: 6 Jan, 14 May, 25 May (Whit Monday), 4 Jun, 8 Dec.")
   (:title "Holiday schedule & trading on public holidays 2027" :year 2027
    :uri "https://www.wienerborse.at/uploads/u/cms/files/trading/stock-exchange-holidays-2027-en.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.wienerborse.at/en/trading/trading-information/trading-calendar/"
    :published-in "Wiener Börse trading calendar page"
    :dates-note "PDF CreationDate 2026-11-12."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Holidays: 1 Jan, 26 Mar, 29 Mar, 26 Oct, 24 Dec, 31 Dec. Holiday trading days: 6 Jan, 6 May, 17 May, 27 May, 1 Nov, 8 Dec.")
   (:title "Xetra Trading Rules (2.1) §3 Trading Days, version 16 November 2026"
    :uri "https://www.wienerboerse.at/uploads/u/cms/files/legal/general-terms-and-conditions/en-agb-2-1.pdf"
    :issued (2026 11 16) :issued-uri "https://www.wienerboerse.at/uploads/u/cms/files/legal/general-terms-and-conditions/en-agb-2-1.pdf"
    :published nil :published-uri "https://www.wienerboerse.at/uploads/u/cms/files/legal/general-terms-and-conditions/en-agb-2-1.pdf"
    :published-in "Wiener Börse General Terms and Conditions 2.1"
    :dates-note "Version date printed in the footer; effective date of the Whit Monday inclusion not stated (ec and the 2022 notice imply from 2023)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange trading days are all workdays except Saturdays, Good Friday, 24 December and 31 December; 6 Jan, Ascension, Whit Monday, Corpus Christi, 15 Aug, 1 Nov, 8 Dec are trading days unless on a weekend.")
 ))
