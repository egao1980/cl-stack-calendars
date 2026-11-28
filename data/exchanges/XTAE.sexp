;;;; Tel Aviv Stock Exchange (MIC XTAE): shares, index/Tamar group. Holidays and the
;;;; weekend change of 2026-01-04 (Sun-Thu -> Mon-Fri): calendars/XTAE.sexp.
;;;; Open = start of the opening-auction window; close = end of continuous trading
;;;; (pre-closing); the closing auction and trade-at-last follow.
(
 :mic "XTAE"
 :name "Tel Aviv Stock Exchange"
 :zone "Asia/Jerusalem"
 :calendar "XTAE"
 :kind :equity
 :weekend (5 6)
 :source "TASE notices 2008-12-18, 2013 and 2020 hours changes; TASE Trading and Vacation Schedules page"
 :eras (
   (:from (1990 1 1) :to (2008 12 31)
    :sessions ((:open (9 45) :close (17 17)))
    :weekend (5 6)
    :authority "'Previous' timetable in the TASE notice of 2008-12-18 (TA-100 opening 09:45-09:50, pre-closing 17:16-17:17; Mondo Visione copy, secondary) https://mondovisione.com/news/start-of-new-tel-aviv-stock-exchange-trading-hours-2011124 . The start of this timetable is not known.")
   (:from (2009 1 1) :to (2013 6 13)
    :sessions ((:open (9 45) :close (16 17)))
    :weekend (5 6)
    :authority "TASE notice 'Start of new TASE trading hours' (2008-12-18): from 1 Jan 2009 pre-closing 16:16-16:17 (Mondo Visione copy) https://mondovisione.com/news/start-of-new-tel-aviv-stock-exchange-trading-hours-2011124")
   (:from (2013 6 16) :to (2020 1 30)
    :sessions ((:open (9 45) :close (17 15)))
    :sunday ((:open (9 45) :close (16 15)))
    :weekend (5 6)
    :authority "From 16 Jun 2013 Monday-Thursday trading ends an hour later (pre-closing 17:14-17:15), Sunday at 16:15 (Globes 2013-05-23, secondary) https://en.globes.co.il/en/article-1000846491")
   (:from (2020 2 2) :to (2020 3 5)
    :sessions ((:open (9 59) :close (17 15)))
    :sunday ((:open (9 59) :close (16 15)))
    :weekend (5 6)
    :authority "Opening auction of index shares at 10:00 (window 09:59-10:00) from 2 Feb 2020 (WFE Focus, Feb 2020) https://focus.world-exchanges.org/articles/tase-announces-new-trading-hours")
   (:from (2020 3 8) :to (2026 1 1)
    :sessions ((:open (9 59) :close (17 15)))
    :sunday ((:open (9 59) :close (15 40)))
    :weekend (5 6)
    :authority "Sundays shortened by 35 minutes from 8 Mar 2020, pre-closing 15:39-15:40 (WFE Focus, Feb 2020); last Sunday session 2025-12-28")
   (:from (2026 1 5)
    :sessions ((:open (9 59) :close (17 15)))
    :friday ((:open (9 59) :close (13 35)))
    :weekend (6 7)
    :authority "Trading Monday to Friday from the week of 5 Jan 2026 (Board 18 Jun 2025, ISA 30 Jul 2025): Mon-Thu pre-closing 17:14-17:15, Friday 13:34-13:35 https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule ; https://www.tase.co.il/en/content/about/tradingdays_change")))
