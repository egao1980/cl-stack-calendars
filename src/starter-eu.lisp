(in-package #:cl-stack-calendars)

;;;; Major EU national holiday calendars — statutory common / federal sets.
;;;; No automatic weekend in-lieu unless a cited statute says so (most do not;
;;;; TARGET already covers ECB settlement). Länder / comunidades / regions
;;;; add extras via COMPOSITE-CALENDAR or country-calendar corpus.

(defun %saturday-in-range (year month-from day-from month-to day-to)
  "First Saturday on or after YEAR-MONTH-FROM-DAY-FROM up to MONTH-TO-DAY-TO."
  (loop for rd from (date-rd (make-date year month-from day-from))
          to (date-rd (make-date year month-to day-to))
        for date = (date-from-rd rd)
        when (= (date-day-of-week date) 6)
          return date))

;;; Germany — bundeseinheitliche Feiertage (common to all Länder).
(define-calendar germany-holidays-calendar (:register "DE")
  (:fixed "Neujahr" 1 1
   :authority "Feiertagsgesetze der Länder / bundeseinheitlich")
  (:easter "Karfreitag" -2
   :authority "Feiertagsgesetze der Länder (Karfreitag)")
  (:easter "Ostermontag" 1
   :authority "Feiertagsgesetze der Länder (Ostermontag)")
  (:fixed "Tag der Arbeit" 5 1
   :authority "Feiertagsgesetze der Länder (1. Mai)")
  (:easter "Christi Himmelfahrt" 39
   :authority "Feiertagsgesetze der Länder (Christi Himmelfahrt)")
  (:easter "Pfingstmontag" 50
   :authority "Feiertagsgesetze der Länder (Pfingstmontag)")
  (:fixed "Tag der Deutschen Einheit" 10 3 :from 1990
   :authority "Einigungsvertrag Art. 2 Abs. 2; Tag der Deutschen Einheit")
  (:fixed "1. Weihnachtstag" 12 25
   :authority "Feiertagsgesetze der Länder")
  (:fixed "2. Weihnachtstag" 12 26
   :authority "Feiertagsgesetze der Länder"))

;;; France — Code du travail L.3133-1 jours fériés.
(define-calendar france-holidays-calendar (:register "FR")
  (:fixed "Jour de l'an" 1 1
   :authority "Code du travail L.3133-1")
  (:easter "Lundi de Pâques" 1
   :authority "Code du travail L.3133-1")
  (:fixed "Fête du Travail" 5 1
   :authority "Code du travail L.3133-1")
  (:fixed "Victoire 1945" 5 8
   :authority "Code du travail L.3133-1")
  (:easter "Ascension" 39
   :authority "Code du travail L.3133-1")
  (:easter "Lundi de Pentecôte" 50
   :authority "Code du travail L.3133-1")
  (:fixed "Fête nationale" 7 14
   :authority "Code du travail L.3133-1")
  (:fixed "Assomption" 8 15
   :authority "Code du travail L.3133-1")
  (:fixed "Toussaint" 11 1
   :authority "Code du travail L.3133-1")
  (:fixed "Armistice 1918" 11 11
   :authority "Code du travail L.3133-1")
  (:fixed "Noël" 12 25
   :authority "Code du travail L.3133-1"))

;;; Italy — festività nazionali (legge 260/1949 e succ.).
(define-calendar italy-holidays-calendar (:register "IT")
  (:fixed "Capodanno" 1 1 :authority "L. 260/1949 e successive")
  (:fixed "Epifania" 1 6 :authority "L. 260/1949 e successive")
  (:easter "Pasquetta" 1 :authority "L. 260/1949 e successive")
  (:fixed "Liberazione" 4 25 :authority "L. 260/1949 e successive")
  (:fixed "Festa del Lavoro" 5 1 :authority "L. 260/1949 e successive")
  (:fixed "Festa della Repubblica" 6 2 :authority "L. 260/1949 e successive")
  (:fixed "Ferragosto" 8 15 :authority "L. 260/1949 e successive")
  (:fixed "Tutti i Santi" 11 1 :authority "L. 260/1949 e successive")
  (:fixed "Immacolata" 12 8 :authority "L. 260/1949 e successive")
  (:fixed "Natale" 12 25 :authority "L. 260/1949 e successive")
  (:fixed "Santo Stefano" 12 26 :authority "L. 260/1949 e successive"))

;;; Spain — fiestas laborales de ámbito nacional.
(define-calendar spain-holidays-calendar (:register "ES")
  (:fixed "Año Nuevo" 1 1 :authority "Estatuto de los Trabajadores / BOE fiestas nacionales")
  (:fixed "Epifanía del Señor" 1 6 :authority "BOE fiestas laborales nacionales")
  (:easter "Viernes Santo" -2 :authority "BOE fiestas laborales nacionales")
  (:fixed "Fiesta del Trabajo" 5 1 :authority "BOE fiestas laborales nacionales")
  (:fixed "Asunción de la Virgen" 8 15 :authority "BOE fiestas laborales nacionales")
  (:fixed "Fiesta Nacional de España" 10 12 :authority "BOE fiestas laborales nacionales")
  (:fixed "Todos los Santos" 11 1 :authority "BOE fiestas laborales nacionales")
  (:fixed "Día de la Constitución" 12 6 :authority "BOE fiestas laborales nacionales")
  (:fixed "Inmaculada Concepción" 12 8 :authority "BOE fiestas laborales nacionales")
  (:fixed "Navidad" 12 25 :authority "BOE fiestas laborales nacionales"))

;;; Netherlands — algemeen erkende feestdagen.
(define-calendar netherlands-holidays-calendar (:register "NL")
  (:fixed "Nieuwjaarsdag" 1 1 :authority "Algemeen erkende feestdagen")
  (:easter "Tweede paasdag" 1 :authority "Algemeen erkende feestdagen")
  (:computed "Koningsdag"
   (lambda (y)
     (let ((d (make-date y 4 27)))
       (if (= (date-day-of-week d) 7) (make-date y 4 26) d)))
   :from 2014
   :authority "Koningsdag (27 april; indien zondag → 26 april)")
  (:fixed "Bevrijdingsdag" 5 5
   :authority "Bevrijdingsdag (nationale feestdag; betaald verlof CAO/lustrum-afhankelijk)")
  (:easter "Hemelvaartsdag" 39 :authority "Algemeen erkende feestdagen")
  (:easter "Tweede pinksterdag" 50 :authority "Algemeen erkende feestdagen")
  (:fixed "Eerste kerstdag" 12 25 :authority "Algemeen erkende feestdagen")
  (:fixed "Tweede kerstdag" 12 26 :authority "Algemeen erkende feestdagen"))

;;; Belgium — wettelijke feestdagen (fédéral).
(define-calendar belgium-holidays-calendar (:register "BE")
  (:fixed "Nieuwjaar / Nouvel An" 1 1 :authority "Wettelijke feestdagen / jours fériés légaux")
  (:easter "Paasmaandag / Lundi de Pâques" 1 :authority "Wettelijke feestdagen")
  (:fixed "Dag van de Arbeid / Fête du Travail" 5 1 :authority "Wettelijke feestdagen")
  (:easter "O.H. Hemelvaart / Ascension" 39 :authority "Wettelijke feestdagen")
  (:easter "Pinkstermaandag / Lundi de Pentecôte" 50 :authority "Wettelijke feestdagen")
  (:fixed "Nationale feestdag / Fête nationale" 7 21 :authority "Wettelijke feestdagen")
  (:fixed "OLV Hemelvaart / Assomption" 8 15 :authority "Wettelijke feestdagen")
  (:fixed "Allerheiligen / Toussaint" 11 1 :authority "Wettelijke feestdagen")
  (:fixed "Wapenstilstand / Armistice" 11 11 :authority "Wettelijke feestdagen")
  (:fixed "Kerstmis / Noël" 12 25 :authority "Wettelijke feestdagen"))

;;; Austria — gesetzliche Feiertage (ARG).
(define-calendar austria-holidays-calendar (:register "AT")
  (:fixed "Neujahr" 1 1 :authority "Arbeitsruhegesetz (ARG)")
  (:fixed "Heilige Drei Könige" 1 6 :authority "Arbeitsruhegesetz")
  (:easter "Ostermontag" 1 :authority "Arbeitsruhegesetz")
  (:fixed "Staatsfeiertag" 5 1 :authority "Arbeitsruhegesetz")
  (:easter "Christi Himmelfahrt" 39 :authority "Arbeitsruhegesetz")
  (:easter "Pfingstmontag" 50 :authority "Arbeitsruhegesetz")
  (:easter "Fronleichnam" 60 :authority "Arbeitsruhegesetz")
  (:fixed "Mariä Himmelfahrt" 8 15 :authority "Arbeitsruhegesetz")
  (:fixed "Nationalfeiertag" 10 26 :authority "Arbeitsruhegesetz")
  (:fixed "Allerheiligen" 11 1 :authority "Arbeitsruhegesetz")
  (:fixed "Mariä Empfängnis" 12 8 :authority "Arbeitsruhegesetz")
  (:fixed "Christtag" 12 25 :authority "Arbeitsruhegesetz")
  (:fixed "Stefanitag" 12 26 :authority "Arbeitsruhegesetz"))

;;; Poland — dni wolne od pracy.
(define-calendar poland-holidays-calendar (:register "PL")
  (:fixed "Nowy Rok" 1 1 :authority "Ustawa o dniach wolnych od pracy")
  (:fixed "Święto Trzech Króli" 1 6 :authority "Ustawa o dniach wolnych od pracy")
  (:easter "Poniedziałek Wielkanocny" 1 :authority "Ustawa o dniach wolnych od pracy")
  (:fixed "Święto Pracy" 5 1 :authority "Ustawa o dniach wolnych od pracy")
  (:fixed "Święto Konstytucji 3 Maja" 5 3 :authority "Ustawa o dniach wolnych od pracy")
  (:easter "Boże Ciało" 60 :authority "Ustawa o dniach wolnych od pracy")
  (:fixed "Wniebowzięcie NMP" 8 15 :authority "Ustawa o dniach wolnych od pracy")
  (:fixed "Wszystkich Świętych" 11 1 :authority "Ustawa o dniach wolnych od pracy")
  (:fixed "Narodowe Święto Niepodległości" 11 11 :authority "Ustawa o dniach wolnych od pracy")
  (:fixed "Boże Narodzenie" 12 25 :authority "Ustawa o dniach wolnych od pracy")
  (:fixed "Boże Narodzenie (drugi dzień)" 12 26 :authority "Ustawa o dniach wolnych od pracy"))

;;; Sweden — helgdagar (lag om allmänna helgdagar).
(define-calendar sweden-holidays-calendar (:register "SE")
  (:fixed "Nyårsdagen" 1 1 :authority "Lag (1989:253) om allmänna helgdagar")
  (:fixed "Trettondedag jul" 1 6 :authority "Lag om allmänna helgdagar")
  (:easter "Långfredagen" -2 :authority "Lag om allmänna helgdagar")
  (:easter "Påskdagen" 0 :authority "Lag om allmänna helgdagar")
  (:easter "Annandag påsk" 1 :authority "Lag om allmänna helgdagar")
  (:fixed "Första maj" 5 1 :authority "Lag om allmänna helgdagar")
  (:easter "Kristi himmelsfärdsdag" 39 :authority "Lag om allmänna helgdagar")
  (:easter "Pingstdagen" 49 :authority "Lag om allmänna helgdagar")
  (:fixed "Nationaldagen" 6 6 :from 2005
   :authority "Lag om allmänna helgdagar (Sveriges nationaldag)")
  (:computed "Midsommardagen"
   (lambda (y) (%saturday-in-range y 6 20 6 26))
   :authority "Lag om allmänna helgdagar (lördagen 20–26 juni)")
  (:computed "Alla helgons dag"
   (lambda (y) (%saturday-in-range y 10 31 11 6))
   :from 1953
   :authority "Lag om allmänna helgdagar (lördagen mellan 31 okt och 6 nov)")
  (:fixed "Juldagen" 12 25 :authority "Lag om allmänna helgdagar")
  (:fixed "Annandag jul" 12 26 :authority "Lag om allmänna helgdagar"))

(defun germany-holidays-calendar () (make-instance 'germany-holidays-calendar))
(defun france-holidays-calendar () (make-instance 'france-holidays-calendar))
(defun italy-holidays-calendar () (make-instance 'italy-holidays-calendar))
(defun spain-holidays-calendar () (make-instance 'spain-holidays-calendar))
(defun netherlands-holidays-calendar () (make-instance 'netherlands-holidays-calendar))
(defun belgium-holidays-calendar () (make-instance 'belgium-holidays-calendar))
(defun austria-holidays-calendar () (make-instance 'austria-holidays-calendar))
(defun poland-holidays-calendar () (make-instance 'poland-holidays-calendar))
(defun sweden-holidays-calendar () (make-instance 'sweden-holidays-calendar))
