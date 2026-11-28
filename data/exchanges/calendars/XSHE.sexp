;;;; XSHE — Shenzhen Stock Exchange trading days.
;;;; Sources cached under ~/.cache/cl-stack-calendars/exchanges/xshe/ (szse-t<date>_<id>.html = szse.cn notices).
;;;; Finding: SZSE yearly 节假日休市安排 notices exist on szse.cn from 2004 (五一/十一) and 2005-2026 (full year).
;;;; They close exactly on the CN civil (State Council) holidays from 2007 on, except 2024-02-09 (除夕);
;;;; 调休 weekend working days are "周末休市" (handled by :weekend (6 7)). 2005 and 2006 Spring Festival
;;;; windows are two weekdays longer than the civil holiday. Same CSRC schedule as SSE (see XSHG).
(:name "XSHE"
 :title "Shenzhen Stock Exchange trading days"
 :authority "深圳证券交易所交易规则（2021年3月修订）2.4.1: \"本所交易日为每周一至周五。国家法定假日和本所公告的休市日，本所市场休市。\"; yearly 休市安排 notices per CSRC notice"
 :authority-uri "http://docs.static.szse.cn/www/fund/guide/W020210331716400647184.pdf"
 :bases ((:calendar "CN" :from nil :to nil
          :authority "SZSE yearly closure notices 2007-2026 close on exactly the State Council holidays (e.g. 2020: https://www.szse.cn/disclosure/notice/general/t20191220_572766.html)"))
 :rules ()
 :gaps ((:years "2000-2003"
         :note "No SZSE notice found (szse.cn search API returns notices from 2004-04-26 on; web.archive.org unreachable). 2003: see XSHG (Sina copies of the SSE notice and the CSRC SARS extension, which applied to both exchanges); the 2003-04-30 extension is included here as :secondary. ec's extra 2000-2002 closures unverified.")
        (:years "2004"
         :note "Spring Festival 2004 SZSE list not found (only 五一 and 十一 notices); the SHFE notice under the same CSRC notice (closes 2004-01-19..21, = ec) is included as :secondary."))
 :notices
 (
  (:title "沪深股市今日冲高回落 (Sina Finance, 2003-04-30): CSRC notice extends the 2003 May Day market closure to 2003-05-11, reopening 2003-05-12"
   :year 2003
   :uri "https://finance.sina.com.cn/jsy/20030430/1547336566.shtml"
   :issued (2003 4 30) :issued-uri "https://finance.sina.com.cn/jsy/20030430/1547336566.shtml"
   :published (2003 4 30) :published-uri "https://finance.sina.com.cn/jsy/20030430/1547336566.shtml"
   :published-in "Sina Finance market report quoting the CSRC notice of 2003-04-30 (no exchange-hosted copy found)" :dates-note "Text: “证监会发布通知调整五一休市时间，休市将持续到5月12日才重新恢复交易”. The CSRC notice itself and the SSE/SZSE notices were not found online; issue #92."
   :confidence :secondary
   :closed (((2003 5 6) "“五一”休市延长 (SARS): 休市将持续到5月12日才重新恢复交易") ((2003 5 7) "“五一”休市延长 (SARS)") ((2003 5 8) "“五一”休市延长 (SARS)") ((2003 5 9) "“五一”休市延长 (SARS)"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2004年“五一”休市安排的通知"
   :year 2004
   :uri "http://www.szse.cn/disclosure/notice/general/t20040426_499187.html"
   :issued (2004 4 26) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20040426_499187.html"
   :published (2004 4 26) :published-uri "http://www.szse.cn/disclosure/notice/general/t20040426_499187.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2004年“十一”期间休市安排的通知"
   :year 2004
   :uri "http://www.szse.cn/disclosure/notice/general/t20040910_499287.html"
   :issued (2004 9 10) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20040910_499287.html"
   :published (2004 9 10) :published-uri "http://www.szse.cn/disclosure/notice/general/t20040910_499287.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2005年节假日休市安排的通知"
   :year 2005
   :uri "http://www.szse.cn/disclosure/notice/general/t20041223_499349.html"
   :issued (2004 12 23) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20041223_499349.html"
   :published (2004 12 23) :published-uri "http://www.szse.cn/disclosure/notice/general/t20041223_499349.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed (((2005 2 7) "春节休市 (exchange notice closes days the State Council notice does not): 2月7日-2月15日") ((2005 2 8) "春节休市 (exchange notice closes days the State Council notice does not): 2月7日-2月15日"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2005年\"五一\"休市安排的通知"
   :year 2005
   :uri "http://www.szse.cn/disclosure/notice/general/t20050421_499408.html"
   :issued (2005 4 21) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20050421_499408.html"
   :published (2005 4 21) :published-uri "http://www.szse.cn/disclosure/notice/general/t20050421_499408.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2005年“十一”期间休市安排的通知"
   :year 2005
   :uri "http://www.szse.cn/disclosure/notice/general/t20050919_499474.html"
   :issued (2005 9 20) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20050919_499474.html"
   :published (2005 9 19) :published-uri "http://www.szse.cn/disclosure/notice/general/t20050919_499474.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2006年节假日休市安排的通知"
   :year 2006
   :uri "http://www.szse.cn/disclosure/notice/general/t20051223_499514.html"
   :issued (2005 12 23) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20051223_499514.html"
   :published (2005 12 23) :published-uri "http://www.szse.cn/disclosure/notice/general/t20051223_499514.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed (((2006 1 26) "春节休市 (exchange notice closes days the State Council notice does not): 1月26日-2月5日") ((2006 1 27) "春节休市 (exchange notice closes days the State Council notice does not): 1月26日-2月5日"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2006年“五一”期间休市安排的通知"
   :year 2006
   :uri "http://www.szse.cn/disclosure/notice/general/t20060420_499568.html"
   :issued (2006 4 20) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20060420_499568.html"
   :published (2006 4 20) :published-uri "http://www.szse.cn/disclosure/notice/general/t20060420_499568.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2006年“十一”期间休市安排的通知"
   :year 2006
   :uri "http://www.szse.cn/disclosure/notice/general/t20060921_499696.html"
   :issued (2006 9 22) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20060921_499696.html"
   :published (2006 9 21) :published-uri "http://www.szse.cn/disclosure/notice/general/t20060921_499696.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2007年节假日休市安排的通知"
   :year 2007
   :uri "http://www.szse.cn/disclosure/notice/general/t20061221_499734.html"
   :issued (2006 12 20) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20061221_499734.html"
   :published (2006 12 21) :published-uri "http://www.szse.cn/disclosure/notice/general/t20061221_499734.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2008年节假日休市安排的通知"
   :year 2008
   :uri "http://www.szse.cn/disclosure/notice/general/t20071225_499949.html"
   :issued (2007 12 25) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20071225_499949.html"
   :published (2007 12 25) :published-uri "http://www.szse.cn/disclosure/notice/general/t20071225_499949.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2009年节假日休市安排的通知"
   :year 2009
   :uri "http://www.szse.cn/disclosure/notice/general/t20081223_500177.html"
   :issued (2008 12 24) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20081223_500177.html"
   :published (2008 12 23) :published-uri "http://www.szse.cn/disclosure/notice/general/t20081223_500177.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2010年节假日休市安排的通知"
   :year 2010
   :uri "http://www.szse.cn/disclosure/notice/general/t20091223_500314.html"
   :issued (2009 12 23) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20091223_500314.html"
   :published (2009 12 23) :published-uri "http://www.szse.cn/disclosure/notice/general/t20091223_500314.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2011年节假日休市安排的通知"
   :year 2011
   :uri "http://www.szse.cn/disclosure/notice/general/t20101227_500628.html"
   :issued (2010 12 27) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20101227_500628.html"
   :published (2010 12 27) :published-uri "http://www.szse.cn/disclosure/notice/general/t20101227_500628.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2012年部分节假日休市安排的通知"
   :year 2012
   :uri "http://www.szse.cn/disclosure/notice/general/t20111226_500868.html"
   :issued (2011 12 26) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20111226_500868.html"
   :published (2011 12 26) :published-uri "http://www.szse.cn/disclosure/notice/general/t20111226_500868.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2013年节假日休市安排的通知"
   :year 2013
   :uri "http://www.szse.cn/disclosure/notice/general/t20121225_501056.html"
   :issued (2012 12 25) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20121225_501056.html"
   :published (2012 12 25) :published-uri "http://www.szse.cn/disclosure/notice/general/t20121225_501056.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2014年节假日休市安排的通知"
   :year 2014
   :uri "http://www.szse.cn/disclosure/notice/general/t20131225_501163.html"
   :issued (2013 12 26) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20131225_501163.html"
   :published (2013 12 25) :published-uri "http://www.szse.cn/disclosure/notice/general/t20131225_501163.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2015年部分节假日休市安排的通知"
   :year 2015
   :uri "http://www.szse.cn/disclosure/notice/general/t20141224_501340.html"
   :issued (2014 12 24) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20141224_501340.html"
   :published (2014 12 24) :published-uri "http://www.szse.cn/disclosure/notice/general/t20141224_501340.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于中国人民抗日战争暨世界反法西斯战争胜利70周年纪念日休市安排的通知(2015年)"
   :year 2015
   :uri "http://www.szse.cn/disclosure/notice/general/t20150721_501527.html"
   :issued (2015 7 21) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20150721_501527.html"
   :published (2015 7 21) :published-uri "http://www.szse.cn/disclosure/notice/general/t20150721_501527.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2016年部分节假日休市安排的通知"
   :year 2016
   :uri "http://www.szse.cn/disclosure/notice/general/t20151224_501645.html"
   :issued (2015 12 24) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20151224_501645.html"
   :published (2015 12 24) :published-uri "http://www.szse.cn/disclosure/notice/general/t20151224_501645.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2017年部分节假日休市安排的通知"
   :year 2017
   :uri "http://www.szse.cn/disclosure/notice/general/t20161222_501883.html"
   :issued (2016 12 22) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20161222_501883.html"
   :published (2016 12 22) :published-uri "http://www.szse.cn/disclosure/notice/general/t20161222_501883.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2018年部分节假日休市安排的通知"
   :year 2018
   :uri "http://www.szse.cn/disclosure/notice/general/t20171222_502255.html"
   :issued (2017 12 21) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20171222_502255.html"
   :published (2017 12 22) :published-uri "http://www.szse.cn/disclosure/notice/general/t20171222_502255.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2019年部分节假日休市安排的通知"
   :year 2019
   :uri "http://www.szse.cn/disclosure/notice/general/t20181220_563695.html"
   :issued (2018 12 20) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20181220_563695.html"
   :published (2018 12 20) :published-uri "http://www.szse.cn/disclosure/notice/general/t20181220_563695.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2020年部分节假日休市安排的通知"
   :year 2020
   :uri "http://www.szse.cn/disclosure/notice/general/t20191220_572766.html"
   :issued (2019 12 20) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20191220_572766.html"
   :published (2019 12 20) :published-uri "http://www.szse.cn/disclosure/notice/general/t20191220_572766.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于延长2020年春节休市安排的通知"
   :year 2020
   :uri "http://www.szse.cn/disclosure/notice/general/t20200127_573917.html"
   :issued (2020 1 27) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20200127_573917.html"
   :published (2020 1 27) :published-uri "http://www.szse.cn/disclosure/notice/general/t20200127_573917.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2021年部分节假日休市安排的通知"
   :year 2021
   :uri "http://www.szse.cn/disclosure/notice/general/t20201224_583950.html"
   :issued (2020 12 24) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20201224_583950.html"
   :published (2020 12 24) :published-uri "http://www.szse.cn/disclosure/notice/general/t20201224_583950.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2022年部分节假日休市安排的通知"
   :year 2022
   :uri "http://www.szse.cn/disclosure/notice/general/t20211220_590321.html"
   :issued (2021 12 20) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20211220_590321.html"
   :published (2021 12 20) :published-uri "http://www.szse.cn/disclosure/notice/general/t20211220_590321.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2023年部分节假日休市安排的通知"
   :year 2023
   :uri "http://www.szse.cn/disclosure/notice/general/t20221227_598022.html"
   :issued (2022 12 27) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20221227_598022.html"
   :published (2022 12 27) :published-uri "http://www.szse.cn/disclosure/notice/general/t20221227_598022.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2024年部分节假日休市安排的通知"
   :year 2024
   :uri "http://www.szse.cn/disclosure/notice/general/t20231226_605108.html"
   :issued (2023 12 26) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20231226_605108.html"
   :published (2023 12 26) :published-uri "http://www.szse.cn/disclosure/notice/general/t20231226_605108.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed (((2024 2 9) "春节休市 2月9日(星期五)至2月17日: 除夕 not a civil holiday (exchange-only)"))
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2025年部分节假日休市安排的通知"
   :year 2025
   :uri "http://www.szse.cn/disclosure/notice/general/t20241223_611283.html"
   :issued (2024 12 23) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20241223_611283.html"
   :published (2024 12 23) :published-uri "http://www.szse.cn/disclosure/notice/general/t20241223_611283.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于2026年部分节假日休市安排的通知"
   :year 2026
   :uri "http://www.szse.cn/disclosure/notice/general/t20251222_618087.html"
   :issued (2025 12 22) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20251222_618087.html"
   :published (2025 12 22) :published-uri "http://www.szse.cn/disclosure/notice/general/t20251222_618087.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于调整2019年劳动节休市安排的通知"
   :year 2019
   :uri "http://www.szse.cn/disclosure/notice/general/t20190418_566376.html"
   :issued (2019 4 18) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20190418_566376.html"
   :published (2019 4 18) :published-uri "http://www.szse.cn/disclosure/notice/general/t20190418_566376.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "关于临时停市3分钟的通知"
   :year 2008
   :uri "http://www.szse.cn/disclosure/notice/general/t20080519_500058.html"
   :issued (2008 5 19) :issued-uri "http://www.szse.cn/disclosure/notice/general/t20080519_500058.html"
   :published (2008 5 19) :published-uri "http://www.szse.cn/disclosure/notice/general/t20080519_500058.html"
   :published-in "SZSE website (szse.cn), 本所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ()
   :note "2008-05-19 14:28-14:31 market-wide 3-minute halt (Wenchuan earthquake mourning). Intraday pause only: no closure / early close.")
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
