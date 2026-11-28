;;;; NYSE — New York Stock Exchange trading holidays (XNYS; XNAS follows them).
;;;; cl-stack-calendars #11 (0.5.0), #50 (0.50.0: 1953-1969 from the NYSE's own record).
;;;;
;;;; Sources cached under ~/.cache/cl-stack-calendars/exchanges/xnys/:
;;;;   wb-<timestamp>-closings.pdf  NYSE "History of New York Stock Exchange Holidays" and
;;;;                                "New York Stock Exchange Special Closings, 1885-date"
;;;;                                (nyse.com/pdfs/closings.pdf; 2005, 2007, 2008, 2011 revisions)
;;;;   wb-…-timeline_trading.html   NYSE timeline (hours: data/exchanges/XNYS.sexp)
;;;;   wb-…-1963_SSMkt_…pdf         SEC, Report of Special Study of Securities Markets (1963)
;;;;   fraser-cfc_<issue>-p<n>.pdf  Commercial and Financial Chronicle, "Transactions at the New
;;;;                                York Stock Exchange, Daily, Weekly and Yearly" (secondary)
;;;; Research notes: ~/.cache/cl-stack-calendars/exchanges/research/nyse/.
;;;;
;;;; Coverage starts 1953, the first full year of the five-day week. Saturday sessions ended
;;;; in 1952; before 1953 the NYSE list records Saturday closings only as it chose to (summer
;;;; Saturdays, wartime), has at least one wrong date in that era ("Dec. 12, 1950 (Sat)
;;;; Saturday before Christmas Eve": a Tuesday), and nothing independent checks it. Earlier
;;;; dates signal CALENDAR-OUT-OF-RANGE.
;;;;
;;;; Saturday holidays: "Traditionally, when a holiday falls on a Sunday, the NYSE closes the
;;;; succeeding Monday. On July 3, 1959, the Board adopted a policy that, when a holiday falls
;;;; on a Saturday, the Exchange will not be open for business on the preceding Friday, unless
;;;; it ends a monthly or yearly accounting period." Before the policy no weekday closed
;;;; (Fridays 1953-05-29, 1953-07-03 and 1959-05-29 traded, CFC). From 1959 to 1969 only the
;;;; yearly exception shows (Friday 1965-12-31 traded; Friday 1964-05-29, the last weekday of
;;;; May, read "Holiday" in the NYSE's transactions, CFC 1964-06-01 p. 36); the monthly one
;;;; first shows on 1970-05-29 (exchange_calendars). Hence Memorial Day 1960-1969 :NEAREST-WEEKDAY.
(:name "NYSE"
 :title "New York Stock Exchange trading holidays"
 :authority "NYSE, History of New York Stock Exchange Holidays and New York Stock Exchange Special Closings, 1885-date (revised through January 2011); NYSE Rule 7.2 (Holidays); NYSE holiday notices"
 :authority-uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
 :coverage (1953 nil)
 :rules
 ((:fixed "New Year's Day" 1 1 :from 1953 :observed :nyse-rule-7-2
   :authority "NYSE holiday history: New Year's Day 'Closed every year'; Sunday -> Monday; a Saturday New Year's Day leaves Friday Dec 31 open (yearly accounting period; 1965-12-31 traded). https://web.archive.org/web/20090325004309/http://www.nyse.com/pdfs/closings.pdf")
  (:fixed "Lincoln's Birthday" 2 12 :from 1953 :to 1953 :observed :sunday-to-monday
   :authority "NYSE holiday history: Lincoln's Birthday 'Closed every year, 1896-1953' (1968-02-12 is a special closing). https://web.archive.org/web/20090325004309/http://www.nyse.com/pdfs/closings.pdf")
  (:nth-weekday "Martin Luther King Jr. Day" 1 :monday 3 :from 1998
   :authority "NYSE holiday history: 'Closed all day beginning in 1998. Observed on the third Monday of January.'")
  (:fixed "Washington's Birthday" 2 22 :from 1953 :to 1959 :observed :sunday-to-monday
   :authority "NYSE holiday history: 'Closed every year'; Sunday -> Monday; no Saturday closing before the Board's 1959-07-03 policy (Saturday 1958-02-22 not observed)")
  (:fixed "Washington's Birthday" 2 22 :from 1960 :to 1970 :observed :nyse-rule-7-2
   :authority "NYSE Saturday policy of 1959-07-03 (Friday 1964-02-21 closed); Sunday -> Monday (1970-02-23)")
  (:nth-weekday "Washington's Birthday" 2 :monday 3 :from 1971
   :authority "NYSE holiday history: 'Observed on Mondays since 1971' (Pub. L. 90-363)")
  (:easter "Good Friday" -2 :from 1953
   :authority "NYSE holiday history: Good Friday 'Closed every year except 1898, 1906 and 1907'; NYSE Rule 7.2")
  (:fixed "Memorial Day" 5 30 :from 1953 :to 1959 :observed :sunday-to-monday
   :authority "NYSE holiday history: Decoration/Memorial Day 'Closed every year since 1873'; Sunday -> Monday; Saturday 1953-05-30 and 1959-05-30 closed no Friday (CFC 1953-06-01 p. 33, 1959-06-01 p. 36)")
  (:fixed "Memorial Day" 5 30 :from 1960 :to 1969 :observed :nearest-weekday
   :authority "NYSE Saturday policy of 1959-07-03; Friday 1964-05-29 closed though it ended May: the NYSE's transactions read 'Holiday' (CFC 1964-06-01 p. 36, https://fraser.stlouisfed.org/files/docs/publications/cfc/cfc_19640601.pdf#page=36)")
  (:fixed "Memorial Day" 5 30 :from 1970 :to 1970 :observed :nyse-rule-7-2
   :authority "NYSE Rule 7.2: Saturday 1970-05-30 not observed, Friday May 29 ended the month (exchange_calendars gold)")
  (:nth-weekday "Memorial Day" 5 :monday -1 :from 1971
   :authority "NYSE holiday history: 'Observed on Mondays since 1971' (Pub. L. 90-363, last Monday in May)")
  (:fixed "Juneteenth National Independence Day" 6 19 :from 2022 :observed :nyse-rule-7-2
   :authority "NYSE holiday schedule: Juneteenth from 2022 (NYSE notice 2021); Rule 7.2 observance")
  (:fixed "Independence Day" 7 4 :from 1953 :to 1958 :observed :sunday-to-monday
   :authority "NYSE holiday history: 'Closed every year'; Sunday -> Monday; Saturday 1953-07-04 closed no Friday (CFC 1953-07-06 p. 31)")
  (:fixed "Independence Day" 7 4 :from 1959 :observed :nyse-rule-7-2
   :authority "NYSE Saturday policy of 1959-07-03: Friday 1959-07-03 closed (CFC 1959-07-06 p. 33); NYSE Rule 7.2")
  (:nth-weekday "Labor Day" 9 :monday 1 :from 1953
   :authority "NYSE holiday history: Labor Day 'Closed every year, 1887-date'")
  (:fixed "Columbus Day" 10 12 :from 1953 :to 1953 :observed :sunday-to-monday
   :authority "NYSE holiday history: Columbus Day 'Closed every year, 1909-1953' (1953-10-12 Holiday, CFC 1953-10-19 p. 33)")
  (:computed "Election Day" nyse-election-day :from 1953 :to 1980
   :authority "NYSE holiday history: Election Day 'Closed every year through 1968. Closed presidential election years only, 1972-1980.'")
  (:fixed "Armistice Day" 11 11 :from 1953 :to 1953 :observed :sunday-to-monday
   :authority "NYSE holiday history: Armistice/Veteran's Day 'Closed all day, 1934-1953'; two minutes at 11:00 from 1954 (1953-11-11 Holiday, CFC 1953-11-16 p. 33)")
  (:nth-weekday "Thanksgiving Day" 11 :thursday 4 :from 1953
   :authority "NYSE holiday history: Thanksgiving Day 'Closed every year'; fourth Thursday of November, Pub. L. 77-379 (1941) https://www.govinfo.gov/content/pkg/STATUTE-55/pdf/STATUTE-55-Pg862-2.pdf")
  (:fixed "Christmas Day" 12 25 :from 1953 :to 1958 :observed :sunday-to-monday
   :authority "NYSE holiday history: 'Closed every year'; Sunday -> Monday (Saturday 1954-12-25: Friday Dec 24 is a special closing)")
  (:fixed "Christmas Day" 12 25 :from 1959 :observed :nyse-rule-7-2
   :authority "NYSE Saturday policy of 1959-07-03; NYSE Rule 7.2"))
 :notices
 (;; --- 1953-1969: NYSE Special Closings (first on nyse.com in the 2005-12-28 capture) ------
  (:title "NYSE special closing: Christmas Eve 1954" :year 1954
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "The NYSE list gives the day closed, not the date the Board decided it: :issued NIL. :published = first Wayback capture of the list on nyse.com, which has the entry (as has the January 2011 revision, :uri)."
   :closed (((1954 12 24) "Christmas Eve")))
  (:title "NYSE special closing: Christmas Eve 1956" :year 1956
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Board decision date not in the NYSE list: :issued NIL. :published = first Wayback capture of the list on nyse.com."
   :closed (((1956 12 24) "Christmas Eve")))
  (:title "NYSE special closing: Day after Christmas 1958" :year 1958
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Board decision date not in the NYSE list: :issued NIL. :published = first Wayback capture of the list on nyse.com."
   :closed (((1958 12 26) "Day after Christmas")))
  (:title "NYSE late open: severe snowstorm, 12 December 1960" :year 1960
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Same-day decision, not dated in the NYSE list: :issued NIL. :published = first Wayback capture of the list on nyse.com."
   :late-opens (((1960 12 12) (11 0) "Opened at 11:00 am - severe snowstorm")))
  (:title "NYSE special closing: Day before Decoration Day 1961" :year 1961
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Board decision date not in the NYSE list: :issued NIL. :published = first Wayback capture of the list on nyse.com."
   :closed (((1961 5 29) "Day before Decoration Day")))
  (:title "NYSE early close: assassination of President Kennedy, 22 November 1963" :year 1963
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Same-day decision: :issued NIL. :published = first Wayback capture of the list on nyse.com."
   :early-closes (((1963 11 22) (14 7) "Closed at 2:07 pm. Assassination of President John F. Kennedy")))
  (:title "NYSE special closing: funeral of President Kennedy" :year 1963
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Board decision date not in the NYSE list: :issued NIL. :published = first Wayback capture of the list on nyse.com. Secondary: Dow Jones averages for 25 Nov 1963 read 'Holiday' (CFC 1963-12-02 p. 38, https://fraser.stlouisfed.org/files/docs/publications/cfc/cfc_19631202.pdf#page=38)."
   :closed (((1963 11 25) "Funeral of President John F. Kennedy")))
  (:title "NYSE early close: funeral of former President Hoover, 23 October 1964" :year 1964
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Board decision date not in the NYSE list: :issued NIL. :published = first Wayback capture of the list on nyse.com."
   :early-closes (((1964 10 23) (14 0) "Closed at 2:00 pm - Funeral of former President Herbert C. Hoover")))
  (:title "NYSE late open: blackout, 10 November 1965" :year 1965
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Same-day decision: :issued NIL. :published = first Wayback capture of the list on nyse.com."
   :late-opens (((1965 11 10) (11 5) "Opened at 11:05 am due to blackout")))
  (:title "NYSE special closing: Christmas Eve 1965" :year 1965
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "'Christmas Eve. Closed all day.' The 1959 Saturday policy also closes this Friday (Christmas on Saturday). Board decision date not in the list: :issued NIL."
   :closed (((1965 12 24) "Christmas Eve")))
  (:title "NYSE early closes: transit strike, January 1966" :year 1966
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "'Jan. 6-14, 1966 (Thu-Fri) 2:00 pm closing due to transit strike (seven days).' Decision date not in the list: :issued NIL."
   :early-closes (((1966 1 6) (14 0) "transit strike") ((1966 1 7) (14 0) "transit strike")
                  ((1966 1 10) (14 0) "transit strike") ((1966 1 11) (14 0) "transit strike")
                  ((1966 1 12) (14 0) "transit strike") ((1966 1 13) (14 0) "transit strike")
                  ((1966 1 14) (14 0) "transit strike")))
  (:title "NYSE late open and early close: snowstorm, 7 February 1967" :year 1967
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Same-day decision: :issued NIL. :published = first Wayback capture of the list on nyse.com."
   :late-opens (((1967 2 7) (10 15) "Opened at 10:15 am - snowstorm"))
   :early-closes (((1967 2 7) (14 0) "Closed at 2:00 pm - snowstorm")))
  (:title "NYSE early closes: back-office work load, August 1967" :year 1967
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "'Aug. 8-18, 1967 (Tue-Fri) 2:00 pm closing (nine days) due to back office work load.' Decision date not in the list: :issued NIL."
   :early-closes (((1967 8 8) (14 0) "back office work load") ((1967 8 9) (14 0) "back office work load")
                  ((1967 8 10) (14 0) "back office work load") ((1967 8 11) (14 0) "back office work load")
                  ((1967 8 14) (14 0) "back office work load") ((1967 8 15) (14 0) "back office work load")
                  ((1967 8 16) (14 0) "back office work load") ((1967 8 17) (14 0) "back office work load")
                  ((1967 8 18) (14 0) "back office work load")))
  (:title "NYSE early closes: back-office work load, January-March 1968" :year 1968
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "'Jan. 22-Mar. 1, 1968 (Mon-Fri) 2:00 pm closing due to back office work load. 3:30 close resumed March 4.' Every session of the run; Feb 12 and Feb 22 were closed. Decision date not in the list: :issued NIL."
   :early-closes (((1968 1 22) (14 0) "back office") ((1968 1 23) (14 0) "back office")
                  ((1968 1 24) (14 0) "back office") ((1968 1 25) (14 0) "back office")
                  ((1968 1 26) (14 0) "back office") ((1968 1 29) (14 0) "back office")
                  ((1968 1 30) (14 0) "back office") ((1968 1 31) (14 0) "back office")
                  ((1968 2 1) (14 0) "back office") ((1968 2 2) (14 0) "back office")
                  ((1968 2 5) (14 0) "back office") ((1968 2 6) (14 0) "back office")
                  ((1968 2 7) (14 0) "back office") ((1968 2 8) (14 0) "back office")
                  ((1968 2 9) (14 0) "back office") ((1968 2 13) (14 0) "back office")
                  ((1968 2 14) (14 0) "back office") ((1968 2 15) (14 0) "back office")
                  ((1968 2 16) (14 0) "back office") ((1968 2 19) (14 0) "back office")
                  ((1968 2 20) (14 0) "back office") ((1968 2 21) (14 0) "back office")
                  ((1968 2 23) (14 0) "back office") ((1968 2 26) (14 0) "back office")
                  ((1968 2 27) (14 0) "back office") ((1968 2 28) (14 0) "back office")
                  ((1968 2 29) (14 0) "back office") ((1968 3 1) (14 0) "back office")))
  (:title "NYSE special closing: Lincoln's Birthday 1968" :year 1968
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "'Lincoln's Birthday. Trading Floor closed but offices remained open.' Board decision date not in the list: :issued NIL."
   :closed (((1968 2 12) "Lincoln's Birthday")))
  (:title "NYSE special closing: National Day of Mourning for Martin Luther King, Jr." :year 1968
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Board decision date not in the NYSE list: :issued NIL. :published = first Wayback capture of the list on nyse.com."
   :closed (((1968 4 9) "National Day of Mourning for Martin Luther King, Jr.")))
  (:title "NYSE four-day weeks: paperwork crisis, 12 June - 31 December 1968" :year 1968
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "'June 12-Dec. 31, 1968 (Wed-Tue) Four day week (closed on Wednesdays or regular holiday) - Paperwork Crisis.' Every Wednesday of a week with no other closed weekday. Weeks with a holiday traded Wednesday: 3 Jul and 4 Sep traded (CFC 1968-07-08 p. 28, 1968-09-09 p. 35). Decision date not in the list: :issued NIL."
   :closed (((1968 6 12) "Paperwork crisis (four-day week)") ((1968 6 19) "Paperwork crisis (four-day week)")
            ((1968 6 26) "Paperwork crisis (four-day week)") ((1968 7 10) "Paperwork crisis (four-day week)")
            ((1968 7 17) "Paperwork crisis (four-day week)") ((1968 7 24) "Paperwork crisis (four-day week)")
            ((1968 7 31) "Paperwork crisis (four-day week)") ((1968 8 7) "Paperwork crisis (four-day week)")
            ((1968 8 14) "Paperwork crisis (four-day week)") ((1968 8 21) "Paperwork crisis (four-day week)")
            ((1968 8 28) "Paperwork crisis (four-day week)") ((1968 9 11) "Paperwork crisis (four-day week)")
            ((1968 9 18) "Paperwork crisis (four-day week)") ((1968 9 25) "Paperwork crisis (four-day week)")
            ((1968 10 2) "Paperwork crisis (four-day week)") ((1968 10 9) "Paperwork crisis (four-day week)")
            ((1968 10 16) "Paperwork crisis (four-day week)") ((1968 10 23) "Paperwork crisis (four-day week)")
            ((1968 10 30) "Paperwork crisis (four-day week)") ((1968 11 20) "Paperwork crisis (four-day week)")
            ((1968 12 4) "Paperwork crisis (four-day week)") ((1968 12 11) "Paperwork crisis (four-day week)")
            ((1968 12 18) "Paperwork crisis (four-day week)")))
  (:title "NYSE four-day week: Veterans Day 1968 in place of Wednesday 13 November" :year 1968
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "The NYSE list's 'closed on Wednesdays or regular holiday' does not name this day. Secondary: the NYSE's transactions for the week ended 15 Nov 1968 read 'Holiday' on Mon 11 Nov and 15,668,796 shares on Wed 13 Nov (CFC 1968-11-18 p. 32, https://fraser.stlouisfed.org/files/docs/publications/cfc/cfc_19681118.pdf#page=32). Veterans Day was a legal holiday, so the week's closed day; :issued NIL."
   :closed (((1968 11 11) "Veterans Day (four-day week)")))
  (:title "NYSE special closing: Day after Independence Day 1968" :year 1968
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Board decision date not in the NYSE list: :issued NIL. :published = first Wayback capture of the list on nyse.com."
   :closed (((1968 7 5) "Day after Independence Day")))
  (:title "NYSE special closing and late open: heavy snow, February 1969" :year 1969
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Same-day decisions: :issued NIL. :published = first Wayback capture of the list on nyse.com."
   :closed (((1969 2 10) "Heavy snow"))
   :late-opens (((1969 2 11) (11 0) "Opened at 11:00 am - heavy snow")))
  (:title "NYSE special closing: funeral of former President Eisenhower" :year 1969
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Board decision date not in the NYSE list: :issued NIL. :published = first Wayback capture of the list on nyse.com."
   :closed (((1969 3 31) "Funeral of former President Dwight D. Eisenhower")))
  (:title "NYSE late open: storm, 2 June 1969" :year 1969
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Same-day decision: :issued NIL. :published = first Wayback capture of the list on nyse.com."
   :late-opens (((1969 6 2) (10 45) "Opened at 10:45 am. Delays due to storm")))
  (:title "NYSE special closing: National Day of Participation for the lunar exploration" :year 1969
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Board decision date not in the NYSE list: :issued NIL. :published = first Wayback capture of the list on nyse.com."
   :closed (((1969 7 21) "National Day of Participation for the lunar exploration")))
  ;; --- 1970 on -----------------------------------------------------------------------------
  (:title "NYSE special closing: funeral of former President Truman" :year 1972
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Board decision date not in the NYSE list: :issued NIL. :published = first Wayback capture of the list on nyse.com."
   :closed (((1972 12 28) "Funeral of former President Harry S. Truman")))
  (:title "NYSE special closing: funeral of former President Johnson" :year 1973
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Board decision date not in the NYSE list: :issued NIL. :published = first Wayback capture of the list on nyse.com."
   :closed (((1973 1 25) "Funeral of former President Lyndon B. Johnson")))
  (:title "NYSE special closing: New York City blackout, 14 July 1977" :year 1977
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Same-day decision: :issued NIL. :published = first Wayback capture of the list on nyse.com."
   :closed (((1977 7 14) "New York City blackout")))
  (:title "NYSE special closing: Hurricane Gloria" :year 1985
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Decision date not in the NYSE list: :issued NIL. :published = first Wayback capture of the list on nyse.com."
   :closed (((1985 9 27) "Hurricane Gloria")))
  (:title "NYSE special closing: funeral of former President Nixon" :year 1994
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Board decision date not in the NYSE list: :issued NIL. :published = first Wayback capture of the list on nyse.com."
   :closed (((1994 4 27) "Funeral of former President Richard M. Nixon")))
  (:title "NYSE special closing: September 11 attacks" :year 2001
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "'Sept. 11-14, 2001 (Tue-Fri) Closed following the terrorist attack on the World Trade Center.' Daily decisions, not dated in the list: :issued NIL."
   :closed (((2001 9 11) "September 11 attacks") ((2001 9 12) "September 11 attacks")
            ((2001 9 13) "September 11 attacks") ((2001 9 14) "September 11 attacks")))
  (:title "NYSE special closing: National Day of Mourning for former President Reagan" :year 2004
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2005 12 28) :published-uri "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Decision date not in the NYSE list: :issued NIL. :published = first Wayback capture of the list on nyse.com."
   :closed (((2004 6 11) "National Day of Mourning for former President Ronald W. Reagan")))
  (:title "NYSE special closing: National Day of Mourning for former President Ford" :year 2007
   :uri "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
   :issued nil :issued-uri nil
   :published (2007 2 11) :published-uri "https://web.archive.org/web/20070211091228/http://www.nyse.com:80/pdfs/closings.pdf"
   :published-in "NYSE, New York Stock Exchange Special Closings, 1885-date (nyse.com/pdfs/closings.pdf)"
   :dates-note "Decision date not in the NYSE list: :issued NIL. :published = first Wayback capture of the list with this entry."
   :closed (((2007 1 2) "National Day of Mourning for former President Gerald R. Ford")))
  (:title "NYSE Euronext Statement on Opening of U.S. Markets on Wednesday, Oct. 31, 2012 (Hurricane Sandy)" :year 2012
   :uri "https://web.archive.org/web/20121102000616/http://www.nyse.com:80/press/1351545708685.html"
   :issued (2012 10 30) :issued-uri "https://web.archive.org/web/20121102000616/http://www.nyse.com:80/press/1351545708685.html"
   :published (2012 10 30) :published-uri "https://web.archive.org/web/20121102000616/http://www.nyse.com:80/press/1351545708685.html"
   :published-in "NYSE Euronext press release (nyse.com/press)"
   :dates-note "Statement of 2012-10-30 reopening on Wed 31 Oct after the two-day closure. The closing announcements of 28 and 29 Oct are not archived on nyse.com."
   :closed (((2012 10 29) "Hurricane Sandy") ((2012 10 30) "Hurricane Sandy")))
  (:title "New York Stock Exchange to Honor President George H. W. Bush" :year 2018
   :uri "https://ir.theice.com/press/news-details/2018/New-York-Stock-Exchange-to-Honor-President-George-H-W-Bush/default.aspx"
   :issued (2018 12 1) :issued-uri "https://ir.theice.com/press/news-details/2018/New-York-Stock-Exchange-to-Honor-President-George-H-W-Bush/default.aspx"
   :published (2018 12 1) :published-uri "https://ir.theice.com/press/news-details/2018/New-York-Stock-Exchange-to-Honor-President-George-H-W-Bush/default.aspx"
   :published-in "Intercontinental Exchange press release (ir.theice.com)" :dates-note nil
   :closed (((2018 12 5) "National Day of Mourning for President George H. W. Bush")))
  (:title "The New York Stock Exchange Will Close Markets on January 9 to Honor the Passing of Former President Jimmy Carter on National Day of Mourning" :year 2025
   :uri "https://ir.theice.com/press/news-details/2024/The-New-York-Stock-Exchange-Will-Close-Markets-on-January-9-to-Honor-the-Passing-of-Former-President-Jimmy-Carter-on-National-Day-of-Mourning/default.aspx"
   :issued (2024 12 30) :issued-uri "https://ir.theice.com/press/news-details/2024/The-New-York-Stock-Exchange-Will-Close-Markets-on-January-9-to-Honor-the-Passing-of-Former-President-Jimmy-Carter-on-National-Day-of-Mourning/default.aspx"
   :published (2024 12 30) :published-uri "https://ir.theice.com/press/news-details/2024/The-New-York-Stock-Exchange-Will-Close-Markets-on-January-9-to-Honor-the-Passing-of-Former-President-Jimmy-Carter-on-National-Day-of-Mourning/default.aspx"
   :published-in "Intercontinental Exchange press release (ir.theice.com)" :dates-note nil
   :closed (((2025 1 9) "National Day of Mourning for former President Jimmy Carter")))))
