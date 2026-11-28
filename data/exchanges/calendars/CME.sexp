;;;; CME Group family calendar (#48): the CME Globex holidays shared by every product group.
;;;; Product-group calendars (CME-EQUITY, CME-INTEREST-RATE, CME-FX, CME-ENERGY, CME-METALS,
;;;; CME-GRAINS) include this file and take their own section of each notice (:groups).
;;;; Research: ~/.cache/cl-stack-calendars/exchanges/research/cme/ (extraction tables and the
;;;; generator of the 2009-2022 notices below); sources cached under
;;;; ~/.cache/cl-stack-calendars/exchanges/xcme/. cmegroup.com refuses automated fetches, so
;;;; every schedule is cited by its Wayback copy.
;;;;
;;;; A CME Globex holiday is one of three kinds:
;;;;  - closed: no trade date (New Year's Day, Good Friday in most years, Christmas);
;;;;  - no settlement: Globex trades and halts early (12:00 CT for equity and interest-rate
;;;;    products), there is no settlement, and trades are for the next trade date (MLK,
;;;;    Presidents, Memorial, Juneteenth, Independence, Labor, Thanksgiving days);
;;;;  - regular: Columbus Day and Veterans Day (Globex unaffected; banks closed).
;;;; Grains and oilseeds are closed on the no-settlement holidays too (CME-GRAINS).
(:name "CME"
 :title "CME Group Globex holidays (family)"
 :authority "CME Group Holiday Calendar: \"CME Group observes U.S.-recognized holidays. On these holidays, trading hours may vary depending on markets traded. Opening and closing times may be affected on the holiday, as well as the business days prior to or after a holiday.\" Yearly CME Globex holiday schedules 2009-2022 (per holiday and product group), CME Clearing holiday advisories 2016-2027."
 :authority-uri "https://web.archive.org/web/20171210124214/http://www.cmegroup.com:80/tools-information/holiday-calendar.html"
 :rules ((:fixed "New Year's Day" 1 1 :observed :sunday-to-monday
          :authority "CME Globex closed on New Year's Day in every schedule 2009-2023; Monday 2 Jan 2012, 2 Jan 2017 and 2 Jan 2023 closed (Sunday holiday); a Saturday New Year's Day closes no weekday (Fri 31 Dec 2010 and 2021 regular, 2022 New Year's schedule).")
         (:easter "Good Friday" -2
          :authority "CME Globex closed on Good Friday (schedules 2009-2022). The years it traded an abbreviated session (2010, 2012, 2015, 2021, 2023, 2026: the US employment report day) are notices.")
         (:fixed "Christmas Day" 12 25 :observed :nearest-weekday
          :authority "CME Globex closed on Christmas Day; a Saturday Christmas closes the Friday (24 Dec 2010, 24 Dec 2021), a Sunday one the Monday (26 Dec 2011, 2016, 2022) - CME Christmas schedules."))
 :no-settlement-rules ((:nth-weekday "Martin Luther King Jr. Day" 1 :monday 3
                        :authority "CME Globex MLK schedules 2009-2022: trading halts early, Sunday orders are for the Tuesday trade date; CME Clearing advisories 2016-2026: no settlement, prices carried forward.")
                       (:nth-weekday "Presidents Day" 2 :monday 3
                        :authority "CME Globex Presidents Day schedules 2009-2022; CME Clearing advisories 2016-2026.")
                       (:nth-weekday "Memorial Day" 5 :monday -1
                        :authority "CME Globex Memorial Day schedules 2009-2022; CME Clearing advisories 2016-2026.")
                       (:fixed "Juneteenth" 6 19 :observed :sunday-to-monday :from 2022
                        :authority "CME Juneteenth schedule 2022 (Monday 20 June observed) and clearing advisories 2022-2026; for Saturday 19 June 2027 CME's trading-hours page says orders from Thursday 17 June cancel at the close of trading on Friday 18 June (a trade date), so a Saturday Juneteenth moves to no weekday. https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
                       (:fixed "Independence Day" 7 4 :observed :nearest-weekday
                        :authority "CME Globex Independence Day schedules 2009-2022 (Friday 3 July 2009, 2015 and 2020 for a Saturday 4 July; Monday 5 July 2010 and 2021 for a Sunday); CME Clearing 2026 Independence Day advisory (Friday 3 July 2026).")
                       (:nth-weekday "Labor Day" 9 :monday 1
                        :authority "CME Globex Labor Day schedules 2009-2022; CME Clearing advisories 2016-2026.")
                       (:nth-weekday "Thanksgiving Day" 11 :thursday 4
                        :authority "CME Globex Thanksgiving schedules 2009-2022; CME Clearing advisories 2016-2026."))
 :gaps ("Before 2009: no CME Globex holiday schedule found; the rules are applied unverified."
        "2023-2027: CME no longer publishes Globex holiday hours as files (the hours are in a date picker on the trading-hours page, not in any Wayback capture). The closures and no-settlement days come from the CME Clearing advisories and the trading-hours page; halt and early-close times are the 2021-2022 pattern (hours files, :from 2023), unverified."
        "Livestock, dairy, lumber, softs, crypto and the other CME Group product groups are not modelled (#48 follow-up).")
 :notices (
  (:title "CME Globex New Year's holiday schedule 2009"
   :year 2009 :holiday :new-years
   :uri "https://web.archive.org/web/20130309115356/http://www.cmegroup.com/tools-information/holiday-calendar/files/2009-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2013 3 9) :published-uri "https://web.archive.org/web/20130309115356/http://www.cmegroup.com/tools-information/holiday-calendar/files/2009-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2009-new-years.pdf in CME's yearly holiday-calendars zip. This copy is a later re-export (printed date 2012-11-08, after the holiday), so the issue date is unknown; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :sessions (((2009 1 2) ((:open (5 0) :close (15 15))) "New Year's: opens 05:00 CT, no overnight session")))
            (:interest-rate
              :early-closes (((2008 12 31) (15 15) "New Year's early close"))
              :sessions (((2009 1 2) ((:open (5 0) :close (16 0))) "New Year's: opens 05:00 CT, no overnight session")))
            (:fx
              :early-closes (((2008 12 31) (15 15) "New Year's early close"))
              :sessions (((2009 1 2) ((:open (5 0) :close (16 0))) "New Year's: opens 05:00 CT, no overnight session")))
            (:grains
              :sessions (((2009 1 2) ((:open (9 30) :close (13 15))) "New Year's: opens 09:30 CT, no overnight session")))))
  (:title "CME Globex Martin Luther King Jr. Day holiday schedule 2009"
   :year 2009 :holiday :mlk
   :uri "https://web.archive.org/web/20090126144353/http://cmegroup.com:80/tools-information/holiday-calendar/files/2009-martin-luther-king.pdf"
   :issued (2008 12 30) :issued-uri "https://web.archive.org/web/20090126144353/http://cmegroup.com:80/tools-information/holiday-calendar/files/2009-martin-luther-king.pdf"
   :published (2009 1 26) :published-uri "https://web.archive.org/web/20090126144353/http://cmegroup.com:80/tools-information/holiday-calendar/files/2009-martin-luther-king.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2009 1 19) (10 30) "Martin Luther King Jr. Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2009 1 16) (15 15) "Martin Luther King Jr. Day early close")
                ((2009 1 19) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:fx
              :early-closes (((2009 1 16) (15 15) "Martin Luther King Jr. Day early close")
                ((2009 1 19) (12 0) "Martin Luther King Jr. Day halt, no settlement")))))
  (:title "CME Globex Presidents Day holiday schedule 2009"
   :year 2009 :holiday :presidents
   :uri "https://web.archive.org/web/20090206002053/http://cmegroup.com:80/tools-information/holiday-calendar/files/2009-presidents-day.pdf"
   :issued (2009 1 20) :issued-uri "https://web.archive.org/web/20090206002053/http://cmegroup.com:80/tools-information/holiday-calendar/files/2009-presidents-day.pdf"
   :published (2009 2 6) :published-uri "https://web.archive.org/web/20090206002053/http://cmegroup.com:80/tools-information/holiday-calendar/files/2009-presidents-day.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2009 2 16) (10 30) "Presidents Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2009 2 13) (15 15) "Presidents Day early close")
                ((2009 2 16) (12 0) "Presidents Day halt, no settlement")))
            (:fx
              :early-closes (((2009 2 13) (15 15) "Presidents Day early close")
                ((2009 2 16) (12 0) "Presidents Day halt, no settlement")))))
  (:title "CME Globex Good Friday holiday schedule 2009"
   :year 2009 :holiday :good-friday
   :uri "https://web.archive.org/web/20090419033107/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-good-friday.pdf"
   :issued (2009 4 9) :issued-uri "https://web.archive.org/web/20090419033107/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-good-friday.pdf"
   :published (2009 4 19) :published-uri "https://web.archive.org/web/20090419033107/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-good-friday.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:interest-rate
              :early-closes (((2009 4 9) (15 15) "Good Friday early close")))
            (:fx
              :early-closes (((2009 4 9) (15 15) "Good Friday early close")))))
  (:title "CME Globex Memorial Day holiday schedule 2009"
   :year 2009 :holiday :memorial
   :uri "https://web.archive.org/web/20090611163557/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-memorial-day.pdf"
   :issued (2009 5 19) :issued-uri "https://web.archive.org/web/20090611163557/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-memorial-day.pdf"
   :published (2009 6 11) :published-uri "https://web.archive.org/web/20090611163557/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-memorial-day.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2009 5 25) (10 30) "Memorial Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2009 5 22) (15 15) "Memorial Day early close")
                ((2009 5 25) (12 0) "Memorial Day halt, no settlement")))
            (:fx
              :early-closes (((2009 5 22) (15 15) "Memorial Day early close")
                ((2009 5 25) (12 0) "Memorial Day halt, no settlement")))
            (:energy
              :early-closes (((2009 5 22) (15 15) "Memorial Day early close")
                ((2009 5 25) (12 15) "Memorial Day halt, no settlement")))
            (:metals
              :early-closes (((2009 5 22) (15 15) "Memorial Day early close")
                ((2009 5 25) (12 15) "Memorial Day halt, no settlement")))))
  (:title "CME Globex Independence Day holiday schedule 2009"
   :year 2009 :holiday :independence
   :uri "https://web.archive.org/web/20090612061133/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-4th-of-july.pdf"
   :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20090612061133/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-4th-of-july.pdf"
   :published (2009 6 12) :published-uri "https://web.archive.org/web/20090612061133/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-4th-of-july.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2009 7 3) (10 30) "Independence Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2009 7 3) (12 0) "Independence Day halt, no settlement")))
            (:fx
              :early-closes (((2009 7 3) (12 0) "Independence Day halt, no settlement")))
            (:energy
              :early-closes (((2009 7 3) (12 30) "Independence Day halt, no settlement")))
            (:metals
              :early-closes (((2009 7 3) (12 30) "Independence Day halt, no settlement")))))
  (:title "CME Globex Labor Day holiday schedule 2009"
   :year 2009 :holiday :labor
   :uri "https://web.archive.org/web/20091007030433/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-labor-day.pdf"
   :issued (2009 5 19) :issued-uri "https://web.archive.org/web/20091007030433/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-labor-day.pdf"
   :published (2009 10 7) :published-uri "https://web.archive.org/web/20091007030433/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-labor-day.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2009 9 7) (10 30) "Labor Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2009 9 4) (15 15) "Labor Day early close")
                ((2009 9 7) (12 0) "Labor Day halt, no settlement")))
            (:fx
              :early-closes (((2009 9 4) (15 15) "Labor Day early close")
                ((2009 9 7) (12 0) "Labor Day halt, no settlement")))
            (:energy
              :early-closes (((2009 9 4) (15 15) "Labor Day early close")
                ((2009 9 7) (12 15) "Labor Day halt, no settlement")))
            (:metals
              :early-closes (((2009 9 4) (15 15) "Labor Day early close")
                ((2009 9 7) (12 15) "Labor Day halt, no settlement")))))
  (:title "CME Globex Columbus Day holiday schedule 2009"
   :year 2009 :holiday :columbus
   :uri "https://web.archive.org/web/20130309115356/http://www.cmegroup.com/tools-information/holiday-calendar/files/2009-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2013 3 9) :published-uri "https://web.archive.org/web/20130309115356/http://www.cmegroup.com/tools-information/holiday-calendar/files/2009-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2009-columbus-day.pdf in CME's yearly holiday-calendars zip. This copy is a later re-export (printed date 2012-11-08, after the holiday), so the issue date is unknown; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:interest-rate
              :early-closes (((2009 10 9) (15 15) "Columbus Day early close")))
            (:fx
              :early-closes (((2009 10 9) (15 15) "Columbus Day early close")))
            (:energy
              :early-closes (((2009 10 9) (15 15) "Columbus Day early close")))
            (:metals
              :early-closes (((2009 10 9) (15 15) "Columbus Day early close")))))
  (:title "CME Globex Veterans Day holiday schedule 2009"
   :year 2009 :holiday :veterans
   :uri "https://web.archive.org/web/20091122055507/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-veterans-day.pdf"
   :issued (2009 11 4) :issued-uri "https://web.archive.org/web/20091122055507/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-veterans-day.pdf"
   :published (2009 11 22) :published-uri "https://web.archive.org/web/20091122055507/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-veterans-day.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Thanksgiving holiday schedule 2009"
   :year 2009 :holiday :thanksgiving
   :uri "https://web.archive.org/web/20130309115356/http://www.cmegroup.com/tools-information/holiday-calendar/files/2009-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2013 3 9) :published-uri "https://web.archive.org/web/20130309115356/http://www.cmegroup.com/tools-information/holiday-calendar/files/2009-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2009-thanksgiving.pdf in CME's yearly holiday-calendars zip. This copy is a later re-export (printed date 2012-11-08, after the holiday), so the issue date is unknown; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2009 11 26) (10 30) "Thanksgiving halt, no settlement")
                ((2009 11 27) (12 15) "Thanksgiving early close")))
            (:interest-rate
              :early-closes (((2009 11 26) (12 0) "Thanksgiving halt, no settlement")
                ((2009 11 27) (12 15) "Thanksgiving early close")))
            (:fx
              :early-closes (((2009 11 26) (12 0) "Thanksgiving halt, no settlement")
                ((2009 11 27) (12 15) "Thanksgiving early close")))
            (:energy
              :early-closes (((2009 11 26) (12 15) "Thanksgiving halt, no settlement")
                ((2009 11 27) (12 45) "Thanksgiving early close")))
            (:metals
              :early-closes (((2009 11 26) (12 15) "Thanksgiving halt, no settlement")
                ((2009 11 27) (12 45) "Thanksgiving early close")))
            (:grains
              :early-closes (((2009 11 27) (12 0) "Thanksgiving early close")))))
  (:title "CME Globex Christmas holiday schedule 2009"
   :year 2009 :holiday :christmas
   :uri "https://web.archive.org/web/20100215055401/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-christmas.pdf"
   :issued (2009 12 8) :issued-uri "https://web.archive.org/web/20100215055401/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-christmas.pdf"
   :published (2010 2 15) :published-uri "https://web.archive.org/web/20100215055401/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-christmas.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2009 12 24) (12 15) "Christmas early close")))
            (:interest-rate
              :early-closes (((2009 12 24) (12 15) "Christmas early close")))
            (:fx
              :early-closes (((2009 12 24) (12 15) "Christmas early close")))
            (:energy
              :early-closes (((2009 12 24) (12 45) "Christmas early close")))
            (:metals
              :early-closes (((2009 12 24) (12 45) "Christmas early close")))
            (:grains
              :early-closes (((2009 12 24) (12 0) "Christmas early close")))))
  (:title "CME Globex New Year's holiday schedule 2010"
   :year 2010 :holiday :new-years
   :uri "https://web.archive.org/web/20100215051652/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-new-years.pdf"
   :issued (2009 12 21) :issued-uri "https://web.archive.org/web/20100215051652/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-new-years.pdf"
   :published (2010 2 15) :published-uri "https://web.archive.org/web/20100215051652/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-new-years.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Martin Luther King Jr. Day holiday schedule 2010"
   :year 2010 :holiday :mlk
   :uri "https://web.archive.org/web/20100331064226/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-martin-luther-king.pdf"
   :issued (2009 12 21) :issued-uri "https://web.archive.org/web/20100331064226/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-martin-luther-king.pdf"
   :published (2010 3 31) :published-uri "https://web.archive.org/web/20100331064226/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-martin-luther-king.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2010 1 18) (10 30) "Martin Luther King Jr. Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2010 1 15) (15 15) "Martin Luther King Jr. Day early close")
                ((2010 1 18) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:fx
              :early-closes (((2010 1 15) (15 15) "Martin Luther King Jr. Day early close")
                ((2010 1 18) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:energy
              :early-closes (((2010 1 15) (15 15) "Martin Luther King Jr. Day early close")
                ((2010 1 18) (12 15) "Martin Luther King Jr. Day halt, no settlement")))
            (:metals
              :early-closes (((2010 1 15) (15 15) "Martin Luther King Jr. Day early close")
                ((2010 1 18) (12 15) "Martin Luther King Jr. Day halt, no settlement")))))
  (:title "CME Globex Presidents Day holiday schedule 2010"
   :year 2010 :holiday :presidents
   :uri "https://web.archive.org/web/20100215064641/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-presidents-day.pdf"
   :issued (2010 2 3) :issued-uri "https://web.archive.org/web/20100215064641/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-presidents-day.pdf"
   :published (2010 2 15) :published-uri "https://web.archive.org/web/20100215064641/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-presidents-day.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2010 2 15) (10 30) "Presidents Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2010 2 12) (15 15) "Presidents Day early close")
                ((2010 2 15) (12 0) "Presidents Day halt, no settlement")))
            (:fx
              :early-closes (((2010 2 12) (15 15) "Presidents Day early close")
                ((2010 2 15) (12 0) "Presidents Day halt, no settlement")))
            (:energy
              :early-closes (((2010 2 12) (15 15) "Presidents Day early close")
                ((2010 2 15) (12 15) "Presidents Day halt, no settlement")))
            (:metals
              :early-closes (((2010 2 12) (15 15) "Presidents Day early close")
                ((2010 2 15) (12 15) "Presidents Day halt, no settlement")))))
  (:title "CME Globex Good Friday holiday schedule 2010"
   :year 2010 :holiday :good-friday
   :uri "https://web.archive.org/web/20100601111916/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-good-friday.pdf"
   :issued nil :issued-uri nil
   :published (2010 6 1) :published-uri "https://web.archive.org/web/20100601111916/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-good-friday.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "This copy is a later re-export (printed date 2010-04-05, after the holiday), so the issue date is unknown; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :open (((2010 4 2) "Good Friday: Good Friday trading: \"0815 CT - Early CME Globex close for trade date Friday Apr 2\""))
              :early-closes (((2010 4 2) (8 15) "Good Friday early close")))
            (:interest-rate
              :open (((2010 4 2) "Good Friday: Good Friday trading: \"1015 CT - Early CME Globex close for trade date Friday Apr 2\""))
              :early-closes (((2010 4 2) (10 15) "Good Friday early close")))
            (:fx
              :open (((2010 4 2) "Good Friday: Good Friday trading: \"1015 CT - Early CME Globex close for trade date Friday Apr 2\""))
              :early-closes (((2010 4 2) (10 15) "Good Friday early close")))))
  (:title "CME Globex Memorial Day holiday schedule 2010"
   :year 2010 :holiday :memorial
   :uri "https://web.archive.org/web/20100601094225/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-memorial-day.pdf"
   :issued (2010 5 21) :issued-uri "https://web.archive.org/web/20100601094225/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-memorial-day.pdf"
   :published (2010 6 1) :published-uri "https://web.archive.org/web/20100601094225/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-memorial-day.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2010 5 31) (10 30) "Memorial Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2010 5 28) (15 15) "Memorial Day early close")
                ((2010 5 31) (12 0) "Memorial Day halt, no settlement")))
            (:fx
              :early-closes (((2010 5 28) (15 15) "Memorial Day early close")
                ((2010 5 31) (12 0) "Memorial Day halt, no settlement")))
            (:energy
              :early-closes (((2010 5 28) (15 15) "Memorial Day early close")
                ((2010 5 31) (12 15) "Memorial Day halt, no settlement")))
            (:metals
              :early-closes (((2010 5 28) (15 15) "Memorial Day early close")
                ((2010 5 31) (12 15) "Memorial Day halt, no settlement")))))
  (:title "CME Globex Independence Day holiday schedule 2010"
   :year 2010 :holiday :independence
   :uri "https://web.archive.org/web/20100602005637/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-4th-of-july.pdf"
   :issued (2010 6 1) :issued-uri "https://web.archive.org/web/20100602005637/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-4th-of-july.pdf"
   :published (2010 6 2) :published-uri "https://web.archive.org/web/20100602005637/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-4th-of-july.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2010 7 5) (10 30) "Independence Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2010 7 2) (15 15) "Independence Day early close")
                ((2010 7 5) (12 0) "Independence Day halt, no settlement")))
            (:fx
              :early-closes (((2010 7 2) (15 15) "Independence Day early close")
                ((2010 7 5) (12 0) "Independence Day halt, no settlement")))
            (:energy
              :early-closes (((2010 7 2) (15 15) "Independence Day early close")
                ((2010 7 5) (12 15) "Independence Day halt, no settlement")))
            (:metals
              :early-closes (((2010 7 2) (15 15) "Independence Day early close")
                ((2010 7 5) (12 15) "Independence Day halt, no settlement")))))
  (:title "CME Globex Labor Day holiday schedule 2010"
   :year 2010 :holiday :labor
   :uri "https://web.archive.org/web/20100602005641/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-labor-day.pdf"
   :issued (2010 3 5) :issued-uri "https://web.archive.org/web/20100602005641/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-labor-day.pdf"
   :published (2010 6 2) :published-uri "https://web.archive.org/web/20100602005641/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-labor-day.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2010 9 6) (10 30) "Labor Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2010 9 3) (15 15) "Labor Day early close")
                ((2010 9 6) (12 0) "Labor Day halt, no settlement")))
            (:fx
              :early-closes (((2010 9 3) (15 15) "Labor Day early close")
                ((2010 9 6) (12 0) "Labor Day halt, no settlement")))
            (:energy
              :early-closes (((2010 9 3) (15 15) "Labor Day early close")
                ((2010 9 6) (12 15) "Labor Day halt, no settlement")))
            (:metals
              :early-closes (((2010 9 3) (15 15) "Labor Day early close")
                ((2010 9 6) (12 15) "Labor Day halt, no settlement")))))
  (:title "CME Globex Columbus Day holiday schedule 2010"
   :year 2010 :holiday :columbus
   :uri "https://web.archive.org/web/20100821133122/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-columbus-day.pdf"
   :issued (2010 6 9) :issued-uri "https://web.archive.org/web/20100821133122/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-columbus-day.pdf"
   :published (2010 8 21) :published-uri "https://web.archive.org/web/20100821133122/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-columbus-day.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:interest-rate
              :early-closes (((2010 10 8) (15 15) "Columbus Day early close")))
            (:fx
              :early-closes (((2010 10 8) (15 15) "Columbus Day early close")))
            (:energy
              :early-closes (((2010 10 8) (15 15) "Columbus Day early close")))
            (:metals
              :early-closes (((2010 10 8) (15 15) "Columbus Day early close")))))
  (:title "CME Globex Veterans Day holiday schedule 2010"
   :year 2010 :holiday :veterans
   :uri "https://web.archive.org/web/20101122094019/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-veterans-day.pdf"
   :issued (2010 10 29) :issued-uri "https://web.archive.org/web/20101122094019/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-veterans-day.pdf"
   :published (2010 11 22) :published-uri "https://web.archive.org/web/20101122094019/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-veterans-day.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Thanksgiving holiday schedule 2010"
   :year 2010 :holiday :thanksgiving
   :uri "https://web.archive.org/web/20101122094012/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-thanksgiving.pdf"
   :issued (2010 11 19) :issued-uri "https://web.archive.org/web/20101122094012/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-thanksgiving.pdf"
   :published (2010 11 22) :published-uri "https://web.archive.org/web/20101122094012/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-thanksgiving.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2010 11 25) (10 30) "Thanksgiving halt, no settlement")
                ((2010 11 26) (12 15) "Thanksgiving early close")))
            (:interest-rate
              :early-closes (((2010 11 25) (12 0) "Thanksgiving halt, no settlement")
                ((2010 11 26) (12 15) "Thanksgiving early close")))
            (:fx
              :early-closes (((2010 11 25) (12 0) "Thanksgiving halt, no settlement")
                ((2010 11 26) (12 15) "Thanksgiving early close")))
            (:energy
              :early-closes (((2010 11 25) (12 15) "Thanksgiving halt, no settlement")
                ((2010 11 26) (12 45) "Thanksgiving early close")))
            (:metals
              :early-closes (((2010 11 25) (12 15) "Thanksgiving halt, no settlement")
                ((2010 11 26) (12 45) "Thanksgiving early close")))
            (:grains
              :early-closes (((2010 11 26) (12 0) "Thanksgiving early close")))))
  (:title "CME Globex Christmas holiday schedule 2010"
   :year 2010 :holiday :christmas
   :uri "https://web.archive.org/web/20101214061238/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-christmas.pdf"
   :issued (2010 12 13) :issued-uri "https://web.archive.org/web/20101214061238/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-christmas.pdf"
   :published (2010 12 14) :published-uri "https://web.archive.org/web/20101214061238/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-christmas.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex New Year's holiday schedule 2011"
   :year 2011 :holiday :new-years
   :uri "https://web.archive.org/web/20101214061245/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2011-new-years.pdf"
   :issued (2010 12 3) :issued-uri "https://web.archive.org/web/20101214061245/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2011-new-years.pdf"
   :published (2010 12 14) :published-uri "https://web.archive.org/web/20101214061245/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2011-new-years.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:interest-rate
              :early-closes (((2010 12 31) (12 15) "New Year's early close")))
            (:fx
              :early-closes (((2010 12 31) (12 15) "New Year's early close")))
            (:energy
              :early-closes (((2010 12 31) (15 15) "New Year's early close")))
            (:metals
              :early-closes (((2010 12 31) (15 15) "New Year's early close")))
            (:grains
              :early-closes (((2010 12 31) (12 0) "New Year's early close")))))
  (:title "CME Globex Martin Luther King Jr. Day holiday schedule 2011"
   :year 2011 :holiday :mlk
   :uri "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2013 3 9) :published-uri "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2011-martin-luther-king-done.pdf in CME's yearly holiday-calendars zip. This copy is a later re-export (printed date 2012-11-08, after the holiday), so the issue date is unknown; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2011 1 17) (10 30) "Martin Luther King Jr. Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2011 1 14) (15 15) "Martin Luther King Jr. Day early close")
                ((2011 1 17) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:fx
              :early-closes (((2011 1 14) (15 15) "Martin Luther King Jr. Day early close")
                ((2011 1 17) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:energy
              :early-closes (((2011 1 14) (15 15) "Martin Luther King Jr. Day early close")
                ((2011 1 17) (12 15) "Martin Luther King Jr. Day halt, no settlement")))
            (:metals
              :early-closes (((2011 1 14) (15 15) "Martin Luther King Jr. Day early close")
                ((2011 1 17) (12 15) "Martin Luther King Jr. Day halt, no settlement")))))
  (:title "CME Globex Presidents Day holiday schedule 2011"
   :year 2011 :holiday :presidents
   :uri "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2013 3 9) :published-uri "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2011-presidents-day-done.pdf in CME's yearly holiday-calendars zip. This copy is a later re-export (printed date 2012-11-08, after the holiday), so the issue date is unknown; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2011 2 21) (10 30) "Presidents Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2011 2 18) (15 15) "Presidents Day early close")
                ((2011 2 21) (12 0) "Presidents Day halt, no settlement")))
            (:fx
              :early-closes (((2011 2 18) (15 15) "Presidents Day early close")
                ((2011 2 21) (12 0) "Presidents Day halt, no settlement")))
            (:energy
              :early-closes (((2011 2 21) (12 15) "Presidents Day halt, no settlement")))
            (:metals
              :early-closes (((2011 2 21) (12 15) "Presidents Day halt, no settlement")))))
  (:title "CME Globex Good Friday holiday schedule 2011"
   :year 2011 :holiday :good-friday
   :uri "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2013 3 9) :published-uri "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2011-good-friday-done.pdf in CME's yearly holiday-calendars zip. This copy is a later re-export (printed date 2012-11-08, after the holiday), so the issue date is unknown; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Memorial Day holiday schedule 2011"
   :year 2011 :holiday :memorial
   :uri "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2013 3 9) :published-uri "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2011-memorial-day-done.pdf in CME's yearly holiday-calendars zip. This copy is a later re-export (printed date 2012-11-08, after the holiday), so the issue date is unknown; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2011 5 30) (10 30) "Memorial Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2011 5 27) (15 15) "Memorial Day early close")
                ((2011 5 30) (12 0) "Memorial Day halt, no settlement")))
            (:fx
              :early-closes (((2011 5 27) (15 15) "Memorial Day early close")
                ((2011 5 30) (12 0) "Memorial Day halt, no settlement")))
            (:energy
              :early-closes (((2011 5 30) (12 15) "Memorial Day halt, no settlement")))
            (:metals
              :early-closes (((2011 5 30) (12 15) "Memorial Day halt, no settlement")))))
  (:title "CME Globex Independence Day holiday schedule 2011"
   :year 2011 :holiday :independence
   :uri "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2013 3 9) :published-uri "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2011-4th-of-july-done.pdf in CME's yearly holiday-calendars zip. This copy is a later re-export (printed date 2012-11-08, after the holiday), so the issue date is unknown; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2011 7 4) (10 30) "Independence Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2011 7 1) (15 15) "Independence Day early close")
                ((2011 7 4) (12 0) "Independence Day halt, no settlement")))
            (:fx
              :early-closes (((2011 7 1) (15 15) "Independence Day early close")
                ((2011 7 4) (12 0) "Independence Day halt, no settlement")))
            (:energy
              :early-closes (((2011 7 4) (12 15) "Independence Day halt, no settlement")))
            (:metals
              :early-closes (((2011 7 4) (12 15) "Independence Day halt, no settlement")))))
  (:title "CME Globex Labor Day holiday schedule 2011"
   :year 2011 :holiday :labor
   :uri "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2013 3 9) :published-uri "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2011-labor-day-done.pdf in CME's yearly holiday-calendars zip. This copy is a later re-export (printed date 2012-11-08, after the holiday), so the issue date is unknown; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2011 9 5) (10 30) "Labor Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2011 9 2) (15 15) "Labor Day early close")
                ((2011 9 5) (12 0) "Labor Day halt, no settlement")))
            (:fx
              :early-closes (((2011 9 2) (15 15) "Labor Day early close")
                ((2011 9 5) (12 0) "Labor Day halt, no settlement")))
            (:energy
              :early-closes (((2011 9 5) (12 15) "Labor Day halt, no settlement")))
            (:metals
              :early-closes (((2011 9 5) (12 15) "Labor Day halt, no settlement")))))
  (:title "CME Globex Columbus Day holiday schedule 2011"
   :year 2011 :holiday :columbus
   :uri "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2013 3 9) :published-uri "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2011-columbus-day-done.pdf in CME's yearly holiday-calendars zip. This copy is a later re-export (printed date 2012-11-08, after the holiday), so the issue date is unknown; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:interest-rate
              :early-closes (((2011 10 7) (15 15) "Columbus Day early close")))
            (:fx
              :early-closes (((2011 10 7) (15 15) "Columbus Day early close")))))
  (:title "CME Globex Veterans Day holiday schedule 2011"
   :year 2011 :holiday :veterans
   :uri "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2013 3 9) :published-uri "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2011-veterans-day-done.pdf in CME's yearly holiday-calendars zip. This copy is a later re-export (printed date 2012-11-08, after the holiday), so the issue date is unknown; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :closed (((2011 11 10) "Veterans Day")))
            (:interest-rate
              :closed (((2011 11 10) "Veterans Day")))
            (:fx
              :closed (((2011 11 10) "Veterans Day")))
            (:energy
              :closed (((2011 11 10) "Veterans Day")))
            (:metals
              :closed (((2011 11 10) "Veterans Day")))
            (:grains
              :closed (((2011 11 10) "Veterans Day")))))
  (:title "CME Globex Thanksgiving holiday schedule 2011"
   :year 2011 :holiday :thanksgiving
   :uri "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2013 3 9) :published-uri "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2011-thanksgiving-done.pdf in CME's yearly holiday-calendars zip. This copy is a later re-export (printed date 2012-11-08, after the holiday), so the issue date is unknown; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2011 11 24) (10 30) "Thanksgiving halt, no settlement")
                ((2011 11 25) (12 15) "Thanksgiving early close")))
            (:interest-rate
              :early-closes (((2011 11 24) (12 0) "Thanksgiving halt, no settlement")
                ((2011 11 25) (12 15) "Thanksgiving early close")))
            (:fx
              :early-closes (((2011 11 24) (12 0) "Thanksgiving halt, no settlement")
                ((2011 11 25) (12 15) "Thanksgiving early close")))
            (:energy
              :early-closes (((2011 11 24) (12 15) "Thanksgiving halt, no settlement")
                ((2011 11 25) (12 45) "Thanksgiving early close")))
            (:metals
              :early-closes (((2011 11 24) (12 15) "Thanksgiving halt, no settlement")
                ((2011 11 25) (12 45) "Thanksgiving early close")))
            (:grains
              :early-closes (((2011 11 25) (12 0) "Thanksgiving early close")))))
  (:title "CME Globex Christmas holiday schedule 2011"
   :year 2011 :holiday :christmas
   :uri "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2013 3 9) :published-uri "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2011-christmas  (2).pdf in CME's yearly holiday-calendars zip. This copy is a later re-export (printed date 2012-11-08, after the holiday), so the issue date is unknown; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :sessions (((2011 12 27) ((:open (5 0) :close (15 15))) "Christmas: opens 05:00 CT, no overnight session")))
            (:interest-rate
              :sessions (((2011 12 27) ((:open (5 0) :close (16 0))) "Christmas: opens 05:00 CT, no overnight session")))
            (:fx
              :sessions (((2011 12 27) ((:open (5 0) :close (16 0))) "Christmas: opens 05:00 CT, no overnight session")))
            (:grains
              :sessions (((2011 12 27) ((:open (9 30) :close (13 15))) "Christmas: opens 09:30 CT, no overnight session")))))
  (:title "CME Globex New Year's holiday schedule 2012"
   :year 2012 :holiday :new-years
   :uri "https://web.archive.org/web/20130309115256/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2013 3 9) :published-uri "https://web.archive.org/web/20130309115256/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2012-new-years.pdf in CME's yearly holiday-calendars zip. This copy is a later re-export (printed date 2012-11-08, after the holiday), so the issue date is unknown; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :sessions (((2012 1 3) ((:open (5 0) :close (15 15))) "New Year's: opens 05:00 CT, no overnight session")))
            (:interest-rate
              :sessions (((2012 1 3) ((:open (5 0) :close (16 0))) "New Year's: opens 05:00 CT, no overnight session")))
            (:fx
              :sessions (((2012 1 3) ((:open (5 0) :close (16 0))) "New Year's: opens 05:00 CT, no overnight session")))
            (:grains
              :sessions (((2012 1 3) ((:open (9 30) :close (13 15))) "New Year's: opens 09:30 CT, no overnight session")))))
  (:title "CME Globex Martin Luther King Jr. Day holiday schedule 2012"
   :year 2012 :holiday :mlk
   :uri "https://web.archive.org/web/20120105160459/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2012-martin-luther-king.pdf"
   :issued (2012 1 4) :issued-uri "https://web.archive.org/web/20120105160459/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2012-martin-luther-king.pdf"
   :published (2012 1 5) :published-uri "https://web.archive.org/web/20120105160459/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2012-martin-luther-king.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2012 1 16) (10 30) "Martin Luther King Jr. Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2012 1 13) (15 15) "Martin Luther King Jr. Day early close")
                ((2012 1 16) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:fx
              :early-closes (((2012 1 13) (15 15) "Martin Luther King Jr. Day early close")
                ((2012 1 16) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:energy
              :early-closes (((2012 1 16) (12 15) "Martin Luther King Jr. Day halt, no settlement")))
            (:metals
              :early-closes (((2012 1 16) (12 15) "Martin Luther King Jr. Day halt, no settlement")))))
  (:title "CME Globex Presidents Day holiday schedule 2012"
   :year 2012 :holiday :presidents
   :uri "https://web.archive.org/web/20120107064434/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-presidents-day.pdf"
   :issued (2011 11 16) :issued-uri "https://web.archive.org/web/20120107064434/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-presidents-day.pdf"
   :published (2012 1 7) :published-uri "https://web.archive.org/web/20120107064434/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-presidents-day.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2012 2 20) (10 30) "Presidents Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2012 2 17) (15 15) "Presidents Day early close")
                ((2012 2 20) (12 0) "Presidents Day halt, no settlement")))
            (:fx
              :early-closes (((2012 2 17) (15 15) "Presidents Day early close")
                ((2012 2 20) (12 0) "Presidents Day halt, no settlement")))
            (:energy
              :early-closes (((2012 2 20) (12 15) "Presidents Day halt, no settlement")))
            (:metals
              :early-closes (((2012 2 20) (12 15) "Presidents Day halt, no settlement")))))
  (:title "CME Globex Good Friday holiday schedule 2012"
   :year 2012 :holiday :good-friday
   :uri "https://web.archive.org/web/20120107070731/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-good-friday.pdf"
   :issued (2011 12 5) :issued-uri "https://web.archive.org/web/20120107070731/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-good-friday.pdf"
   :published (2012 1 7) :published-uri "https://web.archive.org/web/20120107070731/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-good-friday.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :open (((2012 4 6) "Good Friday: Good Friday trading: \"0815 CT - Early CME Globex close for trade date Friday Apr 6\""))
              :early-closes (((2012 4 6) (8 15) "Good Friday early close")))
            (:interest-rate
              :open (((2012 4 6) "Good Friday: Good Friday trading: \"1015 CT - Early CME Globex close for trade date Friday Apr 6\""))
              :early-closes (((2012 4 6) (10 15) "Good Friday early close")))
            (:fx
              :open (((2012 4 6) "Good Friday: Good Friday trading: \"1015 CT - Early CME Globex close for trade date Friday Apr 6\""))
              :early-closes (((2012 4 6) (10 15) "Good Friday early close")))))
  (:title "CME Globex Memorial Day holiday schedule 2012"
   :year 2012 :holiday :memorial
   :uri "https://web.archive.org/web/20120915003402/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-4th-of-july.xls"
   :issued nil :issued-uri nil
   :published (2012 9 15) :published-uri "https://web.archive.org/web/20120915003402/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-4th-of-july.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2012 5 28) (10 30) "Memorial Day halt, no settlement")
                ((2012 7 3) (12 15) "Memorial Day early close")
                ((2012 7 4) (10 30) "Memorial Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2012 5 25) (15 15) "Memorial Day early close")
                ((2012 5 28) (12 0) "Memorial Day halt, no settlement")
                ((2012 7 4) (12 0) "Memorial Day halt, no settlement")))
            (:fx
              :early-closes (((2012 5 25) (15 15) "Memorial Day early close")
                ((2012 5 28) (12 0) "Memorial Day halt, no settlement")
                ((2012 7 4) (12 0) "Memorial Day halt, no settlement")))
            (:energy
              :early-closes (((2012 5 28) (12 15) "Memorial Day halt, no settlement")
                ((2012 7 4) (12 15) "Memorial Day halt, no settlement")))
            (:metals
              :early-closes (((2012 5 28) (12 15) "Memorial Day halt, no settlement")
                ((2012 7 4) (12 15) "Memorial Day halt, no settlement")))
            (:grains
              :early-closes (((2012 7 3) (12 0) "Memorial Day early close"))
              :sessions (((2012 7 5) ((:open (9 30) :close (14 0))) "Memorial Day: opens 09:30 CT, no overnight session")))))
  (:title "CME Globex Labor Day holiday schedule 2012"
   :year 2012 :holiday :labor
   :uri "https://web.archive.org/web/20120915003609/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-labor-day.xls"
   :issued nil :issued-uri nil
   :published (2012 9 15) :published-uri "https://web.archive.org/web/20120915003609/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-labor-day.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2012 9 3) (10 30) "Labor Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2012 8 31) (15 15) "Labor Day early close")
                ((2012 9 3) (12 0) "Labor Day halt, no settlement")))
            (:fx
              :early-closes (((2012 8 31) (15 15) "Labor Day early close")
                ((2012 9 3) (12 0) "Labor Day halt, no settlement")))
            (:energy
              :early-closes (((2012 9 3) (12 15) "Labor Day halt, no settlement")))
            (:metals
              :early-closes (((2012 9 3) (12 15) "Labor Day halt, no settlement")))))
  (:title "CME Globex Columbus Day holiday schedule 2012"
   :year 2012 :holiday :columbus
   :uri "https://web.archive.org/web/20120107061537/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-columbus-day.pdf"
   :issued (2011 11 16) :issued-uri "https://web.archive.org/web/20120107061537/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-columbus-day.pdf"
   :published (2012 1 7) :published-uri "https://web.archive.org/web/20120107061537/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-columbus-day.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:interest-rate
              :early-closes (((2012 10 5) (15 15) "Columbus Day early close")))
            (:fx
              :early-closes (((2012 10 5) (15 15) "Columbus Day early close")))))
  (:title "CME Globex Veterans Day holiday schedule 2012"
   :year 2012 :holiday :veterans
   :uri "https://web.archive.org/web/20120107081712/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-veterans-day.pdf"
   :issued (2011 11 16) :issued-uri "https://web.archive.org/web/20120107081712/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-veterans-day.pdf"
   :published (2012 1 7) :published-uri "https://web.archive.org/web/20120107081712/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-veterans-day.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Thanksgiving holiday schedule 2012"
   :year 2012 :holiday :thanksgiving
   :uri "https://web.archive.org/web/20111125001004/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2012-thanksgiving.pdf"
   :issued (2011 11 21) :issued-uri "https://web.archive.org/web/20111125001004/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2012-thanksgiving.pdf"
   :published (2011 11 25) :published-uri "https://web.archive.org/web/20111125001004/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2012-thanksgiving.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2012 11 22) (10 30) "Thanksgiving halt, no settlement")
                ((2012 11 23) (12 15) "Thanksgiving early close")))
            (:interest-rate
              :early-closes (((2012 11 22) (12 0) "Thanksgiving halt, no settlement")
                ((2012 11 23) (12 15) "Thanksgiving early close")))
            (:fx
              :early-closes (((2012 11 22) (12 0) "Thanksgiving halt, no settlement")
                ((2012 11 23) (12 15) "Thanksgiving early close")))
            (:energy
              :early-closes (((2012 11 22) (12 15) "Thanksgiving halt, no settlement")
                ((2012 11 23) (12 45) "Thanksgiving early close")))
            (:metals
              :early-closes (((2012 11 22) (12 15) "Thanksgiving halt, no settlement")
                ((2012 11 23) (12 45) "Thanksgiving early close")))
            (:grains
              :early-closes (((2012 11 23) (12 0) "Thanksgiving early close")))))
  (:title "CME Globex Christmas holiday schedule 2012"
   :year 2012 :holiday :christmas
   :uri "https://web.archive.org/web/20120107060254/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-christmas.pdf"
   :issued (2011 11 28) :issued-uri "https://web.archive.org/web/20120107060254/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-christmas.pdf"
   :published (2012 1 7) :published-uri "https://web.archive.org/web/20120107060254/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-christmas.pdf"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2012 12 24) (12 15) "Christmas early close"))
              :sessions (((2012 12 26) ((:open (5 0) :close (15 15))) "Christmas: opens 05:00 CT, no overnight session")))
            (:interest-rate
              :early-closes (((2012 12 24) (12 15) "Christmas early close"))
              :sessions (((2012 12 26) ((:open (5 0) :close (16 0))) "Christmas: opens 05:00 CT, no overnight session")))
            (:fx
              :early-closes (((2012 12 24) (12 15) "Christmas early close"))
              :sessions (((2012 12 26) ((:open (5 0) :close (16 0))) "Christmas: opens 05:00 CT, no overnight session")))
            (:energy
              :early-closes (((2012 12 24) (12 45) "Christmas early close")))
            (:metals
              :early-closes (((2012 12 24) (12 45) "Christmas early close")))
            (:grains
              :early-closes (((2012 12 24) (12 0) "Christmas early close"))
              :sessions (((2012 12 26) ((:open (9 30) :close (14 0))) "Christmas: opens 09:30 CT, no overnight session")))))
  (:title "CME Globex New Year's holiday schedule 2013"
   :year 2013 :holiday :new-years
   :uri "https://web.archive.org/web/20130309115301/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-martin-luther-king.xls"
   :issued nil :issued-uri nil
   :published (2013 3 9) :published-uri "https://web.archive.org/web/20130309115301/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-martin-luther-king.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :sessions (((2013 1 2) ((:open (5 0) :close (16 15))) "New Year's: opens 05:00 CT, no overnight session")))
            (:interest-rate
              :sessions (((2013 1 2) ((:open (5 0) :close (16 0))) "New Year's: opens 05:00 CT, no overnight session")))
            (:fx
              :sessions (((2013 1 2) ((:open (5 0) :close (16 0))) "New Year's: opens 05:00 CT, no overnight session")))
            (:grains
              :sessions (((2013 1 2) ((:open (9 30) :close (14 0))) "New Year's: opens 09:30 CT, no overnight session")))))
  (:title "CME Globex Martin Luther King Jr. Day holiday schedule 2013"
   :year 2013 :holiday :mlk
   :uri "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip"
   :issued (2013 1 10) :issued-uri "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip"
   :published (2014 3 26) :published-uri "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2013-martin-luther-king.pdf in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2013 1 21) (10 30) "Martin Luther King Jr. Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2013 1 18) (15 15) "Martin Luther King Jr. Day early close")
                ((2013 1 21) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:fx
              :early-closes (((2013 1 18) (15 15) "Martin Luther King Jr. Day early close")
                ((2013 1 21) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:energy
              :early-closes (((2013 1 21) (12 15) "Martin Luther King Jr. Day halt, no settlement")))
            (:metals
              :early-closes (((2013 1 21) (12 15) "Martin Luther King Jr. Day halt, no settlement")))))
  (:title "CME Globex Presidents Day holiday schedule 2013"
   :year 2013 :holiday :presidents
   :uri "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip"
   :issued (2013 1 10) :issued-uri "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip"
   :published (2014 3 26) :published-uri "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2013-presidents-day.pdf in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2013 2 18) (10 30) "Presidents Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2013 2 15) (15 15) "Presidents Day early close")
                ((2013 2 18) (12 0) "Presidents Day halt, no settlement")))
            (:fx
              :early-closes (((2013 2 15) (15 15) "Presidents Day early close")
                ((2013 2 18) (12 0) "Presidents Day halt, no settlement")))
            (:energy
              :early-closes (((2013 2 18) (12 15) "Presidents Day halt, no settlement")))
            (:metals
              :early-closes (((2013 2 18) (12 15) "Presidents Day halt, no settlement")))))
  (:title "CME Globex Good Friday holiday schedule 2013"
   :year 2013 :holiday :good-friday
   :uri "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip"
   :issued (2013 3 14) :issued-uri "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip"
   :published (2014 3 26) :published-uri "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2013-good-friday.pdf in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Memorial Day holiday schedule 2013"
   :year 2013 :holiday :memorial
   :uri "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2014 3 26) :published-uri "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2013-memorial-day.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2013 5 27) (10 30) "Memorial Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2013 5 24) (15 15) "Memorial Day early close")
                ((2013 5 27) (12 0) "Memorial Day halt, no settlement")))
            (:fx
              :early-closes (((2013 5 24) (15 15) "Memorial Day early close")
                ((2013 5 27) (12 0) "Memorial Day halt, no settlement")))
            (:energy
              :early-closes (((2013 5 27) (12 15) "Memorial Day halt, no settlement")))
            (:metals
              :early-closes (((2013 5 27) (12 15) "Memorial Day halt, no settlement")))))
  (:title "CME Globex Independence Day holiday schedule 2013"
   :year 2013 :holiday :independence
   :uri "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2014 3 26) :published-uri "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2013-4th-july.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2013 7 3) (12 15) "Independence Day early close")
                ((2013 7 4) (10 30) "Independence Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2013 7 4) (12 0) "Independence Day halt, no settlement")))
            (:fx
              :early-closes (((2013 7 4) (12 0) "Independence Day halt, no settlement")))
            (:energy
              :early-closes (((2013 7 4) (12 15) "Independence Day halt, no settlement")))
            (:metals
              :early-closes (((2013 7 4) (12 15) "Independence Day halt, no settlement")))
            (:grains
              :early-closes (((2013 7 3) (12 0) "Independence Day early close"))
              :sessions (((2013 7 5) ((:open (8 30) :close (13 15))) "Independence Day: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Labor Day holiday schedule 2013"
   :year 2013 :holiday :labor
   :uri "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2014 3 26) :published-uri "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2013-labor-day.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2013 9 2) (10 30) "Labor Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2013 8 30) (15 15) "Labor Day early close")
                ((2013 9 2) (12 0) "Labor Day halt, no settlement")))
            (:fx
              :early-closes (((2013 8 30) (15 15) "Labor Day early close")
                ((2013 9 2) (12 0) "Labor Day halt, no settlement")))
            (:energy
              :early-closes (((2013 9 2) (12 15) "Labor Day halt, no settlement")))
            (:metals
              :early-closes (((2013 9 2) (12 15) "Labor Day halt, no settlement")))))
  (:title "CME Globex Thanksgiving holiday schedule 2013"
   :year 2013 :holiday :thanksgiving
   :uri "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2014 3 26) :published-uri "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2013-thanksgiving.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2013 11 28) (10 30) "Thanksgiving halt, no settlement")
                ((2013 11 29) (12 15) "Thanksgiving early close")))
            (:interest-rate
              :early-closes (((2013 11 28) (12 0) "Thanksgiving halt, no settlement")
                ((2013 11 29) (12 15) "Thanksgiving early close")))
            (:fx
              :early-closes (((2013 11 28) (12 0) "Thanksgiving halt, no settlement")
                ((2013 11 29) (12 15) "Thanksgiving early close")))
            (:energy
              :early-closes (((2013 11 28) (12 15) "Thanksgiving halt, no settlement")
                ((2013 11 29) (12 45) "Thanksgiving early close")))
            (:metals
              :early-closes (((2013 11 28) (12 15) "Thanksgiving halt, no settlement")
                ((2013 11 29) (12 45) "Thanksgiving early close")))
            (:grains
              :sessions (((2013 11 29) ((:open (8 30) :close (12 0))) "Thanksgiving: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Christmas holiday schedule 2013"
   :year 2013 :holiday :christmas
   :uri "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2014 3 26) :published-uri "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2013-christmas-new-year-holidays.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2013 12 24) (12 15) "Christmas early close"))
              :sessions (((2013 12 26) ((:open (5 0) :close (16 15))) "Christmas: opens 05:00 CT, no overnight session")
                ((2014 1 2) ((:open (5 0) :close (16 15))) "Christmas: opens 05:00 CT, no overnight session")))
            (:interest-rate
              :early-closes (((2013 12 24) (12 15) "Christmas early close"))
              :sessions (((2013 12 26) ((:open (5 0) :close (16 0))) "Christmas: opens 05:00 CT, no overnight session")
                ((2014 1 2) ((:open (5 0) :close (16 0))) "Christmas: opens 05:00 CT, no overnight session")))
            (:fx
              :early-closes (((2013 12 24) (12 15) "Christmas early close"))
              :sessions (((2013 12 26) ((:open (5 0) :close (16 0))) "Christmas: opens 05:00 CT, no overnight session")
                ((2014 1 2) ((:open (5 0) :close (16 0))) "Christmas: opens 05:00 CT, no overnight session")))
            (:energy
              :early-closes (((2013 12 24) (12 45) "Christmas early close")))
            (:metals
              :early-closes (((2013 12 24) (12 45) "Christmas early close")))
            (:grains
              :early-closes (((2013 12 24) (12 0) "Christmas early close"))
              :sessions (((2013 12 26) ((:open (8 30) :close (13 15))) "Christmas: opens 08:30 CT, no overnight session")
                ((2014 1 2) ((:open (8 30) :close (13 15))) "Christmas: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Martin Luther King Jr. Day holiday schedule 2014"
   :year 2014 :holiday :mlk
   :uri "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2015 3 26) :published-uri "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2014-martin-luther-king-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2014 1 20) (10 30) "Martin Luther King Jr. Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2014 1 17) (15 15) "Martin Luther King Jr. Day early close")
                ((2014 1 20) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:fx
              :early-closes (((2014 1 17) (15 15) "Martin Luther King Jr. Day early close")
                ((2014 1 20) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:energy
              :early-closes (((2014 1 20) (12 15) "Martin Luther King Jr. Day halt, no settlement")))
            (:metals
              :early-closes (((2014 1 20) (12 15) "Martin Luther King Jr. Day halt, no settlement")))))
  (:title "CME Globex Presidents Day holiday schedule 2014"
   :year 2014 :holiday :presidents
   :uri "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2015 3 26) :published-uri "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2014-presidents-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2014 2 17) (10 30) "Presidents Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2014 2 14) (15 15) "Presidents Day early close")
                ((2014 2 17) (12 0) "Presidents Day halt, no settlement")))
            (:fx
              :early-closes (((2014 2 14) (15 15) "Presidents Day early close")
                ((2014 2 17) (12 0) "Presidents Day halt, no settlement")))
            (:energy
              :early-closes (((2014 2 17) (12 15) "Presidents Day halt, no settlement")))
            (:metals
              :early-closes (((2014 2 17) (12 15) "Presidents Day halt, no settlement")))))
  (:title "CME Globex Good Friday holiday schedule 2014"
   :year 2014 :holiday :good-friday
   :uri "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2015 3 26) :published-uri "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2014-good-friday-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Memorial Day holiday schedule 2014"
   :year 2014 :holiday :memorial
   :uri "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2015 3 26) :published-uri "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2014-memorial-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2014 5 26) (12 0) "Memorial Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2014 5 23) (15 15) "Memorial Day early close")
                ((2014 5 26) (12 0) "Memorial Day halt, no settlement")))
            (:fx
              :early-closes (((2014 5 23) (15 15) "Memorial Day early close")
                ((2014 5 26) (12 0) "Memorial Day halt, no settlement")))
            (:energy
              :early-closes (((2014 5 26) (12 0) "Memorial Day halt, no settlement")))
            (:metals
              :early-closes (((2014 5 26) (12 0) "Memorial Day halt, no settlement")))))
  (:title "CME Globex Independence Day holiday schedule 2014"
   :year 2014 :holiday :independence
   :uri "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2015 3 26) :published-uri "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2014-4th-of-july-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2014 7 3) (12 15) "Independence Day early close")
                ((2014 7 4) (12 0) "Independence Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2014 7 4) (12 0) "Independence Day halt, no settlement")))
            (:fx
              :early-closes (((2014 7 4) (12 0) "Independence Day halt, no settlement")))
            (:energy
              :early-closes (((2014 7 4) (12 0) "Independence Day halt, no settlement")))
            (:metals
              :early-closes (((2014 7 4) (12 0) "Independence Day halt, no settlement")))
            (:grains
              :early-closes (((2014 7 3) (12 0) "Independence Day early close"))
              :sessions (((2014 7 7) ((:open (8 30) :close (13 15))) "Independence Day: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Labor Day holiday schedule 2014"
   :year 2014 :holiday :labor
   :uri "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2015 3 26) :published-uri "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2014-labor-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2014 9 1) (12 0) "Labor Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2014 8 29) (15 15) "Labor Day early close")
                ((2014 9 1) (12 0) "Labor Day halt, no settlement")))
            (:fx
              :early-closes (((2014 8 29) (15 15) "Labor Day early close")
                ((2014 9 1) (12 0) "Labor Day halt, no settlement")))
            (:energy
              :early-closes (((2014 9 1) (12 0) "Labor Day halt, no settlement")))
            (:metals
              :early-closes (((2014 9 1) (12 0) "Labor Day halt, no settlement")))))
  (:title "CME Globex Columbus Day holiday schedule 2014"
   :year 2014 :holiday :columbus
   :uri "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2015 3 26) :published-uri "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2014-columbus-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Veterans Day holiday schedule 2014"
   :year 2014 :holiday :veterans
   :uri "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2015 3 26) :published-uri "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2014-veterans-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Thanksgiving holiday schedule 2014"
   :year 2014 :holiday :thanksgiving
   :uri "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2015 3 26) :published-uri "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2014-thanksgiving-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2014 11 27) (12 0) "Thanksgiving halt, no settlement")
                ((2014 11 28) (12 15) "Thanksgiving early close")))
            (:interest-rate
              :early-closes (((2014 11 27) (12 0) "Thanksgiving halt, no settlement")
                ((2014 11 28) (12 15) "Thanksgiving early close")))
            (:fx
              :early-closes (((2014 11 27) (12 0) "Thanksgiving halt, no settlement")
                ((2014 11 28) (12 15) "Thanksgiving early close")))
            (:energy
              :early-closes (((2014 11 27) (12 0) "Thanksgiving halt, no settlement")
                ((2014 11 28) (12 45) "Thanksgiving early close")))
            (:metals
              :early-closes (((2014 11 27) (12 0) "Thanksgiving halt, no settlement")
                ((2014 11 28) (12 45) "Thanksgiving early close")))
            (:grains
              :sessions (((2014 11 28) ((:open (8 30) :close (12 0))) "Thanksgiving: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Christmas holiday schedule 2014"
   :year 2014 :holiday :christmas
   :uri "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2015 3 26) :published-uri "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2014-christmas-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2014 12 24) (12 15) "Christmas early close")))
            (:interest-rate
              :early-closes (((2014 12 24) (12 15) "Christmas early close")))
            (:fx
              :early-closes (((2014 12 24) (12 15) "Christmas early close")))
            (:energy
              :early-closes (((2014 12 24) (12 45) "Christmas early close")))
            (:metals
              :early-closes (((2014 12 24) (12 45) "Christmas early close")))
            (:grains
              :early-closes (((2014 12 24) (12 0) "Christmas early close"))
              :sessions (((2014 12 26) ((:open (8 30) :close (13 15))) "Christmas: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex New Year's holiday schedule 2015"
   :year 2015 :holiday :new-years
   :uri "https://web.archive.org/web/20140326160333/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-new-years-holiday-schedule.xls"
   :issued (2014 2 26) :issued-uri "https://web.archive.org/web/20140326160333/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-new-years-holiday-schedule.xls"
   :published (2014 3 26) :published-uri "https://web.archive.org/web/20140326160333/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-new-years-holiday-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:grains
              :sessions (((2015 1 2) ((:open (8 30) :close (13 15))) "New Year's: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Martin Luther King Jr. Day holiday schedule 2015"
   :year 2015 :holiday :mlk
   :uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :issued (2015 1 7) :issued-uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :published (2016 8 8) :published-uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2015-martin-luther-king-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2015 1 19) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2015 1 16) (15 15) "Martin Luther King Jr. Day early close")
                ((2015 1 19) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:fx
              :early-closes (((2015 1 16) (15 15) "Martin Luther King Jr. Day early close")
                ((2015 1 19) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:energy
              :early-closes (((2015 1 19) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:metals
              :early-closes (((2015 1 19) (12 0) "Martin Luther King Jr. Day halt, no settlement")))))
  (:title "CME Globex Presidents Day holiday schedule 2015"
   :year 2015 :holiday :presidents
   :uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :issued (2015 1 7) :issued-uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :published (2016 8 8) :published-uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2015-presidents-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2015 2 16) (12 0) "Presidents Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2015 2 13) (15 15) "Presidents Day early close")
                ((2015 2 16) (12 0) "Presidents Day halt, no settlement")))
            (:fx
              :early-closes (((2015 2 13) (15 15) "Presidents Day early close")
                ((2015 2 16) (12 0) "Presidents Day halt, no settlement")))
            (:energy
              :early-closes (((2015 2 16) (12 0) "Presidents Day halt, no settlement")))
            (:metals
              :early-closes (((2015 2 16) (12 0) "Presidents Day halt, no settlement")))))
  (:title "CME Globex Good Friday holiday schedule 2015"
   :year 2015 :holiday :good-friday
   :uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :issued (2015 3 31) :issued-uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :published (2016 8 8) :published-uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2015-good-friday-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :open (((2015 4 3) "Good Friday: Good Friday trading: 17:00 Thu open for trade date Friday April 3; 'Early CME Globex close for trade date Friday April 3' 08:15"))
              :early-closes (((2015 4 3) (8 15) "Good Friday early close")))
            (:interest-rate
              :open (((2015 4 3) "Good Friday: Good Friday trading: 17:00 Thu open for trade date Friday April 3; 'Early CME Globex close for trade date Friday April 3' 10:15"))
              :early-closes (((2015 4 3) (10 15) "Good Friday early close")))
            (:fx
              :open (((2015 4 3) "Good Friday: Good Friday trading: 17:00 Thu open for trade date Friday April 3; 'Early CME Globex close for trade date Friday April 3' 10:15"))
              :early-closes (((2015 4 3) (10 15) "Good Friday early close")))))
  (:title "CME Globex Memorial Day holiday schedule 2015"
   :year 2015 :holiday :memorial
   :uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :issued (2014 11 13) :issued-uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :published (2016 8 8) :published-uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2015-memorial-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2015 5 25) (12 0) "Memorial Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2015 5 22) (15 15) "Memorial Day early close")
                ((2015 5 25) (12 0) "Memorial Day halt, no settlement")))
            (:fx
              :early-closes (((2015 5 22) (15 15) "Memorial Day early close")
                ((2015 5 25) (12 0) "Memorial Day halt, no settlement")))
            (:energy
              :early-closes (((2015 5 25) (12 0) "Memorial Day halt, no settlement")))
            (:metals
              :early-closes (((2015 5 25) (12 0) "Memorial Day halt, no settlement")))))
  (:title "CME Globex Independence Day holiday schedule 2015"
   :year 2015 :holiday :independence
   :uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :issued (2015 6 1) :issued-uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :published (2016 8 8) :published-uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2015-4th-of-july-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2015 7 3) (12 0) "Independence Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2015 7 3) (12 0) "Independence Day halt, no settlement")))
            (:fx
              :early-closes (((2015 7 3) (12 0) "Independence Day halt, no settlement")))
            (:energy
              :early-closes (((2015 7 3) (12 0) "Independence Day halt, no settlement")))
            (:metals
              :early-closes (((2015 7 3) (12 0) "Independence Day halt, no settlement")))
            (:grains
              :early-closes (((2015 7 2) (12 0) "Independence Day early close")))))
  (:title "CME Globex Labor Day holiday schedule 2015"
   :year 2015 :holiday :labor
   :uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :issued (2015 7 20) :issued-uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :published (2016 8 8) :published-uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2015-labor-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2015 9 7) (12 0) "Labor Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2015 9 7) (12 0) "Labor Day halt, no settlement")))
            (:fx
              :early-closes (((2015 9 7) (12 0) "Labor Day halt, no settlement")))
            (:energy
              :early-closes (((2015 9 7) (12 0) "Labor Day halt, no settlement")))
            (:metals
              :early-closes (((2015 9 7) (12 0) "Labor Day halt, no settlement")))))
  (:title "CME Globex Columbus Day holiday schedule 2015"
   :year 2015 :holiday :columbus
   :uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2016 8 8) :published-uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2015-columbus-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Veterans Day holiday schedule 2015"
   :year 2015 :holiday :veterans
   :uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2016 8 8) :published-uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2015-veterans-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Thanksgiving holiday schedule 2015"
   :year 2015 :holiday :thanksgiving
   :uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :issued (2015 10 27) :issued-uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :published (2016 8 8) :published-uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2015-thanksgiving-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2015 11 26) (12 0) "Thanksgiving halt, no settlement")
                ((2015 11 27) (12 15) "Thanksgiving early close")))
            (:interest-rate
              :early-closes (((2015 11 26) (12 0) "Thanksgiving halt, no settlement")
                ((2015 11 27) (12 15) "Thanksgiving early close")))
            (:fx
              :early-closes (((2015 11 26) (12 0) "Thanksgiving halt, no settlement")
                ((2015 11 27) (12 15) "Thanksgiving early close")))
            (:energy
              :early-closes (((2015 11 26) (12 0) "Thanksgiving halt, no settlement")
                ((2015 11 27) (12 45) "Thanksgiving early close")))
            (:metals
              :early-closes (((2015 11 26) (12 0) "Thanksgiving halt, no settlement")
                ((2015 11 27) (12 45) "Thanksgiving early close")))
            (:grains
              :sessions (((2015 11 27) ((:open (8 30) :close (12 5))) "Thanksgiving: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Christmas holiday schedule 2015"
   :year 2015 :holiday :christmas
   :uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :issued (2015 10 27) :issued-uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :published (2016 8 8) :published-uri "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2015-christmas-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2015 12 24) (12 15) "Christmas early close")))
            (:interest-rate
              :early-closes (((2015 12 24) (12 15) "Christmas early close")))
            (:fx
              :early-closes (((2015 12 24) (12 15) "Christmas early close")))
            (:energy
              :early-closes (((2015 12 24) (12 45) "Christmas early close")))
            (:metals
              :early-closes (((2015 12 24) (12 45) "Christmas early close")))
            (:grains
              :early-closes (((2015 12 24) (12 5) "Christmas early close")))))
  (:title "CME Globex New Year's holiday schedule 2016"
   :year 2016 :holiday :new-years
   :uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :issued (2015 12 16) :issued-uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :published (2017 6 28) :published-uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2016-new-years-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Martin Luther King Jr. Day holiday schedule 2016"
   :year 2016 :holiday :mlk
   :uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :issued (2016 1 4) :issued-uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :published (2017 6 28) :published-uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2016-martin-luther-king-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2016 1 18) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2016 1 18) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:fx
              :early-closes (((2016 1 18) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:energy
              :early-closes (((2016 1 18) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:metals
              :early-closes (((2016 1 18) (12 0) "Martin Luther King Jr. Day halt, no settlement")))))
  (:title "CME Globex Presidents Day holiday schedule 2016"
   :year 2016 :holiday :presidents
   :uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :issued (2015 10 28) :issued-uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :published (2017 6 28) :published-uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2016-presidents-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2016 2 15) (12 0) "Presidents Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2016 2 15) (12 0) "Presidents Day halt, no settlement")))
            (:fx
              :early-closes (((2016 2 15) (12 0) "Presidents Day halt, no settlement")))
            (:energy
              :early-closes (((2016 2 15) (12 0) "Presidents Day halt, no settlement")))
            (:metals
              :early-closes (((2016 2 15) (12 0) "Presidents Day halt, no settlement")))))
  (:title "CME Globex Good Friday holiday schedule 2016"
   :year 2016 :holiday :good-friday
   :uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :issued (2016 2 16) :issued-uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :published (2017 6 28) :published-uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2016-good-friday-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Memorial Day holiday schedule 2016"
   :year 2016 :holiday :memorial
   :uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :issued (2016 5 19) :issued-uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :published (2017 6 28) :published-uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2016-memorial-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2016 5 30) (12 0) "Memorial Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2016 5 30) (12 0) "Memorial Day halt, no settlement")))
            (:fx
              :early-closes (((2016 5 30) (12 0) "Memorial Day halt, no settlement")))
            (:energy
              :early-closes (((2016 5 30) (12 0) "Memorial Day halt, no settlement")))
            (:metals
              :early-closes (((2016 5 30) (12 0) "Memorial Day halt, no settlement")))))
  (:title "CME Globex Independence Day holiday schedule 2016"
   :year 2016 :holiday :independence
   :uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :issued (2016 5 24) :issued-uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :published (2017 6 28) :published-uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2016-4th-of-july-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2016 7 4) (12 0) "Independence Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2016 7 4) (12 0) "Independence Day halt, no settlement")))
            (:fx
              :early-closes (((2016 7 4) (12 0) "Independence Day halt, no settlement")))
            (:energy
              :early-closes (((2016 7 4) (12 0) "Independence Day halt, no settlement")))
            (:metals
              :early-closes (((2016 7 4) (12 0) "Independence Day halt, no settlement")))
            (:grains
              :sessions (((2016 7 5) ((:open (8 30) :close (13 20))) "Independence Day: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Labor Day holiday schedule 2016"
   :year 2016 :holiday :labor
   :uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :issued (2016 2 16) :issued-uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :published (2017 6 28) :published-uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2016-labor-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2016 9 5) (12 0) "Labor Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2016 9 5) (12 0) "Labor Day halt, no settlement")))
            (:fx
              :early-closes (((2016 9 5) (12 0) "Labor Day halt, no settlement")))
            (:energy
              :early-closes (((2016 9 5) (12 0) "Labor Day halt, no settlement")))
            (:metals
              :early-closes (((2016 9 5) (12 0) "Labor Day halt, no settlement")))))
  (:title "CME Globex Columbus Day holiday schedule 2016"
   :year 2016 :holiday :columbus
   :uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2017 6 28) :published-uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2016-columbus-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Veterans Day holiday schedule 2016"
   :year 2016 :holiday :veterans
   :uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2017 6 28) :published-uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2016-veterans-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Thanksgiving holiday schedule 2016"
   :year 2016 :holiday :thanksgiving
   :uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :issued (2016 11 8) :issued-uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :published (2017 6 28) :published-uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2016-thanksgiving-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2016 11 24) (12 0) "Thanksgiving halt, no settlement")
                ((2016 11 25) (12 15) "Thanksgiving early close")))
            (:interest-rate
              :early-closes (((2016 11 24) (12 0) "Thanksgiving halt, no settlement")
                ((2016 11 25) (12 15) "Thanksgiving early close")))
            (:fx
              :early-closes (((2016 11 24) (12 0) "Thanksgiving halt, no settlement")
                ((2016 11 25) (12 15) "Thanksgiving early close")))
            (:energy
              :early-closes (((2016 11 24) (12 0) "Thanksgiving halt, no settlement")
                ((2016 11 25) (12 45) "Thanksgiving early close")))
            (:metals
              :early-closes (((2016 11 24) (12 0) "Thanksgiving halt, no settlement")
                ((2016 11 25) (12 45) "Thanksgiving early close")))
            (:grains
              :sessions (((2016 11 25) ((:open (8 30) :close (12 5))) "Thanksgiving: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Christmas holiday schedule 2016"
   :year 2016 :holiday :christmas
   :uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :issued (2016 10 27) :issued-uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :published (2017 6 28) :published-uri "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2016-christmas-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:grains
              :early-closes (((2016 12 23) (12 5) "Christmas early close")))))
  (:title "CME Globex New Year's holiday schedule 2017"
   :year 2017 :holiday :new-years
   :uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :issued (2016 2 16) :issued-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published (2021 1 26) :published-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2017-new-years-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Martin Luther King Jr. Day holiday schedule 2017"
   :year 2017 :holiday :mlk
   :uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :issued (2017 1 3) :issued-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published (2021 1 26) :published-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2017-martin-luther-king-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2017 1 16) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2017 1 16) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:fx
              :early-closes (((2017 1 16) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:energy
              :early-closes (((2017 1 16) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:metals
              :early-closes (((2017 1 16) (12 0) "Martin Luther King Jr. Day halt, no settlement")))))
  (:title "CME Globex Presidents Day holiday schedule 2017"
   :year 2017 :holiday :presidents
   :uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :issued (2017 2 1) :issued-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published (2021 1 26) :published-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2017-presidents-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2017 2 20) (12 0) "Presidents Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2017 2 20) (12 0) "Presidents Day halt, no settlement")))
            (:fx
              :early-closes (((2017 2 20) (12 0) "Presidents Day halt, no settlement")))
            (:energy
              :early-closes (((2017 2 20) (12 0) "Presidents Day halt, no settlement")))
            (:metals
              :early-closes (((2017 2 20) (12 0) "Presidents Day halt, no settlement")))))
  (:title "CME Globex Good Friday holiday schedule 2017"
   :year 2017 :holiday :good-friday
   :uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :issued (2017 3 22) :issued-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published (2021 1 26) :published-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2017-good-friday-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Memorial Day holiday schedule 2017"
   :year 2017 :holiday :memorial
   :uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :issued (2017 5 16) :issued-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published (2021 1 26) :published-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2017-memorial-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2017 5 29) (12 0) "Memorial Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2017 5 29) (12 0) "Memorial Day halt, no settlement")))
            (:fx
              :early-closes (((2017 5 29) (12 0) "Memorial Day halt, no settlement")))
            (:energy
              :early-closes (((2017 5 29) (12 0) "Memorial Day halt, no settlement")))
            (:metals
              :early-closes (((2017 5 29) (12 0) "Memorial Day halt, no settlement")))))
  (:title "CME Globex Independence Day holiday schedule 2017"
   :year 2017 :holiday :independence
   :uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :issued (2017 6 1) :issued-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published (2021 1 26) :published-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2017-4th-of-july-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2017 7 3) (12 15) "Independence Day early close")
                ((2017 7 4) (12 0) "Independence Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2017 7 4) (12 0) "Independence Day halt, no settlement")))
            (:fx
              :early-closes (((2017 7 4) (12 0) "Independence Day halt, no settlement")))
            (:energy
              :early-closes (((2017 7 4) (12 0) "Independence Day halt, no settlement")))
            (:metals
              :early-closes (((2017 7 4) (12 0) "Independence Day halt, no settlement")))
            (:grains
              :early-closes (((2017 7 3) (12 5) "Independence Day early close"))
              :sessions (((2017 7 5) ((:open (8 30) :close (13 20))) "Independence Day: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Labor Day holiday schedule 2017"
   :year 2017 :holiday :labor
   :uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :issued (2017 8 30) :issued-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published (2021 1 26) :published-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2017-labor-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2017 9 4) (12 0) "Labor Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2017 9 4) (12 0) "Labor Day halt, no settlement")))
            (:fx
              :early-closes (((2017 9 4) (12 0) "Labor Day halt, no settlement")))
            (:energy
              :early-closes (((2017 9 4) (12 0) "Labor Day halt, no settlement")))
            (:metals
              :early-closes (((2017 9 4) (12 0) "Labor Day halt, no settlement")))))
  (:title "CME Globex Columbus Day holiday schedule 2017"
   :year 2017 :holiday :columbus
   :uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2021 1 26) :published-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2017-columbus-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Veterans Day holiday schedule 2017"
   :year 2017 :holiday :veterans
   :uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2021 1 26) :published-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2017-veterans-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Thanksgiving holiday schedule 2017"
   :year 2017 :holiday :thanksgiving
   :uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :issued (2017 10 31) :issued-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published (2021 1 26) :published-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2017-thanksgiving-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2017 11 23) (12 0) "Thanksgiving halt, no settlement")
                ((2017 11 24) (12 15) "Thanksgiving early close")))
            (:interest-rate
              :early-closes (((2017 11 23) (12 0) "Thanksgiving halt, no settlement")
                ((2017 11 24) (12 15) "Thanksgiving early close")))
            (:fx
              :early-closes (((2017 11 23) (12 0) "Thanksgiving halt, no settlement")
                ((2017 11 24) (12 15) "Thanksgiving early close")))
            (:energy
              :early-closes (((2017 11 23) (12 0) "Thanksgiving halt, no settlement")
                ((2017 11 24) (12 45) "Thanksgiving early close")))
            (:metals
              :early-closes (((2017 11 23) (12 0) "Thanksgiving halt, no settlement")
                ((2017 11 24) (12 45) "Thanksgiving early close")))
            (:grains
              :sessions (((2017 11 24) ((:open (8 30) :close (12 5))) "Thanksgiving: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Christmas holiday schedule 2017"
   :year 2017 :holiday :christmas
   :uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :issued (2017 12 5) :issued-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published (2021 1 26) :published-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2017-christmas-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:grains
              :early-closes (((2017 12 22) (12 5) "Christmas early close"))
              :sessions (((2017 12 26) ((:open (8 30) :close (13 20))) "Christmas: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex New Year's holiday schedule 2018"
   :year 2018 :holiday :new-years
   :uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :issued (2017 12 5) :issued-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published (2021 1 26) :published-uri "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2018-new-years-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:grains
              :sessions (((2018 1 2) ((:open (8 30) :close (13 20))) "New Year's: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Martin Luther King Jr. Day holiday schedule 2018"
   :year 2018 :holiday :mlk
   :uri "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2026 8 30) :published-uri "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2018-martin-luther-king-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2018 1 15) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2018 1 15) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:fx
              :early-closes (((2018 1 15) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:energy
              :early-closes (((2018 1 15) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:metals
              :early-closes (((2018 1 15) (12 0) "Martin Luther King Jr. Day halt, no settlement")))))
  (:title "CME Globex Presidents Day holiday schedule 2018"
   :year 2018 :holiday :presidents
   :uri "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2026 8 30) :published-uri "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2018-presidents-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2018 2 19) (12 0) "Presidents Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2018 2 19) (12 0) "Presidents Day halt, no settlement")))
            (:fx
              :early-closes (((2018 2 19) (12 0) "Presidents Day halt, no settlement")))
            (:energy
              :early-closes (((2018 2 19) (12 0) "Presidents Day halt, no settlement")))
            (:metals
              :early-closes (((2018 2 19) (12 0) "Presidents Day halt, no settlement")))))
  (:title "CME Globex Good Friday holiday schedule 2018"
   :year 2018 :holiday :good-friday
   :uri "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2026 8 30) :published-uri "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2018-good-friday-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Memorial Day holiday schedule 2018"
   :year 2018 :holiday :memorial
   :uri "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2026 8 30) :published-uri "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2018-memorial-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2018 5 28) (12 0) "Memorial Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2018 5 28) (12 0) "Memorial Day halt, no settlement")))
            (:fx
              :early-closes (((2018 5 28) (12 0) "Memorial Day halt, no settlement")))
            (:energy
              :early-closes (((2018 5 28) (12 0) "Memorial Day halt, no settlement")))
            (:metals
              :early-closes (((2018 5 28) (12 0) "Memorial Day halt, no settlement")))))
  (:title "CME Globex Independence Day holiday schedule 2018"
   :year 2018 :holiday :independence
   :uri "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2026 8 30) :published-uri "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2018-4th-of-july-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2018 7 3) (12 15) "Independence Day early close")
                ((2018 7 4) (12 0) "Independence Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2018 7 4) (12 0) "Independence Day halt, no settlement")))
            (:fx
              :early-closes (((2018 7 4) (12 0) "Independence Day halt, no settlement")))
            (:energy
              :early-closes (((2018 7 4) (12 0) "Independence Day halt, no settlement")))
            (:metals
              :early-closes (((2018 7 4) (12 0) "Independence Day halt, no settlement")))
            (:grains
              :early-closes (((2018 7 3) (12 5) "Independence Day early close"))
              :sessions (((2018 7 5) ((:open (8 30) :close (13 20))) "Independence Day: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Labor Day holiday schedule 2018"
   :year 2018 :holiday :labor
   :uri "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2026 8 30) :published-uri "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2018-labor-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2018 9 3) (12 0) "Labor Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2018 9 3) (12 0) "Labor Day halt, no settlement")))
            (:fx
              :early-closes (((2018 9 3) (12 0) "Labor Day halt, no settlement")))
            (:energy
              :early-closes (((2018 9 3) (12 0) "Labor Day halt, no settlement")))
            (:metals
              :early-closes (((2018 9 3) (12 0) "Labor Day halt, no settlement")))))
  (:title "CME Globex Thanksgiving holiday schedule 2018"
   :year 2018 :holiday :thanksgiving
   :uri "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2026 8 30) :published-uri "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2018-thanksgiving-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2018 11 22) (12 0) "Thanksgiving halt, no settlement")
                ((2018 11 23) (12 15) "Thanksgiving early close")))
            (:interest-rate
              :early-closes (((2018 11 22) (12 0) "Thanksgiving halt, no settlement")
                ((2018 11 23) (12 15) "Thanksgiving early close")))
            (:fx
              :early-closes (((2018 11 22) (12 0) "Thanksgiving halt, no settlement")
                ((2018 11 23) (12 15) "Thanksgiving early close")))
            (:energy
              :early-closes (((2018 11 22) (12 0) "Thanksgiving halt, no settlement")
                ((2018 11 23) (12 45) "Thanksgiving early close")))
            (:metals
              :early-closes (((2018 11 22) (12 0) "Thanksgiving halt, no settlement")
                ((2018 11 23) (12 45) "Thanksgiving early close")))
            (:grains
              :sessions (((2018 11 23) ((:open (8 30) :close (12 5))) "Thanksgiving: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Christmas holiday schedule 2018"
   :year 2018 :holiday :christmas
   :uri "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2026 8 30) :published-uri "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2018-christmas-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2018 12 24) (12 15) "Christmas early close")))
            (:interest-rate
              :early-closes (((2018 12 24) (12 15) "Christmas early close")))
            (:fx
              :early-closes (((2018 12 24) (12 15) "Christmas early close")))
            (:energy
              :early-closes (((2018 12 24) (12 45) "Christmas early close")))
            (:metals
              :early-closes (((2018 12 24) (12 45) "Christmas early close")))
            (:grains
              :early-closes (((2018 12 24) (12 5) "Christmas early close"))
              :sessions (((2018 12 26) ((:open (8 30) :close (13 20))) "Christmas: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex New Year's holiday schedule 2019"
   :year 2019 :holiday :new-years
   :uri "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2026 8 30) :published-uri "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2019-new-years-holiday-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:grains
              :sessions (((2019 1 2) ((:open (8 30) :close (13 20))) "New Year's: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Martin Luther King Jr. Day holiday schedule 2019"
   :year 2019 :holiday :mlk
   :uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2021 1 26) :published-uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2019-mlk-day-schedule.xls in CME's yearly holiday-calendars zip. The schedule prints no update date; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2019 1 21) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2019 1 21) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:fx
              :early-closes (((2019 1 21) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:energy
              :early-closes (((2019 1 21) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:metals
              :early-closes (((2019 1 21) (12 0) "Martin Luther King Jr. Day halt, no settlement")))))
  (:title "CME Globex Presidents Day holiday schedule 2019"
   :year 2019 :holiday :presidents
   :uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :issued (2019 2 11) :issued-uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :published (2021 1 26) :published-uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2019-presidents-day-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2019 2 18) (12 0) "Presidents Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2019 2 18) (12 0) "Presidents Day halt, no settlement")))
            (:fx
              :early-closes (((2019 2 18) (12 0) "Presidents Day halt, no settlement")))
            (:energy
              :early-closes (((2019 2 18) (12 0) "Presidents Day halt, no settlement")))
            (:metals
              :early-closes (((2019 2 18) (12 0) "Presidents Day halt, no settlement")))))
  (:title "CME Globex Good Friday holiday schedule 2019"
   :year 2019 :holiday :good-friday
   :uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :issued (2019 3 15) :issued-uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :published (2021 1 26) :published-uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2019-good-friday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Memorial Day holiday schedule 2019"
   :year 2019 :holiday :memorial
   :uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :issued (2019 4 29) :issued-uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :published (2021 1 26) :published-uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2019-memorial-day-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2019 5 27) (12 0) "Memorial Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2019 5 27) (12 0) "Memorial Day halt, no settlement")))
            (:fx
              :early-closes (((2019 5 27) (12 0) "Memorial Day halt, no settlement")))
            (:energy
              :early-closes (((2019 5 27) (12 0) "Memorial Day halt, no settlement")))
            (:metals
              :early-closes (((2019 5 27) (12 0) "Memorial Day halt, no settlement")))))
  (:title "CME Globex Independence Day holiday schedule 2019"
   :year 2019 :holiday :independence
   :uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :issued (2019 6 6) :issued-uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :published (2021 1 26) :published-uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2019-independence-day-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2019 7 3) (12 15) "Independence Day early close")
                ((2019 7 4) (12 0) "Independence Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2019 7 4) (12 0) "Independence Day halt, no settlement")))
            (:fx
              :early-closes (((2019 7 4) (12 0) "Independence Day halt, no settlement")))
            (:energy
              :early-closes (((2019 7 4) (12 0) "Independence Day halt, no settlement")))
            (:metals
              :early-closes (((2019 7 4) (12 0) "Independence Day halt, no settlement")))
            (:grains
              :early-closes (((2019 7 3) (12 5) "Independence Day early close"))
              :sessions (((2019 7 5) ((:open (8 30) :close (13 20))) "Independence Day: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Labor Day holiday schedule 2019"
   :year 2019 :holiday :labor
   :uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :issued (2019 8 14) :issued-uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :published (2021 1 26) :published-uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2019-labor-day-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2019 9 2) (12 0) "Labor Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2019 9 2) (12 0) "Labor Day halt, no settlement")))
            (:fx
              :early-closes (((2019 9 2) (12 0) "Labor Day halt, no settlement")))
            (:energy
              :early-closes (((2019 9 2) (12 0) "Labor Day halt, no settlement")))
            (:metals
              :early-closes (((2019 9 2) (12 0) "Labor Day halt, no settlement")))))
  (:title "CME Globex Thanksgiving holiday schedule 2019"
   :year 2019 :holiday :thanksgiving
   :uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :issued (2019 10 7) :issued-uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :published (2021 1 26) :published-uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2019-thanksgiving-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2019 11 28) (12 0) "Thanksgiving halt, no settlement")
                ((2019 11 29) (12 15) "Thanksgiving early close")))
            (:interest-rate
              :early-closes (((2019 11 28) (12 0) "Thanksgiving halt, no settlement")
                ((2019 11 29) (12 15) "Thanksgiving early close")))
            (:fx
              :early-closes (((2019 11 28) (12 0) "Thanksgiving halt, no settlement")
                ((2019 11 29) (12 15) "Thanksgiving early close")))
            (:energy
              :early-closes (((2019 11 28) (12 0) "Thanksgiving halt, no settlement")
                ((2019 11 29) (12 45) "Thanksgiving early close")))
            (:metals
              :early-closes (((2019 11 28) (12 0) "Thanksgiving halt, no settlement")
                ((2019 11 29) (12 45) "Thanksgiving early close")))
            (:grains
              :sessions (((2019 11 29) ((:open (8 30) :close (12 5))) "Thanksgiving: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Christmas holiday schedule 2019"
   :year 2019 :holiday :christmas
   :uri "https://web.archive.org/web/20201111233949/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-christmas-holiday-schedule.xls"
   :issued (2019 12 13) :issued-uri "https://web.archive.org/web/20201111233949/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-christmas-holiday-schedule.xls"
   :published (2020 11 11) :published-uri "https://web.archive.org/web/20201111233949/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-christmas-holiday-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2019 12 24) (12 15) "Christmas early close")))
            (:interest-rate
              :early-closes (((2019 12 24) (12 15) "Christmas early close")))
            (:fx
              :early-closes (((2019 12 24) (12 15) "Christmas early close")))
            (:energy
              :early-closes (((2019 12 24) (12 45) "Christmas early close")))
            (:metals
              :early-closes (((2019 12 24) (12 45) "Christmas early close")))
            (:grains
              :early-closes (((2019 12 24) (12 5) "Christmas early close"))
              :sessions (((2019 12 26) ((:open (8 30) :close (13 20))) "Christmas: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex New Year's holiday schedule 2020"
   :year 2020 :holiday :new-years
   :uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :issued (2019 10 1) :issued-uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :published (2021 1 26) :published-uri "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2019-2020-new-years-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:grains
              :sessions (((2020 1 2) ((:open (8 30) :close (13 20))) "New Year's: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Martin Luther King Jr. Day holiday schedule 2020"
   :year 2020 :holiday :mlk
   :uri "https://web.archive.org/web/20260815194202/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-mlk-day-schedule.xls"
   :issued nil :issued-uri nil
   :published (2026 8 15) :published-uri "https://web.archive.org/web/20260815194202/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-mlk-day-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "This copy is a later re-export (printed date 2020-04-06, after the holiday), so the issue date is unknown; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2020 1 20) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2020 1 20) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:fx
              :early-closes (((2020 1 20) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:energy
              :early-closes (((2020 1 20) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:metals
              :early-closes (((2020 1 20) (12 0) "Martin Luther King Jr. Day halt, no settlement")))))
  (:title "CME Globex Presidents Day holiday schedule 2020"
   :year 2020 :holiday :presidents
   :uri "https://web.archive.org/web/20260730111834/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-holiday-calendars.zip"
   :issued nil :issued-uri nil
   :published (2026 7 30) :published-uri "https://web.archive.org/web/20260730111834/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2020-presidents-day-schedule.xls in CME's yearly holiday-calendars zip. This copy is a later re-export (printed date 2020-04-06, after the holiday), so the issue date is unknown; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2020 2 17) (12 0) "Presidents Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2020 2 17) (12 0) "Presidents Day halt, no settlement")))
            (:fx
              :early-closes (((2020 2 17) (12 0) "Presidents Day halt, no settlement")))
            (:energy
              :early-closes (((2020 2 17) (12 0) "Presidents Day halt, no settlement")))
            (:metals
              :early-closes (((2020 2 17) (12 0) "Presidents Day halt, no settlement")))))
  (:title "CME Globex Good Friday holiday schedule 2020"
   :year 2020 :holiday :good-friday
   :uri "https://web.archive.org/web/20241202115016/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-good-friday-schedule.xls"
   :issued (2020 4 6) :issued-uri "https://web.archive.org/web/20241202115016/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-good-friday-schedule.xls"
   :published (2024 12 2) :published-uri "https://web.archive.org/web/20241202115016/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-good-friday-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Memorial Day holiday schedule 2020"
   :year 2020 :holiday :memorial
   :uri "https://web.archive.org/web/20221226124229/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-memorial-day-schedule.xls"
   :issued (2020 4 21) :issued-uri "https://web.archive.org/web/20221226124229/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-memorial-day-schedule.xls"
   :published (2022 12 26) :published-uri "https://web.archive.org/web/20221226124229/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-memorial-day-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2020 5 25) (12 0) "Memorial Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2020 5 25) (12 0) "Memorial Day halt, no settlement")))
            (:fx
              :early-closes (((2020 5 25) (12 0) "Memorial Day halt, no settlement")))
            (:energy
              :early-closes (((2020 5 25) (12 0) "Memorial Day halt, no settlement")))
            (:metals
              :early-closes (((2020 5 25) (12 0) "Memorial Day halt, no settlement")))))
  (:title "CME Globex Independence Day holiday schedule 2020"
   :year 2020 :holiday :independence
   :uri "https://web.archive.org/web/20220707015539/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-independence-day-schedule.xls"
   :issued (2020 6 26) :issued-uri "https://web.archive.org/web/20220707015539/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-independence-day-schedule.xls"
   :published (2022 7 7) :published-uri "https://web.archive.org/web/20220707015539/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-independence-day-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2020 7 3) (12 0) "Independence Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2020 7 3) (12 0) "Independence Day halt, no settlement")))
            (:fx
              :early-closes (((2020 7 3) (12 0) "Independence Day halt, no settlement")))
            (:energy
              :early-closes (((2020 7 3) (12 0) "Independence Day halt, no settlement")))
            (:metals
              :early-closes (((2020 7 3) (12 0) "Independence Day halt, no settlement")))
            (:grains
              :early-closes (((2020 7 2) (12 5) "Independence Day early close")))))
  (:title "CME Globex Labor Day holiday schedule 2020"
   :year 2020 :holiday :labor
   :uri "https://web.archive.org/web/20210126094838/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-labor-day-schedule.xls"
   :issued (2020 8 28) :issued-uri "https://web.archive.org/web/20210126094838/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-labor-day-schedule.xls"
   :published (2021 1 26) :published-uri "https://web.archive.org/web/20210126094838/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-labor-day-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2020 9 7) (12 0) "Labor Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2020 9 7) (12 0) "Labor Day halt, no settlement")))
            (:fx
              :early-closes (((2020 9 7) (12 0) "Labor Day halt, no settlement")))
            (:energy
              :early-closes (((2020 9 7) (12 0) "Labor Day halt, no settlement")))
            (:metals
              :early-closes (((2020 9 7) (12 0) "Labor Day halt, no settlement")))))
  (:title "CME Globex Thanksgiving holiday schedule 2020"
   :year 2020 :holiday :thanksgiving
   :uri "https://web.archive.org/web/20201125140635/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-thanksgiving-schedule.xls"
   :issued (2020 10 13) :issued-uri "https://web.archive.org/web/20201125140635/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-thanksgiving-schedule.xls"
   :published (2020 11 25) :published-uri "https://web.archive.org/web/20201125140635/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-thanksgiving-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2020 11 26) (12 0) "Thanksgiving halt, no settlement")
                ((2020 11 27) (12 15) "Thanksgiving early close")))
            (:interest-rate
              :early-closes (((2020 11 26) (12 0) "Thanksgiving halt, no settlement")
                ((2020 11 27) (12 15) "Thanksgiving early close")))
            (:fx
              :early-closes (((2020 11 26) (12 0) "Thanksgiving halt, no settlement")
                ((2020 11 27) (12 15) "Thanksgiving early close")))
            (:energy
              :early-closes (((2020 11 26) (12 0) "Thanksgiving halt, no settlement")
                ((2020 11 27) (12 45) "Thanksgiving early close")))
            (:metals
              :early-closes (((2020 11 26) (12 0) "Thanksgiving halt, no settlement")
                ((2020 11 27) (12 45) "Thanksgiving early close")))
            (:grains
              :sessions (((2020 11 27) ((:open (8 30) :close (12 5))) "Thanksgiving: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Christmas holiday schedule 2020"
   :year 2020 :holiday :christmas
   :uri "https://web.archive.org/web/20260730111834/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-holiday-calendars.zip"
   :issued (2020 11 17) :issued-uri "https://web.archive.org/web/20260730111834/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-holiday-calendars.zip"
   :published (2026 7 30) :published-uri "https://web.archive.org/web/20260730111834/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2020-christmas-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2020 12 24) (12 15) "Christmas early close")))
            (:interest-rate
              :early-closes (((2020 12 24) (12 15) "Christmas early close")))
            (:fx
              :early-closes (((2020 12 24) (12 15) "Christmas early close")))
            (:energy
              :early-closes (((2020 12 24) (12 45) "Christmas early close")))
            (:metals
              :early-closes (((2020 12 24) (12 45) "Christmas early close")))
            (:grains
              :early-closes (((2020 12 24) (12 5) "Christmas early close")))))
  (:title "CME Globex New Year's holiday schedule 2021"
   :year 2021 :holiday :new-years
   :uri "https://web.archive.org/web/20250818185509/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-new-years-holiday-schedule.xls"
   :issued (2020 12 9) :issued-uri "https://web.archive.org/web/20250818185509/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-new-years-holiday-schedule.xls"
   :published (2025 8 18) :published-uri "https://web.archive.org/web/20250818185509/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-new-years-holiday-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Martin Luther King Jr. Day holiday schedule 2021"
   :year 2021 :holiday :mlk
   :uri "https://web.archive.org/web/20260830100327/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-holiday-calendars.zip"
   :issued (2020 12 23) :issued-uri "https://web.archive.org/web/20260830100327/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-holiday-calendars.zip"
   :published (2026 8 30) :published-uri "https://web.archive.org/web/20260830100327/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2021-mlk-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2021 1 18) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2021 1 18) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:fx
              :early-closes (((2021 1 18) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:energy
              :early-closes (((2021 1 18) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:metals
              :early-closes (((2021 1 18) (12 0) "Martin Luther King Jr. Day halt, no settlement")))))
  (:title "CME Globex Presidents Day holiday schedule 2021"
   :year 2021 :holiday :presidents
   :uri "https://web.archive.org/web/20210214015315/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-presidents-day-holiday-schedule.xls"
   :issued (2021 2 11) :issued-uri "https://web.archive.org/web/20210214015315/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-presidents-day-holiday-schedule.xls"
   :published (2021 2 14) :published-uri "https://web.archive.org/web/20210214015315/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-presidents-day-holiday-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2021 2 15) (12 0) "Presidents Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2021 2 15) (12 0) "Presidents Day halt, no settlement")))
            (:fx
              :early-closes (((2021 2 15) (12 0) "Presidents Day halt, no settlement")))
            (:energy
              :early-closes (((2021 2 15) (12 0) "Presidents Day halt, no settlement")))
            (:metals
              :early-closes (((2021 2 15) (12 0) "Presidents Day halt, no settlement")))))
  (:title "CME Globex Good Friday holiday schedule 2021"
   :year 2021 :holiday :good-friday
   :uri "https://web.archive.org/web/20210402141803/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-good-friday-holiday-schedule.xls"
   :issued (2021 3 31) :issued-uri "https://web.archive.org/web/20210402141803/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-good-friday-holiday-schedule.xls"
   :published (2021 4 2) :published-uri "https://web.archive.org/web/20210402141803/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-good-friday-holiday-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :open (((2021 4 2) "Good Friday: Good Friday abbreviated session: open Thu 17:00, close Fri 08:15; advisory: \"Equities ... are open for an abbreviated session on April 2nd, but will not be settled\""))
              :no-settlement (((2021 4 2) "Good Friday"))
              :early-closes (((2021 4 2) (8 15) "Good Friday halt, no settlement")))
            (:interest-rate
              :open (((2021 4 2) "Good Friday: Good Friday abbreviated session: open Thu 17:00, close Fri 10:15; advisory: \"FX & Interest Rate markets will be settled on April 2nd\""))
              :early-closes (((2021 4 2) (10 15) "Good Friday early close")))
            (:fx
              :open (((2021 4 2) "Good Friday: Good Friday abbreviated session: open Thu 17:00, close Fri 10:15; advisory: \"FX & Interest Rate markets will be settled on April 2nd\""))
              :early-closes (((2021 4 2) (10 15) "Good Friday early close")))))
  (:title "CME Globex Memorial Day holiday schedule 2021"
   :year 2021 :holiday :memorial
   :uri "https://web.archive.org/web/20220917171238/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-memorial-day-holiday-schedule.xls"
   :issued (2021 5 25) :issued-uri "https://web.archive.org/web/20220917171238/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-memorial-day-holiday-schedule.xls"
   :published (2022 9 17) :published-uri "https://web.archive.org/web/20220917171238/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-memorial-day-holiday-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2021 5 31) (12 0) "Memorial Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2021 5 31) (12 0) "Memorial Day halt, no settlement")))
            (:fx
              :early-closes (((2021 5 31) (12 0) "Memorial Day halt, no settlement")))
            (:energy
              :early-closes (((2021 5 31) (12 0) "Memorial Day halt, no settlement")))
            (:metals
              :early-closes (((2021 5 31) (12 0) "Memorial Day halt, no settlement")))))
  (:title "CME Globex Independence Day holiday schedule 2021"
   :year 2021 :holiday :independence
   :uri "https://web.archive.org/web/20260830100327/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-holiday-calendars.zip"
   :issued (2021 7 1) :issued-uri "https://web.archive.org/web/20260830100327/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-holiday-calendars.zip"
   :published (2026 8 30) :published-uri "https://web.archive.org/web/20260830100327/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2021-independence-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2021 7 5) (12 0) "Independence Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2021 7 5) (12 0) "Independence Day halt, no settlement")))
            (:fx
              :early-closes (((2021 7 5) (12 0) "Independence Day halt, no settlement")))
            (:energy
              :early-closes (((2021 7 5) (12 0) "Independence Day halt, no settlement")))
            (:metals
              :early-closes (((2021 7 5) (12 0) "Independence Day halt, no settlement")))
            (:grains
              :sessions (((2021 7 6) ((:open (8 30) :close (13 20))) "Independence Day: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Labor Day holiday schedule 2021"
   :year 2021 :holiday :labor
   :uri "https://web.archive.org/web/20260830100327/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-holiday-calendars.zip"
   :issued (2021 8 12) :issued-uri "https://web.archive.org/web/20260830100327/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-holiday-calendars.zip"
   :published (2026 8 30) :published-uri "https://web.archive.org/web/20260830100327/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2021-labor-day-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2021 9 6) (12 0) "Labor Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2021 9 6) (12 0) "Labor Day halt, no settlement")))
            (:fx
              :early-closes (((2021 9 6) (12 0) "Labor Day halt, no settlement")))
            (:energy
              :early-closes (((2021 9 6) (12 0) "Labor Day halt, no settlement")))
            (:metals
              :early-closes (((2021 9 6) (12 0) "Labor Day halt, no settlement")))))
  (:title "CME Globex Thanksgiving holiday schedule 2021"
   :year 2021 :holiday :thanksgiving
   :uri "https://web.archive.org/web/20220917175604/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-thanksgiving-holiday-schedule.xls"
   :issued (2021 11 23) :issued-uri "https://web.archive.org/web/20220917175604/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-thanksgiving-holiday-schedule.xls"
   :published (2022 9 17) :published-uri "https://web.archive.org/web/20220917175604/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-thanksgiving-holiday-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2021 11 25) (12 0) "Thanksgiving halt, no settlement")
                ((2021 11 26) (12 15) "Thanksgiving early close")))
            (:interest-rate
              :early-closes (((2021 11 25) (12 0) "Thanksgiving halt, no settlement")
                ((2021 11 26) (12 15) "Thanksgiving early close")))
            (:fx
              :early-closes (((2021 11 25) (12 0) "Thanksgiving halt, no settlement")
                ((2021 11 26) (12 15) "Thanksgiving early close")))
            (:energy
              :early-closes (((2021 11 25) (12 0) "Thanksgiving halt, no settlement")
                ((2021 11 26) (12 45) "Thanksgiving early close")))
            (:metals
              :early-closes (((2021 11 25) (12 0) "Thanksgiving halt, no settlement")
                ((2021 11 26) (12 45) "Thanksgiving early close")))
            (:grains
              :sessions (((2021 11 26) ((:open (8 30) :close (12 5))) "Thanksgiving: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Christmas holiday schedule 2021"
   :year 2021 :holiday :christmas
   :uri "https://web.archive.org/web/20260830100327/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-holiday-calendars.zip"
   :issued (2021 12 1) :issued-uri "https://web.archive.org/web/20260830100327/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-holiday-calendars.zip"
   :published (2026 8 30) :published-uri "https://web.archive.org/web/20260830100327/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-holiday-calendars.zip"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "File 2021-christmas-holiday-schedule.xls in CME's yearly holiday-calendars zip. Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex New Year's holiday schedule 2022"
   :year 2022 :holiday :new-years
   :uri "https://web.archive.org/web/20220102130655/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-new-years-holiday-schedule.xls"
   :issued (2021 12 28) :issued-uri "https://web.archive.org/web/20220102130655/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-new-years-holiday-schedule.xls"
   :published (2022 1 2) :published-uri "https://web.archive.org/web/20220102130655/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-new-years-holiday-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Martin Luther King Jr. Day holiday schedule 2022"
   :year 2022 :holiday :mlk
   :uri "https://web.archive.org/web/20220117212230/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-mlk-day-holiday-schedule.xls"
   :issued (2021 12 14) :issued-uri "https://web.archive.org/web/20220117212230/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-mlk-day-holiday-schedule.xls"
   :published (2022 1 17) :published-uri "https://web.archive.org/web/20220117212230/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-mlk-day-holiday-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2022 1 17) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2022 1 17) (12 0) "Martin Luther King Jr. Day halt, no settlement")))
            (:energy
              :early-closes (((2022 1 17) (13 30) "Martin Luther King Jr. Day halt, no settlement")))
            (:metals
              :early-closes (((2022 1 17) (13 30) "Martin Luther King Jr. Day halt, no settlement")))))
  (:title "CME Globex Presidents Day holiday schedule 2022"
   :year 2022 :holiday :presidents
   :uri "https://web.archive.org/web/20220704073810/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-presidents-day-holiday-schedule.xls"
   :issued (2022 1 24) :issued-uri "https://web.archive.org/web/20220704073810/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-presidents-day-holiday-schedule.xls"
   :published (2022 7 4) :published-uri "https://web.archive.org/web/20220704073810/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-presidents-day-holiday-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2022 2 21) (12 0) "Presidents Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2022 2 21) (12 0) "Presidents Day halt, no settlement")))
            (:energy
              :early-closes (((2022 2 21) (13 30) "Presidents Day halt, no settlement")))
            (:metals
              :early-closes (((2022 2 21) (13 30) "Presidents Day halt, no settlement")))))
  (:title "CME Globex Good Friday holiday schedule 2022"
   :year 2022 :holiday :good-friday
   :uri "https://web.archive.org/web/20220704065501/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-good-friday-holiday-schedule.xls"
   :issued (2022 3 17) :issued-uri "https://web.archive.org/web/20220704065501/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-good-friday-holiday-schedule.xls"
   :published (2022 7 4) :published-uri "https://web.archive.org/web/20220704065501/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-good-friday-holiday-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Globex Memorial Day holiday schedule 2022"
   :year 2022 :holiday :memorial
   :uri "https://web.archive.org/web/20220704065438/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-memorial-day-holiday-schedule.xls"
   :issued (2022 5 18) :issued-uri "https://web.archive.org/web/20220704065438/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-memorial-day-holiday-schedule.xls"
   :published (2022 7 4) :published-uri "https://web.archive.org/web/20220704065438/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-memorial-day-holiday-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2022 5 30) (12 0) "Memorial Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2022 5 30) (12 0) "Memorial Day halt, no settlement")))
            (:energy
              :early-closes (((2022 5 30) (13 30) "Memorial Day halt, no settlement")))
            (:metals
              :early-closes (((2022 5 30) (13 30) "Memorial Day halt, no settlement")))))
  (:title "CME Globex Juneteenth holiday schedule 2022"
   :year 2022 :holiday :juneteenth
   :uri "https://web.archive.org/web/20220620200210/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-juneteenth-holiday-schedule.xls"
   :issued (2022 5 18) :issued-uri "https://web.archive.org/web/20220620200210/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-juneteenth-holiday-schedule.xls"
   :published (2022 6 20) :published-uri "https://web.archive.org/web/20220620200210/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-juneteenth-holiday-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2022 6 20) (12 0) "Juneteenth halt, no settlement")))
            (:interest-rate
              :early-closes (((2022 6 20) (12 0) "Juneteenth halt, no settlement")))
            (:energy
              :early-closes (((2022 6 20) (13 30) "Juneteenth halt, no settlement")))
            (:metals
              :early-closes (((2022 6 20) (13 30) "Juneteenth halt, no settlement")))))
  (:title "CME Globex Independence Day holiday schedule 2022"
   :year 2022 :holiday :independence
   :uri "https://web.archive.org/web/20220704065450/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-independence-day-holiday-schedule.xls"
   :issued (2022 6 29) :issued-uri "https://web.archive.org/web/20220704065450/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-independence-day-holiday-schedule.xls"
   :published (2022 7 4) :published-uri "https://web.archive.org/web/20220704065450/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-independence-day-holiday-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2022 7 4) (12 0) "Independence Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2022 7 4) (12 0) "Independence Day halt, no settlement")))
            (:energy
              :early-closes (((2022 7 4) (13 30) "Independence Day halt, no settlement")))
            (:metals
              :early-closes (((2022 7 4) (13 30) "Independence Day halt, no settlement")))
            (:grains
              :sessions (((2022 7 5) ((:open (8 30) :close (13 20))) "Independence Day: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Labor Day holiday schedule 2022"
   :year 2022 :holiday :labor
   :uri "https://web.archive.org/web/20220704065441/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-labor-day-holiday-schedule.xls"
   :issued (2022 6 29) :issued-uri "https://web.archive.org/web/20220704065441/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-labor-day-holiday-schedule.xls"
   :published (2022 7 4) :published-uri "https://web.archive.org/web/20220704065441/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-labor-day-holiday-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2022 9 5) (12 0) "Labor Day halt, no settlement")))
            (:interest-rate
              :early-closes (((2022 9 5) (12 0) "Labor Day halt, no settlement")))
            (:energy
              :early-closes (((2022 9 5) (13 30) "Labor Day halt, no settlement")))
            (:metals
              :early-closes (((2022 9 5) (13 30) "Labor Day halt, no settlement")))))
  (:title "CME Globex Thanksgiving holiday schedule 2022"
   :year 2022 :holiday :thanksgiving
   :uri "https://web.archive.org/web/20220704065423/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-thanksgiving-holiday-schedule.xls"
   :issued (2022 6 29) :issued-uri "https://web.archive.org/web/20220704065423/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-thanksgiving-holiday-schedule.xls"
   :published (2022 7 4) :published-uri "https://web.archive.org/web/20220704065423/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-thanksgiving-holiday-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ((:equity
              :early-closes (((2022 11 24) (12 0) "Thanksgiving halt, no settlement")
                ((2022 11 25) (12 15) "Thanksgiving early close")))
            (:interest-rate
              :early-closes (((2022 11 24) (12 0) "Thanksgiving halt, no settlement")
                ((2022 11 25) (12 15) "Thanksgiving early close")))
            (:fx
              :early-closes (((2022 11 25) (12 15) "Thanksgiving early close")))
            (:energy
              :early-closes (((2022 11 24) (13 30) "Thanksgiving halt, no settlement")
                ((2022 11 25) (12 45) "Thanksgiving early close")))
            (:metals
              :early-closes (((2022 11 24) (13 30) "Thanksgiving halt, no settlement")
                ((2022 11 25) (12 45) "Thanksgiving early close")))
            (:grains
              :sessions (((2022 11 25) ((:open (8 30) :close (12 5))) "Thanksgiving: opens 08:30 CT, no overnight session")))))
  (:title "CME Globex Christmas holiday schedule 2022"
   :year 2022 :holiday :christmas
   :uri "https://web.archive.org/web/20220704065430/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-christmas-holiday-schedule.xls"
   :issued (2022 6 29) :issued-uri "https://web.archive.org/web/20220704065430/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-christmas-holiday-schedule.xls"
   :published (2022 7 4) :published-uri "https://web.archive.org/web/20220704065430/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-christmas-holiday-schedule.xls"
   :published-in "CME Group holiday calendar (cmegroup.com/tools-information/holiday-calendar), Wayback copy"
   :dates-note "Issued = the \"Last updated\" / \"Updated\" date printed on the schedule; published = Wayback capture date (CME's own server refuses automated fetches)."
   :groups ())
  (:title "CME Group press release: U.S. Equity, Interest Rate Markets to Close for National Day of Mourning (President George H. W. Bush)"
   :year 2018
   :uri "https://web.archive.org/web/20181205161404/https://www.cmegroup.com/media-room/press-releases/2018/12/02/cme_group_u_s_equityinterestratemarketstoclosefornationaldayofmo.html"
   :issued (2018 12 2) :issued-uri "https://web.archive.org/web/20181205161404/https://www.cmegroup.com/media-room/press-releases/2018/12/02/cme_group_u_s_equityinterestratemarketstoclosefornationaldayofmo.html"
   :published (2018 12 2) :published-uri "https://web.archive.org/web/20181205161404/https://www.cmegroup.com/media-room/press-releases/2018/12/02/cme_group_u_s_equityinterestratemarketstoclosefornationaldayofmo.html"
   :published-in "CME Group press release (PRNewswire, Chicago, Dec. 2, 2018); Wayback copy"
   :dates-note nil
   :groups ((:equity :early-closes (((2018 12 5) (8 30) "National Day of Mourning: \"an abbreviated session, closing after overnight trading at 8:30 a.m. Central Time\"")))
            (:interest-rate :closed (((2018 12 5) "National Day of Mourning (President George H. W. Bush)"))))
   :note "\"All other markets on CME Globex ... will remain open for regular trading hours on Dec. 5.\" Interest rate products \"will close at their regular times on Dec. 4 and will not reopen until their regularly scheduled times for the trade date of Dec. 6.\"")
  (:title "CME Clearing holiday advisories 2023"
   :year 2023
   :uri "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf"
   :issued nil :issued-uri nil
   :published (2023 2 3) :published-uri "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf"
   :published-in "CME Group holiday calendar, CME Clearing advisories (Wayback copies)"
   :dates-note "The advisories print no date; published = Wayback capture of the MLK advisory (the others were captured the same day). New Year's 2 Jan 2023: https://web.archive.org/web/20220128031643/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-new-years-advisory.pdf"
   :closed () :open ()
   :note "No settlement, trades cleared the next business day: 2 Jan, 16 Jan, 20 Feb, 29 May, 19 Jun, 4 Jul, 4 Sep, 23 Nov, 25 Dec 2023 (= the rules). Columbus Day and Veterans Day: normal processing. Good Friday: separate notice.")
  (:title "CME Clearing Good Friday advisory 2023 (second correction)"
   :year 2023
   :uri "https://web.archive.org/web/20230203065333/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-good-friday-advisory.pdf"
   :issued nil :issued-uri nil
   :published (2023 2 3) :published-uri "https://web.archive.org/web/20230203065333/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-good-friday-advisory.pdf"
   :published-in "CME Group holiday calendar, CME Clearing advisory (Wayback copy)"
   :dates-note "The advisory prints no date; published = Wayback capture date."
   :groups ((:equity :open (((2023 4 7) "Good Friday: abbreviated session"))
                     :no-settlement (((2023 4 7) "Good Friday: \"Equities will trade an abbreviated session ... but will not be settled\""))
                     :early-closes (((2023 4 7) (8 15) "Good Friday abbreviated session; 08:15 CT is the close of the 2010, 2012, 2015 and 2021 schedules, the advisory gives no time")))
            (:interest-rate :open (((2023 4 7) "Good Friday: FX & Interest Rate markets settled"))
                            :early-closes (((2023 4 7) (10 15) "Good Friday; 10:15 CT as in the 2010-2021 schedules, the advisory gives no time")))
            (:fx :open (((2023 4 7) "Good Friday: FX & Interest Rate markets settled"))
                 :early-closes (((2023 4 7) (10 15) "Good Friday; 10:15 CT as in the 2010-2021 schedules, the advisory gives no time"))))
   :note "\"FX & Interest Rate markets will be settled on April 7th\"; equities abbreviated, not settled; other products rolled from 6 April (no trading).")
  (:title "CME Clearing holiday advisories 2024"
   :year 2024
   :uri "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf"
   :issued nil :issued-uri nil
   :published (2024 12 14) :published-uri "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf"
   :published-in "CME Group holiday calendar, CME Clearing advisories (Wayback copies)"
   :dates-note "The advisories print no date; published = Wayback capture of the MLK advisory. Good Friday 29 Mar 2024: https://web.archive.org/web/20241212014839/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-good-friday-advisory.pdf"
   :closed () :open ()
   :note "No settlement, trades cleared the next business day: 1 Jan, 15 Jan, 19 Feb, 29 Mar (Good Friday, no abbreviated session), 27 May, 19 Jun, 4 Jul, 2 Sep, 28 Nov, 25 Dec 2024 (= the rules). Columbus Day and Veterans Day: normal processing.")
  (:title "CME Clearing New Year's advisory 2025"
   :year 2025
   :uri "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf"
   :issued nil :issued-uri nil
   :published (2024 12 12) :published-uri "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf"
   :published-in "CME Group holiday calendar, CME Clearing advisory (Wayback copy)"
   :dates-note "The advisory prints no date; published = Wayback capture date. No other 2025 CME holiday document was found (the 2025 rows are the rules)."
   :closed () :open ()
   :note "1 Jan 2025: no settlement, transactions cleared the next business day. 9 Jan 2025 (national day of mourning): separate notice.")
  (:title "CME Group U.S. National Day of Mourning Trading Schedule, January 9, 2025 (President Jimmy Carter)"
   :year 2025
   :uri "https://web.archive.org/web/20250218194143/https://www.cmegroup.com/trading-hours/files/day-of-mourning-january-9-2024.pdf"
   :issued nil :issued-uri nil
   :published (2025 2 18) :published-uri "https://web.archive.org/web/20250218194143/https://www.cmegroup.com/trading-hours/files/day-of-mourning-january-9-2024.pdf"
   :published-in "CME Group trading-hours file (Wayback copy); press release https://web.archive.org/web/20250214072637/https://www.cmegroup.com/media-room/press-releases/2025/12/30/cme_group_announcestradinghoursforusnationaldayofmourningtohonor.html"
   :dates-note "The schedule prints no date (its file name says 2024); published = Wayback capture date. The press release is from 30 December 2024."
   :groups ((:equity :early-closes (((2025 1 9) (8 30) "National Day of Mourning: \"CME GROUP US EQUITIES CLOSE at 8:30 AM CT\""))
                     :no-settlement (((2025 1 9) "National Day of Mourning: equity settlements \"copy/pasted from the prior business day\"")))
            (:interest-rate :early-closes (((2025 1 9) (12 15) "National Day of Mourning: \"EARLY CLOSE - 12:15 PM CT\"")))
            (:grains :early-closes (((2025 1 9) (12 15) "National Day of Mourning: CME and CBOT ags \"EARLY CLOSE - 12:15 PM CT\""))))
   :note "FX, energy and metals: normal hours. \"All other CME/CBOT/NYMEX/COMEX Futures & Options WILL derive settlements on the National DOM trade date.\"")
  (:title "CME Clearing holiday advisories and settlement-times notices 2026"
   :year 2026
   :uri "https://web.archive.org/web/20260202215702/https://www.cmegroup.com/tools-information/holiday-calendar/files/2026/2026-mlk-day-clearing-advisory.pdf"
   :issued nil :issued-uri nil
   :published (2025 10 13) :published-uri "https://web.archive.org/web/20251013214732/https://www.cmegroup.com/tools-information/holiday-calendar/files/2026/mlk-day-holiday-settlement-times-2026.pdf"
   :published-in "CME Group trading-hours page, CME Clearing advisories and holiday settlement-times notices (Wayback copies)"
   :dates-note "None prints a date; published = Wayback capture of the first settlement-times notice. Thanksgiving: https://web.archive.org/web/20251013214651/https://www.cmegroup.com/tools-information/holiday-calendar/files/2026/thanksgiving-holiday-settlement-times-2026.pdf ; Christmas: https://web.archive.org/web/20251013214715/https://www.cmegroup.com/tools-information/holiday-calendar/files/2026/christmas-holiday-settlement-times-2026.pdf"
   :closed () :open ()
   :note "No settlement: 19 Jan, 16 Feb, 25 May, 19 Jun, 3 Jul (Independence Day observed), 7 Sep, 26 Nov, 25 Dec 2026 (= the rules). Settlement at 12:00 CT for equity, interest-rate, FX and grains on 27 Nov and 24 Dec (the early closes of the hours files); interest-rate settlement 12:00 CT on 22 May, 2 Jul and 31 Dec (bond-market early closes; Globex hours not stated).")
  (:title "CME Clearing Good Friday advisory and settlement times 2026"
   :year 2026
   :uri "https://web.archive.org/web/20260202002306/https://www.cmegroup.com/tools-information/holiday-calendar/files/2026/2026-good-friday-clearing-advisory.pdf"
   :issued nil :issued-uri nil
   :published (2025 10 13) :published-uri "https://web.archive.org/web/20251013214632/https://www.cmegroup.com/tools-information/holiday-calendar/files/2026/good-friday-holiday-settlement-times-2026.pdf"
   :published-in "CME Clearing advisory and holiday settlement-times notice (Wayback copies)"
   :dates-note "Neither prints a date; published = Wayback capture of the settlement-times notice."
   :groups ((:equity :open (((2026 4 3) "Good Friday: abbreviated session"))
                     :no-settlement (((2026 4 3) "Good Friday: equities abbreviated session, not settled"))
                     :early-closes (((2026 4 3) (8 15) "Good Friday abbreviated session; 08:15 CT as in the 2010-2021 schedules, the advisory gives no time")))
            (:interest-rate :open (((2026 4 3) "Good Friday: interest-rate products settle at 10:00 CT (employment report)"))
                            :early-closes (((2026 4 3) (10 15) "Good Friday; 10:15 CT as in the 2010-2021 schedules (settlement 10:00 CT)")))
            (:fx :open (((2026 4 3) "Good Friday: FX settles at 10:00 CT (employment report)"))
                 :early-closes (((2026 4 3) (10 15) "Good Friday; 10:15 CT as in the 2010-2021 schedules (settlement 10:00 CT)")))))
  (:title "CME Group trading-hours page, 2026 and 2027 Globex holiday schedule"
   :year 2027
   :uri "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html"
   :issued nil :issued-uri nil
   :published (2026 10 30) :published-uri "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html"
   :published-in "exchange website (Wayback capture of the trading-hours page); CME Clearing 2027 New Year's advisory https://web.archive.org/web/20260201135743/https://www.cmegroup.com/tools-information/holiday-calendar/files/2026/2027-new-years-clearing-advisory.pdf"
   :dates-note "The page prints no date; published = Wayback capture date. Its hours tables load dynamically and are not in the capture."
   :closed () :open ()
   :note "2027: 1 Jan no settlement (clearing advisory); Sunday orders before MLK, Presidents, Memorial, Independence and Labor days are for the Tuesday trade date; \"No trading for Friday March 26th trade date in observance of Good Friday\"; orders from Thursday 17 June cancel at the close of trading on Friday 18 June (Juneteenth on a Saturday moves to no weekday); Wednesday 24 Nov orders are for trade date Friday 26 Nov; Wednesday 22 Dec orders are for trade date Thursday 23 Dec."))
 )
