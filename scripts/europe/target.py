"""TARGET closing days 1999-2040, transcribed from the ECB Governing Council
decisions as its press releases state them, for egao1980/cl-stack-calendars#24.
Stdlib only; data, no logic.

Cache: ~/.cache/cl-stack-calendars/target/ pr990331.html, pr990715_1.html, pr000525_2.html, pr001214_4.html

1999: 25 December and New Year's Day (TARGET opened on 4 January 1999), plus
31 December 1999 (Y2K). 2000 and 2001: New Year's Day, Good Friday, Easter
Monday, 1 May, 25 and 26 December, plus 31 December 2001 (euro cash
changeover). From 2002 the long-term calendar: the same six days. The
national RTGS systems allowed to stay open for limited domestic operations
(e.g. Banca d'Italia on Good Friday 2001) do not change TARGET's own days.
"""

OBSERVE = True

_PR = "https://www.ecb.europa.eu/press/pr/date/"


def _pr(key, path, d, title, summary, to=None):
    u = _PR + path
    return dict(key=key, title=title, uri=u, issued=d, issued_uri=u, published=d, published_uri=u,
                published_in=f"ECB press release of {d}", in_force=None,
                dates_note="A Governing Council decision announced by press release on the day it was taken; the "
                           "release states the calendar it applies to, not an entry-into-force date.",
                summary=summary, to=to)


TARGET_STATUTES = [
    _pr("pr990331", "1999/html/pr990331.en.html", "1999-03-31", "Year 2000 - Closing of TARGET on 31 December 1999",
        "TARGET (Interlinking and all domestic euro RTGS systems) closed on 31 December 1999.", to="1999-12-31"),
    _pr("pr990715", "1999/html/pr990715_1.en.html", "1999-07-15", "TARGET closing days in 2000",
        "1999: closed on Saturdays, Sundays, Christmas Day and New Year's Day (and 31 December 1999). 2000: closed "
        "on New Year's Day, Good Friday, Easter Monday, 1 May, Christmas Day and 26 December.", to="2000-12-31"),
    _pr("pr000525", "2000/html/pr000525_2.en.html", "2000-05-25", "TARGET closing days in 2001",
        "2001: the 2000 calendar plus 31 December, to safeguard the conversion of retail payment systems and "
        "internal bank systems to the euro.", to="2001-12-31"),
    _pr("pr001214", "2000/html/pr001214_4.en.html", "2000-12-14", "Long-term calendar for TARGET closing days",
        "From 2002 until further notice: closed, besides Saturdays and Sundays, on New Year's Day, Good Friday, "
        "Easter Monday, 1 May, Christmas Day and 26 December."),
]

TARGET_FIXED = [
    (1, 1, "New Year's Day", [(1999, None)], "pr001214"),
    (5, 1, "Labour Day", [(2000, None)], "pr001214"),
    (12, 25, "Christmas Day", [(1999, None)], "pr001214"),
    (12, 26, "Christmas Holiday", [(2000, None)], "pr001214"),
]

TARGET_EASTER = [
    (-2, "Good Friday", [(2000, None)], "pr001214"),
    (1, "Easter Monday", [(2000, None)], "pr001214"),
]


def _doc(st):
    return {k: st.get(k) for k in ("title", "uri", "issued", "issued_uri", "published", "published_uri",
                                   "published_in", "dates_note")}


_S = {st["key"]: st for st in TARGET_STATUTES}

TARGET_YEARS = {
    1999: dict(confidence="primary", covers=[], docs=[_doc(_S["pr990331"])],
               days=[("12-31", "Additional closing day (Year 2000 changeover)", 0)]),
    2001: dict(confidence="primary", covers=[], docs=[_doc(_S["pr000525"])],
               days=[("12-31", "Additional closing day (euro cash changeover)", 0)]),
}
