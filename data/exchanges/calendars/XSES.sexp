;;;; XSES exchange trading-day calendar (#49), SGX securities market.
;;;; SGX's own yearly securities calendar is not retrievable here: sgx.com is an SPA whose
;;;; content comes from api2.sgx.com/content-api (fetching it was refused by this session's
;;;; permission policy), and web.archive.org is unreachable. The SGX derivatives circulars
;;;; (DT/AM) do not apply (SGX-DT trades on most SG holidays). Closures therefore follow the
;;;; Singapore gazetted public holidays (MOM press releases 2020-2027 = per-year evidence),
;;;; with Sunday holidays observed on the following Monday (MOM footnote "*The following
;;;; Monday will be a public holiday"). 2000-2019: base SG with the caveats in :gaps.
;;;; Half days: eves of CNY / Christmas / New Year on trading days; see XSES-hours.md.

(:name "XSES"
 :title "Singapore Exchange securities market trading days"
 :authority "Singapore gazetted public holidays (MOM yearly press releases); SGX Regulatory Notice 8.2.1 (market phases, half-day trading)" :authority-uri "https://rulebook.sgx.com/node/1771"
 :bases ((:calendar "SG" :from nil :to (2019 12 31)
          :authority "ASSUMPTION for 2000-2019: no SGX or MOM yearly list retrieved; SG civil corpus used. KNOWN DEFECTS of the SG corpus vs ec (see :gaps): missing Sunday->Monday observed days and several lunar dates one day off."))
 :rules ((:fixed "New Year's Day" 1 1 :observed :sunday-to-monday :authority "MOM Public Holidays 2020-2027 (e.g. 1 Jan 2023* Sunday, following Monday a public holiday) https://www.mom.gov.sg/newsroom/press-releases/2022/0408-public-holidays-for-2023")
         (:easter "Good Friday" -2 :authority "MOM Public Holidays 2020-2027 https://www.mom.gov.sg/newsroom/press-releases/2024/0805-public-holidays-for-2025")
         (:fixed "Labour Day" 5 1 :observed :sunday-to-monday :authority "MOM Public Holidays 2022 (1 May 2022* Sunday) https://www.mom.gov.sg/newsroom/press-releases/2021/1021-revised-dates-for-hari-raya-puasa-and--hari-raya-haji-public-holidays-in-2022")
         (:fixed "National Day" 8 9 :observed :sunday-to-monday :authority "MOM Public Holidays 2020 / 2026 (9 Aug Sunday; Monday 10 Aug a public holiday) https://www.mom.gov.sg/newsroom/press-releases/2025/0616-public-holidays-for-2026")
         (:fixed "Christmas Day" 12 25 :observed :sunday-to-monday :authority "MOM Public Holidays 2022 (25 Dec 2022* Sunday) https://www.mom.gov.sg/newsroom/press-releases/2021/0406-public-holidays-2022"))
 :gaps (
   (:years "2000-2019" :note "No SGX yearly securities calendar and no MOM yearly press release retrieved (MOM newsroom URLs for the 2018 and 2019 lists 404; older releases not on mom.gov.sg; web.archive.org unreachable). The SG civil corpus disagrees with ec on: 2000-02-07 (CNY observed), 2000-05-18 (Vesak), 2001-03-06 (Haji; corpus 03-05), 2001-12-17 (Puasa observed), 2002-02-22 (corpus Haji; ec open, 23 Feb Sat), 2002-12-06 (Puasa; corpus 12-05), 2003-02-03, 2003-02-12 (Haji; corpus 02-11), 2003-10-24 (Deepavali; corpus 10-23), 2004-02-02, 2004-11-15, 2005-05-02, 2005-12-26, 2006-01-02, 2006-01-31, 2006-10-24 (Puasa; corpus 10-23), 2007-01-02, 2007-02-20, 2009-08-10, 2009-09-21, 2010-02-16, 2010-11-17 (Haji; corpus 11-16), 2011-05-02, 2011-11-07, 2011-12-26, 2012-01-02, 2012-08-20, 2013-02-12, 2013-11-04 (corpus Deepavali; ec open), 2014-10-06, 2015-08-07, 2015-08-10, 2015-09-11, 2015-09-24 (Haji; corpus 09-23), 2016-05-02, 2016-09-12, 2016-12-26, 2017-01-02, 2017-01-30, 2017-06-26, 2018-08-22 (Haji; corpus 08-21), 2019-06-05 (Puasa; corpus 06-04), 2019-08-12. ec's pattern (observed Mondays, MUIS dates) matches the MOM lists in 2020-2026 exactly, so ec is the better guess for 2000-2019, but none of these is verified against an SGX or MOM document.")
   (:years "2028" :note "MOM publishes the 2028 list around mid-2027; not yet available."))
 :notices (
   (:title "MOM: Public Holidays for 2020 (SGX securities market closes on Singapore gazetted public holidays)" :year 2020
    :uri "https://www.mom.gov.sg/newsroom/press-releases/2019/0408-public-holidays-for-2020"
    :issued (2019 4 8) :issued-uri "https://www.mom.gov.sg/newsroom/press-releases/2019/0408-public-holidays-for-2020"
    :published (2019 4 8) :published-uri "https://www.mom.gov.sg/newsroom/press-releases/2019/0408-public-holidays-for-2020"
    :published-in "Ministry of Manpower press release (gazetted public holidays)"
    :dates-note nil
    :closed (((2020 1 27) "Chinese New Year (observed; 26 Jan is Sunday)") ((2020 5 7) "Vesak Day") ((2020 5 25) "Hari Raya Puasa (observed; 24 May is Sunday)") ((2020 7 10) "Polling Day (GE2020)") ((2020 7 31) "Hari Raya Haji") ((2020 11 14) "Deepavali"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "SGX half-day trading 2020 (eves of Chinese New Year, Christmas, New Year on trading days)" :year 2020
    :uri "https://statrec.com/sr/holiday/sg/"
    :issued nil :issued-uri nil :published nil :published-uri "https://statrec.com/sr/holiday/sg/"
    :published-in "secondary (StatRec SGX holiday page); session shape from SGX Regulatory Notice 8.2.1 https://rulebook.sgx.com/node/1771"
    :dates-note "Dates derived from the half-day rule (eve on a business day) applied to the MOM 2020 list; SGX's own yearly calendar on sgx.com is served through api2.sgx.com/content-api, which could not be fetched here. Trading Phase ends 12:00 (Closing Routine to 12:06) per RN 8.2.1 since 2017-11-13."
    :confidence :secondary
    :closed () :open ()
    :early-closes (((2020 1 24) (12 0) "eve of Chinese New Year: half-day trading, morning session only") ((2020 12 24) (12 0) "Christmas Eve: half-day trading, morning session only") ((2020 12 31) (12 0) "New Year's Eve: half-day trading, morning session only"))
    :late-opens ())
   (:title "MOM: Public Holidays for 2021 (SGX securities market closes on Singapore gazetted public holidays)" :year 2021
    :uri "https://www.mom.gov.sg/newsroom/press-releases/2020/0624-public-holidays-for-2021"
    :issued (2020 6 24) :issued-uri "https://www.mom.gov.sg/newsroom/press-releases/2020/0624-public-holidays-for-2021"
    :published (2020 6 24) :published-uri "https://www.mom.gov.sg/newsroom/press-releases/2020/0624-public-holidays-for-2021"
    :published-in "Ministry of Manpower press release (gazetted public holidays)"
    :dates-note nil
    :closed (((2021 2 12) "Chinese New Year") ((2021 2 13) "Chinese New Year day 2") ((2021 5 13) "Hari Raya Puasa") ((2021 5 26) "Vesak Day") ((2021 7 20) "Hari Raya Haji") ((2021 11 4) "Deepavali"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "SGX half-day trading 2021 (eves of Chinese New Year, Christmas, New Year on trading days)" :year 2021
    :uri "https://statrec.com/sr/holiday/sg/"
    :issued nil :issued-uri nil :published nil :published-uri "https://statrec.com/sr/holiday/sg/"
    :published-in "secondary (StatRec SGX holiday page); session shape from SGX Regulatory Notice 8.2.1 https://rulebook.sgx.com/node/1771"
    :dates-note "Dates derived from the half-day rule (eve on a business day) applied to the MOM 2021 list; SGX's own yearly calendar on sgx.com is served through api2.sgx.com/content-api, which could not be fetched here. Trading Phase ends 12:00 (Closing Routine to 12:06) per RN 8.2.1 since 2017-11-13."
    :confidence :secondary
    :closed () :open ()
    :early-closes (((2021 2 11) (12 0) "eve of Chinese New Year: half-day trading, morning session only") ((2021 12 24) (12 0) "Christmas Eve: half-day trading, morning session only") ((2021 12 31) (12 0) "New Year's Eve: half-day trading, morning session only"))
    :late-opens ())
   (:title "MOM: Public Holidays for 2022 (SGX securities market closes on Singapore gazetted public holidays)" :year 2022
    :uri "https://www.mom.gov.sg/newsroom/press-releases/2021/1021-revised-dates-for-hari-raya-puasa-and--hari-raya-haji-public-holidays-in-2022"
    :issued (2021 10 21) :issued-uri "https://www.mom.gov.sg/newsroom/press-releases/2021/1021-revised-dates-for-hari-raya-puasa-and--hari-raya-haji-public-holidays-in-2022"
    :published (2021 10 21) :published-uri "https://www.mom.gov.sg/newsroom/press-releases/2021/1021-revised-dates-for-hari-raya-puasa-and--hari-raya-haji-public-holidays-in-2022"
    :published-in "Ministry of Manpower press release (gazetted public holidays)"
    :dates-note "Revised list (Muis revision): Hari Raya Puasa moved 2 -> 3 May 2022, Hari Raya Haji 9 -> 10 Jul 2022 (observed Mon 11 Jul). Original list: https://www.mom.gov.sg/newsroom/press-releases/2021/0406-public-holidays-2022 (2021-04-06)."
    :closed (((2022 2 1) "Chinese New Year") ((2022 2 2) "Chinese New Year day 2") ((2022 5 3) "Hari Raya Puasa") ((2022 5 16) "Vesak Day (observed; 15 May is Sunday)") ((2022 7 11) "Hari Raya Haji (observed; 10 Jul is Sunday)") ((2022 10 24) "Deepavali"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "SGX half-day trading 2022 (eves of Chinese New Year, Christmas, New Year on trading days)" :year 2022
    :uri "https://statrec.com/sr/holiday/sg/"
    :issued nil :issued-uri nil :published nil :published-uri "https://statrec.com/sr/holiday/sg/"
    :published-in "secondary (StatRec SGX holiday page); session shape from SGX Regulatory Notice 8.2.1 https://rulebook.sgx.com/node/1771"
    :dates-note "Dates derived from the half-day rule (eve on a business day) applied to the MOM 2022 list; SGX's own yearly calendar on sgx.com is served through api2.sgx.com/content-api, which could not be fetched here. Trading Phase ends 12:00 (Closing Routine to 12:06) per RN 8.2.1 since 2017-11-13."
    :confidence :secondary
    :closed () :open ()
    :early-closes (((2022 1 31) (12 0) "eve of Chinese New Year: half-day trading, morning session only"))
    :late-opens ())
   (:title "MOM: Public Holidays for 2023 (SGX securities market closes on Singapore gazetted public holidays)" :year 2023
    :uri "https://www.mom.gov.sg/newsroom/press-releases/2022/0929-revised-date-for-vesak-day-2023"
    :issued (2022 9 29) :issued-uri "https://www.mom.gov.sg/newsroom/press-releases/2022/0929-revised-date-for-vesak-day-2023"
    :published (2022 9 29) :published-uri "https://www.mom.gov.sg/newsroom/press-releases/2022/0929-revised-date-for-vesak-day-2023"
    :published-in "Ministry of Manpower press release (gazetted public holidays)"
    :dates-note "Revised list (Vesak Day 3 Jun -> 2 Jun 2023). Original: https://www.mom.gov.sg/newsroom/press-releases/2022/0408-public-holidays-for-2023 (2022-04-08). Polling Day 1 Sep 2023: https://www.mom.gov.sg/newsroom/press-releases/2023/0822-public-holiday-on-polling-day---1-sep-2023 (2023-08-22)."
    :closed (((2023 1 23) "Chinese New Year day 2") ((2023 1 24) "Chinese New Year (observed; 22 Jan is Sunday)") ((2023 6 2) "Vesak Day") ((2023 6 29) "Hari Raya Haji") ((2023 9 1) "Polling Day (Presidential Election 2023)") ((2023 11 13) "Deepavali (observed; 12 Nov is Sunday)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "SGX half-day trading 2023 (eves of Chinese New Year, Christmas, New Year on trading days)" :year 2023
    :uri "https://statrec.com/sr/holiday/sg/"
    :issued nil :issued-uri nil :published nil :published-uri "https://statrec.com/sr/holiday/sg/"
    :published-in "secondary (StatRec SGX holiday page); session shape from SGX Regulatory Notice 8.2.1 https://rulebook.sgx.com/node/1771"
    :dates-note "Dates derived from the half-day rule (eve on a business day) applied to the MOM 2023 list; SGX's own yearly calendar on sgx.com is served through api2.sgx.com/content-api, which could not be fetched here. Trading Phase ends 12:00 (Closing Routine to 12:06) per RN 8.2.1 since 2017-11-13."
    :confidence :secondary
    :closed () :open ()
    :early-closes ()
    :late-opens ())
   (:title "MOM: Public Holidays for 2024 (SGX securities market closes on Singapore gazetted public holidays)" :year 2024
    :uri "https://www.mom.gov.sg/newsroom/press-releases/2023/0524-public-holidays-for-2024"
    :issued (2023 5 24) :issued-uri "https://www.mom.gov.sg/newsroom/press-releases/2023/0524-public-holidays-for-2024"
    :published (2023 5 24) :published-uri "https://www.mom.gov.sg/newsroom/press-releases/2023/0524-public-holidays-for-2024"
    :published-in "Ministry of Manpower press release (gazetted public holidays)"
    :dates-note nil
    :closed (((2024 2 12) "Chinese New Year (observed; 11 Feb is Sunday)") ((2024 4 10) "Hari Raya Puasa") ((2024 5 22) "Vesak Day") ((2024 6 17) "Hari Raya Haji") ((2024 10 31) "Deepavali"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "SGX half-day trading 2024 (eves of Chinese New Year, Christmas, New Year on trading days)" :year 2024
    :uri "https://statrec.com/sr/holiday/sg/"
    :issued nil :issued-uri nil :published nil :published-uri "https://statrec.com/sr/holiday/sg/"
    :published-in "secondary (StatRec SGX holiday page); session shape from SGX Regulatory Notice 8.2.1 https://rulebook.sgx.com/node/1771"
    :dates-note "Dates derived from the half-day rule (eve on a business day) applied to the MOM 2024 list; SGX's own yearly calendar on sgx.com is served through api2.sgx.com/content-api, which could not be fetched here. Trading Phase ends 12:00 (Closing Routine to 12:06) per RN 8.2.1 since 2017-11-13."
    :confidence :secondary
    :closed () :open ()
    :early-closes (((2024 2 9) (12 0) "eve of Chinese New Year: half-day trading, morning session only") ((2024 12 24) (12 0) "Christmas Eve: half-day trading, morning session only") ((2024 12 31) (12 0) "New Year's Eve: half-day trading, morning session only"))
    :late-opens ())
   (:title "MOM: Public Holidays for 2025 (SGX securities market closes on Singapore gazetted public holidays)" :year 2025
    :uri "https://www.mom.gov.sg/newsroom/press-releases/2024/0805-public-holidays-for-2025"
    :issued (2024 8 5) :issued-uri "https://www.mom.gov.sg/newsroom/press-releases/2024/0805-public-holidays-for-2025"
    :published (2024 8 5) :published-uri "https://www.mom.gov.sg/newsroom/press-releases/2024/0805-public-holidays-for-2025"
    :published-in "Ministry of Manpower press release (gazetted public holidays)"
    :dates-note "Polling Day Sat 3 May 2025 (GE2025) is a public holiday on a Saturday, no weekday closure: https://www.mom.gov.sg/newsroom/press-releases/2025/0415-public-holiday-on-polling-day_3-may-2025."
    :closed (((2025 1 29) "Chinese New Year") ((2025 1 30) "Chinese New Year day 2") ((2025 3 31) "Hari Raya Puasa") ((2025 5 12) "Vesak Day") ((2025 10 20) "Deepavali"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "SGX half-day trading 2025 (eves of Chinese New Year, Christmas, New Year on trading days)" :year 2025
    :uri "https://statrec.com/sr/holiday/sg/"
    :issued nil :issued-uri nil :published nil :published-uri "https://statrec.com/sr/holiday/sg/"
    :published-in "secondary (StatRec SGX holiday page); session shape from SGX Regulatory Notice 8.2.1 https://rulebook.sgx.com/node/1771"
    :dates-note "Dates derived from the half-day rule (eve on a business day) applied to the MOM 2025 list; SGX's own yearly calendar on sgx.com is served through api2.sgx.com/content-api, which could not be fetched here. Trading Phase ends 12:00 (Closing Routine to 12:06) per RN 8.2.1 since 2017-11-13."
    :confidence :secondary
    :closed () :open ()
    :early-closes (((2025 1 28) (12 0) "eve of Chinese New Year: half-day trading, morning session only") ((2025 12 24) (12 0) "Christmas Eve: half-day trading, morning session only") ((2025 12 31) (12 0) "New Year's Eve: half-day trading, morning session only"))
    :late-opens ())
   (:title "MOM: Public Holidays for 2026 (SGX securities market closes on Singapore gazetted public holidays)" :year 2026
    :uri "https://www.mom.gov.sg/newsroom/press-releases/2025/0616-public-holidays-for-2026"
    :issued (2025 6 16) :issued-uri "https://www.mom.gov.sg/newsroom/press-releases/2025/0616-public-holidays-for-2026"
    :published (2025 6 16) :published-uri "https://www.mom.gov.sg/newsroom/press-releases/2025/0616-public-holidays-for-2026"
    :published-in "Ministry of Manpower press release (gazetted public holidays)"
    :dates-note nil
    :closed (((2026 2 17) "Chinese New Year") ((2026 2 18) "Chinese New Year day 2") ((2026 5 27) "Hari Raya Haji") ((2026 6 1) "Vesak Day (observed; 31 May is Sunday)") ((2026 11 9) "Deepavali (observed; 8 Nov is Sunday)"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "SGX half-day trading 2026 (eves of Chinese New Year, Christmas, New Year on trading days)" :year 2026
    :uri "https://statrec.com/sr/holiday/sg/"
    :issued nil :issued-uri nil :published nil :published-uri "https://statrec.com/sr/holiday/sg/"
    :published-in "secondary (StatRec SGX holiday page); session shape from SGX Regulatory Notice 8.2.1 https://rulebook.sgx.com/node/1771"
    :dates-note "Dates derived from the half-day rule (eve on a business day) applied to the MOM 2026 list; SGX's own yearly calendar on sgx.com is served through api2.sgx.com/content-api, which could not be fetched here. Trading Phase ends 12:00 (Closing Routine to 12:06) per RN 8.2.1 since 2017-11-13."
    :confidence :secondary
    :closed () :open ()
    :early-closes (((2026 2 16) (12 0) "eve of Chinese New Year: half-day trading, morning session only") ((2026 12 24) (12 0) "Christmas Eve: half-day trading, morning session only") ((2026 12 31) (12 0) "New Year's Eve: half-day trading, morning session only"))
    :late-opens ())
   (:title "MOM: Public Holidays for 2027 (SGX securities market closes on Singapore gazetted public holidays)" :year 2027
    :uri "https://www.mom.gov.sg/newsroom/press-releases/2026/0618-public-holidays-for-2027"
    :issued (2026 6 18) :issued-uri "https://www.mom.gov.sg/newsroom/press-releases/2026/0618-public-holidays-for-2027"
    :published (2026 6 18) :published-uri "https://www.mom.gov.sg/newsroom/press-releases/2026/0618-public-holidays-for-2027"
    :published-in "Ministry of Manpower press release (gazetted public holidays)"
    :dates-note nil
    :closed (((2027 2 8) "Chinese New Year (observed; 7 Feb is Sunday)") ((2027 3 10) "Hari Raya Puasa") ((2027 5 17) "Hari Raya Haji") ((2027 5 20) "Vesak Day") ((2027 10 28) "Deepavali"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "SGX half-day trading 2027 (eves of Chinese New Year, Christmas, New Year on trading days)" :year 2027
    :uri "https://statrec.com/sr/holiday/sg/"
    :issued nil :issued-uri nil :published nil :published-uri "https://statrec.com/sr/holiday/sg/"
    :published-in "secondary (StatRec SGX holiday page); session shape from SGX Regulatory Notice 8.2.1 https://rulebook.sgx.com/node/1771"
    :dates-note "Dates derived from the half-day rule (eve on a business day) applied to the MOM 2027 list; SGX's own yearly calendar on sgx.com is served through api2.sgx.com/content-api, which could not be fetched here. Trading Phase ends 12:00 (Closing Routine to 12:06) per RN 8.2.1 since 2017-11-13."
    :confidence :secondary
    :closed () :open ()
    :early-closes (((2027 2 5) (12 0) "eve of Chinese New Year: half-day trading, morning session only") ((2027 12 24) (12 0) "Christmas Eve: half-day trading, morning session only") ((2027 12 31) (12 0) "New Year's Eve: half-day trading, morning session only"))
    :late-opens ())
 ))
