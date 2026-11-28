;;;; XIMC — Multi Commodity Exchange of India (MCX) trading days.
;;;; mcxindia.com answers 403 to curl and WebFetch from this sandbox, so no MCX page could be read directly.
;;;; The only MCX document read is circular MCX/TRD/814/2024 (holidays 2025), via a broker-hosted copy
;;;; (cached: ~/.cache/cl-stack-calendars/exchanges/ximc/mcx-814-2024.pdf) => :confidence :secondary.
;;;;
;;;; What a "trading day" means at MCX: MCX lists every holiday with two columns, Morning Session
;;;; (9:00 AM to 5:00 PM) and Evening Session (5:00 PM to 11:30/11:55 PM). Most Indian holidays close only the
;;;; morning session; the evening session trades. Proposed semantics for this calendar:
;;;;   - day CLOSED  = both sessions closed (only these go to :closed);
;;;;   - morning closed, evening open  = session with a late open at 17:00 (:late-opens);
;;;;   - morning open, evening closed  = session with an early close at 17:00 (:early-closes).
;;;; Muhurat (Diwali Laxmi Pujan) is an evening special session on an otherwise closed day; it cannot be
;;;; expressed (no "special session with own hours" in the notice format), so the day stays closed and
;;;; the Muhurat is recorded in :note.
;;;; MCX does NOT follow the NSE/BSE cash list: e.g. 2025-01-01 is an MCX evening holiday but a normal
;;;; NSE/BSE trading day; 2025-04-10/04-14/05-01 are NSE closures but MCX evening sessions.
(:name "XIMC"
 :title "MCX (Multi Commodity Exchange of India) trading days"
 :authority "MCX circular \"Trading Holidays for the Calendar Year YYYY\" (MCX/TRD/...), issued each December under the Exchange's Rules, Bye-laws and Business Rules"
 :authority-uri "https://www.mcxindia.com/market-operations/trading-survelliance/trading-holidays"
 :bases ((:calendar "IN" :from nil :to (2024 12 31)
          :authority "Stand-in only: no MCX holiday circular could be read for 2003-2024 (mcxindia.com HTTP 403), so the IN Central Government holidays close the exchange in those years. MCX closes most holidays for the morning session only, so these years are approximate.")
         (:calendar "IN" :from (2026 1 1) :to nil
          :authority "Stand-in only, as for 2003-2024: the 2026 circular MCX/TRD/636/2025 was not readable."))
 :rules ()
 :notices
 ((:title "MCX circular MCX/TRD/814/2024: Trading Holidays for the Calendar Year 2025"
   :year 2025
   :uri "https://www.sharekhan.com/MediaGalary/Newsletter/circular-814-2024.pdf"
   :issued (2024 12 13) :issued-uri "https://www.sharekhan.com/MediaGalary/Newsletter/circular-814-2024.pdf"
   :published (2024 12 13) :published-uri "https://www.sharekhan.com/MediaGalary/Newsletter/circular-814-2024.pdf"
   :published-in "MCX circular MCX/TRD/814/2024 (copy hosted by a member broker; mcxindia.com unreachable)"
   :confidence :secondary
   :dates-note "Copy of the MCX circular, not fetched from mcxindia.com. Weekend holidays listed: 26 Jan, 6 Apr, 7 Jun, 6 Jul (no effect)."
   :closed (((2025 4 18) "Good Friday (morning and evening closed)")
            ((2025 8 15) "Independence Day (morning and evening closed)")
            ((2025 10 2) "Mahatma Gandhi Jayanti / Dassera (morning and evening closed)")
            ((2025 10 21) "Diwali Laxmi Pujan (morning and evening closed; Muhurat trading in the evening)")
            ((2025 12 25) "Christmas (morning and evening closed)"))
   :open ()
   :early-closes (((2025 1 1) (17 0) "New Year Day: morning open, evening session closed"))
   :late-opens (((2025 2 26) (17 0) "Mahashivratri: morning closed, evening open")
                ((2025 3 14) (17 0) "Holi (2nd day): morning closed, evening open")
                ((2025 3 31) (17 0) "Id-Ul-Fitr: morning closed, evening open")
                ((2025 4 10) (17 0) "Shri Mahavir Jayanti: morning closed, evening open")
                ((2025 4 14) (17 0) "Dr. Baba Saheb Ambedkar Jayanti: morning closed, evening open")
                ((2025 5 1) (17 0) "Maharashtra Day: morning closed, evening open")
                ((2025 8 27) (17 0) "Ganesh Chaturthi: morning closed, evening open")
                ((2025 10 22) (17 0) "Diwali-Balipratipada: morning closed, evening open")
                ((2025 11 5) (17 0) "Guru Nanak Jayanti: morning closed, evening open"))
   :note "Muhurat trading on Tue 2025-10-21 (timings notified separately, not retrieved)."))
 :gaps ((:years "2003-2024, 2026-2028" :note "mcxindia.com (circulars, holiday page) returns HTTP 403 to curl and WebFetch; no Wayback copy of an MCX holiday circular was retrieved (web.archive.org was mostly unreachable). Circular numbers known from secondary pages: MCX/TRD/636/2025 (15 Dec 2025, holidays 2026), MCX/TRD/017/2026 (15 Jan 2026 municipal-election holiday, morning session). Needs a run with access to mcxindia.com.")))
