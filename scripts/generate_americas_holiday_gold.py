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


# --- Chile ----------------------------------------------------------------
#
# Texts: Biblioteca del Congreso Nacional, leychile XML service
# (https://www.leychile.cl/Consulta/obtxml?opt=7&idLey=N), read 2026-11-27.

BCN = "https://www.bcn.cl/leychile/navegar?idLey="

CL_SOURCES = [
    ("Ley 2.977 (1915) art. 1", BCN + "2977",
     "Feriados: 1 ene, 29 jun, 15 ago, 1 nov, 8 y 25 dic; viernes y sábado de la Semana Santa; "
     "18 sep; 19 sep y 21 may."),
    ("Ley 18.432 (1985)", BCN + "18432", "29 de junio feriado legal."),
    ("Ley 19.668 (D.O. 2000-03-10)", BCN + "19668",
     "29 jun, 12 oct y (hasta Ley 20.148) Corpus Christi: al lunes de la misma semana si caen "
     "martes, miércoles o jueves; al lunes de la semana siguiente si caen viernes."),
    ("Ley 19.588 (1998), derogada por Ley 19.793 (D.O. 2002-03-06)", BCN + "19793",
     "Día de la Unidad Nacional, primer lunes de septiembre, 1999-2001."),
    ("Ley 17.374 art. 43 (texto Ley 19.790, D.O. 2002-02-01)",
     "https://www.bcn.cl/leychile/navegar?idNorma=28960",
     "El día del censo oficial es feriado legal; la fecha la fija el INE: 2002-04-24, 2017-04-19."),
    ("Ley 19.973 art. 1 (D.O. 2004-09-10)", BCN + "19973", "Feriado el 17 de septiembre de 2004."),
    ("Ley 20.148 (D.O. 2007-01-06)", BCN + "20148",
     "16 de julio, Virgen del Carmen, en reemplazo de Corpus Christi."),
    ("Ley 20.215 art. 1 (D.O. 2007-09-14), Código del Trabajo art. 35 ter", BCN + "20215",
     "Si 18 y 19 sep son martes y miércoles, feriado el lunes 17; si miércoles y jueves, el viernes 20."),
    ("Ley 20.299 (D.O. 2008-10-11)", BCN + "20299",
     "31 de octubre, Iglesias Evangélicas y Protestantes; si cae martes, al viernes anterior; "
     "si cae miércoles, al viernes siguiente."),
    ("Ley 20.450 (D.O. 2010-07-19)", BCN + "20450", "Feriados el 17 y 20 de septiembre de 2010."),
    ("Ley 20.983 (D.O. 2016-12-30)", BCN + "20983",
     "Feriado el viernes 17 sep si 18 y 19 sep son sábado y domingo; el lunes 2 ene si 1 ene es domingo."),
    ("Ley 21.357 (D.O. 2021-06-19)", BCN + "21357",
     "Día Nacional de los Pueblos Indígenas: el día del solsticio de invierno (hemisferio sur); "
     "2021: 21 de junio."),
    ("Ley 21.482 (D.O. 2022-09-10)", "https://www.bcn.cl/leychile/navegar?idNorma=1181203",
     "Feriado nacional el 16 de septiembre de 2022."),
    ("Gobierno Digital feriados API 2013-2024 (official; Wayback copies)",
     "https://apis.digital.gob.cl/fl/feriados",
     "Copies: web.archive.org/web/20210617175939id_/https://apis.digital.gob.cl/fl/feriados (2013-2020), "
     ".../20210622223224id_/.../fl/feriados/2021, .../20220204200248id_/.../fl/feriados/2022, "
     ".../20230209040653id_/.../fl/feriados/2023, .../20240630205227id_/.../fl/feriados/2024. "
     "Agree on every day except election days and five listed overrides where the act wins "
     "(2018-01-16 RM-only papal visit; 2021-06-21 Ley 21.357; 2022-06-27/28 Ley 19.668; "
     "2022-09-16 Ley 21.482)."),
    ("feriados.cl 2026-2028 (cross-check)", "https://www.feriados.cl/",
     "Lists of 2026, 2027 and 2028 citing BCN; agree with this fixture except election days."),
]

CL_NOTE = (
    "Feriados legales of every worker, from the BCN statute texts in :sources. "
    "Not included: election and plebiscite days (Ley 18.700 art. 169), which are held on "
    "Sundays (two-day votes: Saturday and Sunday) and never change business-day status; "
    "the bank-only 31 December (Ley General de Bancos art. 38); and regional days "
    "(Arica 7 jun, Chillán 20 ago). The winter solstice date is the civil date in "
    "continental Chile (UTC-4 in June) of the June solstice, Meeus ch. 27."
)

# Meeus, Astronomical Algorithms ch. 27: June solstice, periodic terms (Table 27.C).
_SOL_A = [485, 203, 199, 182, 156, 136, 77, 74, 70, 58, 52, 50, 45, 44, 29, 18, 17, 16, 14, 12, 12, 12, 9, 8]
_SOL_B = [324.96, 337.23, 342.08, 27.85, 73.14, 171.52, 222.54, 296.72, 243.58, 119.81, 297.17,
          21.02, 247.54, 325.15, 60.93, 155.12, 288.79, 198.04, 199.76, 95.39, 287.11, 320.81,
          227.73, 15.45]
_SOL_C = [1934.136, 32964.467, 20.186, 445267.112, 45036.886, 22518.443, 65928.934, 3034.906,
          9037.513, 33718.147, 150.678, 2281.226, 29929.562, 31555.956, 4443.417, 67555.328,
          4562.452, 62894.029, 31436.921, 14577.848, 31931.756, 34777.259, 1222.114, 16859.074]


def june_solstice_utc(year: int):
    import math
    from datetime import datetime
    y = (year - 2000) / 1000
    jde0 = 2451716.56767 + 365241.62603 * y + 0.00325 * y**2 + 0.00888 * y**3 - 0.00030 * y**4
    t = (jde0 - 2451545) / 36525
    w = math.radians(35999.373 * t - 2.47)
    dl = 1 + 0.0334 * math.cos(w) + 0.0007 * math.cos(2 * w)
    s = sum(a * math.cos(math.radians(b + c * t)) for a, b, c in zip(_SOL_A, _SOL_B, _SOL_C))
    jde = jde0 + 0.00001 * s / dl
    delta_t = (62.92 + 0.32217 * (year - 2000) + 0.005589 * (year - 2000) ** 2) / 86400
    return datetime(2000, 1, 1, 12) + timedelta(days=jde - delta_t - 2451545.0)


def cl_solstice(year: int) -> date:
    local = june_solstice_utc(year) - timedelta(hours=4)
    # Never within an hour of midnight in 2022-2040, so the date is robust.
    assert 1 <= local.hour <= 22 or year == 2021, (year, local)
    return local.date()


def cl_19668(d: date) -> date:
    """Ley 19.668: Tue/Wed/Thu -> Monday of that week; Fri -> next Monday."""
    wd = d.weekday()
    if wd in (1, 2, 3):
        return d - timedelta(days=wd)
    if wd == 4:
        return d + timedelta(days=3)
    return d


def cl_holidays(year: int) -> list[tuple[date, str]]:
    e = easter(year)
    out = [
        (date(year, 1, 1), "Año Nuevo"),
        (e - timedelta(days=2), "Viernes Santo"),
        (e - timedelta(days=1), "Sábado Santo"),
        (date(year, 5, 1), "Día Nacional del Trabajo"),
        (date(year, 5, 21), "Día de las Glorias Navales"),
        (cl_19668(date(year, 6, 29)), "San Pedro y San Pablo"),
        (date(year, 8, 15), "Asunción de la Virgen"),
        (date(year, 9, 18), "Independencia Nacional"),
        (date(year, 9, 19), "Día de las Glorias del Ejército"),
        (cl_19668(date(year, 10, 12)), "Encuentro de Dos Mundos"),
        (date(year, 11, 1), "Día de Todos los Santos"),
        (date(year, 12, 8), "Inmaculada Concepción"),
        (date(year, 12, 25), "Navidad"),
    ]
    if year >= 2017 and date(year, 1, 1).weekday() == 6:
        out.append((date(year, 1, 2), "Feriado nacional (Ley 20.983)"))
    if year <= 2006:
        out.append((cl_19668(e + timedelta(days=60)), "Corpus Christi"))
    if year >= 2007:
        out.append((date(year, 7, 16), "Virgen del Carmen"))
    if year <= 2001:
        first = date(year, 9, 1)
        out.append((first + timedelta(days=(7 - first.weekday()) % 7), "Día de la Unidad Nacional"))
    sep18 = date(year, 9, 18).weekday()
    if year >= 2007 and sep18 == 1:
        out.append((date(year, 9, 17), "Feriado adicional Fiestas Patrias (Ley 20.215)"))
    if year >= 2007 and sep18 == 2:
        out.append((date(year, 9, 20), "Feriado adicional Fiestas Patrias (Ley 20.215)"))
    if year >= 2017 and sep18 == 5:
        out.append((date(year, 9, 17), "Feriado adicional Fiestas Patrias (Ley 20.983)"))
    if year >= 2008:
        oct31 = date(year, 10, 31)
        wd = oct31.weekday()
        moved = oct31 - timedelta(days=4) if wd == 1 else oct31 + timedelta(days=2) if wd == 2 else oct31
        out.append((moved, "Día de las Iglesias Evangélicas y Protestantes"))
    if year == 2021:
        out.append((date(2021, 6, 21), "Día Nacional de los Pueblos Indígenas"))
    elif year >= 2022:
        out.append((cl_solstice(year), "Día Nacional de los Pueblos Indígenas"))
    one_off = {
        2002: [((4, 24), "Censo Nacional (Ley 17.374 art. 43)")],
        2004: [((9, 17), "Feriado (Ley 19.973)")],
        2010: [((9, 17), "Feriado Bicentenario (Ley 20.450)"), ((9, 20), "Feriado Bicentenario (Ley 20.450)")],
        2017: [((4, 19), "Censo Nacional (Ley 17.374 art. 43)")],
        2022: [((9, 16), "Feriado nacional (Ley 21.482)")],
    }
    for (m, d), name in one_off.get(year, []):
        out.append((date(year, m, d), name))
    return out


# Official list: the Gobierno Digital feriados API (apis.digital.gob.cl/fl/feriados),
# no longer served; pinned Wayback copies. Election and plebiscite days are
# left out of the gold (see CL_NOTE). Every other difference is listed with the
# act that wins.
CL_API_COPIES = [
    (range(2013, 2021), "20210617175939", "fl/feriados"),
    ((2021,), "20210622223224", "fl/feriados/2021"),
    ((2022,), "20220204200248", "fl/feriados/2022"),
    ((2023,), "20230209040653", "fl/feriados/2023"),
    ((2024,), "20240630205227", "fl/feriados/2024"),
]
CL_API_OVERRIDES = {
    date(2018, 1, 16): "API only: Visita del Papa Francisco, a Región Metropolitana holiday only "
                       "(boletín 11544); regional days are out of scope.",
    date(2021, 6, 21): "gold only: Ley 21.357 artículo transitorio (D.O. 2021-06-19); the copy "
                       "predates the API update.",
    date(2022, 6, 28): "API only: 29 Jun 2022 is a Wednesday, so Ley 19.668 moves it to Monday 27 Jun.",
    date(2022, 6, 27): "gold only: Ley 19.668 (see 2022-06-28).",
    date(2022, 9, 16): "gold only: Ley 21.482 (D.O. 2022-09-10); the copy is from February 2022.",
}


def _cl_api_days():
    import gzip
    import json
    import urllib.request
    cache = Path.home() / ".cache" / "cl-stack-calendars" / "cl-feriados-api"
    cache.mkdir(parents=True, exist_ok=True)
    out = {}
    for years, stamp, path in CL_API_COPIES:
        f = cache / f"{stamp}.json"
        if not f.exists():
            url = f"https://web.archive.org/web/{stamp}id_/https://apis.digital.gob.cl/{path}"
            raw = urllib.request.urlopen(urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"}),
                                         timeout=120).read()
            f.write_bytes(raw)
        raw = f.read_bytes()
        if raw[:2] == b"\x1f\x8b":
            raw = gzip.decompress(raw)
        for row in json.loads(raw):
            d = date.fromisoformat(row["fecha"])
            if d.year in years:
                out[d] = " ".join(row["nombre"].split())
    return out


def cl_official_check(days: dict) -> None:
    api = _cl_api_days()
    gold = {d for d in days if 2013 <= d.year <= 2024}
    elections = {d for d, n in api.items() if "Elecci" in n or "Plebiscito" in n or "Segunda Vuelta" in n}
    diff = (set(api) - elections) ^ gold
    unexplained = sorted(d for d in diff if d not in CL_API_OVERRIDES)
    assert not unexplained, unexplained
    assert set(CL_API_OVERRIDES) <= diff, sorted(set(CL_API_OVERRIDES) - diff)
    print(f"  CL 2013-2024: official API agrees except {len(elections)} election days and "
          f"{len(diff)} listed overrides")


def cl_crosscheck(days: dict) -> None:
    """The official API 2013-2024, then feriados.cl 2026-2028: every day either
    lists, but elections, must be in the gold."""
    cl_official_check(days)
    import re
    import urllib.request
    months = {"Enero": 1, "Febrero": 2, "Marzo": 3, "Abril": 4, "Mayo": 5, "Junio": 6, "Julio": 7,
              "Agosto": 8, "Septiembre": 9, "Octubre": 10, "Noviembre": 11, "Diciembre": 12}
    for year in (2026, 2027, 2028):
        url = "https://www.feriados.cl/" + ("" if year == 2026 else f"{year}.php")
        req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
        html = urllib.request.urlopen(req, timeout=60).read().decode("utf-8", "replace")
        general = html.split("Feriados específicos")[0]
        text = re.sub(r"\s+", " ", re.sub(r"<[^>]+>", " ", general))
        listed = {}
        for d, m, name in re.findall(r"\w+, (\d{1,2}) de (\w+) (.+?) (?:Irrenunciable )?(?:Civil|Religioso)", text):
            listed[date(year, months[m], int(d))] = name
        assert listed, f"feriados.cl {year}: nothing parsed"
        gold = {d for d in days if d.year == year}
        site = {d for d, n in listed.items() if "Elecci" not in n}
        assert site == gold, (year, sorted(site ^ gold))
        print(f"  CL {year}: feriados.cl agrees ({len(site)} days; elections left out: "
              f"{sorted(str(d) for d, n in listed.items() if 'Elecci' in n)})")


# --- Canada (federal) -----------------------------------------------------

JUSTICE = "https://laws-lois.justice.gc.ca/eng/acts/"

CA_SOURCES = [
    ("Canada Labour Code (R.S.C. 1985, c. L-2) s. 166, \"general holiday\"", JUSTICE + "L-2/",
     "New Year's Day, Good Friday, Victoria Day, Canada Day, Labour Day, National Day for Truth "
     "and Reconciliation (30 September), Thanksgiving Day, Remembrance Day, Christmas Day and "
     "Boxing Day. Read from https://laws-lois.justice.gc.ca/eng/XML/L-2.xml."),
    ("Canada Labour Code s. 193(2)", JUSTICE + "L-2/page-27.html",
     "When New Year's Day, Canada Day, NDTR, Remembrance Day, Christmas Day or Boxing Day falls on "
     "a non-working Saturday or Sunday, the employee gets the working day immediately preceding "
     "or following: no fixed calendar day, so not in this fixture."),
    ("Holidays Act (R.S.C. 1985, c. H-5) ss. 2-4", JUSTICE + "H-5/",
     "s. 2: July 1, not being a Sunday, is Canada Day; when July 1 is a Sunday, July 2 is. "
     "s. 3: Remembrance Day, 11 November. s. 4: Victoria Day, the first Monday immediately "
     "preceding May 25."),
    ("Interpretation Act (R.S.C. 1985, c. I-21) s. 35(1), \"holiday\"", JUSTICE + "I-21/",
     "Labour Day is the first Monday in September."),
    ("S.C. 2021, c. 11 (royal assent 2021-06-03)", "https://laws-lois.justice.gc.ca/eng/AnnualStatutes/2021_11/",
     "Adds the National Day for Truth and Reconciliation, 30 September, from 2021."),
    ("Canada.ca, Annual vacations and general holidays for employees working for federally regulated employers",
     "https://www.canada.ca/en/services/jobs/workplace/federal-labour-standards/vacations-holidays.html",
     "Lists the same 10 general holidays; a listed holiday on a non-working Saturday or Sunday gives "
     "a holiday with pay on the scheduled work day immediately before or after it."),
    ("Proclamation of 31 January 1957 (SOR/57-35)", "https://www.canada.ca/en/canadian-heritage/services/important-commemorative-days.html",
     "Thanksgiving Day: the second Monday in October."),
]

CA_NOTE = (
    "Federal scope: the general holidays of the Canada Labour Code (federally regulated "
    "employers), with the Holidays Act dates. Provincial holidays (Family Day, Civic Holiday, "
    "Easter Monday, Saint-Jean-Baptiste, ...) are not federal and are not here; the days every "
    "province also observes are New Year's Day, Good Friday, Canada Day, Labour Day and "
    "Christmas Day. No official machine-readable list exists; the days are the statute texts "
    "(Justice Laws XML) applied to each year."
)


def ca_holidays(year: int) -> list[tuple[date, str]]:
    e = easter(year)
    may25 = date(year, 5, 25)
    jul1 = date(year, 7, 1)
    sep1 = date(year, 9, 1)
    oct1 = date(year, 10, 1)
    out = [
        (date(year, 1, 1), "New Year's Day"),
        (e - timedelta(days=2), "Good Friday"),
        (may25 - timedelta(days=(may25.weekday() or 7)), "Victoria Day"),
        (jul1 + timedelta(days=1) if jul1.weekday() == 6 else jul1, "Canada Day"),
        (sep1 + timedelta(days=(7 - sep1.weekday()) % 7), "Labour Day"),
        (oct1 + timedelta(days=(7 - oct1.weekday()) % 7 + 7), "Thanksgiving Day"),
        (date(year, 11, 11), "Remembrance Day"),
        (date(year, 12, 25), "Christmas Day"),
        (date(year, 12, 26), "Boxing Day"),
    ]
    if year >= 2021:
        out.append((date(year, 9, 30), "National Day for Truth and Reconciliation"))
    return out


# --- Australia (national) -------------------------------------------------

AU_SOURCES = [
    ("Fair Work Act 2009 (Cth) s. 115", "https://www.legislation.gov.au/C2009A00028/latest/text",
     "Public holidays: 1 January, 26 January, Good Friday, Easter Monday, 25 April, the King's "
     "birthday holiday (on the day each State or Territory celebrates it), 25 and 26 December, "
     "and a day a State or Territory law substitutes for one of them (s. 115(2)-(3))."),
    ("State and territory public holiday acts", "https://www.fairwork.gov.au/employment-conditions/public-holidays",
     "Every State and Territory adds the Monday after a Saturday or Sunday New Year's Day or "
     "Australia Day, and moves Christmas Day and Boxing Day off a weekend to the next free "
     "weekdays. Anzac Day has no substitute in every jurisdiction, so none here."),
    ("Australian Public Holidays Dates Machine Readable Dataset (PM&C, data.gov.au)",
     "https://data.gov.au/data/dataset/australian-holidays-machine-readable-dataset",
     "Official per-jurisdiction lists 2014-2025. The national subset (days listed for all of "
     "ACT, NSW, NT, QLD, SA, TAS, VIC, WA) agrees with this fixture on every weekday except "
     "2022-09-22, which the 2022 file (March 2022) predates."),
    ("National Day of Mourning for Queen Elizabeth II, 22 September 2022",
     "https://www.fairwork.gov.au/newsroom/news/national-day-of-mourning-public-holiday",
     "A one-off public holiday declared in every State and Territory."),
]

AU_NOTE = (
    "National subset: the Fair Work Act s. 115 holidays that every State and Territory keeps "
    "on the same day, with the substitute days every jurisdiction gives. The King's (Queen's) "
    "Birthday is left out (WA and QLD keep it on other days), as are Easter Saturday and Sunday, "
    "Labour Day, Melbourne Cup and other state days. A weekend holiday stays a holiday on its "
    "own day; the substitute day is added. The state acts differ on whether a weekend Australia "
    "Day or New Year's Day itself stays a holiday, and the official data set lists them "
    "inconsistently, so its weekend days are not compared."
)


def au_holidays(year: int) -> list[tuple[date, str]]:
    e = easter(year)
    out = [
        (date(year, 1, 1), "New Year's Day"),
        (date(year, 1, 26), "Australia Day"),
        (e - timedelta(days=2), "Good Friday"),
        (e + timedelta(days=1), "Easter Monday"),
        (date(year, 4, 25), "Anzac Day"),
        (date(year, 12, 25), "Christmas Day"),
        (date(year, 12, 26), "Boxing Day"),
    ]
    for m, d, name in ((1, 1, "New Year's Day"), (1, 26, "Australia Day")):
        nominal = date(year, m, d)
        if nominal.weekday() >= 5:
            out.append((nominal + timedelta(days=7 - nominal.weekday()), name + " (substitute day)"))
    taken = {d for d, _ in out}
    for d, name in ((date(year, 12, 25), "Christmas Day"), (date(year, 12, 26), "Boxing Day")):
        if d.weekday() >= 5:
            sub = d + timedelta(days=1)
            while sub.weekday() >= 5 or sub in taken:
                sub += timedelta(days=1)
            taken.add(sub)
            out.append((sub, name + " (substitute day)"))
    if year == 2022:
        out.append((date(2022, 9, 22), "National Day of Mourning for Queen Elizabeth II"))
    return out


def au_official_check(days: dict) -> None:
    import csv
    import io
    import json
    import urllib.request
    cache = Path.home() / ".cache" / "cl-stack-calendars" / "au-public-holidays"
    cache.mkdir(parents=True, exist_ok=True)
    api = ("https://data.gov.au/data/api/3/action/package_show"
           "?id=australian-holidays-machine-readable-dataset")
    pkg = cache / "package.json"
    if not pkg.exists():
        pkg.write_bytes(urllib.request.urlopen(api, timeout=60).read())
    jurisdictions = {"act", "nsw", "nt", "qld", "sa", "tas", "vic", "wa"}
    listed: dict[date, set] = {}
    for res in json.loads(pkg.read_bytes())["result"]["resources"]:
        if "combined" in res["name"].lower():
            continue
        f = cache / (res["id"] + ".csv")
        if not f.exists():
            f.write_bytes(urllib.request.urlopen(res["url"], timeout=60).read())
        for row in csv.DictReader(io.StringIO(f.read_bytes().decode("utf-8-sig", "replace"))):
            raw = (row.get("Date") or "").strip()
            if not raw.isdigit():
                continue
            d = date(int(raw[:4]), int(raw[4:6]), int(raw[6:]))
            js = set()
            for j in (row.get("Jurisdiction") or row.get("Applicable To") or "").lower().replace("|", ",").split(","):
                j = j.strip()
                js |= jurisdictions if j in ("nat", "national") else ({j} if j else set())
            listed.setdefault(d, set()).update(js)
    national = {d for d, js in listed.items() if jurisdictions <= js and d.weekday() < 5}
    years = {d.year for d in listed}
    gold = {d for d in days if d.year in years and d.weekday() < 5}
    diff = sorted(national ^ gold)
    assert diff == [date(2022, 9, 22)], diff
    print(f"  AU {min(years)}-{max(years)}: data.gov.au national weekdays agree "
          f"({len(national)} days) except 2022-09-22 (dataset predates the declaration)")


COUNTRIES = {
    "CO": dict(name="Colombia", build=co_holidays, sources=CO_SOURCES, note=CO_NOTE,
               python=lambda years: __import__("holidays").CO(years=years)),
    "CL": dict(name="Chile", build=cl_holidays, sources=CL_SOURCES, note=CL_NOTE,
               python=lambda years: __import__("holidays").CL(years=years),
               crosscheck=cl_crosscheck),
    "CA": dict(name="Canada (federal)", build=ca_holidays, sources=CA_SOURCES, note=CA_NOTE,
               python=lambda years: __import__("holidays").CA(years=years)),
    "AU": dict(name="Australia (national)", build=au_holidays, sources=AU_SOURCES, note=AU_NOTE,
               python=lambda years: __import__("holidays").AU(years=years),
               crosscheck=au_official_check),
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
    if spec.get("crosscheck"):
        spec["crosscheck"](days)

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
