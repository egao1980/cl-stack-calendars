;;;; SGX securities (MIC XSES). Lunch removed 2011, restored 2017.
(
 :mic "XSES"
 :name "Singapore Exchange"
 :zone "Asia/Singapore"
 :calendar "XSES"
 :source "SGX CAT 2011-08-01; lunch restored 2017-11-13"
 :eras (
   (:from (1999 12 1) :to (2011 7 29)
    :sessions ((:open (9 0) :close (12 30))
               (:open (14 0) :close (17 0)))
    :authority "SGX securities 09:00–12:30 / 14:00–17:00 through 2011-07-31: RN 8.2.1 past version https://rulebook.sgx.com/node/1771/revisions/1771/view (start of this era not stated)")
   (:from (2011 8 1) :to (2017 11 10)
    :sessions ((:open (9 0) :close (17 0)))
    :authority "SGX Continuous All-Day Trading 2011-08-01–2017-11-10")
   (:from (2017 11 13)
    :sessions ((:open (9 0) :close (12 0))
               (:open (13 0) :close (17 0)))
    :authority "SGX lunch restored 2017-11-13: 09:00–12:00 / 13:00–17:00"))
 :early-close-rules (
   (:kind :christmas-eve-weekday :from (1999 12 1) :to (2017 11 12) :close (12 30)
    :authority "SGX half day (morning session only) on Christmas Eve when a business day; the half-day Trading Phase ends 12:30 until 2017-11-12: SGX Rulebook Regulatory Notice 8.2.1 'Market Phases', revisions to 12 Nov 2017 https://rulebook.sgx.com/node/1771/revisions/9579/view . Which days are half days is given only by secondary pages; 2000-2010 not established.")
   (:kind :new-years-eve-weekday :from (1999 12 1) :to (2017 11 12) :close (12 30)
    :authority "SGX half day on New Year's Eve when a business day, Trading Phase to 12:30 (RN 8.2.1, revisions to 12 Nov 2017)")
   (:kind :function :function lunar-new-year-eve :from (1999 12 1) :to (2017 11 12) :close (12 30)
    :authority "SGX half day on the eve of Chinese New Year when a business day, Trading Phase to 12:30 (RN 8.2.1); the eve is the day before Lunar New Year's Day")
   (:kind :christmas-eve-weekday :from (2017 11 13) :close (12 0)
    :authority "RN 8.2.1 from 2017-11-13: half-day Trading Phase 09:00-12:00 https://rulebook.sgx.com/node/1771/revisions/9710/view ; SGX half days 2020-2027 in calendars/XSES.sexp")
   (:kind :new-years-eve-weekday :from (2017 11 13) :close (12 0)
    :authority "RN 8.2.1 from 2017-11-13: half-day Trading Phase to 12:00")
   (:kind :function :function lunar-new-year-eve :from (2017 11 13) :close (12 0)
    :authority "RN 8.2.1 from 2017-11-13: half day on the eve of Chinese New Year, Trading Phase to 12:00")))
