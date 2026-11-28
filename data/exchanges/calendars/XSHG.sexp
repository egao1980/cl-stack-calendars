;;;; XSHG — Shanghai Stock Exchange trading days.
;;;; Sources cached under ~/.cache/cl-stack-calendars/exchanges/xshg/ (sse-*.html = sse.com.cn pages,
;;;; sina-*.html = Sina Finance republications used only where no exchange copy exists).
;;;; Finding: every SSE yearly list 2009-2026 (and the 2008 per-holiday notices) closes exactly on the
;;;; State Council 放假 days of the CN civil calendar, with two exceptions: weekend 调休 working days are
;;;; NOT trading days (every notice: "…为周末休市"; handled by :weekend (6 7), since the CN base only
;;;; contributes holidays), and 2024-02-09 (除夕, exchange-only closure). Before 2007 the exchanges closed
;;;; longer Spring Festival windows than the civil holiday (2003, 2005, 2006 evidenced; 2004 via SHFE; 2000-2002 not found).
;;;; Lists from the exchange: SSE-hosted from 2008 (partial) / 2009 (full year); secondary 2003; SZSE copy 2005-2006.
(:name "XSHG"
 :title "Shanghai Stock Exchange trading days"
 :authority "上海证券交易所交易规则: \"本所交易日为每周一至周五。国家法定假日和本所公告的休市日，本所市场休市。\" (wording identical in the SZSE rules, art. 2.4.1; 2001 joint SSE/SZSE trading rules: \"国家法定假日和交易所公告的休市日，交易所市场休市\"); yearly 休市安排 notices per CSRC 部分节假日放假和休市安排 notice"
 :authority-uri "https://www.sse.com.cn/disclosure/dealinstruc/closed/list/"
 :bases ((:calendar "CN" :from nil :to nil
          :authority "SSE yearly closure notices 2009-2026 close on exactly the State Council holiday days (e.g. 2014: https://www.sse.com.cn/disclosure/dealinstruc/closed/list/c/c_20160104_3979109.shtml); 2001 trading rules (Sina copy): https://finance.sina.com.cn/y/20010831/102379.html"))
 :rules ()
 :gaps ((:years "2000-2002"
         :note "No SSE (or SZSE) holiday list found: sse.com.cn closure lists start 2008 (re-posted 2015-09-12 under /aboutus/mediacenter/hotandd/), szse.cn notices start 2004; web.archive.org unreachable from this sandbox (curl and WebFetch both refused). ec closes extra Spring Festival weekdays (2000-01-31..02-03, 02-11; 2001-01-22/23, 01-31..02-02; 2002-02-11, 02-19..22), 2000-01-03, 2000-05-04/05 and 2002-09-30 that the CN civil calendar keeps open: unverified, no notice rows written.")
        (:years "2004"
         :note "Only SZSE 2004 五一 and 十一 notices found (both = civil). Spring Festival 2004 list not found on sse.com.cn / szse.cn; the SHFE notice under the same CSRC notice (closing 2004-01-19..21 extra, = ec) is included as :secondary.")
        (:years "2005-2007"
         :note "No SSE-hosted notice; SZSE notices (same CSRC schedule) used as secondary evidence for 2005-2006; 2007 SZSE list = civil.")
        (:years "2003"
         :note "Only Sina Finance republications (SSE/CSDC notice of 2002-12-20; CSRC SARS extension of 2003-04-30 reported 2003-04-30). Marked :confidence :secondary."))
 :notices
 (
  (:title "关于2003年元旦、春节、\"五一\"、\"十一\"休市安排的通知 (上海证券交易所、中国证券登记结算有限责任公司, 2002-12-20; Sina Finance republication)"
   :year 2003
   :uri "https://finance.sina.com.cn/roll/20021223/0856293318.shtml"
   :issued (2002 12 20) :issued-uri "https://finance.sina.com.cn/roll/20021223/0856293318.shtml"
   :published (2002 12 23) :published-uri "https://finance.sina.com.cn/roll/20021223/0856293318.shtml"
   :published-in "Sina Finance republication of the SSE / CSDC notice (no exchange-hosted copy found)" :dates-note "Notice signed 2002-12-20 by SSE and CSDC; only copy found is Sina Finance roll news of 2002-12-23 (:published = Sina date)."
   :confidence :secondary
   :closed (((2003 1 30) "春节休市 1月30日至2月7日 (exchange-only: civil Spring Festival holiday 2月1日-7日)") ((2003 1 31) "春节休市 1月30日至2月7日 (exchange-only)") ((2003 5 6) "“五一”休市 5月1日至5月7日 (civil calendar: working day after the 2003 SARS adjustment)") ((2003 5 7) "“五一”休市 5月1日至5月7日 (civil calendar: working day after the 2003 SARS adjustment)"))
   :open ()
   :early-closes ()
   :late-opens ()
   :note "Also lists 元旦 1月1日 (one day), 十一 10月1日至7日 (= civil). Exchange site has no 2003 notice (SSE closure lists start 2008).")
  (:title "沪深股市今日冲高回落 (Sina Finance, 2003-04-30): CSRC notice extends the 2003 May Day market closure to 2003-05-11, reopening 2003-05-12"
   :year 2003
   :uri "https://finance.sina.com.cn/jsy/20030430/1547336566.shtml"
   :issued (2003 4 30) :issued-uri "https://finance.sina.com.cn/jsy/20030430/1547336566.shtml"
   :published (2003 4 30) :published-uri "https://finance.sina.com.cn/jsy/20030430/1547336566.shtml"
   :published-in "Sina Finance market report quoting the CSRC notice of 2003-04-30 (no exchange-hosted copy found)" :dates-note "Text: “证监会发布通知调整五一休市时间，休市将持续到5月12日才重新恢复交易”. The CSRC notice itself and the SSE/SZSE notices were not found online; issue #92."
   :confidence :secondary
   :closed (((2003 5 8) "“五一”休市延长 (SARS): 休市将持续到5月12日才重新恢复交易") ((2003 5 9) "“五一”休市延长 (SARS)"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2005年节假日休市安排的通知"
   :year 2005
   :uri "http://www.szse.cn/disclosure/notice/general/t20041223_499349.html"
   :issued (2004 12 23) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20041223_499349.html"
   :published (2004 12 23) :published-uri "http://www.szse.cn/disclosure/notice/general/t20041223_499349.html"
   :published-in "SZSE notice (szse.cn); no SSE notice for this year found" :dates-note "SSE notice for 2005 not found; SZSE notice implements the same CSRC notice (“根据中国证监会通知”) and is used as evidence for SSE."
   :confidence :secondary
   :closed (((2005 2 7) "春节休市 (exchange notice closes days the State Council notice does not): 2月7日-2月15日") ((2005 2 8) "春节休市 (exchange notice closes days the State Council notice does not): 2月7日-2月15日"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2006年节假日休市安排的通知"
   :year 2006
   :uri "http://www.szse.cn/disclosure/notice/general/t20051223_499514.html"
   :issued (2005 12 23) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20051223_499514.html"
   :published (2005 12 23) :published-uri "http://www.szse.cn/disclosure/notice/general/t20051223_499514.html"
   :published-in "SZSE notice (szse.cn); no SSE notice for this year found" :dates-note "SSE notice for 2006 not found; SZSE notice implements the same CSRC notice (“根据中国证监会通知”) and is used as evidence for SSE."
   :confidence :secondary
   :closed (((2006 1 26) "春节休市 (exchange notice closes days the State Council notice does not): 1月26日-2月5日") ((2006 1 27) "春节休市 (exchange notice closes days the State Council notice does not): 1月26日-2月5日"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2008年端午节休市安排的通知"
   :year 2008
   :uri "https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988207.shtml"
   :issued (2008 6 2) :issued-uri "https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988207.shtml"
   :published (2015 9 12) :published-uri "https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988207.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note "Page is a later re-post on the exchange site; :issued = signature date of the notice, :published = date in the re-post URL."
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2008年中秋节休市安排的通知"
   :year 2008
   :uri "https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988236.shtml"
   :issued (2008 9 3) :issued-uri "https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988236.shtml"
   :published (2015 9 12) :published-uri "https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988236.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note "Page is a later re-post on the exchange site; :issued = signature date of the notice, :published = date in the re-post URL."
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2008年“十一”休市安排的通知"
   :year 2008
   :uri "https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988240.shtml"
   :issued (2008 9 18) :issued-uri "https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988240.shtml"
   :published (2015 9 12) :published-uri "https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988240.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note "Page is a later re-post on the exchange site; :issued = signature date of the notice, :published = date in the re-post URL."
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2009年全年休市安排的通知"
   :year 2009
   :uri "https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988267.shtml"
   :issued (2008 12 23) :issued-uri "https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988267.shtml"
   :published (2015 9 12) :published-uri "https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988267.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note "Page is a later re-post on the exchange site; :issued = signature date of the notice, :published = date in the re-post URL."
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2010年全年休市安排的通知"
   :year 2010
   :uri "http://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988350.shtml"
   :issued (2009 12 23) :issued-uri "http://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988350.shtml"
   :published (2015 9 12) :published-uri "http://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988350.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note "Page is a later re-post on the exchange site; :issued = signature date of the notice, :published = date in the re-post URL."
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2011年全年休市安排的通知"
   :year 2011
   :uri "https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988440.shtml"
   :issued (2010 12 27) :issued-uri "https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988440.shtml"
   :published (2015 9 12) :published-uri "https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988440.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note "Page is a later re-post on the exchange site; :issued = signature date of the notice, :published = date in the re-post URL."
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2012年全年休市安排的通知"
   :year 2012
   :uri "https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988508.shtml"
   :issued (2011 12 23) :issued-uri "https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988508.shtml"
   :published (2015 9 12) :published-uri "https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988508.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note "Page is a later re-post on the exchange site; :issued = signature date of the notice, :published = date in the re-post URL."
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于上海证券交易所2013年全年休市安排的通知"
   :year 2013
   :uri "https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988635.shtml"
   :issued (2012 12 25) :issued-uri "https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988635.shtml"
   :published (2015 9 12) :published-uri "https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20150912_3988635.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note "Page is a later re-post on the exchange site; :issued = signature date of the notice, :published = date in the re-post URL."
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于上海证券交易所2014年全年休市安排的通知"
   :year 2014
   :uri "https://www.sse.com.cn/disclosure/dealinstruc/closed/list/c/c_20160104_3979109.shtml"
   :issued (2013 12 25) :issued-uri "https://www.sse.com.cn/disclosure/dealinstruc/closed/list/c/c_20160104_3979109.shtml"
   :published (2016 1 4) :published-uri "https://www.sse.com.cn/disclosure/dealinstruc/closed/list/c/c_20160104_3979109.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note "Page is a later re-post on the exchange site; :issued = signature date of the notice, :published = date in the re-post URL."
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于上海证券交易所2015年全年休市安排的通知"
   :year 2015
   :uri "https://www.sse.com.cn/disclosure/dealinstruc/closed/list/c/c_20160104_3979217.shtml"
   :issued (2014 12 24) :issued-uri "https://www.sse.com.cn/disclosure/dealinstruc/closed/list/c/c_20160104_3979217.shtml"
   :published (2016 1 4) :published-uri "https://www.sse.com.cn/disclosure/dealinstruc/closed/list/c/c_20160104_3979217.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note "Page is a later re-post on the exchange site; :issued = signature date of the notice, :published = date in the re-post URL."
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于中国人民抗日战争暨世界反法西斯战争胜利70周年纪念日休市安排的公告"
   :year 2015
   :uri "https://www.sse.com.cn/disclosure/dealinstruc/closed/list/c/c_20160104_3979337.shtml"
   :issued (2015 7 21) :issued-uri "https://www.sse.com.cn/disclosure/dealinstruc/closed/list/c/c_20160104_3979337.shtml"
   :published (2016 1 4) :published-uri "https://www.sse.com.cn/disclosure/dealinstruc/closed/list/c/c_20160104_3979337.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note "Page is a later re-post on the exchange site; :issued = signature date of the notice, :published = date in the re-post URL."
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于上海证券交易所2016年全年休市安排的通知"
   :year 2016
   :uri "https://www.sse.com.cn/disclosure/dealinstruc/closed/list/c/c_20160104_4028872.shtml"
   :issued (2015 12 24) :issued-uri "https://www.sse.com.cn/disclosure/dealinstruc/closed/list/c/c_20160104_4028872.shtml"
   :published (2016 1 4) :published-uri "https://www.sse.com.cn/disclosure/dealinstruc/closed/list/c/c_20160104_4028872.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于上海证券交易所2017年全年休市安排的通知"
   :year 2017
   :uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20161222_4218613.shtml"
   :issued (2016 12 22) :issued-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20161222_4218613.shtml"
   :published (2016 12 22) :published-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20161222_4218613.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于上海证券交易所2018年全年休市安排的通知"
   :year 2018
   :uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20171222_4438363.shtml"
   :issued (2017 12 22) :issued-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20171222_4438363.shtml"
   :published (2017 12 22) :published-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20171222_4438363.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于上海证券交易所2019年全年休市安排的通知"
   :year 2019
   :uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20181220_4696473.shtml"
   :issued (2018 12 20) :issued-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20181220_4696473.shtml"
   :published (2018 12 20) :published-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20181220_4696473.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于调整2019年劳动节休市安排的公告"
   :year 2019
   :uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20190418_4771364.shtml"
   :issued (2019 4 18) :issued-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20190418_4771364.shtml"
   :published (2019 4 18) :published-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20190418_4771364.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于上海证券交易所2020年全年休市安排的通知"
   :year 2020
   :uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20191220_4969627.shtml"
   :issued (2019 12 20) :issued-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20191220_4969627.shtml"
   :published (2019 12 20) :published-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20191220_4969627.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于调整2020年春节休市相关安排的公告"
   :year 2020
   :uri "http://www.sse.com.cn/disclosure/announcement/general/c/c_20200127_4991582.shtml"
   :issued (2020 1 27) :issued-uri "http://www.sse.com.cn/disclosure/announcement/general/c/c_20200127_4991582.shtml"
   :published (2020 1 27) :published-uri "http://www.sse.com.cn/disclosure/announcement/general/c/c_20200127_4991582.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于上海证券交易所2021年全年休市安排的通知"
   :year 2021
   :uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20201224_5286949.shtml"
   :issued (2020 12 24) :issued-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20201224_5286949.shtml"
   :published (2020 12 24) :published-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20201224_5286949.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于上海证券交易所2022年全年休市安排的通知"
   :year 2022
   :uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20211220_5662606.shtml"
   :issued (2021 12 20) :issued-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20211220_5662606.shtml"
   :published (2021 12 20) :published-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20211220_5662606.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于上海证券交易所2023年全年休市安排的通知"
   :year 2023
   :uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20221227_5714458.shtml"
   :issued (2022 12 27) :issued-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20221227_5714458.shtml"
   :published (2022 12 27) :published-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20221227_5714458.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于上海证券交易所2024年部分节假日休市安排的通知"
   :year 2024
   :uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20231226_5733939.shtml"
   :issued (2023 12 26) :issued-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20231226_5733939.shtml"
   :published (2023 12 26) :published-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20231226_5733939.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note nil
   :closed (((2024 2 9) "春节休市 2月9日(星期五)至2月17日: 除夕 2024-02-09 not a civil holiday (exchange-only; CSRC 鼓励除夕放假)"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于上海证券交易所2025年部分节假日休市安排的通知"
   :year 2025
   :uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20241223_10767108.shtml"
   :issued (2024 12 23) :issued-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20241223_10767108.shtml"
   :published (2024 12 23) :published-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20241223_10767108.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于上海证券交易所2026年部分节假日休市安排的通知"
   :year 2026
   :uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20251222_10802507.shtml"
   :issued (2025 12 22) :issued-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20251222_10802507.shtml"
   :published (2025 12 22) :published-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20251222_10802507.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告 / 休市安排" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "上证公告(熔断)〔2016〕02号 关于实施指数熔断的公告"
   :year 2016
   :uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20160104_4031718.shtml"
   :issued (2016 1 4) :issued-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20160104_4031718.shtml"
   :published (2016 1 4) :published-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20160104_4031718.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes (((2016 1 4) (13 33) "指数熔断: 自13时33分开始实施指数熔断，当日不再恢复交易 (stocks, funds, CBs; gold/money/bond ETFs excepted)"))
   :late-opens ()
   :note "Index circuit breaker (rules in force 2016-01-01..2016-01-07). Market-wide halt to the close: not a scheduled early close; ec keeps a full session.")
  (:title "上证公告(熔断)〔2016〕04号 关于实施指数熔断的公告"
   :year 2016
   :uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20160107_4033042.shtml"
   :issued (2016 1 7) :issued-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20160107_4033042.shtml"
   :published (2016 1 7) :published-uri "https://www.sse.com.cn/disclosure/announcement/general/c/c_20160107_4033042.shtml"
   :published-in "SSE website (sse.com.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes (((2016 1 7) (9 58) "指数熔断: 自09时58分开始实施指数熔断，当日不再恢复交易"))
   :late-opens ()
   :note "Circuit breaker suspended from 2016-01-08 (上证发〔2016〕4号, https://www.sse.com.cn/aboutus/mediacenter/hotandd/c/c_20160107_4033450.shtml).")
  (:title "上海期货交易所 关于2004年部分节日放假休市安排的公告 (implements CSRC 证监办发[2003]48号)"
   :year 2004
   :uri "https://www.shfe.com.cn/publicnotice/notice/200312/t20031225_784078.html"
   :issued (2003 12 25) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/200312/t20031225_784078.html"
   :published (2003 12 25) :published-uri "https://www.shfe.com.cn/publicnotice/notice/200312/t20031225_784078.html"
   :published-in "SHFE website (shfe.com.cn); used as secondary evidence for the securities exchanges" :dates-note "No SSE/SZSE 2004 Spring Festival notice found. SZSE 2004 五一/十一 notices cite the same CSRC notice (证监办发〔2003〕48号) as this SHFE notice, which closes 1月19日至1月28日; ec agrees."
   :confidence :secondary
   :closed (((2004 1 19) "春节休市 1月19日至1月28日 (exchange-only; CSRC 证监办发[2003]48号)") ((2004 1 20) "春节休市 1月19日至1月28日 (exchange-only)") ((2004 1 21) "春节休市 1月19日至1月28日 (exchange-only)"))
   :open ()
   :early-closes ()
   :late-opens ())))
