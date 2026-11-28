;; Kenya (secondary sources) public holidays 2000-2026: external gold for KE.
;; Regenerate: uv run --no-project --with holidays==0.109 python -I scripts/generate_mena_holiday_gold.py KE-SECONDARY
;; :days lists every holiday as (YEAR MONTH DAY NAME); any other day is not one.
(
 :country "KE"
 :generated "2026-11-28"
 :from 2000 :to 2026
 :note "LOWER CONFIDENCE. 2000-2004, 2006, 2008, 2011: statutory days with Idd-ul-Fitr estimates (no gazette notice in the sparse archive); 2026: notices cited by python-holidays (Kenya Law unreadable)."
 :gaps (2005 2007 2009 2010 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025)
 :confidence :secondary
 :weekends ((nil 6 7))
 :sources
 (
  (:title "Public Holidays Act (Cap. 110), Laws of Kenya (originally Ordinance of 1912)" :uri "https://web.archive.org/web/20250118013422/https://new.kenyalaw.org/akn/ke/act/1912/21/eng@2024-04-26"
   :text "s.2(1) Part I days are public holidays; s.2(2) Part II (Idd-ul-Azha) only for persons of the Islamic faith; s.2(3) Part III (Diwali) only for Hindus; s.2(4) general-election day is a public holiday; s.2(5) swearing-in day of a President-elect is a public holiday; s.3 the Cabinet Secretary may by Gazette notice declare additional or substitute days; s.4 a Part I day falling on a Sunday ceases to be a holiday and 'the first succeeding day, not being a public holiday' is one. Part I (2000s): New Year's Day, Good Friday, Easter Monday, Labour Day 1 May, Madaraka Day 1 June, Idd-ul-Fitr (moon), Moi Day 10 Oct, Kenyatta Day 20 Oct, Independence Day 12 Dec, Christmas, Boxing Day.")
  (:title "Constitution of Kenya 2010, Article 9(4)-(5) (national days)" :uri "https://web.archive.org/web/20250417082347/https://new.kenyalaw.org/akn/ke/act/2010/constitution/eng@2010-09-03"
   :text "National days: Madaraka Day 1 June, Mashujaa Day 20 October, Jamhuri Day 12 December; Parliament may prescribe other public holidays. From 2010 20 October is celebrated as Mashujaa Day (schedule text still 'Kenyatta Day' until 2019). Moi Day stayed in the Schedule but the government stopped observing it 2010-2017.")
  (:title "Republic v Cabinet Secretary for Interior (ex parte Gregory Oriaro Nyauchi), JR 292 of 2017, [2017] eKLR (KEHC 2017/2485)" :uri "https://new.kenyalaw.org/akn/ke/judgment/kehc/2017/2485/eng@2017-11-06"
   :text "Declares that the omission to observe 10 October (Moi Day) as a public holiday is an illegality; Moi Day observed again from 2018.")
  (:title "Statute Law (Miscellaneous Amendments) Act, 2018 (No. 18 of 2018)" :uri "https://www.wipo.int/wipolex/en/text/506089"
   :text "Part I: 'Kenyatta Day' -> 'Mashujaa Day'; 'Independence Day' -> 'Jamhuri Day'. Moi Day untouched.")
  (:title "Statute Law (Miscellaneous Amendments) Act, 2020 (No. 20 of 2020)" :uri "https://web.archive.org/web/20261010155933/https://new.kenyalaw.org/akn/ke/act/1912/21/eng@2020-12-11/source.pdf"
   :text "Part I: Moi Day -> Utamaduni Day (10 October); s.3 'Minister' -> 'Cabinet Secretary'.")
  (:title "python-holidays 0.109 estimate for Idd-ul-Fitr (no gazette notice located) - SECONDARY (2000)" :uri "https://pypi.org/project/holidays/0.109/"
   :text "")
  (:title "Kenya Gazette Notice No. 8575 - Public Holidays Act - Monday 21 November 2005 (s.3; constitutional referendum) (2005)" :uri "https://archive.gazettes.africa/archive/ke/2005/ke-government-gazette-dated-2005-10-28-no-75.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 9144 - Public Holidays Act - Tuesday 22 November 2005 (s.3) (2005)" :uri "https://archive.gazettes.africa/archive/ke/2005/ke-government-gazette-dated-2005-11-17-no-80.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 12475 - Public Holidays Act - Friday 28 December 2007 (s.3; General Elections 2007) (2007)" :uri "https://archive.gazettes.africa/archive/ke/2007/ke-government-gazette-dated-2007-12-21-no-99.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 12613 - Public Holidays Act - Monday 31 December 2007 (s.3) (2007)" :uri "https://archive.gazettes.africa/archive/ke/2007/ke-government-gazette-dated-2007-12-30-no-103.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 9625 - Public Holidays Act - Idd-ul-Fitr Monday 21 September 2009 (2009)" :uri "https://archive.gazettes.africa/archive/ke/2009/ke-government-gazette-dated-2009-09-11-no-82.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 9099 - Public Holidays Act - Wednesday 4 August 2010, constitutional referendum (2010)" :uri "https://archive.gazettes.africa/archive/ke/2010/ke-government-gazette-dated-2010-07-30-no-74.pdf"
   :text "")
  (:title "Kenya Gazette special notice: Friday 27 August 2010 will be a public holiday (promulgation of the Constitution) (2010)" :uri "https://archive.gazettes.africa/archive/ke/2010/ke-government-gazette-dated-2010-08-20-no-83.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 10620 - Public Holidays Act - Idd-ul-Fitr Saturday 11 September 2010 (2010)" :uri "https://archive.gazettes.africa/archive/ke/2010/ke-government-gazette-dated-2010-09-07-no-89.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 11017 - Public Holidays Act - Idd-ul-Fitr Monday 20 August 2012 (2012)" :uri "https://archive.gazettes.africa/archive/ke/2012/ke-government-gazette-dated-2012-08-10-no-75.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 4448 - Assumption of the Office of the President Act s.12(3) - swearing-in Tuesday 9 April 2013 (2013)" :uri "https://archive.gazettes.africa/archive/ke/2013/ke-government-gazette-dated-2013-04-05-no-58.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 11151 - Public Holidays Act - Idd-ul-Fitr Friday 9 August 2013 (2013)" :uri "https://archive.gazettes.africa/archive/ke/2013/ke-government-gazette-dated-2013-08-05-no-113.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 13870 - Public Holidays Act - Monday 21 October 2013 (s.4; Mashujaa Day on Sunday) (2013)" :uri "https://archive.gazettes.africa/archive/ke/2013/ke-government-gazette-dated-2013-10-18-no-151.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 15099 - Public Holidays Act - Friday 13 December 2013 (s.3; Jamhuri Day 50th anniversary) (2013)" :uri "https://archive.gazettes.africa/archive/ke/2013/ke-government-gazette-dated-2013-12-03-no-169.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 15324 - Public Holidays Act - Saturday 14 December 2013 (s.3) (2013)" :uri "https://archive.gazettes.africa/archive/ke/2013/ke-government-gazette-dated-2013-12-06-no-172.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 3718 - Public Holidays Act - Monday 2 June 2014 (s.4; Madaraka Day on Sunday) (2014)" :uri "https://archive.gazettes.africa/archive/ke/2014/ke-government-gazette-dated-2014-05-30-no-68.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 5021 - Public Holidays Act - Idd-ul-Fitr Tuesday 29 July 2014 (2014)" :uri "https://archive.gazettes.africa/archive/ke/2014/ke-government-gazette-dated-2014-07-18-no-86.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 4916 - Public Holidays Act - Idd-ul-Fitr Saturday 18 July 2015 (2015)" :uri "https://archive.gazettes.africa/archive/ke/2015/ke-government-gazette-dated-2015-07-10-no-71.pdf"
   :text "")
  (:title "Public Holidays Act - Thursday 26 November 2015 (s.3; visit of Pope Francis) (2015)" :uri "https://archive.gazettes.africa/archive/ke/2015/ke-government-gazette-dated-2015-11-24-no-129.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 2885 - Public Holidays Act - Monday 2 May 2016 (s.3; Labour Day on Sunday) (2016)" :uri "https://archive.gazettes.africa/archive/ke/2016/ke-government-gazette-dated-2016-04-29-no-45.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 4954 - Public Holidays Act - Idd-ul-Fitr Thursday 7 July 2016 (s.3) (2016)" :uri "https://archive.gazettes.africa/archive/ke/2016/ke-government-gazette-dated-2016-07-01-no-72.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 7315 - Public Holidays Act - Idd-ul-Adha Monday 12 September 2016 (s.3) (2016)" :uri "https://archive.gazettes.africa/archive/ke/2016/ke-government-gazette-dated-2016-09-09-no-108.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 10683 - Public Holidays Act - Tuesday 27 December 2016 (s.3; Christmas on Sunday) (2016)" :uri "https://archive.gazettes.africa/archive/ke/2016/ke-government-gazette-dated-2016-12-23-no-164.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 5852 - Public Holidays Act - Idd-ul-Fitr Monday 26 June 2017 (s.3) (2017)" :uri "https://archive.gazettes.africa/archive/ke/2017/ke-government-gazette-dated-2017-06-19-no-79.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 7405 - Public Holidays Act - general election Tuesday 8 August 2017 (s.2(4)) (2017)" :uri "https://archive.gazettes.africa/archive/ke/2017/ke-government-gazette-dated-2017-08-01-no-107.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 10548 - Public Holidays Act - fresh presidential election Thursday 26 October 2017 (s.3) (2017)" :uri "https://archive.gazettes.africa/archive/ke/2017/ke-government-gazette-dated-2017-10-19-no-156.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 10561 - Public Holidays Act - Wednesday 25 October 2017 travel day before the fresh election (s.3) (2017)" :uri "https://archive.gazettes.africa/archive/ke/2017/ke-government-gazette-dated-2017-10-24-no-159.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 11491 - Assumption of the Office of the President Act s.12(3) - swearing-in Tuesday 28 November 2017 (2017)" :uri "https://archive.gazettes.africa/archive/ke/2017/ke-government-gazette-dated-2017-11-23-no-174.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 10689 - Public Holidays Act - Monday 2 January 2017 (s.3; New Year's Day on Sunday) (2017)" :uri "https://archive.gazettes.africa/archive/ke/2016/ke-government-gazette-dated-2016-12-30-no-165.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 5747 - Public Holidays Act - Friday 15 June 2018 to prepare for Idd-ul-Fitr on Saturday 16 June (s.3) (2018)" :uri "https://archive.gazettes.africa/archive/ke/2018/ke-government-gazette-dated-2018-06-12-no-71.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 8533 - Public Holidays Act - Idd-ul-Azha Tuesday 21 August 2018 (s.3) (2018)" :uri "https://archive.gazettes.africa/archive/ke/2018/ke-government-gazette-dated-2018-08-17-no-100.pdf"
   :text "")
  (:title "Matiang'i confirms October 10 as a public holiday (Moi Day 2018) (2018)" :uri "https://www.the-star.co.ke/news/2018-10-08-matiangi-confirms-october-10-as-a-public-holiday"
   :text "")
  (:title "Kenya Gazette Notice No. 4850 - Public Holidays Act - Idd-ul-Fitr Wednesday 5 June 2019 (s.2(1)) (2019)" :uri "https://archive.gazettes.africa/archive/ke/2019/ke-government-gazette-dated-2019-06-03-no-70.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 7393 - Public Holidays Act - Idd-ul-Azha Monday 12 August 2019 (s.3) (2019)" :uri "https://archive.gazettes.africa/archive/ke/2019/ke-government-gazette-dated-2019-08-08-no-98.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 787 - Public Holidays Act - Tuesday 11 February 2020, national memorial service for former President Moi (s.3) (2020)" :uri "https://archive.gazettes.africa/archive/ke/2020/ke-government-gazette-dated-2020-02-06-no-25.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 3651 - Public Holidays Act - Idd-ul-Fitr Monday 25 May 2020 (s.2(1)) (2020)" :uri "https://archive.gazettes.africa/archive/ke/2020/ke-government-gazette-dated-2020-05-20-no-93.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 5277 - Public Holidays Act - Idd-ul-Azha Friday 31 July 2020 (s.2(2) with s.3) (2020)" :uri "https://archive.gazettes.africa/archive/ke/2020/ke-government-gazette-dated-2020-07-29-no-146.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 4205 - Public Holidays Act - Idd-ul-Fitr Friday 14 May 2021 (s.2(1)) (2021)" :uri "https://archive.gazettes.africa/archive/ke/2021/ke-government-gazette-dated-2021-05-07-no-96.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 7147 - Public Holidays Act - Idd-ul-Adha Tuesday 20 July 2021 (s.2(2) with s.3) (2021)" :uri "https://archive.gazettes.africa/archive/ke/2021/ke-government-gazette-dated-2021-07-16-no-149.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 4843 - Public Holidays Act - Friday 29 April 2022, state funeral of former President Mwai Kibaki (s.3) (2022)" :uri "https://archive.gazettes.africa/archive/ke/2022/ke-government-gazette-dated-2022-04-26-no-76.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 8228 - Public Holidays Act - Idd-ul-Adha Monday 11 July 2022 (s.3 with s.2(2)) (2022)" :uri "https://archive.gazettes.africa/archive/ke/2022/ke-government-gazette-dated-2022-07-08-no-133.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 9028 - Public Holidays Act - general election Tuesday 9 August 2022 (s.2(4)) (2022)" :uri "https://archive.gazettes.africa/archive/ke/2022/ke-government-gazette-dated-2022-07-29-no-147.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 10540 - Public Holidays Act - swearing-in of the President-elect Tuesday 13 September 2022 (s.3) (2022)" :uri "https://archive.gazettes.africa/archive/ke/2022/ke-government-gazette-dated-2022-09-08-no-182.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 15800 - Public Holidays Act - Tuesday 27 December 2022 (s.3 with s.4, Christmas on Sunday) (2022)" :uri "https://archive.gazettes.africa/archive/ke/2022/ke-government-gazette-dated-2022-12-23-no-282.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 5045 - Public Holidays Act - Idd-ul-Fitr Friday 21 April 2023 (s.2(1)) (2023)" :uri "https://archive.gazettes.africa/archive/ke/2023/ke-government-gazette-dated-2023-04-19-no-90.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 8456 - Public Holidays Act - Eid-ul-Adha Wednesday 28 June 2023 (s.2(2), Part II, with s.3) (2023)" :uri "https://archive.gazettes.africa/archive/ke/2023/ke-government-gazette-dated-2023-06-26-no-146.pdf"
   :text "")
  (:title "Public Holidays Act - National Tree Growing Day Monday 13 November 2023 (s.3) (2023)" :uri "https://archive.gazettes.africa/archive/ke/2023/ke-government-gazette-dated-2023-11-06-no-238.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 4339 - Public Holidays Act - Idd-ul-Fitr Wednesday 10 April 2024 (s.2(1)) (2024)" :uri "https://archive.gazettes.africa/archive/ke/2024/ke-government-gazette-dated-2024-04-09-no-46.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 5614 - Public Holidays Act - National Tree Growing Day Friday 10 May 2024 (s.3) (2024)" :uri "https://archive.gazettes.africa/archive/ke/2024/ke-government-gazette-dated-2024-05-08-no-61.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 7195 - Public Holidays Act - Eid-al-Adha Monday 17 June 2024 (s.2(1)) (2024)" :uri "https://archive.gazettes.africa/archive/ke/2024/ke-government-gazette-dated-2024-06-14-no-84.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. ? - Public Holidays Act s.3 and Assumption of Office of President Act ss.3(b), 12(3) - swearing-in of the Deputy President-designate Friday 1 November 2024 (2024)" :uri "https://web.archive.org/web/2025/https://new.kenyalaw.org/akn/ke/officialGazette/2024-10-31/184/eng@2024-10-31/source.pdf"
   :text "")
  (:title "President Ruto signs into law the Statute Law (Miscellaneous Amendments) Bill 2024 (Utamaduni Day -> Mazingira Day) (2024)" :uri "https://www.president.go.ke/president-ruto-signs-into-law-the-statute-law-bill-2024/"
   :text "")
  (:title "Kenya Gazette Notice No. ? - Public Holidays Act - Idd-ul-Fitr Monday 31 March 2025 (s.2(1)) (2025)" :uri "https://web.archive.org/web/20251014130451/https://new.kenyalaw.org/akn/ke/officialGazette/2025-03-28/62/eng@2025-03-28/source.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 7317 - Public Holidays Act - Eid-ul-Adha Friday 6 June 2025 (s.2(1)) (2025)" :uri "https://web.archive.org/web/2026/https://new.kenyalaw.org/akn/ke/officialGazette/2025-06-04/116/eng@2025-06-04/source.pdf"
   :text "")
  (:title "Kenya Gazette Notice No. 15007 - Public Holidays Act - Friday 17 October 2025 in honour of former Prime Minister Raila Odinga (s.3) (2025)" :uri "https://web.archive.org/web/2026/https://new.kenyalaw.org/akn/ke/officialGazette/2025-10-16/214/eng@2025-10-16/source.pdf"
   :text "")
  (:title "Murkomen declares March 20 public holiday for Idd-ul-Fitr (Gazette Notice No. 3955 dated 18 March 2026) (2026)" :uri "https://peopledaily.digital/news/govt-declares-friday-march-20-public-holiday-for-idd-ul-fitr"
   :text "")
  (:title "Govt declares May 27 public holiday to mark Eid ul-Adha (Gazette Notice No. 7653, special issue of 25 May 2026) (2026)" :uri "https://citizen.digital/article/govt-declares-may-27-public-holiday-to-mark-eid-ul-adha-n383374"
   :text "")
 )
 :days
 (
  (2000 1 1 "New Year's Day")
  (2000 1 8 "Idd-ul-Fitr (1420 AH; estimate)")
  (2000 4 21 "Good Friday")
  (2000 4 24 "Easter Monday")
  (2000 5 1 "Labour Day")
  (2000 6 1 "Madaraka Day")
  (2000 10 10 "Moi Day")
  (2000 10 20 "Kenyatta Day")
  (2000 12 12 "Jamhuri Day")
  (2000 12 25 "Christmas Day")
  (2000 12 26 "Boxing Day")
  (2000 12 27 "Idd-ul-Fitr")
  (2001 1 1 "New Year's Day")
  (2001 4 13 "Good Friday")
  (2001 4 16 "Easter Monday")
  (2001 5 1 "Labour Day")
  (2001 6 1 "Madaraka Day")
  (2001 10 10 "Moi Day")
  (2001 10 20 "Kenyatta Day")
  (2001 12 12 "Jamhuri Day")
  (2001 12 17 "Idd-ul-Fitr (in lieu of Sunday 12-16, s.4)")
  (2001 12 25 "Christmas Day")
  (2001 12 26 "Boxing Day")
  (2002 1 1 "New Year's Day")
  (2002 3 29 "Good Friday")
  (2002 4 1 "Easter Monday")
  (2002 5 1 "Labour Day")
  (2002 6 1 "Madaraka Day")
  (2002 10 10 "Moi Day")
  (2002 10 21 "Kenyatta Day (in lieu of Sunday 10-20, s.4)")
  (2002 12 5 "Idd-ul-Fitr")
  (2002 12 12 "Jamhuri Day")
  (2002 12 25 "Christmas Day")
  (2002 12 26 "Boxing Day")
  (2002 12 27 "General Election Day (s.2(4))")
  (2003 1 1 "New Year's Day")
  (2003 4 18 "Good Friday")
  (2003 4 21 "Easter Monday")
  (2003 5 1 "Labour Day")
  (2003 6 2 "Madaraka Day (in lieu of Sunday 06-01, s.4)")
  (2003 10 10 "Moi Day")
  (2003 10 20 "Kenyatta Day")
  (2003 11 25 "Idd-ul-Fitr")
  (2003 12 12 "Jamhuri Day")
  (2003 12 25 "Christmas Day")
  (2003 12 26 "Boxing Day")
  (2004 1 1 "New Year's Day")
  (2004 4 9 "Good Friday")
  (2004 4 12 "Easter Monday")
  (2004 5 1 "Labour Day")
  (2004 6 1 "Madaraka Day")
  (2004 10 11 "Moi Day (in lieu of Sunday 10-10, s.4)")
  (2004 10 20 "Kenyatta Day")
  (2004 11 15 "Idd-ul-Fitr (in lieu of Sunday 11-14, s.4)")
  (2004 12 13 "Jamhuri Day (in lieu of Sunday 12-12, s.4)")
  (2004 12 25 "Christmas Day")
  (2004 12 27 "Boxing Day (in lieu of Sunday 12-26, s.4)")
  (2006 1 2 "New Year's Day (in lieu of Sunday 01-01, s.4)")
  (2006 4 14 "Good Friday")
  (2006 4 17 "Easter Monday")
  (2006 5 1 "Labour Day")
  (2006 6 1 "Madaraka Day")
  (2006 10 10 "Moi Day")
  (2006 10 20 "Kenyatta Day")
  (2006 10 23 "Idd-ul-Fitr")
  (2006 12 12 "Jamhuri Day")
  (2006 12 25 "Christmas Day")
  (2006 12 26 "Boxing Day")
  (2008 1 1 "New Year's Day")
  (2008 3 21 "Good Friday")
  (2008 3 24 "Easter Monday")
  (2008 5 1 "Labour Day")
  (2008 6 2 "Madaraka Day (in lieu of Sunday 06-01, s.4)")
  (2008 10 1 "Idd-ul-Fitr")
  (2008 10 10 "Moi Day")
  (2008 10 20 "Kenyatta Day")
  (2008 12 12 "Jamhuri Day")
  (2008 12 25 "Christmas Day")
  (2008 12 26 "Boxing Day")
  (2011 1 1 "New Year's Day")
  (2011 4 22 "Good Friday")
  (2011 4 25 "Easter Monday")
  (2011 5 2 "Labour Day (in lieu of Sunday 05-01, s.4)")
  (2011 6 1 "Madaraka Day")
  (2011 8 30 "Idd-ul-Fitr")
  (2011 10 20 "Mashujaa Day")
  (2011 12 12 "Jamhuri Day")
  (2011 12 26 "Boxing Day")
  (2011 12 27 "Christmas Day (in lieu of Sunday 12-25, s.4)")
  (2026 1 1 "New Year's Day")
  (2026 3 20 "Idd-ul-Fitr")
  (2026 4 3 "Good Friday")
  (2026 4 6 "Easter Monday")
  (2026 5 1 "Labour Day")
  (2026 5 27 "Idd-ul-Azha")
  (2026 6 1 "Madaraka Day")
  (2026 10 10 "Mazingira Day")
  (2026 10 20 "Mashujaa Day")
  (2026 12 12 "Jamhuri Day")
  (2026 12 25 "Christmas Day")
  (2026 12 26 "Boxing Day")
 ))
