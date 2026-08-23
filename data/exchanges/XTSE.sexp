;;;; Toronto Stock Exchange cash (MIC XTSE).
(
 :mic "XTSE"
 :name "Toronto Stock Exchange"
 :zone "America/Toronto"
 :calendar "CA"
 :source "TMX TSX cash hours (NYSE-aligned)"
 :eras (
   (:from (1980 1 2)
    :sessions ((:open (9 30) :close (16 0)))
    :authority "TSX cash 09:30–16:00 Eastern (NYSE-aligned)"))
 :early-close-rules (
   (:kind :christmas-eve-weekday :from (1980 1 2) :close (13 0)
    :authority "TSX Christmas Eve weekday early close 13:00")
   (:kind :new-years-eve-weekday :from (1980 1 2) :close (13 0)
    :authority "TSX New Year's Eve weekday early close 13:00")))
