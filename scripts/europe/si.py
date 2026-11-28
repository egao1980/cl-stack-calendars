"""Slovenia: dela prosti dnevi 2000-2040, transcribed from the Uradni list RS for
egao1980/cl-stack-calendars#23. Stdlib only; data, no logic.

Cache: ~/.cache/cl-stack-calendars/si/ ul-YYYY-NNN.pdf (the pisrs.si gazette PDFs)

Scope: the dela prosti dnevi of the Zakon o praznikih in dela prostih dnevih
(ZPDPD-UPB1 čl. 1-2): the prazniki that are days off and the other days off,
Easter Sunday and Whit Sunday included (čl. 2 names them). Prazniki that are
not days off (17 Aug, 15 Sep, 23 Nov, 8 Jun, 25 Oct, 23 Sep, 10 Nov, 7 Aug)
are left out. No holiday moves off a Sunday. The 1991 base text (Ur. l. RS
26/91) was not read: the 2000-2005 list is UPB1 less ZPDPD-A, which touched only
days that are not days off.
"""

OBSERVE = True

_UL = "https://pisrs.si/api/uradni-list/objava/u{}.pdf"


def _ul(key, num, title, decree, published, issue, in_force, summary, note=None, to=None):
    u = _UL.format(num)
    return dict(key=key, title=title, uri=u, issued=decree, issued_uri=u, published=published, published_uri=u,
                published_in=issue, in_force=in_force, dates_note=note, summary=summary, to=to)


SI_STATUTES = [
    _ul("zpdpd-upb1", "2005112", "Zakon o praznikih in dela prostih dnevih v Republiki Sloveniji, uradno prečiščeno "
        "besedilo (ZPDPD-UPB1)", "2005-11-30", None, "Uradni list RS 112/2005", None,
        "Čl. 1: 1. in 2. januar, 8. februar, 27. april, 1. in 2. maj, 25. junij, 1. november, 26. december are dela "
        "prosti dnevi (17 Aug, 15 Sep, 23 Nov are not). Čl. 2: also velikonočna nedelja in ponedeljek, binkoštna "
        "nedelja, 15. avgust, 31. oktober, 25. december.",
        note="UPB1 consolidates Ur. l. RS 26/91 (base act, not read), 91/2005 and 93/2005; issued = the Državni "
             "zbor's confirmation of 30 Nov 2005; the UPB1 publication date and the base act's in-force date were "
             "not read, so :FROM is the confirmation date (the days apply from 1991)."),
    _ul("zujf-82", "2012040", "Zakon za uravnoteženje javnih financ (ZUJF), 82. člen", "2012-05-30", "2012-05-30",
        "Uradni list RS 40/2012", "2012-05-31",
        "82. člen: the first indent of čl. 1 ZPDPD becomes »– 1. januar, novo leto« (2 January no longer a day off, "
        "first affected 2 Jan 2013).", note="Issued = promulgation decree (DZ 11 May 2012).", to="2016-12-31"),
    _ul("zpdpd-d", "2016083", "Zakon o spremembah Zakona o praznikih in dela prostih dnevih v Republiki Sloveniji "
        "(ZPDPD-D)", "2016-12-21", "2016-12-23", "Uradni list RS 83/2016", "2016-12-24",
        "1. člen: »– 1. in 2. januar, novo leto« (2 January a day off again from 2017).",
        note="Issued = promulgation decree (DZ 13 Dec 2016)."),
    _ul("zopnn-f-15", "2023088", "Zakon o interventnih ukrepih za odpravo posledic poplav in zemeljskih plazov iz "
        "avgusta 2023 (ZOPNN-F), 15. člen", "2023-08-10", "2023-08-10", "Uradni list RS 88/2023", "2023-08-11",
        "15. člen: se v letu 2023 kot dela prost dan v Republiki Sloveniji določi 14. avgust (dan solidarnosti).",
        note="Issued = promulgation decree (DZ 9 Aug 2023).", to="2023-12-31"),
]

SI_FIXED = [
    (1, 1, "Novo leto", [(1991, None)], "zpdpd-upb1"),
    (1, 2, "Novo leto", [(1991, 2012), (2017, None)], "zpdpd-d"),
    (2, 8, "Prešernov dan, slovenski kulturni praznik", [(1991, None)], "zpdpd-upb1"),
    (4, 27, "Dan upora proti okupatorju", [(1991, None)], "zpdpd-upb1"),
    (5, 1, "Praznik dela", [(1991, None)], "zpdpd-upb1"),
    (5, 2, "Praznik dela", [(1991, None)], "zpdpd-upb1"),
    (6, 25, "Dan državnosti", [(1991, None)], "zpdpd-upb1"),
    (8, 15, "Marijino vnebovzetje", [(1991, None)], "zpdpd-upb1"),
    (10, 31, "Dan reformacije", [(1991, None)], "zpdpd-upb1"),
    (11, 1, "Dan spomina na mrtve", [(1991, None)], "zpdpd-upb1"),
    (12, 25, "Božič", [(1991, None)], "zpdpd-upb1"),
    (12, 26, "Dan samostojnosti in enotnosti", [(1991, None)], "zpdpd-upb1"),
]

SI_EASTER = [
    (0, "Velikonočna nedelja", [(1991, None)], "zpdpd-upb1"),
    (1, "Velikonočni ponedeljek", [(1991, None)], "zpdpd-upb1"),
    (49, "Binkoštna nedelja", [(1991, None)], "zpdpd-upb1"),
]


def _doc(st):
    return {k: st.get(k) for k in ("title", "uri", "issued", "issued_uri", "published", "published_uri",
                                   "published_in", "dates_note")}


SI_YEARS = {
    2023: dict(confidence="primary", covers=[], docs=[_doc(SI_STATUTES[3])],
               days=[("08-14", "Dan solidarnosti", 0)]),
}
