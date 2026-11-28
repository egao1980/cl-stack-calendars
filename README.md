# cl-stack-calendars

Holiday and trading calendars for [cl-stack](https://github.com/egao1980/cl-stack): business-day arithmetic, rule/data/composite calendars, versioned as-of snapshots, trading sessions with history-aware zone boundaries, and versioned major-exchange cash hours (`data/exchanges/`).

Depends on [`datetime-protocol`](https://github.com/egao1980/datetime-protocol) (+ `/calendars`). Trading-session tests need [`cl-stack-tzdata`](https://github.com/egao1980/cl-stack-tzdata).

Holiday rules cite normative **`:authority`** (statute / EO / ECB decision / proclamation) for civil `:from`/`:to` and for observance. See [`docs/AUTHORITIES.md`](docs/AUTHORITIES.md).

Statute-named `:observed` (prefer these):

| Policy | Law |
|--------|-----|
| `:us-federal-in-lieu` | 5 U.S.C. § 6103(b) + EO 11582 § 3(a) |
| `:uk-proclamation-substitute` | BFDA 1971 + Royal Proclamations / [gov.uk](https://www.gov.uk/bank-holidays) |
| `:jp-furikae` | 祝日法 Art. 3(2) — **Sunday only** |
| `:ru-tk-112-transfer` | ТК РФ ст. 112 ч. 2 (1–8 Jan exempt from 2013); a decree under ч. 5 that moves the day cancels the automatic transfer |

Substitute days do not depend on the order of the rules (since 0.6.0). Every nominal holiday of every rule, in the year and the years either side, is claimed first. Substitutes are then placed in date order (ties by name), and each skips weekend days, claimed days and earlier substitutes, also across 31 Dec / 1 Jan. A substitute never swallows another holiday, and `:us-federal-in-lieu` walks past a claimed Friday instead of dropping the holiday. Two rules on the same date keep that one day, and `holiday-p` reports both names joined with `"; "`, sorted.

A `:computed` rule may yield several dates per year (since 0.7.0). Its COMPUTE may return NIL, a DATE or a list of DATEs. The Hijri helpers the starters use (`eid-al-fitr`, `eid-al-adha`, `islamic-new-year-date`, `mawlid-date` and `islamic-date-in-gregorian-year`, all shadowing datetime-protocol's) are occurrence-aware: a COMPUTE that calls them runs once per occurrence of that Hijri date in the Gregorian year. So the second Eid of years such as 2000, 2006, 2033 and 2039 is kept, and `(+ (eid-al-adha y) 2)`-style blocks that start in late December run on into January. Dates are tabular (Kuwaiti arithmetic), and sighting or Umm al-Qura countries can differ by a day.

### Data coverage

`(calendar-coverage cal)` gives the years a calendar has data for:

- NIL for statute-rule calendars, which are unbounded;
- `(2000 . 2040)` for `country-calendar` and corpus-derived calendars;
- `:none` for an empty stub (`country-calendar-stub-p`).

Since 0.10.0, `holiday-p` outside the coverage signals `calendar-out-of-range`, a `calendar-error` with the readers `calendar-out-of-range-calendar`, `-date` and `-coverage`. So `holidays-between` and `business-days-between` signal too. It offers two restarts: `use-value` returns a value for `holiday-p`, and `continue` treats the date as not a holiday.

```lisp
(handler-bind ((calendar-out-of-range #'continue))     ; old behaviour, per call
  (business-days-between (country-calendar "DE") (make-date 2040 12 1) (make-date 2041 2 1)))
(holiday-p (country-calendar "DE" :strict nil) (make-date 2041 10 3)) ; => NIL, no signal
```

Corpus-derived calendars do not extrapolate: their rules run only over the corpus years, and their `:authority` says they are inferred and not normative.

### Registered calendars and data files

Since 0.12.0 a calendar found by code carries every year of its data file. Before, `find-calendar "GB"` had no proclamations, `"RU"` no decree transfers, and so on for every starter whose constructor takes `:year`. Now `find-calendar` returns the same calendar as the constructor called without `:year`, and that calendar applies every block of the file. On each day of a year Y it gives the same answers as `(constructor :year Y)`.

| Code | Data file | What it adds |
|---|---|---|
| `GB`, `GBLO` | `data/gb/proclamations.sexp` | Royal Proclamations 1995–2023 (London Gazette) |
| `RU` | `data/ru/transfers.sexp` | Government decree transfers and working Saturdays |
| `CN` | `data/cn/transfers.sexp` | 国办 放假 notices 2000–2027 (window days named 补休 / 调休 / 休息日) and 上班 days |
| `IN` | `data/in/dopt-holidays.sexp` | DoPT holiday O.M.s 2002–2027 (Annexure-I, Annexure-II, later O.M.s; with `:issued` / `:published`) |
| `BD`, `PK` | `data/bd/holidays.sexp`, `data/pk/holidays.sexp` | BD holiday lists 2002–2027 (general and executive-order days, cancellations, working Saturdays), PK circulars and moon-sighting notifications 2004–2026 (with `:issued` / `:published`) |
| `EG`, `DZ`, `MA`, `IQ`, `KW`, `OM`, `IR` | `data/{eg,dz,ma,iq,kw,om,ir}/holidays.sexp` | Declared Eid blocks, Hijri days, moves, bridge and compensation days of each year's decrees and announcements (with `:issued` / `:published`) |
| `KZ`, `SN` | `data/{kz,sn}/holidays.sexp` | KZ: every day off 2000–2026 (Kurban ait dates, transfer decrees and working days); SN: the declared Grand Magal dates and one-off fêtes légales (with `:issued` / `:published`) |
| `ZA`, `KE`, `NG`, `ZW`, `ZM`, `MW`, `MG` | `data/{za,ke,ng,zw,zm,mw,mg}/holidays.sexp`, `…/statutes.sexp` | Proclaimed, gazetted and declared days of each year (ZA s. 2A, KE Gazette notices, NG Ministry of Interior declarations, ZW/ZM lists and SIs, MW statements, MG yearly decrees), with `:issued` / `:published`; the acts by era |
| `LV`, `EE`, `LT` | `data/{lv,ee,lt}/holidays.sexp`, `…/statutes.sexp` | LV Cabinet transfers 2001–2026 (rest days and working Saturdays), festival closing days, one-off days off by law; the acts by era |
| `RO`, `BG`, `GR`, `CY` | `data/{ro,bg,gr,cy}/holidays.sexp`, `…/statutes.sexp` | BG Council of Ministers transfers 2004–2016 and one-off days; GR 1 May moves (`:secondary`); the acts by era, with `:issued` / `:published` |
| `HR`, `SI`, `SK`, `CZ`, `HU`, `PL` | `data/{hr,si,sk,cz,hu,pl}/holidays.sexp`, `…/statutes.sexp` | HU: every munkarend transfer 2001–2026 (rest days and working Saturdays); SI 14 Aug 2023, SK 30 Oct 2018, PL 12 Nov 2018; the acts by era, with `:issued` / `:published` |
| `IT`, `NL`, `DE`, `IE`, `PT`, `TARGET` | `data/{it,nl,de,ie,pt,target}/holidays.sexp`, `…/statutes.sexp` | One-off days by statute or decision (IT 17 Mar 2011, DE Reformationstag 2017, IE prescribed days 1999/2001/2022, TARGET 31 Dec 1999/2001), with `:issued` / `:published`; the acts by era |
| `ID`, `PH`, `KR`, `MY` | `data/{id,ph,kr,my}/…` | SKB days, proclamations, 임시공휴일, JPM lists |
| `TH`, `TH-BANK` | `data/th/government.sexp`, `data/th/bank.sexp` | Cabinet special days 2000–2026, BOT lists 2000–2027 (with `:issued` / `:published`) |
| `NP`, `KH`, `SG` | `data/{np,kh,sg}/gazette-holidays.sexp` | gazetted festival blocks |
| `CL` | `data/cl/transfers.sexp` | one-off laws only (census days, 2004, 2010, 2022); the Fiestas Patrias days and 2 January are rules |
| `CO` | `data/co/transfers.sexp` | nothing: the file is empty, since Colombia decrees no "puentes" |

`LK` is the exception: `data/lk/poya-days.sexp` lists new-moon dates rather than Poya days. So `find-calendar "LK"` and `(sri-lanka-holidays-calendar)` leave it out, and only `:year N` applies it (#61).

Registered data calendars are built on first lookup (`register-calendar-constructor`). `clear-data-caches` and `set-data-root` rebuild them. `(make-instance 'russian-holidays-calendar)` still gives the statute rules alone. A decree transfer is named only in the year map of its own date, so a rule holiday keeps its name: CN 2026-01-01 is 元旦, not 调休.

`country-calendar "GB"` is England and Wales, the scope of `find-calendar "GB"`. The date-holidays dump had no Summer bank holiday and missed the 2002, 2011 and 2012 proclamations. Both are fixed in the file, as its `:note` describes. On weekdays the corpus now matches the starter over 2000–2040 and gov.uk over 2012–2028.

### Provenance: normative, corpus-derived, corpus

Since 0.13.0 `(calendar-provenance cal)` says where a calendar's days come from:

- `:normative`: a `define-calendar` starter whose rules cite a statute, decree or proclamation.
- `:corpus-derived`: fixed and Easter rules inferred from the date-holidays corpus.
- `:corpus`: the corpus table itself, `country-calendar`.

The 93 corpus codes without a hand starter (`BH`, `XK`, `GU` and so on) used to be registered as inferred rule calendars and reported as normative. Those calendars missed 10,413 of their own corpus days in 2000–2040: every Eid, nth-weekday holiday, Orthodox Easter and substitute day. Now `find-calendar` returns the inferred calendar only when it reproduces at least 99% of the corpus (`calendar-corpus-agreement`, `*corpus-inference-min-agreement*`); 22 codes pass. The other 71 get `(country-calendar CODE)`. `normative-coverage-by-population` reports these codes as `:corpus-derived` or `:corpus`, never `:normative`. [`docs/AUTHORITIES.md`](docs/AUTHORITIES.md#corpus-only-codes-corpus-derived-or-corpus) lists which code is which.

### Holiday types: public, bank, …

Since 0.37.0 (#35) the corpus types are exposed and can be filtered:

- **Types.** Each corpus row is `:public` (108,702 rows) or `:bank` (1,950 rows, in 26 files: AD AL AR AS AT AX BL BM BR CL DE FI GT GU IE JP LI MX NL NO PR PY SE SJ US VI). The type vocabulary is `*holiday-type-precedence*`: `:public` `:bank` `:optional` `:observance`, strongest first. The date-holidays generator dropped optional and observance days, so the corpus has no rows of those two types (`data/countries/ATTRIBUTION.md`).
- **Filter.** `(country-calendar "GT" :types '(:public))` counts only the public rows, so Día del Empleado Bancario is a business day. `:types '(:bank)` counts only the bank rows. Without `:types` every row of the file counts, as before, and `calendar-holiday-types` reports which types count. An unknown type, or a non-list, signals `type-error`. The cache is keyed on the normalized type list too.
- **Every name on a date.** 820 corpus rows share their date with an earlier row (AL 42, EG 35, IR 30, AZ 25, TW 25, …). The earlier name used to be overwritten. Now every row is kept. `holiday-p` returns every counted name, joined with `"; "` and strongest type first: GT 2000-06-30 is `"Día de las Fuerzas Armadas; Día del Empleado Bancario"`. `(holiday-info cal date)` returns one `holiday-observance` per row, each with its `holiday-observance-type`.
- **No demotion.** A date's type is its strongest row, so public beats bank. In 34 cases a later `:bank` row used to demote a `:public` date: AR Malvinas / Jueves Santo, AS substitute days / eves, GT Fuerzas Armadas / Empleado Bancario, JP 元日 (振替休日) / 銀行休業日. These dates are `:public` again. `holidays-between` fills `holiday-observance-type` with that resolved type.
- **Codes that defer to a starter** (`*country-calendar-normative*`: DE, AR, SE, …). The starter replaces the corpus public rows, and its holidays count as `:public`.
  - Without `:types`, the calendar is the starter, as before.
  - With `:types`, `:public` is the starter's holidays, and every other type adds the corpus rows of that type. `(country-calendar "DE" :types '(:public :bank))` adds Heiliger Abend and Silvester, typed `:bank`. `:types '(:bank)` gives only those rows.

`holiday-info` works on every calendar. Calendars that do not type their days give one observance with type `nil`.

```lisp
(holiday-p (country-calendar "DE") (make-date 2024 12 24))                       ; => NIL
(holiday-p (country-calendar "DE" :types '(:public :bank)) (make-date 2024 12 24)) ; => T, "Heiliger Abend"
(business-day-p (country-calendar "GT" :types '(:public)) (make-date 2001 7 2))    ; => T
(holiday-info (country-calendar "GT") (make-date 2000 6 30))
;; => (#<HOLIDAY-OBSERVANCE 2000-06-30 "Día de las Fuerzas Armadas" :PUBLIC>
;;     #<HOLIDAY-OBSERVANCE 2000-06-30 "Día del Empleado Bancario" :BANK>)
```

**Consumer-visible changes.** `calendar-holidays-table` of a country calendar now maps an RD to a *list* of `(name . type)`, not to one pair. On the 820 shared dates, `holiday-p`'s name is the joined string.

### Caching and threads

Since 0.9.1 a `rule-calendar` builds each year's holiday map once and keeps it, together with its working-day and suppressed-date sets, in a per-instance synchronized table (`:synchronized t` on SBCL). Queries from several threads are safe. As an example, `holidays-between` over 41 years of KR now takes milliseconds; it used to take about a minute. A `setf` of any rule-calendar accessor (`calendar-rules`, `calendar-transfers`, `calendar-working-days`, `calendar-suppressed-dates`, `calendar-weekend-days`, the sandwich and furikae settings, `calendar-observance-pass`) drops the cache. After changing a rule struct or a list in place, call `(clear-calendar-cache cal)`.

Since 0.11.0 the corpus, exchange and registry caches are synchronized tables as well, so concurrent first use is safe. `clear-data-caches` (and with it `set-data-root` / `with-data-root`) also makes every rule calendar rebuild its year maps, because a cached year map belongs to one data root. These data-root functions are **process-wide**: they clear the caches for all threads, so don't switch roots while other threads are querying calendars against a different root.

### Errors

Every error is a `calendar-error`:

- `adjust-date` with an unknown convention signals `invalid-convention`; its `use-value` restart retries with another convention.
- `next-business-day` and `previous-business-day` give up after 366 days and signal `no-business-day`, for example on a calendar whose weekend is every day.
- A weekend list that covers the whole week signals instead of looping, and so does a substitute day that finds no free day.
- `holiday-p` outside a calendar's data signals `calendar-out-of-range` (see Data coverage).

### Weekends

Since 0.9.0 a weekend can change by era. `:weekend-days` on `define-calendar`, `make-data-calendar`, a `rule-calendar` or `country-calendar` takes either a weekday list (`'(5 6)`) or an era list (`'((nil 4 5) ((2013 6 29) 5 6))`). `(weekend-days-on cal date)` gives the list in force on DATE, and `calendar-weekend-days` gives the current one. Observance shifts (`:next-weekday`, `:us-federal-in-lieu`, …) use the weekend of each day they look at.

The cited table `country-weekend-days` / `weekend-era-source` supplies the weekend for registered starters (`define-calendar :register`), corpus-derived calendars and `country-calendar`. It covers SA, AE, BH, QA, KW, OM, JO, YE, DZ, LY, IQ, SD, BD, EG, SY, IL, IR, AF and NP. Any code the table does not list keeps Sat/Sun. Two examples:

- SA moved from Thu–Fri to Fri–Sat on 2013-06-29.
- AE moved from Thu–Fri to Fri–Sat on 2006-09-01, then to Sat–Sun on 2022-01-01.

The weekend is the government and banking week; private-sector rules can differ. The `country-calendar` cache is keyed on the code and `:weekend-days`, so `(country-calendar "AE" :weekend-days '(5 6))` is a calendar of its own.

### Composite and versioned calendars

Since 0.8.0 a wrapper keeps its constituents' weekends and their working-day overrides, such as RU/CN decree work Saturdays:

| `make-composite-calendar` mode | holiday | weekend | business day | name |
|---|---|---|---|---|
| `:union` (joint settlement, default) | any constituent | any constituent (`weekend-day-p` of each) | every constituent open | names of the holiday constituents, `"; "` |
| `:intersection` | every constituent | every constituent | any constituent open | `"+"`-joined names |

`calendar-weekend-days` is the union or intersection of the constituents' lists. With `:weekend-days`, that plain list replaces the constituents' weekends and their working-day overrides. An empty calendar list, or an unknown mode, signals `calendar-error`. A `versioned-calendar` delegates `holiday-p`, `weekend-day-p`, `business-day-p` and `calendar-weekend-days` to `(calendar-as-of c)`, its newest snapshot.

Since 0.36.0 a `versioned-calendar` selects by `recorded-at`, never by insertion order (#30):

- `(calendar-as-of v :as-of instant)` is the snapshot with the greatest `recorded-at` on or before `instant`; `(calendar-as-of v)` is the latest-recorded one; `:version tag` is the latest-recorded snapshot with that tag.
- The snapshot list stays sorted newest first however it is written (`:snapshots` initarg, `setf`, `add-calendar-snapshot`), so a backfilled older snapshot never shadows a newer one.
- Two snapshots with the same `recorded-at`: the one added later wins.
- `add-calendar-snapshot` is safe from several threads (an atomic compare-and-swap on SBCL); the list is never mutated in place. `versioned-calendar-with-snapshot` is the functional form: it returns a new versioned calendar and leaves the old one unchanged.
- A version tag that is already present signals `duplicate-snapshot-version`, with restarts `replace-snapshot` (drop the old snapshot) and `continue` (keep both).

```lisp
(handler-bind ((duplicate-snapshot-version
                 (lambda (c) (invoke-restart (find-restart 'replace-snapshot c)))))
  (add-calendar-snapshot v corrected :version-tag "2025.1"))
```

Russian/USSR: `(russian-holidays-calendar)` (and `find-calendar "RU"`) = ТК eras + every decree transfer; `:year 2026` keeps only that year's; `(ussr-holidays-calendar)` for late-Soviet fixed days.

Since 0.14.0 (#13) RU matches the official production calendar on every day 2000–2027, holiday and business status both (`tests/russian-production-gold-test.lisp`, gold in `data/tests/ru-production-calendar-gold.sexp`):

- A weekend holiday moves to the next working day (ТК ст. 112 ч. 2). January holidays did so too until 2012; the 1–8 January exemption starts in 2013 (ФЗ от 23.04.2012 № 35-ФЗ).
- A Government decree that moves such a rest day elsewhere (ч. 5) cancels the automatic transfer: 2013-02-25, 2014-02-24, 2019-02-25, 2025-02-24 and 2025-03-10 are working days. In `data/ru/transfers.sexp` FROM is the Monday the decree cancels; the engine also accepts the holiday itself as FROM, as the 2019 and 2025 decree texts word it.
- Decrees run through 2027 (Постановление Правительства РФ от 17.09.2026 № 1187). For later years `(ru-provisional-year-p 2028)` is true: the calendar applies the ТК holidays and the automatic ч. 2 transfers only, so a future decree can still move days. `(ru-last-decree-year)` gives the last decree year.
- `(country-calendar "RU")` defers to this starter (`normative-country-calendar`, provenance `:normative`). The date-holidays dump for RU had no 2–5 January from 2005, no ст. 112 transfers or decrees, and 4 November before 2005; the file ships unchanged but is no longer consulted. `*country-calendar-normative*` lists the deferring codes.

Colombia: since 0.15.0 (#15) `find-calendar "CO"` matches Ley 51/1983 art. 1 and Ley 2578/2026 on every day 2000–2040 (`tests/americas-holiday-gold-test.lisp`, gold `data/tests/co-holiday-gold.sexp` from `scripts/generate_americas_holiday_gold.py`). Ascensión, Corpus Christi and Sagrado Corazón fall on the Monday after (Easter +43/+64/+71); 11 Nov moves to Monday, 8 Dec does not; Nuestra Señora del Rosario de Chiquinquirá (9 Jul, moved to Monday) counts from 2026. Colombia has no official machine-readable festivos list, so the gold is built from the statute texts; Python `holidays` 0.109 agrees on every day. `(country-calendar "CO")` defers to the starter. Years after 2026 apply the statutes in force: a future law can still add a day.

Chile: since 0.16.0 (#16) `find-calendar "CL"` matches the feriados legales on every day 2000–2040 (gold `data/tests/cl-holiday-gold.sexp`, built from the BCN statute texts and checked against the official Gobierno Digital feriados API for 2013–2024 and feriados.cl for 2026–2028). Sábado Santo, the Ley 19.668 / 20.299 moves, the winter-solstice Día de los Pueblos Indígenas and the Ley 20.215 / 20.983 Fiestas Patrias and 2 January days are rules, so later years need no data. Election days (Ley 18.700, always on a weekend), the bank-only 31 December and regional days are not in `CL`. `(country-calendar "CL")` defers to the starter.

Canada and Australia: since 0.17.0 (#17) `find-calendar "CA"` is the **federal** calendar. It holds the Canada Labour Code general holidays on the Holidays Act dates: Victoria Day is the Monday before 25 May, Canada Day moves to 2 July when 1 July is a Sunday, and the National Day for Truth and Reconciliation counts from 2021. Provincial days (Family Day, Civic Holiday, Easter Monday, …) are not in it. `find-calendar "AU"` is the **national subset**: the Fair Work Act s. 115 days that every State and Territory keeps, with the substitute days they all give. The King's Birthday is a state day and is not in it. Gold: `data/tests/ca-holiday-gold.sexp` and `data/tests/au-holiday-gold.sexp`, 0 differences 2000–2040. The AU gold is checked against the official PM&C data set (data.gov.au, 2014–2025). The corpus `country-calendar "CA"` / `"AU"` keep their own scope: the five days every Canadian province shares, and the date-holidays national list.

Mexico, Brazil and Peru: since 0.18.0 (#19) each matches its gold on every day 2000–2040. `find-calendar "MX"` holds the LFT art. 74 días de descanso obligatorio: the 2006 Monday moves (DOF 17-01-2006), with 21 March kept in 2006 (transitorio segundo, Juárez bicentennial), and the inauguration day every six years, 1 December to 2018 and 1 October from 2024 (DOF 30-09-2024). The corpus `country-calendar "MX"` keeps its public+bank scope, with the 2024/2030/2036 inauguration day corrected to 1 October. `find-calendar "BR"` holds the feriados nacionais only: Corpus Christi, Carnaval and the other federal pontos facultativos are not holidays and are not in it (the corpus `"BR"` keeps them as bank days; an optional federal calendar is #79). `find-calendar "PE"` holds the DL 713 feriados plus Batalla de Junín and Ayacucho (2022), Día de la Fuerza Aérea (2023) and Batalla de Arica (2024); días no laborables are not feriados. `(country-calendar "PE")` defers to the starter (the corpus lists Easter Sunday). Gold: `data/tests/{mx,br,pe}-holiday-gold.sexp`; the PE gold is checked against the official gob.pe lists 2018–2025, the BR gold against 19 federal portarias 2005–2026.

Argentina: since 0.19.0 (#18) `find-calendar "AR"` matches its gold on every day 2000–2040. It holds the feriados nacionales of each era: 24 March from 2006, 2 April moved by Ley 23.555 in 2001–2006 (10 June in 2000), 20 June and 17 August on the third Monday until 2010, the Decreto 1584/2010 fixed Mondays in 2011–2016, and the Ley 27.399 art. 6 trasladables from 2017, with Decreto 789/2021 keeping 17 June on a Friday. Yearly decree moves are rules; the feriados con fines turísticos and one-off feriados (censos, bicentenarios, 2022-12-20, 2026-11-09) are in `data/ar/transfers.sexp` (`(argentina-holidays-calendar :year y)`). Días no laborables (Jueves Santo; the Jewish and Islamic days of Ley 27.399 arts. 2–3) are left to each employer and are not holidays here. Gold: `data/tests/ar-holiday-gold.sexp`, checked against the official argentina.gob.ar lists 2017–2026. `(country-calendar "AR")` defers to the starter.

South Korea: since 0.20.0 (#39) `find-calendar "KR"` matches its gold on every day 2000–2040. It holds the 관공서 공휴일 of 「관공서의 공휴일에 관한 규정」 in each era, including 부처님오신날, 노동절 and 제헌절 from 2026, the 제3조 대체공휴일 of 2014, 2021 and 2023 (a new `:observance-pass` option of `define-calendar` runs this whole-year rule), the term-expiry election days of 공직선거법 제34조 (computed, so 2028 and 2030 are there) and the 임시공휴일 of `data/kr/temporary-holidays.sexp`. Lunar days are KASI's (`+korea-lunisolar-zone+`). Years after the last 월력요항 (2027) are provisional (`kr-provisional-year-p`). Gold: `data/tests/kr-holiday-gold.sexp`, checked against the KASI 달력자료 2021–2028. `(country-calendar "KR")` defers to the starter.

Indonesia, Hong Kong, Taiwan and the Philippines: since 0.21.0 (#41) each matches its gold on every day 2000–2040 (Indonesia 2005–2040). `find-calendar "ID"` holds the hari libur nasional of each year's SKB 3 Menteri 2005–2027 (`data/id/skb.sexp`, with every amendment and election day); cuti bersama are leave days, not holidays, and only `(indonesia-holidays-calendar :cuti-bersama t)` adds them. Other years estimate the moveable days (`id-provisional-year-p`). `find-calendar "HK"` holds the 17 general holidays of the General Holidays Ordinance (Cap. 149), with the Sunday substitutes of its Schedule before and after the 2011 amendment and the s. 6(2) extra day when two holidays coincide (2010-04-06, 2015-04-07, 2033-10-03); lunar days follow the HKO tables. The gold is checked against the gazetted lists 2000–2027. `find-calendar "TW"` holds the government-office days off (行政機關放假日) of each era, the 補假 rules (`tw-bujia-pass`), the 兒童節/清明 rule, the 2025 紀念日及節日實施條例 days, and the Executive Yuan's 調整放假 / 補行上班 of `data/tw/adjustments.sexp`; the gold (with its `:working-days`) is checked against the DGPA calendars 2000–2027, and later years are provisional (`tw-provisional-year-p`). `find-calendar "PH"` holds the regular holidays and nationwide special (non-working) days as each year's proclamations set them, 2000–2027 (`data/ph/proclamations.sexp`: extra days, Eid'l Fitr and Eid'l Adha, moved and dropped statutory days); EDSA is a holiday only where a proclamation made it one, and special working days are not holidays. Eid days from 2027 are tabular estimates (`ph-provisional-year-p`). `(country-calendar "ID"/"HK"/"TW"/"PH")` defers to the starter.

Malaysia: since 0.22.0 (#40) `find-calendar "MY"` matches its gold on every day 2008–2040. It holds the federal public holidays of the Holidays Act 1951 (Peninsular Malaysia and the Federal Territories): the First Schedule days at the dates of the JPM Jadual Hari Kelepasan Am Persekutuan of each year 2008–2027 (`data/my/holidays.sexp`, with the gazetted amendments), the s. 8 additional days (installations, election days, 2023-04-21, 2025-09-15, 2026-03-20), and the s. 3 replacement for a holiday on a Sunday (`my-cuti-ganti-pass`). Deepavali, Wesak and the Islamic days are the lists' dates; years with no list estimate them (`my-deepavali-estimate`, `my-wesak-estimate`, the tabular calendar; `my-provisional-year-p` from 2028). State and Federal Territory days (1 January, Thaipusam, Nuzul Al-Quran, Hari Raya Haji day 2, ...) and the Friday-weekend states' replacements are not in `MY`. No primary list of 2000–2007 was found, so those years estimate too. `(country-calendar "MY")` defers to the starter.

Vietnam: since 0.23.0 (#40) `find-calendar "VN"` matches its gold on every day 2000–2040, holiday status, business status and the làm bù Saturdays. It holds the days off of government offices (cán bộ, công chức, viên chức; Saturday and Sunday off since QĐ 188/1999/QĐ-TTg): Tết Âm lịch four days to 2013 (BLLĐ 1994 Điều 73) and five from 2014 (BLLĐ 2012 Điều 115) as each year's notice placed them, Giỗ Tổ Hùng Vương from 2007, Quốc khánh two days from 2021 (BLLĐ 2019 Điều 112), Ngày Văn hóa Việt Nam 24/11 from 2026 (NQ 28/2026/QH16) and 27/7 from 1 March 2027 (the 2026 amending law), the nghỉ bù of a holiday on a Saturday or Sunday (`vn-nghi-bu-pass`), and the hoán đổi weekdays off and làm bù Saturdays of the yearly Thủ tướng / Bộ notices in `data/vn/notices.sexp` (2000–2027). Lunar days are at UTC+7 (`+vietnam-lunisolar-zone+`). Years after 2027 are provisional (`vn-provisional-year-p`). `(country-calendar "VN")` defers to the starter.

China: since 0.24.0 (#26) `find-calendar "CN"` matches its gold on every day 2007–2040, holiday status, business status and the 上班 Saturdays and Sundays (`data/tests/cn-holiday-gold.sexp`, parsed from the State Council notice texts on www.gov.cn). The statutory days are the 第二条 days of the 《全国年节及纪念日放假办法》 in force each year: the 1999 text (国务院令第270号: 春节 初一–初三, 劳动节 5/1–3), 令第513号 from 2008 (除夕–初二, 劳动节 one day, 清明 端午 中秋), 令第644号 from 2014 (初一–初三) and 令第795号 from 2025 (除夕–初三, 劳动节 5/1–2), with lunar days at Beijing. Each notice's other window days and its 上班 days are in `data/cn/transfers.sexp`, through 国办发明电〔2026〕10号 (2027) and with the amendments 〔2019〕3号 (劳动节 2019), 〔2020〕1号 (春节 2020), the 2003 SARS 五一 notice and 国发明电〔2015〕1号. Every day of a 放假 window is a holiday, its weekend days too. Names: the festival on a statutory day (`春节`, `春节（除夕）`, `中秋节; 国庆节`), `<festival>（补休）` on the weekday 第六条 owes for a statutory day on a Saturday or Sunday, `<window>（调休）` on a weekday off paid back by a 上班 day, `<window>（休息日）` on a weekend day of a window. **2000–2006 are lower confidence**: no notice of those years is on www.gov.cn, so they come from Xinhua dispatches and republications and zh.wikisource transcriptions (`:confidence :secondary` in the data file, the authority of each of those days tagged 低可信度, `cn-notice-confidence`), checked by a separate test against `data/tests/cn-secondary-holiday-gold.sexp`; no text of the 2000 春节 and 劳动节 arrangements was found, so those are the statute days only. Years after 2027 are provisional (`cn-provisional-year-p`): the 第二条 days only, with no 补休, 调休 or 上班 day. `(country-calendar "CN")` defers to the starter. Exchanges that attach `CN` (XSHG, XSHE, XSGE, XDCE, XZCE, XINE) close on every weekday of a window; their own weekend keeps them closed on 上班 days.

Thailand: since 0.25.0 (#40) there are two calendars, and each matches its gold on every day. `find-calendar "TH"` is the government-office calendar (วันหยุดราชการ): the annual days, the Cabinet's special days and Royal Ploughing Day of each year (`data/th/government.sexp`) and the substitute rule of each era (none before 26 Dec 1995; one per weekend holiday under ว 274/2538; one per weekend from 1 July 2001, ว 83/2544; the Cabinet may cancel or move one, ว 38/2547). Its gold `data/tests/th-holiday-gold.sexp` covers 2019–2040 (Cabinet resolutions 2019–2026, provisional after: no Royal Ploughing Day, no special day; the Royal Ploughing Days of 2019, 2021, 2022, 2024 and 2026 rest on news reports and are tagged `:confidence :secondary`); **2000–2018 are lower confidence** (`th-confidence` `:secondary`: Cabinet releases mirrored by ryt9.com and news, the rule where no document gives a substitute), checked by a separate test against `data/tests/th-secondary-holiday-gold.sexp`. `find-calendar "TH-BANK"` is the Bank of Thailand financial-institution calendar: every BOT list 2000–2027 (`data/th/bank.sexp`; Labour Day, the mid-year closing day to 2018, Asalha Bucha instead of Khao Phansa from 2007, Songkran substitutes only for two weekend days), provisional from 2028. **Thai exchanges attach `TH-BANK`**: XBKK does, since the SET closes on the BOT list's days. Buddhist days come from the Thai lunar calendar (`thai-buddhist-day`): the listed dates 2000–2027, and Eade's Suriyayatra athikawan rule with the 19-year athikamat cycle for other years; dates of 2030–2032 are the least certain (`*thai-lunar-uncertain-years*`). Each data row carries `:issued` and `:published` (docs/AUTHORITIES.md). `(country-calendar "TH")` defers to the starter.

India: since 0.26.0 (#42) `find-calendar "IN"` matches its gold on every day 2002–2040 except 2005–2006, holiday and business status. It holds the gazetted holidays of the administrative offices of the Central Government located at Delhi/New Delhi: Annexure-I of each year's DoPT Office Memorandum (the 14 compulsory holidays, Mahavir Jayanti among them, and the 3 DoPT selects from the 12 optional ones), with the later O.M.s that declare 14 April a holiday (Dr B. R. Ambedkar's birthday, most years), move an Islamic day after the moon is sighted (2013, 2016, 2021) or close the Delhi offices (2010-10-14, 2023-09-08). The O.M. date wins over the tabular Islamic calendar. `(india-holidays-calendar :restricted t)` adds Annexure-II, the restricted holidays, of which each employee may take two. No O.M. of 2000, 2001, 2005 or 2006 was found: those years have the fixed days, Good Friday, tabular Islamic estimates and any 14 April O.M. (`in-confidence` → `:estimated`). Years after 2027 are provisional (`in-provisional-year-p`): fixed days, Good Friday and tabular Islamic estimates, with no Hindu, Sikh, Jain or Buddhist day. Offices outside Delhi (State coordination committees) and banks (Negotiable Instruments Act) are not in `IN`. Gold: `data/tests/in-holiday-gold.sexp`. `(country-calendar "IN")` defers to the starter.

Bangladesh and Pakistan: since 0.27.0 (#47) `find-calendar "BD"` and `"PK"` match their gold on every day, holiday and business status. `"BD"` is the public holidays of government offices: the general and executive-order days of each year's holiday list (Ministry of Public Administration, 2013–2027; Bangladesh Bank copies 2002–2008 and 2010–2012, tagged `:secondary` and checked by their own test) at their final dates, the fixed days by era (17 March 1997–2001 and 2010–2024, 15 August 1996–2001 and 2008–2023, 7 November 2002–2007 and from 2026, 5 August from 2025), and the Friday–Saturday weekend of each era with the working Saturdays the notices set. `"PK"` is the federal public holidays: the yearly circular and the moon-sighting notifications at their declared dates (Cabinet Division 2022–2026; SBP circulars, PID releases and news 2004–2021, `:secondary`), Iqbal Day to 2014 and from 2022, Youm-e-Takbeer from 2024, two Ashura days, the 2024 election day, and the weekend eras (Sunday, Saturday–Sunday 2010 and from 2011-10-15). Years with no list are estimated (`bd-` / `pk-estimated-year-p`, `bd-` / `pk-confidence`): the fixed days and tabular Islamic days named "(estimated)"; BD's executive-order, Hindu and Buddhist days are not estimated. Provisional from 2028 (BD) and 2027 (PK). Both corpus codes defer to the starters.

Middle East and North Africa: since 0.28.0 (#44) `find-calendar` for `"EG"`, `"DZ"`, `"MA"`, `"IQ"`, `"KW"`, `"OM"` and `"IR"` matches its gold on every day, holiday and business status (`src/starter-middle-east.lisp`). The fixed days are rules by statute era (`*mena-statute-eras*` carries `:issued`, `:published` and `:in-force`), and each year's declared Islamic days, Eid blocks, extension, bridge and compensation days and moves are rows of `data/<cc>/holidays.sexp`: EG 2014–2026 (Sham el-Nessim, Arafah + 4 days, the moves to Thursday or Sunday), DZ 2009–2026 (no Easter days, 19 June to 2004, three-day Eids by Loi 23-10), MA 2003–2026 (14 January from 2024, `:secondary`), IQ 2019–2026 (3 October from 2020, 14 July to 2023, Law 12/2024), KW 2011–2026 (no 1 May, Isra wal Mi'raj and Arafah), OM 2020–2026 (no Renaissance Day from 2020, Accession Day from 2023, National Day 20–21 November from 2025), IR 2000–2026 (the official Calendar Center lists; the Solar Hijri days on datetime-protocol's astronomical Persian calendar). Years with no list have the fixed days and tabular estimates named "(estimated)" (`mena-estimated-year-p`, `mena-confidence`; provisional after 2026, `mena-provisional-year-p`). `AF` keeps Nowruz to 2021. Corpus `"EG"`, `"DZ"`, `"MA"` and `"IR"` defer to the starters.

Kazakhstan and Senegal: since 0.29.0 (#43) `find-calendar "KZ"` and `"SN"` match their gold on every day, holiday and business status (`src/starter-yearly-lists.lisp`). `"KZ"` has no Ораза айт, the first day of Kurban ait and 7 January from 2006, the law 267 eras (25 October 1995–2008 and from 2022, 1 December 2012–2021, 7 May from 2013, 6 July from 2008, Nauryz 21–23 March from 2010, one Independence Day from 2022, 15 March instead of 30 August from 2027), the art. 5 weekend carry-over from 14 Dec 2001 and every transfer decree 2000–2025 (`data/kz/holidays.sexp`). `"SN"` has the Grand Magal de Touba on 18 Safar from loi 2013-06 at its declared dates, and the loi 74-52 Monday after a Sunday Korité or Tabaski. Confidence by year: `mena-confidence`. Corpus `"KZ"` and `"SN"` defer to the starters.

Africa: since 0.30.0 (#45) `find-calendar` for `"ZA"`, `"KE"`, `"NG"`, `"ZW"`, `"ZM"`, `"MW"` and `"MG"` matches its gold on every day, holiday and business status (`src/starter-yearly-lists.lisp`). Each statute's weekend rule is an observance policy: ZA s. 2(1) (the Monday after a Sunday holiday, nothing more when it is taken; new atom `:sunday-monday`), KE Cap. 110 s. 4 from 1984 (Christmas on a Sunday → 27 December), ZW s. 2(1) and ZM s. 2(2) (Sunday → Monday), MW s. 4 (Saturday or Sunday → the next free weekday); NG has none, and its Ministry's next-working-day declarations are rows. Eras: KE Moi Day 1990–2009 and 2018–2020, Utamaduni Day 2021–2023, Mazingira Day from 2024, Idd-ul-Azha only when gazetted; NG Democracy Day 29 May to 2019 (2018 included), 12 June from 2019; ZW Heroes' Day the second Monday of August, Youth Day from 2018, Munhumutapa Day from 2026; ZM Prayer Day 2016–2025, Kenneth Kaunda Day from 2022, 29 December from 2026, general election day; MW Kamuzu Day 14 May, Mother's Day 15 October; MG Ascension, Whit Monday and Eids from 2013, no 25 May. `"ET"` takes Enkutatash, Meskel and Timkat from datetime-protocol's Ethiopian calendar (≥ 0.4.0). Statutes: `yearly-list-statute-eras`; confidence by year: `mena-confidence`. The corpus codes defer to the starters.

Europe: since 0.31.0 (#24) `find-calendar` for `"IT"`, `"NL"`, `"DE"`, `"IE"`, `"PT"` and `"TARGET"` matches its gold on every day, holiday and business status (`src/starter-europe.lisp`, gold from `scripts/europe/<cc>.py`). IT: 2 June only from 2001 (the first Sunday of June 1977–2000, L. 336/2000), the first Sunday of November (L. 54/1977), 17 March 2011, San Francesco d'Assisi 4 October from 2026 (L. 151/2025). NL: Koninginnedag on a Sunday is the Saturday before (2000, 2006). DE: the bundeseinheitliche days and Reformationstag 2017 (all 16 Länder). IE: 14 September 2001 and 18 March 2022 (S.I. 419/2001, 50/2022), no weekend substitutes. TARGET: Good Friday, Easter Monday, 1 May and 26 December from 2000, and 31 December 1999 and 2001. A Sunday is listed only when the statute names it (PT Easter Sunday, the IT first Sundays). Statutes: `europe-statute-eras`. Corpus IT / NL / DE / IE / PT defer to the starters.

Central Europe: since 0.32.0 (#23) `"HR"`, `"SI"`, `"SK"`, `"CZ"`, `"HU"` and `"PL"` match their gold on every day, holiday and business status. HR: the 2001/2002 reform (25 June, 8 October, Tijelovo from 2002; no 6 January 2002) and the 2020 one. SI: no 2 January 2013–2016, 14 August 2023. SK: 17 November 2001–2024, no 8 May / 15 September in 2026, 30 October 2018. CZ: Velký pátek from 2016. HU: Szenteste from 2026 and every yearly munkarend transfer (rest days and working Saturdays). PL: Pentecost Sunday, 12 November 2018. The corpus codes defer to the starters.

South-east Europe: since 0.33.0 (#22) `"RO"`, `"BG"`, `"GR"` and `"CY"` match their gold on every day (GR and CY `:secondary`). RO: Rusalii and 15 August from 2009, 30 November from 2012, 24 January from 2017. BG: no 1 November, Good Friday and Holy Saturday from 2010, the чл. 154(2) weekend rule from 2017, the Council of Ministers transfers. GR: the 1 May moves of 2013, 2016, 2021, 2022, 2024. The corpus codes defer to the starters.

Baltics: since 0.34.0 (#21) `"EE"`, `"LV"` and `"LT"` match their gold on every day (EE and LT `:secondary`). LV: 4 May from 2002, 24 December from 2007, the next working day off after a weekend 4 May or 18 November from 2007, every Cabinet transfer of a working day 2001–2026, the festival closing days and the one-off days of 2018 and 2023. EE: jõululaupäev from 2005. LT: Joninės from 2003. The corpus codes defer to the starters.

Nordics: since 0.35.0 (#20) `"SE"` and `"FI"` match their gold on every day. SE: annandag pingst to 2004, nationaldagen from 2005. FI: pyhäinpäivä (the Saturday 31 Oct–6 Nov), and jouluaatto, juhannusaatto and pääsiäislauantai with vapunpäivä as vuosilomalaki § 4(3) counts them; no uudenvuodenaatto. Corpus SE / FI defer to the starters.

Normative starters (prefer over `country-calendar` corpus): `japan-holidays-calendar` (祝日法 + Tokyo equinoxes), `(china-holidays-calendar :year 2026)` (放假办法 of each era + Beijing lunar + the 放假 notices), `india-holidays-calendar`, `germany-holidays-calendar` / `france-holidays-calendar` / `italy-holidays-calendar` / `spain-holidays-calendar` / `netherlands-holidays-calendar` / `belgium-holidays-calendar` / `austria-holidays-calendar` / `poland-holidays-calendar` / `sweden-holidays-calendar`, plus `target-calendar` (ECB). See [`docs/AUTHORITIES.md`](docs/AUTHORITIES.md).

`(event-schedule cal :holiday)` / `:business-day` / `:weekend` — same `datetime-protocol` schedule protocol as sunrise/Easter. Ritual **activity bans until sunset / from fajr** still need lat/lon (`jewish-melacha-forbidden-p`, `islamic-fasting-p` on `+jerusalem+` / `+mecca+`), not civil-midnight holiday tables.

`:bridge :adjacent` and China-style rearrangements without a cited decree are not silent defaults.

```lisp
(asdf:load-system "cl-stack-calendars")
(use-package :stack-calendars)

(let ((cal (russian-holidays-calendar :year 2026)))
  (holiday-p cal (make-date 2026 1 9))   ; decree transfer
  (business-day-p cal (make-date 2024 4 27))) ; compensatory Saturday when :year 2024

;; 212 country/territory codes: 206 with data (2000–2040 public+bank), incl.
;; TW/XK/EH, plus 6 empty stubs (ABH NCY OST PMR PS SOL). Outside 2000–2040, and
;; for a stub, holiday-p signals CALENDAR-OUT-OF-RANGE (see below).
(list-country-calendars)
(holiday-p (country-calendar "DE") (make-date 2024 10 3))
(holiday-p (country-calendar "TW") (make-date 2024 2 10))
(holiday-p (country-calendar "XK") (make-date 2024 2 17))

(let ((session (make-trading-session
                :name "NYSE-RTH"
                :zone "America/New_York"
                :open '(9 30)
                :close '(16 0)
                :calendar (us-federal-holidays-calendar))))
  (session-bounds session (make-date 2024 6 3))
  (session-duration session (make-date 2024 3 10))) ; DST: open/close resolved independently

;; Versioned major-exchange cash hours (data/exchanges/<MIC>.sexp)
(list-exchanges)                                    ; XNYS XLON XAMS XTAI XCME …
(exchange-sessions-for-date (find-exchange "XNYS")
                            (make-date 1985 9 26))  ; 10:00–16:00 era
(exchange-trading-day-p (find-exchange "XNYS")
                        (make-date 2026 11 26)) ; NIL — Thanksgiving ("NYSE" calendar)
(exchange-session-bounds "XTKS" (make-date 2024 11 5)) ; afternoon to 15:30
(exchange-open-p "XHKG" instant)                    ; lunch excluded
```

Starter calendars: `weekend-only-calendar`, `target-calendar`, `us-federal-holidays-calendar`, `nyse-holidays-calendar` ("NYSE"), `uk-bank-holidays-calendar`, `russian-holidays-calendar`, `ussr-holidays-calendar`, `japan-holidays-calendar`, `china-holidays-calendar`, `india-holidays-calendar`, **EU-27** national starters (`germany-…` … `malta-…`), plus `(country-calendar "XX")` for the world corpus (`data/countries/`, CC BY-SA 3.0 via date-holidays).

Holiday verification: `data/tests/holiday-gold.sexp` + `tests/holiday-suite-test.lisp` (gold vectors, year-sweep invariants, corpus load, starter↔corpus core dates, exchange calendar attachments). External lock: `data/tests/external-gold.sexp` (gov.uk + 内閣府 CSV + frozen vacanza dump; refresh `ros -l scripts/fetch-external-gold.lisp -q`). Computed festivals: `data/tests/calc-gold.sexp` (HKO lunar, dateutil Easter, pyluach Hebrew, Kuwaiti Eid; refresh `uv run scripts/generate_calc_gold.py`). NYSE: `data/tests/xnys-gold.sexp` (Python `exchange_calendars` XNYS 1970–2030 — every session date and early close; refresh `uv run --no-project --with exchange_calendars python -I scripts/generate_xnys_gold.py`).

### Exchange holidays

Every exchange query — `exchange-trading-day-p`, `exchange-sessions-for-date`, `exchange-session-bounds`, `exchange-open-p` — honours the exchange's holiday calendar (`exchange-hours-calendar-name`; `exchange-holiday-p`). Since 0.5.0 XNYS and XNAS use the `"NYSE"` calendar (NYSE Rule 7.2 holidays from 1954 + special closures in `data/us/nyse-closures.sexp`), not `"USFED"`: Good Friday is closed, Columbus Day and Veterans Day are open, and a Saturday New Year's Day leaves Friday Dec 31 open. The CME-family MICs (XCME, XCBT, XCEC, XNYM) still use `"USFED"` as an approximation (Globex trades through most US holidays; #48). Other MICs use the national civil calendar, which can differ from the exchange's own list (#49).

## Data path / client zip

~300 `.sexp` files live under `data/`. Point the tree at another directory, a zip of that tree, or a `zip://` URI — the usual client-app ship format is one `data.zip` next to the executable.

```lisp
(set-data-root "/opt/app/data/")                 ; unpacked
(set-data-root "/opt/app/data.zip")              ; → zip:///opt/app/data.zip!/
(set-data-root "zip:///opt/app/data.zip!/")      ; explicit
(set-data-root "zip:///C:/app/data.zip!/")       ; Windows — keep the drive
(write-data-zip "/opt/app/data.zip")          ; pack the current tree
```

`$CL_STACK_CALENDARS_DATA` is the default when `*data-root*` is unset. Switching the root is process-wide (see Caching and threads). `*countries-data-directory*` / `*exchanges-data-directory*` still override those subtrees.

## License

MIT
