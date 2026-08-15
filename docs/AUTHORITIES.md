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

## Statute-named `:observed` policies

| Keyword | Law | Effect |
|---------|-----|--------|
| `:us-federal-in-lieu` | 5 U.S.C. § 6103(b) + EO 11582 § 3(a) | Sat→Fri, Sun→Mon (Mon–Fri workweek) |
| `:uk-proclamation-substitute` | BFDA 1971 + Royal Proclamations | next free weekday; exclusive across rules |
| `:jp-furikae` | [祝日法](https://www8.cao.go.jp/chosei/shukujitsu/gaiyou.html) Art. 3(2) | **Sunday only** → next non-holiday weekday |

Calendar flag `:sandwich-holidays-p` + `:sandwich-authority` implements 祝日法 Art. 3(3) (国民の休日).

## Not law by default

- `:bridge :adjacent` (Tue→Mon / Thu→Fri “puente”) — only when a rule’s `:authority` cites a bridge statute or binding instrument.
- Russia/China “work Saturday to pay for the bridge” — proclamation / decree → `data-calendar` / versioned snapshots.
- Mechanical primitives (`:nearest-weekday`, `:next-weekday`, `:substitute-next`, …) — implementation atoms; starters must use statute-named policies + `:authority`.
