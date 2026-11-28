;;;; JPX / OSE derivatives: index futures / options (Nikkei 225), day + night session.
;;;; Holidays: calendars/XOSE.sexp (JPX non-business days, holiday trading from 2022-09-23).
;;;; A night session belongs to the business day it follows (label = date of the day session).
(
 :mic "XOSE"
 :name "Osaka Exchange / JPX derivatives"
 :zone "Asia/Tokyo"
 :calendar "XOSE"
 :kind :commodities
 :source "JPX / OSE releases 2017-09-19, 2021-09-21; OSE outline 2023-05-11; JPX derivatives trading-hours page"
 :eras (
   (:from (2016 7 19) :to (2021 9 17)
    :sessions ((:open (8 45) :close (15 15))
               (:open (16 30) :close (5 30) :overnight t :labeled-by :open))
    :authority "OSE 10th-anniversary release 2017-09-19 (night session to 05:30 from July 2016) https://www.jpx.co.jp/english/corporate/news/news-releases/0060/20170919-01.html ; day 08:45-15:15 from the 'Before' column of the OSE outline https://www.jpx.co.jp/rules-participants/public-comment/detail/d8/cg27su00000068h0-att/cg27su00000068j6.pdf . Earlier eras (evening session from 2007-09-18, to 03:00 from 2011-07-19) are not modelled: the day session before 2016 is not verified.")
   (:from (2021 9 21) :to (2024 11 1)
    :sessions ((:open (8 45) :close (15 15))
               (:open (16 30) :close (6 0) :overnight t :labeled-by :open))
    :authority "J-GATE 3.0 launch 2021-09-21: night session to 06:00 https://www.jpx.co.jp/english/corporate/news/news-releases/0060/20210921-01.html ; OSE outline 2023-05-11 'Before' column")
   (:from (2024 11 5)
    :sessions ((:open (8 45) :close (15 45))
               (:open (17 0) :close (6 0) :overnight t :labeled-by :open))
    :authority "OSE outline 2023-05-11 (day to 15:45 with closing auction, night 17:00-06:00 from 2024-11-05) https://www.jpx.co.jp/rules-participants/public-comment/detail/d8/cg27su00000068h0-att/cg27su00000068j6.pdf ; https://www.jpx.co.jp/english/derivatives/rules/trading-hours/index.html")))
