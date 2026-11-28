;;;; XZCE — Zhengzhou Commodity Exchange trading days.
;;;; No exchange list fetched: czce.com.cn answers HTTP 412 (anti-bot challenge) to curl and WebFetch, and
;;;; web.archive.org is unreachable here. All China futures exchanges set their yearly closures under the same
;;;; CSRC 部分节假日放假和休市安排 notice; SHFE's lists (XSGE.sexp) are the closest primary evidence, but
;;;; exchanges did differ before 2006 (SHFE vs SZSE 2006 Spring Festival), so do not copy SHFE's 2002-2005
;;;; exchange-only closures here without a czce.com.cn source.
(:name "XZCE"
 :title "Zhengzhou Commodity Exchange trading days"
 :authority "CSRC yearly 部分节假日放假和休市安排 notice as implemented by the exchange (exchange notice not fetched)"
 :authority-uri nil
 :bases ((:calendar "CN" :from nil :to nil
          :authority "Assumed from the SHFE/SSE/SZSE pattern 2006-2026 (closures = State Council holidays); no czce.com.cn document fetched"))
 :rules ()
 :gaps ((:years "2000-2028"
         :note "No Zhengzhou Commodity Exchange holiday notice fetched (czce.com.cn HTTP 412). Known from the CSRC statement: 2024-02-09 closed for all futures exchanges (https://cs.com.cn/xwzx/hg/202312/t20231227_6382235.html, secondary) — included as a :secondary notice."))
 :notices
 (
  (:title "关于延长“五一”休市安排 (SARS, 2003): all mainland exchanges closed 2003-05-01..09, reopening 2003-05-12"
   :year 2003
   :uri "https://finance.sina.com.cn/jsy/20030430/1547336566.shtml"
   :issued (2003 4 30) :issued-uri "https://finance.sina.com.cn/jsy/20030430/1547336566.shtml"
   :published (2003 4 30) :published-uri "https://finance.sina.com.cn/jsy/20030430/1547336566.shtml"
   :published-in "Sina Finance report quoting the CSRC notice of 2003-04-30 (no CZCE copy found)"
   :dates-note "Text: “证监会发布通知调整五一休市时间，休市将持续到5月12日才重新恢复交易”. The CSRC adjustment covered the securities and futures markets: SHFE's own notice of 2003-04-29 (https://www.shfe.com.cn/publicnotice/notice/200304/t20030429_783837.html) closes 5月1日至5月9日 and reopens 5月12日. No CZCE notice was reachable (czce.com.cn answers HTTP 412), so this is secondary for XZCE (issue #92)."
   :confidence :secondary
   :closed (((2003 5 6) "“五一”休市延长 (SARS)") ((2003 5 7) "“五一”休市延长 (SARS)") ((2003 5 8) "“五一”休市延长 (SARS)") ((2003 5 9) "“五一”休市延长 (SARS)"))
   :open () :early-closes () :late-opens ())
  (:title "证监会有关部门负责人就2024年休市安排答记者问 (China Securities Journal report, 2023-12-27)"
   :year 2024
   :uri "https://cs.com.cn/xwzx/hg/202312/t20231227_6382235.html"
   :issued (2023 12 27) :issued-uri "https://cs.com.cn/xwzx/hg/202312/t20231227_6382235.html"
   :published (2023 12 27) :published-uri "https://cs.com.cn/xwzx/hg/202312/t20231227_6382235.html"
   :published-in "China Securities Journal (cs.com.cn) report quoting the CSRC" :dates-note "Exchange's own 2024 notice not fetched."
   :confidence :secondary
   :closed (((2024 2 9) "除夕休市: “2月9日，股票、债券、期货等市场同步休市” (exchange-only)"))
   :open () :early-closes () :late-opens ())))
