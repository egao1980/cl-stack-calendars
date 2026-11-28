;;;; IFEU — ICE Futures Europe, Brent crude / oil complex (the session modelled in data/exchanges/IFEU.sexp).
;;;; Research draft for cl-stack-calendars #49. Sources cached under ~/.cache/cl-stack-calendars/exchanges/ifeu/.
;;;; KEY FINDING: IFEU is NOT a GBLO calendar for Brent. In every ICE Futures Europe trading schedule found
;;;; (2013-2027 editions) the Exchange is closed only on New Year's Day, Good Friday and Christmas Day
;;;; ("UK and US Holiday", status Closed). All other England & Wales bank holidays (Easter Monday, Early May,
;;;; Spring, Summer, Boxing Day, and the special 2022-06-02/03, 2022-09-19, 2023-05-08 days) are "TD" (regular
;;;; trading hours and settlement) for Brent; only UK gas/power, UK emissions and agricultural (and on
;;;; 2022-09-19 GBP financial) contracts close on them.
;;;; Weekend handling seen: 25 Dec / 1 Jan on a Sunday -> the Monday is closed (2016-12-26, 2017-01-02,
;;;; 2022-12-26, 2023-01-02); on a Saturday -> no closure (2021-12-24/27/28/31, 2022-01-03 and
;;;; 2027-12-24/27/28/31, 2028-01-03 are TD).
;;;; Other ICE Futures Europe products (ex-Liffe financials, softs, UK gas) have different calendars; this file
;;;; is the oil (Brent) calendar only.
(:name "IFEU"
 :title "ICE Futures Europe (Brent / oil) trading days"
 :authority "ICE Futures Europe, IFEU Trading Schedule: Oil, Utilities and Agricultural (November 2026), with yearly editions since 2013"
 :authority-uri "https://www.ice.com/publicdocs/Trading_Schedule.pdf"
 :bases ()
 :rules ((:fixed "New Year's Day" 1 1 :observed :sunday-to-monday :from 2013
          :authority "ICE Futures Europe Trading Schedule (all editions 2013-2026): New Year's Day 'UK and US Holiday' Closed; 2017 and 2023 editions close Mon 2 Jan; 2021 (Nov 2021) and 2026 editions keep Mon 3 Jan 2022 / Mon 3 Jan 2028 as TD https://www.ice.com/publicdocs/Trading_Schedule.pdf")
         (:easter "Good Friday" -2 :from 2013
          :authority "ICE Futures Europe Trading Schedule: Good Friday 'UK and US Holiday' Closed (2013-2027) https://www.ice.com/publicdocs/Trading_Schedule.pdf")
         (:fixed "Christmas Day" 12 25 :observed :sunday-to-monday :from 2013
          :authority "ICE Futures Europe Trading Schedule: Christmas Day Closed; Mon 26 Dec 2016 and Mon 26 Dec 2022 closed; 2021 and 2027 (Saturday) no closure https://web.archive.org/web/20161221110112/https://www.theice.com/publicdocs/Trading_Schedule.pdf ; https://www.ice.com/publicdocs/futures/IFEU_Christmas_and_New_Year_Trading_Hours_2022.pdf"))
 :rules-note ":observed :sunday-to-monday = closure moves from Sunday to Monday only; a Saturday holiday is not observed. 2005-2012 (ICE electronic Brent era before the earliest schedule found) unverified; the rule is assumed to hold but there is no primary source. Implementer: map :sunday-to-monday to the define-calendar observance keyword that does this."
 :notices (
  (:title "ICE Futures Europe 2013 Trading Schedule (edition April 2013)"
   :year 2013
   :uri "https://web.archive.org/web/20130513190254/https://www.theice.com/publicdocs/Trading_Schedule.pdf"
   :issued nil :issued-uri nil
   :published (2013 5 13) :published-uri "https://web.archive.org/web/20130513190254/https://www.theice.com/publicdocs/Trading_Schedule.pdf"
   :published-in "ICE Futures Europe trading schedule PDF (Wayback)" :dates-note "Edition month only ('Last Update: April 2013'); :published = Wayback capture date."
   :closed () :open ()
   :early-closes (((2013 12 24) (19 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix")
                  ((2013 12 31) (20 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix"))
   :late-opens ()
   :observed-closures "1 Jan, 29 Mar (Good Friday), 25 Dec"
   :note "Appendix 'Christmas and New Year Trading Hours' gives Brent trading-cease times (2013/2014 editions give ET only: 14:00 ET = 19:00 GMT, 15:00 ET = 20:00 GMT). UK bank holidays (Easter Monday, Early May, Spring, Summer, Boxing Day) are TD (regular hours) for Brent; UK gas/power, UK emissions and agricultural contracts close on them.")
  (:title "ICE Futures Europe 2014 Trading Schedule (edition June 2014)"
   :year 2014
   :uri "https://web.archive.org/web/20140707113835/https://www.theice.com/publicdocs/Trading_Schedule.pdf"
   :issued nil :issued-uri nil
   :published (2014 7 7) :published-uri "https://web.archive.org/web/20140707113835/https://www.theice.com/publicdocs/Trading_Schedule.pdf"
   :published-in "ICE Futures Europe trading schedule PDF (Wayback)" :dates-note "Edition month only ('Last Update: June 2014'); :published = Wayback capture date."
   :closed () :open ()
   :early-closes (((2014 12 24) (19 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix")
                  ((2014 12 31) (20 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix"))
   :late-opens ()
   :observed-closures "1 Jan, 18 Apr, 25 Dec"
   :note "Appendix 'Christmas and New Year Trading Hours' gives Brent trading-cease times (2013/2014 editions give ET only: 14:00 ET = 19:00 GMT, 15:00 ET = 20:00 GMT). UK bank holidays (Easter Monday, Early May, Spring, Summer, Boxing Day) are TD (regular hours) for Brent; UK gas/power, UK emissions and agricultural contracts close on them.")
  (:title "ICE Futures Europe 2015 Trading Schedule (edition September 2015)"
   :year 2015
   :uri "https://web.archive.org/web/20150920010827/https://www.theice.com/publicdocs/Trading_Schedule.pdf"
   :issued nil :issued-uri nil
   :published (2015 9 20) :published-uri "https://web.archive.org/web/20150920010827/https://www.theice.com/publicdocs/Trading_Schedule.pdf"
   :published-in "ICE Futures Europe trading schedule PDF (Wayback)" :dates-note "Edition month only ('Last Update: September 2015'); :published = Wayback capture date."
   :closed () :open ()
   :early-closes (((2015 12 24) (19 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix")
                  ((2015 12 31) (20 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix"))
   :late-opens ()
   :observed-closures "1 Jan, 3 Apr, 25 Dec"
   :note "Appendix 'Christmas and New Year Trading Hours' gives Brent trading-cease times (2013/2014 editions give ET only: 14:00 ET = 19:00 GMT, 15:00 ET = 20:00 GMT). UK bank holidays (Easter Monday, Early May, Spring, Summer, Boxing Day) are TD (regular hours) for Brent; UK gas/power, UK emissions and agricultural contracts close on them.")
  (:title "ICE Futures Europe 2016 Trading Schedule (edition December 2016)"
   :year 2016
   :uri "https://web.archive.org/web/20161221110112/https://www.theice.com/publicdocs/Trading_Schedule.pdf"
   :issued nil :issued-uri nil
   :published (2016 12 21) :published-uri "https://web.archive.org/web/20161221110112/https://www.theice.com/publicdocs/Trading_Schedule.pdf"
   :published-in "ICE Futures Europe trading schedule PDF (Wayback)" :dates-note "Edition month only ('Last Update: December 2016'); :published = Wayback capture date."
   :closed () :open ()
   :early-closes (((2016 12 23) (20 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix")
                  ((2016 12 30) (20 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix"))
   :late-opens ()
   :observed-closures "1 Jan, 25 Mar, Mon 26 Dec ('Christmas Day', UK and US holiday)"
   :note "Appendix 'Christmas and New Year Trading Hours' gives Brent trading-cease times (2013/2014 editions give ET only: 14:00 ET = 19:00 GMT, 15:00 ET = 20:00 GMT). UK bank holidays (Easter Monday, Early May, Spring, Summer, Boxing Day) are TD (regular hours) for Brent; UK gas/power, UK emissions and agricultural contracts close on them.")
  (:title "ICE Futures Europe 2017 Trading Schedule (edition April 2017)"
   :year 2017
   :uri "https://web.archive.org/web/20170707170018/https://www.theice.com/publicdocs/Trading_Schedule.pdf"
   :issued nil :issued-uri nil
   :published (2017 7 7) :published-uri "https://web.archive.org/web/20170707170018/https://www.theice.com/publicdocs/Trading_Schedule.pdf"
   :published-in "ICE Futures Europe trading schedule PDF (Wayback)" :dates-note "Edition month only ('Last Update: April 2017'); :published = Wayback capture date."
   :closed () :open ()
   :early-closes (((2017 12 22) (20 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix")
                  ((2017 12 29) (20 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix"))
   :late-opens ()
   :observed-closures "Mon 2 Jan (New Year's Day), 14 Apr, 25 Dec"
   :note "Appendix 'Christmas and New Year Trading Hours' gives Brent trading-cease times (2013/2014 editions give ET only: 14:00 ET = 19:00 GMT, 15:00 ET = 20:00 GMT). UK bank holidays (Easter Monday, Early May, Spring, Summer, Boxing Day) are TD (regular hours) for Brent; UK gas/power, UK emissions and agricultural contracts close on them.")
  (:title "ICE Futures Europe 2018 Trading Schedule (edition April 2017)"
   :year 2018
   :uri "https://web.archive.org/web/20170707170018/https://www.theice.com/publicdocs/Trading_Schedule.pdf"
   :issued nil :issued-uri nil
   :published (2017 7 7) :published-uri "https://web.archive.org/web/20170707170018/https://www.theice.com/publicdocs/Trading_Schedule.pdf"
   :published-in "ICE Futures Europe trading schedule PDF (Wayback)" :dates-note "Edition month only ('Last Update: April 2017'); :published = Wayback capture date."
   :closed () :open ()
   :early-closes (((2018 12 24) (19 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix")
                  ((2018 12 31) (20 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix"))
   :late-opens ()
   :observed-closures "1 Jan, 30 Mar, 25 Dec"
   :note "Appendix 'Christmas and New Year Trading Hours' gives Brent trading-cease times (2013/2014 editions give ET only: 14:00 ET = 19:00 GMT, 15:00 ET = 20:00 GMT). UK bank holidays (Easter Monday, Early May, Spring, Summer, Boxing Day) are TD (regular hours) for Brent; UK gas/power, UK emissions and agricultural contracts close on them.")
  (:title "ICE Futures Europe 2019 Trading Schedule (edition May 2019)"
   :year 2019
   :uri "https://web.archive.org/web/20190526142534/https://www.theice.com/publicdocs/Trading_Schedule.pdf"
   :issued nil :issued-uri nil
   :published (2019 5 26) :published-uri "https://web.archive.org/web/20190526142534/https://www.theice.com/publicdocs/Trading_Schedule.pdf"
   :published-in "ICE Futures Europe trading schedule PDF (Wayback)" :dates-note "Edition month only ('Last Update: May 2019'); :published = Wayback capture date."
   :closed () :open ()
   :early-closes (((2019 12 24) (19 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix")
                  ((2019 12 31) (20 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix"))
   :late-opens ()
   :observed-closures "1 Jan, 19 Apr, 25 Dec"
   :note "Appendix 'Christmas and New Year Trading Hours' gives Brent trading-cease times (2013/2014 editions give ET only: 14:00 ET = 19:00 GMT, 15:00 ET = 20:00 GMT). UK bank holidays (Easter Monday, Early May, Spring, Summer, Boxing Day) are TD (regular hours) for Brent; UK gas/power, UK emissions and agricultural contracts close on them.")
  (:title "ICE Futures Europe 2020 Trading Schedule (edition May 2019)"
   :year 2020
   :uri "https://web.archive.org/web/20190526142534/https://www.theice.com/publicdocs/Trading_Schedule.pdf"
   :issued nil :issued-uri nil
   :published (2019 5 26) :published-uri "https://web.archive.org/web/20190526142534/https://www.theice.com/publicdocs/Trading_Schedule.pdf"
   :published-in "ICE Futures Europe trading schedule PDF (Wayback)" :dates-note "Edition month only ('Last Update: May 2019'); :published = Wayback capture date."
   :closed () :open ()
   :early-closes (((2020 12 24) (19 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix")
                  ((2020 12 31) (20 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix"))
   :late-opens ()
   :observed-closures "1 Jan, 10 Apr, 25 Dec"
   :note "Appendix 'Christmas and New Year Trading Hours' gives Brent trading-cease times (2013/2014 editions give ET only: 14:00 ET = 19:00 GMT, 15:00 ET = 20:00 GMT). UK bank holidays (Easter Monday, Early May, Spring, Summer, Boxing Day) are TD (regular hours) for Brent; UK gas/power, UK emissions and agricultural contracts close on them.")
  (:title "ICE Futures Europe 2021 Trading Schedule (edition November 2021)"
   :year 2021
   :uri "https://web.archive.org/web/20211207060707/https://www.theice.com/publicdocs/Trading_Schedule.pdf"
   :issued nil :issued-uri nil
   :published (2021 12 7) :published-uri "https://web.archive.org/web/20211207060707/https://www.theice.com/publicdocs/Trading_Schedule.pdf"
   :published-in "ICE Futures Europe trading schedule PDF (Wayback)" :dates-note "Edition month only ('Last Update: November 2021'); :published = Wayback capture date."
   :closed () :open ()
   :early-closes (((2021 12 24) (13 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix")
                  ((2021 12 31) (20 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix"))
   :late-opens ()
   :observed-closures "1 Jan, 2 Apr; Christmas/Boxing Day substitutes Mon 27 / Tue 28 Dec are TD (open)"
   :note "Appendix 'Christmas and New Year Trading Hours' gives Brent trading-cease times (2013/2014 editions give ET only: 14:00 ET = 19:00 GMT, 15:00 ET = 20:00 GMT). UK bank holidays (Easter Monday, Early May, Spring, Summer, Boxing Day) are TD (regular hours) for Brent; UK gas/power, UK emissions and agricultural contracts close on them.")
  (:title "IFEU Trading Hours: 2022 Christmas and New Year Holidays"
   :year 2022
   :uri "https://www.ice.com/publicdocs/futures/IFEU_Christmas_and_New_Year_Trading_Hours_2022.pdf"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.ice.com/publicdocs/futures/IFEU_Christmas_and_New_Year_Trading_Hours_2022.pdf"
   :published-in "ICE Futures Europe holiday-hours PDF" :dates-note "PDF undated except cover month (December 2022); :published unknown (fetched 2026-11-28). Year 2022 non-Christmas closures: see 2021 edition notice (Nov 2021) and Circular 22/132."
   :closed () :open ()
   :early-closes (((2022 12 23) (20 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix")
                  ((2022 12 30) (20 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix"))
   :late-opens ()
   :observed-closures "15 Apr, Mon 26 Dec; 3 Jan 2022 is TD; 2 Jun, 3 Jun (Platinum Jubilee), 19 Sep (State Funeral) are TD"
   :note "Christmas/New Year days only; Brent rows checked; 'The Exchange will be closed' on the listed closure days. Mon 2 Jan 2023: 'The Exchange will be CLOSED for trading EXCEPT' listed financial contracts (Brent not listed, so closed). UK bank holidays (Easter Monday, Early May, Spring, Summer, Boxing Day) are TD (regular hours) for Brent; UK gas/power, UK emissions and agricultural contracts close on them.")
  (:title "IFEU Trading Hours: 2023 Christmas and New Year Holidays"
   :year 2023
   :uri "https://www.ice.com/publicdocs/futures/Christmas_And_New_Year_2023.pdf"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.ice.com/publicdocs/futures/Christmas_And_New_Year_2023.pdf"
   :published-in "ICE Futures Europe holiday-hours PDF" :dates-note "PDF undated except cover month (December 2023); :published unknown (fetched 2026-11-28)."
   :closed () :open ()
   :early-closes (((2023 12 22) (20 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix")
                  ((2023 12 29) (20 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix"))
   :late-opens ()
   :observed-closures "Mon 2 Jan, 7 Apr, 25 Dec; 8 May (Coronation) TD"
   :note "Christmas/New Year days only; Brent rows checked; 'The Exchange will be closed' on the listed closure days. UK bank holidays (Easter Monday, Early May, Spring, Summer, Boxing Day) are TD (regular hours) for Brent; UK gas/power, UK emissions and agricultural contracts close on them.")
  (:title "IFEU Trading Hours: 2024 Christmas and New Year Holidays"
   :year 2024
   :uri "https://www.ice.com/publicdocs/futures/IFEu_Christmas_and_New_Year_2024.pdf"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.ice.com/publicdocs/futures/IFEu_Christmas_and_New_Year_2024.pdf"
   :published-in "ICE Futures Europe holiday-hours PDF" :dates-note "PDF undated except cover month (December 2024); :published unknown (fetched 2026-11-28)."
   :closed () :open ()
   :early-closes (((2024 12 24) (19 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix")
                  ((2024 12 31) (20 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix"))
   :late-opens ()
   :observed-closures "1 Jan, 29 Mar, 25 Dec"
   :note "Christmas/New Year days only; Brent rows checked; 'The Exchange will be closed' on the listed closure days. UK bank holidays (Easter Monday, Early May, Spring, Summer, Boxing Day) are TD (regular hours) for Brent; UK gas/power, UK emissions and agricultural contracts close on them.")
  (:title "IFEU Trading Hours: 2025 Christmas and New Year Holidays"
   :year 2025
   :uri "https://www.ice.com/publicdocs/futures/IFEu_Christmas_New_Year_Trading_Hours_2025.pdf"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.ice.com/publicdocs/futures/IFEu_Christmas_New_Year_Trading_Hours_2025.pdf"
   :published-in "ICE Futures Europe holiday-hours PDF" :dates-note "PDF undated except cover month (December 2025); :published unknown (fetched 2026-11-28)."
   :closed () :open ()
   :early-closes (((2025 12 24) (19 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix")
                  ((2025 12 31) (20 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix"))
   :late-opens ()
   :observed-closures "1 Jan, 18 Apr, 25 Dec"
   :note "Christmas/New Year days only; Brent rows checked; 'The Exchange will be closed' on the listed closure days. UK bank holidays (Easter Monday, Early May, Spring, Summer, Boxing Day) are TD (regular hours) for Brent; UK gas/power, UK emissions and agricultural contracts close on them.")
  (:title "IFEU Trading Schedule: Oil, Utilities and Agricultural (November 2026), 2026 Trading Schedule"
   :year 2026
   :uri "https://www.ice.com/publicdocs/Trading_Schedule.pdf"
   :issued nil :issued-uri nil
   :published (2026 11 28) :published-uri "https://www.ice.com/publicdocs/Trading_Schedule.pdf"
   :published-in "ICE Futures Europe trading schedule PDF" :dates-note "Edition 'November 2026' (cover month only); fetched 2026-11-28."
   :closed () :open ()
   :early-closes (((2026 5 25) (18 30) "US holiday code C/D: Brent early close")
                  ((2026 6 19) (18 30) "US holiday code C/D: Brent early close")
                  ((2026 7 3) (18 30) "US holiday code C/D: Brent early close")
                  ((2026 9 7) (18 30) "US holiday code C/D: Brent early close")
                  ((2026 11 26) (18 30) "US holiday code C/D: Brent early close")
                  ((2026 11 27) (20 0) "US holiday code B: Brent early close")
                  ((2026 12 24) (19 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix")
                  ((2026 12 31) (20 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix"))
   :late-opens ()
   :observed-closures "1 Jan, 3 Apr, 25 Dec"
   :note "Appendix 1/2 give Christmas/New Year hours; the 2026 schedule says full Christmas hours will also be confirmed via circular. US-holiday early closes per Trading Schedule Key (C/D 18:30, B 20:00). UK bank holidays (Easter Monday, Early May, Spring, Summer, Boxing Day) are TD (regular hours) for Brent; UK gas/power, UK emissions and agricultural contracts close on them.")
  (:title "IFEU Trading Schedule: Oil, Utilities and Agricultural (November 2026), 2027 Trading Schedule"
   :year 2027
   :uri "https://www.ice.com/publicdocs/Trading_Schedule.pdf"
   :issued nil :issued-uri nil
   :published (2026 11 28) :published-uri "https://www.ice.com/publicdocs/Trading_Schedule.pdf"
   :published-in "ICE Futures Europe trading schedule PDF" :dates-note "Edition 'November 2026' (cover month only); fetched 2026-11-28."
   :closed () :open ()
   :early-closes (((2027 5 31) (18 30) "US holiday code C/D: Brent early close")
                  ((2027 6 18) (18 30) "US holiday code C/D: Brent early close")
                  ((2027 7 5) (18 30) "US holiday code C/D: Brent early close")
                  ((2027 9 6) (18 30) "US holiday code C/D: Brent early close")
                  ((2027 11 25) (18 30) "US holiday code C/D: Brent early close")
                  ((2027 11 26) (20 0) "US holiday code B: Brent early close")
                  ((2027 12 24) (13 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix")
                  ((2027 12 31) (20 0) "Brent Futures and Options: trading ceases (GMT), Christmas/New Year appendix"))
   :late-opens ()
   :observed-closures "1 Jan, 26 Mar; 27/28 Dec 2027 and 3 Jan 2028 TD (open)"
   :note "Appendix 1/2 give Christmas/New Year hours; the 2026 schedule says full Christmas hours will also be confirmed via circular. US-holiday early closes per Trading Schedule Key (C/D 18:30, B 20:00). UK bank holidays (Easter Monday, Early May, Spring, Summer, Boxing Day) are TD (regular hours) for Brent; UK gas/power, UK emissions and agricultural contracts close on them.")
  (:title "Circular 22/132: Amendment to Trading Schedule - State Funeral of Her Majesty the Queen"
   :year 2022
   :uri "https://www.ice.com/publicdocs/circulars/22132.pdf"
   :issued (2022 9 12) :issued-uri "https://www.ice.com/publicdocs/circulars/22132.pdf"
   :published (2022 9 12) :published-uri "https://www.ice.com/publicdocs/circulars/22132.pdf"
   :published-in "ICE Futures Europe Circular 22/132" :dates-note nil
   :closed () :open () :early-closes () :late-opens ()
   :note "19 Sep 2022 'bank holiday setting': only the listed GBP financial (FTSE index, UK single-stock, SONIA, Swapnote, Eris GBP ...) and soft contracts closed. Brent not listed, so it traded normally. Without a GBLO base nothing closes it, so no :open row is needed.")))
