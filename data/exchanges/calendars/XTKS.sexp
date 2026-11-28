;;;; XTKS exchange trading-day calendar (#49).
;;;; Sources cached under ~/.cache/cl-stack-calendars/exchanges/xtks/.
;;;; Finding: TSE Business Regulations Rule 3 closes the exchange on Sundays, Saturdays, national
;;;; holidays (incl. substitute holidays and the "day between two national holidays") and on
;;;; 1-3 January and 31 December. National holidays = JP civil calendar (base). The three year-end /
;;;; new-year days are the only exchange-only closures. One-off: 2020-10-01 full-day trading halt
;;;; (arrowhead failure) -- no session that day.
;;;; Year lists: only 2026 and 2027 are published (JPX Market Holidays page). 2000-2025: no yearly
;;;; list reachable (web.archive.org offline from this sandbox, curl and WebFetch); the rule text is
;;;; the evidence. ec agrees with rule+base on every Mon-Fri 2000-2028.
(:name "XTKS"
 :title "Tokyo Stock Exchange trading days"
 :authority "Tokyo Stock Exchange, Business Regulations Rule 3 (Non-business days), reference translation as of 2025-05-07"
 :authority-uri "https://www.jpx.co.jp/english/rules-participants/rules/regulations/tvdivq0000001vyt-att/business_regs_20250507.pdf"
 :bases ((:calendar "JP" :from nil :to nil
          :authority "TSE Business Regulations Rule 3(1)-(5): Sundays; National holidays; if a national holiday falls on Sunday, the first non-national holiday after it; the day between two national holidays; Saturdays. https://www.jpx.co.jp/english/rules-participants/rules/regulations/tvdivq0000001vyt-att/business_regs_20250507.pdf ; JPX Market Holidays page: \"JPX markets are closed on Saturdays, Sundays, national holidays, and on the dates indicated below\" https://www.jpx.co.jp/english/corporate/about-jpx/calendar/index.html"))
 :rules ((:fixed "New Year holiday (Jan 2)" 1 2
          :authority "TSE Business Regulations Rule 3(6) \"The first three (3) days of the year\" https://www.jpx.co.jp/english/rules-participants/rules/regulations/tvdivq0000001vyt-att/business_regs_20250507.pdf")
         (:fixed "New Year holiday (Jan 3)" 1 3
          :authority "TSE Business Regulations Rule 3(6) https://www.jpx.co.jp/english/rules-participants/rules/regulations/tvdivq0000001vyt-att/business_regs_20250507.pdf")
         (:fixed "Year-end holiday (Dec 31)" 12 31
          :authority "TSE Business Regulations Rule 3(7) \"December 31st\" https://www.jpx.co.jp/english/rules-participants/rules/regulations/tvdivq0000001vyt-att/business_regs_20250507.pdf"))
 :gaps ((:years "2000-2025"
         :note "No TSE/JPX yearly holiday list found. JPX publishes only the current and next year (Market Holidays page); old tse.or.jp pages exist only on web.archive.org, which was unreachable (curl: 'Temporarily Offline'; WebFetch: blocked). Evidence: Business Regulations Rule 3 (same rule text since before 2000 per ec agreement; no historical rule text fetched). ec matches rule+JP base on every weekday."))
 :notices
 ((:title "TSE Business Regulations (reference translation, 2025-05-07): Rule 3 Non-business days; Rule 2 trading hours"
   :uri "https://www.jpx.co.jp/english/rules-participants/rules/regulations/tvdivq0000001vyt-att/business_regs_20250507.pdf"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.jpx.co.jp/english/rules-participants/rules/regulations/index.html"
   :published-in "JPX website, Rules and Regulations (English reference translations)"
   :dates-note "File name gives the consolidation date 2025-05-07; the rule's original adoption date is not stated in the translation."
   :closed () :open () :early-closes () :late-opens ())
  (:title "TSE Trading halt due to system glitch (Fourth report): all listed symbols halted for the entire day"
   :uri "https://www.jpx.co.jp/english/news/1030/20201001-04.html"
   :issued (2020 10 1) :issued-uri "https://www.jpx.co.jp/english/news/1030/20201001-04.html"
   :published (2020 10 1) :published-uri "https://www.jpx.co.jp/english/news/1030/20201001-04.html"
   :published-in "JPX Market News"
   :dates-note nil
   :closed (((2020 10 1) "arrowhead system failure: trading halted all day (not a declared non-business day; no session)"))
   :open () :early-closes () :late-opens ()
   :note "Earlier reports same day: https://www.jpx.co.jp/english/news/1030/20201001-01.html (Third report). Cause: https://www.jpx.co.jp/english/corporate/news/news-releases/0060/20201005-01.html")
  (:title "TSE: Last/First business day of the year 2009/2010 - abolition of half-holidays (morning-session-only days)"
   :uri "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124"
   :issued (2008 3 3) :issued-uri "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124"
   :published (2008 3 3) :published-uri "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124"
   :published-in "TSE announcement (English), as republished by Mondo Visione; TSE original not found on jpx.co.jp"
   :confidence :secondary
   :dates-note "TSE text: TSE would 'abolish Half-Holidays on the Last/First Business Day of the year'; from year end 2009 the last business day (Dec 30) and from 2010 the first (Jan 4) are full trading days. Before that the first and last trading days (Daihakkai/Dainokai) were half-holidays with a morning session only (09:00-11:00 in that era). Dates below = first/last sessions 2000-2009 per the calendar."
   :closed () :open ()
   :early-closes (((2000 1 4) (11 0) "Daihakkai half-holiday: morning session only")
                  ((2000 12 29) (11 0) "Dainokai half-holiday: morning session only")
                  ((2001 1 4) (11 0) "Daihakkai half-holiday") ((2001 12 28) (11 0) "Dainokai half-holiday")
                  ((2002 1 4) (11 0) "Daihakkai half-holiday") ((2002 12 30) (11 0) "Dainokai half-holiday")
                  ((2003 1 6) (11 0) "Daihakkai half-holiday") ((2003 12 30) (11 0) "Dainokai half-holiday")
                  ((2004 1 5) (11 0) "Daihakkai half-holiday") ((2004 12 30) (11 0) "Dainokai half-holiday")
                  ((2005 1 4) (11 0) "Daihakkai half-holiday") ((2005 12 30) (11 0) "Dainokai half-holiday")
                  ((2006 1 4) (11 0) "Daihakkai half-holiday") ((2006 12 29) (11 0) "Dainokai half-holiday")
                  ((2007 1 4) (11 0) "Daihakkai half-holiday") ((2007 12 28) (11 0) "Dainokai half-holiday")
                  ((2008 1 4) (11 0) "Daihakkai half-holiday") ((2008 12 30) (11 0) "Dainokai half-holiday")
                  ((2009 1 5) (11 0) "Daihakkai half-holiday (last one; 2009-12-30 Dainokai was full day)"))
   :late-opens ())
  (:title "JPX Market Holidays 2026" :year 2026
   :uri "https://www.jpx.co.jp/english/corporate/about-jpx/calendar/index.html"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.jpx.co.jp/english/corporate/about-jpx/calendar/index.html"
   :published-in "JPX website, Market Holidays"
   :dates-note "Page carries no issue date (fetched 2026-11-28). Lists Jan 1, Jan 2 and 3 (Market Holiday), the national holidays incl. May 6 (observed) and Sep 22 (holiday under Rule 3 para 3 of the Act on National Holidays), Dec 31 (Market Holiday). Confirms rules + JP base."
   :closed () :open () :early-closes () :late-opens ())
  (:title "JPX Market Holidays 2027" :year 2027
   :uri "https://www.jpx.co.jp/english/corporate/about-jpx/calendar/index.html"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.jpx.co.jp/english/corporate/about-jpx/calendar/index.html"
   :published-in "JPX website, Market Holidays"
   :dates-note "Page carries no issue date (fetched 2026-11-28). Lists Jan 1-3, national holidays incl. Mar 22 (observed), Dec 31. Confirms rules + JP base."
   :closed () :open () :early-closes () :late-opens ())))
