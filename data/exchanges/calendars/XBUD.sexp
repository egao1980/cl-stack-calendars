;; Draft: Budapest Stock Exchange (BSE/BÉT) trading days.
;; Authority: BSE resolution under Book Five "Trading Rules" Part I Ch.3 s.3.2 a) of the BSE General Terms
;; of Service: an annual resolution lists the trading holidays and states that Saturdays declared
;; working days in Hungary (government decree bridge-day swaps) are ALSO non-trading days.
;; => the model must never create a session on a decreed working Saturday; bridge days (e.g. 2026-01-02,
;;    2026-08-21) are trading holidays.
;; BSE lists found: 2018-2026 (resolutions 2018-2021, 2024-2026; website pages 2018-2025). None found before 2018.
(:name "XBUD"
 :title "Budapest Stock Exchange trading days"
 :authority "Budapest Stock Exchange, annual resolution on trading holidays (General Terms of Service, Book Five Trading Rules, Part I Ch. 3 s. 3.2 a))"
 :authority-uri "https://www.bse.hu/Products-and-Services/Trading-information/trading-calendar-2025"
 :bases ((:calendar "HU" :from nil :to nil
          :authority "BSE lists every Hungarian public holiday and decree rest day (bridge day); decreed working Saturdays are non-trading."))
 :rules ((:easter "Good Friday" -2 :from 2012 :to 2016
          :authority "Exchange-only before Good Friday became a HU public holiday (2017). Years 2012-2016 from ec only - no BSE list found for those years.")
         (:fixed "New Year's Eve" 12 31 :from 2013
          :authority "Listed in every BSE list 2018-2026, e.g. Resolution 19/2018 https://www.bse.hu/newkibdata/124648021/Trading_holidays_2018.pdf ; 2013-2017 from ec only (2012-12-31 was a HU bridge day)."))
 :notices (
   (:title "BSE CEO Resolution No. 19/2018 - trading holidays 2018" :year 2018
    :uri "https://www.bse.hu/newkibdata/124648021/Trading_holidays_2018.pdf"
    :issued (2018 1 16) :issued-uri "https://www.bse.hu/newkibdata/124648021/Trading_holidays_2018.pdf"
    :published nil :published-uri "https://web.archive.org/web/20190318035500/https://www.bse.hu/Products-and-Services/Trading-information/Tranding-calendar-2018"
    :published-in "BSE website (Trading calendar 2018)" :dates-note "Publication date not shown; the resolution is dated 16 Jan 2018. Non-trading Saturdays: 10 Mar, 21 Apr, 13 Oct, 10 Nov, 1 Dec, 15 Dec."
    :closed () :open () :early-closes () :late-opens ())
   (:title "BSE CEO Resolution No. 270/2018 - trading holidays 2019" :year 2019
    :uri "https://bet.hu/newkibdata/128067266/Trading_holidays_2019_ENG.pdf"
    :issued (2018 9 17) :issued-uri "https://bet.hu/newkibdata/128067266/Trading_holidays_2019_ENG.pdf"
    :published nil :published-uri "https://web.archive.org/web/20191119025243/https://bse.hu/Products-and-Services/Trading-information/tranding-calendar-2019"
    :published-in "BSE website" :dates-note "Non-trading Saturdays: 10 Aug, 7 Dec, 14 Dec."
    :closed () :open () :early-closes () :late-opens ())
   (:title "BSE CEO Resolution No. 352/2019 - trading holidays 2020" :year 2020
    :uri "https://bet.hu/newkibdata/128312841/Trading%20holidays_2020_ENG.pdf"
    :issued (2019 10 18) :issued-uri "https://bet.hu/newkibdata/128312841/Trading%20holidays_2020_ENG.pdf"
    :published nil :published-uri "https://web.archive.org/web/20201030145615/https://bse.hu/Products-and-Services/Trading-information/trading-calendar-2020"
    :published-in "BSE website" :dates-note "Non-trading Saturdays: 29 Aug, 12 Dec."
    :closed () :open () :early-closes () :late-opens ())
   (:title "BSE Resolution No. 325/2020 - trading holidays 2021" :year 2021
    :uri "https://www.bse.hu/pfile/file?path=/site/Angol/Documents/Products_And_Services/Trading_holidays_2021.pdf1"
    :issued (2020 10 12) :issued-uri "https://www.bse.hu/pfile/file?path=/site/Angol/Documents/Products_And_Services/Trading_holidays_2021.pdf1"
    :published nil :published-uri "https://web.archive.org/web/20211104144125/https://bse.hu/Products-and-Services/Trading-information/trading-calendar-2021"
    :published-in "BSE website" :dates-note "Non-trading Saturday: 11 Dec."
    :closed () :open () :early-closes () :late-opens ())
   (:title "BSE trading holidays 2022 (website)" :year 2022
    :uri "https://web.archive.org/web/20221002060346/https://bse.hu/Products-and-Services/Trading-information/trading-calendar-2022"
    :issued nil :issued-uri nil :published (2022 10 2) :published-uri "https://web.archive.org/web/20221002060346/https://bse.hu/Products-and-Services/Trading-information/trading-calendar-2022"
    :published-in "BSE website, web.archive.org snapshot" :dates-note "Resolution PDF not retrieved. Page lists '26 December, Friday' (typo: Monday). Non-trading Saturdays: 26 Mar, 15 Oct."
    :closed () :open () :early-closes () :late-opens ())
   (:title "BSE trading holidays 2023 (website)" :year 2023
    :uri "https://web.archive.org/web/20231211184559/https://bse.hu/Products-and-Services/Trading-information/trading-calendar-2023"
    :issued nil :issued-uri nil :published (2023 12 11) :published-uri "https://web.archive.org/web/20231211184559/https://bse.hu/Products-and-Services/Trading-information/trading-calendar-2023"
    :published-in "BSE website, web.archive.org snapshot" :dates-note "Resolution PDF not retrieved; 24 and 31 Dec 2023 fall on Sundays."
    :closed () :open () :early-closes () :late-opens ())
   (:title "BSE Resolution No. 296/2023 - trading holidays 2024" :year 2024
    :uri "https://bet.hu/newkibdata/128967324/Trading%20holidays_2024_ENG_.pdf"
    :issued (2023 10 16) :issued-uri "https://bet.hu/newkibdata/128967324/Trading%20holidays_2024_ENG_.pdf"
    :published nil :published-uri "https://web.archive.org/web/20241214133153/https://bse.hu/Products-and-Services/Trading-information/trading-calendar-2024"
    :published-in "BSE website" :dates-note "Repeals Resolution 295/2023 on the same subject. Non-trading Saturdays: 3 Aug, 7 Dec, 14 Dec."
    :closed () :open () :early-closes () :late-opens ())
   (:title "BSE Resolution No. 311/2024 - trading holidays 2025" :year 2025
    :uri "https://bet.hu/newkibdata/129148019/Trading%20holidays_2025_ENG.pdf"
    :issued (2024 11 4) :issued-uri "https://bet.hu/newkibdata/129148019/Trading%20holidays_2025_ENG.pdf"
    :published nil :published-uri "https://web.archive.org/web/20250112235553/https://bse.hu/Products-and-Services/Trading-information/trading-calendar-2024"
    :published-in "BSE website" :dates-note "Non-trading Saturdays: 17 May, 18 Oct, 13 Dec."
    :closed () :open () :early-closes () :late-opens ())
   (:title "BSE Resolution No. 380/2025 - trading holidays 2026" :year 2026
    :uri "https://www.bse.hu/pfile/file?path=/site/Angol/Documents/Products_And_Services/trading-information/trading-holidays-2026"
    :issued (2025 11 5) :issued-uri "https://www.bse.hu/pfile/file?path=/site/Angol/Documents/Products_And_Services/trading-information/trading-holidays-2026"
    :published nil :published-uri "https://www.bse.hu/Products-and-Services/Trading-information/trading-calendar-2025"
    :published-in "BSE website (page fetched 2026-11-28)" :dates-note "Non-trading Saturdays: resolution says 10 Jan, 8 Aug, 12 Dec; the web page omits 12 Dec."
    :closed () :open () :early-closes () :late-opens ())))
