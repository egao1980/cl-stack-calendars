# Normative authorities

Holiday **existence** (`:from` / `:to`) and **observance** (`:observed`, sandwich)
are keyed to legal / official acts — not customary summaries.

### Civil validity window (normative starters)

When filling a country calendar, **research public holidays from
`max(1900, formation/independence)` to the present** (`data/formation-years.sexp`).
That window is the scope for what belongs in the starter — not only the current
gazetted list.

For each holiday found in that span:

1. `:from` = year (or `(y m d)`) it became a statutory / gazetted public holiday.
2. `:to` = when it was abolished, replaced, or renamed away (split eras).
3. Commemorations of pre-1900 events still enter the calendar only from 1900
   (or formation, if later), unless a dedicated pre-modern calendar is modelled.
4. Colonial / predecessor states use separate calendars or `:to`-bounded eras
   (e.g. USSR vs RF) — do not silently extend the successor state's code backwards.

Example: PH Independence Day is `:from 1946 :to 1961` on 4 July, then
`:from 1962` on 12 June — both eras fall inside the research window.

| Calendar | Instrument | Role |
|----------|------------|------|
| `USFED` | [5 U.S.C. § 6103](https://uscode.house.gov/view.xhtml?req=granuleid:USC-prelim-title5-section6103) | Legal public holidays (a); Saturday in-lieu (b) |
| `USFED` | [Exec. Order No. 11582](https://www.archives.gov/federal-register/codification/executive-order/11582.html) § 3(a) | Sunday → following workday in-lieu |
| `USFED` | Pub. L. 90-363 (Uniform Monday Holiday Act) | Monday forms from 1971-01-01 |
| `USFED` | Pub. L. 98-144 | MLK Day (first observance 1986) |
| `USFED` | Pub. L. 94-97 | Veterans Day back to Nov 11 (eff. 1978) |
| `USFED` | Pub. L. 117-17 | Juneteenth (signed 2021-06-17) |
| `GBLO` | [Banking and Financial Dealings Act 1971](https://www.legislation.gov.uk/ukpga/1971/80) s.1 & Sch.1 | Statutory bank holidays + proclamation power |
| `GBLO` | [gov.uk/bank-holidays](https://www.gov.uk/bank-holidays) | Published proclamation substitute dates |
| `TARGET` | [ECB GC decision 14 Dec 2000](https://www.ecb.europa.eu/press/pr/date/2000/html/pr001214_4.en.html) | Long-term TARGET closing days (no weekend in-lieu) |
| `RU` | [ТК РФ ст. 112](http://www.consultant.ru/document/cons_doc_LAW_34683/) | Non-working holidays + automatic weekend transfer (except 1–8 Jan) |
| `RU` | ФЗ от 29.12.2004 № 201-ФЗ | NY 1–5 Jan, Unity Day 4 Nov; drop 7 Nov & 12 Dec (from 2005) |
| `RU` | ФЗ от 23.04.2012 № 35-ФЗ | NY block adds 6 and 8 Jan |
| `RU` | Discretionary перенос acts (ПП / ФЗ) | Full corpus in `data/ru/transfers.sexp` (**1991–2026**); gaps 1998 & 2004 = no discretionary act (TK-only). 2000 = ФЗ-217 |
| `USSR` | КЗоТ СССР / Указы Президиума ВС | Late-Soviet non-working days (see starter-russian.lisp) |
| `JP` | [国民の祝日に関する法律](https://www8.cao.go.jp/chosei/shukujitsu/gaiyou.html) | 祝日 list; Art. 3(2) 振替; Art. 3(3) 国民の休日 |
| `JP` | 春分日/秋分日 | Astronomical equinox civil date at Tokyo (`+tokyo+`) |
| `CN` | 《全国年节及纪念日放假办法》 | Statutory festivals; lunar dates via Beijing astronomy |
| `CN` | Annual 国办发明电 / 国发明电 调休 | Full corpus in `data/cn/transfers.sexp` (**1999–2026**; 澳门回归 + Y2K元旦 through current). Cross-year NY blocks via FROM/TO year touch |
| `IN` | Negotiable Instruments Act 1881 / DoPT | Three national + common gazetted (GF, Christmas) |
| `ID` `PK` `NG` `BR` `BD` `MX` `ET` `PH` `EG` `VN` `CD` `TR` `IR` `TH` `KR` `…` | National statutes (see `starter-asia/americas/africa/mena.lisp`) | Research window `[max(1900,formation), now]` with `:from`/`:to` eras |
| `DE` | Feiertagsgesetze / Einigungsvertrag Art. 2 | Bundeseinheitliche Feiertage |
| `FR` | Code du travail L.3133-1 | Jours fériés légaux |
| `IT` `ES` `NL` `BE` `AT` `PL` `SE` | National statutes (see starter-eu.lisp) | Federal/national common sets |
| `country-calendar` | [date-holidays](https://github.com/commenthol/date-holidays) CC BY-SA 3.0 | 206 jurisdictions + stubs; years 2000–2040 public/bank |

Hand-maintained starters beat `country-calendar` when both exist (prefer `japan-holidays-calendar` / `china-holidays-calendar` / `russian-holidays-calendar` / `us-federal-holidays-calendar` over corpus `"JP"` / `"CN"` / `"RU"` / `"US"`).

## Sunrise / sunset–bound rules (lat/lon)

Jewish and Muslim ritual intervals are **not** civil midnight calendars — they need an `astro-location`:

| Tradition | Bound | API (`datetime-protocol`) |
|-----------|--------|---------------------------|
| Jewish day / Shabbat / yom tov start | Sunset | `jewish-day-begins`, `jewish-sunset` |
| Melacha permitted again | Nightfall (tzeit) | `jewish-nightfall`, `jewish-shabbat-interval`, `jewish-melacha-forbidden-p` |
| Islamic fast (Ramadan) | Fajr → Maghrib | `islamic-fasting-interval`, `islamic-fasting-p`, `islamic-fajr`, `islamic-maghrib` |
| Hindu “at sunrise” festivals | Sunrise at Delhi/Ujjain | `sunrise` + `+delhi+` / `+ujjain+` (gazetted dates still from DoPT) |

Reference loci: `+jerusalem+`, `+mecca+`, `+tokyo+`, `+beijing+`, `+delhi+`, `+ujjain+`.

## Statute-named `:observed` policies

| Keyword | Law | Effect |
|---------|-----|--------|
| `:us-federal-in-lieu` | 5 U.S.C. § 6103(b) + EO 11582 § 3(a) | Sat→Fri, Sun→Mon (Mon–Fri workweek) |
| `:uk-proclamation-substitute` | BFDA 1971 + Royal Proclamations | next free weekday; exclusive across rules |
| `:jp-furikae` | [祝日法](https://www8.cao.go.jp/chosei/shukujitsu/gaiyou.html) Art. 3(2) | **Sunday only** → next non-holiday weekday |
| `:ru-tk-112-transfer` | ТК РФ ст. 112 ч. 2 | weekend∩holiday → next workday; **not** for 1–8 Jan |

Calendar flag `:sandwich-holidays-p` + `:sandwich-authority` implements 祝日法 Art. 3(3) (国民の休日).

Russian long NY/May blocks = ТК fixed holidays + `:ru-tk-112-transfer` + annual decree transfers via `(russian-holidays-calendar :year 2026)` (FROM weekend → compensatory working day; TO → extra day off).

## Not law by default

- `:bridge :adjacent` (Tue→Mon / Thu→Fri “puente”) — only when a rule’s `:authority` cites a bridge statute or binding instrument.
- Mechanical primitives (`:nearest-weekday`, `:next-weekday`, `:substitute-next`, …) — implementation atoms; starters must use statute-named policies + `:authority`.
