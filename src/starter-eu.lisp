(in-package #:cl-stack-calendars)

;;;; EU-27 national holiday calendars — statutory common / federal sets.
;;;; Research window [max(1900, formation), present] with :FROM/:TO eras.
;;;; No automatic weekend in-lieu unless a cited statute says so (most do not;
;;;; TARGET covers ECB settlement). Länder / comunidades / regions add extras
;;;; via COMPOSITE-CALENDAR or country-calendar corpus.

(defun %saturday-in-range (year month-from day-from month-to day-to)
  "First Saturday on or after YEAR-MONTH-FROM-DAY-FROM up to MONTH-TO-DAY-TO."
  (loop for rd from (date-rd (make-date year month-from day-from))
          to (date-rd (make-date year month-to day-to))
        for date = (date-from-rd rd)
        when (= (date-day-of-week date) 6)
          return date))

(defun %first-monday-on-or-after (date)
  (loop for d = date then (+ d 1)
        when (= (date-day-of-week d) 1) return d))

;;; --- Existing major EU (upgraded eras) --------------------------------

;;; Germany — bundeseinheitliche Feiertage (common to all Länder). Floor 1949.
(define-calendar germany-holidays-calendar (:register "DE")
  (:fixed "Neujahr" 1 1 :from 1949
   :authority "Feiertagsgesetze der Länder / bundeseinheitlich")
  (:easter "Karfreitag" -2 :from 1949
   :authority "Feiertagsgesetze der Länder (Karfreitag)")
  (:easter "Ostermontag" 1 :from 1949
   :authority "Feiertagsgesetze der Länder (Ostermontag)")
  (:fixed "Tag der Arbeit" 5 1 :from 1949
   :authority "Feiertagsgesetze der Länder (1. Mai)")
  (:easter "Christi Himmelfahrt" 39 :from 1949
   :authority "Feiertagsgesetze der Länder (Christi Himmelfahrt)")
  (:easter "Pfingstmontag" 50 :from 1949
   :authority "Feiertagsgesetze der Länder (Pfingstmontag)")
  (:fixed "Tag der Deutschen Einheit" 6 17 :from 1954 :to 1990
   :authority "17. Juni — Tag der deutschen Einheit (BRD, Aufstand 1953; bis Wiedervereinigung)")
  (:fixed "Tag der Deutschen Einheit" 10 3 :from 1990
   :authority "Einigungsvertrag Art. 2 Abs. 2; Tag der Deutschen Einheit (3. Oktober)")
  (:fixed "1. Weihnachtstag" 12 25 :from 1949
   :authority "Feiertagsgesetze der Länder")
  (:fixed "2. Weihnachtstag" 12 26 :from 1949
   :authority "Feiertagsgesetze der Länder"))

;;; France — Code du travail L.3133-1; research window from 1900 with statute eras.
(define-calendar france-holidays-calendar (:register "FR")
  (:fixed "Jour de l'an" 1 1 :from 1900
   :authority "Code du travail L.3133-1")
  (:easter "Lundi de Pâques" 1 :from 1900
   :authority "Code du travail L.3133-1")
  (:fixed "Fête du Travail" 5 1 :from 1919
   :authority "Loi du 23 avril 1919 — 1er mai chômé; Code du travail L.3133-1")
  (:fixed "Victoire 1945" 5 8 :from 1953 :to 1958
   :authority "Loi 1953 — Victoire; abrogée 1959–1981")
  (:fixed "Victoire 1945" 5 8 :from 1982
   :authority "Loi 1981/82 — Victoire 8 mai rétablie; Code du travail L.3133-1")
  (:easter "Ascension" 39 :from 1900
   :authority "Code du travail L.3133-1")
  (:easter "Lundi de Pentecôte" 50 :from 1900
   :authority "Code du travail L.3133-1")
  (:fixed "Fête nationale" 7 14 :from 1900
   :authority "Loi du 6 juillet 1880 — Fête nationale; Code du travail L.3133-1")
  (:fixed "Assomption" 8 15 :from 1900
   :authority "Code du travail L.3133-1")
  (:fixed "Toussaint" 11 1 :from 1900
   :authority "Code du travail L.3133-1")
  (:fixed "Armistice 1918" 11 11 :from 1922
   :authority "Loi du 24 octobre 1922 — Armistice; Code du travail L.3133-1")
  (:fixed "Noël" 12 25 :from 1900
   :authority "Code du travail L.3133-1"))

;;; Italy — L. 260/1949 e successive.
(define-calendar italy-holidays-calendar (:register "IT")
  (:fixed "Capodanno" 1 1 :from 1900 :authority "L. 260/1949 e successive")
  (:fixed "Epifania" 1 6 :from 1900 :to 1976
   :authority "Epifania — festività fino alla riforma 1977")
  (:fixed "Epifania" 1 6 :from 1985
   :authority "L. 54/1977 soppressa; ripristinata L. 144/1985")
  (:easter "Pasquetta" 1 :from 1900 :authority "L. 260/1949 e successive")
  (:fixed "Liberazione" 4 25 :from 1946
   :authority "Anniversario della Liberazione")
  (:fixed "Festa del Lavoro" 5 1 :from 1900 :authority "L. 260/1949 e successive")
  (:fixed "Festa della Repubblica" 6 2 :from 1946
   :authority "Festa della Repubblica (2 giugno)")
  (:fixed "Ferragosto" 8 15 :from 1900 :authority "L. 260/1949 e successive")
  (:fixed "Tutti i Santi" 11 1 :from 1900 :authority "L. 260/1949 e successive")
  (:fixed "Immacolata" 12 8 :from 1900 :authority "L. 260/1949 e successive")
  (:fixed "Natale" 12 25 :from 1900 :authority "L. 260/1949 e successive")
  (:fixed "Santo Stefano" 12 26 :from 1900 :authority "L. 260/1949 e successive"))

;;; Spain — fiestas laborales de ámbito nacional (BOE).
(define-calendar spain-holidays-calendar (:register "ES")
  (:fixed "Año Nuevo" 1 1 :from 1900 :authority "Estatuto de los Trabajadores / BOE")
  (:fixed "Epifanía del Señor" 1 6 :from 1900 :authority "BOE fiestas laborales nacionales")
  (:easter "Viernes Santo" -2 :from 1900 :authority "BOE fiestas laborales nacionales")
  (:fixed "Fiesta del Trabajo" 5 1 :from 1900 :authority "BOE fiestas laborales nacionales")
  (:fixed "Asunción de la Virgen" 8 15 :from 1900 :authority "BOE fiestas laborales nacionales")
  (:fixed "Fiesta Nacional de España" 10 12 :from 1987
   :authority "Ley 18/1987 — Fiesta Nacional (12 de octubre)")
  (:fixed "Día de la Hispanidad" 10 12 :from 1900 :to 1986
   :authority "Fiesta de la Raza / Hispanidad until Ley 18/1987 rename")
  (:fixed "Todos los Santos" 11 1 :from 1900 :authority "BOE fiestas laborales nacionales")
  (:fixed "Día de la Constitución" 12 6 :from 1978
   :authority "Constitución 1978 — fiesta nacional")
  (:fixed "Inmaculada Concepción" 12 8 :from 1900 :authority "BOE fiestas laborales nacionales")
  (:fixed "Navidad" 12 25 :from 1900 :authority "BOE fiestas laborales nacionales"))

;;; Netherlands — algemeen erkende feestdagen.
(define-calendar netherlands-holidays-calendar (:register "NL")
  (:fixed "Nieuwjaarsdag" 1 1 :from 1900 :authority "Algemeen erkende feestdagen")
  (:easter "Tweede paasdag" 1 :from 1900 :authority "Algemeen erkende feestdagen")
  (:fixed "Koninginnedag" 4 30 :from 1949 :to 2013
   :authority "Koninginnedag (30 april) tot 2013")
  (:computed "Koningsdag"
   (lambda (y)
     (let ((d (make-date y 4 27)))
       (if (= (date-day-of-week d) 7) (make-date y 4 26) d)))
   :from 2014
   :authority "Koningsdag (27 april; indien zondag → 26 april)")
  (:fixed "Bevrijdingsdag" 5 5 :from 1945
   :authority "Bevrijdingsdag (nationale feestdag)")
  (:easter "Hemelvaartsdag" 39 :from 1900 :authority "Algemeen erkende feestdagen")
  (:easter "Tweede pinksterdag" 50 :from 1900 :authority "Algemeen erkende feestdagen")
  (:fixed "Eerste kerstdag" 12 25 :from 1900 :authority "Algemeen erkende feestdagen")
  (:fixed "Tweede kerstdag" 12 26 :from 1900 :authority "Algemeen erkende feestdagen"))

;;; Belgium — wettelijke feestdagen (fédéral).
(define-calendar belgium-holidays-calendar (:register "BE")
  (:fixed "Nieuwjaar / Nouvel An" 1 1 :from 1900 :authority "Wettelijke feestdagen / jours fériés légaux")
  (:easter "Paasmaandag / Lundi de Pâques" 1 :from 1900 :authority "Wettelijke feestdagen")
  (:fixed "Dag van de Arbeid / Fête du Travail" 5 1 :from 1900 :authority "Wettelijke feestdagen")
  (:easter "O.H. Hemelvaart / Ascension" 39 :from 1900 :authority "Wettelijke feestdagen")
  (:easter "Pinkstermaandag / Lundi de Pentecôte" 50 :from 1900 :authority "Wettelijke feestdagen")
  (:fixed "Nationale feestdag / Fête nationale" 7 21 :from 1831
   :authority "Nationale feestdag 21 juli")
  (:fixed "OLV Hemelvaart / Assomption" 8 15 :from 1900 :authority "Wettelijke feestdagen")
  (:fixed "Allerheiligen / Toussaint" 11 1 :from 1900 :authority "Wettelijke feestdagen")
  (:fixed "Wapenstilstand / Armistice" 11 11 :from 1919 :authority "Wettelijke feestdagen")
  (:fixed "Kerstmis / Noël" 12 25 :from 1900 :authority "Wettelijke feestdagen"))

;;; Austria — Arbeitsruhegesetz (Second Republic floor 1955).
(define-calendar austria-holidays-calendar (:register "AT")
  (:fixed "Neujahr" 1 1 :from 1955 :authority "Arbeitsruhegesetz (ARG)")
  (:fixed "Heilige Drei Könige" 1 6 :from 1955 :authority "Arbeitsruhegesetz")
  (:easter "Ostermontag" 1 :from 1955 :authority "Arbeitsruhegesetz")
  (:fixed "Staatsfeiertag" 5 1 :from 1955 :authority "Arbeitsruhegesetz")
  (:easter "Christi Himmelfahrt" 39 :from 1955 :authority "Arbeitsruhegesetz")
  (:easter "Pfingstmontag" 50 :from 1955 :authority "Arbeitsruhegesetz")
  (:easter "Fronleichnam" 60 :from 1955 :authority "Arbeitsruhegesetz")
  (:fixed "Mariä Himmelfahrt" 8 15 :from 1955 :authority "Arbeitsruhegesetz")
  (:fixed "Nationalfeiertag" 10 26 :from 1955 :authority "Arbeitsruhegesetz")
  (:fixed "Allerheiligen" 11 1 :from 1955 :authority "Arbeitsruhegesetz")
  (:fixed "Mariä Empfängnis" 12 8 :from 1955 :authority "Arbeitsruhegesetz")
  (:fixed "Christtag" 12 25 :from 1955 :authority "Arbeitsruhegesetz")
  (:fixed "Stefanitag" 12 26 :from 1955 :authority "Arbeitsruhegesetz"))

;;; Poland — Ustawa o dniach wolnych od pracy (1951 + amendments).
(define-calendar poland-holidays-calendar (:register "PL")
  (:fixed "Nowy Rok" 1 1 :from 1918 :authority "Ustawa o dniach wolnych od pracy")
  (:fixed "Święto Trzech Króli" 1 6 :from 2011
   :authority "Nowelizacja 2010 — Trzech Króli przywrócone od 2011")
  (:easter "Niedziela Wielkanocna" 0 :from 1918 :authority "Ustawa o dniach wolnych od pracy")
  (:easter "Poniedziałek Wielkanocny" 1 :from 1918 :authority "Ustawa o dniach wolnych od pracy")
  (:fixed "Święto Pracy" 5 1 :from 1918 :authority "Ustawa o dniach wolnych od pracy")
  (:fixed "Święto Konstytucji 3 Maja" 5 3 :from 1990
   :authority "Przywrócone 1990 — Święto Narodowe Trzeciego Maja")
  (:easter "Boże Ciało" 60 :from 1918 :authority "Ustawa o dniach wolnych od pracy")
  (:fixed "Wniebowzięcie NMP" 8 15 :from 1918 :authority "Ustawa o dniach wolnych od pracy")
  (:fixed "Wszystkich Świętych" 11 1 :from 1918 :authority "Ustawa o dniach wolnych od pracy")
  (:fixed "Narodowe Święto Niepodległości" 11 11 :from 1989
   :authority "Przywrócone 1989 — 11 listopada")
  (:fixed "Wigilia Bożego Narodzenia" 12 24 :from 2025
   :authority "Nowelizacja 2024 — Wigilia dniem wolnym od 2025")
  (:fixed "Boże Narodzenie" 12 25 :from 1918 :authority "Ustawa o dniach wolnych od pracy")
  (:fixed "Boże Narodzenie (drugi dzień)" 12 26 :from 1918 :authority "Ustawa o dniach wolnych od pracy"))

;;; Sweden — Lag (1989:253) om allmänna helgdagar.
(define-calendar sweden-holidays-calendar (:register "SE")
  (:fixed "Nyårsdagen" 1 1 :from 1900 :authority "Lag (1989:253) om allmänna helgdagar")
  (:fixed "Trettondedag jul" 1 6 :from 1900 :authority "Lag om allmänna helgdagar")
  (:easter "Långfredagen" -2 :from 1900 :authority "Lag om allmänna helgdagar")
  (:easter "Påskdagen" 0 :from 1900 :authority "Lag om allmänna helgdagar")
  (:easter "Annandag påsk" 1 :from 1900 :authority "Lag om allmänna helgdagar")
  (:fixed "Första maj" 5 1 :from 1900 :authority "Lag om allmänna helgdagar")
  (:easter "Kristi himmelsfärdsdag" 39 :from 1900 :authority "Lag om allmänna helgdagar")
  (:easter "Pingstdagen" 49 :from 1900 :authority "Lag om allmänna helgdagar")
  (:fixed "Nationaldagen" 6 6 :from 2005
   :authority "Lag om allmänna helgdagar — Sveriges nationaldag från 2005")
  (:computed "Midsommardagen"
   (lambda (y) (%saturday-in-range y 6 20 6 26))
   :from 1900
   :authority "Lag om allmänna helgdagar (lördagen 20–26 juni)")
  (:computed "Alla helgons dag"
   (lambda (y) (%saturday-in-range y 10 31 11 6))
   :from 1953
   :authority "Lag om allmänna helgdagar (lördagen mellan 31 okt och 6 nov)")
  (:fixed "Juldagen" 12 25 :from 1900 :authority "Lag om allmänna helgdagar")
  (:fixed "Annandag jul" 12 26 :from 1900 :authority "Lag om allmänna helgdagar"))

;;; --- Remaining EU-27 --------------------------------------------------

;;; Romania — Codul muncii / lege zile libere (Orthodox Easter).
(define-calendar romania-holidays-calendar (:register "RO")
  (:fixed "Anul Nou" 1 1 :from 1900 :authority "Zile libere legale")
  (:fixed "Anul Nou" 1 2 :from 1900 :authority "A doua zi de Anul Nou")
  (:fixed "Boboteaza" 1 6 :from 2024
   :authority "Lege — Boboteaza zi liberă din 2024")
  (:fixed "Sfântul Ion" 1 7 :from 2024
   :authority "Lege — Sfântul Ion Botezătorul zi liberă din 2024")
  (:fixed "Ziua Unirii Principatelor Române" 1 24 :from 2016
   :authority "Ziua Unirii — zi liberă din 2016")
  (:easter "Vinerea Mare" -2 :orthodox t :from 2018
   :authority "Vinerea Mare ortodoxă — zi liberă din 2018")
  (:easter "Paștele" 0 :orthodox t :from 1900 :authority "Paștele ortodox")
  (:easter "A doua zi de Paști" 1 :orthodox t :from 1900 :authority "A doua zi de Paști")
  (:fixed "Ziua Muncii" 5 1 :from 1900 :authority "Ziua muncii")
  (:fixed "Ziua Copilului" 6 1 :from 2017
   :authority "Ziua Copilului — zi liberă din 2017")
  (:easter "Rusaliile" 49 :orthodox t :from 1900 :authority "Rusaliile")
  (:easter "A doua zi de Rusalii" 50 :orthodox t :from 1900 :authority "A doua zi de Rusalii")
  (:fixed "Adormirea Maicii Domnului" 8 15 :from 1900 :authority "Adormirea Maicii Domnului")
  (:fixed "Sfântul Andrei" 11 30 :from 2015
   :authority "Sfântul Andrei — zi liberă din 2015")
  (:fixed "Ziua Națională" 12 1 :from 1990
   :authority "1 Decembrie — Ziua Marii Uniri")
  (:fixed "Crăciunul" 12 25 :from 1900 :authority "Crăciun")
  (:fixed "A doua zi de Crăciun" 12 26 :from 1900 :authority "A doua zi de Crăciun"))

;;; Czech Republic — zákon o státních svátcích (floor 1993; ČSFR eras optional).
(define-calendar czechia-holidays-calendar (:register "CZ")
  (:fixed "Nový rok / Den obnovy samostatného českého státu" 1 1 :from 1993
   :authority "Zákon o státních svátcích")
  (:easter "Velký pátek" -2 :from 2016
   :authority "Velký pátek — státní svátek od 2016")
  (:easter "Velikonoční pondělí" 1 :from 1993 :authority "Zákon o státních svátcích")
  (:fixed "Svátek práce" 5 1 :from 1993 :authority "Zákon o státních svátcích")
  (:fixed "Den vítězství" 5 8 :from 1993 :authority "Den vítězství 8. května")
  (:fixed "Den slovanských věrozvěstů Cyrila a Metoděje" 7 5 :from 1993
   :authority "Zákon o státních svátcích")
  (:fixed "Den upálení mistra Jana Husa" 7 6 :from 1993 :authority "Zákon o státních svátcích")
  (:fixed "Den české státnosti" 9 28 :from 2000
   :authority "Den české státnosti (sv. Václav) od 2000")
  (:fixed "Den vzniku samostatného československého státu" 10 28 :from 1993
   :authority "28. říjen")
  (:fixed "Den boje za svobodu a demokracii" 11 17 :from 1993
   :authority "17. listopad")
  (:fixed "Štědrý den" 12 24 :from 1993 :authority "Zákon o státních svátcích")
  (:fixed "1. svátek vánoční" 12 25 :from 1993 :authority "Zákon o státních svátcích")
  (:fixed "2. svátek vánoční" 12 26 :from 1993 :authority "Zákon o státních svátcích"))

;;; Greece — επίσημες αργίες (Orthodox).
(define-calendar greece-holidays-calendar (:register "GR")
  (:fixed "Πρωτοχρονιά" 1 1 :from 1900 :authority "Επίσημη αργία")
  (:fixed "Θεοφάνεια" 1 6 :from 1900 :authority "Επίσημη αργία")
  (:easter "Καθαρά Δευτέρα" -48 :orthodox t :from 1900
   :authority "Καθαρά Δευτέρα (Ορθόδοξο Πάσχα − 48)")
  (:fixed "Ευαγγελισμός / Εθνική Εορτή" 3 25 :from 1900
   :authority "25 Μαρτίου — εθνική εορτή")
  (:easter "Μεγάλη Παρασκευή" -2 :orthodox t :from 1900 :authority "Μεγάλη Παρασκευή")
  (:easter "Δευτέρα του Πάσχα" 1 :orthodox t :from 1900 :authority "Δευτέρα του Πάσχα")
  (:fixed "Εργατική Πρωτομαγιά" 5 1 :from 1900 :authority "Επίσημη αργία")
  (:easter "Αγίου Πνεύματος" 50 :orthodox t :from 1900
   :authority "Δευτέρα του Αγίου Πνεύματος")
  (:fixed "Κοίμηση της Θεοτόκου" 8 15 :from 1900 :authority "Επίσημη αργία")
  (:fixed "Επέτειος του Όχι" 10 28 :from 1940 :authority "28 Οκτωβρίου")
  (:fixed "Χριστούγεννα" 12 25 :from 1900 :authority "Επίσημη αργία")
  (:fixed "Σύναξις Θεοτόκου" 12 26 :from 1900 :authority "Δεύτερη μέρα Χριστουγέννων"))

;;; Portugal — Código do Trabalho art. 234.º (suspensions 2013–2015).
(define-calendar portugal-holidays-calendar (:register "PT")
  (:fixed "Ano Novo" 1 1 :from 1900 :authority "Código do Trabalho art. 234.º")
  (:easter "Sexta-Feira Santa" -2 :from 1900 :authority "Código do Trabalho")
  (:easter "Páscoa" 0 :from 1900 :authority "Código do Trabalho")
  (:fixed "Dia da Liberdade" 4 25 :from 1974
   :authority "25 de Abril — Dia da Liberdade")
  (:fixed "Dia do Trabalhador" 5 1 :from 1900 :authority "Código do Trabalho")
  (:easter "Corpo de Deus" 60 :from 1900 :to 2012
   :authority "Corpo de Deus — suspenso 2013–2015")
  (:easter "Corpo de Deus" 60 :from 2016
   :authority "Lei 8/2016 — Corpo de Deus reposto")
  (:fixed "Dia de Portugal" 6 10 :from 1900 :authority "Dia de Portugal, de Camões e das Comunidades")
  (:fixed "Assunção de Maria" 8 15 :from 1900 :authority "Código do Trabalho")
  (:fixed "Implantação da República" 10 5 :from 1910 :to 2012
   :authority "5 de outubro — suspenso 2013–2015")
  (:fixed "Implantação da República" 10 5 :from 2016
   :authority "Lei 8/2016 — 5 de outubro reposto")
  (:fixed "Todos os Santos" 11 1 :from 1900 :to 2012
   :authority "Todos-os-Santos — suspenso 2013–2015")
  (:fixed "Todos os Santos" 11 1 :from 2016
   :authority "Lei 8/2016 — Todos-os-Santos reposto")
  (:fixed "Restauração da Independência" 12 1 :from 1900 :to 2012
   :authority "1 de dezembro — suspenso 2013–2015")
  (:fixed "Restauração da Independência" 12 1 :from 2016
   :authority "Lei 8/2016 — 1 de dezembro reposto")
  (:fixed "Imaculada Conceição" 12 8 :from 1900 :authority "Código do Trabalho")
  (:fixed "Natal" 12 25 :from 1900 :authority "Código do Trabalho"))

;;; Hungary — munkaszüneti napok.
(define-calendar hungary-holidays-calendar (:register "HU")
  (:fixed "Újév" 1 1 :from 1900 :authority "Munkaszüneti nap")
  (:fixed "1848-as forradalom" 3 15 :from 1990
   :authority "Nemzeti ünnep — 1848. március 15.")
  (:easter "Nagypéntek" -2 :from 2017
   :authority "Nagypéntek — munkaszüneti nap 2017-től")
  (:easter "Húsvétvasárnap" 0 :from 1900 :authority "Munkaszüneti nap")
  (:easter "Húsvéthétfő" 1 :from 1900 :authority "Munkaszüneti nap")
  (:fixed "A munka ünnepe" 5 1 :from 1900 :authority "Munkaszüneti nap")
  (:easter "Pünkösdvasárnap" 49 :from 1900 :authority "Munkaszüneti nap")
  (:easter "Pünkösdhétfő" 50 :from 1900 :authority "Munkaszüneti nap")
  (:fixed "Szent István ünnepe" 8 20 :from 1900
   :authority "Államalapítás ünnepe — augusztus 20.")
  (:fixed "1956-os forradalom" 10 23 :from 1991
   :authority "Nemzeti ünnep — 1956. október 23.")
  (:fixed "Mindenszentek" 11 1 :from 1900 :authority "Munkaszüneti nap")
  (:fixed "Karácsony" 12 25 :from 1900 :authority "Munkaszüneti nap")
  (:fixed "Karácsony másnapja" 12 26 :from 1900 :authority "Munkaszüneti nap"))

;;; Bulgaria — официални празници (Orthodox).
(define-calendar bulgaria-holidays-calendar (:register "BG")
  (:fixed "Нова година" 1 1 :from 1900 :authority "Официален празник")
  (:fixed "Ден на Освобождението" 3 3 :from 1880
   :authority "3 март — Освобождение от османско иго")
  (:easter "Разпети петък" -2 :orthodox t :from 1900 :authority "Великден (православен)")
  (:easter "Великден" 0 :orthodox t :from 1900 :authority "Великден")
  (:easter "Велики понеделник" 1 :orthodox t :from 1900 :authority "Велики понеделник")
  (:fixed "Ден на труда" 5 1 :from 1900 :authority "Официален празник")
  (:fixed "Гергьовден" 5 6 :from 1900
   :authority "Гергьовден / Ден на храбростта")
  (:fixed "Ден на азбуката" 5 24 :from 1900
   :authority "Ден на българската просвета и култура")
  (:fixed "Ден на съединението" 9 6 :from 1885 :authority "Съединение на България")
  (:fixed "Ден на независимостта" 9 22 :from 1908 :authority "Независимост 1908")
  (:fixed "Ден на народните будители" 11 1 :from 1922
   :authority "Ден на народните будители")
  (:fixed "Бъдни вечер" 12 24 :from 1900 :authority "Официален празник")
  (:fixed "Коледа" 12 25 :from 1900 :authority "Официален празник")
  (:fixed "Коледа" 12 26 :from 1900 :authority "Втори ден на Коледа"))

;;; Denmark — helligdage (Store bededag abolished 2024).
(define-calendar denmark-holidays-calendar (:register "DK")
  (:fixed "Nytårsdag" 1 1 :from 1900 :authority "Danske helligdage")
  (:easter "Skærtorsdag" -3 :from 1900 :authority "Danske helligdage")
  (:easter "Langfredag" -2 :from 1900 :authority "Danske helligdage")
  (:easter "Påskedag" 0 :from 1900 :authority "Danske helligdage")
  (:easter "Anden påskedag" 1 :from 1900 :authority "Danske helligdage")
  (:easter "Store bededag" 26 :from 1900 :to 2023
   :authority "Store bededag (4. fredag efter påske) — afskaffet fra 2024")
  (:easter "Kristi himmelfartsdag" 39 :from 1900 :authority "Danske helligdage")
  (:easter "Pinsedag" 49 :from 1900 :authority "Danske helligdage")
  (:easter "Anden pinsedag" 50 :from 1900 :authority "Danske helligdage")
  (:fixed "Juledag" 12 25 :from 1900 :authority "Danske helligdage")
  (:fixed "Anden juledag" 12 26 :from 1900 :authority "Danske helligdage"))

;;; Finland — viralliset juhlapäivät.
(define-calendar finland-holidays-calendar (:register "FI")
  (:fixed "Uudenvuodenpäivä" 1 1 :from 1917 :authority "Virallinen juhlapäivä")
  (:fixed "Loppiainen" 1 6 :from 1917 :authority "Virallinen juhlapäivä")
  (:easter "Pitkäperjantai" -2 :from 1917 :authority "Virallinen juhlapäivä")
  (:easter "Pääsiäispäivä" 0 :from 1917 :authority "Virallinen juhlapäivä")
  (:easter "2. pääsiäispäivä" 1 :from 1917 :authority "Virallinen juhlapäivä")
  (:fixed "Vappu" 5 1 :from 1917 :authority "Virallinen juhlapäivä")
  (:easter "Helatorstai" 39 :from 1917 :authority "Virallinen juhlapäivä")
  (:easter "Helluntaipäivä" 49 :from 1917 :authority "Virallinen juhlapäivä")
  (:computed "Juhannuspäivä"
   (lambda (y) (%saturday-in-range y 6 20 6 26))
   :from 1917
   :authority "Juhannuspäivä — lauantai 20.–26.6.")
  (:fixed "Itsenäisyyspäivä" 12 6 :from 1917 :authority "Itsenäisyyspäivä")
  (:fixed "Jouluaatto" 12 24 :from 1917
   :authority "Jouluaatto (de facto / bank; often treated as holiday)")
  (:fixed "Joulupäivä" 12 25 :from 1917 :authority "Virallinen juhlapäivä")
  (:fixed "Tapaninpäivä" 12 26 :from 1917 :authority "Virallinen juhlapäivä"))

;;; Slovakia — zákon o štátnych sviatkoch (floor 1993).
(define-calendar slovakia-holidays-calendar (:register "SK")
  (:fixed "Deň vzniku Slovenskej republiky" 1 1 :from 1993
   :authority "Zákon o štátnych sviatkoch")
  (:fixed "Zjavenie Pána" 1 6 :from 1993 :authority "Zákon o štátnych sviatkoch")
  (:easter "Veľký piatok" -2 :from 1993 :authority "Zákon o štátnych sviatkoch")
  (:easter "Veľkonočný pondelok" 1 :from 1993 :authority "Zákon o štátnych sviatkoch")
  (:fixed "Sviatok práce" 5 1 :from 1993 :authority "Zákon o štátnych sviatkoch")
  (:fixed "Deň víťazstva nad fašizmom" 5 8 :from 1993 :authority "Zákon o štátnych sviatkoch")
  (:fixed "Sviatok svätého Cyrila a Metoda" 7 5 :from 1993 :authority "Zákon o štátnych sviatkoch")
  (:fixed "Výročie SNP" 8 29 :from 1993
   :authority "Výročie Slovenského národného povstania")
  (:fixed "Deň Ústavy" 9 1 :from 1993 :to 2023
   :authority "Deň Ústavy SR — zrušený ako deň pracovného pokoja od 2024")
  (:fixed "Sedembolestná Panna Mária" 9 15 :from 1993 :authority "Zákon o štátnych sviatkoch")
  (:fixed "Sviatok všetkých svätých" 11 1 :from 1993 :authority "Zákon o štátnych sviatkoch")
  (:fixed "Deň boja za slobodu a demokraciu" 11 17 :from 1993
   :authority "Zákon o štátnych sviatkoch")
  (:fixed "Štedrý deň" 12 24 :from 1993 :authority "Zákon o štátnych sviatkoch")
  (:fixed "1. sviatok vianočný" 12 25 :from 1993 :authority "Zákon o štátnych sviatkoch")
  (:fixed "2. sviatok vianočný" 12 26 :from 1993 :authority "Zákon o štátnych sviatkoch"))

;;; Ireland — Organisation of Working Time Act bank holidays.
(define-calendar ireland-holidays-calendar (:register "IE")
  (:fixed "New Year's Day" 1 1 :from 1922 :authority "Organisation of Working Time Act / bank holidays")
  (:computed "St. Brigid's Day"
   (lambda (y)
     (let ((d (make-date y 2 1)))
       (if (= (date-day-of-week d) 5) d (%first-monday-on-or-after d))))
   :from 2023
   :authority "Organisation of Working Time Act — St Brigid's Day from 2023")
  (:fixed "St. Patrick's Day" 3 17 :from 1922 :authority "Bank holiday")
  (:easter "Easter Monday" 1 :from 1922 :authority "Bank holiday")
  (:nth-weekday "May Bank Holiday" 5 :monday 1 :from 1994
   :authority "May Day bank holiday (first Monday of May) from 1994")
  (:nth-weekday "June Bank Holiday" 6 :monday 1 :from 1922
   :authority "First Monday of June")
  (:nth-weekday "August Bank Holiday" 8 :monday 1 :from 1922
   :authority "First Monday of August")
  (:nth-weekday "October Bank Holiday" 10 :monday -1 :from 1977
   :authority "Last Monday of October")
  (:fixed "Christmas Day" 12 25 :from 1922 :authority "Bank holiday")
  (:fixed "St. Stephen's Day" 12 26 :from 1922 :authority "Bank holiday"))

;;; Croatia — Zakon o blagdanima (eras 2019–2020 reform).
(define-calendar croatia-holidays-calendar (:register "HR")
  (:fixed "Nova godina" 1 1 :from 1991 :authority "Zakon o blagdanima")
  (:fixed "Bogojavljenje" 1 6 :from 1991 :authority "Zakon o blagdanima")
  (:easter "Uskrs" 0 :from 1991 :authority "Zakon o blagdanima")
  (:easter "Uskršnji ponedjeljak" 1 :from 1991 :authority "Zakon o blagdanima")
  (:fixed "Praznik rada" 5 1 :from 1991 :authority "Zakon o blagdanima")
  (:fixed "Dan državnosti" 5 30 :from 2020
   :authority "Dan državnosti — 30. svibnja od 2020.")
  (:fixed "Dan državnosti" 6 25 :from 1991 :to 2019
   :authority "Dan državnosti — 25. lipnja do 2019.")
  (:easter "Tijelovo" 60 :from 1991 :authority "Zakon o blagdanima")
  (:fixed "Dan antifašističke borbe" 6 22 :from 1991 :authority "Zakon o blagdanima")
  (:fixed "Dan pobjede i domovinske zahvalnosti" 8 5 :from 1995
   :authority "Dan pobjede / Dan hrvatskih branitelja")
  (:fixed "Velika Gospa" 8 15 :from 1991 :authority "Zakon o blagdanima")
  (:fixed "Dan neovisnosti" 10 8 :from 1991 :to 2019
   :authority "Dan neovisnosti — 8. listopada do 2019.")
  (:fixed "Dan sjećanja na žrtve Domovinskog rata" 11 18 :from 2020
   :authority "Dan sjećanja — 18. studenoga od 2020.")
  (:fixed "Svi sveti" 11 1 :from 1991 :authority "Zakon o blagdanima")
  (:fixed "Božić" 12 25 :from 1991 :authority "Zakon o blagdanima")
  (:fixed "Sveti Stjepan" 12 26 :from 1991 :authority "Zakon o blagdanima"))

;;; Lithuania — valstybės šventės.
(define-calendar lithuania-holidays-calendar (:register "LT")
  (:fixed "Naujieji metai" 1 1 :from 1990 :authority "Lietuvos Respublikos šventės")
  (:fixed "Lietuvos valstybės atkūrimo diena" 2 16 :from 1990
   :authority "Vasario 16-oji")
  (:fixed "Lietuvos nepriklausomybės atkūrimo diena" 3 11 :from 1990
   :authority "Kovo 11-oji")
  (:easter "Velykos" 0 :from 1990 :authority "Šventė")
  (:easter "Velykų pirmadienis" 1 :from 1990 :authority "Šventė")
  (:fixed "Tarptautinė darbo diena" 5 1 :from 1990 :authority "Šventė")
  (:fixed "Joninės" 6 24 :from 1990 :authority "Rasos / Joninės")
  (:fixed "Valstybės diena" 7 6 :from 1990
   :authority "Karaliaus Mindaugo karūnavimo diena")
  (:fixed "Žolinė" 8 15 :from 1990 :authority "Šventė")
  (:fixed "Visų šventųjų diena" 11 1 :from 1990 :authority "Šventė")
  (:fixed "Vėlinės" 11 2 :from 2020
   :authority "Vėlinės — nedarbo diena nuo 2020")
  (:fixed "Kūčios" 12 24 :from 1990 :authority "Šventė")
  (:fixed "Kalėdos" 12 25 :from 1990 :authority "Šventė")
  (:fixed "2. Kalėdų diena" 12 26 :from 1990 :authority "Šventė"))

;;; Slovenia — Zakon o praznikih.
(define-calendar slovenia-holidays-calendar (:register "SI")
  (:fixed "Novo leto" 1 1 :from 1991 :authority "Zakon o praznikih")
  (:fixed "Novo leto" 1 2 :from 1991 :authority "Zakon o praznikih")
  (:fixed "Prešernov dan" 2 8 :from 1991 :authority "Slovenski kulturni praznik")
  (:easter "Velika noč" 0 :from 1991 :authority "Zakon o praznikih")
  (:easter "Velikonočni ponedeljek" 1 :from 1991 :authority "Zakon o praznikih")
  (:fixed "Dan upora proti okupatorju" 4 27 :from 1991 :authority "Zakon o praznikih")
  (:fixed "Praznik dela" 5 1 :from 1991 :authority "Zakon o praznikih")
  (:fixed "Praznik dela" 5 2 :from 1991 :authority "Zakon o praznikih")
  (:easter "Binkošti" 49 :from 1991 :authority "Zakon o praznikih")
  (:fixed "Dan državnosti" 6 25 :from 1991 :authority "Zakon o praznikih")
  (:fixed "Marijino vnebovzetje" 8 15 :from 1991 :authority "Zakon o praznikih")
  (:fixed "Dan reformacije" 10 31 :from 1991 :authority "Zakon o praznikih")
  (:fixed "Dan spomina na mrtve" 11 1 :from 1991 :authority "Zakon o praznikih")
  (:fixed "Božič" 12 25 :from 1991 :authority "Zakon o praznikih")
  (:fixed "Dan samostojnosti in enotnosti" 12 26 :from 1991 :authority "Zakon o praznikih"))

;;; Latvia — svētku dienas.
(define-calendar latvia-holidays-calendar (:register "LV")
  (:fixed "Jaunais Gads" 1 1 :from 1990 :authority "Latvijas Republikas svētku dienas")
  (:easter "Lielā Piektdiena" -2 :from 1990 :authority "Svētku diena")
  (:easter "Lieldienas" 0 :from 1990 :authority "Svētku diena")
  (:easter "Otrās Lieldienas" 1 :from 1990 :authority "Svētku diena")
  (:fixed "Darba svētki" 5 1 :from 1990 :authority "Svētku diena")
  (:fixed "Latvijas Republikas Neatkarības atjaunošanas diena" 5 4 :from 1990
   :authority "4. maijs")
  (:fixed "Līgo Diena" 6 23 :from 1990 :authority "Līgo")
  (:fixed "Jāņi" 6 24 :from 1990 :authority "Jāņi")
  (:fixed "Latvijas Republikas proklamēšanas diena" 11 18 :from 1990
   :authority "18. novembris")
  (:fixed "Ziemassvētku vakars" 12 24 :from 1990 :authority "Svētku diena")
  (:fixed "Ziemassvētki" 12 25 :from 1990 :authority "Svētku diena")
  (:fixed "Otrie Ziemassvētki" 12 26 :from 1990 :authority "Svētku diena")
  (:fixed "Vecgada vakars" 12 31 :from 1990 :authority "Svētku diena"))

;;; Estonia — riigipühad.
(define-calendar estonia-holidays-calendar (:register "EE")
  (:fixed "uusaasta" 1 1 :from 1991 :authority "Riigipüha")
  (:fixed "iseseisvuspäev" 2 24 :from 1991 :authority "Iseseisvuspäev")
  (:easter "suur reede" -2 :from 1991 :authority "Riigipüha")
  (:easter "ülestõusmispühade 1. püha" 0 :from 1991 :authority "Riigipüha")
  (:fixed "kevadpüha" 5 1 :from 1991 :authority "Riigipüha")
  (:easter "nelipühade 1. püha" 49 :from 1991 :authority "Riigipüha")
  (:fixed "võidupüha" 6 23 :from 1991 :authority "Võidupüha")
  (:fixed "jaanipäev" 6 24 :from 1991 :authority "Jaanipäev")
  (:fixed "taasiseseisvumispäev" 8 20 :from 1991 :authority "Taasiseseisvumispäev")
  (:fixed "jõululaupäev" 12 24 :from 1991 :authority "Riigipüha")
  (:fixed "esimene jõulupüha" 12 25 :from 1991 :authority "Riigipüha")
  (:fixed "teine jõulupüha" 12 26 :from 1991 :authority "Riigipüha"))

;;; Cyprus — επίσημες αργίες (Orthodox; Republic floor 1960).
(define-calendar cyprus-holidays-calendar (:register "CY")
  (:fixed "Πρωτοχρονιά" 1 1 :from 1960 :authority "Επίσημη αργία")
  (:fixed "Θεοφάνεια" 1 6 :from 1960 :authority "Επίσημη αργία")
  (:easter "Καθαρά Δευτέρα" -48 :orthodox t :from 1960 :authority "Καθαρά Δευτέρα")
  (:fixed "Εθνική Εορτή" 3 25 :from 1960 :authority "25 Μαρτίου")
  (:fixed "Κύπρος Εθνική Εορτή" 4 1 :from 1960
   :authority "1 Απριλίου — ΕΟΚΑ")
  (:easter "Μεγάλη Παρασκευή" -2 :orthodox t :from 1960 :authority "Μεγάλη Παρασκευή")
  (:easter "Δευτέρα του Πάσχα" 1 :orthodox t :from 1960 :authority "Δευτέρα του Πάσχα")
  (:fixed "Εργατική Πρωτομαγιά" 5 1 :from 1960 :authority "Επίσημη αργία")
  (:easter "Πεντηκοστή" 50 :orthodox t :from 1960 :authority "Κατακλυσμός / Πεντηκοστή")
  (:fixed "Κοίμηση της Θεοτόκου" 8 15 :from 1960 :authority "Επίσημη αργία")
  (:fixed "Ημέρα Ανεξαρτησίας" 10 1 :from 1960 :authority "1 Οκτωβρίου")
  (:fixed "Επέτειος του Όχι" 10 28 :from 1960 :authority "28 Οκτωβρίου")
  (:fixed "Χριστούγεννα" 12 25 :from 1960 :authority "Επίσημη αργία")
  (:fixed "Δεύτερη μέρα Χριστουγέννων" 12 26 :from 1960 :authority "Επίσημη αργία"))

;;; Luxembourg — jours fériés légaux.
(define-calendar luxembourg-holidays-calendar (:register "LU")
  (:fixed "Nouvel An" 1 1 :from 1900 :authority "Jours fériés légaux")
  (:easter "Lundi de Pâques" 1 :from 1900 :authority "Jours fériés légaux")
  (:fixed "1er Mai" 5 1 :from 1900 :authority "Jours fériés légaux")
  (:fixed "Europe Day" 5 9 :from 2019
   :authority "Jour de l'Europe — férié depuis 2019")
  (:easter "Ascension" 39 :from 1900 :authority "Jours fériés légaux")
  (:easter "Lundi de Pentecôte" 50 :from 1900 :authority "Jours fériés légaux")
  (:fixed "Fête nationale" 6 23 :from 1900 :authority "Fête nationale (Grand-Duc)")
  (:fixed "Assomption" 8 15 :from 1900 :authority "Jours fériés légaux")
  (:fixed "Toussaint" 11 1 :from 1900 :authority "Jours fériés légaux")
  (:fixed "Noël" 12 25 :from 1900 :authority "Jours fériés légaux")
  (:fixed "2e jour de Noël" 12 26 :from 1900 :authority "Jours fériés légaux"))

;;; Malta — National Holidays and other Public Holidays Act.
(define-calendar malta-holidays-calendar (:register "MT")
  (:fixed "New Year's Day" 1 1 :from 1964 :authority "Public Holidays Act")
  (:fixed "Feast of St. Paul's Shipwreck" 2 10 :from 1964 :authority "Public holiday")
  (:fixed "Feast of St. Joseph" 3 19 :from 1964 :authority "Public holiday")
  (:fixed "Freedom Day" 3 31 :from 1979 :authority "Freedom Day")
  (:easter "Good Friday" -2 :from 1964 :authority "Public holiday")
  (:fixed "Workers' Day" 5 1 :from 1964 :authority "Public holiday")
  (:fixed "Sette Giugno" 6 7 :from 1964 :authority "Public holiday")
  (:fixed "Feast of St. Peter and St. Paul" 6 29 :from 1964 :authority "Public holiday")
  (:fixed "Assumption" 8 15 :from 1964 :authority "Public holiday")
  (:fixed "Feast of Our Lady of Victories" 9 8 :from 1964 :authority "Public holiday")
  (:fixed "Independence Day" 9 21 :from 1964 :authority "Independence Day")
  (:fixed "Feast of the Immaculate Conception" 12 8 :from 1964 :authority "Public holiday")
  (:fixed "Republic Day" 12 13 :from 1974 :authority "Republic Day")
  (:fixed "Christmas Day" 12 25 :from 1964 :authority "Public holiday"))

(defun germany-holidays-calendar () (make-instance 'germany-holidays-calendar))
(defun france-holidays-calendar () (make-instance 'france-holidays-calendar))
(defun italy-holidays-calendar () (make-instance 'italy-holidays-calendar))
(defun spain-holidays-calendar () (make-instance 'spain-holidays-calendar))
(defun netherlands-holidays-calendar () (make-instance 'netherlands-holidays-calendar))
(defun belgium-holidays-calendar () (make-instance 'belgium-holidays-calendar))
(defun austria-holidays-calendar () (make-instance 'austria-holidays-calendar))
(defun poland-holidays-calendar () (make-instance 'poland-holidays-calendar))
(defun sweden-holidays-calendar () (make-instance 'sweden-holidays-calendar))
(defun romania-holidays-calendar () (make-instance 'romania-holidays-calendar))
(defun czechia-holidays-calendar () (make-instance 'czechia-holidays-calendar))
(defun greece-holidays-calendar () (make-instance 'greece-holidays-calendar))
(defun portugal-holidays-calendar () (make-instance 'portugal-holidays-calendar))
(defun hungary-holidays-calendar () (make-instance 'hungary-holidays-calendar))
(defun bulgaria-holidays-calendar () (make-instance 'bulgaria-holidays-calendar))
(defun denmark-holidays-calendar () (make-instance 'denmark-holidays-calendar))
(defun finland-holidays-calendar () (make-instance 'finland-holidays-calendar))
(defun slovakia-holidays-calendar () (make-instance 'slovakia-holidays-calendar))
(defun ireland-holidays-calendar () (make-instance 'ireland-holidays-calendar))
(defun croatia-holidays-calendar () (make-instance 'croatia-holidays-calendar))
(defun lithuania-holidays-calendar () (make-instance 'lithuania-holidays-calendar))
(defun slovenia-holidays-calendar () (make-instance 'slovenia-holidays-calendar))
(defun latvia-holidays-calendar () (make-instance 'latvia-holidays-calendar))
(defun estonia-holidays-calendar () (make-instance 'estonia-holidays-calendar))
(defun cyprus-holidays-calendar () (make-instance 'cyprus-holidays-calendar))
(defun luxembourg-holidays-calendar () (make-instance 'luxembourg-holidays-calendar))
(defun malta-holidays-calendar () (make-instance 'malta-holidays-calendar))
