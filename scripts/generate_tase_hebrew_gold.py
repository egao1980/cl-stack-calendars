#!/usr/bin/env python3
"""Build data/tests/exchanges/XTAE-hebrew-gold.sexp: the date of every
Hebrew-calendar holiday and holiday eve that a TASE "Vacation Schedule"
lists, 2013-2028, from the exchange's own documents (no third-party table).

Inputs are the cited TASE documents cached under
~/.cache/cl-stack-calendars/exchanges/xtae/:
  file_0010_vacation_schedule_<YEAR>_eng.pdf  (2013-2025, "Previous Years")
  trading_vacation_schedule_en_<DATE>.html     (live page, 2026-2028)
PDFs are read with poppler's `pdftotext -layout`. Regenerate:

    uv run --no-project python -I scripts/generate_tase_hebrew_gold.py

Each row is (Y M D "TASE name" KIND TARGET): KIND :eve names the date
function (src/exchange-date-functions.lisp) that must return that date for
year Y; KIND :festival names the IL calendar holiday that must fall on it.
The lists show only days that would otherwise be trading days, so a
holiday on a Friday/Saturday (Sunday from 2026) is simply absent.
"""

from __future__ import annotations

import html
import re
import subprocess
from datetime import date
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CACHE = Path.home() / ".cache" / "cl-stack-calendars" / "exchanges" / "xtae"
OUT = ROOT / "data" / "tests" / "exchanges" / "XTAE-hebrew-gold.sexp"
PAGE_URI = "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule"

MONTHS = {m: i + 1 for i, m in enumerate(
    "January February March April May June July August September October November December".split())}
SHORT = {m[:3]: n for m, n in MONTHS.items()}
DATE = re.compile(r"\b(" + "|".join(MONTHS) + r")\s+(\d{1,2})\b")
DOW = re.compile(r"\b(Sunday|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday)\b")
JUNK = re.compile(r"--|\bV\b|\(Except \$\)")

# TASE name -> (KIND, TARGET). Order matters: first match wins.
NAMES = [
    (r"^Shushan Purim", None),
    (r"^Purim", (":eve", "il-purim")),
    (r"^Passover (I )?Eve", (":eve", "il-erev-pesach")),
    (r"^Passover II Eve", (":eve", "il-erev-pesach-seventh")),
    (r"^Passover II$", (":festival", "Passover Day 7")),
    (r"^Passover( I| 1)?$", (":festival", "Passover")),
    (r"^Memorial Day", (":eve", "il-memorial-day-observed")),
    (r"^Independence Day", (":eve", "il-independence-day-observed")),
    (r"^(Pentecost \(Shavuot\) Eve|Pentecost Eve \(Shavuot\)|Shavuot Eve)$", (":eve", "il-erev-shavuot")),
    (r"^(Pentecost \(Shavuot\)|Shavuot)$", (":festival", "Shavuot")),
    (r"^Fast Day", (":eve", "il-tisha-bav-observed")),
    (r"^Jewish New Year Eve", (":eve", "il-erev-rosh-hashanah")),
    (r"^Jewish New Year I$", (":festival", "Rosh Hashanah")),
    (r"^Jewish New Year II$", (":festival", "Rosh Hashanah Day 2")),
    (r"^Yom Kippur Eve", (":eve", "il-erev-yom-kippur")),
    (r"^Yom Kippur$", (":festival", "Yom Kippur")),
    (r"^(Feast of Tabernacles \(Sukkoth\) Eve|Sukkoth Eve)$", (":eve", "il-erev-sukkot")),
    (r"^(Feast of Tabernacles \(Sukkoth\)|Sukkoth)$", (":festival", "Sukkot")),
    (r"^(Rejoicing of the Law \(Simchat Tora\) Eve|Simchat Tora Eve)$", (":eve", "il-erev-simchat-torah")),
    (r"^(Rejoicing of the Law \(Simchat Tora\)|Simchat Tora)$", (":festival", "Simchat Torah")),
]

# Rows of a list that are not that year's holiday, with the reason.
EXCLUDE = {
    (2022, 5, 16): "stray row 'May 16 Sunday Pentecost Eve' copied from 2021 into the English 2022 PDF; "
                   "the Hebrew 2022 PDF has no such row and Shavuot Eve 2022 was Friday 3 June",
}


def classify(name):
    for pattern, target in NAMES:
        if re.search(pattern, name):
            return target
    return None


def pdf_rows(path: Path, year: int):
    text = subprocess.run(["pdftotext", "-layout", str(path), "-"], check=True,
                          capture_output=True, text=True).stdout
    lines = text.split("\n")
    merged, i = [], 0
    while i < len(lines):  # "September      Monday ..." then "22" on its own line
        line = lines[i]
        m = re.match(r"^(" + "|".join(MONTHS) + r")(\s+)(\S.*)$", line)
        if m and i + 1 < len(lines) and lines[i + 1].strip().isdigit():
            line = m.group(1) + " " + lines[i + 1].strip() + m.group(2) + m.group(3)
            i += 1
        merged.append(line)
        i += 1
    out, cur = [], None
    for line in merged:
        if "Disclaimer" in line:
            break
        m = DATE.search(line)
        if m and ("--" in line or line.rstrip().endswith("V")):
            name = " ".join(JUNK.sub(" ", DOW.sub(" ", DATE.sub(" ", line))).split())
            cur = [year, MONTHS[m.group(1)], int(m.group(2)), name]
            out.append(cur)
        elif cur is not None and line.strip() and not DATE.search(line):
            extra = " ".join(JUNK.sub(" ", line).split())
            if extra:
                cur[3] = (cur[3] + " " + extra).strip()
        elif not line.strip():
            cur = None
    return out


def page_rows(path: Path):
    s = path.read_text(encoding="utf-8")
    s = re.sub(r"(?s)<script.*?</script>|<style.*?</style>", "", s)
    lines = [l.strip() for l in html.unescape(re.sub(r"<[^>]+>", "\n", s)).split("\n") if l.strip()]
    out, year = [], None
    for i, line in enumerate(lines):
        y = re.search(r"Vacation Schedule, (\d{4})", line)
        if y:
            year = int(y.group(1))
            continue
        m = re.fullmatch(r"([A-Z][a-z]{2})-(\d{1,2})", line)
        if m and year and i + 2 < len(lines) and DOW.fullmatch(lines[i + 1]):
            out.append([year, SHORT[m.group(1)], int(m.group(2)), lines[i + 2]])
    return out


def main() -> None:
    rows, sources = [], {}
    for pdf in sorted(CACHE.glob("file_0010_vacation_schedule_*_eng.pdf")):
        year = int(re.search(r"_(\d{4})_eng", pdf.name).group(1))
        sources[year] = pdf.name
        rows += pdf_rows(pdf, year)
    page = sorted(CACHE.glob("trading_vacation_schedule_en_*.html"))[-1]
    pdf_years = set(sources)
    for row in page_rows(page):
        if row[0] not in pdf_years:
            sources[row[0]] = page.name
            rows.append(row)
    kept = []
    for y, m, d, name in rows:
        if (y, m, d) in EXCLUDE or date(y, m, d).year != y:
            continue
        target = classify(name)
        if target:
            kept.append((y, m, d, name, *target))
    OUT.parent.mkdir(parents=True, exist_ok=True)
    with OUT.open("w", encoding="utf-8") as fp:
        fp.write(";; XTAE Hebrew-calendar dates from the TASE yearly Vacation Schedules — regenerate:\n")
        fp.write(";;   uv run --no-project python -I scripts/generate_tase_hebrew_gold.py\n")
        fp.write("(\n")
        fp.write(f" :generated \"{date.today().isoformat()}\"\n")
        fp.write(f" :source (:id \"TASE Vacation Schedules\" :uri \"{PAGE_URI}\")\n")
        fp.write(" :documents (\n")
        for year in sorted(sources):
            fp.write(f"   ({year} \"{sources[year]}\")\n")
        fp.write(" )\n :excluded (\n")
        for (y, m, d), why in EXCLUDE.items():
            fp.write(f"   (({y} {m} {d}) \"{why}\")\n")
        fp.write(" )\n :rows (\n")
        for y, m, d, name, kind, target in sorted(kept):
            target_s = target if kind == ":eve" else f"\"{target}\""
            name_s = name.replace('"', '\\"')
            fp.write(f"   ({y} {m} {d} \"{name_s}\" {kind} {target_s})\n")
        fp.write(" ))\n")
    print(f"{OUT}: {len(kept)} rows, years {min(sources)}-{max(sources)}")


if __name__ == "__main__":
    main()
