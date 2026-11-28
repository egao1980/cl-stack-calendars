"""Latvia: svētku dienas and the Cabinet transfers of working days 2000-2040,
transcribed from likumi.lv for egao1980/cl-stack-calendars#21. Stdlib only;
data, no logic.

Cache: ~/.cache/cl-stack-calendars/lv/ (law72608*.html dated versions, amd_<id>.html amending acts,
darba_likums_26019.html, mk/mk_<id>.html Cabinet orders)

Scope: art. 1 of the law "Par svētku, atceres un atzīmējamām dienām" (the
svētku dienas, named Sundays included: Easter Sunday, Mother's Day on the
second Sunday of May, Pentecost), and its art. 1 third paragraph from 26 Jun
2007: when 4 May or 18 November (and, from 22 Oct 2014, the closing day of the
Song and Dance Festival) falls on a Saturday or Sunday, the next working day
is a day off. Darba likums art. 133(4): the Cabinet's orders "Par darba dienas
pārcelšanu" move a working day between a holiday and the weekend to a
Saturday; they bind state institutions and are recommended to everyone else.
They are rows here (the rest day a holiday, the Saturday a working day).
2018 and 2023 are LV-SECONDARY: the festival closing days (Sunday 8 Jul 2018,
Sunday 9 Jul 2023) were not read on a primary page.
"""

from datetime import date

OBSERVE = True

_L = "https://likumi.lv/ta/id/"


def _act(key, ident, title, adopted, lv, lv_date, in_force, summary, note=None, to=None):
    u = _L + str(ident)
    return dict(key=key, title=title, uri=u, issued=adopted, issued_uri=u, published=lv_date, published_uri=u,
                published_in=lv, in_force=in_force, dates_note=note, summary=summary, to=to)


LV_STATUTES = [
    _act("law-72608", 72608, "Likums \"Par svētku, atceres un atzīmējamām dienām\" (until 22 Apr 2002 \"Par svētku un "
         "atceres dienām\")", "1990-10-03", "Latvijas Republikas Augstākās Padomes un Valdības Ziņotājs, 42",
         "1990-10-18", "1990-10-03",
         "Art. 1 (2000 text): 1 Jan; Lielā Piektdiena, Lieldienas (Sunday and Monday); 1 May; Mātes diena (second "
         "Sunday of May); Vasarsvētki; 23 and 24 Jun; 18 Nov; 25 and 26 Dec; 31 Dec (Vecgada diena)."),
    _act("amd-60998", 60998, "Grozījumi likumā \"Par svētku un atceres dienām\" (4. maijs)", "2002-03-21",
         "Latvijas Vēstnesis, 53", "2002-04-09", "2002-04-23",
         "4 May (Latvijas Republikas Neatkarības deklarācijas pasludināšanas diena) moved into art. 1 (a holiday)."),
    _act("amd-158621", 158621, "Grozījumi likumā \"Par svētku, atceres un atzīmējamām dienām\" (24. decembris, "
         "brīvdienas pārcelšana)", "2007-05-24", "Latvijas Vēstnesis, 93", "2007-06-12", "2007-06-26",
         "\"24., 25. un 26.decembri — Ziemassvētkus\"; \"Ja svētku dienas — 4.maijs un 18.novembris — iekrīt "
         "sestdienā vai svētdienā, nākamo darbdienu nosaka par brīvdienu.\""),
    _act("amd-269373", 269373, "Grozījumi likumā \"Par svētku, atceres un atzīmējamām dienām\" (Dziesmu un deju svētku "
         "noslēguma diena)", "2014-10-02", "Latvijas Vēstnesis, 199", "2014-10-08", "2014-10-22",
         "Adds the closing day of the Vispārējie latviešu Dziesmu un deju svētki, with the same Saturday/Sunday rule."),
    _act("amd-299942", 299942, "Grozījums likumā \"Par svētku, atceres un atzīmējamām dienām\" (2018. gada 24. "
         "septembris)", "2018-06-21", "Latvijas Vēstnesis, 128", "2018-06-28", "2018-07-12",
         "2018. gada 24. septembri – Viņa Svētības pāvesta Franciska pastorālās vizītes Latvijā dienu.", to="2018-09-24"),
    _act("amd-342196", 342196, "Grozījumi likumā \"Par svētku, atceres un atzīmējamām dienām\" (2023. gada 29. maijs)",
         "2023-05-28", "Latvijas Vēstnesis, 102A", "2023-05-29", "2023-05-29",
         "2023. gada 29. maiju – dienu, kad Latvijas hokeja komanda ieguva bronzas medaļu.", to="2023-05-29"),
    _act("darba-likums-133", 26019, "Darba likums, 133. panta ceturtā daļa (darba dienas pārcelšana)", "2001-06-20",
         "Latvijas Vēstnesis, 105", "2001-07-06", "2002-06-01",
         "The Cabinet may move a working day between a holiday and the weekend to a Saturday, by order issued for the "
         "next year by 1 July.", note="Art. 133(4) in its wording from 25 Mar 2010; the 2001-2009 orders rest on the "
         "earlier wording (not read)."),
]

_RULE = {"observed": "substitute-next", "observed_from": "2007-06-26"}

LV_FIXED = [
    (1, 1, "Jaungada diena", [(1990, None)], "law-72608"),
    (5, 1, "Darba svētki", [(1990, None)], "law-72608"),
    (5, 4, "Latvijas Republikas Neatkarības atjaunošanas diena", [("2002-04-23", None)], "amd-60998", _RULE),
    (6, 23, "Līgo diena", [(1990, None)], "law-72608"),
    (6, 24, "Jāņu diena", [(1990, None)], "law-72608"),
    (11, 18, "Latvijas Republikas proklamēšanas diena", [(1990, None)], "law-72608", _RULE),
    (12, 24, "Ziemassvētku vakars", [(2007, None)], "amd-158621"),
    (12, 25, "Pirmie Ziemassvētki", [(1990, None)], "law-72608"),
    (12, 26, "Otrie Ziemassvētki", [(1990, None)], "law-72608"),
    (12, 31, "Vecgada diena", [(1990, None)], "law-72608"),
]

LV_EASTER = [
    (-2, "Lielā Piektdiena", [(1990, None)], "law-72608"),
    (0, "Pirmās Lieldienas", [(1990, None)], "law-72608"),
    (1, "Otrās Lieldienas", [(1990, None)], "law-72608"),
    (49, "Vasarsvētki", [(1990, None)], "law-72608"),
]

LV_NTH = [(5, 7, 2, "Mātes diena", [(1990, None)], "law-72608")]

# Cabinet orders: (year of the days, order, likumi id, date, LV issue, LV date, [(rest day, working Saturday)])
_MK = [
    (2001, "Ministru kabineta rīkojums Nr. 586 \"Par darbadienas pārcelšanu\"", 56308, "2001-12-06", "179", "2001-12-11",
     [("12-24", "12-22")]),
    (2002, "Ministru kabineta rīkojums Nr. 163 \"Par darbdienas pārcelšanu\"", 60769, "2002-03-26", "49", "2002-03-28",
     [("12-30", "12-28")]),
    (2003, "Ministru kabineta rīkojums Nr. 692 \"Par darbdienu pārcelšanu\"", 80562, "2003-10-30", "153", "2003-10-31",
     [("11-17", "11-15")]),
    (2004, "Ministru kabineta rīkojums Nr. 34 \"Par darbdienu pārcelšanu\"", 83431, "2004-01-21", "12", "2004-01-23",
     [("05-03", "05-08"), ("06-25", "06-19"), ("11-19", "11-13")]),
    (2006, "Ministru kabineta rīkojums Nr. 771 \"Par darbdienas pārcelšanu\"", 145144, "2006-10-04", "160", "2006-10-06",
     [("11-27", "12-02")]),
    (2007, "Ministru kabineta rīkojums Nr. 203 \"Par darbdienu pārcelšanu\"", 131354, "2006-03-27", "50", "2006-03-28",
     [("04-30", "04-14")]),
    (2008, "Ministru kabineta rīkojums Nr. 195", 173689, "2008-04-08", "56", "2008-04-10",
     [("05-02", "05-10"), ("11-17", "11-22")]),
    (2009, "Ministru kabineta rīkojums Nr. 783", 185051, "2008-12-09", "193", "2008-12-11",
     [("01-02", "01-10"), ("06-22", "06-27")]),
    (2010, "Ministru kabineta rīkojums Nr. 924", 203023, "2009-12-28", "205", "2009-12-30",
     [("05-03", "05-29"), ("06-25", "06-19"), ("11-19", "11-13")]),
    (2012, "Ministru kabineta rīkojums Nr. 146", 228399, "2011-04-06", "56", "2011-04-08", [("04-30", "04-28")]),
    (2013, "Ministru kabineta rīkojums Nr. 195", 247102, "2012-04-25", "66", "2012-04-27",
     [("12-23", "12-14"), ("12-30", "12-28")]),
    (2014, "Ministru kabineta rīkojums Nr. 278", 257810, "2013-06-25", "123", "2013-06-28",
     [("05-02", "05-10"), ("11-17", "11-22")]),
    (2015, "Ministru kabineta rīkojums Nr. 245", 266487, "2014-05-26", "102", "2014-05-28",
     [("01-02", "01-10"), ("06-22", "06-27")]),
    (2017, "Ministru kabineta rīkojums Nr. 342", 282928, "2016-06-15", "117", "2016-06-17", [("05-05", "05-13")]),
    (2018, "Ministru kabineta rīkojums Nr. 211", 290413, "2017-04-25", "84", "2017-04-27", [("04-30", "04-21")]),
    (2020, "Ministru kabineta rīkojums Nr. 342", 308097, "2019-07-09", "139", "2019-07-11", [("06-22", "06-13")]),
    (2021, "Ministru kabineta rīkojums Nr. 354", 315837, "2020-06-30", "126", "2020-07-03",
     [("05-03", "05-08"), ("06-25", "06-19"), ("11-19", "11-13")]),
    (2023, "Ministru kabineta rīkojums Nr. 443", 333470, "2022-06-21", "121", "2022-06-27", [("05-05", "05-20")]),
    (2024, "Ministru kabineta rīkojums Nr. 348", 342680, "2023-06-13", "115", "2023-06-15",
     [("12-23", "12-14"), ("12-30", "12-28")]),
    (2025, "Ministru kabineta rīkojums Nr. 332", 351684, "2024-04-30", "86", "2024-05-03",
     [("05-02", "05-10"), ("11-17", "11-08")]),
    (2026, "Ministru kabineta rīkojums Nr. 330", 361161, "2025-06-12", "113", "2025-06-13",
     [("01-02", "01-17"), ("06-22", "06-27")]),
]

_NOTE = {2007: "The order also moved 24 Dec 2007 to Sat 29 Dec; 24 December became a holiday by amd-158621 and "
               "likumi.lv records the order as lapsed on 7 Nov 2007, so only the April pair is kept.",
         2003: "Order 692 also moved 2 Jan 2004 to Sat 10 Jan 2004 (in the 2004 block)."}


def _doc(title, ident, date, issue, lv_date, year):
    u = _L + str(ident)
    return dict(title=f"{title} ({date})", uri=u, issued=date, issued_uri=u, published=lv_date, published_uri=u,
                published_in=f"Latvijas Vēstnesis, {issue}", dates_note=_NOTE.get(year))


LV_YEARS = {}
for _y, _t, _i, _d, _iss, _lvd, _pairs in _MK:
    LV_YEARS[_y] = dict(confidence="primary", covers=[], docs=[_doc(_t, _i, _d, _iss, _lvd, _y)],
                        days=[(rest, "Brīvdiena (pārcelta darbdiena)", 0) for rest, _ in _pairs],
                        working=[(sat, 0) for _, sat in _pairs])

# Order 692 of 2003 also covers 2 Jan 2004.
LV_YEARS[2004]["docs"].append(_doc(_MK[2][1], _MK[2][2], _MK[2][3], _MK[2][4], _MK[2][5], 2003))
LV_YEARS[2004]["days"].append(("01-02", "Brīvdiena (pārcelta darbdiena)", 1))
LV_YEARS[2004]["working"].append(("01-10", 1))


def _amd(key):
    st = next(s for s in LV_STATUTES if s["key"] == key)
    return {k: st.get(k) for k in ("title", "uri", "issued", "issued_uri", "published", "published_uri",
                                   "published_in", "dates_note")}


_FESTIVAL = dict(title="Likums \"Par svētku, atceres un atzīmējamām dienām\" art. 1 (Dziesmu un deju svētku noslēguma "
                 "diena) with its Saturday/Sunday rule", uri=_L + "269373", issued="2014-10-02", issued_uri=_L + "269373",
                 published="2014-10-08", published_uri=_L + "269373", published_in="Latvijas Vēstnesis, 199",
                 dates_note="SECONDARY: the festival's closing day (a Sunday) was not read on a primary page; the "
                            "next working day is a day off by the law.")

LV_YEARS[2018]["confidence"] = "secondary"
LV_YEARS[2018]["docs"] += [_FESTIVAL, _amd("amd-299942")]
LV_YEARS[2018]["days"] += [("07-08", "Vispārējo latviešu Dziesmu un deju svētku noslēguma diena", 1),
                           ("07-09", "Dziesmu un deju svētku noslēguma diena (brīvdiena)", 1),
                           ("09-24", "Pāvesta Franciska pastorālās vizītes Latvijā diena", 2)]
LV_YEARS[2023]["confidence"] = "secondary"
LV_YEARS[2023]["docs"] += [_FESTIVAL, _amd("amd-342196")]
LV_YEARS[2023]["days"] += [("07-09", "Vispārējo latviešu Dziesmu un deju svētku noslēguma diena", 1),
                           ("07-10", "Dziesmu un deju svētku noslēguma diena (brīvdiena)", 1),
                           ("05-29", "Hokeja bronzas medaļas diena", 2)]
