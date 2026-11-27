#!/usr/bin/env python3
# /// script
# requires-python = ">=3.10"
# dependencies = ["holidays==0.109"]
# ///
"""Build the Americas national-holiday gold fixtures, data/tests/<cc>-holiday-gold.sexp.

Regenerate one country (or all with no argument):

    uv run --no-project --with holidays==0.109 python -I scripts/generate_americas_holiday_gold.py CO

Each fixture lists every national holiday 2000-2040 as (YEAR MONTH DAY "name").
The days come from the primary sources cited in the fixture's :sources: an
official machine-readable list where one is fetchable, otherwise the statute
text itself, transcribed below article by article. This script never reads
the Lisp starters, so the fixture is an independent check of them.

Python `holidays` is a secondary source only: the script prints every day on
which it disagrees with the fixture, with no effect on the fixture.
"""

from __future__ import annotations

import sys
from datetime import date, timedelta
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
FIRST, LAST = 2000, 2040
GENERATED = "2026-11-27"


def easter(year: int) -> date:
    """Western (Gregorian) Easter Sunday: the anonymous Gregorian algorithm."""
    a = year % 19
    b, c = divmod(year, 100)
    d, e = divmod(b, 4)
    f = (b + 8) // 25
    g = (b - f + 1) // 3
    h = (19 * a + b - d - g + 15) % 30
    i, k = divmod(c, 4)
    l = (32 + 2 * e + 2 * i - h - k) % 7
    m = (a + 11 * h + 22 * l) // 451
    month, day = divmod(h + l - 7 * m + 114, 31)
    return date(year, month, day + 1)


def next_monday(d: date) -> date:
    """D itself when it is a Monday, else the following Monday."""
    return d + timedelta(days=(7 - d.weekday()) % 7)


# --- Colombia -------------------------------------------------------------

CO_SOURCES = [
    (
        "Ley 51 de 1983 (Ley Emiliani) art. 1",
        "https://www.funcionpublica.gov.co/eva/gestornormativo/norma.php?i=4954",
        "Festivos: 1 ene, 6 ene, 19 mar, 1 may, 29 jun, 20 jul, 7 ago, 15 ago, 12 oct, "
        "1 nov, 11 nov, 8 dic, 25 dic, Jueves y Viernes Santos, Ascensión, Corpus Christi, "
        "Sagrado Corazón. Inciso 2: 6 ene, 19 mar, 29 jun, 15 ago, 12 oct, 1 nov, 11 nov, "
        "Ascensión, Corpus Christi y Sagrado Corazón, cuando no caigan en lunes, se "
        "trasladan al lunes siguiente.",
    ),
    (
        "Ley 2578 de 2026 art. 6 (D.O. 53.510, 2 jun 2026)",
        "http://www.secretariasenado.gov.co/senado/basedoc/ley_2578_2026.html",
        "Día de Nuestra Señora del Rosario de Chiquinquirá, 9 de julio, festivo nacional; "
        "se aplica la Ley 51 de 1983 (traslado al lunes). Rige desde su promulgación.",
    ),
]

CO_NOTE = (
    "Colombia publishes no official machine-readable festivos list (none on "
    "datos.gov.co); the days are the statute texts in :sources applied to each "
    "year. Easter Sunday is not a festivo."
)


def co_holidays(year: int) -> list[tuple[date, str]]:
    e = easter(year)
    out = [
        (date(year, 1, 1), "Año Nuevo"),
        (next_monday(date(year, 1, 6)), "Día de los Reyes Magos"),
        (next_monday(date(year, 3, 19)), "Día de San José"),
        (e - timedelta(days=3), "Jueves Santo"),
        (e - timedelta(days=2), "Viernes Santo"),
        (date(year, 5, 1), "Día del Trabajo"),
        # Ascensión is Thursday Easter+39, Corpus Christi Thursday Easter+60,
        # Sagrado Corazón Friday Easter+68; all three move to the next Monday.
        (next_monday(e + timedelta(days=39)), "Ascensión"),
        (next_monday(e + timedelta(days=60)), "Corpus Christi"),
        (next_monday(e + timedelta(days=68)), "Sagrado Corazón"),
        (next_monday(date(year, 6, 29)), "San Pedro y San Pablo"),
        (date(year, 7, 20), "Día de la Independencia"),
        (date(year, 8, 7), "Batalla de Boyacá"),
        (next_monday(date(year, 8, 15)), "Asunción"),
        (next_monday(date(year, 10, 12)), "Día de la Raza"),
        (next_monday(date(year, 11, 1)), "Todos los Santos"),
        (next_monday(date(year, 11, 11)), "Independencia de Cartagena"),
        (date(year, 12, 8), "Inmaculada Concepción"),
        (date(year, 12, 25), "Navidad"),
    ]
    if year >= 2026:
        out.append((next_monday(date(year, 7, 9)), "Nuestra Señora del Rosario de Chiquinquirá"))
    return out


COUNTRIES = {
    "CO": dict(name="Colombia", build=co_holidays, sources=CO_SOURCES, note=CO_NOTE,
               python=lambda years: __import__("holidays").CO(years=years)),
}


# --- writer ---------------------------------------------------------------


def lisp_string(s: str) -> str:
    return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'


def build(cc: str) -> None:
    spec = COUNTRIES[cc]
    days: dict[date, list[str]] = {}
    for year in range(FIRST, LAST + 1):
        for d, name in spec["build"](year):
            assert d.year == year, (cc, d, name)
            days.setdefault(d, []).append(name)
    lines = [
        f";; {spec['name']} national holidays {FIRST}-{LAST}: external gold for {cc}.",
        f";; Regenerate: uv run --no-project --with holidays==0.109 python -I "
        f"scripts/generate_americas_holiday_gold.py {cc}",
        ";; :days lists every holiday as (YEAR MONTH DAY NAME); any other day is not one.",
        "(",
        f" :country {lisp_string(cc)}",
        f" :generated {lisp_string(GENERATED)}",
        f" :from {FIRST} :to {LAST}",
        f" :note {lisp_string(spec['note'])}",
        " :sources",
        " (",
    ]
    for title, uri, text in spec["sources"]:
        lines.append(f"  (:title {lisp_string(title)} :uri {lisp_string(uri)}")
        lines.append(f"   :text {lisp_string(text)})")
    lines.append(" )")
    lines.append(" :days")
    lines.append(" (")
    for d in sorted(days):
        lines.append(f"  ({d.year} {d.month} {d.day} {lisp_string(' / '.join(days[d]))})")
    lines.append(" ))")
    out = ROOT / "data" / "tests" / f"{cc.lower()}-holiday-gold.sexp"
    out.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"{cc}: {len(days)} days -> {out.relative_to(ROOT)}")

    # Secondary check only.
    try:
        py = spec["python"](range(FIRST, LAST + 1))
    except ImportError:
        print(f"{cc}: python-holidays not installed, secondary check skipped")
        return
    ours, theirs = set(days), set(py.keys())
    for d in sorted(ours - theirs):
        print(f"  {cc} {d} gold only: {days[d]}")
    for d in sorted(theirs - ours):
        print(f"  {cc} {d} python-holidays only: {py.get(d)}")
    print(f"{cc}: {len(ours ^ theirs)} differences with python-holidays {__import__('holidays').__version__}")


def main(argv: list[str]) -> int:
    for cc in argv or sorted(COUNTRIES):
        build(cc.upper())
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
