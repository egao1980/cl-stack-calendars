(in-package #:cl-stack-calendars)

;;;; Smaller countries (population-order tier below ~20M) — normative starters.
;;;; Research window max(1900, formation) → present.

(defun magal-de-touba-date (g-year)
  "18 Rabīʿ ath-Thānī (tabular) — Magal de Touba, Senegal."
  (islamic-date-in-gregorian-year g-year 3 18))

(defun ashura-date (g-year)
  "10 Muharram (tabular)."
  (islamic-date-in-gregorian-year g-year 1 10))

(defun isra-miraj-date (g-year)
  "27 Rajab (tabular)."
  (islamic-date-in-gregorian-year g-year 7 27))

(defun hebrew-holiday-in-gregorian-year (g-year month day)
  "Hebrew MONTH/DAY occurring in Gregorian G-YEAR, or NIL."
  (let* ((start (fixed-from-date +gregorian+ g-year 1 1))
         (end (fixed-from-date +gregorian+ g-year 12 31))
         (hy (multiple-value-bind (y) (hebrew-date-from-fixed start) y)))
    (loop for y from (1- hy) to (+ hy 1)
          for rd = (fixed-from-hebrew-date y month day)
          when (<= start rd end)
            return (date-from-rd rd))))

(defun novruz-date (g-year)
  "21 March — Novruz / Nauryz (statutory; astronomical variants exist)."
  (make-date g-year 3 21))

;;; --- Americas -------------------------------------------------------------

(define-calendar guatemala-holidays-calendar (:register "GT")
  (:fixed "Año Nuevo" 1 1 :from 1900 :authority "Día de asueto — Código de Trabajo")
  (:easter "Jueves Santo" -3 :from 1900 :authority "Semana Santa")
  (:easter "Viernes Santo" -2 :from 1900 :authority "Semana Santa")
  (:easter "Sábado Santo" -1 :from 1900 :authority "Semana Santa")
  (:fixed "Día del Trabajador" 5 1 :from 1900 :authority "Día de asueto")
  (:fixed "Día del Ejército" 6 30 :from 1900 :authority "Día de las Fuerzas Armadas")
  (:fixed "Día de la Independencia" 9 15 :from 1900
   :authority "Independencia 15 de septiembre de 1821")
  (:fixed "Día de la Revolución" 10 20 :from 1900 :authority "Revolución de 1944")
  (:fixed "Día de Todos los Santos" 11 1 :from 1900 :authority "Día de asueto")
  (:fixed "Nochebuena" 12 24 :from 1900 :authority "Día de asueto")
  (:fixed "Navidad" 12 25 :from 1900 :authority "Día de asueto")
  (:fixed "Fin de Año" 12 31 :from 1900 :authority "Día de asueto"))

(define-calendar ecuador-holidays-calendar (:register "EC")
  (:fixed "Año Nuevo" 1 1 :from 1900 :authority "Feriado nacional")
  (:easter "Carnaval" -48 :from 1900 :authority "Carnaval — lunes")
  (:easter "Carnaval" -47 :from 1900 :authority "Carnaval — martes")
  (:easter "Jueves Santo" -3 :from 1900 :authority "Semana Santa")
  (:easter "Viernes Santo" -2 :from 1900 :authority "Semana Santa")
  (:fixed "Día del Trabajador" 5 1 :from 1900 :authority "Feriado nacional")
  (:fixed "Batalla del Pichincha" 5 24 :from 1900 :authority "Feriado nacional")
  (:fixed "Primer Grito de Independencia" 8 10 :from 1900
   :authority "Independencia de Quito — 10 de agosto")
  (:fixed "Independencia de Guayaquil" 10 9 :from 1900 :authority "Feriado nacional")
  (:fixed "Día de los Difuntos" 11 2 :from 1900 :authority "Feriado nacional")
  (:fixed "Independencia de Cuenca" 11 3 :from 1900 :authority "Feriado nacional")
  (:fixed "Navidad" 12 25 :from 1900 :authority "Feriado nacional"))

(define-calendar bolivia-holidays-calendar (:register "BO")
  (:fixed "Año Nuevo" 1 1 :from 1900 :authority "Feriado")
  (:fixed "Día del Estado Plurinacional" 1 22 :from 2010
   :authority "Ley — Día del Estado Plurinacional desde 2010")
  (:easter "Carnaval" -48 :from 1900 :authority "Carnaval")
  (:easter "Carnaval" -47 :from 1900 :authority "Carnaval")
  (:easter "Viernes Santo" -2 :from 1900 :authority "Semana Santa")
  (:fixed "Día del Trabajador" 5 1 :from 1900 :authority "Feriado")
  (:fixed "Año Nuevo Aymara" 6 21 :from 2010
   :authority "Ley — Willkakuti / Año Nuevo Aymara desde 2010")
  (:fixed "Día de la Independencia" 8 6 :from 1900
   :authority "Independencia 6 de agosto de 1825")
  (:fixed "Día de Todos los Santos" 11 2 :from 1900 :authority "Feriado")
  (:fixed "Navidad" 12 25 :from 1900 :authority "Feriado"))

(define-calendar haiti-holidays-calendar (:register "HT")
  (:fixed "Jour de l'Indépendance" 1 1 :from 1900
   :authority "Indépendance 1er janvier 1804")
  (:fixed "Jour des Aïeux" 1 2 :from 1900 :authority "Fête des ancêtres")
  (:easter "Vendredi Saint" -2 :from 1900 :authority "Semaine Sainte")
  (:fixed "Fête du Travail" 5 1 :from 1900 :authority "Jour férié")
  (:fixed "Fête du Drapeau et de l'Université" 5 18 :from 1900
   :authority "Drapeau et Université d'État d'Haïti")
  (:fixed "Jour de la Découverte" 12 5 :from 1900
   :authority "Découverte d'Haïti — 5 décembre 1492 (commémoration)")
  (:fixed "Noël" 12 25 :from 1900 :authority "Jour férié"))

(define-calendar cuba-holidays-calendar (:register "CU")
  (:fixed "Triunfo de la Revolución" 1 1 :from 1900 :authority "Día festivo")
  (:fixed "Día de la Victoria" 1 2 :from 1900 :authority "Día festivo")
  (:easter "Viernes Santo" -2 :from 2012
   :authority "Viernes Santo — feriado desde 2012")
  (:fixed "Día Internacional de los Trabajadores" 5 1 :from 1900 :authority "Día festivo")
  (:fixed "Asalto a los Cuarteles Moncada" 7 26 :from 1900 :authority "Día festivo")
  (:fixed "Día de la Rebeldía Nacional" 7 27 :from 1900 :authority "Día festivo")
  (:fixed "Inicio de las Guerras de Independencia" 10 10 :from 1900
   :authority "Grito de Yara — 10 de octubre de 1868")
  (:fixed "Navidad" 12 25 :from 1997 :authority "Navidad — feriado desde 1997")
  (:fixed "Fin de Año" 12 31 :from 1900 :authority "Día festivo"))

(define-calendar dominican-republic-holidays-calendar (:register "DO")
  (:fixed "Año Nuevo" 1 1 :from 1900 :authority "Día feriado")
  (:fixed "Día de los Reyes" 1 6 :from 1900 :authority "Epifanía")
  (:fixed "Día de la Altagracia" 1 21 :from 1900 :authority "Nuestra Señora de la Altagracia")
  (:fixed "Día de Duarte" 1 26 :from 1900 :authority "Natalicio de Juan Pablo Duarte")
  (:fixed "Día de la Independencia" 2 27 :from 1900
   :authority "Independencia 27 de febrero de 1844")
  (:easter "Viernes Santo" -2 :from 1900 :authority "Semana Santa")
  (:fixed "Día del Trabajo" 5 1 :from 1900 :authority "Día feriado")
  (:fixed "Día de la Restauración" 8 16 :from 1900
   :authority "Guerra de la Restauración — 16 de agosto")
  (:fixed "Día de las Mercedes" 9 24 :from 1900 :authority "Virgen de las Mercedes")
  (:fixed "Día de la Constitución" 11 6 :from 1900 :authority "Constitución de 1844")
  (:fixed "Navidad" 12 25 :from 1900 :authority "Día feriado"))

(define-calendar nicaragua-holidays-calendar (:register "NI")
  (:fixed "Año Nuevo" 1 1 :from 1900 :authority "Día feriado")
  (:easter "Jueves Santo" -3 :from 1900 :authority "Semana Santa")
  (:easter "Viernes Santo" -2 :from 1900 :authority "Semana Santa")
  (:fixed "Día del Trabajo" 5 1 :from 1900 :authority "Día feriado")
  (:fixed "Día de la Revolución" 7 19 :from 1900 :authority "Revolución Sandinista")
  (:fixed "Batalla de San Jacinto" 9 14 :from 1900 :authority "Feriado nacional")
  (:fixed "Día de la Independencia" 9 15 :from 1900 :authority "Independencia Centroamericana")
  (:fixed "Inmaculada Concepción" 12 8 :from 1900 :authority "Día feriado")
  (:fixed "Navidad" 12 25 :from 1900 :authority "Día feriado"))

(define-calendar el-salvador-holidays-calendar (:register "SV")
  (:fixed "Año Nuevo" 1 1 :from 1900 :authority "Asueto")
  (:easter "Jueves Santo" -3 :from 1900 :authority "Semana Santa")
  (:easter "Viernes Santo" -2 :from 1900 :authority "Semana Santa")
  (:easter "Sábado Santo" -1 :from 1900 :authority "Semana Santa")
  (:fixed "Día del Trabajo" 5 1 :from 1900 :authority "Asueto")
  (:fixed "Fiestas Agostinas" 8 1 :from 1900 :authority "Fiestas de San Salvador")
  (:fixed "Fiestas Agostinas" 8 2 :from 1900 :authority "Fiestas de San Salvador")
  (:fixed "Fiestas Agostinas" 8 3 :from 1900 :authority "Fiestas de San Salvador")
  (:fixed "Fiestas Agostinas" 8 4 :from 1900 :authority "Fiestas de San Salvador")
  (:fixed "Fiestas Agostinas" 8 5 :from 1900 :authority "Fiestas de San Salvador")
  (:fixed "Fiestas Agostinas" 8 6 :from 1900 :authority "Fiestas de San Salvador")
  (:fixed "Día de la Independencia" 9 15 :from 1900 :authority "Independencia 1821")
  (:fixed "Día de los Difuntos" 11 2 :from 1900 :authority "Asueto")
  (:fixed "Navidad" 12 25 :from 1900 :authority "Asueto"))

(define-calendar costa-rica-holidays-calendar (:register "CR")
  (:fixed "Año Nuevo" 1 1 :from 1900 :authority "Día feriado")
  (:fixed "Juan Santamaría" 4 11 :from 1900 :authority "Batalla de Rivas — 11 de abril")
  (:easter "Jueves Santo" -3 :from 1900 :authority "Semana Santa")
  (:easter "Viernes Santo" -2 :from 1900 :authority "Semana Santa")
  (:fixed "Día del Trabajador" 5 1 :from 1900 :authority "Día feriado")
  (:fixed "Anexión de Guanacaste" 7 25 :from 1900 :authority "Feriado nacional")
  (:fixed "Día de la Virgen de los Ángeles" 8 2 :from 1900 :authority "La Negrita")
  (:fixed "Día de la Madre" 8 15 :from 1900 :authority "Asunción / Día de la Madre")
  (:fixed "Día de la Independencia" 9 15 :from 1900 :authority "Independencia 1821")
  (:fixed "Día de la Abolición del Ejército" 12 1 :from 1900
   :authority "Abolición del ejército — 1 de diciembre de 1948")
  (:fixed "Navidad" 12 25 :from 1900 :authority "Día feriado"))

(define-calendar panama-holidays-calendar (:register "PA")
  (:fixed "Año Nuevo" 1 1 :from 1900 :authority "Día feriado")
  (:fixed "Día de los Mártires" 1 9 :from 1900 :authority "Mártires de la gesta de 1964")
  (:easter "Viernes Santo" -2 :from 1900 :authority "Semana Santa")
  (:fixed "Día del Trabajo" 5 1 :from 1900 :authority "Día feriado")
  (:fixed "Separación de Colombia" 11 3 :from 1900 :authority "Independencia 1903")
  (:fixed "Día de la Bandera" 11 4 :from 1900 :authority "Día de la bandera")
  (:fixed "Grito de Independencia de la Villa de Los Santos" 11 10 :from 1900
   :authority "Primer grito de independencia")
  (:fixed "Independencia de Panamá de España" 11 28 :from 1900
   :authority "Independencia de España — 1821")
  (:fixed "Inmaculada Concepción" 12 8 :from 1900 :authority "Día feriado")
  (:fixed "Navidad" 12 25 :from 1900 :authority "Día feriado"))

(define-calendar uruguay-holidays-calendar (:register "UY")
  (:fixed "Año Nuevo" 1 1 :from 1900 :authority "Feriado")
  (:fixed "Día de los Reyes" 1 6 :from 1900 :authority "Epifanía")
  (:easter "Carnaval" -48 :from 1900 :authority "Carnaval — lunes")
  (:easter "Carnaval" -47 :from 1900 :authority "Carnaval — martes")
  (:fixed "Desembarco de los 33 Orientales" 4 19 :from 1900
   :authority "Desembarco de los Treinta y Tres — 19 de abril")
  (:fixed "Día del Trabajador" 5 1 :from 1900 :authority "Feriado")
  (:fixed "Jura de la Constitución" 7 18 :from 1900 :authority "Constitución de 1830")
  (:fixed "Día de la Independencia" 8 25 :from 1900
   :authority "Independencia 25 de agosto de 1825")
  (:fixed "Navidad" 12 25 :from 1900 :authority "Feriado"))

(define-calendar new-zealand-holidays-calendar (:register "NZ")
  (:fixed "New Year's Day" 1 1 :from 1900 :authority "Public holiday")
  (:fixed "Day after New Year's Day" 1 2 :from 1900 :authority "Public holiday")
  (:fixed "Waitangi Day" 2 6 :from 1900 :authority "Treaty of Waitangi — 6 February")
  (:easter "Good Friday" -2 :from 1900 :authority "Public holiday")
  (:easter "Easter Monday" 1 :from 1900 :authority "Public holiday")
  (:fixed "ANZAC Day" 4 25 :from 1900 :authority "Public holiday")
  (:nth-weekday "King's Birthday" 6 :monday 1 :from 1900
   :authority "Sovereign's Birthday — first Monday in June")
  (:nth-weekday "Labour Day" 10 :monday 4 :from 1900
   :authority "Labour Day — fourth Monday in October")
  (:fixed "Christmas Day" 12 25 :from 1900 :authority "Public holiday")
  (:fixed "Boxing Day" 12 26 :from 1900 :authority "Public holiday"))

;;; --- Africa ---------------------------------------------------------------

(define-calendar senegal-holidays-calendar (:register "SN")
  (:fixed "Nouvel An" 1 1 :from 1960 :authority "Jour férié")
  (:easter "Lundi de Pâques" 1 :from 1960 :authority "Jour férié")
  (:fixed "Fête de l'Indépendance" 4 4 :from 1960
   :authority "Indépendance 4 avril 1960")
  (:fixed "Fête du Travail" 5 1 :from 1960 :authority "Jour férié")
  (:easter "Ascension" 39 :from 1960 :authority "Jour férié")
  (:easter "Lundi de Pentecôte" 50 :from 1960 :authority "Jour férié")
  (:fixed "Assomption" 8 15 :from 1960 :authority "Jour férié")
  (:fixed "Toussaint" 11 1 :from 1960 :authority "Jour férié")
  (:fixed "Noël" 12 25 :from 1960 :authority "Jour férié")
  (:computed "Aïd el-Fitr" #'eid-al-fitr :from 1960 :authority "Jour férié (tabular)")
  (:computed "Aïd el-Adha" #'eid-al-adha :from 1960 :authority "Jour férié (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1960 :authority "Jour férié (tabular)")
  (:computed "Achoura" #'ashura-date :from 1960 :authority "10 Muharram (tabular)")
  (:computed "Magal de Touba" #'magal-de-touba-date :from 1960
   :authority "18 Rabīʿ II — Magal de Touba (tabular)"))

(define-calendar chad-holidays-calendar (:register "TD")
  (:fixed "Nouvel An" 1 1 :from 1960 :authority "Jour férié")
  (:easter "Lundi de Pâques" 1 :from 1960 :authority "Jour férié")
  (:fixed "Fête du Travail" 5 1 :from 1960 :authority "Jour férié")
  (:fixed "Fête de l'Indépendance" 8 11 :from 1960
   :authority "Indépendance 11 août 1960")
  (:fixed "Toussaint" 11 1 :from 1960 :authority "Jour férié")
  (:fixed "Proclamation de la République" 11 28 :from 1960
   :authority "République du Tchad — 28 novembre 1958")
  (:fixed "Journée de la Liberté et de la Démocratie" 12 1 :from 1990
   :authority "Journée nationale — 1er décembre")
  (:fixed "Noël" 12 25 :from 1960 :authority "Jour férié")
  (:computed "Aïd el-Fitr" #'eid-al-fitr :from 1960 :authority "Jour férié (tabular)")
  (:computed "Aïd el-Adha" #'eid-al-adha :from 1960 :authority "Jour férié (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1960 :authority "Jour férié (tabular)"))

(define-calendar somalia-holidays-calendar (:register "SO")
  (:fixed "New Year's Day" 1 1 :from 1960 :authority "Public holiday")
  (:fixed "Labour Day" 5 1 :from 1960 :authority "Public holiday")
  (:fixed "Independence Day" 7 1 :from 1960
   :authority "Independence of Italian Somaliland — 1 July 1960")
  (:fixed "Christmas Day" 12 25 :from 1960 :authority "Public holiday")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1960 :authority "Public holiday (tabular)")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1960 :authority "Public holiday (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1960 :authority "Public holiday (tabular)")
  (:computed "Ashura" #'ashura-date :from 1960 :authority "10 Muharram (tabular)"))

(define-calendar zimbabwe-holidays-calendar (:register "ZW")
  (:fixed "New Year's Day" 1 1 :from 1980 :authority "Public holiday")
  (:easter "Good Friday" -2 :from 1980 :authority "Public holiday")
  (:easter "Easter Saturday" -1 :from 1980 :authority "Public holiday")
  (:easter "Easter Monday" 1 :from 1980 :authority "Public holiday")
  (:fixed "Independence Day" 4 18 :from 1980
   :authority "Independence 18 April 1980")
  (:fixed "Workers' Day" 5 1 :from 1980 :authority "Public holiday")
  (:fixed "Africa Day" 5 25 :from 1980 :authority "Public holiday")
  (:nth-weekday "Heroes' Day" 8 :monday 1 :from 1980
   :authority "Heroes' Day — first Monday in August")
  (:computed "Defence Forces Day"
   (lambda (y) (+ (nth-weekday-of-month y 8 1 1) 1))
   :from 1980
   :authority "Defence Forces Day — Tuesday after Heroes' Day")
  (:fixed "Unity Day" 12 22 :from 1980 :authority "Public holiday")
  (:fixed "Christmas Day" 12 25 :from 1980 :authority "Public holiday")
  (:fixed "Boxing Day" 12 26 :from 1980 :authority "Public holiday"))

(define-calendar guinea-holidays-calendar (:register "GN")
  (:fixed "Nouvel An" 1 1 :from 1958 :authority "Jour férié")
  (:fixed "Fête du Travail" 5 1 :from 1958 :authority "Jour férié")
  (:fixed "Journée de l'Afrique" 5 25 :from 1958 :authority "Jour férié")
  (:fixed "Assomption" 8 15 :from 1958 :authority "Jour férié")
  (:fixed "Fête de l'Indépendance" 10 2 :from 1958
   :authority "Indépendance 2 octobre 1958")
  (:fixed "Toussaint" 11 1 :from 1958 :authority "Jour férié")
  (:fixed "Noël" 12 25 :from 1958 :authority "Jour férié")
  (:computed "Aïd el-Fitr" #'eid-al-fitr :from 1958 :authority "Jour férié (tabular)")
  (:computed "Aïd el-Adha" #'eid-al-adha :from 1958 :authority "Jour férié (tabular)"))

(define-calendar rwanda-holidays-calendar (:register "RW")
  (:fixed "New Year's Day" 1 1 :from 1962 :authority "Public holiday")
  (:fixed "Day after New Year" 1 2 :from 1962 :authority "Public holiday")
  (:fixed "Heroes' Day" 2 1 :from 1962 :authority "Public holiday")
  (:easter "Good Friday" -2 :from 1962 :authority "Public holiday")
  (:easter "Easter Monday" 1 :from 1962 :authority "Public holiday")
  (:fixed "Genocide against the Tutsi Memorial" 4 7 :from 1995
   :authority "Kwibuka — genocide memorial day")
  (:fixed "Labour Day" 5 1 :from 1962 :authority "Public holiday")
  (:fixed "Independence Day" 7 1 :from 1962
   :authority "Independence 1 July 1962")
  (:fixed "Liberation Day" 7 4 :from 1995
   :authority "Liberation Day — 4 July 1994")
  (:fixed "Assumption" 8 15 :from 1962 :authority "Public holiday")
  (:fixed "Christmas Day" 12 25 :from 1962 :authority "Public holiday")
  (:fixed "Boxing Day" 12 26 :from 1962 :authority "Public holiday"))

(define-calendar benin-holidays-calendar (:register "BJ")
  (:fixed "Nouvel An" 1 1 :from 1960 :authority "Jour férié")
  (:fixed "Fête du Vodoun" 1 10 :from 1998
   :authority "Jour férié — fête du Vodoun depuis 1998")
  (:easter "Lundi de Pâques" 1 :from 1960 :authority "Jour férié")
  (:fixed "Fête du Travail" 5 1 :from 1960 :authority "Jour férié")
  (:easter "Ascension" 39 :from 1960 :authority "Jour férié")
  (:easter "Lundi de Pentecôte" 50 :from 1960 :authority "Jour férié")
  (:fixed "Fête de l'Indépendance" 8 1 :from 1960
   :authority "Indépendance 1er août 1960")
  (:fixed "Assomption" 8 15 :from 1960 :authority "Jour férié")
  (:fixed "Toussaint" 11 1 :from 1960 :authority "Jour férié")
  (:fixed "Noël" 12 25 :from 1960 :authority "Jour férié")
  (:computed "Aïd el-Fitr" #'eid-al-fitr :from 1960 :authority "Jour férié (tabular)")
  (:computed "Aïd el-Adha" #'eid-al-adha :from 1960 :authority "Jour férié (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1960 :authority "Jour férié (tabular)"))

(define-calendar togo-holidays-calendar (:register "TG")
  (:fixed "Nouvel An" 1 1 :from 1960 :authority "Jour férié")
  (:fixed "Journée de la Libération" 1 13 :from 1967
   :authority "Libération — 13 janvier 1967")
  (:easter "Lundi de Pâques" 1 :from 1960 :authority "Jour férié")
  (:fixed "Fête de l'Indépendance" 4 27 :from 1960
   :authority "Indépendance 27 avril 1960")
  (:fixed "Fête du Travail" 5 1 :from 1960 :authority "Jour férié")
  (:easter "Ascension" 39 :from 1960 :authority "Jour férié")
  (:easter "Lundi de Pentecôte" 50 :from 1960 :authority "Jour férié")
  (:fixed "Journée des Martyrs" 6 21 :from 1960 :authority "Jour férié")
  (:fixed "Assomption" 8 15 :from 1960 :authority "Jour férié")
  (:fixed "Toussaint" 11 1 :from 1960 :authority "Jour férié")
  (:fixed "Noël" 12 25 :from 1960 :authority "Jour férié")
  (:computed "Aïd el-Fitr" #'eid-al-fitr :from 1960 :authority "Jour férié (tabular)")
  (:computed "Aïd el-Adha" #'eid-al-adha :from 1960 :authority "Jour férié (tabular)"))

(define-calendar sierra-leone-holidays-calendar (:register "SL")
  (:fixed "New Year's Day" 1 1 :from 1961 :authority "Public holiday")
  (:fixed "Armed Forces Day" 2 18 :from 2002
   :authority "Armed Forces Day — 18 February")
  (:fixed "Independence Day" 4 27 :from 1961
   :authority "Independence 27 April 1961")
  (:fixed "Labour Day" 5 1 :from 1961 :authority "Public holiday")
  (:fixed "Christmas Day" 12 25 :from 1961 :authority "Public holiday")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1961 :authority "Public holiday (tabular)")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1961 :authority "Public holiday (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1961 :authority "Public holiday (tabular)"))

(define-calendar south-sudan-holidays-calendar (:register "SS")
  (:fixed "New Year's Day" 1 1 :from 2011 :authority "Public holiday")
  (:fixed "Peace Agreement Day" 1 9 :from 2011
   :authority "Comprehensive Peace Agreement — 9 January 2005")
  (:easter "Easter Monday" 1 :from 2011 :authority "Public holiday")
  (:fixed "Labour Day" 5 1 :from 2011 :authority "Public holiday")
  (:fixed "Independence Day" 7 9 :from 2011
   :authority "Independence 9 July 2011")
  (:fixed "Martyrs' Day" 7 30 :from 2011 :authority "Public holiday")
  (:fixed "Christmas Day" 12 25 :from 2011 :authority "Public holiday")
  (:fixed "Boxing Day" 12 26 :from 2011 :authority "Public holiday"))

;;; --- Gazette corpora (KH Buddhist holidays) -------------------------------

(defparameter *kh-gazette-path*
  (merge-pathnames "data/kh/gazette-holidays.sexp"
                   (asdf:system-source-directory "cl-stack-calendars")))

(defvar *kh-gazette* nil)

(defun kh-gazette ()
  (or *kh-gazette* (setf *kh-gazette* (load-gazette-corpus *kh-gazette-path*))))

(defun kh-gazette-for-year (year) (gazette-corpus-for-year (kh-gazette) year))

(defun kh-gazette-transfers-for-year (year)
  (gazette-transfers-for-year (kh-gazette) year))

;;; --- Asia / Pacific -------------------------------------------------------

(define-calendar cambodia-holidays-calendar (:register "KH")
  (:fixed "New Year's Day" 1 1 :from 1953 :authority "Public holiday")
  (:fixed "Victory over Genocide Day" 1 7 :from 1979
   :authority "Liberation from Khmer Rouge — 7 January 1979")
  (:fixed "International Women's Day" 3 8 :from 1953 :authority "Public holiday")
  (:fixed "Khmer New Year" 4 13 :from 1953 :authority "Chaul Chnam — day 1 (statutory)")
  (:fixed "Khmer New Year" 4 14 :from 1953 :authority "Chaul Chnam — day 2")
  (:fixed "Khmer New Year" 4 15 :from 1953 :authority "Chaul Chnam — day 3")
  (:fixed "Labour Day" 5 1 :from 1953 :authority "Public holiday")
  (:fixed "King's Birthday" 10 29 :from 1953 :authority "Public holiday")
  (:fixed "Independence Day" 11 9 :from 1953
   :authority "Independence 9 November 1953")
  (:fixed "Constitution Day" 9 24 :from 1993
   :authority "Constitution of Cambodia — 24 September 1993"))

(define-calendar laos-holidays-calendar (:register "LA")
  (:fixed "New Year's Day" 1 1 :from 1949 :authority "Public holiday")
  (:fixed "Pi Mai Lao" 4 14 :from 1949 :authority "Lao New Year — day 1")
  (:fixed "Pi Mai Lao" 4 15 :from 1949 :authority "Lao New Year — day 2")
  (:fixed "Pi Mai Lao" 4 16 :from 1949 :authority "Lao New Year — day 3")
  (:fixed "Labour Day" 5 1 :from 1949 :authority "Public holiday")
  (:fixed "National Day" 12 2 :from 1949
   :authority "Lao PDR founding — 2 December 1975"))

(define-calendar tajikistan-holidays-calendar (:register "TJ")
  (:fixed "New Year's Day" 1 1 :from 1991 :authority "Public holiday")
  (:fixed "International Women's Day" 3 8 :from 1991 :authority "Public holiday")
  (:computed "Navruz" #'novruz-date :from 1991 :authority "Navruz — 21 March")
  (:fixed "Labour Day" 5 1 :from 1991 :authority "Public holiday")
  (:fixed "National Unity Day" 6 27 :from 1997
   :authority "National Unity Day — 27 June 1997")
  (:fixed "Independence Day" 9 9 :from 1991
   :authority "Independence 9 September 1991")
  (:fixed "Constitution Day" 11 6 :from 1994
   :authority "Constitution Day — 6 November 1994")
  (:computed "Idi Ramazon" #'eid-al-fitr :from 1991 :authority "Eid al-Fitr (tabular)")
  (:computed "Idi Kurbon" #'eid-al-adha :from 1991 :authority "Eid al-Adha (tabular)"))

(define-calendar papua-new-guinea-holidays-calendar (:register "PG")
  (:fixed "New Year's Day" 1 1 :from 1975 :authority "Public holiday")
  (:easter "Good Friday" -2 :from 1975 :authority "Public holiday")
  (:easter "Easter Saturday" -1 :from 1975 :authority "Public holiday")
  (:easter "Easter Monday" 1 :from 1975 :authority "Public holiday")
  (:nth-weekday "King's Birthday" 6 :monday 2 :from 1975
   :authority "Sovereign's Birthday — second Monday in June")
  (:fixed "Remembrance Day" 7 23 :from 1975 :authority "Public holiday")
  (:fixed "Independence Day" 9 16 :from 1975
   :authority "Independence 16 September 1975")
  (:fixed "Christmas Day" 12 25 :from 1975 :authority "Public holiday")
  (:fixed "Boxing Day" 12 26 :from 1975 :authority "Public holiday"))

(define-calendar hong-kong-holidays-calendar (:register "HK")
  (:fixed "New Year's Day" 1 1 :from 1997 :authority "General holidays ordinance")
  (:computed "Lunar New Year's Day" #'chinese-new-year-date :from 1997
   :authority "Lunar New Year (computed)")
  (:computed "Lunar New Year Day 2"
   (lambda (y) (let ((d (chinese-new-year-date y))) (and d (+ d 1))))
   :from 1997 :authority "Lunar New Year")
  (:computed "Lunar New Year Day 3"
   (lambda (y) (let ((d (chinese-new-year-date y))) (and d (+ d 2))))
   :from 1997 :authority "Lunar New Year")
  (:easter "Good Friday" -2 :from 1997 :authority "General holiday")
  (:easter "Easter Monday" 1 :from 1997 :authority "General holiday")
  (:fixed "Labour Day" 5 1 :from 1997 :authority "General holiday")
  (:fixed "HKSAR Establishment Day" 7 1 :from 1997 :authority "1 July 1997")
  (:fixed "National Day" 10 1 :from 1997 :authority "PRC National Day")
  (:fixed "Christmas Day" 12 25 :from 1997 :authority "General holiday")
  (:fixed "Boxing Day" 12 26 :from 1997 :authority "General holiday"))

(define-calendar kyrgyzstan-holidays-calendar (:register "KG")
  (:fixed "New Year's Day" 1 1 :from 1991 :authority "Public holiday")
  (:fixed "Defender of the Fatherland Day" 2 23 :from 1991 :authority "Public holiday")
  (:fixed "International Women's Day" 3 8 :from 1991 :authority "Public holiday")
  (:computed "Nooruz" #'novruz-date :from 1991 :authority "Navruz — 21 March")
  (:fixed "People's April Revolution Day" 4 7 :from 2010
   :authority "April Revolution — 7 April 2010")
  (:fixed "Labour Day" 5 1 :from 1991 :authority "Public holiday")
  (:fixed "Constitution Day" 5 5 :from 1993 :authority "Constitution Day")
  (:fixed "Victory Day" 5 9 :from 1991 :authority "Victory Day")
  (:fixed "National Day" 6 28 :from 1991 :authority "National Day")
  (:fixed "Independence Day" 8 31 :from 1991
   :authority "Independence 31 August 1991")
  (:computed "Orozo Ait" #'eid-al-fitr :from 1991 :authority "Eid al-Fitr (tabular)")
  (:computed "Kurman Ait" #'eid-al-adha :from 1991 :authority "Eid al-Adha (tabular)"))

(define-calendar singapore-holidays-calendar (:register "SG")
  (:fixed "New Year's Day" 1 1 :from 1965 :authority "Public holiday")
  (:computed "Chinese New Year" #'chinese-new-year-date :from 1965
   :authority "Lunar New Year (computed)")
  (:computed "Chinese New Year Day 2"
   (lambda (y) (let ((d (chinese-new-year-date y))) (and d (+ d 1))))
   :from 1965 :authority "Lunar New Year")
  (:easter "Good Friday" -2 :from 1965 :authority "Public holiday")
  (:fixed "Labour Day" 5 1 :from 1965 :authority "Public holiday")
  (:fixed "National Day" 8 9 :from 1965
   :authority "Independence 9 August 1965")
  (:fixed "Christmas Day" 12 25 :from 1965 :authority "Public holiday"))

;;; --- Europe (non-EU-27 in population-order) -------------------------------

(define-calendar switzerland-holidays-calendar (:register "CH")
  (:fixed "New Year's Day" 1 1 :from 1900
   :authority "Bundesgesetz — widely observed; cantonal variation")
  (:fixed "Swiss National Day" 8 1 :from 1891
   :authority "Bundesfeiertag — 1 August (federal since 1891)")
  (:fixed "Christmas Day" 12 25 :from 1900
   :authority "Widely observed federal-adjacent public holiday"))

(define-calendar norway-holidays-calendar (:register "NO")
  (:fixed "New Year's Day" 1 1 :from 1905 :authority "Offentlig høytidsdag")
  (:easter "Maundy Thursday" -3 :from 1905 :authority "Offentlig høytidsdag")
  (:easter "Good Friday" -2 :from 1905 :authority "Offentlig høytidsdag")
  (:easter "Easter Monday" 1 :from 1905 :authority "Offentlig høytidsdag")
  (:fixed "Labour Day" 5 1 :from 1905 :authority "Offentlig høytidsdag")
  (:fixed "Constitution Day" 5 17 :from 1905
   :authority "Grunnlovsdagen — 17. mai 1814")
  (:easter "Whit Monday" 50 :from 1905 :authority "Offentlig høytidsdag")
  (:fixed "Christmas Day" 12 25 :from 1905 :authority "Offentlig høytidsdag")
  (:fixed "Boxing Day" 12 26 :from 1905 :authority "Offentlig høytidsdag"))

(define-calendar belarus-holidays-calendar (:register "BY")
  (:fixed "New Year's Day" 1 1 :from 1991 :authority "Государственный праздник")
  (:fixed "New Year's Day" 1 2 :from 1991 :authority "Государственный праздник")
  (:fixed "Orthodox Christmas" 1 7 :from 1991 :authority "Государственный праздник")
  (:fixed "Women's Day" 3 8 :from 1991 :authority "Государственный праздник")
  (:fixed "Constitution Day" 3 15 :from 1994
   :authority "День Конституции — 15 марта 1994")
  (:easter "Radonitsa" 9 :orthodox t :from 1991
   :authority "Радоница — 9-й день после Пасхи")
  (:fixed "Labour Day" 5 1 :from 1991 :authority "Государственный праздник")
  (:fixed "Victory Day" 5 9 :from 1991 :authority "Государственный праздник")
  (:fixed "Independence Day" 7 3 :from 1991
   :authority "День Независимости — 3 июля 1944 (освобождение Минска)")
  (:fixed "October Revolution Day" 11 7 :from 1991
   :authority "День Октябрьской революции")
  (:fixed "Catholic Christmas" 12 25 :from 1991 :authority "Государственный праздник"))

(define-calendar serbia-holidays-calendar (:register "RS")
  (:fixed "New Year's Day" 1 1 :from 2006 :authority "Дан државног празника")
  (:fixed "New Year's Day" 1 2 :from 2006 :authority "Дан државног празника")
  (:fixed "Orthodox Christmas" 1 7 :from 2006 :authority "Дан државног празника")
  (:fixed "Statehood Day" 2 15 :from 2006 :authority "Дан државности — 15. фебруар")
  (:fixed "Statehood Day" 2 16 :from 2006 :authority "Дан државности — 16. фебруар")
  (:fixed "Labour Day" 5 1 :from 2006 :authority "Дан државног празника")
  (:fixed "Labour Day" 5 2 :from 2006 :authority "Дан државног празника")
  (:fixed "Armistice Day" 11 11 :from 2006
   :authority "Дан примирја у Првом светском рату — 11. новембар"))

(define-calendar georgia-holidays-calendar (:register "GE")
  (:fixed "New Year's Day" 1 1 :from 1991 :authority "Public holiday")
  (:fixed "New Year's Day" 1 2 :from 1991 :authority "Public holiday")
  (:fixed "Orthodox Christmas" 1 7 :from 1991 :authority "Public holiday")
  (:fixed "Mother's Day" 3 3 :from 1991 :authority "Public holiday")
  (:fixed "International Women's Day" 3 8 :from 1991 :authority "Public holiday")
  (:fixed "National Unity Day" 4 9 :from 1991 :authority "Public holiday")
  (:fixed "Victory Day" 5 9 :from 1991 :authority "Public holiday")
  (:fixed "St Andrew's Day" 5 12 :from 1991 :authority "Public holiday")
  (:fixed "Independence Day" 5 26 :from 1991
   :authority "Independence 26 May 1918 / restored 1991")
  (:fixed "Mariamoba" 8 28 :from 1991 :authority "Public holiday")
  (:fixed "Svetitskhovloba" 10 14 :from 1991 :authority "Public holiday")
  (:fixed "St George's Day" 11 23 :from 1991 :authority "Public holiday"))

;;; --- MENA / Central Asia --------------------------------------------------

(define-calendar tunisia-holidays-calendar (:register "TN")
  (:fixed "New Year's Day" 1 1 :from 1956 :authority "Jour férié")
  (:fixed "Revolution Day" 1 14 :from 2011
   :authority "Révolution — 14 janvier 2011")
  (:fixed "Independence Day" 3 20 :from 1956
   :authority "Indépendance 20 mars 1956")
  (:fixed "Youth Day" 3 21 :from 1956 :authority "Jour férié")
  (:fixed "Martyrs' Day" 4 9 :from 1956 :authority "Jour férié")
  (:fixed "Labour Day" 5 1 :from 1956 :authority "Jour férié")
  (:fixed "Republic Day" 7 25 :from 1957
   :authority "République — 25 juillet 1957")
  (:fixed "Women's Day" 8 13 :from 1956 :authority "Jour férié")
  (:fixed "Evacuation Day" 10 15 :from 1956
   :authority "Évacuation des troupes françaises — 15 octobre 1963")
  (:computed "Aïd el-Fitr" #'eid-al-fitr :from 1956 :authority "Jour férié (tabular)")
  (:computed "Aïd el-Adha" #'eid-al-adha :from 1956 :authority "Jour férié (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1956 :authority "Jour férié (tabular)")
  (:computed "Islamic New Year" #'islamic-new-year-date :from 1956
   :authority "1 Muharram (tabular)"))

(define-calendar jordan-holidays-calendar (:register "JO")
  (:fixed "New Year's Day" 1 1 :from 1946 :authority "Public holiday")
  (:fixed "Labour Day" 5 1 :from 1946 :authority "Public holiday")
  (:fixed "Independence Day" 5 25 :from 1946
   :authority "Independence 25 May 1946")
  (:fixed "Christmas Day" 12 25 :from 1946 :authority "Public holiday")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1946 :authority "Public holiday (tabular)")
  (:computed "Eid al-Fitr"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 1))))
   :from 1946 :authority "Eid al-Fitr Day 2")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1946 :authority "Public holiday (tabular)")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 1))))
   :from 1946 :authority "Eid al-Adha Day 2")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 2))))
   :from 1946 :authority "Eid al-Adha Day 3")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 3))))
   :from 1946 :authority "Eid al-Adha Day 4")
  (:computed "Mawlid" #'mawlid-date :from 1946 :authority "Public holiday (tabular)")
  (:computed "Islamic New Year" #'islamic-new-year-date :from 1946
   :authority "1 Muharram (tabular)")
  (:computed "Isra and Mi'raj" #'isra-miraj-date :from 1946
   :authority "27 Rajab (tabular)"))

(define-calendar united-arab-emirates-holidays-calendar (:register "AE")
  (:fixed "New Year's Day" 1 1 :from 1971 :authority "Public holiday")
  (:fixed "Commemoration Day" 11 30 :from 2015
   :authority "Martyrs' Day — 30 November (from 2015)")
  (:fixed "National Day" 12 2 :from 1971 :authority "Union Day — 2 December 1971")
  (:fixed "National Day" 12 3 :from 1971 :authority "Union Day holiday")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1971 :authority "Public holiday (tabular)")
  (:computed "Eid al-Fitr"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 1))))
   :from 1971 :authority "Eid al-Fitr Day 2")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1971 :authority "Public holiday (tabular)")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 1))))
   :from 1971 :authority "Eid al-Adha Day 2")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 2))))
   :from 1971 :authority "Eid al-Adha Day 3")
  (:computed "Islamic New Year" #'islamic-new-year-date :from 1971
   :authority "1 Muharram (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1971 :authority "Public holiday (tabular)"))

(define-calendar azerbaijan-holidays-calendar (:register "AZ")
  (:fixed "New Year's Day" 1 1 :from 1991 :authority "Bayram günü")
  (:fixed "New Year's Day" 1 2 :from 1991 :authority "Bayram günü")
  (:fixed "Black January" 1 20 :from 1991 :authority "Qara Yanvar — 20 yanvar 1990")
  (:fixed "International Women's Day" 3 8 :from 1991 :authority "Bayram günü")
  (:computed "Novruz" #'novruz-date :from 1991 :authority "Novruz — 21 mart")
  (:fixed "Victory Day" 11 8 :from 1991 :authority "Zəfər Günü — 8 noyabr 2020")
  (:fixed "State Flag Day" 11 9 :from 2009 :authority "Dövlət Bayrağı Günü")
  (:fixed "Constitution Day" 11 12 :from 1991 :authority "Konstitusiya Günü")
  (:fixed "Solidarity Day" 12 31 :from 1991 :authority "Dünya azərbaycanlılarının həmrəyliyi")
  (:computed "Ramazan Bayramı" #'eid-al-fitr :from 1991 :authority "Eid al-Fitr (tabular)")
  (:computed "Qurban Bayramı" #'eid-al-adha :from 1991 :authority "Eid al-Adha (tabular)"))

(define-calendar libya-holidays-calendar (:register "LY")
  (:fixed "February 17 Revolution" 2 17 :from 2011
   :authority "17 February Revolution — public holiday")
  (:fixed "Labour Day" 5 1 :from 1951 :authority "Public holiday")
  (:fixed "Evacuation Day" 10 23 :from 2011
   :authority "Liberation of Tripoli — 23 October 2011")
  (:fixed "Independence Day" 12 24 :from 1951
   :authority "Independence 24 December 1951")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1951 :authority "Public holiday (tabular)")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1951 :authority "Public holiday (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1951 :authority "Public holiday (tabular)")
  (:computed "Islamic New Year" #'islamic-new-year-date :from 1951
   :authority "1 Muharram (tabular)"))

(define-calendar lebanon-holidays-calendar (:register "LB")
  (:fixed "New Year's Day" 1 1 :from 1943 :authority "Public holiday")
  (:fixed "Labour Day" 5 1 :from 1943 :authority "Public holiday")
  (:fixed "Assumption" 8 15 :from 1943 :authority "Public holiday")
  (:fixed "All Saints' Day" 11 1 :from 1943 :authority "Public holiday")
  (:fixed "Independence Day" 11 22 :from 1943
   :authority "Independence 22 November 1943")
  (:fixed "Christmas Day" 12 25 :from 1943 :authority "Public holiday")
  (:easter "Good Friday" -2 :from 1943 :authority "Public holiday")
  (:easter "Easter Monday" 1 :from 1943 :authority "Public holiday")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1943 :authority "Public holiday (tabular)")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1943 :authority "Public holiday (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1943 :authority "Public holiday (tabular)"))

(define-calendar oman-holidays-calendar (:register "OM")
  (:fixed "Renaissance Day" 7 23 :from 1970
   :authority "Renaissance Day — accession of Sultan Qaboos 1970")
  (:fixed "National Day" 11 18 :from 1970 :authority "National Day — 18 November")
  (:fixed "National Day" 11 19 :from 1970 :authority "National Day holiday")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1970 :authority "Public holiday (tabular)")
  (:computed "Eid al-Fitr"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 1))))
   :from 1970 :authority "Eid al-Fitr Day 2")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1970 :authority "Public holiday (tabular)")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 1))))
   :from 1970 :authority "Eid al-Adha Day 2")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 2))))
   :from 1970 :authority "Eid al-Adha Day 3")
  (:computed "Islamic New Year" #'islamic-new-year-date :from 1970
   :authority "1 Muharram (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1970 :authority "Public holiday (tabular)"))

(define-calendar kuwait-holidays-calendar (:register "KW")
  (:fixed "New Year's Day" 1 1 :from 1961 :authority "Public holiday")
  (:fixed "National Day" 2 25 :from 1961 :authority "National Day — 25 February 1950")
  (:fixed "Liberation Day" 2 26 :from 1991
   :authority "Liberation Day — 26 February 1991")
  (:fixed "Labour Day" 5 1 :from 1961 :authority "Public holiday")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1961 :authority "Public holiday (tabular)")
  (:computed "Eid al-Fitr"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 1))))
   :from 1961 :authority "Eid al-Fitr Day 2")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1961 :authority "Public holiday (tabular)")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 1))))
   :from 1961 :authority "Eid al-Adha Day 2")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 2))))
   :from 1961 :authority "Eid al-Adha Day 3")
  (:computed "Islamic New Year" #'islamic-new-year-date :from 1961
   :authority "1 Muharram (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1961 :authority "Public holiday (tabular)"))

(define-calendar israel-holidays-calendar (:register "IL")
  (:computed "Rosh Hashanah"
   (lambda (y) (hebrew-holiday-in-gregorian-year y 1 1)) :from 1948
   :authority "ראש השנה — 1 Tishrei")
  (:computed "Rosh Hashanah Day 2"
   (lambda (y) (hebrew-holiday-in-gregorian-year y 1 2)) :from 1948
   :authority "ראש השנה — 2 Tishrei")
  (:computed "Yom Kippur"
   (lambda (y) (hebrew-holiday-in-gregorian-year y 1 10)) :from 1948
   :authority "יום כיפור — 10 Tishrei")
  (:computed "Sukkot"
   (lambda (y) (hebrew-holiday-in-gregorian-year y 1 15)) :from 1948
   :authority "סוכות — 15 Tishrei")
  (:computed "Simchat Torah"
   (lambda (y) (hebrew-holiday-in-gregorian-year y 1 22)) :from 1948
   :authority "שמחת תורה — 22 Tishrei")
  (:computed "Passover"
   (lambda (y)
     (let* ((start (fixed-from-date +gregorian+ y 1 1))
            (end (fixed-from-date +gregorian+ y 12 31))
            (hy (multiple-value-bind (h) (hebrew-date-from-fixed start) h)))
       (loop for h from (1- hy) to (+ hy 1)
             for rd = (fixed-from-hebrew-date h (hebrew-nisan-month h) 15)
             when (<= start rd end)
               return (date-from-rd rd))))
   :from 1948 :authority "פסח — 15 Nisan")
  (:computed "Passover Day 7"
   (lambda (y)
     (let* ((start (fixed-from-date +gregorian+ y 1 1))
            (end (fixed-from-date +gregorian+ y 12 31))
            (hy (multiple-value-bind (h) (hebrew-date-from-fixed start) h)))
       (loop for h from (1- hy) to (+ hy 1)
             for rd = (fixed-from-hebrew-date h (hebrew-nisan-month h) 21)
             when (<= start rd end)
               return (date-from-rd rd))))
   :from 1948 :authority "פסח — 21 Nisan")
  (:computed "Shavuot"
   (lambda (y) (hebrew-holiday-in-gregorian-year y 3 6)) :from 1948
   :authority "שבועות — 6 Sivan")
  (:computed "Independence Day"
   (lambda (y) (hebrew-holiday-in-gregorian-year y 2 5)) :from 1948
   :authority "יום העצמאות — 5 Iyar (Shabbat deferral not modeled)"))

;;; --- accessors ------------------------------------------------------------

(defun guatemala-holidays-calendar () (make-instance 'guatemala-holidays-calendar))
(defun ecuador-holidays-calendar () (make-instance 'ecuador-holidays-calendar))
(defun bolivia-holidays-calendar () (make-instance 'bolivia-holidays-calendar))
(defun haiti-holidays-calendar () (make-instance 'haiti-holidays-calendar))
(defun cuba-holidays-calendar () (make-instance 'cuba-holidays-calendar))
(defun dominican-republic-holidays-calendar ()
  (make-instance 'dominican-republic-holidays-calendar))
(defun nicaragua-holidays-calendar () (make-instance 'nicaragua-holidays-calendar))
(defun el-salvador-holidays-calendar () (make-instance 'el-salvador-holidays-calendar))
(defun costa-rica-holidays-calendar () (make-instance 'costa-rica-holidays-calendar))
(defun panama-holidays-calendar () (make-instance 'panama-holidays-calendar))
(defun uruguay-holidays-calendar () (make-instance 'uruguay-holidays-calendar))
(defun new-zealand-holidays-calendar () (make-instance 'new-zealand-holidays-calendar))
(defun senegal-holidays-calendar () (make-instance 'senegal-holidays-calendar))
(defun chad-holidays-calendar () (make-instance 'chad-holidays-calendar))
(defun somalia-holidays-calendar () (make-instance 'somalia-holidays-calendar))
(defun zimbabwe-holidays-calendar () (make-instance 'zimbabwe-holidays-calendar))
(defun guinea-holidays-calendar () (make-instance 'guinea-holidays-calendar))
(defun rwanda-holidays-calendar () (make-instance 'rwanda-holidays-calendar))
(defun benin-holidays-calendar () (make-instance 'benin-holidays-calendar))
(defun togo-holidays-calendar () (make-instance 'togo-holidays-calendar))
(defun sierra-leone-holidays-calendar () (make-instance 'sierra-leone-holidays-calendar))
(defun south-sudan-holidays-calendar () (make-instance 'south-sudan-holidays-calendar))
(defun cambodia-holidays-calendar (&key year transfers)
  "Cambodia public holidays. YEAR attaches gazetted Buddhist holiday block."
  (let ((tr (or transfers (when year (kh-gazette-transfers-for-year year)))))
    (make-instance 'cambodia-holidays-calendar :transfers tr)))
(defun laos-holidays-calendar () (make-instance 'laos-holidays-calendar))
(defun tajikistan-holidays-calendar () (make-instance 'tajikistan-holidays-calendar))
(defun papua-new-guinea-holidays-calendar ()
  (make-instance 'papua-new-guinea-holidays-calendar))
(defun hong-kong-holidays-calendar () (make-instance 'hong-kong-holidays-calendar))
(defun kyrgyzstan-holidays-calendar () (make-instance 'kyrgyzstan-holidays-calendar))
(defun singapore-holidays-calendar (&key year transfers)
  "Singapore public holidays. YEAR attaches MOM gazetted Vesak/Deepavali/Hari Raya."
  (let ((tr (or transfers (when year (sg-gazette-transfers-for-year year)))))
    (make-instance 'singapore-holidays-calendar :transfers tr)))
(defun switzerland-holidays-calendar () (make-instance 'switzerland-holidays-calendar))
(defun norway-holidays-calendar () (make-instance 'norway-holidays-calendar))
(defun belarus-holidays-calendar () (make-instance 'belarus-holidays-calendar))
(defun serbia-holidays-calendar () (make-instance 'serbia-holidays-calendar))
(defun georgia-holidays-calendar () (make-instance 'georgia-holidays-calendar))
(defun tunisia-holidays-calendar () (make-instance 'tunisia-holidays-calendar))
(defun jordan-holidays-calendar () (make-instance 'jordan-holidays-calendar))
(defun united-arab-emirates-holidays-calendar ()
  (make-instance 'united-arab-emirates-holidays-calendar))
(defun azerbaijan-holidays-calendar () (make-instance 'azerbaijan-holidays-calendar))
(defun libya-holidays-calendar () (make-instance 'libya-holidays-calendar))
(defun lebanon-holidays-calendar () (make-instance 'lebanon-holidays-calendar))
(defun oman-holidays-calendar () (make-instance 'oman-holidays-calendar))
(defun kuwait-holidays-calendar () (make-instance 'kuwait-holidays-calendar))
(defun israel-holidays-calendar () (make-instance 'israel-holidays-calendar))
