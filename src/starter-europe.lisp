(in-package #:cl-stack-calendars)

;;;; European calendars rebuilt from their statutes (#20-#24): the rules by
;;;; statute era, and the one-off days of data/<cc>/holidays.sexp (the same
;;;; blocks and helpers as starter-middle-east.lisp: MENA-BLOCKS,
;;;; MENA-DECREE-ROWS). The acts of each code are data/<cc>/statutes.sexp
;;;; (EUROPE-STATUTE-ERAS). The gold is data/tests/<cc>-holiday-gold.sexp,
;;;; built by scripts/generate_mena_holiday_gold.py from scripts/europe/<cc>.py.
;;;;
;;;; Scope (#25 item 2): a Sunday is listed only when the statute names that
;;;; day (PT Domingo de Páscoa, IT the first Sundays of L. 54/1977); "all
;;;; Sundays" clauses (IT L. 260/1949 art. 2) and unnamed Easter or Whit
;;;; Sundays (NL, IE, DE) are not listed. No weekend substitutes: none of these
;;;; statutes has one (IE s. 21 is a per-employee entitlement, #25 item 9).

(defparameter *europe-list-codes* '("IT" "NL" "DE" "IE" "PT" "TARGET")
  "Codes whose acts and one-off days are data/<cc>/statutes.sexp and
data/<cc>/holidays.sexp.")

(defun europe-statute-eras (&optional (codes *europe-list-codes*))
  "The acts that set the European lists of CODES, from data/<cc>/statutes.sexp:
plists with :CALENDAR, :KEY, :FROM, :TO, :AUTHORITY, :URI, :ISSUED,
:PUBLISHED and :IN-FORCE, or a :DATES-NOTE for a missing one (#93)."
  (yearly-list-statute-eras codes))

;;; --- TARGET ------------------------------------------------------------------

;;;; TARGET closing days: the ECB Governing Council's calendars for 1999 (31 Mar
;;;; and 15 Jul 1999 releases), 2000 and 2001 (15 Jul 1999, 25 May 2000) and the
;;;; long-term calendar from 2002 (14 Dec 2000). Calendar dates, no weekend
;;;; in-lieu (weekends are already non-settlement days). 31 December 1999 and
;;;; 2001 are data/target/holidays.sexp rows.
(define-calendar target-calendar (:register "TARGET" :constructor target-calendar)
  (:fixed "New Year's Day" 1 1 :from 1999
   :authority "ECB Governing Council, TARGET calendars 1999-2001; long-term calendar of 14 Dec 2000")
  (:fixed "Labour Day" 5 1 :from 2000
   :authority "ECB press release of 15 Jul 1999 (from 2000); long-term calendar of 14 Dec 2000")
  (:fixed "Christmas Day" 12 25 :from 1999
   :authority "ECB Governing Council, TARGET calendars 1999-2001; long-term calendar of 14 Dec 2000")
  (:fixed "Christmas Holiday" 12 26 :from 2000
   :authority "ECB press release of 15 Jul 1999 (from 2000); long-term calendar of 14 Dec 2000")
  (:easter "Good Friday" -2 :from 2000
   :authority "ECB press release of 15 Jul 1999 (from 2000); long-term calendar of 14 Dec 2000")
  (:easter "Easter Monday" 1 :from 2000
   :authority "ECB press release of 15 Jul 1999 (from 2000); long-term calendar of 14 Dec 2000"))

(defun target-calendar (&key year transfers suppressed working-days)
  "TARGET closing days (\"TARGET\"): the ECB calendars by era and the additional
closing days 31 December 1999 and 2001 (data/target/holidays.sexp)."
  (%mena-calendar 'target-calendar "TARGET" year transfers suppressed working-days))

;;; --- Germany -----------------------------------------------------------------

;;;; The bundeseinheitliche Feiertage: the days every Land's Feiertagsgesetz
;;;; lists, and 3 October (Einigungsvertrag Art. 2 Abs. 2). Days of only some
;;;; Länder are left out (DE-BY adds Bavaria's). 31 October 2017 was a holiday
;;;; in all 16 Länder (data/de/holidays.sexp). Floors before 1949 not researched.
(define-calendar germany-holidays-calendar (:register "DE" :constructor germany-holidays-calendar)
  (:fixed "Neujahr" 1 1 :from 1949 :authority "Feiertagsgesetze der Länder (bundeseinheitlich)")
  (:easter "Karfreitag" -2 :from 1949 :authority "Feiertagsgesetze der Länder (bundeseinheitlich)")
  (:easter "Ostermontag" 1 :from 1949 :authority "Feiertagsgesetze der Länder (bundeseinheitlich)")
  (:fixed "Tag der Arbeit" 5 1 :from 1949 :authority "Feiertagsgesetze der Länder (bundeseinheitlich)")
  (:easter "Christi Himmelfahrt" 39 :from 1949 :authority "Feiertagsgesetze der Länder (bundeseinheitlich)")
  (:easter "Pfingstmontag" 50 :from 1949 :authority "Feiertagsgesetze der Länder (bundeseinheitlich)")
  (:fixed "Tag der Deutschen Einheit" 6 17 :from 1954 :to 1990
   :authority "Gesetz über den Tag der deutschen Einheit vom 4. August 1953 (BRD; bis 1990)")
  (:fixed "Tag der Deutschen Einheit" 10 3 :from 1990
   :authority "Einigungsvertrag Art. 2 Abs. 2 (gesetzlicher Feiertag 3. Oktober)")
  (:fixed "1. Weihnachtstag" 12 25 :from 1949 :authority "Feiertagsgesetze der Länder (bundeseinheitlich)")
  (:fixed "2. Weihnachtstag" 12 26 :from 1949 :authority "Feiertagsgesetze der Länder (bundeseinheitlich)"))

(defun germany-holidays-calendar (&key year transfers suppressed working-days)
  "Bundeseinheitliche Feiertage of Germany (\"DE\"): the days of all sixteen
Feiertagsgesetze and 3 October, with Reformationstag 2017
(data/de/holidays.sexp). Länder days are not in it."
  (%mena-calendar 'germany-holidays-calendar "DE" year transfers suppressed working-days))

;;; --- Italy -------------------------------------------------------------------

(define-calendar italy-holidays-calendar (:register "IT" :constructor italy-holidays-calendar)
  ;; L. 260/1949 art. 2 less the days L. 54/1977 suppressed. Floors before 1949
  ;; are the earlier starter's (not researched).
  (:fixed "Capodanno" 1 1 :from 1900 :authority "L. 260/1949 art. 2")
  (:fixed "Epifania" 1 6 :from 1900 :to 1976 :authority "L. 260/1949 art. 2; soppressa dalla L. 54/1977 art. 1")
  (:fixed "Epifania" 1 6 :from 1986 :authority "D.P.R. 28 dicembre 1985, n. 792, art. 1 (dal 1 gennaio 1986)")
  (:easter "Lunedì dell'Angelo" 1 :from 1900 :authority "L. 260/1949 art. 2 (lunedì dopo Pasqua)")
  (:fixed "Anniversario della Liberazione" 4 25 :from 1946 :authority "L. 260/1949 art. 2")
  (:fixed "Festa del Lavoro" 5 1 :from 1900 :authority "L. 260/1949 art. 2")
  (:fixed "Festa della Repubblica" 6 2 :from 1946 :to 1976
   :authority "L. 260/1949 art. 1; celebrata la prima domenica di giugno dal 1977 (L. 54/1977 art. 1)")
  (:nth-weekday "Festa della Repubblica (prima domenica di giugno)" 6 :sunday 1 :from 1977 :to 2000
   :authority "L. 5 marzo 1977, n. 54, art. 1")
  (:fixed "Festa della Repubblica" 6 2 :from 2001 :authority "L. 20 novembre 2000, n. 336, art. 1 (dal 2001)")
  (:fixed "Assunzione (Ferragosto)" 8 15 :from 1900 :authority "L. 260/1949 art. 2")
  (:fixed "San Francesco d'Assisi" 10 4 :from 2026 :authority "L. 8 ottobre 2025, n. 151, art. 1 (in vigore 1 gennaio 2026)")
  (:fixed "Ognissanti" 11 1 :from 1900 :authority "L. 260/1949 art. 2")
  (:nth-weekday "Festa dell'Unità nazionale (prima domenica di novembre)" 11 :sunday 1 :from 1977
   :authority "L. 5 marzo 1977, n. 54, art. 1 (4 novembre non festivo; L. 27/2024: no effetti civili)")
  (:fixed "Immacolata Concezione" 12 8 :from 1900 :authority "L. 260/1949 art. 2")
  (:fixed "Natale" 12 25 :from 1900 :authority "L. 260/1949 art. 2")
  (:fixed "Santo Stefano" 12 26 :from 1900 :authority "L. 260/1949 art. 2"))

(defun italy-holidays-calendar (&key year transfers suppressed working-days)
  "Giorni festivi of Italy (\"IT\"): L. 260/1949 by era (L. 54/1977, D.P.R.
792/1985, L. 336/2000, L. 151/2025) and the one-off 17 March 2011 (D.L.
5/2011, data/it/holidays.sexp)."
  (%mena-calendar 'italy-holidays-calendar "IT" year transfers suppressed working-days))

;;; --- Netherlands -------------------------------------------------------------

(define-calendar netherlands-holidays-calendar (:register "NL" :constructor netherlands-holidays-calendar)
  ;; Algemene termijnenwet art. 3(1). Goede Vrijdag (art. 3(2)) is only equated
  ;; for time limits; 5 May is listed every year (#25 item 4).
  (:fixed "Nieuwjaarsdag" 1 1 :from 1900 :authority "Algemene termijnenwet art. 3(1)")
  (:easter "Tweede Paasdag" 1 :from 1900 :authority "Algemene termijnenwet art. 3(1)")
  (:fixed "Koninginnedag" 4 30 :from 1949 :to 1979 :authority "Koninginnedag 30 april (Juliana; not researched)")
  (:computed "Koninginnedag"
   (lambda (y)
     (let ((d (make-date y 4 30)))
       (if (= (date-day-of-week d) 7) (- d 1) d)))
   :from 1980 :to 2013
   :authority "KB 24 april 1980, nr. 11: 30 april, op zondag de zaterdag ervoor; Algemene termijnenwet art. 3(1)")
  (:computed "Koningsdag"
   (lambda (y)
     (let ((d (make-date y 4 27)))
       (if (= (date-day-of-week d) 7) (- d 1) d)))
   :from 2014
   :authority "Besluit van 30 januari 2013, Stcrt. 2013, 4075: 27 april, op zondag 26 april")
  (:fixed "Bevrijdingsdag" 5 5 :from 1945 :authority "Algemene termijnenwet art. 3(1) (de vijfde mei)")
  (:easter "Hemelvaartsdag" 39 :from 1900 :authority "Algemene termijnenwet art. 3(1)")
  (:easter "Tweede Pinksterdag" 50 :from 1900 :authority "Algemene termijnenwet art. 3(1)")
  (:fixed "Eerste Kerstdag" 12 25 :from 1900 :authority "Algemene termijnenwet art. 3(1)")
  (:fixed "Tweede Kerstdag" 12 26 :from 1900 :authority "Algemene termijnenwet art. 3(1)"))

(defun netherlands-holidays-calendar (&key year transfers suppressed working-days)
  "Algemeen erkende feestdagen of the Netherlands (\"NL\"): Algemene
termijnenwet art. 3(1), Koninginnedag / Koningsdag with the Sunday move to
the Saturday before."
  (%mena-calendar 'netherlands-holidays-calendar "NL" year transfers suppressed working-days))

;;; --- Ireland -----------------------------------------------------------------

(define-calendar ireland-holidays-calendar (:register "IE" :constructor ireland-holidays-calendar)
  ;; Organisation of Working Time Act 1997 Sched. 2 para. 1 (in force 30 Sep
  ;; 1997); earlier floors are the earlier starter's (not researched). Days
  ;; prescribed under para. 1(g) are data/ie/holidays.sexp rows.
  (:fixed "New Year's Day" 1 1 :from 1922 :authority "Organisation of Working Time Act 1997, Sched. 2 para. 1(f)")
  (:computed "St. Brigid's Day"
   (lambda (y)
     (let ((d (make-date y 2 1)))
       (if (= (date-day-of-week d) 5) d (%first-monday-on-or-after d))))
   :from 2023
   :authority "S.I. No. 50/2022, regs. 4-5: the first Monday in February, or 1 February when a Friday")
  (:fixed "St. Patrick's Day" 3 17 :from 1922 :authority "Organisation of Working Time Act 1997, Sched. 2 para. 1(c)")
  (:easter "Easter Monday" 1 :from 1922 :authority "Organisation of Working Time Act 1997, Sched. 2 para. 1(d)")
  (:nth-weekday "May Bank Holiday" 5 :monday 1 :from 1994
   :authority "Organisation of Working Time Act 1997, Sched. 2 para. 1(d): the first Monday in May")
  (:nth-weekday "June Bank Holiday" 6 :monday 1 :from 1922
   :authority "Organisation of Working Time Act 1997, Sched. 2 para. 1(d): the first Monday in June")
  (:nth-weekday "August Bank Holiday" 8 :monday 1 :from 1922
   :authority "Organisation of Working Time Act 1997, Sched. 2 para. 1(d): the first Monday in August")
  (:nth-weekday "October Bank Holiday" 10 :monday -1 :from 1977
   :authority "Organisation of Working Time Act 1997, Sched. 2 para. 1(e): the last Monday in October")
  (:fixed "Christmas Day" 12 25 :from 1922 :authority "Organisation of Working Time Act 1997, Sched. 2 para. 1(a)")
  (:fixed "St. Stephen's Day" 12 26 :from 1922 :authority "Organisation of Working Time Act 1997, Sched. 2 para. 1(b)"))

(defun ireland-holidays-calendar (&key year transfers suppressed working-days)
  "Public holidays of Ireland (\"IE\"): Organisation of Working Time Act 1997
Sched. 2, St Brigid's Day from 2023, and the days prescribed under para. 1(g)
(31 Dec 1999, 14 Sep 2001, 18 Mar 2022; data/ie/holidays.sexp). No weekend
substitutes."
  (%mena-calendar 'ireland-holidays-calendar "IE" year transfers suppressed working-days))

;;; --- Portugal ----------------------------------------------------------------

(define-calendar portugal-holidays-calendar (:register "PT" :constructor portugal-holidays-calendar)
  ;; Código do Trabalho art. 234.º(1). Floors before 2000 are the earlier
  ;; starter's (not researched).
  (:fixed "Ano Novo" 1 1 :from 1900 :authority "Código do Trabalho art. 234.º(1)")
  (:easter "Sexta-Feira Santa" -2 :from 1900 :authority "Código do Trabalho art. 234.º(1)")
  (:easter "Domingo de Páscoa" 0 :from 1900 :authority "Código do Trabalho art. 234.º(1)")
  (:fixed "Dia da Liberdade" 4 25 :from 1974 :authority "Código do Trabalho art. 234.º(1)")
  (:fixed "Dia do Trabalhador" 5 1 :from 1900 :authority "Código do Trabalho art. 234.º(1)")
  (:easter "Corpo de Deus" 60 :from 1900 :to 2012
   :authority "Código do Trabalho art. 234.º(1); suspenso 2013-2015 (Lei 23/2012 art. 10.º)")
  (:easter "Corpo de Deus" 60 :from 2016 :authority "Lei 8/2016, art. 2.º")
  (:fixed "Dia de Portugal, de Camões e das Comunidades Portuguesas" 6 10 :from 1900
   :authority "Código do Trabalho art. 234.º(1)")
  (:fixed "Assunção de Nossa Senhora" 8 15 :from 1900 :authority "Código do Trabalho art. 234.º(1)")
  (:fixed "Implantação da República" 10 5 :from 1910 :to 2012
   :authority "Código do Trabalho art. 234.º(1); suspenso 2013-2015 (Lei 23/2012 art. 10.º)")
  (:fixed "Implantação da República" 10 5 :from 2016 :authority "Lei 8/2016, art. 2.º")
  (:fixed "Dia de Todos-os-Santos" 11 1 :from 1900 :to 2012
   :authority "Código do Trabalho art. 234.º(1); suspenso 2013-2015 (Lei 23/2012 art. 10.º)")
  (:fixed "Dia de Todos-os-Santos" 11 1 :from 2016 :authority "Lei 8/2016, art. 2.º")
  (:fixed "Restauração da Independência" 12 1 :from 1900 :to 2012
   :authority "Código do Trabalho art. 234.º(1); suspenso 2013-2015 (Lei 23/2012 art. 10.º)")
  (:fixed "Restauração da Independência" 12 1 :from 2016 :authority "Lei 8/2016, art. 2.º")
  (:fixed "Imaculada Conceição" 12 8 :from 1900 :authority "Código do Trabalho art. 234.º(1)")
  (:fixed "Natal" 12 25 :from 1900 :authority "Código do Trabalho art. 234.º(1)"))

(defun portugal-holidays-calendar (&key year transfers suppressed working-days)
  "Feriados obrigatórios of Portugal (\"PT\"): Código do Trabalho art. 234.º(1),
the four days suspended 2013-2015 (Lei 23/2012) and restored by Lei 8/2016."
  (%mena-calendar 'portugal-holidays-calendar "PT" year transfers suppressed working-days))
