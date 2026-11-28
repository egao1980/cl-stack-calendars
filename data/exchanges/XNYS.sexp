;;;; NYSE cash RTH (regular hours). ISO 10383 MIC XNYS.
;;;; Holidays: "NYSE" calendar (data/exchanges/calendars/NYSE.sexp: NYSE holiday rules and closing
;;;; notices, incl. pre-1970 early closes and late opens; modeled from 1953, #50). Eras before 1953
;;;; stay as hours history; queries there signal CALENDAR-OUT-OF-RANGE from the calendar.
(
 :mic "XNYS"
 :name "New York Stock Exchange"
 :zone "America/New_York"
 :calendar "NYSE"
 :source "NYSE official timeline (archive), NYSE closings history (paperwork-crisis hours), SEC Special Study (1963) + NYSE early-close notices"
 :eras (
   (:from (1887 5 1) :to (1952 5 24)
    :sessions ((:open (10 0) :close (15 0)))
    :saturday ((:open (10 0) :close (12 0)))
    :weekend (7)
    :authority "NYSE timeline: Mon–Fri 10:00–15:00, Sat 10:00–12:00 from 1887; last Saturday session 1952-05-24")
   (:from (1952 5 26) :to (1952 9 26)
    :sessions ((:open (10 0) :close (15 0)))
    :authority "NYSE summer 1952 Saturday closures (May 31–Sep 27); weekdays still 10:00–15:00")
   (:from (1952 9 29) :to (1968 12 31)
    :sessions ((:open (10 0) :close (15 30)))
    :authority "NYSE timeline 1952: 10 A.M. to 3:30 P.M. Monday-Friday, closes on Saturdays (https://web.archive.org/web/20100507135343/http://www.nyse.com/about/history/timeline_trading.html); SEC Special Study (1963) Part 2 p. 78: \"the 5 1/2 hours of trading\"")
   (:from (1969 1 2) :to (1969 7 3)
    :sessions ((:open (10 0) :close (14 0)))
    :authority "NYSE closings history: \"Jan. 2-July 3, 1969 (Thu-Thu) Five day week resumed, but with curtailed hours: 2:00 pm closing - Paperwork Crisis\" https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf")
   (:from (1969 7 7) :to (1969 9 26)
    :sessions ((:open (10 0) :close (14 30)))
    :authority "NYSE closings history: \"July 7-Sept. 26, 1969 (Mon-Fri) 2:30 pm closing - Paperwork Crisis\"")
   (:from (1969 9 29) :to (1970 5 1)
    :sessions ((:open (10 0) :close (15 0)))
    :authority "NYSE closings history: \"Sept. 29, 1969-May 1, 1970 (Mon-Fri) 3:00 pm closing - Paperwork Crisis. Normal hours (10:00 am-3:30 pm) resumed May 4, 1970\"")
   (:from (1970 5 4) :to (1974 9 30)
    :sessions ((:open (10 0) :close (15 30)))
    :authority "NYSE closings history: normal hours (10:00 am-3:30 pm) resumed May 4, 1970")
   (:from (1974 10 1) :to (1985 9 27)
    :sessions ((:open (10 0) :close (16 0)))
    :authority "NYSE timeline 1974: close extended to 16:00 (effective Oct 1974)")
   (:from (1985 9 30)
    :sessions ((:open (9 30) :close (16 0)))
    :authority "NYSE timeline 1985-09-30: open moved to 09:30"))
 :early-close-rules (
   (:kind :black-friday :from (1992 1 1) :to (1992 12 31) :close (14 0)
    :authority "NYSE day-after-Thanksgiving early close 14:00 in 1992 (first day-after-Thanksgiving early close)")
   (:kind :black-friday :from (1993 1 1) :close (13 0)
    :authority "NYSE day-after-Thanksgiving early close 13:00 from 1993")
   (:kind :christmas-eve-weekday :from (1970 1 1) :to (1992 12 31) :close (14 0)
    :authority "NYSE Christmas Eve weekday early close 14:00 1970-1992 (exchange_calendars gold; the NYSE closings history lists 1974, 1975 and 1990-1992). It lists none 1952-1969, so none before 1970 (#50)")
   (:kind :christmas-eve-weekday :from (1993 1 1) :close (13 0)
    :authority "NYSE Christmas Eve weekday early close 13:00 from 1993")
   (:kind :july-3-mon-tue-thu :from (1995 1 1) :close (13 0)
    :authority "NYSE Jul 3 early close when Mon/Tue/Thu, from 1995")
   (:kind :july-3-wednesday :from (2013 1 1) :close (13 0)
    :authority "NYSE Jul 3 early close also when Wednesday, from 2013 (2013-07-03, 2019-07-03, 2024-07-03 notices)")
   (:kind :july-5-friday :from (1995 1 1) :to (2012 12 31) :close (13 0)
    :authority "NYSE Friday-after-Independence-Day early close 1995–2012"))
 :early-closes (
   ((1997 12 26) (13 0) "day after Christmas 1997")
   ((1999 12 31) (13 0) "Y2K New Year's Eve")
   ((2003 12 26) (13 0) "day after Christmas 2003")))
