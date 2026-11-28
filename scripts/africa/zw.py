"""Zimbabwe public holidays 2000-2027: primary-source transcription for
egao1980/cl-stack-calendars#45.  Stdlib only; data, no logic.

Cache: ~/.cache/cl-stack-calendars/zw/
  wb-zimlii-act-1969-19-2016.html   Act text (Wayback copy of ZimLII consolidation)
  gazette-YYYY-MM-DD-no-N.pdf       Government Gazette issues (archive.gazettes.africa, the
                                    Laws.Africa/ZimLII gazette archive)
  veritas-pdf-<node>.pdf / veritas-doc-<node>.doc(x)   Veritas copies of gazetted notices
  lawcozw-download-1099.html / -1103.html               law.co.zw copies of GN 113/2008, GN 86/2009
"""

_ACT = "https://zimlii.org/akn/zw/act/1969/19/eng@2016-12-31"
_ACT_WB = "https://web.archive.org/web/20260417054800id_/https://zimlii.org/akn/zw/act/1969/19/eng@2016-12-31"
_GZ = "https://archive.gazettes.africa/archive/zw/{y}/zw-government-gazette-dated-{d}-no-{n}.pdf"
_V = "https://www.veritaszim.net/sites/veritas_d/files/"


def _gz(d, n):
    return _GZ.format(y=d[:4], d=d, n=n)


ZW_STATUTES = [
    dict(key="act-ch10-21",
         title="Public Holidays and Prohibition of Business Act [Chapter 10:21] (Act 19 of 1969, "
               "consolidated to 31 December 2016)",
         uri=_ACT_WB,
         issued="1969-03-14", issued_uri=_ACT,
         published=None, published_uri=None,
         published_in="ZimLII consolidation dated 2016-12-31 (commenced 14 March 1969)",
         in_force="1969-03-14",
         dates_note="The 1969 Rhodesian Gazette issue was not located; 14 March 1969 is the "
                    "commencement date ZimLII gives.",
         summary="s.2(1): the Schedule days are public holidays, provided (i) when a public holiday "
                 "falls on a Sunday the following Monday is a public holiday, and (ii) when 26 December "
                 "falls on a Monday the following Tuesday is a public holiday. s.2(2): the President may "
                 "by statutory instrument declare any day a public holiday. Schedule: New Year's Day; "
                 "Independence Day 18 April; Good Friday; the Saturday between Good Friday and Easter "
                 "Sunday; Easter Monday; Worker's Day 1 May; Africa Day 25 May; the second Monday in "
                 "August and the day following (Heroes' Day, Defence Forces National Day) [para "
                 "substituted by Act 17 of 2001]; National Unity Day 22 December [para substituted by "
                 "Act 17 of 2001]; Christmas Day and the day following. Easter Sunday is NOT in the "
                 "Schedule but the Minister's annual lists include it from 2009. No Saturday rule."),
    dict(key="act-17-2001",
         title="Public Holidays and Prohibition of Business Amendment Act, 2001 (Act 17 of 2001)",
         uri=_ACT_WB,
         issued=None, issued_uri=None, published=None, published_uri=None,
         published_in=None, in_force=None,
         dates_note="Known only from the amendment notes in the ZimLII consolidation; the Act text "
                    "and its date were not located.",
         summary="Substituted Schedule para 8 (Heroes' Day = second Monday in August, Defence Forces "
                 "National Day = the day following) and para 9 (National Unity Day 22 December). Before "
                 "it, Heroes' Day and Defence Forces Day were 11 and 12 August (secondary sources only; "
                 "not verified against the pre-2001 text). The 2004 list (GN 137/2004) already says "
                 "'Monday 9th August, the second Monday in August'."),
    dict(key="electoral-act-s38",
         title="Electoral Act [Chapter 2:13] (Act 25 of 2004), s.38(2)",
         uri="https://zimlii.org/akn/zw/act/2004/25/eng@2016-12-31",
         issued=None, issued_uri=None, published=None, published_uri=None,
         published_in="ZimLII consolidation dated 2016-12-31", in_force=None,
         dates_note="Read through the ZimLII search snippet and the Veritas Election Watch 23/2023 "
                    "summary only; the 2004 Act's gazette date was not looked up.",
         summary="Polling days in a general election are deemed public holidays for the purposes of "
                 "the Public Holidays and Prohibition of Business Act. The Minister still gazettes a "
                 "notice (e.g. GN 1345A/2023)."),
    dict(key="si-143-2017",
         title="Public Holidays and Prohibition of Business Notice, 2017 (SI 143 of 2017)",
         uri=_V + "SI%202017-143%20-%20Public%20Holiday%20Declaration%20-%2021st%20February%20-%20Robert%20Gabriel%20Mugabe%20National%20Youth%20Day.pdf",
         issued=None, issued_uri=None,
         published="2017-11-24", published_uri="https://www.veritaszim.net/node/2284",
         published_in="Supplement to the Zimbabwean Government Gazette dated 24 November 2017",
         in_force="2017-11-24",
         dates_note="The SI copy shows no signature date; only the gazette supplement date.",
         summary="Declares 21 February every year henceforth a public holiday, the Robert Gabriel "
                 "Mugabe National Youth Day (s.2(2)). First observed 2018-02-21. Called 'National "
                 "Youth Day' in the lists from 2021."),
    dict(key="si-148-2026",
         title="Public Holidays and Prohibition of Business (Declaration of Public Holiday) Notice, "
               "2026 (SI 148 of 2026)",
         uri=_V + "SI%202026-148%20Public%20Holidays%20and%20Prohibition%20of%20Business%20%28Declaration%20of%20Public%20Holiday%29%20Notice%2C%202026.pdf",
         issued=None, issued_uri=None,
         published="2026-09-09", published_uri="https://zimlii.org/akn/zw/act/si/2026/148/eng@2026-09-09",
         published_in="Supplement to the Zimbabwean Government Gazette Extraordinary dated "
                      "9 September 2026 (Gazette No. 67)",
         in_force="2026-09-09",
         dates_note="No signature date on the SI; gazette supplement date only.",
         summary="Declares 15 September every year henceforth a public holiday, Munhumutapa Day. "
                 "First observed Tuesday 2026-09-15 (Veritas Bill Watch 35/2026). Not in GN 788/2026 "
                 "(the 2027 list, published earlier), but applies to 2027 by its own terms."),
]

# (month, day, name, [(from, to)], statute key)
ZW_FIXED = [
    (1, 1, "New Year's Day", [(1980, None)], "act-ch10-21"),
    (2, 21, "Robert Gabriel Mugabe National Youth Day", [(2018, None)], "si-143-2017"),
    (4, 18, "Independence Day", [(1980, None)], "act-ch10-21"),
    (5, 1, "Workers' Day", [(1980, None)], "act-ch10-21"),
    (5, 25, "Africa Day", [(1980, None)], "act-ch10-21"),
    # pre-Act 17 of 2001 fixed dates: secondary only
    (8, 11, "Heroes' Day", [(1980, 2000)], "act-17-2001"),
    (8, 12, "Defence Forces Day", [(1980, 2000)], "act-17-2001"),
    (9, 15, "Munhumutapa Day", [(2026, None)], "si-148-2026"),
    (12, 22, "National Unity Day", [(1988, None)], "act-ch10-21"),
    (12, 25, "Christmas Day", [(1980, None)], "act-ch10-21"),
    (12, 26, "Boxing Day", [(1980, None)], "act-ch10-21"),
]

ZW_ISLAMIC = []  # Zimbabwe has no Islamic public holidays.

ZW_OTHER_RULES = [
    dict(rule="easter", offsets={-2: "Good Friday", -1: "Easter Saturday", 1: "Easter Monday"},
         years=(1980, None), source="act-ch10-21"),
    dict(rule="easter", offsets={0: "Easter Sunday"}, years=(2009, None), source="annual GNs",
         note="Not in the Schedule; listed in every Minister's list seen from GN 113/2008 (2009) "
              "on, absent from the 2004-2006 lists. A Sunday, so no business-day effect."),
    dict(rule="nth-weekday", month=8, weekday="MON", n=2, name="Heroes' Day",
         years=(2001, None), source="act-17-2001",
         note="Start year = Act 17 of 2001, whose date was not found; first confirmed list is 2004."),
    dict(rule="day-after", of="Heroes' Day", name="Defence Forces National Day",
         years=(2001, None), source="act-17-2001"),
    dict(rule="sunday-to-monday", years=(1969, None), source="act-ch10-21",
         applies_to="every Schedule day and every s.2(2) day (the lists apply it to 21 Feb, 1 Jan, "
                    "18 Apr, 1 May, 25 May, 22 Dec, 25/26 Dec)",
         note="s.2(1)(i). The new day is listed as 'Public Holiday'. Saturdays are never moved "
              "(e.g. 2026-04-18, 2026-12-26, 2015-12-26). A Sunday holiday whose Monday is already "
              "a holiday: 25 Dec on Sunday -> 26 Dec Monday is Boxing Day and s.2(1)(ii) adds "
              "Tuesday 27 Dec (2005, 2011, 2016, 2022). 26 Dec on Sunday -> Monday 27 Dec "
              "(2004, 2010, 2021, 2027)."),
    dict(rule="boxing-monday-to-tuesday", years=(1969, None), source="act-ch10-21",
         note="s.2(1)(ii): when 26 December falls on a Monday, the Tuesday following is also a "
              "public holiday (i.e. whenever Christmas is a Sunday)."),
    dict(rule="no-substitute-for-coincidence", years=(1969, None), source="annual GNs",
         note="When Independence Day coincides with Good Friday (2014, 2025) or Easter Monday "
              "(2022), the lists give no extra day. python-holidays agrees for those years."),
    dict(rule="polling-day", years=(2004, None), source="electoral-act-s38",
         note="General-election polling days are public holidays (2005-03-31?, 2008-03-29, "
              "2008-06-27 run-off?, 2013-07-31, 2018-07-30, 2023-08-23)."),
]

_GN_NOTE = "Minister's annual list under s.2(1)"

ZW_YEARS = {
    2004: dict(
        confidence="primary",
        docs=[
            dict(title="General Notice 325 of 2004, Public Holidays in 2004 (repeals GN 137 of 2004)",
                 uri=_gz("2004-06-18", 45), issued="2004-06-18", issued_uri=_gz("2004-06-18", 45),
                 published="2004-06-18", published_uri=_gz("2004-06-18", 45),
                 published_in="Zimbabwean Government Gazette, 18 June 2004 (No. 45)", dates_note=None),
            dict(title="General Notice 137 of 2004, Public Holidays in 2004 (repealed)",
                 uri=_gz("2004-02-27", 19), issued="2004-02-27", issued_uri=_gz("2004-02-27", 19),
                 published="2004-02-27", published_uri=_gz("2004-02-27", 19),
                 published_in="Zimbabwean Government Gazette, 27 February 2004 (No. 19)", dates_note=None),
        ],
        days=[("01-01", "New Year's Day", 0), ("04-09", "Good Friday", 0), ("04-10", "Easter Saturday", 0),
              ("04-12", "Easter Monday", 0), ("04-18", "Independence Day", 0), ("04-19", "Public Holiday", 0),
              ("05-01", "Workers' Day", 0), ("05-25", "Africa Day", 0), ("08-09", "Heroes' Day", 0),
              ("08-10", "Defence Forces National Day", 0), ("12-22", "National Unity Day", 0),
              ("12-25", "Christmas Day", 0), ("12-26", "Public Holiday (Boxing Day)", 0),
              ("12-27", "Public Holiday", 0)],
        suppressed=[], working=[],
        notes="GN 137/2004 (which itself repealed GN 154/2003) omitted Monday 27 December (26 Dec "
              "on Sunday); GN 325/2004 repealed it and added 27 Dec. Easter Sunday not listed.",
    ),
    2005: dict(
        confidence="primary",
        docs=[dict(title="General Notice 326 of 2004, Public Holidays in 2005",
                   uri=_gz("2004-06-18", 45), issued="2004-06-18", issued_uri=_gz("2004-06-18", 45),
                   published="2004-06-18", published_uri=_gz("2004-06-18", 45),
                   published_in="Zimbabwean Government Gazette, 18 June 2004 (No. 45)", dates_note=None)],
        days=[("01-01", "New Year's Day", 0), ("03-25", "Good Friday", 0), ("03-26", "Easter Saturday", 0),
              ("03-28", "Easter Monday", 0), ("04-18", "Independence Day", 0), ("05-01", "Workers' Day", 0),
              ("05-02", "Public Holiday", 0), ("05-25", "Africa Day", 0), ("08-08", "Heroes' Day", 0),
              ("08-09", "Defence Forces National Day", 0), ("12-22", "National Unity Day", 0),
              ("12-25", "Christmas Day", 0), ("12-26", "Public Holiday (Boxing Day)", 0),
              ("12-27", "Public Holiday", 0)],
        suppressed=[], working=[],
        notes="OCR of page 2 is badly garbled; weekday names that survive (Monday 8 Aug, Sunday "
              "Christmas, Monday/Tuesday public holidays) match the statute. 31 March 2005 "
              "parliamentary polling day not found as a notice (see ZW_ADHOC).",
    ),
    2006: dict(
        confidence="primary",
        docs=[dict(title="General Notice 273 of 2005, Public Holidays in 2006",
                   uri=_gz("2005-07-01", 54), issued="2005-07-01", issued_uri=_gz("2005-07-01", 54),
                   published="2005-07-01", published_uri=_gz("2005-07-01", 54),
                   published_in="Zimbabwean Government Gazette, 1 July 2005 (No. 54)", dates_note=None)],
        days=[("01-01", "New Year's Day", 0), ("01-02", "Public Holiday", 0), ("04-14", "Good Friday", 0),
              ("04-15", "Easter Saturday", 0), ("04-17", "Easter Monday", 0), ("04-18", "Independence Day", 0),
              ("05-01", "Workers' Day", 0), ("05-25", "Africa Day", 0), ("08-14", "Heroes' Day", 0),
              ("08-15", "Defence Forces National Day", 0), ("12-22", "National Unity Day", 0),
              ("12-25", "Christmas Day", 0), ("12-26", "Boxing Day", 0)],
        suppressed=[], working=[], notes="Africa Day line OCR-garbled ('Thursday 25th May').",
    ),
    2008: dict(
        confidence="secondary",
        docs=[dict(title="Public Holidays and Prohibition of Business Notice, 2008 (SI 42 of 2008)",
                   uri=_gz("2008-03-17", 26), issued=None, issued_uri=None,
                   published="2008-03-17", published_uri=_gz("2008-03-17", 26),
                   published_in="Zimbabwean Government Gazette Extraordinary, 17 March 2008 (No. 26), "
                                "contents page only",
                   dates_note="Only the gazette contents page is archived; the SI text (and so the "
                              "declared date) was not seen."),
            dict(title='Public Holidays and Prohibition of Business Act [Chapter 10:21], Schedule and s.2(1) applied by rule', uri=_ACT_WB, issued=None, issued_uri=None, published=None, published_uri=None, published_in='statute (rule)', dates_note='Rule-derived rows: no annual list found for this year; dates of the statute are in the statutes table.')
        ],
        days=[("01-01", "New Year's Day", 1), ("03-21", "Good Friday", 1),
              ("03-22", "Easter Saturday", 1),
              ("03-24", "Easter Monday", 1), ("03-29", "Polling day (harmonised elections)", 0),
              ("04-18", "Independence Day", 1), ("05-01", "Workers' Day", 1),
              ("05-25", "Africa Day", 1), ("05-26", "Public Holiday", 1),
              ("08-11", "Heroes' Day", 1), ("08-12", "Defence Forces National Day", 1),
              ("12-22", "National Unity Day", 1), ("12-25", "Christmas Day", 1),
              ("12-26", "Boxing Day", 1)],
        suppressed=[], working=[],
        notes="No annual list found. Rows with doc index None are the statute (act-ch10-21) "
              "applied by rule. 03-29 (a Saturday) is inferred: SI 42/2008 was gazetted with the "
              "election amendment regulations 12 days before the 29 March 2008 poll, and the "
              "Electoral Act deems polling day a holiday anyway. The 27 June 2008 run-off is in "
              "ZW_ADHOC.",
    ),
    2009: dict(
        confidence="primary",
        docs=[dict(title="Government Notice 113 of 2008, Public Holidays in 2009 (law.co.zw copy)",
                   uri="https://www.law.co.zw/download/1099/", issued=None, issued_uri=None,
                   published=None, published_uri=None,
                   published_in="Zimbabwean Government Gazette, 2008 (issue not identified)",
                   dates_note="law.co.zw transcription gives neither signature nor gazette date.")],
        days=[("01-01", "New Year's Day", 0), ("04-10", "Good Friday", 0), ("04-11", "Easter Saturday", 0),
              ("04-12", "Easter Sunday", 0), ("04-13", "Easter Monday", 0), ("04-18", "Independence Day", 0),
              ("05-01", "Workers' Day", 0), ("05-25", "Africa Day", 0), ("08-10", "Heroes' Day", 0),
              ("08-11", "Defence Forces National Day", 0), ("12-22", "National Unity Day", 0),
              ("12-25", "Christmas Day", 0), ("12-26", "Boxing Day", 0)],
        suppressed=[], working=[],
        notes="Secondary copy (law.co.zw) of a gazetted notice; text consistent with the statute.",
    ),
    2010: dict(
        confidence="primary",
        docs=[
            dict(title="General Notice 86 of 2009, Public Holidays in 2010 (law.co.zw copy)",
                 uri="https://www.law.co.zw/download/1103/", issued="2009-06-26", issued_uri=None,
                 published=None, published_uri=None,
                 published_in="Zimbabwean Government Gazette, 2009 (issue not identified)",
                 dates_note="Signed 26-6-2009 (co-Ministers Mutsekwa and Mohadi); gazette date not "
                            "given in the copy."),
            dict(title="General Notice 394 of 2010, Public Holidays in 2010 (Monday 27 December)",
                 uri=_gz("2010-12-17", 82), issued=None, issued_uri=None,
                 published="2010-12-17", published_uri=_gz("2010-12-17", 82),
                 published_in="Zimbabwean Government Gazette, 17 December 2010 (No. 82)",
                 dates_note="Signature date not legible in the OCR."),
        ],
        days=[("01-01", "New Year's Day", 0), ("04-02", "Good Friday", 0), ("04-03", "Easter Saturday", 0),
              ("04-04", "Easter Sunday", 0), ("04-05", "Easter Monday", 0), ("04-18", "Independence Day", 0),
              ("04-19", "Public Holiday", 0), ("05-01", "Workers' Day", 0), ("05-25", "Africa Day", 0),
              ("08-09", "Heroes' Day", 0), ("08-10", "Defence Forces National Day", 0),
              ("12-22", "National Unity Day", 0), ("12-25", "Christmas Day", 0),
              ("12-26", "Boxing Day", 0), ("12-27", "Public Holiday", 1)],
        suppressed=[], working=[],
        notes="GN 86/2009 stopped at Sunday 26 Dec; GN 394/2010 adds Monday 27 Dec 'in terms of "
              "section 2(1)(i)'.",
    ),
    2012: dict(
        confidence="secondary",
        docs=[dict(title="Public Holidays and Prohibition of Business Notice, 2012 (SI 187A of 2012)",
                   uri=_gz("2012-12-20", 70), issued=None, issued_uri=None,
                   published="2012-12-20", published_uri=_gz("2012-12-20", 70),
                   published_in="Zimbabwean Government Gazette Extraordinary, 20 December 2012 "
                                "(No. 70), contents page only",
                   dates_note="SI text not archived. The date 24 December comes from news reports "
                              "(Nehanda Radio 2012-12-24, David Coltart blog) of Mugabe's declaration."),
            dict(title='Public Holidays and Prohibition of Business Act [Chapter 10:21], Schedule and s.2(1) applied by rule', uri=_ACT_WB, issued=None, issued_uri=None, published=None, published_uri=None, published_in='statute (rule)', dates_note='Rule-derived rows: no annual list found for this year; dates of the statute are in the statutes table.')
        ],
        days=[("01-01", "New Year's Day", 1), ("01-02", "Public Holiday", 1),
              ("04-06", "Good Friday", 1), ("04-07", "Easter Saturday", 1),
              ("04-08", "Easter Sunday", 1), ("04-09", "Easter Monday", 1),
              ("04-18", "Independence Day", 1), ("05-01", "Workers' Day", 1),
              ("05-25", "Africa Day", 1), ("08-13", "Heroes' Day", 1),
              ("08-14", "Defence Forces National Day", 1), ("12-22", "National Unity Day", 1),
              ("12-24", "Public Holiday (declared)", 0), ("12-25", "Christmas Day", 1),
              ("12-26", "Boxing Day", 1)],
        suppressed=[], working=[],
        notes="No annual list found; doc-index None rows = statute by rule.",
    ),
    2013: dict(
        confidence="primary",
        docs=[
            dict(title="Public Holidays and Prohibition of Business (Declaration of Public Holiday) "
                       "Notice, 2013 (SI 33 of 2013)",
                 uri=_gz("2013-03-15", 21), issued=None, issued_uri=None,
                 published="2013-03-15", published_uri=_gz("2013-03-15", 21),
                 published_in="Zimbabwean Government Gazette Extraordinary, 15 March 2013 (No. 21), "
                              "contents page only",
                 dates_note="SI text not archived; the declared day is inferred to be the "
                            "constitutional referendum of Saturday 16 March 2013."),
            dict(title="Public Holidays and Prohibition of Business Notice, 2013 (SI 107A of 2013)",
                 uri="https://www.veritaszim.net/node/477", issued=None, issued_uri=None,
                 published=None, published_uri=None,
                 published_in="Supplement to the Zimbabwean Government Gazette Extraordinary, 2013",
                 dates_note="Veritas copy omits the gazette date (late July 2013)."),
            dict(title="Public Holidays and Prohibition of Business Notice, 2013 (SI 123A of 2013)",
                 uri=_gz("2013-08-21", 67), issued=None, issued_uri=None,
                 published="2013-08-21", published_uri=_gz("2013-08-21", 67),
                 published_in="Zimbabwean Government Gazette Extraordinary, 21 August 2013 (No. 67), "
                              "contents page only",
                 dates_note="SI text not archived; 22 August (inauguration of President Mugabe) per "
                            "The Herald 'Thursday a public holiday'."),
            dict(title='Public Holidays and Prohibition of Business Act [Chapter 10:21], Schedule and s.2(1) applied by rule', uri=_ACT_WB, issued=None, issued_uri=None, published=None, published_uri=None, published_in='statute (rule)', dates_note='Rule-derived rows: no annual list found for this year; see the statute entry for its dates.'),
            dict(title='Public Holidays and Prohibition of Business Act [Chapter 10:21], Schedule and s.2(1) applied by rule', uri=_ACT_WB, issued=None, issued_uri=None, published=None, published_uri=None, published_in='statute (rule)', dates_note='Rule-derived rows: no annual list found for this year; dates of the statute are in the statutes table.')
        ],
        days=[("01-01", "New Year's Day", 3), ("03-16", "Referendum day (declared)", 0),
              ("03-29", "Good Friday", 3), ("03-30", "Easter Saturday", 3),
              ("03-31", "Easter Sunday", 3), ("04-01", "Easter Monday", 3),
              ("04-18", "Independence Day", 3), ("05-01", "Workers' Day", 3),
              ("05-25", "Africa Day", 3), ("07-31", "Polling day (harmonised elections)", 1),
              ("08-12", "Heroes' Day", 3), ("08-13", "Defence Forces National Day", 3),
              ("08-22", "Presidential inauguration (declared)", 2),
              ("12-22", "National Unity Day", 3), ("12-23", "Public Holiday", 3),
              ("12-25", "Christmas Day", 3), ("12-26", "Boxing Day", 3)],
        suppressed=[], working=[],
        notes="2013 list (GN 2012) not found; doc-index None rows = statute by rule. SI 107A text "
              "seen: 'Wednesday the 31st of July, 2013, shall be a public holiday'. 03-16 and 08-22 "
              "dates inferred/secondary (see docs).",
    ),
    2014: dict(
        confidence="primary",
        docs=[dict(title="General Notice 348 of 2013, Public Holidays 2014",
                   uri=_gz("2013-06-28", 52), issued="2013-06-28", issued_uri=_gz("2013-06-28", 52),
                   published="2013-06-28", published_uri=_gz("2013-06-28", 52),
                   published_in="Zimbabwean Government Gazette, 28 June 2013 (No. 52)", dates_note=None)],
        days=[("01-01", "New Year's Day", 0), ("04-18", "Good Friday", 0), ("04-18", "Independence Day", 0),
              ("04-19", "Easter Saturday", 0), ("04-20", "Easter Sunday", 0), ("04-21", "Easter Monday", 0),
              ("05-01", "Workers' Day", 0), ("05-25", "Africa Day", 0), ("05-26", "Public Holiday", 0),
              ("08-11", "Heroes' Day", 0), ("08-12", "Defence Forces Day", 0),
              ("12-22", "National Unity Day", 0), ("12-25", "Christmas Day", 0),
              ("12-26", "Public Holiday (Boxing Day)", 0)],
        suppressed=[], working=[],
        notes="Independence Day coincides with Good Friday; no substitute day.",
    ),
    2015: dict(
        confidence="primary",
        docs=[dict(title="General Notice 280 of 2014, Public Holidays in 2015",
                   uri=_gz("2014-07-25", 43), issued="2014-07-25", issued_uri=_gz("2014-07-25", 43),
                   published="2014-07-25", published_uri=_gz("2014-07-25", 43),
                   published_in="Zimbabwean Government Gazette, 25 July 2014 (No. 43)", dates_note=None)],
        days=[("01-01", "New Year's Day", 0), ("04-03", "Good Friday", 0), ("04-04", "Easter Saturday", 0),
              ("04-05", "Easter Sunday", 0), ("04-06", "Easter Monday", 0), ("04-18", "Independence Day", 0),
              ("05-01", "Workers' Day", 0), ("05-25", "Africa Day", 0), ("08-10", "Heroes' Day", 0),
              ("08-11", "Defence Forces National Day", 0), ("12-22", "National Unity Day", 0),
              ("12-25", "Christmas Day", 0), ("12-26", "Public Holiday (Boxing Day)", 0)],
        suppressed=[], working=[], notes="",
    ),
    2016: dict(
        confidence="primary",
        docs=[
            dict(title="General Notice 351 of 2015, Public Holidays in 2016",
                 uri="https://www.veritaszim.net/node/1387", issued="2015-10-16",
                 issued_uri="https://www.veritaszim.net/node/1387",
                 published="2015-10-16",
                 published_uri="https://zimlii.org/akn/zw/officialGazette/government-gazette/2015-10-16/75/eng@2015-10-16",
                 published_in="Zimbabwean Government Gazette, 16 October 2015 (No. 75)", dates_note=None),
            dict(title="General Notice 242 of 2015, Public Holidays in 2016 (defective, replaced)",
                 uri=_gz("2015-08-28", 64), issued="2015-08-28", issued_uri=_gz("2015-08-28", 64),
                 published="2015-08-28", published_uri=_gz("2015-08-28", 64),
                 published_in="Zimbabwean Government Gazette, 28 August 2015 (No. 64)", dates_note=None),
        ],
        days=[("01-01", "New Year's Day", 0), ("03-25", "Good Friday", 0), ("03-26", "Easter Saturday", 0),
              ("03-27", "Easter Sunday", 0), ("03-28", "Easter Monday", 0), ("04-18", "Independence Day", 0),
              ("05-01", "Workers' Day", 0), ("05-02", "Public Holiday", 0), ("05-25", "Africa Day", 0),
              ("08-08", "Heroes' Day", 0), ("08-09", "Defence Forces National Day", 0),
              ("12-22", "National Unity Day", 0), ("12-25", "Christmas Day", 0),
              ("12-26", "Boxing Day", 0), ("12-27", "Public Holiday", 0)],
        suppressed=[], working=[],
        notes="GN 242/2015 lacked 2 May and 27 December; Veritas: GN 351/2015 'replaces the "
              "defective notice'.",
    ),
    2017: dict(
        confidence="primary",
        docs=[dict(title="General Notice 244 of 2016, Public Holidays in 2017",
                   uri=_V + "GN%202016-244%20Public%20Holidays%202017.pdf", issued="2016-09-16",
                   issued_uri=_gz("2016-09-16", 57), published="2016-09-16",
                   published_uri=_gz("2016-09-16", 57),
                   published_in="Zimbabwean Government Gazette, 16 September 2016 (No. 57)", dates_note=None)],
        days=[("01-01", "New Year's Day", 0), ("01-02", "Public Holiday", 0), ("04-14", "Good Friday", 0),
              ("04-15", "Easter Saturday", 0), ("04-16", "Easter Sunday", 0), ("04-17", "Easter Monday", 0),
              ("04-18", "Independence Day", 0), ("05-01", "Workers' Day", 0), ("05-25", "Africa Day", 0),
              ("08-14", "Heroes' Day", 0), ("08-15", "Defence Forces National Day", 0),
              ("12-22", "National Unity Day", 0), ("12-25", "Christmas Day", 0),
              ("12-26", "Boxing Day", 0)],
        suppressed=[], working=[],
        notes="No holiday was declared for the 24 Nov 2017 inauguration (news: none found).",
    ),
    2018: dict(
        confidence="primary",
        docs=[
            dict(title="General Notice 491 of 2017, Public Holidays in 2018",
                 uri=_V + "General%20Notice%20491%20of%202017..pdf", issued="2017-09-01", issued_uri=None,
                 published=None, published_uri="https://www.veritaszim.net/node/2181",
                 published_in="Zimbabwean Government Gazette, September 2017",
                 dates_note="Signed 1-9-2017; gazette issue date not on the Veritas copy."),
            dict(title="SI 143 of 2017 (Robert Gabriel Mugabe National Youth Day)",
                 uri="https://www.veritaszim.net/node/2284", issued=None, issued_uri=None,
                 published="2017-11-24", published_uri="https://www.veritaszim.net/node/2284",
                 published_in="Supplement to the Zimbabwean Government Gazette, 24 November 2017",
                 dates_note="No signature date on the copy."),
            dict(title="Electoral Act [Chapter 2:13] s.38(2) (polling day deemed a public holiday)",
                 uri="https://zimlii.org/akn/zw/act/2004/25/eng@2016-12-31", issued=None, issued_uri=None,
                 published=None, published_uri=None, published_in="statute",
                 dates_note="Statute; poll date 30 July 2018 per proclamation (Veritas Election Watch "
                            "17/2018, 35/2018)."),
        ],
        days=[("01-01", "New Year's Day", 0), ("02-21", "Robert Gabriel Mugabe National Youth Day", 1),
              ("03-30", "Good Friday", 0), ("03-31", "Easter Saturday", 0), ("04-01", "Easter Sunday", 0),
              ("04-02", "Easter Monday", 0), ("04-18", "Independence Day", 0), ("05-01", "Workers' Day", 0),
              ("05-25", "Africa Day", 0), ("07-30", "Polling day (harmonised elections)", 2),
              ("08-13", "Heroes' Day", 0), ("08-14", "Defence Forces Day", 0),
              ("12-22", "National Unity Day", 0), ("12-25", "Christmas Day", 0),
              ("12-26", "Boxing Day", 0)],
        suppressed=[], working=[],
        notes="GN 491/2017 predates SI 143/2017 and so omits 21 February; the SI adds it.",
    ),
    2019: dict(
        confidence="primary",
        docs=[dict(title="Public Holidays and Prohibition of Business (Declaration of Public Holiday) "
                         "Notice, 2019 (SI 221B of 2019)",
                   uri=_V + "SI%202019%20221B%20Public%20Holidays%20and%20Prohibition%20of%20Business%20%28Declaration%20of%20Public%20Holiday%29%20Notice%2C%202019.pdf",
                   issued=None, issued_uri=None, published="2019-10-23",
                   published_uri="https://www.veritaszim.net/node/3757",
                   published_in="Supplement to the Zimbabwean Government Gazette Extraordinary, "
                                "23 October 2019", dates_note="No signature date on the SI."),
            dict(title='Public Holidays and Prohibition of Business Act [Chapter 10:21], Schedule and s.2(1) applied by rule', uri=_ACT_WB, issued=None, issued_uri=None, published=None, published_uri=None, published_in='statute (rule)', dates_note='Rule-derived rows: no annual list found for this year; dates of the statute are in the statutes table.')
        ],
        days=[("01-01", "New Year's Day", 1), ("02-21", "Robert Gabriel Mugabe National Youth Day", 1),
              ("04-18", "Independence Day", 1), ("04-19", "Good Friday", 1),
              ("04-20", "Easter Saturday", 1), ("04-21", "Easter Sunday", 1),
              ("04-22", "Easter Monday", 1), ("05-01", "Workers' Day", 1),
              ("05-25", "Africa Day", 1), ("08-12", "Heroes' Day", 1),
              ("08-13", "Defence Forces National Day", 1),
              ("10-25", "Anti-Sanctions Day (declared)", 0),
              ("12-22", "National Unity Day", 1), ("12-23", "Public Holiday", 1),
              ("12-25", "Christmas Day", 1), ("12-26", "Boxing Day", 1)],
        suppressed=[], working=[],
        notes="The 2019 list (GN of 2018) was not found; doc-index None rows = statute by rule. "
              "SI 221B: 'Friday, the 25th October, 2019 ... set aside for the national expression "
              "of opposition to the illegal sanctions'.",
    ),
    2020: dict(
        confidence="primary",
        docs=[dict(title="General Notice 861 of 2019, Public Holidays in 2020",
                   uri=_V + "GN%202019-861%20Public%20Holidays%20in%202020.pdf", issued="2019-05-17",
                   issued_uri=None, published=None, published_uri="https://www.veritaszim.net/node/3871",
                   published_in="Zimbabwean Government Gazette, May 2019",
                   dates_note="Signed 17-5-2019; gazette issue date not on the Veritas copy.")],
        days=[("01-01", "New Year's Day", 0), ("02-21", "R. G. Mugabe National Youth Day", 0),
              ("04-10", "Good Friday", 0), ("04-11", "Easter Saturday", 0), ("04-12", "Easter Sunday", 0),
              ("04-13", "Easter Monday", 0), ("04-18", "Independence Day", 0), ("05-01", "Workers' Day", 0),
              ("05-25", "Africa Day", 0), ("08-10", "Heroes' Day", 0),
              ("08-11", "Defence Forces National Day", 0), ("12-22", "National Unity Day", 0),
              ("12-25", "Christmas Day", 0), ("12-26", "Boxing Day", 0)],
        suppressed=[], working=[], notes="",
    ),
    2021: dict(
        confidence="primary",
        docs=[dict(title="General Notice 2552 of 2020, Public Holidays in 2021",
                   uri=_V + "GN%202020-2552%20Public%20Holidays%20in%202021.pdf", issued="2020-10-02",
                   issued_uri=None, published="2020-10-02",
                   published_uri="https://zimlii.org/akn/zw/officialGazette/government-gazette/2020-10-02/103/eng@2020-10-02",
                   published_in="Zimbabwean Government Gazette Extraordinary, 2 October 2020 (No. 103)",
                   dates_note=None)],
        days=[("01-01", "New Year's Day", 0), ("02-21", "National Youth Day", 0), ("02-22", "Public Holiday", 0),
              ("04-02", "Good Friday", 0), ("04-03", "Easter Saturday", 0), ("04-04", "Easter Sunday", 0),
              ("04-05", "Easter Monday", 0), ("04-18", "Independence Day", 0), ("04-19", "Public Holiday", 0),
              ("05-01", "Workers' Day", 0), ("05-25", "Africa Day", 0), ("08-09", "Heroes' Day", 0),
              ("08-10", "Defence Forces National Day", 0), ("12-22", "National Unity Day", 0),
              ("12-25", "Christmas Day", 0), ("12-26", "Boxing Day", 0), ("12-27", "Public Holiday", 0)],
        suppressed=[], working=[],
        notes="Answers issue item 5: 2021-04-19 is gazetted. python-holidays cites it as GN 2554/2020; "
              "the Veritas file and gazette say 2552.",
    ),
    2022: dict(
        confidence="primary",
        docs=[dict(title="General Notice 851 of 2021, Public Holidays in 2022",
                   uri=_V + "GN%202021-851%20PUBLIC%20HOLIDAYS%20AND%20PROHIBITION%20OF%20BUSINESS%20ACT%20FOR%202022.pdf",
                   issued="2021-04-30", issued_uri=_gz("2021-04-30", 53), published="2021-04-30",
                   published_uri=_gz("2021-04-30", 53),
                   published_in="Zimbabwean Government Gazette, 30 April 2021 (No. 53)", dates_note=None)],
        days=[("01-01", "New Year's Day", 0), ("02-21", "National Youth Day", 0), ("04-15", "Good Friday", 0),
              ("04-16", "Easter Saturday", 0), ("04-17", "Easter Sunday", 0), ("04-18", "Easter Monday", 0),
              ("04-18", "Independence Day", 0), ("05-01", "Workers' Day", 0), ("05-02", "Public Holiday", 0),
              ("05-25", "Africa Day", 0), ("08-08", "Heroes' Day", 0),
              ("08-09", "Defence Forces National Day", 0), ("12-22", "National Unity Day", 0),
              ("12-25", "Christmas Day", 0), ("12-26", "Boxing Day", 0), ("12-27", "Public Holiday", 0)],
        suppressed=[], working=[],
        notes="Independence Day coincides with Easter Monday; no substitute day.",
    ),
    2023: dict(
        confidence="primary",
        docs=[
            dict(title="General Notice 495 of 2022, Public Holidays in 2023 [corrected version]",
                 uri=_V + "GN%202022-495%20Public%20Holidays%20and%20Prohibition%20of%20Business%20Act_0.pdf",
                 issued="2022-03-11", issued_uri=None, published="2022-03-11",
                 published_uri="https://zimlii.org/akn/zw/officialGazette/government-gazette/2022-03-11/26/eng@2022-03-11",
                 published_in="Zimbabwean Government Gazette Extraordinary, 11 March 2022 (No. 26)",
                 dates_note=None),
            dict(title="General Notice 1345A of 2023, Electoral Act: Public Holiday and Prohibition Notice",
                 uri=_V + "GN%202023-1345A%20Public%20Holiday%20and%20Prohibition%20Notice.pdf",
                 issued="2023-08-21", issued_uri="https://www.veritaszim.net/node/6532",
                 published="2023-08-21", published_uri="https://www.veritaszim.net/node/6532",
                 published_in="Zimbabwean Government Gazette Extraordinary, 21 August 2023 (Vol. CI No. 87)",
                 dates_note=None),
        ],
        days=[("01-01", "New Year's Day", 0), ("01-02", "Public Holiday", 0), ("02-21", "National Youth Day", 0),
              ("04-07", "Good Friday", 0), ("04-08", "Easter Saturday", 0), ("04-09", "Easter Sunday", 0),
              ("04-10", "Easter Monday", 0), ("04-18", "Independence Day", 0), ("05-01", "Workers' Day", 0),
              ("05-25", "Africa Day", 0), ("08-14", "Heroes' Day", 0),
              ("08-15", "Defence Forces National Day", 0), ("08-23", "Polling day (harmonised elections)", 1),
              ("12-22", "National Unity Day", 0), ("12-25", "Christmas Day", 0), ("12-26", "Boxing Day", 0)],
        suppressed=[], working=[],
        notes="GN 468/2022 (gazette 11 March 2022 No. 25) misprinted Boxing Day as 'Sunday, 26th "
              "December'; GN 495/2022 corrects it to Tuesday. Polling was extended into 24 Aug in "
              "some wards only (not a public holiday).",
    ),
    2024: dict(
        confidence="primary",
        docs=[dict(title="General Notice 1036 of 2023, Public Holidays in 2024",
                   uri=_V + "GN%202023-1036%20Public%20Holidays%20and%20Prohibition%20of%20Business%20Act%2C%20Public%20Holidays%20in%202024.pdf",
                   issued="2023-06-16", issued_uri=None, published="2023-06-16",
                   published_uri="https://www.veritaszim.net/node/6926",
                   published_in="Zimbabwean Government Gazette, 16 June 2023", dates_note=None)],
        days=[("01-01", "New Year's Day", 0), ("02-21", "National Youth Day", 0), ("03-29", "Good Friday", 0),
              ("03-30", "Easter Saturday", 0), ("03-31", "Easter Sunday", 0), ("04-01", "Easter Monday", 0),
              ("04-18", "Independence Day", 0), ("05-01", "Workers' Day", 0), ("05-25", "Africa Day", 0),
              ("08-12", "Heroes' Day", 0), ("08-13", "Defence Forces National Day", 0),
              ("12-22", "National Unity Day", 0), ("12-23", "Public Holiday", 0),
              ("12-25", "Christmas Day", 0), ("12-26", "Boxing Day", 0)],
        suppressed=[], working=[],
        notes="Answers issue item 2: Heroes' Day 2024-08-12, Defence Forces 2024-08-13.",
    ),
    2025: dict(
        confidence="primary",
        docs=[dict(title="General Notice 954 of 2024, Public Holidays in 2025",
                   uri=_V + "GN%202024-0954%20Public%20Holidays%20in%202025_0.pdf", issued="2024-06-21",
                   issued_uri=None, published="2024-06-21",
                   published_uri="https://zimlii.org/akn/zw/officialGazette/government-gazette/2024-06-21/54/eng@2024-06-21",
                   published_in="Zimbabwean Government Gazette, 21 June 2024 (No. 54)", dates_note=None)],
        days=[("01-01", "New Year's Day", 0), ("02-21", "National Youth Day", 0), ("04-18", "Good Friday", 0),
              ("04-18", "Independence Day", 0), ("04-19", "Easter Saturday", 0), ("04-20", "Easter Sunday", 0),
              ("04-21", "Easter Monday", 0), ("05-01", "Workers' Day", 0), ("05-25", "Africa Day", 0),
              ("05-26", "Public Holiday", 0), ("08-11", "Heroes' Day", 0),
              ("08-12", "Defence Forces National Day", 0), ("12-22", "National Unity Day", 0),
              ("12-25", "Christmas Day", 0), ("12-26", "Boxing Day", 0)],
        suppressed=[], working=[],
        notes="Signed by the Secretary (not the Minister). Independence Day = Good Friday, no substitute.",
    ),
    2026: dict(
        confidence="primary",
        docs=[
            dict(title="General Notice 1361 of 2025, Public Holidays in 2026",
                 uri=_V + "GN%202025-1361%20Public%20Holidays%20in%202026.pdf", issued="2025-07-18",
                 issued_uri=_gz("2025-07-18", 51), published="2025-07-18",
                 published_uri=_gz("2025-07-18", 51),
                 published_in="Zimbabwean Government Gazette, 18 July 2025 (Vol. CIII No. 51)", dates_note=None),
            dict(title="SI 148 of 2026 (Munhumutapa Day, 15 September every year)",
                 uri=_V + "SI%202026-148%20Public%20Holidays%20and%20Prohibition%20of%20Business%20%28Declaration%20of%20Public%20Holiday%29%20Notice%2C%202026.pdf",
                 issued=None, issued_uri=None, published="2026-09-09",
                 published_uri="https://zimlii.org/akn/zw/act/si/2026/148/eng@2026-09-09",
                 published_in="Supplement to the Zimbabwean Government Gazette Extraordinary, 9 September 2026",
                 dates_note="No signature date on the SI."),
        ],
        days=[("01-01", "New Year's Day", 0), ("02-21", "National Youth Day", 0), ("04-03", "Good Friday", 0),
              ("04-04", "Easter Saturday", 0), ("04-05", "Easter Sunday", 0), ("04-06", "Easter Monday", 0),
              ("04-18", "Independence Day", 0), ("05-01", "Workers' Day", 0), ("05-25", "Africa Day", 0),
              ("08-10", "Heroes' Day", 0), ("08-11", "Defence Forces National Day", 0),
              ("09-15", "Munhumutapa Day", 1), ("12-22", "National Unity Day", 0),
              ("12-25", "Christmas Day", 0), ("12-26", "Boxing Day", 0)],
        suppressed=[], working=[],
        notes="Saturday holidays (21 Feb, 18 Apr, 26 Dec) are not moved.",
    ),
    2027: dict(
        confidence="primary",
        docs=[
            dict(title="General Notice 788 of 2026, Public Holidays in 2027",
                 uri=_gz("2026-05-29", 37), issued="2026-05-29", issued_uri=_gz("2026-05-29", 37),
                 published="2026-05-29", published_uri=_gz("2026-05-29", 37),
                 published_in="Zimbabwean Government Gazette, 29 May 2026 (No. 37), pp. 894-895",
                 dates_note=None),
            dict(title="SI 148 of 2026 (Munhumutapa Day, 15 September every year)",
                 uri="https://zimlii.org/akn/zw/act/si/2026/148/eng@2026-09-09", issued=None, issued_uri=None,
                 published="2026-09-09", published_uri="https://zimlii.org/akn/zw/act/si/2026/148/eng@2026-09-09",
                 published_in="Supplement to the Zimbabwean Government Gazette Extraordinary, 9 September 2026",
                 dates_note="No signature date on the SI."),
        ],
        days=[("01-01", "New Year's Day", 0), ("02-21", "National Youth Day", 0), ("02-22", "Public Holiday", 0),
              ("03-26", "Good Friday", 0), ("03-27", "Easter Saturday", 0), ("03-28", "Easter Sunday", 0),
              ("03-29", "Easter Monday", 0), ("04-18", "Independence Day", 0), ("04-19", "Public Holiday", 0),
              ("05-01", "Workers' Day", 0), ("05-25", "Africa Day", 0), ("08-09", "Heroes' Day", 0),
              ("08-10", "Defence Forces National Day", 0), ("09-15", "Munhumutapa Day", 1),
              ("12-22", "National Unity Day", 0), ("12-25", "Christmas Day", 0),
              ("12-26", "Boxing Day", 0), ("12-27", "Public Holiday", 0)],
        suppressed=[], working=[],
        notes="GN 788/2026 predates SI 148/2026 and so omits Munhumutapa Day (Wednesday 15 Sep 2027).",
    ),
}

ZW_ADHOC = [
    ("2000-06-24", "Parliamentary election polling (24-25 June 2000, Sat-Sun)", "", "unverified",
     "unknown whether declared; weekend anyway"),
    ("2002-03-11", "Presidential election polling extended to Monday 11 March 2002 (Harare/Chitungwiza "
     "by court order); 9-10 March were Sat-Sun", "", "unverified", "not nationwide"),
    ("2005-03-31", "Parliamentary election polling day (Thursday)", "", "unverified",
     "Electoral Act 2004 s.38(2) would make it a public holiday; no notice found"),
    ("2008-06-27", "Presidential run-off polling day (Friday)", "", "unverified",
     "Electoral Act s.38(2) would make it a public holiday; no notice found"),
]

ZW_FINDINGS = """
Sources: the Act text (ZimLII consolidation to 31 Dec 2016, read via the Wayback Machine because
zimlii.org serves a Cloudflare challenge); Government Gazette PDFs from archive.gazettes.africa
(the Laws.Africa gazette archive behind ZimLII); Veritas (veritaszim.net) copies of the gazetted
notices; law.co.zw copies of GN 113/2008 and GN 86/2009. The Minister (later the Secretary) for
Home Affairs gazettes a list for the next year under s.2(1); the President declares extra days by
SI under s.2(2).

Issue item 2 (Heroes' Day a week early): CONFIRMED BUG. Schedule para 8 (Act 17 of 2001) = second
Monday in August + the day following. Every gazetted list 2004-2027 agrees, e.g. 2024: 08-12/08-13
(GN 1036/2023); 2025: 08-11/08-12; 2026: 08-10/08-11; 2027: 08-09/08-10. Before Act 17/2001 the
days were (secondary) fixed 11/12 August; the start year of the new rule is uncertain (2001 or
2002). The first list I could read (2004) already uses the second Monday.

Issue item 2 (Robert Mugabe National Youth Day): CONFIRMED. SI 143/2017 (Gazette supplement
24 Nov 2017) makes 21 February a holiday 'every year henceforth', first in 2018. Renamed in the lists
to 'National Youth Day' from 2021 (GN 2552/2020). Not repealed. Sunday rule applies (2021-02-22,
2027-02-22).

Issue item 5 (Sunday-in-lieu): CONFIRMED. s.2(1)(i): a holiday on a Sunday -> the following
Monday; s.2(1)(ii): 26 Dec on a Monday -> Tuesday 27 Dec is a holiday too. Saturdays are not moved.
2021-04-19 is in GN 2552/2020. When 26 Dec is a Sunday, Monday 27 Dec (2004, 2010, 2021, 2027);
when 25 Dec is a Sunday, Boxing Day Monday 26 + Tuesday 27 (2005, 2016, 2022). No extra day when two
holidays coincide on a weekday (Independence Day = Good Friday 2014/2025, = Easter Monday 2022).

New since the starter: Munhumutapa Day 15 September every year from 2026 (SI 148/2026, Gazette
Extraordinary 9 Sep 2026). Easter Sunday is listed from 2009 (absent from the 2004-2006 lists);
it is not in the Schedule.

Declared days: 2008-03-29 (SI 42/2008, inferred), 2012-12-24 (SI 187A/2012; date from news),
2013-03-16 (SI 33/2013, inferred referendum day), 2013-07-31 (SI 107A/2013, text seen),
2013-08-22 (SI 123A/2013; date from The Herald), 2018-07-30 (Electoral Act s.38(2)),
2019-10-25 (SI 221B/2019, text seen), 2023-08-23 (GN 1345A/2023, text seen). No holiday for the
Nov 2017 or Aug 2018 inaugurations. GN 2021 'National Real Estate Day' 15 Oct is expressly NOT a
public holiday.

Confidence: primary 2004-2006, 2009, 2010, 2013-2027 (2013 and 2019 lists derived from the statute
plus primary SIs; their annual GNs were not found). Secondary: 2008, 2012 (SI contents not seen).
Missing (rule only): 2000-2003, 2007, 2011.

Disagreements: python-holidays 0.109 matches the gazetted lists for 2015-2027 (including
Munhumutapa Day from 2026) except that (a) it lacks the SI-declared one-off days (2012-12-24,
2013, 2018-07-30, 2019-10-25, 2023-08-23); (b) it adds Easter Sunday only from 2010 (the 2009 list
already has it); (c) it applies the 2-Monday Heroes' Day rule back to 1988 (pre-2001 was 11/12 Aug,
secondary). GN 1361/2025 and GN 788/2026 omit Munhumutapa Day only because they predate SI 148/2026.
Rows whose doc is "act-ch10-21 (rule)" were computed from the statute, not read from a list.
"""


# --- rule engine (scripts/generate_mena_holiday_gold.py) ----------------------
# Public Holidays and Prohibition of Business Act s. 2(1)(i): a Sunday holiday
# adds the Monday; (ii) when 26 December is a Monday, the Tuesday too (that is,
# the next free day after a Sunday Christmas). Saturdays are not moved.
OBSERVE = True
_S2 = dict(observed="sunday-next", observed_from=1980)
ZW_FIXED = [row + (_S2,) for row in ZW_FIXED]
ZW_EASTER = [(-2, "Good Friday", [(1980, None)], "act-ch10-21"),
             (-1, "Easter Saturday", [(1980, None)], "act-ch10-21"),
             (0, "Easter Sunday", [(2009, None)], "act-ch10-21"),
             (1, "Easter Monday", [(1980, None)], "act-ch10-21")]
ZW_NTH = [(8, 1, 2, "Heroes' Day", [(2001, None)], "act-17-2001"),
          (8, 1, 2, "Defence Forces National Day", [(2001, None)], "act-17-2001", dict(offset=1))]
