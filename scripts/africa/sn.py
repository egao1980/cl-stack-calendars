"""Senegal (SN): fêtes légales of loi 74-52 as amended, and the declared Grand
Magal de Touba dates (cl-stack-calendars#43 item 3).

Each SN_YEARS entry :covers only the Magal: the other Islamic days are tabular
estimates in every year (their declared dates were not transcribed). The
Magal is 18 Safar (Hijri month 2). Fetched files: ~/.cache/cl-stack-calendars/sn/.
"""

OBSERVE = True  # rules through the generator's rule engine (Sunday rule of loi 74-52)

SN_STATUTES = [
    dict(key="loi-74-52",
         title="Loi n° 74-52 du 4 novembre 1974 relative à la fête nationale et aux fêtes légales",
         uri="https://web.archive.org/web/20250608105243/https://www.dri.gouv.sn/sites/default/files/an-documents/LOI%20N1974%2052%20DU%204%20NOVEMBRE%201974.pdf",
         issued="1974-11-04", issued_uri="https://web.archive.org/web/20250608105243/https://www.dri.gouv.sn/sites/default/files/an-documents/LOI%20N1974%2052%20DU%204%20NOVEMBRE%201974.pdf",
         published=None, published_uri=None,
         published_in="Journal officiel de la République du Sénégal (issue not on the DRI scan)",
         in_force=None,
         dates_note="DRI (Direction des relations avec les institutions) scan of the dossier: decree 74-577 of 17 June 1974, "
                    "committee report, adopted 25 Oct 1974, promulgated 4 Nov 1974; JO issue/date not in the scan.",
         summary="Art. 1: 4 avril fête nationale. Art. 2: fêtes légales = 1er janvier, 1er mai, Journée du Mawloud, "
                 "Journée de la Korité, Journée de la Tabaski, Lundi de Pâques, Jeudi de l'Ascension, Lundi de Pentecôte, "
                 "15 août, Toussaint, 25 décembre; 'Quand la Korité et la Tabaski tombent un dimanche, le lundi suivant est férié'. "
                 "Art. 3: fêtes légales chômées. Art. 4: fête nationale et 1er mai chômées et payées. "
                 "Report: the Assembly's Tamkharit amendment was withdrawn at second reading; Mawloud Sunday->Monday clause dropped "
                 "(Mawloud = night + following day). One day each for Korité and Tabaski."),
    dict(key="loi-83-54",
         title="Loi n° 83-54 du 18 février 1983 (modifiant la loi n° 74-52; ajoute la Tamxarit)",
         uri="https://web.archive.org/web/20250608105419/https://www.dri.gouv.sn/sites/default/files/LOI/1983/comP4%20loi%20decentralisation%20et%20travail/LOI%20N%20198354%20DU%2018%20FEVRIER%201983/LOI%20N%20198354%20DU%2018%20FEVRIER%201983.pdf",
         issued="1983-02-18", issued_uri=None,
         published=None, published_uri=None, published_in=None, in_force=None,
         dates_note="The DRI scan (5 pages) is images only and was not transcribed; content per the amended art. 4 that loi 2013-06 quotes (Tamxarit chômée et payée). JO issue not known.",
         summary="Adds Tamxarit (10 Muharram, Achoura) as a fête légale; art. 4 (as amended) makes the fête nationale, Tamxarit and 1er mai chômées et payées."),
    dict(key="decret-2012-magal",
         title="Décret présidentiel (A. Wade) déclarant le Grand Magal 2012 férié, chômé et payé",
         uri="https://www.seneweb.com/fr/news/Contribution/magal-de-touba-ferie-chronique-dune-decision-historique-par-moubarack-lo_n_448594.html",
         issued="2012-01-12", issued_uri=None, published=None, published_uri=None, published_in=None, in_force=None,
         dates_note="Secondary only (Moubarack Lo chronicle on Seneweb/Dakaractu); decree number not found. One-off for 2012; "
                    "the 2013 (January) Magal was likewise declared by Macky Sall (same chronicle) - decree not found.",
         summary="Grand Magal of 18 Safar 1433 (12 Jan 2012) a one-off public holiday."),
    dict(key="loi-2013-06",
         title="Loi n° 2013-06 du 11 décembre 2013 complétant et modifiant certaines dispositions de la loi n° 74-52 "
               "du 4 novembre 1974 relative à la fête nationale et aux fêtes légales, modifiée",
         uri="https://web.archive.org/web/20250604215148/https://natlex.ilo.org/dyn/natlex2/natlex2/files/download/97261/SEN-97261.pdf",
         issued="2013-12-11", issued_uri="http://www.jo.gouv.sn/spip.php?page=imprimer&id_article=10101",
         published=None, published_uri="http://www.jo.gouv.sn/spip.php?article10101",
         published_in="Journal officiel de la République du Sénégal (jo.gouv.sn article 10101; JO issue number not shown)",
         in_force=None,
         dates_note="Natlex PDF is a print of the JO web article (printed 24/4/2014); it gives the act date and the Assembly "
                    "vote (samedi 30 novembre 2013) but not the JO issue/date. jo.gouv.sn timed out when fetched directly.",
         summary="Inserts 'la journée du Grand Magal de Touba' between the 4th and 5th indents of art. 2 (fêtes légales); "
                 "art. 4 replaced: 'La fête nationale, la Tamxarit, la journée du Grand Magal de Touba et la journée du 1er Mai "
                 "sont chômées et payées.' No Sunday->Monday rule for the Magal (only Korité/Tabaski have it); the day after "
                 "the Magal is not a holiday unless a specific decree says so (e.g. 2018)."),
]

# Eras before loi 74-52 (1974) were not researched; the days are kept from 1960
# (independence), as the starter had them.
SN_FIXED = [
    (1, 1, "Jour de l'an", [(1960, None)], "loi-74-52"),
    (4, 4, "Fête de l'Indépendance", [(1960, None)], "loi-74-52"),
    (5, 1, "Fête du Travail", [(1960, None)], "loi-74-52"),
    (8, 15, "Assomption", [(1960, None)], "loi-74-52"),
    (11, 1, "Toussaint", [(1960, None)], "loi-74-52"),
    (12, 25, "Noël", [(1960, None)], "loi-74-52"),
]

SN_EASTER = [
    (1, "Lundi de Pâques", [(1960, None)], "loi-74-52"),
    (39, "Jeudi de l'Ascension", [(1960, None)], "loi-74-52"),
    (50, "Lundi de Pentecôte", [(1960, None)], "loi-74-52"),
]

_SUNDAY = dict(observed="sunday-next", observed_from=1974)  # loi 74-52 art. 2, Korité and Tabaski only

SN_ISLAMIC = [
    # (hijri_month, hijri_day, [offsets], name, eras, statute, opts)
    (1, 10, [0], "Tamxarit", [(1983, None)], "loi-83-54"),
    # 18 SAFAR (month 2), not Rabi' I/II; a fête légale from loi 2013-06 (11 Dec 2013).
    (2, 18, [0], "Grand Magal de Touba", [("2013-12-11", None)], "loi-2013-06", dict(key="magal")),
    (3, 12, [0], "Journée du Maouloud", [(1960, None)], "loi-74-52"),
    (10, 1, [0], "Journée de la Korité", [(1960, None)], "loi-74-52", _SUNDAY),
    (12, 10, [0], "Journée de la Tabaski", [(1960, None)], "loi-74-52", _SUNDAY),
]

SN_OTHER_RULES = [
    dict(rule="Korité or Tabaski on a Sunday -> the following Monday is also a holiday", source="loi-74-52"),
    dict(rule="Easter Monday, Ascension Thursday, Whit Monday are fêtes légales", source="loi-74-52"),
    dict(rule="Magal on a Sunday: NO Monday holiday by law. A bill by deputy Marème Mbacké (Pastef) to make the Monday "
              "a holiday when the Magal falls on a Sunday was tabled on 6 Aug 2026; not adopted as far as found.",
         source="https://senego.com/magal-mareme-mbacke-propose-de-rendre-le-lundi-ferie-lorsque-la-fete-tombe-un-dimanche_1992391.html"),
    dict(rule="Islamic days follow the date declared from moon sighting: for the Magal by the Khalife général des mourides "
              "(commission d'observation du croissant, Touba); Korité/Tabaski by the CONACOC / announcements (several "
              "communities sometimes celebrate on different days; the State follows the declared/majority date).",
         source="https://lesoleil.sn/actualites/societe-fait-divers/le-grand-magal-de-touba-celebre-le-2-aout-2026-le-4-safar-place-sous-le-signe-du-savoir-et-de-la-transmission/"),
]

_SOLEIL25 = "https://lesoleil.sn/actualites/societe-fait-divers/magal-touba-la-date-officielle-fixee-au-13-aout-2025/"
_SOLEIL26 = "https://lesoleil.sn/actualites/societe-fait-divers/le-grand-magal-de-touba-celebre-le-2-aout-2026-le-4-safar-place-sous-le-signe-du-savoir-et-de-la-transmission/"


def _doc(title, uri, published=None, published_in=None, note=None):
    return dict(title=title, uri=uri, issued=None, issued_uri=None, published=published,
                published_uri=uri if published else None, published_in=published_in,
                dates_note=note or "News report of the Khalife's/committee's declared date; no decree needed (fête légale by loi 2013-06).")


# Magal only (other SN days not researched year by year).
SN_YEARS = {
    2012: dict(covers=["magal"], confidence="secondary",
               docs=[_doc("Moubarack Lo, 'Magal de Touba férié: chronique d'une décision historique'",
                          "https://www.seneweb.com/fr/news/Contribution/magal-de-touba-ferie-chronique-dune-decision-historique-par-moubarack-lo_n_448594.html",
                          note="Press chronicle of President Wade's one-off decree for the 2012 Magal; the decree's number "
                               "and date of signature were not found.")],
               days=[("01-12", "Grand Magal de Touba", 0)], suppressed=[], working=[],
               notes="Only the Magal row. One-off decree (Wade) dated 12 Jan 2012; Magal date per en.wikipedia table (12 January)."),
    2013: dict(covers=["magal"], confidence="secondary",
               docs=[_doc("Moubarack Lo chronicle (Seneweb)", "https://www.seneweb.com/fr/news/Contribution/magal-de-touba-ferie-chronique-dune-decision-historique-par-moubarack-lo_n_448594.html"),
                     _doc("en.wikipedia Grand Magal of Touba table", "https://en.wikipedia.org/wiki/Grand_Magal_of_Touba")],
               days=[("01-01", "Grand Magal de Touba", 1), ("12-21", "Grand Magal de Touba", 1)],
               suppressed=[], working=[],
               notes="Only the Magal rows. Two Magals in 2013 (18 Safar 1434 and 1435). Jan 2013 declared by Macky Sall (decree not found; "
                     "it coincides with 1 Jan anyway). 21 Dec 2013 (Sat) follows the law of 11 Dec 2013; date per Wikipedia only "
                     "(tabular 18 Safar 1435 = 21 Dec) - unverified, may be 22 Dec."),
    2014: dict(covers=["magal"], confidence="secondary",
               docs=[_doc("en.wikipedia Grand Magal of Touba table", "https://en.wikipedia.org/wiki/Grand_Magal_of_Touba")],
               days=[("12-12", "Grand Magal de Touba", 0)], suppressed=[], working=[],
               notes="Wikipedia gives 11 December (it lists the eve in several years); tabular 18 Safar 1436 = 11 Dec. "
                     "Recorded 12-12 (Friday) as the usual one-day-after-tabular sighting date - UNVERIFIED, needs an APS/Le Soleil report."),
    2015: dict(covers=["magal"], confidence="secondary",
               docs=[_doc("en.wikipedia Grand Magal of Touba table", "https://en.wikipedia.org/wiki/Grand_Magal_of_Touba")],
               days=[("12-01", "Grand Magal de Touba", 0)], suppressed=[], working=[],
               notes="1 Dec 2015 (Tuesday) per Wikipedia/qppstudio; not verified in Senegalese media."),
    2016: dict(covers=["magal"], confidence="secondary",
               docs=[_doc("en.wikipedia Grand Magal of Touba table", "https://en.wikipedia.org/wiki/Grand_Magal_of_Touba")],
               days=[("11-20", "Grand Magal de Touba", 0)], suppressed=[], working=[],
               notes="Wikipedia 19 Nov (Sat); tabular 18 Safar 1438 = 19 Nov. Recorded 20 Nov (Sun) = UNVERIFIED guess consistent with "
                     "Wikipedia listing the eve in 2017/2018/2022; check APS."),
    2017: dict(covers=["magal"], confidence="secondary",
               docs=[_doc("Ndarinfo: 'Le grand Magal de Touba sera célébré le mercredi 08 novembre 2017'",
                          "https://www.ndarinfo.com/Le-grand-Magal-de-Touba-sera-celebre-le-mercredi-08-novembre-2017_a20150.html")],
               days=[("11-08", "Grand Magal de Touba", 0)], suppressed=[], working=[],
               notes="Crescent not seen -> Wednesday 8 Nov (Wikipedia: 9 Nov, the 2nd day). Dakaractu agrees on 8 Nov."),
    2018: dict(covers=["magal"], confidence="secondary",
               docs=[_doc("Ndarinfo: 'TOUBA: Le Grand Magal célébré le 28 octobre prochain'",
                          "https://www.ndarinfo.com/TOUBA-Le-Grand-Magal-celebre-le-28-octobre-prochain_a23090.html"),
                     dict(title="Décret n° 2018-1942 du 26 octobre 2018 déclarant la journée du lundi 29 octobre 2018 pont et fériée",
                          uri="https://web.archive.org/web/20250608105852/https://www.juriafrica.com/lex/decret-2018-1942-26-octobre-2018-48947.htm",
                          issued="2018-10-26", issued_uri="https://web.archive.org/web/20250608105852/https://www.juriafrica.com/lex/decret-2018-1942-26-octobre-2018-48947.htm",
                          published=None, published_uri=None, published_in="Journal officiel du Sénégal (Juriafrica copy)",
                          dates_note="The decree's title and date read on the Juriafrica copy of the JO text; the JO issue is not shown.")],
               days=[("10-28", "Grand Magal de Touba", 0), ("10-29", "Jour férié (lendemain du Magal)", 1)],
               suppressed=[], working=[],
               notes="Magal Sunday 28 Oct 2018 (18 Safar 1440, Le360/Ndarinfo); Monday 29 Oct a one-off holiday by décret 2018-1942. "
                     "Wikipedia's 27 Oct is wrong (eve)."),
    2019: dict(covers=["magal"], confidence="secondary",
               docs=[_doc("en.wikipedia table / calendarific", "https://en.wikipedia.org/wiki/Grand_Magal_of_Touba")],
               days=[("10-17", "Grand Magal de Touba", 0)], suppressed=[], working=[],
               notes="17 Oct 2019 (Thursday) per Wikipedia and Calendarific; Culture Trip says 16-17 Oct. Not checked in APS."),
    2020: dict(covers=["magal"], confidence="secondary",
               docs=[_doc("timeanddate via python-holidays 0.109 (confirmed years 2020-2024)",
                          "https://web.archive.org/web/20250609061446/https://www.timeanddate.com/holidays/senegal/grand-magal-de-touba")],
               days=[("10-06", "Grand Magal de Touba", 0)], suppressed=[], working=[],
               notes="6 Oct 2020 (Tuesday)."),
    2021: dict(covers=["magal"], confidence="secondary",
               docs=[_doc("SenePlus: 'Le Magal de Touba sera célébré ce 26 septembre 2021'", "https://www.seneplus.com/node/166191")],
               days=[("09-26", "Grand Magal de Touba", 0)], suppressed=[], working=[],
               notes="Sunday 26 Sep 2021; no Monday holiday by law (Calendarific's 27 Sep unsupported)."),
    2022: dict(covers=["magal"], confidence="secondary",
               docs=[_doc("au-senegal.com: Le Grand Magal de Touba édition 2022", "https://au-senegal.com/le-grand-magal-de-touba-edition-2022,16349.html"),
                     dict(title="Communiqué du Conseil des ministres du 22 décembre 2022: le lundi 26 décembre 2022 férié, chômé et payé "
                                "(art. 8 du décret 74-1125)",
                          uri="https://web.archive.org/web/20250608135605/https://primature.sn/publications/conseil-des-ministres/conseil-des-ministres-du-22-decembre-2022",
                          issued="2022-12-22", issued_uri="https://web.archive.org/web/20250608135605/https://primature.sn/publications/conseil-des-ministres/conseil-des-ministres-du-22-decembre-2022",
                          published="2022-12-22", published_uri="https://web.archive.org/web/20250608135605/https://primature.sn/publications/conseil-des-ministres/conseil-des-ministres-du-22-decembre-2022",
                          published_in="official release (primature.sn)", dates_note=None)],
               days=[("09-15", "Grand Magal de Touba", 0), ("12-26", "Jour férié (lendemain de Noël)", 1)],
               suppressed=[], working=[],
               notes="Thursday 15 Sep 2022 (python-holidays agrees; Wikipedia's 14 Sep is the eve). Also 2022-12-26 one-off holiday "
                     "(Conseil des ministres 22 Dec 2022, python-holidays) - unrelated to the Magal, see SN_ADHOC."),
    2023: dict(covers=["magal"], confidence="primary",
               docs=[_doc("RTS (state broadcaster): 'OFFICIEL: le Grand Magal de Touba célébré le 4 septembre'",
                          "https://www.rts.sn/actualite/detail/a-la-une/officiel-le-grand-magal-de-touba-celebre-le-4-septembre",
                          published_in="RTS (Radiodiffusion Télévision Sénégalaise)")],
               days=[("09-04", "Grand Magal de Touba", 0)], suppressed=[], working=[],
               notes="129th edition, Monday 4 Sep 2023 (python-holidays agrees). RTS counted as official media."),
    2024: dict(covers=["magal"], confidence="secondary",
               docs=[_doc("allAfrica (Le Soleil/APS): 'Sénégal: 130ème édition du Magal de Touba'", "https://fr.allafrica.com/stories/202408220311.html")],
               days=[("08-23", "Grand Magal de Touba", 0)], suppressed=[], working=[],
               notes="Friday 23 Aug 2024 (18 Safar 1446); python-holidays agrees; issue #43 example (cl-stack had 2024-09-22)."),
    2025: dict(covers=["magal"], confidence="primary",
               docs=[_doc("Le Soleil (state daily): 'Magal Touba: la date officielle fixée au 13 août 2025'", _SOLEIL25,
                          published_in="Le Soleil")],
               days=[("08-13", "Grand Magal de Touba", 0)], suppressed=[], working=[],
               notes="Wednesday 13 Aug 2025, 131st edition."),
    2026: dict(covers=["magal"], confidence="primary",
               docs=[_doc("Le Soleil: 'Le Grand Magal de Touba célébré le 2 août 2026'", _SOLEIL26, published_in="Le Soleil"),
                     _doc("magal-touba.org (Comité d'organisation): 'Grand Magal de Touba 2026: ce sera le dimanche 2 août 2026'",
                          "https://magal-touba.org/2026/07/15/grand-magal-de-touba-2026-ce-sera-le-dimanche-2-aout-2026/")],
               days=[("08-02", "Grand Magal de Touba", 0)], suppressed=[], working=[],
               notes="Sunday 2 Aug 2026 (1 Safar 1448 = 16 Jul 2026 by sighting). Monday 3 Aug stayed a working day "
                     "(no decree; senego.com). 132nd edition."),
}

SN_ADHOC = [
    ("2018-10-29", "Lendemain du Grand Magal (Magal on Sunday 28 Oct)",
     "https://web.archive.org/web/20250608105852/https://www.juriafrica.com/lex/decret-2018-1942-26-octobre-2018-48947.htm",
     "issued 2018-10-26", "Président de la République, décret n° 2018-1942"),
    ("2022-12-26", "Jour férié (Christmas on Sunday)",
     "https://web.archive.org/web/20250608135605/https://primature.sn/publications/conseil-des-ministres/conseil-des-ministres-du-22-decembre-2022",
     "issued 2022-12-22", "Conseil des ministres (per python-holidays; not fetched)"),
]

SN_FINDINGS = """Issue #43 item 3 (Magal month): CONFIRMED. The Grand Magal de Touba is 18 SAFAR (Hijri month 2), the anniversary
of Cheikh Ahmadou Bamba's departure into exile (Le Soleil 2026: 1 Safar 1448 = 16 Jul 2026, so 18 Safar = 2 Aug 2026;
2024 = 23 Aug; 2025 = 13 Aug). The starter's (islamic-date-in-gregorian-year y 3 18) = 18 Rabi' I is wrong every year,
and the docstring/authority '18 Rabīʿ II' is also wrong. Use month 2, day 18, one day, and also the second occurrence in
years with two (2013: Jan 1 and Dec 21/22; next ~2046).

Legal basis: Loi n° 2013-06 du 11 décembre 2013 (adopted 30 Nov 2013; JO web article 10101) adds 'la journée du Grand Magal
de Touba' to the fêtes légales of loi 74-52 and makes it chômée et payée. So: :from 2014 as a statutory holiday (the
21/22 Dec 2013 Magal came 10 days after promulgation - include it too). Before: a one-off decree by President Wade for
12 Jan 2012 (number not found; secondary: Moubarack Lo chronicle) and a similar decision by Macky Sall for 1 Jan 2013
(that day is New Year anyway). The starter's :from 1960 is wrong; use 2013-12 (or 2014) onward, plus 2012-01-12 as adhoc.
'Loi n° 10-2013' in some press = the same law (bill number).

No Sunday->Monday rule for the Magal (loi 74-52 gives it only to Korité and Tabaski). One-off: décret 2018-1942 du 26 oct
2018 made Monday 29 Oct 2018 a holiday (Magal Sunday 28 Oct). In 2026 (Sunday 2 Aug) no decree, Monday was a working day.

Declared dates: the Magal date is fixed each year by the Khalife général des mourides after the Safar crescent
sighting (commission d'observation du croissant), announced ~2 weeks ahead and relayed by APS, Le Soleil, RTS and
magal-touba.org (Comité d'organisation). It is NOT a fixed tabular date: 2017 was 8 Nov because the crescent was not
seen. Other Islamic days (Tamxarit, Maouloud, Korité, Tabaski) likewise follow moon sighting; Korité/Tabaski are
announced by the CONACOC (Commission nationale de concertation sur le croissant lunaire) and the State follows that.
Not researched year by year (SN kept brief).

Confidence: 2023, 2025, 2026 primary-ish (RTS / Le Soleil state media + Comité d'organisation); 2017, 2018, 2021, 2022,
2024 secondary national press; 2012-2016, 2019, 2020 secondary (Wikipedia/timeanddate) - Wikipedia's table is off by
one day in checked years (2017: 9 Nov vs declared 8 Nov; 2018: 27 Oct vs 28 Oct; 2022: 14 Sep vs 15 Sep), so
2013-12, 2014 and 2016 rows are unverified guesses and should be checked against APS before freezing. 2027: 18 Safar
1449 not yet declared; estimate ~22-23 Jul 2027 (Senego estimate: vendredi 23 juillet 2027).

jo.gouv.sn did not answer (timeout); the law text comes from the ILO NATLEX print of the JO web article (Wayback).
"""
