"""Kuwait (KW) government-sector official holidays 2000-2027.

Research module for egao1980/cl-stack-calendars#44.  Stdlib only.
Cache of every fetched original: ~/.cache/cl-stack-calendars/kw/
  kuna-<id>-<lang>.html   KUNA article pages (the new Next.js site only server-renders
                          title + <meta name=description> lead; body is client-side)
  cbk-ann-hol-<YYYY>-p0.html  Central Bank of Kuwait "Holiday" announcements, 2012-2026
                          (entries exist only from 2020 on)
  tad-<YYYY>.html         timeanddate.com Kuwait (secondary), 2011-2027 have data
  law-6-2010-labour-ar-alkarama.pdf  Law 6/2010 (copy of manpower.gov.kw/LaborLaw.html)
"""

_K = "https://www.kuna.net.kw/ArticleDetails.aspx?id={}&language={}"
_CBK = "https://www.cbk.gov.kw/en/cbk-news/announcements-and-press-releases/announcements?selYear={}&selSection=Holiday"
_TAD = "https://www.timeanddate.com/holidays/kuwait/{}"


def _kuna(id_, lang, date, title, by="CSC"):
    """A KUNA wire item (official news agency) reporting a CoM / CSC decision."""
    return dict(title="KUNA: " + title, uri=_K.format(id_, lang),
                issued=date, issued_uri=_K.format(id_, lang),
                published=date, published_uri=_K.format(id_, lang),
                published_in="official news release (KUNA), decision of the "
                + ("Council of Ministers" if by == "CoM" else "Civil Service Commission"),
                dates_note=None)


def _cbk(year, title, date=None):
    return dict(title="Central Bank of Kuwait holiday announcement: " + title,
                uri=_CBK.format(year), issued=date, issued_uri=_CBK.format(year) if date else None,
                published=date, published_uri=_CBK.format(year) if date else None,
                published_in="official announcement (Central Bank of Kuwait, cbk.gov.kw)",
                dates_note=None if date else "CBK list shows dd.mm.yy per item; date not transcribed")


def _sec(title, uri, date=None, note=None):
    return dict(title=title, uri=uri, issued=date, issued_uri=uri if date else None,
                published=date, published_uri=uri if date else None,
                published_in="secondary (press / calendar site)",
                dates_note=note or ("" if date else "secondary source; article date not recorded"))


def _tad(year):
    return _sec("timeanddate.com: Holidays in Kuwait %d" % year, _TAD.format(year),
                note="secondary calendar site, no issue date")


# Names (Arabic, official language)
NY = "رأس السنة الميلادية"
ISRA = "الإسراء والمعراج"
NAT = "العيد الوطني"
LIB = "يوم التحرير"
FITR = "عيد الفطر"
ARAFAH = "يوم الوقوف بعرفة"
ADHA = "عيد الأضحى"
HNY = "رأس السنة الهجرية"
MAWLID = "المولد النبوي الشريف"
REST = "يوم راحة"          # CoM/CSC "rest day" (bridge / compensation / 30 Ramadan)

KW_STATUTES = [
    dict(key="law-6-2010",
         title="القانون رقم 6 لسنة 2010 في شأن العمل في القطاع الأهلي، المادة 68 (الإجازات الرسمية)",
         uri="https://www.alkarama.org/sites/default/files/2017-06/Law%20Of%20Labor_AR.pdf",
         issued=None, issued_uri=None,
         published="2010-02-21", published_uri=None,
         published_in="الكويت اليوم (Kuwait Al-Youm) issue 963 of 21 Feb 2010 (per press/ILO citations, gazette PDF not read)",
         in_force=None,
         dates_note="Text read from a June-2017 print of the Public Authority for Manpower page "
                    "manpower.gov.kw/LaborLaw.html (cached PDF). Signature date not on that copy; "
                    "gazette issue 963 / 2010-02-21 is from secondary citations only.",
         summary="Private-sector paid official holidays: Hijri New Year 1, Isra wal Mi'raj 1, "
                 "Eid al-Fitr 3, Waqfat Arafah 1, Eid al-Adha 3, Mawlid 1, National Day 25 Feb 1, "
                 "Liberation Day 26 Feb 1, Gregorian New Year 1 (13 days). No 1 May. "
                 "The government sector observes the same 13 occasions; the actual days off "
                 "(moves, bridges, rest days) are fixed each time by Council of Ministers decision "
                 "and CSC circular."),
    dict(key="com-252-2008",
         title="قرار مجلس الوزراء رقم 252 (الاجتماع 9/2008) - اعتبار يوم 30 رمضان يوم راحة",
         uri=_K.format(2732011, "ar"),
         issued="2008-03-03", issued_uri=_K.format(2732011, "ar"),
         published=None, published_uri=None, published_in="cited in CSC Eid circulars reported by KUNA (2018, 2022)",
         in_force=None,
         dates_note="Decision text not found; date and number as cited by the CSC in KUNA 2732011 (2018-06-10) and the 2022 Fitr circular.",
         summary="In government bodies the 30th of Ramadan is a rest day unless it is the first day of Eid al-Fitr."),
    dict(key="com-thursday-rule",
         title="قرار مجلس الوزراء بترحيل عطلة المولد النبوي والإسراء والمعراج إلى يوم الخميس",
         uri="https://www.arabtimesonline.com/news/3-day-official-holiday-for-isra-and-miraj",
         issued=None, issued_uri=None, published=None, published_uri=None,
         published_in="secondary press (Arab Times 2025-01-12, Kuwait Times 2017 'Miraj off Apr 27')",
         in_force=None,
         dates_note="Decision number/date not found. Observed in practice from 2014 (Mawlid 2014-01-16, "
                    "Isra 2014-05-29) but not every year (Isra 2019 kept on Wed 3 Apr per timeanddate).",
         summary="If the Prophet's Birthday or Isra wal Mi'raj falls between two working days it is "
                 "deferred to the following Thursday; if it falls on the weekend it is usually given on "
                 "the Sunday (2018, 2023, 2026)."),
]

KW_FIXED = [
    (1, 1, NY, [(2000, None)], "law-6-2010"),
    (2, 25, NAT, [(2000, None)], "law-6-2010"),
    (2, 26, LIB, [(2000, None)], "law-6-2010"),
]

KW_ISLAMIC = [
    (7, 27, [0], ISRA, [(2000, None)], "law-6-2010"),
    (10, 1, [0, 1, 2], FITR, [(2000, None)], "law-6-2010"),
    (12, 9, [0], ARAFAH, [(2000, None)], "law-6-2010"),
    (12, 10, [0, 1, 2], ADHA, [(2000, None)], "law-6-2010"),
    (1, 1, [0], HNY, [(2000, None)], "law-6-2010"),
    (3, 12, [0], MAWLID, [(2000, None)], "law-6-2010"),
]

KW_OTHER_RULES = [
    dict(rule="ramadan-30-rest-day", source="com-252-2008", years=(2008, None),
         text="If Ramadan has 30 days, 30 Ramadan (the day before Eid al-Fitr) is a government rest day."),
    dict(rule="isra-mawlid-to-thursday", source="com-thursday-rule", years=(2014, None),
         text="Isra wal Mi'raj / Mawlid on Mon-Wed -> following Thursday; on Fri/Sat -> usually Sunday. "
              "Applied case by case by CoM; check KW_YEARS."),
    dict(rule="bridge-and-compensation", source="law-6-2010", years=(2000, None),
         text="CoM regularly makes a working day lying between a holiday and the weekend a 'rest day' "
              "(يوم راحة), and compensates Eid / national days falling on Fri-Sat with Sunday/Monday. "
              "Not a fixed formula: take the yearly decision."),
]

# ---------------------------------------------------------------------------
KW_YEARS = {}

KW_YEARS[2007] = dict(
    confidence="secondary",
    docs=[dict(title="KUNA: Eid Al-Adha holiday starts Dec. 18, lasts for six days - Kuwait gov't",
               uri="https://www.kuna.net.kw/ArticlePrintPage.aspx?id=1867463&language=en",
               issued="2007-12-10", issued_uri=None, published="2007-12-10", published_uri=None,
               published_in="official news release (KUNA), CSC",
               dates_note="headline/date from search-engine index; page now 404 and Wayback unreachable from this sandbox")],
    days=[("01-01", NY, 0), ("02-25", NAT, 0), ("02-26", LIB, 0),
          ("12-18", ARAFAH, 0), ("12-19", ADHA, 0), ("12-20", ADHA, 0),
          ("12-21", ADHA, 0), ("12-22", REST, 0), ("12-23", REST + " (تعويض)", 0)],
    suppressed=[], working=[],
    notes="Only the Eid al-Adha block is sourced (CSC: 18-23 Dec, resume 24 Dec). Eid al-Adha 1428 in "
          "Kuwait/Saudi = Wed 19 Dec (Arafah Tue 18 Dec) - Eid date itself not verified from a Kuwaiti source. "
          "Fixed days added from the statute list; Fitr, Isra, Hijri NY, Mawlid of 2007 not found.")

KW_YEARS[2011] = dict(
    confidence="secondary", docs=[_tad(2011)],
    days=[("01-01", NY, 0), ("02-15", MAWLID, 0), ("02-25", NAT, 0), ("02-26", LIB, 0),
          ("06-29", ISRA, 0), ("08-30", FITR, 0), ("08-31", FITR, 0), ("09-01", FITR, 0),
          ("11-05", ARAFAH, 0), ("11-06", ADHA, 0), ("11-07", ADHA, 0), ("11-08", ADHA, 0),
          ("11-26", HNY, 0)],
    suppressed=[], working=[],
    notes="timeanddate only (no official KUNA/CSC item found in search indexes). Possible bridge/rest days not captured.")

KW_YEARS[2012] = dict(
    confidence="secondary", docs=[_tad(2012)],
    days=[("01-01", NY, 0), ("02-05", MAWLID, 0), ("02-25", NAT, 0), ("02-26", LIB, 0),
          ("02-27", REST + " (تعويض العيد الوطني)", 0), ("06-17", ISRA, 0),
          ("08-19", FITR, 0), ("08-20", FITR, 0), ("08-21", FITR, 0),
          ("10-25", ARAFAH, 0), ("10-26", ADHA, 0), ("10-27", ADHA, 0), ("10-28", ADHA, 0),
          ("10-29", REST + " (تعويض)", 0), ("11-15", HNY, 0)],
    suppressed=[], working=[],
    notes="timeanddate only. Mawlid 12 Rabi I 1433 = Sat 4 Feb; given Sun 5 Feb. Isra 27 Rajab 1433 = Sun 17 Jun.")

KW_YEARS[2013] = dict(
    confidence="secondary", docs=[_tad(2013)],
    days=[("01-01", NY, 0), ("01-24", MAWLID, 0), ("02-25", NAT, 0), ("02-26", LIB, 0),
          ("06-06", ISRA, 0), ("08-08", FITR, 0), ("08-09", FITR, 0), ("08-10", FITR, 0),
          ("08-11", REST + " (تعويض)", 0),
          ("10-14", ARAFAH, 0), ("10-15", ADHA, 0), ("10-16", ADHA, 0), ("10-17", ADHA, 0),
          ("11-05", HNY, 0)],
    suppressed=[], working=[],
    notes="timeanddate lists only 16-17 Oct for the Adha block; Arafah Mon 14 Oct and Eid Tue 15 Oct added "
          "from the statute (Kuwait/Saudi Eid al-Adha 1434 = 15 Oct 2013) - unverified. Weekend changed to Fri-Sat in 2007 already.")

KW_YEARS[2014] = dict(
    confidence="secondary", docs=[_tad(2014)],
    days=[("01-01", NY, 0), ("01-16", MAWLID, 0), ("02-25", NAT, 0), ("02-26", LIB, 0),
          ("05-29", ISRA, 0), ("07-28", FITR, 0), ("07-29", FITR, 0), ("07-30", FITR, 0),
          ("10-03", ARAFAH, 0), ("10-04", ADHA, 0), ("10-05", ADHA, 0), ("10-06", ADHA, 0),
          ("10-07", REST + " (تعويض)", 0), ("10-25", HNY, 0)],
    suppressed=[("01-13", MAWLID, 0), ("05-26", ISRA, 0)],
    working=[],
    notes="timeanddate only. First observed Thursday deferrals: Mawlid (Mon 13 Jan -> Thu 16 Jan), "
          "Isra (Mon 26 May -> Thu 29 May). Hijri NY 1436 = Sat 25 Oct (no compensation listed).")

KW_YEARS[2015] = dict(
    confidence="secondary",
    docs=[_tad(2015),
          dict(_kuna(2459812, "ar", "2015-09-10", "ديوان الخدمة المدنية يعلن اجازة عيد الأضحى المبارك (5 أيام: الثلاثاء 22 - السبت 26 سبتمبر)"),
               dates_note="page served without lead; content from search-engine snippet of the KUNA item")],
    days=[("01-01", NY, 0), ("02-25", NAT, 0), ("02-26", LIB, 0), ("05-16", ISRA, 0),
          ("07-17", FITR, 0), ("07-18", FITR, 0), ("07-19", FITR, 0), ("07-20", REST + " (تعويض)", 0),
          ("09-22", REST, 1), ("09-23", ARAFAH, 1), ("09-24", ADHA, 1), ("09-25", ADHA, 1), ("09-26", ADHA, 1),
          ("10-15", HNY, 0), ("12-23", MAWLID, 0)],
    suppressed=[], working=[],
    notes="Adha block primary (CSC via KUNA, resume Sun 27 Sep); Kuwait Eid al-Adha 1436 = Thu 24 Sep. "
          "Fitr 17-20 Jul from timeanddate (Eid Fri 17 Jul; tad mislabels 18 Jul as Eid day 1). "
          "Isra Sat 16 May, no compensation recorded. Hijri NY 1437 = Wed 14 Oct per Umm al-Qura; tad has Thu 15 Oct (possible Thursday move or tad error).")

KW_YEARS[2016] = dict(
    confidence="secondary",
    docs=[_tad(2016),
          _sec("GDN: Kuwait five-day Eid al-Fitr recess from July 5 (CSC president Abdulaziz Al-Zubn circular)",
               "https://www.gdnonline.com/Details/95964"),
          _kuna(2530479, "ar", "2016-09-04", "(ديوان الخدمة) الكويتي: عطلة عيد الاضحى من 11 الى 17 سبتمبر الحالي")],
    days=[("01-01", NY, 0), ("02-25", NAT, 0), ("02-26", LIB, 0), ("05-05", ISRA, 0),
          ("07-05", REST + " (30 رمضان)", 1), ("07-06", FITR, 1), ("07-07", FITR, 1), ("07-08", FITR, 1),
          ("07-09", REST + " (تعويض)", 1),
          ("09-11", ARAFAH, 2), ("09-12", ADHA, 2), ("09-13", ADHA, 2), ("09-14", ADHA, 2),
          ("09-15", REST, 2), ("09-16", REST, 2), ("09-17", REST, 2),
          ("10-03", HNY, 0), ("12-12", MAWLID, 0)],
    suppressed=[("05-04", ISRA, 0)], working=[],
    notes="Adha 11-17 Sep primary (KUNA lead, resume 18 Sep); 16-17 Sep are Fri-Sat inside the block. "
          "Fitr 5-9 Jul (resume Sun 10 Jul) from GDN quoting the CSC circular. Isra Wed 4 May -> Thu 5 May "
          "(tad). Hijri NY 1438 Sun 2 Oct per Umm al-Qura; tad gives Mon 3 Oct.")

KW_YEARS[2017] = dict(
    confidence="secondary",
    docs=[_tad(2017),
          _sec("Kuwait Times: Miraj off Apr 27 (CSC; Cabinet resolution moving midweek holidays to Thursday)",
               "https://kuwaittimes.com/miraj-off-apr-27"),
          _sec("Kuwait Times: Eid holidays (3 days if Eid falls Sunday 25 June - Sheikh Mohammed Al-Abdullah)",
               "https://kuwaittimes.com/eid-holidays-2"),
          _kuna(2630291, "ar", "2017-08-22", "(ديوان الخدمة) الكويتي: عطلة عيد الأضحى من 31 اغسطس الى 4 سبتمبر"),
          _kuna(2662500, "ar", "2017-11-28", "(ديوان الخدمة) الكويتي: الخميس المقبل (30 نوفمبر) عطلة رسمية بمناسبة المولد النبوي"),
          _sec("GDN: Kuwait National Day / Liberation Day two-day holiday Feb 25-26 (Sat-Sun)",
               "https://www.gdnonline.com/Details/181002")],
    days=[("01-01", NY, 0), ("02-25", NAT, 5), ("02-26", LIB, 5), ("04-27", ISRA, 1),
          ("06-25", FITR, 2), ("06-26", FITR, 2), ("06-27", FITR, 2),
          ("08-31", ARAFAH, 3), ("09-01", ADHA, 3), ("09-02", ADHA, 3), ("09-03", ADHA, 3),
          ("09-04", REST + " (تعويض)", 3),
          ("09-21", HNY, 0), ("11-30", MAWLID, 4)],
    suppressed=[("04-24", ISRA, 1)], working=[],
    notes="Isra Mon 24 Apr -> Thu 27 Apr (CSC). Fitr Eid Sun 25 Jun, 3 days (tad wrongly 26-28 Jun). "
          "Adha 31 Aug-4 Sep five days, resume Tue 5 Sep (KUNA lead). Hijri NY 1439: tad says Fri 22 Sep; "
          "Umm al-Qura 1 Muharram = Thu 21 Sep - recorded 21 Sep, UNVERIFIED (no CSC item found).")

KW_YEARS[2018] = dict(
    confidence="secondary",
    docs=[_tad(2018),
          _kuna(2732011, "ar", "2018-06-10", "(ديوان الخدمة) الكويتي: عطلة عيد الفطر من 15 الى 18 يونيو الحالي"),
          _kuna(2745579, "ar", "2018-09-09", "ديوان الخدمة المدنية الكويتي يعلن الثلاثاء المقبل (11 سبتمبر) عطلة رأس السنة الهجرية")],
    days=[("01-01", NY, 0), ("02-25", NAT, 0), ("02-26", LIB, 0), ("04-15", ISRA, 0),
          ("06-15", FITR, 1), ("06-16", FITR, 1), ("06-17", FITR, 1), ("06-18", REST + " (تعويض)", 1),
          ("08-19", REST, 0), ("08-20", ARAFAH, 0), ("08-21", ADHA, 0), ("08-22", ADHA, 0), ("08-23", ADHA, 0),
          ("09-11", HNY, 2), ("11-22", MAWLID, 0)],
    suppressed=[("04-13", ISRA, 0), ("11-20", MAWLID, 0)], working=[],
    notes="Fitr and Hijri NY primary (KUNA leads). Isra Fri 13 Apr -> Sun 15 Apr; Mawlid Tue 20 Nov -> Thu 22 Nov; "
          "Adha 19-23 Aug (Sun rest day + Arafah Mon) from timeanddate.")

KW_YEARS[2019] = dict(
    confidence="secondary",
    docs=[_tad(2019),
          _kuna(2799535, "en", "2019-06-03", "Kuwait announces Eid Al-Fitr falls tomorrow Tuesday"),
          _sec("GDN: Kuwait Eid al-Fitr - official hours resume Sunday June 9", "https://www.gdnonline.com/Details/542006"),
          _kuna(2811447, "ar", "2019-07-29", "الخدمة المدنية الكويتي يحدد عطلة عيد الأضحى (إذا كان ذو القعدة 29: عرفة السبت 10 أغسطس والأحد-الثلاثاء عطلة)")],
    days=[("01-01", NY, 0), ("02-24", REST, 0), ("02-25", NAT, 0), ("02-26", LIB, 0), ("04-03", ISRA, 0),
          ("06-04", FITR, 1), ("06-05", FITR, 1), ("06-06", FITR, 1),
          ("08-10", ARAFAH, 3), ("08-11", ADHA, 3), ("08-12", ADHA, 3), ("08-13", ADHA, 3),
          ("08-31", HNY, 0), ("11-09", MAWLID, 0)],
    suppressed=[], working=[],
    notes="Eid al-Fitr Tue 4 Jun (sighting, KUNA), resume Sun 9 Jun. Eid al-Adha Sun 11 Aug (Dhu al-Qa'da 29 "
          "days), resume Wed 14 Aug (CSC scenario). 24 Feb Sunday bridge, Isra Wed 3 Apr (no Thursday move), "
          "Hijri NY Sat 31 Aug, Mawlid Sat 9 Nov: timeanddate only.")

KW_YEARS[2020] = dict(
    confidence="primary",
    docs=[_cbk(2020, "1-2 Jan (resume 5 Jan); 25-27 Feb; Adha 30 Jul-3 Aug; Hijri NY 20 Aug; Mawlid 29 Oct"),
          _kuna(2860515, "ar", "2020-02-17", "(الخدمة المدنية) الكويتي: عطلة الاعياد الوطنية 3 ايام (25-26 عطلة رسمية و27 لوقوعه بين عطلتين)"),
          _kuna(2909920, "ar", "2020-07-21", "(الخدمة المدنية) الكويتي: عطلة عيد الأضحى من 30 يوليو الى 3 أغسطس"),
          _kuna(2916280, "ar", "2020-08-18", "(الخدمة المدنية) الكويتي: عطلة رأس السنة الهجرية الخميس المقبل (20 أغسطس)"),
          _tad(2020)],
    days=[("01-01", NY, 0), ("01-02", REST, 0), ("02-25", NAT, 1), ("02-26", LIB, 1), ("02-27", REST, 1),
          ("03-22", ISRA, 4),
          ("05-24", FITR, 4), ("05-25", FITR, 4), ("05-26", FITR, 4),
          ("07-30", ARAFAH, 2), ("07-31", ADHA, 2), ("08-01", ADHA, 2), ("08-02", ADHA, 2), ("08-03", REST + " (تعويض)", 2),
          ("08-20", HNY, 3), ("10-29", MAWLID, 0)],
    suppressed=[], working=[],
    notes="Isra (Sun 22 Mar) and Eid al-Fitr (Sun 24 May) fell inside the COVID-19 government shutdown "
          "(12 Mar - end May 2020); dates from timeanddate, no separate decision found. Mourning for Sultan "
          "Qaboos 11-13 Jan in KW_ADHOC.")

KW_YEARS[2021] = dict(
    confidence="primary",
    docs=[_cbk(2021, "Sun 3 Jan; 25-28 Feb; Isra 11 Mar; Fitr 12-16 May; Adha from 19 Jul (resume 25 Jul); Hijri NY 8-9 Aug; Mawlid 21 Oct; Sun 2 Jan 2022"),
          _kuna(2962132, "ar", "2021-03-02", "(الخدمة المدنية): الخميس 11 مارس الجاري عطلة رسمية بمناسبة الإسراء والمعراج"),
          _kuna(2974971, "ar", "2021-05-04", "(الخدمة المدنية) الكويتي: عطلة عيد الفطر من 12 إلى 16 مايو (تعميم 7/2021)"),
          _kuna(2988303, "en", "2021-07-12", "Kuwait gov't: Holiday on July 18-22 for Eid Al-Adha, Arafat Day", by="CoM"),
          _kuna(2990902, "ar", "2021-08-03", "ديوان الخدمة المدنية: تعطيل العمل الأحد (يوم راحة) والاثنين (عطلة رسمية) بمناسبة رأس السنة الهجرية"),
          _kuna(3001029, "en", "2021-10-05", "CSC sets Oct 21st as holiday for Prophet's Birthday"),
          _kuna(2959892, "en", "2021-02-16", "Kuwait's public sector shuts down on national days -- civil commission")],
    days=[("01-01", NY, 0), ("01-03", REST + " (تعويض)", 0),
          ("02-25", NAT, 6), ("02-26", LIB, 6), ("02-28", REST + " (تعويض)", 0),
          ("03-11", ISRA, 1),
          ("05-12", REST + " (30 رمضان)", 2), ("05-13", FITR, 2), ("05-14", FITR, 2), ("05-15", FITR, 2),
          ("05-16", REST + " (تعويض)", 2),
          ("07-18", REST, 3), ("07-19", ARAFAH, 3), ("07-20", ADHA, 3), ("07-21", ADHA, 3), ("07-22", ADHA, 3),
          ("08-08", REST, 4), ("08-09", HNY, 4), ("10-21", MAWLID, 5)],
    suppressed=[("10-19", MAWLID, 5)], working=[],
    notes="CoM: Adha Sun 18-Thu 22 Jul (CBK closed only from 19 Jul). Mawlid (12 Rabi I 1443 = Tue 19 Oct) moved to Thu 21 Oct.")

KW_YEARS[2022] = dict(
    confidence="primary",
    docs=[_cbk(2022, "Sun 2 Jan; 27 Feb-1 Mar; Fitr 1-4 May; Adha 10 Jul-; Hijri NY 31 Jul; election 29 Sep; Mawlid 9 Oct; Sun 1 Jan 2023"),
          _kuna(3024194, "en", "2022-01-31", "Cabinet declares period from Feb. 27 to March 3 public holiday", by="CoM"),
          _kuna(3035238, "ar", "2022-04-14", "(الخدمة المدنية): عطلة عيد الفطر السعيد من 1 إلى 5 مايو واستئناف الدوام الأحد 8 مايو"),
          _sec("Gulf News: 9-day holiday in Kuwait to mark Eid Al Adha (Kuna: closed Sun 10 - Thu 14 July, resume 17 July)",
               "https://gulfnews.com/world/gulf/kuwait/9-day-holiday-in-kuwait-to-mark-eid-al-adha-1.88576541"),
          _kuna(3046744, "ar", "2022-07-21", "(الخدمة المدنية): الاحد 31 الجاري يوم راحة والسبت 30 عطلة رسمية بمناسبة رأس السنة الهجرية"),
          _kuna(3055718, "en", "2022-09-28", "Oct. 9 public holiday for Prophet's Birthday")],
    days=[("01-01", NY, 0), ("01-02", REST + " (تعويض)", 0),
          ("02-25", NAT, 1), ("02-26", LIB, 1), ("02-27", REST, 1), ("02-28", REST, 1),
          ("03-01", ISRA, 1), ("03-02", REST, 1), ("03-03", REST, 1),
          ("05-01", REST + " (30 رمضان)", 2), ("05-02", FITR, 2), ("05-03", FITR, 2), ("05-04", FITR, 2),
          ("05-05", REST, 2),
          ("07-08", ARAFAH, 3), ("07-09", ADHA, 3), ("07-10", ADHA, 3), ("07-11", ADHA, 3),
          ("07-12", REST, 3), ("07-13", REST, 3), ("07-14", REST, 3),
          ("07-30", HNY, 4), ("07-31", REST + " (تعويض)", 4), ("10-09", MAWLID, 5)],
    suppressed=[("10-08", MAWLID, 5)], working=[],
    notes="CoM (31 Jan) declared 27 Feb-3 Mar; CBK closed only 27 Feb-1 Mar (resumed 2 Mar) - decree wins, "
          "disagreement noted. CBK's 2022 Adha item says 'resume Thursday 14 July' (likely CBK-specific). "
          "Mawlid 12 Rabi I 1444 = Sat 8 Oct -> Sun 9 Oct. Election day 29 Sep and UAE mourning in KW_ADHOC.")

KW_YEARS[2023] = dict(
    confidence="primary",
    docs=[_kuna(3072193, "en", "2022-12-11", "Kuwait Civil Service Commission announces Sun. (Jan 1st) official holiday"),
          _kuna(3077834, "en", "2023-01-16", "Kuwait sets Feb 19, 26, 27 as public holidays for Al-Israa wal Miraj, national day festivities"),
          _kuna(3087366, "ar", "2023-04-12", "ديوان الخدمة المدنية: عطلة عيد الفطر السعيد من 21 إلى 25 أبريل"),
          _kuna(3099326, "ar", "2023-06-07", "(الخدمة المدنية): عطلة يوم عرفة وعيد الأضحى المبارك من 27 الجاري حتى 2 يوليو"),
          _sec("Gulf News / CBK: Hijri NY Wed 19 Jul holiday, Thu 20 Jul rest day (CoM)",
               "https://www.cbk.gov.kw/en/cbk-news/announcements-and-press-releases/announcements/2023/07/202307180800-the-central-bank-of-kuwait-will-be-closed-to-the-public-for-the-new-hijri-year"),
          _kuna(3108808, "en", "2023-09-11", "Kuwaiti gov't: Sept 28 holiday marking anniv. of Prophet's birth", by="CoM"),
          _kuna(3123471, "en", "2023-11-20", "Kuwait sets Dec 31, Jan First as New Year's holiday - cabinet", by="CoM"),
          _cbk(2023, "19 Feb; 26-27 Feb; Fitr 23-25 Apr; election 6 Jun; Adha 27 Jun-2 Jul; Hijri NY 19-20 Jul; Mawlid 28 Sep; 31 Dec-1 Jan")],
    days=[("01-01", NY, 0), ("02-18", ISRA, 1), ("02-19", REST + " (بدل الإسراء والمعراج)", 1),
          ("02-25", NAT, 1), ("02-26", LIB, 1), ("02-27", REST + " (تعويض)", 1),
          ("04-21", FITR, 2), ("04-22", FITR, 2), ("04-23", FITR, 2), ("04-24", REST, 2), ("04-25", REST, 2),
          ("06-27", ARAFAH, 3), ("06-28", ADHA, 3), ("06-29", ADHA, 3), ("06-30", ADHA, 3),
          ("07-01", REST, 3), ("07-02", REST, 3),
          ("07-19", HNY, 4), ("07-20", REST, 4), ("09-28", MAWLID, 5),
          ("12-31", REST + " (رأس السنة الميلادية)", 6)],
    suppressed=[("09-27", MAWLID, 5)], working=[],
    notes="Isra fell Sat 18 Feb; Sun 19 Feb given as rest day. Mawlid 12 Rabi I 1445 = Wed 27 Sep -> Thu 28 Sep. "
          "Election 6 Jun and Amir Nawaf mourning 17-19 Dec in KW_ADHOC.")

KW_YEARS[2024] = dict(
    confidence="primary",
    docs=[_kuna(3123471, "en", "2023-11-20", "Kuwait sets Dec 31, Jan First as New Year's holiday - cabinet", by="CoM"),
          _kuna(3132054, "ar", "2024-01-15", "(الخدمة المدنية): الخميس 8 فبراير المقبل عطلة رسمية بمناسبة ذكرى الإسراء والمعراج"),
          _kuna(3135517, "en", "2024-02-04", "CSC: Feb 25-26 national holidays in Kuwait"),
          _kuna(3143907, "en", "2024-04-02", "Kuwait's CSC: Eid Al-Fitr holiday on April 9-13"),
          _kuna(3159905, "en", "2024-06-12", "Kuwait celebrates Adha holiday from June 16 (to 18; 15 June Arafat)"),
          _kuna(3163757, "ar", "2024-07-03", "ديوان الخدمة المدنية: الأحد المقبل (7 يوليو) عطلة رسمية بمناسبة رأس السنة الهجرية 1446"),
          _kuna(3176867, "en", "2024-08-27", "Kuwait Cabinet: Sept. 15 public holiday for Prophet's Birthday", by="CoM"),
          _cbk(2024, "8 Feb; 25-26 Feb; election 4 Apr; Fitr 9-13 Apr; Adha 16-18 Jun; Hijri NY 7 Jul; Mawlid 15 Sep; GCC summit 1 Dec; 1-2 Jan 2025")],
    days=[("01-01", NY, 0), ("02-08", ISRA, 1), ("02-25", NAT, 2), ("02-26", LIB, 2),
          ("04-09", REST + " (30 رمضان)", 3), ("04-10", FITR, 3), ("04-11", FITR, 3), ("04-12", FITR, 3),
          ("04-13", REST, 3),
          ("06-15", ARAFAH, 4), ("06-16", ADHA, 4), ("06-17", ADHA, 4), ("06-18", ADHA, 4),
          ("07-07", HNY, 5), ("09-15", MAWLID, 6)],
    suppressed=[], working=[],
    notes="CSC: first three Eid al-Fitr days are official holidays, the others rest days. Election 4 Apr and "
          "GCC summit 1 Dec in KW_ADHOC.")

KW_YEARS[2025] = dict(
    confidence="primary",
    docs=[_kuna(3207519, "en", "2024-12-04", "Kuwait declares two days off at gov't institutions on New Year (Jan 1-2, 2025)", by="CoM"),
          _kuna(3214579, "en", "2025-01-14", "Kuwait Cabinet: Jan 30 public holiday for Israa", by="CoM"),
          _cbk(2025, "30 Jan; 25-27 Feb; Fitr 30 Mar-1 Apr; Adha 5-9 Jun; Hijri NY 26 Jun; Mawlid 4 Sep; 1 Jan 2026"),
          _kuna(3222580, "en", "2025-03-13", "Kuwait cabinet decides Eid Al-Fitr holiday (3 days if Eid Sun 30 Mar)", by="CoM"),
          _kuna(3228216, "en", "2025-04-29", "Kuwait Cabinet declares June 5-9 as Eid Al-Adha holiday", by="CoM"),
          _kuna(3236698, "ar", "2025-06-17", "مجلس الوزراء الكويتي يعلن يوم الخميس 26 يونيو عطلة رسمية بمناسبة رأس السنة الهجرية", by="CoM"),
          _kuna(3244239, "en", "2025-08-12", "Kuwait Cabinet: September 4th holiday on occasion of Prophet's Birthday", by="CoM")],
    days=[("01-01", NY, 0), ("01-02", REST, 0), ("01-30", ISRA, 1),
          ("02-25", NAT, 2), ("02-26", LIB, 2), ("02-27", REST, 2),
          ("03-30", FITR, 3), ("03-31", FITR, 3), ("04-01", FITR, 3),
          ("06-05", ARAFAH, 4), ("06-06", ADHA, 4), ("06-07", ADHA, 4), ("06-08", ADHA, 4), ("06-09", REST, 4),
          ("06-26", HNY, 5), ("09-04", MAWLID, 6)],
    suppressed=[("01-27", ISRA, 1)], working=[],
    notes="Isra (Mon 27 Jan) deferred to Thu 30 Jan. 27 Feb is a CBK closure; the CSC national-days "
          "announcement for 2025 was not retrieved - 27 Feb treated as bridge rest day on CBK evidence. "
          "Eid al-Fitr fell Sun 30 Mar (3-day scenario). CSC: 5-8 Jun official, 9 Jun rest day.")

KW_YEARS[2026] = dict(
    confidence="primary",
    docs=[_kuna(3267511, "en", "2025-12-26", "CSC declares holiday on Thursday for New Year's Day"),
          _kuna(3269472, "ar", "2026-01-05", "(الخدمة المدنية): الأحد 18 الجاري عطلة رسمية بمناسبة ذكرى الإسراء والمعراج لعام 1447هـ"),
          _kuna(3275289, "ar", "2026-02-17", "(الخدمة المدنية): يومي الاربعاء والخميس 25 و26 عطلة رسمية بمناسبة العيد الوطني ويوم التحرير"),
          _sec("Arab Times 2026-03-11: Cabinet Eid al-Fitr schedule (30-day Ramadan: Thu 19 - Mon 23 Mar, resume 24 Mar)",
               "https://www.arabtimesonline.com/news/eid-al-fitr-holiday-officially-set-in-kuwait", "2026-03-11"),
          _sec("Al-Rai / KUNA: Kuwaiti sighting authority - Thursday completes Ramadan, Friday 20 Mar Eid al-Fitr",
               "https://www.alraimedia.com/ampArticle/1759829"),
          _sec("Arab Times 2026-05-20 (citing KUNA): Arafat + Eid al-Adha Tue 26 - Sun 31 May, resume 1 Jun",
               "https://www.arabtimesonline.com/news/government-offices-in-kuwait-shut-for-eid/", "2026-05-20"),
          _cbk(2026, "18 Jan; 25-26 Feb; Fitr 19-23 Mar (30-day case); Adha 26 May-; Hijri NY 16 Jun (29-day case); Mawlid 27 Aug"),
          _sec("Arab Times 2026-06-15: Muharram crescent sighted, Tue 16 Jun = 1 Muharram 1448",
               "https://www.arabtimesonline.com/news/16th-june-marks-start-of-islamic-new-year-in-kuwait/", "2026-06-15")],
    days=[("01-01", NY, 0), ("01-18", ISRA, 1), ("02-25", NAT, 2), ("02-26", LIB, 2),
          ("03-19", REST + " (30 رمضان)", 3), ("03-20", FITR, 4), ("03-21", FITR, 4), ("03-22", FITR, 4),
          ("03-23", REST, 3),
          ("05-26", ARAFAH, 5), ("05-27", ADHA, 5), ("05-28", ADHA, 5), ("05-29", ADHA, 5),
          ("05-30", REST, 5), ("05-31", REST, 5),
          ("06-16", HNY, 7), ("08-27", MAWLID, 6)],
    suppressed=[("01-16", ISRA, 1)], working=[],
    notes="Isra 27 Rajab 1447 = Fri 16 Jan -> Sun 18 Jan (KUNA English body says 'February 18', headline Jan 18 - "
          "typo). Fitr/Adha/Hijri NY decisions were conditional; finals from sighting reports + CBK. Mawlid "
          "(12 Rabi I 1448 = Wed 26 Aug) given Thu 27 Aug (CBK; Gulf News: 'three-day break', resume Sun 30 Aug).")

KW_ADHOC = [
    ("2020-01-11", "Official mourning for Sultan Qaboos of Oman, govt closed 11-13 Jan (3 days)", _TAD.format(2020), "issued 2020-01-11 (not verified)", "Amiri Diwan / CoM (per timeanddate)"),
    ("2020-01-12", "Mourning for Sultan Qaboos (day 2)", _TAD.format(2020), "", "CoM"),
    ("2020-01-13", "Mourning for Sultan Qaboos (day 3)", _TAD.format(2020), "", "CoM"),
    ("2020-03-12", "COVID-19: government work suspended 12 Mar - 28 May 2020 (extended repeatedly)", _TAD.format(2020), "issued 2020-03-09..", "Council of Ministers"),
    ("2022-05-15", "Mourning for UAE President Sheikh Khalifa: govt work suspended 3 days from 13 May (13-14 May are Fri-Sat)", _K.format(3038605, "ar"), "issued 2022-05-13", "Civil Service Commission"),
    ("2022-09-29", "National Assembly election day", _CBK.format(2022), "", "CoM / CSC"),
    ("2023-06-06", "National Assembly election day", _CBK.format(2023), "", "CoM / CSC"),
    ("2023-12-17", "Mourning for Amir Sheikh Nawaf: govt closed 17-19 Dec", _TAD.format(2023), "issued 2023-12-16", "Amiri Diwan / CoM"),
    ("2023-12-18", "Mourning for Amir Sheikh Nawaf (day 2)", _TAD.format(2023), "", "Amiri Diwan / CoM"),
    ("2023-12-19", "Mourning for Amir Sheikh Nawaf (day 3)", _TAD.format(2023), "", "Amiri Diwan / CoM"),
    ("2024-04-04", "National Assembly election day", _CBK.format(2024), "", "CoM / CSC"),
    ("2024-12-01", "45th GCC summit hosted in Kuwait", _K.format(3195018, "ar"), "issued 2024-11-05", "Civil Service Commission"),
]

KW_FINDINGS = """\
ISSUE #44 item 6 (Kuwait):
* 1 May is NOT a Kuwaiti public holiday. Law 6/2010 (private sector) art. 68 lists exactly 13 paid days:
  Hijri New Year 1, Isra wal Mi'raj 1, Eid al-Fitr 3, Waqfat Arafah 1, Eid al-Adha 3, Mawlid 1,
  National Day 25 Feb 1, Liberation Day 26 Feb 1, Gregorian New Year 1 (text read from the PAM
  manpower.gov.kw page, cached as law-6-2010-labour-ar-alkarama.pdf). No CoM/CSC holiday decision
  2015-2026 (KUNA, CBK) ever closes government offices on 1 May. Remove 05-01 from the starter.
* Isra wal Mi'raj and Arafah ARE official holidays (art. 68 b and d; CSC/CoM declare them every year:
  e.g. KUNA 3214579 Isra 2025-01-30, KUNA 3159905 Arafah 2024-06-15). Add both.
* Eid al-Fitr = 3 days, Eid al-Adha = 3 days + Arafah (starter has Fitr 2 days -> wrong).

How the government calendar really works: the list is fixed (13 occasions) but the DAYS are set by a
Council of Ministers decision + CSC circular for each occasion:
* CoM decision 252/2008 (3 Mar 2008): 30 Ramadan is a rest day unless it is Eid day 1 (2016, 2021,
  2022, 2024, 2026 show this).
* CoM resolution (number/date not found): Isra / Mawlid falling midweek -> following Thursday;
  on Fri/Sat -> Sunday. Seen 2014, 2016-2018, 2021-2026; not in 2019 (Isra Wed 3 Apr per tad).
* Bridges / compensations ("يوم راحة") are granted ad hoc: e.g. 2019-02-24, 2020-02-27, 2022-02-27..03-03,
  2023-02-27, 2023-07-20, 2025-01-02, 2025-02-27, 2025-06-09, 2026-05-31.
* "Entities with a special nature" (oil, health, security...) set their own schedules.

Sources and confidence:
* 2020-2026 primary: KUNA leads (cached; KUNA's new site server-renders only title + lead, the body is
  client-side and its API was not used) + Central Bank of Kuwait "Holiday" announcements (complete
  for 2020-2026, cached per year) - a government institution whose closures mirror the CoM decisions.
  Conditional decisions (Fitr 2025/2026, HNY 2026) resolved with the moon-sighting result (secondary).
* 2015-2019 secondary overall, with primary KUNA items for some occasions (2015 Adha, 2016 Adha,
  2017 Adha/Mawlid, 2018 Fitr/HNY, 2019 Fitr/Adha); rest from timeanddate.
* 2011-2014 secondary only (timeanddate).  2007: only Eid al-Adha (KUNA headline).
* 2000-2006, 2008-2010 MISSING: KUNA archive not indexed by the search engine for those years,
  Wayback Machine unreachable from the sandbox (web.archive.org blocked both via curl and WebFetch),
  csc.gov.kw is an Oracle WebCenter portal with no reachable archive. Use the KW_ISLAMIC / KW_FIXED
  rules (tabular/Umm al-Qura estimates) for those years.

Disagreements:
* timeanddate vs announcements: 2017 Fitr (tad 26-28 Jun, CSC/Kuwait Times Eid Sun 25 Jun, 3 days);
  2015 Adha (tad 25-27 Sep, CSC 22-26 Sep); 2013 Adha incomplete in tad. Announcement wins.
* CoM 2022 national/Isra block 27 Feb-3 Mar vs CBK closure 27 Feb-1 Mar: CoM recorded.
* python-holidays 0.109 KW has no per-year data at all (every Islamic date "estimated", no bridges,
  no Thursday moves); it agrees on the list (no 1 May, has Isra and Arafah).
* KUNA 3269476 (EN, 2026-01-05) body says "February 18"; headline and Arabic item say Sun 18 Jan.
* 2017 Hijri NY: tad Fri 22 Sep vs Umm al-Qura Thu 21 Sep - unverified, 21 Sep recorded.
"""
