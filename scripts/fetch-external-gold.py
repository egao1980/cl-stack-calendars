#!/usr/bin/env python3
# /// script
# requires-python = ">=3.12"
# dependencies = ["holidays==0.82"]
# ///
"""Refresh data/tests/external-gold.sexp from official lists + vacanza/holidays.

Official (network):
  - gov.uk bank-holidays.json (England & Wales) — OGL v3
  - 内閣府 syukujitsu.csv (国民の祝日・休日, 1955–) — government work

Computational (offline once holidays is installed):
  - vacanza/holidays — independent of commenthol/date-holidays

Usage: uv run scripts/fetch-external-gold.py
"""

from __future__ import annotations

import csv
import io
import json
import subprocess
import sys
from datetime import UTC, datetime
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "data" / "tests" / "external-gold.sexp"

GOVUK_URI = "https://www.gov.uk/bank-holidays.json"
CAO_URI = "https://www8.cao.go.jp/chosei/shukujitsu/syukujitsu.csv"
VACANZA_URI = "https://github.com/vacanza/holidays"
VACANZA_VERSION = "0.82"

VACANZA_CALENDARS: list[tuple[str, str, bool]] = [
    # (our registry code, holidays country/market, financial?)
    ("USFED", "US", False),
    ("GBLO", "GB", False),
    ("JP", "JP", False),
    ("DE", "DE", False),
    ("FR", "FR", False),
    ("IT", "IT", False),
    ("ES", "ES", False),
    ("NL", "NL", False),
    ("AU", "AU", False),
    ("CA", "CA", False),
    ("BR", "BR", False),
    ("KR", "KR", False),
    ("HK", "HK", False),
    ("CH", "CH", False),
    ("TARGET", "ECB", True),
]

VACANZA_YEARS = tuple(range(2020, 2027))


def sexp_str(value: str) -> str:
    return '"' + value.replace("\\", "\\\\").replace('"', '\\"') + '"'


def curl_bytes(uri: str) -> bytes:
    proc = subprocess.run(["curl", "-fsSL", uri], check=True, capture_output=True)
    return proc.stdout


def write_days(out: io.TextIOBase, days: list[tuple[int, int, int, str]], indent: str) -> None:
    out.write(f"{indent}:days (\n")
    for year, month, day, name in days:
        out.write(f"{indent}  ({year} {month} {day} {sexp_str(name)})\n")
    out.write(f"{indent})\n")


def fetch_govuk() -> list[tuple[int, int, int, str]]:
    data = json.loads(curl_bytes(GOVUK_URI))
    events = data["england-and-wales"]["events"]
    days: list[tuple[int, int, int, str]] = []
    for event in events:
        year, month, day = (int(part) for part in event["date"].split("-"))
        days.append((year, month, day, event["title"]))
    days.sort()
    return days


def fetch_cao_jp() -> list[tuple[int, int, int, str]]:
    text = curl_bytes(CAO_URI).decode("cp932")
    reader = csv.reader(io.StringIO(text))
    next(reader, None)
    days: list[tuple[int, int, int, str]] = []
    for row in reader:
        if len(row) < 2:
            continue
        ymd, name = row[0].strip(), row[1].strip()
        year_s, month_s, day_s = ymd.split("/")
        days.append((int(year_s), int(month_s), int(day_s), name))
    days.sort()
    return days


def fetch_vacanza() -> dict[str, list[tuple[int, int, int, str]]]:
    import holidays

    blocks: dict[str, list[tuple[int, int, int, str]]] = {}
    for code, key, financial in VACANZA_CALENDARS:
        table = (
            holidays.financial_holidays(key, years=VACANZA_YEARS)
            if financial
            else holidays.country_holidays(key, years=VACANZA_YEARS)
        )
        days = [(dt.year, dt.month, dt.day, str(name)) for dt, name in sorted(table.items())]
        blocks[code] = days
    return blocks


def group_years(days: list[tuple[int, int, int, str]]) -> tuple[int, int]:
    years = [day[0] for day in days]
    return min(years), max(years)


def main() -> int:
    fetched = datetime.now(UTC).date().isoformat()
    govuk = fetch_govuk()
    cao = fetch_cao_jp()
    vacanza = fetch_vacanza()

    OUT.parent.mkdir(parents=True, exist_ok=True)
    with OUT.open("w", encoding="utf-8") as out:
        out.write(";; External holiday gold — regenerate: uv run scripts/fetch-external-gold.py\n")
        out.write(";; Official lists beat vacanza; vacanza is independent of date-holidays.\n")
        out.write("(\n")
        out.write(f" :generated {sexp_str(fetched)}\n")
        out.write(" :sources (\n")
        out.write("  (:id \"govuk\" :kind :official :calendar \"GBLO\" :year-bound t\n")
        out.write(f"   :uri {sexp_str(GOVUK_URI)} :license \"OGL-3.0\")\n")
        out.write("  (:id \"cao-jp\" :kind :official :calendar \"JP\"\n")
        out.write(f"   :uri {sexp_str(CAO_URI)} :license \"Japan-government-work\")\n")
        out.write("  (:id \"vacanza\" :kind :computational\n")
        out.write(f"   :uri {sexp_str(VACANZA_URI)} :version {sexp_str(VACANZA_VERSION)}\n")
        out.write("   :license \"MIT\")\n")
        out.write(" )\n")
        out.write(" :blocks (\n")

        lo, hi = group_years(govuk)
        out.write("  (:source \"govuk\" :calendar \"GBLO\" :year-bound t\n")
        out.write(f"   :from {lo} :to {hi} :compare :all\n")
        write_days(out, govuk, "   ")
        out.write("  )\n")

        lo, hi = group_years(cao)
        out.write("  (:source \"cao-jp\" :calendar \"JP\" :year-bound nil\n")
        out.write(f"   :from {lo} :to {hi} :compare :all\n")
        write_days(out, cao, "   ")
        out.write("  )\n")

        weekday_codes = {"USFED"}
        for code, days in vacanza.items():
            if not days:
                continue
            lo, hi = group_years(days)
            compare = ":weekdays" if code in weekday_codes else ":all"
            year_bound = "t" if code == "GBLO" else "nil"
            out.write(f"  (:source \"vacanza\" :calendar {sexp_str(code)} :year-bound {year_bound}\n")
            out.write(f"   :from {lo} :to {hi} :compare {compare}\n")
            write_days(out, days, "   ")
            out.write("  )\n")

        out.write(" )\n")
        out.write(")\n")

    print(f"wrote {OUT} govuk={len(govuk)} cao-jp={len(cao)} vacanza={sum(len(v) for v in vacanza.values())}")
    return 0


if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] in {"-h", "--help"}:
        print(__doc__)
        raise SystemExit(0)
    raise SystemExit(main())
