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

To add or correct an era: edit `<MIC>.sexp`, cite the notice, add a Rove test on the
boundary dates. Reload with `(load-all-exchange-hours t)`.
