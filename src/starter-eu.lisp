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

;;; --- Remaining EU-27 --------------------------------------------------

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

(defun france-holidays-calendar () (make-instance 'france-holidays-calendar))
(defun spain-holidays-calendar () (make-instance 'spain-holidays-calendar))
(defun belgium-holidays-calendar () (make-instance 'belgium-holidays-calendar))
(defun austria-holidays-calendar () (make-instance 'austria-holidays-calendar))
(defun denmark-holidays-calendar () (make-instance 'denmark-holidays-calendar))
(defun luxembourg-holidays-calendar () (make-instance 'luxembourg-holidays-calendar))
(defun malta-holidays-calendar () (make-instance 'malta-holidays-calendar))
