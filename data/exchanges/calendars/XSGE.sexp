;;;; XSGE — Shanghai Futures Exchange trading days.
;;;; Sources cached under ~/.cache/cl-stack-calendars/exchanges/china-futures/ (shfe-t<date>_<id>.html).
;;;; Finding: SHFE yearly 放假和休市安排 notices exist on shfe.com.cn for 2002-2023 and 2025-2026 (2024 not
;;;; found). From 2006 they close exactly on the CN civil (State Council) holidays; weekend 调休 working days
;;;; are not trading days ("双休日照常公休" / "为周末休市"). Exchange-only closures 2002-2005 (longer Spring
;;;; Festival, 2002-09-30, SARS 2003-05-06..09) and 2024-02-09 (除夕, CSRC statement). One weekend session:
;;;; Saturday 2002-09-28. Night ("连续交易"/夜盘) sessions from 2013-07-05 never run on the evening before a
;;;; statutory holiday (see XSGE-hours.md) — that is an hours matter, not a closure.
(:name "XSGE"
 :title "Shanghai Futures Exchange trading days"
 :authority "SHFE yearly notices \"关于YYYY年(部分节假日放假和)休市安排的公告\", issued under the CSRC 部分节假日放假和休市安排 notice (\"根据中国证监会办公厅…精神，结合本市场实际情况\")"
 :authority-uri "https://www.shfe.com.cn/services/calenderandholidays/holiday/"
 :bases ((:calendar "CN" :from nil :to nil
          :authority "SHFE notices 2006-2026 close on exactly the State Council holidays, e.g. 2026: https://www.shfe.com.cn/publicnotice/notice/202512/t20251217_829805.html"))
 :rules ()
 :gaps ((:years "2000-2001"
         :note "shfe.com.cn notice list (crawled pages index_1..260) starts 2001-12; no 2000/2001 holiday notice. Unknown whether SHFE had extra Spring Festival closures (it did in 2002-2005).")
        (:years "2024"
         :note "SHFE 2024 yearly notice not in the crawled list (list has no 2024 entries); 2024-02-09 closure from the CSRC statement (cs.com.cn, :secondary). The DCE 2024 Spring Festival notice (http://www.dce.com.cn/dalianshangpin/ywfw/jystz/ywtz/8592261/index.html) could not be fetched (HTTP 412)."))
 :notices
 (
  (:title "关于2002年春节、\"五一\"、\"十一\"放假休市安排的公告"
   :year 2002
   :uri "https://www.shfe.com.cn/publicnotice/notice/200201/t20020125_783730.html"
   :issued (2002 1 23) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/200201/t20020125_783730.html"
   :published (2002 1 25) :published-uri "https://www.shfe.com.cn/publicnotice/notice/200201/t20020125_783730.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed (((2002 2 11) "春节休市 (exchange-only: longer than the civil Spring Festival holiday): 2月11日至2月18日放假休市") ((2002 9 30) "“十一”放假休市 9月30日至10月7日; 9月30日的交易日调至9月28日(星期六)"))
   :open (((2002 9 28) "Saturday make-up session: 将9月30日的交易日调至9月28日(星期六)"))
   :early-closes ()
   :late-opens ()
   :note "2002-09-28 (Saturday) was a trading day at SHFE; the exchange calendar weekend (6 7) needs a weekend-session override for it.")
  (:title "关于2003年部分节假日放假休市安排的公告"
   :year 2003
   :uri "https://www.shfe.com.cn/publicnotice/notice/200212/t20021214_783762.html"
   :issued (2002 12 20) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/200212/t20021214_783762.html"
   :published (2002 12 14) :published-uri "https://www.shfe.com.cn/publicnotice/notice/200212/t20021214_783762.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed (((2003 1 30) "春节休市 (exchange-only: longer than the civil Spring Festival holiday): 1月30日至2月7日") ((2003 1 31) "春节休市 (exchange-only: longer than the civil Spring Festival holiday): 1月30日至2月7日"))
   :open ()
   :early-closes ()
   :late-opens ()
   :note "May Day 5月1日至5月7日 in this notice was changed twice: 2003-04-22 (SARS, 5月1日至5月5日) and 2003-04-29 (extended to 5月1日至5月9日).")
  (:title "关于“五一”放假休市安排的通知"
   :year 2003
   :uri "https://www.shfe.com.cn/publicnotice/notice/200304/t20030417_783823.html"
   :issued (2003 4 16) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/200304/t20030417_783823.html"
   :published (2003 4 17) :published-uri "https://www.shfe.com.cn/publicnotice/notice/200304/t20030417_783823.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ()
   :note "Restates the original 5月1日至5月7日 window; cancelled by the 2003-04-22 notice (上期交办字[2003]65号 作废).")
  (:title "关于“五一”放假休市安排调整的通知"
   :year 2003
   :uri "https://www.shfe.com.cn/publicnotice/notice/200304/t20030422_783830.html"
   :issued (2003 4 22) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/200304/t20030422_783830.html"
   :published (2003 4 22) :published-uri "https://www.shfe.com.cn/publicnotice/notice/200304/t20030422_783830.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ()
   :note "SARS adjustment per CSRC: 5月1日至5月5日休市, 5月6日恢复开市 (= the amended civil holiday). Superseded by 2003-04-29.")
  (:title "关于延长“五一”休市安排的通知"
   :year 2003
   :uri "https://www.shfe.com.cn/publicnotice/notice/200304/t20030429_783837.html"
   :issued (2003 4 29) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/200304/t20030429_783837.html"
   :published (2003 4 29) :published-uri "https://www.shfe.com.cn/publicnotice/notice/200304/t20030429_783837.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed (((2003 5 6) "延长“五一”休市 (SARS): 5月1日至5月9日, 5月12日恢复正常开市") ((2003 5 7) "延长“五一”休市 (SARS)") ((2003 5 8) "延长“五一”休市 (SARS)") ((2003 5 9) "延长“五一”休市 (SARS)"))
   :open ()
   :early-closes ()
   :late-opens ()
   :note "Issue #92: no trading 2003-05-06/07 (nor 05-08/09) at SHFE; reopened 2003-05-12. 5月9日 office open for non-trading services only.")
  (:title "关于2004年部分节日放假休市安排的公告"
   :year 2004
   :uri "https://www.shfe.com.cn/publicnotice/notice/200312/t20031225_784078.html"
   :issued (2003 12 24) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/200312/t20031225_784078.html"
   :published (2003 12 25) :published-uri "https://www.shfe.com.cn/publicnotice/notice/200312/t20031225_784078.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed (((2004 1 19) "春节休市 (exchange-only: longer than the civil Spring Festival holiday)") ((2004 1 20) "春节休市 (exchange-only: longer than the civil Spring Festival holiday)") ((2004 1 21) "春节休市 (exchange-only: longer than the civil Spring Festival holiday)"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2005年部分节假日放假休市安排的公告"
   :year 2005
   :uri "https://www.shfe.com.cn/publicnotice/notice/200412/t20041223_784575.html"
   :issued (2005 10 1) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/200412/t20041223_784575.html"
   :published (2004 12 23) :published-uri "https://www.shfe.com.cn/publicnotice/notice/200412/t20041223_784575.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note "Page is a later re-post on the exchange site; :issued = signature date of the notice, :published = date in the re-post URL."
   :closed (((2005 2 7) "春节休市 (exchange-only: longer than the civil Spring Festival holiday)") ((2005 2 8) "春节休市 (exchange-only: longer than the civil Spring Festival holiday)"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2006年部分节假日放假休市安排的公告"
   :year 2006
   :uri "https://www.shfe.com.cn/publicnotice/notice/200512/t20051223_785122.html"
   :issued (2005 12 23) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/200512/t20051223_785122.html"
   :published (2005 12 23) :published-uri "https://www.shfe.com.cn/publicnotice/notice/200512/t20051223_785122.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ()
   :note "2006 春节 1月28日-2月5日 = civil (unlike SZSE, which closed from 1月26日).")
  (:title "关于“五一”放假休市有关事宜的通知"
   :year 2006
   :uri "https://www.shfe.com.cn/publicnotice/notice/200604/t20060424_785299.html"
   :issued (2006 4 24) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/200604/t20060424_785299.html"
   :published (2006 4 24) :published-uri "https://www.shfe.com.cn/publicnotice/notice/200604/t20060424_785299.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2007年部分节假日放假和休市安排的公告"
   :year 2007
   :uri "https://www.shfe.com.cn/publicnotice/notice/200612/t20061221_785782.html"
   :issued (2006 12 20) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/200612/t20061221_785782.html"
   :published (2006 12 21) :published-uri "https://www.shfe.com.cn/publicnotice/notice/200612/t20061221_785782.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2008年部分节假日放假和休市安排的公告"
   :year 2008
   :uri "https://www.shfe.com.cn/publicnotice/notice/200712/t20071226_786474.html"
   :issued (2007 12 25) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/200712/t20071226_786474.html"
   :published (2007 12 26) :published-uri "https://www.shfe.com.cn/publicnotice/notice/200712/t20071226_786474.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2009年部分节假日放假和休市安排的公告"
   :year 2009
   :uri "https://www.shfe.com.cn/publicnotice/notice/200812/t20081223_787009.html"
   :issued (2008 12 22) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/200812/t20081223_787009.html"
   :published (2008 12 23) :published-uri "https://www.shfe.com.cn/publicnotice/notice/200812/t20081223_787009.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2010年部分节假日放假和休市安排的公告"
   :year 2010
   :uri "https://www.shfe.com.cn/publicnotice/notice/200912/t20091223_787612.html"
   :issued (2009 12 23) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/200912/t20091223_787612.html"
   :published (2009 12 23) :published-uri "https://www.shfe.com.cn/publicnotice/notice/200912/t20091223_787612.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2011年部分节假日放假和休市安排的公告"
   :year 2011
   :uri "https://www.shfe.com.cn/publicnotice/notice/201012/t20101227_788124.html"
   :issued (2010 12 27) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/201012/t20101227_788124.html"
   :published (2010 12 27) :published-uri "https://www.shfe.com.cn/publicnotice/notice/201012/t20101227_788124.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2012年部分节假日放假和休市安排的公告"
   :year 2012
   :uri "https://www.shfe.com.cn/publicnotice/notice/201112/t20111221_788769.html"
   :issued (2011 12 21) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/201112/t20111221_788769.html"
   :published (2011 12 21) :published-uri "https://www.shfe.com.cn/publicnotice/notice/201112/t20111221_788769.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2013年部分节假日放假和休市安排的公告"
   :year 2013
   :uri "https://www.shfe.com.cn/publicnotice/notice/201212/t20121221_789366.html"
   :issued (2012 12 21) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/201212/t20121221_789366.html"
   :published (2012 12 21) :published-uri "https://www.shfe.com.cn/publicnotice/notice/201212/t20121221_789366.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2014年休市安排的公告"
   :year 2014
   :uri "https://www.shfe.com.cn/publicnotice/notice/201312/t20131224_790109.html"
   :issued (2013 12 24) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/201312/t20131224_790109.html"
   :published (2013 12 24) :published-uri "https://www.shfe.com.cn/publicnotice/notice/201312/t20131224_790109.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2015年休市安排的公告"
   :year 2015
   :uri "https://www.shfe.com.cn/publicnotice/notice/201412/t20141224_790742.html"
   :issued (2014 12 31) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/201412/t20141224_790742.html"
   :published (2014 12 24) :published-uri "https://www.shfe.com.cn/publicnotice/notice/201412/t20141224_790742.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于中国人民抗日战争暨世界反法西斯战争胜利70周年纪念日休市安排的公告"
   :year 2015
   :uri "https://www.shfe.com.cn/publicnotice/notice/201506/t20150604_791001.html"
   :issued nil :issued-uri "https://www.shfe.com.cn/publicnotice/notice/201506/t20150604_791001.html"
   :published (2015 6 4) :published-uri "https://www.shfe.com.cn/publicnotice/notice/201506/t20150604_791001.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note "Signature date not legible in the page text; :issued unknown."
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2016年休市安排的公告"
   :year 2016
   :uri "https://www.shfe.com.cn/publicnotice/notice/201512/t20151224_791285.html"
   :issued (2015 12 24) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/201512/t20151224_791285.html"
   :published (2015 12 24) :published-uri "https://www.shfe.com.cn/publicnotice/notice/201512/t20151224_791285.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2017年休市安排的公告"
   :year 2017
   :uri "https://www.shfe.com.cn/publicnotice/notice/201612/t20161223_792067.html"
   :issued (2016 12 23) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/201612/t20161223_792067.html"
   :published (2016 12 23) :published-uri "https://www.shfe.com.cn/publicnotice/notice/201612/t20161223_792067.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2018年休市安排的公告"
   :year 2018
   :uri "https://www.shfe.com.cn/publicnotice/notice/201712/t20171222_792839.html"
   :issued (2017 12 22) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/201712/t20171222_792839.html"
   :published (2017 12 22) :published-uri "https://www.shfe.com.cn/publicnotice/notice/201712/t20171222_792839.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "上海期货交易所关于2019年休市安排的公告"
   :year 2019
   :uri "https://www.shfe.com.cn/publicnotice/notice/201812/t20181221_794040.html"
   :issued (2018 12 21) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/201812/t20181221_794040.html"
   :published (2018 12 21) :published-uri "https://www.shfe.com.cn/publicnotice/notice/201812/t20181221_794040.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2019年劳动节休市安排的公告"
   :year 2019
   :uri "https://www.shfe.com.cn/publicnotice/notice/201904/t20190415_794430.html"
   :issued (2019 4 15) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/201904/t20190415_794430.html"
   :published (2019 4 15) :published-uri "https://www.shfe.com.cn/publicnotice/notice/201904/t20190415_794430.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "上海期货交易所关于2020年休市安排的公告"
   :year 2020
   :uri "https://www.shfe.com.cn/publicnotice/notice/201912/t20191224_795447.html"
   :issued (2019 12 24) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/201912/t20191224_795447.html"
   :published (2019 12 24) :published-uri "https://www.shfe.com.cn/publicnotice/notice/201912/t20191224_795447.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于调整2020年春节休市安排的公告"
   :year 2020
   :uri "https://www.shfe.com.cn/publicnotice/notice/202001/t20200127_795578.html"
   :issued (2020 1 27) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/202001/t20200127_795578.html"
   :published (2020 1 27) :published-uri "https://www.shfe.com.cn/publicnotice/notice/202001/t20200127_795578.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "上海期货交易所关于2021年休市安排的公告"
   :year 2021
   :uri "https://www.shfe.com.cn/publicnotice/notice/202012/t20201223_796877.html"
   :issued (2020 12 23) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/202012/t20201223_796877.html"
   :published (2020 12 23) :published-uri "https://www.shfe.com.cn/publicnotice/notice/202012/t20201223_796877.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "上海期货交易所关于2022年休市安排的公告"
   :year 2022
   :uri "https://www.shfe.com.cn/publicnotice/notice/202112/t20211217_798298.html"
   :issued (2021 12 17) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/202112/t20211217_798298.html"
   :published (2021 12 17) :published-uri "https://www.shfe.com.cn/publicnotice/notice/202112/t20211217_798298.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "上海期货交易所关于2023年休市安排的公告"
   :year 2023
   :uri "https://www.shfe.com.cn/publicnotice/notice/202212/t20221227_799690.html"
   :issued (2022 12 27) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/202212/t20221227_799690.html"
   :published (2022 12 27) :published-uri "https://www.shfe.com.cn/publicnotice/notice/202212/t20221227_799690.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "上海期货交易所关于2025年休市安排的公告"
   :year 2025
   :uri "https://www.shfe.com.cn/publicnotice/notice/202412/t20241223_824109.html"
   :issued (2024 12 23) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/202412/t20241223_824109.html"
   :published (2024 12 23) :published-uri "https://www.shfe.com.cn/publicnotice/notice/202412/t20241223_824109.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "上海期货交易所关于2026年休市安排的公告"
   :year 2026
   :uri "https://www.shfe.com.cn/publicnotice/notice/202512/t20251217_829805.html"
   :issued (2025 12 17) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/202512/t20251217_829805.html"
   :published (2025 12 17) :published-uri "https://www.shfe.com.cn/publicnotice/notice/202512/t20251217_829805.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "证监会有关部门负责人就2024年休市安排答记者问 (China Securities Journal report, 2023-12-27)"
   :year 2024
   :uri "https://cs.com.cn/xwzx/hg/202312/t20231227_6382235.html"
   :issued (2023 12 27) :issued-uri "https://cs.com.cn/xwzx/hg/202312/t20231227_6382235.html"
   :published (2023 12 27) :published-uri "https://cs.com.cn/xwzx/hg/202312/t20231227_6382235.html"
   :published-in "China Securities Journal (cs.com.cn) report quoting the CSRC" :dates-note "SHFE/INE 2024 yearly notice not found on shfe.com.cn (list crawl has no 2024 entries); CSRC statement used."
   :confidence :secondary
   :closed (((2024 2 9) "除夕休市: “2月9日，股票、债券、期货等市场同步休市” (exchange-only)"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于调整2020年春节后交易时段的通知"
   :year 2020
   :uri "https://www.shfe.com.cn/publicnotice/notice/202002/t20200202_795584.html"
   :issued (2020 2 2) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/202002/t20200202_795584.html"
   :published (2020 2 2) :published-uri "https://www.shfe.com.cn/publicnotice/notice/202002/t20200202_795584.html"
   :published-in "SHFE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ()
   :note "“从2月3日起，暂停夜盘交易”; resumed “自2020年5月6日(周三)当晚起” (https://www.shfe.com.cn/publicnotice/notice/202004/t20200424_795871.html). Trading days 2020-02-03..2020-05-06 have no night session.")))
