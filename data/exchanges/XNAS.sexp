;;;; Nasdaq cash RTH. Tracks NYSE hours from the 1971 launch.
(
 :mic "XNAS"
 :name "Nasdaq"
 :zone "America/New_York"
 :calendar "USFED"
 :source "Nasdaq/NYSE aligned cash RTH; Nasdaq opened 1971-02-08"
 :eras (
   (:from (1971 2 8) :to (1974 9 30)
    :sessions ((:open (10 0) :close (15 30)))
    :authority "Nasdaq launch 1971-02-08; cash RTH aligned with NYSE 10:00–15:30")
   (:from (1974 10 1) :to (1985 9 27)
    :sessions ((:open (10 0) :close (16 0)))
    :authority "NYSE/Nasdaq close extended to 16:00 (Oct 1974)")
   (:from (1985 9 30)
    :sessions ((:open (9 30) :close (16 0)))
    :authority "Open moved to 09:30 with NYSE (1985-09-30)"))
 :early-close-rules (
   (:kind :black-friday :from (1971 2 8) :to (1992 12 31) :close (14 0)
    :authority "US cash early close 14:00 through 1992")
   (:kind :black-friday :from (1993 1 1) :close (13 0)
    :authority "US cash early close 13:00 from 1993")
   (:kind :christmas-eve-weekday :from (1971 2 8) :to (1992 12 31) :close (14 0)
    :authority "Christmas Eve weekday 14:00 through 1992")
   (:kind :christmas-eve-weekday :from (1993 1 1) :close (13 0)
    :authority "Christmas Eve weekday 13:00 from 1993")
   (:kind :july-3-mon-tue-thu :from (1995 1 1) :close (13 0)
    :authority "Jul 3 Mon/Tue/Thu early close from 1995")
   (:kind :july-5-friday :from (1995 1 1) :to (2012 12 31) :close (13 0)
    :authority "Friday-after-Independence-Day early close 1995–2012"))
 :early-closes (
   ((1997 12 26) (13 0) "day after Christmas 1997")
   ((1999 12 31) (13 0) "Y2K New Year's Eve")
   ((2003 12 26) (13 0) "day after Christmas 2003")))
