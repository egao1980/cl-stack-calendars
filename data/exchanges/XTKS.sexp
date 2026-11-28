;;;; Tokyo Stock Exchange cash zaraba (MIC XTKS). Lunch excluded as two segments.
;;;; Holidays: calendars/XTKS.sexp (Business Regulations Rule 3).
(
 :mic "XTKS"
 :name "Tokyo Stock Exchange"
 :zone "Asia/Tokyo"
 :calendar "XTKS"
 :source "TSE public comment 2010-11-24, TSE press release 2011-09-27, JPX arrowhead 4.0 notices"
 :eras (
   (:from (1949 5 16) :to (2011 11 18)
    :sessions ((:open (9 0) :close (11 0))
               (:open (12 30) :close (15 0)))
    :authority "Morning session 09:00-11:00: TSE public-comment outline 2010-11-24 ('現行の午前立会終了時間である午前１１時００分を午前１１時３０分とする') https://www.jpx.co.jp/files/tse/rules-participants/public-comment/data/101124-ks_1.pdf . Hours before 2000 not verified.")
   (:from (2011 11 21) :to (2024 11 1)
    :sessions ((:open (9 0) :close (11 30))
               (:open (12 30) :close (15 0)))
    :authority "TSE press release 2011-09-27: morning session to 11:30 from 2011-11-21 (Tdex+/ToSTNeT) https://www.jpx.co.jp/files/tse/about/press/b7gje60000029nqk-att/shiryou20110927.pdf")
   (:from (2024 11 5)
    :sessions ((:open (9 0) :close (11 30))
               (:open (12 30) :close (15 30)))
    :authority "TSE 2023-09-20 decision (arrowhead 4.0): afternoon session to 15:30 from 2024-11-05 https://www.jpx.co.jp/corporate/news/news-releases/1030/jr4eth0000002b72-att/pressrelease_extension_of_trading_hours_ja.pdf ; Business Regulations Rule 2(1) https://www.jpx.co.jp/english/rules-participants/rules/regulations/tvdivq0000001vyt-att/business_regs_20250507.pdf")))
