#!/usr/bin/env python3
# /// script
# requires-python = ">=3.12"
# dependencies = [
#   "python-dateutil>=2.9",
#   "pyluach>=2.2",
# ]
# ///
"""Build data/tests/calc-gold.sexp — computed holiday dates from independent gold.

HKO lunar tables, dateutil Easter, pyluach Hebrew, Kuwaiti/tabular Eid.
Not date-holidays / calendrica. Official country lists stay in external-gold.sexp.
"""

from __future__ import annotations

import json
import re
import sys
import tempfile
import urllib.error
import urllib.request
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import date
from pathlib import Path

from dateutil.easter import EASTER_ORTHODOX, EASTER_WESTERN, easter
from pyluach import dates as hebrew_dates

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "data" / "tests" / "calc-gold.sexp"
HKO_URI = "https://www.hko.gov.hk/en/gts/time/calendar/text/files/T{year}e.txt"
UA = "cl-stack-calendars calc-gold refresh (https://github.com/egao1980/cl-stack-calendars)"

WEEKDAYS = ("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
MONTH_RE = re.compile(r"^(?:Leap\s+)?(\d+)(?:st|nd|rd|th)\s+Lunar\s+Month$", re.I)
LINE_RE = re.compile(r"^(\d{4})/(\d{1,2})/(\d{1,2})\s+(.+)$")


def fetch(url: str, timeout: float = 60.0) -> bytes:
    req = urllib.request.Request(url, headers={"User-Agent": UA})
    with urllib.request.urlopen(req, timeout=timeout) as resp:
        return resp.read()


def lisp_str(s: str) -> str:
    return json.dumps(s, ensure_ascii=False)


def lisp_atom(x: object) -> str:
    if x is None or x is False:
        return "nil"
    if x is True:
        return "t"
    if isinstance(x, int) and not isinstance(x, bool):
        return str(x)
    if isinstance(x, str):
        if x.startswith(":"):
            return x
        return lisp_str(x)
    if isinstance(x, (list, tuple)):
        return "(" + " ".join(lisp_atom(i) for i in x) + ")"
    raise TypeError(x)


def write_block(fp, source: str, kind: str, rows: list, extra: str = "") -> None:
    fp.write(f"  (:source {lisp_str(source)} :kind :{kind}{extra}\n")
    fp.write("   :rows (\n")
    for row in rows:
        fp.write(f"     {lisp_atom(row)}\n")
    fp.write("   ))\n")


def islamic_to_jdn(year: int, month: int, day: int) -> int:
    return (11 * year + 3) // 30 + 354 * year + 30 * month - (month - 1) // 2 + day + 1_948_055


def jdn_to_gregorian(jdn: int) -> tuple[int, int, int]:
    el = jdn + 68569
    n = (4 * el) // 146097
    el = el - (146097 * n + 3) // 4
    i = (4000 * (el + 1)) // 1461001
    el = el - (1461 * i) // 4 + 31
    j = (80 * el) // 2447
    day = el - (2447 * j) // 80
    el = j // 11
    month = j + 2 - 12 * el
    year = 100 * (n - 49) + i + el
    return year, month, day


def parse_hko_year(year: int, text: str) -> dict[str, date]:
    seen: set[int] = set()
    month = 0
    leap = False
    day = 0
    festivals: dict[str, date] = {}
    for raw in text.splitlines():
        match = LINE_RE.match(raw.strip())
        if not match:
            continue
        gy, gm, gd = int(match[1]), int(match[2]), int(match[3])
        rest = match[4]
        weekday = None
        for wd in WEEKDAYS:
            idx = rest.find(wd)
            if idx != -1:
                lunar = rest[:idx].strip()
                term = rest[idx + len(wd) :].strip()
                weekday = wd
                break
        if weekday is None:
            continue
        month_match = MONTH_RE.match(lunar)
        if month_match:
            month = int(month_match[1])
            leap = month in seen or lunar.lower().startswith("leap")
            seen.add(month)
            day = 1
        elif lunar.isdigit():
            day = int(lunar)
        else:
            continue
        g = date(gy, gm, gd)
        if month == 1 and day == 1 and not leap:
            festivals["chinese-new-year"] = g
        if month == 5 and day == 5 and not leap:
            festivals["duanwu"] = g
        if month == 8 and day == 15 and not leap:
            festivals["zhongqiu"] = g
        if term == "Bright & Clear":
            festivals["qingming"] = g
    return festivals


def hko_rows() -> list[tuple]:
    cache = Path(tempfile.gettempdir()) / "hko-lunar-gold"
    cache.mkdir(parents=True, exist_ok=True)

    def one(year: int) -> list[tuple]:
        cached = cache / f"T{year}e.txt"
        if cached.exists():
            text = cached.read_text(encoding="utf-8", errors="replace")
        else:
            text = fetch(HKO_URI.format(year=year)).decode("utf-8", errors="replace")
            cached.write_text(text, encoding="utf-8")
        found = parse_hko_year(year, text)
        return [(year, f":{name}", g.year, g.month, g.day) for name, g in found.items()]

    rows: list[tuple] = []
    with ThreadPoolExecutor(max_workers=12) as pool:
        futs = [pool.submit(one, y) for y in range(1901, 2101)]
        for fut in as_completed(futs):
            rows.extend(fut.result())
    rows.sort()
    cny = {(r[2], r[3], r[4]) for r in rows if r[1] == ":chinese-new-year"}
    want = {(2024, 2, 10), (2025, 1, 29), (2020, 1, 25)}
    if missing := want - cny:
        raise SystemExit(f"HKO missing published CNY {missing}")
    return rows


def easter_rows(method: int) -> list[tuple]:
    return [(y, (e := easter(y, method)).year, e.month, e.day) for y in range(1900, 2051)]


def hebrew_holiday_rows() -> list[tuple]:
    specs = (
        ("rosh-hashanah", 7, 1),
        ("yom-kippur", 7, 10),
        ("sukkot", 7, 15),
        ("passover", 1, 15),
        ("shavuot", 3, 6),
    )
    rows = []
    for hy in range(5708, 5811):  # ~1948–2050
        for name, hm, hd in specs:
            g = hebrew_dates.HebrewDate(hy, hm, hd).to_greg()
            rows.append((hy, f":{name}", int(g.year), int(g.month), int(g.day)))
    return rows


def islamic_holiday_rows() -> list[tuple]:
    """Gregorian dates of tabular 1 Muharram / 1 Shawwal / 10 Dhu al-Hijjah."""
    rows = []
    for iy in range(1320, 1473):  # ~1902–2050
        for name, im, id_ in (("islamic-new-year", 1, 1), ("eid-al-fitr", 10, 1),
                              ("eid-al-adha", 12, 10), ("mawlid", 3, 12)):
            gy, gm, gd = jdn_to_gregorian(islamic_to_jdn(iy, im, id_))
            rows.append((iy, f":{name}", gy, gm, gd))
    return rows


def main() -> int:
    assert easter(2024, EASTER_WESTERN) == date(2024, 3, 31)
    rh = hebrew_dates.HebrewDate(5785, 7, 1).to_greg()
    assert (rh.year, rh.month, rh.day) == (2024, 10, 3)
    assert jdn_to_gregorian(islamic_to_jdn(1446, 1, 1)) == (2024, 7, 8)
    print("downloading HKO 1901–2100 …", file=sys.stderr)
    hko = hko_rows()
    west = easter_rows(EASTER_WESTERN)
    orth = easter_rows(EASTER_ORTHODOX)
    heb = hebrew_holiday_rows()
    isl = islamic_holiday_rows()

    OUT.parent.mkdir(parents=True, exist_ok=True)
    with OUT.open("w", encoding="utf-8") as fp:
        fp.write(";; Computed-holiday gold — regenerate: uv run scripts/generate_calc_gold.py\n")
        fp.write(";; Official gazettes stay in external-gold.sexp (gov.uk / 内閣府 / vacanza).\n")
        fp.write("(\n")
        fp.write(f" :generated {lisp_str(date.today().isoformat())}\n")
        fp.write(" :sources (\n")
        fp.write(f"  (:id {lisp_str('hko')} :kind :official"
                 f" :uri {lisp_str('https://www.hko.gov.hk/en/gts/time/conversion1_text.htm')}"
                 f" :years (1901 2100) :license {lisp_str('HKO')})\n")
        fp.write(f"  (:id {lisp_str('dateutil')} :kind :computational"
                 f" :note {lisp_str('Easter WESTERN/ORTHODOX')} :license {lisp_str('BSD')})\n")
        fp.write(f"  (:id {lisp_str('pyluach')} :kind :computational"
                 f" :note {lisp_str('arithmetic Hebrew')} :license {lisp_str('MIT')})\n")
        fp.write(f"  (:id {lisp_str('kuwaiti-jdn')} :kind :published-formula"
                 f" :note {lisp_str('civil/tabular Friday epoch; not Umm al-Qura')})\n")
        fp.write(" )\n")
        fp.write(" :blocks (\n")
        write_block(fp, "hko", "chinese-festival", hko)
        write_block(fp, "dateutil", "easter-western", west)
        write_block(fp, "dateutil", "easter-orthodox", orth)
        write_block(fp, "pyluach", "hebrew-holiday", heb)
        write_block(fp, "kuwaiti-jdn", "islamic-civil", isl)
        fp.write(" )\n)\n")
    print(f"wrote {OUT} hko={len(hko)} easter={len(west)} hebrew={len(heb)} islamic={len(isl)}",
          file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
