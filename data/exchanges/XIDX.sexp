;;;; IDX cash (MIC XIDX). Friday lunch is longer (Jumat).
(
 :mic "XIDX"
 :name "Indonesia Stock Exchange"
 :zone "Asia/Jakarta"
 :calendar "XIDX"
 :kind :equity
 :source "Jakarta Post 2012-11-02; IDX rule II-A current hours"
 :eras (
   (:from (2000 1 1) :to (2012 12 28)
    :sessions ((:open (9 30) :close (12 0))
               (:open (13 30) :close (16 0)))
    :friday ((:open (9 30) :close (11 30))
             (:open (14 0) :close (16 0)))
    :authority "JSX 'Mekanisme Perdagangan' (Mon-Thu 09:30-12:00 / 13:30-16:00, Friday 09:30-11:30 / 14:00-16:00) https://web.archive.org/web/20031008160117/http://www.jsx.co.id:80/trading.asp?cmd=menu1 ; unchanged after the Dec 2007 merger to 2012")
   (:from (2013 1 2) :to (2020 3 27)
    :sessions ((:open (9 0) :close (12 0))
               (:open (13 30) :close (15 50)))
    :friday ((:open (9 0) :close (11 30))
             (:open (14 0) :close (15 50)))
    :authority "IDX Trading Hours page (Wayback 2019-12-07): session I 09:00-12:00 (Friday 11:30), session II 13:30 (Friday 14:00) - 15:49:59, pre-closing 15:50 https://web.archive.org/web/20191207111354/https://www.idx.co.id/en-us/investor/trading-hours/")
   (:from (2020 3 30) :to (2023 3 31)
    :sessions ((:open (9 0) :close (11 30))
               (:open (13 30) :close (14 50)))
    :authority "Kep-00031/BEI/03-2020 (COVID-19): Mon-Fri 09:00-11:30 / 13:30-14:49:59, quoted on the IDX Trading Hours page https://web.archive.org/web/20200606143204/https://www.idx.co.id/en-us/investor/trading-hours/")
   (:from (2023 4 3)
    :sessions ((:open (9 0) :close (12 0))
               (:open (13 30) :close (15 50)))
    :friday ((:open (9 0) :close (11 30))
             (:open (14 0) :close (15 50)))
    :authority "Normal hours restored 2023-04-03 (Bisnis.com 2023-04-03, secondary; the current IDX page is client-rendered)")))
