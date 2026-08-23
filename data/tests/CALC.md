# Computed-holiday gold

Pinned snapshot: `calc-gold.sexp`. Refresh:

```
uv run scripts/generate_calc_gold.py
```

Official gazettes stay in `external-gold.sexp`. This file locks **calculated** festival dates.

| Source | Asserted against |
|--------|------------------|
| [HKO](https://www.hko.gov.hk/en/gts/time/conversion1_text.htm) 1901–2100 | CN 春节/清明/端午/中秋 (statutory from-years); HK lunar NY from 1997. Skip 2033 中秋 (see datetime-protocol `CHRONO.md`) |
| dateutil Easter | HK Good Friday / Easter Monday (from 1997) |
| pyluach | IL RH / YK / Sukkot / Passover / Shavuot (from 1948) |
| Kuwaiti/tabular JDN | `eid-al-fitr` / `eid-al-adha` / 1 Muharram / Mawlid conversion |
