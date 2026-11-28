;; Algeria (secondary sources) public holidays 2009-2020: external gold for DZ.
;; Regenerate: uv run --no-project --with holidays==0.109 python -I scripts/generate_mena_holiday_gold.py DZ-SECONDARY
;; :days lists every holiday as (YEAR MONTH DAY NAME); any other day is not one.
(
 :country "DZ"
 :generated "2026-11-28"
 :from 2009 :to 2020
 :note "LOWER CONFIDENCE. 2009, 2011, 2012 and 2016-2020: the Hijri dates from the ICOP record of each country's official month start (astronomycenter.net), cross-checked with APS where found; years with an unsourced Islamic day are gaps."
 :gaps (2010 2013 2014 2015)
 :confidence :secondary
 :weekends ((nil 4 5) ((2009 8 14) 5 6))
 :sources
 (
  (:title "Loi n° 63-278 du 26 juillet 1963 fixant la liste des fêtes légales" :uri "https://www.joradp.dz/FTP/JO-FRANCAIS/1963/F1963053.pdf"
   :text "Art. 1: I - 1er mai (fête du Travail) 1 jour; 5 juillet (fête de l'Indépendance et du F.L.N.) 1 jour; 1er novembre (fête de la Révolution) 1 jour. II - Idul Fitr (Aïd Esseghir) 2 jours; Idul Adha (Aïd El-Kebir) 1 jour; Awal Moharram (jour de l'An de l'Hégire) 1 jour; Achoura (10 Moharram) 1 jour; El-Mawlid Ennabawi 1 jour; Premier janvier (jour de l'An grégorien) 1 jour. Art. 2: chômées et payées for everyone. Art. 3: Lundi de Pâques, Ascension, Lundi de Pentecôte, 15 août, 25 décembre are fêtes légales ONLY for personnel of Christian confession; Art. 4: Roch Hachana, Yom Kippour, Pessah ONLY for personnel of Jewish confession. Good Friday is not in the text at all. Scanned PDF, read from page images.")
  (:title "Ordonnance n° 66-153 du 8 juin 1966 complétant la liste des fêtes légales" :uri "https://www.joradp.dz/FTP/JO-FRANCAIS/1966/F1966052.pdf"
   :text "Rewrites paragraph I: 1er mai 1 jour; Dix-neuf juin 1 jour (anniversary of the 19 June 1965 'redressement révolutionnaire'); 5 juillet (fête de l'Indépendance et du F.L.N.) 1 jour; 1er novembre 1 jour. Not in python-holidays.")
  (:title "Ordonnance n° 68-419 du 26 juin 1968 modifiant la loi n° 63-278 du 26 juillet 1963 fixant la liste des fêtes légales" :uri "https://www.joradp.dz/FTP/JO-FRANCAIS/1968/F1968056.pdf"
   :text "Rewrites paragraph II: Idul Fitr 2 jours; Idul Adha 2 jours (was 1); Awal Moharram 1; Achoura 1; El-Mawlid Ennabawi 1; Premier janvier 1.")
  (:title "Loi n° 05-06 du 17 Rabie El Aouel 1426 correspondant au 26 avril 2005 modifiant la loi n° 63-278 du 26 juillet 1963 fixant la liste des fêtes légales" :uri "https://www.joradp.dz/FTP/JO-FRANCAIS/2005/F2005030.pdf"
   :text "Rewrites paragraph I: 1er mai (fête du travail) 1 jour; 5 juillet (fête de l'Indépendance) 1 jour; 1er novembre (fête de la Révolution) 1 jour. Removes 19 June (first year without it: 2005) and drops 'et du F.L.N.' from 5 July.")
  (:title "Conseil des ministres du 27 décembre 2017: Yennayer (12 janvier) journée chômée et payée à partir de 2018" :uri "https://fr.wikipedia.org/wiki/F%C3%AAtes_et_jours_f%C3%A9ri%C3%A9s_en_Alg%C3%A9rie"
   :text "Presidential decision: 12 January (Yennayer) chômé et payé from 12 January 2018, pending amendment of loi 63-278 (done by loi 18-12).")
  (:title "Loi n° 18-12 du 18 Chaoual 1439 correspondant au 2 juillet 2018 modifiant et complétant la loi n° 63-278 du 26 juillet 1963 fixant la liste des fêtes légales" :uri "https://www.joradp.dz/FTP/JO-FRANCAIS/2018/F2018046.pdf"
   :text "Paragraph II: '... (sans changement jusqu'à) El-Mawlid Ennabawi Echarif 1 jour; Amenzu n Yennayer (jour de l'an Amazigh) correspondant au 12 janvier 1 jour; Premier janvier 1 jour'.")
  (:title "Loi n° 23-10 du 8 Dhou El Hidja 1444 correspondant au 26 juin 2023 modifiant la loi n° 63-278 du 26 juillet 1963 fixant la liste des fêtes légales" :uri "https://www.joradp.dz/FTP/JO-FRANCAIS/2023/F2023043.pdf"
   :text "Paragraph II: Aïd El Fitr El Moubarek 3 jours; Aïd El Adha El Moubarek 3 jours; rest unchanged. Published the day before Aïd El Adha 1444 (28 June 2023), so Adha 2023 already had 3 days; first 3-day Fitr was 2024.")
  (:title "ICOP: official first day of Hijri month in Algeria (Algeria), Hijri 1431 (2009)" :uri "https://astronomycenter.net/icop/muh31.html"
   :text "")
  (:title "ICOP: official first day of Hijri month in Algeria (Algeria), Hijri 1430 (2009)" :uri "https://astronomycenter.net/icop/muh30.html"
   :text "")
  (:title "ICOP: official first day of Hijri month in Algeria (Algeria), Hijri 1430 (2009)" :uri "https://astronomycenter.net/icop/raa30.html"
   :text "")
  (:title "ICOP: official first day of Hijri month in Algeria (Algeria), Hijri 1430 (2009)" :uri "https://astronomycenter.net/icop/shw30.html"
   :text "")
  (:title "timeanddate.com Algeria 2009 (2009)" :uri "https://www.timeanddate.com/holidays/algeria/2009"
   :text "")
  (:title "ICOP: official first day of Hijri month in Algeria (Algeria), Hijri 1433 (2011)" :uri "https://astronomycenter.net/icop/muh33.html"
   :text "")
  (:title "ICOP: official first day of Hijri month in Algeria (Algeria), Hijri 1432 (2011)" :uri "https://astronomycenter.net/icop/raa32.html"
   :text "")
  (:title "ICOP: official first day of Hijri month in Algeria (Algeria), Hijri 1432 (2011)" :uri "https://astronomycenter.net/icop/shw32.html"
   :text "")
  (:title "timeanddate.com Algeria 2011 (2011)" :uri "https://www.timeanddate.com/holidays/algeria/2011"
   :text "")
  (:title "ICOP: official first day of Hijri month in Algeria (Algeria), Hijri 1434 (2012)" :uri "https://astronomycenter.net/icop/muh34.html"
   :text "")
  (:title "ICOP: official first day of Hijri month in Algeria (Algeria), Hijri 1433 (2012)" :uri "https://astronomycenter.net/icop/raa33.html"
   :text "")
  (:title "ICOP: official first day of Hijri month in Algeria (Algeria), Hijri 1433 (2012)" :uri "https://astronomycenter.net/icop/shw33.html"
   :text "")
  (:title "timeanddate.com Algeria 2012 (2012)" :uri "https://www.timeanddate.com/holidays/algeria/2012"
   :text "")
  (:title "timeanddate.com Algeria 2016 (2016)" :uri "https://www.timeanddate.com/holidays/algeria/2016"
   :text "")
  (:title "APS: 50187-f%C3%AAte-du-mawlid-ennabawi-la-journ%C3%A9e-de-lundi-ch%C3%B4m%C3%A9e-et-pay%C3%A9e (2016)" :uri "https://web.archive.org/web/20161209174554/http://www.aps.dz/societe/50187-f%C3%AAte-du-mawlid-ennabawi-la-journ%C3%A9e-de-lundi-ch%C3%B4m%C3%A9e-et-pay%C3%A9e"
   :text "")
  (:title "ICOP: official first day of Hijri month in Algeria (Algeria), Hijri 1437 (2016)" :uri "https://astronomycenter.net/icop/shw37.html"
   :text "")
  (:title "APS: Algérie Presse Service - L&#039;Aid El Adha sera célébré lundi 12 septembre (2016)" :uri "https://web.archive.org/web/20160903161140/http://www.aps.dz/societe/46055-l-aid-el-adha-sera-c%C3%A9l%C3%A9br%C3%A9-lundi-12-septembre"
   :text "")
  (:title "APS: 63067-la-journee-du-vendredi-1er-moharram-1439-de-l-hegire-chomee-et-payee (2017)" :uri "https://web.archive.org/web/20171127203118/http://www.aps.dz/societe/63067-la-journee-du-vendredi-1er-moharram-1439-de-l-hegire-chomee-et-payee"
   :text "")
  (:title "APS: 63303-fete-de-achoura-la-journee-du-dimanche-chomee-et-payee-fonction-publique (2017)" :uri "https://web.archive.org/web/20170927141232/http://www.aps.dz/societe/63303-fete-de-achoura-la-journee-du-dimanche-chomee-et-payee-fonction-publique"
   :text "")
  (:title "ICOP: official first day of Hijri month in Algeria (Algeria), Hijri 1439 (2017)" :uri "https://astronomycenter.net/icop/raa39.html"
   :text "")
  (:title "ICOP: official first day of Hijri month in Algeria (Algeria), Hijri 1438 (2017)" :uri "https://astronomycenter.net/icop/shw38.html"
   :text "")
  (:title "ICOP: official first day of Hijri month in Algeria (Algeria), Hijri 1438 (2017)" :uri "https://astronomycenter.net/icop/hej38.html"
   :text "")
  (:title "APS: La journée du 1er Moharam chômée et payée (2018)" :uri "https://web.archive.org/web/20180910113334/http://www.aps.dz/societe/78290-la-journee-du-1er-moharam-chomee-et-payee"
   :text "")
  (:title "APS: Fête de Achoura: la journée du jeudi 20 septembre chômée et payée (Fonction publique) (2018)" :uri "https://web.archive.org/web/20180919084920/http://www.aps.dz/societe/78645-fete-de-achoura-la-journee-du-jeudi-20-septembre-chomee-et-payee-fonction-publique"
   :text "")
  (:title "ICOP: official first day of Hijri month in Algeria (Algeria), Hijri 1440 (2018)" :uri "https://astronomycenter.net/icop/raa40.html"
   :text "")
  (:title "ICOP: official first day of Hijri month in Algeria (Algeria), Hijri 1439 (2018)" :uri "https://astronomycenter.net/icop/shw39.html"
   :text "")
  (:title "ICOP: official first day of Hijri month in Algeria (Algeria), Hijri 1439 (2018)" :uri "https://astronomycenter.net/icop/hej39.html"
   :text "")
  (:title "ICOP: official first day of Hijri month in Algeria (Algeria), Hijri 1441 (2019)" :uri "https://astronomycenter.net/icop/muh41.html"
   :text "")
  (:title "APS: Le Mawlid ennabawi echarif célébré le 9 novembre (2019)" :uri "https://web.archive.org/web/20191030211444/http://www.aps.dz/societe/96487-le-mawlid-ennabawi-echarif-celebre-le-9-novembre"
   :text "")
  (:title "ICOP: official first day of Hijri month in Algeria (Algeria), Hijri 1440 (2019)" :uri "https://astronomycenter.net/icop/shw40.html"
   :text "")
  (:title "APS: Aïd El-Adha: les journées des 11 et 12 août chômées et payées (2019)" :uri "https://web.archive.org/web/20190808152009/http://www.aps.dz/societe/93000-aid-el-adha-les-journees-des-11-et-12-aout-chomees-et-payees"
   :text "")
  (:title "APS: La journée du 1er Moharam chômée et payée (2020)" :uri "https://web.archive.org/web/20200819125352/http://www.aps.dz/societe/108760-la-journee-du-1er-moharam-chomee-et-payee"
   :text "")
  (:title "ICOP: official first day of Hijri month in Algeria (Algeria), Hijri 1442 (2020)" :uri "https://astronomycenter.net/icop/muh42.html"
   :text "")
  (:title "APS: Fête du Mawlid Ennabawi: la journée de jeudi chômée et payée (2020)" :uri "https://web.archive.org/web/20201108124132/http://www.aps.dz/societe/111835-fete-du-mawlid-ennabawi-la-journee-de-jeudi-prochain-chomee-et-payee"
   :text "")
  (:title "ICOP: official first day of Hijri month in Algeria (Algeria), Hijri 1441 (2020)" :uri "https://astronomycenter.net/icop/shw41.html"
   :text "")
  (:title "APS: L’Aïd el Adha célébré le vendredi 31 juillet (2020)" :uri "https://web.archive.org/web/20200723103727/http://www.aps.dz/societe/107713-l-aid-el-adha-celebre-le-vendredi-31-juillet"
   :text "")
 )
 :days
 (
  (2009 1 1 "Premier janvier (jour de l'An grégorien) / رأس السنة الميلادية")
  (2009 1 7 "Achoura (10 Moharram) / عاشوراء")
  (2009 3 9 "El-Mawlid Ennabawi / المولد النبوي الشريف")
  (2009 5 1 "Premier mai (fête du Travail) / عيد العمال")
  (2009 7 5 "Cinq juillet (fête de l'Indépendance) / عيد الاستقلال")
  (2009 9 20 "Aïd El Fitr / عيد الفطر")
  (2009 9 21 "Aïd El Fitr / عيد الفطر")
  (2009 11 1 "Premier novembre (fête de la Révolution) / عيد الثورة")
  (2009 11 28 "Aïd El Adha / عيد الأضحى")
  (2009 11 29 "Aïd El Adha / عيد الأضحى")
  (2009 12 18 "Awal Moharram (jour de l'An de l'Hégire) / رأس السنة الهجرية")
  (2009 12 27 "Achoura (10 Moharram) / عاشوراء")
  (2011 1 1 "Premier janvier (jour de l'An grégorien) / رأس السنة الميلادية")
  (2011 2 15 "El-Mawlid Ennabawi / المولد النبوي الشريف")
  (2011 5 1 "Premier mai (fête du Travail) / عيد العمال")
  (2011 7 5 "Cinq juillet (fête de l'Indépendance) / عيد الاستقلال")
  (2011 8 30 "Aïd El Fitr / عيد الفطر")
  (2011 8 31 "Aïd El Fitr / عيد الفطر")
  (2011 11 1 "Premier novembre (fête de la Révolution) / عيد الثورة")
  (2011 11 7 "Aïd El Adha / عيد الأضحى")
  (2011 11 8 "Aïd El Adha / عيد الأضحى")
  (2011 11 26 "Awal Moharram (jour de l'An de l'Hégire) / رأس السنة الهجرية")
  (2011 12 5 "Achoura (10 Moharram) / عاشوراء")
  (2012 1 1 "Premier janvier (jour de l'An grégorien) / رأس السنة الميلادية")
  (2012 2 4 "El-Mawlid Ennabawi / المولد النبوي الشريف")
  (2012 5 1 "Premier mai (fête du Travail) / عيد العمال")
  (2012 7 5 "Cinq juillet (fête de l'Indépendance) / عيد الاستقلال")
  (2012 8 19 "Aïd El Fitr / عيد الفطر")
  (2012 8 20 "Aïd El Fitr / عيد الفطر")
  (2012 10 26 "Aïd El Adha / عيد الأضحى")
  (2012 10 27 "Aïd El Adha / عيد الأضحى")
  (2012 11 1 "Premier novembre (fête de la Révolution) / عيد الثورة")
  (2012 11 15 "Awal Moharram (jour de l'An de l'Hégire) / رأس السنة الهجرية")
  (2012 11 24 "Achoura (10 Moharram) / عاشوراء")
  (2016 1 1 "Premier janvier (jour de l'An grégorien) / رأس السنة الميلادية")
  (2016 5 1 "Premier mai (fête du Travail) / عيد العمال")
  (2016 7 5 "Cinq juillet (fête de l'Indépendance) / عيد الاستقلال")
  (2016 7 6 "Aïd El Fitr / عيد الفطر")
  (2016 7 7 "Aïd El Fitr / عيد الفطر")
  (2016 9 12 "Aïd El Adha / عيد الأضحى")
  (2016 9 13 "Aïd El Adha / عيد الأضحى")
  (2016 10 3 "Awal Moharram (jour de l'An de l'Hégire) / رأس السنة الهجرية")
  (2016 10 12 "Achoura (10 Moharram) / عاشوراء")
  (2016 11 1 "Premier novembre (fête de la Révolution) / عيد الثورة")
  (2016 12 12 "El-Mawlid Ennabawi / المولد النبوي الشريف")
  (2017 1 1 "Premier janvier (jour de l'An grégorien) / رأس السنة الميلادية")
  (2017 5 1 "Premier mai (fête du Travail) / عيد العمال")
  (2017 6 25 "Aïd El Fitr / عيد الفطر")
  (2017 6 26 "Aïd El Fitr / عيد الفطر")
  (2017 7 5 "Cinq juillet (fête de l'Indépendance) / عيد الاستقلال")
  (2017 9 1 "Aïd El Adha / عيد الأضحى")
  (2017 9 2 "Aïd El Adha / عيد الأضحى")
  (2017 9 22 "Awal Moharram (jour de l'An de l'Hégire) / رأس السنة الهجرية")
  (2017 10 1 "Achoura (10 Moharram) / عاشوراء")
  (2017 11 1 "Premier novembre (fête de la Révolution) / عيد الثورة")
  (2017 12 1 "El-Mawlid Ennabawi / المولد النبوي الشريف")
  (2018 1 1 "Premier janvier (jour de l'An grégorien) / رأس السنة الميلادية")
  (2018 1 12 "Amenzu n Yennayer (jour de l'An amazigh) / رأس السنة الأمازيغية")
  (2018 5 1 "Premier mai (fête du Travail) / عيد العمال")
  (2018 6 15 "Aïd El Fitr / عيد الفطر")
  (2018 6 16 "Aïd El Fitr / عيد الفطر")
  (2018 7 5 "Cinq juillet (fête de l'Indépendance) / عيد الاستقلال")
  (2018 8 21 "Aïd El Adha / عيد الأضحى")
  (2018 8 22 "Aïd El Adha / عيد الأضحى")
  (2018 9 11 "Awal Moharram (jour de l'An de l'Hégire) / رأس السنة الهجرية")
  (2018 9 20 "Achoura (10 Moharram) / عاشوراء")
  (2018 11 1 "Premier novembre (fête de la Révolution) / عيد الثورة")
  (2018 11 20 "El-Mawlid Ennabawi / المولد النبوي الشريف")
  (2019 1 1 "Premier janvier (jour de l'An grégorien) / رأس السنة الميلادية")
  (2019 1 12 "Amenzu n Yennayer (jour de l'An amazigh) / رأس السنة الأمازيغية")
  (2019 5 1 "Premier mai (fête du Travail) / عيد العمال")
  (2019 6 4 "Aïd El Fitr / عيد الفطر")
  (2019 6 5 "Aïd El Fitr / عيد الفطر")
  (2019 7 5 "Cinq juillet (fête de l'Indépendance) / عيد الاستقلال")
  (2019 8 11 "Aïd El Adha / عيد الأضحى")
  (2019 8 12 "Aïd El Adha / عيد الأضحى")
  (2019 9 1 "Awal Moharram (jour de l'An de l'Hégire) / رأس السنة الهجرية")
  (2019 9 10 "Achoura (10 Moharram) / عاشوراء")
  (2019 11 1 "Premier novembre (fête de la Révolution) / عيد الثورة")
  (2019 11 9 "El-Mawlid Ennabawi / المولد النبوي الشريف")
  (2020 1 1 "Premier janvier (jour de l'An grégorien) / رأس السنة الميلادية")
  (2020 1 12 "Amenzu n Yennayer (jour de l'An amazigh) / رأس السنة الأمازيغية")
  (2020 5 1 "Premier mai (fête du Travail) / عيد العمال")
  (2020 5 24 "Aïd El Fitr / عيد الفطر")
  (2020 5 25 "Aïd El Fitr / عيد الفطر")
  (2020 7 5 "Cinq juillet (fête de l'Indépendance) / عيد الاستقلال")
  (2020 7 31 "Aïd El Adha / عيد الأضحى")
  (2020 8 1 "Aïd El Adha / عيد الأضحى")
  (2020 8 20 "Awal Moharram (jour de l'An de l'Hégire) / رأس السنة الهجرية")
  (2020 8 29 "Achoura (10 Moharram) / عاشوراء")
  (2020 10 29 "El-Mawlid Ennabawi / المولد النبوي الشريف")
  (2020 11 1 "Premier novembre (fête de la Révolution) / عيد الثورة")
 ))
