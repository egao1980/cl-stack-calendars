#!/usr/bin/env python3
# /// script
# requires-python = ">=3.10"
# dependencies = ["holidays==0.109"]
# ///
"""Build the Middle East / North Africa holiday gold fixtures,
data/tests/<cc>-holiday-gold.sexp, and the yearly data files the starters
read, data/<cc>/holidays.sexp (egao1980/cl-stack-calendars#44).

    uv run --no-project --with holidays==0.109 python -I scripts/generate_mena_holiday_gold.py [CC ...]

The transcriptions live in scripts/<region>/<cc>.py, one module per country
(region "mena" by default; "africa" and "asia" for #43 / #45, "europe" for
#20-#24):

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


def load(cc: str, region: str = "mena"):
    path = ROOT / "scripts" / region / f"{cc.lower()}.py"
    spec = importlib.util.spec_from_file_location(f"{region}_{cc.lower()}", path)
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
    "KZ": range(2000, 2027),   # 2027: Kurban ait not yet announced
    # SN: the Grand Magal only (a year :covers "magal"); 2013 (December), 2014 and
    # 2016 are guesses in the transcription, so the Magal is estimated there.
    "SN": [2012, 2015] + list(range(2017, 2027)),
    "NG": range(2015, 2027),   # 2010-2014: the Eid declarations not found
    "MW": [2013, 2016, 2017, 2019, 2020, 2023, 2024, 2026],   # 2025: Eid al-Fitr date unconfirmed
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


# --- rule engine (modules with OBSERVE = True) ---------------------------------
#
# The same algorithm as the Lisp RULE-CALENDAR (%OBSERVE-RULE-ENTRIES and
# HOLIDAY-P), written from its documented contract: the year map of rule year
# Y claims every kept nominal date of Y-1 .. Y+1, then places the substitutes
# in nominal-date order (ties by name), each on the first day after its
# nominal date that is no weekend day and not claimed. A date is a rule
# holiday when the map of its year or of an adjacent year holds it.
#
# Rule tables (the last element of each tuple may be an options dict):
#   <CC>_FIXED    (month, day, name, eras, statute[, opts])
#   <CC>_ISLAMIC  (hijri month, hijri day, offsets, name, eras, statute[, opts]):
#                 tabular, only in rule years with no list covering opts["key"]
#   <CC>_EASTER   (offset, name, eras, statute[, opts]); opts["orthodox"]
#   <CC>_NTH      (month, ISO weekday, n, name, eras, statute[, opts]); n = -1 last
#   <CC>_COMPUTED (name, fn, eras, statute[, opts]); fn(year) -> list of dates, the
#                 transcription's own reading of a rule the tables cannot express
#                 (NL Koningsdag, IE St Brigid's Day, SE/FI Saturdays)
# Eras are (from, to) pairs of years or ISO dates, None = open. opts:
#   observed       "substitute-next" (keep; a Saturday or Sunday one adds the next free day),
#                  "sunday-next" (keep; a Sunday one adds the next free day),
#                  "sunday-monday" (keep; a Sunday one adds the Monday unless it is taken),
#                  "sunday-to-monday" (a Sunday one moves to the next free day),
#                  "next-weekday" (a Saturday or Sunday one moves to the next free day)
#   observed_from  year or ISO date from which the policy applies
#   key            the Islamic rule's key for a year's :covers
#   offset         (NTH) days after the Nth weekday (e.g. 1: the Tuesday after a Monday)
#   years          (NTH) only these years (e.g. an election every fifth year)

def _bound(b, d: date, lower: bool) -> bool:
    if b is None:
        return True
    if isinstance(b, int):
        return d.year >= b if lower else d.year <= b
    b = date.fromisoformat(b)
    return d >= b if lower else d <= b


def in_era_date(eras, d: date) -> bool:
    return any(_bound(a, d, True) and _bound(b, d, False) for a, b in eras)


def _opts(row, n):
    return row[n] if len(row) > n and isinstance(row[n], dict) else {}


def easter_western(year: int) -> date:
    a, b, c = year % 19, year // 100, year % 100
    d, e = divmod(b, 4)
    f = (b + 8) // 25
    g = (b - f + 1) // 3
    h = (19 * a + b - d - g + 15) % 30
    i, k = divmod(c, 4)
    l = (32 + 2 * e + 2 * i - h - k) % 7
    m = (a + 11 * h + 22 * l) // 451
    month, day = divmod(h + l - 7 * m + 114, 31)
    return date(year, month, day + 1)


def nth_weekday(year: int, month: int, weekday: int, n: int) -> date:
    if n > 0:
        d = date(year, month, 1)
        d += timedelta(days=(weekday - d.isoweekday()) % 7)
        return d + timedelta(weeks=n - 1)
    d = (date(year + (month == 12), month % 12 + 1, 1)) - timedelta(days=1)
    return d - timedelta(days=(d.isoweekday() - weekday) % 7)


def listed_for(mod, cc: str, year: int, key=None) -> bool:
    """True when YEAR has a list that covers the rule KEY (a list with no
    :covers covers every rule)."""
    spec = getattr(mod, f"{cc}_YEARS").get(year)
    if spec is None:
        return False
    covers = spec.get("covers")
    return covers is None or key in covers


class Engine:
    def __init__(self, mod, cc: str, weekends, suppress: bool = True):
        self.mod, self.cc, self.weekends = mod, cc, weekends
        self.rules = []   # (name, nominal-fn, eras, observed, observed_from)
        for row in getattr(mod, f"{cc}_FIXED", []):
            m, d, name, eras = row[:4]
            self._add(name, (lambda y, m=m, d=d: [date(y, m, d)]), eras, _opts(row, 5))
        for row in getattr(mod, f"{cc}_EASTER", []):
            off, name, eras = row[:3]
            o = _opts(row, 4)
            fn = easter_orthodox if o.get("orthodox") else easter_western
            self._add(name, (lambda y, off=off, fn=fn: [fn(y) + timedelta(days=off)]), eras, o)
        for row in getattr(mod, f"{cc}_NTH", []):
            m, wd, n, name, eras = row[:5]
            o = _opts(row, 6)
            self._add(name, (lambda y, m=m, wd=wd, n=n, k=o.get("offset", 0), only=o.get("years"):
                             [] if only and y not in only else [nth_weekday(y, m, wd, n) + timedelta(days=k)]),
                      eras, o)
        for row in getattr(mod, f"{cc}_COMPUTED", []):
            name, fn, eras = row[:3]
            self._add(name, (lambda y, fn=fn: list(fn(y))), eras, _opts(row, 4))
        for row in getattr(mod, f"{cc}_ISLAMIC", []):
            hm, hd, offsets, name, eras = row[:5]
            o = _opts(row, 6)

            def fn(y, hm=hm, hd=hd, offsets=offsets, key=o.get("key")):
                if listed_for(mod, cc, y, key):
                    return []
                out = []
                for d0 in islamic_dates_in_year(y, hm, hd):
                    for k in offsets:
                        if d0 + timedelta(days=k) not in out:
                            out.append(d0 + timedelta(days=k))
                return out
            self._add(f"{name} (estimated)", fn, eras, o)
        self.any_observed = any(r[3] for r in self.rules)
        self.suppressed = {date(y, int(md[:2]), int(md[3:5]))
                           for y, spec in getattr(mod, f"{cc}_YEARS").items()
                           for md, *_ in spec.get("suppressed", [])} if suppress else set()
        self.maps = {}

    def _add(self, name, fn, eras, o):
        self.rules.append((name, fn, eras, o.get("observed"), o.get("observed_from")))

    def weekend(self, d: date) -> bool:
        days = (6, 7)
        for start, wd in self.weekends or []:
            if start is None or d >= date(*start):
                days = wd
        return d.isoweekday() in days

    def _moves(self, nominal: date, policy):
        """(keep the nominal day?, substitute: False, "forward" or "next-day")."""
        sunday = nominal.isoweekday() == 7
        if policy is None:
            return True, False
        if policy == "substitute-next":
            return True, self.weekend(nominal) and "forward"
        if policy == "sunday-next":
            return True, sunday and "forward"
        if policy == "sunday-monday":
            return True, sunday and "next-day"
        if policy == "sunday-to-monday":
            return not sunday, sunday and "forward"
        if policy == "next-weekday":
            return not self.weekend(nominal), self.weekend(nominal) and "forward"
        raise ValueError(policy)

    def entries(self, y: int):
        out = []
        for name, fn, eras, policy, pfrom in self.rules:
            for nominal in fn(y):
                if not in_era_date(eras, nominal):
                    continue
                applies = policy and (pfrom is None or _bound(pfrom, nominal, True))
                keep, forward = self._moves(nominal, policy if applies else None)
                out.append((name, nominal, keep, forward, y))
        return out

    def year_map(self, y: int) -> dict:
        if y in self.maps:
            return self.maps[y]
        years = (y - 1, y, y + 1) if self.any_observed else (y,)
        entries = [e for yy in years for e in self.entries(yy)]
        claimed, out = set(), {}
        for name, nominal, keep, _, ey in entries:
            if keep and nominal not in self.suppressed:
                claimed.add(nominal)
                if ey == y:
                    out.setdefault(nominal, name)
        for name, nominal, _, how, ey in sorted((e for e in entries if e[3]), key=lambda e: (e[1], e[0])):
            d = nominal + timedelta(days=1)
            if how == "next-day":
                if self.weekend(d) or d in claimed:
                    continue  # no substitute when the next day is taken
            else:
                while self.weekend(d) or d in claimed:
                    d += timedelta(days=1)
            claimed.add(d)
            if ey == y and d not in self.suppressed:
                out.setdefault(d, f"{name} (substitute)")
        self.maps[y] = out
        return out

    def days(self, year: int) -> list[tuple[date, str]]:
        found = {}
        for y in (year - 1, year, year + 1):
            for d, name in self.year_map(y).items():
                if d.year == year:
                    found.setdefault(d, name)
        return sorted(found.items())


ENGINES: dict[tuple[str, bool], Engine] = {}


def engine(mod, cc: str, suppress: bool = True) -> Engine | None:
    """The rule engine of CC; SUPPRESS NIL ignores the :suppressed rows (the
    rule days a decree moved away are then rule days)."""
    if not getattr(mod, "OBSERVE", False):
        return None
    if (cc, suppress) not in ENGINES:
        weekends = next((f.get("weekends") for k, f in FIXTURES.items()
                         if f.get("country", k) == cc and f.get("weekends")), None)
        ENGINES[(cc, suppress)] = Engine(mod, cc, weekends, suppress)
    return ENGINES[(cc, suppress)]


# --- per-country rules ---------------------------------------------------------

def in_era(eras, year: int) -> bool:
    return any(a <= year and (b is None or year <= b) for a, b in eras)


def fixed_days(mod, cc: str, year: int) -> list[tuple[date, str]]:
    return [(date(year, m, d), name) for m, d, name, eras, *_ in getattr(mod, f"{cc}_FIXED") if in_era(eras, year)]


def rule_days(mod, cc: str, year: int) -> list[tuple[date, str]]:
    """The days the starter computes in every year: fixed, solar and other rules."""
    eng = engine(mod, cc)
    if eng:
        return eng.days(year)
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
    for hm, hd, offsets, name, eras, *_ in getattr(mod, f"{cc}_ISLAMIC", []):
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
    if engine(mod, cc):
        if year in years and years[year].get("covers") is None:
            return listed(mod, cc, year)
        return rule_days(mod, cc, year) + (listed(mod, cc, year) if year in years else [])
    days = listed(mod, cc, year) if year in years else rule_days(mod, cc, year)
    return days + estimated_days(mod, cc, year)


def consistency_check(mod, cc: str) -> None:
    """Every rule day of a listed year is listed or suppressed, and every
    suppressed day is a rule day."""
    years = getattr(mod, f"{cc}_YEARS")
    gaps = 0
    for year, spec in sorted(years.items()):
        if spec.get("covers") is not None:
            continue  # a partial list: only its own rows
        have = {d for d, _ in listed(mod, cc, year)}
        sup = {date(year, int(md[:2]), int(md[3:5])) for md, *_ in spec.get("suppressed", [])}
        for d, name in rule_days(mod, cc, year):
            if d not in have and d not in sup:
                gaps += 1
                print(f"  {cc} {year}: rule day {d} {name!r} neither listed nor suppressed")
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
             f";;;; Generated by scripts/generate_mena_holiday_gold.py {cc} from scripts/{spec.get('region', 'mena')}/{cc.lower()}.py;",
             ";;;; edit the transcription there, not this file. :holidays are the listed days",
             ";;;; that no fixed or solar rule of the starter gives; :suppressed the rule days a",
             ";;;; decree moved away or cancelled. Every block and row carries :issued and",
             ";;;; :published (#93).", "", "("]
    for year in sorted(years):
        y = years[year]
        docs = y["docs"]
        head = docs[0]
        raw = engine(mod, cc, suppress=False)
        rules = {d for d, _ in (raw.days(year) if raw else rule_days(mod, cc, year))}
        lines.append(f" (:year {year}")
        lines.append(f"  :confidence :{y['confidence']}")
        if y.get("covers") is not None:
            lines.append(f"  :covers ({' '.join(lisp_string(k) for k in y['covers'])})")
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


STATUTE_TO = {"U950002534": "2001-12-13", "decret-2012-magal": "2012-01-12"}


def write_statutes(mod, cc: str, spec: dict) -> None:
    """data/<cc>/statutes.sexp: every act of <CC>_STATUTES with :issued,
    :published and :in-force, or a :dates-note for a missing one (#93)."""
    def date_or_note(key, value, notes):
        if value and len(value) == 10:
            return lisp_date(value)
        if value:
            notes.append(f"{key} given only as {value}")
        return "nil"
    lines = [f";;;; {spec['name']}: the acts that set the holiday list, by era.",
             f";;;; Generated by scripts/generate_mena_holiday_gold.py {cc} from scripts/{spec.get('region', 'mena')}/{cc.lower()}.py.",
             "("]
    for st in getattr(mod, f"{cc}_STATUTES"):
        notes = []
        issued = date_or_note("issued", st.get("issued"), notes)
        published = date_or_note("published", st.get("published"), notes)
        in_force = date_or_note("in-force", st.get("in_force"), notes)
        start = next((v for v in (in_force, published, issued) if v != "nil"), "nil")
        lines.append(f" (:calendar {lisp_string(cc)} :key {lisp_string(st['key'])} :from {start} "
                     f":to {lisp_date(st.get('to') or STATUTE_TO.get(st['key']))}")
        lines.append(f"  :authority {lisp_string(st['title'])}")
        lines.append(f"  :uri {lisp_string(st['uri'])}")
        out = [f":issued {issued}"]
        if st.get("issued_uri"):
            out.append(f":issued-uri {lisp_string(st['issued_uri'])}")
        out.append(f":published {published}")
        if st.get("published_uri"):
            out.append(f":published-uri {lisp_string(st['published_uri'])}")
        if st.get("published_in"):
            out.append(f":published-in {lisp_string(st['published_in'])}")
        out.append(f":in-force {in_force}")
        note = " ".join(x for x in (st.get("dates_note"), "; ".join(notes) + "." if notes else None) if x)
        if note or "nil" in (issued, published, in_force):
            out.append(f":dates-note {lisp_string(note or 'No start of effect is stated; :FROM is the date of the act.')}")
        if st.get("summary"):
            out.append(f":summary {lisp_string(st['summary'])}")
        lines.append("  " + " ".join(out) + ")")
    lines.append(")")
    path = ROOT / "data" / cc.lower() / "statutes.sexp"
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"{cc}: {len(getattr(mod, f'{cc}_STATUTES'))} acts -> {path.relative_to(ROOT)}")


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
    mod = load(cc, spec.get("region", "mena"))
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
        if getattr(mod, "OBSERVE", False):
            write_statutes(mod, cc, spec)
    try:
        import holidays
    except ImportError:
        print(f"{key}: python-holidays not installed, secondary check skipped")
        return
    if spec.get("financial"):
        py = holidays.financial_holidays(spec["financial"], years=range(first, last + 1))
    else:
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
    "KZ": dict(name="Kazakhstan", region="asia", first=2000, gaps=tuple(range(2006, 2019)),
               weekends=[(None, (6, 7))],
               data_note="праздничные дни of decree 2534 (1995) and law 267 (2001) as amended, the выходные дни "
                         "Kurban ait (first day) and 7 January (Labour law from 2006), with the Government and "
                         "Ministry of Labour transfers of days off",
               note="Holidays and days off of Kazakhstan: decree 2534 of 18 Oct 1995, law 267 of 13 Dec 2001 as amended "
                    "(47-IV: 6 July from 2008; 152-IV: Nauryz 21-23 March from 2010, no 25 October 2009-2021; 509-IV: "
                    "1 December 2012-2021; 43-V: 7 May from 2013; 143-VII: 25 October from 2022, 16 December one day "
                    "from 2022; 306-VIII: 15 March from 2027, no 30 August from 2026), its art. 5 weekend carry-over "
                    "from 14 Dec 2001, the first day of Kurban ait and 7 January from 2006 (law 109 of 30 Dec 2005; "
                    "Labour Codes 2007 and 2015) with no carry-over, and every transfer decree or order 2000-2025 "
                    "(adilet.zan.kz). Ораза айт is no holiday. Kurban ait at the egov.kz dates 2019-2026; 2006-2018 "
                    "are gaps here (dates from secondary sources: the KZ-SECONDARY fixture). 2027-2040 are "
                    "provisional: the statutory days, art. 5 and tabular Kurban ait."),
    "KZ-SECONDARY": dict(name="Kazakhstan (Kurban ait from secondary sources)", country="KZ", region="asia",
                         first=2006, last=2018, file="kz-secondary-holiday-gold.sexp", confidence="secondary",
                         weekends=[(None, (6, 7))],
                         note="LOWER CONFIDENCE. 2006-2018: the statutory days and transfer decrees are primary, the "
                              "Kurban ait dates come from python-holidays' confirmed table (checked where a decree "
                              "bridges them, 2006 and 2013)."),
    "ZA": dict(name="South Africa", region="africa", first=2000, weekends=[(None, (6, 7))],
               data_note="the days declared under s. 2A of the Public Holidays Act 36 of 1994 (Act 48 of 1995), "
                         "with their Government Gazette numbers; the Schedule days and the s. 2(1) Monday are rules",
               note="Public holidays of South Africa: Act 36 of 1994 Schedule 1 (from 1995) with the s. 2(1) Monday "
                    "after a Sunday holiday (no further day when that Monday is a holiday), and every day the "
                    "President declared under s. 2A 2000-2027 (Gazette proclamations: elections, Y2K, 2008-05-02, "
                    "27 Dec 2011/2016/2022, 2023-12-15, 2026-11-04), checked against the gov.za yearly lists. "
                    "2028-2040 are provisional: the Schedule and s. 2(1)."),
    "KE": dict(name="Kenya", region="africa", first=2005, gaps=(2006, 2008, 2011, 2026), weekends=[(None, (6, 7))],
               data_note="days gazetted under the Public Holidays Act (Cap. 110) s. 2(4), 2(5) and 3: Idd-ul-Fitr "
                         "and Idd-ul-Azha dates, election, swearing-in and one-off days",
               note="Public holidays of Kenya: Cap. 110 Part I by era (Moi Day 1990-2009 and 2018-2020, Utamaduni "
                    "Day 2021-2023, Mazingira Day from 2024, Mashujaa Day from 2010) with the s. 4 rule from 1984 (a "
                    "Sunday holiday moves to the first succeeding day that is not one: Christmas on a Sunday -> 27 "
                    "December), and the Kenya Gazette notices (gazettes.africa copies): Idd-ul-Fitr dates, Idd-ul-"
                    "Azha in the years it was gazetted for everyone, election and swearing-in days. 2006, 2008, 2011 "
                    "and 2026 are gaps (secondary: KE-SECONDARY). 2027-2040 are provisional: Part I, s. 4 and "
                    "tabular Idd-ul-Fitr."),
    "KE-SECONDARY": dict(name="Kenya (secondary sources)", country="KE", region="africa", first=2000, last=2026,
                         gaps=tuple(y for y in range(2000, 2027) if y not in (2000, 2001, 2002, 2003, 2004, 2006, 2008, 2011, 2026)),
                         file="ke-secondary-holiday-gold.sexp", confidence="secondary", weekends=[(None, (6, 7))],
                         note="LOWER CONFIDENCE. 2000-2004, 2006, 2008, 2011: statutory days with Idd-ul-Fitr "
                              "estimates (no gazette notice in the sparse archive); 2026: notices cited by "
                              "python-holidays (Kenya Law unreadable)."),
    "NG": dict(name="Nigeria (federal)", region="africa", first=2016, weekends=[(None, (6, 7))],
               data_note="the Federal Ministry of Interior's yearly declarations: Eid days, Maulud, and the next "
                         "working days declared for a holiday on a Saturday or Sunday",
               note="Federal public holidays of Nigeria: the Public Holidays Act (Decree 1979 No. 3 as amended; "
                    "Democracy Day 29 May 2000-2018, 12 June from 2019), at the days the Ministry of Interior "
                    "declared 2016-2026 (interior.gov.ng releases): the Eid and Maulud days and the next working "
                    "days declared for weekend holidays (no statutory in-lieu rule, s. 5(b)). 2027-2040 are "
                    "provisional: the statutory days and tabular Eid el-Fitr, Eid el-Kabir (2 days) and Maulud."),
    "NG-SECONDARY": dict(name="Nigeria (secondary sources)", country="NG", region="africa", first=2000, last=2015,
                         file="ng-secondary-holiday-gold.sexp", confidence="secondary", weekends=[(None, (6, 7))],
                         note="LOWER CONFIDENCE. 2015: the declarations as newspapers quoted the Ministry; 2000-2014: "
                              "statutory days and tabular estimates (the declarations found are partial)."),
    "ZW": dict(name="Zimbabwe", region="africa", first=2004, gaps=(2008, 2012), weekends=[(None, (6, 7))],
               data_note="the Minister's yearly lists of public holidays (General Notices) and the statutory "
                         "instruments declaring additional days",
               note="Public holidays of Zimbabwe: the Public Holidays and Prohibition of Business Act [Ch. 10:21] "
                    "Schedule by era (Heroes' Day the second Monday of August and Defence Forces Day the Tuesday "
                    "from Act 17/2001; Youth Day 21 Feb from 2018, SI 143/2017; Munhumutapa Day 15 Sep from 2026, SI "
                    "148/2026) with s. 2(1): a Sunday holiday adds the Monday, and the Tuesday when 26 December is a "
                    "Monday; the yearly General Notices and the SIs for polling and other days 2004-2027. 2008 and "
                    "2012 are gaps (ZW-SECONDARY). 2028-2040 are provisional."),
    "ZW-SECONDARY": dict(name="Zimbabwe (secondary sources)", country="ZW", region="africa", first=2000, last=2012,
                         gaps=(2004, 2005, 2006, 2009, 2010), file="zw-secondary-holiday-gold.sexp",
                         confidence="secondary", weekends=[(None, (6, 7))],
                         note="LOWER CONFIDENCE. 2008, 2012: no annual list found, statute days and polling days; "
                              "2000-2003, 2007, 2011: statute days only."),
    "ZM": dict(name="Zambia", region="africa", first=2013, gaps=(2026,), weekends=[(None, (6, 7))],
               data_note="the Cabinet Office's yearly gazette notices of public holidays and the statutory "
                         "instruments declaring additional days (state funerals, swearing-in, bridges)",
               note="Public holidays of Zambia: the Public Holidays Act (Cap. 272) Schedule by era (Youth Day from "
                    "1988, Women's Day from 2008, Prayer Day 18 October 2016-2025, Kenneth Kaunda Day from 2022, 29 "
                    "December from 2026; Heroes and Unity Days the first Monday and Tuesday of July, Farmers Day the "
                    "first Monday of August; Easter Saturday to Monday; general election day, the second Thursday of "
                    "August every fifth year from 2016) with s. 2(2): a Sunday holiday adds the Monday; and the "
                    "gazette notices and SIs 2013-2025 (ZambiaLII). 2026 is a gap (ZM-SECONDARY). 2027-2040 are "
                    "provisional."),
    "ZM-SECONDARY": dict(name="Zambia (secondary sources)", country="ZM", region="africa", first=2000, last=2026,
                         gaps=tuple(range(2013, 2026)), file="zm-secondary-holiday-gold.sexp",
                         confidence="secondary", weekends=[(None, (6, 7))],
                         note="LOWER CONFIDENCE. 2026: SI 73/2026 (Prayer Day withdrawn, 29 December added) and the "
                              "election days from news reports; 2000-2012: statute days only."),
    "MW": dict(name="Malawi", region="africa", first=2000, confidence="secondary", data=True, weekends=[(None, (6, 7))],
               data_note="the Government's yearly lists and statements (Eid al-Fitr, one-off days), from news reports",
               note="LOWER CONFIDENCE. Public holidays of Malawi: the Public Holidays Act (Cap. 18:05) Schedule (Kamuzu "
                    "Day 14 May from 2007, Mother's Day 15 October, John Chilembwe Day 15 January, Boxing Day from "
                    "2012, Easter Saturday) with s. 4: a Saturday or Sunday holiday ceases and the next day that is "
                    "not a Sunday or holiday is one; Eid al-Fitr at the declared day, from news reports of the "
                    "Government statements (2013, 2016, 2017, 2019, 2020, 2023, 2024, 2026). Other years: tabular "
                    "Eid al-Fitr."),
    "MG": dict(name="Madagascar", region="africa", first=2006, gaps=(2010, 2023), weekends=[(None, (6, 7))],
               data_note="the yearly décrets fixant la liste des jours fériés, chômés et payés, the additional "
                         "decrees, and the Eid dates the Muslim community or ministry announced",
               note="Jours fériés, chômés et payés of Madagascar: the yearly decrees 2006-2026 (CNLEGIS): 1 January, "
                    "8 March (for women only from 2007), 29 March, Easter Sunday and Monday, 1 May, Ascension, "
                    "Pentecost Sunday and Monday, 26 June, 15 August, 1 November, 25 December, 11 December 2010-2014, "
                    "14 October 2013, Eid al-Fitr and Eid al-Adha from 2013 (for Muslims only in 2013, 2014 and "
                    "2016-2018), election days and the days of additional decrees. No Sunday rule. 2010 and 2023 are "
                    "gaps (MG-SECONDARY); years with no decree and from 2027: the pattern and tabular Eids."),
    "MG-SECONDARY": dict(name="Madagascar (secondary sources)", country="MG", region="africa", first=2000, last=2023,
                         gaps=(2006, 2007, 2008, 2009, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022),
                         file="mg-secondary-holiday-gold.sexp", confidence="secondary", weekends=[(None, (6, 7))],
                         note="LOWER CONFIDENCE. 2001, 2004, 2005, 2010: only the one-off decrees found, the base list "
                              "assumed from the 2006 decree; 2023: news only; 2000, 2002, 2003: no decree."),
    "SN": dict(name="Senegal", region="africa", first=2025, data=True,
               weekends=[(None, (6, 7))],
               data_note="the declared Grand Magal de Touba dates (18 Safar; loi 2013-06) and one-off fêtes légales by "
                         "decree; the other days are rules of loi 74-52 as amended",
               note="Fêtes légales of Senegal: loi 74-52 of 4 Nov 1974 (1 January, 4 April, 1 May, Easter Monday, "
                    "Ascension, Whit Monday, 15 August, 1 November, 25 December, Maouloud, Korité, Tabaski; the Monday "
                    "after a Sunday Korité or Tabaski), loi 83-54 (Tamxarit) and loi 2013-06 (Grand Magal de Touba, "
                    "18 Safar), with the Magal at the date the Khalife général des mourides fixed, as RTS and Le Soleil "
                    "reported it 2025-2026. Tamxarit, Maouloud, Korité and Tabaski are tabular estimates in every year, "
                    "and so is the Magal from 2027."),
    "SN-SECONDARY": dict(name="Senegal (secondary sources)", country="SN", region="africa", first=2000, last=2024,
                         file="sn-secondary-holiday-gold.sexp", confidence="secondary",
                         weekends=[(None, (6, 7))],
                         note="LOWER CONFIDENCE. 2000-2024: the Magal dates 2012, 2015, 2017-2024 from national press, "
                              "Wikipedia or timeanddate (2023 RTS), estimated in 2013, 2014 and 2016; décret 2018-1942 "
                              "(29 Oct 2018) and the Conseil des ministres of 22 Dec 2022 (26 Dec 2022)."),
    # --- Europe (#20-#24): statute rules; the data files hold one-off days ---
    "IT": dict(name="Italy", region="europe", first=2000, weekends=[(None, (6, 7))],
               data_note="one-off giorni festivi by decree-law (17 March 2011); the L. 260/1949 days are rules",
               note="Giorni festivi of Italy: L. 260/1949 art. 1-2 less the days L. 54/1977 suppressed (Epifania back "
                    "from 1986, D.P.R. 792/1985), the festa nazionale on the first Sunday of June 1977-2000 and on 2 "
                    "June again from 2001 (L. 336/2000), the festa dell'Unità nazionale on the first Sunday of "
                    "November (L. 54/1977; L. 27/2024 gives 4 November no civil effects), San Francesco d'Assisi 4 "
                    "October from 2026 (L. 151/2025) and 17 March 2011 (D.L. 5/2011). No weekend rule."),
    "NL": dict(name="Netherlands", region="europe", first=2000, weekends=[(None, (6, 7))],
               data_note="no one-off days; the Algemene termijnenwet days are rules",
               note="Algemeen erkende feestdagen of the Netherlands: Algemene termijnenwet art. 3(1) (Nieuwjaarsdag, "
                    "tweede Paas- en Pinksterdag, Hemelvaartsdag, both Christmas days, 5 May every year, the "
                    "King's/Queen's birthday): Koninginnedag 30 April, on a Sunday the Saturday before (KB 24 april "
                    "1980 nr. 11) to 2013; Koningsdag 27 April, on a Sunday 26 April, from 2014 (Besluit van 30 "
                    "januari 2013, Stcrt. 2013, 4075). Goede Vrijdag is only equated for time limits (art. 3(2))."),
    "DE": dict(name="Germany (bundeseinheitlich)", region="europe", first=2000, gaps=(2017,), weekends=[(None, (6, 7))],
               data_note="Reformationstag 2017, a holiday in all 16 Länder (each Land's act)",
               note="Bundeseinheitliche Feiertage of Germany: the days every Land's Feiertagsgesetz lists (Neujahr, "
                    "Karfreitag, Ostermontag, 1. Mai, Christi Himmelfahrt, Pfingstmontag, 25. und 26. Dezember), "
                    "3. Oktober (Einigungsvertrag Art. 2 Abs. 2) and Reformationstag 31 October 2017, a holiday in "
                    "every Land that year (2017 is a gap here: DE-SECONDARY). Days of only some Länder are left out."),
    "DE-SECONDARY": dict(name="Germany (Reformationstag 2017)", country="DE", region="europe", first=2017, last=2017,
                         file="de-secondary-holiday-gold.sexp", confidence="secondary", weekends=[(None, (6, 7))],
                         note="LOWER CONFIDENCE. 2017: 31 October was a holiday in all 16 Länder; ten instruments read "
                              "in the gazette (BW, BY, BE, HB, HH, HE, NI, NW; BB and SN permanent), RP, SL and SH only "
                              "on secondary pages, MV, ST and TH (permanent) on secondary copies."),
    "IE": dict(name="Ireland", region="europe", first=2000, weekends=[(None, (6, 7))],
               data_note="days prescribed under the Organisation of Working Time Act 1997 Sched. 2 para. 1(g)",
               note="Public holidays of Ireland: Organisation of Working Time Act 1997 Sched. 2 para. 1 (in force 30 "
                    "Sep 1997) and the days prescribed under para. 1(g): 14 September 2001 (S.I. 419/2001), 18 March "
                    "2022 and St Brigid's Day from 2023 (first Monday of February, or 1 February when a Friday; S.I. "
                    "50/2022). No substitute day for a weekend holiday (s. 21 is an entitlement)."),
    "PT": dict(name="Portugal", region="europe", first=2009, weekends=[(None, (6, 7))],
               data_note="no one-off days; the art. 234.º days are rules",
               note="Feriados obrigatórios of Portugal: Código do Trabalho (Lei 7/2009) art. 234.º(1), Easter Sunday "
                    "included; Corpo de Deus, 5 October, 1 November and 1 December not in 2013-2015 (Lei 23/2012 "
                    "art. 10.º, from 1 Jan 2013) and restored by Lei 8/2016. Carnaval and municipal days are left out."),
    "PT-SECONDARY": dict(name="Portugal (secondary sources)", country="PT", region="europe", first=2000, last=2008,
                         file="pt-secondary-holiday-gold.sexp", confidence="secondary", weekends=[(None, (6, 7))],
                         note="LOWER CONFIDENCE. 2000-2008: the Código do Trabalho 2003 (art. 208.º) and DL 874/76 "
                              "lists were not read; the art. 234.º days of 2009, which python-holidays agrees with."),
    "TARGET": dict(name="TARGET (euro RTGS)", region="europe", first=1999, financial="XECB",
                   weekends=[(None, (6, 7))],
                   data_note="additional closing days the ECB Governing Council decided (31 December 1999, 2001)",
                   note="TARGET closing days: 1999 25 December and New Year's Day; 2000-2001 New Year's Day, Good "
                        "Friday, Easter Monday, 1 May, 25 and 26 December (ECB press releases 15 Jul 1999, 25 May "
                        "2000); from 2002 the long-term calendar of 14 Dec 2000 (the same six days); plus 31 December "
                        "1999 (Y2K, 31 Mar 1999) and 31 December 2001 (euro cash changeover, 25 May 2000)."),
    # --- #23: Croatia, Slovenia, Slovakia, Czechia, Hungary, Poland ---
    "HR": dict(name="Croatia", region="europe", first=2000, weekends=[(None, (6, 7))],
               data_note="no one-off days; the Zakon o blagdanima days are rules",
               note="Blagdani i neradni dani of Croatia: NN 33/1996, NN 96/2001 (from 15 Nov 2001: 25 June Dan "
                    "državnosti, 8 October Dan neovisnosti, Tijelovo; no 6 January), NN 13/2002 (6 January again from "
                    "16 Feb 2002), NN 55/2008 (Uskrs named) and NN 110/2019 (from 2020: 30 May, 18 November; 25 June "
                    "and 8 October memorial days). No Sunday move."),
    "SI": dict(name="Slovenia", region="europe", first=2000, weekends=[(None, (6, 7))],
               data_note="the one-off day off 14 August 2023 (ZOPNN-F)",
               note="Dela prosti dnevi of Slovenia: ZPDPD-UPB1 čl. 1-2 (Easter Sunday and Monday, Whit Sunday "
                    "included); 2 January not a day off 2013-2016 (ZUJF art. 82; restored by ZPDPD-D); 14 August "
                    "2023 (ZOPNN-F art. 15). Prazniki that are not days off are left out. No Sunday move."),
    "CZ": dict(name="Czechia", region="europe", first=2000, weekends=[(None, (6, 7))],
               data_note="no one-off days; the zákon 245/2000 Sb. days are rules",
               note="Dny pracovního klidu of Czechia: zákon 245/2000 Sb. § 1-3 (in force 9 Aug 2000; before it 93/1951 "
                    "Sb. and 204/1990 Sb.), Velký pátek from 2016 (359/2015 Sb.)."),
    "HU": dict(name="Hungary", region="europe", first=2000, weekends=[(None, (6, 7))],
               data_note="the transferred rest days and working Saturdays of each year's ministerial decree "
                         "(a 20XX. évi munkaszüneti napok körüli munkarendről)",
               note="Munkaszüneti napok of Hungary: 1992. évi XXII. tv. § 125 (3), Mt. 2012 § 102 (1), Nagypéntek from "
                    "2017, Szenteste from 14 Nov 2026 (2026. évi LXXII. tv.); every yearly munkarend decree 2001-2026 "
                    "(rest days as holidays, the Saturdays as working days). Easter and Whit Sunday are not "
                    "munkaszüneti napok. 2027-2040 are provisional: the statutory days only."),
    "PL": dict(name="Poland", region="europe", first=2000, weekends=[(None, (6, 7))],
               data_note="the one-off day off 12 November 2018 (Dz.U. 2018 poz. 2117)",
               note="Dni wolne od pracy of Poland: ustawa z 18 stycznia 1951 r. art. 1 pkt 1 as amended (Easter Sunday "
                    "and Pentecost Sunday named), Trzech Króli from 2011 (Dz.U. 2010 nr 224 poz. 1459), Wigilia from "
                    "2025 (Dz.U. 2024 poz. 1965), 12 November 2018 (Dz.U. 2018 poz. 2117)."),
    "SK": dict(name="Slovakia", region="europe", first=2000, weekends=[(None, (6, 7))],
               data_note="the one-off state holiday 30 October 2018 (§ 4a)",
               note="Dni pracovného pokoja of Slovakia: zákon 241/1993 Z. z. § 2 as amended: 17 November from 15 Nov "
                    "2001 (442/2001) to 31 Oct 2025 (261/2025), 1 September to 2023 (530/2023), 28 October never a "
                    "day of rest, 30 October 2018 (§ 4a), no 8 May and 15 September in 2026 (§ 4b)."),
    # --- #22: Romania, Bulgaria, Greece, Cyprus ---
    "RO": dict(name="Romania", region="europe", first=2000, weekends=[(None, (6, 7))],
               data_note="no one-off days; the Codul muncii art. 139 days are rules",
               note="Zile de sărbătoare legală of Romania: Legea 75/1996, Codul muncii art. 134/139 (from 1 Mar 2003) as "
                    "amended: Rusalii and 15 August from 2009 (L. 202/2008), 30 November from 2012 (L. 147/2012), 24 "
                    "January and 1 June from 2017 (L. 176/2016, L. 220/2016), Vinerea Mare from 2018 (L. 64/2018), 6 and "
                    "7 January from 2024 (L. 52/2023). Orthodox Easter; both Easter and Rusalii Sundays are named."),
    "BG": dict(name="Bulgaria", region="europe", first=2004, weekends=[(None, (6, 7))],
               data_note="the Council of Ministers decisions: transferred rest days and working Saturdays (2004-2016) "
                         "and one-off days (2004-04-02, 2007-01-02, 2025-12-31, 2026-01-02)",
               note="Official holidays of Bulgaria: Кодекс на труда чл. 154(1) (no 1 November: schools only), Велики "
                    "петък and Велика събота from 2010 (ДВ 15/2010), чл. 154(2) from 2017 (ДВ 105/2016: a holiday "
                    "other than Easter on a Saturday or Sunday makes the next working day or days non-working), and "
                    "every Council of Ministers decision 2004-2016 and 2025 (ДВ)."),
    "BG-SECONDARY": dict(name="Bulgaria (secondary sources)", country="BG", region="europe", first=2000, last=2003,
                         file="bg-secondary-holiday-gold.sexp", confidence="secondary", weekends=[(None, (6, 7))],
                         note="LOWER CONFIDENCE. 2000-2003: the чл. 154 days only; the Council of Ministers transfer "
                              "decisions of these years were not researched."),
    "GR": dict(name="Greece (public sector)", region="europe", first=2000, confidence="secondary", data=True,
               weekends=[(None, (6, 7))],
               data_note="the Ministry of Labour decisions moving 1 May (2013, 2016, 2021, 2022, 2024), from secondary copies",
               note="LOWER CONFIDENCE. Official holidays of Greece (public sector, ΠΝΠ 1980 / Ν. 1157/1981; the private-"
                    "sector days of Ν. 4808/2021 art. 60 are among them): 1 and 6 January, Clean Monday, 25 March, Good "
                    "Friday, Easter Monday, 1 May, Holy Spirit Monday, 15 August, 28 October, 25 and 26 December; 1 May "
                    "moved by ministerial decision in 2013, 2016, 2021, 2022 and 2024. Future moves are not projected."),
    "CY": dict(name="Cyprus", region="europe", first=2000, confidence="secondary", data=True,
               weekends=[(None, (6, 7))], data_note="no one-off days",
               note="LOWER CONFIDENCE. Public holidays of Cyprus as the Central Bank's yearly lists 2015-2028 carry them "
                    "(less the bank-only Easter Tuesday): 1 and 6 January, Clean Monday, 25 March, 1 April, Good Friday, "
                    "Easter Monday, 1 May, Whit Monday, 15 August, 1 October, 28 October, 25 and 26 December. No "
                    "holiday statute could be read."),
    # --- #21: Estonia, Latvia, Lithuania ---
    "EE": dict(name="Estonia", region="europe", first=2000, confidence="secondary", data=True,
               weekends=[(None, (6, 7))], data_note="no one-off days",
               note="LOWER CONFIDENCE. Riigipühad of Estonia (Pühade ja tähtpäevade seadus § 2), jõululaupäev from 2005 "
                    "(RT I 2005, 24, 185); the act was not read (Riigi Teataja did not render)."),
    "LV": dict(name="Latvia", region="europe", first=2000, gaps=(2018, 2023), weekends=[(None, (6, 7))],
               data_note="the Cabinet orders moving working days to Saturdays (rest days and working Saturdays), the "
                         "festival closing days and the one-off days off by law",
               note="Svētku dienas of Latvia: likums \"Par svētku, atceres un atzīmējamām dienām\" art. 1 (Easter and "
                    "Pentecost Sundays and Mother's Day named), 4 May from 23 Apr 2002, 24 December from 2007, and from "
                    "26 Jun 2007 the next working day off after a 4 May or 18 November on a Saturday or Sunday; every "
                    "Cabinet order moving a working day 2001-2026. 2018 and 2023 are gaps (LV-SECONDARY)."),
    "LV-SECONDARY": dict(name="Latvia (festival years)", country="LV", region="europe", first=2018, last=2023,
                         gaps=(2019, 2020, 2021, 2022), file="lv-secondary-holiday-gold.sexp", confidence="secondary",
                         weekends=[(None, (6, 7))],
                         note="LOWER CONFIDENCE. 2018 and 2023: the Song and Dance Festival closing days (8 Jul 2018, 9 "
                              "Jul 2023) were not read on a primary page; the rest of each year is primary."),
    "LT": dict(name="Lithuania", region="europe", first=2000, confidence="secondary", data=True,
               weekends=[(None, (6, 7))], data_note="no one-off days",
               note="LOWER CONFIDENCE. Švenčių dienos of Lithuania (Darbo kodeksas art. 162 / 123): Joninės from 2003, "
                    "Vėlinės from 2020, Mother's and Father's Day (first Sundays of May and June); no act was read "
                    "(e-seimas and e-tar refuse automated fetches)."),
    # --- #20: Sweden, Finland ---
    "SE": dict(name="Sweden", region="europe", first=2000, weekends=[(None, (6, 7))],
               data_note="no one-off days; the Lag (1989:253) days are rules",
               note="Allmänna helgdagar of Sweden: Lag (1989:253) 1-2 § (påskdagen and pingstdagen named; other "
                    "Sundays not listed), annandag pingst to 2004 and nationaldagen from 2005 (SFS 2004:1320, in force "
                    "1 Apr 2005). The eves are no allmänna helgdagar."),
    "FI": dict(name="Finland", region="europe", first=2005, weekends=[(None, (6, 7))],
               data_note="no one-off days; the statutory days are rules",
               note="Public holidays of Finland: the kirkolliset juhlapäivät (kirkkolaki 1054/1993 4:3, 652/2023 1:6), "
                    "itsenäisyyspäivä (388/1937), and the days vuosilomalaki 162/2005 § 4(3) counts with them "
                    "(vapunpäivä, jouluaatto, juhannusaatto, pääsiäislauantai). No uudenvuodenaatto."),
    "FI-SECONDARY": dict(name="Finland (secondary sources)", country="FI", region="europe", first=2000, last=2004,
                         file="fi-secondary-holiday-gold.sexp", confidence="secondary", weekends=[(None, (6, 7))],
                         note="LOWER CONFIDENCE. 2000-2004: the eves rest on the 1973 annual-leave act, not read; the "
                              "other days are primary."),
}


def main(argv: list[str]) -> int:
    for key in argv or list(FIXTURES):
        build(key.upper())
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
