"""Czechia: dny pracovního klidu 2000-2040, transcribed from the Sbírka zákonů
(e-sbirka.cz) for egao1980/cl-stack-calendars#23. Stdlib only; data, no logic.

Cache: ~/.cache/cl-stack-calendars/cz/ (e-Sbírka JSON of 245/2000 Sb. versions, 359/2015 Sb., 93/1951 Sb., 204/1990 Sb.)

Scope: zákon 245/2000 Sb. § 3: the státní svátky (§ 1) and ostatní svátky
(§ 2) are days of rest. Before 9 Aug 2000: zákon 93/1951 Sb. (1994 text) and
204/1990 Sb.; 28 September and 17 November became days off with 245/2000, and
both fall after its entry into force, so 2000 has the same dates as 2001.
Velký pátek from 2016 (359/2015 Sb.).
"""

OBSERVE = True

_ES = "https://www.e-sbirka.cz/"

CZ_STATUTES = [
    dict(key="sb-93-1951", title="Zákon č. 93/1951 Sb., o státním svátku, o dnech pracovního klidu a o památných a "
         "významných dnech (ve znění do 8. 8. 2000); zákon ČNR č. 204/1990 Sb. (6. července)",
         uri=_ES + "sb/1951/93", issued=None, issued_uri=None, published=None, published_uri=None,
         published_in="Sbírka zákonů 93/1951 Sb.; 204/1990 Sb.", in_force=None, to="2000-08-08",
         dates_note="The 1994 consolidated version was read; the 1951 and 1990 issue dates were not.",
         summary="§ 1: 8 May, 5 Jul, 28 Oct; 204/1990: 6 Jul; § 2(2): 1 Jan, Easter Monday, 1 May, 24-26 Dec."),
    dict(key="sb-245-2000", title="Zákon č. 245/2000 Sb., o státních svátcích, o ostatních svátcích, o významných "
         "dnech a o dnech pracovního klidu", uri=_ES + "sb/2000/245", issued="2000-06-29",
         issued_uri=_ES + "sb/2000/245", published="2000-08-09", published_uri=_ES + "sb/2000/245",
         published_in="Sbírka zákonů, částka 73/2000", in_force="2000-08-09",
         summary="§ 1: 1 Jan, 8 May, 5 Jul, 6 Jul, 28 Sep, 28 Oct, 17 Nov státní svátky; § 2: 1 Jan, Easter Monday, "
                 "1 May, 24-26 Dec ostatní svátky; § 3: both are dny pracovního klidu. Nabývá účinnosti dnem "
                 "vyhlášení."),
    dict(key="sb-359-2015", title="Zákon č. 359/2015 Sb., kterým se mění zákon č. 245/2000 Sb. (Velký pátek)",
         uri=_ES + "eli/cz/sb/2015/359/2015-12-21", issued="2015-12-02",
         issued_uri=_ES + "eli/cz/sb/2015/359/2015-12-21", published="2015-12-21",
         published_uri=_ES + "eli/cz/sb/2015/359/2015-12-21", published_in="Sbírka zákonů, částka 153/2015",
         in_force="2015-12-21", summary="Čl. I: § 2 gains »Velký pátek«; first day off 25 Mar 2016."),
]

CZ_FIXED = [
    (1, 1, "Den obnovy samostatného českého státu / Nový rok", [(1993, None)], "sb-245-2000"),
    (5, 1, "Svátek práce", [(1993, None)], "sb-245-2000"),
    (5, 8, "Den vítězství", [(1993, None)], "sb-245-2000"),
    (7, 5, "Den slovanských věrozvěstů Cyrila a Metoděje", [(1993, None)], "sb-245-2000"),
    (7, 6, "Den upálení mistra Jana Husa", [(1993, None)], "sb-245-2000"),
    (9, 28, "Den české státnosti", [("2000-08-09", None)], "sb-245-2000"),
    (10, 28, "Den vzniku samostatného československého státu", [(1993, None)], "sb-245-2000"),
    (11, 17, "Den boje za svobodu a demokracii", [("2000-08-09", None)], "sb-245-2000"),
    (12, 24, "Štědrý den", [(1993, None)], "sb-245-2000"),
    (12, 25, "1. svátek vánoční", [(1993, None)], "sb-245-2000"),
    (12, 26, "2. svátek vánoční", [(1993, None)], "sb-245-2000"),
]

CZ_EASTER = [
    (-2, "Velký pátek", [(2016, None)], "sb-359-2015"),
    (1, "Velikonoční pondělí", [(1993, None)], "sb-245-2000"),
]

CZ_YEARS = {}
