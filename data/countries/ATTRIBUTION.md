# Country holiday data attribution

Holiday dates under `data/countries/*.sexp` (except stubs) were generated from
[commenthol/date-holidays](https://github.com/commenthol/date-holidays)
(`holidays.json` / country YAML), licensed **CC BY-SA 3.0**.

Upstream relies primarily on Wikipedia and national sources; this is a
**computational corpus**, not a substitute for the normative acts encoded in
hand-maintained starters (USFED, GBLO, RU, TARGET, …). Prefer those when both
exist.

Regenerate: `node scripts/generate-country-holidays.mjs`
