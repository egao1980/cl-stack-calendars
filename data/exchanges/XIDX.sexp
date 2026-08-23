;;;; IDX cash (MIC XIDX). Friday lunch is longer (Jumat).
(
 :mic "XIDX"
 :name "Indonesia Stock Exchange"
 :zone "Asia/Jakarta"
 :calendar "ID"
 :kind :equity
 :source "Jakarta Post 2012-11-02; IDX rule II-A current hours"
 :eras (
   (:from (2007 11 30) :to (2012 12 28)
    :sessions ((:open (9 30) :close (12 0))
               (:open (13 30) :close (16 0)))
    :friday ((:open (9 30) :close (11 30))
             (:open (14 0) :close (16 0)))
    :authority "IDX / JSX 09:30 open through 2012")
   (:from (2013 1 2)
    :sessions ((:open (9 0) :close (12 0))
               (:open (13 30) :close (15 50)))
    :friday ((:open (9 0) :close (11 30))
             (:open (14 0) :close (15 50)))
    :authority "IDX 2013-01-02: open 09:00 (Bapepam-LK); Friday shorter morning / later afternoon")))
