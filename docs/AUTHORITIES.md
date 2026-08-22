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
| `GBLO` | [Bank Holidays Act 1871](https://en.wikipedia.org/wiki/Bank_Holidays_Act_1871) | England & Wales: Easter Mon, Whit Mon, first Mon Aug, Boxing Day (research window from 1900); Whit/Aug replaced experimentally 1965, permanently BFDA 1971 |
| `GBLO` | [gov.uk/bank-holidays](https://www.gov.uk/bank-holidays) | Published proclamation substitute dates |
| `GBLO` | Special Royal Proclamations (s.1(2)–(3)) | Extras + relocated BH in `data/gb/proclamations.sexp` (VE 1995/2020, Jubilees 2002/2012/2022, Wedding 2011, Coronation 2023). Use `(uk-bank-holidays-calendar :year N)` |
| `TARGET` | [ECB GC decision 14 Dec 2000](https://www.ecb.europa.eu/press/pr/date/2000/html/pr001214_4.en.html) | Long-term TARGET closing days (no weekend in-lieu) |
| `RU` | [ТК РФ ст. 112](http://www.consultant.ru/document/cons_doc_LAW_34683/) | Non-working holidays + automatic weekend transfer (except 1–8 Jan) |
| `RU` | ФЗ от 29.12.2004 № 201-ФЗ | NY 1–5 Jan, Unity Day 4 Nov; drop 7 Nov & 12 Dec (from 2005) |
| `RU` | ФЗ от 23.04.2012 № 35-ФЗ | NY block adds 6 and 8 Jan |
| `RU` | Discretionary перенос acts (ПП / ФЗ) | Full corpus in `data/ru/transfers.sexp` (**1991–2026**); gaps 1998 & 2004 = no discretionary act (TK-only). 2000 = ФЗ-217 |
| `USSR` | КЗоТ СССР / Указы Президиума ВС | Late-Soviet non-working days (see starter-russian.lisp) |
| `JP` | [国民の祝日に関する法律](https://www8.cao.go.jp/chosei/shukujitsu/gaiyou.html) | 祝日 list; Art. 3(2) 振替 from 1973 (`:observed-from`); Art. 3(3) 国民の休日 from 1985 (`:sandwich-from`) |
| `JP` | 休日ニ関スル件（大正元年勅令19号 / 昭和2年勅令25号） | Imperial 祝祭日 1900–1948-07-19; day-precise 年号 (天長節 Meiji/Taisho/Showa, 先帝祭) |
| `JP` | 天皇の即位の日等を定める法律（平成30年法律第83号） | 2019-05-01 即位・10-22 即位礼; sandwich GW |
| `JP` | 五輪特別措置法 | 2020–2021 moves: 海の日 / スポーツの日 / 山の日 |
| `JP` | 春分日/秋分日 | Astronomical equinox civil date at Tokyo (`+tokyo+`) |
| `CN` | 《全国年节及纪念日放假办法》 | Statutory festivals; lunar dates via Beijing astronomy |
| `CN` | Annual 国办发明电 / 国发明电 调休 | Full corpus in `data/cn/transfers.sexp` (**1999–2026**; 澳门回归 + Y2K元旦 through current). Cross-year NY blocks via FROM/TO year touch |
| `ID` | SKB 3 Menteri / Keppres cuti bersama | Extra leave days in `data/id/cuti-bersama.sexp` (**2002–2026**). Facultative for private employers; ASN via Keppres. `(indonesia-holidays-calendar :year N)` |
| `KR` | 관공서의 공휴일에 관한 규정 — 임시공휴일 | National temporary holidays in `data/kr/temporary-holidays.sexp` (historical + modern 2015–2025). `(south-korea-holidays-calendar :year N)` |
| `IN` | Negotiable Instruments Act 1881 / DoPT | Three national + common gazetted (GF, Christmas, Id-ul-Fitr/Zuha, Muharram, Milad). Hindu lunar festivals in `data/in/dopt-holidays.sexp` (**2010–2026**). `(india-holidays-calendar :year N)` |
| `NP` | MoHA Nepal Gazette | Dashain/Tihar block in `data/np/gazette-holidays.sexp` (**2020–2026**). `(nepal-holidays-calendar :year N)` |
| `LK` | Gazette / MOE circulars | Poya/Vesak/Deepavali in `data/lk/poya-days.sexp` (corpus 2000–2040). `(sri-lanka-holidays-calendar :year N)` |
| `KH` | Royal government gazette | Buddhist holidays in `data/kh/gazette-holidays.sexp` (**2020–2026**). `(cambodia-holidays-calendar :year N)` |
| `SG` | MOM gazetted list | Vesak/Deepavali/Hari Raya in `data/sg/gazette-holidays.sexp` (corpus 2000–2040). `(singapore-holidays-calendar :year N)` |
| `VN` | Bộ luật Lao động | Hung Kings from 2007; Quốc khánh 2 days from 2021; Ngày Văn hóa from 2026 |
| `PH` | RA / proclamations | Ninoy Aquino Day 2004; EDSA 1986; Independence 4 Jul→12 Jun. Bridge days in `data/ph/proclamations.sexp` (**2024–2026**). `(philippines-holidays-calendar :year N)` |
| `TH` | Royal Gazette / Cabinet | Statutory list + substitute days in `data/th/transfers.sexp` (**2024–2026**). `(thailand-holidays-calendar :year N)` |
| `MY` | JPM / PMO cuti persekutuan | Federal set + extras in `data/my/transfers.sexp` (**2024–2026**). `(malaysia-holidays-calendar :year N)` |
| `CO` | Ley 51/1983 Emiliani + Decreto puente | Monday moves via `co-emiliani-monday`; puentes in `data/co/transfers.sexp` (**2024–2026**). `(colombia-holidays-calendar :year N)` |
| `CL` | Ley 19.973/2004 + D.O. puentes | Monday moves + bridge extras in `data/cl/transfers.sexp` (**2010–2026**; 2010–2023 corpus backfill). `(chile-holidays-calendar :year N)` |
| `SD` `IQ` `AF` `AO` `UZ` | National statutes (starter-mena/africa/asia.lisp) | ≥35M fill: Sudan Coptic+Islamic; Iraq National Day/Victory/Ghadir; AF Independence + Nowruz to 2020; AO Liberation/Peace eras; UZ Navro'z/Independence |
| `MZ` `MG` `CM` `CI` `NE` `BF` `ML` `MW` `ZM` `YE` `SY` `KP` `NP` `LK` `VE` `CL` `KZ` | National statutes (starter-africa/mena/asia/americas.lisp) | ≥20M normative fill with `:from`/`:to` eras |
| `DE` | Feiertagsgesetze / Einigungsvertrag Art. 2 | Bundeseinheitliche Feiertage; 17. Juni Einheit 1954–1990, then 3. Oktober from 1990 |
| `FR` | Code du travail L.3133-1 | Jours fériés; 1er mai from 1919; Armistice from 1922; Victoire 8 mai 1953–58 then from 1982 |
| `IT` | L. 260/1949 e succ. | Epifania abolished 1977 / restored 1985 |
| `ES` | Estatuto / BOE fiestas nacionales | Constitución 1978; Fiesta Nacional Ley 18/1987 |
| `NL` | Algemeen erkende feestdagen | Koninginnedag→Koningsdag 2014 |
| `BE` `AT` `SE` | National statutes (starter-eu.lisp) | Federal/national common sets |
| `PL` | Ustawa o dniach wolnych od pracy | Epiphany 2011; Wigilia from 2025 |
| `PT` | Código do Trabalho art. 234.º / Lei 8/2016 | Four holidays suspended 2013–2015, restored 2016 |
| `RO` `GR` `BG` `CY` | National statutes; Orthodox Easter | See starter-eu.lisp (:orthodox t) |
| `CZ` `SK` | Zákon o státních/štátnych sviatkoch | CZ Velký pátek 2016; SK Deň Ústavy to 2023 |
| `HU` | Munkaszüneti napok | Nagypéntek from 2017 |
| `DK` | Danske helligdage | Store bededag abolished from 2024 |
| `FI` `IE` `HR` `LT` `SI` `LV` `EE` `LU` `MT` | National statutes (starter-eu.lisp) | Eras for Brigid 2023, HR 2020 reform, LT Vėlinės 2020, LU Europe Day 2019 |
| `country-calendar` | [date-holidays](https://github.com/commenthol/date-holidays) CC BY-SA 3.0 | 206 jurisdictions + stubs; years 2000–2040 public/bank |

Hand-maintained starters beat `country-calendar` when both exist (prefer `japan-holidays-calendar` / `china-holidays-calendar` / `russian-holidays-calendar` / `us-federal-holidays-calendar` over corpus `"JP"` / `"CN"` / `"RU"` / `"US"`).

### Subnational composites

| Code | Base | Regional | Notes |
|------|------|----------|-------|
| `US-CA` | `USFED` | California state days | César Chávez + day after Thanksgiving |
| `DE-BY` | `DE` | Bavaria (`Bayern`) | Heilige Drei Könige, Fronleichnam, Mariä Himmelfahrt, Allerheiligen |
| `ES-CT` | `ES` | Catalonia | Sant Jordi, Diada, La Mercè |

Registered via `register-subnational-calendars` as `COMPOSITE-CALENDAR` union mode.

### Corpus-inferred territory starters

Codes in `data/countries/` without hand starters (e.g. `ABH`, `NCY`, `OST`, `PMR`, `PS`, `SOL`) get normative `RULE-CALENDAR` starters at load via `register-corpus-inferred-territory-starters` — fixed + Easter rules inferred from corpus recurrence.

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

ID cuti bersama / KR 임시공휴일 / GB special proclamations attach the same way (`:year` → TO-only transfers; GB also sets `:suppressed-dates` when Spring/Early May BH is relocated).

## Not law by default

- `:bridge :adjacent` (Tue→Mon / Thu→Fri “puente”) — only when a rule’s `:authority` cites a bridge statute or binding instrument.
- Mechanical primitives (`:nearest-weekday`, `:next-weekday`, `:substitute-next`, …) — implementation atoms; starters must use statute-named policies + `:authority`.
