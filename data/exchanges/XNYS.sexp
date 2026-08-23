;;;; NYSE cash RTH (regular hours). ISO 10383 MIC XNYS.
;;;; Civil calendar USFED does not include NYSE-only closings (Good Friday, etc.).
(
 :mic "XNYS"
 :name "New York Stock Exchange"
 :zone "America/New_York"
 :calendar "USFED"
 :source "NYSE official timeline (archive) + NYSE early-close notices"
 :eras (
   (:from (1887 5 1) :to (1952 5 24)
    :sessions ((:open (10 0) :close (15 0)))
    :saturday ((:open (10 0) :close (12 0)))
    :weekend (7)
    :authority "NYSE timeline: Mon–Fri 10:00–15:00, Sat 10:00–12:00 from 1887; last Saturday session 1952-05-24")
   (:from (1952 5 26) :to (1952 9 26)
    :sessions ((:open (10 0) :close (15 0)))
    :authority "NYSE summer 1952 Saturday closures (May 31–Sep 27); weekdays still 10:00–15:00")
   (:from (1952 9 29) :to (1974 9 30)
    :sessions ((:open (10 0) :close (15 30)))
    :authority "NYSE timeline 1952-09-29: 10:00–15:30 Mon–Fri; Saturdays retired")
   (:from (1974 10 1) :to (1985 9 27)
    :sessions ((:open (10 0) :close (16 0)))
    :authority "NYSE timeline 1974: close extended to 16:00 (effective Oct 1974)")
   (:from (1985 9 30)
    :sessions ((:open (9 30) :close (16 0)))
    :authority "NYSE timeline 1985-09-30: open moved to 09:30"))
 :early-close-rules (
   (:kind :black-friday :from (1952 9 29) :to (1992 12 31) :close (14 0)
    :authority "NYSE day-after-Thanksgiving early close 14:00 through 1992")
   (:kind :black-friday :from (1993 1 1) :close (13 0)
    :authority "NYSE day-after-Thanksgiving early close 13:00 from 1993")
   (:kind :christmas-eve-weekday :from (1952 9 29) :to (1992 12 31) :close (14 0)
    :authority "NYSE Christmas Eve weekday early close 14:00 through 1992")
   (:kind :christmas-eve-weekday :from (1993 1 1) :close (13 0)
    :authority "NYSE Christmas Eve weekday early close 13:00 from 1993")
   (:kind :july-3-mon-tue-thu :from (1995 1 1) :close (13 0)
    :authority "NYSE Jul 3 early close when Mon/Tue/Thu, from 1995")
   (:kind :july-5-friday :from (1995 1 1) :to (2012 12 31) :close (13 0)
    :authority "NYSE Friday-after-Independence-Day early close 1995–2012"))
 :early-closes (
   ((1997 12 26) (13 0) "day after Christmas 1997")
   ((1999 12 31) (13 0) "Y2K New Year's Eve")
   ((2003 12 26) (13 0) "day after Christmas 2003")))
