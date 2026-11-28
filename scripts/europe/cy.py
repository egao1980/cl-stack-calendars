"""Cyprus: public holidays 2000-2040, for egao1980/cl-stack-calendars#22. Stdlib
only; data, no logic. LOWER CONFIDENCE.

Cache: ~/.cache/cl-stack-calendars/cy/ (cbc/: the Central Bank of Cyprus yearly bank-holiday lists 2015-2028;
mlsi/: the Department of Labour Relations page)

No holiday statute could be read: cylaw.org, gov.cy and the public-administration
site refuse automated fetches. The Department of Labour Relations says the
private sector's holidays are set by agreement or collective agreement. The
days here are the public holidays every Central Bank list 2015-2028 carries,
less Easter Tuesday, which is a bank-only day: 1 and 6 January, Clean Monday,
25 March, 1 April, Good Friday, Easter Monday, 1 May, Whit Monday
(Kataklysmos), 15 August, 1 October, 28 October, 25 and 26 December. No weekend
substitution (1 May 2016, a Sunday, was not replaced). No Easter Sunday: no
statute names it.
"""

OBSERVE = True

_CBC = "https://www.centralbank.cy/el/the-bank/working-hours-bank-holidays"

CY_STATUTES = [
    dict(key="cbc-lists", title="Central Bank of Cyprus, yearly lists of bank holidays (Τραπεζικές αργίες) 2015-2028",
         uri=_CBC, issued=None, issued_uri=None, published=None, published_uri=_CBC,
         published_in="centralbank.cy (one PDF per year)", in_force=None,
         dates_note="SECONDARY for public holidays: a bank-holiday list, read for want of the statute (the bank "
                    "holidays law Ν. 13(I)/1996 and the public-service lists were not reachable). Each list's "
                    "publication date is not stated.",
         summary="1 Jan, 6 Jan, Clean Monday, 25 Mar, 1 Apr, Good Friday, Easter Monday, Easter Tuesday (bank), 1 "
                 "May, Holy Spirit Monday, 15 Aug, 1 Oct, 28 Oct, 25 Dec, 26 Dec."),
]

CY_FIXED = [
    (1, 1, "Πρωτοχρονιά", [(1960, None)], "cbc-lists"),
    (1, 6, "Θεοφάνεια", [(1960, None)], "cbc-lists"),
    (3, 25, "Εθνική Εορτή", [(1960, None)], "cbc-lists"),
    (4, 1, "Εθνική Ημέρα Κύπρου", [(1960, None)], "cbc-lists"),
    (5, 1, "Εργατική Πρωτομαγιά", [(1960, None)], "cbc-lists"),
    (8, 15, "Κοίμηση της Θεοτόκου", [(1960, None)], "cbc-lists"),
    (10, 1, "Ημέρα της Κυπριακής Ανεξαρτησίας", [(1960, None)], "cbc-lists"),
    (10, 28, "Επέτειος του Όχι", [(1960, None)], "cbc-lists"),
    (12, 25, "Χριστούγεννα", [(1960, None)], "cbc-lists"),
    (12, 26, "Δεύτερη μέρα Χριστουγέννων", [(1960, None)], "cbc-lists"),
]

_O = {"orthodox": True}
CY_EASTER = [
    (-48, "Καθαρά Δευτέρα", [(1960, None)], "cbc-lists", _O),
    (-2, "Μεγάλη Παρασκευή", [(1960, None)], "cbc-lists", _O),
    (1, "Δευτέρα του Πάσχα", [(1960, None)], "cbc-lists", _O),
    (50, "Δευτέρα του Αγίου Πνεύματος (Κατακλυσμός)", [(1960, None)], "cbc-lists", _O),
]

CY_YEARS = {}
