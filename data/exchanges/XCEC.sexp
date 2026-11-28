;;;; COMEX on CME Globex (MIC XCEC): metals (gold, silver, copper). Holidays:
;;;; calendars/CME-METALS.sexp, which includes the CME Group family file calendars/CME.sexp (#48).
(
 :mic "XCEC"
 :name "COMEX on CME Globex (metals)"
 :zone "America/Chicago"
 :calendar "CME-METALS"
 :kind :commodities
 :product-group :metals
 :source "CME Group Globex holiday schedules 2009-2022 (COMEX / metals rows)"
 :eras (
   (:from (2007 1 2) :to (2015 9 8)
    :sessions ((:open (17 0) :close (16 15) :overnight t :labeled-by :close))
    :authority "CME Globex holiday schedules 2009 - Labor Day 2015: NYMEX & COMEX products \"Regular CME Globex close\" 16:15 CT, open 17:00 CT. 2007-2008 unverified.")
   (:from (2015 9 9)
    :sessions ((:open (17 0) :close (16 0) :overnight t :labeled-by :close))
    :authority "CME Globex holiday schedules from Thanksgiving 2015: \"Energy, Metals & DME Products\" regular close 16:00 CT; the change falls between the Labor Day and Thanksgiving 2015 schedules."))
 :early-close-rules (
   (:kind :no-settlement-day :from (2023 1 1) :close (13 30)
    :authority "Metals holiday halt 13:30 CT on the 2022 Globex holidays (12:00 in 2014-2021); 2023 on is the 2022 pattern.")
   (:kind :black-friday :from (2023 1 1) :close (12 45)
    :authority "Metals early close 12:45 CT the day after Thanksgiving, CME schedules 2009-2022; 2023 on is that pattern.")
   (:kind :christmas-eve-weekday :from (2023 1 1) :close (12 45)
    :authority "Metals early close 12:45 CT on a weekday Christmas Eve, CME schedules 2015-2020; 2023 on is that pattern.")))
