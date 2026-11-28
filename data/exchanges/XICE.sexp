;;;; Nasdaq Iceland equities (MIC XICE). Holidays: calendars/XICE.sexp.
;;;; 2007-03-26 to 2010-01-03 the close followed the CET clock (17:23 CET): 15:23
;;;; Reykjavik time while CET is on summer time, 16:23 in winter.
(
 :mic "XICE"
 :name "Nasdaq Iceland"
 :zone "Atlantic/Reykjavik"
 :calendar "XICE"
 :kind :equity
 :source "ICEX / Nasdaq OMX Iceland trading hours"
 :eras (
   (:from (1990 1 2) :to (2007 3 23)
    :sessions ((:open (10 0) :close (16 0)))
    :authority "10:00–16:00 in force on 2007-02-22 (ICEX release 'ICEX Trading Hours Changed on 26 March 2007': https://rss.globenewswire.com/news-release/2007/02/22/104069/0/en/ICEX-Trading-Hours-Changed-on-26-March-2007.html). Start not established.")
   (:from (2007 3 26) :to (2007 10 26) :sessions ((:open (10 0) :close (15 23)))
    :authority "ICEX release of 2007-02-22: close at 17:23 CET from 2007-03-26 (15:23 Reykjavik in CET summer time)")
   (:from (2007 10 29) :to (2008 3 28) :sessions ((:open (10 0) :close (16 23)))
    :authority "17:23 CET = 16:23 Reykjavik in CET winter time (ICEX 2007-02-22; 2009 page '10.00-16.23 (vintertid)': https://web.archive.org/web/20090207122443/http://nasdaqomxnordic.com:80/tradinghours)")
   (:from (2008 3 31) :to (2008 10 24) :sessions ((:open (10 0) :close (15 23)))
    :authority "17:23 CET = 15:23 Reykjavik in CET summer time")
   (:from (2008 10 27) :to (2009 3 27) :sessions ((:open (10 0) :close (16 23)))
    :authority "17:23 CET = 16:23 Reykjavik in CET winter time")
   (:from (2009 3 30) :to (2009 10 23) :sessions ((:open (10 0) :close (15 23)))
    :authority "17:23 CET = 15:23 Reykjavik in CET summer time")
   (:from (2009 10 26) :to (2009 12 31) :sessions ((:open (10 0) :close (16 23)))
    :authority "17:23 CET = 16:23 Reykjavik in CET winter time")
   (:from (2010 1 4)
    :sessions ((:open (9 30) :close (15 30)))
    :authority "09:30–15:30 local from 2010-01-04: NASDAQ OMX Iceland IT notice 122/09 of 2009-12-16 (https://rss.globenewswire.com/news-release/2009/12/16/147610/0/en/IT-New-trading-schedule-for-NASDAQ-OMX-Iceland.html). No half days in any list 2008–2027.")))
