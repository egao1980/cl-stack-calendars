;;;; England & Wales special Royal Proclamations under BFDA 1971 s.1(2)–(3).
;;;; EXTRA = one-off bank holidays; MOVED = (from to) where FROM is suppressed
;;;; (statutory rule day cancelled) and TO is the appointed substitute/relocation.
;;;; Ordinary weekend substitutes are handled by :uk-proclamation-substitute rules.
;;;;
;;;; Coverage 1995–2023: VE Day moves, Jubilees, Coronation, Royal Wedding 2011,
;;;; State Funeral 2022. Sources: the London Gazette notice of each proclamation
;;;; (England, Wales and Northern Ireland) and gov.uk bank-holidays.json
;;;; (2012–2028, live and archived; data/tests/external-gold.sexp).
;;;; Not yet in this file (#63): the 1973, 1977 and 1981 royal days and the
;;;; 1999-12-31 Millennium bank holiday.

(
 (:year 2023
  :authority "Royal Proclamation (London Gazette, 8 Nov 2022) — Coronation bank holiday (BFDA 1971 s.1(3))"
  :uri ("https://www.thegazette.co.uk/notice/4203714" "https://www.gov.uk/bank-holidays.json")
  :extra (
           ((2023 5 8) "Coronation of King Charles III")
           )
  :moved (
           ))

 (:year 2022
  :authority ("Royal Proclamation — Platinum Jubilee (BFDA 1971 s.1(2)–(3))"
              "Royal Proclamation 10 Sep 2022 — State Funeral (BFDA 1971 s.1(3))")
  :uri ("https://www.thegazette.co.uk/notice/3673202"
        "https://www.thegazette.co.uk/notice/4158896"
        "https://www.gov.uk/bank-holidays.json")
  :extra (
           ((2022 6 3) "Platinum Jubilee bank holiday")
           ((2022 9 19) "Bank Holiday for the State Funeral of Queen Elizabeth II")
           )
  :moved (
           ((2022 5 30) (2022 6 2) "Spring Bank Holiday relocated for Platinum Jubilee")
           ))

 (:year 2020
  :authority "Royal Proclamation given 10 Jul 2019 — VE Day 75th anniversary (BFDA 1971 s.1(2)–(3))"
  :uri ("https://www.thegazette.co.uk/notice/3326938" "https://www.gov.uk/bank-holidays.json")
  :extra (
           )
  :moved (
           ((2020 5 4) (2020 5 8) "Early May Bank Holiday relocated for VE Day 75")
           ))

 (:year 2012
  :authority "Royal Proclamation 8 Jun 2011 — Diamond Jubilee (BFDA 1971 s.1(2)–(3)); London Gazette 59806"
  :uri ("https://www.thegazette.co.uk/notice/L-59806-1377705"
        "https://web.archive.org/web/20121030084807id_/https://www.gov.uk/bank-holidays.json")
  :extra (
           ((2012 6 5) "Diamond Jubilee bank holiday")
           )
  :moved (
           ((2012 5 28) (2012 6 4) "Spring Bank Holiday relocated for Diamond Jubilee")
           ))

 (:year 2011
  :authority "Royal Proclamation 15 Dec 2010 — Royal Wedding (BFDA 1971 s.1(3)); London Gazette 59637"
  :uri "https://www.thegazette.co.uk/notice/L-59637-1268656"
  :extra (
           ((2011 4 29) "Royal Wedding bank holiday")
           )
  :moved (
           ))

 (:year 2002
  :authority "Royal Proclamation 15 Nov 2000 — Golden Jubilee (BFDA 1971 s.1(2)–(3)); London Gazette 56043 p.13411"
  :uri "https://www.thegazette.co.uk/notice/L-56043-1001"
  :extra (
           ((2002 6 3) "Golden Jubilee bank holiday")
           )
  :moved (
           ((2002 5 27) (2002 6 4) "Spring Bank Holiday relocated for Golden Jubilee")
           ))

 (:year 1995
  :authority "Royal Proclamation 27 Jun 1994 — VE Day 50th anniversary (BFDA 1971 s.1(2)–(3)); London Gazette 53715 p.9221"
  :uri "https://www.thegazette.co.uk/London/issue/53715/page/9221/data.pdf"
  :extra (
           )
  :moved (
           ((1995 5 1) (1995 5 8) "Early May Bank Holiday relocated for VE Day 50")
           ))

)
