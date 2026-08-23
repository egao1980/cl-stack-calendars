(
 :mic "XIST"
 :name "Borsa Istanbul"
 :zone "Europe/Istanbul"
 :calendar "TR"
 :kind :equity
 :source "Borsa Istanbul equity continuous session"
 :eras (
   (:from (1995 1 2) :to (2019 12 31)
    :sessions ((:open (10 0) :close (13 0))
               (:open (14 0) :close (18 0)))
    :authority "BIST two-session day with lunch through 2010s")
   (:from (2020 1 2)
    :sessions ((:open (10 0) :close (18 0)))
    :authority "BIST cash continuous 10:00–18:00 (lunch removed)")))
