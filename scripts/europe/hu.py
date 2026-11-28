"""Hungary: munkaszüneti napok and the yearly munkarend transfers 2000-2040,
transcribed from Nemzeti Jogszabálytár (njt.jog.gov.hu) and the Magyar Közlöny
for egao1980/cl-stack-calendars#23. Stdlib only; data, no logic.

Cache: ~/.cache/cl-stack-calendars/hu/ (njt pages of each act and decree, mk-YYYYNNN.pdf Magyar Közlöny issues)

Scope: the munkaszüneti napok of 1992. évi XXII. tv. § 125 (3) (to 30 Jun 2012)
and Mt. (2012. évi I. tv.) § 102 (1): Nagypéntek from 2017 (2017. évi XIII.
tv.), Szenteste (24 December) from 14 Nov 2026 (2026. évi LXXII. tv.). Easter
and Whit Sunday are not munkaszüneti napok (§ 125 (4) / Mt. § 101 (4) only apply
the holiday rules to them for scheduling), so they are not listed. Each
year's ministerial decree "a 20XX. évi munkaszüneti napok körüli munkarendről"
moves rest days: the weekday becomes a pihenőnap (listed as a holiday) and a
Saturday a munkanap (a working day). No decree was found for 2000, 2006,
2017 and 2023 (absence not confirmed in every ministry's series), and none is
issued for 2027 yet.
"""

OBSERVE = True

_NJT = "https://njt.jog.gov.hu/jogszabaly/"

HU_STATUTES = [
    dict(key="mt-1992", title="1992. évi XXII. törvény a Munka Törvénykönyvéről, 125. § (3)", uri=_NJT + "1992-22-00-00",
         issued=None, issued_uri=None, published=None, published_uri=None, published_in=None, in_force=None,
         to="2012-06-30",
         dates_note="njt holds versions from 2010 only; the text was read in the 2010-01-01 version. The 1992 "
                    "promulgation and the act that first listed 1 November were not read.",
         summary="(3) Munkaszüneti nap: január 1., március 15., húsvéthétfő, május 1., pünkösdhétfő, augusztus 20., "
                 "október 23., november 1. és december 25-26."),
    dict(key="mt-2012", title="2012. évi I. törvény a munka törvénykönyvéről, 102. § (1)", uri=_NJT + "2012-1-00-00",
         issued="2012-01-06", issued_uri=_NJT + "2012-1-00-00", published="2012-01-06", published_uri=_NJT + "2012-1-00-00",
         published_in="Magyar Közlöny 2012/2", in_force="2012-07-01",
         summary="(1) Munkaszüneti nap: január 1., március 15., húsvéthétfő, május 1., pünkösdhétfő, augusztus 20., "
                 "október 23., november 1. és december 25-26."),
    dict(key="tv-2017-13", title="2017. évi XIII. törvény (nagypéntek munkaszüneti nap)", uri=_NJT + "2017-13-00-00",
         issued="2017-03-16", issued_uri=_NJT + "2017-13-00-00", published="2017-03-16", published_uri=_NJT + "2017-13-00-00",
         published_in="Magyar Közlöny 2017/37", in_force="2017-03-24",
         dates_note="Issued = promulgation (adopted 7 Mar 2017); in force on the eighth day after promulgation.",
         summary="§ 4: Mt. § 102 (1) gains nagypéntek."),
    dict(key="tv-2026-72", title="2026. évi LXXII. törvény (Szenteste munkaszüneti nap)", uri=_NJT + "2026-72-00-00",
         issued="2026-11-13", issued_uri=_NJT + "2026-72-00-00", published="2026-11-13", published_uri=_NJT + "2026-72-00-00",
         published_in="Magyar Közlöny 2026/171", in_force="2026-11-14",
         dates_note="Issued = promulgation (adopted 3 Nov 2026); in force the day after promulgation, so 24 December "
                    "2026 is already a munkaszüneti nap (transitional § 19/G for running working-time frames).",
         summary="§ 3: Mt. § 102 (1) ends '... november 1. és december 24-26.'"),
]

HU_FIXED = [
    (1, 1, "Újév", [(1900, None)], "mt-2012"),
    (3, 15, "Nemzeti ünnep (1848)", [(1990, None)], "mt-2012"),
    (5, 1, "A munka ünnepe", [(1900, None)], "mt-2012"),
    (8, 20, "Az államalapítás ünnepe", [(1900, None)], "mt-2012"),
    (10, 23, "Nemzeti ünnep (1956)", [(1991, None)], "mt-2012"),
    (11, 1, "Mindenszentek", [(1900, None)], "mt-2012"),
    (12, 24, "Szenteste", [("2026-11-14", None)], "tv-2026-72"),
    (12, 25, "Karácsony", [(1900, None)], "mt-2012"),
    (12, 26, "Karácsony másnapja", [(1900, None)], "mt-2012"),
]

HU_EASTER = [
    (-2, "Nagypéntek", [(2017, None)], "tv-2017-13"),
    (1, "Húsvéthétfő", [(1900, None)], "mt-2012"),
    (50, "Pünkösdhétfő", [(1900, None)], "mt-2012"),
]

# (year of the days, decree, njt id, promulgation date, MK issue, in force, [(rest day, working Saturday)])
_DECREES = [
    (2001, "43/2000. (XII. 18.) GM rendelet", "2000-43-20-83", "2000-12-18", "2000/124", "2000-12-26",
     [("03-16", "03-10"), ("04-30", "04-28"), ("10-22", "10-20"), ("11-02", "10-27"), ("12-24", "12-22"), ("12-31", "12-29")]),
    (2002, "25/2001. (IX. 19.) GM rendelet", "2001-25-20-83", "2001-09-19", "2001/101", "2001-09-27",
     [("08-19", "08-10"), ("12-24", "12-28")]),
    (2003, "2/2002. (IX. 20.) FMM rendelet", "2002-2-20-SY", "2002-09-20", "2002/122", "2002-09-28",
     [("05-02", "04-26"), ("10-24", "10-18"), ("12-24", "12-13")]),
    (2004, "9/2003. (VII. 18.) FMM rendelet", "2003-9-20-SY", "2003-07-18", "2003/87", "2003-07-26",
     [("01-02", "01-10"), ("12-24", "12-18")]),
    (2005, "25/2004. (VIII. 30.) FMM rendelet", "2004-25-20-SY", "2004-08-30", "2004/123", "2004-09-07",
     [("03-14", "03-19"), ("10-31", "11-05")]),
    (2007, "4/2006. (IX. 28.) SZMM rendelet", "2006-4-20-1X", "2006-09-28", "2006/118", "2006-10-06",
     [("03-16", "03-10"), ("04-30", "04-21"), ("10-22", "10-20"), ("11-02", "10-27"), ("12-24", "12-22"), ("12-31", "12-29")]),
    (2008, "27/2007. (IX. 29.) SZMM rendelet", "2007-27-20-1X", "2007-09-29", "2007/129", "2007-10-07",
     [("05-02", "04-26"), ("10-24", "10-18"), ("12-24", "12-20")]),
    (2009, "16/2008. (IX. 26.) SZMM rendelet, as amended by 1/2009. (I. 7.) SZMM rendelet", "2008-16-20-1X",
     "2008-09-26", "2008/139", "2008-10-04",
     [("01-02", "03-28"), ("08-21", "08-29"), ("12-24", "12-19")]),
    (2010, "20/2009. (IX. 28.) SZMM rendelet", "2009-20-20-1X", "2009-09-28", "2009/136", "2009-10-06",
     [("12-24", "12-11")]),
    (2011, "7/2010. (XII. 14.) NGM rendelet", "2010-7-20-2X", "2010-12-14", "2010/189", "2010-12-22",
     [("03-14", "03-19"), ("10-31", "11-05")]),
    (2012, "39/2011. (X. 14.) NGM rendelet", "2011-39-20-2X", "2011-10-14", "2011/119", "2011-10-22",
     [("03-16", "03-24"), ("04-30", "04-21"), ("10-22", "10-27"), ("11-02", "11-10"), ("12-24", "12-15")]),
    (2013, "28/2012. (IX. 4.) NGM rendelet", "2012-28-20-2X", "2012-09-04", "2012/116", "2012-09-12",
     [("08-19", "08-24"), ("12-24", "12-07"), ("12-27", "12-21")]),
    (2014, "33/2013. (VIII. 30.) NGM rendelet", "2013-33-20-2X", "2013-08-30", "2013/143", "2014-01-01",
     [("05-02", "05-10"), ("10-24", "10-18"), ("12-24", "12-13")]),
    (2015, "28/2014. (IX. 24.) NGM rendelet", "2014-28-20-2X", "2014-09-24", "2014/131", "2015-01-01",
     [("01-02", "01-10"), ("08-21", "08-08"), ("12-24", "12-12")]),
    (2016, "18/2015. (VI. 29.) NGM rendelet", "2015-18-20-2X", "2015-06-29", "2015/93", "2016-01-01",
     [("03-14", "03-05"), ("10-31", "10-15")]),
    (2018, "9/2017. (V. 19.) NGM rendelet", "2017-9-20-2X", "2017-05-19", "2017/73", "2018-01-01",
     [("03-16", "03-10"), ("04-30", "04-21"), ("10-22", "10-13"), ("11-02", "11-10"), ("12-24", "12-01"), ("12-31", "12-15")]),
    (2019, "6/2018. (VIII. 23.) PM rendelet", "2018-6-20-53", "2018-08-23", "2018/129", "2019-01-01",
     [("08-19", "08-10"), ("12-24", "12-07"), ("12-27", "12-14")]),
    (2020, "7/2019. (VI. 25.) PM rendelet", "2019-7-20-53", "2019-06-25", "2019/108", "2020-01-01",
     [("08-21", "08-29"), ("12-24", "12-12")]),
    (2021, "14/2020. (V. 13.) ITM rendelet", "2020-14-20-7Q", "2020-05-13", "2020/107", "2021-01-01",
     [("12-24", "12-11")]),
    (2022, "23/2021. (VI. 1.) ITM rendelet", "2021-23-20-7Q", "2021-06-01", "2021/100", "2022-01-01",
     [("03-14", "03-26"), ("10-31", "10-15")]),
    (2024, "15/2023. (VII. 13.) GFM rendelet", "2023-15-20-8P", "2023-07-13", "2023/104", "2024-01-01",
     [("08-19", "08-03"), ("12-24", "12-07"), ("12-27", "12-14")]),
    (2025, "11/2024. (IV. 8.) NGM rendelet", "2024-11-20-2X", "2024-04-08", "2024/42", "2025-01-01",
     [("05-02", "05-17"), ("10-24", "10-18"), ("12-24", "12-13")]),
    (2026, "10/2025. (IV. 30.) NGM rendelet, 2. § c) repealed by 4/2026. (XI. 13.) SZCSM rendelet", "2025-10-20-2X",
     "2025-04-30", "2025/51", "2026-01-01",
     [("01-02", "01-10"), ("08-21", "08-08")]),
]

_NOTES = {
    2009: "1/2009. (I. 7.) SZMM rendelet (njt 2009-1-20-1X, MK 2009/2, in force 2009-01-08) § 1 moved the working "
          "Saturday from 10 January to 28 March.",
    2010: "In force the eighth day after promulgation.",
    2026: "The decree's third pair (rest 24 December, working Saturday 12 December) was repealed by 4/2026. (XI. 13.) "
          "SZCSM rendelet (njt 2026-4-20-85, MK 2026/171, in force 2026-11-14), when 24 December became a "
          "munkaszüneti nap (2026. évi LXXII. tv.); 12 December 2026 is a rest day again.",
}


def _block(year, title, ident, date, mk, in_force, pairs):
    u = _NJT + ident
    doc = dict(title=title, uri=u, issued=date, issued_uri=u, published=date, published_uri=u,
               published_in=f"Magyar Közlöny {mk}",
               dates_note=" ".join(x for x in (f"Promulgated in the Magyar Közlöny on the decree's date; in force {in_force}.",
                                               _NOTES.get(year)) if x))
    return dict(confidence="primary", covers=[], docs=[doc],
                days=[(rest, "Áthelyezett pihenőnap", 0) for rest, _ in pairs],
                working=[(sat, 0) for _, sat in pairs])


HU_YEARS = {y: _block(y, t, i, d, mk, f, p) for y, t, i, d, mk, f, p in _DECREES}

# The 2013 decree also moved one day of 2012 (rest 31 December 2012, working Saturday 1 December 2012).
HU_YEARS[2012]["days"].append(("12-31", "Áthelyezett pihenőnap", 1))
HU_YEARS[2012]["working"].append(("12-01", 1))
HU_YEARS[2012]["docs"].append(HU_YEARS[2013]["docs"][0])
