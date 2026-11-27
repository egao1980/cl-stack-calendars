# External holiday gold

Pinned snapshot: `external-gold.sexp`. Refresh official blocks:

```
ros -l scripts/install-external-gold.lisp -q   # once — cl-stack-http stack
ros -l scripts/fetch-external-gold.lisp -q
```

vacanza/holidays has no CL client; those blocks stay as a frozen dump in the sexp.

| Source | Kind | What we compare |
|--------|------|-----------------|
| [gov.uk bank-holidays.json](https://www.gov.uk/bank-holidays.json) | Official (OGL) | England & Wales 2019–2028 vs `(uk-bank-holidays-calendar :year N)` and the registered `GB` / `GBLO` |
| [gov.uk, archived](https://web.archive.org/web/20190105193750id_/https://www.gov.uk/bank-holidays.json) (`govuk-archive`) | Official (OGL), frozen | England & Wales 2012–2018, which the live file no longer lists. Kept as is by the refresh script; agrees with the 2012, 2013 and 2016 snapshots. Checked against the registered `GB` / `GBLO` and `country-calendar "GB"` |
| [内閣府 syukujitsu.csv](https://www8.cao.go.jp/chosei/shukujitsu/syukujitsu.csv) | Official | 1955–2027 vs `JP` starter |
| [vacanza/holidays](https://github.com/vacanza/holidays) 0.82 | Computational (MIT) | Independent of date-holidays. Asserted: USFED (weekdays), TARGET, DE, FR, JP. GBLO is locked by gov.uk (vacanza keeps weekend Christmas). |

`data/countries/` is date-holidays — **not** used as an external check.

Computed festival dates (HKO / Easter / Hebrew / tabular Eid) live in `calc-gold.sexp` — see that file's header. Refresh: `uv run scripts/generate_calc_gold.py`.

NYSE sessions and early closes live in `xnys-gold.sexp` (Python [exchange_calendars](https://github.com/gerrymanoim/exchange_calendars) XNYS, Apache-2.0; dates and close times only). Range 1970–2030: before 1970 exchange_calendars has no regular holidays (pandas holiday rules start in 1970). Refresh: `uv run --no-project --with exchange_calendars python -I scripts/generate_xnys_gold.py`. Asserted by `tests/xnys-gold-test.lisp` for XNYS (1970–2030) and XNAS (1990–2030); no allowed differences.

The Russian production calendar 2000–2027 (one W/R/H code per day) lives in `ru-production-calendar-gold.sexp`. Sources: КонсультантПлюс [production calendars](https://www.consultant.ru/law/ref/calendar/proizvodstvennye/2025/) for 2010–2027 (2020 and 2024 from pinned Wayback copies, since the live pages now redirect to other years), and for 2000–2009 the open data set `7708660670-proizvcalendar` of the Аналитический центр при Правительстве РФ on data.gov.ru (a Wayback copy of version 20180410T1145). The two agree on every day 2010–2017. Where the data set ignores a normative act, the act wins and the fixture lists it under `:decree-overrides`: ФЗ от 25.12.1999 № 217-ФЗ (2000), ПП от 02.02.2001 № 84 (2001) and ПП от 28.04.2005 № 262 (2005). Saturdays and Sundays are split into H and R by the ТК / КЗоТ holiday list in force, which no source marks. Python `holidays` 0.109 (secondary) disagrees on one weekday, 2014-03-10, which it misses (8 March 2014 was a Saturday). The 2020 calendar does not mark the Presidential "нерабочие дни" of 2020 (COVID-19, 24 June, 1 July), and neither does `RU`. Refresh: `uv run --no-project --with beautifulsoup4 python -I scripts/generate_ru_production_gold.py`. Asserted by `tests/russian-production-gold-test.lisp` with no allowed differences.

Americas national holidays 2000–2040 live in `<cc>-holiday-gold.sexp`, built by `scripts/generate_americas_holiday_gold.py` (refresh: `uv run --no-project --with holidays==0.109 python -I scripts/generate_americas_holiday_gold.py CC`). Each fixture cites its primary sources under `:sources`; the script never reads the Lisp starters. Python `holidays` 0.109 is a secondary check whose differences the script prints. Asserted by `tests/americas-holiday-gold-test.lisp` (holiday and business status on every day) with no allowed differences.

| Code | Gold source |
|------|-------------|
| `CO` | Statute texts: [Ley 51 de 1983](https://www.funcionpublica.gov.co/eva/gestornormativo/norma.php?i=4954) art. 1 and [Ley 2578 de 2026](http://www.secretariasenado.gov.co/senado/basedoc/ley_2578_2026.html) art. 6. Colombia publishes no machine-readable festivos list. Python `holidays`: 0 differences. |
| `CL` | BCN statute texts (leychile XML service), checked against the official [Gobierno Digital feriados API](https://apis.digital.gob.cl/fl/feriados) for 2013–2024 (pinned Wayback copies) and [feriados.cl](https://www.feriados.cl/) for 2026–2028. They agree except for election days (left out) and five days where the act wins: 2018-01-16 (Región Metropolitana only), 2021-06-21 (Ley 21.357 transitorio), 2022-06-27/28 (Ley 19.668), 2022-09-16 (Ley 21.482). Python `holidays`: 0 differences. |
| `CA` | Federal statute texts from Justice Laws XML: [Canada Labour Code](https://laws-lois.justice.gc.ca/eng/XML/L-2.xml) s. 166 and [Holidays Act](https://laws-lois.justice.gc.ca/eng/XML/H-5.xml). [canada.ca](https://www.canada.ca/en/services/jobs/workplace/federal-labour-standards/vacations-holidays.html) lists the same ten general holidays; no machine-readable list exists. Python `holidays` CA has a different scope (the five days every province shares), so it differs on 211 days. |
| `AU` | The national subset of the PM&C [Australian Public Holidays Dates Machine Readable Dataset](https://data.gov.au/data/dataset/australian-holidays-machine-readable-dataset) (2014–2025): the days listed for all eight jurisdictions. It agrees on every weekday except 2022-09-22, which the March 2022 file predates. Weekend days are not compared, because the data set lists them inconsistently. The other years apply the same rules. Python `holidays` AU has no substitute days, so it differs on 47 days. |
