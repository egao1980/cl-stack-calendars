"""Oman (OM) official holidays -- research module for cl-stack-calendars#44.

Scope: government sector (units of the State's Administrative Apparatus); since
RD 56/2020 the same list also binds the private sector.  Every fetched original
is cached under ~/.cache/cl-stack-calendars/om/ (file name given in each doc's
"cache" key; .txt next to each .html is a plain-text rendering).

Conventions for OM_YEARS[*]["days"]: every calendar day of an announced holiday
block from its stated first day to its stated last day (weekend days inside the
block included).  When an announcement gives only a start and a "work resumes
on" date, the block runs to the last day of the decree span (29 Ramadan-3
Shawwal / 9-12 Dhu al-Hijja) or, when the resume date is later than the first
working day after that span, to the last Sunday-Thursday day before the resume
date; such cases say so in "notes".
Weekend: Thu-Fri until 2013-04-30, Fri-Sat from 2013-05-01 (src/weekends.lisp).
Stdlib only.
"""

def _ona(path):
    return "https://omannews.gov.om/topics/" + path

_ONA_REL = "official news release (ONA, Oman News Agency)"

def _d(title, uri, date, cache, published_in=_ONA_REL, issued=None, note=None):
    """Doc helper: ONA/newspaper items are dated by their release date."""
    return dict(title=title, uri=uri,
                issued=issued or date, issued_uri=uri,
                published=date, published_uri=uri,
                published_in=published_in, dates_note=note, cache=cache)

_OBS = "Oman Observer (secondary; reports ONA / the ministerial decision)"
_TOM = "Times of Oman (secondary; reports ONA / the ministerial decision)"

# ---------------------------------------------------------------------------
OM_STATUTES = [
    dict(key="rd-56-91",
         title="المرسوم السلطاني رقم 56/91 بتحديد أيام العطلات الرسمية (Royal Decree 56/91 Determining the Dates of Official Holidays)",
         uri="https://qanoon.om/p/1996/rd1996076/",
         issued=None, issued_uri=None, published=None, published_uri=None,
         published_in=None, in_force=None,
         dates_note="Not read: known only as the predecessor cited in the preamble of RD 76/96. "
                    "Superseded by RD 76/96 from 1996-10-01, i.e. before the 2000-2027 window.",
         summary="Earlier government holiday list (superseded 1996). Out of the research window."),
    dict(key="rd-76-96",
         title="المرسوم السلطاني رقم 76/96 بتحديد أيام العطلات الرسمية (Royal Decree 76/96 Determining the Dates of Official Holidays)",
         uri="https://qanoon.om/p/1996/rd1996076/",
         issued="1996-09-28", issued_uri="https://qanoon.om/p/1996/rd1996076/",
         published="1996-10-01", published_uri="https://decree.om/1996/rd19960076/",
         published_in="الجريدة الرسمية العدد 584 الصادر في 1/10/1996 (Official Gazette 584)",
         in_force="1996-10-01", dates_note=None,
         summary="Government (ministries, public authorities, state apparatus) only. "
                 "First: Hijri New Year 1 Muharram; Mawlid 12 Rabi I; Isra wal Mi'raj 27 Rajab; "
                 "National Day 18 and 19 November -- if one or both weekend days fall within these "
                 "holidays, compensated by ONE day; the National Day date may be amended in the public "
                 "interest. Second: Eid al-Fitr from 29 Ramadan to 3 Shawwal; Eid al-Adha 9-12 Dhu "
                 "al-Hijja; Friday is compensated if it is the first day of either Eid. In force from "
                 "publication. NO Renaissance Day (23 July) in the list -- that was granted by annual "
                 "decision (see 'diwan-annual-renaissance'). Private sector: separate Ministry of "
                 "Manpower decisions under the Labour Law. Cache: om/qanoon-rd1996-76.html, "
                 "om/decree-om-rd1996-76.html (English)."),
    dict(key="diwan-annual-renaissance",
         title="قرارات وزير ديوان البلاط السلطاني رئيس مجلس الخدمة المدنية السنوية بإجازة 23 يوليو (annual Renaissance Day decisions of the Minister of the Diwan of Royal Court, Chairman of the Civil Service Council)",
         uri="https://www.omanobserver.om/ampArticle/28285",
         issued=None, issued_uri=None, published=None, published_uri=None,
         published_in="annual decisions reported by ONA (seen via Oman Observer 2017-07-16, 2018-07-16, 2019-07-17)",
         in_force=None,
         dates_note="Not a standing statute: one decision per year (e.g. 2019-07-17, 2018-07-16, "
                    "2017-07-16), each declaring 23 July an official holiday for the state apparatus; "
                    "a parallel Minister of Manpower decision covered the private sector. Ended with RD "
                    "56/2020 (list without 23 July); no 23 July holiday was announced from 2020.",
         summary="23 July Renaissance Day (يوم النهضة المباركة) holiday, one day, by annual decision."),
    dict(key="rd-56-2020",
         title="المرسوم السلطاني رقم 56/2020 بتحديد أيام الإجازات الرسمية (Royal Decree 56/2020 Determining the Official Holidays)",
         uri="https://qanoon.om/p/2020/rd2020056/",
         issued="2020-04-20", issued_uri=_ona("ar/112/show/377750"),
         published="2020-04-26", published_uri="https://qanoon.om/p/2020/rd2020056/",
         published_in="الجريدة الرسمية العدد 1339 الصادر في 26/4/2020 (Official Gazette 1339)",
         in_force="2020-04-20", dates_note=None,
         summary="Same list as RD 76/96 (Hijri NY 1 Muharram, Mawlid 12 Rabi I, Isra wal Mi'raj 27 "
                 "Rajab, National Day 18-19 Nov, Eid al-Fitr 29 Ramadan-3 Shawwal, Eid al-Adha 9-12 Dhu "
                 "al-Hijja, one-day weekend compensation, Friday-first-day-of-Eid compensation, National "
                 "Day date amendable) but now for the state apparatus, other legal persons AND the "
                 "private sector. Repeals RD 76/96. In force from issue (2020-04-20). No Renaissance Day, "
                 "no Accession Day. Cache: om/qanoon-rd2020-56.html, om/ona-ar-112-show-377750.html."),
    dict(key="rd-88-2022",
         title="المرسوم السلطاني رقم 88/2022 بتحديد أيام الإجازات الرسمية (Royal Decree 88/2022 Determining the Official Holidays)",
         uri="https://qanoon.om/p/2022/rd2022088/",
         issued="2022-12-07", issued_uri=_ona("ar/85/show/411345"),
         published="2022-12-11", published_uri="https://qanoon.om/p/2022/rd2022088/",
         published_in="الجريدة الرسمية العدد 1471 الصادر في 11/12/2022 (Official Gazette 1471)",
         in_force="2022-12-07", dates_note=None,
         summary="Repeals RD 56/2020. Same list (National Day still 18 and 19 November) plus (هـ) يوم "
                 "تولي السلطان مقاليد الحكم في البلاد -- the Sultan's Accession Day, given WITHOUT a date "
                 "(the anniversary is 11 January). Compensation now applies to all listed holidays; the "
                 "date of ANY listed holiday may be modified in the public interest. Eids unchanged. "
                 "Cache: om/qanoon-rd2022-88.html, om/ona-ar-85-show-411345.html, om/ona-en-102-show-111049.html."),
    dict(key="rd-15-2025",
         title="المرسوم السلطاني رقم 15/2025 بتعديل بعض أحكام المرسوم السلطاني رقم 88/2022 (Royal Decree 15/2025 amending RD 88/2022)",
         uri="https://qanoon.om/p/2025/rd2025015/",
         issued="2025-01-21", issued_uri="https://qanoon.om/p/2025/rd2025015/",
         published="2025-01-26", published_uri="https://qanoon.om/p/2025/rd2025015/",
         published_in="الجريدة الرسمية العدد 1581 الصادر في 26/1/2025 (Official Gazette 1581)",
         in_force="2025-01-21", dates_note=None,
         summary="Replaces item (d): 'اليوم الوطني لسلطنة عمان' (National Day of the Sultanate of Oman) "
                 "on 20 and 21 November (was 18-19 November). Cache: om/qanoon-rd2025-15.html."),
    dict(key="com-2025-advance",
         title="مجلس الوزراء يقرّ سياسة الإعلان المُسبق عن تحديد مواعيد الإجازات الوطنية والدينية سنويًّا (Council of Ministers policy of advance annual announcement of national and religious holidays)",
         uri=_ona("ar/3/show/461682"),
         issued="2025-12-28", issued_uri=_ona("en/79/show/126213"),
         published="2025-12-28", published_uri=_ona("ar/3/show/461682"),
         published_in=_ONA_REL, in_force="2026-01-01", dates_note=None,
         summary="From 2026 the Ministry of Labour publishes at the start of each Gregorian year the "
                 "dates of Accession Day, National Day, Isra wal Mi'raj, Hijri New Year and Mawlid; the "
                 "two Eids stay announced after the moon-sighting committee. Lists the 2026 dates."),
]

# ---------------------------------------------------------------------------
OM_FIXED = [
    (7, 23, "يوم النهضة المباركة (Renaissance Day)", [(2000, 2019)], "diwan-annual-renaissance"),
    (11, 18, "العيد الوطني المجيد (National Day)", [(2000, 2019)], "rd-76-96"),
    (11, 19, "العيد الوطني المجيد (National Day)", [(2000, 2019)], "rd-76-96"),
    (11, 18, "العيد الوطني المجيد (National Day)", [(2020, 2022)], "rd-56-2020"),
    (11, 19, "العيد الوطني المجيد (National Day)", [(2020, 2022)], "rd-56-2020"),
    (11, 18, "العيد الوطني المجيد (National Day)", [(2023, 2024)], "rd-88-2022"),
    (11, 19, "العيد الوطني المجيد (National Day)", [(2023, 2024)], "rd-88-2022"),
    (11, 20, "اليوم الوطني لسلطنة عمان (National Day)", [(2025, None)], "rd-15-2025"),
    (11, 21, "اليوم الوطني لسلطنة عمان (National Day)", [(2025, None)], "rd-15-2025"),
    (1, 11, "يوم تولي السلطان مقاليد الحكم (Sultan's Accession Day)", [(2023, None)], "rd-88-2022"),
]
# NB: the statutory National Day dates were overridden by announcement EVERY year
# 2016-2026 (see OM_YEARS); the fixed rows are only the statutory default.

# ---------------------------------------------------------------------------
# One set in every era (RD 76/96, 56/2020 and 88/2022 list the same days).
# Used only to estimate years with no announcements. The Eid al-Fitr block
# runs from 29 Ramadan to 3 Shawwal (tabular Ramadan has 30 days).
OM_ISLAMIC = [
    (1, 1, [0], "رأس السنة الهجرية (Hijri New Year)", [(2000, None)], "rd-88-2022"),
    (3, 12, [0], "المولد النبوي الشريف (Prophet's Birthday)", [(2000, None)], "rd-88-2022"),
    (7, 27, [0], "الإسراء والمعراج (Isra wal Mi'raj)", [(2000, None)], "rd-88-2022"),
    (9, 29, [0, 1], "عيد الفطر المبارك (Eid al-Fitr, 29-30 Ramadan)", [(2000, None)], "rd-88-2022"),
    (10, 1, [0, 1, 2], "عيد الفطر المبارك (Eid al-Fitr, 1-3 Shawwal)", [(2000, None)], "rd-88-2022"),
    (12, 9, [0, 1, 2, 3], "عيد الأضحى المبارك (Eid al-Adha, 9-12 Dhu al-Hijja)", [(2000, None)], "rd-88-2022"),
]

# ---------------------------------------------------------------------------
OM_OTHER_RULES = [
    dict(rule="weekend-compensation",
         text="If one or both weekly rest days fall within the 'First' holidays (Hijri NY, Mawlid, Isra "
              "Mi'raj, National Day; from RD 88/2022 also Accession Day), they are compensated by ONE "
              "day. In practice the Ministry of Labour (before 2020: the Minister of the Diwan as Chairman "
              "of the Civil Service Council) names the compensating day, usually the adjacent Sunday or "
              "Thursday (e.g. Mawlid 2019 Sat 9 Nov -> Sun 10 Nov; Hijri NY 2022 Sat 30 Jul -> Sun 31 Jul; "
              "Isra 2023 Sat 18 Feb -> Sun 19 Feb; Mawlid 2025 Fri 5 Sep -> Sun 7 Sep).",
         sources=["rd-76-96", "rd-56-2020", "rd-88-2022"]),
    dict(rule="eid-friday-compensation",
         text="Friday is compensated if it is the first day of either Eid (all three decrees). The "
              "announced Eid blocks often add further days by Royal order (e.g. Adha 2020 to 16 Dhu "
              "al-Hijja, Adha 2024 to 13 Dhu al-Hijja, Fitr 2025 to 4 Shawwal).",
         sources=["rd-76-96", "rd-56-2020", "rd-88-2022"]),
    dict(rule="date-moves-by-announcement",
         text="National Day (and from RD 88/2022 any listed holiday) may be moved in the public "
              "interest; the National Day holiday was moved every year checked (2016-2026), typically "
              "to a Wed-Thu or Sun-Mon pair adjoining the weekend. Accession Day: 2023 Thu 12 Jan, 2024 "
              "Thu 11 Jan, 2025 Sun 12 Jan, 2026 Thu 15 Jan.",
         sources=["rd-76-96", "rd-56-2020", "rd-88-2022", "rd-15-2025"]),
    dict(rule="eid-dates-by-moon-sighting",
         text="Eid and Hijri dates are those of Oman's own Main Committee for Sighting the Hijri Month "
              "Crescents (اللجنة الرئيسية لتحديد أهلة الشهور الهجرية, Ministry of Endowments and Religious "
              "Affairs), which often differs by a day from Saudi Arabia (e.g. Fitr 2019 Wed 5 Jun, 2023 "
              "Sat 22 Apr, 2025 Mon 31 Mar).",
         sources=[]),
    dict(rule="issuing-authority",
         text="Up to 2020: Minister of the Diwan of Royal Court, Chairman of the Civil Service Council "
              "(government) + Minister of Manpower (private sector, sometimes different/shorter dates, "
              "e.g. Fitr 2019 private 4-6 Jun). From late 2020: Minister of Labour, one decision for "
              "both sectors. From 2026: advance annual list (com-2025-advance) except the Eids.",
         sources=["rd-76-96", "rd-56-2020", "com-2025-advance"]),
]

# ---------------------------------------------------------------------------
def _span(m1, d1, m2, d2, name, doc, year):
    """All MM-DD from (m1,d1) to (m2,d2) inclusive within one year."""
    import datetime as _dt
    a, b = _dt.date(year, m1, d1), _dt.date(year, m2, d2)
    out = []
    while a <= b:
        out.append((a.strftime("%m-%d"), name, doc))
        a += _dt.timedelta(days=1)
    return out

FITR = "عيد الفطر المبارك (Eid al-Fitr holiday)"
ADHA = "عيد الأضحى المبارك (Eid al-Adha holiday)"
HNY = "رأس السنة الهجرية (Hijri New Year)"
MAWLID = "المولد النبوي الشريف (Prophet's Birthday)"
ISRA = "الإسراء والمعراج (Isra wal Mi'raj)"
ND = "العيد الوطني (National Day holiday)"
REN = "يوم النهضة المباركة (Renaissance Day)"
ACC = "يوم تولي السلطان مقاليد الحكم (Sultan's Accession Day)"

OM_YEARS = {}

# -- 2015 ------------------------------------------------------------------
OM_YEARS[2015] = dict(
    confidence="secondary",
    docs=[
        _d("Saudi, Qatar, Oman announce Eid holidays of up to 12 days (quotes ONA: Diwan decision on Eid al-Fitr 1436 for the state apparatus)",
           "https://web.archive.org/web/2015id_/http://www.arabianbusiness.com/saudi-qatar-oman-announce-eid-holidays-of-up-12-days-599356.html",
           "2015-07-14", "om/wb-ab-599356-fitr2015.html", "Arabian Business (secondary), via Wayback",
           note="Article date approximate (mid-July 2015); the decision text is quoted from ONA."),
    ],
    days=_span(7, 16, 7, 20, FITR, 0, 2015),
    suppressed=[], working=[],
    notes="ONLY Eid al-Fitr found: Diwan decision 'from Thursday 29 Ramadan 1436 = 16 July 2015 till the "
          "end of Monday 20 July; work resumes Tuesday 21 July'. Eid al-Adha, Renaissance Day, Hijri NY, "
          "Mawlid, Isra and the National Day announcements for 2015 were NOT found (missing).",
)

# -- 2016 ------------------------------------------------------------------
OM_YEARS[2016] = dict(
    confidence="secondary",
    docs=[
        _d("Eid holidays announced in Oman (Diwan + Manpower decision, Eid al-Fitr 1437)",
           "https://timesofoman.com/article/12076-eid-holidays-announced-in-oman", "2016-06-27",
           "om/wb-tom-12076-fitr2016.html", _TOM),
        _d("Eid Al Adha holiday announced in Oman (1437)",
           "https://timesofoman.com/article/16911-eid-al-adha-holiday-announced-in-oman", "2016-09-05",
           None, _TOM,
           note="Page not cached (site now serves other content, Wayback offline at the time); dates "
                "taken from the search-engine excerpt of this article: 'from 9 Dhulhijjah 1437, 11 Sep "
                "2016, till 13 Dhulhijjah, 15 Sep 2016; work resumes 18 Sep 2016'."),
        _d("National Day holidays expected to boost business in Oman (quotes the 46th National Day decision)",
           "https://timesofoman.com/article/21877-national-day-holidays-expected-to-boost-business-in-oman",
           "2016-11-16", "om/wb-tom-21877-nd2016.html", _TOM),
    ],
    days=(_span(7, 5, 7, 8, FITR, 0, 2016) + _span(9, 11, 9, 15, ADHA, 1, 2016)
          + [("11-23", ND, 2), ("11-24", ND, 2)]),
    suppressed=[("11-18", ND, 2)],
    working=[],
    notes="Fitr: 'from Tuesday 29 Ramadan 1437 = 5 July 2016 till 3 Shawwal; work resumes Sunday 10 "
          "July' -> 5-8 July (Eid Wed 6 July in Oman, 3 Shawwal = Fri 8 July; Sat 9 weekend). National Day "
          "moved to Wed-Thu 23-24 Nov (18 Nov 2016 was a Friday; 19 Nov Sat). Renaissance Day, Hijri NY, "
          "Mawlid (12 Rabi I 1438 ~ 11-12 Dec), Isra (27 Rajab 1437 ~ 4-5 May) announcements not found.",
)
# 11-19-2016 was a Saturday (weekend) -- suppressing 11-18 only (Friday) is moot; both statutory
# days fell on the weekend and were replaced by 23-24 Nov.
OM_YEARS[2016]["suppressed"] = [("11-18", ND, 2), ("11-19", ND, 2)]

# -- 2017 ------------------------------------------------------------------
OM_YEARS[2017] = dict(
    confidence="secondary",
    docs=[
        _d("Eid holidays for Oman announced; work resumes on July 2 (Diwan decision, Eid al-Fitr 1438)",
           "https://www.omanobserver.om/ampArticle/79298", "2017-06-18", "om/obs-79298-fitr2017.html", _OBS),
        _d("Renaissance Day holiday declared (23 July, Diwan decision)",
           "https://www.omanobserver.om/ampArticle/77530", "2017-07-16", "om/obs-77530-ren.html", _OBS),
        _d("Just in: holidays for Eid al Adha announced in Oman (1438)",
           "https://www.omanobserver.om/article/74554/Front%20Stories/just-in-holidays-for-eid-al-adha-announced-in-oman",
           "2017-08-28", "om/obs-74554-adha2017.html", _OBS),
        _d("December 3, 4, 5 holidays (Diwan: National Day 3-4 Dec, Prophet's Birthday 5 Dec; ONA)",
           "https://www.omanobserver.om/ampArticle/68491", "2017-11-19", "om/obs-68491-dec2017.html", _OBS),
    ],
    days=(_span(6, 24, 6, 29, FITR, 0, 2017) + [("07-23", REN, 1)]
          + _span(8, 31, 9, 4, ADHA, 2, 2017)
          + [("12-03", ND, 3), ("12-04", ND, 3), ("12-05", MAWLID, 3)]),
    suppressed=[("11-18", ND, 3), ("11-19", ND, 3)],
    working=[],
    notes="Fitr: 'from Saturday 29 Ramadan 1438 = 24 June; work resumes Sunday 2 July' -> block 24-29 "
          "June (Fri 30 Jun / Sat 1 Jul weekend). Adha: 31 Aug (Thu) - 4 Sep (Mon), work 5 Sep. National "
          "Day moved to Sun-Mon 3-4 Dec and Mawlid (12 Rabi I 1439 = Fri 1 Dec in Oman) compensated on Tue "
          "5 Dec. Renaissance Day 23 July was a Sunday. Hijri NY (1 Muharram 1439 ~ Thu 21 Sep) and Isra "
          "(~ Mon 24 Apr) announcements not found (missing).",
)

# -- 2018 ------------------------------------------------------------------
OM_YEARS[2018] = dict(
    confidence="secondary",
    docs=[
        _d("Holidays from June 14 to 18 (Diwan decision, Eid al-Fitr 1439)",
           "https://www.omanobserver.om/ampArticle/54954", "2018-06-06", "om/obs-54954-fitr2018.html", _OBS),
        _d("Renaissance Day holiday announced (Monday 23 July, Diwan + Manpower decisions)",
           "https://www.omanobserver.om/article/52430/Head%20stories/renaissance-day-holiday-announced",
           "2018-07-16", "om/obs-52430-ren.html", _OBS),
        _d("Eid al Adha holidays from August 19 to 23 (Diwan decision, 1439)",
           "https://www.omanobserver.om/article/50369/Head%20stories/eid-al-adha-holidays-from-august-19-to-23",
           "2018-08-13", "om/obs-50369-adha2018.html", _OBS),
        _d("Holiday for Prophet Birthday, 48th National Day for public and private sectors announced",
           "https://www.omanobserver.om/article/43818/Front%20Stories/holiday-for-prophet-birthday-48th-national-day-for-public-and-private-sectors-announced",
           "2018-11-11", "om/obs-43818-2018-mawlid-nd.html", _OBS),
    ],
    days=(_span(6, 14, 6, 18, FITR, 0, 2018) + [("07-23", REN, 1)]
          + _span(8, 19, 8, 23, ADHA, 2, 2018)
          + [("11-20", MAWLID, 3), ("11-21", ND, 3), ("11-22", ND, 3)]),
    suppressed=[("11-18", ND, 3), ("11-19", ND, 3)],
    working=[],
    notes="Fitr 14-18 June (Thu-Mon), work 19 June. Adha Sun 8 Dhu al-Hijja = 19 Aug to Thu 23 Aug, "
          "work Sun 26 Aug. Combined Mawlid + 48th National Day holiday 'from Tuesday 12 Rabi I 1440 = 20 "
          "Nov till the end of Thursday 14 Rabi I = 22 Nov' (labelling 20 Nov Mawlid and 21-22 Nov National "
          "Day is ours: the decision covers both occasions jointly). Hijri NY (1 Muharram 1440 ~ Tue 11 "
          "Sep) and Isra (~ Fri 13 Apr) announcements not found (missing).",
)

# -- 2019 ------------------------------------------------------------------
OM_YEARS[2019] = dict(
    confidence="secondary",
    docs=[
        _d("Isra'a Wal Miraj holiday announced in Oman (Wed-Thu 3-4 April, Diwan)",
           "https://www.omanobserver.om/article/34963/Front%20Stories/israa-wal-miraj-holiday-announced-in-oman",
           "2019-03-27", "om/obs-34963-isra.html", _OBS),
        _d("Eid Al Fitr holiday for public, private sectors announced (Diwan; Manpower)",
           "https://www.omanobserver.om/ampArticle/31210", "2019-05-28", "om/obs-31210-fitr2019.html", _OBS),
        _d("Renaissance Day holiday on Tuesday (Diwan + Manpower)",
           "https://www.omanobserver.om/ampArticle/28285", "2019-07-17", "om/obs-28285-ren2019.html", _OBS),
        _d("Eid al Adha holidays from August 11 to 15 (Diwan decision)",
           "https://www.omanobserver.om/article/27099/Head%20stories/eid-al-adha-holidays-from-august-11-to-15",
           "2019-08-05", "om/obs-27099-adha2019.html", _OBS),
        _d("الأحد القادم .. إجازة رسمية بمناسبة ذكرى المولد النبوي الشريف (Diwan decision: Sun 10 Nov in lieu of Sat 9 Nov)",
           _ona("ar/112/show/374819"), "2019-11-03", "om/ona-ar-112-show-374819.html"),
        _d("بأوامر سامية.. 27 و28 نوفمبر إجازة رسمية بمناسبة العيد الوطني الـ (49) (Diwan decision)",
           _ona("ar/112/show/382397"), "2019-11-17", "om/ona-ar-112-show-382397.html"),
        _d("Sultanate celebrates first day of Eid today / Shawwal crescent sighted: Eid on Wednesday",
           "https://www.omanobserver.om/ampArticle/30818", "2019-06-04", "om/obs-30818-eid2019.html", _OBS),
    ],
    days=([("04-03", ISRA, 0), ("04-04", ISRA, 0)] + _span(6, 4, 6, 7, FITR, 1, 2019)
          + [("07-23", REN, 2)] + _span(8, 11, 8, 15, ADHA, 3, 2019)
          + [("11-10", MAWLID, 4), ("11-27", ND, 5), ("11-28", ND, 5)]),
    suppressed=[("11-09", MAWLID, 4), ("11-18", ND, 5), ("11-19", ND, 5)],
    working=[],
    notes="Isra wal Mi'raj: TWO days, 27-28 Rajab 1440 = 3-4 April (python-holidays has one). Fitr "
          "(government): from Tue 29 Ramadan = 4 June till 3 Shawwal (Fri 7 June, Eid Wed 5 June in "
          "Oman), work Sun 9 June; the private sector got only 4-6 June. Adha: Sun 9 Dhu al-Hijja = 11 Aug "
          "- Thu 13 Dhu al-Hijja = 15 Aug, work 18 Aug. Mawlid 12 Rabi I = Sat 9 Nov -> Sun 10 Nov. "
          "National Day moved to Wed-Thu 27-28 Nov. Hijri NY 1441 (1 Muharram ~ Sat 31 Aug / Sun 1 Sep) "
          "announcement not found (missing). Confidence 'secondary' because most items come via Oman "
          "Observer; the November items are primary (ONA).",
)

# -- 2020 ------------------------------------------------------------------
OM_YEARS[2020] = dict(
    confidence="primary",
    docs=[
        _d("Government issues statement on official mourning in Oman (work suspended Sun-Tue 12-14 Jan)",
           "https://timesofoman.com/article/84018-government-issues-statement-on-official-mourning-in-oman",
           "2020-01-11", "om/tom-84018-mourning2020.html", _TOM),
        _d("Isra'a Wal Miraj Holiday Announced (Diwan/Civil Service Council decision: Sunday 22 March)",
           _ona("en/2/show/847"), "2020-03-15", "om/ona-en-2-show-847.html"),
        _d("تحديد إجازة عيد الفطر المبارك لعام 1441هـ للجهاز الإداري للدولة",
           _ona("ar/112/show/378020"), "2020-05-20", "om/ona-ar-112-show-378020.html"),
        _d("غدًا.. السلطنة تحتفل بأول أيام عيد الفطر المبارك (Eid = Sunday 24 May)",
           _ona("ar/112/show/378060"), "2020-05-23", "om/ona-ar-112-show-378060.html"),
        _d("HM Greets Omanis ... Issues Royal Directives to Extend Holidays (Eid al-Adha to Thu 6 Aug)",
           _ona("en/102/show/1390"), "2020-07-27", "om/ona-en-102-show-1390.html"),
        _d("غدًا غرة شهر ذي الحجة لعام 1441هـ (Eid al-Adha = Friday 31 July)",
           _ona("ar/112/show/378792"), "2020-07-21", "om/ona-ar-112-show-378792.html"),
        _d("تحديد إجازة ذكرى الهجرة النبوية الشريفة والعام الهجري الجديد 1442هـ (if 1 Muharram is Fri 21 Aug -> Sun 23 Aug)",
           _ona("ar/112/show/379036"), "2020-08-17", "om/ona-ar-112-show-379036.html"),
        _d("Holiday announced in Oman for Prophet's birthday (Minister of Labour: Thu 29 Oct)",
           "https://timesofoman.com/article/94466-holiday-announced-in-oman-for-prophets-birthday-2",
           "2020-10-22", "om/tom-94466-mawlid2020.html", _TOM),
        _d("بأوامر سامية.. إجازة العيد الوطني 25 و26 نوفمبر (Minister of Labour)",
           _ona("ar/112/show/380137"), "2020-11-12", "om/ona-ar-112-show-380137.html"),
        _d("Holiday announced for new Hijri year in Oman (Sunday 23 August)",
           "https://timesofoman.com/article/93308-holiday-announced-for-new-hijri-year-in-oman",
           "2020-08-17", "om/tom-93308-hny2020.html", _TOM),
    ],
    days=([("03-22", ISRA, 1)] + _span(5, 23, 5, 26, FITR, 2, 2020)
          + _span(7, 30, 8, 6, ADHA, 4, 2020)
          + [("08-23", HNY, 6), ("10-29", MAWLID, 7), ("11-25", ND, 8), ("11-26", ND, 8)]),
    suppressed=[("08-21", HNY, 6), ("11-18", ND, 8), ("11-19", ND, 8), ("07-23", REN, 1)],
    working=[],
    notes="12-14 Jan: three days of official mourning for Sultan Qaboos (death 10 Jan) with work "
          "suspended in both sectors -- listed in OM_ADHOC, not as a holiday. 11 Jan 2020 (accession of "
          "Sultan Haitham) was NOT a holiday. Renaissance Day 23 July dropped (RD 56/2020 of 20 Apr; no "
          "announcement). Fitr: from Sat 29 Ramadan = 23 May; Eid Sun 24 May -> alternative (a): ends Tue "
          "26 May, work Wed 27 May. Adha: Eid Fri 31 Jul (9 Dhu al-Hijja = Thu 30 Jul); the Royal directive "
          "of 27 Jul extended the holiday to Thu 6 Aug, work Sun 9 Aug (original 30 Jul-3 Aug decision "
          "not cached). Hijri NY: 1 Muharram 1442 = Fri 21 Aug -> holiday Sun 23 Aug. Isra 22 Mar was a "
          "Sunday (government decision; COVID closures ran in parallel).",
)

# -- 2021 ------------------------------------------------------------------
OM_YEARS[2021] = dict(
    confidence="primary",
    docs=[
        _d("الخميس القادم .. إجازة رسمية بمناسبة ذكرى الإسراء والمعراج (Minister of Labour decision: Thu 11 March)",
           _ona("ar/112/show/381520"), "2021-03-04", "om/ona-ar-112-show-381520.html"),
        _d("Eid al-Fitr holidays announced in Oman (Minister of Labour, from 12 May, two alternatives)",
           "https://www.omanobserver.om/article/1100376/oman/community/eid-al-fitr-holidays-announced-in-oman",
           "2021-05-09", "om/obs-1100376-fitr2021.html", _OBS),
        _d("First day of Eid al-Fitr on Thursday (13 May)",
           "https://www.omanobserver.om/ampArticle/1100748", "2021-05-11", "om/obs-1100748-eid2021.html", _OBS),
        _d("Eid Al Adha 1442 AH holiday for public, private sectors announced (18-22 July)",
           "https://www.omanobserver.om/article/1103690/oman/community/eid-al-adha-1442-ah-holiday-for-public-private-sectors-announced",
           "2021-07-11", "om/obs-1103690-adha2021.html", _OBS),
        _d("New Hijri year holiday on Tuesday (10 August)",
           "https://www.omanobserver.om/article/1105013/oman/new-hijri-year-holiday-on-tuesday",
           "2021-08-08", "om/obs-1105013-hny2021.html", _OBS),
        _d("Holiday for Prophet's birthday announced in Oman (Tuesday 19 October)",
           "https://www.omanobserver.om/ampArticle/1107988", "2021-10-12", "om/obs-1107988-mawlid2021.html", _OBS),
        _d("Upon HM Orders, National Day Holiday On Nov. 28, 29",
           _ona("en/79/show/106153"), "2021-11-07", "om/ona-en-106153.html"),
    ],
    days=([("03-11", ISRA, 0)] + _span(5, 12, 5, 15, FITR, 1, 2021)
          + _span(7, 18, 7, 22, ADHA, 3, 2021)
          + [("08-10", HNY, 4), ("10-19", MAWLID, 5), ("11-28", ND, 6), ("11-29", ND, 6)]),
    suppressed=[("11-18", ND, 6), ("11-19", ND, 6)],
    working=[],
    notes="No Accession Day holiday (RD 56/2020 has none; nothing announced for 11 Jan 2021). Fitr: from "
          "Wed 29 Ramadan = 12 May; Eid Thu 13 May -> alternative 1: ends Sat 15 May, work 16 May. Adha: "
          "Sun 8 Dhu al-Hijja = 18 Jul to Thu 22 Jul (Royal orders), work 25 Jul. Hijri NY Tue 10 Aug, "
          "Mawlid Tue 19 Oct. Fitr/Adha/HNY/Mawlid via Oman Observer (ONA originals not found by search); "
          "Isra and National Day primary (ONA).",
)

# -- 2022 ------------------------------------------------------------------
OM_YEARS[2022] = dict(
    confidence="primary",
    docs=[
        _d("الثلاثاء الأول من مارس إجازة رسمية ... بمناسبة ذكرى الإسراء والمعراج",
           _ona("ar/3/show/398069"), "2022-02-20", "om/ona-ar-3-show-398069.html"),
        _d("At HM Behest, Eid Al Fitr 1443 AH Holiday Announced (1-5 May)",
           _ona("en/79/show/108460"), "2022-04-24", "om/ona-en-108460.html"),
        _d("تحديد إجازة عيد الأضحى المبارك لعام 1443هـ (8-12 July)",
           _ona("ar/3/show/404348"), "2022-06-30", "om/ona-ar-3-show-404348.html"),
        _d("31 يوليو الجاري.. إجازة ذكرى الهجرة النبوية الشريفة (Ministry of Labour decision; 1 Muharram on the weekend)",
           _ona("ar/3/show/405240"), "2022-07-21", "om/ona-ar-3-show-405240.html"),
        _d("Muharram Crescent Not Sighted in Oman, New Hijri Year Saturday (30 July)",
           _ona("en/79/show/109519"), "2022-07-28", "om/ona-en-109519.html"),
        _d("Oman announces holiday for Prophet's birthday (quotes ONA 27 Sep: Sunday 13 Rabi I 1444 = 9 Oct)",
           "https://www.omanobserver.om/article/1125872/oman/community/oman-announces-holiday-for-prophets-birthday",
           "2022-09-27", "om/obs-1125872-mawlid2022.html", _OBS),
        _d("إجازة رسميّة للقطاعين العام والخاص بمناسبة العيد الوطني (30 Nov and 1 Dec)",
           _ona("ar/3/show/410482"), "2022-11-16", "om/ona-ar-3-show-410482.html"),
    ],
    days=([("03-01", ISRA, 0)] + _span(5, 1, 5, 5, FITR, 1, 2022)
          + _span(7, 8, 7, 12, ADHA, 2, 2022)
          + [("07-31", HNY, 3), ("10-09", MAWLID, 5), ("11-30", ND, 6), ("12-01", ND, 6)]),
    suppressed=[("07-30", HNY, 3), ("10-08", MAWLID, 5), ("11-18", ND, 6), ("11-19", ND, 6)],
    working=[],
    notes="No Accession Day holiday (RD 88/2022 adding it was issued 7 Dec 2022). Fitr: Sun 29 Ramadan = "
          "1 May to Thu 5 May, work Sun 8 May. Adha: Fri 9 Dhu al-Hijja = 8 Jul to Tue 13 Dhu al-Hijja = 12 Jul "
          "(Eid Sat 9 Jul; one day beyond the 9-12 span added by the announcement), work Wed 13 Jul. Hijri NY: 1 Muharram = Sat 30 Jul -> Sun 31 Jul. Mawlid: 12 Rabi I = "
          "Sat 8 Oct -> Sun 9 Oct.",
)

# -- 2023 ------------------------------------------------------------------
OM_YEARS[2023] = dict(
    confidence="primary",
    docs=[
        _d("HM The Sultan's Accession Day Holiday Declared (Thursday 12 January)",
           _ona("en/79/show/111368"), "2023-01-04", "om/ona-en-79-show-111368.html"),
        _d("الأحد القادم إجازة ذكرى الإسراء والمعراج للقطاعين العام والخاص (Sun 28 Rajab = 19 Feb)",
           _ona("ar/3/show/413968"), "2023-02-12", "om/ona-ar-3-show-413968.html"),
        _d("Eid Al Fitr 1444 AH Holiday Announced (20-24 April)",
           _ona("en/79/show/112479"), "2023-04-13", "om/ona-en-112479.html"),
        _d("First Day of Eid Al Fitr 1444 AH After Tomorrow, 22 April 2023",
           _ona("en/79/show/112549"), "2023-04-20", "om/ona-en-112549.html"),
        _d("Eid Al Adha 1444 AH Holiday Announced (from Tue 27 June; work Sun 2 July)",
           _ona("en/79/show/113244"), "2023-06-20", "om/ona-en-113244.html"),
        _d("Holy Prophet Hijra Holiday on 20 July (Ministry of Labour decision)",
           _ona("en/79/show/113391"), "2023-07-09", "om/ona-en-113391.html"),
        _d("This Thursday Declared Official Holiday on Prophet's Birthday (28 September)",
           _ona("en/79/show/114258"), "2023-09-24", "om/ona-en-114258.html"),
        _d("تحديد إجازة العيد الوطني الـ/53/ المجيد (Wed-Thu 22-23 Nov)",
           _ona("ar/3/show/425653"), "2023-11-13", "om/ona-ar-3-show-425653.html"),
    ],
    days=([("01-12", ACC, 0), ("02-19", ISRA, 1)] + _span(4, 20, 4, 24, FITR, 2, 2023)
          + _span(6, 27, 7, 1, ADHA, 4, 2023)
          + [("07-20", HNY, 5), ("09-28", MAWLID, 6), ("11-22", ND, 7), ("11-23", ND, 7)]),
    suppressed=[("01-11", ACC, 0), ("02-18", ISRA, 1), ("11-18", ND, 7), ("11-19", ND, 7)],
    working=[],
    notes="First Accession Day holiday: Thu 12 Jan 2023 (python-holidays says 11 Jan: wrong). Isra: 27 "
          "Rajab = Sat 18 Feb -> Sun 19 Feb (28 Rajab). Fitr: Thu 29 Ramadan = 20 Apr to Mon 24 Apr (Eid "
          "Sat 22 Apr), work Tue 25 Apr. Adha: from Tue 9 Dhu al-Hijja = 27 Jun, work Sun 2 Jul -> block "
          "27 Jun-1 Jul (Eid Wed 28 Jun; 12 Dhu al-Hijja = Sat 1 Jul). Regional weather closures (Dhofar + "
          "Al Jazer, 23-24 Oct) in OM_ADHOC.",
)

# -- 2024 ------------------------------------------------------------------
OM_YEARS[2024] = dict(
    confidence="primary",
    docs=[
        _d("Thursday 11 January an Official Holiday on HM The Sultan's Accession Day",
           _ona("en/79/show/115438"), "2024-01-04", "om/ona-en-115438.html"),
        _d("Al Isra'a Wal Miraj Holiday Announced (Thu 27 Rajab = 8 Feb)",
           _ona("en/79/show/115714"), "2024-02-01", "om/ona-en-115714.html"),
        _d("تحديدُ إجازة عيد الفطر المبارك لعام 1445هـ (from Tue 9 April, work Sun 14 April)",
           _ona("ar/3/show/431482"), "2024-04-04", "om/ona-ar-3-show-431482.html"),
        _d("تحديدُ إجازة عيد الأضحى المبارك لعام 1445هـ (Sun 16 - Thu 20 June)",
           _ona("ar/3/show/434513"), "2024-06-09", "om/ona-ar-3-show-434513.html"),
        _d("Holy Prophet Hijra Holiday on 7 July",
           _ona("en/79/show/117646"), "2024-07-01", "om/ona-en-117646.html"),
        _d("Prophet Mohammed Birthday Holiday Announced (Sunday 15 Sep = 11 Rabi I 1446)",
           _ona("en/79/show/118578"), "2024-09-08", "om/ona-en-118578.html"),
        _d("تحديدُ إجازة العيد الوطني الـ 54 المجيد (Wed-Thu 20-21 Nov)",
           _ona("ar/3/show/441735"), "2024-11-10", "om/ona-ar-3-show-441735.html"),
    ],
    days=([("01-11", ACC, 0), ("02-08", ISRA, 1)] + _span(4, 9, 4, 12, FITR, 2, 2024)
          + _span(6, 16, 6, 20, ADHA, 3, 2024)
          + [("07-07", HNY, 4), ("09-15", MAWLID, 5), ("11-20", ND, 6), ("11-21", ND, 6)]),
    suppressed=[("09-16", MAWLID, 5), ("11-18", ND, 6), ("11-19", ND, 6)],
    working=[],
    notes="Fitr: from Tue 29 Ramadan = 9 Apr, work Sun 14 Apr -> 9-12 Apr (Eid Wed 10 Apr; 3 Shawwal = "
          "Fri 12 Apr; Sat 13 weekend). Adha: Sun 9 Dhu al-Hijja = 16 Jun to Thu 13 Dhu al-Hijja = 20 Jun "
          "(Royal directive; Eid Mon 17 Jun in Oman), work Sun 23 Jun. Mawlid moved one day earlier, to "
          "Sun 11 Rabi I = 15 Sep (12 Rabi I = Mon 16 Sep worked). National Day 20-21 Nov already (before "
          "RD 15/2025). Weather closure 13 Feb 2024 (all governorates except Dhofar and Al Wusta) in OM_ADHOC.",
)

# -- 2025 ------------------------------------------------------------------
OM_YEARS[2025] = dict(
    confidence="primary",
    docs=[
        _d("إجازةٌ رسميّةٌ بمناسبة تولّي السُّلطان مقاليد الحكم (Sunday 12 January)",
           _ona("ar/3/show/444430"), "2025-01-05", "om/ona-ar-3-show-444430.html"),
        _d("Al Isra'a Wal Miraj Holiday Announced (Thursday 30 January)",
           _ona("en/79/show/120588"), "2025-01-19", "om/ona-en-120588.html",
           note="Page date 19 Jan 2025, dateline '1 Feb' (sic, ONA); the holiday is Thu 30 Jan."),
        _d("تحديدُ إجازة عيد الفطر لعام 1446هـ (from Sat 29 March, two alternatives)",
           _ona("ar/3/show/447969"), "2025-03-23", "om/ona-ar-3-show-447969.html"),
        _d("الاثنين.. أول أيام عيد الفطر المُبارك (Ramadan completes 30 days; Eid Monday 31 March)",
           _ona("ar/3/show/448261"), "2025-03-29", "om/ona-ar-3-show-448261.html"),
        _d("تحديد إجازة عيد الأضحى المُبارك لعام 1446هـ (Thu 5 - Mon 9 June)",
           _ona("ar/3/show/451513"), "2025-05-29", "om/ona-ar-3-show-451513.html"),
        _d("Prophet's Hijra Anniversary Holiday on 29 June",
           _ona("en/79/show/122939"), "2025-06-19", "om/ona-en-122939.html"),
        _d("تحديدُ إجازة ذكرى المولد النبوي الشريف (Sunday 14 Rabi I 1447 = 7 September)",
           _ona("ar/3/show/455832"), "2025-08-31", "om/ona-ar-3-show-455832.html"),
        _d("National Day Holiday Announced (26 and 27 November 2025)",
           _ona("en/79/show/125381"), "2025-11-09", "om/ona-en-125381.html",
           note="Page date 9 Nov 2025, dateline '16 Nov' (ONA)."),
    ],
    days=([("01-12", ACC, 0), ("01-30", ISRA, 1)] + _span(3, 29, 4, 3, FITR, 2, 2025)
          + _span(6, 5, 6, 9, ADHA, 4, 2025)
          + [("06-29", HNY, 5), ("09-07", MAWLID, 6), ("11-26", ND, 7), ("11-27", ND, 7)]),
    suppressed=[("01-11", ACC, 0), ("09-05", MAWLID, 6), ("11-20", ND, 7), ("11-21", ND, 7)],
    working=[],
    notes="Accession Day 11 Jan = Saturday -> Sun 12 Jan. Fitr: Eid Mon 31 Mar -> alternative (b): Sat 29 "
          "Mar to Thu 3 Apr (4 Shawwal), work Sun 6 Apr (python-holidays stops at 2 Apr). Adha: Thu 9 Dhu "
          "al-Hijja = 5 Jun to Mon 13 Dhu al-Hijja = 9 Jun, work Tue 10 Jun. Hijri NY: 1 Muharram 1447 = "
          "Fri 27 Jun -> Sun 29 Jun. Mawlid: 12 Rabi I = Fri 5 Sep -> Sun 7 Sep. National Day: statutory "
          "20-21 Nov (RD 15/2025) moved to Wed-Thu 26-27 Nov.",
)

# -- 2026 ------------------------------------------------------------------
OM_YEARS[2026] = dict(
    confidence="primary",
    docs=[
        _d("Council of Ministers Approves Policy for Annual Advance Announcement of National, Religious Holiday (2026 list)",
           _ona("en/79/show/126213"), "2025-12-28", "om/ona-en-126213.html"),
        _d("تحديد إجازة عيد الفطر لعام 1447هـ (Thu 19 - Mon 23 March)",
           _ona("ar/3/show/464721"), "2026-03-11", "om/ona-ar-3-show-464721.html"),
        _d("تحديدُ إجازة عيد الأضحى المُبارك لعام 1447هـ (from Tue 26 May, work Sun 31 May)",
           _ona("ar/3/show/467897"), "2026-05-18", "om/ona-ar-3-show-467897.html"),
    ],
    days=([("01-15", ACC, 0), ("01-18", ISRA, 0)] + _span(3, 19, 3, 23, FITR, 1, 2026)
          + _span(5, 26, 5, 29, ADHA, 2, 2026)
          + [("06-18", HNY, 0), ("08-27", MAWLID, 0), ("11-25", ND, 0), ("11-26", ND, 0)]),
    suppressed=[("01-11", ACC, 0), ("11-20", ND, 0), ("11-21", ND, 0)],
    working=[],
    notes="Advance list of 28 Dec 2025: Accession Day Thu 15 Jan (anniversary Sun 11 Jan), Isra Sun 18 Jan, "
          "Hijri NY Thu 18 Jun, Mawlid Thu 27 Aug, National Day Wed-Thu 25-26 Nov. Day-of announcements "
          "for these were not separately fetched (secondary press confirms 25-26 Nov and 18 Jun). Adha: "
          "from Tue 9 Dhu al-Hijja = 26 May, work Sun 31 May -> block 26-29 May (Eid Wed 27 May; 12 Dhu "
          "al-Hijja = Fri 29 May; Sat 30 weekend).",
)

# 2027: no source yet (the advance list for 2027 is due at the start of 2027) -> omitted.

# ---------------------------------------------------------------------------
OM_ADHOC = [
    ("2020-01-12", "Official mourning for Sultan Qaboos: work halted in public and private sectors (day 1 of 3)",
     "https://timesofoman.com/article/84018-government-issues-statement-on-official-mourning-in-oman",
     "issued 2020-01-11", "Diwan of Royal Court / Government Communication Centre"),
    ("2020-01-13", "Official mourning for Sultan Qaboos (day 2 of 3)",
     "https://www.omanobserver.om/ampArticle/18250", "issued 2020-01-11", "Diwan of Royal Court"),
    ("2020-01-14", "Official mourning for Sultan Qaboos (day 3 of 3); work resumed Wed 15 Jan",
     "https://www.omanobserver.om/ampArticle/18250", "issued 2020-01-11", "Diwan of Royal Court"),
    ("2023-10-23", "Tropical storm: holiday for public and private sectors ONLY in Dhofar and Wilayat Al Jazer (regional)",
     _ona("ar/3/show/424639"), "issued 2023-10-22", "Government (ONA statement)"),
    ("2023-10-24", "Tropical storm: regional holiday Dhofar + Al Jazer (day 2)",
     _ona("ar/3/show/424639"), "issued 2023-10-22", "Government (ONA statement)"),
    ("2024-02-13", "Weather (أنواء مناخية): holiday for public and private sectors in all governorates EXCEPT Dhofar and Al Wusta",
     _ona("ar/3/show/429197"), "issued 2024-02-12", "Government (ONA statement)"),
]

# ---------------------------------------------------------------------------
OM_FINDINGS = """
STATUTES (primary: qanoon.om Arabic text with Official Gazette numbers; English translation decree.om;
ONA release of the same text):
* RD 76/96 (issued 1996-09-28, OG 584 of 1996-10-01, in force on publication): government holidays =
  Hijri NY 1 Muharram, Mawlid 12 Rabi I, Isra wal Mi'raj 27 Rajab, National Day 18-19 Nov, Eid al-Fitr
  29 Ramadan-3 Shawwal, Eid al-Adha 9-12 Dhu al-Hijja; one-day weekend compensation; Friday compensation
  for Eid day 1; National Day movable. It replaced RD 56/91 (not read).
* RENAISSANCE DAY (23 July) was NOT in RD 76/96. It was granted every year by a decision of the Minister
  of the Diwan of Royal Court, Chairman of the Civil Service Council (government) plus a Minister of
  Manpower decision (private sector) -- seen for 2017 (Sun), 2018 (Mon), 2019 (Tue) in Oman Observer
  reports of the ONA statements. RD 56/2020 (issued 2020-04-20, OG 1339 of 2020-04-26) repeated the
  76/96 list for both sectors and nothing was announced for 23 July 2020 onwards: Renaissance Day ended
  after 2019. The starter's 07-23 after 2019 is wrong; python-holidays' <=2019 cut is right.
* ACCESSION DAY is NOT in RD 56/2020. It was added (without a date) by RD 88/2022 (issued 2022-12-07,
  OG 1471 of 2022-12-11). No holiday in 2020 (the 3 days 12-14 Jan 2020 were mourning closures for
  Sultan Qaboos, see OM_ADHOC), 2021 or 2022. Holidays: 2023 Thu 12 Jan, 2024 Thu 11 Jan, 2025 Sun 12 Jan,
  2026 Thu 15 Jan. python-holidays (Accession Day from 2020, 11 Jan 2023) is wrong for 2020-2022 and 2023.
  The issue text "Accession Day (01-11, from 2021)" is also wrong: from 2023.
* NATIONAL DAY: the issue item "RD 88/2022 moved National Day to 20-21 Nov from 2023" is WRONG. RD 88/2022
  keeps "(18) و (19) من شهر نوفمبر". The move to 20 and 21 November is RD 15/2025 (issued 2025-01-21,
  OG 1581 of 2025-01-26), renaming it "اليوم الوطني لسلطنة عمان". The actual holiday was moved by
  announcement in EVERY year checked: 2016 23-24 Nov, 2017 3-4 Dec, 2018 21-22 Nov (joint with Mawlid
  20 Nov), 2019 27-28 Nov, 2020 25-26, 2021 28-29, 2022 30 Nov-1 Dec, 2023 22-23, 2024 20-21, 2025
  26-27, 2026 25-26 Nov. The 2025 move to 26-27 Nov is confirmed (ONA).
* Council of Ministers policy (ONA 2025-12-28): from 2026 an advance annual list (except the Eids).
  The 2027 list is not out yet (expected around the turn of 2026/2027) -> 2027 omitted.

YEARS: 2020-2026 primary (ONA; for 2021 Fitr/Adha/HNY/Mawlid and the 2020 Mawlid/HNY confirmation the
items are Oman Observer / Times of Oman reports of the Ministry of Labour decisions). 2015-2019
secondary (Oman Observer / Times of Oman / Arabian Business quoting the Diwan/Manpower decisions; the
2019 Mawlid and National Day are primary ONA). Gaps: 2015 everything but Fitr; 2016 Renaissance,
HNY, Mawlid, Isra; 2017-2018 HNY and Isra; 2019 HNY. 2000-2014: MISSING (ONA's current site has no
pre-2019 archive; old ONA URLs not discoverable; newspaper archives would be secondary only). Found in
passing: 43rd National Day 2013 = 27-28 Nov (Gulf News, secondary) -- not entered.

DISAGREEMENTS with python-holidays 0.109 (decree/announcement wins):
* 2019 Isra wal Mi'raj = 2 days (3-4 Apr), python 1 day. 2019 Fitr block starts 4 Jun (python 3 Jun).
* 2019 Mawlid holiday Sun 10 Nov (python Sat 9 Nov); 2022 Mawlid Sun 9 Oct (python 9 Oct ok); 2024
  Mawlid Sun 15 Sep (python ok); 2025 Mawlid Sun 7 Sep (python ok).
* 2020 Hijri NY holiday Sun 23 Aug (python 21 Aug); 2022 HNY Sun 31 Jul (python 30 Jul); 2025 HNY Sun 29
  Jun (python ok).
* 2020 Adha extended to 6 Aug (python 30 Jul-2 Aug). 2021 Adha 18-22 Jul (python 19-22). 2024 Adha 16-20
  Jun (python 16-19). 2025 Adha 5-9 Jun (python 5-8). 2025 Fitr to 3 Apr (python to 2 Apr). 2022 Adha
  8-12 Jul (python 8-11).
* Accession Day 2020-2022 (python has it; there was none), 2023 (python 11 Jan, actual 12 Jan).
* National Day 2018/2019 (python 2020+ only by year table; earlier years python has nothing at all).
* Renaissance Day/National Day before 2020: python omits National Day entirely before 2020 -- wrong; it
  was a statutory holiday under RD 76/96 (always moved by announcement).

PRIVATE SECTOR (out of scope, noted): until 2020 separate Minister of Manpower decisions sometimes
gave fewer days (e.g. Fitr 2019 4-6 Jun only; Fitr 2020 identical).
Method: no sandbox disabling, no third-party proxies; direct curl to omannews.gov.om, qanoon.om,
decree.om, omanobserver.om, timesofoman.com, arabianbusiness via web.archive.org (Wayback) only.
"""
