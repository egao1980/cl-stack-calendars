;; Madagascar (secondary sources) public holidays 2000-2023: external gold for MG.
;; Regenerate: uv run --no-project --with holidays==0.109 python -I scripts/generate_mena_holiday_gold.py MG-SECONDARY
;; :days lists every holiday as (YEAR MONTH DAY NAME); any other day is not one.
(
 :country "MG"
 :generated "2026-11-28"
 :from 2000 :to 2023
 :note "LOWER CONFIDENCE. 2001, 2004, 2005, 2010: only the one-off decrees found, the base list assumed from the 2006 decree; 2023: news only; 2000, 2002, 2003: no decree."
 :gaps (2006 2007 2008 2009 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022)
 :confidence :secondary
 :weekends ((nil 6 7))
 :sources
 (
  (:title "Décret n° 62-150 du 28 mars 1962 déterminant les modalités d'application du repos hebdomadaire, des jours fériés chômés et des jours fériés chômés et payés" :uri "http://www.ilo.org/dyn/natlex/natlex4.detail?p_lang=fr&p_isn=68159&p_country=MDG&p_count=490"
   :text "Framework decree on weekly rest and public holidays; cited by all yearly lists.")
  (:title "Loi n° 66-035 du 19 décembre 1966 déclarant la journée du 29 mars journée commémorative des morts des évènements de 1947" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2006-002-du-03-janvier-2006-fixant-la-liste-des-jours-feries-chomes-et-payes-au-titre-de-lannee-2006"
   :text "29 March: commemoration day of the 1947 dead.")
  (:title "Décret n° 99-145 du 24 février 1999 (modifiant le décret n° 90-073 du 21 février 1990) — 8 mars, journée internationale de la femme" :uri "https://textes.lexxika.com/droit-malagasy/decret-n99-145-du-24-fevrier-1999-modifiant-le-decret-n90-073-du-21-fevrier-1990-portant-declaration-de-la-journee-du-08-mars-journee-internationale-de-la-femme"
   :text "Declares 8 March (International Women's Day) a holiday. From 2007 the yearly lists say 'fériée, chômée et payée uniquement pour les femmes'.")
  (:title "Loi n° 2003-044 du 28 juillet 2004 portant Code du travail, art. 81 al. 3" :uri "https://www.ilo.int/dyn/natlex/natlex4.detail?p_lang=en&p_isn=70303&p_country=MDG&p_count=518"
   :text "The list of jours fériés, chômés et payés is fixed by decree (hence one decree per year).")
  (:title "Loi n° 2024-014 du 14 août 2024 portant Code du travail, art. 115" :uri "https://cnlegis.gov.mg/uploads/D2025-005-VF.pdf"
   :text "Replaces Loi 2003-044; art. 115 is the new basis for the yearly list.")
  (:title "Décret n° 2010-990 du 10 décembre 2010 déclarant le 11 décembre jour chômé et payé, journée de célébration de la Quatrième République" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2010-990-du-10-decembre-2010-declarant-le-11-decembre-jour-chome-et-paye-journee-de-celebration-de-la-quatrieme-republique"
   :text "11 December 2010 chômé et payé (promulgation of the 4th Republic constitution) 'et il en sera également ainsi pour le 11 décembre de chaque année'. Applied in the 2011-2014 lists; absent from every list from 2015 on (the yearly decrees are exhaustive: any other day needs its own decree).")
  (:title "Décret n° 2007-006 du 9 janvier 2007 fixant la liste des jours fériés, chômés et payés au titre de l'année 2007" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2007-006-du-09-janvier-2007-fixant-la-liste-des-jours-feries-chomes-et-payes-au-titre-de-lannee-2007"
   :text "Exhaustive list of jours fériés, chômés et payés for 2007; see MG_YEARS[2007].")
  (:title "Décret n° 2009-051 du 12 janvier 2009 fixant la liste des jours fériés, chômés et payés au titre de l'année 2009" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2009-051-du-12-janvier-2009-fixant-la-liste-des-jours-feries-chomes-et-payes-au-titre-de-lannee-2009"
   :text "Exhaustive list of jours fériés, chômés et payés for 2009; see MG_YEARS[2009].")
  (:title "Décret n° 2011-012 du 11 janvier 2011 fixant la liste des jours fériés, chômés et payés au titre de l'année 2011" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2011-012-du-11-janvier-2011-fixant-la-liste-des-jours-feries-chomes-et-payes-au-titre-de-lannee-2011"
   :text "Exhaustive list of jours fériés, chômés et payés for 2011; see MG_YEARS[2011].")
  (:title "Décret n° 2012-046 du 17 janvier 2012 fixant la liste des jours fériés, chômés et payés au titre de l'année 2012" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2012-046-du-17-janvier-2012-fixant-la-liste-des-jours-feries-chomes-et-payes-au-titre-de-lannee-2012"
   :text "Exhaustive list of jours fériés, chômés et payés for 2012; see MG_YEARS[2012].")
  (:title "Décret n° 2013-056 du 29 janvier 2013 fixant la liste des jours fériés, chômés et payés au titre de l'année 2013" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2013-056-du-29-janvier-2013-fixant-la-liste-des-jours-feries-chomes-et-payes-au-titre-de-lannee-2013"
   :text "Exhaustive list of jours fériés, chômés et payés for 2013; see MG_YEARS[2013].")
  (:title "Décret n° 2014-042 du 21 janvier 2014 fixant la liste des jours fériés, chômés et payés au titre de l'année 2014" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2014-042-du-21-janvier-2014-fixant-la-liste-des-jours-feries-chomes-et-payes-au-titre-de-lannee-2014"
   :text "Exhaustive list of jours fériés, chômés et payés for 2014; see MG_YEARS[2014].")
  (:title "Décret n° 2015-055 du 3 février 2015 fixant la liste des jours fériés, chômés et payés au titre de l'année 2015" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2015-055-du-03-fevrier-2015-fixant-la-liste-des-jours-feries-chomes-et-payes-au-titre-de-lannee-2015"
   :text "Exhaustive list of jours fériés, chômés et payés for 2015; see MG_YEARS[2015].")
  (:title "Décret n° 2016-058 du 26 janvier 2016 fixant la liste des jours fériés, chômés et payés au titre de l'année 2016" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2016-058-du-26-janvier-2016-fixant-la-liste-des-jours-feries-chomes-et-payes-au-titre-de-lannee-2016"
   :text "Exhaustive list of jours fériés, chômés et payés for 2016; see MG_YEARS[2016].")
  (:title "Décret n° 2017-065 du 31 janvier 2017 fixant la liste des jours fériés, chômés et payés au titre de l'année 2017" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2017-065-du-31-janvier-2016-fixant-la-liste-des-jours-feries-chomes-et-payes-au-titre-de-lannee-2017"
   :text "Exhaustive list of jours fériés, chômés et payés for 2017; see MG_YEARS[2017].")
  (:title "Décret n° 2018-090 du 30 janvier 2018 fixant la liste des jours fériés, chômés et payés au titre de l'année 2018" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2018-090-du-30-janvier-2018-fixant-la-liste-des-jours-feries-chomes-et-payes-au-titre-de-lannee-2018"
   :text "Exhaustive list of jours fériés, chômés et payés for 2018; see MG_YEARS[2018].")
  (:title "Décret n° 2019-191 du 22 février 2019 fixant la liste des jours fériés, chômés et payés au titre de l'année 2019" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2019-191-du-22-fevrier-2019-fixant-la-liste-des-jours-feries-chomes-et-payes-au-titre-de-lannee-2019"
   :text "Exhaustive list of jours fériés, chômés et payés for 2019; see MG_YEARS[2019].")
  (:title "Décret n° 2020-014 du 15 janvier 2020 fixant la liste des jours fériés, chômés et payés au titre de l'année 2020" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2020-014-du-15-janvier-2020-fixant-la-liste-des-jours-feries-chomes-et-payes-au-titre-de-lannee-2020"
   :text "Exhaustive list of jours fériés, chômés et payés for 2020; see MG_YEARS[2020].")
  (:title "Décret n° 2022-002 du 5 janvier 2022 fixant la liste des jours fériés, chômés et payés au titre de l'année 2022" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2022-002-du-05-janvier-2022-fixant-la-liste-des-jours-feries-chomes-et-payes-au-titre-de-lannee-2022"
   :text "Exhaustive list of jours fériés, chômés et payés for 2022; see MG_YEARS[2022].")
  (:title "Décret n° 2024-108 du 31 janvier 2024 fixant la liste des jours fériés, chômés et payés au titre de l'année 2024" :uri "https://cnlegis.gov.mg/uploads/D2024-108-VF.pdf"
   :text "Exhaustive list of jours fériés, chômés et payés for 2024; see MG_YEARS[2024].")
  (:title "Décret n° 2026-006 du 8 janvier 2026 fixant la liste des jours fériés, chômés et payés au titre de l'année 2026" :uri "https://cnlegis.gov.mg/uploads/D2026-006-VF.pdf"
   :text "Exhaustive list of jours fériés, chômés et payés for 2026; see MG_YEARS[2026].")
  (:title "Décret n° 2001-1109 du 19 décembre 2001 déclarant fériées, chômées et payées les journées des lundis 24 et 31 décembre 2001 (2001)" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2001-1109-du-19-decembre-2001-declarant-feriees-chomees-et-payees-les-journees-des-lundis-24-et-31-decembre-2001-au-titre-de-la-celebration-de-noel-et-du-nouvel-an-2002"
   :text "")
  (:title "Décret n° 2004-1126 du 14 décembre 2004 déclarant chômées et payées les journées du 24 et du 31 décembre 2004 (2004)" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2004-1126-du-14-decembre-2004-declarant-chomees-et-payees-les-journees-du-24-et-du-31-decembre-2004"
   :text "")
  (:title "Décret n° 2005-721 du 25 octobre 2005 déclarant la journée du 31 octobre 2005 fériée, chômée et payée (2005)" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2005-721-du-25-octobre-2005-declarant-la-journee-du-31-octobre-2005-feriee-chomee-et-payee"
   :text "")
  (:title "Décret n° 2007-213 du 6 mars 2007 déclarant chômée et payée la journée du mercredi 4 avril 2007 (référendum constitutionnel) (2007)" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2007-213-du-06-mars-2007-declarant-chomee-et-payee-la-journee-du-mercredi-4-avril-2007-jour-de-la-tenue-du-referendum-relatif-a-la-revision-de-la-constitution"
   :text "")
  (:title "Décret n° 2007-730 du 25 juillet 2007 déclarant la journée du 9 août 2007 fériée, chômée et payée (ouverture des 7es Jeux des Îles) (2007)" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2007-730-du-25-juillet-2007-declarant-la-journee-du-9-aout-2007-feriee-chomee-et-payee"
   :text "")
  (:title "Décret n° 2007-880 du 8 octobre 2007 déclarant chômée et payée la journée du mercredi 12 décembre 2007 (élections communales) (2007)" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2007-880-du-08-octobre-2007-declarant-chomee-et-payee-la-journee-du-mercredi-12-decembre-2007-jour-de-la-tenue-des-elections-des-membres-des-conseils-et-des-maires-des-communes-urbaines"
   :text "")
  (:title "Décret n° 2011-260 du 31 mai 2011 déclarant chômée et payée la journée du 3 juin 2011 (2011)" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2011-260-du-31-mai-2011-declarant-chomee-et-payee-la-journee-du-03-juin-2011"
   :text "")
  (:title "Décret n° 2012-630 du 13 juin 2012 déclarant fériée, chômée et payée la journée du 25 juin 2012 (2012)" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2012-630-du-13-juin-2012-declarant-feriee-chomee-et-payee-la-journee-du-25-juin-2012"
   :text "")
  (:title "Décret n° 2012-960 du 30 octobre 2012 déclarant chômée et payée la journée du 2 novembre 2012 (2012)" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2012-960-du-30-octobre-2012-declarant-chomee-et-payee-la-journee-du-02-novembre-2012"
   :text "")
  (:title "Décret n° 2012-1169 du 26 décembre 2012 déclarant chômée et payée la journée du 31 décembre 2012 (2012)" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2012-1169-du-26-decembre-2012-declarant-chomee-et-payee-la-journee-du-31-decembre-2012"
   :text "")
  (:title "Décret n° 2013-159 du 12 mars 2013 déclarant chômées et payées les journées des élections (24 juillet et 25 septembre 2013) (2013)" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2013-159-du-12-mars-2013-declarant-chomees-et-payees-les-journees-de-la-tenue-de-lelection-du-premier-president-de-la-quatrieme-republique-et-des-premieres-elections-des-membres-de-l"
   :text "")
  (:title "Décret n° 2013-702 du 10 septembre 2013 déclarant chômées et payées les journées des élections (25 octobre et 20 décembre 2013) (2013)" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2013-702-du-10-septembre-2013-declarant-chomees-et-payees-les-journees-de-la-tenue-de-lelection-du-premier-president-de-la-quatrieme-republique-et-des-premieres-elections-des-membres-d"
   :text "")
  (:title "Décret n° 2014-1571 du 30 septembre 2014 modifiant le décret n° 2014-042 (14 octobre redevient jour ouvrable) (2014)" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2014-1571-du-30-septembre-2014-modifiant-certaines-dispositions-du-decret-n-2014-042-fixant-la-liste-des-jours-feries-chomes-et-payes-a-titre-de-lannee-2014"
   :text "")
  (:title "Décret n° 2015-524 du 24 mars 2015 portant additif du décret n° 2015-055 (Id al-Fitr 18 juillet, Id al-Adha 24 septembre 2015) (2015)" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2015-524-du-24-mars-2015-portant-additif-du-decret-n2015-055-du-03-fevrier-2015-fixant-la-liste-des-jours-feries-chomes-et-payes-au-titre-de-lannee-2015"
   :text "")
  (:title "Décret n° 2019-1065 du 28 mai 2019 modifiant l'article premier du décret n° 2019-191 (Id al-Fitr 5 juin; Eid days for everyone) (2019)" :uri "https://textes.lexxika.com/droit-malagasy/decret-n2019-1065-du-28-mai-2019-modifiant-certaines-dispositions-de-larticle-premier-du-decretn-2019-191-du-22-fevrier-2019-fixant-la-liste-des-jours-ferieschomes-et-payes-au-titre-de"
   :text "")
  (:title "L'Express de Madagascar, 'Travail - Vendredi sera un jour férié' (29 Jul 2020) (2020)" :uri "https://lexpress.mg/29/07/2020/travail-vendredi-sera-un-jour-ferie/"
   :text "")
  (:title "L'Express de Madagascar, 'Fête musulmane - Le vendredi 21 avril fixé jour férié et chômé' (18 Apr 2023) (2023)" :uri "https://lexpress.mg/18/04/2023/fete-musulmane-le-vendredi-21-avril-fixe-jour-ferie-et-chome/"
   :text "")
 )
 :days
 (
  (2000 1 1 "Jour de l'An")
  (2000 3 8 "Journée internationale de la Femme (fériée et chômée uniquement pour les femmes from 2007)")
  (2000 3 29 "Journée commémorative des morts des évènements de 1947")
  (2000 4 23 "Pâques")
  (2000 4 24 "Lundi de Pâques")
  (2000 5 1 "Fête du Travail")
  (2000 6 1 "Ascension")
  (2000 6 11 "Pentecôte")
  (2000 6 12 "Lundi de Pentecôte")
  (2000 6 26 "Fête nationale de l'Indépendance")
  (2000 8 15 "Assomption")
  (2000 11 1 "Toussaint")
  (2000 12 25 "Noël")
  (2001 1 1 "Jour de l'An")
  (2001 3 8 "Journée internationale de la Femme (uniquement pour les femmes)")
  (2001 3 29 "Journée commémorative des morts des évènements de 1947")
  (2001 4 15 "Pâques")
  (2001 4 16 "Lundi de Pâques")
  (2001 5 1 "Fête du Travail")
  (2001 5 24 "Ascension")
  (2001 6 3 "Pentecôte")
  (2001 6 4 "Lundi de Pentecôte")
  (2001 6 26 "Fête nationale de l'Indépendance")
  (2001 8 15 "Assomption")
  (2001 11 1 "Toussaint")
  (2001 12 24 "Veille de Noël (décret 2001-1109)")
  (2001 12 25 "Noël")
  (2001 12 31 "Veille du Nouvel An (décret 2001-1109)")
  (2002 1 1 "Jour de l'An")
  (2002 3 8 "Journée internationale de la Femme (fériée et chômée uniquement pour les femmes from 2007)")
  (2002 3 29 "Journée commémorative des morts des évènements de 1947")
  (2002 3 31 "Pâques")
  (2002 4 1 "Lundi de Pâques")
  (2002 5 1 "Fête du Travail")
  (2002 5 9 "Ascension")
  (2002 5 19 "Pentecôte")
  (2002 5 20 "Lundi de Pentecôte")
  (2002 6 26 "Fête nationale de l'Indépendance")
  (2002 8 15 "Assomption")
  (2002 11 1 "Toussaint")
  (2002 12 25 "Noël")
  (2003 1 1 "Jour de l'An")
  (2003 3 8 "Journée internationale de la Femme (fériée et chômée uniquement pour les femmes from 2007)")
  (2003 3 29 "Journée commémorative des morts des évènements de 1947")
  (2003 4 20 "Pâques")
  (2003 4 21 "Lundi de Pâques")
  (2003 5 1 "Fête du Travail")
  (2003 5 29 "Ascension")
  (2003 6 8 "Pentecôte")
  (2003 6 9 "Lundi de Pentecôte")
  (2003 6 26 "Fête nationale de l'Indépendance")
  (2003 8 15 "Assomption")
  (2003 11 1 "Toussaint")
  (2003 12 25 "Noël")
  (2004 1 1 "Jour de l'An")
  (2004 3 8 "Journée internationale de la Femme")
  (2004 3 29 "Journée commémorative des morts des évènements de 1947")
  (2004 4 11 "Pâques")
  (2004 4 12 "Lundi de Pâques")
  (2004 5 1 "Fête du Travail")
  (2004 5 20 "Ascension")
  (2004 5 30 "Pentecôte")
  (2004 5 31 "Lundi de Pentecôte")
  (2004 6 26 "Fête nationale de l'Indépendance")
  (2004 8 15 "Assomption")
  (2004 11 1 "Toussaint")
  (2004 12 24 "Journée chômée et payée (décret 2004-1126)")
  (2004 12 25 "Noël")
  (2004 12 31 "Journée chômée et payée (décret 2004-1126)")
  (2005 1 1 "Jour de l'An")
  (2005 3 8 "Journée internationale de la Femme")
  (2005 3 27 "Pâques")
  (2005 3 28 "Lundi de Pâques")
  (2005 3 29 "Journée commémorative des morts des évènements de 1947")
  (2005 5 1 "Fête du Travail")
  (2005 5 5 "Ascension")
  (2005 5 15 "Pentecôte")
  (2005 5 16 "Lundi de Pentecôte")
  (2005 6 26 "Fête nationale de l'Indépendance")
  (2005 8 15 "Assomption")
  (2005 10 31 "Journée fériée, chômée et payée (décret 2005-721; bridge before Toussaint)")
  (2005 11 1 "Toussaint")
  (2005 12 25 "Noël")
  (2010 1 1 "Jour de l'An")
  (2010 3 8 "Journée internationale de la Femme (uniquement pour les femmes)")
  (2010 3 29 "Journée commémorative des morts des évènements de 1947")
  (2010 4 4 "Pâques")
  (2010 4 5 "Lundi de Pâques")
  (2010 5 1 "Fête du Travail")
  (2010 5 13 "Ascension")
  (2010 5 23 "Pentecôte")
  (2010 5 24 "Lundi de Pentecôte")
  (2010 6 26 "Fête nationale de l'Indépendance")
  (2010 8 15 "Assomption")
  (2010 11 1 "Toussaint")
  (2010 12 11 "Promulgation de la Constitution de la Quatrième République (décret 2010-990)")
  (2010 12 25 "Noël")
  (2023 1 1 "Jour de l'An")
  (2023 3 8 "Journée internationale de la Femme (uniquement pour les femmes)")
  (2023 3 29 "Journée commémorative des morts des évènements de 1947")
  (2023 4 9 "Pâques")
  (2023 4 10 "Lundi de Pâques")
  (2023 4 21 "Eid al-Fitr (ministère du Travail)")
  (2023 5 1 "Fête du Travail")
  (2023 5 18 "Ascension")
  (2023 5 28 "Pentecôte")
  (2023 5 29 "Lundi de Pentecôte")
  (2023 6 26 "Fête nationale de l'Indépendance")
  (2023 6 28 "Eid al-Adha (communiqué ministère du Travail du 21 juin 2023, per GEM listing)")
  (2023 8 15 "Assomption")
  (2023 11 1 "Toussaint")
  (2023 12 25 "Noël")
 ))
