#!/usr/bin/env python3
# /// script
# requires-python = ">=3.10"
# dependencies = [
#   "exchange_calendars==4.13.3",
# ]
# ///
"""Build data/tests/xnys-gold.sexp: every NYSE trading day 1953-2030, with its
regular hours, early closes and late opens.

    uv run --no-project --with exchange_calendars==4.13.3 python -I scripts/generate_xnys_gold.py

1953-1969 come from the NYSE's own record (scripts/xnys/nyse_record.py: the
NYSE closings history, its timeline, the SEC Special Study), applied by the
rules the record states. Every closed day, early close and late open of those
years carries the URL it comes from. exchange_calendars has no regular
holidays before 1970 (its pandas holiday rules start then), so it is not used
for them.

1970-2030 come from the Python `exchange_calendars` XNYS calendar (Apache-2.0;
dates and close times only, nothing vendored), as before #50.

Regular hours for the whole range come from the NYSE record (:hours eras).
The fixture lists every weekday that is NOT a session (closures) plus every
early close and late open; the session count is a checksum, so the test
compares every session date without storing ~20k rows. This script never
reads the Lisp calendar.
"""

from __future__ import annotations

import importlib.util
import sys
from datetime import date, timedelta
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "data" / "tests" / "xnys-gold.sexp"
GENERATED = "2026-11-28"
EC_START, END = date(1970, 1, 1), date(2030, 12, 31)
ZONE = "America/New_York"


def load_record():
    path = ROOT / "scripts" / "xnys" / "nyse_record.py"
    spec = importlib.util.spec_from_file_location("nyse_record", path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


# --- date helpers -------------------------------------------------------------------

def easter(year: int) -> date:
    """Gregorian Easter Sunday (anonymous algorithm)."""
    a, b, c = year % 19, year // 100, year % 100
    d, e = b // 4, b % 4
    f = (b + 8) // 25
    g = (b - f + 1) // 3
    h = (19 * a + b - d - g + 15) % 30
    i, k = c // 4, c % 4
    l = (32 + 2 * e + 2 * i - h - k) % 7
    m = (a + 11 * h + 22 * l) // 451
    month = (h + l - 7 * m + 114) // 31
    day = (h + l - 7 * m + 114) % 31 + 1
    return date(year, month, day)


def nth_weekday(year: int, month: int, weekday: int, n: int) -> date:
    first = date(year, month, 1)
    return first + timedelta(days=(weekday - first.weekday()) % 7 + 7 * (n - 1))


def nominal(rule, year: int) -> date:
    kind = rule[0]
    if kind == "fixed":
        return date(year, rule[1], rule[2])
    if kind == "nth":
        return nth_weekday(year, rule[1], rule[2], rule[3])
    if kind == "easter":
        return easter(year) + timedelta(days=rule[1])
    if kind == "election":  # Tuesday after the first Monday in November
        return nth_weekday(year, 11, 0, 1) + timedelta(days=1)
    raise ValueError(rule)


def weekdays(start: date, end: date):
    d = start
    while d <= end:
        if d.weekday() < 5:
            yield d
        d += timedelta(days=1)


# --- 1953-1969 from the NYSE record ----------------------------------------------------

def record_closures(rec):
    """{day: (name, [urls])} for every weekday the record closes, 1953-1969."""
    closed: dict[date, tuple[str, list[str]]] = {}

    def close(day, name, urls):
        if day.weekday() < 5 and rec.FIRST_YEAR <= day.year <= rec.LAST_YEAR:
            if day in closed:
                closed[day] = (closed[day][0], closed[day][1] + [u for u in urls if u not in closed[day][1]])
            else:
                closed[day] = (name, list(urls))

    for name, rule, first, last, source in rec.STANDARD:
        for year in range(max(first, rec.FIRST_YEAR), (last or rec.LAST_YEAR) + 1):
            day = nominal(rule, year)
            urls = [source]
            if day.weekday() == 6:                       # Sunday -> Monday
                day += timedelta(days=1)
            elif day.weekday() == 5:                     # Saturday
                friday = day - timedelta(days=1)
                year_end = friday.month == 12 and friday.day == 31
                if day < rec.SATURDAY_POLICY or year_end:
                    continue
                day, urls = friday, rec.SATURDAY_POLICY_SOURCES
            if day in rec.CONFIRMED:
                urls = urls + [rec.CONFIRMED[day]]
            close(day, name, urls)

    for day, name, _note in rec.SPECIAL:
        close(day, name, [rec.NYSE_2011])

    # Paperwork crisis: one closed weekday a week, Wednesday unless the week
    # already has one (a holiday, a special closing or another legal holiday).
    for day, name, url in rec.PAPERWORK_LEGAL_HOLIDAYS:
        close(day, name, [rec.NYSE_2011, url])
    first, last = rec.PAPERWORK_WEEKS
    wednesday = first
    while wednesday <= last:
        monday = wednesday - timedelta(days=2)
        week = [monday + timedelta(days=i) for i in range(5)]
        if not any(d in closed for d in week):
            close(wednesday, rec.PAPERWORK_NAME, [rec.NYSE_2011])
        wednesday += timedelta(days=7)
    return closed


def record_early_closes(rec, closed):
    out = {}
    for first, last, hm, note in rec.EARLY_CLOSES:
        for day in weekdays(first, last):
            if day not in closed:
                out[day] = (hm, rec.NYSE_2011, note)
    return out


def record_late_opens(rec, closed):
    out = {}
    for day, hm, note in rec.LATE_OPENS:
        if day not in closed:
            out[day] = (hm, rec.NYSE_2011, note)
    return out


# --- 1970-2030 from exchange_calendars -------------------------------------------------

def ec_part():
    import exchange_calendars as xc
    import pandas as pd

    start, end = EC_START.isoformat(), END.isoformat()
    cal = xc.get_calendar("XNYS", start=start, end=end)
    sessions = cal.sessions
    bdays = pd.bdate_range(start, end)
    if len(sessions.difference(bdays)):
        raise SystemExit("XNYS has weekend sessions in range - fixture format assumes none")
    closed = bdays.difference(sessions)
    early = cal.early_closes
    closes = cal.closes[early].dt.tz_convert(ZONE)
    # Nasdaq follows the NYSE holiday schedule; the same fixture covers XNAS.
    nas = xc.get_calendar("XNAS", start="1990-01-01", end=end)
    if len(nas.sessions.symmetric_difference(sessions[sessions >= "1990-01-01"])):
        raise SystemExit("XNAS sessions differ from XNYS since 1990")
    if len(nas.early_closes.symmetric_difference(early[early >= "1990-01-01"])):
        raise SystemExit("XNAS early closes differ from XNYS since 1990")
    if len(cal.late_opens):
        raise SystemExit(f"late opens not modeled: {list(cal.late_opens)}")
    for ymd in ("2026-11-26", "2026-12-25", "2026-04-03", "2012-10-29", "2025-01-09"):
        if pd.Timestamp(ymd) not in closed:
            raise SystemExit(f"expected {ymd} closed")
    for ymd in ("2026-10-12", "2026-11-11"):
        if pd.Timestamp(ymd) not in sessions:
            raise SystemExit(f"expected {ymd} open")
    return (xc.__version__,
            [d.date() for d in closed],
            {d.date(): (c.hour, c.minute) for d, c in zip(early, closes)})


# --- output ------------------------------------------------------------------------------

def q(text: str) -> str:
    return '"' + text.replace("\\", "\\\\").replace('"', '\\"') + '"'


def ymd(d: date) -> str:
    return f"({d.year} {d.month} {d.day})"


def main() -> int:
    rec = load_record()
    closed = record_closures(rec)
    early = record_early_closes(rec, closed)
    late = record_late_opens(rec, closed)
    version, ec_closed, ec_early = ec_part()

    # Sanity: the record's key days (#50).
    for d in (date(1963, 11, 25), date(1968, 4, 9), date(1969, 2, 10), date(1969, 3, 31),
              date(1969, 7, 21), date(1968, 11, 11), date(1964, 5, 29), date(1959, 7, 3)):
        if d not in closed:
            raise SystemExit(f"expected {d} closed")
    for d in (date(1953, 5, 29), date(1959, 5, 29), date(1965, 12, 31), date(1968, 11, 13),
              date(1968, 7, 3), date(1968, 9, 4), date(1969, 2, 12)):
        if d in closed:
            raise SystemExit(f"expected {d} open")
    wednesdays = [d for d, (n, _) in closed.items() if n == rec.PAPERWORK_NAME]
    if len(wednesdays) != 23:
        raise SystemExit(f"expected 23 paperwork Wednesdays, got {len(wednesdays)}")

    start = date(rec.FIRST_YEAR, 1, 1)
    all_closed = set(closed) | set(ec_closed)
    sessions = sum(1 for d in weekdays(start, END) if d not in all_closed)

    with OUT.open("w", encoding="utf-8") as fp:
        fp.write(";; XNYS gold, 1953-2030 (egao1980/cl-stack-calendars #11, #50). Regenerate:\n")
        fp.write(";;   uv run --no-project --with exchange_calendars==4.13.3 python -I "
                 "scripts/generate_xnys_gold.py\n")
        fp.write(";; 1953-1969: the NYSE's own record (scripts/xnys/nyse_record.py), every row with its\n")
        fp.write(";; source URL. 1970-2030: Python exchange_calendars XNYS (dates and close times).\n")
        fp.write(";; :closed = weekdays that are not sessions; every other weekday is one.\n")
        fp.write(";; :hours = regular hours by era (NYSE record); a session's close is its early close,\n")
        fp.write(";; its open its late open, when it has one.\n")
        fp.write("(\n")
        fp.write(f" :generated {q(GENERATED)}\n")
        fp.write(" :sources (\n")
        fp.write(f"   (:id \"nyse-record\" :from (1953 1 1) :to (1969 12 31) :uri {q(rec.NYSE_2011)}\n")
        fp.write(f"    :note {q(rec.START_NOTE)})\n")
        fp.write(f"   (:id \"exchange_calendars\" :calendar \"XNYS\" :version {q(version)}"
                 f" :license \"Apache-2.0\" :from (1970 1 1) :to (2030 12 31)"
                 f" :uri \"https://github.com/gerrymanoim/exchange_calendars\"))\n")
        fp.write(f" :saturday-policy (:from {ymd(rec.SATURDAY_POLICY)} :note {q(rec.SATURDAY_POLICY_NOTE)})\n")
        fp.write(f" :from {ymd(start)} :to {ymd(END)} :session-count {sessions}\n")
        fp.write(" :hours (\n")
        for first, last, (oh, om), (ch, cm), url, note in rec.HOURS:
            fp.write(f"   ({ymd(first)} {ymd(last) if last else 'nil'} ({oh} {om}) ({ch} {cm}) "
                     f"{q(url)} {q(note)})\n")
        fp.write(" )\n :closed (\n")
        for d in sorted(closed):
            name, urls = closed[d]
            fp.write(f"   ({d.year} {d.month} {d.day} {q(name)} {' '.join(q(u) for u in urls)})\n")
        for d in ec_closed:
            fp.write(f"   ({d.year} {d.month} {d.day})\n")
        fp.write(" )\n :early-closes (\n")
        for d in sorted(early):
            (h, m), url, note = early[d]
            fp.write(f"   ({ymd(d)} ({h} {m}) {q(url)} {q(note)})\n")
        for d in sorted(ec_early):
            h, m = ec_early[d]
            fp.write(f"   ({ymd(d)} ({h} {m}))\n")
        fp.write(" )\n :late-opens (\n")
        for d in sorted(late):
            (h, m), url, note = late[d]
            fp.write(f"   ({ymd(d)} ({h} {m}) {q(url)} {q(note)})\n")
        fp.write(" ))\n")
    print(f"wrote {OUT} sessions={sessions} closed={len(all_closed)} "
          f"(record {len(closed)}) early={len(early) + len(ec_early)} late={len(late)}",
          file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
