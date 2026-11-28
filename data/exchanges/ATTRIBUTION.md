# Exchange hours corpora

Hand-maintained cash-session eras for ISO 10383 MICs in this directory.
Each era and early-close rule cites an `:authority` (exchange notice / official timeline).

## What is modeled

- Regular-hours (RTH / zaraba / CTS) wall-clock segments in the exchange zone
- Historical hour changes (open/close/lunch) when an official effective date is known
- Recurring early closes (Black Friday, Christmas Eve, …) and late opens (`:late-open-rules`, `:late-opens`), plus adhoc dates and the early closes in the exchange calendar's notices

## What is not modeled

- Pre-market / post-market / ToSTNeT / after-hours
- Opening/closing *auctions* as separate segments (RTH spans first open → last continuous/close)
- Exchange-only holidays for MICs whose `:calendar` is still a civil one (CME family on
  `USFED`; the MICs outside Western Europe on the national calendar, #49).
  XNYS / XNAS use the exchange's own `NYSE` calendar (src/starter-nyse.lisp,
  data/us/nyse-closures.sexp). Since 0.39.0 XLON, IFEU, XLME, the Euronext markets
  (XPAR XAMS XBRU XLIS XDUB XMIL XMAT), XETR, XEUR, XEEE, XSWX, XWBO, XMAD and (0.40.0) the
  Nordics XSTO, XCSE, XHEL, XICE, XOSL, and (0.41.0) XWAR, XBUD, XPRA, XATH, XIST use their exchange's own calendar in `calendars/` (rules and notices, each cited;
  docs/AUTHORITIES.md#exchange-trading-holiday-calendars-49)
- Circuit-breaker cuts, weather/disaster adhocs beyond the listed notices

The holiday calendar closes the session for every exchange query
(`exchange-trading-day-p`, `exchange-sessions-for-date`, `exchange-session-bounds`). Hours themselves live in the sexp, not in the holiday rules.

## Sources (dates + citations only)

Do **not** vendor or copy `exchange_calendars` / `pandas_market_calendars` source.
Those libraries are Apache-2.0; we independently encode published dates.

| MIC | Hours authority |
|-----|-----------------|
| XNYS / XNAS | [NYSE timeline (trading hours)](https://web.archive.org/web/20081106132928/http://www.nyse.com/about/history/timeline_trading.html) — 1952-09-29 10:00–15:30 + Saturday retired; 1974 close 16:00; 1985-09-30 open 09:30. Last Saturday session 1952-05-24. Early closes from NYSE notices (13:00 from 1993). |
| XLON | Big Bang 1986-10-27 SEAQ 09:00–17:00; SETS 1997-10-20 08:00–16:30 |
| XTKS | [JPX 2024-11-05](https://www.jpx.co.jp/english/corporate/news/news-releases/1030/20241105-01.html) afternoon to 15:30; 09:00–11:30 / 12:30–15:00 from [2011-11-21](https://www.jpx.co.jp/files/tse/about/press/b7gje60000029nqk-att/shiryou20110927.pdf); morning to 11:00 before; first/last-day half-holidays (morning only) until 2009-01-05 |
| XHKG | [HKEX 2011-01-24](https://www.hkex.com.hk/News/News-Release/2011/1101243news?sc_lang=en) phase 1 2011-03-07, phase 2 2012-03-05 |
| XSHG / XSHE | SSE/SZSE cash 09:30–11:30 / 13:00–15:00 from 1990/1991 |
| XETR | Xetra 09:00–17:30; 09:00–20:00 from 2000-06-02 to 2003-10-31 ([Eurex circular 116/03](https://www.eurex.com/resource/blob/294630/0f1d69ec085846ab4fc215e24d592449/data/cf1162003e.pdf.pdf)); 14:00 close on the last trading day of the year |
| XPAR | Euronext cash 09:00–17:30 (CET clock) |
| XASX | ASX 10:00–16:00 from SEATS 1987-10-19 |
| XTSE | TSX 09:30–16:00 Eastern |
| XNSE | [NSE PR 17 Dec 2009](https://nsearchives.nseindia.com/content/press/17122009.htm) 09:00 from 2010-01-04; SEBI pre-open → continuous 09:15 from 2010-10-18; prior open 09:55 |
| BVMF | B3 cash 10:00–17:00 |
| XKRX | Lunch abolished 2000-05-22 (secondary); [close 15:30 from 2016-08-01](https://www.koreaherald.com/article/1038609); first trading day opens 10:00 (`:regular` late-open rule); CSAT day 10:00–16:30 (`:sessions` notices) |
| XSES | CAT 2011-08-01; [lunch restored 2017-11-13](https://www.businesstimes.com.sg/companies-markets/sgx-reintroduce-lunch-break-widen-bid-spreads-nov-13) |
| XAMS XBRU XMIL XMAD | Euronext / Borsa Italiana / BME cash 09:00–17:30; Euronext half days from the yearly notices, BME 24/31 Dec 14:00 |
| XLIS | Euronext CET clock: 08:00–16:30 Lisbon, half days 13:00 / 13:05 |
| XDUB | Euronext Dublin 08:00–16:28 local (continuous end; closing auction to 16:28–16:30) |
| XSWX | [SIX shares](https://www.six-group.com/en/products-services/the-swiss-stock-exchange/trading/trading-provisions/trading-hours.html) 09:00–17:30, no early closes |
| XSTO XCSE XHEL XICE | [Nasdaq Nordic Market Model](https://www.nasdaq.com/european-market-activity/trading-hours) — Stockholm 09:00–17:30 (09:30 before SAXESS 2004-09-27), Copenhagen 09:00–17:00, Helsinki 10:00–18:30 (18:00 before 2004-09-27), Iceland 09:30–15:30 from 2010-01-04 (10:00–17:23 CET 2007-03-26 – 2010-01-03); Stockholm half days 13:00 |
| XOSL | Oslo Børs 09:00–16:20; 10:00–16:00 to 2005, 09:00–17:20 2008-09-01 – 2012-08-03; 13:00 close on the Wednesday before Maundy Thursday |
| XWBO XWAR XBUD XPRA XATH | Vienna 09:00–17:30; GPW 09:00–16:50 (UTP 2013-04-15; 17:20 from 2011-01-01); Budapest 09:00–17:00; Prague 09:00–16:15 from 2020-11-30 (end of closing auction); ATHEX 10:15–17:20 (opening auction to end of trading at close, 2026 schedule) |
| XTAI | [TWSE timeline](https://www.twse.com.tw/en/about/company/history.html) 2001-01-02: 09:00–13:30 (was 09:00–12:00); trading Saturdays in 2000 and make-up Saturdays 2006–2018 (calendar `:open` notices) |
| XBKK | [SET 22/2024](https://www.set.or.th/en/market/news-and-alert/newsdetails?id=86864800&symbol=SET) afternoon from 14:00 on 2024-03-25 |
| XIDX | [Jakarta Post 2012-11-02](https://www.thejakartapost.com/news/2012/11/02/idx-will-start-trading-day-earlier-january.html) open 09:00 from 2013-01-02; Friday shorter morning |
| XKLS | [Bursa sessions](https://www.bursamalaysia.com/trade/trading_resources/equities/trading_sessions) 09:00–12:30 / 14:30–17:00 |
| XPHS | PSE 2011-10-03 to 13:00; [2012-01-02](https://business.inquirer.net/21697/stock-trading-hours-extended-starting-oct-3) 09:30–12:00 / 13:30–15:30 |
| XSTC | HOSE 09:15–11:30 / 13:00–14:45 |
| XBOM | Same SEBI hour changes as XNSE |
| XIST | BIST continuous 10:00–18:00, lunch break removed 2019-10-04 (notice 2019/56); 10:00–13:00 / 14:00–18:00 from 2016-11-14; half days 12:30 |
| XSAU | Tadawul 10:00–15:00; weekend Thu–Fri → Fri–Sat **2013-06-29** |
| XTAE | TASE Sun–Thu ~10:00–17:15 |
| XCME XNYM XCEC | [CME Globex](https://www.cftc.gov/filings/orgrules/rule021422cmedcm007.pdf) 17:00–16:00 CT, labeled by close |
| XCBT | CBOT grains night 19:00–07:45 + day 08:30–13:20 CT |
| IFEU | [ICE Brent](https://www.ice.com/products/219/Brent-Crude-Futures) 01:00–23:00 London |
| XLME | [LMEselect](https://www.lme.com/trading/systems/lmeselect) 01:00–19:00 |
| XSGE XDCE XZCE XINE | SHFE/DCE/CZCE day breaks; SHFE night previous 21:00; INE SC night to 02:30 |
| XIMC | MCX non-agri 09:00–23:30 IST |
| XOSE | JPX/OSE index derivatives: day 08:45–15:15 + night 16:30–05:30 from 2016-07-19, night to 06:00 from 2021-09-21, day 08:45–15:45 + night 17:00–06:00 from 2024-11-05 (`:labeled-by :open`); holiday trading from 2022-09-23 |
| XEUR XEEE XMAT | Eurex 08:00–22:00 (simplified; product hours vary); EEX 08:00–18:00; Euronext agri 10:45–18:30, 10:45–20:15 from 2026-04-13 |

Overnight legs use `:overnight t` and `:labeled-by :close` (Globex/SHFE night belongs
to the next civil date) or `:open` (JPX night follows the same calendar day).
Fri–Sat weekend markets set `:weekend (5 6)`. IDX Friday hours live in `:friday`.

To add or correct an era: edit `<MIC>.sexp`, cite the notice, add a Rove test on the
boundary dates. Reload with `(load-all-exchange-hours t)`.
