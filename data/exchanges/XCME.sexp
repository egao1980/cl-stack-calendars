;;;; CME Globex, Chicago Mercantile Exchange (MIC XCME). Holidays: calendars/CME-EQUITY.sexp
;;;; (headline: E-mini S&P 500), CME-INTEREST-RATE and CME-FX for the other product groups;
;;;; all include the CME Group family file calendars/CME.sexp (#48).
;;;; Sessions are labelled by their close (the trade date). On a Globex holiday such as
;;;; Martin Luther King Jr. Day the session halts early and has no settlement: its trades
;;;; are for the next trade date (EXCHANGE-SETTLEMENT-DAY-P, EXCHANGE-TRADE-DATE).
(
 :mic "XCME"
 :name "CME Globex (Chicago Mercantile Exchange)"
 :zone "America/Chicago"
 :calendar "CME-EQUITY"
 :kind :commodities
 :product-group :equity
 :source "CME Group Globex holiday schedules 2009-2022 (regular closes as printed); CME Globex 17:00 CT open"
 :eras (
   (:from (2007 1 2) :to (2012 12 26)
    :sessions ((:open (17 0) :close (15 15) :overnight t :labeled-by :close))
    :authority "CME Globex holiday schedules 2009-2012: equity products \"1515 CT - Regular CME Globex close\" (e.g. 2009 Martin Luther King schedule, https://web.archive.org/web/20090126144353/http://cmegroup.com:80/tools-information/holiday-calendar/files/2009-martin-luther-king.pdf). The 15:30-16:30 CT segment that opened the next trade date in this era is not modelled (the session opens 17:00 the evening before). 2007-2008 unverified.")
   (:from (2012 12 27) :to (2015 9 8)
    :sessions ((:open (17 0) :close (16 15) :overnight t :labeled-by :close))
    :authority "CME Globex holiday schedules 2013 - Labor Day 2015: equity \"Regular close\" 16:15 CT (2013 Martin Luther King schedule for 31 Dec 2012; the Christmas 2012 schedule still gives 15:15 for 26 Dec 2012, so the change falls between them). The 15:15-15:30 CT trading halt is not modelled.")
   (:from (2015 9 9)
    :sessions ((:open (17 0) :close (16 0) :overnight t :labeled-by :close))
    :authority "CME Globex holiday schedules from Thanksgiving 2015 (revised 2015-10-27): equity \"Regular close\" 16:00 CT; the Labor Day 2015 schedule (revised 2015-07-20) still gives 16:15, so 9 Sep - 24 Nov 2015 is unverified. 17:00-16:00 CT Sun-Fri, daily maintenance 16:00-17:00."))
 :early-close-rules (
   (:kind :no-settlement-day :from (2023 1 1) :close (12 0)
    :authority "Globex holiday halt 12:00 CT for equity products on every no-settlement holiday in the 2015-2022 CME schedules; CME publishes no schedule files after 2022, so 2023 on is that pattern (the holidays and their missing settlements are confirmed by the CME clearing advisories).")
   (:kind :black-friday :from (2023 1 1) :close (12 15)
    :authority "Equity early close 12:15 CT the day after Thanksgiving in every CME schedule 2009-2022; 2023 on is that pattern (CME's 2026 Thanksgiving settlement-times notice settles equity at 12:00 CT).")
   (:kind :christmas-eve-weekday :from (2023 1 1) :close (12 15)
    :authority "Equity early close 12:15 CT on a weekday Christmas Eve in the CME schedules 2018-2020; 2023 on is that pattern (CME's 2026 Christmas settlement-times notice).")
   (:kind :july-3-mon-tue-thu :from (2023 1 1) :close (12 15)
    :authority "Equity early close 12:15 CT on a weekday 3 July before Independence Day in the CME schedules 2012-2019; 2023 on is that pattern, unverified.")
   (:kind :july-3-wednesday :from (2023 1 1) :close (12 15)
    :authority "As :july-3-mon-tue-thu; 2023 on is that pattern, unverified."))
 :product-groups (
   (:id :interest-rate
    :name "CME Globex interest-rate products (SOFR / Eurodollar)"
    :calendar "CME-INTEREST-RATE"
    :eras ((:from (2007 1 2)
            :sessions ((:open (17 0) :close (16 0) :overnight t :labeled-by :close))
            :authority "CME Globex holiday schedules 2009-2022: interest rate products \"Regular close\" 16:00 CT, open 17:00 CT."))
    :early-close-rules (
      (:kind :no-settlement-day :from (2023 1 1) :close (12 0)
       :authority "Interest-rate holiday halt 12:00 CT in every CME schedule 2014-2022; 2023 on is that pattern.")
      (:kind :black-friday :from (2023 1 1) :close (12 15)
       :authority "Interest-rate early close 12:15 CT the day after Thanksgiving, CME schedules 2009-2022; 2023 on is that pattern.")
      (:kind :christmas-eve-weekday :from (2023 1 1) :close (12 15)
       :authority "Interest-rate early close 12:15 CT on a weekday Christmas Eve, CME schedules 2018-2020; 2023 on is that pattern.")))
   (:id :fx
    :name "CME Globex FX products"
    :calendar "CME-FX"
    :eras ((:from (2007 1 2)
            :sessions ((:open (17 0) :close (16 0) :overnight t :labeled-by :close))
            :authority "CME Globex holiday schedules 2009-2022: FX products \"Regular close\" 16:00 CT, open 17:00 CT."))
    :early-close-rules (
      (:kind :black-friday :from (2023 1 1) :close (12 15)
       :authority "FX early close 12:15 CT the day after Thanksgiving, CME schedules 2009-2022; 2023 on is that pattern. On the 2022 Globex holidays FX trades to its regular 16:00 halt (no early close), so no holiday rule.")
      (:kind :christmas-eve-weekday :from (2023 1 1) :close (12 15)
       :authority "FX early close 12:15 CT on a weekday Christmas Eve, CME schedules 2018-2020; 2023 on is that pattern.")))))
