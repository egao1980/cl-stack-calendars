;; Germany (Reformationstag 2017) public holidays 2017-2017: external gold for DE.
;; Regenerate: uv run --no-project --with holidays==0.109 python -I scripts/generate_mena_holiday_gold.py DE-SECONDARY
;; :days lists every holiday as (YEAR MONTH DAY NAME); any other day is not one.
(
 :country "DE"
 :generated "2026-11-28"
 :from 2017 :to 2017
 :note "LOWER CONFIDENCE. 2017: 31 October was a holiday in all 16 Länder; ten instruments read in the gazette (BW, BY, BE, HB, HH, HE, NI, NW; BB and SN permanent), RP, SL and SH only on secondary pages, MV, ST and TH (permanent) on secondary copies."
 :confidence :secondary
 :weekends ((nil 6 7))
 :sources
 (
  (:title "Einigungsvertrag vom 31. August 1990, Art. 2 Abs. 2 (Tag der Deutschen Einheit)" :uri "https://www.gesetze-im-internet.de/einigvtr/art_2.html"
   :text "Art. 2 Abs. 2: Der 3. Oktober ist als Tag der Deutschen Einheit gesetzlicher Feiertag.")
  (:title "Feiertagsgesetze der 16 Länder (the days common to all of them)" :uri "https://www.gesetze-bayern.de/Content/Document/BayFTG-1"
   :text "Neujahr, Karfreitag, Ostermontag, 1. Mai, Christi Himmelfahrt, Pfingstmontag, 1. und 2. Weihnachtstag in every Land.")
  (:title "Baden-Württemberg: Gesetz zur Änderung des Feiertagsgesetzes vom 25. November 2014 (§ 1a FTG)" :uri "https://www.landtag-bw.de/files/live/sites/LTBW/files/dokumente/gesetzblaetter/2014/GBl201421.pdf"
   :text "§ 1a: Das Reformationsfest am 31. Oktober 2017 wird einmalig als gesetzlicher Feiertag festgesetzt.")
  (:title "Bayern: Gesetz zur Änderung des Feiertagsgesetzes vom 12. April 2016 (Art. 1 Abs. 2a FTG)" :uri "https://www.verkuendung-bayern.de/gvbl/2016-50/"
   :text "Art. 1 Abs. 2a: Der Reformationstag am 31. Oktober 2017 ist gesetzlicher Feiertag.")
  (:title "Berlin: Gesetz zur Änderung des Gesetzes über die Sonn- und Feiertage vom 14. Oktober 2015" :uri "https://www.berlin.de/sen/justiz/service/gesetze-und-verordnungen/2015/ausgabe-nr-22-vom-24-10-2015-seite-377-bis-380.pdf"
   :text "§ 1 Abs. 1 Nr. 10: der 31. Oktober 2017 (500. Jahrestag der Reformation).")
  (:title "Bremen: Gesetz zur Änderung des Gesetzes über die Sonn- und Feiertage vom 21. Mai 2013" :uri "https://www.gesetzblatt.bremen.de/fastmedia/218/2013-05-31-gesetzblatt-2013-nr-33-aendg-sonn--und-feiertage.pdf"
   :text "§ 2 Abs. 1 Buchst. j: der 31. Oktober 2017 (500. Jahrestag der Reformation).")
  (:title "Hamburg: Fünfte Verordnung zum Feiertagsgesetz (Reformationstag 2017) vom 30. April 2013" :uri "https://www.luewu.de/wp-content/uploads/2025/08/GVBL_HH_2013-16.pdf"
   :text "§ 1: Der 31. Oktober 2017 (Reformationsjubiläum) wird zum Sonderfeiertag erklärt.")
  (:title "Hessen: Verordnung zur Bestimmung des Reformationstages 2017 zum gesetzlichen Feiertag vom 16. Oktober 2013" :uri "https://starweb.hessen.de/cache/GVBL/2013/00025.pdf"
   :text "§ 1: Der 31. Oktober 2017 wird für das Landesgebiet zum gesetzlichen Feiertag erklärt.")
  (:title "Niedersachsen: Gesetz zur Änderung des Niedersächsischen Gesetzes über die Feiertage vom 5. Juni 2013" :uri "https://www.niedersachsen.de/download/78453/Nds._GVBl._Nr._8_2013_vom_11.06.2013_S._123-134.pdf"
   :text "§ 2 Abs. 1 Satz 2: Der 31. Oktober 2017 ist als Reformationsjubiläum ... ein Feiertag.")
  (:title "Nordrhein-Westfalen: Gesetz über die Bestimmung des 31. Oktober 2017 als 500. Jahrestag der Reformation zum Feiertag vom 25. Juni 2015" :uri "https://recht.nrw.de/gvnrw/2015-s496"
   :text "Der 31. Oktober 2017 ist Feiertag im Sinne des § 1 Absatz 1 des Feiertagsgesetzes NW.")
  (:title "Rheinland-Pfalz: Landesverordnung zur Bestimmung des Reformationstages 2017 zum gesetzlichen Feiertag vom 27. November 2015" :uri "https://add.rlp.de/fileadmin/add/Abteilung_4/Ladenoeffnungsrecht/20161206_Ladenoeffnungsrecht_RD_zum_Vollzug_des_Ladenoeffnungsgesetzes.pdf"
   :text "Makes 31 October 2017 a gesetzlicher Feiertag.")
  (:title "Saarland: Verordnung zur Erklärung des 500. Reformationsjubiläums am 31. Oktober 2017 zum Feiertag vom 18. Juni 2014" :uri "https://lexaris.de/book/version/documentflat/head/1367604"
   :text "(1) Der Reformationstag am 31. Oktober 2017 wird zum Feiertag erklärt.")
  (:title "Schleswig-Holstein: Landesverordnung under § 2 Abs. 2 SFTG making 31 October 2017 a holiday (Cabinet decision announced 4 Nov 2014)" :uri "https://verkuendungsportal.schleswig-holstein.de/mm/gvobl_jahrgang_2014/GVOBl_2014.pdf"
   :text "Makes 31 October 2017 a gesetzlicher Feiertag.")
  (:title "Brandenburg: Feiertagsgesetz vom 21. März 1991, § 2 Abs. 1 (Reformationsfest, 31. Oktober)" :uri "https://bravors.brandenburg.de/gesetze/ftg_2015"
   :text "§ 2 Abs. 1: das Reformationsfest (31. Oktober).")
  (:title "Sachsen: Gesetz über Sonn- und Feiertage im Freistaat Sachsen vom 10. November 1992, § 1 Abs. 1" :uri "https://revosax.sachsen.de/vorschrift/3997-SaechsSFG"
   :text "§ 1 Abs. 1: Reformationsfest (31. Oktober).")
  (:title "Mecklenburg-Vorpommern: Feiertagsgesetz M-V (Neufassung vom 8. März 2002), § 2 Abs. 1" :uri "https://www.landesrecht-mv.de/bsmv/document/jlr-FTGMVrahmen"
   :text "§ 2 Abs. 1: der Reformationstag (31. Oktober).")
  (:title "Sachsen-Anhalt: Gesetz über die Sonn- und Feiertage vom 25. August 2004, § 2" :uri "https://www.landesrecht.sachsen-anhalt.de/bsst/document/jlr-FeiertGSTrahmen"
   :text "§ 2: der Reformationstag (31. Oktober).")
  (:title "Thüringen: Thüringer Feiertagsgesetz vom 21. Dezember 1994, § 2 Abs. 1" :uri "https://landesrecht.thueringen.de/bsth/document/jlr-FeiertGTHrahmen"
   :text "§ 2 Abs. 1: der Reformationstag.")
 )
 :days
 (
  (2017 1 1 "Neujahr")
  (2017 4 14 "Karfreitag")
  (2017 4 17 "Ostermontag")
  (2017 5 1 "Tag der Arbeit")
  (2017 5 25 "Christi Himmelfahrt")
  (2017 6 5 "Pfingstmontag")
  (2017 10 3 "Tag der Deutschen Einheit")
  (2017 10 31 "Reformationstag (500. Jahrestag der Reformation)")
  (2017 12 25 "1. Weihnachtstag")
  (2017 12 26 "2. Weihnachtstag")
 ))
