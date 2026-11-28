;;;; Chicago Board of Trade on CME Globex (MIC XCBT). Headline: grains and oilseeds (corn,
;;;; soybeans, wheat; calendars/CME-GRAINS.sexp). Product groups :interest-rate (Treasury
;;;; futures, CME-INTEREST-RATE) and :equity (Dow futures, CME-EQUITY). All include the CME
;;;; Group family file calendars/CME.sexp (#48).
(
 :mic "XCBT"
 :name "CBOT on CME Globex (grains and oilseeds)"
 :zone "America/Chicago"
 :calendar "CME-GRAINS"
 :kind :commodities
 :product-group :grains
 :source "CME Group Globex holiday schedules 2009-2022 (grains and oilseeds rows)"
 :eras (
   (:from (1994 1 3) :to (2006 12 29)
    :sessions ((:open (8 30) :close (13 15)))
    :authority "CBOT grain day session 08:30-13:15 (pit / early electronic); unverified")
   (:from (2007 1 2) :to (2012 5 11)
    :sessions ((:open (18 0) :close (7 15) :overnight t :labeled-by :close)
               (:open (9 30) :close (13 15)))
    :authority "CME Globex holiday schedules 2009-2012: CBOT grains reopen at 18:00 CT after a holiday (\"CBOT Grain Products will remain closed until 1800 CT on Monday\", 2009 Martin Luther King schedule) and open the day session at 09:30 CT (2 Jan 2009, 27 Dec 2011); the 07:15 night close and the 13:15 day close are the CBOT grain hours of the time, not printed in the schedules. 2007-2008 unverified.")
   (:from (2012 5 14) :to (2013 4 5)
    :sessions ((:open (19 0) :close (14 0) :overnight t :labeled-by :close))
    :authority "CME Globex holiday schedules mid-2012 to Good Friday 2013: grains \"Regular close\" 14:00 CT, reopen 19:00 CT after a holiday (2012 Independence Day workbook, 2013 New Year's sheet). The start (the extended grain hours of May 2012) and the end (Memorial Day 2013 already gives 13:15) fall between schedules; the interior of this era (a continuous session or a break) is not in the schedules.")
   (:from (2013 4 8) :to (2015 5 26)
    :sessions ((:open (19 0) :close (7 45) :overnight t :labeled-by :close)
               (:open (8 30) :close (13 15)))
    :authority "CME Globex holiday schedules Memorial Day 2013 - Memorial Day 2015: grains \"Regular close\" 13:15 CT, reopen 19:00 CT, day open 08:30 CT; the 07:45 night close is the CBOT grain hours of the time.")
   (:from (2015 5 27)
    :sessions ((:open (19 0) :close (7 45) :overnight t :labeled-by :close)
               (:open (8 30) :close (13 20)))
    :authority "CME Globex holiday schedules from Labor Day 2015 to 2022: grains \"Regular close\" 13:20 CT (post-close 14:30-16:00), reopen 19:00 CT, day open 08:30 CT, halt 07:45 CT (2022 MLK schedule). The 13:15 to 13:20 change falls between the Memorial Day and Labor Day 2015 schedules."))
 :early-close-rules (
   (:kind :black-friday :from (2023 1 1) :close (12 5)
    :authority "Grains early close 12:05 CT the day after Thanksgiving, CME schedules 2010-2022; 2023 on is that pattern.")
   (:kind :christmas-eve-weekday :from (2023 1 1) :close (12 5)
    :authority "Grains early close 12:05 CT on a weekday Christmas Eve, CME schedules 2015-2020; 2023 on is that pattern."))
 :late-open-rules (
   (:kind :black-friday :from (2023 1 1) :open (8 30) :regular t :overnight nil
    :authority "No grains night session on Thanksgiving evening: the day after Thanksgiving opens 08:30 CT, CME schedules 2013-2022; 2023 on is that pattern."))
 :product-groups (
   (:id :interest-rate
    :name "CBOT Treasury futures on CME Globex"
    :calendar "CME-INTEREST-RATE"
    :eras ((:from (2007 1 2)
            :sessions ((:open (17 0) :close (16 0) :overnight t :labeled-by :close))
            :authority "CME Globex holiday schedules 2009-2022: interest rate products \"Regular close\" 16:00 CT. CBOT financials opened 17:30 CT (not 17:00) in the 2009-2011 schedules; not modelled."))
    :early-close-rules (
      (:kind :no-settlement-day :from (2023 1 1) :close (12 0)
       :authority "Interest-rate holiday halt 12:00 CT in every CME schedule 2014-2022; 2023 on is that pattern.")
      (:kind :black-friday :from (2023 1 1) :close (12 15)
       :authority "Interest-rate early close 12:15 CT the day after Thanksgiving, CME schedules 2009-2022; 2023 on is that pattern.")
      (:kind :christmas-eve-weekday :from (2023 1 1) :close (12 15)
       :authority "Interest-rate early close 12:15 CT on a weekday Christmas Eve, CME schedules 2018-2020; 2023 on is that pattern.")))
   (:id :equity
    :name "CBOT equity index futures (Dow) on CME Globex"
    :calendar "CME-EQUITY"
    :eras ((:from (2007 1 2) :to (2012 12 26)
            :sessions ((:open (17 0) :close (15 15) :overnight t :labeled-by :close))
            :authority "As XCME :equity (CME Group equity products, one row in the schedules).")
           (:from (2012 12 27) :to (2015 9 8)
            :sessions ((:open (17 0) :close (16 15) :overnight t :labeled-by :close))
            :authority "As XCME :equity.")
           (:from (2015 9 9)
            :sessions ((:open (17 0) :close (16 0) :overnight t :labeled-by :close))
            :authority "As XCME :equity."))
    :early-close-rules (
      (:kind :no-settlement-day :from (2023 1 1) :close (12 0) :authority "As XCME :equity.")
      (:kind :black-friday :from (2023 1 1) :close (12 15) :authority "As XCME :equity.")
      (:kind :christmas-eve-weekday :from (2023 1 1) :close (12 15) :authority "As XCME :equity.")
      (:kind :july-3-mon-tue-thu :from (2023 1 1) :close (12 15) :authority "As XCME :equity.")
      (:kind :july-3-wednesday :from (2023 1 1) :close (12 15) :authority "As XCME :equity.")))))
