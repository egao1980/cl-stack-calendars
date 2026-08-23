;;;; JPX / OSE derivatives (equity index + TOCOM-style night).
(
 :mic "XOSE"
 :name "Osaka Exchange / JPX derivatives"
 :zone "Asia/Tokyo"
 :calendar "JP"
 :kind :commodities
 :source "JPX derivatives day 08:45–15:45; night 16:30–06:00"
 :eras (
   (:from (2010 1 4)
    :sessions ((:open (8 45) :close (15 45))
               (:open (16 30) :close (6 0) :overnight t :labeled-by :open))
    :authority "OSE / JPX: day 08:45–15:45, night 16:30–06:00 next day (label = calendar date of day session)")))
