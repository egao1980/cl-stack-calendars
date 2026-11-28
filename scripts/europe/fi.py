"""Finland: public holidays and statutory non-working eves 2000-2040,
transcribed from Finlex (opendata.finlex.fi) for egao1980/cl-stack-calendars#20.
Stdlib only; data, no logic.

Cache: ~/.cache/cl-stack-calendars/fi/ (Akoma Ntoso XML of kirkkolaki 1054/1993 and 652/2023,
laki 388/1937, vuosilomalaki 162/2005, työaikalaki 872/2019)

Scope (#25 item 5): the kirkolliset juhlapäivät (kirkkolaki 1054/1993 4:3,
652/2023 1:6), itsenäisyyspäivä (388/1937) and the days vuosilomalaki
162/2005 § 4(3) takes out of the arkipäivät with them: vapunpäivä,
jouluaatto, juhannusaatto and pääsiäislauantai. Uudenvuodenaatto is in none of
these acts and is left out. Pyhäinpäivä is the Saturday after 30 October,
juhannuspäivä the Saturday after 19 June (both 4:3 of the 1993 law; the 2023
law keeps the days and leaves the dates to church order). Before vuosilomalaki
162/2005 (in force 1 Apr 2005) the eves rest on the 1973 annual-leave act,
which was not read: 2000-2004 are the FI-SECONDARY fixture.
"""

from datetime import date, timedelta

OBSERVE = True

_ELI = "http://data.finlex.fi/eli/sd/"

FI_STATUTES = [
    dict(key="kirkkolaki-1993", title="Kirkkolaki 1054/1993, 4 luku 3 § (kirkolliset juhlapäivät)",
         uri=_ELI + "1993/1054/alkup", issued="1993-11-26", issued_uri=_ELI + "1993/1054/alkup", published=None,
         published_uri=None, published_in="Suomen säädöskokoelma 1054/1993", in_force="1994-01-01",
         dates_note="The säädöskokoelma publication date was not in the XML read.", to="2023-06-30",
         summary="Kirkollisia juhlapäiviä ovat joulupäivä, toinen joulupäivä, uudenvuodenpäivä, loppiainen, "
                 "pitkäperjantai, pääsiäispäivä, toinen pääsiäispäivä, helatorstai, helluntai, juhannuspäivä ja "
                 "pyhäinpäivä; juhannuspäivä the Saturday after 19 June, pyhäinpäivä the Saturday after 30 October."),
    dict(key="kirkkolaki-2023", title="Kirkkolaki 652/2023, 1 luku 6 §", uri=_ELI + "2023/652/ajantasa",
         issued="2023-04-14", issued_uri=_ELI + "2023/652/ajantasa", published="2023-04-18",
         published_uri=_ELI + "2023/652/ajantasa", published_in="Suomen säädöskokoelma 652/2023", in_force="2023-07-01",
         summary="The same eleven kirkolliset juhlapäivät; repeals 1054/1993."),
    dict(key="laki-388-1937", title="Laki itsenäisyyspäivän viettämisestä yleisenä juhla- ja vapaapäivänä 388/1937",
         uri=_ELI + "1937/388/ajantasa", issued="1937-11-26", issued_uri=_ELI + "1937/388/ajantasa", published=None,
         published_uri=None, published_in="Suomen säädöskokoelma 388/1937", in_force=None,
         dates_note="Publication and in-force dates not in the XML read.",
         summary="1 §: joulukuun kuudetta päivää ... vuosittain vietettävä yleisenä juhla- ja vapaapäivänä."),
    dict(key="vuosilomalaki-2005", title="Vuosilomalaki 162/2005, 4 § 3 kohta", uri=_ELI + "2005/162/alkup",
         issued="2005-03-18", issued_uri=_ELI + "2005/162/alkup", published=None, published_uri=None,
         published_in="Suomen säädöskokoelma 162/2005", in_force="2005-04-01",
         dates_note="In force 1 Apr 2005 (the new holiday-credit year); the publication date was not in the XML read.",
         summary="arkipäivällä muita viikonpäiviä kuin sunnuntaita, kirkollisia juhlapäiviä, itsenäisyyspäivää, "
                 "jouluaattoa, juhannusaattoa, pääsiäislauantaita ja vapunpäivää."),
]

FI_FIXED = [
    (1, 1, "Uudenvuodenpäivä", [(1917, None)], "kirkkolaki-1993"),
    (1, 6, "Loppiainen", [(1917, None)], "kirkkolaki-1993"),
    (5, 1, "Vapunpäivä", [(1917, None)], "vuosilomalaki-2005"),
    (12, 6, "Itsenäisyyspäivä", [(1917, None)], "laki-388-1937"),
    (12, 24, "Jouluaatto", [(1917, None)], "vuosilomalaki-2005"),
    (12, 25, "Joulupäivä", [(1917, None)], "kirkkolaki-1993"),
    (12, 26, "Tapaninpäivä", [(1917, None)], "kirkkolaki-1993"),
]

FI_EASTER = [
    (-2, "Pitkäperjantai", [(1917, None)], "kirkkolaki-1993"),
    (-1, "Pääsiäislauantai", [(1917, None)], "vuosilomalaki-2005"),
    (0, "Pääsiäispäivä", [(1917, None)], "kirkkolaki-1993"),
    (1, "2. pääsiäispäivä", [(1917, None)], "kirkkolaki-1993"),
    (39, "Helatorstai", [(1917, None)], "kirkkolaki-1993"),
    (49, "Helluntaipäivä", [(1917, None)], "kirkkolaki-1993"),
]


def _saturday(y, m, d):
    start = date(y, m, d)
    return start + timedelta(days=(6 - start.isoweekday()) % 7)


FI_COMPUTED = [
    ("Juhannusaatto", lambda y: [_saturday(y, 6, 20) - timedelta(days=1)], [(1917, None)], "vuosilomalaki-2005"),
    ("Juhannuspäivä", lambda y: [_saturday(y, 6, 20)], [(1917, None)], "kirkkolaki-1993"),
    ("Pyhäinpäivä", lambda y: [_saturday(y, 10, 31)], [(1955, None)], "kirkkolaki-1993"),
]

FI_YEARS = {}
