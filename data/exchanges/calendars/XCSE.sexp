;; Draft research data (cl-stack-calendars #49). Primary sources only; see XCSE-hours.md and XCSE-differences.sexp.
;; :listed-closed / :listed-early-closes on yearly notices = the exchange list as published (weekend dates included when listed);
;; they are per-year evidence, not extra closures. :closed/:open/:early-closes hold only what rules+bases do not produce.
(:name "XCSE"
 :title "Nasdaq Copenhagen trading days (equities)"
 :authority "Nasdaq Nordic, Exchange Holiday Schedule (yearly); Københavns Fondsbørs Lukkedage (2003-2004)"
 :authority-uri "https://www.nasdaq.com/european-market-activity/trading-hours"
 :bases ((:calendar "DK" :from nil :to nil :authority "every listed Copenhagen closure 2003-2004 and 2008-2027 is a DK public holiday or one of the exchange-only days in :rules"))
 :rules (
   ;; on top of the DK civil calendar (Nytårsdag, Skærtorsdag, Langfredag, 2. påskedag, Store bededag (to 2023), Kristi himmelfart, 2. pinsedag, Juledag, 2. juledag)
   (:fixed "Grundlovsdag" 6 5 :from 2003 :authority "Københavns Fondsbørs Lukkedage 2003/2004 (https://web.archive.org/web/20030829214919/http://www.cse.dk:80/kf/lukkedage) and Nasdaq Nordic exchange holiday schedules 2008-2027 (nasdaqomxnordic.com/tradinghours via web.archive.org; nasdaq.com/european-market-activity/trading-hours): closed 5/6 every listed year")
   (:easter "Dagen efter Kristi himmelfart (banklukkedag)" 40 :from 2009
    :authority "Nasdaq Nordic exchange holiday schedules 2008-2027 (nasdaqomxnordic.com/tradinghours via web.archive.org; nasdaq.com/european-market-activity/trading-hours): first listed 2009 (21-22/5); absent in 2003, 2004 (https://web.archive.org/web/20030829214919/http://www.cse.dk:80/kf/lukkedage) and 2008 (https://web.archive.org/web/20090207122443/http://nasdaqomxnordic.com:80/tradinghours)")
   (:fixed "Juleaftensdag" 12 24 :from 2003 :authority "https://web.archive.org/web/20030829214919/http://www.cse.dk:80/kf/lukkedage; Nasdaq Nordic exchange holiday schedules 2008-2027 (nasdaqomxnordic.com/tradinghours via web.archive.org; nasdaq.com/european-market-activity/trading-hours)")
   (:fixed "Nytårsaftensdag" 12 31 :from 2003 :authority "https://web.archive.org/web/20030829214919/http://www.cse.dk:80/kf/lukkedage; Nasdaq Nordic exchange holiday schedules 2008-2027 (nasdaqomxnordic.com/tradinghours via web.archive.org; nasdaq.com/european-market-activity/trading-hours)"))
 :notices (
   (:title "Københavns Fondsbørs - Lukkedage 2003 og 2004" :year 2003
    :uri "https://web.archive.org/web/20030829214919/http://www.cse.dk:80/kf/lukkedage"
    :issued nil :issued-uri nil :published (2003 8 29) :published-uri "https://web.archive.org/web/20030829214919/http://www.cse.dk:80/kf/lukkedage"
    :published-in "Copenhagen Stock Exchange website, Om børsmarkedet - Handel - Lukkedage (web.archive.org snapshot)"
    :dates-note "Undated page; :published is the capture date (upper bound). One table covers 2003 and 2004."
    :listed-closed ((2003 1 1) (2003 4 17) (2003 4 18) (2003 4 21) (2003 5 16) (2003 5 29) (2003 6 5) (2003 6 9) (2003 12 24) (2003 12 25) (2003 12 26) (2003 12 31))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Københavns Fondsbørs - Lukkedage 2003 og 2004" :year 2004
    :uri "https://web.archive.org/web/20030829214919/http://www.cse.dk:80/kf/lukkedage"
    :issued nil :issued-uri nil :published (2003 8 29) :published-uri "https://web.archive.org/web/20030829214919/http://www.cse.dk:80/kf/lukkedage"
    :published-in "Copenhagen Stock Exchange website, Om børsmarkedet - Handel - Lukkedage (web.archive.org snapshot)"
    :dates-note "Undated page; :published is the capture date (upper bound). 5/6/2004 is a Saturday."
    :listed-closed ((2004 1 1) (2004 4 8) (2004 4 9) (2004 4 12) (2004 5 7) (2004 5 20) (2004 5 31) (2004 6 5) (2004 12 24) (2004 12 25) (2004 12 26) (2004 12 31))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Nasdaq Nordic exchange holiday schedule 2008 (Copenhagen, equities)" :year 2008
    :uri "https://web.archive.org/web/20090207122443/http://nasdaqomxnordic.com:80/tradinghours"
    :issued nil :issued-uri nil :published (2009 2 7) :published-uri "https://web.archive.org/web/20090207122443/http://nasdaqomxnordic.com:80/tradinghours"
    :published-in "Nasdaq OMX Nordic website, trading hours page, Exchange holiday schedule (web.archive.org snapshot)"
    :dates-note "Nasdaq does not date these lists; :published is the earliest web.archive.org capture of the page that shows the 2008 list (an upper bound). Listed in 2 capture(s), all identical."
    :listed-closed ((2008 1 1) (2008 3 20) (2008 3 21) (2008 3 24) (2008 4 18) (2008 5 1) (2008 5 12) (2008 6 5) (2008 12 24) (2008 12 25) (2008 12 26) (2008 12 31))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Nasdaq Nordic exchange holiday schedule 2009 (Copenhagen, equities)" :year 2009
    :uri "https://web.archive.org/web/20090207122443/http://nasdaqomxnordic.com:80/tradinghours"
    :issued nil :issued-uri nil :published (2009 2 7) :published-uri "https://web.archive.org/web/20090207122443/http://nasdaqomxnordic.com:80/tradinghours"
    :published-in "Nasdaq OMX Nordic website, trading hours page, Exchange holiday schedule (web.archive.org snapshot)"
    :dates-note "Nasdaq does not date these lists; :published is the earliest web.archive.org capture of the page that shows the 2009 list (an upper bound). Listed in 2 capture(s), all identical."
    :listed-closed ((2009 1 1) (2009 4 9) (2009 4 10) (2009 4 13) (2009 5 8) (2009 5 21) (2009 5 22) (2009 6 1) (2009 6 5) (2009 12 24) (2009 12 25) (2009 12 31))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Nasdaq Nordic exchange holiday schedule 2010 (Copenhagen, equities)" :year 2010
    :uri "https://web.archive.org/web/20110217191231/http://www.nasdaqomxnordic.com/tradinghours/"
    :issued nil :issued-uri nil :published (2011 2 17) :published-uri "https://web.archive.org/web/20110217191231/http://www.nasdaqomxnordic.com/tradinghours/"
    :published-in "Nasdaq OMX Nordic website, trading hours page, Exchange holiday schedule (web.archive.org snapshot)"
    :dates-note "Nasdaq does not date these lists; :published is the earliest web.archive.org capture of the page that shows the 2010 list (an upper bound). Listed in 1 capture(s), all identical."
    :listed-closed ((2010 1 1) (2010 4 1) (2010 4 2) (2010 4 5) (2010 4 30) (2010 5 13) (2010 5 14) (2010 5 24) (2010 12 24) (2010 12 31))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Nasdaq Nordic exchange holiday schedule 2011 (Copenhagen, equities)" :year 2011
    :uri "https://web.archive.org/web/20110217191231/http://www.nasdaqomxnordic.com/tradinghours/"
    :issued nil :issued-uri nil :published (2011 2 17) :published-uri "https://web.archive.org/web/20110217191231/http://www.nasdaqomxnordic.com/tradinghours/"
    :published-in "Nasdaq OMX Nordic website, trading hours page, Exchange holiday schedule (web.archive.org snapshot)"
    :dates-note "Nasdaq does not date these lists; :published is the earliest web.archive.org capture of the page that shows the 2011 list (an upper bound). Listed in 3 capture(s), all identical."
    :listed-closed ((2011 4 21) (2011 4 22) (2011 4 25) (2011 5 20) (2011 6 2) (2011 6 3) (2011 6 13) (2011 12 26))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Nasdaq Nordic exchange holiday schedule 2012 (Copenhagen, equities)" :year 2012
    :uri "https://web.archive.org/web/20111129080142/http://www.nasdaqomxnordic.com/tradinghours/?languageId=27"
    :issued nil :issued-uri nil :published (2011 11 29) :published-uri "https://web.archive.org/web/20111129080142/http://www.nasdaqomxnordic.com/tradinghours/?languageId=27"
    :published-in "Nasdaq OMX Nordic website, trading hours page, Exchange holiday schedule (web.archive.org snapshot)"
    :dates-note "Nasdaq does not date these lists; :published is the earliest web.archive.org capture of the page that shows the 2012 list (an upper bound). Listed in 3 capture(s), all identical."
    :listed-closed ((2012 4 5) (2012 4 6) (2012 4 9) (2012 5 4) (2012 5 17) (2012 5 18) (2012 5 28) (2012 6 5) (2012 12 24) (2012 12 25) (2012 12 26) (2012 12 31))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Nasdaq Nordic exchange holiday schedule 2013 (Copenhagen, equities)" :year 2013
    :uri "https://web.archive.org/web/20130102120138/http://www.nasdaqomxnordic.com:80/tradinghours"
    :issued nil :issued-uri nil :published (2013 1 2) :published-uri "https://web.archive.org/web/20130102120138/http://www.nasdaqomxnordic.com:80/tradinghours"
    :published-in "Nasdaq OMX Nordic website, trading hours page, Exchange holiday schedule (web.archive.org snapshot)"
    :dates-note "Nasdaq does not date these lists; :published is the earliest web.archive.org capture of the page that shows the 2013 list (an upper bound). Listed in 5 capture(s), all identical."
    :listed-closed ((2013 1 1) (2013 3 28) (2013 3 29) (2013 4 1) (2013 4 26) (2013 5 9) (2013 5 10) (2013 5 20) (2013 6 5) (2013 12 24) (2013 12 25) (2013 12 26) (2013 12 31))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Nasdaq Nordic exchange holiday schedule 2014 (Copenhagen, equities)" :year 2014
    :uri "https://web.archive.org/web/20140118200138/http://www.nasdaqomxnordic.com:80/tradinghours"
    :issued nil :issued-uri nil :published (2014 1 18) :published-uri "https://web.archive.org/web/20140118200138/http://www.nasdaqomxnordic.com:80/tradinghours"
    :published-in "Nasdaq OMX Nordic website, trading hours page, Exchange holiday schedule (web.archive.org snapshot)"
    :dates-note "Nasdaq does not date these lists; :published is the earliest web.archive.org capture of the page that shows the 2014 list (an upper bound). Listed in 5 capture(s), all identical."
    :listed-closed ((2014 1 1) (2014 4 17) (2014 4 18) (2014 4 21) (2014 5 16) (2014 5 29) (2014 5 30) (2014 6 5) (2014 6 9) (2014 12 24) (2014 12 25) (2014 12 26) (2014 12 31))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Nasdaq Nordic exchange holiday schedule 2015 (Copenhagen, equities)" :year 2015
    :uri "https://web.archive.org/web/20140118200138/http://www.nasdaqomxnordic.com:80/tradinghours"
    :issued nil :issued-uri nil :published (2014 1 18) :published-uri "https://web.archive.org/web/20140118200138/http://www.nasdaqomxnordic.com:80/tradinghours"
    :published-in "Nasdaq OMX Nordic website, trading hours page, Exchange holiday schedule (web.archive.org snapshot)"
    :dates-note "Nasdaq does not date these lists; :published is the earliest web.archive.org capture of the page that shows the 2015 list (an upper bound). Listed in 5 capture(s), all identical."
    :listed-closed ((2015 1 1) (2015 4 2) (2015 4 3) (2015 4 6) (2015 5 1) (2015 5 14) (2015 5 15) (2015 5 25) (2015 6 5) (2015 12 24) (2015 12 25) (2015 12 31))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Nasdaq Nordic exchange holiday schedule 2016 (Copenhagen, equities)" :year 2016
    :uri "https://web.archive.org/web/20151228173227/http://www.nasdaqomxnordic.com:80/tradinghours"
    :issued nil :issued-uri nil :published (2015 12 28) :published-uri "https://web.archive.org/web/20151228173227/http://www.nasdaqomxnordic.com:80/tradinghours"
    :published-in "Nasdaq OMX Nordic website, trading hours page, Exchange holiday schedule (web.archive.org snapshot)"
    :dates-note "Nasdaq does not date these lists; :published is the earliest web.archive.org capture of the page that shows the 2016 list (an upper bound). Listed in 7 capture(s), all identical."
    :listed-closed ((2016 1 1) (2016 3 24) (2016 3 25) (2016 3 28) (2016 4 22) (2016 5 5) (2016 5 6) (2016 5 16) (2016 12 26))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Nasdaq Nordic exchange holiday schedule 2017 (Copenhagen, equities)" :year 2017
    :uri "https://web.archive.org/web/20161210164214/http://www.nasdaqomxnordic.com:80/tradinghours"
    :issued nil :issued-uri nil :published (2016 12 10) :published-uri "https://web.archive.org/web/20161210164214/http://www.nasdaqomxnordic.com:80/tradinghours"
    :published-in "Nasdaq OMX Nordic website, trading hours page, Exchange holiday schedule (web.archive.org snapshot)"
    :dates-note "Nasdaq does not date these lists; :published is the earliest web.archive.org capture of the page that shows the 2017 list (an upper bound). Listed in 5 capture(s), all identical."
    :listed-closed ((2017 4 13) (2017 4 14) (2017 4 17) (2017 5 12) (2017 5 25) (2017 5 26) (2017 6 5) (2017 12 25) (2017 12 26))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Nasdaq Nordic exchange holiday schedule 2018 (Copenhagen, equities)" :year 2018
    :uri "https://web.archive.org/web/20171203020411/http://www.nasdaqomxnordic.com:80/tradinghours/?"
    :issued nil :issued-uri nil :published (2017 12 3) :published-uri "https://web.archive.org/web/20171203020411/http://www.nasdaqomxnordic.com:80/tradinghours/?"
    :published-in "Nasdaq OMX Nordic website, trading hours page, Exchange holiday schedule (web.archive.org snapshot)"
    :dates-note "Nasdaq does not date these lists; :published is the earliest web.archive.org capture of the page that shows the 2018 list (an upper bound). Listed in 5 capture(s), all identical."
    :listed-closed ((2018 1 1) (2018 3 29) (2018 3 30) (2018 4 2) (2018 4 27) (2018 5 10) (2018 5 11) (2018 5 21) (2018 6 5) (2018 12 24) (2018 12 25) (2018 12 26) (2018 12 31))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Nasdaq Nordic exchange holiday schedule 2019 (Copenhagen, equities)" :year 2019
    :uri "https://web.archive.org/web/20181202161500/http://www.nasdaqomxnordic.com:80/tradinghours/"
    :issued nil :issued-uri nil :published (2018 12 2) :published-uri "https://web.archive.org/web/20181202161500/http://www.nasdaqomxnordic.com:80/tradinghours/"
    :published-in "Nasdaq OMX Nordic website, trading hours page, Exchange holiday schedule (web.archive.org snapshot)"
    :dates-note "Nasdaq does not date these lists; :published is the earliest web.archive.org capture of the page that shows the 2019 list (an upper bound). Listed in 6 capture(s), all identical."
    :listed-closed ((2019 1 1) (2019 4 18) (2019 4 19) (2019 4 22) (2019 5 17) (2019 5 30) (2019 5 31) (2019 6 5) (2019 6 10) (2019 12 24) (2019 12 25) (2019 12 26) (2019 12 31))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Nasdaq Nordic exchange holiday schedule 2020 (Copenhagen, equities)" :year 2020
    :uri "https://web.archive.org/web/20191204150357/http://www.nasdaqomxnordic.com:80/tradinghours"
    :issued nil :issued-uri nil :published (2019 12 4) :published-uri "https://web.archive.org/web/20191204150357/http://www.nasdaqomxnordic.com:80/tradinghours"
    :published-in "Nasdaq OMX Nordic website, trading hours page, Exchange holiday schedule (web.archive.org snapshot)"
    :dates-note "Nasdaq does not date these lists; :published is the earliest web.archive.org capture of the page that shows the 2020 list (an upper bound). Listed in 7 capture(s), all identical."
    :listed-closed ((2020 1 1) (2020 4 9) (2020 4 10) (2020 4 13) (2020 5 8) (2020 5 21) (2020 5 22) (2020 6 1) (2020 6 5) (2020 12 24) (2020 12 25) (2020 12 31))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Nasdaq Nordic exchange holiday schedule 2021 (Copenhagen, equities)" :year 2021
    :uri "https://web.archive.org/web/20201105050642/http://www.nasdaqomxnordic.com/tradinghours/?languageId=3"
    :issued nil :issued-uri nil :published (2020 11 5) :published-uri "https://web.archive.org/web/20201105050642/http://www.nasdaqomxnordic.com/tradinghours/?languageId=3"
    :published-in "Nasdaq OMX Nordic website, trading hours page, Exchange holiday schedule (web.archive.org snapshot)"
    :dates-note "Nasdaq does not date these lists; :published is the earliest web.archive.org capture of the page that shows the 2021 list (an upper bound). Listed in 7 capture(s), all identical."
    :listed-closed ((2021 1 1) (2021 4 1) (2021 4 2) (2021 4 5) (2021 4 30) (2021 5 13) (2021 5 14) (2021 5 24) (2021 12 24) (2021 12 31))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Nasdaq Nordic exchange holiday schedule 2022 (Copenhagen, equities)" :year 2022
    :uri "https://web.archive.org/web/20211204044702/http://www.nasdaqomxnordic.com/tradinghours"
    :issued nil :issued-uri nil :published (2021 12 4) :published-uri "https://web.archive.org/web/20211204044702/http://www.nasdaqomxnordic.com/tradinghours"
    :published-in "Nasdaq OMX Nordic website, trading hours page, Exchange holiday schedule (web.archive.org snapshot)"
    :dates-note "Nasdaq does not date these lists; :published is the earliest web.archive.org capture of the page that shows the 2022 list (an upper bound). Listed in 5 capture(s), all identical."
    :listed-closed ((2022 4 14) (2022 4 15) (2022 4 18) (2022 5 13) (2022 5 26) (2022 5 27) (2022 6 6) (2022 12 26))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Nasdaq Nordic exchange holiday schedule 2023 (Copenhagen, equities)" :year 2023
    :uri "https://web.archive.org/web/20230313151436/https://www.nasdaqomxnordic.com/tradinghours/"
    :issued nil :issued-uri nil :published (2023 3 13) :published-uri "https://web.archive.org/web/20230313151436/https://www.nasdaqomxnordic.com/tradinghours/"
    :published-in "Nasdaq OMX Nordic website, trading hours page, Exchange holiday schedule (web.archive.org snapshot)"
    :dates-note "Nasdaq does not date these lists; :published is the earliest web.archive.org capture of the page that shows the 2023 list (an upper bound). Listed in 2 capture(s), all identical."
    :listed-closed ((2023 4 6) (2023 4 7) (2023 4 10) (2023 5 5) (2023 5 18) (2023 5 19) (2023 5 29) (2023 6 5) (2023 12 25) (2023 12 26))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Nasdaq Nordic exchange holiday schedule 2024 (Copenhagen, equities)" :year 2024
    :uri "https://web.archive.org/web/20240303024814/https://www.nasdaqomxnordic.com/tradinghours?utm_medium=Advertising&utm_source=Marketing"
    :issued nil :issued-uri nil :published (2024 3 3) :published-uri "https://web.archive.org/web/20240303024814/https://www.nasdaqomxnordic.com/tradinghours?utm_medium=Advertising&utm_source=Marketing"
    :published-in "Nasdaq OMX Nordic website, trading hours page, Exchange holiday schedule (web.archive.org snapshot)"
    :dates-note "Nasdaq does not date these lists; :published is the earliest web.archive.org capture of the page that shows the 2024 list (an upper bound). Listed in 2 capture(s), all identical."
    :listed-closed ((2024 1 1) (2024 3 28) (2024 3 29) (2024 4 1) (2024 5 9) (2024 5 10) (2024 5 20) (2024 6 5) (2024 12 24) (2024 12 25) (2024 12 26) (2024 12 31))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Nasdaq Nordic exchange holiday schedule 2025 (Copenhagen, equities)" :year 2025
    :uri "https://www.nasdaq.com/european-market-activity/trading-hours"
    :issued nil :issued-uri nil :published (2026 11 28) :published-uri "https://www.nasdaq.com/european-market-activity/trading-hours"
    :published-in "Nasdaq European Markets Trading Hours and Holiday Schedule page (fetched 2026-11-28)"
    :dates-note "Nasdaq does not date these lists; :published is the earliest web.archive.org capture of the page that shows the 2025 list (an upper bound). Listed in 1 capture(s), all identical."
    :listed-closed ((2025 1 1) (2025 4 17) (2025 4 18) (2025 4 21) (2025 5 29) (2025 5 30) (2025 6 5) (2025 6 9) (2025 12 24) (2025 12 25) (2025 12 26) (2025 12 31))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Nasdaq Nordic exchange holiday schedule 2026 (Copenhagen, equities)" :year 2026
    :uri "https://www.nasdaq.com/european-market-activity/trading-hours"
    :issued nil :issued-uri nil :published (2026 11 28) :published-uri "https://www.nasdaq.com/european-market-activity/trading-hours"
    :published-in "Nasdaq European Markets Trading Hours and Holiday Schedule page (fetched 2026-11-28)"
    :dates-note "Nasdaq does not date these lists; :published is the earliest web.archive.org capture of the page that shows the 2026 list (an upper bound). Listed in 1 capture(s), all identical."
    :listed-closed ((2026 1 1) (2026 4 2) (2026 4 3) (2026 4 6) (2026 5 14) (2026 5 15) (2026 5 25) (2026 6 5) (2026 12 24) (2026 12 25) (2026 12 31))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())
   (:title "Nasdaq Nordic exchange holiday schedule 2027 (Copenhagen, equities)" :year 2027
    :uri "https://www.nasdaq.com/european-market-activity/trading-hours"
    :issued nil :issued-uri nil :published (2026 11 28) :published-uri "https://www.nasdaq.com/european-market-activity/trading-hours"
    :published-in "Nasdaq European Markets Trading Hours and Holiday Schedule page (fetched 2026-11-28)"
    :dates-note "Nasdaq does not date these lists; :published is the earliest web.archive.org capture of the page that shows the 2027 list (an upper bound). Listed in 1 capture(s), all identical."
    :listed-closed ((2027 1 1) (2027 3 25) (2027 3 26) (2027 3 29) (2027 5 6) (2027 5 7) (2027 5 17) (2027 12 24) (2027 12 31))
    :listed-early-closes ()
    :closed () :open () :early-closes () :late-opens ())))
