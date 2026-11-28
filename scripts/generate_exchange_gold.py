#!/usr/bin/env python3
# /// script
# requires-python = ">=3.10"
# dependencies = [
#   "exchange_calendars>=4.13",
#   "pandas<3",
# ]
# ///
"""Build data/tests/exchanges/<MIC>-gold.sexp: sessions, regular hours,
early closes and late opens of one MIC from Python `exchange_calendars`
(Apache-2.0). A broad cross-check only: the exchange's own notices win, and
every difference is recorded in tests/exchange-gold-test.lisp.

Only dates and times are frozen; no source is vendored. Regenerate:

    uv run --no-project --with exchange_calendars --with 'pandas<3' \\
      python -I scripts/generate_exchange_gold.py XLON XPAR ...

(pandas 3 breaks the ASEX calendar's offsets, hence the pin.)

Each fixture lists
  :closed            Monday-Friday dates that are not sessions;
  :weekend-sessions  Saturday/Sunday dates that are sessions;
  :hours             runs (FROM TO OPEN BREAK-START BREAK-END CLOSE) of the
                     regular local hours (no early close / late open);
  :early-closes      ((Y M D) (H M)) local close;
  :late-opens        ((Y M D) (H M)) local open.
:session-count is a checksum over the whole range.
"""

from __future__ import annotations

import sys
from datetime import date
from pathlib import Path

import exchange_calendars as xc
import pandas as pd

ROOT = Path(__file__).resolve().parents[1]
OUT_DIR = ROOT / "data" / "tests" / "exchanges"

# MIC -> (exchange_calendars name, start, end). The start is the first year
# with an exchange holiday list (earlier years are unverified, see the
# calendar's :gaps); the end is past the library's default (today + 1 year)
# where its tables allow; calendars whose holidays are only "recorded" to a
# year stop there.
CALENDARS = {
    "XLON": ("XLON", "2003-01-01", "2028-12-31"),
    "XDUB": ("XDUB", "2019-02-04", "2028-12-31"),
    "XAMS": ("XAMS", "2001-01-01", "2028-12-31"),
    "XBRU": ("XBRU", "2001-01-01", "2028-12-31"),
    "XLIS": ("XLIS", "2003-01-01", "2028-12-31"),
    "XPAR": ("XPAR", "2000-01-01", "2028-12-31"),
    "XMIL": ("XMIL", "2010-01-01", "2028-12-31"),
    "XMAD": ("XMAD", "2024-01-01", "2028-12-31"),
    "XETR": ("XETR", "2003-01-01", "2028-12-31"),
    "XEUR": ("XEUR", "2012-01-01", "2028-12-31"),
    "XEEE": ("XEEE", "2025-01-01", "2028-12-31"),
    "XSWX": ("XSWX", "2012-01-01", "2028-12-31"),
    "XWBO": ("XWBO", "2019-01-01", "2028-12-31"),
    "XSTO": ("XSTO", "2008-01-01", "2028-12-31"),
    "XCSE": ("XCSE", "2003-01-01", "2028-12-31"),
    "XHEL": ("XHEL", "2008-01-01", "2028-12-31"),
    "XICE": ("XICE", "2008-01-01", "2028-12-31"),
    "XOSL": ("XOSL", "2006-01-01", "2028-12-31"),
    "XWAR": ("XWAR", "2011-01-01", "2028-12-31"),
    "XBUD": ("XBUD", "2018-01-01", "2028-12-31"),
    "XPRA": ("XPRA", "2017-01-01", "2028-12-31"),
    "XATH": ("ASEX", "2000-01-01", "2028-12-31"),
    "XIST": ("XIST", "2016-11-14", "2026-12-31"),
    "XTKS": ("XTKS", "2000-01-01", "2028-12-31"),
    "XHKG": ("XHKG", "2000-01-01", "2028-12-31"),
    "XSHG": ("XSHG", "2003-01-01", "2026-12-31"),
    "XSHE": ("XSHG", "2004-01-01", "2026-12-31"),
    "XASX": ("XASX", "2000-01-01", "2028-12-31"),
    "XNSE": ("XBOM", "2009-01-01", "2026-12-31"),
    "XBOM": ("XBOM", "2009-01-01", "2026-12-31"),
    "XKRX": ("XKRX", "2000-01-01", "2028-12-31"),
    "XTAI": ("XTAI", "2000-01-01", "2028-12-31"),
    "XSES": ("XSES", "2000-01-01", "2026-12-31"),
    "XKLS": ("XKLS", "2000-01-01", "2028-12-31"),
    "XIDX": ("XIDX", "2000-01-01", "2028-12-31"),
    "XPHS": ("XPHS", "2000-01-01", "2028-12-31"),
    "XBKK": ("XBKK", "2000-01-01", "2028-12-31"),
    "BVMF": ("BVMF", "2000-01-01", "2028-12-31"),
    "XTSE": ("XTSE", "2000-01-01", "2028-12-31"),
    "XSAU": ("XSAU", "2021-01-01", "2026-12-31"),
    "XTAE": ("XTAE", "2000-01-01", "2028-12-31"),
}


def ymd(d) -> str:
    return f"({d.year} {d.month} {d.day})"


def hm(t) -> str:
    return f"({t.hour} {t.minute})"


def local(series: pd.Series, zone: str) -> pd.Series:
    return series.dt.tz_convert(zone)


def build(mic: str) -> None:
    name, start, end = CALENDARS[mic]
    cal = xc.get_calendar(name, start=start, end=end)
    zone = str(cal.tz)
    sessions = cal.sessions
    days = pd.date_range(start, end, freq="D")
    weekday = days[days.dayofweek < 5]
    closed = weekday.difference(sessions)
    weekend_sessions = sessions[sessions.dayofweek >= 5]
    opens = local(cal.opens, zone)
    closes = local(cal.closes, zone)
    has_breaks = cal.break_starts.notna().any()
    bstarts = local(cal.break_starts, zone) if has_breaks else None
    bends = local(cal.break_ends, zone) if has_breaks else None
    early = cal.early_closes
    late = cal.late_opens
    special = set(early) | set(late)

    runs = []  # [from, to, (open, bs, be, close)]
    for s in sessions:
        if s in special:
            continue
        o = opens[s].time()
        c = closes[s].time()
        bs = be = None
        if has_breaks and pd.notna(bstarts[s]):
            bs, be = bstarts[s].time(), bends[s].time()
        key = (o, bs, be, c)
        if runs and runs[-1][2] == key:
            runs[-1][1] = s
        else:
            runs.append([s, s, key])

    OUT_DIR.mkdir(parents=True, exist_ok=True)
    out = OUT_DIR / f"{mic}-gold.sexp"
    with out.open("w", encoding="utf-8") as fp:
        fp.write(f";; {mic} gold from Python exchange_calendars {name} — regenerate:\n")
        fp.write(";;   uv run --no-project --with exchange_calendars --with 'pandas<3' "
                 f"python -I scripts/generate_exchange_gold.py {mic}\n")
        fp.write(";; A cross-check, not the authority: see tests/exchange-gold-test.lisp.\n")
        fp.write("(\n")
        fp.write(f" :generated \"{date.today().isoformat()}\"\n")
        fp.write(f" :source (:id \"exchange_calendars\" :calendar \"{name}\""
                 f" :version \"{xc.__version__}\" :license \"Apache-2.0\""
                 f" :uri \"https://github.com/gerrymanoim/exchange_calendars\")\n")
        fp.write(f" :mic \"{mic}\" :zone \"{zone}\"\n")
        s0, s1 = pd.Timestamp(start), pd.Timestamp(end)
        fp.write(f" :from {ymd(s0)} :to {ymd(s1)} :session-count {len(sessions)}\n")
        fp.write(" :closed (\n")
        for d in closed:
            fp.write(f"   {ymd(d)}\n")
        fp.write(" )\n :weekend-sessions (\n")
        for d in weekend_sessions:
            fp.write(f"   {ymd(d)}\n")
        fp.write(" )\n :hours (\n")
        for a, b, (o, bs, be, c) in runs:
            brk = f"{hm(bs)} {hm(be)}" if bs is not None else "nil nil"
            fp.write(f"   ({ymd(a)} {ymd(b)} {hm(o)} {brk} {hm(c)})\n")
        fp.write(" )\n :early-closes (\n")
        for d in early:
            fp.write(f"   ({ymd(d)} {hm(closes[d].time())})\n")
        fp.write(" )\n :late-opens (\n")
        for d in late:
            fp.write(f"   ({ymd(d)} {hm(opens[d].time())})\n")
        fp.write(" ))\n")
    print(f"{mic}: sessions={len(sessions)} closed={len(closed)} weekend={len(weekend_sessions)}"
          f" runs={len(runs)} early={len(early)} late={len(late)}", file=sys.stderr)


def main(argv: list[str]) -> int:
    mics = argv or sorted(CALENDARS)
    for mic in mics:
        build(mic)
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
