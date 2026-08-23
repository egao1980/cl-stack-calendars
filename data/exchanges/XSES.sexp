;;;; SGX securities (MIC XSES). Lunch removed 2011, restored 2017.
(
 :mic "XSES"
 :name "Singapore Exchange"
 :zone "Asia/Singapore"
 :calendar "SG"
 :source "SGX CAT 2011-08-01; lunch restored 2017-11-13"
 :eras (
   (:from (1999 12 1) :to (2011 7 29)
    :sessions ((:open (9 0) :close (12 30))
               (:open (14 0) :close (17 0)))
    :authority "SGX securities 09:00–12:30 / 14:00–17:00 through 2011-07-29")
   (:from (2011 8 1) :to (2017 11 10)
    :sessions ((:open (9 0) :close (17 0)))
    :authority "SGX Continuous All-Day Trading 2011-08-01–2017-11-10")
   (:from (2017 11 13)
    :sessions ((:open (9 0) :close (12 0))
               (:open (13 0) :close (17 0)))
    :authority "SGX lunch restored 2017-11-13: 09:00–12:00 / 13:00–17:00"))
 :early-close-rules (
   (:kind :christmas-eve-weekday :from (1999 12 1) :close (12 0)
    :authority "SGX half-day (Christmas Eve weekday) close 12:00")
   (:kind :new-years-eve-weekday :from (1999 12 1) :close (12 0)
    :authority "SGX half-day (New Year's Eve weekday) close 12:00")))
