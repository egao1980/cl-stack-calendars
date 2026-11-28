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

(defparameter *europe-list-codes* '("IT" "NL" "DE" "IE" "PT" "TARGET" "HR" "SI" "SK" "CZ" "HU" "PL")
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

;;; --- Croatia (#23) -------------------------------------------------------------

(define-calendar croatia-holidays-calendar (:register "HR" :constructor croatia-holidays-calendar)
  ;; Zakon o blagdanima: NN 33/1996, 96/2001, 13/2002, 55/2008, then NN 110/2019.
  ;; No Sunday move. Floors before 1996 are the earlier starter's.
  (:fixed "Nova godina" 1 1 :from 1991 :authority "NN 33/1996 čl. 1; NN 110/2019 čl. 1")
  (:fixed "Bogojavljenje ili Sveta tri kralja" 1 6 :from 1991 :to (2001 11 14)
   :authority "NN 33/1996 čl. 1; not in the list NN 96/2001 put in force on 15 Nov 2001")
  (:fixed "Bogojavljenje ili Sveta tri kralja" 1 6 :from (2002 2 16)
   :authority "NN 13/2002 (in force 16 Feb 2002); NN 110/2019 čl. 1")
  (:easter "Uskrs" 0 :from (2008 5 16) :authority "NN 55/2008 (»Uskrs i Uskrsni ponedjeljak«)")
  (:easter "Uskrsni ponedjeljak" 1 :from 1991 :authority "NN 33/1996 čl. 1")
  (:easter "Tijelovo" 60 :from 2002 :authority "NN 96/2001 (in force 15 Nov 2001)")
  (:fixed "Praznik rada" 5 1 :from 1991 :authority "NN 33/1996 čl. 1")
  (:fixed "Dan državnosti" 5 30 :from 1991 :to 2001 :authority "NN 33/1996 čl. 1 (to 14 Nov 2001)")
  (:fixed "Dan državnosti" 5 30 :from 2020 :authority "NN 110/2019 čl. 1 (from 1 Jan 2020)")
  (:fixed "Dan antifašističke borbe" 6 22 :from 1991 :authority "NN 33/1996 čl. 1")
  (:fixed "Dan državnosti" 6 25 :from 2002 :to 2019 :authority "NN 96/2001; a spomendan from 2020 (NN 110/2019)")
  (:fixed "Dan pobjede i domovinske zahvalnosti i Dan hrvatskih branitelja" 8 5 :from 1995
   :authority "NN 33/1996 čl. 1; NN 55/2008")
  (:fixed "Velika Gospa" 8 15 :from 1991 :authority "NN 33/1996 čl. 1")
  (:fixed "Dan neovisnosti" 10 8 :from 2002 :to 2019 :authority "NN 96/2001; a spomendan from 2020 (NN 110/2019)")
  (:fixed "Svi sveti" 11 1 :from 1991 :authority "NN 33/1996 čl. 1")
  (:fixed "Dan sjećanja na žrtve Domovinskog rata" 11 18 :from 2020 :authority "NN 110/2019 čl. 1")
  (:fixed "Božić" 12 25 :from 1991 :authority "NN 33/1996 čl. 1; NN 55/2008")
  (:fixed "Sveti Stjepan" 12 26 :from 1991 :authority "NN 33/1996 čl. 1; NN 55/2008"))

(defun croatia-holidays-calendar (&key year transfers suppressed working-days)
  "Blagdani i neradni dani of Croatia (\"HR\"): the Zakon o blagdanima by era (no
Bogojavljenje 15 Nov 2001–15 Feb 2002, so 6 January 2002 is a working day)."
  (%mena-calendar 'croatia-holidays-calendar "HR" year transfers suppressed working-days))

;;; --- Slovenia (#23) ------------------------------------------------------------

(define-calendar slovenia-holidays-calendar (:register "SI" :constructor slovenia-holidays-calendar)
  ;; ZPDPD-UPB1 čl. 1-2: the dela prosti dnevi only. 14 August 2023 is a
  ;; data/si/holidays.sexp row (ZOPNN-F 15. člen).
  (:fixed "Novo leto" 1 1 :from 1991 :authority "ZPDPD čl. 1")
  (:fixed "Novo leto" 1 2 :from 1991 :to 2012 :authority "ZPDPD čl. 1; removed by ZUJF 82. člen (from 2013)")
  (:fixed "Novo leto" 1 2 :from 2017 :authority "ZPDPD-D (Ur. l. RS 83/2016)")
  (:fixed "Prešernov dan, slovenski kulturni praznik" 2 8 :from 1991 :authority "ZPDPD čl. 1")
  (:easter "Velikonočna nedelja" 0 :from 1991 :authority "ZPDPD čl. 2")
  (:easter "Velikonočni ponedeljek" 1 :from 1991 :authority "ZPDPD čl. 2")
  (:fixed "Dan upora proti okupatorju" 4 27 :from 1991 :authority "ZPDPD čl. 1")
  (:fixed "Praznik dela" 5 1 :from 1991 :authority "ZPDPD čl. 1")
  (:fixed "Praznik dela" 5 2 :from 1991 :authority "ZPDPD čl. 1")
  (:easter "Binkoštna nedelja" 49 :from 1991 :authority "ZPDPD čl. 2")
  (:fixed "Dan državnosti" 6 25 :from 1991 :authority "ZPDPD čl. 1")
  (:fixed "Marijino vnebovzetje" 8 15 :from 1991 :authority "ZPDPD čl. 2")
  (:fixed "Dan reformacije" 10 31 :from 1991 :authority "ZPDPD čl. 2")
  (:fixed "Dan spomina na mrtve" 11 1 :from 1991 :authority "ZPDPD čl. 1")
  (:fixed "Božič" 12 25 :from 1991 :authority "ZPDPD čl. 2")
  (:fixed "Dan samostojnosti in enotnosti" 12 26 :from 1991 :authority "ZPDPD čl. 1"))

(defun slovenia-holidays-calendar (&key year transfers suppressed working-days)
  "Dela prosti dnevi of Slovenia (\"SI\"): ZPDPD čl. 1-2 by era (no 2 January in
2013–2016) and 14 August 2023 (data/si/holidays.sexp)."
  (%mena-calendar 'slovenia-holidays-calendar "SI" year transfers suppressed working-days))

;;; --- Slovakia (#23) ------------------------------------------------------------

(define-calendar slovakia-holidays-calendar (:register "SK" :constructor slovakia-holidays-calendar)
  ;; Zákon 241/1993 Z. z. § 2: the days of rest. 30 October 2018 (§ 4a) is a
  ;; data/sk/holidays.sexp row.
  (:fixed "Deň vzniku Slovenskej republiky" 1 1 :from 1993 :authority "Zákon 241/1993 Z. z. § 1 a), § 2(1)")
  (:fixed "Zjavenie Pána" 1 6 :from 1993 :authority "Zákon 241/1993 Z. z. § 2(2)")
  (:easter "Veľký piatok" -2 :from 1993 :authority "Zákon 241/1993 Z. z. § 2(2)")
  (:easter "Veľkonočný pondelok" 1 :from 1993 :authority "Zákon 241/1993 Z. z. § 2(2)")
  (:fixed "Sviatok práce" 5 1 :from 1993 :authority "Zákon 241/1993 Z. z. § 2(2)")
  (:fixed "Deň víťazstva nad fašizmom" 5 8 :from 1993 :to 2025 :authority "Zákon 241/1993 Z. z. § 2(2)")
  (:fixed "Deň víťazstva nad fašizmom" 5 8 :from 2027
   :authority "Zákon 241/1993 Z. z. § 2(2) j); not a day of rest in 2026 (§ 4b, 261/2025 Z. z.)")
  (:fixed "Sviatok svätého Cyrila a svätého Metoda" 7 5 :from 1993 :authority "Zákon 241/1993 Z. z. § 1, § 2(1)")
  (:fixed "Výročie Slovenského národného povstania" 8 29 :from 1993 :authority "Zákon 241/1993 Z. z. § 1, § 2(1)")
  (:fixed "Deň Ústavy Slovenskej republiky" 9 1 :from 1993 :to 2023
   :authority "Zákon 241/1993 Z. z. § 1 d); not a day of rest from 2024 (530/2023 Z. z.)")
  (:fixed "Sedembolestná Panna Mária" 9 15 :from 1993 :to 2025 :authority "Zákon 241/1993 Z. z. § 2(2)")
  (:fixed "Sedembolestná Panna Mária" 9 15 :from 2027
   :authority "Zákon 241/1993 Z. z. § 2(2) e); not a day of rest in 2026 (§ 4b, 261/2025 Z. z.)")
  (:fixed "Sviatok Všetkých svätých" 11 1 :from 1993 :authority "Zákon 241/1993 Z. z. § 2(2)")
  (:fixed "Deň boja za slobodu a demokraciu" 11 17 :from (2001 11 15) :to (2025 10 31)
   :authority "442/2001 Z. z. (from 15 Nov 2001); not a day of rest from 1 Nov 2025 (261/2025 Z. z.)")
  (:fixed "Štedrý deň" 12 24 :from 1993 :authority "Zákon 241/1993 Z. z. § 2(2)")
  (:fixed "Prvý sviatok vianočný" 12 25 :from 1993 :authority "Zákon 241/1993 Z. z. § 2(2)")
  (:fixed "Druhý sviatok vianočný" 12 26 :from 1993 :authority "Zákon 241/1993 Z. z. § 2(2)"))

(defun slovakia-holidays-calendar (&key year transfers suppressed working-days)
  "Dni pracovného pokoja of Slovakia (\"SK\"): zákon 241/1993 Z. z. § 2 by era (17
November 2001–2024, 1 September to 2023, no 8 May / 15 September in 2026) and 30
October 2018 (data/sk/holidays.sexp)."
  (%mena-calendar 'slovakia-holidays-calendar "SK" year transfers suppressed working-days))

;;; --- Czechia (#23) -------------------------------------------------------------

(define-calendar czechia-holidays-calendar (:register "CZ" :constructor czechia-holidays-calendar)
  ;; Zákon 245/2000 Sb. § 3 (from 9 Aug 2000; before it 93/1951 Sb. and 204/1990 Sb.).
  (:fixed "Den obnovy samostatného českého státu / Nový rok" 1 1 :from 1993 :authority "Zákon 245/2000 Sb. § 1-2")
  (:easter "Velký pátek" -2 :from 2016 :authority "Zákon 359/2015 Sb. (in force 21 Dec 2015)")
  (:easter "Velikonoční pondělí" 1 :from 1993 :authority "Zákon 245/2000 Sb. § 2")
  (:fixed "Svátek práce" 5 1 :from 1993 :authority "Zákon 245/2000 Sb. § 2")
  (:fixed "Den vítězství" 5 8 :from 1993 :authority "Zákon 245/2000 Sb. § 1")
  (:fixed "Den slovanských věrozvěstů Cyrila a Metoděje" 7 5 :from 1993 :authority "Zákon 245/2000 Sb. § 1")
  (:fixed "Den upálení mistra Jana Husa" 7 6 :from 1993 :authority "Zákon 245/2000 Sb. § 1; before it 204/1990 Sb.")
  (:fixed "Den české státnosti" 9 28 :from (2000 8 9) :authority "Zákon 245/2000 Sb. § 1 (in force 9 Aug 2000)")
  (:fixed "Den vzniku samostatného československého státu" 10 28 :from 1993 :authority "Zákon 245/2000 Sb. § 1")
  (:fixed "Den boje za svobodu a demokracii" 11 17 :from (2000 8 9)
   :authority "Zákon 245/2000 Sb. § 1 (before it only a významný den under 93/1951 Sb.)")
  (:fixed "Štědrý den" 12 24 :from 1993 :authority "Zákon 245/2000 Sb. § 2")
  (:fixed "1. svátek vánoční" 12 25 :from 1993 :authority "Zákon 245/2000 Sb. § 2")
  (:fixed "2. svátek vánoční" 12 26 :from 1993 :authority "Zákon 245/2000 Sb. § 2"))

(defun czechia-holidays-calendar (&key year transfers suppressed working-days)
  "Dny pracovního klidu of Czechia (\"CZ\"): zákon 245/2000 Sb. by era, Velký
pátek from 2016."
  (%mena-calendar 'czechia-holidays-calendar "CZ" year transfers suppressed working-days))

;;; --- Hungary (#23) -------------------------------------------------------------

(define-calendar hungary-holidays-calendar (:register "HU" :constructor hungary-holidays-calendar)
  ;; Munkaszüneti napok: 1992. évi XXII. tv. § 125 (3), Mt. 2012 § 102 (1). Easter
  ;; and Whit Sunday are not munkaszüneti napok. The yearly munkarend decrees'
  ;; transfers are data/hu/holidays.sexp rows (rest days and working Saturdays).
  (:fixed "Újév" 1 1 :from 1900 :authority "Mt. § 102 (1); 1992. évi XXII. tv. § 125 (3)")
  (:fixed "Nemzeti ünnep (1848)" 3 15 :from 1990 :authority "Mt. § 102 (1); 1992. évi XXII. tv. § 125 (3)")
  (:easter "Nagypéntek" -2 :from 2017 :authority "2017. évi XIII. tv. (in force 24 Mar 2017)")
  (:easter "Húsvéthétfő" 1 :from 1900 :authority "Mt. § 102 (1); 1992. évi XXII. tv. § 125 (3)")
  (:fixed "A munka ünnepe" 5 1 :from 1900 :authority "Mt. § 102 (1); 1992. évi XXII. tv. § 125 (3)")
  (:easter "Pünkösdhétfő" 50 :from 1900 :authority "Mt. § 102 (1); 1992. évi XXII. tv. § 125 (3)")
  (:fixed "Az államalapítás ünnepe" 8 20 :from 1900 :authority "Mt. § 102 (1); 1992. évi XXII. tv. § 125 (3)")
  (:fixed "Nemzeti ünnep (1956)" 10 23 :from 1991 :authority "Mt. § 102 (1); 1992. évi XXII. tv. § 125 (3)")
  (:fixed "Mindenszentek" 11 1 :from 1900 :authority "Mt. § 102 (1); 1992. évi XXII. tv. § 125 (3)")
  (:fixed "Szenteste" 12 24 :from (2026 11 14) :authority "2026. évi LXXII. tv. § 3 (in force 14 Nov 2026)")
  (:fixed "Karácsony" 12 25 :from 1900 :authority "Mt. § 102 (1); 1992. évi XXII. tv. § 125 (3)")
  (:fixed "Karácsony másnapja" 12 26 :from 1900 :authority "Mt. § 102 (1); 1992. évi XXII. tv. § 125 (3)"))

(defun hungary-holidays-calendar (&key year transfers suppressed working-days)
  "Munkaszüneti napok of Hungary (\"HU\"): Mt. § 102 (1) by era (Nagypéntek from
2017, Szenteste from 2026) and every yearly munkarend decree 2001–2026: the
transferred rest days and the working Saturdays (data/hu/holidays.sexp)."
  (%mena-calendar 'hungary-holidays-calendar "HU" year transfers suppressed working-days))

;;; --- Poland (#23) --------------------------------------------------------------

(define-calendar poland-holidays-calendar (:register "PL" :constructor poland-holidays-calendar)
  ;; Ustawa z 18 stycznia 1951 r. o dniach wolnych od pracy, art. 1 pkt 1 (the
  ;; named Sundays included). 12 November 2018 is a data/pl/holidays.sexp row.
  (:fixed "Nowy Rok" 1 1 :from 1918 :authority "Ustawa o dniach wolnych od pracy art. 1 pkt 1 lit. a")
  (:fixed "Święto Trzech Króli" 1 6 :from 2011 :authority "Dz.U. 2010 nr 224 poz. 1459 (from 1 Jan 2011)")
  (:easter "Wielkanoc (pierwszy dzień)" 0 :from 1918 :authority "Ustawa o dniach wolnych od pracy art. 1 pkt 1 lit. c")
  (:easter "Poniedziałek Wielkanocny" 1 :from 1918 :authority "Ustawa o dniach wolnych od pracy art. 1 pkt 1 lit. d")
  (:fixed "Święto Państwowe" 5 1 :from 1918 :authority "Ustawa o dniach wolnych od pracy art. 1 pkt 1 lit. e")
  (:fixed "Święto Narodowe Trzeciego Maja" 5 3 :from 1990 :authority "Dz.U. 1990 nr 28 poz. 160; art. 1 pkt 1 lit. f")
  (:easter "Zielone Świątki (pierwszy dzień)" 49 :from 1918
   :authority "Ustawa o dniach wolnych od pracy art. 1 pkt 1 lit. g")
  (:easter "Boże Ciało" 60 :from 1918 :authority "Ustawa o dniach wolnych od pracy art. 1 pkt 1 lit. h")
  (:fixed "Wniebowzięcie Najświętszej Maryi Panny" 8 15 :from 1918 :authority "Ustawa o dniach wolnych od pracy art. 1 pkt 1 lit. i")
  (:fixed "Wszystkich Świętych" 11 1 :from 1918 :authority "Ustawa o dniach wolnych od pracy art. 1 pkt 1 lit. j")
  (:fixed "Narodowe Święto Niepodległości" 11 11 :from 1989 :authority "Dz.U. 1989 nr 29 poz. 154; art. 1 pkt 1 lit. k")
  (:fixed "Wigilia Bożego Narodzenia" 12 24 :from 2025 :authority "Dz.U. 2024 poz. 1965 (in force 1 Feb 2025)")
  (:fixed "Boże Narodzenie (pierwszy dzień)" 12 25 :from 1918 :authority "Ustawa o dniach wolnych od pracy art. 1 pkt 1 lit. l")
  (:fixed "Boże Narodzenie (drugi dzień)" 12 26 :from 1918 :authority "Ustawa o dniach wolnych od pracy art. 1 pkt 1 lit. m"))

(defun poland-holidays-calendar (&key year transfers suppressed working-days)
  "Dni wolne od pracy of Poland (\"PL\"): the 1951 act art. 1 pkt 1 by era (Trzech
Króli from 2011, Wigilia from 2025) and 12 November 2018 (data/pl/holidays.sexp)."
  (%mena-calendar 'poland-holidays-calendar "PL" year transfers suppressed working-days))
