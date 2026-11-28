"""Lithuania: švenčių dienos (Darbo kodeksas) 2000-2040, for
egao1980/cl-stack-calendars#21. Stdlib only; data, no logic. LOWER CONFIDENCE.

e-seimas.lrs.lt and e-tar.lt answer automated fetches with a Cloudflare 403, so
no act was read; the eras come from search results quoting the acts, and
python-holidays agrees on every day.

Scope: the švenčių dienos of the Darbo kodeksas (art. 162 of the 2002 Code,
art. 123 of the 2017 Code): 1 Jan, 16 Feb, 11 Mar, Easter Sunday and Monday,
1 May, Mother's Day (first Sunday of May), Father's Day (first Sunday of June),
24 June (Rasos ir Joninių diena) from 2003, 6 July, 15 August, 1 November,
2 November from 2020, 24, 25 and 26 December.

Open (see the follow-up issue): the 2003 act (IX-1656, Žin. 2003 Nr. 70-3167) is
reported in force on 16 Jul 2003, after 24 June 2003, while python-holidays and
the review have 24 June from 2003; and the 2002 Code's art. 162¹ is reported to
have moved rest days that coincided with holidays (around 2008), which no
source here confirms. Neither is applied.
"""

OBSERVE = True

_ES = "https://e-seimas.lrs.lt/"

LT_STATUTES = [
    dict(key="dk-162", title="Lietuvos Respublikos darbo kodeksas (2002), 162 straipsnis; Darbo kodeksas (2016, nuo "
         "2017-07-01), 123 straipsnis", uri=_ES, issued=None, issued_uri=None, published=None, published_uri=None,
         published_in=None, in_force=None,
         dates_note="SECONDARY: no act was read (e-seimas and e-tar refuse automated fetches); the URI is the e-seimas register "
                    "itself; the act page was not read.",
         summary="Švenčių dienos: 1 Jan, 16 Feb, 11 Mar, Easter Sunday and Monday, 1 May, the first Sundays of May "
                 "and June, 24 Jun, 6 Jul, 15 Aug, 1 Nov, (2 Nov), 24-26 Dec."),
    dict(key="ix-1656", title="Darbo kodekso pakeitimo įstatymas Nr. IX-1656 (Rasos ir Joninių diena)", uri=_ES,
         issued="2003-06-26", issued_uri=None, published=None, published_uri=None, published_in="Žin., 2003, Nr. 70-3167",
         in_force="2003-07-16",
         dates_note="SECONDARY: from search results only; its in-force date (16 Jul 2003) is after 24 Jun 2003, "
                    "while the gold keeps 24 June from 2003 as the review and python-holidays do (open, see #21 "
                    "follow-up)."),
    dict(key="xiii-2415", title="Darbo kodekso 123 straipsnio pakeitimo įstatymas Nr. XIII-2415 (Vėlinės)", uri=_ES,
         issued=None, issued_uri=None, published="2019-08-30", published_uri=None, published_in="TAR, 2019-08-30",
         in_force="2020-01-01",
         dates_note="SECONDARY: from search results only.", summary="2 November (Mirusiųjų atminimo diena) from 2020."),
]

LT_FIXED = [
    (1, 1, "Naujųjų metų diena", [(1990, None)], "dk-162"),
    (2, 16, "Lietuvos valstybės atkūrimo diena", [(1990, None)], "dk-162"),
    (3, 11, "Lietuvos nepriklausomybės atkūrimo diena", [(1990, None)], "dk-162"),
    (5, 1, "Tarptautinė darbo diena", [(1990, None)], "dk-162"),
    (6, 24, "Rasos ir Joninių diena", [(2003, None)], "ix-1656"),
    (7, 6, "Valstybės (Lietuvos karaliaus Mindaugo karūnavimo) diena", [(1991, None)], "dk-162"),
    (8, 15, "Žolinė", [(1990, None)], "dk-162"),
    (11, 1, "Visų Šventųjų diena", [(1990, None)], "dk-162"),
    (11, 2, "Mirusiųjų atminimo (Vėlinių) diena", [(2020, None)], "xiii-2415"),
    (12, 24, "Kūčių diena", [(1990, None)], "dk-162"),
    (12, 25, "Šv. Kalėdų pirma diena", [(1990, None)], "dk-162"),
    (12, 26, "Šv. Kalėdų antra diena", [(1990, None)], "dk-162"),
]

LT_EASTER = [
    (0, "Šv. Velykos", [(1990, None)], "dk-162"),
    (1, "Antroji šv. Velykų diena", [(1990, None)], "dk-162"),
]

LT_NTH = [
    (5, 7, 1, "Motinos diena", [(1990, None)], "dk-162"),
    (6, 7, 1, "Tėvo diena", [(1990, None)], "dk-162"),
]

LT_YEARS = {}
