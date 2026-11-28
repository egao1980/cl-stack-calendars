;;;; XINE — Shanghai International Energy Exchange (INE, SHFE subsidiary) trading days.
;;;; INE trading starts 2018-03-26 (crude oil futures). INE notices are published on shfe.com.cn
;;;; ("上海国际能源交易中心发布关于YYYY年休市安排的公告"); found for 2019-2023 and identical to SHFE's.
;;;; Same rule as XSGE: CN civil holidays, weekends closed, 2024-02-09 closed, no night session on the
;;;; evening before a statutory holiday.
(:name "XINE"
 :title "Shanghai International Energy Exchange trading days"
 :authority "INE yearly 休市安排 notices (published with SHFE's on shfe.com.cn)"
 :authority-uri "https://www.shfe.com.cn/publicnotice/notice/202212/t20221227_799689.html"
 :bases ((:calendar "CN" :from (2018 3 26) :to nil
          :authority "INE notices 2019-2023 close on exactly the State Council holidays, e.g. https://www.shfe.com.cn/publicnotice/notice/202012/t20201223_796876.html"))
 :rules ()
 :gaps ((:years "2018, 2024-2026"
         :note "INE notices for 2018 and 2024-2026 not found in the SHFE list crawl; assume = SHFE (2025/2026 SHFE notices in XSGE.sexp; 2024-02-09 via CSRC statement)."))
 :notices
 (
  (:title "上海国际能源交易中心发布关于2019年休市安排的公告"
   :year 2019
   :uri "https://www.shfe.com.cn/publicnotice/notice/201812/t20181221_794041.html"
   :issued (2018 12 21) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/201812/t20181221_794041.html"
   :published (2018 12 21) :published-uri "https://www.shfe.com.cn/publicnotice/notice/201812/t20181221_794041.html"
   :published-in "INE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "上海国际能源交易中心发布关于2019年劳动节休市安排的公告"
   :year 2019
   :uri "https://www.shfe.com.cn/publicnotice/notice/201904/t20190415_794429.html"
   :issued (2019 4 15) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/201904/t20190415_794429.html"
   :published (2019 4 15) :published-uri "https://www.shfe.com.cn/publicnotice/notice/201904/t20190415_794429.html"
   :published-in "INE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "上海国际能源交易中心发布关于2020年休市安排的公告"
   :year 2020
   :uri "https://www.shfe.com.cn/publicnotice/notice/201912/t20191224_795444.html"
   :issued (2019 12 24) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/201912/t20191224_795444.html"
   :published (2019 12 24) :published-uri "https://www.shfe.com.cn/publicnotice/notice/201912/t20191224_795444.html"
   :published-in "INE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "上海国际能源交易中心发布关于调整2020年春节休市安排的公告"
   :year 2020
   :uri "https://www.shfe.com.cn/publicnotice/notice/202001/t20200127_795577.html"
   :issued (2020 1 27) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/202001/t20200127_795577.html"
   :published (2020 1 27) :published-uri "https://www.shfe.com.cn/publicnotice/notice/202001/t20200127_795577.html"
   :published-in "INE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "上海国际能源交易中心发布关于2021年休市安排的公告"
   :year 2021
   :uri "https://www.shfe.com.cn/publicnotice/notice/202012/t20201223_796876.html"
   :issued (2020 12 23) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/202012/t20201223_796876.html"
   :published (2020 12 23) :published-uri "https://www.shfe.com.cn/publicnotice/notice/202012/t20201223_796876.html"
   :published-in "INE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "上海国际能源交易中心发布关于2022年休市安排的公告"
   :year 2022
   :uri "https://www.shfe.com.cn/publicnotice/notice/202112/t20211217_798299.html"
   :issued (2021 12 17) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/202112/t20211217_798299.html"
   :published (2021 12 17) :published-uri "https://www.shfe.com.cn/publicnotice/notice/202112/t20211217_798299.html"
   :published-in "INE website (shfe.com.cn), 交易所公告" :dates-note nil
   :closed ()
   :open ()
   :early-closes ()
   :late-opens ())
  (:title "上海国际能源交易中心发布关于2023年休市安排的公告"
   :year 2023
   :uri "https://www.shfe.com.cn/publicnotice/notice/202212/t20221227_799689.html"
   :issued (2022 12 27) :issued-uri "https://www.shfe.com.cn/publicnotice/notice/202212/t20221227_799689.html"
   :published (2022 12 27) :published-uri "https://www.shfe.com.cn/publicnotice/notice/202212/t20221227_799689.html"
   :published-in "INE website (shfe.com.cn), 交易所公告" :dates-note nil
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
   :late-opens ())))
