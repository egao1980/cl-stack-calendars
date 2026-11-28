;;;; London Metal Exchange, LMEselect electronic window (MIC XLME). Holidays: calendars/XLME.sexp.
(
 :mic "XLME"
 :name "London Metal Exchange"
 :zone "Europe/London"
 :calendar "XLME"
 :kind :commodities
 :source "LME: LMEselect 01:00–19:00; ring 11:40–17:00"
 :eras (
   (:from (2001 1 2)
    :sessions ((:open (1 0) :close (19 0)))
    :authority "LMEselect 01:00–19:00 London Monday–Friday (lme.com trading times page refused automated fetches; not verified). Early closes 2003–2012 from the LME holiday notices (calendars/XLME.sexp); since 2021 LMEselect runs its normal hours on 24/31 Dec (only the Ring closes early).")))
