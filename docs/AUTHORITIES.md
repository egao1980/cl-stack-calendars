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
| `NYSE` | [NYSE Rule 7.2](https://www.nyse.com/markets/hours-calendars) (Holidays) | Exchange holidays (incl. Good Friday; not Columbus / Veterans Day); Saturday → Friday and Sunday → Monday, except when the Friday ends an accounting period (Saturday New Year's Day not observed) |
| `NYSE` | NYSE holiday schedule | MLK Day from 1998; Juneteenth from 2022; Election Day to 1980 (annual to 1967, then presidential years); Monday holidays from 1971 |
| `NYSE` | NYSE closing notices | Special closures in `data/us/nyse-closures.sexp` (mourning days, weather, 1968 paperwork crisis, 2001-09-11–14, 2012 Sandy, 2025-01-09 …). Modeled from 1954; gold 1970–2030 vs `exchange_calendars` (`data/tests/xnys-gold.sexp`) |
| `GBLO` | [Banking and Financial Dealings Act 1971](https://www.legislation.gov.uk/ukpga/1971/80) s.1 & Sch.1 | Statutory bank holidays + proclamation power |
| `GBLO` | [Bank Holidays Act 1871](https://en.wikipedia.org/wiki/Bank_Holidays_Act_1871) | England & Wales: Easter Mon, Whit Mon, first Mon Aug, Boxing Day (research window from 1900); Whit/Aug replaced experimentally 1965, permanently BFDA 1971 |
| `GBLO` | [gov.uk/bank-holidays](https://www.gov.uk/bank-holidays) | Published proclamation substitute dates |
| `GBLO` | Special Royal Proclamations (s.1(2)–(3)) | Extras + relocated BH in `data/gb/proclamations.sexp` (VE 1995/2020, Jubilees 2002/2012/2022, Wedding 2011, State Funeral 2022-09-19, Coronation 2023), each citing its London Gazette notice. `find-calendar "GB"` / `"GBLO"` and `(uk-bank-holidays-calendar)` apply every year; `:year N` only that year |
| `TARGET` | [ECB GC decision 14 Dec 2000](https://www.ecb.europa.eu/press/pr/date/2000/html/pr001214_4.en.html) | Long-term TARGET closing days (no weekend in-lieu) |
| `RU` | [ТК РФ ст. 112](http://www.consultant.ru/document/cons_doc_LAW_34683/) | Non-working holidays + automatic weekend transfer (ч. 2; 1–8 Jan exempt from 2013); a ч. 5 decree moving the day cancels the automatic transfer |
| `RU` | ФЗ от 29.12.2004 № 201-ФЗ | NY 1–5 Jan, Unity Day 4 Nov; drop 7 Nov & 12 Dec (from 2005) |
| `RU` | ФЗ от 23.04.2012 № 35-ФЗ | NY block adds 6 and 8 Jan; weekends on 1–8 Jan no longer transfer automatically (applied from 2013) |
| `RU` | Discretionary перенос acts (ПП / ФЗ) | Full corpus in `data/ru/transfers.sexp` (**1991–2027**; 2028+ provisional, `ru-provisional-year-p`); gaps 1998 & 2004 = no discretionary act (TK-only). 2000 = ФЗ-217 |
| `USSR` | КЗоТ СССР / Указы Президиума ВС | Late-Soviet non-working days (see starter-russian.lisp) |
| `JP` | [国民の祝日に関する法律](https://www8.cao.go.jp/chosei/shukujitsu/gaiyou.html) | 祝日 list; Art. 3(2) 振替 from **1973-04-12** (昭和48年法律第10号) + 振替 chain; Art. 3(3) 国民の休日 from 1985 (Saturday included). Checked against [内閣府 CSV](https://www8.cao.go.jp/chosei/shukujitsu/syukujitsu.csv) 1955–2027 |
| `JP` | 休日ニ関スル件（大正元年勅令19号 / 昭和2年勅令25号） | Imperial 祝祭日 1900–1948-07-19; day-precise 年号 (天長節 Meiji/Taisho/Showa, 先帝祭) |
| `JP` | 天皇の即位の日等を定める法律（平成30年法律第83号） | 2019-05-01 即位・10-22 即位礼; sandwich GW |
| `JP` | 皇室儀礼 (one-off) | 1959-04-10 結婚の儀; 1989-02-24 大喪の礼; 1990-11-12 即位礼; 1993-06-09 結婚の儀 |
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
| `CO` | [Ley 51/1983](https://www.funcionpublica.gov.co/eva/gestornormativo/norma.php?i=4954) art. 1 (Emiliani); [Ley 2578/2026](http://www.secretariasenado.gov.co/senado/basedoc/ley_2578_2026.html) art. 6 | Since 0.15.0 (#15): inciso 2 moves 6 Jan, 19 Mar, 29 Jun, 15 Aug, 12 Oct, 1 Nov, 11 Nov, Ascensión (Easter+43), Corpus Christi (+64) and Sagrado Corazón (+71) to the following Monday; 1 Jan, 1 May, 20 Jul, 7 Aug, 8 Dec, 25 Dec and Holy Thursday/Friday stay fixed. Chiquinquirá (9 Jul, Monday-moved) from 2026. Gold: `data/tests/co-holiday-gold.sexp` (statute-derived: Colombia publishes no machine-readable list), 0 differences 2000–2040. `country-calendar "CO"` defers to the starter (the corpus lists Easter Sunday). `data/co/transfers.sexp` is empty: the "puentes" it held had no legal basis |
| `CL` | [Ley 2.977](https://www.bcn.cl/leychile/navegar?idLey=2977), [Ley 19.668](https://www.bcn.cl/leychile/navegar?idLey=19668), [Ley 20.148](https://www.bcn.cl/leychile/navegar?idLey=20148), [Ley 20.215](https://www.bcn.cl/leychile/navegar?idLey=20215), [Ley 20.299](https://www.bcn.cl/leychile/navegar?idLey=20299), [Ley 20.983](https://www.bcn.cl/leychile/navegar?idLey=20983), [Ley 21.357](https://www.bcn.cl/leychile/navegar?idLey=21357) | Since 0.16.0 (#16) every recurring feriado legal is a rule: Sábado Santo; Corpus Christi 2000–2006 then Virgen del Carmen; Ley 19.668 moves of 29 Jun / 12 Oct (Tue–Thu → that Monday, Fri → next Monday); Ley 20.299 moves of 31 Oct; the winter-solstice day (civil date at UTC−4); the Ley 20.215 / 20.983 Fiestas Patrias days and 2 January; Unidad Nacional 2000–2001. `data/cl/transfers.sexp` holds only one-off laws (2002 and 2017 census, 2004, 2010, 2022). Gold: `data/tests/cl-holiday-gold.sexp`, checked against the official Gobierno Digital API 2013–2024 and feriados.cl 2026–2028; 0 differences 2000–2040. Out of scope: election days (Ley 18.700 art. 169, always on a weekend), the bank-only 31 December, regional days. `country-calendar "CL"` defers to the starter |
| `MX` | [Ley Federal del Trabajo](https://www.diputados.gob.mx/LeyesBiblio/pdf/LFT.pdf) art. 74; DOF 17-01-2006; [DOF 30-09-2024](https://gaceta.diputados.gob.mx/PDF/66/2024/sep/DOF30sep2024-Art74LeyFedTrabajo.pdf); Constitución art. 83 (DOF 10-02-2014) | Since 0.18.0 (#19), the días de descanso obligatorio. From 2006 the 5 Feb and 20 Nov days are the first and third Mondays; the 21 Mar day is the third Monday from 2007, since the 2006 decree's transitorio segundo kept 21 March 2006 for the Juárez bicentennial. Fr. VII inauguration day every six years: 1 December 2000–2018, 1 October from 2024. Not here: fr. IX election days (always a Sunday), CNBV bank-only days. Gold: `data/tests/mx-holiday-gold.sexp` (LFT text; no machine-readable list exists). The corpus `country-calendar "MX"` keeps its public+bank scope; its 2024/2030/2036 inauguration rows are corrected to 1 October |
| `BR` | [Lei 662/1949](https://www.planalto.gov.br/ccivil_03/leis/l0662.htm) art. 1 ([Lei 10.607/2002](https://www.planalto.gov.br/ccivil_03/leis/2002/l10607.htm)); [Lei 6.802/1980](https://www.planalto.gov.br/ccivil_03/leis/l6802.htm); [Lei 9.093/1995](https://www.planalto.gov.br/ccivil_03/leis/l9093.htm); [Lei 14.759/2023](https://www.planalto.gov.br/ccivil_03/_ato2023-2026/2023/lei/l14759.htm) | Since 0.18.0 (#19), feriados nacionais only: 1 Jan, Paixão de Cristo, 21 Apr, 1 May, 7 Sep, 12 Oct, 2 Nov, 15 Nov, 25 Dec, and 20 Nov from 2024. Corpus Christi, Carnaval, Quarta-feira de Cinzas, Dia do Servidor and the 24/31 Dec afternoons are federal **pontos facultativos** (optional days off for federal staff, Lei 662 art. 3), not holidays, and are not exposed as a rule set: they are a federal-staff schedule with half days, a Dia do Servidor the portaria moves each year, and yearly bridge days, so a data-driven calendar from the portarias is the follow-up (#79). Paixão de Cristo is a religious holiday under Lei 9.093 art. 2, but every federal portaria lists it as a feriado nacional. Election days (Código Eleitoral art. 380) are always on a Sunday. Gold: `data/tests/br-holiday-gold.sexp`, checked against 19 yearly federal portarias 2005–2026 (they class Paixão de Cristo as ponto facultativo in 2008, 2011 and 2012 only). The corpus `country-calendar "BR"` keeps Carnaval and Corpus Christi as bank days |
| `PE` | [DL 713](https://leyes.congreso.gob.pe/Documentos/DecretosLegislativos/00713.pdf) art. 6; [Ley 31381](https://leyes.congreso.gob.pe/Documentos/2021_2026/ADLP/Texto_Consolidado/31381-TXM.pdf), [31530](https://leyes.congreso.gob.pe/Documentos/2021_2026/ADLP/Texto_Consolidado/31530-TXM.pdf), [31822](https://leyes.congreso.gob.pe/Documentos/2021_2026/ADLP/Texto_Consolidado/31822-TXM.pdf), [31788](https://leyes.congreso.gob.pe/Documentos/2021_2026/ADLP/Texto_Consolidado/31788-TXM.pdf) | Since 0.18.0 (#19), the feriados of every worker, on their own dates (Ley 26331): Batalla de Ayacucho (9 Dec) and Junín (6 Aug) from 2022, Día de la Fuerza Aérea (23 Jul) from 2023, Batalla de Arica y Día de la Bandera (7 Jun) from 2024 (Ley 31788 was published on 15 June 2023). Not here: días no laborables by Decreto Supremo (public sector; private sector by agreement), Easter Sunday, regional days. Gold: `data/tests/pe-holiday-gold.sexp`, checked against the official gob.pe lists 2018–2025. `country-calendar "PE"` defers to the starter |
| `AR` | [Ley 21.329](https://servicios.infoleg.gob.ar/infolegInternet/anexos/65000-69999/65453/norma.htm), [Ley 23.555](https://servicios.infoleg.gob.ar/infolegInternet/anexos/20000-24999/20986/norma.htm), [Ley 24.445](https://servicios.infoleg.gob.ar/infolegInternet/anexos/0-4999/782/norma.htm), [Ley 25.370](https://servicios.infoleg.gob.ar/infolegInternet/anexos/65000-69999/65442/norma.htm), [Ley 26.085](https://servicios.infoleg.gob.ar/infolegInternet/anexos/110000-114999/114811/norma.htm), [Ley 26.416](https://servicios.infoleg.gob.ar/infolegInternet/anexos/145000-149999/145231/norma.htm), [Decreto 1584/2010](https://servicios.infoleg.gob.ar/infolegInternet/anexos/170000-174999/174389/norma.htm), [Ley 27.258](https://servicios.infoleg.gob.ar/infolegInternet/anexos/260000-264999/262574/norma.htm), [Ley 27.399](https://servicios.infoleg.gob.ar/infolegInternet/anexos/280000-284999/281835/norma.htm), [Decreto 789/2021](https://servicios.infoleg.gob.ar/infolegInternet/anexos/355000-359999/356678/norma.htm) | Since 0.19.0 (#18). Inamovibles: 1 Jan, Carnaval (from 2011), 24 Mar (from 2006), Viernes Santo, 2 Apr (inamovible from Ley 26.110; trasladable 2001–2006; 10 Jun in 2000), 1 May, 25 May, 20 Jun (third Monday until 2010), 9 Jul, 8 Dec, 25 Dec. Trasladables: 17 Aug (third Monday 1995–2016), 12 Oct (Ley 23.555, then Ley 26.416, then the second Monday 2011–2016), 20 Nov (fourth Monday 2010–2016), 17 Jun (from 2016) — from 2017 Ley 27.399 art. 6 (Tue/Wed → previous Monday, Thu/Fri → next Monday), not onto an inamovible (Decreto 789/2021 art. 1). One-year decree moves in `*ar-decree-moves*` (DNU 750/2001, 1932/2002, 810/2003, 521/2011, 2226/2015, Res. JGM 139/2025); 2 Apr 2020 on 31 Mar (DNU 297/2020). `data/ar/transfers.sexp`: the feriados con fines turísticos 2011–2026 (Decretos 1585/2010 … Res. JGM 164/2025) and one-off feriados. **Días no laborables** (Jueves Santo; Ley 27.399 arts. 2–3; Ley 26.199) are optional for each employer and are not holidays here; the turísticos are, though the 2018–2019 and 2025–2026 decrees call them días no laborables, because the official list types them "turístico" and the public administration and banks close. Gold: `data/tests/ar-holiday-gold.sexp`, checked against argentina.gob.ar 2017–2026; `country-calendar "AR"` defers to the starter. From 2026 a weekend trasladable may be moved by resolution (Dto. 614/2025); later years keep art. 6 until one is issued |
| `CA` | [Canada Labour Code](https://laws-lois.justice.gc.ca/eng/acts/L-2/) s. 166; [Holidays Act](https://laws-lois.justice.gc.ca/eng/acts/H-5/) ss. 2–4; S.C. 2021, c. 11 | Since 0.17.0 (#17), **federal** scope: the ten general holidays for federally regulated employers. Victoria Day is the Monday before 25 May; Canada Day is 2 July when 1 July is a Sunday; the National Day for Truth and Reconciliation counts from 2021. CLC s. 193(2) (the working day before or after a weekend holiday) is no fixed day, so there is no substitute rule. Provincial days are not here (#76). Gold: `data/tests/ca-holiday-gold.sexp` (statute texts; canada.ca lists the same ten days) |
| `AU` | [Fair Work Act 2009](https://www.legislation.gov.au/C2009A00028/latest/text) s. 115; state and territory acts | Since 0.17.0 (#17), the **national subset**: the s. 115 days every State and Territory keeps, with `:au-substitute-day` (the Monday after a weekend New Year's Day or Australia Day; Christmas and Boxing Day to the next free weekdays) and the 2022-09-22 Day of Mourning. No King's Birthday (a state day; WA and QLD differ), no Easter Saturday/Sunday. State calendars: #77. Gold: `data/tests/au-holiday-gold.sexp`, checked against the PM&C machine-readable data set 2014–2025 on every weekday |
| `SD` `IQ` `AF` `AO` `UZ` | National statutes (starter-mena/africa/asia.lisp) | ≥35M fill: Sudan Coptic+Islamic; Iraq National Day/Victory/Ghadir; AF Independence + Nowruz to 2020; AO Liberation/Peace eras; UZ Navro'z/Independence |
| `MZ` `MG` `CM` `CI` `NE` `BF` `ML` `MW` `ZM` `YE` `SY` `KP` `NP` `LK` `VE` `KZ` | National statutes (starter-africa/mena/asia/americas.lisp) | ≥20M normative fill with `:from`/`:to` eras |
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
| `country-calendar` | [date-holidays](https://github.com/commenthol/date-holidays) CC BY-SA 3.0 | 206 jurisdictions + 6 empty stubs; years 2000–2040 public/bank; outside them (and for stubs) `holiday-p` signals `calendar-out-of-range` unless `:strict nil` |

Hand-maintained starters beat `country-calendar` when both exist (prefer `japan-holidays-calendar` / `china-holidays-calendar` / `russian-holidays-calendar` / `us-federal-holidays-calendar` over corpus `"JP"` / `"CN"` / `"RU"` / `"US"`). `country-calendar "RU"`, `"CO"` and `"CL"` defer to `russian-holidays-calendar` (#13), `colombia-holidays-calendar` (#15) and `chile-holidays-calendar` (#16).

### Subnational composites

| Code | Base | Regional | Notes |
|------|------|----------|-------|
| `US-CA` | `USFED` | California state days | César Chávez + day after Thanksgiving |
| `DE-BY` | `DE` | Bavaria (`Bayern`) | Heilige Drei Könige, Fronleichnam, Mariä Himmelfahrt, Allerheiligen |
| `ES-CT` | `ES` | Catalonia | Sant Jordi, Diada, La Mercè |

Registered via `register-subnational-calendars` as `COMPOSITE-CALENDAR` union mode.

### Corpus-only codes: corpus-derived or corpus

There are 93 codes in `data/countries/` that have corpus days but no hand starter (for example `AD`, `BH` and `XK`). `register-corpus-inferred-territory-starters` registers each one, and the calendar is built on first lookup by `corpus-derived-calendar`. Since 0.13.0 (#33), `find-calendar` never returns a calendar that drops corpus days:

- Fixed and Western-Easter rules are inferred by recurrence in the corpus (`make-corpus-inferred-calendar`). The code gets that `rule-calendar` only when it reproduces the corpus: at least `*corpus-inference-min-agreement*` (99%) of the corpus public days, and 99% precision, over 2000–2040 (`calendar-corpus-agreement`). `calendar-provenance` is then **`:corpus-derived`**. Each rule's `:authority` starts "Corpus-derived, not normative" and also says so when the corpus types the day `:bank` only.
- Otherwise the code gets the corpus itself, `(country-calendar CODE)`, with `calendar-provenance` **`:corpus`**. Inference finds no Hijri, nth-weekday, Orthodox Easter or substitute days, so most codes land here.

| Provenance | Codes |
|---|---|
| `:corpus-derived` (22) | AD AM BL CG CV FO GF GL GP HN LS MF MQ NC PM RE SC SJ SM VU WF YT |
| `:corpus` (71) | AG AI AL AS AW AX BA BB BH BI BM BN BQ BS BW BZ CC CF CK CW CX DJ DM EH ER FJ GA GD GG GI GM GQ GU GW GY IC IM IS JE JM KM KN KY LC LI LR MC MD ME MK MR MS MU NA NF PF PR PY SH SR ST SX SZ TC TO TT VA VC VG VI XK |

Neither kind is normative. `normative-coverage-by-population` reports them as `:corpus-derived` / `:corpus`, and `normative-calendar-codes` leaves them out. Every `define-calendar` starter reports `calendar-provenance` `:normative`. Either way the days are only as good as date-holidays; #37 compares the corpus with Python `holidays`.

The six **stubs** (`ABH`, `NCY`, `OST`, `PMR`, `PS`, `SOL`) have `:days ()`. They are not registered, so `(find-calendar "PS" :errorp nil)` is NIL. `(country-calendar "PS")` has `country-calendar-stub-p` true and `calendar-coverage` `:none`, and its `holiday-p` signals `calendar-out-of-range`. `(country-calendar "PS" :strict nil)` answers NIL instead.

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
| `:jp-furikae` | [祝日法](https://www8.cao.go.jp/chosei/shukujitsu/gaiyou.html) Art. 3(2) | **Sunday only** → 翌日 from 1973-04-12; chain over consecutive 祝日 from 2007-01-01 (平成19年法律第5号) |
| `:ru-tk-112-transfer` | ТК РФ ст. 112 ч. 2, ч. 5 | weekend∩holiday → next workday; **not** for 1–8 Jan from 2013; cancelled when a decree transfer's FROM is the holiday or that workday |
| `:nyse-rule-7-2` | NYSE Rule 7.2 | Sat→Fri, Sun→Mon, unless the Friday is the last weekday of its month (monthly / yearly accounting period) |

Calendar flag `:sandwich-holidays-p` + `:sandwich-authority` implements 祝日法 Art. 3(3) (国民の休日).

Russian long NY/May blocks = ТК fixed holidays + `:ru-tk-112-transfer` + annual decree transfers via `(russian-holidays-calendar :year 2026)` (FROM weekend → compensatory working day; TO → extra day off).

ID cuti bersama / KR 임시공휴일 / GB special proclamations attach the same way (`:year` → TO-only transfers; GB also sets `:suppressed-dates` when Spring/Early May BH is relocated).

## Not law by default

- `:bridge :adjacent` (Tue→Mon / Thu→Fri “puente”) — only when a rule’s `:authority` cites a bridge statute or binding instrument.
- Mechanical primitives (`:nearest-weekday`, `:next-weekday`, `:sunday-to-monday`, `:substitute-next`, …) — implementation atoms; starters must use statute-named policies + `:authority`.

## Exchange cash-session hours

Major-exchange RTH live in `data/exchanges/<MIC>.sexp` (eras + early-close rules).
Hours are exchange notices, not statutes. Full source table:
[`data/exchanges/ATTRIBUTION.md`](../data/exchanges/ATTRIBUTION.md).

Holidays come from the MIC's `:calendar` (XNYS / XNAS: `NYSE`). All exchange
queries (`exchange-trading-day-p`, `exchange-sessions-for-date`,
`exchange-session-bounds`, `exchange-open-p`) honour it. Eras end on the last
trading day; a day between two eras is closed.

| MIC | Current RTH | Last hour-change |
|-----|-------------|------------------|
| XNYS / XNAS | 09:30–16:00 ET | 1985-09-30 open 09:30 (NYSE timeline) |
| XLON | 08:00–16:30 | SETS 1997-10-20 |
| XTKS | 09:00–11:30 / 12:30–15:30 | JPX arrowhead 4.0 2024-11-05 |
| XHKG | 09:30–12:00 / 13:00–16:00 | HKEX phase 2 2012-03-05 |
| XSHG / XSHE | 09:30–11:30 / 13:00–15:00 | 1990/1991 |
| XETR / XPAR | 09:00–17:30 | Xetra 1997 / NSC 1990s |
| XASX | 10:00–16:00 | SEATS 1987-10-19 |
| XTSE | 09:30–16:00 | NYSE-aligned |
| XNSE | 09:15–15:30 | SEBI pre-open 2010-10-18 |
| BVMF | 10:00–17:00 | B3 cash |
| XKRX | 09:00–15:30 | KRX 2016-08-01 |
| XSES | 09:00–12:00 / 13:00–17:00 | lunch restored 2017-11-13 |
| XAMS XBRU XLIS XMIL XMAD | 09:00–17:30 | Euronext / BME cash |
| XDUB | 08:00–16:30 | Euronext Dublin local |
| XSWX | 09:00–17:30 | SIX shares |
| XSTO / XCSE / XHEL | 09:00–17:30 / 09:00–17:00 / 10:00–18:30 | Nasdaq Nordic |
| XOSL / XWAR | 09:00–16:20 / 09:00–16:50 | Oslo / GPW |
| XTAI | 09:00–13:30 | TWSE 2001-01-02 |
| XBKK | 10:00–12:30 / 14:00–16:30 | SET 2024-03-25 |
| XIDX | 09:00–12:00 / 13:30–15:50 | 2013-01-02; Friday shorter |
| XPHS | 09:30–12:00 / 13:30–15:30 | PSE 2012-01-02 |
| XSAU | 10:00–15:00 Sun–Thu | weekend flip 2013-06-29 |
| XCME / XNYM / XCEC | 17:00–16:00 CT overnight | CME Globex |
| IFEU | 01:00–23:00 London | ICE Brent |
| XLME | 01:00–19:00 | LMEselect |
| XSGE | night 21:00–01:00 + day breaks | SHFE metals |
| XIMC | 09:00–23:30 | MCX non-agri |

`(find-exchange "XNYS")`, `(exchange-sessions-for-date ex date)`,
`(exchange-session-bounds "XTKS" date)`, `(exchange-open-p "XHKG" instant)`.
Reload after editing sexp: `(load-all-exchange-hours t)`.
