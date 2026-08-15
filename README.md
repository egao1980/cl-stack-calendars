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

`:bridge :adjacent` and Russia/China “work Saturday” rearrangements are not silent defaults — only with cited authority, or as `data-calendar` proclamations.

```lisp
(asdf:load-system "cl-stack-calendars")
(use-package :stack-calendars)

(let ((cal (us-federal-holidays-calendar)))
  (holiday-p cal (make-date 2024 5 27))          ; Memorial Day
  (holiday-p cal (make-date 2020 6 19))          ; NIL — Juneteenth not yet federal
  (next-business-day cal (make-date 2024 5 24))  ; → 2024-05-28
  (adjust-date cal (make-date 2024 1 6) :following))

(let ((session (make-trading-session
                :name "NYSE-RTH"
                :zone "America/New_York"
                :open '(9 30)
                :close '(16 0)
                :calendar (us-federal-holidays-calendar))))
  (session-bounds session (make-date 2024 6 3))
  (session-duration session (make-date 2024 3 10))) ; DST: open/close resolved independently
```

Starter calendars: `weekend-only-calendar`, `target-calendar`, `us-federal-holidays-calendar`, `uk-bank-holidays-calendar`.

## License

MIT
