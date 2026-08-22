# cl-stack-calendars

Holiday and trading calendars for [cl-stack](https://github.com/egao1980/cl-stack): business-day arithmetic, rule/data/composite calendars, versioned as-of snapshots, and trading sessions with history-aware zone boundaries.

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
```

Starter calendars: `weekend-only-calendar`, `target-calendar`, `us-federal-holidays-calendar`, `uk-bank-holidays-calendar`, `russian-holidays-calendar`, `ussr-holidays-calendar`, `japan-holidays-calendar`, `china-holidays-calendar`, `india-holidays-calendar`, **EU-27** national starters (`germany-…` … `malta-…`), plus `(country-calendar "XX")` for the world corpus (`data/countries/`, CC BY-SA 3.0 via date-holidays).

## License

MIT
