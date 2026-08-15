# cl-stack-calendars

Holiday and trading calendars for [cl-stack](https://github.com/egao1980/cl-stack): business-day arithmetic, rule/data/composite calendars, versioned as-of snapshots, and trading sessions with history-aware zone boundaries.

Depends on [`datetime-protocol`](https://github.com/egao1980/datetime-protocol) (+ `/calendars`). Trading-session tests need [`cl-stack-tzdata`](https://github.com/egao1980/cl-stack-tzdata).

Holiday rules carry civil `:from`/`:to` validity windows (year or `(y m d)` date) — when the holiday *existed*, sourced from statute / central-bank calendars. That is separate from versioned `calendar-as-of` snapshots (what was *known* at booking time).

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
