# Country holiday data attribution

Holiday dates under `data/countries/*.sexp` (except stubs) were generated from
[commenthol/date-holidays](https://github.com/commenthol/date-holidays)
(`holidays.json` / country YAML), licensed **CC BY-SA 3.0**.

Upstream relies primarily on Wikipedia and national sources; this is a
**computational corpus**, not a substitute for the normative acts encoded in
hand-maintained starters (USFED, GBLO, RU, TARGET, …). Prefer those when both
exist.

Day tables are a **frozen dump** (date-holidays is JS-only). Rebuild the index
and missing stubs:

```
ros -l scripts/generate-country-holidays.lisp -q
```

Gazette extracts / decree backfill (from those sexps):

```
ros -l scripts/extract-gazette-corpus.lisp -q
ros -l scripts/backfill-decrees.lisp -q
```

## Hand corrections

- **GB** (0.12.0, #14): scoped to England and Wales, the scope of
  `find-calendar "GB"`. Added the Summer bank holiday (last Monday in August,
  [BFDA 1971 Sch.1](https://www.legislation.gov.uk/ukpga/1971/80/schedule/1)),
  which date-holidays files as regional, for 2000–2040. Applied the
  proclamations of 2002 ([Gazette 56043](https://www.thegazette.co.uk/notice/L-56043-1001)),
  2011 ([Gazette 59637](https://www.thegazette.co.uk/notice/L-59637-1268656)) and
  2012 ([Gazette 59806](https://www.thegazette.co.uk/notice/L-59806-1377705)):
  2002-05-27 and 2012-05-28 removed; 2002-06-03, 2002-06-04, 2011-04-29 and
  2012-06-04 added. Checked against gov.uk `bank-holidays.json` for 2012–2028
  (`data/tests/external-gold.sexp`). The file's `:note` records this.
