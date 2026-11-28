;;;; ASX cash (MIC XASX). Holidays: calendars/XASX.sexp.
(
 :mic "XASX"
 :name "Australian Securities Exchange"
 :zone "Australia/Sydney"
 :calendar "XASX"
 :source "ASX trading hours; ASX Trade calendars 2009-2027; ASX notice 1357.16.11"
 :eras (
   (:from (1987 10 19)
    :sessions ((:open (10 0) :close (16 0)))
    :authority "ASX cash 10:00-16:00 from SEATS (1987-10-19); no exchange document contradicting it found for 2000-2028 (the staggered open and the closing single price auction are auction phases)"))
 :early-close-rules (
   (:kind :function :function asx-last-trading-day-before-christmas :from (2009 1 1) :to (2016 12 31) :close (14 10)
    :authority "ASX Trade calendars 2009-2016: the last trading day before Christmas closes early, 'Normal trading ceases at 14:10 (Sydney time)', whatever its weekday (e.g. Fri 23 Dec 2011, Fri 23 Dec 2016) https://web.archive.org/web/20110707053534/http://asx.com.au/about/asx-trading-calendar-2009.htm . Before 2009 not established.")
   (:kind :function :function asx-last-trading-day-of-year :from (2009 1 1) :to (2016 12 31) :close (14 10)
    :authority "ASX Trade calendars 2009-2016: the last trading day of the year closes at 14:10 (e.g. Fri 30 Dec 2011)")
   (:kind :christmas-eve-weekday :from (2017 1 1) :close (14 10)
    :authority "ASX notice 1357.16.11 (15 Nov 2016): 'From 2017 ASX will only close early when the last trading day before Christmas and New Year's Holidays are the respective Eve of these holidays' https://asxonline.com/public/notices/2016/nov/1357.16.11.html ; close 14:10 (calendars 2018-2027)")
   (:kind :new-years-eve-weekday :from (2017 1 1) :close (14 10)
    :authority "ASX notice 1357.16.11: New Year's Eve early close at 14:10 only when 31 December is a trading day")))
