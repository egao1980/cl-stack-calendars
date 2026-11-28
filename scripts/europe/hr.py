"""Croatia: blagdani i neradni dani 2000-2040, transcribed from Narodne novine
for egao1980/cl-stack-calendars#23. Stdlib only; data, no logic.

Cache: ~/.cache/cl-stack-calendars/hr/ nn_<id>.html (narodne-novine.nn.hr/clanci/sluzbeni/<id>.html)

Scope: the days of čl. 1 of the Zakon o blagdanima (NN 33/1996 as amended,
then NN 110/2019), on which "ne radi se". A Sunday is listed only when the act
names it: Uskrs from NN 55/2008. No holiday moves off a Sunday ("ne prenosi
se u idući dan"). Eras before NN 33/1996 are the earlier starter's (from 1991,
not researched).

6 January 2002 was a working day: NN 96/2001 rewrote čl. 1 without
Bogojavljenje from 15 Nov 2001, and NN 13/2002 put it back from 16 Feb 2002.
"""

OBSERVE = True

_NN = "https://narodne-novine.nn.hr/clanci/sluzbeni/"


def _nn(key, ident, title, adopted, published, issue, in_force, summary, note=None, to=None):
    u = _NN + ident + ".html"
    return dict(key=key, title=title, uri=u, issued=adopted, issued_uri=u, published=published, published_uri=u,
                published_in=issue, in_force=in_force, dates_note=note, summary=summary, to=to)


HR_STATUTES = [
    _nn("nn-33-1996", "1996_04_33_674", "Zakon o blagdanima, spomendanu i neradnim danima u Republici Hrvatskoj",
        "1996-04-25", "1996-04-30", "Narodne novine 33/1996", "1996-05-08",
        "Čl. 1: 1. siječnja, 6. siječnja, Uskrsni ponedjeljak, 1. svibnja, 30. svibnja (Dan državnosti), 22. lipnja, "
        "5. kolovoza, 15. kolovoza, 1. studenog, 25. i 26. prosinca. U dane blagdana ne radi se.",
        note="Issued = the promulgation decree of 25 Apr 1996 (Sabor 19 Apr 1996); in force the 8th day after "
             "publication.", to="2019-12-31"),
    _nn("nn-96-2001", "2001_11_96_1614", "Zakon o izmjenama i dopuni Zakona o blagdanima, spomendanu i neradnim danima",
        "2001-11-02", "2001-11-07", "Narodne novine 96/2001", "2001-11-15",
        "Čl. 2 rewrites čl. 1: adds Tijelovo, 25. lipnja Dan državnosti, 8. listopada Dan neovisnosti; 30 May and 6 "
        "January are not in the new list.",
        note="Issued = promulgation decree (Sabor 25 Oct 2001); čl. 4: in force the 8th day after publication."),
    _nn("nn-13-2002", "2002_02_13_318", "Zakon o dopuni Zakona o blagdanima, spomendanima i neradnim danima",
        "2002-02-01", "2002-02-08", "Narodne novine 13/2002", "2002-02-16",
        "Čl. 1 inserts: 6. siječnja – Bogojavljenje ili Sveta tri kralja.",
        note="Issued = promulgation decree (Sabor 30 Jan 2002); čl. 2: in force the 8th day after publication."),
    _nn("nn-55-2008", "2008_05_55_1911", "Zakon o izmjenama i dopunama Zakona o blagdanima, spomendanima i neradnim danima",
        "2008-05-15", "2008-05-16", "Narodne novine 55/2008", "2008-05-16",
        "Čl. 1: »Uskrs i Uskrsni ponedjeljak«; 25. prosinca Božić; 26. prosinca Sveti Stjepan.",
        note="Issued = promulgation decree (Sabor 13 May 2008); in force on the day of publication."),
    _nn("nn-110-2019", "2019_11_110_2212", "Zakon o blagdanima, spomendanima i neradnim danima u Republici Hrvatskoj",
        "2019-11-14", "2019-11-15", "Narodne novine 110/2019", "2020-01-01",
        "Čl. 1(1): 1. i 6. siječnja, Uskrs i Uskrsni ponedjeljak, Tijelovo, 1. svibnja, 30. svibnja Dan državnosti, "
        "22. lipnja, 5. kolovoza, 15. kolovoza, 1. studenoga, 18. studenoga, 25. i 26. prosinca. 25 June and 8 "
        "October become spomendani (čl. 2). Čl. 8: in force 1 January 2020.",
        note="Issued = the Sabor's adoption date (14 Nov 2019)."),
]

HR_FIXED = [
    (1, 1, "Nova godina", [(1991, None)], "nn-33-1996"),
    (1, 6, "Bogojavljenje ili Sveta tri kralja", [(1991, "2001-11-14"), ("2002-02-16", None)], "nn-13-2002"),
    (5, 1, "Praznik rada", [(1991, None)], "nn-33-1996"),
    (5, 30, "Dan državnosti", [(1991, 2001), (2020, None)], "nn-110-2019"),
    (6, 22, "Dan antifašističke borbe", [(1991, None)], "nn-33-1996"),
    (6, 25, "Dan državnosti", [(2002, 2019)], "nn-96-2001"),
    (8, 5, "Dan pobjede i domovinske zahvalnosti i Dan hrvatskih branitelja", [(1995, None)], "nn-33-1996"),
    (8, 15, "Velika Gospa", [(1991, None)], "nn-33-1996"),
    (10, 8, "Dan neovisnosti", [(2002, 2019)], "nn-96-2001"),
    (11, 1, "Svi sveti", [(1991, None)], "nn-33-1996"),
    (11, 18, "Dan sjećanja na žrtve Domovinskog rata", [(2020, None)], "nn-110-2019"),
    (12, 25, "Božić", [(1991, None)], "nn-33-1996"),
    (12, 26, "Sveti Stjepan", [(1991, None)], "nn-33-1996"),
]

HR_EASTER = [
    (0, "Uskrs", [("2008-05-16", None)], "nn-55-2008"),
    (1, "Uskrsni ponedjeljak", [(1991, None)], "nn-33-1996"),
    (60, "Tijelovo", [(2002, None)], "nn-96-2001"),
]

HR_YEARS = {}
