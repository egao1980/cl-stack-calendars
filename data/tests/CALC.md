# Computed-holiday gold

Pinned snapshot: `calc-gold.sexp`. Refresh:

```
uv run scripts/generate_calc_gold.py
```

Official gazettes stay in `external-gold.sexp`. This file locks **calculated** festival dates.

| Source | Asserted against |
|--------|------------------|
| [HKO](https://www.hko.gov.hk/en/gts/time/conversion1_text.htm) 1901–2100 | CN 春节/清明/端午/中秋 (statutory from-years); HK lunar NY from 1997. No skips (2033 中秋 fixed in datetime-protocol 0.2.0, #38) |
| dateutil Easter | HK Good Friday / Easter Monday (from 1997) |
| pyluach | IL RH / YK / Sukkot / Passover / Shavuot (from 1948) |
| Kuwaiti/tabular JDN | `eid-al-fitr` / `eid-al-adha` / 1 Muharram / Mawlid conversion |

## Korean / Vietnamese lunar festivals

Pinned snapshot: `lunisolar-festival-gold.sexp`. Refresh (network):

```
uv run --no-project python -I scripts/generate_lunisolar_festival_gold.py
```

| Source | Asserted against |
|--------|------------------|
| [KASI 음양력 변환](https://astro.kasi.re.kr/life/pageView/8) (`/life/lunc`), 1948–2050 | KR 설날 (eve, day, next) and 추석 (eve, day, next) |
| Hồ Ngọc Đức `amlich-hnd.js` TK tables ([archived](https://web.archive.org/web/2023id_/https://www.informatik.uni-leipzig.de/~duc/amlich/JavaScript/amlich-hnd.js)), 1945–2100 | VN Giao thừa + Tết mùng 1–3; Giỗ Tổ Hùng Vương (10/3) from 2007 |

KR uses `+korea-lunisolar-zone+` (KST), VN `+vietnam-lunisolar-zone+` (UTC+7 from 1968). Month-by-month engine gold: datetime-protocol `data/tests/LUNISOLAR.md`.
