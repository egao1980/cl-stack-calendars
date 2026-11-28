;;;; European Energy Exchange derivatives (MIC XEEE). Holidays: calendars/XEEE.sexp.
(
 :mic "XEEE"
 :name "European Energy Exchange"
 :zone "Europe/Berlin"
 :calendar "XEEE"
 :kind :commodities
 :source "EEX power/gas derivatives core window"
 :eras (
   (:from (2002 1 2)
    :sessions ((:open (8 0) :close (18 0)))
    :authority "EEX derivatives core 08:00–18:00 CE(S)T (product windows vary; not checked against an EEX document). Starts with European Energy Exchange AG after the 2002 merger of LPX (first trade 2000-06-15) and EEX Frankfurt (August 2000): EEX Group milestones https://www.eex-group.com/en/about/milestones. Gas and freight trade 08:00–13:00 on 24/31 Dec while power is closed (EEX Holiday Calendar); not modeled.")))
