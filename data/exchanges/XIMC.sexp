;;;; MCX non-agri (bullion / energy / base). Agri closes earlier.
(
 :mic "XIMC"
 :name "Multi Commodity Exchange of India"
 :zone "Asia/Kolkata"
 :calendar "IN"
 :kind :commodities
 :source "MCX / SEBI CDMRD: non-agri 09:00–23:30 (23:45 in US DST)"
 :eras (
   (:from (2003 11 10)
    :sessions ((:open (9 0) :close (23 30)))
    :authority "MCX non-agri 09:00–23:30 IST (extends to 23:45 during US DST)")))
