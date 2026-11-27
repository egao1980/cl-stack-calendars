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


# --- Mexico ---------------------------------------------------------------
#
# LFT text: Cámara de Diputados consolidated PDF (última reforma DOF 14-05-2026),
# read from the Wayback copy web.archive.org/web/20261114035538id_/https://www.diputados.gob.mx/LeyesBiblio/pdf/LFT.pdf
# (diputados.gob.mx refuses connections from here). DOF 17-01-2006 decree read
# from web.archive.org/web/20061109151610id_/http://www.ordenjuridico.gob.mx/Federal/PE/APF/APC/STPS/Decretos/2006/17012006(1).pdf

MX_SOURCES = [
    ("Ley Federal del Trabajo art. 74 (texto vigente, última reforma DOF 14-05-2026)",
     "https://www.diputados.gob.mx/LeyesBiblio/pdf/LFT.pdf",
     "Son días de descanso obligatorio: I. 1o. de enero; II. primer lunes de febrero en conmemoración "
     "del 5 de febrero; III. tercer lunes de marzo en conmemoración del 21 de marzo; IV. 1o. de mayo; "
     "V. 16 de septiembre; VI. tercer lunes de noviembre en conmemoración del 20 de noviembre; VII. 1o. "
     "de octubre de cada seis años, cuando corresponda a la transmisión del Poder Ejecutivo Federal "
     "(fracción reformada DOF 30-09-2024); VIII. 25 de diciembre; IX. el que determinen las leyes "
     "electorales para la jornada electoral. Artículo reformado DOF 22-12-1987, 17-01-2006."),
    ("Decreto por el que se reforma el artículo 74 de la LFT (DOF 17-01-2006)",
     "https://www.ordenjuridico.gob.mx/Federal/PE/APF/APC/STPS/Decretos/2006/17012006(1).pdf",
     "Fracciones II, III y VI pasan a primer lunes de febrero, tercer lunes de marzo y tercer lunes de "
     "noviembre; fracción VII: 1o. de diciembre de cada seis años. Transitorio primero: vigor al día "
     "siguiente de su publicación. Transitorio segundo: por la conmemoración en 2006 del natalicio de "
     "Benito Juárez, la fracción III tendrá vigencia a partir del año 2007 (2006: 21 de marzo)."),
    ("Decreto por el que se reforma la fracción VII del artículo 74 de la LFT (DOF 30-09-2024)",
     "https://gaceta.diputados.gob.mx/PDF/66/2024/sep/DOF30sep2024-Art74LeyFedTrabajo.pdf",
     "VII. El 1o. de octubre de cada seis años, cuando corresponda a la transmisión del Poder Ejecutivo "
     "Federal. Vigor al día siguiente de su publicación (1 Oct 2024)."),
    ("Constitución art. 83 (reforma DOF 10-02-2014, transitorio décimo quinto)",
     "https://www.diputados.gob.mx/LeyesBiblio/pdf/CPEUM.pdf",
     "El Presidente entrará a ejercer su encargo el 1o. de octubre; el periodo 2018-2024 terminará el "
     "30 de septiembre de 2024. Inauguraciones: 1 dic 2000, 2006, 2012, 2018; 1 oct 2024, 2030, 2036."),
]

MX_NOTE = (
    "Días de descanso obligatorio of LFT art. 74 (every worker). Not included: fr. IX election days "
    "(federal and local ordinary elections are held on Sundays, so they never change business-day "
    "status), and bank-only days (CNBV: Jueves/Viernes Santo, 2 Nov, 12 Dec), which are not LFT days. "
    "Mexico publishes no official machine-readable list; the days are the LFT text and its DOF "
    "decrees applied to each year."
)


def nth_monday(year: int, month: int, n: int) -> date:
    first = date(year, month, 1)
    return first + timedelta(days=(7 - first.weekday()) % 7 + 7 * (n - 1))


def mx_holidays(year: int) -> list[tuple[date, str]]:
    monday = year >= 2006  # DOF 17-01-2006, in force 18 Jan 2006
    out = [
        (date(year, 1, 1), "Año Nuevo"),
        (nth_monday(year, 2, 1) if monday else date(year, 2, 5), "Día de la Constitución"),
        # Transitorio segundo: fracción III from 2007; 21 March 2006 is the bicentennial.
        (nth_monday(year, 3, 3) if year >= 2007 else date(year, 3, 21), "Natalicio de Benito Juárez"),
        (date(year, 5, 1), "Día del Trabajo"),
        (date(year, 9, 16), "Día de la Independencia"),
        (nth_monday(year, 11, 3) if monday else date(year, 11, 20), "Día de la Revolución"),
        (date(year, 12, 25), "Navidad"),
    ]
    if year % 6 == 2:  # 2000, 2006, ..., 2036
        out.append((date(year, 10, 1) if year >= 2024 else date(year, 12, 1),
                    "Transmisión del Poder Ejecutivo Federal"))
    return out


# --- Peru -----------------------------------------------------------------
#
# Texts: leyes.congreso.gob.pe (DL 713 scan; consolidated "TXM" texts of the
# later laws), read 2026-11-27.

CONGRESO = "https://leyes.congreso.gob.pe/Documentos/"

PE_SOURCES = [
    ("Decreto Legislativo 713 (El Peruano 1991-11-08) art. 6", CONGRESO + "DecretosLegislativos/00713.pdf",
     "Feriados: Año Nuevo 1 ene; Jueves Santo y Viernes Santo (movibles); Día del Trabajo 1 may; "
     "San Pedro y San Pablo 29 jun; Fiestas Patrias 28 y 29 jul; Santa Rosa de Lima 30 ago; "
     "Combate de Angamos 8 oct; Todos los Santos 1 nov; Inmaculada Concepción 8 dic; Navidad 25 dic."),
    ("Ley 26331 (El Peruano 1994-06-23), art. 7 del DL 713", "https://docs.peru.justia.com/federales/leyes/26331-jun-22-1994.pdf",
     "Los feriados se celebran en la fecha respectiva (no se trasladan al lunes)."),
    ("Ley 31381 (El Peruano 2021-12-31)", CONGRESO + "2021_2026/ADLP/Texto_Consolidado/31381-TXM.pdf",
     "Incorpora el 9 de diciembre, Batalla de Ayacucho, como feriado nacional (desde 2022)."),
    ("Ley 31530 (El Peruano 2022-07-26)", CONGRESO + "2021_2026/ADLP/Texto_Consolidado/31530-TXM.pdf",
     "Incorpora el 6 de agosto, Batalla de Junín, como feriado nacional (desde 2022)."),
    ("Ley 31822 (El Peruano 2023-07-08)", CONGRESO + "2021_2026/ADLP/Texto_Consolidado/31822-TXM.pdf",
     "23 de julio, Día de la Fuerza Aérea del Perú, feriado nacional (modifica art. 6 del DL 713; desde 2023)."),
    ("Ley 31788 (El Peruano 2023-06-15)", CONGRESO + "2021_2026/ADLP/Texto_Consolidado/31788-TXM.pdf",
     "7 de junio, Batalla de Arica y Día de la Bandera, feriado nacional; published after 7 Jun 2023, "
     "so first observed 2024."),
    ("gob.pe Feriados históricos 2018-2025 (official list)", "https://www.gob.pe/feriados/historicos?year=2025",
     "Nacionales lists for 2018, 2019 and 2021-2025 (2017 and 2020 are incomplete there) agree with this fixture except the listed overrides "
     "(días no laborables, Domingo de Resurrección, Inti Raymi, 2022's missing 1 January)."),
]

PE_NOTE = (
    "Feriados of DL 713 art. 6 and the later laws in :sources (every worker, public and private), on "
    "their own dates. Not included: días no laborables declared by Decreto Supremo (public sector; "
    "private sector by agreement, e.g. DS 151-2022-PCM, DS 042-2025-PCM), including the APEC 2016 and "
    "2024 days in Lima and Callao, which are not feriados; Easter Sunday; regional days (Inti Raymi, "
    "Cusco). Ley 30002 (2013) concerns teachers' pay, not feriados."
)


def pe_holidays(year: int) -> list[tuple[date, str]]:
    e = easter(year)
    out = [
        (date(year, 1, 1), "Año Nuevo"),
        (e - timedelta(days=3), "Jueves Santo"),
        (e - timedelta(days=2), "Viernes Santo"),
        (date(year, 5, 1), "Día del Trabajo"),
        (date(year, 6, 29), "San Pedro y San Pablo"),
        (date(year, 7, 28), "Fiestas Patrias"),
        (date(year, 7, 29), "Fiestas Patrias"),
        (date(year, 8, 30), "Santa Rosa de Lima"),
        (date(year, 10, 8), "Combate de Angamos"),
        (date(year, 11, 1), "Todos los Santos"),
        (date(year, 12, 8), "Inmaculada Concepción"),
        (date(year, 12, 25), "Navidad"),
    ]
    if year >= 2022:
        out.append((date(year, 8, 6), "Batalla de Junín"))
        out.append((date(year, 12, 9), "Batalla de Ayacucho"))
    if year >= 2023:
        out.append((date(year, 7, 23), "Día de la Fuerza Aérea del Perú"))
    if year >= 2024:
        out.append((date(year, 6, 7), "Batalla de Arica y Día de la Bandera"))
    return out


PE_OFFICIAL_YEARS = (2018, 2019, 2021, 2022, 2023, 2024, 2025)
PE_OVERRIDES = {
    date(2018, 4, 1): "gob.pe only: Domingo de Resurrección, not a DL 713 feriado.",
    date(2019, 4, 21): "gob.pe only: Domingo de Resurrección, not a DL 713 feriado.",
    date(2018, 6, 24): "gob.pe only: Inti Raymi, a Cusco regional day.",
    date(2022, 1, 1): "gold only: DL 713 art. 6; the gob.pe 2022 page leaves it out.",
    date(2022, 12, 9): "gold only: Ley 31381 feriado; the gob.pe 2022 page calls it a día no laborable.",
}


def pe_official_check(days: dict) -> None:
    import html as htmlmod
    import re
    import urllib.request
    months = {m: i + 1 for i, m in enumerate(
        "enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre".split())}
    cache = Path.home() / ".cache" / "cl-stack-calendars" / "pe-gob-feriados"
    cache.mkdir(parents=True, exist_ok=True)
    diff_all = set()
    for year in PE_OFFICIAL_YEARS:
        f = cache / f"{year}.html"
        if not f.exists():
            url = f"https://www.gob.pe/feriados/historicos?year={year}"
            f.write_bytes(urllib.request.urlopen(urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"}),
                                                 timeout=60).read())
        page = f.read_bytes().decode("utf-8", "replace")
        national = page.split("Nacionales:", 1)[1].split("<h2", 1)[0]
        listed = {}
        for d, m, name in re.findall(r"<strong[^>]*>\w+ (\d{1,2}) de (\w+)</strong><span[^>]*>([^<]*)</span>", national):
            name = htmlmod.unescape(name)
            if "no laborable" in name.lower():
                continue
            listed[date(year, months[m.lower()], int(d))] = name
        assert listed, f"gob.pe {year}: nothing parsed"
        gold = {d for d in days if d.year == year}
        diff_all |= set(listed) ^ gold
    unexplained = sorted(d for d in diff_all if d not in PE_OVERRIDES)
    assert not unexplained, unexplained
    assert set(PE_OVERRIDES) <= diff_all, sorted(set(PE_OVERRIDES) - diff_all)
    print(f"  PE {PE_OFFICIAL_YEARS}: gob.pe agrees except {len(diff_all)} listed overrides "
          f"(días no laborables left out)")


# --- Brazil ---------------------------------------------------------------
#
# Texts: planalto.gov.br (Presidência da República), read 2026-11-27.

PLANALTO = "https://www.planalto.gov.br/ccivil_03/"

BR_SOURCES = [
    ("Lei nº 662/1949 art. 1 (redação da Lei nº 10.607/2002, DOU 2002-12-20)", PLANALTO + "leis/l0662.htm",
     "São feriados nacionais os dias 1º de janeiro, 21 de abril, 1º de maio, 7 de setembro, 2 de "
     "novembro, 15 de novembro e 25 de dezembro. Art. 3º: os pontos facultativos não suspendem o "
     "horário escolar nem os serviços forenses e notariais."),
    ("Lei nº 10.607/2002", PLANALTO + "leis/2002/l10607.htm",
     "Dá nova redação ao art. 1º da Lei 662/1949 (adds 21 de abril and 2 de novembro to its text) and "
     "revokes Lei nº 1.266/1950."),
    ("Lei nº 1.266/1950 (revogada em 2002)", PLANALTO + "leis/l1266.htm",
     "Art. 1º: feriado nacional o dia de eleições gerais; art. 3º: feriado nacional o dia 21 de abril."),
    ("Lei nº 6.802/1980", PLANALTO + "leis/l6802.htm",
     "É declarado feriado nacional o dia 12 de outubro, para culto público e oficial a Nossa Senhora "
     "Aparecida, Padroeira do Brasil."),
    ("Lei nº 9.093/1995", PLANALTO + "leis/l9093.htm",
     "Art. 1º: feriados civis: os declarados em lei federal; a data magna do Estado; centenário do "
     "Município. Art. 2º: feriados religiosos, declarados em lei municipal, em número não superior a "
     "quatro, neste incluída a Sexta-Feira da Paixão."),
    ("Lei nº 14.759/2023 (DOU 2023-12-22)", PLANALTO + "_ato2023-2026/2023/lei/l14759.htm",
     "Fica declarado feriado nacional o dia 20 de novembro, Dia Nacional de Zumbi e da Consciência "
     "Negra. Vigor na data de sua publicação: first observed 2024."),
    ("Portarias anuais de feriados nacionais e pontos facultativos (MPOG/ME/MGI), 2005-2026",
     "https://www.in.gov.br/web/dou/-/portaria-mgi-n-11.460-de-29-de-dezembro-de-2025-678388627",
     "Federal executive list for the federal administration. 19 portarias (2005, 2007, 2008, 2011-2026; "
     "2019-2026 from the DOU on in.gov.br) agree with this fixture on every feriado nacional except "
     "Paixão de Cristo 2008, 2011 and 2012 (ponto facultativo there). Carnaval, Quarta-feira de Cinzas, "
     "Corpus Christi, Dia do Servidor and 24/31 December are pontos facultativos in every year."),
    ("Lei nº 4.737/1965 (Código Eleitoral) art. 380", PLANALTO + "leis/l4737compilado.htm",
     "Será feriado nacional o dia em que se realizarem eleições de data fixada pela Constituição "
     "Federal: always a Sunday (CF art. 77, 28, 29), so not in this fixture."),
]

BR_NOTE = (
    "Feriados nacionais. Paixão de Cristo (Good Friday) is a religious holiday under Lei 9.093/1995 "
    "art. 2, declared by municipal law; the yearly federal portarias list it as a feriado nacional "
    "(2005, 2007, 2013-2026) and as a ponto facultativo in 2008, 2011 and 2012. It is here every year: "
    "Lei 9.093 names it and the corpus, banks and later portarias keep it. 2 November is in the Lei 662/1949 text only from Lei 10.607/2002 (DOU 2002-12-20); "
    "it was kept nationally before (the portarias list it, the law ratified it), so it is here from "
    "2000. Not included: Carnaval (Monday and Tuesday), Quarta-feira de Cinzas (until 14h), Corpus "
    "Christi, Dia do Servidor Público, 24 and 31 December (from 14h): these are federal pontos "
    "facultativos (optional days off for federal staff, Lei 662 art. 3), not holidays; state and "
    "municipal holidays; election days (Código Eleitoral art. 380, always a Sunday)."
)


def br_holidays(year: int) -> list[tuple[date, str]]:
    e = easter(year)
    out = [
        (date(year, 1, 1), "Confraternização Universal"),
        (e - timedelta(days=2), "Paixão de Cristo"),
        (date(year, 4, 21), "Tiradentes"),
        (date(year, 5, 1), "Dia Mundial do Trabalho"),
        (date(year, 9, 7), "Independência do Brasil"),
        (date(year, 10, 12), "Nossa Senhora Aparecida"),
        (date(year, 11, 2), "Finados"),
        (date(year, 11, 15), "Proclamação da República"),
        (date(year, 12, 25), "Natal"),
    ]
    if year >= 2024:
        out.append((date(year, 11, 20), "Dia Nacional de Zumbi e da Consciência Negra"))
    return out


# Official check: the yearly federal portaria (MPOG / ME / MGI) "divulga os dias de
# feriados nacionais e estabelece os dias de ponto facultativo". Frozen below: the
# days each one classifies as "feriado nacional" (MM-DD), transcribed from the text.
# 2019-2026 are the DOU pages on in.gov.br (pinned Wayback copies), 2016 a scan of
# the DOU page; the other years are transcriptions on legisweb / normasbrasil
# (no reachable government copy). 2006, 2009 and 2010: no text found.
BR_PORTARIAS = {
    2005: ('Portaria SE/MP nº 1.080, de 21 de dezembro de 2004',
           'https://www.normasbrasil.com.br/norma/portaria-1080-2004_187085.html',
           'unofficial transcription', "01-01 03-25 04-21 05-01 09-07 10-12 11-02 11-15 12-25"),
    2007: ('Portaria SE/MP nº 740, de 27 de dezembro de 2006',
           'https://www.normasbrasil.com.br/norma/portaria-740-2006_197539.html',
           'unofficial transcription', "01-01 04-06 04-21 05-01 09-07 10-12 11-02 11-15 12-25"),
    2008: ('Portaria SE/MP nº 855, de 26 de dezembro de 2007',
           'https://www.normasbrasil.com.br/norma/portaria-855-2007_202989.html',
           'unofficial transcription', "01-01 04-21 05-01 09-07 10-12 11-02 11-15 12-25"),
    2011: ('Portaria SE/MP nº 735, de 1º de dezembro de 2010',
           'https://www.normasbrasil.com.br/norma/resolucao-735-2010_112053.html',
           'unofficial transcription', "01-01 04-21 05-01 09-07 10-12 11-02 11-15 12-25"),
    2012: ('Portaria MP nº 595, de 22 de dezembro de 2011',
           'https://www.normasbrasil.com.br/norma/portaria-595-2011_233484.html',
           'unofficial transcription', "01-01 04-21 05-01 09-07 10-12 11-02 11-15 12-25"),
    2013: ('Portaria MP nº 3, de 3 de janeiro de 2013',
           'https://www.legisweb.com.br/legislacao/?id=249528',
           'unofficial transcription', "01-01 03-29 04-21 05-01 09-07 10-12 11-02 11-15 12-25"),
    2014: ('Portaria MP nº 2, de 3 de janeiro de 2014',
           'https://www.normasbrasil.com.br/norma/portaria-2-2014_264087.html',
           'unofficial transcription', "01-01 04-18 04-21 05-01 09-07 10-12 11-02 11-15 12-25"),
    2015: ('Portaria MP nº 15, de 3 de fevereiro de 2015',
           'https://www.legisweb.com.br/legislacao/?id=280813',
           'unofficial transcription', "01-01 04-03 04-21 05-01 09-07 10-12 11-02 11-15 12-25"),
    2016: ('Portaria MP nº 630, de 31 de dezembro de 2015',
           'https://www2.dti.ufv.br/ccs_noticias/files/anexos/phpcqPy6J_24587.pdf',
           'DOU scan (ufv.br)', "01-01 03-25 04-21 05-01 09-07 10-12 11-02 11-15 12-25"),
    2017: ('Portaria MP nº 369, de 29 de novembro de 2016',
           'https://www.legisweb.com.br/legislacao/?id=332406',
           'unofficial transcription', "01-01 04-14 04-21 05-01 09-07 10-12 11-02 11-15 12-25"),
    2018: ('Portaria MP nº 468, de 22 de dezembro de 2017',
           'https://itapina.ifes.edu.br/images/arquivo_em_pdf/Portaria_468_2017_Feriados_Nacionais.pdf',
           'retyped copy (ifes.edu.br)', "01-01 03-30 04-21 05-01 09-07 10-12 11-02 11-15 12-25"),
    2019: ('Portaria MP nº 442, de 27 de dezembro de 2018',
           'https://web.archive.org/web/20190106083717id_/http://www.in.gov.br:80/materia/-/asset_publisher/Kujrw0TZC2Mb/content/id/57219246',
           'DOU (in.gov.br, Wayback copy)', "01-01 04-19 04-21 05-01 09-07 10-12 11-02 11-15 12-25"),
    2020: ('Portaria ME nº 679, de 30 de dezembro de 2019',
           'https://web.archive.org/web/20200227171304id_/http://www.in.gov.br:80/web/dou/-/portaria-n-679-de-30-de-dezembro-de-2019-236173164',
           'DOU (in.gov.br, Wayback copy)', "01-01 04-10 04-21 05-01 09-07 10-12 11-02 11-15 12-25"),
    2021: ('Portaria ME nº 430, de 30 de dezembro de 2020',
           'https://web.archive.org/web/20210119191458id_/https://www.in.gov.br/web/dou/-/portaria-n-430-de-30-de-dezembro-de-2020-297214729',
           'DOU (in.gov.br, Wayback copy)', "01-01 04-02 04-21 05-01 09-07 10-12 11-02 11-15 12-25"),
    2022: ('Portaria ME nº 14.817, de 20 de dezembro de 2021',
           'https://web.archive.org/web/20211223021155id_/https://www.in.gov.br/web/dou/-/portaria-me-n-14.817-de-20-de-dezembro-de-2021-369345454',
           'DOU (in.gov.br, Wayback copy)', "01-01 04-15 04-21 05-01 09-07 10-12 11-02 11-15 12-25"),
    2023: ('Portaria ME nº 11.090, de 27 de dezembro de 2022',
           'https://web.archive.org/web/20230124195548id_/https://www.in.gov.br/web/dou/-/portaria-me-n-11.090-de-27-de-dezembro-de-2022-454503426',
           'DOU (in.gov.br, Wayback copy)', "01-01 04-07 04-21 05-01 09-07 10-12 11-02 11-15 12-25"),
    2024: ('Portaria MGI nº 8.617, de 26 de dezembro de 2023',
           'https://web.archive.org/web/20240504074553id_/https://www.in.gov.br/web/dou/-/portaria-mgi-n-8.617-de-26-de-dezembro-de-2023-533937211',
           'DOU (in.gov.br, Wayback copy)', "01-01 03-29 04-21 05-01 09-07 10-12 11-02 11-15 11-20 12-25"),
    2025: ('Portaria MGI nº 9.783, de 27 de dezembro de 2024',
           'https://web.archive.org/web/20250403223606id_/https://www.in.gov.br/web/dou/-/portaria-mgi-n-9.783-de-27-de-dezembro-de-2024-604395869',
           'DOU (in.gov.br, Wayback copy)', "01-01 04-18 04-21 05-01 09-07 10-12 11-02 11-15 11-20 12-25"),
    2026: ('Portaria MGI nº 11.460, de 29 de dezembro de 2025',
           'https://web.archive.org/web/20251230123128id_/https://in.gov.br/web/dou/-/portaria-mgi-n-11.460-de-29-de-dezembro-de-2025-678388627',
           'DOU (in.gov.br, Wayback copy)', "01-01 04-03 04-21 05-01 09-07 10-12 11-02 11-15 11-20 12-25"),
}

BR_PORTARIA_OVERRIDES = {
    date(2008, 3, 21): "gold only: the 2008 portaria classes Paixão de Cristo as ponto facultativo.",
    date(2011, 4, 22): "gold only: the 2011 portaria classes Paixão de Cristo as ponto facultativo.",
    date(2012, 4, 6): "gold only: the 2012 portaria classes Paixão de Cristo as ponto facultativo.",
}


def br_official_check(days: dict) -> None:
    diff = set()
    for year, (_, _, _, listed) in BR_PORTARIAS.items():
        official = {date(year, int(md[:2]), int(md[3:])) for md in listed.split()}
        diff |= official ^ {d for d in days if d.year == year}
    unexplained = sorted(d for d in diff if d not in BR_PORTARIA_OVERRIDES)
    assert not unexplained, unexplained
    assert set(BR_PORTARIA_OVERRIDES) <= diff, sorted(set(BR_PORTARIA_OVERRIDES) - diff)
    print(f"  BR {len(BR_PORTARIAS)} portarias ({min(BR_PORTARIAS)}-{max(BR_PORTARIAS)}): feriados "
          f"nacionais agree except {len(diff)} listed overrides (Paixão de Cristo 2008, 2011, 2012)")


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
    "MX": dict(name="Mexico", build=mx_holidays, sources=MX_SOURCES, note=MX_NOTE,
               python=lambda years: __import__("holidays").MX(years=years)),
    "BR": dict(name="Brazil", build=br_holidays, sources=BR_SOURCES, note=BR_NOTE,
               python=lambda years: __import__("holidays").BR(years=years),
               crosscheck=br_official_check),
    "PE": dict(name="Peru", build=pe_holidays, sources=PE_SOURCES, note=PE_NOTE,
               python=lambda years: __import__("holidays").PE(years=years),
               crosscheck=pe_official_check),
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
