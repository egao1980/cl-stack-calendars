# Normative authorities

Holiday **existence** (`:from` / `:to`) and **observance** (`:observed`, sandwich)
are keyed to legal / official acts — not customary summaries.

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
| `RU` | Annual постановления Правительства «О переносе выходных дней» | Decree transfers in `data/ru/transfers.sexp` |
| `USSR` | КЗоТ СССР / Указы Президиума ВС | Late-Soviet non-working days (see starter-russian.lisp) |
| `country-calendar` | [date-holidays](https://github.com/commenthol/date-holidays) CC BY-SA 3.0 | 206 jurisdictions + stubs (TW, XK, EH, PS, NCY, …); years 2000–2040 public/bank |

Hand-maintained starters beat `country-calendar` when both exist (e.g. prefer `russian-holidays-calendar` / `us-federal-holidays-calendar` over `"RU"` / `"US"` corpus rows).

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
