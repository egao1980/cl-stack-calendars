;; Egypt government (secondary sources) public holidays 2014-2016: external gold for EG.
;; Regenerate: uv run --no-project --with holidays==0.109 python -I scripts/generate_mena_holiday_gold.py EG-SECONDARY
;; :days lists every holiday as (YEAR MONTH DAY NAME); any other day is not one.
(
 :country "EG"
 :generated "2026-11-28"
 :from 2014 :to 2016
 :note "LOWER CONFIDENCE. 2014-2016 from youm7 reports of the Cabinet decisions (decree numbers known only for 1723/2015 and 2508/2015)."
 :confidence :secondary
 :weekends ((nil 5 6))
 :sources
 (
  (:title "قرار رئيس الجمهورية العربية المتحدة بتعطيل وزارات ومصالح الحكومة يوم الوقفة وأيام عيد الفطر الثلاثة وفي يوم الوقفة وأيام عيد الأضحى الأربعة" :uri "https://manshurat.org/node/61499"
   :text "Government closed on the eve + 3 days of Eid al-Fitr and on Arafah + 4 days of Eid al-Adha. Metadata only (PDF not read). Practice 2008-2017 matches this pattern (Fitr 4 days, Adha 5 days).")
  (:title "قرار رئيس الجمهورية رقم 14 لسنة 1962 بشأن الأعياد والمواسم التى تحتفل بها الجمهورية العربية المتحدة" :uri "https://manshurat.org/node/59195"
   :text "Feasts and seasons list of the UAR; amended by presidential decrees 225/1973 (1973-03-06) and 1540/1974 (1974-09-26, after the October War: adds 6 October). Scan cached, not transcribed (pre-2000).")
  (:title "قرار رئيس مجلس الوزراء رقم 382 لسنة 1982 فى شأن الأعياد التى تعطل فيها وزارات ومصالح الحكومة ووحدات القطاع العام" :uri "https://manshurat.org/node/4786"
   :text "Government holiday list (1982). Superseded/relabelled by 454/1987 (which 2017-2018 decrees cite).")
  (:title "قرار رئيس مجلس الوزراء رقم 454 لسنة 1987 بشأن تحديد الاحتفالات والأعياد التى يحتفل بها كل عام بجمهورية مصر العربية" :uri "https://manshurat.org/node/44922"
   :text "Government holiday list in force until 2018-07-02: Islamic New Year, Mawlid, Eid al-Fitr, Arafah + Eid al-Adha, Sham el-Nessim, 25 April, 1 May, 23 July, 6 October (content inferred from 1193/2018 and practice; Eid day counts were set each year by decree).")
  (:title "قانون العمل الصادر بالقانون رقم 12 لسنة 2003 (المادة 52)" :uri "https://manshurat.org/node/12120"
   :text "Art. 52: private-sector workers get paid leave on feast days fixed by the Manpower Minister (max 13 days/year). Private sector only.")
  (:title "قرار وزيرة القوى العاملة والهجرة رقم 49 لسنة 2009 بشأن تحديد أيام الأعياد التى تعتبر إجازة بأجر كامل للعمال" :uri "https://manshurat.org/node/12184"
   :text "Private sector: adds 25 January (Police Day) to the 112/2003 list (gazette scan read).")
  (:title "قرار رئيس مجلس الوزراء رقم 1249 لسنة 2020 بتعديل بعض أحكام القرار رقم 1193 لسنة 2018" :uri "https://manshurat.org/node/66981"
   :text "Adds to art. 1: the PM may, in cases he judges, substitute another day at the beginning or the end of the working week for any listed holiday. Legal basis of the 'move to Thursday (or Sunday)' decrees from 2020 (gazette scan read).")
  (:title "قانون العمل الصادر بالقانون رقم 14 لسنة 2025 (المادة 129) وقرار وزير العمل رقم 294 لسنة 2025" :uri "https://www.tamimi.com/news/ministerial-decree-setting-official-paid-holidays-for-workers-no-294-of-2025"
   :text "Private sector: new Labour Law art. 129 + Labour Minister decision 294/2025 adopt the 1193/2018 list for private-sector workers; decision 346/2025 adds Christian religious feasts for Christian workers. Private sector only.")
  (:title "Beblawi: Tuesday (7 Jan) official holiday for Christmas (2014)" :uri "https://www.youm7.com/story/2014/1/5/الببلاوى-يهنئ-الأقباط-بعيد-الميلاد-ويقرر-الثلاثاء-إجازة-رسمية/1435297"
   :text "")
  (:title "Cabinet: referendum on working days; Mawlid Mon 13 Jan holiday (Daily News Egypt) (2014)" :uri "https://www.dailynewssegypt.com/2014/01/09/voting-on-referendum-scheduled-during-working-days"
   :text "")
  (:title "Government: next Thursday (24 Apr) official holiday for Sinai Liberation (2014)" :uri "https://www.youm7.com/story/2014/4/17/الحكومة-ندرس-قانون-مكافحة-الإرهاب-بعد-إعادته-من-الرئاسة-والخميس/1617962"
   :text "")
  (:title "Mahlab decree: Eid al-Fitr holiday 4 days (28-31 Jul 2014) (2014)" :uri "https://www.youm7.com/story/2014/7/24/محلب-يصدر-قرارا-باعتبار-إجازة-عيد-الفطر-4-أيام-للعاملين/1790584"
   :text "")
  (:title "Cabinet: Eid al-Adha holiday 5 days for government (3-7 Oct 2014) (2014)" :uri "https://www.youm7.com/story/2014/9/27/الوزراء-إجازة-عيد-الأضحى-5-أيام-للحكومة-و4-لقطاع-الأعمال/1883619"
   :text "")
  (:title "Cabinet: Saturday (25 Oct) official holiday for Hijri New Year (2014)" :uri "https://www.youm7.com/story/2014/10/21/مجلس-الوزراء-السبت-إجازة-رسمية-بمناسبة-العام-الهجرى/1915551"
   :text "")
  (:title "Government: Sunday (25 Jan) official holiday (2015)" :uri "https://www.youm7.com/story/2015/1/21/الحكومة-تعلن-الأحد-إجازة-رسمية-والاحتفال-بذكرى-ثورة-25-يناير/2035627"
   :text "")
  (:title "PM decree 1723/2015: 30 June 2015 paid holiday (30 June Revolution anniversary) (2015)" :uri "https://manshurat.org/node/6871"
   :text "")
  (:title "Cabinet: Eid al-Fitr holiday Friday to Monday (17-20 Jul 2015) (2015)" :uri "https://www.youm7.com/story/2015/7/14/مجلس-الوزراء-إجازة-عيد-الفطر-من-الجمعة-وحتى-الأثنين/2264892"
   :text "")
  (:title "PM decree 2508/2015: Eid al-Adha 5 days (23-27 Sep 2015), Official Gazette 2015-09-20 (youm7 report) (2015)" :uri "https://www.youm7.com/story/2015/9/20/رئيس-الوزراء-إجازة-عيد-الأضحى-5-أيام-بالمصالح-الحكومية-و4/2355230"
   :text "")
  (:title "PM decree: tomorrow (14 Oct) official holiday for Hijri New Year (2015)" :uri "https://www.youm7.com/story/2015/10/13/رئيس-الوزراء-يصدر-قرارا-باعتماد-غداً-إجازة-رسمية-بمناسبة-رأس/2387027"
   :text "")
  (:title "Bourse holiday Wednesday (23 Dec) for Mawlid (2015)" :uri "https://www.youm7.com/story/2015/12/17/البورصة-إجازة-الأربعاء-المقبل-بمناسبة-المولد-النبوى/2496774"
   :text "")
  (:title "PM decree: 30 June paid holiday (2016)" :uri "https://www.youm7.com/story/2016/6/26/رئيس-الوزراء-يصدر-قرارا-باعتبار-30-يونيو-إجازة-مدفوعة-الأجر/2777246"
   :text "")
  (:title "PM decree: Eid holiday 3 days (5-7 Jul 2016) (2016)" :uri "https://www.youm7.com/story/2016/6/30/رئيس-الوزراء-يصدر-قرارًا-باعتبار-إجازة-العيد-3-أيام-تبدأ/2782956"
   :text "")
  (:title "Government: Eid al-Adha 5 days from Sunday 11 Sep (2016)" :uri "https://www.youm7.com/story/2016/9/6/الحكومة-إجازة-عيد-الأضحى-5-أيام-اعتبارا-من-الأحد-11/2873646"
   :text "")
  (:title "PM: 1 Muharram 1438 holiday for government (2016)" :uri "https://www.youm7.com/story/2016/9/30/رئيس-الوزراء-يقرر-اعتبار-رأس-السنة-الهجرية-إجازة-للعاملين-بالحكومة/2903099"
   :text "")
  (:title "PM decree: Sunday (11 Dec) holiday for Mawlid (2016)" :uri "https://www.youm7.com/story/2016/12/7/رئيس-الوزراء-يصدر-قرارا-باعتبار-الأحد-إجازة-رسمية-بمناسبة-المولد/2999897"
   :text "")
 )
 :days
 (
  (2014 1 7 "عيد الميلاد المجيد")
  (2014 1 13 "المولد النبوي الشريف")
  (2014 1 25 "عيد ثورة 25 يناير وعيد الشرطة")
  (2014 4 21 "عيد شم النسيم")
  (2014 4 24 "عيد تحرير سيناء (moved from 04-25)")
  (2014 5 1 "عيد العمال")
  (2014 7 23 "عيد ثورة 23 يوليو")
  (2014 7 28 "عيد الفطر المبارك")
  (2014 7 29 "عيد الفطر المبارك")
  (2014 7 30 "عيد الفطر المبارك")
  (2014 7 31 "عطلة عيد الفطر (يوم إضافي)")
  (2014 10 3 "وقفة عيد الأضحى (يوم عرفة)")
  (2014 10 4 "عيد الأضحى المبارك")
  (2014 10 5 "عيد الأضحى المبارك")
  (2014 10 6 "عيد الأضحى المبارك؛ عيد القوات المسلحة")
  (2014 10 7 "عيد الأضحى المبارك")
  (2014 10 25 "رأس السنة الهجرية")
  (2015 1 3 "المولد النبوي الشريف")
  (2015 1 7 "عيد الميلاد المجيد")
  (2015 1 25 "عيد ثورة 25 يناير وعيد الشرطة")
  (2015 4 13 "عيد شم النسيم")
  (2015 4 25 "عيد تحرير سيناء")
  (2015 5 1 "عيد العمال")
  (2015 6 30 "ذكرى ثورة 30 يونيو")
  (2015 7 17 "عيد الفطر المبارك")
  (2015 7 18 "عيد الفطر المبارك")
  (2015 7 19 "عيد الفطر المبارك")
  (2015 7 20 "عطلة عيد الفطر (يوم إضافي)")
  (2015 7 23 "عيد ثورة 23 يوليو")
  (2015 9 23 "وقفة عيد الأضحى (يوم عرفة)")
  (2015 9 24 "عيد الأضحى المبارك")
  (2015 9 25 "عيد الأضحى المبارك")
  (2015 9 26 "عيد الأضحى المبارك")
  (2015 9 27 "عيد الأضحى المبارك")
  (2015 10 6 "عيد القوات المسلحة")
  (2015 10 14 "رأس السنة الهجرية")
  (2015 12 23 "المولد النبوي الشريف")
  (2016 1 7 "عيد الميلاد المجيد")
  (2016 1 25 "عيد ثورة 25 يناير وعيد الشرطة")
  (2016 4 25 "عيد تحرير سيناء")
  (2016 5 1 "عيد العمال")
  (2016 5 2 "عيد شم النسيم")
  (2016 6 30 "ذكرى ثورة 30 يونيو")
  (2016 7 5 "وقفة عيد الفطر")
  (2016 7 6 "عيد الفطر المبارك")
  (2016 7 7 "عيد الفطر المبارك")
  (2016 7 23 "عيد ثورة 23 يوليو")
  (2016 9 11 "وقفة عيد الأضحى (يوم عرفة)")
  (2016 9 12 "عيد الأضحى المبارك")
  (2016 9 13 "عيد الأضحى المبارك")
  (2016 9 14 "عيد الأضحى المبارك")
  (2016 9 15 "عيد الأضحى المبارك")
  (2016 10 2 "رأس السنة الهجرية")
  (2016 10 6 "عيد القوات المسلحة")
  (2016 12 11 "المولد النبوي الشريف")
 ))
