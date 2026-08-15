(in-package #:cl-stack-calendars)

;;;; Americas — research window max(1900, formation) → present, with eras.

;;; Brazil (floor 1900; Lei 662/1949 consolidates many)
(define-calendar brazil-holidays-calendar (:register "BR")
  (:fixed "Confraternização Universal" 1 1 :from 1900
   :authority "Lei nº 662/1949 e anteriores — Ano Novo")
  (:fixed "Tiradentes" 4 21 :from 1900
   :authority "Lei nº 662/1949 — Tiradentes")
  (:fixed "Dia do Trabalhador" 5 1 :from 1900
   :authority "Lei nº 662/1949 — Dia do Trabalho")
  (:fixed "Independência do Brasil" 9 7 :from 1900
   :authority "Lei nº 662/1949 — Independência (7 Set 1822)")
  (:fixed "Nossa Senhora Aparecida" 10 12 :from 1980
   :authority "Lei nº 6.802/1980 — padroeira; feriado nacional")
  (:fixed "Finados" 11 2 :from 1900
   :authority "Lei nº 662/1949 — Finados")
  (:fixed "Proclamação da República" 11 15 :from 1900
   :authority "Lei nº 662/1949 — Proclamação da República (1889)")
  (:fixed "Dia Nacional de Zumbi e da Consciência Negra" 11 20 :from 2024
   :authority "Lei nº 14.759/2023 — feriado nacional desde 2024")
  (:fixed "Natal" 12 25 :from 1900
   :authority "Lei nº 662/1949 — Natal")
  (:easter "Sexta-feira Santa" -2 :from 1900
   :authority "Feriado nacional (Paixão de Cristo)")
  (:easter "Corpus Christi" 60 :from 1900
   :authority "Feriado nacional (Corpus Christi)"))

;;; Mexico (floor 1900; LFT + Monday reforms 2006)
(define-calendar mexico-holidays-calendar (:register "MX")
  (:fixed "Año Nuevo" 1 1 :from 1900
   :authority "Ley Federal del Trabajo — descanso obligatorio")
  (:fixed "Día de la Constitución" 2 5 :from 1917 :to 2005
   :authority "Constitución 1917 — 5 febrero (antes de reforma LFT 2005/6)")
  (:nth-weekday "Día de la Constitución" 2 :monday 1 :from 2006
   :authority "LFT reforma — primer lunes de febrero")
  (:fixed "Natalicio de Benito Juárez" 3 21 :from 1900 :to 2005
   :authority "Descanso obligatorio — 21 marzo hasta reforma")
  (:nth-weekday "Natalicio de Benito Juárez" 3 :monday 3 :from 2006
   :authority "LFT reforma — tercer lunes de marzo")
  (:fixed "Día del Trabajo" 5 1 :from 1900
   :authority "LFT — 1 de mayo")
  (:fixed "Día de la Independencia" 9 16 :from 1900
   :authority "LFT — 16 de septiembre")
  (:fixed "Revolución Mexicana" 11 20 :from 1917 :to 2005
   :authority "20 noviembre hasta reforma LFT")
  (:nth-weekday "Revolución Mexicana" 11 :monday 3 :from 2006
   :authority "LFT reforma — tercer lunes de noviembre")
  (:fixed "Navidad" 12 25 :from 1900
   :authority "LFT — 25 de diciembre"))

;;; Colombia (floor 1900; Ley 51/1983 emolumentos / Law 35 etc.)
(define-calendar colombia-holidays-calendar (:register "CO")
  (:fixed "Año Nuevo" 1 1 :from 1900 :authority "Festivo nacional")
  (:fixed "Día de los Reyes Magos" 1 6 :from 1900
   :authority "Festivo — Epifanía (often moved to Monday under Ley 51/1983)")
  (:fixed "Día de San José" 3 19 :from 1900 :authority "Festivo")
  (:easter "Jueves Santo" -3 :from 1900 :authority "Semana Santa")
  (:easter "Viernes Santo" -2 :from 1900 :authority "Semana Santa")
  (:fixed "Día del Trabajo" 5 1 :from 1900 :authority "Festivo")
  (:easter "Ascensión" 39 :from 1900 :authority "Festivo (often Monday)")
  (:easter "Corpus Christi" 60 :from 1900 :authority "Festivo")
  (:easter "Sagrado Corazón" 68 :from 1900 :authority "Festivo")
  (:fixed "San Pedro y San Pablo" 6 29 :from 1900 :authority "Festivo")
  (:fixed "Día de la Independencia" 7 20 :from 1900
   :authority "Independencia 20 Jul 1810 — festivo")
  (:fixed "Batalla de Boyacá" 8 7 :from 1900 :authority "Festivo")
  (:fixed "Asunción" 8 15 :from 1900 :authority "Festivo")
  (:fixed "Día de la Raza" 10 12 :from 1900 :authority "Festivo")
  (:fixed "Todos los Santos" 11 1 :from 1900 :authority "Festivo")
  (:fixed "Independencia de Cartagena" 11 11 :from 1900 :authority "Festivo")
  (:fixed "Inmaculada Concepción" 12 8 :from 1900 :authority "Festivo")
  (:fixed "Navidad" 12 25 :from 1900 :authority "Festivo"))

;;; Argentina (floor 1900)
(define-calendar argentina-holidays-calendar (:register "AR")
  (:fixed "Año Nuevo" 1 1 :from 1900 :authority "Feriado nacional")
  (:easter "Viernes Santo" -2 :from 1900 :authority "Feriado")
  (:easter "Lunes de Carnaval" -48 :from 2011
   :authority "Ley 26.665/2011 — Carnaval Monday (Easter−48)")
  (:easter "Martes de Carnaval" -47 :from 2011
   :authority "Ley 26.665/2011 — Carnaval Tuesday (Easter−47)")
  (:fixed "Día del Veterano y de los Caídos en Malvinas" 4 2 :from 2001
   :authority "Ley 26.110 — feriado 2 de abril")
  (:fixed "Día del Trabajador" 5 1 :from 1900 :authority "Feriado")
  (:fixed "Revolución de Mayo" 5 25 :from 1900 :authority "Feriado")
  (:fixed "Paso a la Inmortalidad del Gral. Güemes" 6 17 :from 2016
   :authority "Ley 27.116 — feriado 17 de junio")
  (:fixed "Paso a la Inmortalidad del Gral. Belgrano" 6 20 :from 1900
   :authority "Flag Day — feriado")
  (:fixed "Día de la Independencia" 7 9 :from 1900
   :authority "Independencia 1816 — feriado")
  (:fixed "Paso a la Inmortalidad del Gral. San Martín" 8 17 :from 1900
   :authority "Feriado (often third Monday August under bridge laws)")
  (:fixed "Día del Respeto a la Diversidad Cultural" 10 12 :from 2010
   :authority "Ley 26.977 — ex Día de la Raza")
  (:fixed "Día de la Raza" 10 12 :from 1900 :to 2009
   :authority "Día de la Raza hasta cambio de denominación")
  (:fixed "Día de la Soberanía Nacional" 11 20 :from 2010
   :authority "Ley 26.815 — feriado")
  (:fixed "Inmaculada Concepción" 12 8 :from 1900 :authority "Feriado")
  (:fixed "Navidad" 12 25 :from 1900 :authority "Feriado"))

;;; Canada (floor 1900; Canada Day name from 1982)
(define-calendar canada-holidays-calendar (:register "CA")
  (:fixed "New Year's Day" 1 1 :from 1900
   :authority "Canada Labour Code / provincial — nationwide observance")
  (:easter "Good Friday" -2 :from 1900
   :authority "Nationwide (federal + provinces)")
  (:fixed "Victoria Day" 5 24 :from 1900 :to 1952
   :authority "Empire Day / Victoria's birthday fixed era")
  (:nth-weekday "Victoria Day" 5 :monday -1 :from 1953
   :authority "Monday before 25 May — Victoria Day")
  (:fixed "Dominion Day" 7 1 :from 1900 :to 1981
   :authority "Dominion Day until Canada Day Act 1982")
  (:fixed "Canada Day" 7 1 :from 1982
   :authority "Canada Day Act — 1 July")
  (:nth-weekday "Labour Day" 9 :monday 1 :from 1900
   :authority "Labour Day — first Monday of September")
  (:nth-weekday "Thanksgiving" 10 :monday 2 :from 1957
   :authority "Second Monday of October (federal)")
  (:fixed "Remembrance Day" 11 11 :from 1931
   :authority "Federal holiday (banks); statutory in many provinces")
  (:fixed "Christmas Day" 12 25 :from 1900 :authority "Nationwide")
  (:fixed "Boxing Day" 12 26 :from 1900
   :authority "Statutory in several provinces; federal public sector"))

;;; Peru (floor 1900)
(define-calendar peru-holidays-calendar (:register "PE")
  (:fixed "Año Nuevo" 1 1 :from 1900 :authority "Feriado nacional")
  (:easter "Jueves Santo" -3 :from 1900 :authority "Semana Santa")
  (:easter "Viernes Santo" -2 :from 1900 :authority "Semana Santa")
  (:fixed "Día del Trabajo" 5 1 :from 1900 :authority "Feriado")
  (:fixed "San Pedro y San Pablo" 6 29 :from 1900 :authority "Feriado")
  (:fixed "Fiestas Patrias" 7 28 :from 1900
   :authority "Independencia — 28 julio")
  (:fixed "Fiestas Patrias" 7 29 :from 1900
   :authority "Fiestas Patrias — 29 julio")
  (:fixed "Santa Rosa de Lima" 8 30 :from 1900 :authority "Feriado")
  (:fixed "Combate de Angamos" 10 8 :from 1900 :authority "Feriado")
  (:fixed "Todos los Santos" 11 1 :from 1900 :authority "Feriado")
  (:fixed "Inmaculada Concepción" 12 8 :from 1900 :authority "Feriado")
  (:fixed "Batalla de Ayacucho" 12 9 :from 2022
   :authority "Ley 31155 — feriado 9 de diciembre desde 2022")
  (:fixed "Navidad" 12 25 :from 1900 :authority "Feriado"))

;;; Australia (federation 1901)
(define-calendar australia-holidays-calendar (:register "AU")
  (:fixed "New Year's Day" 1 1 :from 1901
   :authority "Nationwide public holiday")
  (:fixed "Australia Day" 1 26 :from 1901
   :authority "Australia Day / Anniversary Day — national from early Federation era")
  (:easter "Good Friday" -2 :from 1901 :authority "Nationwide")
  (:easter "Easter Monday" 1 :from 1901 :authority "Nationwide")
  (:fixed "ANZAC Day" 4 25 :from 1921
   :authority "ANZAC Day — national public holiday from early 1920s")
  (:fixed "King's Birthday" 6 3 :from 1901
   :authority "Sovereign's birthday — date varies by state; June Monday common (NSW/VIC/…)")
  (:nth-weekday "King's Birthday (June Monday states)" 6 :monday 2 :from 1901
   :authority "Second Monday in June (NSW, VIC, WA, ACT, NT, TAS practice)")
  (:fixed "Christmas Day" 12 25 :from 1901 :authority "Nationwide")
  (:fixed "Boxing Day" 12 26 :from 1901 :authority "Nationwide (most jurisdictions)"))

(defun brazil-holidays-calendar () (make-instance 'brazil-holidays-calendar))
(defun mexico-holidays-calendar () (make-instance 'mexico-holidays-calendar))
(defun colombia-holidays-calendar () (make-instance 'colombia-holidays-calendar))
(defun argentina-holidays-calendar () (make-instance 'argentina-holidays-calendar))
(defun canada-holidays-calendar () (make-instance 'canada-holidays-calendar))
(defun peru-holidays-calendar () (make-instance 'peru-holidays-calendar))
(defun australia-holidays-calendar () (make-instance 'australia-holidays-calendar))
