"""Zambia public holidays 2000-2027: primary-source transcription for
egao1980/cl-stack-calendars#45.  Stdlib only; data, no logic.

Cache: ~/.cache/cl-stack-calendars/zm/
  parliament-public-holidays-act-cap272.pdf   Act text (parliament.gov.zm)
  gazette-YYYY-MM-DD-no-N.pdf                 Government Gazette issues (archive.gazettes.africa)
  zambialii-api-*.json                        ZambiaLII search-API results; the SI pages themselves
                                              sit behind a Cloudflare challenge, so SI wording was read
                                              from the search snippets (exact quotes, see notes)
  parliament-report-nab76-2026.pdf            Committee report on the Public Holidays (Amendment) Bill 2026
"""

_ACT = "https://www.parliament.gov.zm/sites/default/files/documents/acts/Public%20Holidays%20Act.pdf"
_LII = "https://zambialii.org/akn/zm/"
_GZ = "https://archive.gazettes.africa/archive/zm/{y}/zm-government-gazette-dated-{d}-no-{n}.pdf"


def _gz(d, n):
    return _GZ.format(y=d[:4], d=d, n=n)


def _si(y, n, d):
    return _LII + "act/si/%d/%d/eng@%s" % (y, n, d)


ZM_STATUTES = [
    dict(key="cap-272",
         title="Public Holidays Act, Chapter 272 of the Laws of Zambia (Act 14 of 1964, as amended "
               "to Act 23 of 1987; 1996 revised edition)",
         uri=_ACT, issued="1964-03-26", issued_uri=_LII + "act/1964/14/eng@1996-12-31",
         published=None, published_uri=None,
         published_in="Laws of Zambia, 1996 revised edition (Vol. 15)", in_force="1964-03-26",
         dates_note="Act commencement 26 March 1964 (header of the revised edition); the 1964 gazette "
                    "issue was not looked up.",
         summary="s.2(1) Schedule days are public holidays; s.2(2) whenever a Schedule day falls on a "
                 "Sunday the following Monday is observed as a public holiday; s.3 the Minister may by "
                 "statutory notice declare additional days. Schedule: (a) New Year's Day (b) Youth Day "
                 "(12th March) (c) Good Friday (d) Holy Saturday (e) Labour Day (1st May) (f) African "
                 "Freedom Day (25th May) (g) Heroes Day (First Monday in July) (h) Unity Day (Tuesday "
                 "following Heroes Day) (i) Farmers Day (First Monday in August) (j) Independence Day "
                 "(24th October) (k) Christmas Day. Easter Sunday, Easter Monday, Women's Day, Prayer "
                 "Day and Kenneth Kaunda Day are s.3 days (NAB 76/2026 committee report), but the "
                 "Cabinet Office lists apply the Sunday rule to them too (2020-03-09, 2020-10-19, "
                 "2024-04-29, 2026-03-09)."),
    dict(key="act-12-1983",
         title="Public Holidays (Amendment) Act, 1983 (Act 12 of 1983)",
         uri=_LII + "act/1983/12/eng@1983-04-15", issued="1983-04-08", issued_uri=None,
         published="1983-04-15", published_uri=_LII + "act/1983/12/eng@1983-04-15",
         published_in="ZambiaLII date 15 April 1983", in_force="1983-04-08",
         dates_note="Assent 8 April 1983 per the search snippet; ZambiaLII dates the document 15 April.",
         summary="Substituted the Schedule: Youth Day = third Saturday in March; Heroes Day = first "
                 "Monday in July; Unity Day = Tuesday following Heroes Day; Farmers Day = first Monday "
                 "in August; Good Friday, Holy Saturday, Labour Day, Africa Freedom Day, "
                 "Independence Day, Christmas Day."),
    dict(key="act-23-1987",
         title="Public Holidays (Amendment) Act, 1987 (Act 23 of 1987)",
         uri=_LII + "act/1987/23/eng@1987-12-31", issued="1987-12-28", issued_uri=None,
         published=None, published_uri=None, published_in=None, in_force=None,
         dates_note="Assent 28 December 1987 per the search snippet; gazette not looked up.",
         summary="Replaced para (b) with Youth Day (12th March), in force for 1988 on."),
    dict(key="si-33-2007",
         title="Public Holiday (Declaration) Notice, 2007 (SI 33 of 2007)",
         uri=_si(2007, 33, "2007-04-27"), issued=None, issued_uri=None,
         published="2007-04-27", published_uri=_si(2007, 33, "2007-04-27"),
         published_in="Supplement to the Zambia Government Gazette, 27 April 2007", in_force=None,
         dates_note="SI text not seen (Cloudflare; no search snippet). Content per python-holidays "
                    "0.109, which cites this SI for International Women's Day from 2008.",
         summary="(Secondary) declares 8 March, International Women's Day, a public holiday every "
                 "year from 2008. The Cabinet Office lists include it from 2013 (first list seen)."),
    dict(key="si-78-2015",
         title="Public Holiday (Declaration) Notice, 2015 (SI 78 of 2015)",
         uri=_si(2015, 78, "2015-10-23"), issued=None, issued_uri=None,
         published="2015-10-23", published_uri=_si(2015, 78, "2015-10-23"),
         published_in="Supplement to the Zambia Government Gazette, Friday 23 October 2015",
         in_force="2016-10-18",
         dates_note="Signature date not in the snippet.",
         summary="'declared that the 18th of October in every year, commencing with 18th October, "
                 "2016, shall be observed as a public holiday, being a day of national prayer, "
                 "fasting, repentance [and reconciliation]'. Revoked in 2026 (si-73-2026)."),
    dict(key="constitution-art56",
         title="Constitution of Zambia (Amendment) Act, 2016 (Act 2 of 2016), Article 56",
         uri=_LII + "act/1991/1/eng@2025-12-18", issued="2016-01-05", issued_uri=None,
         published=None, published_uri=None, published_in=None, in_force="2016-01-05",
         dates_note="Assent date from general knowledge (5 January 2016), not verified in this run.",
         summary="Art. 56(1) general elections every five years on the second Thursday of August; "
                 "Art. 56(2) 'The day on which a general election is held shall be a public holiday.' "
                 "(2016-08-11, 2021-08-12, 2026-08-13)."),
    dict(key="si-72-2021",
         title="Public Holidays (Declaration) (No. 3) Notice, 2021 (SI 72 of 2021)",
         uri=_si(2021, 72, "2021-08-20"), issued=None, issued_uri=None,
         published="2021-08-20", published_uri=_si(2021, 72, "2021-08-20"),
         published_in="Supplement to the Zambia Government Gazette, Friday 20 August 2021",
         in_force="2022-04-28", dates_note="Signature date not in the snippet.",
         summary="'It is declared that 28th April in every year, commencing with 28th April, 2022, "
                 "shall be observed as a public holiday in commemoration of the birthday of the late "
                 "First [Republican President Dr Kenneth David Kaunda]'."),
    dict(key="si-73-2026",
         title="Statutory Instrument No. 73 of 2026 (National Day of Prayer and Christian Heritage); "
               "revocation of SI 78 of 2015",
         uri="https://www.lusakatimes.com/2026/10/09/govt-cancels-october-18-as-public-holiday/",
         issued=None, issued_uri=None, published=None, published_uri=None,
         published_in="news reports of a Cabinet Office statement (Lusaka Times 2026-10-09; "
                      "mwebantu; diggers.news)", in_force="2026",
         dates_note="SECONDARY ONLY: the SI is not on ZambiaLII yet and the gazette was not found. "
                    "One report numbers it 173 of 2026.",
         summary="Revokes SI 78/2015, so 18 October 2026 (and the Monday 19 Oct in lieu) is not a "
                 "holiday; makes 29 December every year, from 2026, the National Day of Prayer and "
                 "Christian Heritage."),
]

ZM_FIXED = [
    (1, 1, "New Year's Day", [(1964, None)], "cap-272"),
    (3, 8, "International Women's Day", [(2008, None)], "si-33-2007"),
    (3, 12, "Youth Day", [(1988, None)], "act-23-1987"),
    (4, 28, "Kenneth Kaunda Day", [(2022, None)], "si-72-2021"),
    (5, 1, "Labour Day", [(1964, None)], "cap-272"),
    (5, 25, "Africa Freedom Day", [(1964, None)], "cap-272"),
    (10, 18, "National Day of Prayer, Fasting, Repentance and Reconciliation", [(2016, 2025)], "si-78-2015"),
    (10, 24, "Independence Day", [(1964, None)], "cap-272"),
    (12, 25, "Christmas Day", [(1964, None)], "cap-272"),
    (12, 29, "National Day of Prayer and Christian Heritage", [(2026, None)], "si-73-2026"),
]

ZM_ISLAMIC = []  # none

ZM_OTHER_RULES = [
    dict(rule="easter", offsets={-2: "Good Friday", -1: "Holy Saturday"}, years=(1964, None), source="cap-272"),
    dict(rule="easter", offsets={0: "Easter Sunday", 1: "Easter Monday"}, years=(1964, None),
         source="cap-272 s.3",
         note="Not in the Schedule; declared under s.3 and listed every year in the Cabinet Office notice."),
    dict(rule="nth-weekday", month=7, weekday="MON", n=1, name="Heroes Day", years=(1983, None), source="act-12-1983"),
    dict(rule="day-after", of="Heroes Day", name="Unity Day", years=(1983, None), source="act-12-1983"),
    dict(rule="nth-weekday", month=8, weekday="MON", n=1, name="Farmers Day", years=(1983, None), source="act-12-1983"),
    dict(rule="sunday-to-monday", years=(1964, None), source="cap-272",
         applies_to="all fixed-date days incl. the s.3 days (Women's Day, Prayer Day, Kaunda Day)",
         note="s.2(2). Listed as 'Day following X which falls on Sunday'. Saturdays are not moved "
              "(e.g. 2021-05-01, 2021-12-25, 2026-10-24). Heroes/Unity/Farmers are always Mon/Tue. "
              "NAB 76 of 2026 (Public Holidays (Amendment) Bill) would delete s.2(2); committee "
              "report seen, enactment NOT confirmed - treat the rule as still in force."),
    dict(rule="general-election-day", month=8, weekday="THU", n=2, every=5, first=2016,
         years=(2016, None), source="constitution-art56"),
    dict(rule="cabinet-office-annual-list", years=(2012, None), source="annual Gazette Notices",
         note="The Secretary to the Cabinet gazettes 'the days ... observed as non-working Public "
              "Holidays in the year YYYY' a few months ahead."),
]

def _gn(title, d, n, signed=None, note=None):
    return dict(title=title, uri=_gz(d, n), issued=signed, issued_uri=_gz(d, n),
                published=d, published_uri=_gz(d, n),
                published_in="Zambia Government Gazette, %s (No. %s)" % (d, n), dates_note=note)


def _sidoc(title, y, n, d, note=None):
    u = _si(y, n, d)
    return dict(title=title, uri=u, issued=None, issued_uri=None, published=d, published_uri=u,
                published_in="Supplement to the Zambia Government Gazette, %s" % d,
                dates_note=note or "Signature date not in the ZambiaLII search snippet; SI page itself "
                                   "is behind Cloudflare.")


_RULE = dict(title="Public Holidays Act Cap. 272, Schedule and s.2(2), plus standing s.3 notices, applied by rule",
             uri=_ACT, issued=None, issued_uri=None, published=None, published_uri=None,
             published_in="statute (rule)",
             dates_note="Rule-derived rows: no annual list found for this year; statute dates are in ZM_STATUTES.")

ZM_YEARS = {
    2013: dict(
        confidence="primary",
        docs=[_gn("Gazette Notice No. 537 of 2012, The Public Holidays Act: Public Holidays in the year 2013",
                  "2012-08-31", 6100, "2012-08-14"),
              _gn("Gazette Notice No. 744 of 2012, Corrigendum to GN 537/2012", "2012-11-23", 6129, "2012-11-19")],
        days=[("01-01", "New Year's Day", 0), ("03-08", "International Women's Day", 0), ("03-12", "Youth Day", 0),
              ("03-29", "Good Friday", 0), ("03-30", "Holy Saturday", 0), ("03-31", "Easter Sunday", 1),
              ("04-01", "Easter Monday", 0), ("05-01", "Labour Day", 0), ("05-25", "Africa Freedom Day", 0),
              ("07-01", "Heroes Day", 0), ("07-02", "Unity Day", 0), ("08-05", "Farmers Day", 0),
              ("10-24", "Independence Day", 0), ("12-25", "Christmas Day", 0)],
        suppressed=[], working=[],
        notes="Corrigendum: 31 March 2013 'Holy Sunday' should read 'Easter Sunday'.",
    ),
    2014: dict(
        confidence="primary",
        docs=[_gn("Gazette Notice No. 348 of 2013, The Public Holidays Act: Public Holidays in the year 2014",
                  "2013-08-30", 6228, "2013-08-27"),
              _sidoc("Public Holiday (Declaration) Notice, 2014 (SI 61 of 2014)", 2014, 61, "2014-11-07"),
              _sidoc("Public Holidays (Declaration) Notice, 2014 (SI 66 of 2014)", 2014, 66, "2014-12-19")],
        days=[("01-01", "New Year's Day", 0), ("03-08", "International Women's Day", 0), ("03-12", "Youth Day", 0),
              ("04-18", "Good Friday", 0), ("04-19", "Holy Saturday", 0), ("04-20", "Easter Sunday", 0),
              ("04-21", "Easter Monday", 0), ("05-01", "Labour Day", 0), ("05-25", "Africa Freedom Day", 0),
              ("05-26", "Day following Africa Freedom Day", 0), ("07-07", "Heroes Day", 0),
              ("07-08", "Unity Day", 0), ("08-04", "Farmers Day", 0), ("10-24", "Independence Day", 0),
              ("11-11", "State funeral of President Michael Sata", 1), ("12-25", "Christmas Day", 0),
              ("12-26", "Public holiday (bridge, Christmas on Thursday)", 2)],
        suppressed=[], working=[],
        notes="SI 61/2014: 'Tuesday, 11th November, 2014, shall be observed as a public holiday in "
              "view of the State funeral'. SI 66/2014: 'Friday, 26th December, 2014 and Friday, 2nd "
              "January, 2015, shall be observed as public holidays in view of the fact that Christmas "
              "day and New Year's day fall on Thursday'. Signed by the Secretary to the Cabinet; "
              "list OCR legible.",
    ),
    2015: dict(
        confidence="primary",
        docs=[_sidoc("Public Holidays (Declaration) Notice, 2014 (SI 66 of 2014)", 2014, 66, "2014-12-19"),
              _sidoc("Public Holidays (Declaration) Notice, 2015 (SI 1 of 2015)", 2015, 1, "2015-01-12"),
              _RULE],
        days=[("01-01", "New Year's Day", 2), ("01-02", "Public holiday (bridge)", 0),
              ("01-20", "Presidential by-election", 1), ("03-08", "International Women's Day", 2),
              ("03-09", "Day following International Women's Day", 2), ("03-12", "Youth Day", 2),
              ("04-03", "Good Friday", 2), ("04-04", "Holy Saturday", 2), ("04-05", "Easter Sunday", 2),
              ("04-06", "Easter Monday", 2), ("05-01", "Labour Day", 2), ("05-25", "Africa Freedom Day", 2),
              ("07-06", "Heroes Day", 2), ("07-07", "Unity Day", 2), ("08-03", "Farmers Day", 2),
              ("10-24", "Independence Day", 2), ("12-25", "Christmas Day", 2)],
        suppressed=[], working=[],
        notes="The 2015 Cabinet Office list (gazetted in 2014) is not on ZambiaLII; fixed days by rule. "
              "18 Oct 2015 (a Sunday) was proclaimed a day of prayer but SI 78/2015 makes it a holiday "
              "only from 2016. SI 1/2015: 'Tuesday, 20th January, 2015, shall be observed as a public "
              "holiday in view of the presidential election'.",
    ),
    2016: dict(
        confidence="primary",
        docs=[_gn("Gazette Notice No. 692 of 2015, The Public Holidays Act: Public Holidays in the year 2016",
                  "2015-11-09", 6436, "2015-11-09", "GN number = first notice number printed in that issue; verify."),
              dict(title="Constitution of Zambia Art. 56(2) (general election day)", uri=_LII + "act/1991/1/eng@2025-12-18",
                   issued=None, issued_uri=None, published=None, published_uri=None, published_in="statute",
                   dates_note="Statute; election held Thursday 11 August 2016."),
              _sidoc("Public Holidays (Declaration) Notice, 2016 (SI 66 of 2016)", 2016, 66, "2016-09-09")],
        days=[("01-01", "New Year's Day", 0), ("03-08", "International Women's Day", 0), ("03-12", "Youth Day", 0),
              ("03-25", "Good Friday", 0), ("03-26", "Holy Saturday", 0), ("03-27", "Easter Sunday", 0),
              ("03-28", "Easter Monday", 0), ("05-01", "Labour Day", 0),
              ("05-02", "Day following Labour Day which falls on Sunday", 0),
              ("05-25", "Africa Freedom Day", 0), ("07-04", "Heroes Day", 0), ("07-05", "Unity Day", 0),
              ("08-01", "Farmers Day", 0), ("08-11", "General election", 1),
              ("09-13", "Swearing-in of the President-elect", 2),
              ("10-18", "Day of National Prayer, Fasting, Repentance and Reconciliation", 0),
              ("10-24", "Independence Day", 0), ("12-25", "Christmas Day", 0),
              ("12-26", "Day following Christmas Day which falls on Sunday", 0)],
        suppressed=[], working=[],
        notes="SI 66/2016: 'Tuesday, 13th September, 2016 shall be observed as a public holiday in view "
              "of the swearing-in ceremony of the President-elect and the Vice-President-elect'.",
    ),
    2017: dict(
        confidence="primary",
        docs=[_gn("Gazette Notice No. 652 of 2016, The Public Holidays Act: Public Holidays in the year 2017",
                  "2016-09-30", 6513, "2016-09-30", "GN number = first notice number printed in that issue; verify.")],
        days=[("01-01", "New Year's Day", 0), ("01-02", "Day following New Year's Day which falls on Sunday", 0),
              ("03-08", "International Women's Day", 0), ("03-12", "Youth Day", 0),
              ("03-13", "Day following Youth Day which falls on Sunday", 0), ("04-14", "Good Friday", 0),
              ("04-15", "Holy Saturday", 0), ("04-16", "Easter Sunday", 0), ("04-17", "Easter Monday", 0),
              ("05-01", "Labour Day", 0), ("05-25", "Africa Freedom Day", 0), ("07-03", "Heroes Day", 0),
              ("07-04", "Unity Day", 0), ("08-07", "Farmer's Day", 0),
              ("10-18", "Day of National Prayer, Fasting, Repentance and Reconciliation", 0),
              ("10-24", "Independence Day", 0), ("12-25", "Christmas Day", 0)],
        suppressed=[], working=[], notes="",
    ),
    2018: dict(
        confidence="primary",
        docs=[_gn("Gazette Notice (No. 623-625 of 2017), The Public Holidays Act: Public Holidays in the year 2018",
                  "2017-09-29", 6607, "2017-09-26", "GN number not legible; one of 623-625 of 2017."),
              _sidoc("Public Holidays (Declaration) Notice, 2018 (SI 15 of 2018)", 2018, 15, "2018-03-06",
                     "Signed by President Lungu, dated '6th February, 2018' in the snippet (likely OCR/typo for March)."),
              _sidoc("Public Holidays (Declaration) (No. 2) Notice, 2018 (SI 55 of 2018)", 2018, 55, "2018-07-23")],
        days=[("01-01", "New Year's Day", 0), ("03-08", "International Women's Day", 0),
              ("03-09", "Public holiday (bridge between Women's Day and Youth Day)", 1),
              ("03-12", "Youth Day", 0), ("03-30", "Good Friday", 0), ("03-31", "Holy Saturday", 0),
              ("04-01", "Easter Sunday", 0), ("04-02", "Easter Monday", 0), ("05-01", "Labour Day", 0),
              ("05-25", "Africa Freedom Day", 0), ("07-02", "Heroes Day", 0), ("07-03", "Unity Day", 0),
              ("07-26", "Public holiday (Lusaka mayoral and local by-elections)", 2),
              ("08-06", "Farmer's Day", 0),
              ("10-18", "Day of National Prayer, Fasting, Repentance and Reconciliation", 0),
              ("10-24", "Independence Day", 0), ("12-25", "Christmas Day", 0)],
        suppressed=[], working=[],
        notes="SI 15/2018: 'Friday, 9th March, 2018, shall be observed as public holiday in view of the "
              "fact that International Women's Day which falls on Thursday, 8th March, 2018, and Youth "
              "Day which falls on Monday, 12th March'. SI 55/2018: 'Thursday, 26th July, 2018, shall be "
              "observed as Public Holiday' - declared under s.3 (throughout Zambia) although the polls "
              "were local (Lusaka Times 2018-07-20: to let people vote).",
    ),
    2019: dict(
        confidence="primary",
        docs=[_gn("Gazette Notice, The Public Holidays Act: Public Holidays in the year 2019",
                  "2018-07-20", 6681, "2018-07-20", "GN number not legible in the OCR."),
              _sidoc("Public Holidays (Declaration) Notice, 2019 (SI 71 of 2019)", 2019, 71, "2019-10-23",
                     "Signed by President Lungu, Lusaka, 23 October 2019.")],
        days=[("01-01", "New Year's Day", 0), ("03-08", "International Women's Day", 0), ("03-12", "Youth Day", 0),
              ("04-19", "Good Friday", 0), ("04-20", "Holy Saturday", 0), ("04-21", "Easter Sunday", 0),
              ("04-22", "Easter Monday", 0), ("05-01", "Labour Day", 0), ("05-25", "Africa Freedom Day", 0),
              ("07-01", "Heroes Day", 0), ("07-02", "Unity Day", 0), ("08-05", "Farmers' Day", 0),
              ("10-18", "Day of National Prayers, Repentance and Reconciliation", 0),
              ("10-24", "Independence Day", 0), ("10-25", "Public holiday (declared)", 1),
              ("12-25", "Christmas Day", 0)],
        suppressed=[], working=[],
        notes="SI 71/2019: 'Friday, 25th October, 2019 shall be observed as a Public Holiday' (reason not "
              "in the snippet; python-holidays calls it a bridge day after Independence Day Thursday).",
    ),
    2020: dict(
        confidence="primary",
        docs=[_gn("Gazette Notice, The Public Holidays Act: Public Holidays in the year 2020",
                  "2019-11-15", 6812, "2019-11-15", "GN number not legible; last two rows lost in OCR.")],
        days=[("01-01", "New Year's Day", 0), ("03-08", "International Women's Day", 0),
              ("03-09", "Day following International Women's Day which falls on Sunday", 0),
              ("03-12", "Youth Day", 0), ("04-10", "Good Friday", 0), ("04-11", "Holy Saturday", 0),
              ("04-12", "Easter Sunday", 0), ("04-13", "Easter Monday", 0), ("05-01", "Labour Day", 0),
              ("05-25", "Africa Freedom Day", 0), ("07-06", "Heroes Day", 0), ("07-07", "Unity Day", 0),
              ("08-03", "Farmers' Day", 0), ("10-18", "Day of National Prayers, Repentance and Reconciliation", 0),
              ("10-19", "Day following National Prayer Day which falls on Sunday", 0),
              ("10-24", "Independence Day", 0), ("12-25", "Christmas Day", 0)],
        suppressed=[], working=[],
        notes="Independence Day (Saturday) and Christmas Day (Friday) rows are illegible in the OCR; "
              "taken from the Schedule (no Saturday rule, so no extra day).",
    ),
    2021: dict(
        confidence="primary",
        docs=[_gn("Gazette Notice No. 1003 of 2020, The Public Holidays Act: Public Holidays in the year 2021",
                  "2020-10-07", 6813, "2020-09-29"),
              _sidoc("Public Holidays (Declaration) Notice, 2021 (SI 69 of 2021)", 2021, 69, "2021-07-30"),
              dict(title="Constitution of Zambia Art. 56(2) (general election day)", uri=_LII + "act/1991/1/eng@2025-12-18",
                   issued=None, issued_uri=None, published=None, published_uri=None, published_in="statute",
                   dates_note="Statute; election held Thursday 12 August 2021."),
              _sidoc("Public Holidays (Declaration) (No. 2) Notice, 2021 (SI 71 of 2021)", 2021, 71, "2021-08-06"),
              _sidoc("Public Holidays (Declaration) (No. 4) Notice, 2021 (SI 73 of 2021)", 2021, 73, "2021-08-20")],
        days=[("01-01", "New Year's Day", 0), ("03-08", "International Women's Day", 0), ("03-12", "Youth Day", 0),
              ("04-02", "Good Friday", 0), ("04-03", "Holy Saturday", 0), ("04-04", "Easter Sunday", 0),
              ("04-05", "Easter Monday", 0), ("05-01", "Labour Day", 0), ("05-25", "Africa Freedom Day", 0),
              ("07-02", "Memorial service for Kenneth Kaunda", 1), ("07-05", "Heroes Day", 0),
              ("07-06", "Unity Day", 0), ("07-07", "State funeral and burial of Kenneth Kaunda", 1),
              ("08-02", "Farmers' Day", 0), ("08-12", "General election", 2),
              ("08-13", "Public holiday (day after the general election)", 3),
              ("08-24", "Swearing-in of the President-elect", 4),
              ("10-18", "Day of National Prayers, Repentance and Reconciliation", 0),
              ("10-24", "Independence Day", 0),
              ("10-25", "Day following Independence Day which falls on Sunday", 0),
              ("12-25", "Christmas Day", 0)],
        suppressed=[], working=[],
        notes="Answers issue item 5: 2021-10-25 is gazetted. SI 69/2021 (gazetted 30 July, after the "
              "fact): 'Friday, 2nd July, 2021 and Wednesday, 7th July, 2021 shall be observed as Public "
              "Holiday in view of the State Funeral and Burial of the First Republican [President]'. "
              "SI 71/2021: 'Friday, 13th August, 2021 shall be observed as a Public Holiday' "
              "(following the conduct of general elections). SI 73/2021: 'Tuesday, 24th August, 2021, "
              "shall be observed as a public holiday in view of the swearing-in ceremony'. Christmas "
              "on Saturday: no extra day.",
    ),
    2022: dict(
        confidence="primary",
        docs=[_sidoc("Public Holidays (Declaration) Notice, 2022 (SI 20 of 2022)", 2022, 20, "2022-03-16",
                     "Signed by President Hichilema, Lusaka, 16 March 2022."), _RULE],
        days=[("01-01", "New Year's Day", 1), ("03-08", "International Women's Day", 1), ("03-12", "Youth Day", 1),
              ("03-18", "State funeral of Rupiah Banda", 0), ("04-15", "Good Friday", 1),
              ("04-16", "Holy Saturday", 1), ("04-17", "Easter Sunday", 1), ("04-18", "Easter Monday", 1),
              ("04-28", "Kenneth Kaunda Day", 1), ("05-01", "Labour Day", 1),
              ("05-02", "Day following Labour Day which falls on Sunday", 1),
              ("05-25", "Africa Freedom Day", 1), ("07-04", "Heroes Day", 1), ("07-05", "Unity Day", 1),
              ("08-01", "Farmers' Day", 1), ("10-18", "Day of National Prayer, Fasting, Repentance and Reconciliation", 1),
              ("10-24", "Independence Day", 1), ("12-25", "Christmas Day", 1),
              ("12-26", "Day following Christmas Day which falls on Sunday", 1)],
        suppressed=[], working=[],
        notes="The 2022 list (gazetted 2021) is not on ZambiaLII; fixed days by rule. SI 20/2022: "
              "'Friday, 18th March, 2022 shall be observed as a public holiday in view of [the State "
              "Funeral of the Fourth Republican President Rupiah Banda]'.",
    ),
    2023: dict(
        confidence="primary",
        docs=[_gn("Gazette Notice No. 1096 of 2022, The Public Holidays Act: Public Holidays in the year 2023",
                  "2022-07-19", 7149, "2022-07-18")],
        days=[("01-01", "New Year's Day", 0), ("01-02", "Day following New Year's Day which falls on Sunday", 0),
              ("03-08", "International Women's Day", 0), ("03-12", "Youth Day", 0),
              ("03-13", "Day following Youth Day which falls on Sunday", 0), ("04-07", "Good Friday", 0),
              ("04-08", "Holy Saturday", 0), ("04-09", "Easter Sunday", 0), ("04-10", "Easter Monday", 0),
              ("04-28", "Kenneth Kaunda Day", 0), ("05-01", "Labour Day", 0), ("05-25", "Africa Freedom Day", 0),
              ("07-03", "Heroes Day", 0), ("07-04", "Unity Day", 0), ("08-07", "Farmer's Day", 0),
              ("10-18", "Day of National Prayer, Fasting, Repentance and Reconciliation", 0),
              ("10-24", "Independence Day", 0), ("12-25", "Christmas Day", 0)],
        suppressed=[], working=[], notes="",
    ),
    2024: dict(
        confidence="primary",
        docs=[_gn("Gazette Notice, The Public Holidays Act: Public Holidays in the year 2024",
                  "2023-07-21", 7476, "2023-07-21", "GN number not legible in the OCR.")],
        days=[("01-01", "New Year's Day", 0), ("03-08", "International Women's Day", 0), ("03-12", "Youth Day", 0),
              ("03-29", "Good Friday", 0), ("03-30", "Holy Saturday", 0), ("03-31", "Easter Sunday", 0),
              ("04-01", "Easter Monday", 0), ("04-28", "Kenneth Kaunda Day", 0),
              ("04-29", "Day following Kenneth Kaunda Day which falls on Sunday", 0),
              ("05-01", "Labour Day", 0), ("05-25", "Africa Freedom Day", 0), ("07-01", "Heroes Day", 0),
              ("07-02", "Unity Day", 0), ("08-05", "Farmer's Day", 0),
              ("10-18", "National Day of Prayer, Fasting, Repentance and Reconciliation", 0),
              ("10-24", "Independence Day", 0), ("12-25", "Christmas Day", 0)],
        suppressed=[], working=[], notes="",
    ),
    2025: dict(
        confidence="primary",
        docs=[_gn("Gazette Notice (Feb 2025), The Public Holidays Act: Public Holidays in the year 2025 "
                  "(revokes GN 1078 of 2024; deemed in operation from 8 October 2024)",
                  "2025-02-18", 7716, "2025-02-18", "GN number not legible in the OCR."),
              _gn("Gazette Notice No. 1078 of 2024, Public Holidays in the year 2025 (revoked)",
                  "2024-10-09", 7652, "2024-10-08")],
        days=[("01-01", "New Year's Day", 0), ("03-08", "International Women's Day", 0), ("03-12", "Youth Day", 0),
              ("04-18", "Good Friday", 0), ("04-19", "Holy Saturday", 0), ("04-20", "Easter Sunday", 0),
              ("04-21", "Easter Monday", 0), ("04-28", "Kenneth Kaunda Day", 0), ("05-01", "Labour Day", 0),
              ("05-25", "Africa Freedom Day", 0),
              ("05-26", "Day following Africa Freedom Day which falls on a Sunday", 0),
              ("07-07", "Heroes Day", 0), ("07-08", "Unity Day", 0), ("08-04", "Farmers Day", 0),
              ("10-18", "National Day of Prayer, Fasting, Repentance and Reconciliation", 0),
              ("10-24", "Independence Day", 0), ("12-25", "Christmas Day", 0)],
        suppressed=[], working=[],
        notes="GN 1078/2024 put Heroes/Unity Day on Monday 30 June / Tuesday 1 July 2025 (not the first "
              "Monday of July); the February 2025 notice revoked it and restored 7/8 July (diggers.news "
              "2025-03-20 'govt shifts dates for Heroes, Unity Day'). Women's Day and Prayer Day on "
              "Saturday: no extra day.",
    ),
    2026: dict(
        confidence="secondary",
        docs=[_gn("Gazette Notice, The Public Holidays Act: Public Holidays in the year 2026",
                  "2025-09-15", 7809, "2025-09-12", "GN number not legible in the OCR."),
              dict(title="Constitution of Zambia Art. 56(2); Cabinet Office Circular No. 12 of 2026 (news)",
                   uri="https://zambianobserver.com/?p=712517", issued=None, issued_uri=None,
                   published=None, published_uri=None, published_in="news report (Zambian Observer)",
                   dates_note="Circular itself not seen; election held Thursday 13 August 2026; Friday "
                              "14 August expressly not a holiday."),
              dict(title="Declaration of Tuesday 1 September 2026 (presidential swearing-in) - news",
                   uri="https://www.zambiamonitor.com/?p=91538", issued=None, issued_uri=None,
                   published=None, published_uri=None, published_in="news report (Zambia Monitor)",
                   dates_note="SI not found on ZambiaLII; secondary only."),
              dict(title="SI 73 of 2026: revocation of SI 78/2015; 29 December National Day of Prayer and "
                         "Christian Heritage - news",
                   uri="https://www.lusakatimes.com/2026/10/09/govt-cancels-october-18-as-public-holiday/",
                   issued=None, issued_uri=None, published="2026-10-09", published_uri=None,
                   published_in="news report of a Cabinet Office statement (Lusaka Times)",
                   dates_note="SI text not found; secondary only.")],
        days=[("01-01", "New Year's Day", 0), ("03-08", "International Women's Day", 0),
              ("03-09", "Day following International Women's Day which falls on a Sunday", 0),
              ("03-12", "Youth Day", 0), ("04-03", "Good Friday", 0), ("04-04", "Holy Saturday", 0),
              ("04-05", "Easter Sunday", 0), ("04-06", "Easter Monday", 0), ("04-28", "Kenneth Kaunda Day", 0),
              ("05-01", "Labour Day", 0), ("05-25", "Africa Freedom Day", 0), ("07-06", "Heroes Day", 0),
              ("07-07", "Unity Day", 0), ("08-03", "Farmers Day", 0), ("08-13", "General election", 1),
              ("09-01", "Swearing-in of the President-elect", 2), ("10-24", "Independence Day", 0),
              ("12-25", "Christmas Day", 0), ("12-29", "National Day of Prayer and Christian Heritage", 3)],
        suppressed=[("10-18", "National Day of Prayer, Fasting, Repentance and Reconciliation", 3),
                    ("10-19", "Day following National Day of Prayer which falls on a Sunday", 3)],
        working=[],
        notes="The gazetted list (primary) has 18/19 October; both were withdrawn by SI 73/2026 "
              "(reported 9 Oct 2026) which adds 29 December. The election, swearing-in and 29 Dec "
              "items rest on news reports only.",
    ),
}

ZM_ADHOC = [
    ("2001-12-27", "General election (Thursday)", "", "unverified", "pre-2016: declared by s.3 notice; not found"),
    ("2006-09-28", "General election (Thursday)", "", "unverified", "s.3 notice not on ZambiaLII"),
    ("2008-10-30", "Presidential by-election (Thursday)", "", "unverified", "s.3 notice not on ZambiaLII"),
    ("2011-09-20", "General election (Tuesday)", "", "unverified", "s.3 notice not on ZambiaLII"),
    ("2008-09-03", "State funeral of President Levy Mwanawasa (date approximate)", "", "unverified",
     "a mourning holiday may have been declared; no source found"),
]

ZM_FINDINGS = """
Sources: Act text from parliament.gov.zm (1996 revised edition, as amended to Act 23 of 1987);
annual Cabinet Office Gazette Notices 'Public Holidays in the year YYYY' (2013, 2014, 2016-2021,
2023-2026) and declaration SIs from the Zambia Government Gazette / ZambiaLII. ZambiaLII document
pages are behind a Cloudflare challenge; the gazettes were downloaded from archive.gazettes.africa
and the SI wording was read from the ZambiaLII search API snippets (quoted in notes).

Issue item 5 (Sunday rule): CONFIRMED. s.2(2): a Schedule day on a Sunday -> the following Monday.
The lists apply it to the s.3 days too (Women's Day 2020-03-09, 2026-03-09; Prayer Day 2020-10-19;
Kaunda Day 2024-04-29). 2021-10-25 is in GN 1003/2020. Saturdays are not moved. No Boxing Day in
Zambia. A pending Public Holidays (Amendment) Bill N.A.B. 76 of 2026 would delete s.2(2); the
committee report (parliament.gov.zm) recommends a wider review; enactment not confirmed.

Starter bugs: Women's Day from 1964 (should be 2008, SI 33/2007 per python-holidays; first list seen
2013 has it); Youth Day 12 March is right from 1988 (third Saturday in March 1983-1987); missing
Holy Saturday (Schedule), Easter Sunday, National Prayer Day 18 Oct (2016-2025), Kenneth Kaunda Day
28 Apr (2022-), 29 Dec National Day of Prayer and Christian Heritage (2026-), general-election days
(Art. 56(2), 2016/2021/2026), and the Sunday rule. Heroes/Unity/Farmers rules are correct.

Declared one-off days (s.3 SIs): 2014-11-11, 2014-12-26, 2015-01-02, 2015-01-20, 2016-09-13,
2018-03-09, 2018-07-26, 2019-10-25, 2021-07-02, 2021-07-07, 2021-08-13, 2021-08-24, 2022-03-18;
secondary: 2026-09-01. Election days: 2016-08-11, 2021-08-12, 2026-08-13 (constitution).
SI 33/2007 text not seen. 2000-2012 elections/mourning days not found (ZM_ADHOC).

Confidence: primary 2013-2025 (2015 and 2022 lists not found: rule-derived fixed days + primary
SIs); secondary 2026 (gazetted list primary, but the Oct/Dec change, election and swearing-in rest on
news). 2027: no list yet; rule (with 29 Dec, without 18 Oct). 2000-2012: missing (rule only).

Disagreements: GN 1078/2024 (Heroes/Unity 30 Jun/1 Jul 2025) vs the statute -> revoked Feb 2025,
the statute wins (7/8 July). python-holidays 0.109 matches all lists seen, including 2026 changes;
it starts Women's Day in 2008 and has the 2018-07-26 day as 'Mayoral and Ward By-elections'.
"""


# --- rule engine (scripts/generate_mena_holiday_gold.py) ----------------------
# Cap. 272 s. 2(2): a fixed-date holiday on a Sunday adds the Monday (s. 3
# days too). Heroes, Unity and Farmers Days are Mondays and a Tuesday.
OBSERVE = True
_S22 = dict(observed="sunday-next", observed_from=1964)
ZM_FIXED = [row + (_S22,) for row in ZM_FIXED]
ZM_EASTER = [(-2, "Good Friday", [(1964, None)], "cap-272"),
             (-1, "Holy Saturday", [(1964, None)], "cap-272"),
             (0, "Easter Sunday", [(1964, None)], "cap-272"),
             (1, "Easter Monday", [(1964, None)], "cap-272")]
ZM_NTH = [(7, 1, 1, "Heroes Day", [(1983, None)], "act-12-1983"),
          (7, 1, 1, "Unity Day", [(1983, None)], "act-12-1983", dict(offset=1)),
          (8, 1, 1, "Farmers Day", [(1983, None)], "act-12-1983"),
          (8, 4, 2, "General election day", [(2016, None)], "constitution-art56",
           dict(years=list(range(2016, 2100, 5))))]
