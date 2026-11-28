"""The NYSE's own record of its trading days, 1953-1969 (cl-stack-calendars #50).

Transcribed from the New York Stock Exchange's "History of New York Stock
Exchange Holidays" and "New York Stock Exchange Special Closings, 1885-date"
(nyse.com/pdfs/closings.pdf), its trading timeline, and the SEC's Report of
Special Study of Securities Markets (1963). The Commercial and Financial
Chronicle's daily NYSE transaction tables (FRASER) are secondary: they confirm
days the NYSE list leaves to its general rules, and never override it.

Read by scripts/generate_xnys_gold.py. Nothing here reads the Lisp calendar.
"""

from __future__ import annotations

from datetime import date

# --- sources -------------------------------------------------------------------

#: NYSE closings history, revised through January 2011 (holiday table + special closings).
NYSE_2011 = "https://web.archive.org/web/20111110074209/http://www.nyse.com/pdfs/closings.pdf"
#: Revised through November 2008: the first revision with the standard-holiday
#: table and the 1959 Saturday policy.
NYSE_2008 = "https://web.archive.org/web/20090325004309/http://www.nyse.com/pdfs/closings.pdf"
#: First capture of the special-closings list on nyse.com.
NYSE_2005 = "https://web.archive.org/web/20051228081202/http://www.nyse.com:80/pdfs/closings.pdf"
#: NYSE timeline, trading: 1952 10:00-15:30 Mon-Fri and Saturdays closed; 1974 to 16:00; 1985 09:30.
TIMELINE = "https://web.archive.org/web/20100507135343/http://www.nyse.com/about/history/timeline_trading.html"
#: SEC, Report of Special Study of Securities Markets (1963), Part 2, ch. VI, p. 78:
#: "the 5 1/2 hours of trading".
SPECIAL_STUDY = ("https://web.archive.org/web/20240707144708/https://www.sechistorical.org/"
                 "collection/papers/1960/1963_SSMkt_Chapter_06_2.pdf#page=6")
#: Thanksgiving: fourth Thursday of November by Pub. L. 77-379 (1941).
THANKSGIVING_LAW = "https://www.govinfo.gov/content/pkg/STATUTE-55/pdf/STATUTE-55-Pg862-2.pdf"


def cfc(issue: str, page: int) -> str:
    """A page of the Commercial and Financial Chronicle on FRASER (secondary)."""
    return f"https://fraser.stlouisfed.org/files/docs/publications/cfc/cfc_{issue}.pdf#page={page}"


FIRST_YEAR = 1953
LAST_YEAR = 1969

#: Why the record starts in 1953: the first full year of the five-day week.
START_NOTE = (
    "Saturday sessions ended in 1952 (summer closings from May 31, five-day week from "
    "Sept. 29). Before 1953 the NYSE list records Saturday closings only as it chose to "
    "(summer Saturdays, wartime) and has at least one wrong date in that era "
    "('Dec. 12, 1950 (Sat) Saturday before Christmas Eve': Dec 12 1950 is a Tuesday), with "
    "no independent check, so earlier years are not modeled.")

# --- standard holidays ("History of New York Stock Exchange Holidays") --------------
# (name, rule, first year, last year or None, source). Rules: ("fixed", m, d),
# ("nth", m, weekday 0=Mon, n), ("easter", offset), ("election",).

STANDARD = [
    ("New Year's Day", ("fixed", 1, 1), 1953, None, NYSE_2008),
    ("Lincoln's Birthday", ("fixed", 2, 12), 1953, 1953, NYSE_2008),  # "Closed every year, 1896-1953"
    ("Washington's Birthday", ("fixed", 2, 22), 1953, None, NYSE_2008),
    ("Good Friday", ("easter", -2), 1953, None, NYSE_2008),
    ("Memorial Day", ("fixed", 5, 30), 1953, None, NYSE_2008),
    ("Independence Day", ("fixed", 7, 4), 1953, None, NYSE_2008),
    ("Labor Day", ("nth", 9, 0, 1), 1953, None, NYSE_2008),
    ("Columbus Day", ("fixed", 10, 12), 1953, 1953, NYSE_2008),  # "Closed every year, 1909-1953"
    ("Election Day", ("election",), 1953, 1968, NYSE_2008),  # "Closed every year through 1968"
    ("Armistice Day", ("fixed", 11, 11), 1953, 1953, NYSE_2008),  # "Closed all day, 1934-1953"
    ("Thanksgiving Day", ("nth", 11, 3, 4), 1953, None, THANKSGIVING_LAW),
    ("Christmas Day", ("fixed", 12, 25), 1953, None, NYSE_2008),
]

#: "Traditionally, when a holiday falls on a Sunday, the NYSE closes the succeeding
#: Monday. On July 3, 1959, the Board adopted a policy that, when a holiday falls on
#: a Saturday, the Exchange will not be open for business on the preceding Friday,
#: unless it ends a monthly or yearly accounting period."
SATURDAY_POLICY = date(1959, 7, 3)
SATURDAY_POLICY_NOTE = (
    "Before 1970 only the yearly exception applies: Friday Dec 31 1965 traded, but the "
    "NYSE's transactions for Friday May 29 1964 (Memorial Day on Saturday, the last "
    "weekday of May) read 'Holiday' (CFC 1964-06-01 p. 36). Before the policy a "
    "Saturday holiday closed no weekday: Fridays May 29 1953 (917,560 shares, CFC "
    "1953-06-01 p. 33) and May 29 1959 (CFC 1959-06-01 p. 36) traded.")
SATURDAY_POLICY_SOURCES = [NYSE_2008, cfc("19640601", 36), cfc("19530601", 33),
                           cfc("19590601", 36)]

#: Secondary confirmations of rule days (CFC transaction / averages tables).
CONFIRMED = {
    date(1953, 2, 12): cfc("19530216", 31),
    date(1953, 2, 23): cfc("19530302", 33),
    date(1953, 10, 12): cfc("19531019", 33),
    date(1953, 11, 11): cfc("19531116", 33),
    date(1959, 7, 3): cfc("19590706", 33),
    date(1964, 5, 29): cfc("19640601", 36),
}

# --- special closings ("New York Stock Exchange Special Closings, 1885-date") --------
# (day, name, note). Every one is in the 2005 and 2011 revisions.

SPECIAL = [
    (date(1954, 12, 24), "Christmas Eve", "Dec. 24, 1954 (Fri) Christmas Eve."),
    (date(1956, 12, 24), "Christmas Eve", "Dec. 24, 1956 (Mon) Christmas Eve."),
    (date(1958, 12, 26), "Day after Christmas", "Dec. 26, 1958 (Fri) Day after Christmas."),
    (date(1961, 5, 29), "Day before Decoration Day", "May 29, 1961 (Mon) Day before Decoration Day."),
    (date(1963, 11, 25), "Funeral of President John F. Kennedy",
     "Nov. 25, 1963 (Mon) Funeral of President John F. Kennedy."),
    (date(1965, 12, 24), "Christmas Eve", "Dec. 24, 1965 (Fri) Christmas Eve. Closed all day."),
    (date(1968, 2, 12), "Lincoln's Birthday",
     "Feb. 12, 1968 (Mon) Lincoln's Birthday. Trading Floor closed but offices remained open."),
    (date(1968, 4, 9), "National Day of Mourning for Martin Luther King, Jr.",
     "Apr. 9, 1968 (Tue) National Day of Mourning for Martin Luther King, Jr."),
    (date(1968, 7, 5), "Day after Independence Day", "July 5, 1968 (Fri) Day after Independence Day."),
    (date(1969, 2, 10), "Heavy snow", "Feb. 10, 1969 (Mon) Closed all day - heavy snow."),
    (date(1969, 3, 31), "Funeral of former President Dwight D. Eisenhower",
     "Mar. 31, 1969 (Mon) Closed. Funeral of former President Dwight D. Eisenhower."),
    (date(1969, 7, 21), "National Day of Participation for the lunar exploration",
     "July 21, 1969 (Mon) Closed - National Day of Participation for the lunar exploration."),
]

#: "June 12-Dec. 31, 1968 (Wed-Tue) Four day week (closed on Wednesdays or regular
#: holiday) - Paperwork Crisis." A week with a closed weekday (a holiday, a special
#: closing, or another legal holiday) keeps its Wednesday open.
PAPERWORK_WEEKS = (date(1968, 6, 12), date(1968, 12, 31))
PAPERWORK_NAME = "Paperwork crisis (four-day week)"
#: Legal holidays that are not NYSE holidays but served as the week's closed day.
#: Veterans Day 1968: the NYSE list omits it; CFC 1968-11-18 p. 32 shows Mon Nov 11
#: "Holiday" and Wed Nov 13 trading (15,668,796 shares).
PAPERWORK_LEGAL_HOLIDAYS = [
    (date(1968, 11, 11), "Veterans Day (four-day week)", cfc("19681118", 32)),
]
#: CFC confirmations of paperwork weeks with a holiday: Wed 1968-07-03 traded
#: (AMEX table), Wed 1968-09-04 traded (10,049,659 shares).
PAPERWORK_CONFIRMED = {
    date(1968, 7, 3): cfc("19680708", 28),
    date(1968, 9, 4): cfc("19680909", 35),
    date(1968, 11, 13): cfc("19681118", 32),
}

# --- hours ----------------------------------------------------------------------
# Regular hours by era: (first day, last day, open (h, m), close (h, m), source, note).

HOURS = [
    (date(1952, 9, 29), date(1969, 1, 1), (10, 0), (15, 30), SPECIAL_STUDY,
     "NYSE timeline 1952: 10 A.M. to 3:30 P.M. Monday-Friday; Special Study (1963): 5 1/2 hours"),
    (date(1969, 1, 2), date(1969, 7, 3), (10, 0), (14, 0), NYSE_2011,
     "Jan. 2-July 3, 1969: five day week resumed, but with curtailed hours: 2:00 pm closing"),
    (date(1969, 7, 7), date(1969, 9, 26), (10, 0), (14, 30), NYSE_2011,
     "July 7-Sept. 26, 1969: 2:30 pm closing - Paperwork Crisis"),
    (date(1969, 9, 29), date(1970, 5, 1), (10, 0), (15, 0), NYSE_2011,
     "Sept. 29, 1969-May 1, 1970: 3:00 pm closing. Normal hours (10:00 am-3:30 pm) resumed May 4, 1970"),
    (date(1970, 5, 4), date(1974, 9, 30), (10, 0), (15, 30), NYSE_2011,
     "Normal hours (10:00 am-3:30 pm) resumed May 4, 1970"),
    (date(1974, 10, 1), date(1985, 9, 27), (10, 0), (16, 0), TIMELINE,
     "NYSE timeline 1974: trading hours are extended from 10 a.m. until 4 p.m. (the timeline gives the "
     "year; the first day, Oct. 1, is the date cl-stack-calendars has carried since 0.5.0)"),
    (date(1985, 9, 30), None, (9, 30), (16, 0), TIMELINE,
     "NYSE timeline 1985: trading hours change to 9:30 a.m. until 4 p.m. (first day Sept. 30, 1985, "
     "the Monday after the Hurricane Gloria closing)"),
]

#: Early closes: (first day, last day, close (h, m), note). Every weekday session in
#: the run closes early.
EARLY_CLOSES = [
    (date(1963, 11, 22), date(1963, 11, 22), (14, 7),
     "Nov. 22, 1963 (Fri) Closed at 2:07 pm. Assassination of President John F. Kennedy."),
    (date(1964, 10, 23), date(1964, 10, 23), (14, 0),
     "Oct. 23, 1964 (Fri) Closed at 2:00 pm - Funeral of former President Herbert C. Hoover."),
    (date(1966, 1, 6), date(1966, 1, 14), (14, 0),
     "Jan. 6-14, 1966 (Thu-Fri) 2:00 pm closing due to transit strike (seven days)."),
    (date(1967, 2, 7), date(1967, 2, 7), (14, 0),
     "Feb. 7, 1967 (Tue) Opened at 10:15 am, closed at 2:00 pm - snowstorm."),
    (date(1967, 8, 8), date(1967, 8, 18), (14, 0),
     "Aug. 8-18, 1967 (Tue-Fri) 2:00 pm closing (nine days) due to back office work load."),
    (date(1968, 1, 22), date(1968, 3, 1), (14, 0),
     "Jan. 22-Mar. 1, 1968 (Mon-Fri) 2:00 pm closing due to back office work load. "
     "3:30 close resumed March 4."),
]

#: Late opens: (day, open (h, m), note).
LATE_OPENS = [
    (date(1960, 12, 12), (11, 0), "Dec. 12, 1960 (Mon) Opened at 11:00 am - severe snowstorm."),
    (date(1965, 11, 10), (11, 5), "Nov. 10, 1965 (Wed) Opened at 11:05 am due to blackout."),
    (date(1967, 2, 7), (10, 15), "Feb. 7, 1967 (Tue) Opened at 10:15 am, closed at 2:00 pm - snowstorm."),
    (date(1969, 2, 11), (11, 0), "Feb. 11, 1969 (Tue) Opened at 11:00 am - heavy snow."),
    (date(1969, 6, 2), (10, 45), "June 2, 1969 (Mon) Opened at 10:45 am. Delays due to storm."),
]

#: Not modeled: intraday halts after which trading resumed the same day (civil
#: defence drills 1954-1960, moments of silence, the 1969-09-03 power failure).
#: The NYSE list records no Christmas Eve early close between 1952 and 1973.
