;;;; XHKG — HKEX securities market (SEHK) trading days.
;;;; Sources cached under ~/.cache/cl-stack-calendars/exchanges/xhkg/ (sehk-<year>-<id>.pdf = SEHK circulars,
;;;; hkex-<section>-<id>news.html = HKEX news releases / market communications).
;;;; Finding: every SEHK holiday-schedule circular found (for 2011, 2014, 2016-2018, 2021-2027) is "prepared
;;;; ... according to the general holidays ... announced by the Government": base calendar HK, no
;;;; exchange-only holiday. Exchange-only events: weather closures (Typhoon Signal No. 8+/Black Rainstorm/
;;;; Extreme Conditions in force at 12:00 noon cancel the day) until Severe Weather Trading started 2024-09-23,
;;;; plus partial weather days, and half-days (no afternoon session) on the weekday eves of Christmas,
;;;; New Year and Lunar New Year (Rule 501(1)). ec misses the Lunar New Year eve half days before 2014.
(:name "XHKG"
 :title "HKEX securities market trading days"
 :authority "Rules of the Exchange (SEHK) Rule 501(1): \"Trading on the Exchange is conducted on every weekday ... (excluding Saturdays and public holidays) ... There is no Afternoon Session on the eves of Christmas, New Year and Lunar New Year.\""
 :authority-uri "https://www.hkex.com.hk/eng/rulesreg/traderules/sehk/documents/chap-5_eng.pdf"
 :bases ((:calendar "HK" :from nil :to nil
          :authority "SEHK holiday schedule circulars: \"Securities Market is closed on Saturdays, Sundays and Public Holidays\", table prepared from the HKSAR general holidays (e.g. CT/075/25 for 2026: https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2025/ce_SEHK_CT_075_2025.pdf)"))
 :rules ()
 :gaps ((:years "2000-2010, 2012-2013, 2015, 2019-2020"
         :note "No SEHK holiday-schedule circular found for these years (HKEX circular index is script-driven; only search-engine hits were fetchable; web.archive.org unreachable). Holidays assumed = HK general holidays (no counter-evidence in ec). 2012 covered by the Trading Calendar card.")
        (:years "2001"
         :note "ec closes 2001-07-06 (Typhoon Utor) and 2001-07-25 (Typhoon Yutu); no HKEx notice found (hkex.com.hk News-Release pages exist from 2003; 010706/010725 ids probed, not found). Not written as notices.")
        (:years "2000-2007"
         :note "Lunar New Year eve half days 2000-02-04, 2001-01-23, 2002-02-11, 2003-01-31, 2004-01-21, 2005-02-08, 2007-02-16 are likely (CMD/TMO/089/07 of 2007-10-31 already describes half-day trading on all three eves) but no dated list was found; not written. Christmas/New Year eve half days 2000-2010 (all at 12:30) also have no per-year source here; ec has them.")
        (:years "2003-2024"
         :note "Partial weather days (morning or afternoon cancelled) were not searched systematically; only 2003-07-24, 2003-09-02 and 2008-06-25 are recorded. Others are known to exist (e.g. 2023-10-09 resumed after Signal No. 8, https://www.hkex.com.hk/News/Market-Communications/2023/2310092news?sc_lang=en)."))
 :notices
 (
  (:title "SEHK circular: SECURITIES MARKET HOLIDAY SCHEDULE FOR YEAR 2011"
   :year 2011
   :uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2010/ctmo02010e"
   :issued (2010 5 14) :issued-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2010/ctmo02010e"
   :published (2010 5 14) :published-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2010/ctmo02010e"
   :published-in "SEHK circular (Trading Department)" :dates-note "Holiday table = HKSAR general holidays of the year (“prepared ... according to the general holidays ... announced by the Government”)."
   :closed ()
   :open ()
   :early-closes (((2011 2 2) (12 30) "Eve of Lunar New Year: no afternoon session"))
   :late-opens ())
  (:title "SEHK circular: SECURITIES MARKET HOLIDAY SCHEDULE FOR YEAR 2014"
   :year 2014
   :uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2013/ct01013e"
   :issued (2013 5 3) :issued-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2013/ct01013e"
   :published (2013 5 3) :published-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2013/ct01013e"
   :published-in "SEHK circular (Trading Department)" :dates-note "Holiday table = HKSAR general holidays of the year (“prepared ... according to the general holidays ... announced by the Government”)."
   :closed ()
   :open ()
   :early-closes (((2014 1 30) (12 0) "Eve of Lunar New Year: no afternoon session") ((2014 12 24) (12 0) "Eve of Christmas Day: no afternoon session") ((2014 12 31) (12 0) "Eve of New Year: no afternoon session"))
   :late-opens ())
  (:title "SEHK circular: HONG KONG SECURITIES MARKET HOLIDAY SCHEDULE FOR YEAR 2016"
   :year 2016
   :uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2015/CT03915E.pdf"
   :issued (2015 5 22) :issued-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2015/CT03915E.pdf"
   :published (2015 5 22) :published-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2015/CT03915E.pdf"
   :published-in "SEHK circular (Trading Department)" :dates-note "Holiday table = HKSAR general holidays of the year (“prepared ... according to the general holidays ... announced by the Government”)."
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ()
   :note "\"There is no half-day trading day in Year 2016.\"")
  (:title "SEHK circular: CT/017/16 HONG KONG SECURITIES MARKET HOLIDAY SCHEDULE FOR YEAR 2017"
   :year 2017
   :uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2016/ct01716e"
   :issued (2016 5 9) :issued-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2016/ct01716e"
   :published (2016 5 9) :published-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2016/ct01716e"
   :published-in "SEHK circular (Trading Department)" :dates-note "Holiday table = HKSAR general holidays of the year (“prepared ... according to the general holidays ... announced by the Government”)."
   :closed ()
   :open ()
   :early-closes (((2017 1 27) (12 0) "Eve of Lunar New Year: no afternoon session"))
   :late-opens ())
  (:title "SEHK circular: CT/038/17 HONG KONG SECURITIES MARKET HOLIDAY SCHEDULE FOR YEAR 2018"
   :year 2018
   :uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2017/CT03817E.pdf"
   :issued (2017 5 15) :issued-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2017/CT03817E.pdf"
   :published (2017 5 15) :published-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2017/CT03817E.pdf"
   :published-in "SEHK circular (Trading Department)" :dates-note "Holiday table = HKSAR general holidays of the year (“prepared ... according to the general holidays ... announced by the Government”)."
   :closed ()
   :open ()
   :early-closes (((2018 2 15) (12 0) "Eve of Lunar New Year: no afternoon session") ((2018 12 24) (12 0) "Eve of Christmas Day: no afternoon session") ((2018 12 31) (12 0) "Eve of New Year: no afternoon session"))
   :late-opens ())
  (:title "SEHK circular: CT/038/20 Hong Kong Securities Market Holiday Schedule for Year 2021"
   :year 2021
   :uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2020/ce_SEHK_CT_038_2020.pdf"
   :issued (2020 5 25) :issued-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2020/ce_SEHK_CT_038_2020.pdf"
   :published (2020 5 25) :published-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2020/ce_SEHK_CT_038_2020.pdf"
   :published-in "SEHK circular (Trading Department)" :dates-note "Holiday table = HKSAR general holidays of the year (“prepared ... according to the general holidays ... announced by the Government”)."
   :closed ()
   :open ()
   :early-closes (((2021 2 11) (12 0) "Eve of Lunar New Year: no afternoon session") ((2021 12 24) (12 0) "Eve of Christmas Day: no afternoon session") ((2021 12 31) (12 0) "Eve of New Year: no afternoon session"))
   :late-opens ())
  (:title "SEHK circular: CT/082/21 Hong Kong Securities Market Holiday Schedule for Year 2022"
   :year 2022
   :uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2021/ce_SEHK_CT_082_2021.pdf"
   :issued (2021 6 4) :issued-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2021/ce_SEHK_CT_082_2021.pdf"
   :published (2021 6 4) :published-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2021/ce_SEHK_CT_082_2021.pdf"
   :published-in "SEHK circular (Trading Department)" :dates-note "Holiday table = HKSAR general holidays of the year (“prepared ... according to the general holidays ... announced by the Government”)."
   :closed ()
   :open ()
   :early-closes (((2022 1 31) (12 0) "Eve of Lunar New Year: no afternoon session"))
   :late-opens ())
  (:title "SEHK circular: CT/058/22 Hong Kong Securities Market Holiday Schedule for Year 2023"
   :year 2023
   :uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2022/ce_SEHK_CT_058_2022.pdf"
   :issued (2022 5 27) :issued-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2022/ce_SEHK_CT_058_2022.pdf"
   :published (2022 5 27) :published-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2022/ce_SEHK_CT_058_2022.pdf"
   :published-in "SEHK circular (Trading Department)" :dates-note "Holiday table = HKSAR general holidays of the year (“prepared ... according to the general holidays ... announced by the Government”)."
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ()
   :note "\"There is no half-day trading day in Year 2023.\"")
  (:title "SEHK circular: CT/079/23 Hong Kong Securities Market Holiday Schedule for Year 2024"
   :year 2024
   :uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2023/ce_SEHK_CT_079_2023.pdf"
   :issued (2023 6 9) :issued-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2023/ce_SEHK_CT_079_2023.pdf"
   :published (2023 6 9) :published-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2023/ce_SEHK_CT_079_2023.pdf"
   :published-in "SEHK circular (Trading Department)" :dates-note "Holiday table = HKSAR general holidays of the year (“prepared ... according to the general holidays ... announced by the Government”)."
   :closed ()
   :open ()
   :early-closes (((2024 2 9) (12 0) "Eve of Lunar New Year: no afternoon session") ((2024 12 24) (12 0) "Eve of Christmas Day: no afternoon session") ((2024 12 31) (12 0) "Eve of New Year: no afternoon session"))
   :late-opens ())
  (:title "SEHK circular: CT/063/24 Hong Kong Securities Market Holiday Schedule for Year 2025"
   :year 2025
   :uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2024/ce_SEHK_CT_063_2024.pdf"
   :issued (2024 5 17) :issued-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2024/ce_SEHK_CT_063_2024.pdf"
   :published (2024 5 17) :published-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2024/ce_SEHK_CT_063_2024.pdf"
   :published-in "SEHK circular (Trading Department)" :dates-note "Holiday table = HKSAR general holidays of the year (“prepared ... according to the general holidays ... announced by the Government”)."
   :closed ()
   :open ()
   :early-closes (((2025 1 28) (12 0) "Eve of Lunar New Year: no afternoon session") ((2025 12 24) (12 0) "Eve of Christmas Day: no afternoon session") ((2025 12 31) (12 0) "Eve of New Year: no afternoon session"))
   :late-opens ())
  (:title "SEHK circular: CT/075/25 Hong Kong Securities Market Holiday Schedule for Year 2026"
   :year 2026
   :uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2025/ce_SEHK_CT_075_2025.pdf"
   :issued (2025 6 2) :issued-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2025/ce_SEHK_CT_075_2025.pdf"
   :published (2025 6 2) :published-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2025/ce_SEHK_CT_075_2025.pdf"
   :published-in "SEHK circular (Trading Department)" :dates-note "Holiday table = HKSAR general holidays of the year (“prepared ... according to the general holidays ... announced by the Government”)."
   :closed ()
   :open ()
   :early-closes (((2026 2 16) (12 0) "Eve of Lunar New Year: no afternoon session") ((2026 12 24) (12 0) "Eve of Christmas Day: no afternoon session") ((2026 12 31) (12 0) "Eve of New Year: no afternoon session"))
   :late-opens ())
  (:title "SEHK circular: CT/077/26 Hong Kong Securities Market Holiday Schedule for Year 2027"
   :year 2027
   :uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2026/ce_SEHK_CT_077_2026.pdf"
   :issued (2026 6 1) :issued-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2026/ce_SEHK_CT_077_2026.pdf"
   :published (2026 6 1) :published-uri "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2026/ce_SEHK_CT_077_2026.pdf"
   :published-in "SEHK circular (Trading Department)" :dates-note "Holiday table = HKSAR general holidays of the year (“prepared ... according to the general holidays ... announced by the Government”)."
   :closed ()
   :open ()
   :early-closes (((2027 2 5) (12 0) "Eve of Lunar New Year: no afternoon session") ((2027 12 24) (12 0) "Eve of Christmas Day: no afternoon session") ((2027 12 31) (12 0) "Eve of New Year: no afternoon session"))
   :late-opens ())
  (:title "HKEx Trading Calendar 2012"
   :year 2012
   :uri "https://www.hkex.com.hk/eng/prod/dataprod/Documents/Trading%20Calendar%202012%20of%20Hong%20Kong%20Exchanges%20and%20Clearing%20Limited.pdf"
   :issued nil :issued-uri "https://www.hkex.com.hk/eng/prod/dataprod/Documents/Trading%20Calendar%202012%20of%20Hong%20Kong%20Exchanges%20and%20Clearing%20Limited.pdf"
   :published nil :published-uri "https://www.hkex.com.hk/eng/prod/dataprod/Documents/Trading%20Calendar%202012%20of%20Hong%20Kong%20Exchanges%20and%20Clearing%20Limited.pdf"
   :published-in "HKEx Trading Calendar (PDF)" :dates-note "Undated calendar card; text: “Markets are closed on Saturdays, Sundays and Public Holidays. 24 Dec and 31 Dec 2012 are half-day trading days”. 2012 LNY eve was a Sunday."
   :closed ()
   :open ()
   :early-closes (((2012 12 24) (12 0) "Eve of Christmas Day: no afternoon session") ((2012 12 31) (12 0) "Eve of New Year: no afternoon session"))
   :late-opens ())
  (:title "SEHK circular CMD/TMO/089/07: Implementation of Closing Auction Session"
   :year 2008
   :uri "https://www.hkex.com.hk/-/media/hkex-market/services/circulars-and-notices/participant-and-members-circulars/sehk/2007/ctmo089e"
   :issued (2007 10 31) :issued-uri "https://www.hkex.com.hk/-/media/hkex-market/services/circulars-and-notices/participant-and-members-circulars/sehk/2007/ctmo089e"
   :published (2007 10 31) :published-uri "https://www.hkex.com.hk/-/media/hkex-market/services/circulars-and-notices/participant-and-members-circulars/sehk/2007/ctmo089e"
   :published-in "SEHK circular" :dates-note "Generic statement of half-day trading on the three eves (CAS 12:30-12:40 on half days from 2008-05-26); 2008-02-06 is the next weekday LNY eve after the circular. Not a dated holiday list."
   :closed ()
   :open ()
   :early-closes (((2008 2 6) (12 30) "Eve of Lunar New Year: no afternoon session (“half day trading on the eves of Christmas, New Year and Lunar New Year”)"))
   :late-opens ())
  (:title "No Trading Today in Securities and Derivatives Markets due to Issuance of Typhoon Signal No. 8"
   :year 2008
   :uri "https://www.hkex.com.hk/News/News-Release/2008/0808062news?sc_lang=en"
   :issued (2008 8 6) :issued-uri "https://www.hkex.com.hk/News/News-Release/2008/0808062news?sc_lang=en"
   :published (2008 8 6) :published-uri "https://www.hkex.com.hk/News/News-Release/2008/0808062news?sc_lang=en"
   :published-in "HKEX News Release / Market Communication" :dates-note nil
   :closed (((2008 8 6) "Typhoon Signal No. 8 (Kammuri): all sessions cancelled"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "Securities and Derivatives Markets Delay Open due to Issuance of Typhoon Signal No. 8"
   :year 2008
   :uri "https://www.hkex.com.hk/News/News-Release/2008/080822news?sc_lang=en"
   :issued (2008 8 22) :issued-uri "https://www.hkex.com.hk/News/News-Release/2008/080822news?sc_lang=en"
   :published (2008 8 22) :published-uri "https://www.hkex.com.hk/News/News-Release/2008/080822news?sc_lang=en"
   :published-in "HKEX News Release / Market Communication" :dates-note "Only the delay-open notice was found (it states all sessions are cancelled if Signal No. 8 remains at 12:00 noon). The follow-up no-trading notice was not found (ids 080822[1-6], 0808221-3 probed). Closure itself rests on ec."
   :confidence :secondary
   :closed (((2008 8 22) "Typhoon Signal No. 8 (Nuri): delayed open; full-day cancellation per ec"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "No Trading Today in Securities and Derivatives Markets due to Issuance of Typhoon Signal No. 8"
   :year 2011
   :uri "https://www.hkex.com.hk/News/News-Release/2011/1109293news?sc_lang=en"
   :issued (2011 9 29) :issued-uri "https://www.hkex.com.hk/News/News-Release/2011/1109293news?sc_lang=en"
   :published (2011 9 29) :published-uri "https://www.hkex.com.hk/News/News-Release/2011/1109293news?sc_lang=en"
   :published-in "HKEX News Release / Market Communication" :dates-note nil
   :closed (((2011 9 29) "Typhoon Signal No. 8 (Nesat): all sessions cancelled"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "No Trading Today in Securities and Derivatives Markets due to Issuance of Typhoon Signal No. 8"
   :year 2013
   :uri "https://www.hkex.com.hk/News/News-Release/2013/1308142news?sc_lang=en"
   :issued (2013 8 14) :issued-uri "https://www.hkex.com.hk/News/News-Release/2013/1308142news?sc_lang=en"
   :published (2013 8 14) :published-uri "https://www.hkex.com.hk/News/News-Release/2013/1308142news?sc_lang=en"
   :published-in "HKEX News Release / Market Communication" :dates-note nil
   :closed (((2013 8 14) "Typhoon Signal No. 8 (Utor): all sessions cancelled"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "No Trading Today in Securities and Derivatives Markets due to Issuance of Typhoon Signal No. 8"
   :year 2016
   :uri "https://www.hkex.com.hk/News/Market-Communications/2016/1608022news?sc_lang=en"
   :issued (2016 8 2) :issued-uri "https://www.hkex.com.hk/News/Market-Communications/2016/1608022news?sc_lang=en"
   :published (2016 8 2) :published-uri "https://www.hkex.com.hk/News/Market-Communications/2016/1608022news?sc_lang=en"
   :published-in "HKEX News Release / Market Communication" :dates-note nil
   :closed (((2016 8 2) "Typhoon Signal No. 8 (Nida): all sessions cancelled"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "No Trading Today in Securities and Derivatives Markets due to Issuance of Typhoon Signal No. 8"
   :year 2016
   :uri "https://www.hkex.com.hk/News/Market-Communications/2016/1610212news?sc_lang=en"
   :issued (2016 10 21) :issued-uri "https://www.hkex.com.hk/News/Market-Communications/2016/1610212news?sc_lang=en"
   :published (2016 10 21) :published-uri "https://www.hkex.com.hk/News/Market-Communications/2016/1610212news?sc_lang=en"
   :published-in "HKEX News Release / Market Communication" :dates-note nil
   :closed (((2016 10 21) "Typhoon Signal No. 8 (Haima): all sessions cancelled"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "No Trading Today in Securities and Derivatives Markets due to Issuance of Typhoon Signal No. 10"
   :year 2017
   :uri "https://www.hkex.com.hk/News/Market-Communications/2017/1708232news?sc_lang=en"
   :issued (2017 8 23) :issued-uri "https://www.hkex.com.hk/News/Market-Communications/2017/1708232news?sc_lang=en"
   :published (2017 8 23) :published-uri "https://www.hkex.com.hk/News/Market-Communications/2017/1708232news?sc_lang=en"
   :published-in "HKEX News Release / Market Communication" :dates-note nil
   :closed (((2017 8 23) "Typhoon Signal No. 10 (Hato): all sessions cancelled"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "No Trading Today in Securities and Derivatives Markets due to Issuance of Typhoon Signal No. 8"
   :year 2020
   :uri "https://www.hkex.com.hk/News/Market-Communications/2020/2010132news?sc_lang=en"
   :issued (2020 10 13) :issued-uri "https://www.hkex.com.hk/News/Market-Communications/2020/2010132news?sc_lang=en"
   :published (2020 10 13) :published-uri "https://www.hkex.com.hk/News/Market-Communications/2020/2010132news?sc_lang=en"
   :published-in "HKEX News Release / Market Communication" :dates-note nil
   :closed (((2020 10 13) "Typhoon Signal No. 8 (Nangka): all sessions cancelled"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "No Trading Today in Securities and Derivatives Markets Due to Issuance of Typhoon Signal No. 8"
   :year 2021
   :uri "https://www.hkex.com.hk/News/Market-Communications/2021/2110132news?sc_lang=en"
   :issued (2021 10 13) :issued-uri "https://www.hkex.com.hk/News/Market-Communications/2021/2110132news?sc_lang=en"
   :published (2021 10 13) :published-uri "https://www.hkex.com.hk/News/Market-Communications/2021/2110132news?sc_lang=en"
   :published-in "HKEX News Release / Market Communication" :dates-note nil
   :closed (((2021 10 13) "Typhoon Signal No. 8 (Kompasu): all sessions cancelled"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "No Trading Today in Securities and Derivatives Markets Due to Issuance of Typhoon Signal No. 8"
   :year 2023
   :uri "https://www.hkex.com.hk/News/Market-Communications/2023/2307172news?sc_lang=en"
   :issued (2023 7 17) :issued-uri "https://www.hkex.com.hk/News/Market-Communications/2023/2307172news?sc_lang=en"
   :published (2023 7 17) :published-uri "https://www.hkex.com.hk/News/Market-Communications/2023/2307172news?sc_lang=en"
   :published-in "HKEX News Release / Market Communication" :dates-note nil
   :closed (((2023 7 17) "Typhoon Signal No. 8 (Talim): all sessions cancelled"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "No Trading Today in Securities and Derivatives Markets Due to Issuance of Typhoon Signal No. 8"
   :year 2023
   :uri "https://www.hkex.com.hk/News/Market-Communications/2023/2309012news?sc_lang=en"
   :issued (2023 9 1) :issued-uri "https://www.hkex.com.hk/News/Market-Communications/2023/2309012news?sc_lang=en"
   :published (2023 9 1) :published-uri "https://www.hkex.com.hk/News/Market-Communications/2023/2309012news?sc_lang=en"
   :published-in "HKEX News Release / Market Communication" :dates-note nil
   :closed (((2023 9 1) "Typhoon Signal No. 8 (Saola): all sessions cancelled"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "No Trading Today in Securities and Derivatives Markets Due to Black Rainstorm Warning and Extreme Conditions"
   :year 2023
   :uri "https://www.hkex.com.hk/News/Market-Communications/2023/2309083news?sc_lang=en"
   :issued (2023 9 8) :issued-uri "https://www.hkex.com.hk/News/Market-Communications/2023/2309083news?sc_lang=en"
   :published (2023 9 8) :published-uri "https://www.hkex.com.hk/News/Market-Communications/2023/2309083news?sc_lang=en"
   :published-in "HKEX News Release / Market Communication" :dates-note nil
   :closed (((2023 9 8) "Black Rainstorm Warning + Extreme Conditions: all sessions cancelled"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "No Trading Today in Securities and Derivatives Markets Due to Issuance of Typhoon Signal No. 8"
   :year 2024
   :uri "https://www.hkex.com.hk/News/Market-Communications/2024/2409062news?sc_lang=en"
   :issued (2024 9 6) :issued-uri "https://www.hkex.com.hk/News/Market-Communications/2024/2409062news?sc_lang=en"
   :published (2024 9 6) :published-uri "https://www.hkex.com.hk/News/Market-Communications/2024/2409062news?sc_lang=en"
   :published-in "HKEX News Release / Market Communication" :dates-note nil
   :closed (((2024 9 6) "Typhoon Signal No. 8 (Yagi): all sessions cancelled (last closure before Severe Weather Trading, 2024-09-23)"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "Trading will resume after lowering of Typhoon Signal No. 8 (Typhoon Imbudo)"
   :year 2003
   :uri "https://www.hkex.com.hk/News/News-Release/2003/0307242news?sc_lang=en"
   :issued (2003 7 24) :issued-uri "https://www.hkex.com.hk/News/News-Release/2003/0307242news?sc_lang=en"
   :published (2003 7 24) :published-uri "https://www.hkex.com.hk/News/News-Release/2003/0307242news?sc_lang=en"
   :published-in "HKEx News Release" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens (((2003 7 24) (10 30) "Typhoon Imbudo: trading resumed 10:30 after Signal No. 8 lowered (HKEx clarification 0307243news: opened 10:32 manually)")))
  (:title "No Afternoon Trading Session in Securities and Derivatives Markets due to issue of Typhoon Signal No. 8"
   :year 2003
   :uri "https://www.hkex.com.hk/News/News-Release/2003/030902news?sc_lang=en"
   :issued (2003 9 2) :issued-uri "https://www.hkex.com.hk/News/News-Release/2003/030902news?sc_lang=en"
   :published (2003 9 2) :published-uri "https://www.hkex.com.hk/News/News-Release/2003/030902news?sc_lang=en"
   :published-in "HKEx News Release" :dates-note nil
   :closed ()
   :open ()
   :early-closes (((2003 9 2) (12 30) "Typhoon Signal No. 8 (Dujuan): no afternoon session"))
   :late-opens ())
  (:title "No Morning Trading Sessions ... / Trading ... will Resume at 2:30pm after Lowering Typhoon Signal No. 8 before noon"
   :year 2008
   :uri "https://www.hkex.com.hk/News/News-Release/2008/080625news?sc_lang=en"
   :issued (2008 6 25) :issued-uri "https://www.hkex.com.hk/News/News-Release/2008/080625news?sc_lang=en"
   :published (2008 6 25) :published-uri "https://www.hkex.com.hk/News/News-Release/2008/080625news?sc_lang=en"
   :published-in "HKEx News Release" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens (((2008 6 25) (14 30) "Typhoon Fengshen: morning cancelled (0806251), afternoon from 14:30")))
  (:title "HKEX to Implement Severe Weather Trading in Securities and Derivatives Markets from 23 September 2024"
   :year 2024
   :uri "https://www.hkex.com.hk/News/Market-Communications/2024/240618news?sc_lang=en"
   :issued (2024 6 18) :issued-uri "https://www.hkex.com.hk/News/Market-Communications/2024/240618news?sc_lang=en"
   :published (2024 6 18) :published-uri "https://www.hkex.com.hk/News/Market-Communications/2024/240618news?sc_lang=en"
   :published-in "HKEX Market Communication" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ()
   :note "From 2024-09-23 Typhoon Signal No. 8+, Black Rainstorm and Extreme Conditions no longer close the securities market (Severe Weather Trading). No weather closures after this date unless HKEX/SFC/Government declare an exceptional situation.")))
