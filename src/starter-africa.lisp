(in-package #:cl-stack-calendars)

;;;; Africa — research window max(1900, independence) → present.

(define-calendar nigeria-holidays-calendar (:register "NG")
  (:fixed "New Year's Day" 1 1 :from 1960 :authority "Public holiday")
  (:easter "Good Friday" -2 :from 1960 :authority "Public holiday")
  (:easter "Easter Monday" 1 :from 1960 :authority "Public holiday")
  (:fixed "Workers' Day" 5 1 :from 1960 :authority "Public holiday")
  (:fixed "Democracy Day" 5 29 :from 1999 :to 2017
   :authority "Democracy Day 29 May (1999–2017)")
  (:fixed "Democracy Day" 6 12 :from 2018
   :authority "Democracy Day moved to 12 June (2018) — June 12 1993 election")
  (:fixed "Independence Day" 10 1 :from 1960
   :authority "Independence 1 October 1960")
  (:fixed "Christmas Day" 12 25 :from 1960 :authority "Public holiday")
  (:fixed "Boxing Day" 12 26 :from 1960 :authority "Public holiday")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1960
   :authority "Public holiday (tabular Hijri; sighting ±1)")
  (:computed "Eid al-Fitr"
   (lambda (y) (let ((d (eid-al-fitr y))) (and d (+ d 1))))
   :from 1960 :authority "Eid al-Fitr Day 2")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1960
   :authority "Public holiday (tabular Hijri)")
  (:computed "Eid al-Adha"
   (lambda (y) (let ((d (eid-al-adha y))) (and d (+ d 1))))
   :from 1960 :authority "Eid al-Adha Day 2")
  (:computed "Maulid" #'mawlid-date :from 1960
   :authority "Public holiday (tabular Hijri)"))

(define-calendar ethiopia-holidays-calendar (:register "ET")
  ;; Ethiopian Orthodox festivals: Timkat/Enkutatash/Meskel shift +1 in
  ;; Gregorian leap years. Fasika uses Eastern/Julian paschalion (:orthodox t).
  (:fixed "Christmas (Genna)" 1 7 :from 1900
   :authority "Ethiopian Orthodox Christmas — public holiday")
  (:computed "Epiphany (Timkat)"
   (lambda (y) (make-date y 1 (if (date-leap-year-p (make-date y 1 1)) 20 19)))
   :from 1900
   :authority "Timkat — 19 Jan (20 Jan in Gregorian leap years)")
  (:fixed "Adwa Victory Day" 3 2 :from 1900
   :authority "Adwa (1896) — public holiday")
  (:easter "Good Friday (Siklet)" -2 :orthodox t :from 1900
   :authority "Ethiopian Orthodox Good Friday — public holiday")
  (:easter "Easter (Fasika)" 0 :orthodox t :from 1900
   :authority "Ethiopian Orthodox Easter (Fasika)")
  (:fixed "Labour Day" 5 1 :from 1975
   :authority "International Labour Day")
  (:fixed "Patriots' Victory Day" 5 5 :from 1941
   :authority "Ethiopian Patriots' Victory Day (5 May)")
  (:fixed "Downfall of the Derg" 5 28 :from 1992
   :authority "National holiday (1991 Derg fall; observed from early EPRDF era)")
  (:computed "Ethiopian New Year (Enkutatash)"
   (lambda (y) (make-date y 9 (if (date-leap-year-p (make-date y 1 1)) 12 11)))
   :from 1900
   :authority "Enkutatash — 11 Sep (12 Sep in Gregorian leap years)")
  (:computed "Finding of the True Cross (Meskel)"
   (lambda (y) (make-date y 9 (if (date-leap-year-p (make-date y 1 1)) 28 27)))
   :from 1900
   :authority "Meskel — 27 Sep (28 Sep in Gregorian leap years)")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1900
   :authority "Public holiday (tabular Hijri; sighting ±1)")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1900
   :authority "Public holiday (tabular Hijri)")
  (:computed "Mawlid" #'mawlid-date :from 1900
   :authority "Prophet's Birthday — public holiday (tabular)"))

(define-calendar dr-congo-holidays-calendar (:register "CD")
  (:fixed "Jour de l'an" 1 1 :from 1960 :authority "Fête légale")
  (:fixed "Jour des Martyrs" 1 4 :from 1960 :authority "Fête légale")
  (:fixed "Jour de Laurent-Désiré Kabila" 1 16 :from 2001
   :authority "Fête légale (assassinat L.D. Kabila)")
  (:fixed "Jour de Patriarches de l'Indépendance" 1 17 :from 2001
   :authority "Fête légale")
  (:fixed "Fête du Travail" 5 1 :from 1960 :authority "Fête légale")
  (:fixed "Jour de la Révolution et des FAZ" 5 17 :from 1997
   :authority "Fête légale (AFDL / Liberation)")
  (:fixed "Jour de l'Indépendance" 6 30 :from 1960
   :authority "Indépendance 30 juin 1960")
  (:fixed "Fête des Parents" 8 1 :from 1960 :authority "Fête légale")
  (:fixed "Noël" 12 25 :from 1960 :authority "Fête légale"))

(define-calendar tanzania-holidays-calendar (:register "TZ")
  (:fixed "New Year's Day" 1 1 :from 1961 :authority "Public holiday")
  (:fixed "Zanzibar Revolution Day" 1 12 :from 1964
   :authority "Public holiday (Revolution 1964)")
  (:easter "Good Friday" -2 :from 1961 :authority "Public holiday")
  (:easter "Easter Monday" 1 :from 1961 :authority "Public holiday")
  (:fixed "Union Day" 4 26 :from 1964
   :authority "Tanganyika–Zanzibar Union 1964")
  (:fixed "Workers' Day" 5 1 :from 1961 :authority "Public holiday")
  (:fixed "Nyerere Day" 10 14 :from 2000
   :authority "Public holiday (Julius Nyerere)")
  (:fixed "Independence Day" 12 9 :from 1961
   :authority "Independence of Tanganyika 9 Dec 1961")
  (:fixed "Christmas Day" 12 25 :from 1961 :authority "Public holiday")
  (:fixed "Boxing Day" 12 26 :from 1961 :authority "Public holiday")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1961 :authority "Public holiday (tabular)")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1961 :authority "Public holiday (tabular)")
  (:computed "Maulid" #'mawlid-date :from 1961 :authority "Public holiday (tabular)"))

(define-calendar south-africa-holidays-calendar (:register "ZA")
  (:fixed "New Year's Day" 1 1 :from 1995
   :authority "Public Holidays Act 36 of 1994 — from 1995")
  (:fixed "Human Rights Day" 3 21 :from 1995
   :authority "Public Holidays Act — Sharpeville")
  (:easter "Good Friday" -2 :from 1995 :authority "Public Holidays Act")
  (:easter "Family Day" 1 :from 1995 :authority "Public Holidays Act (Easter Monday)")
  (:fixed "Freedom Day" 4 27 :from 1995
   :authority "Public Holidays Act — first democratic election 1994")
  (:fixed "Workers' Day" 5 1 :from 1995 :authority "Public Holidays Act")
  (:fixed "Youth Day" 6 16 :from 1995
   :authority "Public Holidays Act — Soweto 1976")
  (:fixed "National Women's Day" 8 9 :from 1995 :authority "Public Holidays Act")
  (:fixed "Heritage Day" 9 24 :from 1995 :authority "Public Holidays Act")
  (:fixed "Day of Reconciliation" 12 16 :from 1995
   :authority "Public Holidays Act (replaces Day of the Vow)")
  (:fixed "Christmas Day" 12 25 :from 1995 :authority "Public Holidays Act")
  (:fixed "Day of Goodwill" 12 26 :from 1995 :authority "Public Holidays Act")
  ;; Pre-1994 Union/Republic holidays (research window from 1910/1900):
  (:fixed "Van Riebeeck's Day / Founder's Day" 4 6 :from 1900 :to 1994
   :authority "Pre-1994 public holiday (abolished)")
  (:fixed "Republic Day" 5 31 :from 1961 :to 1993
   :authority "Republic Day 1961–1993")
  (:fixed "Day of the Vow" 12 16 :from 1900 :to 1994
   :authority "Geloftedag / Day of the Vow — replaced by Reconciliation Day"))

(define-calendar kenya-holidays-calendar (:register "KE")
  (:fixed "New Year's Day" 1 1 :from 1963 :authority "Public holiday")
  (:easter "Good Friday" -2 :from 1963 :authority "Public holiday")
  (:easter "Easter Monday" 1 :from 1963 :authority "Public holiday")
  (:fixed "Labour Day" 5 1 :from 1963 :authority "Public holiday")
  (:fixed "Madaraka Day" 6 1 :from 1963
   :authority "Madaraka Day — self-government 1 June 1963")
  (:fixed "Huduma Day" 10 10 :from 2020 :to 2020
   :authority "Brief rename era; Mashujaa restored")
  (:fixed "Mashujaa Day" 10 20 :from 2010
   :authority "Heroes' Day (was Kenyatta Day until 2010 Constitution)")
  (:fixed "Kenyatta Day" 10 20 :from 1963 :to 2009
   :authority "Kenyatta Day until renamed Mashujaa Day")
  (:fixed "Jamhuri Day" 12 12 :from 1963
   :authority "Independence / Republic Day 12 December")
  (:fixed "Christmas Day" 12 25 :from 1963 :authority "Public holiday")
  (:fixed "Boxing Day" 12 26 :from 1963 :authority "Public holiday")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1963 :authority "Public holiday (tabular)")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1963 :authority "Public holiday (tabular)"))

(define-calendar uganda-holidays-calendar (:register "UG")
  (:fixed "New Year's Day" 1 1 :from 1962 :authority "Public holiday")
  (:fixed "Liberation Day" 1 26 :from 1986
   :authority "NRM Liberation Day")
  (:fixed "Archbishop Janani Luwum Day" 2 16 :from 2017
   :authority "Public holiday from 2017")
  (:fixed "International Women's Day" 3 8 :from 1962 :authority "Public holiday")
  (:easter "Good Friday" -2 :from 1962 :authority "Public holiday")
  (:easter "Easter Monday" 1 :from 1962 :authority "Public holiday")
  (:fixed "Labour Day" 5 1 :from 1962 :authority "Public holiday")
  (:fixed "Martyrs' Day" 6 3 :from 1962 :authority "Public holiday")
  (:fixed "National Heroes Day" 6 9 :from 1962 :authority "Public holiday")
  (:fixed "Independence Day" 10 9 :from 1962
   :authority "Independence 9 October 1962")
  (:fixed "Christmas Day" 12 25 :from 1962 :authority "Public holiday")
  (:fixed "Boxing Day" 12 26 :from 1962 :authority "Public holiday")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1962 :authority "Public holiday (tabular)")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1962 :authority "Public holiday (tabular)"))

(define-calendar ghana-holidays-calendar (:register "GH")
  (:fixed "New Year's Day" 1 1 :from 1957 :authority "Public holiday")
  (:fixed "Constitution Day" 1 7 :from 2019
   :authority "Public holiday from 2019")
  (:fixed "Independence Day" 3 6 :from 1957
   :authority "Independence 6 March 1957")
  (:easter "Good Friday" -2 :from 1957 :authority "Public holiday")
  (:easter "Easter Monday" 1 :from 1957 :authority "Public holiday")
  (:fixed "May Day" 5 1 :from 1957 :authority "Public holiday")
  (:fixed "Founders' Day" 8 4 :from 2019
   :authority "Public holiday (Founders' Day)")
  (:fixed "Kwame Nkrumah Memorial Day" 9 21 :from 2009
   :authority "Public holiday")
  (:fixed "Farmers' Day" 12 1 :from 1988
   :authority "First Friday of December in practice — fixed stub 1 Dec")
  (:fixed "Christmas Day" 12 25 :from 1957 :authority "Public holiday")
  (:fixed "Boxing Day" 12 26 :from 1957 :authority "Public holiday")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1957 :authority "Public holiday (tabular)")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1957 :authority "Public holiday (tabular)"))

(defun nigeria-holidays-calendar () (make-instance 'nigeria-holidays-calendar))
(defun ethiopia-holidays-calendar () (make-instance 'ethiopia-holidays-calendar))
(defun dr-congo-holidays-calendar () (make-instance 'dr-congo-holidays-calendar))
(defun tanzania-holidays-calendar () (make-instance 'tanzania-holidays-calendar))
(defun south-africa-holidays-calendar () (make-instance 'south-africa-holidays-calendar))
(defun kenya-holidays-calendar () (make-instance 'kenya-holidays-calendar))
(defun uganda-holidays-calendar () (make-instance 'uganda-holidays-calendar))
(defun ghana-holidays-calendar () (make-instance 'ghana-holidays-calendar))

;;; Angola (independence 1975)
(define-calendar angola-holidays-calendar (:register "AO")
  (:fixed "Ano Novo" 1 1 :from 1975 :authority "Feriado nacional")
  (:fixed "Dia do Início da Luta Armada" 2 4 :from 1975
   :authority "Início da luta armada de libertação nacional (1961)")
  (:easter "Carnaval" -47 :from 1975
   :authority "Carnaval — terça antes da Quarta-feira de Cinzas (Páscoa−47)")
  (:fixed "Dia Internacional da Mulher" 3 8 :from 1975 :authority "Feriado nacional")
  (:fixed "Dia da Libertação da África Austral" 3 23 :from 2019
   :authority "Batalha de Cuito Cuanavale — feriado desde 2019")
  (:easter "Sexta-Feira Santa" -2 :from 1975 :authority "Feriado nacional")
  (:fixed "Dia da Paz" 4 4 :from 2002
   :authority "Fim da guerra civil — 4 de abril")
  (:fixed "Dia do Trabalhador" 5 1 :from 1975 :authority "Feriado nacional")
  (:fixed "Dia do Fundador da Nação e dos Heróis Nacionais" 9 17 :from 1975
   :authority "Aniversário de Agostinho Neto")
  (:fixed "Dia de Finados" 11 2 :from 1975 :authority "Feriado nacional")
  (:fixed "Dia da Independência" 11 11 :from 1975
   :authority "Independência de Portugal — 11 de novembro de 1975")
  (:fixed "Natal" 12 25 :from 1975 :authority "Feriado nacional"))

(defun angola-holidays-calendar () (make-instance 'angola-holidays-calendar))

;;; --- ≥20M population tier (Africa) ------------------------------------

(define-calendar mozambique-holidays-calendar (:register "MZ")
  (:fixed "Dia da Fraternidade Universal" 1 1 :from 1975 :authority "Feriado nacional")
  (:fixed "Dia dos Heróis Moçambicanos" 2 3 :from 1975
   :authority "Dia dos heróis moçambicanos — feriado nacional")
  (:fixed "Dia da Mulher Moçambicana" 4 7 :from 1975 :authority "Feriado nacional")
  (:fixed "Dia Internacional dos Trabalhadores" 5 1 :from 1975 :authority "Feriado nacional")
  (:fixed "Dia da Independência Nacional" 6 25 :from 1975
   :authority "Independência 25 de junho de 1975")
  (:fixed "Dia da Vitória" 9 7 :from 1975 :authority "Feriado nacional")
  (:fixed "Dia das Forças Armadas de Libertação Nacional" 9 25 :from 1975
   :authority "Feriado nacional")
  (:fixed "Dia da Paz e Reconciliação" 10 4 :from 1995
   :authority "Acordo Geral de Paz — feriado desde 1995")
  (:fixed "Dia da Família" 12 25 :from 1975 :authority "Feriado nacional"))

(define-calendar madagascar-holidays-calendar (:register "MG")
  (:fixed "Taom-baovao" 1 1 :from 1960 :authority "Fetim-panjakana")
  (:fixed "Andro iraisam-pirenena ho an'ny vehivavy" 3 8 :from 1960 :authority "Fetim-panjakana")
  (:fixed "Martioran'ny tolona tamin'ny 1947" 3 29 :from 1960
   :authority "Martyrs du 29 mars 1947")
  (:easter "Alatsinain'ny Paska" 1 :from 1960 :authority "Fetim-panjakana")
  (:fixed "Fetin'ny asa" 5 1 :from 1960 :authority "Fetim-panjakana")
  (:fixed "Andron'i Afrika" 5 25 :from 1960 :authority "Fetim-panjakana")
  (:fixed "Andro niakarana" 6 26 :from 1960
   :authority "Independence 26 June 1960")
  (:fixed "Asompsiona" 8 15 :from 1960 :authority "Fetim-panjakana")
  (:fixed "Fetin'ny olo-masina" 11 1 :from 1960 :authority "Fetim-panjakana")
  (:fixed "Krismasy" 12 25 :from 1960 :authority "Fetim-panjakana")
  (:computed "Aïd el-Fitr" #'eid-al-fitr :from 1960 :authority "Fête légale (tabular)")
  (:computed "Aïd el-Adha" #'eid-al-adha :from 1960 :authority "Fête légale (tabular)"))

(define-calendar cameroon-holidays-calendar (:register "CM")
  (:fixed "Nouvel An" 1 1 :from 1960 :authority "Jour férié légal")
  (:fixed "Fête de la Jeunesse" 2 11 :from 1960 :authority "Jour férié légal")
  (:easter "Vendredi saint" -2 :from 1960 :authority "Jour férié légal")
  (:fixed "Fête du Travail" 5 1 :from 1960 :authority "Jour férié légal")
  (:fixed "Fête Nationale / de l'Unité" 5 20 :from 1972
   :authority "Unité nationale — 20 mai (1972 referendum)")
  (:easter "Ascension" 39 :from 1960 :authority "Jour férié légal")
  (:fixed "Assomption" 8 15 :from 1960 :authority "Jour férié légal")
  (:fixed "Noël" 12 25 :from 1960 :authority "Jour férié légal")
  (:computed "Aïd el-Fitr" #'eid-al-fitr :from 1960 :authority "Jour férié (tabular)")
  (:computed "Aïd el-Adha" #'eid-al-adha :from 1960 :authority "Jour férié (tabular)"))

(define-calendar cote-divoire-holidays-calendar (:register "CI")
  (:fixed "Nouvel An" 1 1 :from 1960 :authority "Jour férié")
  (:easter "Lundi de Pâques" 1 :from 1960 :authority "Jour férié")
  (:fixed "Fête du Travail" 5 1 :from 1960 :authority "Jour férié")
  (:easter "Ascension" 39 :from 1960 :authority "Jour férié")
  (:easter "Lundi de Pentecôte" 50 :from 1960 :authority "Jour férié")
  (:fixed "Fête de l'Indépendance" 8 7 :from 1960
   :authority "Indépendance 7 août 1960")
  (:fixed "Assomption" 8 15 :from 1960 :authority "Jour férié")
  (:fixed "Toussaint" 11 1 :from 1960 :authority "Jour férié")
  (:fixed "Journée Nationale de la Paix" 11 15 :from 1996
   :authority "Fête de la paix — jour férié depuis 1996")
  (:fixed "Noël" 12 25 :from 1960 :authority "Jour férié")
  (:computed "Aïd el-Fitr" #'eid-al-fitr :from 1960 :authority "Jour férié (tabular)")
  (:computed "Aïd el-Adha" #'eid-al-adha :from 1960 :authority "Jour férié (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1960 :authority "Jour férié (tabular)"))

(define-calendar niger-holidays-calendar (:register "NE")
  (:fixed "Nouvel An" 1 1 :from 1960 :authority "Jour férié")
  (:fixed "Journée Nationale de la Concorde" 4 24 :from 1995
   :authority "Concord Day — 24 avril (1995)")
  (:fixed "Fête du Travail" 5 1 :from 1960 :authority "Jour férié")
  (:fixed "Proclamation de l'Indépendance" 8 3 :from 1960
   :authority "Indépendance 3 août 1960")
  (:fixed "Proclamation de la République" 12 18 :from 1958
   :authority "République du Niger — 18 décembre 1958")
  (:fixed "Noël" 12 25 :from 1960 :authority "Jour férié")
  (:computed "Aïd el-Fitr" #'eid-al-fitr :from 1960 :authority "Jour férié (tabular)")
  (:computed "Aïd el-Adha" #'eid-al-adha :from 1960 :authority "Jour férié (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1960 :authority "Jour férié (tabular)")
  (:computed "Nouvel An islamique" #'islamic-new-year-date :from 1960
   :authority "1 Muharram (tabular)"))

(define-calendar burkina-faso-holidays-calendar (:register "BF")
  (:fixed "Nouvel An" 1 1 :from 1960 :authority "Jour férié")
  (:fixed "Soulèvement populaire" 1 3 :from 1966
   :authority "Anniversaire du 3 janvier 1966")
  (:fixed "Journée internationale des femmes" 3 8 :from 1960 :authority "Jour férié")
  (:easter "Lundi de Pâques" 1 :from 1960 :authority "Jour férié")
  (:fixed "Fête du Travail" 5 1 :from 1960 :authority "Jour férié")
  (:easter "Ascension" 39 :from 1960 :authority "Jour férié")
  (:fixed "Jour de l'Indépendance" 8 5 :from 1960
   :authority "Indépendance 5 août 1960")
  (:fixed "Assomption" 8 15 :from 1960 :authority "Jour férié")
  (:fixed "Toussaint" 11 1 :from 1960 :authority "Jour férié")
  (:fixed "Fête nationale" 12 11 :from 1958
   :authority "Proclamation de la République — 11 décembre 1958")
  (:fixed "Noël" 12 25 :from 1960 :authority "Jour férié")
  (:computed "Aïd el-Fitr" #'eid-al-fitr :from 1960 :authority "Jour férié (tabular)")
  (:computed "Aïd el-Adha" #'eid-al-adha :from 1960 :authority "Jour férié (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1960 :authority "Jour férié (tabular)"))

(define-calendar mali-holidays-calendar (:register "ML")
  (:fixed "Nouvel An" 1 1 :from 1960 :authority "Jour férié")
  (:fixed "Fête de l'Armée" 1 20 :from 1960 :authority "Jour férié")
  (:fixed "Journée des Martyrs" 3 26 :from 1960 :authority "Jour férié")
  (:easter "Lundi de Pâques" 1 :from 1960 :authority "Jour férié")
  (:fixed "Fête du Travail" 5 1 :from 1960 :authority "Jour férié")
  (:fixed "Jour de l'Afrique" 5 25 :from 1960 :authority "Jour férié")
  (:fixed "Fête nationale de l'Indépendance" 9 22 :from 1960
   :authority "Indépendance 22 septembre 1960")
  (:fixed "Noël" 12 25 :from 1960 :authority "Jour férié")
  (:computed "Aïd el-Fitr" #'eid-al-fitr :from 1960 :authority "Jour férié (tabular)")
  (:computed "Aïd el-Adha" #'eid-al-adha :from 1960 :authority "Jour férié (tabular)")
  (:computed "Mawlid" #'mawlid-date :from 1960 :authority "Jour férié (tabular)"))

(define-calendar malawi-holidays-calendar (:register "MW")
  (:fixed "New Year's Day" 1 1 :from 1964 :authority "Public holiday")
  (:fixed "John Chilembwe Day" 1 15 :from 1995
   :authority "Public holiday — John Chilembwe Day")
  (:fixed "Martyrs' Day" 3 3 :from 1964 :authority "Public holiday")
  (:easter "Good Friday" -2 :from 1964 :authority "Public holiday")
  (:easter "Easter Monday" 1 :from 1964 :authority "Public holiday")
  (:fixed "Labour Day" 5 1 :from 1964 :authority "Public holiday")
  (:fixed "Kamuzu Day" 5 14 :from 1964 :to 2008
   :authority "Kamuzu Day — 14 May until move to May Monday")
  (:nth-weekday "Kamuzu Day" 5 :monday 3 :from 2009
   :authority "Kamuzu Day — third Monday in May (2009 reform)")
  (:fixed "Independence Day" 7 6 :from 1964
   :authority "Independence 6 July 1964")
  (:nth-weekday "Mother's Day" 10 :monday 2 :from 1964
   :authority "Mother's Day — second Monday in October")
  (:fixed "Christmas Day" 12 25 :from 1964 :authority "Public holiday")
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1964 :authority "Public holiday (tabular)")
  (:computed "Eid al-Adha" #'eid-al-adha :from 1964 :authority "Public holiday (tabular)"))

(define-calendar zambia-holidays-calendar (:register "ZM")
  (:fixed "New Year's Day" 1 1 :from 1964 :authority "Public holiday")
  (:fixed "International Women's Day" 3 8 :from 1964 :authority "Public holiday")
  (:fixed "Youth Day" 3 12 :from 1964 :authority "Public holiday")
  (:easter "Good Friday" -2 :from 1964 :authority "Public holiday")
  (:easter "Easter Monday" 1 :from 1964 :authority "Public holiday")
  (:fixed "Labour Day" 5 1 :from 1964 :authority "Public holiday")
  (:fixed "African Freedom Day" 5 25 :from 1964 :authority "Public holiday")
  (:nth-weekday "Heroes' Day" 7 :monday 1 :from 1964
   :authority "Heroes' Day — first Monday in July")
  (:computed "Unity Day"
   (lambda (y) (+ (nth-weekday-of-month y 7 1 1) 1))
   :from 1964
   :authority "Unity Day — day after Heroes' Day")
  (:nth-weekday "Farmers' Day" 8 :monday 1 :from 1964
   :authority "Farmers' Day — first Monday in August")
  (:fixed "Independence Day" 10 24 :from 1964
   :authority "Independence 24 October 1964")
  (:fixed "Christmas Day" 12 25 :from 1964 :authority "Public holiday"))

(defun mozambique-holidays-calendar () (make-instance 'mozambique-holidays-calendar))
(defun madagascar-holidays-calendar () (make-instance 'madagascar-holidays-calendar))
(defun cameroon-holidays-calendar () (make-instance 'cameroon-holidays-calendar))
(defun cote-divoire-holidays-calendar () (make-instance 'cote-divoire-holidays-calendar))
(defun niger-holidays-calendar () (make-instance 'niger-holidays-calendar))
(defun burkina-faso-holidays-calendar () (make-instance 'burkina-faso-holidays-calendar))
(defun mali-holidays-calendar () (make-instance 'mali-holidays-calendar))
(defun malawi-holidays-calendar () (make-instance 'malawi-holidays-calendar))
(defun zambia-holidays-calendar () (make-instance 'zambia-holidays-calendar))
