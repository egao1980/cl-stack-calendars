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

Russian/USSR: `(russian-holidays-calendar :year 2026)` = ТК eras + decree transfers; `(ussr-holidays-calendar)` for late-Soviet fixed days.

Normative starters (prefer over `country-calendar` corpus): `japan-holidays-calendar` (祝日法 + Tokyo equinoxes), `(china-holidays-calendar :year 2026)` (放假办法 + Beijing lunar + 调休), `india-holidays-calendar`, `germany-holidays-calendar` / `france-holidays-calendar` / `italy-holidays-calendar` / `spain-holidays-calendar` / `netherlands-holidays-calendar` / `belgium-holidays-calendar` / `austria-holidays-calendar` / `poland-holidays-calendar` / `sweden-holidays-calendar`, plus `target-calendar` (ECB). See [`docs/AUTHORITIES.md`](docs/AUTHORITIES.md).

Jewish/Muslim **activity bans until sunset / from fajr** need lat/lon — use `datetime-protocol` `jewish-melacha-forbidden-p`, `islamic-fasting-p` with `+jerusalem+` / `+mecca+` (not civil midnight holiday calendars).

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
                            (make-date 1985 9 27))  ; 10:00–16:00 era
(exchange-session-bounds "XTKS" (make-date 2024 11 5)) ; afternoon to 15:30
(exchange-open-p "XHKG" instant)                    ; lunch excluded
```

Starter calendars: `weekend-only-calendar`, `target-calendar`, `us-federal-holidays-calendar`, `uk-bank-holidays-calendar`, `russian-holidays-calendar`, `ussr-holidays-calendar`, `japan-holidays-calendar`, `china-holidays-calendar`, `india-holidays-calendar`, **EU-27** national starters (`germany-…` … `malta-…`), plus `(country-calendar "XX")` for the world corpus (`data/countries/`, CC BY-SA 3.0 via date-holidays).

Holiday verification: `data/tests/holiday-gold.sexp` + `tests/holiday-suite-test.lisp` (gold vectors, year-sweep invariants, corpus load, starter↔corpus core dates, exchange calendar attachments). External lock: `data/tests/external-gold.sexp` (gov.uk + 内閣府 CSV + frozen vacanza dump; refresh `ros -l scripts/fetch-external-gold.lisp -q`). Computed festivals: `data/tests/calc-gold.sexp` (HKO lunar, dateutil Easter, pyluach Hebrew, Kuwaiti Eid; refresh `uv run scripts/generate_calc_gold.py`).

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
