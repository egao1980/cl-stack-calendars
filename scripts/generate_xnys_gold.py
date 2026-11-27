#!/usr/bin/env python3
# /// script
# requires-python = ">=3.10"
# dependencies = [
#   "exchange_calendars>=4.13",
# ]
# ///
"""Build data/tests/xnys-gold.sexp — NYSE sessions + early closes (1970–2030) from
the Python `exchange_calendars` XNYS calendar (Apache-2.0).

Only dates and close times are frozen; no source is vendored. Regenerate:

    uv run --no-project --with exchange_calendars python -I scripts/generate_xnys_gold.py

The fixture lists every weekday that is NOT a session (closures) plus every
early close; the session count is a checksum, so the test can compare every
session date in the range without storing ~10k rows.
"""

from __future__ import annotations

import sys
from datetime import date
from pathlib import Path

import exchange_calendars as xc
import pandas as pd

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "data" / "tests" / "xnys-gold.sexp"
# exchange_calendars builds regular holidays with pandas AbstractHolidayCalendar,
# whose rules start in 1970: before that it lists adhoc closures only (1954-01-01
# is a "session"), so the gold starts in 1970.
START, END = "1970-01-01", "2030-12-31"
ZONE = "America/New_York"


def main() -> int:
    cal = xc.get_calendar("XNYS", start=START, end=END)
    sessions = cal.sessions
    weekdays = pd.bdate_range(START, END)
    if len(sessions.difference(weekdays)):
        raise SystemExit("XNYS has weekend sessions in range — fixture format assumes none")
    closed = weekdays.difference(sessions)
    early = cal.early_closes
    closes = cal.closes[early].dt.tz_convert(ZONE)
    # Nasdaq follows the NYSE holiday schedule; the same fixture covers XNAS.
    nas = xc.get_calendar("XNAS", start="1990-01-01", end=END)
    if len(nas.sessions.symmetric_difference(sessions[sessions >= "1990-01-01"])):
        raise SystemExit("XNAS sessions differ from XNYS since 1990")
    if len(nas.early_closes.symmetric_difference(early[early >= "1990-01-01"])):
        raise SystemExit("XNAS early closes differ from XNYS since 1990")
    late = cal.late_opens
    if len(late):
        raise SystemExit(f"late opens not modeled: {list(late)}")
    # Sanity: known NYSE closures (issue #11).
    for ymd in ("2026-11-26", "2026-12-25", "2026-04-03", "2012-10-29", "2025-01-09"):
        if pd.Timestamp(ymd) not in closed:
            raise SystemExit(f"expected {ymd} closed")
    for ymd in ("2026-10-12", "2026-11-11"):
        if pd.Timestamp(ymd) not in sessions:
            raise SystemExit(f"expected {ymd} open")

    OUT.parent.mkdir(parents=True, exist_ok=True)
    with OUT.open("w", encoding="utf-8") as fp:
        fp.write(";; XNYS gold from Python exchange_calendars — regenerate:\n")
        fp.write(";;   uv run --no-project --with exchange_calendars python -I "
                 "scripts/generate_xnys_gold.py\n")
        fp.write(";; :closed = weekdays that are not sessions; every other weekday is one.\n")
        fp.write("(\n")
        fp.write(f" :generated \"{date.today().isoformat()}\"\n")
        fp.write(f" :source (:id \"exchange_calendars\" :calendar \"XNYS\""
                 f" :version \"{xc.__version__}\" :license \"Apache-2.0\""
                 f" :uri \"https://github.com/gerrymanoim/exchange_calendars\")\n")
        fp.write(f" :from (1970 1 1) :to (2030 12 31) :session-count {len(sessions)}\n")
        fp.write(" :closed (\n")
        for d in closed:
            fp.write(f"   ({d.year} {d.month} {d.day})\n")
        fp.write(" )\n")
        fp.write(" :early-closes (\n")
        for d, c in zip(early, closes):
            fp.write(f"   (({d.year} {d.month} {d.day}) ({c.hour} {c.minute}))\n")
        fp.write(" ))\n")
    print(f"wrote {OUT} sessions={len(sessions)} closed={len(closed)} early={len(early)}",
          file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
