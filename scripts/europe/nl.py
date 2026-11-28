"""Netherlands: algemeen erkende feestdagen, 2000-2040, transcribed for
egao1980/cl-stack-calendars#24. Stdlib only; data, no logic.

Cache: ~/.cache/cl-stack-calendars/nl/
  BWBR0002448_1999-02-17_0.xml, BWBR0002448_2010-10-10_0.xml   Algemene termijnenwet (BWB repository XML;
                                                                wetten.overheid.nl itself sits behind a JS check)
  stcrt-2013-4075.xml                                           Besluit van 30 januari 2013 (Koningsdag)

Scope: art. 3(1) of the Algemene termijnenwet: Nieuwjaarsdag, tweede Paas- en
Pinksterdag, both Christmas days, Hemelvaartsdag, the day the King's (Queen's)
birthday is celebrated, and 5 May (every year). Goede Vrijdag is only equated
for computing time limits (art. 3(2)) and is not listed; Easter Sunday and
Whit Sunday are Sundays the article does not name. Whether 5 May is a paid day
off is for each CAO, not the statute (#25 item 4).
"""

from datetime import date, timedelta

OBSERVE = True

_BWB = "https://repository.officiele-overheidspublicaties.nl/bwb/BWBR0002448/"
_STCRT = "https://zoek.officielebekendmakingen.nl/stcrt-2013-4075.html"

NL_STATUTES = [
    dict(key="atw-art-3", title="Algemene termijnenwet (wet van 5 juni 1964, Stb. 1964, 314), art. 3, as amended by "
         "Stb. 1982, 70", uri="https://wetten.overheid.nl/BWBR0002448/2010-10-10",
         issued="1964-06-05", issued_uri=_BWB + "2010-10-10_0/xml/BWBR0002448_2010-10-10_0.xml",
         published=None, published_uri=None, published_in="Staatsblad 1964, 314; art. 3 last amended Stb. 1982, 70",
         in_force="1965-04-01",
         dates_note="Issued date is the act's date as cited; the 1964 Staatsblad was not read. BWB gives in force "
                    "1965-04-01 and art. 3 in its current wording since 1982-03-31 (Stb. 1982, 70).",
         summary="Art. 3(1): algemeen erkende feestdagen are de Nieuwjaarsdag, de Christelijke tweede Paas- en "
                 "Pinksterdag, de beide Kerstdagen, de Hemelvaartsdag, de dag waarop de verjaardag van de Koning "
                 "wordt gevierd en de vijfde mei. Art. 3(2): Goede Vrijdag is equated for this Act only."),
    dict(key="kb-1980-11", title="Koninklijk besluit van 24 april 1980, nr. 11 (Koninginnedag, 30 april)",
         uri=_STCRT, issued="1980-04-24", issued_uri=None, published=None, published_uri=None,
         published_in=None, in_force=None, to="2013-12-31",
         dates_note="Not read; known from art. 2 of the Besluit van 30 januari 2013, which withdrew it. The "
                    "Sunday move to Saturday 29 April (1989, 1995, 2000, 2006) is the practice under it.",
         summary="Koninginnedag on 30 April; on a Sunday it is celebrated on the Saturday before."),
    dict(key="stcrt-2013-4075", title="Besluit van 30 januari 2013, nr. 13.000173, houdende vaststelling en "
         "aanduiding van de zevenentwintigste april als Koningsdag", uri=_STCRT,
         issued="2013-01-30", issued_uri=_STCRT, published="2013-02-19", published_uri=_STCRT,
         published_in="Staatscourant 2013, 4075", in_force="2014-01-01",
         dates_note="Art. 3 puts the besluit in force the day after the Staatscourant; art. 1 applies from 1 "
                    "January 2014.",
         summary="Art. 1: met ingang van 1 januari 2014 wordt de zevenentwintigste april aangeduid als Koningsdag, "
                 "behoudens uitzonderingen in verband met zondagen (Nota: on a Sunday, the day before). Art. 2 "
                 "withdraws KB 24 april 1980 nr. 11."),
]

NL_FIXED = [
    (1, 1, "Nieuwjaarsdag", [(1900, None)], "atw-art-3"),
    (4, 30, "Koninginnedag", [(1949, 1979)], "kb-1980-11"),  # Juliana era kept from the starter, not researched
    (5, 5, "Bevrijdingsdag", [(1945, None)], "atw-art-3"),
    (12, 25, "Eerste Kerstdag", [(1900, None)], "atw-art-3"),
    (12, 26, "Tweede Kerstdag", [(1900, None)], "atw-art-3"),
]

NL_EASTER = [
    (1, "Tweede Paasdag", [(1900, None)], "atw-art-3"),
    (39, "Hemelvaartsdag", [(1900, None)], "atw-art-3"),
    (50, "Tweede Pinksterdag", [(1900, None)], "atw-art-3"),
]


def _koninginnedag(y):
    d = date(y, 4, 30)
    return [d - timedelta(days=1) if d.isoweekday() == 7 else d]


def _koningsdag(y):
    d = date(y, 4, 27)
    return [d - timedelta(days=1) if d.isoweekday() == 7 else d]


# Juliana's era (1949-1979, Sunday -> 1 May) is not researched: the gold starts in 2000.
NL_COMPUTED = [
    ("Koninginnedag", _koninginnedag, [(1980, 2013)], "kb-1980-11"),
    ("Koningsdag", _koningsdag, [(2014, None)], "stcrt-2013-4075"),
]

NL_YEARS = {}
