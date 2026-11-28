"""Germany: bundeseinheitliche Feiertage 2000-2040, the days that every Land's
Feiertagsgesetz lists, transcribed for egao1980/cl-stack-calendars#24.
Stdlib only; data, no logic.

Cache: ~/.cache/cl-stack-calendars/de/ (gesetze-im-internet.de, the Länder
gazettes and legal portals cited below).

Scope: the national calendar is the days every Land keeps, and 3 October
(Einigungsvertrag Art. 2 Abs. 2, the only federal one). Days of some Länder
only are left out. 31 October 2017 (500th anniversary of the Reformation) was
a holiday in all 16 Länder: permanent in BB, MV, SN, ST, TH, by a one-off act
in the other eleven, six by act and five by Verordnung (LANDER_2017 below). Heiliger Abend and Silvester are no
Feiertage.
"""

OBSERVE = True

DE_STATUTES = [
    dict(key="einigvtr-art-2", title="Einigungsvertrag vom 31. August 1990, Art. 2 Abs. 2 (Tag der Deutschen Einheit)",
         uri="https://www.gesetze-im-internet.de/einigvtr/art_2.html", issued="1990-08-31",
         issued_uri="https://www.gesetze-im-internet.de/einigvtr/art_2.html", published=None, published_uri=None,
         published_in="BGBl. 1990 II S. 889", in_force="1990-10-03",
         dates_note="The BGBl. II issue date was not read; Art. 2 applies from the day of unity, 3 October 1990.",
         summary="Art. 2 Abs. 2: Der 3. Oktober ist als Tag der Deutschen Einheit gesetzlicher Feiertag."),
    dict(key="feiertagsgesetze", title="Feiertagsgesetze der 16 Länder (the days common to all of them)",
         uri="https://www.gesetze-bayern.de/Content/Document/BayFTG-1", issued=None, issued_uri=None,
         published=None, published_uri=None, published_in=None, in_force=None,
         dates_note="A family of Land acts of different dates; the Bavarian FTG is linked as one example. Each "
                    "lists Neujahr, Karfreitag, Ostermontag, 1. Mai, Christi Himmelfahrt, Pfingstmontag and the "
                    "two Christmas days. Eras before 1949 not researched.",
         summary="Neujahr, Karfreitag, Ostermontag, 1. Mai, Christi Himmelfahrt, Pfingstmontag, 1. und 2. "
                 "Weihnachtstag in every Land."),
]

DE_FIXED = [
    (1, 1, "Neujahr", [(1949, None)], "feiertagsgesetze"),
    (5, 1, "Tag der Arbeit", [(1949, None)], "feiertagsgesetze"),
    (6, 17, "Tag der Deutschen Einheit", [(1954, 1990)], "feiertagsgesetze"),
    (10, 3, "Tag der Deutschen Einheit", [(1990, None)], "einigvtr-art-2"),
    (12, 25, "1. Weihnachtstag", [(1949, None)], "feiertagsgesetze"),
    (12, 26, "2. Weihnachtstag", [(1949, None)], "feiertagsgesetze"),
]

DE_EASTER = [
    (-2, "Karfreitag", [(1949, None)], "feiertagsgesetze"),
    (1, "Ostermontag", [(1949, None)], "feiertagsgesetze"),
    (39, "Christi Himmelfahrt", [(1949, None)], "feiertagsgesetze"),
    (50, "Pfingstmontag", [(1949, None)], "feiertagsgesetze"),
]

# The act of each Land that made 31 October 2017 a holiday there. "issued" is
# the Ausfertigung (acts) or Erlass (Verordnungen); "derived" in-force dates are
# the day after promulgation, as each act says.


def _l(key, title, uri, issued, published, gazette, in_force, note, summary, primary=True, to="2017-10-31"):
    return dict(key=key, title=title, uri=uri, issued=issued, issued_uri=uri if primary else None,
                published=published, published_uri=uri if primary else None, published_in=gazette,
                in_force=in_force, dates_note=note, summary=summary, to=to, primary=primary)


LANDER_2017 = [
    _l("bw-2014", "Baden-Württemberg: Gesetz zur Änderung des Feiertagsgesetzes vom 25. November 2014 (§ 1a FTG)",
       "https://www.landtag-bw.de/files/live/sites/LTBW/files/dokumente/gesetzblaetter/2014/GBl201421.pdf",
       "2014-11-25", "2014-11-28", "GBl. 2014 Nr. 21, S. 548", "2014-11-29",
       "In force the day after promulgation (derived); expires 1 Nov 2017. Read on the Landtag copy of the GBl.",
       "§ 1a: Das Reformationsfest am 31. Oktober 2017 wird einmalig als gesetzlicher Feiertag festgesetzt."),
    _l("by-2016", "Bayern: Gesetz zur Änderung des Feiertagsgesetzes vom 12. April 2016 (Art. 1 Abs. 2a FTG)",
       "https://www.verkuendung-bayern.de/gvbl/2016-50/", "2016-04-12", "2016-04-19", "GVBl. 2016 Nr. 4, S. 50",
       "2016-05-01", None, "Art. 1 Abs. 2a: Der Reformationstag am 31. Oktober 2017 ist gesetzlicher Feiertag."),
    _l("be-2015", "Berlin: Gesetz zur Änderung des Gesetzes über die Sonn- und Feiertage vom 14. Oktober 2015",
       "https://www.berlin.de/sen/justiz/service/gesetze-und-verordnungen/2015/ausgabe-nr-22-vom-24-10-2015-seite-377-bis-380.pdf",
       "2015-10-14", "2015-10-24", "GVBl. 2015 Nr. 22, S. 378", "2015-10-25",
       "In force the day after promulgation (derived); Nr. 10 repealed from 1 Jan 2018.",
       "§ 1 Abs. 1 Nr. 10: der 31. Oktober 2017 (500. Jahrestag der Reformation)."),
    _l("hb-2013", "Bremen: Gesetz zur Änderung des Gesetzes über die Sonn- und Feiertage vom 21. Mai 2013",
       "https://www.gesetzblatt.bremen.de/fastmedia/218/2013-05-31-gesetzblatt-2013-nr-33-aendg-sonn--und-feiertage.pdf",
       "2013-05-21", "2013-06-03", "Brem.GBl. 2013 Nr. 33, S. 231", "2013-06-04",
       "In force the day after promulgation (derived). Permanent Reformationstag from 2018 by the act of 26 Jun 2018.",
       "§ 2 Abs. 1 Buchst. j: der 31. Oktober 2017 (500. Jahrestag der Reformation)."),
    _l("hh-2013", "Hamburg: Fünfte Verordnung zum Feiertagsgesetz (Reformationstag 2017) vom 30. April 2013",
       "https://www.luewu.de/wp-content/uploads/2025/08/GVBL_HH_2013-16.pdf", "2013-04-30", "2013-05-10",
       "HmbGVBl. 2013 Nr. 16, S. 192", None,
       "No in-force clause; expires 1 Nov 2017. Read on the gazette publisher's copy.",
       "§ 1: Der 31. Oktober 2017 (Reformationsjubiläum) wird zum Sonderfeiertag erklärt."),
    _l("he-2013", "Hessen: Verordnung zur Bestimmung des Reformationstages 2017 zum gesetzlichen Feiertag vom 16. Oktober 2013",
       "https://starweb.hessen.de/cache/GVBL/2013/00025.pdf", "2013-10-16", "2013-11-05", "GVBl. 2013 Nr. 25, S. 566",
       "2013-11-06", "In force the day after promulgation (derived).",
       "§ 1: Der 31. Oktober 2017 wird für das Landesgebiet zum gesetzlichen Feiertag erklärt."),
    _l("ni-2013", "Niedersachsen: Gesetz zur Änderung des Niedersächsischen Gesetzes über die Feiertage vom 5. Juni 2013",
       "https://www.niedersachsen.de/download/78453/Nds._GVBl._Nr._8_2013_vom_11.06.2013_S._123-134.pdf",
       "2013-06-05", "2013-06-11", "Nds. GVBl. 2013 Nr. 8, S. 131", "2013-06-12",
       "In force the day after promulgation (derived); expires 1 Nov 2017.",
       "§ 2 Abs. 1 Satz 2: Der 31. Oktober 2017 ist als Reformationsjubiläum ... ein Feiertag."),
    _l("nw-2015", "Nordrhein-Westfalen: Gesetz über die Bestimmung des 31. Oktober 2017 als 500. Jahrestag der Reformation "
       "zum Feiertag vom 25. Juni 2015", "https://recht.nrw.de/gvnrw/2015-s496", "2015-06-25", "2015-07-03",
       "GV. NRW. 2015 Nr. 28, S. 496", "2015-07-04", "In force the day after promulgation (derived); expires 1 Nov 2017.",
       "Der 31. Oktober 2017 ist Feiertag im Sinne des § 1 Absatz 1 des Feiertagsgesetzes NW."),
    _l("rp-2015", "Rheinland-Pfalz: Landesverordnung zur Bestimmung des Reformationstages 2017 zum gesetzlichen Feiertag "
       "vom 27. November 2015", "https://add.rlp.de/fileadmin/add/Abteilung_4/Ladenoeffnungsrecht/20161206_Ladenoeffnungsrecht_RD_zum_Vollzug_des_Ladenoeffnungsgesetzes.pdf",
       "2015-11-27", "2015-12-04", "GVBl. 2015 Nr. 14, S. 433", None,
       "SECONDARY: the gazette contents page lists it; the text page was not read (cited by an ADD circular of 6 Dec 2016).",
       "Makes 31 October 2017 a gesetzlicher Feiertag.", primary=False),
    _l("sl-2014", "Saarland: Verordnung zur Erklärung des 500. Reformationsjubiläums am 31. Oktober 2017 zum Feiertag "
       "vom 18. Juni 2014", "https://lexaris.de/book/version/documentflat/head/1367604", "2014-06-18", None,
       "Amtsblatt des Saarlandes I (issue not read)", "2014-07-04",
       "SECONDARY: lexaris text; the Amtsblatt archive did not open.",
       "(1) Der Reformationstag am 31. Oktober 2017 wird zum Feiertag erklärt.", primary=False),
    _l("sh-2014", "Schleswig-Holstein: Landesverordnung under § 2 Abs. 2 SFTG making 31 October 2017 a holiday (Cabinet "
       "decision announced 4 Nov 2014)",
       "https://verkuendungsportal.schleswig-holstein.de/mm/gvobl_jahrgang_2014/GVOBl_2014.pdf", None, None,
       "GVOBl. Schl.-H. 2014 (page not read)", None,
       "SECONDARY: only the Innenministerium press release was read; the 2014 volume (one 427 MB PDF) was not opened.",
       "Makes 31 October 2017 a gesetzlicher Feiertag.", primary=False),
    _l("bb-ftg", "Brandenburg: Feiertagsgesetz vom 21. März 1991, § 2 Abs. 1 (Reformationsfest, 31. Oktober)",
       "https://bravors.brandenburg.de/gesetze/ftg_2015", "1991-03-21", None, "GVBl. I/91 S. 44", None,
       "Permanent day; the 2015 version is the one in force in 2017.", "§ 2 Abs. 1: das Reformationsfest (31. Oktober).",
       to=None),
    _l("sn-sfg", "Sachsen: Gesetz über Sonn- und Feiertage im Freistaat Sachsen vom 10. November 1992, § 1 Abs. 1",
       "https://revosax.sachsen.de/vorschrift/3997-SaechsSFG", "1992-11-10", None, "SächsGVBl. 1992 S. 536", None,
       "Permanent day.", "§ 1 Abs. 1: Reformationsfest (31. Oktober).", to=None),
    _l("mv-ftg", "Mecklenburg-Vorpommern: Feiertagsgesetz M-V (Neufassung vom 8. März 2002), § 2 Abs. 1",
       "https://www.landesrecht-mv.de/bsmv/document/jlr-FTGMVrahmen", "2002-03-08", None, None, None,
       "SECONDARY: wording from umwelt-online; the juris portal did not render. Permanent day.",
       "§ 2 Abs. 1: der Reformationstag (31. Oktober).", primary=False, to=None),
    _l("st-feiertg", "Sachsen-Anhalt: Gesetz über die Sonn- und Feiertage vom 25. August 2004, § 2",
       "https://www.landesrecht.sachsen-anhalt.de/bsst/document/jlr-FeiertGSTrahmen", "2004-08-25", "2004-08-30",
       "GVBl. LSA 2004 Nr. 48, S. 538", None,
       "SECONDARY: wording from secondary copies; the juris portal did not render. Permanent day.",
       "§ 2: der Reformationstag (31. Oktober).", primary=False, to=None),
    _l("th-ftg", "Thüringen: Thüringer Feiertagsgesetz vom 21. Dezember 1994, § 2 Abs. 1",
       "https://landesrecht.thueringen.de/bsth/document/jlr-FeiertGTHrahmen", "1994-12-21", None, "GVBl. 1994 S. 1221",
       None, "SECONDARY: wording from secondary copies; the juris portal did not render. Permanent day.",
       "§ 2 Abs. 1: der Reformationstag.", primary=False, to=None),
]

DE_STATUTES += [{k: v for k, v in st.items() if k != "primary"} for st in LANDER_2017]


def _doc(st):
    return {k: st.get(k) for k in ("title", "uri", "issued", "issued_uri", "published", "published_uri",
                                   "published_in", "dates_note")}


DE_YEARS = {
    # Five of the sixteen instruments were read only on secondary pages (RP, SL, SH, MV, ST, TH
    # wording), so 2017 is :secondary and the DE gold leaves it to DE-SECONDARY.
    2017: dict(confidence="secondary", covers=[], docs=[_doc(st) for st in LANDER_2017],
               days=[("10-31", "Reformationstag (500. Jahrestag der Reformation)", 0)]),
}
