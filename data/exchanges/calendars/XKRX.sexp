;;;; XKRX exchange trading-day calendar (#49).
;;;; Cached sources: ~/.cache/cl-stack-calendars/exchanges/xkrx/ (krx-holidays-<Y>.json = KRX open-data
;;;; holiday query results; GLB*.html = global.krx.co.kr pages; kind-*.htm = KRX KIND market notices).
;;;; Finding: KRX closes on (1) public holidays under the Regulation on Holidays of Government Offices
;;;; (= KR civil calendar, incl. election days and temporary holidays), (2) Labor Day (May 1),
;;;; (3) Saturdays, (4) the last day of the year (Dec 31; if Saturday/Sunday the preceding weekday),
;;;; (5) days the Exchange designates. KRX's own lists 2009-2027 are complete and equal KR base +
;;;; Labor Day + year-end day. 2000-2008 the KRX database returns partial lists only.
;;;; One-offs: 2000-01-03 and 2000-12-27/28 closed (KRX list, no reason given).
;;;; ec differs from KRX on 2026-07-17 and 2027-07-19 (Constitution Day restored as a public holiday;
;;;; KRX lists both as closed) -- see XKRX-differences.sexp.
;;;; Late opens (first trading day 10:00; CSAT day 10:00-16:30) are in the notices where a KRX
;;;; notice was found and described as a rule in XKRX-hours.md.
;;;; NEW FUNCTION NEEDED: krx-year-end-closing-day (Y) -> Dec 31 of Y if Mon-Fri, else the Friday
;;;; before (Dec 30 if Dec 31 is Saturday, Dec 29 if Sunday). Matches every KRX list 2000-2027
;;;; (2005-12-30, 2006-12-29, 2011-12-30, 2016-12-30, 2017-12-29, 2022-12-30, 2023-12-29).
(:name "XKRX"
 :title "Korea Exchange (KOSPI) trading days"
 :authority "Korea Exchange, Global KRX 'Trading Hours' page, Exchange Holidays (Securities Market Business Regulation Art. 5)"
 :authority-uri "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp"
 :bases ((:calendar "KR" :from nil :to nil
          :authority "Global KRX Trading Hours: Exchange Holidays include 'Public holidays in accordance with the Regulation on Government and Public Offices Holidays' https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp"))
 :rules ((:fixed "Labor Day" 5 1 :from 2000
          :authority "Global KRX Trading Hours: 'Labor Day according to the Act on Establishment of Labor Day (May 1)' https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp ; KRX lists 2009-2027 (근로자의날). 2001-05-01: ec says session, no KRX list -- open question.")
         (:computed "Year-end closing day" krx-year-end-closing-day :from 2000
          :authority "Global KRX Trading Hours: 'Last day of the year (other than a public holiday or Saturday)'; Global KRX Trading Days and Holidays: 'December 31st (a day right before December 31st when it is a holiday)' https://global.krx.co.kr/contents/GLB/06/0606/0606030101/GLB0606030101T3.jsp ; KRX lists 연말휴장일"))
 :gaps ((:years "2000-2008"
         :note "KRX open-data holiday query returns only partial lists (2000: 01-03, 12-27..29; 2001-2004, 2007: 01-01, 12-31; 2005: 12-30; 2006: 12-29; 2008: 9 entries without Lunar New Year or May 1). Civil holidays, Labor Day and elections in these years are not confirmed by a KRX list; KRX notices/press releases of that period are not online (open.krx.co.kr press archive not reachable by API; web.archive.org offline). First year with a complete KRX list: 2009."))
 :notices
 (
  (:title "KRX market holidays 2000 (KRX open data, 휴장일 query search_bas_yy=2000, gridTp=KRX)" :year 2000
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. PARTIAL list: the KRX database returns only some of that year's closures (no civil holidays). Entries: 01-03, 12-27, 12-28, 12-29"
   :closed (((2000 1 3) "KRX holiday list entry (no name given); market closed") ((2000 12 27) "KRX holiday list entry (no name given); year-end closure") ((2000 12 28) "KRX holiday list entry (no name given); year-end closure")) :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2001 (KRX open data, 휴장일 query search_bas_yy=2001, gridTp=KRX)" :year 2001
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. PARTIAL list: the KRX database returns only some of that year's closures (no civil holidays). Entries: 01-01, 12-31"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2002 (KRX open data, 휴장일 query search_bas_yy=2002, gridTp=KRX)" :year 2002
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. PARTIAL list: the KRX database returns only some of that year's closures (no civil holidays). Entries: 01-01, 12-31"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2003 (KRX open data, 휴장일 query search_bas_yy=2003, gridTp=KRX)" :year 2003
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. PARTIAL list: the KRX database returns only some of that year's closures (no civil holidays). Entries: 01-01, 12-31"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2004 (KRX open data, 휴장일 query search_bas_yy=2004, gridTp=KRX)" :year 2004
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. PARTIAL list: the KRX database returns only some of that year's closures (no civil holidays). Entries: 01-01, 12-31"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2005 (KRX open data, 휴장일 query search_bas_yy=2005, gridTp=KRX)" :year 2005
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. PARTIAL list: the KRX database returns only some of that year's closures (no civil holidays). Entries: 12-30"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2006 (KRX open data, 휴장일 query search_bas_yy=2006, gridTp=KRX)" :year 2006
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. PARTIAL list: the KRX database returns only some of that year's closures (no civil holidays). Entries: 12-29"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2007 (KRX open data, 휴장일 query search_bas_yy=2007, gridTp=KRX)" :year 2007
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. PARTIAL list: the KRX database returns only some of that year's closures (no civil holidays). Entries: 01-01, 12-31"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2008 (KRX open data, 휴장일 query search_bas_yy=2008, gridTp=KRX)" :year 2008
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. PARTIAL list: the KRX database returns only some of that year's closures (no civil holidays). Entries: 01-01, 04-09, 05-05, 05-12, 08-15, 09-15, 10-03, 12-25, 12-31"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2009 (KRX open data, 휴장일 query search_bas_yy=2009, gridTp=KRX)" :year 2009
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. Complete list (matches KR civil holidays + Labor Day + year-end closing day). Entries: 01-01, 01-26, 01-27, 05-01, 05-05, 10-02, 12-25, 12-31"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2010 (KRX open data, 휴장일 query search_bas_yy=2010, gridTp=KRX)" :year 2010
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. Complete list (matches KR civil holidays + Labor Day + year-end closing day). Entries: 01-01, 02-15, 03-01, 05-05, 05-21, 06-02, 09-21, 09-22, 09-23, 12-31"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2011 (KRX open data, 휴장일 query search_bas_yy=2011, gridTp=KRX)" :year 2011
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. Complete list (matches KR civil holidays + Labor Day + year-end closing day). Entries: 02-02, 02-03, 02-04, 03-01, 05-05, 05-10, 06-06, 08-15, 09-12, 09-13, 10-03, 12-30"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2012 (KRX open data, 휴장일 query search_bas_yy=2012, gridTp=KRX)" :year 2012
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. Complete list (matches KR civil holidays + Labor Day + year-end closing day). Entries: 01-23, 01-24, 03-01, 04-11, 05-01, 05-28, 06-06, 08-15, 10-01, 10-03, 12-19, 12-25, 12-31"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2013 (KRX open data, 휴장일 query search_bas_yy=2013, gridTp=KRX)" :year 2013
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. Complete list (matches KR civil holidays + Labor Day + year-end closing day). Entries: 01-01, 02-11, 03-01, 05-01, 05-17, 06-06, 08-15, 09-18, 09-19, 09-20, 10-03, 10-09, 12-25, 12-31"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2014 (KRX open data, 휴장일 query search_bas_yy=2014, gridTp=KRX)" :year 2014
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. Complete list (matches KR civil holidays + Labor Day + year-end closing day). Entries: 01-01 신정, 01-30 설날, 01-31 설날, 05-01 근로자의날, 05-05 어린이날, 05-06 석가탄신일, 06-04 지방선거, 06-06 현충일, 08-15 광복절, 09-08 추석, 09-09 추석, 09-10 추석(대체휴일제), 10-03 개천절, 10-09 한글날, 12-25 성탄절, 12-31 연말휴장일"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2015 (KRX open data, 휴장일 query search_bas_yy=2015, gridTp=KRX)" :year 2015
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. Complete list (matches KR civil holidays + Labor Day + year-end closing day). Entries: 01-01 신정, 02-18 설날, 02-19 설날, 02-20 설날, 05-01 근로자의날, 05-05 어린이날, 05-25 석가탄신일, 08-14 광복70주년 임시공휴일, 09-28 추석, 09-29 추석(대체휴일제), 10-09 한글날, 12-25 성탄절, 12-31 연말휴장일"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2016 (KRX open data, 휴장일 query search_bas_yy=2016, gridTp=KRX)" :year 2016
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. Complete list (matches KR civil holidays + Labor Day + year-end closing day). Entries: 01-01 신정, 02-08 설날, 02-09 설날, 02-10 설날, 03-01 삼일절, 04-13 국회의원 총선거, 05-05 어린이날, 05-06 임시공휴일, 06-06 현충일, 08-15 광복절, 09-14 추석, 09-15 추석, 09-16 추석, 10-03 개천절, 12-30 연말휴장일"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2017 (KRX open data, 휴장일 query search_bas_yy=2017, gridTp=KRX)" :year 2017
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. Complete list (matches KR civil holidays + Labor Day + year-end closing day). Entries: 01-27 설날, 01-30 설날(대체휴일), 03-01 삼일절, 05-01 근로자의날, 05-03 석가탄신일, 05-05 어린이날, 05-09 대통령 선거일, 06-06 현충일, 08-15 광복절, 10-02 임시 공휴일, 10-03 개천절, 10-04 추석, 10-05 추석, 10-06 추석(대체휴일), 10-09 한글날, 12-25 성탄절, 12-29 연말휴장일"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2018 (KRX open data, 휴장일 query search_bas_yy=2018, gridTp=KRX)" :year 2018
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. Complete list (matches KR civil holidays + Labor Day + year-end closing day). Entries: 01-01 신정, 02-15 설날, 02-16 설날, 03-01 삼일절, 05-01 근로자의날, 05-07 어린이날(대체휴일), 05-22 석가탄신일, 06-06 현충일, 06-13 지방선거, 08-15 광복절, 09-24 추석, 09-25 추석, 09-26 추석(대체휴일), 10-03 개천절, 10-09 한글날, 12-25 성탄절, 12-31 연말휴장일"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2019 (KRX open data, 휴장일 query search_bas_yy=2019, gridTp=KRX)" :year 2019
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. Complete list (matches KR civil holidays + Labor Day + year-end closing day). Entries: 01-01 신정, 02-04 설날, 02-05 설날, 02-06 설날, 03-01 삼일절, 05-01 근로자의날, 05-06 어린이날(대체휴일), 06-06 현충일, 08-15 광복절, 09-12 추석, 09-13 추석, 10-03 개천절, 10-09 한글날, 12-25 성탄절, 12-31 연말휴장일"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2020 (KRX open data, 휴장일 query search_bas_yy=2020, gridTp=KRX)" :year 2020
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. Complete list (matches KR civil holidays + Labor Day + year-end closing day). Entries: 01-01 신정, 01-24 설날, 01-27 설날(대체휴일), 04-15 21대 국회의원선거, 04-30 석가탄신일, 05-01 근로자의날, 05-05 어린이날, 08-17 임시공휴일, 09-30 추석, 10-01 추석, 10-02 추석, 10-09 한글날, 12-25 성탄절, 12-31 연말휴장일"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2021 (KRX open data, 휴장일 query search_bas_yy=2021, gridTp=KRX)" :year 2021
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. Complete list (matches KR civil holidays + Labor Day + year-end closing day). Entries: 01-01 신정, 02-11 설날, 02-12 설날, 03-01 삼일절, 05-05 어린이날, 05-19 석가탄신일, 08-16 광복절(대체휴일), 09-20 추석, 09-21 추석, 09-22 추석, 10-04 개천절(대체휴일), 10-11 한글날(대체휴일), 12-31 연말휴장일"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2022 (KRX open data, 휴장일 query search_bas_yy=2022, gridTp=KRX)" :year 2022
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. Complete list (matches KR civil holidays + Labor Day + year-end closing day). Entries: 01-31 설날, 02-01 설날, 02-02 설날, 03-01 삼일절, 03-09 20대 대통령 선거, 05-05 어린이날, 06-01 8회 지방선거, 06-06 현충일, 08-15 광복절, 09-09 추석, 09-12 추석(대체휴일), 10-03 개천절, 10-10 한글날(대체휴일), 12-30 연말휴장일"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2023 (KRX open data, 휴장일 query search_bas_yy=2023, gridTp=KRX)" :year 2023
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. Complete list (matches KR civil holidays + Labor Day + year-end closing day). Entries: 01-23 설날, 01-24 설날(대체휴일), 03-01 삼일절, 05-01 근로자의날, 05-05 어린이날, 05-29 석가탄신일(대체휴일), 06-06 현충일, 08-15 광복절, 09-28 추석, 09-29 추석, 10-02 임시공휴일, 10-03 개천절, 10-09 한글날, 12-25 성탄절, 12-29 연말휴장일"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2024 (KRX open data, 휴장일 query search_bas_yy=2024, gridTp=KRX)" :year 2024
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. Complete list (matches KR civil holidays + Labor Day + year-end closing day). Entries: 01-01 신정, 02-09 설날, 02-12 설날(대체휴일), 03-01 삼일절, 04-10 임시공휴일, 05-01 근로자의날, 05-06 어린이날(대체휴일), 05-15 석가탄신일, 06-06 현충일, 08-15 광복절, 09-16 추석, 09-17 추석, 09-18 추석, 10-01 임시공휴일, 10-03 개천절, 10-09 한글날, 12-25 성탄절, 12-31 연말휴장일"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2025 (KRX open data, 휴장일 query search_bas_yy=2025, gridTp=KRX)" :year 2025
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. Complete list (matches KR civil holidays + Labor Day + year-end closing day). Entries: 01-01 신정, 01-27 임시공휴일, 01-28 설날, 01-29 설날, 01-30 설날, 03-03 삼일절(대체휴일), 05-01 근로자의날, 05-05 석가탄신일, 05-06 어린이날(대체휴일), 06-03 임시공휴일, 06-06 현충일, 08-15 광복절, 10-03 개천절, 10-06 추석, 10-07 추석, 10-08 추석(대체휴일), 10-09 한글날, 12-25 성탄절, 12-31 연말휴장일"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2026 (KRX open data, 휴장일 query search_bas_yy=2026, gridTp=KRX)" :year 2026
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. Complete list (matches KR civil holidays + Labor Day + year-end closing day). Entries: 01-01 신정, 02-16 설날, 02-17 설날, 02-18 설날, 03-02 삼일절(대체휴일), 05-01 근로자의날, 05-05 어린이날, 05-25 석가탄신일(대체휴일), 06-03 임시공휴일, 07-17 제헌절, 08-17 광복절(대체휴일), 09-24 추석, 09-25 추석, 10-05 개천절(대체휴일), 10-09 한글날, 12-25 성탄절, 12-31 연말휴장일"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KRX market holidays 2027 (KRX open data, 휴장일 query search_bas_yy=2027, gridTp=KRX)" :year 2027
   :uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :issued nil :issued-uri nil
   :published nil :published-uri "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp"
   :published-in "KRX Open Data (open.krx.co.kr) 증시일정 > 휴장일, JSON via OPN99000001.jspx bld=MKD/01/0110/01100305/mkd01100305_01"
   :dates-note "Database query, no issue date. Complete list (matches KR civil holidays + Labor Day + year-end closing day). Entries: 01-01 신정, 02-08 설날, 02-09 설날(대체휴일), 03-01 삼일절, 05-03 노동절(대체휴일), 05-05 어린이날, 05-13 석가탄신일, 07-19 제헌절(대체휴일), 08-16 광복절(대체휴일), 09-14 추석, 09-15 추석, 09-16 추석, 10-04 개천절(대체휴일), 10-11 한글날(대체휴일), 12-27 성탄절(대체휴일), 12-31 연말휴장일"
   :closed () :open () :early-closes () :late-opens ())
  (:title "KIND market notice: 2024 year-end schedule and 2025 first trading day (2025-01-02) hours change"
   :uri "https://kind.krx.co.kr/external/2024/12/17/000102/20241216000236/70780.htm"
   :issued (2024 12 16) :issued-uri "https://kind.krx.co.kr/external/2024/12/17/000102/20241216000236/70780.htm"
   :published (2024 12 17) :published-uri "https://kind.krx.co.kr/external/2024/12/17/000102/20241216000236/70780.htm"
   :published-in "KRX KIND (kind.krx.co.kr) 기타시장안내, receipt no. 20241216000236"
   :dates-note "Issued date from the receipt number (20241216...), published date from the URL path (2024/12/17). Text: last trading day 2024-12-30, year-end holiday 2024-12-31 (also not a settlement day); 2025-01-02 regular session opens one hour late, 10:00-15:30, for the market opening ceremony. Basis: KOSDAQ Market Business Regulation Art. 4, 5 (same rule in the KOSPI regulation)."
   :closed () :open () :early-closes ()
   :late-opens ())
  (:title "KIND market notice (ETF issuer, citing KRX): CSAT day 2021-11-18 trading hours 10:00-16:30"
   :uri "https://kind.krx.co.kr/external/2021/11/17/000144/20211117000231/68629.htm"
   :issued (2021 11 17) :issued-uri "https://kind.krx.co.kr/external/2021/11/17/000144/20211117000231/68629.htm"
   :published (2021 11 17) :published-uri "https://kind.krx.co.kr/external/2021/11/17/000144/20211117000231/68629.htm"
   :published-in "KRX KIND (kind.krx.co.kr) ETF기타시장안내, receipt no. 20211117000231"
   :dates-note "Issuer notice on the KRX disclosure system, not a KRX notice itself: '2021년 11월 18일(목)은 대학수학능력시험일로 한국거래소 거래시간이 오전 10시부터 오후 4시 30분으로 1시간 순연됩니다 (기존: 오전 9시부터 오후 3시 30분)'. Close moves to 16:30 as well: the day's own hours (:sessions)."
   :confidence :secondary
   :closed () :open () :early-closes ()
   :late-opens ()
   :sessions (((2021 11 18) ((:open (10 0) :close (16 30))) "CSAT day: regular session shifted one hour, 10:00-16:30")))
  (:title "KRX announcement 2026-11-05 (reported): CSAT day 2026-11-19 regular session 10:00-16:30, no pre-market"
   :uri "https://khan.co.kr/article/202611051125001"
   :issued (2026 11 5) :issued-uri "https://khan.co.kr/article/202611051125001"
   :published (2026 11 5) :published-uri "https://khan.co.kr/article/202611051125001"
   :published-in "Kyunghyang Shinmun report of a KRX announcement (KRX notice itself not reachable: open.krx.co.kr press list is loaded by script)"
   :dates-note "Secondary copy. KRX shifts KOSPI/KOSDAQ/KONEX regular session start and end by one hour on 2026-11-19."
   :confidence :secondary
   :closed () :open () :early-closes ()
   :late-opens ()
   :sessions (((2026 11 19) ((:open (10 0) :close (16 30))) "CSAT day: regular session shifted one hour, 10:00-16:30")))
  (:title "KRX announcement 2024-10-31 (reported): CSAT day 2024-11-14 regular session opens 10:00"
   :uri "https://ceoscoredaily.com/page/view/2024103110533354200"
   :issued (2024 10 31) :issued-uri "https://ceoscoredaily.com/page/view/2024103110533354200"
   :published (2024 10 31) :published-uri "https://ceoscoredaily.com/page/view/2024103110533354200"
   :published-in "CEO Score Daily report of a KRX announcement (KRX press release not reachable)"
   :dates-note "Secondary copy: '한국거래소는 내달 14일 예정인 2025학년도 대학수학능력시험일 증권시장 정규시장을 10시로 늦춘다고 31일 밝혔다.' The report gives the after-hours session as 16:40-18:00, one hour later than usual, so the regular close is 16:30 (inferred; not stated)."
   :confidence :secondary
   :closed () :open () :early-closes () :late-opens ()
   :sessions (((2024 11 14) ((:open (10 0) :close (16 30))) "CSAT day: regular session shifted one hour, 10:00-16:30")))
  (:title "KRX announcement 2025-10-30 (reported): CSAT day 2025-11-13 regular session 10:00, close one hour later"
   :uri "https://news.bizwatch.co.kr/article/market/2025/10/30/0017"
   :issued (2025 10 30) :issued-uri "https://news.bizwatch.co.kr/article/market/2025/10/30/0017"
   :published (2025 10 30) :published-uri "https://news.bizwatch.co.kr/article/market/2025/10/30/0017"
   :published-in "Business Watch report of a KRX announcement (KRX press release not reachable)"
   :dates-note "Secondary copy: '한국거래소는 오는 11월 13일 대학수학능력시험일에 증권시장 정규장(대량·바스켓매매 포함)이 한시간 순연된 10시에 개장하고, 종료시간도 1시간 미뤄진다고 30일 밝혔다.'"
   :confidence :secondary
   :closed () :open () :early-closes () :late-opens ()
   :sessions (((2025 11 13) ((:open (10 0) :close (16 30))) "CSAT day: regular session shifted one hour, 10:00-16:30")))))
