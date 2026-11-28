;;;; XDUB - Euronext Dublin (ex Irish Stock Exchange). Euronext calendar applies from the 4 Feb 2019 migration (IF181018CADE).
;;;; From 2019: Euronext harmonised days + (from 2021) Irish May Bank Holiday + Irish weekend-substitute days for
;;;; New Year / Christmas / St Stephen's, which Euronext lists explicitly each year (2020-12-28, 2021-12-27/28, 2022-01-03,
;;;; 2022-12-27, 2023-01-02, 2026-12-28, 2027-12-27/28). Note: the :nth-weekday May rule must NOT fire in 2019 and 2020
;;;; (open, see notices). June/August/October bank holidays and St Patrick's Day: open.
;;;; Early closes: 24/31 Dec on weekdays, and the PRECEDING FRIDAY when they fall on a weekend (2022-12-23/30, 2023-12-22/29;
;;;; ec also has 2011, 2016, 2017 Fridays). Time 12:28-12:30 Dublin (random end); ec uses 12:28.
(:name "XDUB"
 :title "Euronext Dublin trading days"
 :authority "Irish Stock Exchange (to 2019-02-01); Euronext holiday calendars (from 2019-02-04)" :authority-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
 :bases ((:calendar "IE" :from nil :to (2019 2 3) :authority "ASSUMPTION for the ISE era: Irish bank holidays EXCEPT St Patrick's Day (from 2001), August and October bank holidays, which the ISE traded (Irish Times 21 Mar 2001, secondary); no ISE primary list retrieved. Substitute days 27/28 Dec and 2 Jan per IE calendar."))
 :rules ((:fixed "New Year's Day" 1 1 :observed :substitute-next :observed-from (2020 1 1) :authority "Euronext holiday calendars 2019-2027")
         (:easter "Good Friday" -2 :authority "Euronext holiday calendars")
         (:easter "Easter Monday" 1 :authority "Euronext holiday calendars")
         (:fixed "Labour Day" 5 1 :from (2019 2 4) :authority "https://web.archive.org/web/2019id_/https://www.euronext.com/sites/www.euronext.com/files/if181018cade_2019_holiday_calendar_for_euronexts_cash_and_derivatives_markets.pdf (Euronext calendar applies to Dublin from 4 Feb 2019)")
         (:nth-weekday "May Bank Holiday" 5 :monday 1 :authority "ISE era per ec (unverified); Euronext calendars 2021-2027 list Irish May Bank Holiday closed; 2019 and 2020 OPEN (Euronext 2019 calendar / IF201124CADE)")
         (:nth-weekday "June Bank Holiday" 6 :monday 1 :to 2018 :authority "ISE era per ec (unverified); not a closure under Euronext calendars 2019+")
         (:fixed "Christmas Day" 12 25 :observed :substitute-next :observed-from (2020 1 1) :authority "Euronext holiday calendars")
         (:fixed "St Stephen's Day" 12 26 :observed :substitute-next :observed-from (2020 1 1) :authority "Euronext holiday calendars; from 2020 a weekend New Year's Day, Christmas Day or St Stephen's Day gives Dublin a substitute weekday, listed in each Euronext calendar (2020-12-28, 2021-12-27/28, 2022-01-03, 2022-12-27, 2023-01-02, 2026-12-28, 2027-12-27/28)"))
 :gaps (
   (:years "2000-2018" :note "ise.ie calendars not retrieved (web.archive.org offline / CDX timeouts). Secondary: Irish Times 21 Mar 2001 'Stock exchange to harmonise calendar' (https://www.irishtimes.com/business/stock-exchange-to-harmonise-calendar-1.293030): ISE OPEN on St Patrick's Day (19 Mar 2001), August BH (6 Aug 2001) and October BH (29 Oct 2001) to harmonise with European markets. Euronext Block MTF calendars 2017/2018 (https://www.euronext.com/sites/www.euronext.com/files/block_trading_holidays_2017.pdf, https://www.euronext.com/sites/www.euronext.com/files/block_trading_holidays_2018.pdf) show Ireland closed 7 May 2018 and 4 Jun 2018 and Ireland early closes 12:28 on 22+29 Dec 2017 and 24+31 Dec 2018. ISE closed 2 Mar 2018 (storm Emma) after an early close on 1 Mar 2018 (secondary: mondovisione.com verbatim reproduction of the ISE notice dated 1 Mar 2018; it also shows the ISE/Xetra-era schedule: opening auction 07:50-08:00, continuous from 08:00). The May-BH rule for 2019/2020 must be suppressed (see notices)."))
 :notices (
   (:title "Irish Stock Exchange notice: trading schedule change due to extreme weather conditions (Storm Emma)"
    :uri "https://mondovisione.com/media-and-resources/news/irish-stock-exchange-trading-schedule-change-due-to-extreme-weather-conditions-201831/"
    :year 2018
    :issued (2018 3 1) :issued-uri "https://mondovisione.com/media-and-resources/news/irish-stock-exchange-trading-schedule-change-due-to-extreme-weather-conditions-201831/"
    :published (2018 3 1) :published-uri "https://mondovisione.com/media-and-resources/news/irish-stock-exchange-trading-schedule-change-due-to-extreme-weather-conditions-201831/"
    :published-in "Irish Stock Exchange notice, as reproduced verbatim by Mondo Visione (secondary copy; the ise.ie original was not retrieved)"
    :confidence :secondary
    :dates-note nil
    :closed (((2018 3 2) "Storm Emma closure (ISE; secondary source only)"))
    :open ()
    :early-closes (((2018 3 1) (11 40) "Storm Emma: continuous 08:00-11:40, closing auction 11:40-11:42, post-trading to 12:00 Irish time (ISE notice 1 Mar 2018 as reproduced by Mondo Visione: https://mondovisione.com/media-and-resources/news/irish-stock-exchange-trading-schedule-change-due-to-extreme-weather-conditions-201831/)"))
    :late-opens ())
   (:title "2019 holiday calendar for Euronext's cash and derivatives markets (Info-Flash IF181018CADE) - applies to Euronext Dublin from 4 Feb 2019"
    :uri "https://web.archive.org/web/2019id_/https://www.euronext.com/sites/www.euronext.com/files/if181018cade_2019_holiday_calendar_for_euronexts_cash_and_derivatives_markets.pdf"
    :year 2019
    :issued (2018 10 18) :issued-uri "https://web.archive.org/web/2019id_/https://www.euronext.com/sites/www.euronext.com/files/if181018cade_2019_holiday_calendar_for_euronexts_cash_and_derivatives_markets.pdf"
    :published (2018 10 18) :published-uri "https://web.archive.org/web/2019id_/https://www.euronext.com/sites/www.euronext.com/files/if181018cade_2019_holiday_calendar_for_euronexts_cash_and_derivatives_markets.pdf"
    :published-in "Euronext Info-Flash IF181018CADE; final 2019 text on https://live.euronext.com/en/resources/trading-hours-holidays" :dates-note "Dublin follows the Euronext list: closed 1 May 2019; OPEN Mon 6 May and Mon 3 Jun 2019 (Irish bank holidays). Half days 24 and 31 Dec 2019: Dublin equities close 12:28-12:30 Dublin time (final page text; the Oct 2018 Info-Flash said 14:05 CET for all cash markets incl. Dublin)."
    :closed ()
    :open (((2019 5 6) "May Bank Holiday - Dublin open under Euronext calendar") ((2019 6 3) "June Bank Holiday - open"))
    :early-closes (((2019 12 24) (12 28) "equities 12:28-12:30 Dublin, ETFs 13:00") ((2019 12 31) (12 28) "equities 12:28-12:30 Dublin, ETFs 13:00"))
    :late-opens ())
   (:title "Updated 2020 holiday calendar for Euronext's cash and derivatives markets (Info-Flash IF201124CADE)"
    :uri "https://connect2.euronext.com/sites/default/files/2020-11/IF201124CADE%202020%20Updated%20Holiday%20Calendar.pdf"
    :year 2020
    :issued (2019 10 25) :issued-uri nil
    :published (2020 11 24) :published-uri "https://connect2.euronext.com/sites/default/files/2020-11/IF201124CADE%202020%20Updated%20Holiday%20Calendar.pdf"
    :published-in "Euronext Info-Flash IF201124CADE (update of 25 Oct 2019 Info-Flash)" :dates-note "Dublin additionally closed Mon 28 Dec 2020 (St Stephen's substitute). Open Mon 4 May and Mon 1 Jun 2020."
    :closed (((2020 12 28) "St Stephen's Day substitute"))
    :open (((2020 5 4) "May Bank Holiday - open in 2020"))
    :early-closes (((2020 12 24) (12 28) "equities 12:28-12:30 Dublin") ((2020 12 31) (12 28) "equities 12:28-12:30 Dublin"))
    :late-opens ())
   (:title "Euronext Trading Hours & Holidays page: calendar of business days 2021 (Dublin column)"
    :uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :year 2021
    :issued nil :issued-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published nil :published-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published-in "euronext.com Trading Hours & Holidays page (fetched 2026-11-28)" :dates-note "Mon 3 May 2021 closed (May Day). Half days: Dublin equities close between 12:28 and 12:30 Dublin time (ETFs 13:00)."
    :closed (((2021 12 27) "Christmas Day substitute") ((2021 12 28) "St Stephen's Day substitute"))
    :open ()
    :early-closes (((2021 12 24) (12 28) "half trading day, equities 12:28-12:30 Dublin") ((2021 12 31) (12 28) "half trading day, equities 12:28-12:30 Dublin"))
    :late-opens ())
   (:title "Euronext Trading Hours & Holidays page: calendar of business days 2022 (Dublin column)"
    :uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :year 2022
    :issued nil :issued-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published nil :published-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published-in "euronext.com Trading Hours & Holidays page (fetched 2026-11-28)" :dates-note "Mon 2 May 2022 closed (Irish/UK bank holiday); Fri 23 and Fri 30 Dec 2022 half days (substitutes for 24/31 Dec). Half days: Dublin equities close between 12:28 and 12:30 Dublin time (ETFs 13:00)."
    :closed (((2022 1 3) "New Year's Day substitute") ((2022 12 27) "Christmas Day substitute"))
    :open ()
    :early-closes (((2022 12 23) (12 28) "half trading day, equities 12:28-12:30 Dublin") ((2022 12 30) (12 28) "half trading day, equities 12:28-12:30 Dublin"))
    :late-opens ())
   (:title "Euronext Trading Hours & Holidays page: calendar of business days 2023 (Dublin column)"
    :uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :year 2023
    :issued nil :issued-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published nil :published-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published-in "euronext.com Trading Hours & Holidays page (fetched 2026-11-28)" :dates-note "Fri 22 and Fri 29 Dec 2023 half days. Half days: Dublin equities close between 12:28 and 12:30 Dublin time (ETFs 13:00)."
    :closed (((2023 1 2) "New Year's Day substitute"))
    :open ()
    :early-closes (((2023 12 22) (12 28) "half trading day, equities 12:28-12:30 Dublin") ((2023 12 29) (12 28) "half trading day, equities 12:28-12:30 Dublin"))
    :late-opens ())
   (:title "Euronext Trading Hours & Holidays page: calendar of business days 2024 (Dublin column)"
    :uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :year 2024
    :issued nil :issued-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published nil :published-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published-in "euronext.com Trading Hours & Holidays page (fetched 2026-11-28)" :dates-note "Mon 6 May 2024 closed (Irish May Bank Holiday). Half days: Dublin equities close between 12:28 and 12:30 Dublin time (ETFs 13:00)."
    :closed ()
    :open ()
    :early-closes (((2024 12 24) (12 28) "half trading day, equities 12:28-12:30 Dublin") ((2024 12 31) (12 28) "half trading day, equities 12:28-12:30 Dublin"))
    :late-opens ())
   (:title "Euronext Trading Hours & Holidays page: calendar of business days 2025 (Dublin column)"
    :uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :year 2025
    :issued nil :issued-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published nil :published-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published-in "euronext.com Trading Hours & Holidays page (fetched 2026-11-28)" :dates-note "Mon 5 May 2025 closed. Half days: Dublin equities close between 12:28 and 12:30 Dublin time (ETFs 13:00)."
    :closed ()
    :open ()
    :early-closes (((2025 12 24) (12 28) "half trading day, equities 12:28-12:30 Dublin") ((2025 12 31) (12 28) "half trading day, equities 12:28-12:30 Dublin"))
    :late-opens ())
   (:title "Euronext Trading Hours & Holidays page: calendar of business days 2026 (Dublin column)"
    :uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :year 2026
    :issued nil :issued-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published nil :published-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
    :published-in "euronext.com Trading Hours & Holidays page (fetched 2026-11-28)" :dates-note "Mon 4 May 2026 closed. Half days: Dublin equities close between 12:28 and 12:30 Dublin time (ETFs 13:00)."
    :closed (((2026 12 28) "St Stephen's Day substitute"))
    :open ()
    :early-closes (((2026 12 24) (12 28) "half trading day, equities 12:28-12:30 Dublin") ((2026 12 31) (12 28) "half trading day, equities 12:28-12:30 Dublin"))
    :late-opens ())
   (:title "2027 holiday calendar for Euronext's cash and derivatives markets (Info-Flash, erratum 19 Nov 2026)"
    :uri "https://www.euronext.com/en/media/16439/download"
    :year 2027
    :issued (2026 11 6) :issued-uri nil
    :published (2026 11 19) :published-uri "https://www.euronext.com/en/media/16439/download"
    :published-in "Euronext Info-Flash (erratum)" :dates-note "Dublin closed Mon 3 May 2027 (Irish May Bank Holiday), Mon 27 and Tue 28 Dec 2027 (substitutes; 28 Dec added by the erratum). Half days Fri 24 and Fri 31 Dec 2027."
    :closed (((2027 12 27) "Christmas Day substitute") ((2027 12 28) "St Stephen's Day substitute (erratum)"))
    :open ()
    :early-closes (((2027 12 24) (12 28) "equities 12:28-12:30 Dublin") ((2027 12 31) (12 28) "equities 12:28-12:30 Dublin"))
    :late-opens ())
 ))
