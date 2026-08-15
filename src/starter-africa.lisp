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
   :authority "Public holiday (tabular Hijri)"))

(define-calendar ethiopia-holidays-calendar (:register "ET")
  ;; Gregorian-published dates for Ethiopian/Eritrean Christian festivals often
  ;; use Julian+13; national civil holidays below are Gregorian-fixed.
  (:fixed "Christmas (Genna)" 1 7 :from 1900
   :authority "Ethiopian Orthodox Christmas — public holiday")
  (:fixed "Epiphany (Timkat)" 1 19 :from 1900
   :authority "Timkat — public holiday")
  (:fixed "Adwa Victory Day" 3 2 :from 1900
   :authority "Adwa (1896) — public holiday")
  (:fixed "Labour Day" 5 1 :from 1975
   :authority "International Labour Day")
  (:fixed "Downfall of the Derg" 5 28 :from 1992
   :authority "National holiday (1991 Derg fall; observed from early EPRDF era)")
  (:fixed "Ethiopian New Year (Enkutatash)" 9 11 :from 1900
   :authority "Enkutatash — 11 Sep (12 Sep in Gregorian leap years closely)")
  (:fixed "Finding of the True Cross (Meskel)" 9 27 :from 1900
   :authority "Meskel — public holiday"))

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
  (:computed "Eid al-Adha" #'eid-al-adha :from 1961 :authority "Public holiday (tabular)"))

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
  (:computed "Eid al-Fitr" #'eid-al-fitr :from 1963 :authority "Public holiday (tabular)"))

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
