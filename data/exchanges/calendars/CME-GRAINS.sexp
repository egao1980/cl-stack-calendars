;;;; CBOT grains and oilseeds on CME Globex (corn, soybeans, wheat): the CME Group family
;;;; holidays (CME.sexp) and the grains section of each CME Globex holiday schedule (#48).
;;;; Unlike the financial groups, grains do not trade on the no-settlement holidays: Globex is
;;;; closed for them by day and reopens that evening for the next trade date.
(:name "CME-GRAINS"
 :title "CBOT grains and oilseeds on CME Globex trading days"
 :authority "CME Group yearly CME Globex holiday schedules, \"Grains and Oilseeds\" / \"CBOT Grains\" rows (see CME.sexp)"
 :authority-uri "https://web.archive.org/web/20171210124214/http://www.cmegroup.com:80/tools-information/holiday-calendar.html"
 :product-group :grains
 :include ("CME")
 :rules ((:nth-weekday "Martin Luther King Jr. Day" 1 :monday 3
          :authority "CME Globex MLK schedules 2009-2022: \"CBOT Grain Products will remain closed until 1800 CT on Monday\" (2009); grains open 19:00 Monday for the Tuesday trade date (2015-2022).")
         (:nth-weekday "Presidents Day" 2 :monday 3
          :authority "CME Globex Presidents Day schedules 2009-2022: grains closed by day.")
         (:nth-weekday "Memorial Day" 5 :monday -1
          :authority "CME Globex Memorial Day schedules 2009-2022: grains closed by day.")
         (:fixed "Juneteenth" 6 19 :observed :sunday-to-monday :from 2022
          :authority "CME Juneteenth schedule 2022: grains closed Monday 20 June, open 19:00.")
         (:fixed "Independence Day" 7 4 :observed :nearest-weekday
          :authority "CME Globex Independence Day schedules 2009-2022: grains closed.")
         (:nth-weekday "Labor Day" 9 :monday 1
          :authority "CME Globex Labor Day schedules 2009-2022: grains closed by day.")
         (:nth-weekday "Thanksgiving Day" 11 :thursday 4
          :authority "CME Globex Thanksgiving schedules 2009-2022: grains closed; Friday opens 08:30 CT with no night session."))
 :notices ())
