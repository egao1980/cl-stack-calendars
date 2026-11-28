;;;; XTAI exchange trading-day calendar (#49).
;;;; Cached sources: ~/.cache/cl-stack-calendars/exchanges/xtai/ (fmtqik/ = TWSE monthly market
;;;; statistics 2000-01..2026-11, one row per trading day; twse-holidaySchedule-zh-<Y>.json = TWSE
;;;; yearly 市場開休市日期 2021-2027; news/ = TWSE news list per year, details, PDFs).
;;;; Evidence model: TWSE publishes yearly lists only from 2021 online. For 2000-2026 the exact set of
;;;; trading days comes from TWSE's own daily statistics (FMTQIK). Every Mon-Fri 2000-01-03..2026-11-27
;;;; was checked against them (tools/tw_ours.py, tools/tw_cmp.py).
;;;; Rules: TWSE holidays = bank holidays ("市場休假日則與銀行通行假日相同", TWSE 60th-anniversary
;;;; book) = TW civil calendar (incl. 調整放假) + Labor Day (May 1; banks close, government offices
;;;; did not until 2026) + exchange-only Lunar New Year days (2 'no trading, settlement only' days
;;;; before the holiday in most years) + typhoon days (Taipei City work suspension, whole day or morning).
;;;; Labor Day observance: Sunday -> Monday (2005, 2011, 2016, 2022); Saturday -> Friday only from
;;;; 2021 (2021-04-30, 2027-04-30). 2004-04-30 and 2010-04-30 were sessions. Observed days are notices.
;;;; Saturday sessions: alternate Saturdays in 2000; make-up Saturday sessions (補行交易) 2006-2018.
;;;; From 2019 make-up Saturdays are '補行上班，但不交易亦不交割' (no trading).
(:name "XTAI"
 :title "Taiwan Stock Exchange trading days"
 :authority "Taiwan Stock Exchange: 市場開休市日期 (holiday schedule), 天然災害停止上班之處理, and TWSE monthly market statistics (FMTQIK)"
 :authority-uri "https://www.twse.com.tw/zh/trading/holiday.html"
 :bases ((:calendar "TW" :from nil :to nil
          :authority "TWSE 60th-anniversary book, ch. trading system, 市場集會時間: '市場休假日則與銀行通行假日相同' https://www.twse.com.tw/staticFiles/product/publication/twse60/html/178/ ; TWSE yearly lists 2021-2027 (national holidays, 補假, 調整放假) https://www.twse.com.tw/rwd/zh/holidaySchedule/holidaySchedule?date=20250101&response=json"))
 :rules ((:fixed "Labor Day" 5 1 :from 2000
          :authority "TWSE yearly lists 2021-2027 (勞動節 依規定放假1日); no session on any May 1 Mon-Fri 2000-2026 in TWSE statistics (FMTQIK)"))
 :gaps ((:years "2000-2020"
         :note "No TWSE yearly holiday list online (TWSE holidaySchedule API returns empty before 2021; old twse.com.tw/ch/ pages only on web.archive.org, unreachable). Trading days are fully attested by TWSE monthly statistics (FMTQIK), used as the per-year evidence. TWSE news archive (rwd/zh/news/newsList) starts Dec 2004, so typhoon/Lunar-New-Year notices exist only from 2006.")
        (:years "2001-09-12"
         :note "No session in TWSE statistics on Wed 2001-09-12 (ec: session). No TWSE notice found; cause unknown (not a typhoon day per the TWSE news archive, which starts 2004)."))
 :notices
 ((:title "TWSE 天然災害停止上班之處理 (closure rule for typhoons and other natural disasters)"
   :uri "https://www.twse.com.tw/zh/clearing/suspended.html"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/clearing/suspended.html"
   :published-in "TWSE website, 結算服務"
   :dates-note "Rule: Taipei City mayor announces suspension of work for the whole day or the morning -> market closed all day; afternoon-only suspension -> market open, other post-close trading stopped. Same rule in the 1993-era text of the TWSE 60th-anniversary book. No dates; the closures are in the per-event notices."
   :closed () :open () :early-closes () :late-opens ())
  (:title "TWSE news: 韋帕颱風來襲，9月18日證券集中交易市場休市一天。" :year 2007
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=06B4E4A1E74548BD81372A20B741F86D&response=json"
   :issued (2007 9 17) :issued-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=06B4E4A1E74548BD81372A20B741F86D&response=json"
   :published (2007 9 17) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=06B4E4A1E74548BD81372A20B741F86D&response=json"
   :published-in "TWSE news release (證交所新聞稿), id 06B4E4A1E74548BD81372A20B741F86D"
   :dates-note "Text: 台灣證券交易所表示，由於韋帕颱風來襲，台北市政府宣布明（9/18）日停止上班、上課一天，證券集中交易市場休市一天，應辦交割事宜則順延至次一營業日。"
   :closed (((2007 9 18) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE news: 鳳凰颱風來襲，7月28日證券集中交易市場休市一天。" :year 2008
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=2F028B014ACE400F94287A3550A26F1B&response=json"
   :issued (2008 7 27) :issued-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=2F028B014ACE400F94287A3550A26F1B&response=json"
   :published (2008 7 27) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=2F028B014ACE400F94287A3550A26F1B&response=json"
   :published-in "TWSE news release (證交所新聞稿), id 2F028B014ACE400F94287A3550A26F1B"
   :dates-note "Text: 台灣證券交易所表示，由於鳳凰颱風來襲，台北市政府宣佈明（28）日停止上班、上課一天，證券集中交易市場休市一天，應辦交割事宜則順延至次一營業日。"
   :closed (((2008 7 28) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE news: 薔蜜颱風來襲，97年9月29日證券集中交易市場休市一天" :year 2008
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=ABFDB1BD088D4338A214DFA58C022DA0&response=json"
   :issued (2008 9 28) :issued-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=ABFDB1BD088D4338A214DFA58C022DA0&response=json"
   :published (2008 9 28) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=ABFDB1BD088D4338A214DFA58C022DA0&response=json"
   :published-in "TWSE news release (證交所新聞稿), id ABFDB1BD088D4338A214DFA58C022DA0"
   :dates-note "Text: 薔蜜颱風來襲，97年9月29日證券集中交易市場休市一天。  
台灣證券交易所表示，由於薔蜜颱風來襲，台北市政府宣佈明（29）日停止上班、上課一天，證券集中交易市場休市一天，應辦交割事宜則順延至次一營業日。"
   :closed (((2008 9 29) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE news: 台灣證券交易所集中交易市場98年8月7日休市一天" :year 2009
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=9B5EB53F04B746E1B9BEFCE2912CA4E1&response=json"
   :issued (2009 8 6) :issued-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=9B5EB53F04B746E1B9BEFCE2912CA4E1&response=json"
   :published (2009 8 6) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=9B5EB53F04B746E1B9BEFCE2912CA4E1&response=json"
   :published-in "TWSE news release (證交所新聞稿), id 9B5EB53F04B746E1B9BEFCE2912CA4E1"
   :dates-note "Title only (body empty in the TWSE news API)."
   :closed (((2009 8 7) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE news: 台灣證券交易所集中交易市場2012/8/2休市一天" :year 2012
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=EE0E0D8C1B1E4CB2905C9E877FCAF3E2&response=json"
   :issued (2012 8 1) :issued-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=EE0E0D8C1B1E4CB2905C9E877FCAF3E2&response=json"
   :published (2012 8 1) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=EE0E0D8C1B1E4CB2905C9E877FCAF3E2&response=json"
   :published-in "TWSE news release (證交所新聞稿), id EE0E0D8C1B1E4CB2905C9E877FCAF3E2"
   :dates-note "Title only (body empty in the TWSE news API)."
   :closed (((2012 8 2) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE news: 台灣證券交易所集中交易市場102年8月21日休市一天" :year 2013
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=DC7BE65E6B774B14951FEF91D003ECB8&response=json"
   :issued (2013 8 20) :issued-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=DC7BE65E6B774B14951FEF91D003ECB8&response=json"
   :published (2013 8 20) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=DC7BE65E6B774B14951FEF91D003ECB8&response=json"
   :published-in "TWSE news release (證交所新聞稿), id DC7BE65E6B774B14951FEF91D003ECB8"
   :dates-note "Title only (body empty in the TWSE news API)."
   :closed (((2013 8 21) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE news: 台灣證券交易所集中交易市場103年7月23日休市一天" :year 2014
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=5003CAFB5AED488EBCD223BE16C9D975&response=json"
   :issued (2014 7 22) :issued-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=5003CAFB5AED488EBCD223BE16C9D975&response=json"
   :published (2014 7 22) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=5003CAFB5AED488EBCD223BE16C9D975&response=json"
   :published-in "TWSE news release (證交所新聞稿), id 5003CAFB5AED488EBCD223BE16C9D975"
   :dates-note "Title only (body empty in the TWSE news API)."
   :closed (((2014 7 23) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE news: 台灣證券交易所集中交易市場104年7月10日休市一天" :year 2015
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=30D0CC2B9C4A4E07BA69CC66FA1FB3DD&response=json"
   :issued (2015 7 9) :issued-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=30D0CC2B9C4A4E07BA69CC66FA1FB3DD&response=json"
   :published (2015 7 9) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=30D0CC2B9C4A4E07BA69CC66FA1FB3DD&response=json"
   :published-in "TWSE news release (證交所新聞稿), id 30D0CC2B9C4A4E07BA69CC66FA1FB3DD"
   :dates-note "Title only (body empty in the TWSE news API)."
   :closed (((2015 7 10) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE news: 臺灣證券交易所集中交易市場2015/09/29休市一天" :year 2015
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=1CB8A7FD984C4F32A6861B0874DF6ACD&response=json"
   :issued (2015 9 28) :issued-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=1CB8A7FD984C4F32A6861B0874DF6ACD&response=json"
   :published (2015 9 28) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=1CB8A7FD984C4F32A6861B0874DF6ACD&response=json"
   :published-in "TWSE news release (證交所新聞稿), id 1CB8A7FD984C4F32A6861B0874DF6ACD"
   :dates-note "Title only (body empty in the TWSE news API)."
   :closed (((2015 9 29) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE news: 臺灣證券交易所集中交易市場 105年7月8日休市一天." :year 2016
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=7365B7E8184B49A2BCEA7CDA6AC59EDB&response=json"
   :issued (2016 7 7) :issued-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=7365B7E8184B49A2BCEA7CDA6AC59EDB&response=json"
   :published (2016 7 7) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=7365B7E8184B49A2BCEA7CDA6AC59EDB&response=json"
   :published-in "TWSE news release (證交所新聞稿), id 7365B7E8184B49A2BCEA7CDA6AC59EDB"
   :dates-note "Text: 臺灣證券交易所表示，由於尼伯特颱風來襲，臺北市政府宣布全體公教機關停止上班， 105年7月8日集中交易市場全日休市，當日應屆交割款券順延辦理。"
   :closed (((2016 7 8) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE news: 臺灣證券交易所集中交易市場105年09月27日休市一天" :year 2016
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=3653B9775CAD4BD58820318F7A818987&response=json"
   :issued (2016 9 26) :issued-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=3653B9775CAD4BD58820318F7A818987&response=json"
   :published (2016 9 26) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=3653B9775CAD4BD58820318F7A818987&response=json"
   :published-in "TWSE news release (證交所新聞稿), id 3653B9775CAD4BD58820318F7A818987"
   :dates-note "Title only (body empty in the TWSE news API)."
   :closed (((2016 9 27) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE news: 臺灣證券交易所集中交易市場105年09月28日休市一天" :year 2016
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=72A39941BAD64756AAC3F1B5F7D264B6&response=json"
   :issued (2016 9 27) :issued-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=72A39941BAD64756AAC3F1B5F7D264B6&response=json"
   :published (2016 9 27) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=72A39941BAD64756AAC3F1B5F7D264B6&response=json"
   :published-in "TWSE news release (證交所新聞稿), id 72A39941BAD64756AAC3F1B5F7D264B6"
   :dates-note "Title only (body empty in the TWSE news API)."
   :closed (((2016 9 28) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE news: 臺灣證券交易所集中交易市場2019年8月9日休市一天" :year 2019
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=ff8080816c66375b016c70f4529f006b&response=json"
   :issued (2019 8 8) :issued-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=ff8080816c66375b016c70f4529f006b&response=json"
   :published (2019 8 8) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=ff8080816c66375b016c70f4529f006b&response=json"
   :published-in "TWSE news release (證交所新聞稿), id ff8080816c66375b016c70f4529f006b"
   :dates-note "Title only (body empty in the TWSE news API)."
   :closed (((2019 8 9) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE news: 臺灣證券交易所集中交易市場108年9月30日休市一天" :year 2019
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=ff8080816d614eed016d7d5772f200a7&response=json"
   :issued (2019 9 29) :issued-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=ff8080816d614eed016d7d5772f200a7&response=json"
   :published (2019 9 29) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=ff8080816d614eed016d7d5772f200a7&response=json"
   :published-in "TWSE news release (證交所新聞稿), id ff8080816d614eed016d7d5772f200a7"
   :dates-note "Title only (body empty in the TWSE news API)."
   :closed (((2019 9 30) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE news: 臺灣證券交易所集中交易市場112年8月3日休市一天" :year 2023
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=ff80808189aab60c0189b6422b640089&response=json"
   :issued (2023 8 2) :issued-uri "https://www.twse.com.tw/staticFiles/news/news/tsecnews/ff80808189aab60c0189b64863f7008d.pdf"
   :published (2023 8 2) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=ff80808189aab60c0189b6422b640089&response=json"
   :published-in "TWSE news release (證交所新聞稿), id ff80808189aab60c0189b6422b640089 , PDF https://www.twse.com.tw/staticFiles/news/news/tsecnews/ff80808189aab60c0189b64863f7008d.pdf"
   :dates-note "PDF: https://www.twse.com.tw/staticFiles/news/news/tsecnews/ff80808189aab60c0189b64863f7008d.pdf"
   :closed (((2023 8 3) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE news: 臺灣證券交易所集中交易市場113年7月24日休市一天" :year 2024
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=8a8216d6906d4d340190df83a7bd0171&response=json"
   :issued (2024 7 23) :issued-uri "https://www.twse.com.tw/staticFiles/news/news/tsecnews/8a8216d6906d4d340190df83a6ac0170.pdf"
   :published (2024 7 23) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=8a8216d6906d4d340190df83a7bd0171&response=json"
   :published-in "TWSE news release (證交所新聞稿), id 8a8216d6906d4d340190df83a7bd0171 , PDF https://www.twse.com.tw/staticFiles/news/news/tsecnews/8a8216d6906d4d340190df83a6ac0170.pdf"
   :dates-note "PDF: https://www.twse.com.tw/staticFiles/news/news/tsecnews/8a8216d6906d4d340190df83a6ac0170.pdf"
   :closed (((2024 7 24) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE news: 臺灣證券交易所集中交易市場113年7月25日休市一天" :year 2024
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=8a8216d6906d4d340190e4a4f0c80175&response=json"
   :issued (2024 7 24) :issued-uri "https://www.twse.com.tw/staticFiles/news/news/tsecnews/8a8216d6906d4d340190e4a4ef640174.pdf"
   :published (2024 7 24) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=8a8216d6906d4d340190e4a4f0c80175&response=json"
   :published-in "TWSE news release (證交所新聞稿), id 8a8216d6906d4d340190e4a4f0c80175 , PDF https://www.twse.com.tw/staticFiles/news/news/tsecnews/8a8216d6906d4d340190e4a4ef640174.pdf"
   :dates-note "PDF: https://www.twse.com.tw/staticFiles/news/news/tsecnews/8a8216d6906d4d340190e4a4ef640174.pdf"
   :closed (((2024 7 25) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE news: 臺灣證券交易所集中交易市場113年10月2日休市一天" :year 2024
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=8a8216d69236c2e301924806d6ae004f&response=json"
   :issued (2024 10 1) :issued-uri "https://www.twse.com.tw/staticFiles/news/news/tsecnews/8a8216d69236c2e301924806d5b4004e.pdf"
   :published (2024 10 1) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=8a8216d69236c2e301924806d6ae004f&response=json"
   :published-in "TWSE news release (證交所新聞稿), id 8a8216d69236c2e301924806d6ae004f , PDF https://www.twse.com.tw/staticFiles/news/news/tsecnews/8a8216d69236c2e301924806d5b4004e.pdf"
   :dates-note "PDF: https://www.twse.com.tw/staticFiles/news/news/tsecnews/8a8216d69236c2e301924806d5b4004e.pdf"
   :closed (((2024 10 2) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE news: 臺灣證券交易所集中交易市場113年10月3日休市一天" :year 2024
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=8a8216d69236c2e301924d23912f0053&response=json"
   :issued (2024 10 2) :issued-uri "https://www.twse.com.tw/staticFiles/news/news/tsecnews/8a8216d69236c2e301924d238fd00052.pdf"
   :published (2024 10 2) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=8a8216d69236c2e301924d23912f0053&response=json"
   :published-in "TWSE news release (證交所新聞稿), id 8a8216d69236c2e301924d23912f0053 , PDF https://www.twse.com.tw/staticFiles/news/news/tsecnews/8a8216d69236c2e301924d238fd00052.pdf"
   :dates-note "PDF: https://www.twse.com.tw/staticFiles/news/news/tsecnews/8a8216d69236c2e301924d238fd00052.pdf"
   :closed (((2024 10 3) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE news: 臺灣證券交易所集中交易市場113年10月31日休市一天" :year 2024
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=8a8216d69236c2e30192dd5179d70328&response=json"
   :issued (2024 10 30) :issued-uri "https://www.twse.com.tw/staticFiles/news/news/tsecnews/8a8216d69236c2e30192dd5179bc0327.pdf"
   :published (2024 10 30) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=8a8216d69236c2e30192dd5179d70328&response=json"
   :published-in "TWSE news release (證交所新聞稿), id 8a8216d69236c2e30192dd5179d70328 , PDF https://www.twse.com.tw/staticFiles/news/news/tsecnews/8a8216d69236c2e30192dd5179bc0327.pdf"
   :dates-note "PDF: https://www.twse.com.tw/staticFiles/news/news/tsecnews/8a8216d69236c2e30192dd5179bc0327.pdf"
   :closed (((2024 10 31) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE news: 臺灣證券交易所集中交易市場115年7月10日休市一天" :year 2026
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=8a8216d69ef76943019f46cb86bf0111&response=json"
   :issued (2026 7 9) :issued-uri "https://www.twse.com.tw/staticFiles/news/news/tsecnews/8a8216d69ef76943019f46cb86ae0110.pdf"
   :published (2026 7 9) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=8a8216d69ef76943019f46cb86bf0111&response=json"
   :published-in "TWSE news release (證交所新聞稿), id 8a8216d69ef76943019f46cb86bf0111 , PDF https://www.twse.com.tw/staticFiles/news/news/tsecnews/8a8216d69ef76943019f46cb86ae0110.pdf"
   :dates-note "PDF: https://www.twse.com.tw/staticFiles/news/news/tsecnews/8a8216d69ef76943019f46cb86ae0110.pdf"
   :closed (((2026 7 10) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE news: 臺灣證券交易所集中交易市場115年10月23日休市一天" :year 2026
   :uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=8a8216d6a0fa351b01a1638507a10203&response=json"
   :issued (2026 10 22) :issued-uri "https://www.twse.com.tw/staticFiles/news/news/tsecnews/8a8216d6a0fa351b01a1638507940202.pdf"
   :published (2026 10 22) :published-uri "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=8a8216d6a0fa351b01a1638507a10203&response=json"
   :published-in "TWSE news release (證交所新聞稿), id 8a8216d6a0fa351b01a1638507a10203 , PDF https://www.twse.com.tw/staticFiles/news/news/tsecnews/8a8216d6a0fa351b01a1638507940202.pdf"
   :dates-note "PDF: https://www.twse.com.tw/staticFiles/news/news/tsecnews/8a8216d6a0fa351b01a1638507940202.pdf"
   :closed (((2026 10 23) "Typhoon: Taipei City suspended work, market closed all day"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE daily market statistics (FMTQIK): no trading on typhoon days 2000-2005 without an online TWSE notice"
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000801&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly data, one URL per month: https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json"
   :dates-note "TWSE news archive starts 2004-12; these weekdays have no row in TWSE's monthly market statistics. Cause = typhoon work suspension per ec/press (TWSE rule: Taipei City suspends work -> market closed); typhoon names not from a TWSE source."
   :closed (((2000 8 23) "Typhoon closure (no session in TWSE statistics)") ((2001 7 30) "Typhoon closure (no session in TWSE statistics)") ((2001 9 17) "Typhoon closure (no session in TWSE statistics)") ((2001 9 18) "Typhoon closure (no session in TWSE statistics)") ((2002 9 6) "Typhoon closure (no session in TWSE statistics)") ((2004 8 24) "Typhoon closure (no session in TWSE statistics)") ((2004 8 25) "Typhoon closure (no session in TWSE statistics)") ((2004 10 25) "Typhoon closure (no session in TWSE statistics)") ((2005 7 18) "Typhoon closure (no session in TWSE statistics)") ((2005 8 5) "Typhoon closure (no session in TWSE statistics)") ((2005 9 1) "Typhoon closure (no session in TWSE statistics)"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE trading days 2000: daily market statistics" :year 2000
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly trading-day data 2000-01..2000-12 (https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json)"
   :dates-note "No yearly holiday list online before 2021 (web.archive.org unreachable); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2000 1 3) "No session (first business day of 2000; TWSE data starts 2000-01-04; reason not stated)") ((2000 2 2) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2000 2 3) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2000 2 8) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)"))
   :open (((2000 1 15) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 1 29) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 2 19) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 3 4) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 4 1) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 4 8) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 4 15) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 4 29) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 5 6) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 5 20) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 6 3) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 6 17) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 7 15) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 7 29) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 8 5) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 8 19) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 9 2) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 9 16) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 9 30) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 10 7) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 10 21) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 11 4) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 11 18) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 12 2) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 12 16) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2000 12 30) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)")) :early-closes () :late-opens ())
  (:title "TWSE trading days 2001: daily market statistics" :year 2001
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20010101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly trading-day data 2001-01..2001-12 (https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json)"
   :dates-note "No yearly holiday list online before 2021 (web.archive.org unreachable); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2001 1 19) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2001 9 12) "No session in TWSE statistics; reason not found (no TWSE notice online)"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE trading days 2002: daily market statistics" :year 2002
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20020101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly trading-day data 2002-01..2002-12 (https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json)"
   :dates-note "No yearly holiday list online before 2021 (web.archive.org unreachable); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2002 2 7) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2002 2 8) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2002 2 15) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE trading days 2003: daily market statistics" :year 2003
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20030101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly trading-day data 2003-01..2003-12 (https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json)"
   :dates-note "No yearly holiday list online before 2021 (web.archive.org unreachable); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2003 1 29) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2003 1 30) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE trading days 2004: daily market statistics" :year 2004
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20040101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly trading-day data 2004-01..2004-12 (https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json)"
   :dates-note "No yearly holiday list online before 2021 (web.archive.org unreachable); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2004 1 19) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2004 1 20) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE trading days 2005: daily market statistics" :year 2005
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20050101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly trading-day data 2005-01..2005-12 (https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json)"
   :dates-note "No yearly holiday list online before 2021 (web.archive.org unreachable); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2005 2 4) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2005 5 2) "Labor Day (May 1 Sunday) observed Monday"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE trading days 2006: daily market statistics" :year 2006
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20060101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly trading-day data 2006-01..2006-12 (https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json)"
   :dates-note "No yearly holiday list online before 2021 (web.archive.org unreachable); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2006 1 26) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2006 1 27) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)"))
   :open (((2006 10 14) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)")) :early-closes () :late-opens ())
  (:title "TWSE trading days 2007: daily market statistics" :year 2007
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20070101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly trading-day data 2007-01..2007-12 (https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json)"
   :dates-note "No yearly holiday list online before 2021 (web.archive.org unreachable); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2007 2 15) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2007 2 16) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)"))
   :open (((2007 3 3) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2007 4 14) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2007 6 23) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2007 9 29) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)")) :early-closes () :late-opens ())
  (:title "TWSE trading days 2008: daily market statistics" :year 2008
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20080101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly trading-day data 2008-01..2008-12 (https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json)"
   :dates-note "No yearly holiday list online before 2021 (web.archive.org unreachable); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2008 2 4) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2008 2 5) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE trading days 2009: daily market statistics" :year 2009
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20090101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly trading-day data 2009-01..2009-12 (https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json)"
   :dates-note "No yearly holiday list online before 2021 (web.archive.org unreachable); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2009 1 22) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2009 1 23) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)"))
   :open (((2009 1 10) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2009 1 17) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2009 6 6) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)")) :early-closes () :late-opens ())
  (:title "TWSE trading days 2010: daily market statistics" :year 2010
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20100101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly trading-day data 2010-01..2010-12 (https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json)"
   :dates-note "No yearly holiday list online before 2021 (web.archive.org unreachable); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2010 2 11) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2010 2 12) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)"))
   :open (((2010 2 6) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)")) :early-closes () :late-opens ())
  (:title "TWSE trading days 2011: daily market statistics" :year 2011
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20110101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly trading-day data 2011-01..2011-12 (https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json)"
   :dates-note "No yearly holiday list online before 2021 (web.archive.org unreachable); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2011 1 31) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2011 2 1) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2011 5 2) "Labor Day (May 1 Sunday) observed Monday"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE trading days 2012: daily market statistics" :year 2012
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20120101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly trading-day data 2012-01..2012-12 (https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json)"
   :dates-note "No yearly holiday list online before 2021 (web.archive.org unreachable); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2012 1 19) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2012 1 20) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)"))
   :open (((2012 2 4) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2012 3 3) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2012 12 22) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)")) :early-closes () :late-opens ())
  (:title "TWSE trading days 2013: daily market statistics" :year 2013
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20130101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly trading-day data 2013-01..2013-12 (https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json)"
   :dates-note "No yearly holiday list online before 2021 (web.archive.org unreachable); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2013 2 7) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2013 2 8) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)"))
   :open (((2013 2 23) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2013 9 14) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)")) :early-closes () :late-opens ())
  (:title "TWSE trading days 2014: daily market statistics" :year 2014
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20140101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly trading-day data 2014-01..2014-12 (https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json)"
   :dates-note "No yearly holiday list online before 2021 (web.archive.org unreachable); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2014 1 28) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2014 1 29) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)"))
   :open (((2014 12 27) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)")) :early-closes () :late-opens ())
  (:title "TWSE trading days 2015: daily market statistics" :year 2015
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20150101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly trading-day data 2015-01..2015-12 (https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json)"
   :dates-note "No yearly holiday list online before 2021 (web.archive.org unreachable); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2015 2 16) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2015 2 17) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE trading days 2016: daily market statistics" :year 2016
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20160101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly trading-day data 2016-01..2016-12 (https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json)"
   :dates-note "No yearly holiday list online before 2021 (web.archive.org unreachable); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2016 2 4) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2016 2 5) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2016 5 2) "Labor Day (May 1 Sunday) observed Monday"))
   :open (((2016 1 30) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2016 6 4) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2016 9 10) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)")) :early-closes () :late-opens ())
  (:title "TWSE trading days 2017: daily market statistics" :year 2017
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20170101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly trading-day data 2017-01..2017-12 (https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json)"
   :dates-note "No yearly holiday list online before 2021 (web.archive.org unreachable); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2017 1 25) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2017 1 26) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)"))
   :open (((2017 2 18) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2017 6 3) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2017 9 30) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)")) :early-closes () :late-opens ())
  (:title "TWSE trading days 2018: daily market statistics" :year 2018
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20180101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly trading-day data 2018-01..2018-12 (https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json)"
   :dates-note "No yearly holiday list online before 2021 (web.archive.org unreachable); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2018 2 13) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2018 2 14) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)"))
   :open (((2018 3 31) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)") ((2018 12 22) "Saturday trading session (補行交易 make-up day, or 2000 alternate-Saturday trading)")) :early-closes () :late-opens ())
  (:title "TWSE trading days 2019: daily market statistics" :year 2019
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20190101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly trading-day data 2019-01..2019-12 (https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json)"
   :dates-note "No yearly holiday list online before 2021 (web.archive.org unreachable); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2019 1 31) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2019 2 1) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE trading days 2020: daily market statistics" :year 2020
   :uri "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20200101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/historical/fmtqik.html"
   :published-in "TWSE 市場成交資訊 (FMTQIK) monthly trading-day data 2020-01..2020-12 (https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=YYYYMM01&response=json)"
   :dates-note "No yearly holiday list online before 2021 (web.archive.org unreachable); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2020 1 21) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2020 1 22) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE trading days 2021: 市場開休市日期 list + daily market statistics" :year 2021
   :uri "https://www.twse.com.tw/rwd/zh/holidaySchedule/holidaySchedule?date=20210101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/holiday.html"
   :published-in "TWSE 市場開休市日期 (holidaySchedule) yearly list"
   :dates-note "Yearly list from the TWSE holiday-schedule API (no issue date); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2021 2 8) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2021 2 9) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2021 4 30) "Labor Day (May 1 Saturday) observed Friday"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE trading days 2022: 市場開休市日期 list + daily market statistics" :year 2022
   :uri "https://www.twse.com.tw/rwd/zh/holidaySchedule/holidaySchedule?date=20220101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/holiday.html"
   :published-in "TWSE 市場開休市日期 (holidaySchedule) yearly list"
   :dates-note "Yearly list from the TWSE holiday-schedule API (no issue date); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2022 1 27) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2022 1 28) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2022 5 2) "Labor Day (May 1 Sunday) observed Monday"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE trading days 2023: 市場開休市日期 list + daily market statistics" :year 2023
   :uri "https://www.twse.com.tw/rwd/zh/holidaySchedule/holidaySchedule?date=20230101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/holiday.html"
   :published-in "TWSE 市場開休市日期 (holidaySchedule) yearly list"
   :dates-note "Yearly list from the TWSE holiday-schedule API (no issue date); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2023 1 18) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2023 1 19) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE trading days 2024: 市場開休市日期 list + daily market statistics" :year 2024
   :uri "https://www.twse.com.tw/rwd/zh/holidaySchedule/holidaySchedule?date=20240101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/holiday.html"
   :published-in "TWSE 市場開休市日期 (holidaySchedule) yearly list"
   :dates-note "Yearly list from the TWSE holiday-schedule API (no issue date); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2024 2 6) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2024 2 7) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE trading days 2025: 市場開休市日期 list + daily market statistics" :year 2025
   :uri "https://www.twse.com.tw/rwd/zh/holidaySchedule/holidaySchedule?date=20250101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/holiday.html"
   :published-in "TWSE 市場開休市日期 (holidaySchedule) yearly list"
   :dates-note "Yearly list from the TWSE holiday-schedule API (no issue date); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2025 1 23) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2025 1 24) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE trading days 2026: 市場開休市日期 list + daily market statistics" :year 2026
   :uri "https://www.twse.com.tw/rwd/zh/holidaySchedule/holidaySchedule?date=20260101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/holiday.html"
   :published-in "TWSE 市場開休市日期 (holidaySchedule) yearly list"
   :dates-note "Yearly list from the TWSE holiday-schedule API (no issue date); closures below = weekdays without a session in TWSE monthly statistics that the TW base does not close (typhoon days are in their own notices; May 1 is a rule). Saturday sessions listed under :open (weekend days: the implementer must let a notice open a Saturday)."
   :closed (((2026 2 12) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)") ((2026 2 13) "Lunar New Year market closure beyond the civil holidays (封關 / no-trading settlement day)"))
   :open () :early-closes () :late-opens ())
  (:title "TWSE 116年(2027) 市場開休市日期" :year 2027
   :uri "https://www.twse.com.tw/rwd/zh/holidaySchedule/holidaySchedule?date=20270101&response=json"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://www.twse.com.tw/zh/trading/holiday.html"
   :published-in "TWSE 市場開休市日期 (holidaySchedule) yearly list"
   :dates-note "Lists 02-02, 02-03 '市場無交易，僅辦理結算交割作業' (no trading, settlement only), LNY 02-04..02-10, 03-01, 04-04..04-06, 04-30 (Labor Day observed), 05-01, 06-09, 09-15, 09-28, 10-10, 10-11, 10-25, 12-24, 12-25, 12-31."
   :closed (((2027 2 2) "No trading before Lunar New Year (settlement only)") ((2027 2 3) "No trading before Lunar New Year (settlement only)") ((2027 4 30) "Labor Day (May 1 Saturday) observed Friday"))
   :open () :early-closes () :late-opens ())
))
