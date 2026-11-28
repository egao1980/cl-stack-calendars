;;;; Euronext Oslo / Oslo Børs equities (MIC XOSL). Holidays: calendars/XOSL.sexp.
(
 :mic "XOSL"
 :name "Euronext Oslo / Oslo Børs"
 :zone "Europe/Oslo"
 :calendar "XOSL"
 :kind :equity
 :source "Oslo Børs opening hours and press releases"
 :eras (
   (:from (1990 1 2) :to (2005 12 30)
    :sessions ((:open (10 0) :close (16 0)))
    :authority "Continuous trading 10:00–16:00 in 2002 and 2003 (Oslo Børs kalender: https://web.archive.org/web/20020420023438/http://www.oslobors.no:80/asp/calendar.asp?lang=&hendelse=Oslo+B%F8rs+stengt); by 2005-06-28 10:00–16:10 (release 'Extension of trading hours at Oslo Børs'; the date of the 16:10 change is not established, so this era keeps 16:00)")
   (:from (2006 1 2) :to (2008 8 29)
    :sessions ((:open (9 0) :close (16 20)))
    :authority "09:00 open from 2006-01-02 (release of 2005-12-28 'New trading hours for Oslo Børs from 2 January 2006', https://web.archive.org/web/20101220224602/http://oslobors.no/ob_eng/Oslo-Boers/About-us/Press-room/Press-releases/(year)/2005); continuous trading to 16:20 (closing auction to 16:30)")
   (:from (2008 9 1) :to (2012 8 3)
    :sessions ((:open (9 0) :close (17 20)))
    :authority "Opening hours extended to 17:30 (continuous to 17:20, closing call to 17:30) from 2008-09-01: releases of 2008-02-27 and 2008-08-25 (https://web.archive.org/web/20101220224530/http://oslobors.no/ob_eng/Oslo-Boers/About-us/Press-room/Press-releases/(year)/2008)")
   (:from (2012 8 6)
    :sessions ((:open (9 0) :close (16 20)))
    :authority "Continuous trading to 16:20, closing auction 16:20–16:30 from 2012-08-06: 'Oslo Børs to reduce opening hours', 2012-06-29 (https://web.archive.org/web/20140831071026/http://www.oslobors.no/ob_eng/Oslo-Boers/About-us/Press-room/News-from-Oslo-Boers/). Kept under Euronext (Oslo Børs, 2019-11-01)."))
 :early-close-rules (
   (:kind :easter :offset -4 :from (2011 1 1) :close (13 0)
    :authority "Wednesday before Maundy Thursday: continuous trading ends 13:00 (Oslo Børs lists 2011–2013, 2015; Euronext trading-hours page 2020–2027). 2002, 2003 and 2009 from the notices in calendars/XOSL.sexp; 2004–2008 and 2010 have no list."))
 :early-closes (
   ((2002 3 27) (13 0) "Onsdag før påsken avsluttes kontinuerlig omsetning kl. 13.00 (Oslo Børs kalender 2002)")
   ((2003 4 16) (13 0) "Oslo Børs kalender 2003")
   ((2009 4 8) (13 10) "Oslo Børs Opening Hours 2009")))
