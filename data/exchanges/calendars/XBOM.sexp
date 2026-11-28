;;;; XBOM — BSE Ltd. equity segment trading days.
;;;; BSE and NSE notify identical equity trading-holiday lists each December (both follow the Maharashtra
;;;; state holiday list; ad-hoc Mumbai poll days are declared by both). The only BSE documents that could be
;;;; read from this sandbox are the Equity Segment Master Circular (holiday list 2026) and notice 20261019-9
;;;; (Muhurat 2026); bseindia.com notice pages answer 403 to WebFetch and the notice-search API was not used.
;;;; Their 2026 list is identical to NSE/CMTR/71775 + NSE/CMTR/72260 (incl. "MCGM Election Day January 15, 2026").
;;;; => XBOM includes the XNSE file (rules + NSE notices, lists 2009-2026) and adds the BSE confirmations below.
;;;; Per-year BSE notice numbers known from search results (not read): 20191211-2 (2020), 20201210-7 (2021),
;;;; 20221208-31 (2023), 20231212-40 (2024), 20240119-39 (22 Jan 2024 holiday).
(:name "XBOM"
 :title "BSE equity segment trading days"
 :authority "BSE notice \"Trading Holidays for the Calendar Year YYYY\" (Equity, Equity Derivatives and SLB segments); BSE Equity Segment Master Circular s. 2.2 \"Trading Holidays\""
 :authority-uri "https://www.bseindia.com/Downloads/UploadDocs/Notices/Attach/Equity_Master_Circular$b0cfd71f-2ac1-4205-b6c5-5085f322e1ae.pdf"
 :include ("XNSE")
 :rules ()
 :notices
 ((:title "BSE Equity Segment Master Circular, s. 2.2 Trading Holidays (calendar year 2026)"
   :year 2026
   :uri "https://www.bseindia.com/Downloads/UploadDocs/Notices/Attach/Equity_Master_Circular$b0cfd71f-2ac1-4205-b6c5-5085f322e1ae.pdf"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.bseindia.com/Downloads/UploadDocs/Notices/Attach/Equity_Master_Circular$b0cfd71f-2ac1-4205-b6c5-5085f322e1ae.pdf"
   :published-in "BSE Equity Segment Master Circular (PDF, bseindia.com)"
   :dates-note "Master circular is undated in the extracted text (its circular index runs to notice 20250930-74; the holiday section heading says 'Calendar Year 2025' but lists 2026 dates). Weekday holidays: 15 Jan (MCGM Election Day), 26 Jan, 3 Mar, 26 Mar, 31 Mar, 3 Apr, 14 Apr, 1 May, 28 May, 26 Jun, 14 Sep, 2 Oct, 20 Oct, 10 Nov, 24 Nov, 25 Dec. Weekend: 15 Feb, 21 Mar, 15 Aug, 8 Nov (Diwali Laxmi Pujan, Muhurat). Identical to NSE 2026."
   :closed () :open () :early-closes () :late-opens ())
  (:title "BSE notice 20261019-9: Muhurat Trading Session for Equity Segment on account of Diwali Laxmi Pujan"
   :year 2026
   :uri "https://www.bseindia.com/downloads/UploadDocs/Notices/20261019-9/20261019-9.pdf"
   :issued (2026 10 19) :issued-uri "https://www.bseindia.com/downloads/UploadDocs/Notices/20261019-9/20261019-9.pdf"
   :published (2026 10 19) :published-uri "https://www.bseindia.com/downloads/UploadDocs/Notices/20261019-9/20261019-9.pdf"
   :published-in "BSE notice 20261019-9 (Trading Operations)"
   :dates-note "Sunday 2026-11-08: pre-open 14:05-14:20, continuous trading 14:20-15:30, closing 15:30-15:50. Special session on a weekend holiday (:special-sessions); the day stays a holiday."
   :closed () :open () :early-closes () :late-opens ()
   :special-sessions (((2026 11 8) ((:open (14 20) :close (15 30))) "Diwali Muhurat trading: continuous trading 14:20-15:30 (pre-open 14:05-14:20, closing 15:30-15:50)"))))
 :gaps ((:years "2000-2025" :note "No BSE yearly holiday notice could be read (bseindia.com notice pages 403; notice PDFs under /downloads/UploadDocs/Notices/<id>/ exist only for recent notices). BSE is assumed to equal NSE (included XNSE); ec uses one calendar for both.")))
