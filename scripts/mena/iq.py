# -*- coding: utf-8 -*-
"""Iraq (IQ) federal official holidays 2000-2027: primary-source transcription.

Scope: federal Iraq only (Kurdistan Region decisions excluded).  Stdlib only.
Cached originals: ~/.cache/cl-stack-calendars/iq/
  waqai-4777.pdf                Law 12/2024 (Al-Waqa'i al-Iraqiya no. 4777, 2024-05-27)
  natlex-law-12-2024.pdf        ILO NATLEX copy of the same law (via Wayback)
  dorar-law-110-1972*.html      Law 110/1972 and its 1973 amendment (dorar-aliraq wiki, via Wayback)
  dorar-12470/14692/17154/15827/17148.html  RCC 886/1979, RCC 210/1989, Order 25/2005,
                                Decree 252/2002, Order 18/2005 (dorar-aliraq wiki)
  cabinet-api/*.json            all cabinet.iq news + decisions 2023-02-28..2026-11-26 (api.cabinet.iq)
  cabinet-api/static-holidays.json  cabinet.iq page "العطلات الرسمية في العراق" (Law 12/2024 text)
  ina/*.html                    Iraqi News Agency (INA) articles via Wayback (ina.iq blocks direct fetch)
  cbi/page-78-official-holidays.html, cbi/wayback-page78/*.html
                                Central Bank of Iraq holiday calendar page, 2018-2027 versions
  moj-iraqmag/, moj-views/      Ministry of Justice index of Al-Waqa'i issues 2014-2026 (contents lists)
"""


def _cab(slug):
    # cabinet.iq (General Secretariat of the Council of Ministers) item; same text is in
    # https://api.cabinet.iq/api/app/dynamic-content/by-filters?ContentTypeSlug=news|decisions&Language=ar
    return "https://cabinet.iq/ar/category/%s/%s" % (slug, slug)


W4777 = "https://www.moj.gov.iq/upload/pdf/4777_453.pdf"
CAB_STATIC = "https://cabinet.iq/ar/static/mFTR4SIxc!iRMmQ"
D110 = "https://web.archive.org/web/20240820010527/https://wiki.dorar-aliraq.net/iraqilaws/law/5663.html"

IQ_STATUTES = [
    dict(key="law-110-1972",
         title="قانون العطلات الرسمية رقم (110) لسنة 1972",
         uri=D110,
         issued="1972-09-11", issued_uri=D110,
         published="1972-09-19", published_uri=D110,
         published_in="الوقائع العراقية عدد 2184 في 19-9-1972 (as quoted by the dorar-aliraq legal wiki; gazette scan not seen)",
         in_force="1972-09-19",
         dates_note=None,
         summary="Art.1 general holidays: Friday; Eid al-Fitr 3 days (1-3 Shawwal); Eid al-Adha 4 days "
                 "(10-13 Dhu al-Hijja); 1 Muharram; Ashura 10 Muharram; Mawlid 12 Rabi I; 14 July; 17 July; "
                 "8 February; 6 January (Army Day); 21 March (Nowruz); 1 January; 1 May. Art.2 community-only days "
                 "(Christians 25 Dec + 2 days of Easter; Jews; Sabians; Yazidis). Art.3 the President may declare "
                 "temporary holidays for national occasions, max 7 days/year. No Arafah day. In force until 2024-05-27."),
    dict(key="law-49-1973",
         title="قانون تعديل قانون العطلات الرسمية رقم 110 لسنة 1972 (رقم 49 لسنة 1973، قرار مجلس قيادة الثورة 356)",
         uri="https://web.archive.org/web/20250730080337/https://wiki.dorar-aliraq.net/iraqilaws/law/6165.html",
         issued="1973-04-22", issued_uri="https://web.archive.org/web/20250730080337/https://wiki.dorar-aliraq.net/iraqilaws/law/6165.html",
         published="1973-05-07", published_uri="https://web.archive.org/web/20250730080337/https://wiki.dorar-aliraq.net/iraqilaws/law/6165.html",
         published_in="الوقائع العراقية عدد 2244 في 7-5-1973 (per dorar-aliraq)",
         in_force="1973-05-07", dates_note=None,
         summary="Replaces the Sabian community list only (2 days Great Feast, 1 day Little Feast, 2 days Feast of "
                 "Creation, 1 day Prophet Yahya). No change to general holidays."),
    dict(key="rcc-886-1979",
         title="قرار مجلس قيادة الثورة رقم 886 في 12-7-1979: يوم 17 تموز العيد الوطني للجمهورية العراقية",
         uri="https://wiki.dorar-aliraq.net/iraqilaws/law/12470.html",
         issued="1979-07-12", issued_uri="https://wiki.dorar-aliraq.net/iraqilaws/law/12470.html",
         published=None, published_uri=None, published_in=None,
         in_force="1980-01-01",
         dates_note="Gazette issue not given on the legal wiki; text says effective from the year 1980.",
         summary="17 July = national day (already a holiday under Law 110/1972); repeals RCC decision 856 of "
                 "22-11-1972. Repealed by Law 12/2024 art.4."),
    dict(key="rcc-210-1989",
         title="قرار مجلس قيادة الثورة رقم 210 لسنة 1989 (3 نيسان 1989): عيد التحرير 17 نيسان وعيد النصر 8 آب",
         uri="https://wiki.dorar-aliraq.net/iraqilaws/law/14692.html",
         issued="1989-04-03", issued_uri="https://wiki.dorar-aliraq.net/iraqilaws/law/14692.html",
         published=None, published_uri=None, published_in=None, in_force=None,
         dates_note="Issued at the RCC session of 27 Sha'ban 1409 = 3 April 1989; gazette issue not shown on the wiki.",
         summary="17 April (Fao liberation) and 8 August (end of Iran-Iraq war) become annual official holidays. "
                 "Abolished in practice by Governing Council decision 1/2003; formally repealed by Law 12/2024 art.4."),
    dict(key="decree-252-2002",
         title="مرسوم جمهوري رقم 252 في 15-10-2002: اعتبار يوم 16 تشرين الأول 2002 عطلة رسمية",
         uri="https://wiki.dorar-aliraq.net/iraqilaws/law/15827.html",
         issued="2002-10-15", issued_uri="https://wiki.dorar-aliraq.net/iraqilaws/law/15827.html",
         published=None, published_uri=None, published_in=None, in_force="2002-10-16",
         dates_note="Gazette issue not shown on the wiki.",
         summary="One-off holiday 2002-10-16 after the presidential referendum, under Law 110/1972 art.3."),
    dict(key="gc-1-2003",
         title="قرار مجلس الحكم رقم (1) لسنة 2003 (first decision of the Iraqi Governing Council, 13 July 2003)",
         uri="https://www.npr.org/2003/07/14/1337020/new-iraqi-governing-council-bans-saddam-holidays",
         issued="2003-07-13", issued_uri="https://www.aljazeera.com/news/2003/7/13/us-backed-iraqi-council-meets",
         published=None, published_uri=None, published_in=None, in_force="2003-07-13",
         dates_note="Decision text not located (iraqld.hjc.iq / iraqld.msla.iq refuse automated access, 403). "
                    "Content from contemporary press (NPR, Al Jazeera, AP list); its existence and number are "
                    "confirmed by Law 12/2024 art.4 (third), which repeals it. SECONDARY for content.",
         summary="Abolishes six Ba'ath-era holidays: 8 Feb, 7 Apr (Ba'ath founding), 17 Apr, 28 Apr (Saddam's "
                 "birthday), 17 Jul, 8 Aug; declares 9 April (fall of the regime) a national day and official holiday."),
    dict(key="order-18-2005",
         title="أمر رقم 18 لسنة 2005: تعديل الفقرة (1) من المادة الأولى من قانون العطلات الرسمية (الجمعة والسبت)",
         uri="https://wiki.dorar-aliraq.net/iraqilaws/law/17148.html",
         issued="2005-02-15", issued_uri="https://wiki.dorar-aliraq.net/iraqilaws/law/17148.html",
         published=None, published_uri=None, published_in=None, in_force=None,
         dates_note="Signed by PM Ayad Allawi 15-02-2005; in force on gazette publication, issue not shown.",
         summary="Weekend becomes Friday and Saturday (weekends handled elsewhere)."),
    dict(key="order-25-2005",
         title="أمر رقم 25 لسنة 2005: اعتبار يوم 30 كانون الثاني عيداً وطنياً وعطلة رسمية من كل عام",
         uri="https://wiki.dorar-aliraq.net/iraqilaws/law/17154.html",
         issued="2005-02-21", issued_uri="https://wiki.dorar-aliraq.net/iraqilaws/law/17154.html",
         published=None, published_uri=None, published_in=None, in_force="2005-02-21",
         dates_note="Signed by PM Ayad Allawi 21-02-2005 (12 Muharram 1426); 'in force from issue'. Gazette issue not shown.",
         summary="Election day 30 January (2005 elections) = national day and official holiday every year. "
                 "Repealed by Law 12/2024 art.4 (fourth). Observance 2006-2024 NOT verified (see IQ_OTHER_RULES)."),
    dict(key="com-2017-victory-day",
         title="إعلان رئيس الوزراء حيدر العبادي (9-10 كانون الأول 2017): 10 كانون الأول عطلة رسمية سنوية (يوم النصر)",
         uri="https://www.newarab.com/news/iraq-marks-defeat-new-national-holiday",
         issued="2017-12-09", issued_uri="https://www.dawn.com/news/amp/1375629",
         published=None, published_uri=None, published_in=None, in_force="2017-12-10",
         dates_note="Cabinet decision text not located; press (Reuters/AFP via Arab News, The New Arab, Dawn). "
                    "SECONDARY. Not in Law 12/2024; since 2024 declared each year under art.3.",
         summary="10 December (victory over ISIS) declared an annual national holiday."),
    dict(key="com-2018-christmas",
         title="قرار مجلس الوزراء (24 كانون الأول 2018): 25 كانون الأول عطلة رسمية لجميع العراقيين ومشروع تعديل قانون العطل",
         uri="https://www.kurdistan24.net/ar/story/292835",
         issued="2018-12-24", issued_uri="https://www.voanews.com/a/christmas-is-declared-national-holiday-in-iraq/4716288.html",
         published=None, published_uri=None, published_in=None, in_force="2018-12-25",
         dates_note="Decision text not located; press only (Kurdistan24, VOA, Gulf News). The related cabinet "
                    "decision 11/2018 amending the holidays BILL was cancelled by the cabinet on 2023-07-25 (Shafaq). "
                    "SECONDARY.",
         summary="Christmas (25 Dec) a holiday for all Iraqis in 2018; cabinet proposed amending the law. Not a "
                 "standing rule: 2023 was Christians-only, 2022/2024/2025 general by yearly decision."),
    dict(key="com-2020-national-day",
         title="قرار مجلس الوزراء (1 أيلول 2020): 3 تشرين الأول من كل عام العيد الوطني لجمهورية العراق؛ إحالة مشروع قانون العيد الوطني الى مجلس النواب",
         uri="https://www.iraq-businessnews.com/2020/09/03/cabinet-announces-another-public-holiday/",
         issued="2020-09-01", issued_uri="https://www.iraq-businessnews.com/2020/09/03/cabinet-announces-another-public-holiday/",
         published=None, published_uri=None, published_in=None, in_force=None,
         dates_note="Decision text not located; press (Iraq Business News quoting the government; Shafaq). "
                    "Culture minister (INA 112103) said the national day was separated from the holidays law. "
                    "The cabinet spokesman told INA on 2024-09-30 that the holidays law has no holiday on 3 October "
                    "(https://ina.iq/ar/local/218125--3-.html); the day has been declared by decision each year. SECONDARY.",
         summary="3 October (admission to the League of Nations, 1932) = national day. Work suspended by yearly "
                 "decision: 2021 (Sun), 2022 (Mon), 2023 (Tue), 2024 (Thu), 2026 (part of 30 Sep-3 Oct)."),
    dict(key="law-12-2024",
         title="قانون العطلات الرسمية رقم (12) لسنة 2024",
         uri=W4777,
         issued="2024-05-27", issued_uri=W4777,
         published="2024-05-27", published_uri=W4777,
         published_in="الوقائع العراقية العدد 4777 في 27/5/2024",
         in_force="2024-05-27",
         dates_note=None,
         summary="Art.1 first: general holidays: Fri+Sat; 1 Muharram; 10 Muharram (Ashura); 12 Rabi I (Mawlid); "
                 "1-3 Shawwal (Fitr); 10-13 Dhu al-Hijja (Adha); 18 Dhu al-Hijja (Ghadir); 1 Jan; 6 Jan (Army Day); "
                 "21 Mar (Nowruz); 1 May; 16 Mar (Ba'ath crimes: Halabja, Anfal, mass graves, Sha'baniya uprising). "
                 "Art.1 second: first day of each Eid fixed by statement of the Shia and Sunni Endowment diwans; if they "
                 "differ the holiday runs from the earlier first day to the later last day. Art.1 third: governorates "
                 "with holy cities (Najaf, Karbala, Kadhimiya, Samarra) may close up to 3 days around religious holidays. "
                 "Art.2 community-only days (Christians: Christmas + 2 days Easter; Sabians; Yazidis). Art.3: Council of "
                 "Ministers may declare temporary holidays, max 7 days/year; may restore Saturday work. Art.4 repeals "
                 "Law 110/1972, RCC 886/1979, RCC 210/1989, Governing Council decision 1/2003, Order 25/2005. "
                 "NOT in the list: 14 July, 3 October, 10 December, 25 December (general), 9 April, Arafah."),
]

IQ_FIXED = [
    (1, 1, "رأس السنة الميلادية", [(2000, 2024)], "law-110-1972"),
    (1, 1, "رأس السنة الميلادية", [(2025, None)], "law-12-2024"),
    (1, 6, "عيد الجيش", [(2000, 2024)], "law-110-1972"),
    (1, 6, "عيد الجيش", [(2025, None)], "law-12-2024"),
    (2, 8, "ثورة 8 شباط", [(2000, 2003)], "law-110-1972"),          # abolished by gc-1-2003 (13 Jul 2003)
    (3, 16, "ذكرى جرائم البعث الصدامي (حلبجة، الأنفال، المقابر الجماعية، الانتفاضة الشعبانية)", [(2025, None)], "law-12-2024"),
    (3, 21, "عيد نوروز", [(2000, 2024)], "law-110-1972"),
    (3, 21, "عيد نوروز", [(2025, None)], "law-12-2024"),
    (4, 17, "عيد التحرير (الفاو)", [(2000, 2002)], "rcc-210-1989"),
    (5, 1, "عيد العمال العالمي", [(2000, 2024)], "law-110-1972"),      # 2024-05-01 still under law 110
    (5, 1, "عيد العمال العالمي", [(2025, None)], "law-12-2024"),
    (7, 14, "ثورة 14 تموز (تأسيس الجمهورية)", [(2000, 2023)], "law-110-1972"),  # law repealed 2024-05-27; 2024-07-14 not a holiday
    (7, 17, "ثورة 17 تموز (العيد الوطني)", [(2000, 2002)], "rcc-886-1979"),
    (8, 8, "عيد النصر (يوم النصر العظيم)", [(2000, 2002)], "rcc-210-1989"),
    (10, 3, "العيد الوطني لجمهورية العراق", [(2020, None)], "com-2020-national-day"),   # declared yearly; see notes
    (12, 10, "يوم النصر على داعش", [(2017, None)], "com-2017-victory-day"),          # declared yearly; 2019-2022 unverified
]

IQ_ISLAMIC = [
    (1, 1, [0], "رأس السنة الهجرية", [(2000, None)], "law-110-1972"),
    (1, 10, [0], "عاشوراء (استشهاد الإمام الحسين)", [(2000, None)], "law-110-1972"),
    (3, 12, [0], "المولد النبوي الشريف", [(2000, None)], "law-110-1972"),
    (10, 1, [0, 1, 2], "عيد الفطر", [(2000, None)], "law-110-1972"),
    (12, 10, [0, 1, 2, 3], "عيد الأضحى", [(2000, None)], "law-110-1972"),
    (12, 18, [0], "عيد الغدير", [(2024, None)], "law-12-2024"),
    # law-12-2024 re-enacts every Islamic day above with the same counts from 2024-05-27.
]

IQ_OTHER_RULES = [
    dict(rule="Eid first day = statement of the Shia and Sunni Endowment diwans; if they differ, the holiday runs from "
              "the earlier first day to the later last day (so Fitr can be 4 days, Adha 5).",
         source="law-12-2024", from_date="2024-05-27",
         note="Before 2024 the cabinet in practice did the same (e.g. 2021 Fitr: Sunni Thu 13 May, Shia Fri 14 May, "
              "holiday to Sun 16 May)."),
    dict(rule="Council of Ministers may declare temporary official holidays for special occasions, max 7 days/year "
              "(art.3 first). Under law-110-1972 art.3 the same power (7 days) belonged to the President, but post-2003 "
              "the PM/cabinet declared them. 3 Oct, 10 Dec, 25 Dec (general), Arbaeen, elections are declared this way.",
         source="law-12-2024", from_date="2024-05-27"),
    dict(rule="Cabinet routinely extends Eid blocks with bridge days ('عطلة عيد ... ابتداءً من ... ولغاية ...'); "
              "these are recorded per year as '(extension)'. Arafah (9 Dhu al-Hijja) is NOT a statutory holiday "
              "(python-holidays lists it; neither law does); it appears only as a declared extension (2023, 2026).",
         source="law-110-1972"),
    dict(rule="9 April national day (fall of the regime) - official holiday per Governing Council decision 1/2003; "
              "decision repealed 2024-05-27. Observance 2004-2023 NOT verified; it is absent from every Central Bank "
              "holiday calendar 2018-2023 (cbi.iq/page/78 via Wayback). Not put in IQ_FIXED.",
         source="gc-1-2003", years=(2004, 2024)),
    dict(rule="30 January national day (2005 election day) - official holiday every year per Order 25/2005; repealed "
              "2024-05-27. Observance NOT verified and absent from CBI calendars 2018-2023. Not put in IQ_FIXED.",
         source="order-25-2005", years=(2006, 2024)),
    dict(rule="7 April (Ba'ath party founding) and 28 April (Saddam Hussein's birthday) were national holidays in the "
              "Ba'ath era per the AP list of the six holidays abolished by Governing Council decision 1/2003. The "
              "instrument creating them was not located. Probably holidays 2000-2002.",
         source="gc-1-2003", years=(2000, 2002), confidence="secondary"),
    dict(rule="25 December: community-only holiday for Christians under both laws (law-110 art.2; law-12 art.2 "
              "with 25-26 Dec). General holiday only by yearly decision: 2018 (com-2018-christmas), 2022, 2024, 2025 "
              "confirmed; 2023 Christians only; 2019 unverified; 2020/2021 fall on Fri/Sat.",
         source="com-2018-christmas"),
    dict(rule="Holy-city governorates (Najaf, Karbala, Baghdad-Kadhimiya, Samarra/Salah al-Din) may close up to 3 days "
              "around religious holidays (law-12 art.1 third); the cabinet often closes Baghdad only for Imam "
              "al-Kadhim's martyrdom (25 Rajab). Regional, not national - excluded.",
         source="law-12-2024"),
]


# ---------------------------------------------------------------- years
# Abbreviations used in notes: GS = General Secretariat of the Council of Ministers; PMO = PM media office.

IQ_YEARS = {
    2015: dict(
        confidence="secondary",
        docs=[
            dict(title="Law 110/1972 (statutory list)", uri=D110, issued="1972-09-11", issued_uri=D110,
                 published="1972-09-19", published_uri=D110, published_in="الوقائع العراقية 2184", dates_note=None),
            dict(title="timeanddate Iraq Eid/Islamic dates (as embedded in python-holidays 0.109 IraqIslamicHolidays)",
                 uri="https://web.archive.org/web/20250514061230/https://www.timeanddate.com/holidays/iraq/eid-al-fitr",
                 issued=None, issued_uri=None, published=None, published_uri=None, published_in="secondary calendar",
                 dates_note="secondary aggregator; no Iraqi announcement found for 2015"),
        ],
        days=[("01-01", "رأس السنة الميلادية", 0), ("01-03", "المولد النبوي الشريف", 1), ("01-06", "عيد الجيش", 0),
              ("03-21", "عيد نوروز", 0), ("05-01", "عيد العمال العالمي", 0), ("07-14", "ثورة 14 تموز", 0),
              ("07-18", "عيد الفطر", 1), ("07-19", "عيد الفطر", 1), ("07-20", "عيد الفطر", 1),
              ("09-24", "عيد الأضحى", 1), ("09-25", "عيد الأضحى", 1), ("09-26", "عيد الأضحى", 1), ("09-27", "عيد الأضحى", 1),
              ("10-15", "رأس السنة الهجرية", 1), ("10-24", "عاشوراء", 1), ("12-23", "المولد النبوي الشريف", 1)],
        suppressed=[], working=[],
        notes="Statutory days only at timeanddate dates; cabinet Eid announcements/extensions for 2015 not found "
              "(old cabinet.iq site only partly archived; INA archive starts ~2017). Two Mawlids in 2015."),
    2016: dict(
        confidence="secondary",
        docs=[
            dict(title="Law 110/1972 (statutory list)", uri=D110, issued="1972-09-11", issued_uri=D110,
                 published="1972-09-19", published_uri=D110, published_in="الوقائع العراقية 2184", dates_note=None),
            dict(title="timeanddate Iraq Islamic dates (via python-holidays 0.109)",
                 uri="https://web.archive.org/web/20250524093010/https://www.timeanddate.com/holidays/iraq/eid-al-adha",
                 issued=None, issued_uri=None, published=None, published_uri=None, published_in="secondary calendar",
                 dates_note="secondary aggregator; no Iraqi announcement found for 2016"),
        ],
        days=[("01-01", "رأس السنة الميلادية", 0), ("01-06", "عيد الجيش", 0), ("03-21", "عيد نوروز", 0),
              ("05-01", "عيد العمال العالمي", 0), ("07-07", "عيد الفطر", 1), ("07-08", "عيد الفطر", 1),
              ("07-09", "عيد الفطر", 1), ("07-14", "ثورة 14 تموز", 0),
              ("09-13", "عيد الأضحى", 1), ("09-14", "عيد الأضحى", 1), ("09-15", "عيد الأضحى", 1), ("09-16", "عيد الأضحى", 1),
              ("10-03", "رأس السنة الهجرية", 1), ("10-12", "عاشوراء", 1), ("12-12", "المولد النبوي الشريف", 1)],
        suppressed=[], working=[],
        notes="Statutory days only; announcements/extensions not found."),
    2017: dict(
        confidence="secondary",
        docs=[
            dict(title="Law 110/1972 (statutory list)", uri=D110, issued="1972-09-11", issued_uri=D110,
                 published="1972-09-19", published_uri=D110, published_in="الوقائع العراقية 2184", dates_note=None),
            dict(title="timeanddate Iraq Islamic dates (via python-holidays 0.109)",
                 uri="https://web.archive.org/web/20250514061230/https://www.timeanddate.com/holidays/iraq/eid-al-fitr",
                 issued=None, issued_uri=None, published=None, published_uri=None, published_in="secondary calendar",
                 dates_note="secondary"),
            dict(title="Abadi declares 10 December an annual national holiday (press)",
                 uri="https://www.newarab.com/news/iraq-marks-defeat-new-national-holiday",
                 issued="2017-12-09", issued_uri="https://www.dawn.com/news/amp/1375629",
                 published="2017-12-09", published_uri="https://www.newarab.com/news/iraq-marks-defeat-new-national-holiday",
                 published_in="press (Reuters/AFP)", dates_note=None),
            dict(title="رئيس الوزراء الدكتور حيدر العبادي يوجه بتعطيل الدوام الرسمي يوم الاحد (INA 8362)",
                 uri="https://ina.iq/ar/local/8362--.html", issued=None, issued_uri=None,
                 published=None, published_uri="https://ina.iq/ar/local/8362--.html",
                 published_in="official news release (INA)",
                 dates_note="seen only as search-engine snippet: Sunday 31-12-2017 off to honour the armed forces because "
                            "6 January 2018 falls on Saturday; article not fetched (INA blocks; Wayback rate-limited)"),
        ],
        days=[("01-01", "رأس السنة الميلادية", 0), ("01-06", "عيد الجيش", 0), ("03-21", "عيد نوروز", 0),
              ("05-01", "عيد العمال العالمي", 0), ("06-26", "عيد الفطر", 1), ("06-27", "عيد الفطر", 1),
              ("06-28", "عيد الفطر", 1), ("07-14", "ثورة 14 تموز", 0),
              ("09-02", "عيد الأضحى", 1), ("09-03", "عيد الأضحى", 1), ("09-04", "عيد الأضحى", 1), ("09-05", "عيد الأضحى", 1),
              ("09-22", "رأس السنة الهجرية", 1), ("10-01", "عاشوراء", 1), ("12-01", "المولد النبوي الشريف", 1),
              ("12-10", "يوم النصر على داعش", 2)],
        suppressed=[], working=[],
        notes="Islamic dates secondary. 10 Dec 2017 was a Sunday holiday (victory parade). Sun 31 Dec 2017 in-lieu Army Day (IQ_ADHOC) "
              "is from an INA headline/snippet only - verify. Announced Eid extensions not found."),
    2018: dict(
        confidence="secondary",
        docs=[
            dict(title="Law 110/1972 (statutory list)", uri=D110, issued="1972-09-11", issued_uri=D110,
                 published="1972-09-19", published_uri=D110, published_in="الوقائع العراقية 2184", dates_note=None),
            dict(title="Central Bank of Iraq: عطل البنك المركزي العراقي لعام 2018 (cbi.iq/page/78, Wayback 2018-08-03)",
                 uri="https://web.archive.org/web/20180803211646/https://cbi.iq/page/78", issued=None, issued_uri=None,
                 published=None, published_uri="https://web.archive.org/web/20180803211646/https://cbi.iq/page/78",
                 published_in="official calendar page (Central Bank of Iraq)",
                 dates_note="bank calendar; Islamic dates marked '*' = approximate"),
            dict(title="timeanddate Iraq Islamic dates (via python-holidays 0.109)",
                 uri="https://web.archive.org/web/20250514061230/https://www.timeanddate.com/holidays/iraq/eid-al-fitr",
                 issued=None, issued_uri=None, published=None, published_uri=None, published_in="secondary calendar",
                 dates_note="secondary"),
            dict(title="Iraq marks anniversary of victory over Daesh - government declared Monday 10 Dec a national holiday (AFP/Arab News)",
                 uri="https://www.arabnews.com/node/1418341", issued="2018-12-10", issued_uri=None,
                 published="2018-12-10", published_uri="https://www.arabnews.com/node/1418341",
                 published_in="press (AFP)", dates_note=None),
            dict(title="لأول مرة.. العراق يعلن عطلة رسمية شاملة بميلاد المسيح (Kurdistan24; cabinet decision of 24-12-2018)",
                 uri="https://www.kurdistan24.net/ar/story/292835", issued="2018-12-24", issued_uri=None,
                 published="2018-12-24", published_uri="https://www.kurdistan24.net/ar/story/292835",
                 published_in="press", dates_note=None),
        ],
        days=[("01-01", "رأس السنة الميلادية", 0), ("01-06", "عيد الجيش", 0), ("03-21", "عيد نوروز", 0),
              ("05-01", "عيد العمال العالمي", 0), ("06-15", "عيد الفطر", 2), ("06-16", "عيد الفطر", 2),
              ("06-17", "عيد الفطر", 2), ("07-14", "ثورة 14 تموز", 0),
              ("08-21", "عيد الأضحى", 2), ("08-22", "عيد الأضحى", 2), ("08-23", "عيد الأضحى", 2), ("08-24", "عيد الأضحى", 2),
              ("09-11", "رأس السنة الهجرية", 2), ("09-20", "عاشوراء", 2), ("11-21", "المولد النبوي الشريف", 2),
              ("12-10", "يوم النصر على داعش", 3), ("12-25", "عيد الميلاد المجيد (لعموم العراقيين)", 4)],
        suppressed=[], working=[],
        notes="CBI 2018 calendar: Fitr *15 Jun (3 days), Adha *23 Aug (4 days), Muharram *12 Sep, Ashura *20 Sep, "
              "Mawlid *20 Nov - approximate; timeanddate (used) has Adha 22 Aug -> 10-13 DhH counted from the Sunni "
              "first day 21 Aug. Eid extensions not found."),
    2019: dict(
        confidence="primary",
        docs=[
            dict(title="Law 110/1972 (statutory list)", uri=D110, issued="1972-09-11", issued_uri=D110,
                 published="1972-09-19", published_uri=D110, published_in="الوقائع العراقية 2184", dates_note=None),
            dict(title="عطلة عيد الفطر المبارك - سفارة جمهورية العراق في برلين (holiday Tue 4/6/2019 - Mon 10/6/2019, work resumes Tue 11/6)",
                 uri="http://www.mofa.gov.iq/berlin/?p=1245", issued=None, issued_uri=None, published=None,
                 published_uri="http://www.mofa.gov.iq/berlin/?p=1245",
                 published_in="Iraqi MFA (embassy notice)",
                 dates_note="embassy closure notice (Frankfurt consulate same); cabinet decision itself not found"),
            dict(title="الامانة العامة لمجلس الوزراء تعلن عن تعطيل الدوام الرسمي ليوم غد الاحد بمناسبة ذكرى ثورة ١٤ من تموز (INA 90592)",
                 uri="https://ina.iq/ar/local/90592--.html", issued="2019-07-13", issued_uri=None,
                 published="2019-07-13", published_uri="https://ina.iq/ar/local/90592--.html",
                 published_in="official news release (INA)", dates_note="seen via search snippet; not fetched"),
            dict(title="تأكيداً لما نشرته واع.. مجلس الوزراء يعلن رسمياً عطلة العيد من الأحد الى الخميس (INA 92203): from Sun 11/8/2019 for five days",
                 uri="https://ina.iq/ar/political/92203--.html", issued=None, issued_uri=None, published=None,
                 published_uri="https://ina.iq/ar/political/92203--.html", published_in="official news release (INA)",
                 dates_note="seen via search snippet; not fetched"),
            dict(title="أمانة مجلس الوزراء تعلن تعطيل الدوام الرسمي ليوم غد الثلاثاء بذكرى العاشر من محرم (INA 93933): Tue 10/9/2019",
                 uri="https://ina.iq/ar/political/93933--.html", issued="2019-09-09", issued_uri=None,
                 published="2019-09-09", published_uri="https://ina.iq/ar/political/93933--.html",
                 published_in="official news release (INA)", dates_note="seen via search snippet; not fetched"),
            dict(title="CBI calendar 2019 (cbi.iq/page/78, Wayback 2019-07-17)",
                 uri="https://web.archive.org/web/20190717154435/https://cbi.iq/page/78", issued=None, issued_uri=None,
                 published=None, published_uri="https://web.archive.org/web/20190717154435/https://cbi.iq/page/78",
                 published_in="official calendar page (Central Bank of Iraq)", dates_note="approximate Islamic dates"),
        ],
        days=[("01-01", "رأس السنة الميلادية", 0), ("01-06", "عيد الجيش", 0), ("03-21", "عيد نوروز", 0),
              ("05-01", "عيد العمال العالمي", 0),
              ("06-04", "عيد الفطر", 1), ("06-05", "عيد الفطر", 1), ("06-06", "عيد الفطر", 1),
              ("06-09", "عيد الفطر (extension)", 1), ("06-10", "عيد الفطر (extension)", 1),
              ("07-14", "ثورة 14 تموز", 2),
              ("08-11", "عيد الأضحى", 3), ("08-12", "عيد الأضحى", 3), ("08-13", "عيد الأضحى", 3), ("08-14", "عيد الأضحى", 3),
              ("08-15", "عيد الأضحى (extension)", 3),
              ("08-31", "رأس السنة الهجرية", 5), ("09-10", "عاشوراء", 4), ("11-10", "المولد النبوي الشريف", 5),
              ("12-10", "يوم النصر على داعش", 5)],
        suppressed=[], working=[],
        notes="Fitr 1440: Sunni Tue 4 Jun / Shia Wed 5 Jun; embassy closures 4-10 Jun. Adha: cabinet 5 days from Sun "
              "11 Aug (11-15 Aug). 1 Muharram 1441 fell Sat 31 Aug (INA 93444 = GS denial of a rumoured Sunday 1 Sep "
              "closure). Mawlid date approximate (CBI *10 Nov). 10 Dec 2019 and 25 Dec 2019 (protest period) NOT "
              "verified - 10 Dec kept per the 2017 annual declaration, 25 Dec omitted. Months Oct-Dec 2019 had "
              "many protest-related local closures (not recorded)."),
    2020: dict(
        confidence="primary",
        docs=[
            dict(title="Law 110/1972 (statutory list)", uri=D110, issued="1972-09-11", issued_uri=D110,
                 published="1972-09-19", published_uri=D110, published_in="الوقائع العراقية 2184", dates_note=None),
            dict(title="العراق يفرض حظر التجوال أسبوعا كاملا في عطلة العيد (Shafaq, 19-5-2020, quoting PMO: Eid al-Fitr holiday Sunday-Thursday)",
                 uri="https://shafaq.com/ar/مجتـمع/العراق-يفرض-حظر-التجوال-أسبوعا-كاملا-في-عطلة-العيد",
                 issued="2020-05-19", issued_uri=None, published="2020-05-19", published_uri=None,
                 published_in="press quoting PM media office", dates_note="secondary for this item"),
            dict(title="Sunni Endowment: Thursday is 1 Muharram; GS: Thursday 20/8/2020 official holiday (INA 111436 and GS statement)",
                 uri="https://ina.iq/ar/local/111436--.html", issued="2020-08-19", issued_uri=None,
                 published="2020-08-19", published_uri="https://ina.iq/ar/local/111436--.html",
                 published_in="official news release (INA)", dates_note="seen via search snippet; not fetched"),
            dict(title="Cabinet designates 3 October as National Day (Iraq Business News, 3-9-2020)",
                 uri="https://www.iraq-businessnews.com/2020/09/03/cabinet-announces-another-public-holiday/",
                 issued="2020-09-01", issued_uri=None, published="2020-09-03", published_uri=None,
                 published_in="press", dates_note=None),
            dict(title="CBI calendar 2020 (cbi.iq/page/78, Wayback 2019-12-11)",
                 uri="https://web.archive.org/web/20191211002404/https://cbi.iq/page/78", issued=None, issued_uri=None,
                 published=None, published_uri="https://web.archive.org/web/20191211002404/https://cbi.iq/page/78",
                 published_in="official calendar page (Central Bank of Iraq)", dates_note="approximate Islamic dates"),
        ],
        days=[("01-01", "رأس السنة الميلادية", 0), ("01-06", "عيد الجيش", 0), ("03-21", "عيد نوروز", 0),
              ("05-01", "عيد العمال العالمي", 0),
              ("05-24", "عيد الفطر", 1), ("05-25", "عيد الفطر", 1), ("05-26", "عيد الفطر", 1),
              ("05-27", "عيد الفطر (extension)", 1), ("05-28", "عيد الفطر (extension)", 1),
              ("07-14", "ثورة 14 تموز", 0),
              ("07-31", "عيد الأضحى", 4), ("08-01", "عيد الأضحى", 4), ("08-02", "عيد الأضحى", 4), ("08-03", "عيد الأضحى", 4),
              ("08-20", "رأس السنة الهجرية", 2), ("08-30", "عاشوراء", 4), ("10-03", "العيد الوطني لجمهورية العراق", 3),
              ("10-29", "المولد النبوي الشريف", 4), ("12-10", "يوم النصر على داعش", 3)],
        suppressed=[], working=[],
        notes="COVID year: Fitr holiday Sun 24 - Thu 28 May with total curfew; Adha 1441 = Fri 31 Jul, total curfew "
              "30 Jul - 9 Aug (Higher Committee for Health and National Safety) - holiday extension not found, statutory "
              "4 days only. Ashura by Shia count (1 Muh Fri 21 Aug -> Sun 30 Aug; Sunni count gives Sat 29 Aug). 10 Dec "
              "2020 (Thu) not verified. 3 Oct 2020 was a Saturday. INA 118905: GS said work in the new year resumes "
              "Mon 4 Jan 2021 (i.e. Sun 3 Jan 2021 off) - see IQ_ADHOC."),
    2021: dict(
        confidence="primary",
        docs=[
            dict(title="Law 110/1972 (statutory list)", uri=D110, issued="1972-09-11", issued_uri=D110,
                 published="1972-09-19", published_uri=D110, published_in="الوقائع العراقية 2184", dates_note=None),
            dict(title="توضيح من أمانة مجلس الوزراء بعد قرار اللجنة العليا تعطيل الدوام بالدوائر بدءاً من الاثنين (INA 125814): Eid holiday ends Sun 16/5/2021; COVID closure 17-20/5/2021",
                 uri="https://ina.iq/125814--.html", issued="2021-05-13", issued_uri="https://ina.iq/125814--.html", published="2021-05-13",
                 published_uri="https://ina.iq/125814--.html", published_in="official news release (INA)",
                 dates_note=None),
            dict(title="تعطيل الدوام الرسمي يوم الأربعاء المقبل (INA 130002): 14 July 2021, founding of the Republic, per the official holidays law",
                 uri="https://ina.iq/ar/local/130002--.html", issued="2021-07-11", issued_uri="https://ina.iq/ar/local/130002--.html", published="2021-07-11",
                 published_uri="https://ina.iq/ar/local/130002--.html", published_in="official news release (INA)",
                 dates_note=None),
            dict(title="أمانة مجلس الوزراء تعطل الدوام الرسمي يوم الأحد المقبل (INA 137289): Sunday 3 Oct 2021, national day",
                 uri="https://ina.iq/137289--3-.html", issued="2021-09-30", issued_uri="https://ina.iq/137289--3-.html", published="2021-09-30",
                 published_uri="https://ina.iq/137289--3-.html", published_in="official news release (INA)",
                 dates_note=None),
            dict(title="CBI calendar 2021 (cbi.iq/page/78, Wayback 2021-06-30)",
                 uri="https://web.archive.org/web/20210630072858/https://cbi.iq/page/78", issued=None, issued_uri=None,
                 published=None, published_uri="https://web.archive.org/web/20210630072858/https://cbi.iq/page/78",
                 published_in="official calendar page (Central Bank of Iraq)", dates_note="approximate Islamic dates"),
            dict(title="Sistani office: Thursday completes Ramadan, Friday 14 May is Eid (INA 125747); Sunni Endowment: Thursday 13 May (INA 125667)",
                 uri="https://ina.iq/ar/local/125747--.html", issued="2021-05-12", issued_uri="https://ina.iq/ar/local/125667--.html",
                 published="2021-05-12", published_uri="https://ina.iq/ar/local/125747--.html",
                 published_in="official news release (INA)", dates_note="seen via search snippet"),
        ],
        days=[("01-01", "رأس السنة الميلادية", 0), ("01-06", "عيد الجيش", 0), ("03-21", "عيد نوروز", 0),
              ("05-01", "عيد العمال العالمي", 0),
              ("05-13", "عيد الفطر", 1), ("05-14", "عيد الفطر", 1), ("05-15", "عيد الفطر", 1), ("05-16", "عيد الفطر", 1),
              ("07-14", "ثورة 14 تموز (تأسيس الجمهورية)", 2),
              ("07-20", "عيد الأضحى", 4), ("07-21", "عيد الأضحى", 4), ("07-22", "عيد الأضحى", 4), ("07-23", "عيد الأضحى", 4),
              ("08-10", "رأس السنة الهجرية", 4), ("08-19", "عاشوراء", 4), ("10-03", "العيد الوطني لجمهورية العراق", 3),
              ("10-19", "المولد النبوي الشريف", 4), ("12-10", "يوم النصر على داعش", 4)],
        suppressed=[], working=[],
        notes="Fitr: Sunni Thu 13 May, Shia Fri 14 May -> holiday to Sun 16 May (4 days). Then 17-20 May a COVID "
              "closure (IQ_ADHOC). Adha 1442 = Tue 20 Jul (Hague embassy closed 19-23 Jul); cabinet extension not "
              "found. Muharram (Aug 9 or 10) and Mawlid (Oct 18 or 19) approximate (CBI *11 Aug, *19 Oct; python 9 Aug, "
              "18 Oct). 10 Dec 2021 was a Friday."),
    2022: dict(
        confidence="primary",
        docs=[
            dict(title="Law 110/1972 (statutory list)", uri=D110, issued="1972-09-11", issued_uri=D110,
                 published="1972-09-19", published_uri=D110, published_in="الوقائع العراقية 2184", dates_note=None),
            dict(title="Eid al-Fitr Holiday to begin on Sunday (Iraq Business News: holiday Sun 1 May - Thu 5 May 2022)",
                 uri="https://www.iraq-businessnews.com/?p=189626", issued=None, issued_uri=None, published=None,
                 published_uri="https://www.iraq-businessnews.com/?p=189626", published_in="press",
                 dates_note="secondary for this item"),
            dict(title="أمانة مجلس الوزراء تحدد عطلة عيد الأضحى المبارك (INA 159927): PM directive at 25th session 2/7/2022, holiday Sat 9/7 - Thu 14/7/2022, resume Sun 17/7",
                 uri="https://ina.iq/159927--.html", issued="2022-07-02", issued_uri="https://ina.iq/159927--.html", published="2022-07-02",
                 published_uri="https://ina.iq/159927--.html", published_in="official news release (INA)",
                 dates_note=None),
            dict(title="امانة مجلس الوزراء تقرر تعطيل الدوام الرسمي الثلاثاء (INA 162681): 10 Muharram 1444 = Tue 9 Aug 2022",
                 uri="https://ina.iq/162681--.html", issued="2022-08-07", issued_uri="https://ina.iq/162681--.html", published="2022-08-07",
                 published_uri="https://ina.iq/162681--.html", published_in="official news release (INA)",
                 dates_note=None),
            dict(title="تعطيل الدوام الرسمي يوم الاثنين احتفاءً بالعيد الوطني لجمهورية العراق (INA 166774): Mon 3 Oct 2022",
                 uri="https://ina.iq/166774--.html", issued="2022-10-01", issued_uri="https://ina.iq/166774--.html", published="2022-10-01",
                 published_uri="https://ina.iq/166774--.html", published_in="official news release (INA)",
                 dates_note=None),
            dict(title="الأمانة العامة: تعطيل الدوام الرسمي يومي الأحد والإثنين المقبلين (INA 173747): Sun 25 Dec all, Mon 26 Dec Christians only (8th session 13/12/2022)",
                 uri="https://ina.iq/173747--.html", issued="2022-12-13", issued_uri="https://ina.iq/173747--.html", published="2022-12-21",
                 published_uri="https://ina.iq/173747--.html", published_in="official news release (INA)",
                 dates_note=None),
            dict(title="CBI calendar 2022 (cbi.iq/page/78, Wayback 2022-04-01)",
                 uri="https://web.archive.org/web/20220401052439/https://cbi.iq/page/78", issued=None, issued_uri=None,
                 published=None, published_uri="https://web.archive.org/web/20220401052439/https://cbi.iq/page/78",
                 published_in="official calendar page (Central Bank of Iraq)", dates_note="approximate Islamic dates"),
        ],
        days=[("01-01", "رأس السنة الميلادية", 0), ("01-06", "عيد الجيش", 0), ("03-21", "عيد نوروز", 0),
              ("05-01", "عيد العمال العالمي", 0),
              ("05-02", "عيد الفطر", 1), ("05-03", "عيد الفطر", 1), ("05-04", "عيد الفطر", 1),
              ("05-05", "عيد الفطر (extension)", 1),
              ("07-09", "عيد الأضحى", 2), ("07-10", "عيد الأضحى", 2), ("07-11", "عيد الأضحى", 2), ("07-12", "عيد الأضحى", 2),
              ("07-13", "عيد الأضحى (extension)", 2), ("07-14", "ثورة 14 تموز", 2),
              ("07-30", "رأس السنة الهجرية", 6), ("08-09", "عاشوراء", 3), ("10-03", "العيد الوطني لجمهورية العراق", 4),
              ("10-08", "المولد النبوي الشريف", 6), ("12-10", "يوم النصر على داعش", 6),
              ("12-25", "عيد الميلاد المجيد", 5)],
        suppressed=[], working=[],
        notes="Fitr block 1-5 May (1 May Labour Day + Fitr Mon 2 May + Thu 5 May extension) - secondary. Adha block "
              "9-14 Jul joins Republic Day. 1 Muharram (Sat 30 Jul) and Mawlid (Sat 8 Oct) fall on weekends. 10 Dec "
              "Saturday. 26 Dec Christians only (not national)."),
    2023: dict(
        confidence="primary",
        docs=[
            dict(title="Law 110/1972 (statutory list)", uri=D110, issued="1972-09-11", issued_uri=D110,
                 published="1972-09-19", published_uri=D110, published_in="الوقائع العراقية 2184", dates_note=None),
            dict(title="تعطيل الدوام بمناسبة اعياد نوروز (GS, 20 آذار 2023)", uri=_cab("HLUQ1N8!FmD1kXw"),
                 issued="2023-03-20", issued_uri=_cab("HLUQ1N8!FmD1kXw"), published="2023-03-21",
                 published_uri=_cab("HLUQ1N8!FmD1kXw"), published_in="official news release (cabinet.iq)", dates_note=None),
            dict(title="رئيس الوزراء يحدد عطلة عيد الفطر (INA 183226, 18-04-2023): Thu 20 Apr - Mon 24 Apr",
                 uri="https://ina.iq/183226--20-24-.html", issued="2023-04-18", issued_uri="https://ina.iq/183226--20-24-.html",
                 published="2023-04-18", published_uri="https://ina.iq/183226--20-24-.html",
                 published_in="official news release (INA, PM media office)", dates_note=None),
            dict(title="رئيس الوزراء يوجّه ببدء عطلة عيد الأضحى المبارك من الثلاثاء المقبل (INA 187899, 20-06-2023): Tue 27 Jun - Sun 2 Jul",
                 uri="https://ina.iq/ar/political/187899--27-2023.html", issued="2023-06-20",
                 issued_uri="https://ina.iq/ar/political/187899--27-2023.html", published="2023-06-20",
                 published_uri="https://ina.iq/ar/political/187899--27-2023.html",
                 published_in="official news release (INA, PM media office)", dates_note=None),
            dict(title="الأمانة العامة لمجلس الوزراء تعطل الدوام الرسمي يوم غد الأربعاء (INA 189643, 18-07-2023): new Hijri year",
                 uri="https://ina.iq/ar/local/189643--.html", issued="2023-07-18", issued_uri="https://ina.iq/ar/local/189643--.html",
                 published="2023-07-18", published_uri="https://ina.iq/ar/local/189643--.html",
                 published_in="official news release (INA, GS)", dates_note=None),
            dict(title="تعطيل الدوام الرسمي يوم الأربعاء 2023/9/27 (المولد النبوي) (GS, 21 أيلول 2023)", uri=_cab("zeqLRC@xX$f-LUH"),
                 issued="2023-09-21", issued_uri=_cab("zeqLRC@xX$f-LUH"), published="2023-09-22",
                 published_uri=_cab("zeqLRC@xX$f-LUH"), published_in="official news release (cabinet.iq)", dates_note=None),
            dict(title="تعطيل الدوام الرسمي يوم الثلاثاء 2023/10/3 احتفاءً بالعيد الوطني (GS)", uri=_cab("a9QDw-4_!8zTAl6"),
                 issued="2023-09-26", issued_uri=_cab("a9QDw-4_!8zTAl6"), published="2023-09-26",
                 published_uri=_cab("a9QDw-4_!8zTAl6"), published_in="official news release (cabinet.iq)", dates_note=None),
            dict(title="تعطيل الدوام الرسمي ليوم الأحد 10 كانون الأول 2023 (يوم النصر) (GS, 7 كانون الأول 2023; INA 198776)",
                 uri=_cab("80u_0ggLI3dUO%F"), issued="2023-12-07", issued_uri="https://ina.iq/ar/political/198776--.html",
                 published="2023-12-07", published_uri=_cab("80u_0ggLI3dUO%F"),
                 published_in="official news release (cabinet.iq)", dates_note=None),
            dict(title="رئيس الوزراء يحدد عطلة المكون المسيحي بمناسبة اعياد الميلاد (INA 199643, 20-12-2023): 25-26 Dec Christians only",
                 uri="https://ina.iq/199643--.html", issued="2023-12-20", issued_uri="https://ina.iq/199643--.html",
                 published="2023-12-20", published_uri="https://ina.iq/199643--.html",
                 published_in="official news release (INA, PM media office)", dates_note=None),
        ],
        days=[("01-01", "رأس السنة الميلادية", 0), ("01-06", "عيد الجيش", 0), ("03-21", "عيد نوروز", 1),
              ("04-20", "عيد الفطر (extension)", 2), ("04-21", "عيد الفطر", 2), ("04-22", "عيد الفطر", 2),
              ("04-23", "عيد الفطر", 2), ("04-24", "عيد الفطر (extension)", 2),
              ("05-01", "عيد العمال العالمي", 0),
              ("06-27", "عيد الأضحى (extension, يوم عرفة)", 3), ("06-28", "عيد الأضحى", 3), ("06-29", "عيد الأضحى", 3),
              ("06-30", "عيد الأضحى", 3), ("07-01", "عيد الأضحى", 3), ("07-02", "عيد الأضحى (extension)", 3),
              ("07-14", "ثورة 14 تموز", 0), ("07-19", "رأس السنة الهجرية", 4), ("07-28", "عاشوراء", 0),
              ("09-27", "المولد النبوي الشريف", 5), ("10-03", "العيد الوطني لجمهورية العراق", 6),
              ("12-10", "يوم النصر على داعش", 7)],
        suppressed=[], working=[],
        notes="25-26 Dec 2023 holiday for Christians only (not national). 14 Jul (Fri) and Ashura 10 Muh 1445 (Fri 28 "
              "Jul, counted from the declared 1 Muharram Wed 19 Jul) fall on weekends. 2 Jul 2023 = 13 DhH by Shia "
              "count? (Adha 1444: Sunni Wed 28 Jun; the block ran to Sun 2 Jul). Christian Easter 9-10 Apr was "
              "community-only. cabinet.iq data start 2023-02-28 (Jan 2023 not covered). Yazidi Jama feast made a "
              "Yazidi-only annual holiday (cabinet 4/10/2023)."),
    2024: dict(
        confidence="primary",
        docs=[
            dict(title="Law 110/1972 (statutory list, in force to 2024-05-26)", uri=D110, issued="1972-09-11", issued_uri=D110,
                 published="1972-09-19", published_uri=D110, published_in="الوقائع العراقية 2184", dates_note=None),
            dict(title="قانون العطلات الرسمية رقم (12) لسنة 2024", uri=W4777, issued="2024-05-27", issued_uri=W4777,
                 published="2024-05-27", published_uri=W4777, published_in="الوقائع العراقية العدد 4777", dates_note=None),
            dict(title="تعطيل الدوام الرسمي يوم الخميس 2024/3/21 (نوروز) (GS, 18 آذار 2024)", uri=_cab("N-eSx%HSdtm7rAz"),
                 issued="2024-03-18", issued_uri=_cab("N-eSx%HSdtm7rAz"), published="2024-03-18",
                 published_uri=_cab("N-eSx%HSdtm7rAz"), published_in="official news release (cabinet.iq)", dates_note=None),
            dict(title="مجلس الوزراء يحدد عطلة عيد الفطر المبارك (session 13, 26/3/2024): Tue 9/4 - Sat 13/4/2024, resume Sun 14/4 (INA 205704; cabinet.iq)",
                 uri=_cab("KxY1buYqJK@XzKy"), issued="2024-03-26", issued_uri="https://ina.iq/ar/political/205704--.html",
                 published="2024-03-27", published_uri=_cab("KxY1buYqJK@XzKy"),
                 published_in="official news release (cabinet.iq / INA)", dates_note=None),
            dict(title="تعطيل الدوام الرسمي يوم الأربعاء 1/5/2024 (عيد العمال) (cabinet session 16, 23/4/2024)", uri=_cab("IJ3z!vZ3XrhzXHT"),
                 issued="2024-04-23", issued_uri=_cab("uu-4uQxQkk7S@PP"), published="2024-04-28",
                 published_uri=_cab("IJ3z!vZ3XrhzXHT"), published_in="official news release (cabinet.iq)", dates_note=None),
            dict(title="رئيس الوزراء يوجه ببدء عطلة عيد الأضحى من الأحد 16 حزيران ولغاية الخميس 20 حزيران (INA 210211, 4-06-2024)",
                 uri="https://ina.iq/210211--16-20-.html", issued="2024-06-04", issued_uri="https://ina.iq/210211--16-20-.html",
                 published="2024-06-04", published_uri="https://ina.iq/210211--16-20-.html",
                 published_in="official news release (INA, PM media office)", dates_note=None),
            dict(title="تعطيل الدوام الرسمي يوم الثلاثاء 25/6/2024 تزامنًا مع يوم الغدير (session 24, 10/6/2024)", uri=_cab("y%qnJbLDMHFHX@9"),
                 issued="2024-06-10", issued_uri=_cab("y%qnJbLDMHFHX@9"), published="2024-06-13",
                 published_uri=_cab("y%qnJbLDMHFHX@9"), published_in="official news release (cabinet.iq)", dates_note=None),
            dict(title="تعطيل الدوام الرسمي يوم الأحد 7/7/2024 رأس السنة الهجرية، استناداً الى المادة (1/أولاً/ب) من قانون العطلات الرسمية 12 لسنة 2024 (session 27, 2/7/2024)",
                 uri=_cab("c2kY57J-RWhwkLz"), issued="2024-07-02", issued_uri=_cab("QBDe7EhJJ1ycyCZ"), published="2024-07-04",
                 published_uri=_cab("c2kY57J-RWhwkLz"), published_in="official news release (cabinet.iq)", dates_note=None),
            dict(title="تعطيل الدوام الرسمي يوم الأربعاء 17/7/2024 (عاشوراء)، المادة (1/أولاً/ج) (session 29, 14/7/2024)", uri=_cab("5ObB%1Nf%_eF0dr"),
                 issued="2024-07-14", issued_uri=_cab("5ObB%1Nf%_eF0dr"), published="2024-07-15",
                 published_uri=_cab("5ObB%1Nf%_eF0dr"), published_in="official news release (cabinet.iq)", dates_note=None),
            dict(title="تعطيل الدوام الرسمي يوم الأحد 15 أيلول 2024 (المولد النبوي) (session 37, 10/9/2024)", uri=_cab("a_-1aYrjxEHU%nU"),
                 issued="2024-09-10", issued_uri=_cab("a_-1aYrjxEHU%nU"), published="2024-09-12",
                 published_uri=_cab("a_-1aYrjxEHU%nU"), published_in="official news release (cabinet.iq)", dates_note=None),
            dict(title="رئيس الوزراء يوجه بتعطيل الدوام يوم 3 تشرين الأول (INA 218194, 1-10-2024), after GS said the law has no 3 Oct holiday (INA 218125, 30-09-2024)",
                 uri="https://ina.iq/ar/political/218194--3-.html", issued="2024-10-01",
                 issued_uri="https://ina.iq/ar/local/218125--3-.html", published="2024-10-01",
                 published_uri="https://ina.iq/ar/political/218194--3-.html",
                 published_in="official news release (INA, PM media office)", dates_note=None),
            dict(title="مجلس الوزراء يقرر تعطيل الدوام الرسمي ليوم الثلاثاء 10 كانون الأول 2024 (يوم النصر)", uri=_cab("aUXKZV9T_!8bU3h"),
                 issued="2024-12-05", issued_uri="https://ina.iq/222823--10-2024.html", published="2024-12-05",
                 published_uri=_cab("aUXKZV9T_!8bU3h"), published_in="official news release (cabinet.iq)", dates_note=None),
            dict(title="صوت مجلس الوزراء على اعتبار يوم غد الأربعاء 25 كانون الأول 2024 عطلة رسمية لعموم أبناء شعبنا (GS 24-12-2024; INA 224354)",
                 uri=_cab("Y8sCm_n@oofFuuk"), issued="2024-12-24", issued_uri="https://ina.iq/224354--.html",
                 published="2024-12-24", published_uri=_cab("Y8sCm_n@oofFuuk"),
                 published_in="official news release (cabinet.iq)", dates_note=None),
        ],
        days=[("01-01", "رأس السنة الميلادية", 0), ("01-06", "عيد الجيش", 0), ("03-21", "عيد نوروز", 2),
              ("04-09", "عيد الفطر (extension)", 3), ("04-10", "عيد الفطر", 3), ("04-11", "عيد الفطر", 3),
              ("04-12", "عيد الفطر", 3), ("04-13", "عيد الفطر (extension)", 3),
              ("05-01", "عيد العمال العالمي", 4),
              ("06-16", "عيد الأضحى", 5), ("06-17", "عيد الأضحى", 5), ("06-18", "عيد الأضحى", 5), ("06-19", "عيد الأضحى", 5),
              ("06-20", "عيد الأضحى (extension)", 5), ("06-25", "يوم الغدير", 6),
              ("07-07", "رأس السنة الهجرية", 7), ("07-17", "عاشوراء", 8), ("09-15", "المولد النبوي الشريف", 9),
              ("10-03", "العيد الوطني لجمهورية العراق", 10), ("12-10", "يوم النصر على داعش", 11),
              ("12-25", "عيد الميلاد المجيد", 12)],
        suppressed=[("07-14", "ثورة 14 تموز", 1)],
        working=[],
        notes="Law 12/2024 in force 2024-05-27: 14 July dropped (Sun 14 Jul 2024 not a holiday; Kurdistan kept it "
              "regionally). 16 March first applies in 2025. 04-13 is a Saturday (weekend) inside the Fitr block. "
              "3 Oct, 10 Dec, 25 Dec declared by the PM/cabinet (law art.3). 26 Dec Christians only. Christians-only "
              "Easter 31 Mar-1 Apr. Ghadir 18 DhH 1445 = Tue 25 Jun."),
    2025: dict(
        confidence="primary",
        docs=[
            dict(title="قانون العطلات الرسمية رقم (12) لسنة 2024", uri=W4777, issued="2024-05-27", issued_uri=W4777,
                 published="2024-05-27", published_uri=W4777, published_in="الوقائع العراقية العدد 4777", dates_note=None),
            dict(title="الأمانة العامة لمجلس الوزراء: تعطيل الدوام الرسمي يوم الأحد 16 آذار 2025 (المادة 1/أولاً/ل)", uri=_cab("1ubRyppeJfku7-a"),
                 issued="2025-03-10", issued_uri=_cab("1ubRyppeJfku7-a"), published="2025-03-10",
                 published_uri=_cab("1ubRyppeJfku7-a"), published_in="official news release (cabinet.iq)", dates_note=None),
            dict(title="تعطيل الدوام الرسمي طيلة الأسبوع المقبل بمناسبة عيد الفطر (cabinet, 26-03-2025)", uri=_cab("CGUg3jC94%9P!VO"),
                 issued="2025-03-25", issued_uri=_cab("CGUg3jC94%9P!VO"), published="2025-03-26",
                 published_uri=_cab("CGUg3jC94%9P!VO"), published_in="official news release (cabinet.iq)",
                 dates_note="'the whole of next week' = Sun 30 Mar - Thu 3 Apr 2025"),
            dict(title="تعطيل الدوام يوم الخميس 2025/5/1 عيد العمال (المادة 1/أولاً/ك)", uri=_cab("xBrOtN68Xt84%c0"),
                 issued="2025-04-28", issued_uri=_cab("xBrOtN68Xt84%c0"), published="2025-04-28",
                 published_uri=_cab("xBrOtN68Xt84%c0"), published_in="official news release (cabinet.iq)", dates_note=None),
            dict(title="مجلس الوزراء يحدد أيام العطلة الرسمية لعيدي الأضحى والغدير: Fri 6 Jun - Tue 10 Jun; Ghadir Sun 15 Jun (cabinet.iq 3 حزيران 2025; INA 235606)",
                 uri=_cab("zvmQM9zLZ9H%IPy"), issued="2025-06-03", issued_uri="https://ina.iq/ar/political/235606--15-.html",
                 published="2025-06-03", published_uri=_cab("zvmQM9zLZ9H%IPy"),
                 published_in="official news release (cabinet.iq / INA)", dates_note=None),
            dict(title="الخميس 26 حزيران 2025 عطلة رسمية بمناسبة الأول من محرم (GS)", uri=_cab("xG%9yLi6rykTc%y"),
                 issued="2025-06-23", issued_uri=_cab("xG%9yLi6rykTc%y"), published="2025-06-23",
                 published_uri=_cab("xG%9yLi6rykTc%y"), published_in="official news release (cabinet.iq)", dates_note=None),
            dict(title="الأحد 6 تموز 2025 عطلة رسمية (عاشوراء، المادة 1/أولاً/ج) (GS)", uri=_cab("vSIMk6A1Ko390wC"),
                 issued="2025-07-01", issued_uri=_cab("vSIMk6A1Ko390wC"), published="2025-07-01",
                 published_uri=_cab("vSIMk6A1Ko390wC"), published_in="official news release (cabinet.iq)", dates_note=None),
            dict(title="الخميس 4 أيلول 2025 عطلة رسمية بمناسبة المولد النبوي (GS)", uri=_cab("U5XEg$fG2W%Kvzg"),
                 issued="2025-08-26", issued_uri=_cab("U5XEg$fG2W%Kvzg"), published="2025-08-26",
                 published_uri=_cab("U5XEg$fG2W%Kvzg"), published_in="official news release (cabinet.iq)", dates_note=None),
            dict(title="Al-Mustaqbal University: suspension of work Wed 10 Dec 2025 'based on the decision of the Council of Ministers'",
                 uri="https://www.uomus.edu.iq/CollegeEn/Details/98454", issued=None, issued_uri=None, published=None,
                 published_uri="https://www.uomus.edu.iq/CollegeEn/Details/98454", published_in="university notice",
                 dates_note="SECONDARY; cabinet.iq has no 10 Dec 2025 item; several governors announced local closures"),
            dict(title="مجلس الوزراء يقرر تعطيل الدوام الخميس 25 كانون الأول 2025 بمناسبة مولد السيد المسيح", uri=_cab("osYQZn!u%l-!n-l"),
                 issued="2025-12-23", issued_uri=_cab("osYQZn!u%l-!n-l"), published="2025-12-23",
                 published_uri=_cab("osYQZn!u%l-!n-l"), published_in="official news release (cabinet.iq)", dates_note=None),
        ],
        days=[("01-01", "رأس السنة الميلادية", 0), ("01-06", "عيد الجيش", 0),
              ("03-16", "ذكرى جرائم البعث الصدامي", 1), ("03-21", "عيد نوروز", 0),
              ("03-30", "عيد الفطر", 2), ("03-31", "عيد الفطر", 2), ("04-01", "عيد الفطر", 2), ("04-02", "عيد الفطر", 2),
              ("04-03", "عيد الفطر (extension)", 2),
              ("05-01", "عيد العمال العالمي", 3),
              ("06-06", "عيد الأضحى", 4), ("06-07", "عيد الأضحى", 4), ("06-08", "عيد الأضحى", 4), ("06-09", "عيد الأضحى", 4),
              ("06-10", "عيد الأضحى (extension)", 4), ("06-15", "عيد الغدير", 4),
              ("06-26", "رأس السنة الهجرية", 5), ("07-06", "عاشوراء", 6), ("09-04", "المولد النبوي الشريف", 7),
              ("12-10", "يوم النصر على داعش", 8), ("12-25", "عيد الميلاد المجيد", 9)],
        suppressed=[], working=[],
        notes="Fitr 1446: Sunni Sun 30 Mar, Shia Mon 31 Mar -> statutory span 30 Mar-2 Apr (law art.1 second), cabinet "
              "closed the whole week to Thu 3 Apr. 3 Oct 2025 a Friday (celebrations only). 10 Dec 2025 secondary. "
              "11 Nov 2025 election day closure in IQ_ADHOC. Christian Easter 20-21 Apr community-only."),
    2026: dict(
        confidence="primary",
        docs=[
            dict(title="قانون العطلات الرسمية رقم (12) لسنة 2024", uri=W4777, issued="2024-05-27", issued_uri=W4777,
                 published="2024-05-27", published_uri=W4777, published_in="الوقائع العراقية العدد 4777", dates_note=None),
            dict(title="تعطيل الدوام الرسمي يوم الإثنين 16 آذار 2026 (المادة 1/أولاً/ل) (GS 9 آذار 2026)", uri=_cab("0b8%sE4UhaQL5Cb"),
                 issued="2026-03-09", issued_uri=_cab("0b8%sE4UhaQL5Cb"), published="2026-03-09",
                 published_uri=_cab("0b8%sE4UhaQL5Cb"), published_in="official news release (cabinet.iq)", dates_note=None),
            dict(title="مجلس الوزراء يقرّر تعطيل الدوام بمناسبة عيد الفطر من الأربعاء 18 آذار الى الإثنين 23 آذار 2026 (cabinet.iq; INA 258181)",
                 uri=_cab("Q0A0du%-wPz5cuQ"), issued="2026-03-17", issued_uri="https://ina.iq/ar/local/258181-.html",
                 published="2026-03-17", published_uri=_cab("Q0A0du%-wPz5cuQ"),
                 published_in="official news release (cabinet.iq / INA)", dates_note=None),
            dict(title="مجلس الوزراء يعلن عطلتَي عيد الأضحى (الثلاثاء 26 - السبت 30 أيار) والغدير (الخميس 4 حزيران) (cabinet.iq 19-5-2026; INA 263684)",
                 uri=_cab("eqoqcPXSBw46Pmq"), issued="2026-05-19", issued_uri="https://ina.iq/ar/political/263684-26-30.html",
                 published="2026-05-19", published_uri=_cab("eqoqcPXSBw46Pmq"),
                 published_in="official news release (cabinet.iq / INA)", dates_note=None),
            dict(title="الثلاثاء 16 حزيران 2026 عطلة رسمية عامة - الأول من المحرم (المادة 1/أولاً/ب)", uri=_cab("IVpADoidIs3VVL9"),
                 issued="2026-06-15", issued_uri=_cab("IVpADoidIs3VVL9"), published="2026-06-15",
                 published_uri=_cab("IVpADoidIs3VVL9"), published_in="official news release (cabinet.iq)", dates_note=None),
            dict(title="تعطيل الدوام الرسمي يوم الخميس 25 حزيران 2026 (عاشوراء) (cabinet session 7, 20/6/2026)", uri=_cab("W4BQ4b6BjhwMXAD"),
                 issued="2026-06-20", issued_uri=_cab("W4BQ4b6BjhwMXAD"), published="2026-06-21",
                 published_uri=_cab("W4BQ4b6BjhwMXAD"), published_in="official news release (cabinet.iq)", dates_note=None),
            dict(title="الثلاثاء 25 آب 2026 عطلة رسمية - المولد النبوي (المادة 1/أولاً/د) (GS 17 آب 2026)", uri=_cab("eACTAa3zBsJUpyT"),
                 issued="2026-08-17", issued_uri=_cab("eACTAa3zBsJUpyT"), published="2026-08-17",
                 published_uri=_cab("eACTAa3zBsJUpyT"), published_in="official news release (cabinet.iq)", dates_note=None),
            dict(title="مجلس الوزراء يقرر تعطيل الدوام احتفاء بأيام السيادة والعيد الوطني: الأربعاء 30/9 - السبت 3/10/2026 (session 20, 26/9/2026; INA 274632)",
                 uri=_cab("dZCjfoKXVPeyyJV"), issued="2026-09-26", issued_uri=_cab("2!rMm9DCk37NMG4"),
                 published="2026-09-28", published_uri=_cab("dZCjfoKXVPeyyJV"),
                 published_in="official news release (cabinet.iq)", dates_note=None),
        ],
        days=[("01-01", "رأس السنة الميلادية", 0), ("01-06", "عيد الجيش", 0),
              ("03-16", "ذكرى جرائم البعث الصدامي", 1),
              ("03-18", "عيد الفطر (extension)", 2), ("03-19", "عيد الفطر (extension)", 2),
              ("03-20", "عيد الفطر", 2), ("03-21", "عيد الفطر; عيد نوروز", 2), ("03-22", "عيد الفطر", 2),
              ("03-23", "عيد الفطر (extension)", 2),
              ("05-01", "عيد العمال العالمي", 0),
              ("05-26", "عيد الأضحى (extension, يوم عرفة)", 3), ("05-27", "عيد الأضحى", 3), ("05-28", "عيد الأضحى", 3),
              ("05-29", "عيد الأضحى", 3), ("05-30", "عيد الأضحى", 3), ("06-04", "عيد الغدير", 3),
              ("06-16", "رأس السنة الهجرية", 4), ("06-25", "عاشوراء", 5), ("08-25", "المولد النبوي الشريف", 6),
              ("10-03", "العيد الوطني لجمهورية العراق", 7)],
        suppressed=[], working=[],
        notes="Fitr 1447: Sunni Endowment declared Fri 20 Mar (INA 258326); if the Shia diwan declared Sat 21 Mar the "
              "statutory span is 20-23 Mar, so 03-23 may be statutory rather than an extension. 18-19 Mar bridge days. "
              "Adha 1447 = Wed 27 May (10 DhH), 26 May = Arafah bridge. 30 Sep - 2 Oct 'Sovereignty days' in IQ_ADHOC; "
              "3 Oct (Sat) national day. As of 2026-11-28 no decision yet for 10 Dec (Thu) or 25 Dec (Fri)."),
}

IQ_ADHOC = [
    ("2002-10-16", "عطلة بعد الاستفتاء على منصب رئيس الجمهورية (مرسوم 252 لسنة 2002)",
     "https://wiki.dorar-aliraq.net/iraqilaws/law/15827.html", "issued 2002-10-15", "President (Saddam Hussein), Law 110 art.3"),
    ("2017-12-31", "تعطيل الدوام بدل عيد الجيش (6 كانون الثاني 2018 يوم سبت)",
     "https://ina.iq/ar/local/8362--.html", "issued 2017-12 (snippet only)", "PM Haider al-Abadi"),
    ("2019-04-02", "ذكرى استشهاد الإمام الكاظم - بغداد فقط، عدا الدوائر الخدمية والأمنية",
     "https://ina.iq/84121--.html", "issued 2019-03-27", "Council of Ministers via GS (Baghdad only)"),
    ("2021-01-03","GS: work in the new year resumes Monday 4 Jan 2021 (Sun 3 Jan off?) - unverified",
     "https://www.ina.iq/118905/", "issued ~2020-12-31", "General Secretariat of the Council of Ministers"),
    ("2021-05-17", "COVID closure of all offices 17-20 May 2021 (Higher Committee for Health and National Safety)",
     "https://ina.iq/125814--.html", "issued 2021-05-13", "Higher Committee for Health and National Safety"),
    ("2021-05-18", "COVID closure (cont.)", "https://ina.iq/125814--.html", "issued 2021-05-13", "Higher Committee"),
    ("2021-05-19", "COVID closure (cont.)", "https://ina.iq/125814--.html", "issued 2021-05-13", "Higher Committee"),
    ("2021-05-20", "COVID closure (cont.)", "https://ina.iq/125814--.html", "issued 2021-05-13", "Higher Committee"),
    ("2022-07-31", "تعطيل الدوام الرسمي ليوم الأحد 31/7/2022 عدا المؤسسات الأمنية",
     "https://www.skynewsarabia.com/middle-east/1543303", "issued 2022-07-30", "PM Mustafa al-Kadhimi (GS statement)"),
    ("2022-09-18", "Arbaeen of Imam Hussein (PM al-Kadhimi directive, GS statement)",
     "https://ina.iq/en/local/21828-pm-next-sunday-is-a-public-holiday.html", "issued 2022-09-13", "PM Mustafa al-Kadhimi"),
    ("2024-02-06","ذكرى استشهاد الإمام الكاظم - بغداد فقط", _cab("VXk5$!YLIQvPLaW"), "issued 2024-02-01", "PM (Baghdad only)"),
    ("2024-07-11", "Heat: Thursday closure (Rudaw report)", "https://www.rudaw.net/english/middleeast/iraq/100720241",
     "issued 2024-07-10", "Federal government (press only)"),
    ("2024-08-25", "أربعينية الإمام الحسين", _cab("X6%pYra4M5X@uy8"), "issued 2024-08-20", "PM Mohammed Shia al-Sudani"),
    ("2025-01-26", "ذكرى استشهاد الإمام الكاظم - بغداد فقط (المادة 3/أولاً)", _cab("eKozu4tO2lSeVYd"), "issued 2025-01-21", "Council of Ministers (Baghdad only)"),
    ("2025-08-14", "أربعينية الإمام الحسين", _cab("0SRwZ5TO4%sSDiD"), "issued 2025-08-10", "Council of Ministers"),
    ("2025-11-11", "الاقتراع العام لانتخابات مجلس النواب (المادة 3/أولاً)", _cab("v2YeaV0KUZT5UAM"), "issued 2025-11-04", "Council of Ministers"),
    ("2026-01-15", "ذكرى استشهاد الإمام الكاظم (Thursday after session 1 of 7/1/2026; scope Baghdad?)", _cab("LpxEW5mie47gb%g"),
     "issued 2026-01-07", "Council of Ministers - date inferred 'Thursday', verify"),
    ("2026-03-26", "سوء الأحوال الجوية - all official institutions except service ones", _cab("vGXs3D5KrUqZcQl"), "issued 2026-03-25", "PM"),
    ("2026-04-01", "تأهل المنتخب الوطني الى نهائيات كأس العالم 2026", _cab("G7qZotmrmlVUhBF"), "issued 2026-04-01", "PM"),
    ("2026-04-02", "تأهل المنتخب الوطني الى نهائيات كأس العالم 2026", _cab("G7qZotmrmlVUhBF"), "issued 2026-04-01", "PM"),
    ("2026-07-08", "مراسم تشييع جثمان السيد علي الخامنئي", _cab("SBcJJG8ElKVu4Iz"), "issued 2026-07-07", "PM Ali Falih al-Zaidi"),
    ("2026-08-03", "أربعينية الإمام الحسين (المادة 3/أولاً)", _cab("oUXzLHE!4RjVgcS"), "issued 2026-07-25", "Council of Ministers"),
    ("2026-08-04", "أربعينية الإمام الحسين (المادة 3/أولاً)", _cab("oUXzLHE!4RjVgcS"), "issued 2026-07-25", "Council of Ministers"),
    ("2026-08-12", "ذكرى وفاة الرسول الأكرم", _cab("4aaozeH3W3-Kg-e"), "issued 2026-08-08", "PM Ali Falih al-Zaidi"),
    ("2026-09-30", "أيام السيادة (30/9-3/10)", _cab("dZCjfoKXVPeyyJV"), "issued 2026-09-26", "Council of Ministers"),
    ("2026-10-01", "أيام السيادة", _cab("dZCjfoKXVPeyyJV"), "issued 2026-09-26", "Council of Ministers"),
    ("2026-10-02", "أيام السيادة (Friday)", _cab("dZCjfoKXVPeyyJV"), "issued 2026-09-26", "Council of Ministers"),
]

IQ_FINDINGS = """
STATUTES (primary):
- Law 110/1972 (issued 1972-09-11, Waqa'i 2184 of 1972-09-19) governed 2000 to 2024-05-26. General list: 1 Jan,
  6 Jan, 8 Feb, 21 Mar, 1 May, 14 Jul, 17 Jul, Fitr 1-3 Shawwal (3 days), Adha 10-13 Dhu al-Hijja (4 days),
  1 Muharram, Ashura, Mawlid. NO Arafah, NO Christmas (Christians only), NO 3 Oct / 10 Dec.
  Text: dorar-aliraq legal wiki (via Wayback) - the official iraqld database (iraqld.hjc.iq -> iraqld.msla.iq)
  returns 403 to automated clients.
- RCC 210/1989 added 17 Apr and 8 Aug; RCC 886/1979 made 17 Jul the national day. Governing Council decision 1 of
  13 July 2003 abolished 8 Feb, 7 Apr, 17 Apr, 28 Apr, 17 Jul, 8 Aug and created 9 April (text not found; press only;
  its number confirmed by Law 12/2024 art.4). Order 18/2005 = Fri+Sat weekend; Order 25/2005 = 30 January annual
  holiday (election day).
- Law 12/2024 = "قانون العطلات الرسمية رقم (12) لسنة 2024" (the brief's "No. 9" is wrong), Al-Waqa'i al-Iraqiya
  no. 4777 of 2024-05-27, in force on publication. Ministry of Justice gazette PDF:
  https://www.moj.gov.iq/upload/pdf/4777_453.pdf (the PDF's text layer has reversed digits; read from the page images).
  Same text on cabinet.iq static page (2024-09-04). The MoJ index of Waqa'i issues 2014-2026 (574 issues) shows no
  amendment to Law 12/2024 up to issue 4890 (2026-11-23).

ISSUE ITEMS:
- 3 October National Day: designated by the cabinet on 2020-09-01 (bill sent to parliament; press). First day off on
  a working day: Sun 3 Oct 2021 (INA 137289); 2022 Mon (INA 166774); 2023 Tue (cabinet.iq); 2024 Thu - after the GS
  said on 2024-09-30 that Law 12/2024 has no 3 Oct holiday, the PM declared it on 2024-10-01 (INA 218194);
  2025 Fri; 2026 part of 30 Sep-3 Oct. So the issue is right that 1932-2019 is wrong; rule era (2020, None),
  declared yearly. CBI calendars list it from 2022.
- 14 July: statutory under Law 110/1972 from 1972 until Law 12/2024 (in force 2024-05-27) dropped it. Holiday
  2000-2023 (examples: Sun 14 Jul 2019 INA 90592; Wed 14 Jul 2021 INA 130002; 2022 part of the Adha block).
  NOT a federal holiday from 2024 (Kurdistan Region keeps it regionally). python-holidays agrees (<=2023).
- 6 January Army Day, 21 March Nowruz, 1 May, 1 January: statutory throughout (both laws).
- 10 December Victory Day: declared by PM Abadi 2017-12-09 as annual; observed 2017 (Sun), 2018 (Mon; AFP),
  2023 (cabinet.iq), 2024 (cabinet.iq), 2025 (secondary only). 2019 and 2020 unverified. Not in Law 12/2024
  (declared under art.3). Starter's 'from 2018' should be 2017.
- 25 December: NOT a statutory general holiday in either law (Christians-only under both). General holiday by
  decision in 2018 (first time), 2022 (Sun), 2024 (Wed), 2025 (Thu); 2023 Christians only (INA 199643); 2019 unknown.
  Starter's 'from 1932' rule is wrong.
- Eid al-Ghadir 18 Dhu al-Hijja: from Law 12/2024; first observed Tue 25 Jun 2024. Starter computes it as
  Adha+8 from 1932 - wrong era; should be (2024, None) and keyed on the declared Adha date.
- 8 February: statutory 1963/1972 to 2003 (abolished by the Governing Council in July 2003). python-holidays keeps
  it to 2024 - wrong per the 2003 abolition (python cites only the 1972 law).
- 16 March (Halabja/Ba'ath crimes): new in Law 12/2024; first observed Sun 16 Mar 2025.
- 17 July: holiday to 2002 only; python-holidays keeps it to 2023 - wrong.
- Eid lengths: Fitr 3 days, Adha 4 days (both laws). From 2024 the span stretches when the Sunni and Shia diwans
  disagree (2025 Fitr = 30 Mar-2 Apr). python-holidays gives Adha 3 days + Arafah - wrong on both counts;
  Arafah only appears as a declared bridge day (2023, 2026).
- Starter (src/starter-mena.lisp) also lacks: Adha 4th day OK, but has no 8 Feb/17 Jul eras (fine since 2000+
  only for 2000-2003) and no 14 July.

YEARS:
- primary: 2019-2026 (cabinet.iq API for 2023-03..2026-11; INA articles for 2019-2024; some items only seen via
  search-engine snippets of INA pages because INA blocks direct fetch and the Wayback Machine rate-limited this
  session - those docs say "seen via search snippet").
- secondary: 2015-2018 (statutory days at timeanddate/python-holidays Islamic dates; CBI 2018 calendar; press for
  10 Dec 2017/2018 and 25 Dec 2018).
- missing: 2000-2014 (no announcements found; old cabinet.iq archive has ~3000 article captures 2010-2023 that
  could be mined; use the statutes + estimated Islamic dates). 2027: only the statute and the CBI 2027 planning
  calendar (Fitr *9 Mar, Adha *16 May, Ghadir 24 May, Muharram *6 Jun, Ashura 15 Jun, Mawlid *14 Aug, plus
  1 Jan, 6 Jan, 16 Mar, 21 Mar, 1 May, 3 Oct, 10 Dec, 25 Dec) - cached at cbi/page-78-official-holidays.html.

DISAGREEMENTS / CAVEATS:
- Islamic dates before 2023 that I could not tie to an announcement use timeanddate (python-holidays) dates; the
  Sunni and Shia first days often differ by one day (e.g. Fitr 2019, 2021, 2025, Ashura 2020).
- CBI holiday calendars (bank calendar, approximate '*' dates) 2018-2021 omit 10 Dec and 25 Dec; 2022-2023 list
  3 Oct and 10 Dec; 2024-2027 add 25 Dec.
- 9 April (GC 1/2003) and 30 January (Order 25/2005) were legally official holidays until 2024 but I found no
  observance evidence; they are in IQ_OTHER_RULES only.
- Fitr 2022 (1-5 May) and 2020 (24-28 May) blocks come from press quoting the government.
"""


# --- main agent: days the annual decisions give where no yearly declaration was found ---
# 3 October (Council of Ministers, 1 Sep 2020) and 10 December (PM, 9 Dec 2017) are annual
# national holidays by their decisions; the gold counts them in every year from then on.
# 2025-10-03 was a Friday (no separate declaration needed); 2026-12-10 is not yet declared.
def _decision_doc(key):
    s = next(s for s in IQ_STATUTES if s["key"] == key)
    return dict(title=s["title"], uri=s["uri"], issued=s["issued"], issued_uri=s["issued_uri"],
                published=s["published"], published_uri=s["published_uri"], published_in=s["published_in"],
                dates_note=s["dates_note"])


for _y, _md, _name, _key in ((2025, "10-03", "العيد الوطني لجمهورية العراق", "com-2020-national-day"),
                             (2026, "12-10", "يوم النصر على داعش", "com-2017-victory-day")):
    IQ_YEARS[_y]["docs"].append(_decision_doc(_key))
    IQ_YEARS[_y]["days"].append((_md, _name, len(IQ_YEARS[_y]["docs"]) - 1))
