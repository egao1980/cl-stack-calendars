"""Egypt (EG) public holidays 2000-2027: research for egao1980/cl-stack-calendars#44.

Scope: official holidays of government employees (ministries, government
departments, public bodies, local administration units, public-sector and
public-business-sector companies), i.e. the days closed by Prime Minister
decree.  Private-sector days (Labour Minister decisions) are noted only.

Cache: ~/.cache/cl-stack-calendars/eg/
  manshurat-*.pdf / manshurat-pdf/node-<n>.pdf  gazette scans (Al-Jarida al-Rasmiya,
                                                Al-Waqa'i al-Misriya) via manshurat.org
  manshurat-nodes/node-<n>.html                 manshurat metadata pages
  cabinet-news/news-<id>.html                   cabinet.gov.eg news (official releases)
  cabinet-search-index.json                     cabinet title-search index
  presidency-holidays-ar-20250614.html          presidency.eg 2025 list (Wayback)
  pre2014/, y2014-2017/                         youm7 search + articles (secondary)
Only stdlib; importable on its own.
"""

import datetime as _dt

# ---------------------------------------------------------------- names
XMAS = "عيد الميلاد المجيد"
POLICE = "عيد الشرطة"
JAN25 = "عيد ثورة 25 يناير وعيد الشرطة"
SHAM = "عيد شم النسيم"
SINAI = "عيد تحرير سيناء"
LABOUR = "عيد العمال"
JUN30 = "ذكرى ثورة 30 يونيو"
JUL23 = "عيد ثورة 23 يوليو"
OCT6 = "عيد القوات المسلحة"
HNY = "رأس السنة الهجرية"
MAWLID = "المولد النبوي الشريف"
FITR_EVE = "وقفة عيد الفطر"
FITR = "عيد الفطر المبارك"
FITR_EXT = "عطلة عيد الفطر (يوم إضافي)"
ARAFAH = "وقفة عيد الأضحى (يوم عرفة)"
ADHA = "عيد الأضحى المبارك"
ADHA_EXT = "عطلة عيد الأضحى (يوم إضافي)"

MANS = "https://manshurat.org/node/"
CAB = "https://www.cabinet.gov.eg/News/Details/"
Y7 = "https://www.youm7.com/story/"
CAB_REL = "official news release (Cabinet of Egypt, cabinet.gov.eg)"
CAB_NOTE = ("decree date not printed in the release; issued/published = date of the "
            "cabinet release, which announces the decree the same day")
Y7_NOTE = "newspaper report (youm7); decree text, number and gazette issue not found"


def moved(name, mmdd):
    return f"{name} (moved from {mmdd})"


def _d(title, uri, issued, published=None, published_in=None, dates_note=None,
       issued_uri=None, published_uri=None):
    return dict(title=title, uri=uri, issued=issued, issued_uri=issued_uri or uri,
                published=published if published is not None else issued,
                published_uri=published_uri or uri,
                published_in=published_in, dates_note=dates_note)


def _cab(title, nid, date):
    return _d(title, CAB + str(nid), date, date, CAB_REL, CAB_NOTE)


def _gaz(title, node, issued, gazette, published=None):
    return _d(title, MANS + str(node), issued, published or issued, gazette, None)


def _y7(title, path, date):
    return _d(title, Y7 + path, date, date, "newspaper (youm7), secondary", Y7_NOTE)


def _block(kind, start, end, eid1, doc, extra=None):
    """Rows for an Eid block decreed from start..end (MM-DD strings within one year).
    kind 'fitr': eid1-1 = eve, eid1..eid1+2 = Eid, rest = extension.
    kind 'adha': eid1-1 = Arafah, eid1..eid1+3 = Eid, rest = extension.
    extra: {MM-DD: fixed-holiday name} also falling inside the block."""
    y = 2000
    p = lambda s: _dt.date(y, int(s[:2]), int(s[3:]))
    s, e, f = p(start), p(end), p(eid1)
    ndays = 3 if kind == "fitr" else 4
    rows = []
    d = s
    while d <= e:
        k = (d - f).days
        if k == -1:
            n = FITR_EVE if kind == "fitr" else ARAFAH
        elif 0 <= k < ndays:
            n = FITR if kind == "fitr" else ADHA
        else:
            n = FITR_EXT if kind == "fitr" else ADHA_EXT
        mmdd = d.strftime("%m-%d")
        if extra and mmdd in extra:
            n = n + "؛ " + extra[mmdd]
        rows.append((mmdd, n, doc))
        d += _dt.timedelta(days=1)
    return rows


# ------------------------------------------------------------- statutes
EG_STATUTES = [
    dict(key="pres-1958-eid", title="قرار رئيس الجمهورية العربية المتحدة بتعطيل وزارات ومصالح الحكومة يوم الوقفة وأيام عيد الفطر الثلاثة وفي يوم الوقفة وأيام عيد الأضحى الأربعة",
         uri=MANS + "61499", issued="1958-04-23", issued_uri=MANS + "61499",
         published="1958-05-01", published_uri=MANS + "61499",
         published_in="Official Gazette (date per manshurat metadata; issue number not seen)",
         in_force=None, dates_note=None,
         summary="Government closed on the eve + 3 days of Eid al-Fitr and on Arafah + 4 days of Eid al-Adha. "
                 "Metadata only (PDF not read). Practice 2008-2017 matches this pattern (Fitr 4 days, Adha 5 days)."),
    dict(key="pres-14-1962", title="قرار رئيس الجمهورية رقم 14 لسنة 1962 بشأن الأعياد والمواسم التى تحتفل بها الجمهورية العربية المتحدة",
         uri=MANS + "59195", issued="1962-01-01", issued_uri=MANS + "59195",
         published="1962-01-09", published_uri=MANS + "59195",
         published_in="Official Gazette 1962-01-09 (per manshurat; issue not seen)", in_force=None, dates_note=None,
         summary="Feasts and seasons list of the UAR; amended by presidential decrees 225/1973 (1973-03-06) and "
                 "1540/1974 (1974-09-26, after the October War: adds 6 October). Scan cached, not transcribed (pre-2000)."),
    dict(key="pm-382-1982", title="قرار رئيس مجلس الوزراء رقم 382 لسنة 1982 فى شأن الأعياد التى تعطل فيها وزارات ومصالح الحكومة ووحدات القطاع العام",
         uri=MANS + "4786", issued=None, issued_uri=None, published=None, published_uri=None,
         published_in=None, in_force=None,
         dates_note="text not found; known only as a recital in PM decree 1355/2011 (gazette scan cached)",
         summary="Government holiday list (1982). Superseded/relabelled by 454/1987 (which 2017-2018 decrees cite)."),
    dict(key="pm-454-1987", title="قرار رئيس مجلس الوزراء رقم 454 لسنة 1987 بشأن تحديد الاحتفالات والأعياد التى يحتفل بها كل عام بجمهورية مصر العربية",
         uri=MANS + "44922", issued=None, issued_uri=None, published=None, published_uri=None,
         published_in=None, in_force=None,
         dates_note="text not found online; cited as the list in force by PM decrees 1427/2017, 1881/2017, 1151/2018 "
                    "and repealed by art. 4 of PM decree 1193/2018 (scan cached)",
         summary="Government holiday list in force until 2018-07-02: Islamic New Year, Mawlid, Eid al-Fitr, "
                 "Arafah + Eid al-Adha, Sham el-Nessim, 25 April, 1 May, 23 July, 6 October (content inferred from "
                 "1193/2018 and practice; Eid day counts were set each year by decree)."),
    dict(key="pm-837-1991", title="قرار رئيس مجلس الوزراء رقم 837 لسنة 1991 بشأن الاحتفال بعيد الجلاء 18 يونيو",
         uri=MANS + "44922", issued=None, issued_uri=None, published=None, published_uri=None, published_in=None,
         in_force=None, dates_note="cited in PM decree 1193/2018 recitals only",
         summary="Evacuation Day 18 June: celebrated; schools and universities only (confirmed by 1193/2018 art. 2)."),
    dict(key="pm-2052-2002", title="قرار رئيس مجلس الوزراء رقم 2052 لسنة 2002 بشأن اعتبار يوم 7 يناير من كل عام إجازة مدفوعة الأجر بمناسبة عيد الميلاد المجيد",
         uri=MANS + "44922", issued=None, issued_uri=None, published=None, published_uri=None, published_in=None,
         in_force=None,
         dates_note="text not found; cited in PM decree 1193/2018 recitals. Announced by President Mubarak in Dec 2002 "
                    "(secondary: CSW 2002-12-19); first observed 2003-01-07. Each year a PM decree still names the day.",
         summary="7 January (Coptic Christmas) paid holiday every year, from 2003."),
    dict(key="law-12-2003", title="قانون العمل الصادر بالقانون رقم 12 لسنة 2003 (المادة 52)",
         uri=MANS + "12120", issued="2003-04-07", issued_uri=None, published="2003-04-07", published_uri=None,
         published_in="Official Gazette no. 14 bis, 2003-04-07 (from general knowledge; not re-read)",
         in_force=None, dates_note=None,
         summary="Art. 52: private-sector workers get paid leave on feast days fixed by the Manpower Minister "
                 "(max 13 days/year). Private sector only."),
    dict(key="min-112-2003", title="قرار وزير القوى العاملة والهجرة رقم 112 لسنة 2003 بشأن تحديد أيام الأعياد التى تعتبر إجازة بأجر كامل للعمال",
         uri=MANS + "12120", issued="2003-06-30", issued_uri=MANS + "12120",
         published="2003-07-19", published_uri=MANS + "12120",
         published_in="الوقائع المصرية العدد 161 فى 19 يولية 2003", in_force="2003-07-20", dates_note=None,
         summary="Private sector: 1 Muharram, 12 Rabi I, 1-2 Shawwal, 9-11 Dhu al-Hijja, 7 Jan, Sham el-Nessim, "
                 "25 Apr, 1 May, 23 Jul, 6 Oct (gazette scan read)."),
    dict(key="pm-387-2009", title="قرار رئيس مجلس الوزراء رقم 387 لسنة 2009 باعتبار يوم 25 يناير إجازة مدفوعة الأجر بمناسبة عيد الشرطة",
         uri=MANS + "4786", issued=None, issued_uri=None, published=None, published_uri=None, published_in=None,
         in_force=None,
         dates_note="text not found; cited (and repealed) by PM decree 1355/2011 and by minister decision 49/2009 "
                    "of 2009-02-10, so issued before 2009-02-10 -> first observed 2010-01-25",
         summary="25 January Police Day paid holiday (from 2010)."),
    dict(key="min-49-2009", title="قرار وزيرة القوى العاملة والهجرة رقم 49 لسنة 2009 بشأن تحديد أيام الأعياد التى تعتبر إجازة بأجر كامل للعمال",
         uri=MANS + "12184", issued="2009-02-10", issued_uri=MANS + "12184",
         published="2009-02-16", published_uri=MANS + "12184",
         published_in="الوقائع المصرية العدد 39 فى 16 فبراير 2009", in_force="2009-02-17", dates_note=None,
         summary="Private sector: adds 25 January (Police Day) to the 112/2003 list (gazette scan read)."),
    dict(key="pm-720-2009", title="قرار رئيس مجلس الوزراء رقم 720 لسنة 2009 بشأن الاحتفال بعيد تحرير طابا",
         uri=MANS + "44922", issued=None, issued_uri=None, published=None, published_uri=None, published_in=None,
         in_force=None, dates_note="cited in PM decree 1193/2018 recitals only",
         summary="Taba Liberation Day 19 March: schools and universities only."),
    dict(key="pm-1355-2011", title="قرار رئيس مجلس الوزراء رقم 1355 لسنة 2011 باعتبار يوم 25 يناير من كل عام إجازة مدفوعة الأجر بمناسبة (عيد ثورة 25 يناير - عيد الشرطة)",
         uri=MANS + "4786", issued="2011-10-25", issued_uri=MANS + "4786",
         published="2011-11-03", published_uri=MANS + "4786",
         published_in="الجريدة الرسمية العدد 44 فى 3 نوفمبر 2011", in_force=None, dates_note=None,
         summary="25 January every year paid holiday as 'January 25 Revolution - Police Day' for government, public, "
                 "business and private sectors; repeals 387/2009 (gazette scan read). From 2012."),
    dict(key="scaf-41-2012", title="قرار المجلس الأعلى للقوات المسلحة رقم 41 لسنة 2012 بشأن الاحتفال بعيد ثورة 25 يناير وعيد الشرطة كل عام",
         uri=MANS + "44922", issued=None, issued_uri=None, published=None, published_uri=None, published_in=None,
         in_force=None, dates_note="cited in PM decree 1193/2018 recitals only",
         summary="Annual celebration of 25 January Revolution and Police Day."),
    dict(key="law-81-2016", title="قانون الخدمة المدنية الصادر بالقانون رقم 81 لسنة 2016",
         uri=MANS + "44922", issued="2016-11-01", issued_uri=None, published="2016-11-01", published_uri=None,
         published_in="Official Gazette no. 43 bis (a), 2016-11-01 (general knowledge; not re-read)", in_force=None,
         dates_note=None,
         summary="Civil service law; civil servants are on paid leave on official holidays fixed by PM decree."),
    dict(key="pm-1193-2018", title="قرار رئيس مجلس الوزراء رقم 1193 لسنة 2018 (تحديد الأعياد والمناسبات الرسمية التى يحتفل بها وتعطل فيها الوزارات والمصالح والهيئات العامة)",
         uri=MANS + "44922", issued="2018-07-02", issued_uri=MANS + "44922",
         published="2018-07-02", published_uri=MANS + "44922",
         published_in="الجريدة الرسمية العدد 26 (مكرر) فى 2 يولية 2018", in_force="2018-07-03", dates_note=None,
         summary="Art. 1 list (government closed): 1 Islamic New Year; 2 Mawlid; 3 eve of Eid al-Fitr + 3 Eid days; "
                 "4 Arafah + 4 Eid al-Adha days; 5 Christmas 7 Jan; 6 25 January Revolution & Police Day; "
                 "7 Sham el-Nessim; 8 Sinai 25 Apr; 9 Labour 1 May; 10 30 June Revolution; 11 23 July Revolution; "
                 "12 Armed Forces 6 Oct. Public-sector companies: only Fitr days 1-2 and Arafah + Adha days 1-2. "
                 "Art. 2 celebrated without closure: Taba 19 Mar and Evacuation 18 Jun (schools/universities closed), "
                 "Suez 24 Oct, Port Said Victory 23 Dec (local, after hours), Wafaa el-Nil. Art. 3 private sector per "
                 "Labour Law art. 52. Art. 4 repeals 454/1987 (gazette scan read)."),
    dict(key="pm-1249-2020", title="قرار رئيس مجلس الوزراء رقم 1249 لسنة 2020 بتعديل بعض أحكام القرار رقم 1193 لسنة 2018",
         uri=MANS + "66981", issued="2020-06-28", issued_uri=MANS + "66981",
         published="2020-06-28", published_uri=MANS + "66981",
         published_in="الجريدة الرسمية العدد 26 (مكرر) فى 28 يونية 2020", in_force="2020-06-28", dates_note=None,
         summary="Adds to art. 1: the PM may, in cases he judges, substitute another day at the beginning or the end "
                 "of the working week for any listed holiday. Legal basis of the 'move to Thursday (or Sunday)' "
                 "decrees from 2020 (gazette scan read)."),
    dict(key="law-14-2025", title="قانون العمل الصادر بالقانون رقم 14 لسنة 2025 (المادة 129) وقرار وزير العمل رقم 294 لسنة 2025",
         uri="https://www.tamimi.com/news/ministerial-decree-setting-official-paid-holidays-for-workers-no-294-of-2025",
         issued="2025-12-25", issued_uri=None, published=None, published_uri=None, published_in=None, in_force=None,
         dates_note="secondary only (law-firm summary and news 2025-12-26); gazette text not read",
         summary="Private sector: new Labour Law art. 129 + Labour Minister decision 294/2025 adopt the 1193/2018 "
                 "list for private-sector workers; decision 346/2025 adds Christian religious feasts for Christian "
                 "workers. Private sector only."),
]

EG_FIXED = [
    (1, 7, XMAS, [(2003, None)], "pm-2052-2002"),
    (1, 25, POLICE, [(2010, 2011)], "pm-387-2009"),
    (1, 25, JAN25, [(2012, None)], "pm-1355-2011"),
    (4, 25, SINAI, [(2000, 2017)], "pm-454-1987"),
    (4, 25, SINAI, [(2018, None)], "pm-1193-2018"),
    (5, 1, LABOUR, [(2000, 2017)], "pm-454-1987"),
    (5, 1, LABOUR, [(2018, None)], "pm-1193-2018"),
    (6, 30, JUN30, [(2015, 2017)], "annual PM decrees (1723/2015, 2016 decree, 1432/2017); no holiday in 2014"),
    (6, 30, JUN30, [(2018, None)], "pm-1193-2018"),
    (7, 23, JUL23, [(2000, 2017)], "pm-454-1987"),
    (7, 23, JUL23, [(2018, None)], "pm-1193-2018"),
    (10, 6, OCT6, [(2000, 2017)], "pm-454-1987"),
    (10, 6, OCT6, [(2018, None)], "pm-1193-2018"),
]

EG_ISLAMIC = [
    (1, 1, [0], HNY, [(2000, None)], "pm-454-1987 / pm-1193-2018"),
    (3, 12, [0], MAWLID, [(2000, None)], "pm-454-1987 / pm-1193-2018"),
    # eve (29/30 Ramadan) + 3 days; offset -1 from 1 Shawwal
    (10, 1, [-1, 0, 1, 2], FITR, [(2000, None)], "pres-1958-eid / pm-1193-2018"),
    # Arafah + 4 days
    (12, 10, [-1, 0, 1, 2, 3], ADHA, [(2000, None)], "pres-1958-eid / pm-1193-2018"),
]

EG_OTHER_RULES = [
    dict(key="sham-el-nessim", rule="Monday after Orthodox (Julian-calendar) Easter", years=(2000, None),
         source="pm-454-1987 / pm-1193-2018 (item 7); min-112-2003 (private)",
         note="Declared each year by a separate PM decree naming the Monday (e.g. PM 923/2020, 897/2021; cabinet "
              "releases 2022-2026). Never moved. When it coincides with 25 April (2011, 2022) one day serves both, "
              "except 2011 when Sinai Day was moved to Sunday 24 April (PM 537/2011)."),
    dict(key="islamic-dates", rule="Islamic holidays follow the Dar al-Ifta al-Misriyya moon sighting",
         years=(2000, None), source="decree texts: 'طبقاً لما ستسفر عنه الرؤية الشرعية'",
         note="Eid blocks are fixed by a PM decree a few days before; sometimes with a contingency clause "
              "(2025: block extended to 2 Apr if 1 Shawwal fell on 31 Mar; it did not, Eid was Sun 30 Mar)."),
    dict(key="eid-block-length", rule="Fitr: eve + 3 days; Adha: Arafah + 4 days (1958 rule, 1193/2018 art.1)",
         years=(2000, None), source="pres-1958-eid, pm-1193-2018",
         note="Actual decrees vary: often 4-6 day Fitr blocks and 5-8 day Adha blocks bridging to the weekend or "
              "absorbing a nearby fixed holiday (2021 Adha+23 Jul 17-24 Jul; 2022 Fitr+1 May 30 Apr-5 May; 2023 "
              "Fitr+25 Apr 20-25 Apr; 2023 Adha+30 Jun 27 Jun-3 Jul; 2024 Fitr 9-14 Apr; 2024 Adha 15-20 Jun; "
              "2026 Adha 26-31 May). Some years start on Eid day 1 without the eve (2011, 2014, 2015, 2017, 2019). "
              "Public-sector companies get fewer days (1193/2018 art.1 last para; 2014-2016 decrees)."),
    dict(key="weekend-move-pre2020", rule="fixed holiday on Fri/Sat sometimes moved to Thu/Sun by ad-hoc PM decree",
         years=(2011, 2020), source="PM 537/2011, 1432/2017, 2148/2017, 2493/2017, 1151/2018, 2027/2018, 62/2019, "
         "2019 Mawlid decree, 952/2020",
         note="2011 Sinai Mon 25 Apr -> Sun 24 Apr (clash with Sham el-Nessim); 2014 Sinai Fri -> Thu 24 Apr; "
              "2017 30 Jun Fri -> Thu 29 Jun; 6 Oct Fri -> Thu 5 Oct; Mawlid Fri 1 Dec -> Thu 30 Nov; 2018 30 Jun Sat "
              "-> Sun 1 Jul; 6 Oct Sat -> Sun 7 Oct; 2019 25 Jan Fri -> Thu 24 Jan; Mawlid Sat 9 Nov -> Sun 10 Nov; "
              "2020 1 May Fri -> Sat 2 May. Not systematic: many weekend holidays were simply lost "
              "(e.g. 2015 25 Apr Sat, 1 May Fri; 2016 23 Jul Sat; 2014 25 Jan Sat)."),
    dict(key="thursday-move", rule="mid-week holiday moved to Thursday (sometimes Sunday) by PM decree",
         years=(2020, None), source="pm-1249-2020 (power to substitute a day at start/end of the working week)",
         note="Applied case by case, announced 1-3 weeks ahead; the yearly decree is authoritative. Moved: 25 Jan, "
              "25 Apr, 1 May, 30 Jun, 23 Jul, 6 Oct, Islamic New Year and Mawlid. Never moved: Eid blocks, Sham "
              "el-Nessim (Monday), Coptic Christmas (except Fri 2022 -> Thu 6 Jan, Sat 2023 -> Sun 8 Jan). "
              "Observed: Mon/Tue/Wed -> Thu of the same week; Fri -> previous Thu (2022 Christmas, 2023 6 Oct, "
              "2025 25 Apr) or next Thu (2026 1 May -> Thu 7 May); Sat kept (2022 23 Jul, 2022 Hijri NY, 2022 "
              "Mawlid, 2025 25 Jan, 2026 25 Apr) or -> Sun (2023 Christmas). Sunday is usually KEPT (2024: 7 Jan, "
              "30 Jun, Mawlid 15 Sep, 6 Oct; 2019 30 Jun) but Hijri NY 2024 Sun 7 Jul -> Thu 11 Jul. 2024 1 May "
              "(Wed) -> Sun 5 May to join Sham el-Nessim Mon 6 May. python-holidays' rule (Sun+4, Mon+3, Tue+2, "
              "Wed+1 from 2020) is an approximation that fails on those Sundays and on Fri/Sat cases."),
    dict(key="private-sector", rule="private-sector days set by Labour (Manpower) Minister",
         years=(2003, None), source="law-12-2003 art. 52, min-112-2003, min-49-2009, law-14-2025 art. 129",
         note="Private-sector lists are shorter (Fitr 1-2, Arafah + Adha 1-2 until 2025) and moves are announced "
              "separately; many cabinet decrees from 2018 extend fixed-day moves to the private sector too."),
    dict(key="school-only", rule="Taba 19 Mar and Evacuation Day 18 Jun close schools/universities only",
         years=(2009, None), source="pm-720-2009, pm-837-1991, pm-1193-2018 art. 2",
         note="Not government holidays; python-holidays lists them under 'school'."),
]


# ------------------------------------------------------------- years
def _fixed_rows(year, doc, skip=(), jan25=True, jun30=False, sham=None):
    """Statutory fixed days for a year where no individual decree was found."""
    rows = []
    if year >= 2003 and "01-07" not in skip:
        rows.append(("01-07", XMAS, doc))
    if jan25 and "01-25" not in skip:
        if year >= 2012:
            rows.append(("01-25", JAN25, doc))
        elif year >= 2010:
            rows.append(("01-25", POLICE, doc))
    if sham:
        rows.append((sham, SHAM, doc))
    for mmdd, n in (("04-25", SINAI), ("05-01", LABOUR), ("07-23", JUL23), ("10-06", OCT6)):
        if mmdd not in skip:
            rows.append((mmdd, n, doc))
    if jun30 and "06-30" not in skip:
        rows.append(("06-30", JUN30, doc))
    return rows


STAT_PRE2018 = _d("Statutory list in force (PM decree 454/1987 + 2052/2002 + 387/2009 / 1355/2011), "
                  "no individual decree found for the day", MANS + "44922", None, None, None,
                  "list documented only via recitals of later decrees; day itself not individually sourced")
STAT_1193 = _d("PM decree 1193/2018 list (no individual day decree found)", MANS + "44922", "2018-07-02",
               "2018-07-02", "الجريدة الرسمية العدد 26 (مكرر) فى 2 يولية 2018", None)

EG_YEARS = {}

# ---- 2008-2013: secondary (youm7), several Eid blocks missing -> statutory estimate
EG_YEARS[2008] = dict(
    confidence="secondary",
    docs=[STAT_PRE2018,
          _y7("Cabinet: Eid al-Fitr holiday four days (Tue 30 Sep - Fri 3 Oct 2008)",
              "2008/9/24/إجازة-العيد-أربعة-أيام/41739", "2008-09-24"),
          _y7("Eid al-Adha leave; Dar al-Ifta: Arafah Sun 7 Dec, Eid Mon 8 Dec 2008",
              "2008/12/1/إجازة-عيد-الأضحى-للعاملين-بأجر-كامل/53980", "2008-12-01")],
    days=_fixed_rows(2008, 0, sham="04-28") + [("03-20", MAWLID, 0)]
         + _block("fitr", "09-30", "10-03", "10-01", 1)
         + _block("adha", "12-07", "12-11", "12-08", 2) + [("12-29", HNY, 0)],
    suppressed=[], working=[],
    notes="Fitr block from cabinet report. Adha: only Dar al-Ifta dates sourced; government block NOT found, the "
          "5-day Arafah+4 block (07-11 Dec) is the 1958/454 statutory pattern (estimate). Mawlid 2008-03-20 and "
          "Hijri NY 1430 = 2008-12-29 are calendar estimates (not sourced). 7 Jan from 2003; no 25 Jan yet.")

EG_YEARS[2009] = dict(
    confidence="secondary",
    docs=[STAT_PRE2018,
          _y7("Hijri New Year 1431 paid holiday (Labour Ministry notice)",
              "2009/12/13/إجازة-رأس-السنة-الهجرية-بأجر-كامل/165877", "2009-12-13"),
          _y7("Nazif: Eid al-Adha 10-day break for schools and universities (H1N1)",
              "2009/11/7/نظيف-إجازة-عيد-الأضحى-10-أيام-للمدارس-والجامعات/153909", "2009-11-07")],
    days=_fixed_rows(2009, 0, jan25=False, sham="04-20") + [("03-09", MAWLID, 0)]
         + _block("fitr", "09-19", "09-22", "09-20", 0)
         + _block("adha", "11-26", "11-30", "11-27", 0) + [("12-18", HNY, 1)],
    suppressed=[], working=[],
    notes="Both Eid government blocks NOT found: rows are the statutory eve+3 / Arafah+4 estimate around Dar "
          "al-Ifta dates from general knowledge (Fitr Sun 20 Sep; Arafah Thu 26 Nov). 25 Jan Police Day decree "
          "387/2009 came after 25 Jan 2009 (cited by minister decision of 10 Feb 2009), so no 25 Jan holiday in "
          "2009 (python-holidays starts 2009: disagreement). Mawlid 2009-03-09 calendar estimate.")

EG_YEARS[2010] = dict(
    confidence="secondary",
    docs=[STAT_PRE2018,
          _y7("Nazif: Eid al-Fitr holiday starts 9 September (Thu 9 - Sun 12 Sep 2010)",
              "2010/8/24/نظيف-إجازة-عيد-الفطر-تبدأ-يوم-9-سبتمبر-المقبل/269789", "2010-08-24"),
          _y7("Labour minister: Mawlid (Fri 26 Feb) is not an extra holiday",
              "2010/2/21/عائشة-عبد-الهادى-المولد-النبوى-ليس-إجازة-رسمية/192313", "2010-02-21"),
          _y7("Hijri New Year 1432 paid holiday (Labour Ministry)",
              "2010/12/2/القوى-العاملة-رأس-السنة-الهجرية-إجازة-بأجر-للعاملين-بالقطاع-الخاص/312774", "2010-12-02")],
    days=_fixed_rows(2010, 0, sham="04-05") + [("02-26", MAWLID, 2)]
         + _block("fitr", "09-09", "09-12", "09-10", 1)
         + _block("adha", "11-15", "11-19", "11-16", 0) + [("12-07", HNY, 3)],
    suppressed=[], working=[],
    notes="First 25 Jan Police Day holiday (PM 387/2009). Adha block NOT found (statutory Arafah Mon 15 Nov + 4 "
          "estimate; a youm7 item hints the PM's own leave started Fri 12 Nov). Mawlid fell on Friday, no substitute.")

EG_YEARS[2011] = dict(
    confidence="secondary",
    docs=[STAT_PRE2018,
          _gaz("PM decree 537/2011: Sunday 24/4/2011 holiday for Sinai Liberation instead of Monday 25/4/2011",
               3116, "2011-04-21", "Official Gazette 2011-04-28 (per manshurat; in force 2011-04-28)", "2011-04-28"),
          _y7("Sharaf: 4-day Eid al-Fitr holiday from Tuesday (30 Aug - 2 Sep 2011)",
              "2011/8/25/شرف-4-أيام-إجازة-عيد-الفطر-تبدأ-الثلاثاء/481010", "2011-08-25"),
          _y7("PM: Eid al-Adha holiday 5 days from Arafah (5-9 Nov 2011)",
              "2011/11/1/رئيس-الوزراء-إجازة-عيد-الأضحى-5-أيام-تبدأ-من-الوقفة/524957", "2011-11-01"),
          _y7("Hijri New Year 1433 paid holiday (Labour Ministry)",
              "2011/11/21/رأس-السنة-الهجرية-إجازة-بأجر-كامل/537416", "2011-11-21")],
    days=[r for r in _fixed_rows(2011, 0, skip=("04-25",), sham="04-25")]
         + [("02-15", MAWLID, 0), ("04-24", moved(SINAI, "04-25"), 1)]
         + _block("fitr", "08-30", "09-02", "08-30", 2)
         + _block("adha", "11-05", "11-09", "11-06", 3) + [("11-26", HNY, 4)],
    suppressed=[("04-25", SINAI, 1)], working=[],
    notes="25 Jan 2011 was the Police Day holiday (387/2009). Sinai Day moved because it coincided with Sham "
          "el-Nessim (Mon 25 Apr), which stays. Mawlid 2011-02-15 calendar estimate. Jan-Feb 2011 revolution "
          "closures and the 19 Mar 2011 referendum not researched as holidays.")

EG_YEARS[2012] = dict(
    confidence="secondary",
    docs=[STAT_PRE2018,
          _gaz("PM decree 1355/2011: 25 January every year (Revolution - Police Day)", 4786, "2011-10-25",
               "الجريدة الرسمية العدد 44 فى 3 نوفمبر 2011", "2011-11-03"),
          _y7("Government: Eid al-Fitr holiday four days Saturday to Tuesday (18-21 Aug 2012)",
              "2012/8/13/الحكومة-تقرر-إجازة-عيد-الفطر-أربعة-أيام-من-السبت-إلى/756269", "2012-08-13"),
          _y7("Qandil: Eid al-Adha holiday five days from Thursday (25-29 Oct 2012)",
              "2012/10/18/قنديل-إجازة-عيد-الأضحى-خمسة-أيام-اعتبارًا-من-الخميس-المقبل/820900", "2012-10-18"),
          _y7("Labour: 1 Muharram paid holiday (Thu 15 Nov 2012)",
              "2012/11/12/القوى-العاملة-أول-محرم-إجازة-بأجر-للعاملين-فى-القطاع-الخاص/843506", "2012-11-12")],
    days=_fixed_rows(2012, 0, skip=("01-25",), sham="04-16") + [("01-25", JAN25, 1), ("02-04", MAWLID, 0)]
         + _block("fitr", "08-18", "08-21", "08-19", 2)
         + _block("adha", "10-25", "10-29", "10-26", 3) + [("11-15", HNY, 4)],
    suppressed=[], working=[],
    notes="Mawlid 2012-02-04 (Saturday) calendar estimate. One-offs in EG_ADHOC: presidential runoff 16-17 Jun "
          "(paid official holiday for the state), referendum Saturdays 15 and 22 Dec (PM 1293/2012, 1317/2012).")

EG_YEARS[2013] = dict(
    confidence="secondary",
    docs=[STAT_PRE2018,
          _d("Dar al-Ifta: Eid al-Fitr starts Thursday (Ahram Online)",
             "https://english.ahram.org.eg/NewsContent/1/64/78574/Egypt/Politics-/Eid-AlFitr-starts-on-Thursday-Dar-AlIfta-.aspx",
             "2013-08-07", "2013-08-07", "newspaper (Ahram Online), secondary", "moon-sighting report"),
          _y7("Bourse official holiday from next Monday for Eid al-Adha (6 days)",
              "2013/10/8/البورصة-عطلة-رسمية-اعتبارا-من-الاثنين-المقبل-بمناسبة-عيد-الأضحى/1288017", "2013-10-08"),
          _y7("Bourse official holiday tomorrow for Hijri New Year (5 Nov 2013)",
              "2013/11/4/البورصة-إجازة-رسمية-غدا-بمناسبة-رأس-السنة-الهجرية/1327362", "2013-11-04")],
    days=_fixed_rows(2013, 0, sham="05-06") + [("01-24", MAWLID, 0)]
         + _block("fitr", "08-07", "08-11", "08-08", 1)
         + _block("adha", "10-14", "10-19", "10-15", 2) + [("11-05", HNY, 3)],
    suppressed=[], working=[],
    notes="Weak year. Fitr: Dar al-Ifta Eid Thu 8 Aug; government block NOT found (eve 07 Aug + Eid 08-10 + Sun 11 "
          "inferred from British Embassy closure 8 and 11 Aug). Adha block 14-19 Oct inferred from the bourse "
          "closure (Arafah Mon 14 Oct). Mawlid 2013-01-24 calendar estimate. 30 June not yet a holiday.")

# ---- 2014-2016: secondary (youm7 quoting cabinet), decree numbers mostly missing
EG_YEARS[2014] = dict(
    confidence="secondary",
    docs=[STAT_PRE2018,
          _y7("Beblawi: Tuesday (7 Jan) official holiday for Christmas", "2014/1/5/الببلاوى-يهنئ-الأقباط-بعيد-الميلاد-ويقرر-الثلاثاء-إجازة-رسمية/1435297", "2014-01-05"),
          _d("Cabinet: referendum on working days; Mawlid Mon 13 Jan holiday (Daily News Egypt)",
             "https://www.dailynewssegypt.com/2014/01/09/voting-on-referendum-scheduled-during-working-days",
             "2014-01-09", "2014-01-09", "newspaper (Daily News Egypt), secondary", "newspaper report of cabinet statement"),
          _y7("Government: next Thursday (24 Apr) official holiday for Sinai Liberation",
              "2014/4/17/الحكومة-ندرس-قانون-مكافحة-الإرهاب-بعد-إعادته-من-الرئاسة-والخميس/1617962", "2014-04-17"),
          _y7("Mahlab decree: Eid al-Fitr holiday 4 days (28-31 Jul 2014)",
              "2014/7/24/محلب-يصدر-قرارا-باعتبار-إجازة-عيد-الفطر-4-أيام-للعاملين/1790584", "2014-07-24"),
          _y7("Cabinet: Eid al-Adha holiday 5 days for government (3-7 Oct 2014)",
              "2014/9/27/الوزراء-إجازة-عيد-الأضحى-5-أيام-للحكومة-و4-لقطاع-الأعمال/1883619", "2014-09-27"),
          _y7("Cabinet: Saturday (25 Oct) official holiday for Hijri New Year",
              "2014/10/21/مجلس-الوزراء-السبت-إجازة-رسمية-بمناسبة-العام-الهجرى/1915551", "2014-10-21")],
    days=[("01-07", XMAS, 1), ("01-13", MAWLID, 2), ("01-25", JAN25, 0), ("04-21", SHAM, 0),
          ("04-24", moved(SINAI, "04-25"), 3), ("05-01", LABOUR, 0), ("07-23", JUL23, 0)]
         + _block("fitr", "07-28", "07-31", "07-28", 4)
         + _block("adha", "10-03", "10-07", "10-04", 5, extra={"10-06": OCT6}) + [("10-25", HNY, 6)],
    suppressed=[("04-25", SINAI, 3)], working=[],
    notes="No 30 June holiday found in 2014 (first in 2015; python-holidays starts 2014: disagreement). 25 Jan "
          "fell on Saturday, no substitute. Adha block absorbs 6 Oct. One-offs (EG_ADHOC): 27 May election day, "
          "8 Jun presidential inauguration. Referendum 14-15 Jan were working days.")

EG_YEARS[2015] = dict(
    confidence="secondary",
    docs=[STAT_PRE2018,
          _y7("Government: Sunday (25 Jan) official holiday", "2015/1/21/الحكومة-تعلن-الأحد-إجازة-رسمية-والاحتفال-بذكرى-ثورة-25-يناير/2035627", "2015-01-21"),
          _gaz("PM decree 1723/2015: 30 June 2015 paid holiday (30 June Revolution anniversary)", 6871,
               "2015-06-29", "Official Gazette (per manshurat; issue not read)"),
          _y7("Cabinet: Eid al-Fitr holiday Friday to Monday (17-20 Jul 2015)", "2015/7/14/مجلس-الوزراء-إجازة-عيد-الفطر-من-الجمعة-وحتى-الأثنين/2264892", "2015-07-14"),
          _d("PM decree 2508/2015: Eid al-Adha 5 days (23-27 Sep 2015), Official Gazette 2015-09-20 (youm7 report)",
             Y7 + "2015/9/20/رئيس-الوزراء-إجازة-عيد-الأضحى-5-أيام-بالمصالح-الحكومية-و4/2355230", "2015-09-20",
             "2015-09-20", "Official Gazette 2015-09-20 (as reported by youm7; scan not seen)",
             "newspaper report of the gazette; decree number from Post Authority notice (youm7 2015-09-22)"),
          _y7("PM decree: tomorrow (14 Oct) official holiday for Hijri New Year", "2015/10/13/رئيس-الوزراء-يصدر-قرارا-باعتماد-غداً-إجازة-رسمية-بمناسبة-رأس/2387027", "2015-10-13"),
          _y7("Bourse holiday Wednesday (23 Dec) for Mawlid", "2015/12/17/البورصة-إجازة-الأربعاء-المقبل-بمناسبة-المولد-النبوى/2496774", "2015-12-17")],
    days=[("01-03", MAWLID, 0), ("01-07", XMAS, 0), ("01-25", JAN25, 1), ("04-13", SHAM, 0), ("04-25", SINAI, 0),
          ("05-01", LABOUR, 0), ("06-30", JUN30, 2), ("07-23", JUL23, 0), ("10-06", OCT6, 0)]
         + _block("fitr", "07-17", "07-20", "07-17", 3)
         + _block("adha", "09-23", "09-27", "09-24", 4) + [("10-14", HNY, 5), ("12-23", MAWLID, 6)],
    suppressed=[], working=[],
    notes="Mawlid 1436 = Sat 2015-01-03 (calendar estimate, no source; Saturday). 25 Apr (Sat) and 1 May (Fri) "
          "not moved as far as found. One-off: 6 Aug New Suez Canal opening (EG_ADHOC). Parliamentary election "
          "days 19 Oct, 28 Oct, 23 Nov, 2 Dec were HALF working days only.")

EG_YEARS[2016] = dict(
    confidence="secondary",
    docs=[STAT_PRE2018,
          _y7("PM decree: 30 June paid holiday", "2016/6/26/رئيس-الوزراء-يصدر-قرارا-باعتبار-30-يونيو-إجازة-مدفوعة-الأجر/2777246", "2016-06-26"),
          _y7("PM decree: Eid holiday 3 days (5-7 Jul 2016)", "2016/6/30/رئيس-الوزراء-يصدر-قرارًا-باعتبار-إجازة-العيد-3-أيام-تبدأ/2782956", "2016-06-30"),
          _y7("Government: Eid al-Adha 5 days from Sunday 11 Sep", "2016/9/6/الحكومة-إجازة-عيد-الأضحى-5-أيام-اعتبارا-من-الأحد-11/2873646", "2016-09-06"),
          _y7("PM: 1 Muharram 1438 holiday for government", "2016/9/30/رئيس-الوزراء-يقرر-اعتبار-رأس-السنة-الهجرية-إجازة-للعاملين-بالحكومة/2903099", "2016-09-30"),
          _y7("PM decree: Sunday (11 Dec) holiday for Mawlid", "2016/12/7/رئيس-الوزراء-يصدر-قرارا-باعتبار-الأحد-إجازة-رسمية-بمناسبة-المولد/2999897", "2016-12-07")],
    days=[("01-07", XMAS, 0), ("01-25", JAN25, 0), ("04-25", SINAI, 0), ("05-01", LABOUR, 0), ("05-02", SHAM, 0),
          ("06-30", JUN30, 1), ("07-23", JUL23, 0), ("10-06", OCT6, 0)]
         + _block("fitr", "07-05", "07-07", "07-06", 2)
         + _block("adha", "09-11", "09-15", "09-12", 3) + [("10-02", HNY, 4), ("12-11", MAWLID, 5)],
    suppressed=[], working=[],
    notes="23 Jul fell on Saturday, no substitute found. 6 Aug 2016 explicitly NOT a holiday.")

# ---- 2017-2026: primary (gazette scans and cabinet releases)
EG_YEARS[2017] = dict(
    confidence="primary",
    docs=[STAT_PRE2018,
          _d("PM decree 1/2017: 7 January 2017 paid holiday", MANS + "26104", "2017-01-01", "2017-01-01",
             "Official Gazette (per manshurat metadata)", None),
          _d("PM decree 175/2017: 25 January 2017 paid holiday", MANS + "14167", "2017-01-21", "2017-01-21",
             "Official Gazette (per manshurat metadata)", None),
          _gaz("PM decree 1427/2017: Eid al-Fitr leave from Sunday 25 June 2017 for three days", 20288,
               "2017-06-19", "الجريدة الرسمية العدد 24 مكرر (أ) فى 19 يونية 2017"),
          _d("PM decree 1432/2017: 29 June 2017 paid holiday (30 June anniversary)", MANS + "20349", "2017-06-22",
             "2017-06-22", "Official Gazette (per manshurat metadata)", None),
          _gaz("PM decree 1881/2017: Eid al-Adha leave Thu 31 Aug - Mon 4 Sep 2017", 21870, "2017-08-23",
               "الجريدة الرسمية العدد 33 مكرر (أ) فى 23 أغسطس 2017"),
          _gaz("PM decree 1995/2017: Hijri New Year 1439 leave Thursday 21 September 2017", 21452, "2017-09-16",
               "الجريدة الرسمية العدد 37 (مكرر) فى 16 سبتمبر 2017"),
          _d("PM decree 2148/2017: Thursday 5 October 2017 paid holiday", MANS + "26222", "2017-10-01",
             "2017-10-01", "Official Gazette (per manshurat metadata)", None),
          _d("PM decree 2493/2017: Thursday 30 Nov 2017 Mawlid holiday instead of Friday 1 Dec (12 Rabi I 1439)",
             CAB + "5788", "2017-11-20", "2017-11-20", CAB_REL + "; PM decree per manshurat node 26299", None),
          _y7("Cabinet IDSC: main official holidays of 2017 (Sham el-Nessim 17 Apr, Sinai 25 Apr, 1 May)",
              "2017/1/4/معلومات-الوزراء-تنشر-أهم-الإجازات-الرسمية-لعام-2017/3041005", "2017-01-04")],
    days=[("01-07", XMAS, 1), ("01-25", JAN25, 2), ("04-17", SHAM, 9), ("04-25", SINAI, 9), ("05-01", LABOUR, 9)]
         + _block("fitr", "06-25", "06-27", "06-25", 3)
         + [("06-29", moved(JUN30, "06-30"), 4), ("07-23", JUL23, 0)]
         + _block("adha", "08-31", "09-04", "09-01", 5)
         + [("09-21", HNY, 6), ("10-05", moved(OCT6, "10-06"), 7), ("11-30", moved(MAWLID, "12-01"), 8)],
    suppressed=[("06-30", JUN30, 4), ("10-06", OCT6, 7), ("12-01", MAWLID, 8)], working=[],
    notes="Sham el-Nessim, 25 Apr, 1 May, 23 Jul from IDSC agenda / bourse notices (secondary). Fitr decree "
          "starts on Eid day 1 (Sun 25 Jun) without the eve.")

EG_YEARS[2018] = dict(
    confidence="primary",
    docs=[STAT_1193,
          _d("PM decree 1/2018: Sunday 7 January 2018 paid holiday (Christmas)", MANS + "41629", "2018-01-03",
             "2018-01-03", "Official Gazette (per manshurat metadata)", None),
          _d("PM decree 74/2018: Thursday 25 January 2018 paid holiday", MANS + "41639", "2018-01-17", "2018-01-17",
             "Official Gazette (per manshurat metadata)", None),
          _cab("PM decree 1115/2018: Eid al-Fitr leave Sat 16 - Mon 18 June 2018", 4801, "2018-06-11"),
          _gaz("PM decree 1151/2018: Sunday 1 July 2018 holiday instead of Saturday 30 June", 44913, "2018-06-25",
               "الجريدة الرسمية العدد 25 مكرر (ج) فى 25 يونية 2018"),
          _cab("PM decree 1372/2018: Monday 23 July 2018 paid holiday", 4750, "2018-07-17"),
          _gaz("PM decree 1543/2018: Mon 20 - Fri 24 August 2018 Eid al-Adha", 45427, "2018-08-14",
               "الجريدة الرسمية العدد 32 مكرر (أ) فى 14 أغسطس 2018"),
          _cab("PM decree 1741/2018: Hijri New Year 1440 Tuesday 11 September 2018", 4682, "2018-09-10"),
          _cab("PM decree 2027/2018: Sunday 7 October 2018 instead of Saturday 6 October", 4603, "2018-10-03"),
          _gaz("PM decree 2384/2018: Tuesday 20 November 2018 Mawlid (12 Rabi I 1440)", 47398, "2018-11-13",
               "الجريدة الرسمية العدد 45 مكرر (أ) فى 13 نوفمبر 2018")],
    days=[("01-07", XMAS, 1), ("01-25", JAN25, 2), ("04-09", SHAM, 0), ("04-25", SINAI, 0), ("05-01", LABOUR, 0)]
         + _block("fitr", "06-16", "06-18", "06-15", 3)
         + [("07-01", moved(JUN30, "06-30"), 4), ("07-23", JUL23, 5)]
         + _block("adha", "08-20", "08-24", "08-21", 6)
         + [("09-11", HNY, 7), ("10-07", moved(OCT6, "10-06"), 8), ("11-20", MAWLID, 9)],
    suppressed=[("06-30", JUN30, 4), ("10-06", OCT6, 8)], working=[],
    notes="Eid al-Fitr was Fri 15 Jun (weekend); decree 1115/2018 gives Sat-Mon (Eid days 2-4 labels are "
          "approximate: 16-17 Jun = Eid days 2-3, 18 Jun = extra). 1193/2018 list in force from 3 Jul 2018. "
          "Sham el-Nessim, 25 Apr, 1 May from the statute (no decree fetched).")

EG_YEARS[2019] = dict(
    confidence="primary",
    docs=[STAT_1193,
          _d("PM decree 62/2019: Thursday 24 January 2019 paid holiday (25 January Revolution & Police Day)",
             MANS + "68437", "2019-01-17", "2019-01-17", "Official Gazette (per manshurat metadata)", None),
          _cab("PM decision: Eid al-Fitr leave Tue 4 - Thu 6 June 2019", 4058, "2019-05-30"),
          _cab("PM decision: Sunday 30 June 2019 paid holiday", 3045, "2019-06-27"),
          _cab("PM decision: Eid al-Adha Sat 10 - Wed 14 August 2019", 3003, "2019-08-07"),
          _cab("PM decision: Hijri New Year 1441 on 1 Muharram per sighting", 2902, "2019-08-27"),
          _cab("PM decision: Sunday 10 Nov 2019 Mawlid instead of Saturday 9 Nov (12 Rabi I 1441)", 2888,
               "2019-11-03")],
    days=[("01-07", XMAS, 0), ("01-24", moved(JAN25, "01-25"), 1), ("04-25", SINAI, 0), ("04-29", SHAM, 0),
          ("05-01", LABOUR, 0)]
         + _block("fitr", "06-04", "06-06", "06-04", 2)
         + [("06-30", JUN30, 3), ("07-23", JUL23, 0)]
         + _block("adha", "08-10", "08-14", "08-11", 4)
         + [("08-31", HNY, 5), ("10-06", OCT6, 0), ("11-10", moved(MAWLID, "11-09"), 6)],
    suppressed=[("01-25", JAN25, 1), ("11-09", MAWLID, 6)], working=[],
    notes="Fitr decision lists Tue-Thu (Eid days 1-3), not the eve (Mon 3 Jun) that 1193/2018 names; "
          "python-holidays adds 3 Jun as a 'government' holiday: disagreement, decision wins. Hijri NY 1441 = "
          "Sat 31 Aug (date from general knowledge of the sighting; decision only says 1 Muharram). 7 Jan, 25 Apr, "
          "Sham, 1 May, 23 Jul, 6 Oct from the statute (no decree fetched).")

EG_YEARS[2020] = dict(
    confidence="primary",
    docs=[STAT_1193,
          _cab("PM decree 12/2020: Tuesday 7 January 2020 Christmas", 322, "2020-01-02"),
          _cab("PM decree 174/2020: Saturday 25 January 2020", 1500, "2020-01-22"),
          _gaz("PM decree 923/2020: Monday 20 April 2020 Sham el-Nessim (with precautionary measures)", 67258,
               "2020-04-16", "Official Gazette (per manshurat metadata)"),
          _cab("PM decree 938/2020: Saturday 25 April 2020 Sinai Liberation", 297, "2020-04-23"),
          _d("PM decree 952/2020: Saturday 2 May 2020 paid holiday (Labour Day)", MANS + "67126", "2020-04-29",
             "2020-04-29", "Official Gazette (per manshurat metadata)", None),
          _d("PM decree of 19 May 2020 (art. 7): Sat 23 - Thu 28 May 2020 Eid al-Fitr paid holiday",
             MANS + "66835", "2020-05-19", "2020-05-19", "Official Gazette (per manshurat; secondary summaries "
             "bankygate/akhbarelyom)", "decree number not seen; dates from manshurat item title and news"),
          _cab("PM decree 1250/2020: Thursday 2 July 2020 instead of Tuesday 30 June", 166, "2020-06-29"),
          _cab("PM decree 1397/2020: Thursday 23 July 2020", 51, "2020-07-20"),
          _cab("PM decree 1470/2020: Thu 30 July - Mon 3 August 2020 Eid al-Adha", 35, "2020-07-28"),
          _cab("PM decree 1616/2020: Thursday 20 August 2020 Hijri New Year 1442", 145, "2020-08-16"),
          _cab("PM decree 1962/2020: Thursday 8 October 2020 instead of Tuesday 6 October", 1595, "2020-10-01"),
          _cab("PM decree 2197/2020: Thursday 29 October 2020 Mawlid (12 Rabi I 1442)", 2955, "2020-10-24")],
    days=[("01-07", XMAS, 1), ("01-25", JAN25, 2), ("04-20", SHAM, 3), ("04-25", SINAI, 4),
          ("05-02", moved(LABOUR, "05-01"), 5)]
         + _block("fitr", "05-23", "05-28", "05-24", 6)
         + [("07-02", moved(JUN30, "06-30"), 7), ("07-23", JUL23, 8)]
         + _block("adha", "07-30", "08-03", "07-31", 9)
         + [("08-20", HNY, 10), ("10-08", moved(OCT6, "10-06"), 11), ("10-29", MAWLID, 12)],
    suppressed=[("05-01", LABOUR, 5), ("06-30", JUN30, 7), ("10-06", OCT6, 11)], working=[],
    notes="Decree 1249/2020 (28 Jun) gives the PM the substitution power; 30 Jun 2020 is the first move under it. "
          "1 May fell on Friday and was moved to Saturday 2 May. Ad hoc: 12 Mar weather closure (EG_ADHOC). "
          "Manshurat metadata gives decree numbers (66974=1397, 68256=1470, 68270=1616, 68323=1962, 68359=2197, "
          "66980=1250, 67204=938, 67983=174, 67938=12).")

EG_YEARS[2021] = dict(
    confidence="primary",
    docs=[STAT_1193,
          _cab("PM decree 58/2021: Thursday 7 January 2021 Christmas", 7311, "2021-01-04"),
          _d("PM decree 166/2021: Thursday 28 January 2021 instead of Monday 25 January", MANS + "74582",
             "2021-01-20", "2021-01-20", "Official Gazette (per manshurat metadata)", None),
          _cab("PM decree 854/2021: Thursday 29 April 2021 instead of Sunday 25 April (Sinai)", 10574, "2021-04-22"),
          _cab("PM decrees 895/2021 and 897/2021: Saturday 1 May (Labour) and Monday 3 May (Sham el-Nessim)",
               10620, "2021-04-28"),
          _gaz("PM decree 933/2021 art. 8: Wed 12 - Sun 16 May 2021 Eid al-Fitr paid holiday", 74672, "2021-05-05",
               "الجريدة الرسمية العدد 17 مكرر (أ) فى 5 مايو 2021"),
          _cab("PM decision: Thursday 1 July 2021 instead of Wednesday 30 June (PM 1419/2021)", 13078, "2021-06-27"),
          _cab("PM decree 1625/2021 (19-24 July) extended by PM 1662/2021: Sat 17 - Sat 24 July 2021 "
               "Eid al-Adha and 23 July", 13214, "2021-07-15"),
          _cab("PM decree 1828/2021: Thursday 12 August 2021 Hijri New Year instead of 1 Muharram 1443", 13352,
               "2021-08-05"),
          _cab("PM decision: Thursday 7 October 2021 instead of Wednesday 6 October", 16767, "2021-10-03"),
          _cab("PM decision: Thursday 21 October 2021 Mawlid instead of Tuesday 19 October (12 Rabi I 1443)", 16856,
               "2021-10-13"),
          _d("Dar al-Ifta: Muharram 1443 crescent sighted, 1 Muharram = Monday 9 August 2021",
             "https://www.dar-alifta.org/ar/Articles/Details/7878", "2021-08-08", "2021-08-08",
             "Dar al-Ifta al-Misriyya statement", None)],
    days=[("01-07", XMAS, 1), ("01-28", moved(JAN25, "01-25"), 2), ("04-29", moved(SINAI, "04-25"), 3),
          ("05-01", LABOUR, 4), ("05-03", SHAM, 4)]
         + _block("fitr", "05-12", "05-16", "05-13", 5)
         + [("07-01", moved(JUN30, "06-30"), 6)]
         + _block("adha", "07-17", "07-24", "07-20", 7, extra={"07-23": JUL23})
         + [("08-12", moved(HNY, "08-09"), 8), ("10-07", moved(OCT6, "10-06"), 9),
            ("10-21", moved(MAWLID, "10-19"), 10)],
    suppressed=[("01-25", JAN25, 2), ("04-25", SINAI, 3), ("06-30", JUN30, 6), ("08-09", HNY, 11),
                ("10-06", OCT6, 9), ("10-19", MAWLID, 10)],
    working=[],
    notes="Eid al-Fitr 1442 = Thu 13 May (block Wed 12 eve - Sun 16). Adha: Arafah Mon 19 Jul, Eid Tue 20 Jul; "
          "block first 19-24 Jul (1625/2021) then extended to start Sat 17 Jul (1662/2021, 'Hayah Karima' "
          "launch). python-holidays lists 2021 Hijri NY as 11 Aug; Dar al-Ifta says 9 Aug.")

EG_YEARS[2022] = dict(
    confidence="primary",
    docs=[STAT_1193,
          _cab("PM decision: Thursday 6 January 2022 instead of Friday 7 January (Christmas)", 18519, "2022-01-02"),
          _cab("PM decision: Thursday 27 January 2022 instead of Tuesday 25 January", 21638, "2022-01-22"),
          _cab("PM decision: Monday 25 April 2022 holiday for Sham el-Nessim and Sinai Liberation", 25406,
               "2022-04-18"),
          _cab("PM decision: Sat 30 April - Thu 5 May 2022 for Labour Day and Eid al-Fitr", 25407, "2022-04-18"),
          _cab("PM decision: Thursday 30 June 2022", 28012, "2022-06-23"),
          _cab("PM decision: Sat 9 - Thu 14 July 2022 Eid al-Adha", 28115, "2022-07-04"),
          _cab("PM decision: Saturday 23 July 2022", 28195, "2022-07-19"),
          _cab("PM decision: Saturday 30 July 2022 Hijri New Year", 29216, "2022-07-24"),
          _cab("PM decisions: Thursday 6 October and Saturday 8 October (Mawlid) 2022", 35035, "2022-10-02")],
    days=[("01-06", moved(XMAS, "01-07"), 1), ("01-27", moved(JAN25, "01-25"), 2),
          ("04-25", SHAM + "؛ " + SINAI, 3)]
         + _block("fitr", "04-30", "05-05", "05-02", 4, extra={"05-01": LABOUR})
         + [("06-30", JUN30, 5)]
         + _block("adha", "07-09", "07-14", "07-09", 6)
         + [("07-23", JUL23, 7), ("07-30", HNY, 8), ("10-06", OCT6, 9), ("10-08", MAWLID, 9)],
    suppressed=[("01-07", XMAS, 1), ("01-25", JAN25, 2)], working=[],
    notes="Eid al-Fitr 1443 = Mon 2 May (block Sat 30 Apr - Thu 5 May incl. Labour Day Sun 1 May; 30 Apr is "
          "eve-1, labelled extension, 1 May = eve). Eid al-Adha 1443 = Sat 9 Jul (Arafah Fri 8 Jul is weekend, "
          "not in the decree); python-holidays gives 10 Jul: disagreement, block unaffected.")

EG_YEARS[2023] = dict(
    confidence="primary",
    docs=[STAT_1193,
          _cab("PM decision: Sunday 8 January 2023 Christmas", 45124, "2023-01-02"),
          _cab("PM decision: Thursday 26 January 2023 instead of Wednesday 25 January", 45295, "2023-01-18"),
          _cab("PM decision: Monday 17 April 2023 Sham el-Nessim", 56062, "2023-04-05"),
          _cab("PM decision: Thu 20 - Tue 25 April 2023 Eid al-Fitr and Sinai Liberation", 57097, "2023-04-10"),
          _cab("PM decision: Thursday 4 May 2023 instead of Monday 1 May", 60171, "2023-04-30"),
          _cab("PM decision: Tue 27 June - Mon 3 July 2023 Eid al-Adha and 30 June", 63809, "2023-06-20"),
          _cab("PM decisions: Thursday 20 July (Hijri New Year instead of 1 Muharram 1445) and Sunday 23 July",
               64015, "2023-07-12"),
          _cab("PM decision: Thursday 28 September 2023 Mawlid instead of 12 Rabi I 1445", 67576, "2023-09-12"),
          _cab("PM decision: Thursday 5 October 2023 instead of Friday 6 October", 68772, "2023-09-27")],
    days=[("01-08", moved(XMAS, "01-07"), 1), ("01-26", moved(JAN25, "01-25"), 2), ("04-17", SHAM, 3)]
         + _block("fitr", "04-20", "04-25", "04-21", 4, extra={"04-25": SINAI})
         + [("05-04", moved(LABOUR, "05-01"), 5)]
         + _block("adha", "06-27", "07-03", "06-28", 6, extra={"06-30": JUN30})
         + [("07-20", moved(HNY, "07-19"), 7), ("07-23", JUL23, 7), ("09-28", moved(MAWLID, "09-27"), 8),
            ("10-05", moved(OCT6, "10-06"), 9)],
    suppressed=[("01-07", XMAS, 1), ("01-25", JAN25, 2), ("05-01", LABOUR, 5), ("07-19", HNY, 7),
                ("09-27", MAWLID, 8), ("10-06", OCT6, 9)],
    working=[],
    notes="Eid al-Fitr 1444 = Fri 21 Apr; Eid al-Adha 1444 = Wed 28 Jun (Arafah Tue 27). 1 Muharram 1445 = Wed 19 "
          "Jul and 12 Rabi I 1445 = Wed 27 Sep (calendar/sighting dates; decrees say only 'instead of').")

EG_YEARS[2024] = dict(
    confidence="primary",
    docs=[STAT_1193,
          _d("PM decree 5004/2023: Sunday 7 January 2024 Christmas", CAB + "74723", "2023-12-31", "2023-12-31",
             CAB_REL + "; number per manshurat node 76051", None),
          _cab("PM decision: Thursday 25 January 2024", 74901, "2024-01-18"),
          _cab("PM decision: Tue 9 - Sun 14 April 2024 Eid al-Fitr", 75571, "2024-04-03"),
          _cab("PM decision: Thursday 25 April 2024 Sinai Liberation", 75637, "2024-04-17"),
          _cab("PM decisions: Sunday 5 May (Labour Day instead of Wed 1 May) and Monday 6 May (Sham el-Nessim)",
               75707, "2024-04-23"),
          _cab("PM decision: Sat 15 - Thu 20 June 2024 Eid al-Adha", 76107, "2024-06-10"),
          _cab("PM decision: Sunday 30 June 2024", 76160, "2024-06-24"),
          _cab("PM decision: Thursday 11 July 2024 Hijri New Year instead of 1 Muharram 1446", 76255, "2024-07-03"),
          _cab("PM decision: Thursday 25 July 2024 instead of Tuesday 23 July", 76349, "2024-07-15"),
          _cab("PM decision: Sunday 15 September 2024 Mawlid (12 Rabi I 1446)", 76963, "2024-09-08"),
          _cab("PM decision: Sunday 6 October 2024", 77258, "2024-09-29")],
    days=[("01-07", XMAS, 1), ("01-25", JAN25, 2)]
         + _block("fitr", "04-09", "04-14", "04-10", 3)
         + [("04-25", SINAI, 4), ("05-05", moved(LABOUR, "05-01"), 5), ("05-06", SHAM, 5)]
         + _block("adha", "06-15", "06-20", "06-16", 6)
         + [("06-30", JUN30, 7), ("07-11", moved(HNY, "07-07"), 8), ("07-25", moved(JUL23, "07-23"), 9),
            ("09-15", MAWLID, 10), ("10-06", OCT6, 11)],
    suppressed=[("05-01", LABOUR, 5), ("07-07", HNY, 8), ("07-23", JUL23, 9)], working=[],
    notes="Eid al-Fitr 1445 = Wed 10 Apr (block Tue 9 eve - Sun 14). Eid al-Adha 1445 = Sun 16 Jun (Arafah Sat "
          "15). 1 Muharram 1446 = Sun 7 Jul (sighting date from general knowledge; decree: 'instead of'). Sundays "
          "7 Jan, 30 Jun, 15 Sep, 6 Oct NOT moved.")

EG_YEARS[2025] = dict(
    confidence="primary",
    docs=[STAT_1193,
          _cab("PM decision: Tuesday 7 January 2025 Christmas", 78223, "2025-01-04"),
          _cab("PM decision: Saturday 25 January 2025", 78314, "2025-01-14"),
          _cab("PM decision: Sat 29 March - Tue 1 April 2025 Eid al-Fitr (to Wed 2 Apr if 1 Shawwal = 31 Mar)",
               80891, "2025-03-23"),
          _cab("PM decisions: Mon 21 Apr Sham el-Nessim; Thu 24 Apr instead of Fri 25 Apr (Sinai); Thu 1 May",
               81031, "2025-04-13"),
          _cab("PM decision: Thu 5 - Mon 9 June 2025 Eid al-Adha", 82385, "2025-05-29"),
          _cab("PM decisions: Thu 26 June Hijri New Year; Thu 3 July instead of Mon 30 June", 82523, "2025-06-19"),
          _cab("PM decision: Thursday 24 July 2025 instead of Wednesday 23 July", 82684, "2025-07-16"),
          _cab("PM decision: Thursday 4 September 2025 Mawlid (12 Rabi I 1447)", 82917, "2025-08-25"),
          _cab("PM decision: Thursday 9 October 2025 instead of Monday 6 October", 83148, "2025-09-29"),
          _d("Presidency of Egypt: official holidays 2025 (planning list)",
             "https://web.archive.org/web/20250614072551/https://www.presidency.eg/ar/%D9%85%D8%B5%D8%B1/"
             "%D8%A7%D9%84%D8%B9%D8%B7%D9%84%D8%A7%D8%AA-%D8%A7%D9%84%D8%B1%D8%B3%D9%85%D9%8A%D8%A9/",
             None, "2025-06-14", "presidency.eg page (Wayback capture)",
             "undated page; published = capture date. Shows Fitr to 2 Apr (contingency) and 6 Oct unmoved, "
             "i.e. written before the final decisions")],
    days=[("01-07", XMAS, 1), ("01-25", JAN25, 2)]
         + _block("fitr", "03-29", "04-01", "03-30", 3)
         + [("04-21", SHAM, 4), ("04-24", moved(SINAI, "04-25"), 4), ("05-01", LABOUR, 4)]
         + _block("adha", "06-05", "06-09", "06-06", 5)
         + [("06-26", HNY, 6), ("07-03", moved(JUN30, "06-30"), 6), ("07-24", moved(JUL23, "07-23"), 7),
            ("09-04", MAWLID, 8), ("10-09", moved(OCT6, "10-06"), 9)],
    suppressed=[("04-25", SINAI, 4), ("06-30", JUN30, 6), ("07-23", JUL23, 7), ("10-06", OCT6, 9)], working=[],
    notes="Eid al-Fitr 1446 = Sun 30 Mar (Dar al-Ifta), so the contingency extension to 2 Apr did not apply "
          "(presidency list shows 29 Mar - 2 Apr: superseded). Eid al-Adha 1446 = Fri 6 Jun (Arafah Thu 5). "
          "One-off: Sat 1 Nov 2025 Grand Egyptian Museum opening (EG_ADHOC).")

EG_YEARS[2026] = dict(
    confidence="primary",
    docs=[STAT_1193,
          _cab("PM decree 33/2026: Wednesday 7 January 2026 Christmas", 84759, "2026-01-04"),
          _cab("PM decision: Thursday 29 January 2026 instead of Sunday 25 January", 84820, "2026-01-18"),
          _cab("PM decision: Thu 19 - Mon 23 March 2026 Eid al-Fitr", 85074, "2026-03-11"),
          _cab("PM decision: Monday 13 April 2026 Sham el-Nessim", 85206, "2026-04-06"),
          _cab("PM decision: Saturday 25 April 2026 Sinai Liberation", 85269, "2026-04-19"),
          _cab("PM decision: Thursday 7 May 2026 instead of Friday 1 May", 85306, "2026-04-22"),
          _cab("PM decision: Tue 26 - Sun 31 May 2026 Eid al-Adha", 85478, "2026-05-19"),
          _cab("PM decision: Thursday 18 June 2026 Hijri New Year instead of 1 Muharram 1448", 85596, "2026-06-08"),
          _cab("PM decision: Thursday 2 July 2026 instead of Tuesday 30 June", 85705, "2026-06-23"),
          _cab("PM decision: Thursday 23 July 2026", 85811, "2026-07-14"),
          _cab("PM decision: Thursday 27 August 2026 Mawlid instead of Tuesday 25 August (12 Rabi I 1448)", 86001,
               "2026-08-17"),
          _cab("PM decision: Thursday 8 October 2026 instead of Tuesday 6 October", 86219, "2026-09-29"),
          _d("SIS: Dar al-Ifta announces Friday as the first day of Eid ul-Fitr (2026)",
             "https://web.archive.org/web/20260331062747/https://sis.gov.eg/en/media-center/news/"
             "dar-al-ifta-announces-friday-as-the-first-day-of-eidul-fitr/", None, None,
             "State Information Service news (via python-holidays reference; not fetched)",
             "not fetched; cited from python-holidays 0.109 references")],
    days=[("01-07", XMAS, 1), ("01-29", moved(JAN25, "01-25"), 2)]
         + _block("fitr", "03-19", "03-23", "03-20", 3)
         + [("04-13", SHAM, 4), ("04-25", SINAI, 5), ("05-07", moved(LABOUR, "05-01"), 6)]
         + _block("adha", "05-26", "05-31", "05-27", 7)
         + [("06-18", moved(HNY, "06-16"), 8), ("07-02", moved(JUN30, "06-30"), 9), ("07-23", JUL23, 10),
            ("08-27", moved(MAWLID, "08-25"), 11), ("10-08", moved(OCT6, "10-06"), 12)],
    suppressed=[("01-25", JAN25, 2), ("05-01", LABOUR, 6), ("06-16", HNY, 8), ("06-30", JUN30, 9),
                ("08-25", MAWLID, 11), ("10-06", OCT6, 12)],
    working=[],
    notes="Eid al-Fitr 1447 = Fri 20 Mar; Eid al-Adha 1447 = Wed 27 May (Arafah Tue 26). 1 Muharram 1448 date "
          "(16 Jun) is a calendar estimate; the decree says only 'instead of 1 Muharram'. 1 May (Friday) moved "
          "FORWARD to Thu 7 May. Complete through November 2026 (no holidays in Nov-Dec).")

EG_ADHOC = [
    ("2012-06-16", "presidential election runoff day 1 (paid official holiday, state administration)",
     Y7 + "2012/6/13/الجنزورى-يقرر-اعتبار-يومى-الإعادة-إجازة-رسمية-مدفوعة-الأجر/704391", "issued 2012-06-13",
     "PM Kamal Ganzouri (youm7, secondary)"),
    ("2012-06-17", "presidential election runoff day 2 (paid official holiday, state administration)",
     Y7 + "2012/6/13/الجنزورى-يقرر-اعتبار-يومى-الإعادة-إجازة-رسمية-مدفوعة-الأجر/704391", "issued 2012-06-13",
     "PM Kamal Ganzouri (youm7, secondary)"),
    ("2012-12-15", "constitutional referendum round 1 (Saturday) official holiday", MANS + "3740",
     "issued 2012-12-13", "PM decree 1293/2012 (manshurat metadata)"),
    ("2012-12-22", "constitutional referendum round 2 (Saturday) official holiday", MANS + "3742",
     "issued 2012-12-19", "PM decree 1317/2012 (manshurat metadata)"),
    ("2014-05-27", "presidential election voting day 2: full official holiday", Y7 +
     "2014/5/26/رئيس-الوزراء-غدًا-إجازة-رسميا-نزولا-على-الإرادة-الشعبية/1689699", "issued 2014-05-26",
     "PM Ibrahim Mahlab (youm7, secondary)"),
    ("2014-06-08", "presidential inauguration of Abdel Fattah el-Sisi", Y7 +
     "2014/6/5/الحكومة-الأحد-إجازة-رسمية-احتفالا-بتنصيب-الرئيس-واستمرار-الامتحانات/1708036", "issued 2014-06-05",
     "Government / PM Mahlab (youm7, secondary)"),
    ("2015-08-06", "New Suez Canal opening (government only; private sector worked)", Y7 +
     "2015/8/4/مجلس-الوزراء-يقرر-الخميس-إجازة-رسمية-احتفالا-بقناة-السويس-الجديدة/2291493", "issued 2015-08-04",
     "Cabinet (youm7, secondary)"),
    ("2020-03-12", "bad-weather closure (paid leave, government and private sectors)", CAB + "360",
     "issued 2020-03-11", "Cabinet meeting / PM decree 632/2020 (manshurat 68038)"),
    ("2025-11-01", "Grand Egyptian Museum opening (Saturday; paid official holiday, government)", CAB + "84313",
     "issued 2025-10-25", "PM Madbouly at President Sisi's direction (cabinet release)"),
]

EG_FINDINGS = """EGYPT (EG) - findings

Statute chain (government employees):
- 1958 presidential decree (manshurat 61499, metadata only): eve + 3 days Eid al-Fitr, Arafah + 4 days Eid al-Adha.
- Presidential decree 14/1962 (feasts list), amended 225/1973 and 1540/1974 (pre-2000, scans cached).
- PM decree 382/1982 and PM decree 454/1987 (texts NOT found; known from recitals) = list in force 2000-2018.
- PM 2052/2002: 7 January paid holiday every year (from 2003; python-holidays has 2002+, disagreement: the
  decree is of late 2002, first observed 7 Jan 2003).
- PM 387/2009: 25 January Police Day (issued before 10 Feb 2009 -> first holiday 2010; python-holidays has
  2009+). PM 1355/2011 (gazette 44, 3 Nov 2011): 25 January Revolution + Police Day every year (from 2012).
- 30 June: no holiday in 2014 (none found; python-holidays has 2014+); annual PM decrees 2015 (1723/2015),
  2016, 2017 (1432/2017); in the list from PM 1193/2018.
- PM 1193/2018 (Official Gazette 26 bis, 2 Jul 2018; in force 3 Jul 2018): the current list (12 items, see
  EG_STATUTES). Repeals 454/1987. Taba (19 Mar) and Evacuation (18 Jun) are school-only.
- PM 1249/2020 (Official Gazette 26 bis, 28 Jun 2020): PM may substitute a day at the start/end of the working
  week -> the Thursday/Sunday moves.
- Private sector (not in the gold): Labour Law 12/2003 art. 52 + minister decisions 112/2003 (Waqa'i 161,
  19 Jul 2003) and 49/2009 (Waqa'i 39, 16 Feb 2009); Labour Law 14/2025 art. 129 + decision 294/2025.

Every year a separate PM decree names each holiday's date, including fixed ones; the yearly decree wins over
the list. Moves (see EG_OTHER_RULES 'weekend-move-pre2020' and 'thursday-move'):
2011 Sinai 25->24 Apr; 2014 Sinai 25->24 Apr; 2017 30 Jun->29 Jun, 6 Oct->5 Oct, Mawlid 1 Dec->30 Nov;
2018 30 Jun->1 Jul, 6 Oct->7 Oct; 2019 25 Jan->24 Jan, Mawlid 9->10 Nov; 2020 1 May->2 May, 30 Jun->2 Jul,
6 Oct->8 Oct; 2021 25 Jan->28 Jan, 25 Apr->29 Apr, 30 Jun->1 Jul, Hijri 9 Aug->12 Aug, 6 Oct->7 Oct, Mawlid
19->21 Oct; 2022 7 Jan->6 Jan, 25 Jan->27 Jan; 2023 7 Jan->8 Jan, 25 Jan->26 Jan, 1 May->4 May, Hijri 19->20
Jul, Mawlid 27->28 Sep, 6 Oct->5 Oct; 2024 1 May->5 May, Hijri 7->11 Jul, 23 Jul->25 Jul; 2025 25 Apr->24 Apr,
30 Jun->3 Jul, 23 Jul->24 Jul, 6 Oct->9 Oct; 2026 25 Jan->29 Jan, 1 May->7 May, Hijri 16->18 Jun, 30 Jun->2 Jul,
Mawlid 25->27 Aug, 6 Oct->8 Oct. Not moved although mid-week/weekend: 2024 Sundays (7 Jan, 30 Jun, 15 Sep,
6 Oct), 2025 Tue 7 Jan, Sat 25 Jan, Thu 1 May, 2026 Sat 25 Apr, Wed 7 Jan.

Sham el-Nessim: Monday after Orthodox Easter; in the list since 454/1987 (and 112/2003 for private sector);
declared each year by its own PM decree (e.g. 923/2020, 897/2021; cabinet releases 2022-2026). Never moved.

Eid blocks (government, final dates):
2008 F 30 Sep-3 Oct | 2010 F 9-12 Sep | 2011 F 30 Aug-2 Sep, A 5-9 Nov | 2012 F 18-21 Aug, A 25-29 Oct |
2014 F 28-31 Jul, A 3-7 Oct | 2015 F 17-20 Jul, A 23-27 Sep (PM 2508/2015) | 2016 F 5-7 Jul, A 11-15 Sep |
2017 F 25-27 Jun (1427/2017), A 31 Aug-4 Sep (1881/2017) | 2018 F 16-18 Jun (1115/2018), A 20-24 Aug
(1543/2018) | 2019 F 4-6 Jun, A 10-14 Aug | 2020 F 23-28 May, A 30 Jul-3 Aug (1470/2020) | 2021 F 12-16 May
(933/2021), A 17-24 Jul (1625+1662/2021) | 2022 F+1 May 30 Apr-5 May, A 9-14 Jul | 2023 F+25 Apr 20-25 Apr,
A+30 Jun 27 Jun-3 Jul | 2024 F 9-14 Apr, A 15-20 Jun | 2025 F 29 Mar-1 Apr, A 5-9 Jun | 2026 F 19-23 Mar,
A 26-31 May.
Estimated (not found): 2008 A, 2009 F and A, 2010 A, 2013 F and A (inferred from embassy/bourse closures).

Confidence: 2017-2026 primary (gazette scans on manshurat.org: 1193/2018, 1249/2020, 1427/2017, 1881/2017,
1995/2017, 1151/2018, 1543/2018, 2384/2018, 933/2021; cabinet.gov.eg releases for 2018-2026; a few 2017-2019
fixed days from the statute only). 2014-2016 secondary (youm7 reports quoting cabinet decisions; only PM
1723/2015 and 2508/2015 numbers known). 2008-2013 secondary and partly estimated (youm7). 2000-2007 MISSING:
no source reached (Wayback was down during this run; search engines barely index pre-2008 Egyptian news);
use EG_FIXED/EG_ISLAMIC/EG_OTHER_RULES to estimate (7 Jan from 2003). 2027: no decrees yet (as of 2026-11-28);
estimate with the rules and the thursday-move policy.

Islamic dates: from decree texts/cabinet releases where the block or day is decreed; Dar al-Ifta release for
1 Muharram 1443 (9 Aug 2021). Several pre-2014 Mawlid / Hijri-NY dates and the 1 Muharram dates that decrees
replace 'instead of' (2023, 2024, 2026) are calendar/general-knowledge estimates and are labelled in notes.

Disagreements with python-holidays 0.109 (decree wins): Christmas from 2003 not 2002; 25 Jan from 2010 not
2009; 30 Jun from 2015 not 2014; its observed rule (Sun+4, Mon+3, Tue+2, Wed+1 from 2020) is wrong for 2024
Sundays, Fri/Sat cases (2022/2023 Christmas, 2025 Sinai, 2026 May 1) and 2024 May 1 (Sunday 5 May); 2021 Hijri
NY 11 Aug vs Dar al-Ifta 9 Aug; 2022 Adha 10 Jul vs 9 Jul; 2019 Fitr eve 3 Jun not in the decision; Eid
extension days (e.g. 2024 Fitr 13-14 Apr, 2026 Adha 31 May) and multi-day bridges missing in python-holidays.

One-offs in EG_ADHOC (not in days): 2012 runoff and referendum days, 2014 election day and inauguration,
2015 Suez Canal, 2020 weather closure, 2025 GEM opening.

Sources: https://manshurat.org/node/44922 (1193/2018), /66981 (1249/2020), /4786 (1355/2011), /3116
(537/2011), /12120, /12184, /61499, /59195; https://www.cabinet.gov.eg/News/Details/<id> (ids in docs);
youm7 stories (paths in docs); presidency.eg 2025 list (Wayback). WebSearch quota ran out late in the run.
"""


# --- main agent: rule days the starter computes in every year (the generator calls this) ---
def rule_days(year, gen):
    """Sham el-Nessim: the Monday after Orthodox Easter (pm-454-1987 / pm-1193-2018 item 7)."""
    from datetime import timedelta
    return [(gen.easter_orthodox(year) + timedelta(days=1), "شم النسيم")]
