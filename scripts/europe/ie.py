"""Ireland: public holidays of the Organisation of Working Time Act 1997,
Second Schedule, 2000-2040, transcribed from irishstatutebook.ie for
egao1980/cl-stack-calendars#24. Stdlib only; data, no logic.

Cache: ~/.cache/cl-stack-calendars/ie/
  owta-1997.html, owta-1997-sched2-enacted.html, owta-sched2-revised.html (LRC revised, with annotations)
  si-1997-392.html (commencement), si-1999-si-10.html, si-2001-si-419.html, si-2022-50.html

Scope: the days of Sched. 2 para. 1 and the days prescribed under para. 1(g).
There is no substitute day for a holiday on a weekend: s. 21 gives each
employee an entitlement (a paid day off, an extra day's leave or a day's pay),
not a fixed date, so none is listed (#25 item 9). Good Friday and Easter
Sunday are not public holidays.
"""

from datetime import date, timedelta

OBSERVE = True

_ISB = "https://www.irishstatutebook.ie/eli/"


def _si(year, n, title, signed, summary, iris=None, note=None, to=None):
    u = f"{_ISB}{year}/si/{n}/made/en/html"
    return dict(key=f"si-{n}-{year}", title=title, uri=u, issued=signed, issued_uri=u, published=iris,
                published_uri=u if iris else None,
                published_in=f"Iris Oifigiúil of {iris}" if iris else None, in_force=signed,
                dates_note=note, summary=summary, to=to)


IE_STATUTES = [
    dict(key="owta-1997", title="Organisation of Working Time Act 1997 (No. 20 of 1997), Second Schedule",
         uri=_ISB + "1997/act/20/schedule/2/enacted/en/html", issued="1997-05-07",
         issued_uri=_ISB + "1997/act/20/enacted/en/html", published=None, published_uri=None,
         published_in=None, in_force="1997-09-30",
         dates_note="Signed 7 May 1997 (long title); the Second Schedule commenced 30 Sep 1997 by S.I. No. 392 "
                    "of 1997 art. 3(f). No Iris Oifigiúil date is shown for the Act.",
         summary="Para. 1: public holidays are (a) Christmas Day (b) St. Stephen's Day (c) St. Patrick's Day (d) "
                 "Easter Monday, the first Monday in May, June and August (e) the last Monday in October (f) 1 "
                 "January (g) any other day prescribed. Eras before 1997 (Holidays (Employees) Act 1973) are the "
                 "starter's and were not researched."),
    _si(1999, 10, "S.I. No. 10/1999, Organisation of Working Time (Public Holiday) Regulations, 1999",
        "1999-01-27", "31 December 1999 is prescribed for Sched. 2 para. 1.",
        note="No Iris Oifigiúil date is given on the page.", to="1999-12-31"),
    _si(2001, 419, "S.I. No. 419/2001, Organisation of Working Time (National Day of Mourning) Regulations, 2001",
        "2001-09-12", "Reg. 2: the 14th day of September, 2001, is prescribed for Sched. 2 para. 1 (National Day "
        "of Mourning after the attacks of 11 September 2001).",
        note="No Iris Oifigiúil date is given on the page.", to="2001-09-14"),
    _si(2022, 50, "S.I. No. 50/2022, Organisation of Working Time (Covid-19 Commemoration) Regulations 2022",
        "2022-02-07", "Reg. 3: 18 March 2022 is prescribed. Regs. 4-5: the first Monday in February from 2023, or "
        "1 February when it falls on a Friday (St Brigid's Day).", iris="2022-02-11"),
]

IE_FIXED = [
    (1, 1, "New Year's Day", [(1922, None)], "owta-1997"),
    (3, 17, "St. Patrick's Day", [(1922, None)], "owta-1997"),
    (12, 25, "Christmas Day", [(1922, None)], "owta-1997"),
    (12, 26, "St. Stephen's Day", [(1922, None)], "owta-1997"),
]

IE_EASTER = [(1, "Easter Monday", [(1922, None)], "owta-1997")]

IE_NTH = [
    (5, 1, 1, "May Bank Holiday", [(1994, None)], "owta-1997"),
    (6, 1, 1, "June Bank Holiday", [(1922, None)], "owta-1997"),
    (8, 1, 1, "August Bank Holiday", [(1922, None)], "owta-1997"),
    (10, 1, -1, "October Bank Holiday", [(1977, None)], "owta-1997"),
]


def _brigid(y):
    d = date(y, 2, 1)
    if d.isoweekday() == 5:
        return [d]
    return [d + timedelta(days=(1 - d.isoweekday()) % 7)]


IE_COMPUTED = [("St. Brigid's Day", _brigid, [(2023, None)], "si-50-2022")]


def _doc(st):
    return {k: st.get(k) for k in ("title", "uri", "issued", "issued_uri", "published", "published_uri",
                                   "published_in", "dates_note")}


_S = {st["key"]: st for st in IE_STATUTES}

IE_YEARS = {
    1999: dict(confidence="primary", covers=[], docs=[_doc(_S["si-10-1999"])],
               days=[("12-31", "Millennium public holiday", 0)]),
    2001: dict(confidence="primary", covers=[], docs=[_doc(_S["si-419-2001"])],
               days=[("09-14", "National Day of Mourning", 0)]),
    2022: dict(confidence="primary", covers=[], docs=[_doc(_S["si-50-2022"])],
               days=[("03-18", "Day of Remembrance and Recognition", 0)]),
}
