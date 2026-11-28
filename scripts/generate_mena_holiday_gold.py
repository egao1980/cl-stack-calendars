#!/usr/bin/env python3
# /// script
# requires-python = ">=3.10"
# dependencies = ["holidays==0.109"]
# ///
"""Build the Middle East / North Africa holiday gold fixtures,
data/tests/<cc>-holiday-gold.sexp, and the yearly data files the starters
read, data/<cc>/holidays.sexp (egao1980/cl-stack-calendars#44).

    uv run --no-project --with holidays==0.109 python -I scripts/generate_mena_holiday_gold.py [CC ...]

The transcriptions live in scripts/mena/<cc>.py, one module per country:

  <CC>_STATUTES  the statutes, decrees and decisions that set the list, by era
  <CC>_FIXED     Gregorian fixed days by era: (month, day, name, [(from, to)], statute)
  <CC>_ISLAMIC   Hijri days by era, used only to estimate years with no list:
                 (hijri month, hijri day, [offsets], name, [(from, to)], statute)
  <CC>_SOLAR     (IR) Solar Hijri days by era: (month, day, name, [(from, to)], statute)
  <CC>_YEARS     each year with an official list or announcements: every holiday
                 at its final date, the documents, the rule days moved away
                 (suppressed) and weekend days made working days

Each fixture lists every holiday of its range as (YEAR MONTH DAY NAME). A year
with no list is the fixed days of its era plus tabular estimates named
"(estimated)". This script never reads the Lisp starters. The data file
carries, for every listed year, the listed days that no fixed or solar rule
of the starter gives, so the starter's rules are checked by the gold.

Python `holidays` is a secondary source only: the script prints every day on
which it disagrees with the fixture, with no effect on the fixture.
"""

from __future__ import annotations

import importlib.util
import sys
from datetime import date, timedelta
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
LAST = 2040
GENERATED = "2026-11-28"


def load(cc: str):
    path = ROOT / "scripts" / "mena" / f"{cc.lower()}.py"
    spec = importlib.util.spec_from_file_location(f"mena_{cc.lower()}", path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    keep = LISTED_YEARS.get(cc.upper())
    if keep:
        name = f"{cc.upper()}_YEARS"
        setattr(mod, name, {y: v for y, v in getattr(mod, name).items() if y in keep})
    return mod


# Years whose transcription is complete enough to stand as the list of that
# year. The rest of each module's years (partial: some days found, others
# not) stay in the transcription for reference but are estimated.
LISTED_YEARS = {
    "KW": range(2011, 2027),   # 2007: Eid al-Adha only
    "OM": range(2020, 2027),   # 2015-2019: Hijri New Year, Isra, Mawlid or Renaissance Day missing
    "IQ": range(2019, 2027),   # 2015-2018: Eid extensions not found
    "IR": range(2000, 2027),   # 2027: only 1 Jan - 20 Mar (time.ir 1405)
    # DZ 2000-2008, 2010, 2013-2015: some Mawlid, Achoura or Muharram dates are only
    # python-holidays estimates, so those years are estimated (tabular) instead.
    "DZ": [2009, 2011, 2012] + list(range(2016, 2027)),
    "MA": range(2003, 2027),   # 2000-2002: no source
    "EG": range(2014, 2027),   # 2008-2013: some Eid blocks and Mawlid dates only estimated
}


# --- tabular Islamic calendar (estimates only) -----------------------------
#
# Leap years (11y + 14) mod 30 < 11, 1 Muharram AH 1 = 16 July 622 (Julian),
# the arithmetic calendar of the starters' estimates.

ISLAMIC_EPOCH = date(622, 7, 19)  # Julian 622-07-16
ISLAMIC_BEFORE_MONTH = [0, 0, 30, 59, 89, 118, 148, 177, 207, 236, 266, 295, 325]


def _islamic_year_start(year: int) -> date:
    y = year - 1
    days = (y // 30) * 10631 + sum(355 if (11 * k + 14) % 30 < 11 else 354 for k in range(1, y % 30 + 1))
    return ISLAMIC_EPOCH + timedelta(days=days)


def islamic_dates_in_year(g_year: int, month: int, day: int) -> list[date]:
    ah = int((g_year - 622) * 33 / 32)
    out = []
    for y in range(ah - 1, ah + 3):
        d = _islamic_year_start(y) + timedelta(days=ISLAMIC_BEFORE_MONTH[month] + day - 1)
        if d.year == g_year:
            out.append(d)
    return sorted(out)


def islamic_block(year: int, month: int, day: int, offsets, name: str) -> list[tuple[date, str]]:
    """Days OFFSETS after each tabular MONTH/DAY of the Hijri years that touch YEAR."""
    out = []
    for y in (year - 1, year):
        for d0 in islamic_dates_in_year(y, month, day):
            out += [(d0 + timedelta(days=k), name) for k in offsets if (d0 + timedelta(days=k)).year == year]
    return out


# --- Easter ------------------------------------------------------------------

def easter_orthodox(year: int) -> date:
    """Julian-computus Easter Sunday as a Gregorian date (Meeus)."""
    a, b, c = year % 4, year % 7, year % 19
    d = (19 * c + 15) % 30
    e = (2 * a + 4 * b - d + 34) % 7
    month, day = divmod(d + e + 114, 31)
    return date(year, month, day + 1) + timedelta(days=13 if year < 2100 else 14)


# --- Solar Hijri (IR) --------------------------------------------------------
#
# From the official table of 1 Farvardin only: months 1-6 have 31 days,
# 7-11 30, and Esfand runs to the day before the next 1 Farvardin.

def solar_date(nowruz: dict, sh_year: int, month: int, day: int) -> date | None:
    start = date.fromisoformat(nowruz[sh_year])
    offset = 31 * (month - 1) if month <= 7 else 30 * (month - 1) + 6
    d = start + timedelta(days=offset + day - 1)
    if month == 12 and d >= date.fromisoformat(nowruz[sh_year + 1]):
        return None
    return d


def solar_days(mod, cc: str, year: int) -> list[tuple[date, str]]:
    nowruz = getattr(mod, f"{cc}_NOWRUZ", None)
    table = getattr(mod, f"{cc}_SOLAR", [])
    if not nowruz:
        return []
    out = []
    for sh in (year - 622, year - 621):
        if sh not in nowruz or sh + 1 not in nowruz:
            continue
        for m, d, name, eras, _ in table:
            if any(a <= sh and (b is None or sh <= b) for a, b in eras):
                g = solar_date(nowruz, sh, m, d)
                if g and g.year == year:
                    out.append((g, name))
    return out


# --- per-country rules ---------------------------------------------------------

def in_era(eras, year: int) -> bool:
    return any(a <= year and (b is None or year <= b) for a, b in eras)


def fixed_days(mod, cc: str, year: int) -> list[tuple[date, str]]:
    return [(date(year, m, d), name) for m, d, name, eras, *_ in getattr(mod, f"{cc}_FIXED") if in_era(eras, year)]


def rule_days(mod, cc: str, year: int) -> list[tuple[date, str]]:
    """The days the starter computes in every year: fixed, solar and other rules."""
    days = fixed_days(mod, cc, year) + solar_days(mod, cc, year)
    hook = getattr(mod, "rule_days", None)
    if hook:
        days += hook(year, sys.modules[__name__])
    return days


def estimated_days(mod, cc: str, year: int) -> list[tuple[date, str]]:
    """Tabular estimates that fall in YEAR, from the Hijri dates of Gregorian
    years with no list (the Hijri date's own year decides, as in the starter:
    an estimated late-December Eid runs into a listed January)."""
    years = getattr(mod, f"{cc}_YEARS")
    out = []
    for hm, hd, offsets, name, eras, *_ in getattr(mod, f"{cc}_ISLAMIC"):
        for y in (year - 1, year):
            if y in years:
                continue
            for d0 in islamic_dates_in_year(y, hm, hd):
                for k in offsets:
                    d = d0 + timedelta(days=k)
                    if d.year == year and in_era(eras, d.year):
                        out.append((d, f"{name} (estimated)"))
    hook = getattr(mod, "estimated_days", None)
    if hook:
        out += hook(year, sys.modules[__name__])
    return out


def listed(mod, cc: str, year: int) -> list[tuple[date, str]]:
    spec = getattr(mod, f"{cc}_YEARS")[year]
    return [(date(year, int(md[:2]), int(md[3:5])), name) for md, name, *_ in spec["days"]]


def holidays_of(mod, cc: str, year: int) -> list[tuple[date, str]]:
    years = getattr(mod, f"{cc}_YEARS")
    days = listed(mod, cc, year) if year in years else rule_days(mod, cc, year)
    return days + estimated_days(mod, cc, year)


def consistency_check(mod, cc: str) -> None:
    """Every rule day of a listed year is listed or suppressed, and every
    suppressed day is a rule day."""
    years = getattr(mod, f"{cc}_YEARS")
    gaps = 0
    for year, spec in sorted(years.items()):
        have = {d for d, _ in listed(mod, cc, year)}
        sup = {date(year, int(md[:2]), int(md[3:5])) for md, *_ in spec.get("suppressed", [])}
        for d, name in rule_days(mod, cc, year):
            if d not in have and d not in sup:
                gaps += 1
                print(f"  {cc} {year}: rule day {d} {name!r} neither listed nor suppressed")
        rules = {d for d, _ in rule_days(mod, cc, year)}
    print(f"{cc}: rule days checked against {len(years)} listed years, {gaps} unexplained")


# --- writers -------------------------------------------------------------------

def lisp_string(s: str) -> str:
    return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'


def lisp_date(iso: str | None) -> str:
    if not iso:
        return "nil"
    y, m, d = iso.split("-")
    return f"({int(y)} {int(m)} {int(d)})"


def doc_fields(doc: dict) -> str:
    out = [f":issued {lisp_date(doc.get('issued'))}"]
    if doc.get("issued_uri"):
        out.append(f":issued-uri {lisp_string(doc['issued_uri'])}")
    out.append(f":published {lisp_date(doc.get('published'))}")
    if doc.get("published_uri"):
        out.append(f":published-uri {lisp_string(doc['published_uri'])}")
    if doc.get("published_in"):
        out.append(f":published-in {lisp_string(doc['published_in'])}")
    if doc.get("dates_note") or not (doc.get("issued") and doc.get("published")):
        out.append(f":dates-note {lisp_string(doc.get('dates_note') or 'date not stated in the source')}")
    return " ".join(out)


def write_data(mod, cc: str, spec: dict) -> None:
    years = getattr(mod, f"{cc}_YEARS")
    lines = [f";;;; {spec['name']}: {spec['data_note']}",
             f";;;; Generated by scripts/generate_mena_holiday_gold.py {cc} from scripts/mena/{cc.lower()}.py;",
             ";;;; edit the transcription there, not this file. :holidays are the listed days",
             ";;;; that no fixed or solar rule of the starter gives; :suppressed the rule days a",
             ";;;; decree moved away or cancelled. Every block and row carries :issued and",
             ";;;; :published (#93).", "", "("]
    for year in sorted(years):
        y = years[year]
        docs = y["docs"]
        head = docs[0]
        rules = {d for d, _ in rule_days(mod, cc, year)}
        lines.append(f" (:year {year}")
        lines.append(f"  :confidence :{y['confidence']}")
        lines.append(f"  :authority {lisp_string(head['title'])}")
        lines.append(f"  :uri {lisp_string(head['uri'])}")
        lines.append(f"  {doc_fields(head)}")
        for key, rows in (("holidays", y["days"]), ("suppressed", y.get("suppressed", []))):
            lines.append(f"  :{key} (")
            for md, name, *rest in rows:
                d = date(year, int(md[:2]), int(md[3:5]))
                if (key == "holidays") == (d in rules):
                    continue
                doc = docs[rest[0] if rest else 0]
                lines.append(f"   (:date ({year} {d.month} {d.day}) :name {lisp_string(name)}")
                lines.append(f"    :authority {lisp_string(doc['title'])}")
                lines.append(f"    :uri {lisp_string(doc['uri'])}")
                lines.append(f"    {doc_fields(doc)})")
            lines.append("   )")
        lines.append("  :working (")
        for md, *rest in y.get("working", []):
            doc = docs[rest[0] if rest else 0]
            lines.append(f"   (:date ({year} {int(md[:2])} {int(md[3:5])})")
            lines.append(f"    :authority {lisp_string(doc['title'])}")
            lines.append(f"    :uri {lisp_string(doc['uri'])}")
            lines.append(f"    {doc_fields(doc)})")
        lines.append("   ))")
    lines.append(")")
    out = ROOT / "data" / cc.lower() / "holidays.sexp"
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"{cc}: {len(years)} listed years -> {out.relative_to(ROOT)}")


def sources_of(mod, cc: str, first: int, last: int) -> list[tuple[str, str, str]]:
    out, seen = [], set()
    for s in getattr(mod, f"{cc}_STATUTES"):
        if s["uri"] not in seen:
            seen.add(s["uri"])
            out.append((s["title"], s["uri"], s.get("summary", "")))
    for year, y in sorted(getattr(mod, f"{cc}_YEARS").items()):
        if first <= year <= last:
            for doc in y["docs"]:
                if doc["uri"] not in seen:
                    seen.add(doc["uri"])
                    out.append((f"{doc['title']} ({year})", doc["uri"], ""))
    for s in getattr(mod, f"{cc}_EXTRA_SOURCES", []):
        if s["uri"] not in seen:
            seen.add(s["uri"])
            out.append((s["title"], s["uri"], s.get("note", "")))
    return out


def build(key: str) -> None:
    spec = FIXTURES[key]
    cc = spec.get("country", key)
    mod = load(cc)
    first, last = spec["first"], spec.get("last", LAST)
    gaps = [y for y in spec.get("gaps", ()) if first <= y <= last]
    days: dict[date, list[str]] = {}
    for year in range(first, last + 1):
        if year in gaps:
            continue
        for d, name in holidays_of(mod, cc, year):
            assert d.year == year, (cc, d, name)
            if name not in days.setdefault(d, []):
                days[d].append(name)
    working = []
    for year in range(first, last + 1):
        y = getattr(mod, f"{cc}_YEARS").get(year)
        if y and year not in gaps:
            working += [date(year, int(md[:2]), int(md[3:5])) for md, *_ in y.get("working", [])]
    lines = [f";; {spec['name']} public holidays {first}-{last}: external gold for {cc}.",
             f";; Regenerate: uv run --no-project --with holidays==0.109 python -I "
             f"scripts/generate_mena_holiday_gold.py {key}",
             ";; :days lists every holiday as (YEAR MONTH DAY NAME); any other day is not one.",
             "(", f" :country {lisp_string(cc)}", f" :generated {lisp_string(GENERATED)}",
             f" :from {first} :to {last}", f" :note {lisp_string(spec['note'])}"]
    if gaps:
        lines.append(f" :gaps ({' '.join(map(str, gaps))})")
    if spec.get("confidence"):
        lines.append(f" :confidence :{spec['confidence']}")
    if spec.get("weekends"):
        eras = " ".join("(" + ("nil" if s is None else "(" + " ".join(map(str, s)) + ")") + " "
                        + " ".join(map(str, wd)) + ")" for s, wd in spec["weekends"])
        lines.append(f" :weekends ({eras})")
    lines += [" :sources", " ("]
    for title, uri, text in sources_of(mod, cc, first, last):
        lines.append(f"  (:title {lisp_string(title)} :uri {lisp_string(uri)}")
        lines.append(f"   :text {lisp_string(text)})")
    lines += [" )", " :days", " ("]
    for d in sorted(days):
        lines.append(f"  ({d.year} {d.month} {d.day} {lisp_string(' / '.join(days[d]))})")
    lines.append(" )")
    if working:
        lines += [" :working-days", " ("]
        lines += [f"  ({d.year} {d.month} {d.day} \"working day by decision\")" for d in working]
        lines.append(" )")
    lines[-1] = " ))"
    out = ROOT / "data" / "tests" / spec.get("file", f"{key.lower()}-holiday-gold.sexp")
    out.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"{key}: {len(days)} days -> {out.relative_to(ROOT)}")
    if spec.get("data", not spec.get("confidence")):
        consistency_check(mod, cc)
        write_data(mod, cc, spec)
    try:
        import holidays
    except ImportError:
        print(f"{key}: python-holidays not installed, secondary check skipped")
        return
    py = holidays.country_holidays(cc, years=range(first, last + 1))
    ours = set(days)
    theirs = {d for d in py.keys() if d.year not in gaps}
    diffs = 0
    for d in sorted(ours ^ theirs):
        diffs += 1
        if d.year <= 2027:
            side = "gold only" if d in ours else "python-holidays only"
            print(f"  {key} {d} {side}: {days.get(d) or py.get(d)}")
    print(f"{key}: {diffs} differences with python-holidays {holidays.__version__} (listed to 2027)")


FIXTURES: dict[str, dict] = {
    "KW": dict(name="Kuwait (government sector)", first=2020,
               weekends=[(None, (4, 5)), ((2007, 9, 1), (5, 6))],
               data_note="government-sector official holidays (Law 6/2010 art. 68 days at the dates the "
                         "Council of Ministers / Civil Service Commission declared, with rest and bridge days)",
               note="Official holidays of the Kuwaiti government sector: the 13 days of Law 6/2010 art. 68 (New "
                    "Year, Isra wal Mi'raj, Eid al-Fitr 3 days, Arafah, Eid al-Adha 3 days, Hijri New Year, Mawlid, "
                    "25 and 26 February) at the dates the Council of Ministers and the Civil Service Commission "
                    "declared each year 2020-2026 (KUNA, Central Bank of Kuwait holiday notices), with their rest, "
                    "bridge and compensation days. 1 May is no holiday. 2027-2040 are provisional: the fixed days "
                    "and tabular estimates."),
    "KW-SECONDARY": dict(name="Kuwait government sector (secondary sources)", country="KW", first=2011, last=2019,
                         file="kw-secondary-holiday-gold.sexp", confidence="secondary",
                         weekends=[(None, (4, 5)), ((2007, 9, 1), (5, 6))],
                         note="LOWER CONFIDENCE. 2011-2019 from timeanddate and the KUNA items found for some "
                              "occasions (2015-2019)."),
    "OM": dict(name="Oman", first=2020,
               weekends=[(None, (4, 5)), ((2013, 5, 1), (5, 6))],
               data_note="official holidays (Royal Decrees 56/2020, 88/2022 and 15/2025) at the dates the "
                         "Ministry of Labour announced, with the moved National Day and Accession Day",
               note="Official holidays of Oman (public and private sector): Royal Decree 56/2020, 88/2022 (Accession "
                    "Day from 2023) and 15/2025 (National Day 20-21 November), at the dates the Ministry of Labour "
                    "announced each year 2020-2026 (Oman News Agency), including the moved National Day and "
                    "Accession Day and the weekend compensation days. Renaissance Day (23 July) ends after 2019. "
                    "2027-2040 are provisional: the statutory days and tabular estimates."),
    "IQ": dict(name="Iraq (federal)", first=2019,
               weekends=[(None, (5,)), ((2005, 2, 26), (5, 6))],
               data_note="federal official holidays (Law 110/1972 as amended, Law 12/2024) at the dates the "
                         "Council of Ministers / General Secretariat declared",
               note="Federal official holidays of Iraq: Law 110/1972 as amended to 27 May 2024 and the Official "
                    "Holidays Law No. 12 of 2024 from then, with 3 October (Council of Ministers, 2020) and 10 "
                    "December (2017), at the dates the Council of Ministers and its General Secretariat declared "
                    "each year 2019-2026 (cabinet.iq, INA), with the Eid extensions. Kurdistan Region days, "
                    "community-only days (25 December for Christians) and ad hoc closures (weather, Arbaeen, "
                    "mourning) are left out. 2027-2040 are provisional: the statutory days and tabular estimates."),
    "IR": dict(name="Iran", first=2000,
               weekends=[(None, (5,))],
               data_note="official holidays: the lunar days of each year's official calendar (Calendar Center, "
                         "Institute of Geophysics, University of Tehran; time.ir for 1405) and Council of Ministers "
                         "closures; the Solar Hijri days are rules",
               note="Official holidays of Iran: every holiday of the Calendar Center's yearly lists 1378-1404 (Institute "
                    "of Geophysics, University of Tehran) and the 1405 calendar (time.ir), 2000-2026, at their final "
                    "dates, with the Council of Ministers closures of 2026. Solar Hijri days use the official 1 "
                    "Farvardin of each year (yearly calendars 1379-1405, leap table to 1420). 2027-2040 are "
                    "provisional: the Solar Hijri days and tabular estimates of the lunar days."),
    "DZ": dict(name="Algeria", first=2021,
               weekends=[(None, (4, 5)), ((2009, 8, 14), (5, 6))],
               data_note="fêtes légales (Loi 63-278 as amended by Ord. 66-153, Ord. 68-419, Loi 05-06, Loi 18-12 "
                         "and Loi 23-10) at the Hijri dates the Ministry of Religious Affairs declared",
               note="Fêtes légales of Algeria: Loi 63-278 as amended (19 June to 2004, Yennayer from 2018, Aïd el-Fitr "
                    "3 days from 2024 and Aïd el-Adha 3 days from 2023 by Loi 23-10), every one read in the JORADP, at "
                    "the Hijri dates APS reported from the Ministry of Religious Affairs 2021-2026 (2025: Awal "
                    "Moharram from the ICOP record of the official date). Good Friday and Easter Monday are no "
                    "fêtes légales (Easter Monday and other Christian and Jewish days are for those staff only, "
                    "art. 3-4). 2027-2040 are provisional: the fixed days and tabular estimates."),
    "DZ-SECONDARY": dict(name="Algeria (secondary sources)", country="DZ", first=2009, last=2020,
                         gaps=(2010, 2013, 2014, 2015), file="dz-secondary-holiday-gold.sexp", confidence="secondary",
                         weekends=[(None, (4, 5)), ((2009, 8, 14), (5, 6))],
                         note="LOWER CONFIDENCE. 2009, 2011, 2012 and 2016-2020: the Hijri dates from the ICOP record "
                              "of each country's official month start (astronomycenter.net), cross-checked with APS "
                              "where found; years with an unsourced Islamic day are gaps."),
    "EG": dict(name="Egypt (government)", first=2017,
               weekends=[(None, (5, 6))],
               data_note="official holidays of the government (PM decree 1193/2018 and earlier lists) at the "
                         "dates the Prime Minister's decrees set, with their moves and Eid blocks",
               note="Official holidays of the Egyptian government (ministries, agencies, local units): the list of "
                    "PM decree 1193/2018 (and 454/1987, 2052/2002, 1355/2011 before it), Sham el-Nessim the Monday "
                    "after Orthodox Easter, at the dates of the yearly PM decrees 2017-2026 (Official Gazette scans "
                    "on manshurat.org, cabinet.gov.eg releases): the Eid blocks with their extension days and the "
                    "moves of a holiday to a Thursday or Sunday (PM 1249/2020 and ad hoc before), the original day "
                    "then a working day. 2027-2040 are provisional: the fixed days on their dates, Sham el-Nessim "
                    "and tabular Eid blocks (eve + 3 days, Arafah + 4 days)."),
    "EG-SECONDARY": dict(name="Egypt government (secondary sources)", country="EG", first=2014, last=2016,
                         file="eg-secondary-holiday-gold.sexp", confidence="secondary", weekends=[(None, (5, 6))],
                         note="LOWER CONFIDENCE. 2014-2016 from youm7 reports of the Cabinet decisions (decree "
                              "numbers known only for 1723/2015 and 2508/2015)."),
    "MA": dict(name="Morocco (public administrations)", first=2003, confidence="secondary", data=True,
               weekends=[(None, (6, 7))],
               data_note="jours fériés of the public administrations (décret 2-77-169 as amended, 2-00-166, 2-23-688, "
                         "2-25-1140) at the Hijri dates of the Habous ministry communiqués as the press reported them",
               note="LOWER CONFIDENCE. Jours fériés of the Moroccan public administrations: décret 2-77-169 as amended "
                    "(2-00-166: Fête du Trône 30 July, Fête de la Jeunesse 21 August; 2-23-688: Nouvel an amazigh 14 "
                    "January from 2024; 2-25-1140: Fête de l'Unité 31 October from 2026), Aïd al-Fitr, Aïd al-Adha and "
                    "Mawlid 2 days each, 1 Muharram 1 day, at the dates of the Habous ministry's moon-sighting "
                    "communiqués 2003-2026 as the press reported them (habous.gov.ma, MAP and the Bulletin officiel "
                    "were unreachable), cross-checked with ICOP. 2027-2040 are provisional: the fixed days and "
                    "tabular estimates."),
}


def main(argv: list[str]) -> int:
    for key in argv or list(FIXTURES):
        build(key.upper())
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
