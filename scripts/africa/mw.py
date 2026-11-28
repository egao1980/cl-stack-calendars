"""Malawi public holidays 2000-2027: source transcription for egao1980/cl-stack-calendars#45.
Stdlib only; data, no logic.

Primary sources are thin: malawilii.org is behind a Cloudflare challenge (the Act was read from
the Wayback copy of 2 Dec 2021), and the Malawi Gazette notices / Ministry of Local Government
annual holiday statements were not found online. Year data therefore rest on the statute plus
news reports of Ministry statements (secondary).

Cache: ~/.cache/cl-stack-calendars/mw/
  wb-malawilii-act-1967-11-2014.html   Act text (Wayback copy of the MalawiLII consolidation)
  nt-*.html, mbc-*.html, mwnation-*.html, nyasatimes-36767.html   news reports used below
"""

_ACT = "https://malawilii.org/akn/mw/act/1967/11/eng@2014-12-31"
_ACT_WB = "https://web.archive.org/web/20211202034241id_/https://malawilii.org/akn/mw/act/1967/11/eng@2014-12-31"

MW_STATUTES = [
    dict(key="cap-18-05",
         title="Public Holidays Act, Chapter 18:05 (Act 11 of 1967), revised and consolidated to "
               "31 December 2014 (L.R.O. 1/2015)",
         uri=_ACT_WB, issued="1967-07-28", issued_uri=_ACT,
         published=None, published_uri=None,
         published_in="Laws of Malawi, Fourth Revised Edition (L.R.O. 1/2015), via MalawiLII",
         in_force="1967-07-28",
         dates_note="Commencement 28 July 1967 per MalawiLII; the 1967 Gazette issue was not located.",
         summary="s.2 Schedule days are public holidays. s.3(1) the Minister may amend the Schedule by "
                 "Gazette order; s.3(2) may declare any day a public holiday (in addition or in "
                 "substitution, nationally or locally). s.4 [16 of 1983]: where a Schedule day other than "
                 "the Saturday following Good Friday falls on a Saturday or Sunday, the next succeeding "
                 "day not being itself a Sunday or public holiday is the public holiday and the Schedule "
                 "day ceases to be one. Schedule (as amended by G.N. 99/1986, 67/1994, 84/1994, 76/1997, "
                 "41/2007): New Year's Day; John Chilembwe Day (15 January); Martyrs' Day (3 March); "
                 "Good Friday; Saturday following Good Friday; Easter Monday; Labour Day (1 May); "
                 "Kamuzu Day (14 May); Independence Day (6 July); Mothers' Day (15 October); Eid al "
                 "Fitri; Christmas Day. NO Boxing Day in the Schedule."),
    dict(key="gn-41-2007",
         title="Government Notice 41 of 2007 (last amendment of the Schedule)",
         uri=_ACT_WB, issued=None, issued_uri=None, published=None, published_uri=None,
         published_in="Malawi Gazette, 2007", in_force=None,
         dates_note="Known only from the amendment list under the Schedule; text not found.",
         summary="Content unknown. Secondary sources: the Mutharika government restored Kamuzu Day "
                 "(14 May, dropped under Muluzi, who had a Freedom Day on 14 June) and delisted Boxing "
                 "Day; reports differ between 2007 and 2009 for the Kamuzu Day restoration. The earlier "
                 "G.N.s 67/1994, 84/1994, 76/1997 are the Muluzi-era changes (contents not seen; "
                 "possibly John Chilembwe Day, Freedom Day and Eid al-Fitr)."),
    dict(key="boxing-day-2012",
         title="Ministry of Local Government statement reinstating Boxing Day (26 December) as a public "
               "holiday from 2012",
         uri="https://www.nyasatimes.com/?p=36767", issued=None, issued_uri=None,
         published="2012-12-16", published_uri="https://www.nyasatimes.com/?p=36767",
         published_in="news report (Nyasa Times) of a statement by Local Government spokesperson "
                      "M. Mazeze", in_force="2012-12-26",
         dates_note="Statement itself not seen; presumably a s.3(2) declaration renewed in each annual "
                    "Ministry list (it is in the 2023 list).",
         summary="Joyce Banda's administration restored Boxing Day, which the Bingu wa Mutharika "
                 "government had delisted, 'effective this year' (2012)."),
]

MW_FIXED = [
    (1, 1, "New Year's Day", [(1964, None)], "cap-18-05"),
    (1, 15, "John Chilembwe Day", [(1995, None)], "cap-18-05"),
    (3, 3, "Martyrs' Day", [(1964, None)], "cap-18-05"),
    (5, 1, "Labour Day", [(1964, None)], "cap-18-05"),
    (5, 14, "Kamuzu Day", [(2007, None)], "gn-41-2007"),
    (6, 14, "Freedom Day", [(1995, 2006)], "gn-41-2007"),
    (7, 6, "Independence Day", [(1964, None)], "cap-18-05"),
    (10, 15, "Mother's Day", [(2000, None)], "cap-18-05"),
    (12, 25, "Christmas Day", [(1964, None)], "cap-18-05"),
    (12, 26, "Boxing Day", [(2000, 2006), (2012, None)], "boxing-day-2012"),
]

MW_ISLAMIC = [
    # Eid al-Fitr: 1 Shawwal as announced by the Muslim Association of Malawi (local moon sighting);
    # the Ministry of Local Government declares the holiday day, and may shift it (2016: moved off
    # Independence Day to 7 July; 2017: Monday after a Sunday Eid; 2023: Saturday -> Monday?).
    (10, 1, [0], "Eid al-Fitr", [(2000, None)], "cap-18-05"),
]

MW_OTHER_RULES = [
    dict(rule="easter", offsets={-2: "Good Friday", -1: "Saturday following Good Friday", 1: "Easter Monday"},
         years=(1964, None), source="cap-18-05",
         note="Easter Saturday IS in the Schedule (python-holidays and the starter omit it; it is a "
              "Saturday so no business-day effect, and it is never moved)."),
    dict(rule="weekend-to-next-day", years=(1983, None), source="cap-18-05",
         note="s.4: Saturday or Sunday -> next day that is not a Sunday or public holiday; the weekend "
              "day ceases. So Saturday -> Monday. Christmas Saturday + Boxing Sunday -> Monday 27 + "
              "Tuesday 28; Christmas Sunday -> Boxing Monday 26 + Christmas observed Tuesday 27 "
              "(Nation: 'Christmas holiday to be observed Dec 27'). The Ministry applies it to Boxing "
              "Day and Eid too ('where any of these public holidays falls on a Saturday or Sunday, the "
              "same shall be observed on the next working day', statement Dec 2022)."),
    dict(rule="ministry-annual-list", years=(2012, None), source="Ministry of Local Government",
         note="The Secretary for Local Government issues the year's list (12 days in 2023) and the "
              "Eid day by press statement."),
]
MW_YEARS = {
    2013: dict(
        confidence="secondary",
        docs=[{'title': 'Nyasa Times: Malawi declares Friday Muslim Eid-el-Fitri festival holiday', 'uri': 'https://www.nyasatimes.com/?p=54612', 'issued': None, 'issued_uri': None, 'published': '2013-08-07', 'published_uri': 'https://www.nyasatimes.com/?p=54612', 'published_in': 'news report of a Government declaration', 'dates_note': 'Secondary; the Ministry statement itself not seen.'}, {'title': "Public Holidays Act Cap. 18:05 Schedule + s.4, and the Ministry of Local Government's annual list (incl. Boxing Day), applied by rule", 'uri': 'https://web.archive.org/web/20211202034241id_/https://malawilii.org/akn/mw/act/1967/11/eng@2014-12-31', 'issued': None, 'issued_uri': None, 'published': None, 'published_uri': None, 'published_in': 'statute (rule)', 'dates_note': "Rule-derived rows; the Ministry's annual list for this year was not found."}],
        days=[('01-01', "New Year's Day", 1), ('01-15', 'John Chilembwe Day', 1), ('03-04', "Martyrs' Day (moved from weekend, s.4)", 1), ('03-29', 'Good Friday', 1), ('03-30', 'Saturday following Good Friday', 1), ('04-01', 'Easter Monday', 1), ('05-01', 'Labour Day', 1), ('05-14', 'Kamuzu Day', 1), ('07-08', 'Independence Day (moved from weekend, s.4)', 1), ('08-09', 'Eid al-Fitr', 0), ('10-15', "Mother's Day", 1), ('12-25', 'Christmas Day', 1), ('12-26', 'Boxing Day', 1)],
        suppressed=[('03-03', "Martyrs' Day", 1), ('07-06', 'Independence Day', 1)],
        working=[],
        notes="Eid 2013-08-09 declared by Government (Nyasa Times 2013-08-07). Weekend Schedule days cease and move to the next day that is not a Sunday or holiday (s.4); they are listed under 'suppressed'.",
    ),
    2016: dict(
        confidence="secondary",
        docs=[{'title': 'Nyasa Times: Malawi declares July 7 holiday for Eid festival', 'uri': 'https://www.nyasatimes.com/?p=112986', 'issued': None, 'issued_uri': None, 'published': '2016-07-04', 'published_uri': 'https://www.nyasatimes.com/?p=112986', 'published_in': 'news report of a Ministry of Local Government declaration', 'dates_note': 'Secondary.'}, {'title': "Public Holidays Act Cap. 18:05 Schedule + s.4, and the Ministry of Local Government's annual list (incl. Boxing Day), applied by rule", 'uri': 'https://web.archive.org/web/20211202034241id_/https://malawilii.org/akn/mw/act/1967/11/eng@2014-12-31', 'issued': None, 'issued_uri': None, 'published': None, 'published_uri': None, 'published_in': 'statute (rule)', 'dates_note': "Rule-derived rows; the Ministry's annual list for this year was not found."}],
        days=[('01-01', "New Year's Day", 1), ('01-15', 'John Chilembwe Day', 1), ('03-03', "Martyrs' Day", 1), ('03-25', 'Good Friday', 1), ('03-26', 'Saturday following Good Friday', 1), ('03-28', 'Easter Monday', 1), ('05-02', 'Labour Day (moved from weekend, s.4)', 1), ('05-16', 'Kamuzu Day (moved from weekend, s.4)', 1), ('07-06', 'Independence Day', 1), ('07-07', 'Eid al-Fitr', 0), ('10-17', "Mother's Day (moved from weekend, s.4)", 1), ('12-26', 'Boxing Day', 1), ('12-27', 'Christmas Day (moved from weekend, s.4)', 1)],
        suppressed=[('05-01', 'Labour Day', 1), ('05-14', 'Kamuzu Day', 1), ('10-15', "Mother's Day", 1), ('12-25', 'Christmas Day', 1)],
        working=[],
        notes="Eid fell on Independence Day (Wed 6 July); MAM and Government moved the Eid holiday to Thursday 7 July. Weekend Schedule days cease and move to the next day that is not a Sunday or holiday (s.4); they are listed under 'suppressed'.",
    ),
    2017: dict(
        confidence="secondary",
        docs=[{'title': 'Nyasa Times: End of fast: Malawi declares June 26 public holiday for Eid al-Fitr', 'uri': 'https://nyasatimes.com/end-fast-malawi-declares-june-26-public-holiday-eid-al-fitr', 'issued': None, 'issued_uri': None, 'published': '2017-06-23', 'published_uri': 'https://nyasatimes.com/end-fast-malawi-declares-june-26-public-holiday-eid-al-fitr', 'published_in': 'news report of a statement by the Secretary for Local Government (K. Dakamau)', 'dates_note': 'Secondary.'}, {'title': "Public Holidays Act Cap. 18:05 Schedule + s.4, and the Ministry of Local Government's annual list (incl. Boxing Day), applied by rule", 'uri': 'https://web.archive.org/web/20211202034241id_/https://malawilii.org/akn/mw/act/1967/11/eng@2014-12-31', 'issued': None, 'issued_uri': None, 'published': None, 'published_uri': None, 'published_in': 'statute (rule)', 'dates_note': "Rule-derived rows; the Ministry's annual list for this year was not found."}],
        days=[('01-02', "New Year's Day (moved from weekend, s.4)", 1), ('01-16', 'John Chilembwe Day (moved from weekend, s.4)', 1), ('03-03', "Martyrs' Day", 1), ('04-14', 'Good Friday', 1), ('04-15', 'Saturday following Good Friday', 1), ('04-17', 'Easter Monday', 1), ('05-01', 'Labour Day', 1), ('05-15', 'Kamuzu Day (moved from weekend, s.4)', 1), ('06-26', 'Eid al-Fitr', 0), ('07-06', 'Independence Day', 1), ('10-16', "Mother's Day (moved from weekend, s.4)", 1), ('12-25', 'Christmas Day', 1), ('12-26', 'Boxing Day', 1)],
        suppressed=[('01-01', "New Year's Day", 1), ('01-15', 'John Chilembwe Day', 1), ('05-14', 'Kamuzu Day', 1), ('10-15', "Mother's Day", 1)],
        working=[],
        notes="Eid holiday Monday 26 June (Eid itself Sunday 25 June). Weekend Schedule days cease and move to the next day that is not a Sunday or holiday (s.4); they are listed under 'suppressed'.",
    ),
    2019: dict(
        confidence="secondary",
        docs=[{'title': 'Nyasa Times: Malawi observes Eid-ul-Fitr holiday Wednesday', 'uri': 'https://www.nyasatimes.com/?p=164098', 'issued': None, 'issued_uri': None, 'published': '2019-06-04', 'published_uri': 'https://www.nyasatimes.com/?p=164098', 'published_in': 'news report of a statement by the PS for Local Government (C. Kalemba)', 'dates_note': 'Secondary.'}, {'title': "Public Holidays Act Cap. 18:05 Schedule + s.4, and the Ministry of Local Government's annual list (incl. Boxing Day), applied by rule", 'uri': 'https://web.archive.org/web/20211202034241id_/https://malawilii.org/akn/mw/act/1967/11/eng@2014-12-31', 'issued': None, 'issued_uri': None, 'published': None, 'published_uri': None, 'published_in': 'statute (rule)', 'dates_note': "Rule-derived rows; the Ministry's annual list for this year was not found."}],
        days=[('01-01', "New Year's Day", 1), ('01-15', 'John Chilembwe Day', 1), ('03-04', "Martyrs' Day (moved from weekend, s.4)", 1), ('04-19', 'Good Friday', 1), ('04-20', 'Saturday following Good Friday', 1), ('04-22', 'Easter Monday', 1), ('05-01', 'Labour Day', 1), ('05-14', 'Kamuzu Day', 1), ('06-05', 'Eid al-Fitr', 0), ('07-08', 'Independence Day (moved from weekend, s.4)', 1), ('10-15', "Mother's Day", 1), ('12-25', 'Christmas Day', 1), ('12-26', 'Boxing Day', 1)],
        suppressed=[('03-03', "Martyrs' Day", 1), ('07-06', 'Independence Day', 1)],
        working=[],
        notes="21 May 2019 tripartite election day: see MW_ADHOC. Weekend Schedule days cease and move to the next day that is not a Sunday or holiday (s.4); they are listed under 'suppressed'.",
    ),
    2020: dict(
        confidence="secondary",
        docs=[{'title': 'Nyasa Times: Malawi holiday to celebrate Eid-ul-Fitr Monday', 'uri': 'https://www.nyasatimes.com/?p=180784', 'issued': None, 'issued_uri': None, 'published': '2020-05-21', 'published_uri': 'https://www.nyasatimes.com/?p=180784', 'published_in': 'news report of a statement by the Secretary for Local Government (C. Kalemba)', 'dates_note': 'Secondary.'}, {'title': "Public Holidays Act Cap. 18:05 Schedule + s.4, and the Ministry of Local Government's annual list (incl. Boxing Day), applied by rule", 'uri': 'https://web.archive.org/web/20211202034241id_/https://malawilii.org/akn/mw/act/1967/11/eng@2014-12-31', 'issued': None, 'issued_uri': None, 'published': None, 'published_uri': None, 'published_in': 'statute (rule)', 'dates_note': "Rule-derived rows; the Ministry's annual list for this year was not found."}],
        days=[('01-01', "New Year's Day", 1), ('01-15', 'John Chilembwe Day', 1), ('03-03', "Martyrs' Day", 1), ('04-10', 'Good Friday', 1), ('04-11', 'Saturday following Good Friday', 1), ('04-13', 'Easter Monday', 1), ('05-01', 'Labour Day', 1), ('05-14', 'Kamuzu Day', 1), ('05-25', 'Eid al-Fitr', 0), ('07-06', 'Independence Day', 1), ('10-15', "Mother's Day", 1), ('12-25', 'Christmas Day', 1), ('12-28', 'Boxing Day (moved from weekend, s.4)', 1)],
        suppressed=[('12-26', 'Boxing Day', 1)],
        working=[],
        notes="23 June 2020 fresh presidential election: see MW_ADHOC. Weekend Schedule days cease and move to the next day that is not a Sunday or holiday (s.4); they are listed under 'suppressed'.",
    ),
    2023: dict(
        confidence="secondary",
        docs=[{'title': 'The Nation: Extended festive holiday for civil servants (Ministry of Local Government list of 12 public holidays for 2023)', 'uri': 'https://mwnation.com/extended-festive-holiday-for-civil-servants/', 'issued': None, 'issued_uri': None, 'published': '2022-12-14', 'published_uri': 'https://mwnation.com/extended-festive-holiday-for-civil-servants/', 'published_in': 'news report of a statement by the Secretary for Local Government (J. Chiusiwa)', 'dates_note': "Secondary; lists New Year, Chilembwe, Martyrs, Good Friday, Easter Monday, Eid ul Fitr, Labour, Kamuzu, Independence, Mother's Day, Christmas, Boxing Day; 'where any of these public holidays falls on a Saturday or Sunday, the same shall be observed on the next working day'."}, {'title': "Public Holidays Act Cap. 18:05 Schedule + s.4, and the Ministry of Local Government's annual list (incl. Boxing Day), applied by rule", 'uri': 'https://web.archive.org/web/20211202034241id_/https://malawilii.org/akn/mw/act/1967/11/eng@2014-12-31', 'issued': None, 'issued_uri': None, 'published': None, 'published_uri': None, 'published_in': 'statute (rule)', 'dates_note': "Rule-derived rows; the Ministry's annual list for this year was not found."}],
        days=[('01-02', "New Year's Day (moved from weekend, s.4)", 1), ('01-16', 'John Chilembwe Day (moved from weekend, s.4)', 1), ('03-03', "Martyrs' Day", 1), ('04-07', 'Good Friday', 1), ('04-08', 'Saturday following Good Friday', 1), ('04-10', 'Easter Monday', 1), ('04-24', 'Eid al-Fitr (moved from weekend, s.4)', 0), ('05-01', 'Labour Day', 1), ('05-15', 'Kamuzu Day (moved from weekend, s.4)', 1), ('07-06', 'Independence Day', 1), ('10-16', "Mother's Day (moved from weekend, s.4)", 1), ('12-25', 'Christmas Day', 1), ('12-26', 'Boxing Day', 1)],
        suppressed=[('01-01', "New Year's Day", 1), ('01-15', 'John Chilembwe Day', 1), ('04-22', 'Eid al-Fitr', 0), ('05-14', 'Kamuzu Day', 1), ('10-15', "Mother's Day", 1)],
        working=[],
        notes="Eid date (Saturday 22 April, observed Monday 24 April) from timeanddate only - unverified. Weekend Schedule days cease and move to the next day that is not a Sunday or holiday (s.4); they are listed under 'suppressed'.",
    ),
    2024: dict(
        confidence="secondary",
        docs=[{'title': 'MBC: Malawi to observe Eid Ul Fitr holiday on Thursday', 'uri': 'https://mbc.mw/malawi-to-observe-eid-ul-fitr-holiday-on-thursday/', 'issued': None, 'issued_uri': None, 'published': '2024-04-10', 'published_uri': 'https://mbc.mw/malawi-to-observe-eid-ul-fitr-holiday-on-thursday/', 'published_in': 'Malawi Broadcasting Corporation report (state broadcaster) of the Government announcement', 'dates_note': 'Secondary (state broadcaster).'}, {'title': 'Malawi24: Government declares Monday a public holiday to honour Chilima', 'uri': 'https://malawi24.com/?p=168878', 'issued': None, 'issued_uri': None, 'published': None, 'published_uri': 'https://malawi24.com/?p=168878', 'published_in': 'news report of a Presidential declaration', 'dates_note': 'Secondary; not fetched (search result only).'}, {'title': "Public Holidays Act Cap. 18:05 Schedule + s.4, and the Ministry of Local Government's annual list (incl. Boxing Day), applied by rule", 'uri': 'https://web.archive.org/web/20211202034241id_/https://malawilii.org/akn/mw/act/1967/11/eng@2014-12-31', 'issued': None, 'issued_uri': None, 'published': None, 'published_uri': None, 'published_in': 'statute (rule)', 'dates_note': "Rule-derived rows; the Ministry's annual list for this year was not found."}],
        days=[('01-01', "New Year's Day", 2), ('01-15', 'John Chilembwe Day', 2), ('03-04', "Martyrs' Day (moved from weekend, s.4)", 2), ('03-29', 'Good Friday', 2), ('03-30', 'Saturday following Good Friday', 2), ('04-01', 'Easter Monday', 2), ('04-11', 'Eid al-Fitr', 0), ('05-01', 'Labour Day', 2), ('05-14', 'Kamuzu Day', 2), ('06-17', 'Burial of Vice-President Saulos Chilima (declared)', 1), ('07-08', 'Independence Day (moved from weekend, s.4)', 2), ('10-15', "Mother's Day", 2), ('12-25', 'Christmas Day', 2), ('12-26', 'Boxing Day', 2)],
        suppressed=[('03-03', "Martyrs' Day", 2), ('07-06', 'Independence Day', 2)],
        working=[],
        notes="Chakwera declared Monday 17 June 2024 a public holiday for Chilima's burial. Weekend Schedule days cease and move to the next day that is not a Sunday or holiday (s.4); they are listed under 'suppressed'.",
    ),
    2025: dict(
        confidence="secondary",
        docs=[{'title': 'Declaration of Tuesday 16 September 2025 (general election) by the Ministry of Local Government, Unity and Culture', 'uri': 'https://www.officeholidays.com/holidays/malawi/malawi-elections', 'issued': None, 'issued_uri': None, 'published': None, 'published_uri': 'https://www.officeholidays.com/holidays/malawi/malawi-elections', 'published_in': 'secondary aggregator citing the Ministry', 'dates_note': 'Secondary only; Ministry statement not seen.'}, {'title': "Public Holidays Act Cap. 18:05 Schedule + s.4, and the Ministry of Local Government's annual list (incl. Boxing Day), applied by rule", 'uri': 'https://web.archive.org/web/20211202034241id_/https://malawilii.org/akn/mw/act/1967/11/eng@2014-12-31', 'issued': None, 'issued_uri': None, 'published': None, 'published_uri': None, 'published_in': 'statute (rule)', 'dates_note': "Rule-derived rows; the Ministry's annual list for this year was not found."}],
        days=[('01-01', "New Year's Day", 1), ('01-15', 'John Chilembwe Day', 1), ('03-03', "Martyrs' Day", 1), ('04-18', 'Good Friday', 1), ('04-19', 'Saturday following Good Friday', 1), ('04-21', 'Easter Monday', 1), ('05-01', 'Labour Day', 1), ('05-14', 'Kamuzu Day', 1), ('07-07', 'Independence Day (moved from weekend, s.4)', 1), ('09-16', 'General election polling day (declared)', 0), ('10-15', "Mother's Day", 1), ('12-25', 'Christmas Day', 1), ('12-26', 'Boxing Day', 1)],
        suppressed=[('07-06', 'Independence Day', 1)],
        working=[],
        notes="Eid al-Fitr 2025 (Monday 31 March or Tuesday 1 April per 247Malawi) NOT entered - date unconfirmed. Weekend Schedule days cease and move to the next day that is not a Sunday or holiday (s.4); they are listed under 'suppressed'.",
    ),
    2026: dict(
        confidence="secondary",
        docs=[{'title': 'AfricaBrief (Facebook): Eid al-Fitr holiday set for March 23', 'uri': 'https://www.facebook.com/africabriefnews/posts/africabrief-eid-al-fitr-holiday-set-for-march-23-as-malawi-completes-30-days-of-/1587011596765910/', 'issued': None, 'issued_uri': None, 'published': None, 'published_uri': 'https://www.facebook.com/africabriefnews/posts/africabrief-eid-al-fitr-holiday-set-for-march-23-as-malawi-completes-30-days-of-/1587011596765910/', 'published_in': 'social-media news relay of a Ministry of Local Government announcement', 'dates_note': 'Weak secondary.'}, {'title': "Public Holidays Act Cap. 18:05 Schedule + s.4, and the Ministry of Local Government's annual list (incl. Boxing Day), applied by rule", 'uri': 'https://web.archive.org/web/20211202034241id_/https://malawilii.org/akn/mw/act/1967/11/eng@2014-12-31', 'issued': None, 'issued_uri': None, 'published': None, 'published_uri': None, 'published_in': 'statute (rule)', 'dates_note': "Rule-derived rows; the Ministry's annual list for this year was not found."}],
        days=[('01-01', "New Year's Day", 1), ('01-15', 'John Chilembwe Day', 1), ('03-03', "Martyrs' Day", 1), ('03-23', 'Eid al-Fitr', 0), ('04-03', 'Good Friday', 1), ('04-04', 'Saturday following Good Friday', 1), ('04-06', 'Easter Monday', 1), ('05-01', 'Labour Day', 1), ('05-14', 'Kamuzu Day', 1), ('07-06', 'Independence Day', 1), ('10-15', "Mother's Day", 1), ('12-25', 'Christmas Day', 1), ('12-28', 'Boxing Day (moved from weekend, s.4)', 1)],
        suppressed=[('12-26', 'Boxing Day', 1)],
        working=[],
        notes="Eid holiday Monday 23 March 2026 (moon not sighted; 30 days of Ramadan; prayers Saturday 21 March). Weekend Schedule days cease and move to the next day that is not a Sunday or holiday (s.4); they are listed under 'suppressed'.",
    ),
}

MW_ADHOC = [
    ("2004-05-20", "General election polling day", "", "unverified", "Government (s.3(2)); declaration not found"),
    ("2009-05-19", "General election polling day", "", "unverified", "Government (s.3(2)); declaration not found"),
    ("2014-05-20", "Tripartite election polling day", "", "unverified", "Government (s.3(2)); declaration not found"),
    ("2019-05-21", "Tripartite election polling day", "", "unverified", "Government (s.3(2)); declaration not found"),
    ("2020-06-23", "Fresh presidential election polling day", "", "unverified", "Government (s.3(2)); declaration not found"),
    ("2023-04-24", "Eid al-Fitr observed (Eid Saturday 22 April)", "https://www.timeanddate.com/holidays/malawi/eid-al-fitr",
     "unknown", "Ministry of Local Government (per aggregator)"),
    ("2025-03-31", "Eid al-Fitr (Monday 31 March or Tuesday 1 April)", "https://www.247malawi.com/malawi-prepares-for-uniting-eid-ul-fitr-celebrations/",
     "unknown", "Ministry of Local Government on MAM advice; final day not confirmed"),
]

MW_FINDINGS = """
Statute (Wayback copy of the MalawiLII consolidation to 31 Dec 2014): Schedule = New Year's Day;
John Chilembwe Day 15 Jan; Martyrs' Day 3 Mar; Good Friday; Saturday following Good Friday; Easter
Monday; Labour Day 1 May; Kamuzu Day 14 May; Independence Day 6 July; Mothers' Day 15 Oct; Eid al
Fitri; Christmas Day. s.4: a Schedule day (other than Easter Saturday) on a Saturday or Sunday moves
to the next day that is not a Sunday or holiday, and the weekend day ceases.

Issue item 3 (Kamuzu Day / Mother's Day invented): CONFIRMED BUG. Kamuzu Day is fixed 14 May and
Mother's Day fixed 15 October in the 2014 consolidation (2024: 05-14 Tue, 10-15 Tue). No 'third
Monday of May' or 'second Monday of October' rule exists in the text. Era caveat: Kamuzu Day was
dropped under Muluzi (Freedom Day 14 June instead) and restored under Mutharika; the last
Schedule amendment is G.N. 41/2007, so I set Kamuzu Day from 2007 and Freedom Day 1995-2006 -
SECONDARY and uncertain (some reports say 2009). Mother's Day's pre-2007 form is unknown.

Issue item 3 (Boxing Day missing): PARTLY. Boxing Day is not in the Schedule, but it is a public
holiday in practice: delisted by the Mutharika government, restored by Ministry statement in
Dec 2012 (Nyasa Times 2012-12-16) and in the Ministry's 2023 list of 12 holidays (Nation
2022-12-14). So: 26 Dec from 2012 (and probably before 2007), with the weekend rule.

Issue item 5 (Sunday rule): Malawi's rule is broader - Saturday AND Sunday move to the next working
day (s.4, from Act 16 of 1983). The starter has no rule at all. Examples: 2019-07-08 (Independence
Day Saturday), 2024-03-04, 2024-07-08, 2025-07-07, 2026-12-28 (Boxing Day Saturday). The
weekend day itself ceases to be a holiday (listed as 'suppressed').

Also missing from the starter: Easter Saturday (Schedule; no business effect). Eid al-Fitr is a
public holiday on the day declared after the MAM moon sighting (2013-08-09, 2016-07-07, 2017-06-26,
2019-06-05, 2020-05-25, 2024-04-11, 2026-03-23); Eid al-Adha is NOT a public holiday (starter wrong
to include it). Declared one-off days found: 2024-06-17 (Chilima burial), 2025-09-16 (election).
Election days 2004/2009/2014/2019/2020 are believed to have been declared but no source found.

Confidence: all MW years are SECONDARY (news reports of Ministry statements; MBC is the state
broadcaster). Years entered: 2013, 2016, 2017, 2019, 2020, 2023, 2024, 2025, 2026. Missing: the
rest (statute rule only). python-holidays 0.109 has no Eid and no Easter Saturday for Malawi, uses
SAT_SUN_TO_NEXT_MON (matches s.4 for single days), and has Boxing Day for all years.
"""


# --- rule engine (scripts/generate_mena_holiday_gold.py) ----------------------
# Cap. 18:05 s. 4: a Saturday or Sunday holiday ceases and the next day that is
# not a Sunday or public holiday is one (the Ministry applies it to Eid too).
# Easter Saturday is in the Schedule and never moved.
OBSERVE = True
_S4 = dict(observed="next-weekday", observed_from=1983)
MW_FIXED = [row + (_S4,) for row in MW_FIXED]
MW_EASTER = [(-2, "Good Friday", [(1964, None)], "cap-18-05"),
             (-1, "Saturday following Good Friday", [(1964, None)], "cap-18-05"),
             (1, "Easter Monday", [(1964, None)], "cap-18-05")]
MW_ISLAMIC = [row + (_S4,) for row in MW_ISLAMIC]
