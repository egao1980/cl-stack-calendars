(
 :mic "XOSL"
 :name "Euronext Oslo / Oslo Børs"
 :zone "Europe/Oslo"
 :calendar "NO"
 :kind :equity
 :source "Euronext Oslo / Nasdaq Nordic — Norwegian equities 09:00–16:20"
 :eras (
   (:from (1990 1 2)
    :sessions ((:open (9 0) :close (16 20)))
    :authority "Oslo Børs cash 09:00–16:20"))
 :early-close-rules (
   (:kind :christmas-eve-or-preceding-friday :from (1990 1 2) :close (13 0)
    :authority "Oslo half-day / closed on some eves — model 13:00")
   (:kind :new-years-eve-or-preceding-friday :from (1990 1 2) :close (13 0)
    :authority "Oslo half-day 13:00")))
