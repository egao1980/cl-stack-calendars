;;;; XMAD draft (cl-stack-calendars #49). Rules verified 2024-2027 only. Earlier eras (ec, unsourced here):
;;;; 2000-2004 Spanish national holidays; 2005-2006 + Epiphany; 2007-2010 also 24/31 Dec closed; 2021 24/31 Dec closed.
;;;; Early close 14:00 on 24 and 31 Dec (weekdays) - verified 2024-2027.

(:name "XMAD"
 :title "BME / Bolsa de Madrid (SIBE) trading days"
 :authority "BME, yearly trading-calendar press release and trading calendar page (Sociedad de Bolsas operating instruction)" :authority-uri "https://www.bolsasymercados.es/en/bme-exchange/trading/trading-calendar.html"
 :rules ((:fixed "New Year's Day" 1 1 :authority "BME trading calendars 2024-2027")
         (:easter "Good Friday" -2 :authority "BME trading calendars 2024-2027")
         (:easter "Easter Monday" 1 :authority "BME trading calendars 2024-2027")
         (:fixed "Labour Day" 5 1 :authority "BME trading calendars 2024-2027")
         (:fixed "Christmas Day" 12 25 :authority "BME trading calendars 2024-2027")
         (:fixed "St. Stephen's Day" 12 26 :authority "BME trading calendars 2024-2026"))
 :notices (
   (:title "Spanish Financial Markets 2024 trading calendar" :year 2024
    :uri "https://www.bolsasymercados.es/en/media/press-releases/2023/spanish-financial-markets-2024-trading-calendar.html"
    :issued (2023 11 23) :issued-uri "https://www.bolsasymercados.es/en/media/press-releases/2023/spanish-financial-markets-2024-trading-calendar.html"
    :published (2023 11 23) :published-uri "https://www.bolsasymercados.es/en/media/press-releases/2023/spanish-financial-markets-2024-trading-calendar.html"
    :published-in "BME press release"
    :dates-note nil
    :closed ()
    :open ()
    :early-closes (((2024 12 24) (14 0) "market open until 14:00")
             ((2024 12 31) (14 0) "market open until 14:00"))
    :late-opens ()
    :note "Closed 1 Jan, 29 Mar, 1 Apr, 1 May, 25 Dec, 26 Dec. (Body text says 'calendar for 2023' - a typo; dates are 2024.)")
   (:title "Spanish Financial Markets 2025 trading calendar" :year 2025
    :uri "https://www.bolsasymercados.es/en/media/press-releases/2024/spanish-financial-markets-2025-trading-calendar.html"
    :issued (2024 11 29) :issued-uri "https://www.bolsasymercados.es/en/media/press-releases/2024/spanish-financial-markets-2025-trading-calendar.html"
    :published (2024 11 29) :published-uri "https://www.bolsasymercados.es/en/media/press-releases/2024/spanish-financial-markets-2025-trading-calendar.html"
    :published-in "BME press release"
    :dates-note nil
    :closed ()
    :open ()
    :early-closes (((2025 12 24) (14 0) "market open until 14:00")
             ((2025 12 31) (14 0) "market open until 14:00"))
    :late-opens ()
    :note "Closed 1 Jan, 18 Apr, 21 Apr, 1 May, 25 Dec, 26 Dec.")
   (:title "Spanish Financial Market's 2026 Trading Calendar" :year 2026
    :uri "https://www.bolsasymercados.es/en/media/press-releases/2025/spanish-financial-markets-2026-trading-calendar.html"
    :issued (2025 11 20) :issued-uri "https://www.bolsasymercados.es/en/media/press-releases/2025/spanish-financial-markets-2026-trading-calendar.html"
    :published (2025 11 20) :published-uri "https://www.bolsasymercados.es/en/media/press-releases/2025/spanish-financial-markets-2026-trading-calendar.html"
    :published-in "BME press release"
    :dates-note nil
    :closed ()
    :open ()
    :early-closes (((2026 12 24) (14 0) "market open until 14:00")
             ((2026 12 31) (14 0) "market open until 14:00"))
    :late-opens ()
    :note "Closed 1 Jan, 3 Apr, 6 Apr, 1 May, 25 Dec. Instrucción Operativa 65/2025 (Sociedad de Bolsas) is the formal act; its PDF URL now redirects (not fetched).")
   (:title "BME trading calendar page (2026 and 2027)" :year 2027
    :uri "https://www.bolsasymercados.es/en/bme-exchange/trading/trading-calendar.html"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.bolsasymercados.es/en/bme-exchange/trading/trading-calendar.html"
    :published-in "BME website"
    :dates-note "Web page, fetched 2026-11-28; no publication date shown."
    :closed ()
    :open ()
    :early-closes (((2027 12 24) (14 0) "BME markets trade until 14:00 CET")
             ((2027 12 31) (14 0) "BME markets trade until 14:00 CET"))
    :late-opens ()
    :note "2027 closed: 1 Jan, 26 Mar, 29 Mar. 'The stock market calendar is adjusted to national public holidays and certain non-trading days.'")
 ))
