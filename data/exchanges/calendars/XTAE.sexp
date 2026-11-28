;;;; XTAE exchange trading-day calendar (#49).
;;;; Sources: TASE 'Trading and Vacation Schedules' page (2025-2028 lists + current hours) and the yearly
;;;; 'Vacation Schedule' PDFs 2013-2025 linked from it (English + Hebrew). The rules below reproduce every
;;;; yearly list 2013-2028 exactly, except the one-off closures given as notices (elections, Friday rule).
;;;; 2000-2012: no TASE list found (web.archive.org offline from this sandbox); ec's closures 2000-2012 equal
;;;; these rules exactly, so the rules are extended back without :from.
;;;; Needs new date functions (see XTAE-hours.md, "Computed rules"): il-purim, il-erev-pesach,
;;;; il-erev-pesach-seventh, il-memorial-day-observed, il-independence-day-observed, il-erev-shavuot,
;;;; il-tisha-bav-observed, il-erev-rosh-hashanah, il-erev-yom-kippur, il-erev-sukkot, il-erev-simchat-torah.

(:name "XTAE"
 :title "Tel Aviv Stock Exchange trading days"
 :authority "Tel Aviv Stock Exchange, 'TASE & TASE Clearing Houses Vacation Schedule' (yearly) and 'Trading Days Shift' page"
 :authority-uri "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule"
 :weekend ((nil 5 6) ((2026 1 4) 6 7))
 :bases ((:calendar "IL" :from nil :to nil :except ("Independence Day")
          :authority "TASE closes on every Jewish festival day of the IL calendar (Rosh Hashanah I-II, Yom Kippur, Sukkot, Simchat Torah, Passover I and VII, Shavuot): TASE vacation schedules 2013-2028 (https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule and yearly PDFs). Independence Day is taken from the observed-date rule below, since IL uses 5 Iyar without the Shabbat/Monday shifts."))
 :rules ((:computed "Purim" il-purim :authority "TASE vacation schedules 2013-2028 (https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule and yearly PDFs) ('Purim' non-trading; Shushan Purim trades, e.g. 2022-2024, 2026 notes)")
         (:computed "Passover Eve" il-erev-pesach :authority "TASE vacation schedules 2013-2028 (https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule and yearly PDFs)")
         (:computed "Passover II Eve" il-erev-pesach-seventh :authority "TASE vacation schedules 2013-2028 (https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule and yearly PDFs) ('Passover II Eve' / ערב שביעי של פסח)")
         (:computed "Memorial Day" il-memorial-day-observed :authority "TASE vacation schedules 2013-2028 (https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule and yearly PDFs) (Memorial Day non-trading; e.g. 2022 'Memorial Day (moved up)' Wed 4 May)")
         (:computed "Independence Day" il-independence-day-observed :authority "TASE vacation schedules 2013-2028 (https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule and yearly PDFs) (observed date, e.g. 2022 Thu 5 May, 2014 Tue 6 May)")
         (:computed "Shavuot Eve" il-erev-shavuot :authority "TASE vacation schedules 2013-2028 (https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule and yearly PDFs) ('Pentecost (Shavuot) Eve')")
         (:computed "Fast Day (Tisha B'Av)" il-tisha-bav-observed :authority "TASE vacation schedules 2013-2028 (https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule and yearly PDFs) (e.g. 2022 'Fast Day (postponed)' Sun 7 Aug)")
         (:computed "Jewish New Year Eve" il-erev-rosh-hashanah :authority "TASE vacation schedules 2013-2028 (https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule and yearly PDFs)")
         (:computed "Yom Kippur Eve" il-erev-yom-kippur :authority "TASE vacation schedules 2013-2028 (https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule and yearly PDFs)")
         (:computed "Sukkoth Eve" il-erev-sukkot :authority "TASE vacation schedules 2013-2028 (https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule and yearly PDFs)")
         (:computed "Simchat Tora Eve" il-erev-simchat-torah :authority "TASE vacation schedules 2013-2028 (https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule and yearly PDFs)"))
 :gaps ((:years "2000-2012" :note "No TASE vacation schedule found. The TASE site's archive starts at 2013 (https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule, 'Previous Years' 2013-2025). web.archive.org (CDX and snapshots) was offline / blocked from this sandbox, so archived tase.co.il pages could not be read. Best evidence: ec 4.13.3 closures 2000-2012 equal the TASE rules exactly; Globes 10 Apr 2009 (secondary) confirms Passover II Eve/Passover II and Memorial/Independence Day 2009 closures. Knesset election days 2003-01-28, 2006-03-28, 2009-02-10 and municipal election days 2003-10-28, 2008-11-11 are statutory rest days but ec trades and no TASE/press evidence was found either way: open question.")
        (:years "2020" :note "Knesset election Monday 2 March 2020: ec closed; the TASE 2020 PDF (created 2019-02-03, before the election was called) does not list it and no TASE notice or press report was found. By analogy with every other Knesset election in the lists (2013, 2015, Apr 2019, Sep 2019 per Globes, 2021, 2022, 2026) TASE was almost certainly closed; it may be added as a secondary closure once a source is found.")
        (:years "2013" :note "Municipal election day 22 October 2013 not in the (2017-recreated) 2013 list; ec trades; unknown."))
 :notices (
   (:title "TASE Vacation Schedule 2013 (Hebrew, מועדי חופשות)" :year 2013
    :uri "https://content.tase.co.il/media/musikfp3/file_0010_vacation_schedule_2013_heb.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule"
    :published-in "TASE website, 'Trading and Vacation Schedules' page, previous-years archive (PDF)"
    :dates-note "PDF carries no issue date; PDF CreationDate 2017-10-17 (date of this archived copy, not of first publication). Hebrew PDF: https://content.tase.co.il/media/musikfp3/file_0010_vacation_schedule_2013_heb.pdf . English PDF omits the Simchat Torah rows; the Hebrew PDF (same year) lists 25/9 ערב שמחת תורה and 26/9 שמחת תורה. The list has no 22 Oct 2013 municipal-election closure (unknown whether TASE traded). Pesach interim 27-28 Mar falls in the 2009-2013 timetable era (interim close then ~14:30 per Globes 2009); 14:15 kept as in ec, unverified."
    :closed (((2013 1 22) "Knesset Election Day"))
    :open ()
    :early-closes (((2013 3 27) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2013 3 28) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2013 9 22) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2013 9 23) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2013 9 24) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15"))
    :late-opens ())
   (:title "TASE Vacation Schedule 2014" :year 2014
    :uri "https://content.tase.co.il/media/1yrj4yn5/file_0010_vacation_schedule_2014_eng.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule"
    :published-in "TASE website, 'Trading and Vacation Schedules' page, previous-years archive (PDF)"
    :dates-note "PDF carries no issue date; PDF CreationDate 2017-10-24 (date of this archived copy, not of first publication). Hebrew PDF: https://content.tase.co.il/media/gkgd1tee/file_0010_vacation_schedule_2014_heb.pdf ."
    :closed ()
    :open ()
    :early-closes (((2014 4 16) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2014 4 17) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2014 10 12) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2014 10 13) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2014 10 14) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15"))
    :late-opens ())
   (:title "TASE Vacation Schedule 2015" :year 2015
    :uri "https://content.tase.co.il/media/dp0kghj1/file_0010_vacation_schedule_2015_eng.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule"
    :published-in "TASE website, 'Trading and Vacation Schedules' page, previous-years archive (PDF)"
    :dates-note "PDF carries no issue date; PDF CreationDate 2017-10-24 (date of this archived copy, not of first publication). Hebrew PDF: https://content.tase.co.il/media/punlviyp/file_0010_vacation_schedule_2015_heb.pdf ."
    :closed (((2015 3 17) "Knesset Election Day"))
    :open ()
    :early-closes (((2015 4 5) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2015 4 6) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2015 4 7) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2015 4 8) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2015 9 29) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2015 9 30) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2015 10 1) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15"))
    :late-opens ())
   (:title "TASE Vacation Schedule 2016" :year 2016
    :uri "https://content.tase.co.il/media/p2gm0s3f/file_0010_vacation_schedule_2016_eng.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule"
    :published-in "TASE website, 'Trading and Vacation Schedules' page, previous-years archive (PDF)"
    :dates-note "PDF carries no issue date; PDF CreationDate 2017-11-07 (date of this archived copy, not of first publication). Hebrew PDF: https://content.tase.co.il/media/jpplj0hs/file_0010_vacation_schedule_2016_heb.pdf ."
    :closed ()
    :open ()
    :early-closes (((2016 4 24) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2016 4 25) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2016 4 26) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2016 4 27) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2016 10 18) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2016 10 19) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2016 10 20) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15"))
    :late-opens ())
   (:title "TASE Vacation Schedule 2017" :year 2017
    :uri "https://content.tase.co.il/media/ax5jgq31/file_0010_vacation_schedule_2017_eng.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule"
    :published-in "TASE website, 'Trading and Vacation Schedules' page, previous-years archive (PDF)"
    :dates-note "PDF carries no issue date; PDF CreationDate 2018-01-17 (date of this archived copy, not of first publication). Hebrew PDF: https://content.tase.co.il/media/ykgjhogx/file_0010_vacation_schedule_2017_heb.pdf . Hebrew PDF digits garbled by the text layer; English PDF used."
    :closed ()
    :open ()
    :early-closes (((2017 4 12) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2017 4 13) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2017 10 8) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2017 10 9) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2017 10 10) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15"))
    :late-opens ())
   (:title "TASE Vacation Schedule 2018" :year 2018
    :uri "https://content.tase.co.il/media/fz0nyrzy/file_0010_vacation_schedule_2018_eng.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule"
    :published-in "TASE website, 'Trading and Vacation Schedules' page, previous-years archive (PDF)"
    :dates-note "PDF carries no issue date; PDF CreationDate 2019-01-28 (date of this archived copy, not of first publication). Hebrew PDF: https://content.tase.co.il/media/5cmh154f/file_0010_vacation_schedule_2018_heb.pdf ."
    :closed (((2018 10 30) "Municipal Election Day"))
    :open ()
    :early-closes (((2018 4 1) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2018 4 2) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2018 4 3) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2018 4 4) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2018 9 25) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2018 9 26) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2018 9 27) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15"))
    :late-opens ())
   (:title "TASE Vacation Schedule 2019" :year 2019
    :uri "https://content.tase.co.il/media/n2hl3q50/file_0010_vacation_schedule_2019_eng.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule"
    :published-in "TASE website, 'Trading and Vacation Schedules' page, previous-years archive (PDF)"
    :dates-note "PDF carries no issue date; PDF CreationDate 2019-02-03 (date of this archived copy, not of first publication). Hebrew PDF: https://content.tase.co.il/media/qsyberat/file_0010_vacation_schedule_2019_heb.pdf . PDF created 2019-02-03 lists the 9 Apr Knesset election; the 17 Sep 2019 election was called later and is in a separate notice."
    :closed (((2019 4 9) "Knesset Election Day"))
    :open ()
    :early-closes (((2019 4 21) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2019 4 22) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2019 4 23) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2019 4 24) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2019 10 15) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2019 10 16) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2019 10 17) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15"))
    :late-opens ())
   (:title "TASE Vacation Schedule 2020" :year 2020
    :uri "https://content.tase.co.il/media/hk4pgzy4/file_0010_vacation_schedule_2020_eng.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule"
    :published-in "TASE website, 'Trading and Vacation Schedules' page, previous-years archive (PDF)"
    :dates-note "PDF carries no issue date; PDF CreationDate 2019-02-03 (date of this archived copy, not of first publication). Hebrew PDF: https://content.tase.co.il/media/yuhj4plq/file_0010_vacation_schedule_2020_heb.pdf . PDF created 2019-02-03, before the 2 Mar 2020 election was called; that day is not listed (see :gaps). Sukkot/Simchat Torah 2020 fell on Fri/Sat."
    :closed ()
    :open ()
    :early-closes (((2020 4 12) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2020 4 13) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2020 10 4) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2020 10 5) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2020 10 6) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2020 10 7) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2020 10 8) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15"))
    :late-opens ())
   (:title "TASE Vacation Schedule 2021" :year 2021
    :uri "https://content.tase.co.il/media/hh2ilipi/file_0010_vacation_schedule_2021_eng.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule"
    :published-in "TASE website, 'Trading and Vacation Schedules' page, previous-years archive (PDF)"
    :dates-note "PDF carries no issue date; PDF CreationDate 2021-01-10 (date of this archived copy, not of first publication). Hebrew PDF: https://content.tase.co.il/media/phbhzlw0/file_0010_vacation_schedule_2021_heb.pdf . English PDF misprints the election as 'March 3'; Hebrew PDF: 23/3 בחירות."
    :closed (((2021 3 23) "Knesset Election Day"))
    :open ()
    :early-closes (((2021 3 29) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2021 3 30) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2021 3 31) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2021 4 1) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2021 9 22) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2021 9 23) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2021 9 26) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15"))
    :late-opens ())
   (:title "TASE Vacation Schedule 2022" :year 2022
    :uri "https://content.tase.co.il/media/vyolzrvu/file_0010_vacation_schedule_2022_eng.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule"
    :published-in "TASE website, 'Trading and Vacation Schedules' page, previous-years archive (PDF)"
    :dates-note "PDF carries no issue date; PDF CreationDate 2022-07-12 (date of this archived copy, not of first publication). Hebrew PDF: https://content.tase.co.il/media/oyoapxag/file_0010_vacation_schedule_2022_heb.pdf . English PDF has a stray row 'May 16 Sunday Pentecost Eve' (copied from 2021); the Hebrew PDF has no such row and Shavuot Eve 2022 was Friday 3 June. Not a closure."
    :closed (((2022 11 1) "Knesset Election Day"))
    :open ()
    :early-closes (((2022 4 17) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2022 4 18) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2022 4 19) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2022 4 20) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2022 10 11) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2022 10 12) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2022 10 13) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15"))
    :late-opens ())
   (:title "TASE Vacation Schedule 2023" :year 2023
    :uri "https://content.tase.co.il/media/iqcijli2/file_0010_vacation_schedule_2023_eng.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule"
    :published-in "TASE website, 'Trading and Vacation Schedules' page, previous-years archive (PDF)"
    :dates-note "PDF carries no issue date; PDF CreationDate 2022-10-20 (date of this archived copy, not of first publication). Hebrew PDF: https://content.tase.co.il/media/ewifstnn/file_0010_vacation_schedule_2023_heb.pdf . The list closes 31 Oct 2023 (municipal elections), but the elections were postponed (war) to 27 Feb 2024 and TASE traded on 31 Oct 2023 (Globes market report 31 Oct 2023: https://en.globes.co.il/en/article-tue-banks-fall-sharply-1001461451). Not closed here."
    :closed ()
    :open ()
    :early-closes (((2023 4 9) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2023 4 10) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2023 10 1) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2023 10 2) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2023 10 3) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2023 10 4) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2023 10 5) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15"))
    :late-opens ())
   (:title "TASE Vacation Schedule 2024 (Hebrew, מועדי חופשות)" :year 2024
    :uri "https://content.tase.co.il/media/4ggpx4fr/file_0010_vacation_schedule_2024_heb.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule"
    :published-in "TASE website, 'Trading and Vacation Schedules' page, previous-years archive (PDF)"
    :dates-note "PDF carries no issue date; PDF CreationDate 2021-02-11 (date of this archived copy, not of first publication). Hebrew PDF: https://content.tase.co.il/media/4ggpx4fr/file_0010_vacation_schedule_2024_heb.pdf . English PDF is cut after Sukkoth Eve; the Hebrew PDF lists 17/10 סוכות, 23/10 ערב שמחת תורה, 24/10 שמחת תורה. The 27 Feb 2024 municipal-election closure is not in the list (separate notice)."
    :closed ()
    :open ()
    :early-closes (((2024 4 24) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2024 4 25) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2024 10 20) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2024 10 21) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2024 10 22) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15"))
    :late-opens ())
   (:title "TASE Vacation Schedule 2025" :year 2025
    :uri "https://content.tase.co.il/media/ob4blknd/file_0010_vacation_schedule_2025_eng.pdf"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule"
    :published-in "TASE website, 'Trading and Vacation Schedules' page, previous-years archive (PDF)"
    :dates-note "PDF carries no issue date; PDF CreationDate 2021-02-11 (date of this archived copy, not of first publication). Hebrew PDF: https://content.tase.co.il/media/iexfczjb/file_0010_vacation_schedule_2025_heb.pdf ."
    :closed ()
    :open ()
    :early-closes (((2025 4 14) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2025 4 15) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2025 4 16) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2025 4 17) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2025 10 8) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2025 10 9) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2025 10 12) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15"))
    :late-opens ())
   (:title "TASE & TASE Clearing Houses Vacation Schedule, 2026" :year 2026
    :uri "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule"
    :published-in "TASE website, 'TASE Trading and Vacation Schedules' page (current and future years)"
    :dates-note "Web page section, fetched 2026-11-28; no issue date shown. Hebrew page: https://www.tase.co.il/he/content/knowledge_center/trading_vacation_schedule . Friday 18 Sep 2026: '* On a Friday before a Sunday that is a holiday eve or a public holiday, no trading will take place.' Shushan Purim (4 Mar 2026) is a trading day."
    :closed (((2026 9 18) "Friday before a Sunday holiday eve") ((2026 10 27) "Knesset Election Day"))
    :open ()
    :early-closes (((2026 4 6) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2026 9 28) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2026 9 29) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2026 9 30) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2026 10 1) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15"))
    :late-opens ())
   (:title "TASE & TASE Clearing Houses Vacation Schedule, 2027" :year 2027
    :uri "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule"
    :published-in "TASE website, 'TASE Trading and Vacation Schedules' page (current and future years)"
    :dates-note "Web page section, fetched 2026-11-28; no issue date shown. Hebrew page: https://www.tase.co.il/he/content/knowledge_center/trading_vacation_schedule . Friday rule as in 2026;"
    :closed (((2027 10 8) "Friday before a Sunday holiday eve"))
    :open ()
    :early-closes (((2027 4 26) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2027 10 18) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2027 10 19) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2027 10 20) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2027 10 21) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15"))
    :late-opens ())
   (:title "TASE & TASE Clearing Houses Vacation Schedule, 2028" :year 2028
    :uri "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule"
    :published-in "TASE website, 'TASE Trading and Vacation Schedules' page (current and future years)"
    :dates-note "Web page section, fetched 2026-11-28; no issue date shown. Hebrew page: https://www.tase.co.il/he/content/knowledge_center/trading_vacation_schedule . Friday rule as in 2026; Friday 14 Apr 2028 (before Passover II Eve, a settlement day, on Sunday 16 Apr) is NOT listed: it trades as a shortened interim day; the rule in practice applies only before Sundays that are non-settlement days."
    :closed (((2028 3 10) "Friday before Purim Sunday"))
    :open ()
    :early-closes (((2028 4 12) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2028 4 13) (14 15) "interim day of Passover: shortened trading, pre-closing 14:14-14:15") ((2028 10 9) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15") ((2028 10 10) (14 15) "interim day of Sukkoth: shortened trading, pre-closing 14:14-14:15"))
    :late-opens ())
   (:title "Globes market report 16 Sep 2019: 'The market will be closed tomorrow as election day in Israel is a public holiday'" :year 2019
    :uri "https://en.globes.co.il/en/article-1001300994"
    :issued (2019 9 16) :issued-uri "https://en.globes.co.il/en/article-1001300994"
    :published (2019 9 16) :published-uri "https://en.globes.co.il/en/article-1001300994"
    :published-in "Globes (English), daily TASE report"
    :dates-note "Knesset (22nd) election, called after the TASE 2019 PDF was made; no TASE notice found."
    :confidence :secondary
    :closed (((2019 9 17) "Knesset Election Day"))
    :open () :early-closes () :late-opens ())
   (:title "Globes 7 Jun 2020: No trading on TASE as workers apply sanctions" :year 2020
    :uri "https://en.globes.co.il/en/article-1001331393"
    :issued (2020 6 7) :issued-uri "https://en.globes.co.il/en/article-1001331393"
    :published (2020 6 7) :published-uri "https://en.globes.co.il/en/article-1001331393"
    :published-in "Globes (English)"
    :dates-note "TASE management decided there would be no trading on Sunday 7 June 2020 (Histadrut-directed labour sanction). No TASE notice found."
    :confidence :secondary
    :closed (((2020 6 7) "No trading: workers' sanctions"))
    :open () :early-closes () :late-opens ())
   (:title "Globes 26 Feb 2024: 'The market will be closed tomorrow for the municipal elections'" :year 2024
    :uri "https://en.globes.co.il/en/article-1001472244"
    :issued (2024 2 26) :issued-uri "https://en.globes.co.il/en/article-1001472244"
    :published (2024 2 26) :published-uri "https://en.globes.co.il/en/article-1001472244"
    :published-in "Globes (English), daily TASE report"
    :dates-note "Municipal elections postponed from 31 Oct 2023 to 27 Feb 2024 (war); not in the TASE 2024 PDF. No TASE notice found."
    :confidence :secondary
    :closed (((2024 2 27) "Municipal Election Day"))
    :open () :early-closes () :late-opens ())
   (:title "TASE: Trading Days Shift - Transition to Monday-Friday Trading" :year 2026
    :uri "https://www.tase.co.il/en/content/about/tradingdays_change"
    :issued (2025 6 18) :issued-uri "https://www.tase.co.il/en/content/about/tradingdays_change"
    :published nil :published-uri "https://www.tase.co.il/en/content/about/tradingdays_change"
    :published-in "TASE website"
    :dates-note "Board approval 18 Jun 2025, ISA approval 30 Jul 2025, effective with the trading week beginning Monday 5 Jan 2026; no Sunday trading; Friday trading to 14:00 (shares: pre-close 13:34-13:35, closing auction 13:44-13:45, end 13:50); no trading on holiday eves. Weekend era (6 7) from 4 Jan 2026 (vacation page: 'As of January 4th, 2026, the trading on TASE takes place Monday to Friday'). Page publication date not shown."
    :closed () :open () :early-closes () :late-opens ())
 ))
