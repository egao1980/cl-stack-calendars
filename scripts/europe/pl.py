"""Poland: dni wolne od pracy 2000-2040, transcribed from ISAP (isap.sejm.gov.pl)
for egao1980/cl-stack-calendars#23. Stdlib only; data, no logic.

Cache: ~/.cache/cl-stack-calendars/pl/ (ISAP pages and Dz.U. PDFs of the acts below)

Scope: ustawa z 18 stycznia 1951 r. o dniach wolnych od pracy, art. 1 pkt 1
(art. 1 pkt 2, "niedziele", is all Sundays and is not listed). The named
Sundays are listed: pierwszy dzień Wielkiej Nocy (lit. c) and pierwszy dzień
Zielonych Świątek (lit. g). The 2000-2010 list is the 1951 act as amended in
1960, 1989 and 1990 (no consolidated text of that period exists).
"""

OBSERVE = True

_ISAP = "https://isap.sejm.gov.pl/isap.nsf/DocDetails.xsp?id="

PL_STATUTES = [
    dict(key="u-1951", title="Ustawa z dnia 18 stycznia 1951 r. o dniach wolnych od pracy (Dz.U. 1951 nr 4 poz. 28; "
         "t.j. Dz.U. 2025 poz. 296)", uri=_ISAP + "WDU19510040028", issued="1951-01-18",
         issued_uri=_ISAP + "WDU19510040028", published="1951-01-25", published_uri=_ISAP + "WDU19510040028",
         published_in="Dz.U. 1951 nr 4 poz. 28", in_force="1951-01-19",
         dates_note="ISAP gives in force 19 Jan 1951, before the Dz.U. date; as amended by Dz.U. 1960 nr 51 poz. "
                    "297, 1989 nr 29 poz. 154 (15 Aug, 11 Nov) and 1990 nr 28 poz. 159-160 (no 22 July; 3 May).",
         summary="Art. 1 pkt 1: 1 Jan, (6 Jan from 2011), Easter Sunday and Monday, 1 May, 3 May, Pentecost Sunday, "
                 "Corpus Christi, 15 Aug, 1 Nov, 11 Nov, (24 Dec from 2025), 25 and 26 Dec; pkt 2: Sundays."),
    dict(key="u-2010-1459", title="Ustawa z dnia 24 września 2010 r. o zmianie ustawy – Kodeks pracy oraz niektórych "
         "innych ustaw (Święto Trzech Króli)", uri=_ISAP + "WDU20102241459", issued="2010-09-24",
         issued_uri=_ISAP + "WDU20102241459", published="2010-11-26", published_uri=_ISAP + "WDU20102241459",
         published_in="Dz.U. 2010 nr 224 poz. 1459", in_force="2011-01-01",
         summary="Art. 2: art. 1 pkt 1 lit. b) 6 stycznia – Święto Trzech Króli."),
    dict(key="u-2018-2117", title="Ustawa z dnia 7 listopada 2018 r. o ustanowieniu Święta Narodowego z okazji Setnej "
         "Rocznicy Odzyskania Niepodległości Rzeczypospolitej Polskiej", uri=_ISAP + "WDU20180002117",
         issued="2018-11-07", issued_uri=_ISAP + "WDU20180002117", published="2018-11-07",
         published_uri=_ISAP + "WDU20180002117", published_in="Dz.U. 2018 poz. 2117", in_force="2018-11-08",
         to="2018-11-12", summary="Art. 2: Dzień 12 listopada 2018 r. jest dniem wolnym od pracy."),
    dict(key="u-2024-1965", title="Ustawa z dnia 6 grudnia 2024 r. o zmianie ustawy o dniach wolnych od pracy oraz "
         "niektórych innych ustaw (Wigilia)", uri=_ISAP + "WDU20240001965", issued="2024-12-06",
         issued_uri=_ISAP + "WDU20240001965", published="2024-12-30", published_uri=_ISAP + "WDU20240001965",
         published_in="Dz.U. 2024 poz. 1965", in_force="2025-02-01",
         summary="Art. 1: art. 1 pkt 1 lit. ka) 24 grudnia – Wigilia Bożego Narodzenia; art. 5: in force 1 Feb 2025."),
]

PL_FIXED = [
    (1, 1, "Nowy Rok", [(1918, None)], "u-1951"),
    (1, 6, "Święto Trzech Króli", [(2011, None)], "u-2010-1459"),
    (5, 1, "Święto Państwowe", [(1918, None)], "u-1951"),
    (5, 3, "Święto Narodowe Trzeciego Maja", [(1990, None)], "u-1951"),
    (8, 15, "Wniebowzięcie Najświętszej Maryi Panny", [(1918, None)], "u-1951"),
    (11, 1, "Wszystkich Świętych", [(1918, None)], "u-1951"),
    (11, 11, "Narodowe Święto Niepodległości", [(1989, None)], "u-1951"),
    (12, 24, "Wigilia Bożego Narodzenia", [(2025, None)], "u-2024-1965"),
    (12, 25, "Boże Narodzenie (pierwszy dzień)", [(1918, None)], "u-1951"),
    (12, 26, "Boże Narodzenie (drugi dzień)", [(1918, None)], "u-1951"),
]

PL_EASTER = [
    (0, "Wielkanoc (pierwszy dzień)", [(1918, None)], "u-1951"),
    (1, "Poniedziałek Wielkanocny", [(1918, None)], "u-1951"),
    (49, "Zielone Świątki (pierwszy dzień)", [(1918, None)], "u-1951"),
    (60, "Boże Ciało", [(1918, None)], "u-1951"),
]


def _doc(st):
    return {k: st.get(k) for k in ("title", "uri", "issued", "issued_uri", "published", "published_uri",
                                   "published_in", "dates_note")}


PL_YEARS = {
    2018: dict(confidence="primary", covers=[], docs=[_doc(PL_STATUTES[2])],
               days=[("11-12", "Święto Narodowe z okazji Setnej Rocznicy Odzyskania Niepodległości", 0)]),
}
