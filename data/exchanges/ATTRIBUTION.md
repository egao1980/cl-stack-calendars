# Exchange hours corpora

Hand-maintained cash-session eras for ISO 10383 MICs in this directory.
Each era and early-close rule cites an `:authority` (exchange notice / official timeline).

## What is modeled

- Regular-hours (RTH / zaraba / CTS) wall-clock segments in the exchange zone
- Historical hour changes (open/close/lunch) when an official effective date is known
- Recurring early closes (Black Friday, Christmas Eve, …) plus a few adhoc NYSE dates

## What is not modeled

- Pre-market / post-market / ToSTNeT / after-hours
- Opening/closing *auctions* as separate segments (RTH spans first open → last continuous/close)
- Exchange-only holidays that are not on the attached civil calendar
  (NYSE Good Friday is the classic case: `USFED` stays open)
- Late opens, circuit-breaker cuts, weather/disaster adhocs beyond the listed NYSE dates

Civil calendars are a convenience overlay (`exchange-session-bounds` refuses
non-business days). Hours themselves live in the sexp, not in the holiday rules.

## Sources (dates + citations only)

Do **not** vendor or copy `exchange_calendars` / `pandas_market_calendars` source.
Those libraries are Apache-2.0; we independently encode published dates.

| MIC | Hours authority |
|-----|-----------------|
| XNYS / XNAS | [NYSE timeline (trading hours)](https://web.archive.org/web/20081106132928/http://www.nyse.com/about/history/timeline_trading.html) — 1952-09-29 10:00–15:30 + Saturday retired; 1974 close 16:00; 1985-09-30 open 09:30. Last Saturday session 1952-05-24. Early closes from NYSE notices (13:00 from 1993). |
| XLON | Big Bang 1986-10-27 SEAQ 09:00–17:00; SETS 1997-10-20 08:00–16:30 |
| XTKS | [JPX 2024-11-05](https://www.jpx.co.jp/english/corporate/news/news-releases/1030/20241105-01.html) afternoon to 15:30; prior 09:00–11:30 / 12:30–15:00 |
| XHKG | [HKEX 2011-01-24](https://www.hkex.com.hk/News/News-Release/2011/1101243news?sc_lang=en) phase 1 2011-03-07, phase 2 2012-03-05 |
| XSHG / XSHE | SSE/SZSE cash 09:30–11:30 / 13:00–15:00 from 1990/1991 |
| XETR / XPAR | Xetra/Euronext cash 09:00–17:30 |
| XASX | ASX 10:00–16:00 from SEATS 1987-10-19 |
| XTSE | TSX 09:30–16:00 Eastern |
| XNSE | [NSE PR 17 Dec 2009](https://nsearchives.nseindia.com/content/press/17122009.htm) 09:00 from 2010-01-04; SEBI pre-open → continuous 09:15 from 2010-10-18; prior open 09:55 |
| BVMF | B3 cash 10:00–17:00 |
| XKRX | Lunch abolished 2000; [close 15:30 from 2016-08-01](https://www.koreaherald.com/article/1038609) |
| XSES | CAT 2011-08-01; [lunch restored 2017-11-13](https://www.businesstimes.com.sg/companies-markets/sgx-reintroduce-lunch-break-widen-bid-spreads-nov-13) |
| XAMS XBRU XLIS XMIL XMAD | Euronext / BME cash 09:00–17:30 + eve 14:00 |
| XDUB | Euronext Dublin 08:00–16:30 local (not CET 17:30) |
| XSWX | [SIX shares](https://www.six-group.com/en/products-services/the-swiss-stock-exchange/trading/trading-provisions/trading-hours.html) 09:00–17:30 |
| XSTO XCSE XHEL XICE | [Nasdaq Nordic Market Model](https://www.nasdaq.com/european-market-activity/trading-hours) — Stockholm 09:00–17:30, Copenhagen 09:00–17:00, Helsinki 10:00–18:30, Iceland 09:30–15:30 |
| XOSL | Oslo Børs 09:00–16:20 |
| XWBO XWAR XBUD XPRA XATH | Vienna 09:00–17:30; GPW 09:00–16:50; Budapest 09:00–17:00; Prague 09:00–16:20; ATHEX 10:15–17:20 |
| XTAI | [TWSE timeline](https://www.twse.com.tw/en/about/company/history.html) 2001-01-02: 09:00–13:30 (was 09:00–12:00) |
| XBKK | [SET 22/2024](https://www.set.or.th/en/market/news-and-alert/newsdetails?id=86864800&symbol=SET) afternoon from 14:00 on 2024-03-25 |
| XIDX | [Jakarta Post 2012-11-02](https://www.thejakartapost.com/news/2012/11/02/idx-will-start-trading-day-earlier-january.html) open 09:00 from 2013-01-02; Friday shorter morning |
| XKLS | [Bursa sessions](https://www.bursamalaysia.com/trade/trading_resources/equities/trading_sessions) 09:00–12:30 / 14:30–17:00 |
| XPHS | PSE 2011-10-03 to 13:00; [2012-01-02](https://business.inquirer.net/21697/stock-trading-hours-extended-starting-oct-3) 09:30–12:00 / 13:30–15:30 |
| XSTC | HOSE 09:15–11:30 / 13:00–14:45 |
| XBOM | Same SEBI hour changes as XNSE |
| XIST | BIST continuous 10:00–18:00 (lunch removed) |
| XSAU | Tadawul 10:00–15:00; weekend Thu–Fri → Fri–Sat **2013-06-29** |
| XTAE | TASE Sun–Thu ~10:00–17:15 |
| XCME XNYM XCEC | [CME Globex](https://www.cftc.gov/filings/orgrules/rule021422cmedcm007.pdf) 17:00–16:00 CT, labeled by close |
| XCBT | CBOT grains night 19:00–07:45 + day 08:30–13:20 CT |
| IFEU | [ICE Brent](https://www.ice.com/products/219/Brent-Crude-Futures) 01:00–23:00 London |
| XLME | [LMEselect](https://www.lme.com/trading/systems/lmeselect) 01:00–19:00 |
| XSGE XDCE XZCE XINE | SHFE/DCE/CZCE day breaks; SHFE night previous 21:00; INE SC night to 02:30 |
| XIMC | MCX non-agri 09:00–23:30 IST |
| XOSE | JPX/OSE day 08:45–15:45 + night 16:30–06:00 (`:labeled-by :open`) |
| XEUR XEEE XMAT | Eurex 08:00–22:00; EEX 08:00–18:00; Euronext agri 10:45–18:30 |

Overnight legs use `:overnight t` and `:labeled-by :close` (Globex/SHFE night belongs
to the next civil date) or `:open` (JPX night follows the same calendar day).
Fri–Sat weekend markets set `:weekend (5 6)`. IDX Friday hours live in `:friday`.

To add or correct an era: edit `<MIC>.sexp`, cite the notice, add a Rove test on the
boundary dates. Reload with `(load-all-exchange-hours t)`.
