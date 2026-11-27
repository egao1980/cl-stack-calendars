# External holiday gold

Pinned snapshot: `external-gold.sexp`. Refresh official blocks:

```
ros -l scripts/install-external-gold.lisp -q   # once — cl-stack-http stack
ros -l scripts/fetch-external-gold.lisp -q
```

vacanza/holidays has no CL client; those blocks stay as a frozen dump in the sexp.

| Source | Kind | What we compare |
|--------|------|-----------------|
| [gov.uk bank-holidays.json](https://www.gov.uk/bank-holidays.json) | Official (OGL) | England & Wales vs `(uk-bank-holidays-calendar :year N)` |
| [内閣府 syukujitsu.csv](https://www8.cao.go.jp/chosei/shukujitsu/syukujitsu.csv) | Official | 1955–2027 vs `JP` starter |
| [vacanza/holidays](https://github.com/vacanza/holidays) 0.82 | Computational (MIT) | Independent of date-holidays. Asserted: USFED (weekdays), TARGET, DE, FR, JP. GBLO is locked by gov.uk (vacanza keeps weekend Christmas). |

`data/countries/` is date-holidays — **not** used as an external check.

Computed festival dates (HKO / Easter / Hebrew / tabular Eid) live in `calc-gold.sexp` — see that file's header. Refresh: `uv run scripts/generate_calc_gold.py`.

NYSE sessions and early closes live in `xnys-gold.sexp` (Python [exchange_calendars](https://github.com/gerrymanoim/exchange_calendars) XNYS, Apache-2.0; dates and close times only). Range 1970–2030: before 1970 exchange_calendars has no regular holidays (pandas holiday rules start in 1970). Refresh: `uv run --no-project --with exchange_calendars python -I scripts/generate_xnys_gold.py`. Asserted by `tests/xnys-gold-test.lisp` for XNYS (1970–2030) and XNAS (1990–2030); no allowed differences.
