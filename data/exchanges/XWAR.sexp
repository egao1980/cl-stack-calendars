;;;; Warsaw Stock Exchange (GPW) cash (MIC XWAR). Holidays: calendars/XWAR.sexp.
(
 :mic "XWAR"
 :name "Warsaw Stock Exchange"
 :zone "Europe/Warsaw"
 :calendar "XWAR"
 :kind :equity
 :source "GPW session schedules (harmonogram sesji)"
 :eras (
   (:from (1991 4 16) :to (2010 12 31)
    :sessions ((:open (9 30) :close (16 30)))
    :authority "WARSET: cash continuous from 10:00, trading day to 16:10 in January 2004 (https://web.archive.org/web/20040120163601/http://www.gpw.pl:80/gpw.asp?cel=ogieldzie&k=95&i=/warset/harmonogram); from 09:30, to 16:30 by mid-2007 (https://web.archive.org/web/20070703212441/http://www.gpw.pl/gpw.asp?cel=inwestorzy&k=2114&i=/ogieldzie/warset/harmonogram&sky=1). Change dates not found; this era uses the 2007 hours. Not verified.")
   (:from (2011 1 3) :to (2013 4 12)
    :sessions ((:open (9 0) :close (17 20)))
    :authority "From 2011-01-01: continuous 09:00–17:20, closing auction 17:20–17:30 (GPW harmonogram sesji 'od 1 stycznia 2011': https://web.archive.org/web/20120113200502/http://www.gpw.pl/harmonogram_sesji). The modeled close is the end of continuous trading.")
   (:from (2013 4 15)
    :sessions ((:open (9 0) :close (16 50)))
    :authority "UTP from 2013-04-15 (effective date from secondary sources): continuous 09:00–16:50, closing auction 16:50–17:00 (GPW session details: https://www.gpw.pl/szczegoly-sesji). No early closes: none in any GPW list."))
 )
