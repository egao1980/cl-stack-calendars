"""Sweden: allmänna helgdagar 2000-2040, transcribed from riksdagen.se and the
SFS for egao1980/cl-stack-calendars#20. Stdlib only; data, no logic.

Cache: ~/.cache/cl-stack-calendars/se/ (sfs1989-253.html, sfsr1989-253.html, SFS2004-1320.pdf,
prop2004-05-23.txt, semesterlag1977-480.html)

Scope: Lag (1989:253) om allmänna helgdagar 1 §. Every Sunday is an allmän
helgdag; only the Sundays the law names are listed (påskdagen, pingstdagen).
Annandag pingst was one until SFS 2004:1320 (in force 1 Apr 2005) replaced it
with nationaldagen. Midsommarafton, julafton and nyårsafton are no allmänna
helgdagar; semesterlagen 3 § only equates them with Sundays for leave.
"""

from datetime import date, timedelta

OBSERVE = True

_RD = "https://www.riksdagen.se/sv/dokument-och-lagar/dokument/svensk-forfattningssamling/"

SE_STATUTES = [
    dict(key="sfs-1989-253", title="Lag (1989:253) om allmänna helgdagar", uri=_RD + "lag-1989253-om-allmanna-helgdagar_sfs-1989-253/",
         issued="1989-05-18", issued_uri=_RD + "lag-1989253-om-allmanna-helgdagar_sfs-1989-253/", published=None,
         published_uri=None, published_in="SFS 1989:253", in_force="1990-01-01",
         dates_note="The SFS issue date of 1989:253 was not read; SFSR gives utfärdad 1989-05-18, ikraft 1990-01-01.",
         summary="1 §: söndagar, däribland påskdagen och pingstdagen, nyårsdagen, trettondedag jul, första maj, juldagen "
                 "och annandag jul, långfredagen, annandag påsk, Kristi himmelsfärdsdag, (annandag pingst to 2004), "
                 "nationaldagen, midsommardagen och alla helgons dag. 2 §: midsommardagen the Saturday 20-26 June, "
                 "alla helgons dag the Saturday 31 October-6 November."),
    dict(key="sfs-2004-1320", title="Lag (2004:1320) om ändring i lagen (1989:253) om allmänna helgdagar",
         uri="https://rkrattsdb.gov.se/SFSdoc/04/041320.PDF", issued="2004-12-16",
         issued_uri="https://rkrattsdb.gov.se/SFSdoc/04/041320.PDF", published="2004-12-27",
         published_uri="https://rkrattsdb.gov.se/SFSdoc/04/041320.PDF", published_in="SFS 2004:1320 (utkom från "
         "trycket den 27 december 2004)", in_force="2005-04-01",
         summary="Nationaldagen den 6 juni becomes an allmän helgdag; annandag pingst ceases to be one (prop. "
                 "2004/05:23). Denna lag träder i kraft den 1 april 2005."),
]

SE_FIXED = [
    (1, 1, "Nyårsdagen", [(1900, None)], "sfs-1989-253"),
    (1, 6, "Trettondedag jul", [(1900, None)], "sfs-1989-253"),
    (5, 1, "Första maj", [(1900, None)], "sfs-1989-253"),
    (6, 6, "Nationaldagen", [(2005, None)], "sfs-2004-1320"),
    (12, 25, "Juldagen", [(1900, None)], "sfs-1989-253"),
    (12, 26, "Annandag jul", [(1900, None)], "sfs-1989-253"),
]

SE_EASTER = [
    (-2, "Långfredagen", [(1900, None)], "sfs-1989-253"),
    (0, "Påskdagen", [(1900, None)], "sfs-1989-253"),
    (1, "Annandag påsk", [(1900, None)], "sfs-1989-253"),
    (39, "Kristi himmelsfärdsdag", [(1900, None)], "sfs-1989-253"),
    (49, "Pingstdagen", [(1900, None)], "sfs-1989-253"),
    (50, "Annandag pingst", [(1900, 2004)], "sfs-2004-1320"),
]


def _saturday(y, m, d):
    start = date(y, m, d)
    return [start + timedelta(days=(6 - start.isoweekday()) % 7)]


SE_COMPUTED = [
    ("Midsommardagen", lambda y: _saturday(y, 6, 20), [(1900, None)], "sfs-1989-253"),
    ("Alla helgons dag", lambda y: _saturday(y, 10, 31), [(1953, None)], "sfs-1989-253"),
]

SE_YEARS = {}
