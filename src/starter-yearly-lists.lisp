(in-package #:cl-stack-calendars)

;;;; Calendars with yearly lists outside the MENA file (#43, #45): the same
;;;; data/<cc>/holidays.sexp blocks and helpers as starter-middle-east.lisp
;;;; (MENA-BLOCKS, MENA-LISTED-P, MENA-CONFIDENCE, MENA-DECREE-ROWS); the acts
;;;; of each code are data/<cc>/statutes.sexp (YEARLY-LIST-STATUTE-ERAS).
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
;;;; "ZA" "KE" "NG" "ZW" "ZM" "MW" "MG"  (#45) the statutory days by era with
;;;;       each statute's weekend rule, and the proclaimed, gazetted or
;;;;       declared days of each listed year.
;;;;
;;;; The gold is data/tests/<cc>-holiday-gold.sexp
;;;; (scripts/generate_mena_holiday_gold.py, scripts/asia/kz.py and
;;;; scripts/africa/<cc>.py).

(defun yearly-list-statute-eras (&optional (codes '("KZ" "SN" "ZA" "KE" "NG" "ZW" "ZM" "MW" "MG")))
  "The statutes and acts that set the lists of CODES, from data/<cc>/statutes.sexp
(generated with the gold from scripts/<region>/<cc>.py): plists with
:CALENDAR, :KEY, :FROM (start of effect, or the act's date when none is
stated), :AUTHORITY, :URI, :ISSUED, :PUBLISHED and :IN-FORCE, or a
:DATES-NOTE for a missing one (#93)."
  (loop for code in codes
        append (read-data-form (data-path (format nil "~(~a~)/statutes.sexp" code)))))

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

;;; --- Africa (#45) -----------------------------------------------------------
;;;
;;; Rules by era with each statute's weekend policy; the declared and gazetted
;;; days of each listed year are data/<cc>/holidays.sexp rows (scripts/africa/<cc>.py).

(define-calendar south-africa-holidays-calendar (:register "ZA" :constructor south-africa-holidays-calendar)
  (:fixed "New Year's Day" 1 1 :from 1995 :observed :za-public-holidays-act-s-2-1 :observed-from 1995 :authority "Public Holidays Act 36 of 1994")
  (:fixed "Human Rights Day" 3 21 :from 1995 :observed :za-public-holidays-act-s-2-1 :observed-from 1995 :authority "Public Holidays Act 36 of 1994")
  (:fixed "Freedom Day" 4 27 :from 1995 :observed :za-public-holidays-act-s-2-1 :observed-from 1995 :authority "Public Holidays Act 36 of 1994")
  (:fixed "Workers' Day" 5 1 :from 1995 :observed :za-public-holidays-act-s-2-1 :observed-from 1995 :authority "Public Holidays Act 36 of 1994")
  (:fixed "Youth Day" 6 16 :from 1995 :observed :za-public-holidays-act-s-2-1 :observed-from 1995 :authority "Public Holidays Act 36 of 1994")
  (:fixed "National Women's Day" 8 9 :from 1995 :observed :za-public-holidays-act-s-2-1 :observed-from 1995 :authority "Public Holidays Act 36 of 1994")
  (:fixed "Heritage Day" 9 24 :from 1995 :observed :za-public-holidays-act-s-2-1 :observed-from 1995 :authority "Public Holidays Act 36 of 1994")
  (:fixed "Day of Reconciliation" 12 16 :from 1995 :observed :za-public-holidays-act-s-2-1 :observed-from 1995 :authority "Public Holidays Act 36 of 1994")
  (:fixed "Christmas Day" 12 25 :from 1995 :observed :za-public-holidays-act-s-2-1 :observed-from 1995 :authority "Public Holidays Act 36 of 1994")
  (:fixed "Day of Goodwill" 12 26 :from 1995 :observed :za-public-holidays-act-s-2-1 :observed-from 1995 :authority "Public Holidays Act 36 of 1994")
  (:easter "Good Friday" -2 :from 1995 :authority "Public Holidays Act 36 of 1994")
  (:easter "Family Day" 1 :from 1995 :authority "Public Holidays Act 36 of 1994")
  ;; Before Act 36/1994 (not researched; kept from the earlier starter):
  (:fixed "Van Riebeeck's Day / Founder's Day" 4 6 :from 1900 :to 1994 :authority "Pre-1994 public holiday (abolished)")
  (:fixed "Republic Day" 5 31 :from 1961 :to 1993 :authority "Republic Day 1961–1993")
  (:fixed "Day of the Vow" 12 16 :from 1900 :to 1994
   :authority "Geloftedag / Day of the Vow — replaced by Reconciliation Day"))

(define-calendar kenya-holidays-calendar (:register "KE" :constructor kenya-holidays-calendar)
  (:fixed "New Year's Day" 1 1 :from 1963 :observed :ke-cap-110-s-4 :observed-from (1984 5 18) :authority "Public Holidays Act (Cap. 110), Laws of Kenya (originally Ordinance of 1912)")
  (:fixed "Labour Day" 5 1 :from 1963 :observed :ke-cap-110-s-4 :observed-from (1984 5 18) :authority "Public Holidays Act (Cap. 110), Laws of Kenya (originally Ordinance of 1912)")
  (:fixed "Madaraka Day" 6 1 :from 1963 :observed :ke-cap-110-s-4 :observed-from (1984 5 18) :authority "Public Holidays Act (Cap. 110), Laws of Kenya (originally Ordinance of 1912)")
  (:fixed "Moi Day" 10 10 :from 1990 :to 2009 :observed :ke-cap-110-s-4 :observed-from (1984 5 18) :authority "Public Holidays (Amendment) Act, 1990 (Act No. 9 of 1990)")
  (:fixed "Moi Day" 10 10 :from 2018 :to 2020 :observed :ke-cap-110-s-4 :observed-from (1984 5 18) :authority "Public Holidays (Amendment) Act, 1990 (Act No. 9 of 1990); observed again after KEHC JR 292 of 2017")
  (:fixed "Utamaduni Day" 10 10 :from 2021 :to 2023 :observed :ke-cap-110-s-4 :observed-from (1984 5 18) :authority "Statute Law (Miscellaneous Amendments) Act, 2020 (No. 20 of 2020)")
  (:fixed "Mazingira Day" 10 10 :from 2024 :observed :ke-cap-110-s-4 :observed-from (1984 5 18) :authority "Statute Law (Miscellaneous Amendments) Act, 2024 (No. 3 of 2024)")
  (:fixed "Kenyatta Day" 10 20 :from 1963 :to 2009 :observed :ke-cap-110-s-4 :observed-from (1984 5 18) :authority "Public Holidays Act (Cap. 110), Laws of Kenya (originally Ordinance of 1912)")
  (:fixed "Mashujaa Day" 10 20 :from 2010 :observed :ke-cap-110-s-4 :observed-from (1984 5 18) :authority "Constitution of Kenya 2010, Article 9(4)-(5) (national days)")
  (:fixed "Jamhuri Day" 12 12 :from 1964 :observed :ke-cap-110-s-4 :observed-from (1984 5 18) :authority "Public Holidays Act (Cap. 110), Laws of Kenya (originally Ordinance of 1912)")
  (:fixed "Christmas Day" 12 25 :from 1963 :observed :ke-cap-110-s-4 :observed-from (1984 5 18) :authority "Public Holidays Act (Cap. 110), Laws of Kenya (originally Ordinance of 1912)")
  (:fixed "Boxing Day" 12 26 :from 1963 :observed :ke-cap-110-s-4 :observed-from (1984 5 18) :authority "Public Holidays Act (Cap. 110), Laws of Kenya (originally Ordinance of 1912)")
  (:easter "Good Friday" -2 :from 1963 :authority "Public Holidays Act (Cap. 110), Laws of Kenya (originally Ordinance of 1912)")
  (:easter "Easter Monday" 1 :from 1963 :authority "Public Holidays Act (Cap. 110), Laws of Kenya (originally Ordinance of 1912)")
  (:computed "Idd-ul-Fitr (estimated)" (lambda (y) (%mena-estimate "KE" y 10 1 '(0))) :from 1963 :observed :ke-cap-110-s-4 :observed-from (1984 5 18)
   :authority "Public Holidays Act (Cap. 110) Part I; tabular, only in years with no list (Idd-ul-Azha, Part II, only by gazette notice)"))

(define-calendar nigeria-holidays-calendar (:register "NG" :constructor nigeria-holidays-calendar)
  ;; No in-lieu rule (s. 5(b)): the Ministry's declarations are rows. Before
  ;; Decree 3 of 1979 (not researched) the 1979 days are kept from 1960.
  (:fixed "New Year's Day" 1 1 :from 1960 :authority "Public Holidays Decree 1979 (Decree No. 3 of 1979)")
  (:fixed "Workers' Day" 5 1 :from 1985 :authority "Public Holidays (Amendment) Decree 1984 (Decree No. 26 of 1984)")
  (:fixed "Democracy Day" 5 29 :from 2000 :to 2019 :authority "Public Holidays (Amendment) Act 2000; 29 May still the holiday in 2018 (State House statement of 6 Jun 2018) and 2019")
  (:fixed "Democracy Day" 6 12 :from 2019 :authority "Public Holidays (Amendment) Act 2019 (June 12 Democracy Day)")
  (:fixed "National Day (Independence Day)" 10 1 :from 1960 :authority "Public Holidays Decree 1979 (Decree No. 3 of 1979)")
  (:fixed "Christmas Day" 12 25 :from 1960 :authority "Public Holidays Decree 1979 (Decree No. 3 of 1979)")
  (:fixed "Boxing Day" 12 26 :from 1960 :authority "Annual Federal Ministry of Interior declarations (press releases) under ss. 2-3 of the Act")
  (:easter "Good Friday" -2 :from 1960 :authority "Public Holidays Decree 1979 (Decree No. 3 of 1979)")
  (:easter "Easter Monday" 1 :from 1960 :authority "Public Holidays Decree 1979 (Decree No. 3 of 1979)")
  (:computed "Id el Fitr (estimated)" (lambda (y) (%mena-estimate "NG" y 10 1 '(0 1))) :from 1960
   :authority "Public Holidays Decree 1979 (Decree No. 3 of 1979); tabular, only in years with no list")
  (:computed "Id el Kabir (estimated)" (lambda (y) (%mena-estimate "NG" y 12 10 '(0 1))) :from 1960
   :authority "Public Holidays Decree 1979 (Decree No. 3 of 1979); tabular, only in years with no list")
  (:computed "Id el Maulud (estimated)" (lambda (y) (%mena-estimate "NG" y 3 12 '(0))) :from 1960
   :authority "Public Holidays Decree 1979 (Decree No. 3 of 1979); tabular, only in years with no list"))

(define-calendar zimbabwe-holidays-calendar (:register "ZW" :constructor zimbabwe-holidays-calendar)
  (:fixed "New Year's Day" 1 1 :from 1980 :observed :zw-cap-10-21-s-2-1 :observed-from 1980 :authority "Public Holidays and Prohibition of Business Act [Chapter 10:21]")
  (:fixed "Robert Gabriel Mugabe National Youth Day" 2 21 :from 2018 :observed :zw-cap-10-21-s-2-1 :observed-from 1980 :authority "Public Holidays and Prohibition of Business Notice, 2017 (SI 143 of 2017)")
  (:fixed "Independence Day" 4 18 :from 1980 :observed :zw-cap-10-21-s-2-1 :observed-from 1980 :authority "Public Holidays and Prohibition of Business Act [Chapter 10:21]")
  (:fixed "Workers' Day" 5 1 :from 1980 :observed :zw-cap-10-21-s-2-1 :observed-from 1980 :authority "Public Holidays and Prohibition of Business Act [Chapter 10:21]")
  (:fixed "Africa Day" 5 25 :from 1980 :observed :zw-cap-10-21-s-2-1 :observed-from 1980 :authority "Public Holidays and Prohibition of Business Act [Chapter 10:21]")
  (:fixed "Heroes' Day" 8 11 :from 1980 :to 2000 :observed :zw-cap-10-21-s-2-1 :observed-from 1980 :authority "Chapter 10:21 Schedule before Act 17 of 2001")
  (:fixed "Defence Forces Day" 8 12 :from 1980 :to 2000 :observed :zw-cap-10-21-s-2-1 :observed-from 1980 :authority "Chapter 10:21 Schedule before Act 17 of 2001")
  (:fixed "Munhumutapa Day" 9 15 :from 2026 :observed :zw-cap-10-21-s-2-1 :observed-from 1980 :authority "Public Holidays and Prohibition of Business (Declaration of Public Holiday) Notice, 2026 (SI 148 of 2026)")
  (:fixed "National Unity Day" 12 22 :from 1988 :observed :zw-cap-10-21-s-2-1 :observed-from 1980 :authority "Public Holidays and Prohibition of Business Act [Chapter 10:21]")
  (:fixed "Christmas Day" 12 25 :from 1980 :observed :zw-cap-10-21-s-2-1 :observed-from 1980 :authority "Public Holidays and Prohibition of Business Act [Chapter 10:21]")
  (:fixed "Boxing Day" 12 26 :from 1980 :observed :zw-cap-10-21-s-2-1 :observed-from 1980 :authority "Public Holidays and Prohibition of Business Act [Chapter 10:21]")
  (:easter "Good Friday" -2 :from 1980 :authority "Public Holidays and Prohibition of Business Act [Chapter 10:21]")
  (:easter "Easter Saturday" -1 :from 1980 :authority "Public Holidays and Prohibition of Business Act [Chapter 10:21]")
  (:easter "Easter Sunday" 0 :from 2009 :authority "Listed in every Minister's list from GN 113/2008 (2009)")
  (:easter "Easter Monday" 1 :from 1980 :authority "Public Holidays and Prohibition of Business Act [Chapter 10:21]")
  (:nth-weekday "Heroes' Day" 8 :monday 2 :from 2001 :authority "Public Holidays and Prohibition of Business Amendment Act, 2001 (Act 17 of 2001): the second Monday of August")
  (:computed "Defence Forces National Day" (lambda (y) (+ (nth-weekday-of-month y 8 1 2) 1)) :from 2001
   :authority "Public Holidays and Prohibition of Business Amendment Act, 2001 (Act 17 of 2001): the Tuesday after Heroes' Day"))

(define-calendar zambia-holidays-calendar (:register "ZM" :constructor zambia-holidays-calendar)
  (:fixed "New Year's Day" 1 1 :from 1964 :observed :zm-cap-272-s-2-2 :observed-from 1964 :authority "Public Holidays Act, Chapter 272 of the Laws of Zambia")
  (:fixed "International Women's Day" 3 8 :from 2008 :observed :zm-cap-272-s-2-2 :observed-from 1964 :authority "Public Holiday (Declaration) Notice, 2007 (SI 33 of 2007)")
  (:fixed "Youth Day" 3 12 :from 1988 :observed :zm-cap-272-s-2-2 :observed-from 1964 :authority "Public Holidays (Amendment) Act, 1987 (Act 23 of 1987)")
  (:fixed "Kenneth Kaunda Day" 4 28 :from 2022 :observed :zm-cap-272-s-2-2 :observed-from 1964 :authority "Public Holidays (Declaration) (No. 3) Notice, 2021 (SI 72 of 2021)")
  (:fixed "Labour Day" 5 1 :from 1964 :observed :zm-cap-272-s-2-2 :observed-from 1964 :authority "Public Holidays Act, Chapter 272 of the Laws of Zambia")
  (:fixed "Africa Freedom Day" 5 25 :from 1964 :observed :zm-cap-272-s-2-2 :observed-from 1964 :authority "Public Holidays Act, Chapter 272 of the Laws of Zambia")
  (:fixed "National Day of Prayer, Fasting, Repentance and Reconciliation" 10 18 :from 2016 :to 2025 :observed :zm-cap-272-s-2-2 :observed-from 1964 :authority "Public Holiday (Declaration) Notice, 2015 (SI 78 of 2015); revoked by SI 73 of 2026")
  (:fixed "Independence Day" 10 24 :from 1964 :observed :zm-cap-272-s-2-2 :observed-from 1964 :authority "Public Holidays Act, Chapter 272 of the Laws of Zambia")
  (:fixed "Christmas Day" 12 25 :from 1964 :observed :zm-cap-272-s-2-2 :observed-from 1964 :authority "Public Holidays Act, Chapter 272 of the Laws of Zambia")
  (:fixed "National Day of Prayer and Christian Heritage" 12 29 :from 2026 :observed :zm-cap-272-s-2-2 :observed-from 1964 :authority "Statutory Instrument No. 73 of 2026")
  (:easter "Good Friday" -2 :from 1964 :authority "Public Holidays Act, Chapter 272 of the Laws of Zambia")
  (:easter "Holy Saturday" -1 :from 1964 :authority "Public Holidays Act, Chapter 272 of the Laws of Zambia")
  (:easter "Easter Sunday" 0 :from 1964 :authority "Declared under s. 3 and listed in every Cabinet Office notice")
  (:easter "Easter Monday" 1 :from 1964 :authority "Declared under s. 3 and listed in every Cabinet Office notice")
  (:nth-weekday "Heroes Day" 7 :monday 1 :from 1983 :authority "Public Holidays (Amendment) Act, 1983 (Act 12 of 1983)")
  (:computed "Unity Day" (lambda (y) (+ (nth-weekday-of-month y 7 1 1) 1)) :from 1983 :authority "Public Holidays (Amendment) Act, 1983 (Act 12 of 1983)")
  (:nth-weekday "Farmers Day" 8 :monday 1 :from 1983 :authority "Public Holidays (Amendment) Act, 1983 (Act 12 of 1983)")
  (:computed "General election day" (lambda (y) (when (zerop (mod (- y 2016) 5)) (nth-weekday-of-month y 8 4 2))) :from 2016
   :authority "Constitution of Zambia (Amendment) Act, 2016, Article 56: the second Thursday of August every fifth year"))

(define-calendar malawi-holidays-calendar (:register "MW" :constructor malawi-holidays-calendar)
  (:fixed "New Year's Day" 1 1 :from 1964 :observed :mw-cap-18-05-s-4 :observed-from 1983 :authority "Public Holidays Act, Chapter 18:05")
  (:fixed "John Chilembwe Day" 1 15 :from 1995 :observed :mw-cap-18-05-s-4 :observed-from 1983 :authority "Public Holidays Act, Chapter 18:05")
  (:fixed "Martyrs' Day" 3 3 :from 1964 :observed :mw-cap-18-05-s-4 :observed-from 1983 :authority "Public Holidays Act, Chapter 18:05")
  (:fixed "Labour Day" 5 1 :from 1964 :observed :mw-cap-18-05-s-4 :observed-from 1983 :authority "Public Holidays Act, Chapter 18:05")
  (:fixed "Kamuzu Day" 5 14 :from 2007 :observed :mw-cap-18-05-s-4 :observed-from 1983 :authority "Government Notice 41 of 2007: 14 May")
  (:fixed "Freedom Day" 6 14 :from 1995 :to 2006 :observed :mw-cap-18-05-s-4 :observed-from 1983 :authority "Chapter 18:05 Schedule before Government Notice 41 of 2007")
  (:fixed "Independence Day" 7 6 :from 1964 :observed :mw-cap-18-05-s-4 :observed-from 1983 :authority "Public Holidays Act, Chapter 18:05")
  (:fixed "Mother's Day" 10 15 :from 2000 :observed :mw-cap-18-05-s-4 :observed-from 1983 :authority "Public Holidays Act, Chapter 18:05: 15 October")
  (:fixed "Christmas Day" 12 25 :from 1964 :observed :mw-cap-18-05-s-4 :observed-from 1983 :authority "Public Holidays Act, Chapter 18:05")
  (:fixed "Boxing Day" 12 26 :from 2000 :to 2006 :observed :mw-cap-18-05-s-4 :observed-from 1983 :authority "Boxing Day (2000-2006)")
  (:fixed "Boxing Day" 12 26 :from 2012 :observed :mw-cap-18-05-s-4 :observed-from 1983 :authority "Ministry of Local Government statement reinstating Boxing Day (26 December) as a public holiday from 2012")
  (:easter "Good Friday" -2 :from 1964 :authority "Public Holidays Act, Chapter 18:05")
  (:easter "Saturday following Good Friday" -1 :from 1964 :authority "Public Holidays Act, Chapter 18:05")
  (:easter "Easter Monday" 1 :from 1964 :authority "Public Holidays Act, Chapter 18:05")
  (:computed "Eid al-Fitr (estimated)" (lambda (y) (%mena-estimate "MW" y 10 1 '(0))) :from 2000 :observed :mw-cap-18-05-s-4 :observed-from 1983
   :authority "Eid al-Fitr at the declared day; tabular, only in years with no list (Eid al-Adha is no holiday)"))

(define-calendar madagascar-holidays-calendar (:register "MG" :constructor madagascar-holidays-calendar)
  ;; No standing list and no Sunday rule: the pattern of the yearly decrees.
  (:fixed "Jour de l'An" 1 1 :from 2000 :authority "Yearly décret fixant la liste des jours fériés, chômés et payés (2006-2026)")
  (:fixed "Journée internationale de la Femme (fériée et chômée uniquement pour les femmes from 2007)" 3 8 :from 2000 :authority "Décret n° 99-145 du 24 février 1999; the yearly decrees")
  (:fixed "Journée commémorative des morts des évènements de 1947" 3 29 :from 2000 :authority "Loi n° 66-035 du 19 décembre 1966")
  (:fixed "Fête du Travail" 5 1 :from 2000 :authority "Yearly décret fixant la liste des jours fériés, chômés et payés (2006-2026)")
  (:fixed "Fête nationale de l'Indépendance" 6 26 :from 2000 :authority "Yearly décret fixant la liste des jours fériés, chômés et payés (2006-2026)")
  (:fixed "Assomption" 8 15 :from 2000 :authority "Yearly décret fixant la liste des jours fériés, chômés et payés (2006-2026)")
  (:fixed "Toussaint" 11 1 :from 2000 :authority "Yearly décret fixant la liste des jours fériés, chômés et payés (2006-2026)")
  (:fixed "Noël" 12 25 :from 2000 :authority "Yearly décret fixant la liste des jours fériés, chômés et payés (2006-2026)")
  (:fixed "Jour d'anniversaire de la (promulgation de la) Quatrième République" 12 11 :from 2010 :to 2014 :authority "Décret n° 2010-990 du 10 décembre 2010; the lists 2011-2014")
  (:fixed "Jour d'anniversaire de la proclamation de la Première République" 10 14 :from 2013 :to 2013 :authority "Décret n° 2013-056 (list for 2013)")
  (:easter "Pâques" 0 :from 2000 :authority "Yearly décret fixant la liste des jours fériés, chômés et payés (2006-2026)")
  (:easter "Lundi de Pâques" 1 :from 2000 :authority "Yearly décret fixant la liste des jours fériés, chômés et payés (2006-2026)")
  (:easter "Ascension" 39 :from 2000 :authority "Yearly décret fixant la liste des jours fériés, chômés et payés (2006-2026)")
  (:easter "Pentecôte" 49 :from 2000 :authority "Yearly décret fixant la liste des jours fériés, chômés et payés (2006-2026)")
  (:easter "Lundi de Pentecôte" 50 :from 2000 :authority "Yearly décret fixant la liste des jours fériés, chômés et payés (2006-2026)")
  (:computed "Eid al-Fitr (estimated)" (lambda (y) (%mena-estimate "MG" y 10 1 '(0) "fitr")) :from 2013
   :authority "On the lists from 2013 (Muslims only 2013, 2014, 2016-2018); tabular, only in years with no announced date")
  (:computed "Eid al-Adha (estimated)" (lambda (y) (%mena-estimate "MG" y 12 10 '(0) "adha")) :from 2013
   :authority "On the lists from 2013 (Muslims only 2013, 2014, 2016-2018); tabular, only in years with no announced date"))

(defun south-africa-holidays-calendar (&key year transfers suppressed working-days)
  "Public holidays of South Africa (\"ZA\"): Act 36 of 1994 Schedule 1 with the
s. 2(1) Monday after a Sunday holiday, and the days the President declared
under s. 2A, data/za/holidays.sexp. Confidence by year: MENA-CONFIDENCE."
  (%mena-calendar 'south-africa-holidays-calendar "ZA" year transfers suppressed working-days))

(defun kenya-holidays-calendar (&key year transfers suppressed working-days)
  "Public holidays of Kenya (\"KE\"): Cap. 110 Part I by era with the s. 4 move
of a Sunday holiday, and the gazetted Idd-ul-Fitr, Idd-ul-Azha, election and
one-off days of data/ke/holidays.sexp. Confidence by year: MENA-CONFIDENCE."
  (%mena-calendar 'kenya-holidays-calendar "KE" year transfers suppressed working-days))

(defun nigeria-holidays-calendar (&key year transfers suppressed working-days)
  "Federal public holidays of Nigeria (\"NG\"): the Public Holidays Act days by
era, and the Ministry of Interior declarations (Eid and Maulud days, the next
working days for a weekend holiday) of data/ng/holidays.sexp. Confidence by
year: MENA-CONFIDENCE."
  (%mena-calendar 'nigeria-holidays-calendar "NG" year transfers suppressed working-days))

(defun zimbabwe-holidays-calendar (&key year transfers suppressed working-days)
  "Public holidays of Zimbabwe (\"ZW\"): the Chapter 10:21 Schedule by era with
s. 2(1), and the yearly lists and SIs of data/zw/holidays.sexp. Confidence by
year: MENA-CONFIDENCE."
  (%mena-calendar 'zimbabwe-holidays-calendar "ZW" year transfers suppressed working-days))

(defun zambia-holidays-calendar (&key year transfers suppressed working-days)
  "Public holidays of Zambia (\"ZM\"): the Cap. 272 Schedule by era with s. 2(2),
and the gazette notices and SIs of data/zm/holidays.sexp. Confidence by year:
MENA-CONFIDENCE."
  (%mena-calendar 'zambia-holidays-calendar "ZM" year transfers suppressed working-days))

(defun malawi-holidays-calendar (&key year transfers suppressed working-days)
  "Public holidays of Malawi (\"MW\"): the Cap. 18:05 Schedule with the s. 4 move
of a weekend holiday, and the declared Eid al-Fitr and one-off days of
data/mw/holidays.sexp (all :secondary). Confidence by year: MENA-CONFIDENCE."
  (%mena-calendar 'malawi-holidays-calendar "MW" year transfers suppressed working-days))

(defun madagascar-holidays-calendar (&key year transfers suppressed working-days)
  "Jours fériés of Madagascar (\"MG\"): the pattern of the yearly decrees, and
each decree's days and the announced Eid dates, data/mg/holidays.sexp.
Confidence by year: MENA-CONFIDENCE."
  (%mena-calendar 'madagascar-holidays-calendar "MG" year transfers suppressed working-days))
