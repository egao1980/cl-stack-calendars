;; Latvia (festival years) public holidays 2018-2023: external gold for LV.
;; Regenerate: uv run --no-project --with holidays==0.109 python -I scripts/generate_mena_holiday_gold.py LV-SECONDARY
;; :days lists every holiday as (YEAR MONTH DAY NAME); any other day is not one.
(
 :country "LV"
 :generated "2026-11-28"
 :from 2018 :to 2023
 :note "LOWER CONFIDENCE. 2018 and 2023: the Song and Dance Festival closing days (8 Jul 2018, 9 Jul 2023) were not read on a primary page; the rest of each year is primary."
 :gaps (2019 2020 2021 2022)
 :confidence :secondary
 :weekends ((nil 6 7))
 :sources
 (
  (:title "Likums \"Par svētku, atceres un atzīmējamām dienām\" (until 22 Apr 2002 \"Par svētku un atceres dienām\")" :uri "https://likumi.lv/ta/id/72608"
   :text "Art. 1 (2000 text): 1 Jan; Lielā Piektdiena, Lieldienas (Sunday and Monday); 1 May; Mātes diena (second Sunday of May); Vasarsvētki; 23 and 24 Jun; 18 Nov; 25 and 26 Dec; 31 Dec (Vecgada diena).")
  (:title "Grozījumi likumā \"Par svētku un atceres dienām\" (4. maijs)" :uri "https://likumi.lv/ta/id/60998"
   :text "4 May (Latvijas Republikas Neatkarības deklarācijas pasludināšanas diena) moved into art. 1 (a holiday).")
  (:title "Grozījumi likumā \"Par svētku, atceres un atzīmējamām dienām\" (24. decembris, brīvdienas pārcelšana)" :uri "https://likumi.lv/ta/id/158621"
   :text "\"24., 25. un 26.decembri — Ziemassvētkus\"; \"Ja svētku dienas — 4.maijs un 18.novembris — iekrīt sestdienā vai svētdienā, nākamo darbdienu nosaka par brīvdienu.\"")
  (:title "Grozījumi likumā \"Par svētku, atceres un atzīmējamām dienām\" (Dziesmu un deju svētku noslēguma diena)" :uri "https://likumi.lv/ta/id/269373"
   :text "Adds the closing day of the Vispārējie latviešu Dziesmu un deju svētki, with the same Saturday/Sunday rule.")
  (:title "Grozījums likumā \"Par svētku, atceres un atzīmējamām dienām\" (2018. gada 24. septembris)" :uri "https://likumi.lv/ta/id/299942"
   :text "2018. gada 24. septembri – Viņa Svētības pāvesta Franciska pastorālās vizītes Latvijā dienu.")
  (:title "Grozījumi likumā \"Par svētku, atceres un atzīmējamām dienām\" (2023. gada 29. maijs)" :uri "https://likumi.lv/ta/id/342196"
   :text "2023. gada 29. maiju – dienu, kad Latvijas hokeja komanda ieguva bronzas medaļu.")
  (:title "Darba likums, 133. panta ceturtā daļa (darba dienas pārcelšana)" :uri "https://likumi.lv/ta/id/26019"
   :text "The Cabinet may move a working day between a holiday and the weekend to a Saturday, by order issued for the next year by 1 July.")
  (:title "Ministru kabineta rīkojums Nr. 211 (2017-04-25) (2018)" :uri "https://likumi.lv/ta/id/290413"
   :text "")
  (:title "Ministru kabineta rīkojums Nr. 342 (2019-07-09) (2020)" :uri "https://likumi.lv/ta/id/308097"
   :text "")
  (:title "Ministru kabineta rīkojums Nr. 354 (2020-06-30) (2021)" :uri "https://likumi.lv/ta/id/315837"
   :text "")
  (:title "Ministru kabineta rīkojums Nr. 443 (2022-06-21) (2023)" :uri "https://likumi.lv/ta/id/333470"
   :text "")
 )
 :days
 (
  (2018 1 1 "Jaungada diena")
  (2018 3 30 "Lielā Piektdiena")
  (2018 4 1 "Pirmās Lieldienas")
  (2018 4 2 "Otrās Lieldienas")
  (2018 4 30 "Brīvdiena (pārcelta darbdiena)")
  (2018 5 1 "Darba svētki")
  (2018 5 4 "Latvijas Republikas Neatkarības atjaunošanas diena")
  (2018 5 13 "Mātes diena")
  (2018 5 20 "Vasarsvētki")
  (2018 6 23 "Līgo diena")
  (2018 6 24 "Jāņu diena")
  (2018 7 8 "Vispārējo latviešu Dziesmu un deju svētku noslēguma diena")
  (2018 7 9 "Dziesmu un deju svētku noslēguma diena (brīvdiena)")
  (2018 9 24 "Pāvesta Franciska pastorālās vizītes Latvijā diena")
  (2018 11 18 "Latvijas Republikas proklamēšanas diena")
  (2018 11 19 "Latvijas Republikas proklamēšanas diena (substitute)")
  (2018 12 24 "Ziemassvētku vakars")
  (2018 12 25 "Pirmie Ziemassvētki")
  (2018 12 26 "Otrie Ziemassvētki")
  (2018 12 31 "Vecgada diena")
  (2023 1 1 "Jaungada diena")
  (2023 4 7 "Lielā Piektdiena")
  (2023 4 9 "Pirmās Lieldienas")
  (2023 4 10 "Otrās Lieldienas")
  (2023 5 1 "Darba svētki")
  (2023 5 4 "Latvijas Republikas Neatkarības atjaunošanas diena")
  (2023 5 5 "Brīvdiena (pārcelta darbdiena)")
  (2023 5 14 "Mātes diena")
  (2023 5 28 "Vasarsvētki")
  (2023 5 29 "Hokeja bronzas medaļas diena")
  (2023 6 23 "Līgo diena")
  (2023 6 24 "Jāņu diena")
  (2023 7 9 "Vispārējo latviešu Dziesmu un deju svētku noslēguma diena")
  (2023 7 10 "Dziesmu un deju svētku noslēguma diena (brīvdiena)")
  (2023 11 18 "Latvijas Republikas proklamēšanas diena")
  (2023 11 20 "Latvijas Republikas proklamēšanas diena (substitute)")
  (2023 12 24 "Ziemassvētku vakars")
  (2023 12 25 "Pirmie Ziemassvētki")
  (2023 12 26 "Otrie Ziemassvētki")
  (2023 12 31 "Vecgada diena")
 )
 :working-days
 (
  (2018 4 21 "working day by decision")
  (2023 5 20 "working day by decision")
 ))
