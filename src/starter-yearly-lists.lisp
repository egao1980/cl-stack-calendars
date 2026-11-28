(in-package #:cl-stack-calendars)

;;;; Calendars with yearly lists outside the MENA file (#43): the same
;;;; data/<cc>/holidays.sexp blocks and helpers as starter-middle-east.lisp
;;;; (MENA-BLOCKS, MENA-LISTED-P, MENA-CONFIDENCE, MENA-DECREE-ROWS).
;;;;
;;;; "KZ"  праздничные дни of decree 2534 (1995) and law 267 (2001) as amended,
;;;;       with the art. 5 weekend carry-over from 14 Dec 2001, the выходные дни
;;;;       Kurban ait (first day) and 7 January from 2006, and every transfer of
;;;;       days off 2000–2026 (data/kz/holidays.sexp). Ораза айт is no holiday.
;;;; "SN"  fêtes légales of loi 74-52 as amended (loi 83-54 Tamxarit, loi
;;;;       2013-06 Grand Magal de Touba, 18 Safar) with the Monday after a
;;;;       Sunday Korité or Tabaski; the declared Magal dates and one-off days
;;;;       by decree are data/sn/holidays.sexp rows (each block :covers only
;;;;       the Magal, so the other Islamic days stay tabular estimates).
;;;;
;;;; The gold is data/tests/<cc>-holiday-gold.sexp
;;;; (scripts/generate_mena_holiday_gold.py, scripts/asia/kz.py and
;;;; scripts/africa/sn.py).

(defparameter *yearly-list-statute-eras*
  '((:calendar "KZ" :key "U950002534" :from (1995 10 18) :to (2001 12 13)
     :authority "Указ Президента РК, имеющий силу Закона, от 18 октября 1995 г. N 2534 «О праздничных днях в Республике Казахстан»"
     :uri "https://web.archive.org/web/2025/https://adilet.zan.kz/rus/docs/U950002534_"
     :issued (1995 10 18) :issued-uri "https://adilet.zan.kz/rus/docs/U950002534_"
     :published nil :published-uri "https://adilet.zan.kz/rus/docs/U950002534_/info"
     :published-in "Ведомости Верховного Совета РК, 1995 г., N 21, ст. 125" :in-force nil
     :dates-note "Adilet gives only the Vedomosti issue (no day); in force 'со дня опубликования'.")
    (:calendar "KZ" :key "Z010000267" :from (2001 12 14) :to nil
     :authority "Закон РК от 13 декабря 2001 года N 267 «О праздниках в Республике Казахстан» (original redaction)"
     :uri "https://web.archive.org/web/20130624144413/http://adilet.zan.kz/rus/docs/Z010000267_"
     :issued (2001 12 13) :issued-uri "https://adilet.zan.kz/rus/docs/Z010000267_"
     :published (2001 12 14) :published-uri "https://web.archive.org/web/2025/https://adilet.zan.kz/rus/docs/Z010000267_/history"
     :published-in "«Казахстанская правда» от 14 декабря 2001 года N 287; Ведомости Парламента РК, 2001 г., N 23, ст. 316; «Юридическая газета» 26.12.2001 N 55" :in-force (2001 12 14))
    (:calendar "KZ" :key "Z080000047" :from (2008 6 26) :to nil
     :authority "Закон РК от 25 июня 2008 года N 47-IV «О внесении дополнения в Закон РК „О праздниках в РК“»"
     :uri "https://web.archive.org/web/2025/https://adilet.zan.kz/rus/docs/Z080000047_"
     :issued (2008 6 25) :issued-uri "https://adilet.zan.kz/rus/docs/Z080000047_"
     :published (2008 6 26) :published-uri "https://web.archive.org/web/2025/https://adilet.zan.kz/rus/docs/Z080000047_/info"
     :published-in "«Казахстанская правда» от 26 июня 2008 года, N 140 (25587); Ведомости Парламента РК, 2008 г., N 10-11, ст. 40" :in-force (2008 6 26))
    (:calendar "KZ" :key "Z090000152" :from (2009 4 25) :to nil
     :authority "Закон РК от 22 апреля 2009 года N 152-IV «О внесении изменений в Закон РК „О праздниках в РК“»"
     :uri "https://web.archive.org/web/2025/https://adilet.zan.kz/rus/docs/Z090000152_"
     :issued (2009 4 22) :issued-uri "https://adilet.zan.kz/rus/docs/Z090000152_"
     :published (2009 4 25) :published-uri "https://web.archive.org/web/2025/https://adilet.zan.kz/rus/docs/Z090000152_/info"
     :published-in "«Казахстанская правда» от 25.04.2009 г., № 109 (25853); «Егемен Қазақстан» 25.04.2009 N 147; Ведомости Парламента РК 2009, № 8, ст. 42" :in-force (2009 4 25))
    (:calendar "KZ" :key "Z1100000509" :from (2011 12 14) :to nil
     :authority "Закон РК от 14 декабря 2011 года № 509-IV «О внесении дополнения в Закон РК „О праздниках в РК“»"
     :uri "https://web.archive.org/web/2025/https://adilet.zan.kz/rus/docs/Z1100000509"
     :issued (2011 12 14) :issued-uri "https://adilet.zan.kz/rus/docs/Z1100000509"
     :published (2011 12 16) :published-uri "https://web.archive.org/web/2025/https://adilet.zan.kz/rus/docs/Z1100000509/info"
     :published-in "«Казахстанская правда» от 16.12.2011 г., № 407-408; «Егемен Қазақстан» 16.12.2011 № 632-635; Ведомости Парламента РК 2011, № 21, ст. 165" :in-force (2011 12 14))
    (:calendar "KZ" :key "Z1200000043" :from (2012 11 10) :to nil
     :authority "Закон РК от 19 октября 2012 года № 43-V «О внесении дополнения в Закон РК „О праздниках в РК“»"
     :uri "https://web.archive.org/web/2025/https://adilet.zan.kz/rus/docs/Z1200000043"
     :issued (2012 10 19) :issued-uri "https://adilet.zan.kz/rus/docs/Z1200000043"
     :published (2012 11 10) :published-uri "https://web.archive.org/web/2025/https://adilet.zan.kz/rus/docs/Z1200000043/info"
     :published-in "«Казахстанская правда» 10.11.2012 г., № 392 (27211); «Егемен Қазақстан» 10.11.2012 № 739-743; Ведомости Парламента РК 2012, № 16, ст. 104" :in-force (2012 11 10))
    (:calendar "KZ" :key "Z2200000143" :from (2022 9 30) :to nil
     :authority "Закон РК от 29 сентября 2022 года № 143-VII «О внесении изменений и дополнений в некоторые законодательные акты РК по вопросам кинематографии, культуры и праздников»"
     :uri "https://web.archive.org/web/2025/https://adilet.zan.kz/rus/docs/Z2200000143"
     :issued (2022 9 29) :issued-uri "https://adilet.zan.kz/rus/docs/Z2200000143"
     :published (2022 9 30) :published-uri "https://web.archive.org/web/2025/https://adilet.zan.kz/rus/docs/Z2200000143/info"
     :published-in "«Казахстанская правда» 30.09.2022 г., № 187 (29814); ЭКБ НПА 03.10.2022; Ведомости Парламента РК 2022 г., № 15-18, ст. 66" :in-force (2022 9 30))
    (:calendar "KZ" :key "Z2600000306" :from (2026 7 1) :to nil
     :authority "Закон РК от 11 июня 2026 года № 306-VIII ЗРК «О внесении изменений и дополнений в некоторые законодательные акты РК по вопросам приведения их в соответствие с Конституцией РК, …»"
     :uri "https://web.archive.org/web/20260829103359/https://adilet.zan.kz/rus/docs/Z2600000306"
     :issued (2026 6 11) :issued-uri "https://adilet.zan.kz/rus/docs/Z2600000306"
     :published nil
     :in-force (2026 7 1)
     :dates-note "Publication data not archived (info page 404 on Wayback; adilet SPA). Art. 2 p.1: in force 1 July 2026; point 26 (holidays law) is not among the exceptions.")
    (:calendar "KZ" :key "Z990000493-109" :from (2005 12 31) :to nil
     :authority "Закон РК от 30 декабря 2005 года N 109 «О внесении дополнений в Закон РК „О труде в Республике Казахстан“» (Закон о труде от 10.12.1999 N 493, ст. 56 п. 3-1)"
     :uri "https://web.archive.org/web/2025/https://adilet.zan.kz/rus/docs/Z050000109_"
     :issued (2005 12 30) :issued-uri "https://adilet.zan.kz/rus/docs/Z050000109_"
     :published (2005 12 31) :published-uri "https://web.archive.org/web/2025/https://adilet.zan.kz/rus/docs/Z050000109_/info"
     :published-in "«Казахстанская правда» от 31 декабря 2005 года N 360-361; Ведомости Парламента РК 2005, N 24, ст. 121" :in-force (2005 12 31))
    (:calendar "KZ" :key "K070000251" :from (2007 5 15) :to nil
     :authority "Трудовой кодекс РК от 15 мая 2007 года N 251-III, ст. 96 п. 4"
     :uri "https://web.archive.org/web/2015/http://adilet.zan.kz/rus/docs/K070000251_"
     :issued (2007 5 15) :issued-uri "https://adilet.zan.kz/rus/docs/K070000251_"
     :published nil
     :in-force nil
     :dates-note "Info page not fetched; content check only. Replaced Law 493 (repealed by it).")
    (:calendar "KZ" :key "K1500000414" :from (2016 1 1) :to nil
     :authority "Трудовой кодекс РК от 23 ноября 2015 года № 414-V, ст. 84 п. 5, ст. 85 п. 3"
     :uri "https://web.archive.org/web/2025/https://adilet.zan.kz/rus/docs/K1500000414"
     :issued (2015 11 23) :issued-uri "https://adilet.zan.kz/rus/docs/K1500000414"
     :published nil
     :in-force (2016 1 1)
     :dates-note "Info page not fetched; in force 1 Jan 2016 (code's art. 196, not re-read here).")
    (:calendar "SN" :key "loi-74-52" :from (1974 11 4) :to nil
     :authority "Loi n° 74-52 du 4 novembre 1974 relative à la fête nationale et aux fêtes légales"
     :uri "https://web.archive.org/web/20250608105243/https://www.dri.gouv.sn/sites/default/files/an-documents/LOI%20N1974%2052%20DU%204%20NOVEMBRE%201974.pdf"
     :issued (1974 11 4) :issued-uri "https://web.archive.org/web/20250608105243/https://www.dri.gouv.sn/sites/default/files/an-documents/LOI%20N1974%2052%20DU%204%20NOVEMBRE%201974.pdf"
     :published nil
     :published-in "Journal officiel de la République du Sénégal (issue not on the DRI scan)" :in-force nil
     :dates-note "DRI (Direction des relations avec les institutions) scan of the dossier: decree 74-577 of 17 June 1974, committee report, adopted 25 Oct 1974, promulgated 4 Nov 1974; JO issue/date not in the scan.")
    (:calendar "SN" :key "loi-83-54" :from (1983 2 18) :to nil
     :authority "Loi n° 83-54 du 18 février 1983 (modifiant la loi n° 74-52; ajoute la Tamxarit)"
     :uri "https://web.archive.org/web/20250608105419/https://www.dri.gouv.sn/sites/default/files/LOI/1983/comP4%20loi%20decentralisation%20et%20travail/LOI%20N%20198354%20DU%2018%20FEVRIER%201983/LOI%20N%20198354%20DU%2018%20FEVRIER%201983.pdf"
     :issued (1983 2 18)
     :published nil
     :in-force nil
     :dates-note "The DRI scan (5 pages) is images only and was not transcribed; content per the amended art. 4 that loi 2013-06 quotes (Tamxarit chômée et payée). JO issue not known.")
    (:calendar "SN" :key "decret-2012-magal" :from (2012 1 12) :to (2012 1 12)
     :authority "Décret présidentiel (A. Wade) déclarant le Grand Magal 2012 férié, chômé et payé"
     :uri "https://www.seneweb.com/fr/news/Contribution/magal-de-touba-ferie-chronique-dune-decision-historique-par-moubarack-lo_n_448594.html"
     :issued (2012 1 12)
     :published nil
     :in-force nil
     :dates-note "Secondary only (Moubarack Lo chronicle on Seneweb/Dakaractu); decree number not found. One-off for 2012; the 2013 (January) Magal was likewise declared by Macky Sall (same chronicle) - decree not found.")
    (:calendar "SN" :key "loi-2013-06" :from (2013 12 11) :to nil
     :authority "Loi n° 2013-06 du 11 décembre 2013 complétant et modifiant certaines dispositions de la loi n° 74-52 du 4 novembre 1974 relative à la fête nationale et aux fêtes légales, modifiée"
     :uri "https://web.archive.org/web/20250604215148/https://natlex.ilo.org/dyn/natlex2/natlex2/files/download/97261/SEN-97261.pdf"
     :issued (2013 12 11) :issued-uri "http://www.jo.gouv.sn/spip.php?page=imprimer&id_article=10101"
     :published nil :published-uri "http://www.jo.gouv.sn/spip.php?article10101"
     :published-in "Journal officiel de la République du Sénégal (jo.gouv.sn article 10101; JO issue number not shown)" :in-force nil
     :dates-note "Natlex PDF is a print of the JO web article (printed 24/4/2014); it gives the act date and the Assembly vote (samedi 30 novembre 2013) but not the JO issue/date. jo.gouv.sn timed out when fetched directly."))
  "The statutes and amending acts of the KZ and SN lists, with :ISSUED,
:PUBLISHED and :IN-FORCE, or a :DATES-NOTE for a missing one (#93). :FROM is
the start of effect (or the act's date when none is stated).")

(define-calendar kazakhstan-holidays-calendar (:register "KZ" :constructor kazakhstan-holidays-calendar)
  ;; Law 267 art. 5 (from 14 Dec 2001): a праздничный день on a Saturday or
  ;; Sunday gives the next working day off. Kurban ait and 7 January are
  ;; выходные дни of the Labour law: no carry-over. The transfers of each year
  ;; are data/kz/holidays.sexp rows.
  (:fixed "Жаңа жыл" 1 1 :from 1995 :observed :kz-holidays-law-art-5 :observed-from (2001 12 14)
   :authority "Decree 2534 (1995); law 267 art. 3")
  (:fixed "Жаңа жыл" 1 2 :from 1995 :observed :kz-holidays-law-art-5 :observed-from (2001 12 14)
   :authority "Decree 2534 (1995); law 267 art. 3")
  (:fixed "Православиелік Рождество" 1 7 :from 2006
   :authority "Law 109 of 30 Dec 2005 (Labour law art. 56 p. 3-1); Labour Code 2007 art. 96, 2015 art. 84 p. 5: a выходной день")
  (:fixed "Халықаралық әйелдер күні" 3 8 :from 1995 :observed :kz-holidays-law-art-5 :observed-from (2001 12 14)
   :authority "Decree 2534 (1995); law 267 art. 3")
  (:fixed "Қазақстан Республикасының Конституциясы күні" 3 15 :from 2027
   :observed :kz-holidays-law-art-5 :observed-from (2001 12 14)
   :authority "Law 306-VIII of 11 Jun 2026 (in force 1 Jul 2026)")
  (:fixed "Наурыз мейрамы" 3 21 :from 2010 :observed :kz-holidays-law-art-5 :observed-from (2001 12 14)
   :authority "Law 152-IV of 22 Apr 2009: 21–23 March")
  (:fixed "Наурыз мейрамы" 3 22 :from 1995 :observed :kz-holidays-law-art-5 :observed-from (2001 12 14)
   :authority "Decree 2534 (1995); law 267 art. 3")
  (:fixed "Наурыз мейрамы" 3 23 :from 2010 :observed :kz-holidays-law-art-5 :observed-from (2001 12 14)
   :authority "Law 152-IV of 22 Apr 2009: 21–23 March")
  (:fixed "Қазақстан халқының бірлігі мерекесі" 5 1 :from 1995 :observed :kz-holidays-law-art-5
   :observed-from (2001 12 14) :authority "Decree 2534 (1995); law 267 art. 3")
  (:fixed "Отан қорғаушы күні" 5 7 :from 2013 :observed :kz-holidays-law-art-5 :observed-from (2001 12 14)
   :authority "Law 43-V of 19 Oct 2012")
  (:fixed "Жеңіс күні" 5 9 :from 1995 :observed :kz-holidays-law-art-5 :observed-from (2001 12 14)
   :authority "Decree 2534 (1995); law 267 art. 3")
  (:fixed "Астана күні" 7 6 :from 2008 :observed :kz-holidays-law-art-5 :observed-from (2001 12 14)
   :authority "Law 47-IV of 25 Jun 2008 (in force 26 Jun 2008)")
  (:fixed "Қазақстан Республикасының Конституциясы күні" 8 30 :from 1995 :to 2025
   :observed :kz-holidays-law-art-5 :observed-from (2001 12 14)
   :authority "Decree 2534 (1995); law 267 art. 3; deleted by law 306-VIII (in force 1 Jul 2026)")
  (:fixed "Республика күні" 10 25 :from 1995 :to 2008 :observed :kz-holidays-law-art-5 :observed-from (2001 12 14)
   :authority "Decree 2534 (1995); law 267 art. 3; deleted by law 152-IV (in force 25 Apr 2009)")
  (:fixed "Республика күні" 10 25 :from 2022 :observed :kz-holidays-law-art-5 :observed-from (2001 12 14)
   :authority "Law 143-VII of 29 Sep 2022 (in force 30 Sep 2022): the national holiday")
  (:fixed "Қазақстан Республикасының Тұңғыш Президенті күні" 12 1 :from 2012 :to 2021
   :observed :kz-holidays-law-art-5 :observed-from (2001 12 14)
   :authority "Law 509-IV of 14 Dec 2011; deleted by law 143-VII (2022)")
  (:fixed "Тәуелсіздік күні" 12 16 :from 1991 :observed :kz-holidays-law-art-5 :observed-from (2001 12 14)
   :authority "Decree 2534 (1995); law 267 art. 2; law 143-VII art. 3 (one day from 2022)")
  (:fixed "Тәуелсіздік күні" 12 17 :from 2001 :to 2021 :observed :kz-holidays-law-art-5 :observed-from (2001 12 14)
   :authority "Law 267 art. 2 (in force 14 Dec 2001); one day from law 143-VII (2022)")
  (:computed "Құрбан айт (бірінші күні) (estimated)" (lambda (y) (%mena-estimate "KZ" y 12 10 '(0))) :from 2006
   :authority "Law 109 of 30 Dec 2005; Labour Code 2015 art. 84 p. 5: the first day of Kurban ait, a выходной день; tabular 10 Dhu al-Hijjah, only in years with no list"))

(defun kazakhstan-holidays-calendar (&key year transfers suppressed working-days)
  "Holidays and days off of Kazakhstan (\"KZ\"): the праздничные дни of law 267
by era with the art. 5 carry-over, 7 January and the first day of Kurban ait
from 2006, and the declared Kurban ait dates and transfers of
data/kz/holidays.sexp. Confidence by year: MENA-CONFIDENCE (2006–2018 Kurban
ait dates are secondary)."
  (%mena-calendar 'kazakhstan-holidays-calendar "KZ" year transfers suppressed working-days))

(define-calendar senegal-holidays-calendar (:register "SN" :constructor senegal-holidays-calendar)
  ;; Loi 74-52 as amended. Eras before 1974 were not researched: the days are
  ;; kept from 1960 (independence).
  (:fixed "Jour de l'an" 1 1 :from 1960 :authority "Loi 74-52 art. 2")
  (:fixed "Fête de l'Indépendance" 4 4 :from 1960 :authority "Loi 74-52 art. 1: the fête nationale")
  (:fixed "Fête du Travail" 5 1 :from 1960 :authority "Loi 74-52 art. 2")
  (:fixed "Assomption" 8 15 :from 1960 :authority "Loi 74-52 art. 2")
  (:fixed "Toussaint" 11 1 :from 1960 :authority "Loi 74-52 art. 2")
  (:fixed "Noël" 12 25 :from 1960 :authority "Loi 74-52 art. 2")
  (:easter "Lundi de Pâques" 1 :from 1960 :authority "Loi 74-52 art. 2")
  (:easter "Jeudi de l'Ascension" 39 :from 1960 :authority "Loi 74-52 art. 2")
  (:easter "Lundi de Pentecôte" 50 :from 1960 :authority "Loi 74-52 art. 2")
  (:computed "Tamxarit (estimated)" (lambda (y) (%mena-estimate "SN" y 1 10 '(0))) :from 1983
   :authority "Loi 83-54: 10 Muharram; tabular")
  (:computed "Grand Magal de Touba (estimated)" (lambda (y) (%mena-estimate "SN" y 2 18 '(0) "magal"))
   :from (2013 12 11)
   :authority "Loi 2013-06 of 11 Dec 2013: 18 Safar; tabular, only in years with no declared date")
  (:computed "Journée du Maouloud (estimated)" (lambda (y) (%mena-estimate "SN" y 3 12 '(0))) :from 1960
   :authority "Loi 74-52 art. 2: 12 Rabi' al-awwal; tabular")
  (:computed "Journée de la Korité (estimated)" (lambda (y) (%mena-estimate "SN" y 10 1 '(0))) :from 1960
   :observed :sn-loi-74-52-art-2 :observed-from 1974
   :authority "Loi 74-52 art. 2: 1 Shawwal, and the Monday after a Sunday; tabular")
  (:computed "Journée de la Tabaski (estimated)" (lambda (y) (%mena-estimate "SN" y 12 10 '(0))) :from 1960
   :observed :sn-loi-74-52-art-2 :observed-from 1974
   :authority "Loi 74-52 art. 2: 10 Dhu al-Hijjah, and the Monday after a Sunday; tabular"))

(defun senegal-holidays-calendar (&key year transfers suppressed working-days)
  "Fêtes légales of Senegal (\"SN\"): loi 74-52 as amended, with the declared
Grand Magal de Touba dates and one-off days of data/sn/holidays.sexp. Tamxarit,
Maouloud, Korité and Tabaski are tabular estimates in every year. Confidence of
the Magal by year: MENA-CONFIDENCE."
  (%mena-calendar 'senegal-holidays-calendar "SN" year transfers suppressed working-days))
