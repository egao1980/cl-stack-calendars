#!/usr/bin/env python3
# /// script
# requires-python = ">=3.10"
# dependencies = [
#   "beautifulsoup4>=4.12",
# ]
# ///
"""Build data/tests/ru-production-calendar-gold.sexp: the Russian production
calendar (five-day week) for every day 2000-2027, frozen as external gold.

Regenerate:

    uv run --no-project --with beautifulsoup4 python -I scripts/generate_ru_production_gold.py

Sources (work / non-work status of each day):

* 2010-2027: КонсультантПлюс production calendars,
  https://www.consultant.ru/law/ref/calendar/proizvodstvennye/YYYY/
  (a cell with class "weekend" is a non-working day).
* 2000-2009: «Производственный календарь» open data set of the Аналитический
  центр при Правительстве РФ on data.gov.ru (dataset 7708660670-proizvcalendar,
  version 20180410T1145), read from its Wayback Machine copy because data.gov.ru
  no longer serves it. It lists the non-working days of each month; "*" marks a
  shortened pre-holiday working day. The same set is compared with КонсультантПлюс
  for 2010-2017 and must agree, or the script stops.

Where a production calendar and a normative act disagree, the act wins
(DECREE_OVERRIDES below, each with its citation); the fixture records them.

Codes, one character per day of the year:

  W  working day
  R  rest day that is not a holiday (an ordinary or transferred weekend day,
     including a Saturday or Sunday that is only non-working)
  H  holiday: a нерабочий праздничный день of the ТК / КЗоТ edition in force
     (on any weekday), or any non-working Monday-Friday (an automatic ст. 112
     ч. 2 transfer or a decree transfer)

The H/R split on Saturdays and Sundays comes from STATUTORY_HOLIDAYS (the
statute), not from the calendars: neither source marks a weekend holiday.
"""

from __future__ import annotations

import csv
import gzip
import io
import sys
import time
import urllib.request
from datetime import date, timedelta
from pathlib import Path

from bs4 import BeautifulSoup

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "data" / "tests" / "ru-production-calendar-gold.sexp"
CACHE = Path.home() / ".cache" / "cl-stack-calendars" / "ru-production"

FIRST, LAST = 2000, 2027
CONSULTANT_FROM = 2010
CONSULTANT_URL = "https://www.consultant.ru/law/ref/calendar/proizvodstvennye/{year}/"
# КонсультантПлюс now redirects these years to another year's page; their
# calendars are read from pinned Wayback Machine copies instead.
CONSULTANT_WAYBACK = {
    2020: "https://web.archive.org/web/20211027201603id_/"
          "https://www.consultant.ru/law/ref/calendar/proizvodstvennye/2020/",
    2024: "https://web.archive.org/web/20241225060000id_/"
          "https://www.consultant.ru/law/ref/calendar/proizvodstvennye/2024/",
}
DATAGOV_URL = ("http://data.gov.ru/opendata/7708660670-proizvcalendar/"
               "data-20180410T1145-structure-20180410T1145.csv")
DATAGOV_WAYBACK = ("https://web.archive.org/web/20190428222435id_/"
                   "http://data.gov.ru:80/opendata/7708660670-proizvcalendar/"
                   "data-20180410T1145-structure-20180410T1145.csv")
# The data set's own rows after 2017 are projections, so it is compared only here.
DATAGOV_CHECK_YEARS = range(CONSULTANT_FROM, 2018)

# Нерабочие праздничные дни by edition, as (first year, last year, [(m, d)...]).
STATUTORY_HOLIDAYS = [
    # КЗоТ РСФСР ст. 65 (ред. Закона РФ от 25.09.1992 № 3543-1 и Указа от 07.10.1993):
    # 1-2 Jan, 7 Jan, 8 Mar, 1-2 May, 9 May, 12 Jun, 7 Nov, 12 Dec.
    (2000, 2001, [(1, 1), (1, 2), (1, 7), (3, 8), (5, 1), (5, 2), (5, 9),
                  (6, 12), (11, 7), (12, 12)]),
    # ТК РФ ст. 112 (ред. 30.12.2001, in force 01.02.2002): adds 23 Feb.
    (2002, 2004, [(1, 1), (1, 2), (1, 7), (2, 23), (3, 8), (5, 1), (5, 2),
                  (5, 9), (6, 12), (11, 7), (12, 12)]),
    # ТК РФ ст. 112 (ред. ФЗ от 29.12.2004 № 201-ФЗ, from 2005): 1-5 Jan,
    # 4 Nov; 2 May, 7 Nov, 12 Dec dropped.
    (2005, 2012, [(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 7), (2, 23),
                  (3, 8), (5, 1), (5, 9), (6, 12), (11, 4)]),
    # ТК РФ ст. 112 (ред. ФЗ от 23.04.2012 № 35-ФЗ, from 2013): 1-6 and 8 Jan.
    (2013, 9999, [(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7),
                  (1, 8), (2, 23), (3, 8), (5, 1), (5, 9), (6, 12), (11, 4)]),
]

# Days where the production calendar disagrees with a normative act; the act
# wins. (date, non-working?, citation, source that disagrees).
DECREE_OVERRIDES = [
    (date(2000, 5, 6), False,
     "ФЗ от 25.12.1999 № 217-ФЗ ст. 1: с субботы 6 мая на понедельник 8 мая 2000 г.",
     "data.gov.ru"),
    (date(2000, 5, 8), True,
     "ФЗ от 25.12.1999 № 217-ФЗ ст. 1: с субботы 6 мая на понедельник 8 мая 2000 г.",
     "data.gov.ru"),
    (date(2000, 11, 4), False,
     "ФЗ от 25.12.1999 № 217-ФЗ ст. 1: с субботы 4 ноября на понедельник 6 ноября 2000 г.",
     "data.gov.ru"),
    (date(2000, 11, 6), True,
     "ФЗ от 25.12.1999 № 217-ФЗ ст. 1: с субботы 4 ноября на понедельник 6 ноября 2000 г.",
     "data.gov.ru"),
    (date(2000, 12, 9), False,
     "ФЗ от 25.12.1999 № 217-ФЗ ст. 1: с субботы 9 декабря на понедельник 11 декабря 2000 г.",
     "data.gov.ru"),
    (date(2000, 12, 11), True,
     "ФЗ от 25.12.1999 № 217-ФЗ ст. 1: с субботы 9 декабря на понедельник 11 декабря 2000 г.",
     "data.gov.ru"),
    (date(2001, 3, 11), False,
     "ПП РФ от 02.02.2001 № 84: «с воскресенья 11 марта на пятницу 9 марта; с субботы 28 апреля на понедельник 30 апреля; с субботы 9 июня на понедельник 11 июня; с субботы 29 декабря на понедельник 31 декабря»",
     "data.gov.ru"),
    (date(2001, 3, 9), True,
     "ПП РФ от 02.02.2001 № 84: «с воскресенья 11 марта на пятницу 9 марта; с субботы 28 апреля на понедельник 30 апреля; с субботы 9 июня на понедельник 11 июня; с субботы 29 декабря на понедельник 31 декабря»",
     "data.gov.ru"),
    (date(2001, 4, 28), False,
     "ПП РФ от 02.02.2001 № 84: «с воскресенья 11 марта на пятницу 9 марта; с субботы 28 апреля на понедельник 30 апреля; с субботы 9 июня на понедельник 11 июня; с субботы 29 декабря на понедельник 31 декабря»",
     "data.gov.ru"),
    (date(2001, 4, 30), True,
     "ПП РФ от 02.02.2001 № 84: «с воскресенья 11 марта на пятницу 9 марта; с субботы 28 апреля на понедельник 30 апреля; с субботы 9 июня на понедельник 11 июня; с субботы 29 декабря на понедельник 31 декабря»",
     "data.gov.ru"),
    (date(2001, 6, 9), False,
     "ПП РФ от 02.02.2001 № 84: «с воскресенья 11 марта на пятницу 9 марта; с субботы 28 апреля на понедельник 30 апреля; с субботы 9 июня на понедельник 11 июня; с субботы 29 декабря на понедельник 31 декабря»",
     "data.gov.ru"),
    (date(2001, 6, 11), True,
     "ПП РФ от 02.02.2001 № 84: «с воскресенья 11 марта на пятницу 9 марта; с субботы 28 апреля на понедельник 30 апреля; с субботы 9 июня на понедельник 11 июня; с субботы 29 декабря на понедельник 31 декабря»",
     "data.gov.ru"),
    (date(2001, 12, 29), False,
     "ПП РФ от 02.02.2001 № 84: «с воскресенья 11 марта на пятницу 9 марта; с субботы 28 апреля на понедельник 30 апреля; с субботы 9 июня на понедельник 11 июня; с субботы 29 декабря на понедельник 31 декабря»",
     "data.gov.ru"),
    (date(2001, 12, 31), True,
     "ПП РФ от 02.02.2001 № 84: «с воскресенья 11 марта на пятницу 9 марта; с субботы 28 апреля на понедельник 30 апреля; с субботы 9 июня на понедельник 11 июня; с субботы 29 декабря на понедельник 31 декабря»",
     "data.gov.ru"),
    (date(2005, 5, 14), False,
     "ПП РФ от 28.04.2005 № 262: «с субботы 14 мая на вторник 10 мая» (garant.ru: календарь «представлен без учета данного постановления»)",
     "data.gov.ru"),
    (date(2005, 5, 10), True,
     "ПП РФ от 28.04.2005 № 262: «с субботы 14 мая на вторник 10 мая» (garant.ru: календарь «представлен без учета данного постановления»)",
     "data.gov.ru"),
]


def fetch(url: str, name: str, fallback: str | None = None) -> bytes:
    """URL's body, cached under CACHE/NAME; FALLBACK (a Wayback copy) if it fails."""
    CACHE.mkdir(parents=True, exist_ok=True)
    path = CACHE / name
    if path.exists() and path.stat().st_size > 0:
        return path.read_bytes()
    last = None
    for u in [url] + ([fallback] if fallback else []):
        for attempt in range(3):
            try:
                req = urllib.request.Request(u, headers={"User-Agent": "Mozilla/5.0"})
                with urllib.request.urlopen(req, timeout=60) as r:
                    body = r.read()
                if body[:2] == b"\x1f\x8b":  # Wayback serves some copies gzipped
                    body = gzip.decompress(body)
                path.write_bytes(body)
                return body
            except Exception as exc:  # noqa: BLE001 - report and retry
                last = exc
                time.sleep(2 * (attempt + 1))
    raise SystemExit(f"cannot fetch {url}: {last}")


def consultant_year(year: int) -> dict[date, bool]:
    """Day -> non-working? from the КонсультантПлюс production calendar."""
    url = CONSULTANT_WAYBACK.get(year) or CONSULTANT_URL.format(year=year)
    html = fetch(url, f"consultant-{year}.html")
    soup = BeautifulSoup(html.decode("utf-8"), "html.parser")
    title = soup.title.get_text() if soup.title else ""
    if str(year) not in title:
        raise SystemExit(f"consultant {year}: page is {title!r} ({url})")
    tables = soup.find_all("table", class_="cal")
    if len(tables) != 12:
        raise SystemExit(f"consultant {year}: {len(tables)} month tables")
    out: dict[date, bool] = {}
    for month, table in enumerate(tables, start=1):
        for row in table.find("tbody").find_all("tr"):
            for col, cell in enumerate(row.find_all("td")):
                classes = cell.get("class") or []
                text = cell.get_text(strip=True).rstrip("*")
                if "inactively" in classes or not text:
                    continue
                d = date(year, month, int(text))
                if d.weekday() != col:
                    raise SystemExit(f"consultant {d}: weekday column {col}")
                out[d] = "weekend" in classes or "holiday" in classes
    _check_complete(out, year, "consultant")
    return out


def datagov_years() -> dict[int, dict[date, bool]]:
    """Year -> day -> non-working? from the data.gov.ru data set."""
    body = fetch(DATAGOV_URL, "datagov-20180410T1145.csv", DATAGOV_WAYBACK)
    rows = list(csv.reader(io.StringIO(body.decode("utf-8-sig"))))
    out: dict[int, dict[date, bool]] = {}
    for row in rows[1:]:
        year = int(row[0])
        days = {date(year, 1, 1) + timedelta(n): False
                for n in range((date(year + 1, 1, 1) - date(year, 1, 1)).days)}
        for month in range(1, 13):
            for item in row[month].split(","):
                item = item.strip()
                if not item or item.endswith("*"):  # "*" = shortened working day
                    continue
                days[date(year, month, int(item.rstrip("+")))] = True
        out[year] = days
    return out


def _check_complete(days: dict[date, bool], year: int, src: str) -> None:
    n = (date(year + 1, 1, 1) - date(year, 1, 1)).days
    if len(days) != n:
        raise SystemExit(f"{src} {year}: {len(days)} days, expected {n}")


def statutory(d: date) -> bool:
    for lo, hi, mds in STATUTORY_HOLIDAYS:
        if lo <= d.year <= hi:
            return (d.month, d.day) in mds
    return False


def code(d: date, nonworking: bool) -> str:
    if not nonworking:
        if statutory(d):
            raise SystemExit(f"{d}: statutory holiday marked as a working day")
        return "W"
    if statutory(d) or d.weekday() < 5:
        return "H"
    return "R"


def main() -> int:
    datagov = datagov_years()
    years: dict[int, dict[date, bool]] = {}
    for y in range(FIRST, LAST + 1):
        years[y] = consultant_year(y) if y >= CONSULTANT_FROM else dict(datagov[y])
        _check_complete(years[y], y, "gold")
    # Cross-check the two calendars where both are authoritative.
    disagree = [(d, years[y][d], datagov[y][d])
                for y in DATAGOV_CHECK_YEARS for d in sorted(years[y])
                if years[y][d] != datagov[y][d]]
    if disagree:
        for d, c, g in disagree:
            print(f"consultant {d} non-working={c}, data.gov.ru {g}", file=sys.stderr)
        raise SystemExit("КонсультантПлюс and data.gov.ru disagree")
    applied = []
    for d, nonworking, cite, src in DECREE_OVERRIDES:
        if years[d.year][d] == nonworking:
            raise SystemExit(f"override {d} is a no-op: {src} already agrees")
        years[d.year][d] = nonworking
        applied.append((d, nonworking, cite, src))

    OUT.parent.mkdir(parents=True, exist_ok=True)
    with OUT.open("w", encoding="utf-8") as fp:
        fp.write(";; Russian production calendar (five-day week) 2000-2027: external gold.\n")
        fp.write(";; Regenerate: uv run --no-project --with beautifulsoup4 python -I "
                 "scripts/generate_ru_production_gold.py\n")
        fp.write(";; :years maps YEAR to one code per day from 1 January:\n")
        fp.write(";;   W working day, R rest day that is not a holiday, H holiday (a statutory\n")
        fp.write(";;   нерабочий праздничный день, or any non-working Monday-Friday).\n")
        fp.write(";; The H/R split on Sat/Sun follows the ТК/КЗоТ holiday list in force\n")
        fp.write(";; (see the script); the work/non-work status comes from the sources.\n")
        fp.write("(\n")
        fp.write(f" :generated \"{date.today().isoformat()}\"\n")
        fp.write(" :from 2000 :to 2027\n")
        fp.write(" :sources\n")
        fp.write(f" ((:years (2000 2009) :id \"data.gov.ru 7708660670-proizvcalendar\""
                 f" :owner \"Аналитический центр при Правительстве РФ\""
                 f" :uri \"{DATAGOV_URL}\" :copy \"{DATAGOV_WAYBACK}\")\n")
        fp.write(f"  (:years ({CONSULTANT_FROM} {LAST}) :id \"КонсультантПлюс\""
                 f" :uri \"{CONSULTANT_URL.format(year='YYYY')}\"")
        for y, u in sorted(CONSULTANT_WAYBACK.items()):
            fp.write(f"\n   :copy-{y} \"{u}\"")
        fp.write("))\n")
        fp.write(" :decree-overrides\n (")
        for i, (d, nonworking, cite, src) in enumerate(applied):
            sep = "\n  " if i else ""
            fp.write(f"{sep}(({d.year} {d.month} {d.day}) {':non-working' if nonworking else ':working'}"
                     f" \"{cite}\" :overrides \"{src}\")")
        fp.write(")\n")
        fp.write(" :years\n (")
        for i, y in enumerate(range(FIRST, LAST + 1)):
            s = "".join(code(d, years[y][d]) for d in sorted(years[y]))
            sep = "\n  " if i else ""
            fp.write(f"{sep}({y} \"{s}\")")
        fp.write(")\n)\n")
    print(f"wrote {OUT.relative_to(ROOT)}: {LAST - FIRST + 1} years, "
          f"{len(applied)} decree overrides")
    return 0


if __name__ == "__main__":
    sys.exit(main())
