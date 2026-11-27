# cl-stack-calendars

Holiday and trading calendars for [cl-stack](https://github.com/egao1980/cl-stack): business-day arithmetic, rule/data/composite calendars, versioned as-of snapshots, trading sessions with history-aware zone boundaries, and versioned major-exchange cash hours (`data/exchanges/`).

Depends on [`datetime-protocol`](https://github.com/egao1980/datetime-protocol) (+ `/calendars`). Trading-session tests need [`cl-stack-tzdata`](https://github.com/egao1980/cl-stack-tzdata).

Holiday rules cite normative **`:authority`** (statute / EO / ECB decision / proclamation) for civil `:from`/`:to` and for observance. See [`docs/AUTHORITIES.md`](docs/AUTHORITIES.md).

Statute-named `:observed` (prefer these):

| Policy | Law |
|--------|-----|
| `:us-federal-in-lieu` | 5 U.S.C. § 6103(b) + EO 11582 § 3(a) |
| `:uk-proclamation-substitute` | BFDA 1971 + Royal Proclamations / [gov.uk](https://www.gov.uk/bank-holidays) |
| `:jp-furikae` | 祝日法 Art. 3(2) — **Sunday only** |
| `:ru-tk-112-transfer` | ТК РФ ст. 112 ч. 2 (except 1–8 Jan) |

Substitute days do not depend on the order of the rules (since 0.6.0). Every nominal holiday of every rule, in the year and the years either side, is claimed first. Substitutes are then placed in date order (ties by name), and each skips weekend days, claimed days and earlier substitutes, also across 31 Dec / 1 Jan. A substitute never swallows another holiday, and `:us-federal-in-lieu` walks past a claimed Friday instead of dropping the holiday. Two rules on the same date keep that one day, and `holiday-p` reports both names joined with `"; "`, sorted.

A `:computed` rule may yield several dates per year (since 0.7.0). Its COMPUTE may return NIL, a DATE or a list of DATEs. The Hijri helpers the starters use (`eid-al-fitr`, `eid-al-adha`, `islamic-new-year-date`, `mawlid-date` and `islamic-date-in-gregorian-year`, all shadowing datetime-protocol's) are occurrence-aware: a COMPUTE that calls them runs once per occurrence of that Hijri date in the Gregorian year. So the second Eid of years such as 2000, 2006, 2033 and 2039 is kept, and `(+ (eid-al-adha y) 2)`-style blocks that start in late December run on into January. Dates are tabular (Kuwaiti arithmetic), and sighting or Umm al-Qura countries can differ by a day.

### Data coverage

`(calendar-coverage cal)` gives the years a calendar has data for:

- NIL for statute-rule calendars, which are unbounded;
- `(2000 . 2040)` for `country-calendar` and corpus-inferred starters;
- `:none` for an empty stub (`country-calendar-stub-p`).

Since 0.10.0, `holiday-p` outside the coverage signals `calendar-out-of-range`, a `calendar-error` with the readers `calendar-out-of-range-calendar`, `-date` and `-coverage`. So `holidays-between` and `business-days-between` signal too. It offers two restarts: `use-value` returns a value for `holiday-p`, and `continue` treats the date as not a holiday.

```lisp
(handler-bind ((calendar-out-of-range #'continue))     ; old behaviour, per call
  (business-days-between (country-calendar "DE") (make-date 2040 12 1) (make-date 2041 2 1)))
(holiday-p (country-calendar "DE" :strict nil) (make-date 2041 10 3)) ; => NIL, no signal
```

Corpus-inferred starters no longer extrapolate: their rules run only over the corpus years, and their `:authority` says they are inferred.

### Registered calendars and data files

Since 0.12.0 a calendar found by code carries every year of its data file. Before, `find-calendar "GB"` had no proclamations, `"RU"` no decree transfers, and so on for every starter whose constructor takes `:year`. Now `find-calendar` returns the same calendar as the constructor called without `:year`, and that calendar applies every block of the file. On each day of a year Y it gives the same answers as `(constructor :year Y)`.

| Code | Data file | What it adds |
|---|---|---|
| `GB`, `GBLO` | `data/gb/proclamations.sexp` | Royal Proclamations 1995–2023 (London Gazette) |
| `RU` | `data/ru/transfers.sexp` | Government decree transfers and working Saturdays |
| `CN` | `data/cn/transfers.sexp` | 国办 调休 notices and 上班 days |
| `IN` | `data/in/dopt-holidays.sexp` | DoPT gazetted festivals |
| `ID`, `PH`, `TH`, `KR`, `MY` | `data/{id,ph,th,kr,my}/…` | cuti bersama, proclamations, Royal Gazette, 임시공휴일, JPM days |
| `NP`, `KH`, `SG` | `data/{np,kh,sg}/gazette-holidays.sexp` | gazetted festival blocks |
| `CL` | `data/cl/transfers.sexp` | Fiestas Patrias bridge days, 2 January, bank 31 December |
| `CO` | `data/co/transfers.sexp` | nothing: the file is empty, since Colombia decrees no "puentes" |

`LK` is the exception: `data/lk/poya-days.sexp` lists new-moon dates rather than Poya days. So `find-calendar "LK"` and `(sri-lanka-holidays-calendar)` leave it out, and only `:year N` applies it.

Registered data calendars are built on first lookup (`register-calendar-constructor`). `clear-data-caches` and `set-data-root` rebuild them. `(make-instance 'russian-holidays-calendar)` still gives the statute rules alone. A decree transfer is named only in the year map of its own date, so a rule holiday keeps its name: CN 2026-01-01 is 元旦, not 调休.

`country-calendar "GB"` is England and Wales, the scope of `find-calendar "GB"`. The date-holidays dump had no Summer bank holiday and missed the 2002, 2011 and 2012 proclamations. Both are fixed in the file, as its `:note` describes. On weekdays the corpus now matches the starter over 2000–2040 and gov.uk over 2012–2028.

### Caching and threads

Since 0.9.1 a `rule-calendar` builds each year's holiday map once and keeps it, together with its working-day and suppressed-date sets, in a per-instance synchronized table (`:synchronized t` on SBCL). Queries from several threads are safe. As an example, `holidays-between` over 41 years of KR now takes milliseconds; it used to take about a minute. A `setf` of any rule-calendar accessor (`calendar-rules`, `calendar-transfers`, `calendar-working-days`, `calendar-suppressed-dates`, `calendar-weekend-days`, the sandwich and furikae settings) drops the cache. After changing a rule struct or a list in place, call `(clear-calendar-cache cal)`.

Since 0.11.0 the corpus, exchange and registry caches are synchronized tables as well, so concurrent first use is safe. `clear-data-caches` (and with it `set-data-root` / `with-data-root`) also makes every rule calendar rebuild its year maps, because a cached year map belongs to one data root. These data-root functions are **process-wide**: they clear the caches for all threads, so don't switch roots while other threads are querying calendars against a different root.

### Errors

Every error is a `calendar-error`:

- `adjust-date` with an unknown convention signals `invalid-convention`; its `use-value` restart retries with another convention.
- `next-business-day` and `previous-business-day` give up after 366 days and signal `no-business-day`, for example on a calendar whose weekend is every day.
- A weekend list that covers the whole week signals instead of looping, and so does a substitute day that finds no free day.
- `holiday-p` outside a calendar's data signals `calendar-out-of-range` (see Data coverage).

### Weekends

Since 0.9.0 a weekend can change by era. `:weekend-days` on `define-calendar`, `make-data-calendar`, a `rule-calendar` or `country-calendar` takes either a weekday list (`'(5 6)`) or an era list (`'((nil 4 5) ((2013 6 29) 5 6))`). `(weekend-days-on cal date)` gives the list in force on DATE, and `calendar-weekend-days` gives the current one. Observance shifts (`:next-weekday`, `:us-federal-in-lieu`, …) use the weekend of each day they look at.

The cited table `country-weekend-days` / `weekend-era-source` supplies the weekend for registered starters (`define-calendar :register`), corpus-inferred starters and `country-calendar`. It covers SA, AE, BH, QA, KW, OM, JO, YE, DZ, LY, IQ, SD, BD, EG, SY, IL, IR, AF and NP. Any code the table does not list keeps Sat/Sun. Two examples:

- SA moved from Thu–Fri to Fri–Sat on 2013-06-29.
- AE moved from Thu–Fri to Fri–Sat on 2006-09-01, then to Sat–Sun on 2022-01-01.

The weekend is the government and banking week; private-sector rules can differ. The `country-calendar` cache is keyed on the code and `:weekend-days`, so `(country-calendar "AE" :weekend-days '(5 6))` is a calendar of its own.

### Composite and versioned calendars

Since 0.8.0 a wrapper keeps its constituents' weekends and their working-day overrides, such as RU/CN decree work Saturdays:

| `make-composite-calendar` mode | holiday | weekend | business day | name |
|---|---|---|---|---|
| `:union` (joint settlement, default) | any constituent | any constituent (`weekend-day-p` of each) | every constituent open | names of the holiday constituents, `"; "` |
| `:intersection` | every constituent | every constituent | any constituent open | `"+"`-joined names |

`calendar-weekend-days` is the union or intersection of the constituents' lists. With `:weekend-days`, that plain list replaces the constituents' weekends and their working-day overrides. An empty calendar list, or an unknown mode, signals `calendar-error`. A `versioned-calendar` delegates `holiday-p`, `weekend-day-p`, `business-day-p` and `calendar-weekend-days` to `(calendar-as-of c)`, its newest snapshot.

Russian/USSR: `(russian-holidays-calendar)` (and `find-calendar "RU"`) = ТК eras + every decree transfer; `:year 2026` keeps only that year's; `(ussr-holidays-calendar)` for late-Soviet fixed days.

Normative starters (prefer over `country-calendar` corpus): `japan-holidays-calendar` (祝日法 + Tokyo equinoxes), `(china-holidays-calendar :year 2026)` (放假办法 + Beijing lunar + 调休), `india-holidays-calendar`, `germany-holidays-calendar` / `france-holidays-calendar` / `italy-holidays-calendar` / `spain-holidays-calendar` / `netherlands-holidays-calendar` / `belgium-holidays-calendar` / `austria-holidays-calendar` / `poland-holidays-calendar` / `sweden-holidays-calendar`, plus `target-calendar` (ECB). See [`docs/AUTHORITIES.md`](docs/AUTHORITIES.md).

`(event-schedule cal :holiday)` / `:business-day` / `:weekend` — same `datetime-protocol` schedule protocol as sunrise/Easter. Ritual **activity bans until sunset / from fajr** still need lat/lon (`jewish-melacha-forbidden-p`, `islamic-fasting-p` on `+jerusalem+` / `+mecca+`), not civil-midnight holiday tables.

`:bridge :adjacent` and China-style rearrangements without a cited decree are not silent defaults.

```lisp
(asdf:load-system "cl-stack-calendars")
(use-package :stack-calendars)

(let ((cal (russian-holidays-calendar :year 2026)))
  (holiday-p cal (make-date 2026 1 9))   ; decree transfer
  (business-day-p cal (make-date 2024 4 27))) ; compensatory Saturday when :year 2024

;; 212 country/territory codes: 206 with data (2000–2040 public+bank), incl.
;; TW/XK/EH, plus 6 empty stubs (ABH NCY OST PMR PS SOL). Outside 2000–2040, and
;; for a stub, holiday-p signals CALENDAR-OUT-OF-RANGE (see below).
(list-country-calendars)
(holiday-p (country-calendar "DE") (make-date 2024 10 3))
(holiday-p (country-calendar "TW") (make-date 2024 2 10))
(holiday-p (country-calendar "XK") (make-date 2024 2 17))

(let ((session (make-trading-session
                :name "NYSE-RTH"
                :zone "America/New_York"
                :open '(9 30)
                :close '(16 0)
                :calendar (us-federal-holidays-calendar))))
  (session-bounds session (make-date 2024 6 3))
  (session-duration session (make-date 2024 3 10))) ; DST: open/close resolved independently

;; Versioned major-exchange cash hours (data/exchanges/<MIC>.sexp)
(list-exchanges)                                    ; XNYS XLON XAMS XTAI XCME …
(exchange-sessions-for-date (find-exchange "XNYS")
                            (make-date 1985 9 26))  ; 10:00–16:00 era
(exchange-trading-day-p (find-exchange "XNYS")
                        (make-date 2026 11 26)) ; NIL — Thanksgiving ("NYSE" calendar)
(exchange-session-bounds "XTKS" (make-date 2024 11 5)) ; afternoon to 15:30
(exchange-open-p "XHKG" instant)                    ; lunch excluded
```

Starter calendars: `weekend-only-calendar`, `target-calendar`, `us-federal-holidays-calendar`, `nyse-holidays-calendar` ("NYSE"), `uk-bank-holidays-calendar`, `russian-holidays-calendar`, `ussr-holidays-calendar`, `japan-holidays-calendar`, `china-holidays-calendar`, `india-holidays-calendar`, **EU-27** national starters (`germany-…` … `malta-…`), plus `(country-calendar "XX")` for the world corpus (`data/countries/`, CC BY-SA 3.0 via date-holidays).

Holiday verification: `data/tests/holiday-gold.sexp` + `tests/holiday-suite-test.lisp` (gold vectors, year-sweep invariants, corpus load, starter↔corpus core dates, exchange calendar attachments). External lock: `data/tests/external-gold.sexp` (gov.uk + 内閣府 CSV + frozen vacanza dump; refresh `ros -l scripts/fetch-external-gold.lisp -q`). Computed festivals: `data/tests/calc-gold.sexp` (HKO lunar, dateutil Easter, pyluach Hebrew, Kuwaiti Eid; refresh `uv run scripts/generate_calc_gold.py`). NYSE: `data/tests/xnys-gold.sexp` (Python `exchange_calendars` XNYS 1970–2030 — every session date and early close; refresh `uv run --no-project --with exchange_calendars python -I scripts/generate_xnys_gold.py`).

### Exchange holidays

Every exchange query — `exchange-trading-day-p`, `exchange-sessions-for-date`, `exchange-session-bounds`, `exchange-open-p` — honours the exchange's holiday calendar (`exchange-hours-calendar-name`; `exchange-holiday-p`). Since 0.5.0 XNYS and XNAS use the `"NYSE"` calendar (NYSE Rule 7.2 holidays from 1954 + special closures in `data/us/nyse-closures.sexp`), not `"USFED"`: Good Friday is closed, Columbus Day and Veterans Day are open, and a Saturday New Year's Day leaves Friday Dec 31 open. The CME-family MICs (XCME, XCBT, XCEC, XNYM) still use `"USFED"` as an approximation (Globex trades through most US holidays; #48). Other MICs use the national civil calendar, which can differ from the exchange's own list (#49).

## Data path / client zip

~300 `.sexp` files live under `data/`. Point the tree at another directory, a zip of that tree, or a `zip://` URI — the usual client-app ship format is one `data.zip` next to the executable.

```lisp
(set-data-root "/opt/app/data/")                 ; unpacked
(set-data-root "/opt/app/data.zip")              ; → zip:///opt/app/data.zip!/
(set-data-root "zip:///opt/app/data.zip!/")      ; explicit
(set-data-root "zip:///C:/app/data.zip!/")       ; Windows — keep the drive
(write-data-zip "/opt/app/data.zip")          ; pack the current tree
```

`$CL_STACK_CALENDARS_DATA` is the default when `*data-root*` is unset. Switching the root is process-wide (see Caching and threads). `*countries-data-directory*` / `*exchanges-data-directory*` still override those subtrees.

## License

MIT
