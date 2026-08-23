# External holiday gold

Pinned snapshot: `external-gold.sexp`. Refresh: `uv run scripts/fetch-external-gold.py`.

| Source | Kind | What we compare |
|--------|------|-----------------|
| [gov.uk bank-holidays.json](https://www.gov.uk/bank-holidays.json) | Official (OGL) | England & Wales vs `(uk-bank-holidays-calendar :year N)` |
| [内閣府 syukujitsu.csv](https://www8.cao.go.jp/chosei/shukujitsu/syukujitsu.csv) | Official | 1955–2027 vs `JP` starter |
| [vacanza/holidays](https://github.com/vacanza/holidays) 0.82 | Computational (MIT) | Independent of date-holidays. Asserted: USFED (weekdays), TARGET, DE, FR, JP. GBLO is locked by gov.uk (vacanza keeps weekend Christmas). |

`data/countries/` is date-holidays — **not** used as an external check.
