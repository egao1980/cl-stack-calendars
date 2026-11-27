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

Russian/USSR: `(russian-holidays-calendar :year 2026)` = ТК eras + decree transfers; `(ussr-holidays-calendar)` for late-Soviet fixed days.

Normative starters (prefer over `country-calendar` corpus): `japan-holidays-calendar` (祝日法 + Tokyo equinoxes), `(china-holidays-calendar :year 2026)` (放假办法 + Beijing lunar + 调休), `india-holidays-calendar`, `germany-holidays-calendar` / `france-holidays-calendar` / `italy-holidays-calendar` / `spain-holidays-calendar` / `netherlands-holidays-calendar` / `belgium-holidays-calendar` / `austria-holidays-calendar` / `poland-holidays-calendar` / `sweden-holidays-calendar`, plus `target-calendar` (ECB). See [`docs/AUTHORITIES.md`](docs/AUTHORITIES.md).

`(event-schedule cal :holiday)` / `:business-day` / `:weekend` — same `datetime-protocol` schedule protocol as sunrise/Easter. Ritual **activity bans until sunset / from fajr** still need lat/lon (`jewish-melacha-forbidden-p`, `islamic-fasting-p` on `+jerusalem+` / `+mecca+`), not civil-midnight holiday tables.

`:bridge :adjacent` and China-style rearrangements without a cited decree are not silent defaults.

```lisp
(asdf:load-system "cl-stack-calendars")
(use-package :stack-calendars)

(let ((cal (russian-holidays-calendar :year 2026)))
  (holiday-p cal (make-date 2026 1 9))   ; decree transfer
  (business-day-p cal (make-date 2024 4 27))) ; compensatory Saturday when :year 2024

;; 212 country/territory calendars (2000–2040 public+bank), incl. TW/XK/EH + stubs
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

`$CL_STACK_CALENDARS_DATA` is the default when `*data-root*` is unset. `*countries-data-directory*` / `*exchanges-data-directory*` still override those subtrees.

## License

MIT
