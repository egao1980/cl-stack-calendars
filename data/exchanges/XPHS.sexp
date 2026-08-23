(
 :mic "XPHS"
 :name "Philippine Stock Exchange"
 :zone "Asia/Manila"
 :calendar "PH"
 :kind :equity
 :source "PSE TPA 2011-0108 / Inquirer 2011-09; afternoon from 2012-01-02"
 :eras (
   (:from (1993 1 4) :to (2011 9 30)
    :sessions ((:open (9 30) :close (12 0)))
    :authority "PSE morning-only 09:30–12:00 through Sep 2011")
   (:from (2011 10 3) :to (2011 12 29)
    :sessions ((:open (9 30) :close (13 0)))
    :authority "PSE 2011-10-03: extended to 13:00 (no lunch)")
   (:from (2012 1 2)
    :sessions ((:open (9 30) :close (12 0))
               (:open (13 30) :close (15 30)))
    :authority "PSE 2012-01-02: 09:30–12:00 / 13:30–15:30")))
