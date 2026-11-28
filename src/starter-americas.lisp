(in-package #:cl-stack-calendars)

;;;; Americas — research window max(1900, formation) → present, with eras.

(defun co-emiliani-monday (year month day)
  "Ley 51/1983: move fixed holiday to the following Monday unless already Monday."
  (let* ((nom (make-date year month day))
         (dow (date-day-of-week nom)))
    (if (= dow 1) nom (+ nom (mod (- 8 dow) 7)))))

;;; --- Colombia decree transfers (puentes / Ley Emiliani TO days) ---------

(defun load-co-transfers (&optional (path (data-path "co/transfers.sexp")))
  "Return alist YEAR → (:authority A :transfers … :uri …)."
  (let ((form (read-data-form path)))
    (mapcar
     (lambda (block)
       (let* ((year (getf block :year))
              (auth (getf block :authority))
              (transfers (mapcar (lambda (e)
                                   (make-extra-day-transfer e auth))
                                 (getf block :holidays))))
         (cons year (list :authority auth
                          :transfers transfers
                          :uri (getf block :uri)))))
     form)))

(defvar *co-transfers* nil)

(defun co-transfers ()
  (or *co-transfers*
      (setf *co-transfers* (load-co-transfers))))

(defun co-notice-for-year (year)
  (cdr (assoc year (co-transfers))))

(defun co-transfers-for-year (year)
  (transfers-touching-year (co-transfers) year))

;;; Brazil (floor 1900; Lei 662/1949 consolidates many)
(define-calendar brazil-holidays-calendar (:register "BR")
  ;; Feriados nacionais only. Carnaval, Quarta-feira de Cinzas, Corpus Christi,
  ;; Dia do Servidor and the 24/31 December afternoons are federal pontos
  ;; facultativos (optional days off for federal staff), not holidays. Election
  ;; days (Código Eleitoral art. 380) are always on a Sunday.
  ;; https://www.planalto.gov.br/ccivil_03/leis/l0662.htm
  (:fixed "Confraternização Universal" 1 1 :from 1900
   :authority "Lei nº 662/1949 art. 1 (redação da Lei nº 10.607/2002)")
  (:easter "Paixão de Cristo" -2 :from 1900
   :authority ("Lei nº 9.093/1995 art. 2 — feriado religioso, neste incluída a Sexta-Feira da Paixão"
               "Portarias anuais do Ministério da Gestão (MPOG/ME/MGI) — Paixão de Cristo, feriado nacional"))
  (:fixed "Tiradentes" 4 21 :from 1900
   :authority "Lei nº 1.266/1950 art. 3; Lei nº 662/1949 art. 1 (redação da Lei nº 10.607/2002)")
  (:fixed "Dia Mundial do Trabalho" 5 1 :from 1900
   :authority "Lei nº 662/1949 art. 1")
  (:fixed "Independência do Brasil" 9 7 :from 1900
   :authority "Lei nº 662/1949 art. 1")
  (:fixed "Nossa Senhora Aparecida" 10 12 :from 1980
   :authority "Lei nº 6.802/1980 art. 1 — feriado nacional, Padroeira do Brasil")
  (:fixed "Finados" 11 2 :from 1900
   :authority ("Lei nº 662/1949 art. 1 (redação da Lei nº 10.607/2002, DOU 2002-12-20)"
               "Portarias anuais do Ministério da Gestão — Finados, feriado nacional"))
  (:fixed "Proclamação da República" 11 15 :from 1900
   :authority "Lei nº 662/1949 art. 1")
  (:fixed "Dia Nacional de Zumbi e da Consciência Negra" 11 20 :from 2024
   :authority "Lei nº 14.759/2023 (DOU 2023-12-22) — feriado nacional; first observed 2024")
  (:fixed "Natal" 12 25 :from 1900
   :authority "Lei nº 662/1949 art. 1"))

(defun mx-transmision-date (year)
  "LFT art. 74 fr. VII: the inauguration day of each six-year presidential
term (1988, 1994, …): 1 December until 2018 (DOF 22-12-1987), 1 October from
2024 (Constitución art. 83, reforma DOF 10-02-2014; LFT reforma DOF
30-09-2024). NIL in other years."
  (when (zerop (mod (- year 1988) 6))
    (if (>= year 2024)
        (make-date year 10 1)
        (make-date year 12 1))))

;;; Mexico (floor 1900; LFT + Monday reforms 2006)
(define-calendar mexico-holidays-calendar (:register "MX")
  ;; LFT art. 74 días de descanso obligatorio (every worker). Not here: fr. IX
  ;; election days (always a Sunday) and the CNBV bank-only days.
  ;; https://www.diputados.gob.mx/LeyesBiblio/pdf/LFT.pdf
  (:fixed "Año Nuevo" 1 1 :from 1900
   :authority "Ley Federal del Trabajo art. 74 fr. I")
  (:fixed "Día de la Constitución" 2 5 :from 1917 :to 2005
   :authority "LFT art. 74 fr. II (texto DOF 22-12-1987) — 5 de febrero")
  (:nth-weekday "Día de la Constitución" 2 :monday 1 :from 2006
   :authority "LFT art. 74 fr. II (reforma DOF 17-01-2006) — primer lunes de febrero")
  (:fixed "Natalicio de Benito Juárez" 3 21 :from 1900 :to 2006
   :authority "LFT art. 74 fr. III — 21 de marzo; DOF 17-01-2006 transitorio segundo: el lunes rige a partir de 2007 (bicentenario 2006)")
  (:nth-weekday "Natalicio de Benito Juárez" 3 :monday 3 :from 2007
   :authority "LFT art. 74 fr. III (reforma DOF 17-01-2006) — tercer lunes de marzo")
  (:fixed "Día del Trabajo" 5 1 :from 1900
   :authority "LFT art. 74 fr. IV")
  (:fixed "Día de la Independencia" 9 16 :from 1900
   :authority "LFT art. 74 fr. V")
  (:fixed "Revolución Mexicana" 11 20 :from 1917 :to 2005
   :authority "LFT art. 74 fr. VI (texto DOF 22-12-1987) — 20 de noviembre")
  (:nth-weekday "Revolución Mexicana" 11 :monday 3 :from 2006
   :authority "LFT art. 74 fr. VI (reforma DOF 17-01-2006) — tercer lunes de noviembre")
  (:computed "Transmisión del Poder Ejecutivo Federal" #'mx-transmision-date :from 1988
   :authority ("LFT art. 74 fr. VII — 1o. de diciembre de cada seis años (DOF 22-12-1987); 1o. de octubre (reforma DOF 30-09-2024)"
               "Constitución art. 83 (reforma DOF 10-02-2014) — el Presidente entra a ejercer su encargo el 1o. de octubre, desde 2024"))
  (:fixed "Navidad" 12 25 :from 1900
   :authority "LFT art. 74 fr. VIII"))

;;; Colombia (floor 1900; Ley 51/1983 Emiliani Monday + decree puentes)
(define-calendar colombia-holidays-calendar (:register "CO" :constructor colombia-holidays-calendar)
  ;; Ley 51 de 1983 art. 1: thirteen fixed-date festivos plus Jueves/Viernes
  ;; Santo, Ascensión, Corpus Christi and Sagrado Corazón. Inciso 2 moves
  ;; 6 Jan, 19 Mar, 29 Jun, 15 Aug, 12 Oct, 1 Nov, 11 Nov, Ascensión, Corpus
  ;; Christi and Sagrado Corazón to the following Monday; 1 Jan, 1 May, 20 Jul,
  ;; 7 Aug, 8 Dec, 25 Dec and Holy Week stay on their day. The law runs from
  ;; its sanction (Dec 1983); the :from 1984 eras keep that boundary.
  ;; https://www.funcionpublica.gov.co/eva/gestornormativo/norma.php?i=4954
  (:fixed "Año Nuevo" 1 1 :from 1900 :authority "Ley 51/1983 art. 1 — fijo")
  (:computed "Día de los Reyes Magos"
             (lambda (y) (co-emiliani-monday y 1 6)) :from 1984
   :authority "Ley 51/1983 art. 1 inc. 2 — 6 enero al lunes siguiente")
  (:fixed "Día de los Reyes Magos" 1 6 :from 1900 :to 1983
   :authority "Festivo — Epifanía (pre-Ley Emiliani)")
  (:computed "Día de San José"
             (lambda (y) (co-emiliani-monday y 3 19)) :from 1984
   :authority "Ley 51/1983 art. 1 inc. 2 — 19 marzo al lunes siguiente")
  (:fixed "Día de San José" 3 19 :from 1900 :to 1983 :authority "Festivo")
  (:easter "Jueves Santo" -3 :from 1900 :authority "Ley 51/1983 art. 1 — Jueves Santo, fijo")
  (:easter "Viernes Santo" -2 :from 1900 :authority "Ley 51/1983 art. 1 — Viernes Santo, fijo")
  (:fixed "Día del Trabajo" 5 1 :from 1900 :authority "Ley 51/1983 art. 1 — fijo")
  ;; Ascensión (Thursday, Easter+39), Corpus Christi (Thursday, Easter+60)
  ;; and Sagrado Corazón (Friday, Easter+68) move to the next Monday:
  ;; Easter +43, +64, +71.
  (:easter "Ascensión" 43 :from 1984
   :authority "Ley 51/1983 art. 1 inc. 2 — Ascensión del Señor al lunes siguiente (Pascua+43)")
  (:easter "Ascensión" 39 :from 1900 :to 1983 :authority "Festivo (jueves)")
  (:easter "Corpus Christi" 64 :from 1984
   :authority "Ley 51/1983 art. 1 inc. 2 — Corpus Christi al lunes siguiente (Pascua+64)")
  (:easter "Corpus Christi" 60 :from 1900 :to 1983 :authority "Festivo (jueves)")
  (:easter "Sagrado Corazón" 71 :from 1984
   :authority "Ley 51/1983 art. 1 inc. 2 — Sagrado Corazón de Jesús al lunes siguiente (Pascua+71)")
  (:easter "Sagrado Corazón" 68 :from 1900 :to 1983 :authority "Festivo (viernes)")
  (:computed "San Pedro y San Pablo"
             (lambda (y) (co-emiliani-monday y 6 29)) :from 1984
   :authority "Ley 51/1983 art. 1 inc. 2 — 29 junio al lunes siguiente")
  (:fixed "San Pedro y San Pablo" 6 29 :from 1900 :to 1983 :authority "Festivo")
  (:computed "Nuestra Señora del Rosario de Chiquinquirá"
             (lambda (y) (co-emiliani-monday y 7 9)) :from 2026
   :authority "Ley 2578 de 2026 art. 6 (D.O. 53.510, 2 jun 2026) — 9 julio, trasladado según Ley 51/1983; http://www.secretariasenado.gov.co/senado/basedoc/ley_2578_2026.html")
  (:fixed "Día de la Independencia" 7 20 :from 1900
   :authority "Ley 51/1983 art. 1 — 20 julio, fijo")
  (:fixed "Batalla de Boyacá" 8 7 :from 1900 :authority "Ley 51/1983 art. 1 — 7 agosto, fijo")
  (:computed "Asunción"
             (lambda (y) (co-emiliani-monday y 8 15)) :from 1984
   :authority "Ley 51/1983 art. 1 inc. 2 — 15 agosto al lunes siguiente")
  (:fixed "Asunción" 8 15 :from 1900 :to 1983 :authority "Festivo")
  (:computed "Día de la Raza"
             (lambda (y) (co-emiliani-monday y 10 12)) :from 1984
   :authority "Ley 51/1983 art. 1 inc. 2 — 12 octubre al lunes siguiente")
  (:fixed "Día de la Raza" 10 12 :from 1900 :to 1983 :authority "Festivo")
  (:computed "Todos los Santos"
             (lambda (y) (co-emiliani-monday y 11 1)) :from 1984
   :authority "Ley 51/1983 art. 1 inc. 2 — 1 noviembre al lunes siguiente")
  (:fixed "Todos los Santos" 11 1 :from 1900 :to 1983 :authority "Festivo")
  (:computed "Independencia de Cartagena"
             (lambda (y) (co-emiliani-monday y 11 11)) :from 1984
   :authority "Ley 51/1983 art. 1 inc. 2 — 11 noviembre al lunes siguiente")
  (:fixed "Independencia de Cartagena" 11 11 :from 1900 :to 1983 :authority "Festivo")
  (:fixed "Inmaculada Concepción" 12 8 :from 1900
   :authority "Ley 51/1983 art. 1 — 8 diciembre, fijo (no está en el inciso 2)")
  (:fixed "Navidad" 12 25 :from 1900 :authority "Ley 51/1983 art. 1 — fijo"))

;;; --- Argentina: trasladables, decree moves, data file --------------------

(defun ar-ley-23555-monday (date)
  "Ley 23.555 art. 1 (1988), Decreto 52/2017 art. 2, Ley 27.399 art. 6: a
feriado on Tuesday or Wednesday moves to the previous Monday, on Thursday or
Friday to the next Monday. Saturday, Sunday and Monday stay."
  (let ((dow (date-day-of-week date)))
    (case dow
      ((2 3) (- date (1- dow)))
      ((4 5) (+ date (- 8 dow)))
      (t date))))

(defparameter *ar-decree-moves*
  '(((2001 10) (2001 10 8) "DNU 750/2001; Ley 25.442 — 12 de octubre de 2001 al lunes 8")
    ((2002 10) (2002 10 14) "DNU 1932/2002 (BO 2002-09-30) — sábado 12 de octubre al lunes 14")
    ((2003 10) (2003 10 13) "DNU 810/2003 (BO 2003-09-24) — domingo 12 de octubre al lunes 13")
    ((2011 8) (2011 8 22) "DNU 521/2011 (BO 2011-05-04) — 17 de agosto de 2011 al día 22")
    ((2015 11) (2015 11 27) "DNU 2226/2015 (BO 2015-10-29) — 20 de noviembre de 2015 al día 27")
    ((2025 10) (2025 10 10) "Res. JGM 139/2025 (Decreto 614/2025) — 12 de octubre de 2025 al viernes 10"))
  "One-year decree moves of a trasladable feriado: ((YEAR MONTH) (Y M D) AUTHORITY).")

(defun ar-decree-move (year month)
  "The date a decree of *AR-DECREE-MOVES* gives the MONTH trasladable of YEAR, or NIL."
  (let ((entry (assoc (list year month) *ar-decree-moves* :test #'equal)))
    (when entry
      (apply #'make-date (second entry)))))

(defun ar-inamovible-p (date)
  "True when DATE is a feriado inamovible of Ley 27.399 art. 1."
  (let* ((year (date-year date))
         (easter-rd (date-rd (easter-western year)))
         (rd (date-rd date)))
    (or (member (list (date-month date) (date-day date))
                '((1 1) (3 24) (4 2) (5 1) (5 25) (6 20) (7 9) (12 8) (12 25))
                :test #'equal)
        (member (- rd easter-rd) '(-48 -47 -2)))))

(defun ar-trasladable-date (year month day)
  "Ley 27.399 art. 6 (from 2017): the day the trasladable of MONTH/DAY is kept,
after any decree move. Decreto 789/2021 art. 1 (from 2022): it stays on its
date when the move would land on a feriado inamovible."
  (or (ar-decree-move year month)
      (let* ((nominal (make-date year month day))
             (moved (ar-ley-23555-monday nominal)))
        (if (and (>= year 2022) (ar-inamovible-p moved))
            nominal
            moved))))

(defun ar-malvinas-date (year)
  "Ley 25.370: 2 April, moved by Ley 23.555 in 2001-2006 (Ley 26.110 made it
inamovible from 30 June 2006); 31 March in 2020 (DNU 297/2020)."
  (cond ((= year 2020) (make-date 2020 3 31))
        ((<= year 2006) (ar-ley-23555-monday (make-date year 4 2)))
        (t (make-date year 4 2))))

(defun ar-guemes-date (year)
  "Ley 27.258: 17 June; kept on its date in 2016 (not in Decreto 1584/2010
art. 2), trasladable from 2017."
  (if (= year 2016)
      (make-date 2016 6 17)
      (ar-trasladable-date year 6 17)))

(defun ar-san-martin-date (year)
  "17 August: the third Monday of August 1995-2016 (Ley 24.445 art. 4,
Decreto 1584/2010 art. 2), trasladable from 2017; decree moves first."
  (or (ar-decree-move year 8)
      (if (<= year 2016)
          (nth-weekday-of-month year 8 1 3)
          (ar-trasladable-date year 8 17))))

(defun ar-12-octubre-date (year)
  "12 October: Ley 23.555 art. 1 (1988-2007); Ley 26.416, Thursday to Sunday
to the next Monday (2008-2010); the second Monday (Decreto 1584/2010 art. 2,
2011-2016); Ley 27.399 art. 6 (2017-). Decree moves first."
  (let ((nominal (make-date year 10 12)))
    (or (ar-decree-move year 10)
        (cond ((<= year 2007) (ar-ley-23555-monday nominal))
              ((<= year 2010)
               (let ((dow (date-day-of-week nominal)))
                 (case dow
                   ((2 3) (- nominal (1- dow)))
                   (1 nominal)
                   (t (+ nominal (- 8 dow))))))
              ((<= year 2016) (nth-weekday-of-month year 10 1 2))
              (t (ar-trasladable-date year 10 12))))))

(defun ar-soberania-date (year)
  "20 November (Decreto 1584/2010): the fourth Monday of November 2010-2016,
trasladable from 2017; decree moves first."
  (or (ar-decree-move year 11)
      (if (<= year 2016)
          (nth-weekday-of-month year 11 1 4)
          (ar-trasladable-date year 11 20))))

(defun load-ar-transfers (&optional (path (data-path "ar/transfers.sexp")))
  "Return alist YEAR → (:authority A :transfers … :uri …) from PATH: the
feriados con fines turísticos and one-off feriados, each with its decree."
  (let ((form (read-data-form path)))
    (mapcar
     (lambda (block)
       (let* ((year (getf block :year))
              (auth (getf block :authority))
              (transfers (mapcar (lambda (e)
                                   (make-extra-day-transfer e auth))
                                 (getf block :holidays))))
         (cons year (list :authority auth
                          :transfers transfers
                          :uri (getf block :uri)))))
     form)))

(defvar *ar-transfers* nil)

(defun ar-transfers ()
  "The cached data/ar/transfers.sexp alist (see LOAD-AR-TRANSFERS)."
  (or *ar-transfers*
      (setf *ar-transfers* (load-ar-transfers))))

(defun ar-notice-for-year (year)
  "The data/ar/transfers.sexp block of YEAR, or NIL."
  (cdr (assoc year (ar-transfers))))

(defun ar-transfers-for-year (year)
  "The data/ar/transfers.sexp days that touch YEAR."
  (transfers-touching-year (ar-transfers) year))

;;; Argentina (floor 1900)
(define-calendar argentina-holidays-calendar (:register "AR" :constructor argentina-holidays-calendar)
  ;; Feriados nacionales (inamovibles; trasladables on the day they are kept)
  ;; and, from data/ar/transfers.sexp, the feriados con fines turísticos and
  ;; one-off feriados. Not here: días no laborables (Jueves Santo; Ley 27.399
  ;; arts. 2-3; Ley 26.199), which each employer decides; provincial feriados.
  ;; https://servicios.infoleg.gob.ar/infolegInternet/anexos/280000-284999/281835/norma.htm
  (:fixed "Año Nuevo" 1 1 :from 1900 :authority "Ley 21.329 art. 1; Ley 27.399 art. 1 — inamovible")
  (:easter "Carnaval" -48 :from 2011
   :authority "Decreto 1584/2010 art. 1; Ley 27.399 art. 1 — lunes de Carnaval, inamovible")
  (:easter "Carnaval" -47 :from 2011
   :authority "Decreto 1584/2010 art. 1; Ley 27.399 art. 1 — martes de Carnaval, inamovible")
  (:fixed "Día Nacional de la Memoria por la Verdad y la Justicia" 3 24 :from 2006
   :authority "Ley 26.085 (BO 2006-03-21) — feriado inamovible; Ley 27.399 art. 1")
  (:easter "Viernes Santo" -2 :from 1900 :authority "Ley 21.329 art. 1; Ley 27.399 art. 1 — inamovible")
  (:fixed "Día de la Afirmación de los Derechos Argentinos sobre las Malvinas" 6 10 :from 1984 :to 2000
   :authority "Ley 22.769; Decreto 901/1984 — 10 de junio; derogados por Ley 25.370 (BO 2000-12-21)")
  (:computed "Día del Veterano y de los Caídos en la Guerra de Malvinas" #'ar-malvinas-date :from 2001
   :authority ("Ley 25.370 (BO 2000-12-21) — 2 de abril, feriado nacional; trasladable (Ley 23.555 art. 1) hasta Ley 26.110 (BO 2006-06-30), inamovible desde entonces"
               "DNU 297/2020 — el feriado del 2 de abril de 2020 se cumple el 31 de marzo"))
  (:fixed "Día del Trabajador" 5 1 :from 1900 :authority "Ley 21.329 art. 1; Ley 27.399 art. 1 — inamovible")
  (:fixed "Día de la Revolución de Mayo" 5 25 :from 1900 :authority "Ley 21.329 art. 1; Ley 27.399 art. 1 — inamovible")
  (:computed "Paso a la Inmortalidad del Gral. Martín Miguel de Güemes" #'ar-guemes-date :from 2016
   :authority ("Ley 27.258 (BO 2016-06-10) — 17 de junio, feriado nacional"
               "Ley 27.399 arts. 1 y 6 — trasladable; Decreto 789/2021 art. 1 — sin superposición con un inamovible"))
  (:fixed "Paso a la Inmortalidad del Gral. Manuel Belgrano" 6 20 :from 1900 :to 1994
   :authority "Ley 21.329 art. 1; Ley 23.555 art. 3 — inamovible")
  (:fixed "Paso a la Inmortalidad del Gral. José de San Martín" 8 17 :from 1900 :to 1994
   :authority "Ley 21.329 art. 1; Ley 23.555 art. 3 — inamovible")
  (:fixed "Día de la Raza" 10 12 :from 1917 :to 1987
   :authority "Día de la Raza — 12 de octubre")
  (:nth-weekday "Paso a la Inmortalidad del Gral. Manuel Belgrano" 6 :monday 3 :from 1995 :to 2010
   :authority "Ley 24.445 (BO 1995-01-19) art. 4 — tercer lunes de junio")
  (:fixed "Paso a la Inmortalidad del Gral. Manuel Belgrano" 6 20 :from 2011
   :authority "Decreto 1584/2010 art. 1; Ley 27.399 art. 1 — inamovible")
  (:fixed "Día de la Independencia" 7 9 :from 1900 :authority "Ley 21.329 art. 1; Ley 27.399 art. 1 — inamovible")
  (:computed "Paso a la Inmortalidad del Gral. José de San Martín" #'ar-san-martin-date :from 1995
   :authority ("Ley 24.445 art. 4 — tercer lunes de agosto (1995-2010); Decreto 1584/2010 art. 2 — tercer lunes (2011-2016)"
               "Ley 27.399 arts. 1 y 6 — trasladable (2017-); DNU 521/2011 — 22 de agosto de 2011"))
  (:computed "Día de la Raza" #'ar-12-octubre-date :from 1988 :to 2010
   :authority ("Ley 23.555 art. 1 (1988-2007); Ley 26.416 (BO 2008-10-02, 2008-2010)"
               "DNU 750/2001, DNU 1932/2002, DNU 810/2003 — traslados de un año"))
  (:computed "Día del Respeto a la Diversidad Cultural" #'ar-12-octubre-date :from 2011
   :authority ("Decreto 1584/2010 art. 2 — segundo lunes (2011-2016); Ley 27.399 arts. 1 y 6 — trasladable (2017-)"
               "Res. JGM 139/2025 (Decreto 614/2025) — 12 de octubre de 2025 al viernes 10"))
  (:computed "Día de la Soberanía Nacional" #'ar-soberania-date :from 2010
   :authority ("Decreto 1584/2010 arts. 1-2 — 20 de noviembre, cuarto lunes (2010-2016)"
               "Ley 27.399 arts. 1 y 6 — trasladable (2017-); DNU 2226/2015 — 27 de noviembre de 2015"))
  (:fixed "Inmaculada Concepción de María" 12 8 :from 1995
   :authority "Ley 24.445 art. 1; Ley 27.399 art. 1 — inamovible")
  (:fixed "Navidad" 12 25 :from 1900 :authority "Ley 21.329 art. 1; Ley 27.399 art. 1 — inamovible"))

(defun ca-victoria-day (year)
  "Holidays Act s. 4: the first Monday immediately preceding 25 May."
  (let* ((may25 (make-date year 5 25))
         (dow (date-day-of-week may25)))
    (- may25 (if (= dow 1) 7 (1- dow)))))

(defun ca-canada-day (year)
  "Holidays Act s. 2: 1 July, not being a Sunday; 2 July when 1 July is a Sunday."
  (let ((jul1 (make-date year 7 1)))
    (if (= 7 (date-day-of-week jul1)) (+ jul1 1) jul1)))

;;; Canada, federal: the Canada Labour Code s. 166 general holidays (federally
;;; regulated employers) on the Holidays Act dates. Provincial holidays (Family
;;; Day, Civic Holiday, Easter Monday, …) are not federal and are not here.
;;; CLC s. 193(2) gives a weekend holiday's employee the working day before or
;;; after it: no fixed calendar day, so no substitute rule.
;;; https://laws-lois.justice.gc.ca/eng/acts/L-2/ · https://laws-lois.justice.gc.ca/eng/acts/H-5/

;;; Canada, federal (2000–2040 checked against data/tests/ca-holiday-gold.sexp, #17)
(define-calendar canada-holidays-calendar (:register "CA")
  (:fixed "New Year's Day" 1 1 :from 1900
   :authority "Canada Labour Code s. 166 — general holiday")
  (:easter "Good Friday" -2 :from 1900
   :authority "Canada Labour Code s. 166 — general holiday")
  (:fixed "Victoria Day" 5 24 :from 1900 :to 1952
   :authority "Empire Day / Victoria's birthday fixed era")
  (:computed "Victoria Day" #'ca-victoria-day :from 1953
   :authority ("Holidays Act (R.S.C. 1985, c. H-5) s. 4 — the first Monday immediately preceding May 25"
               "Canada Labour Code s. 166 — general holiday"))
  (:fixed "Dominion Day" 7 1 :from 1900 :to 1981
   :authority "Dominion Day until Canada Day Act 1982")
  (:computed "Canada Day" #'ca-canada-day :from 1982
   :authority ("Holidays Act s. 2 — July 1, not being a Sunday; July 2 when July 1 is a Sunday"
               "Canada Labour Code s. 166 — general holiday"))
  (:nth-weekday "Labour Day" 9 :monday 1 :from 1900
   :authority "Interpretation Act s. 35(1) — the first Monday in September; Canada Labour Code s. 166")
  (:fixed "National Day for Truth and Reconciliation" 9 30 :from 2021
   :authority "S.C. 2021, c. 11 — Canada Labour Code s. 166, observed on September 30")
  (:nth-weekday "Thanksgiving Day" 10 :monday 2 :from 1957
   :authority "Proclamation of 31 January 1957 — second Monday of October; Canada Labour Code s. 166")
  (:fixed "Remembrance Day" 11 11 :from 1931
   :authority "Holidays Act s. 3; Canada Labour Code s. 166 — general holiday")
  (:fixed "Christmas Day" 12 25 :from 1900 :authority "Canada Labour Code s. 166 — general holiday")
  (:fixed "Boxing Day" 12 26 :from 1900 :authority "Canada Labour Code s. 166 — general holiday"))

;;; Peru (floor 1900)
(define-calendar peru-holidays-calendar (:register "PE")
  ;; Feriados of DL 713 art. 6 and later laws, on their own dates (Ley 26331).
  ;; Not here: días no laborables by Decreto Supremo (public sector; private
  ;; sector by agreement), Easter Sunday, regional days.
  ;; https://leyes.congreso.gob.pe/Documentos/DecretosLegislativos/00713.pdf
  (:fixed "Año Nuevo" 1 1 :from 1900 :authority "DL 713 art. 6")
  (:easter "Jueves Santo" -3 :from 1900 :authority "DL 713 art. 6 — feriado movible")
  (:easter "Viernes Santo" -2 :from 1900 :authority "DL 713 art. 6 — feriado movible")
  (:fixed "Día del Trabajo" 5 1 :from 1900 :authority "DL 713 art. 6")
  (:fixed "Batalla de Arica y Día de la Bandera" 6 7 :from 2024
   :authority "Ley 31788 (El Peruano 2023-06-15) — feriado nacional 7 de junio; first observed 2024")
  (:fixed "San Pedro y San Pablo" 6 29 :from 1900 :authority "DL 713 art. 6")
  (:fixed "Día de la Fuerza Aérea del Perú" 7 23 :from 2023
   :authority "Ley 31822 (El Peruano 2023-07-08) — feriado nacional 23 de julio; modifica art. 6 del DL 713")
  (:fixed "Fiestas Patrias" 7 28 :from 1900 :authority "DL 713 art. 6 — 28 de julio")
  (:fixed "Fiestas Patrias" 7 29 :from 1900 :authority "DL 713 art. 6 — 29 de julio")
  (:fixed "Batalla de Junín" 8 6 :from 2022
   :authority "Ley 31530 (El Peruano 2022-07-26) — feriado nacional 6 de agosto")
  (:fixed "Santa Rosa de Lima" 8 30 :from 1900 :authority "DL 713 art. 6")
  (:fixed "Combate de Angamos" 10 8 :from 1900 :authority "DL 713 art. 6")
  (:fixed "Todos los Santos" 11 1 :from 1900 :authority "DL 713 art. 6")
  (:fixed "Inmaculada Concepción" 12 8 :from 1900 :authority "DL 713 art. 6")
  (:fixed "Batalla de Ayacucho" 12 9 :from 2022
   :authority "Ley 31381 (El Peruano 2021-12-31) — feriado nacional 9 de diciembre")
  (:fixed "Navidad" 12 25 :from 1900 :authority "DL 713 art. 6"))

;;; Australia, national subset (2000–2040 checked against data/tests/au-holiday-gold.sexp, #17)
(define-calendar australia-holidays-calendar (:register "AU"
                                                        ;; The PM&C public holiday data set (data.gov.au) names the added day so.
                                              :substitute-name "~a (substitute day)")
  ;; National subset: the Fair Work Act 2009 s. 115 holidays that every State
  ;; and Territory keeps on the same day, with the substitute days every one of
  ;; them gives. The King's (Queen's) Birthday is a state day (WA and QLD keep
  ;; it on other dates), as are Easter Saturday/Sunday, Labour Day, Melbourne
  ;; Cup and the rest. https://www.legislation.gov.au/C2009A00028/latest/text
  (:fixed "New Year's Day" 1 1 :from 1901 :observed :au-substitute-day
   :authority "Fair Work Act 2009 s. 115(1)(a); state acts — Monday after a weekend New Year's Day")
  (:fixed "Australia Day" 1 26 :from 1901 :observed :au-substitute-day
   :authority "Fair Work Act 2009 s. 115(1)(b); every State and Territory moves a weekend Australia Day to the Monday (since 1994)")
  (:easter "Good Friday" -2 :from 1901 :authority "Fair Work Act 2009 s. 115(1)(c)")
  (:easter "Easter Monday" 1 :from 1901 :authority "Fair Work Act 2009 s. 115(1)(d)")
  (:fixed "Anzac Day" 4 25 :from 1921
   :authority "Fair Work Act 2009 s. 115(1)(e); no substitute day in every jurisdiction")
  (:fixed "Christmas Day" 12 25 :from 1901 :observed :au-substitute-day
   :authority "Fair Work Act 2009 s. 115(1)(g); state acts — next free weekday when on a weekend")
  (:fixed "Boxing Day" 12 26 :from 1901 :observed :au-substitute-day
   :authority "Fair Work Act 2009 s. 115(1)(h); state acts — next free weekday when on a weekend")
  (:fixed "National Day of Mourning for Queen Elizabeth II" 9 22 :from 2022 :to 2022
   :authority "Declared in every State and Territory, 22 September 2022; https://www.fairwork.gov.au/newsroom/news/national-day-of-mourning-public-holiday"))

;;; Venezuela (floor 1900)
(define-calendar venezuela-holidays-calendar (:register "VE")
  (:fixed "Año Nuevo" 1 1 :from 1900 :authority "Feriado nacional")
  (:easter "Carnaval" -48 :from 1900 :authority "Carnaval — Lunes (Easter−48)")
  (:easter "Carnaval" -47 :from 1900 :authority "Carnaval — Martes (Easter−47)")
  (:fixed "Declaración de la Independencia" 4 19 :from 1900
   :authority "19 de abril de 1810")
  (:easter "Jueves Santo" -3 :from 1900 :authority "Semana Santa")
  (:easter "Viernes Santo" -2 :from 1900 :authority "Semana Santa")
  (:fixed "Día del Trabajador" 5 1 :from 1900 :authority "Feriado")
  (:fixed "Batalla de Carabobo" 6 24 :from 1900 :authority "Feriado nacional")
  (:fixed "Día de la Independencia" 7 5 :from 1900
   :authority "Independencia 5 de julio de 1811")
  (:fixed "Natalicio de Simón Bolívar" 7 24 :from 1900 :authority "Feriado")
  (:fixed "Día de la Resistencia Indígena" 10 12 :from 2002
   :authority "Ley — ex Día de la Raza; feriado desde 2002")
  (:fixed "Día de la Raza" 10 12 :from 1900 :to 2001
   :authority "Día de la Raza hasta 2001")
  (:fixed "Nochebuena" 12 24 :from 1900 :authority "Feriado nacional")
  (:fixed "Navidad" 12 25 :from 1900 :authority "Feriado")
  (:fixed "Fin de Año" 12 31 :from 1900 :authority "Feriado nacional"))

;;; Chile one-off holiday laws (data/cl/transfers.sexp)
(defun load-cl-transfers (&optional (path (data-path "cl/transfers.sexp")))
  (let ((form (read-data-form path)))
    (mapcar
     (lambda (block)
       (let* ((year (getf block :year))
              (auth (getf block :authority))
              (transfers (mapcar (lambda (e)
                                   (make-extra-day-transfer e auth))
                                 (getf block :holidays))))
         (cons year (list :authority auth
                          :transfers transfers
                          :uri (getf block :uri)))))
     form)))

(defvar *cl-transfers* nil)

(defun cl-transfers ()
  (or *cl-transfers*
      (setf *cl-transfers* (load-cl-transfers))))

(defun cl-notice-for-year (year)
  (cdr (assoc year (cl-transfers))))

(defun cl-transfers-for-year (year)
  (transfers-touching-year (cl-transfers) year))

;;; Chile — statutory moves (BCN texts, https://www.bcn.cl/leychile/navegar?idLey=N).

(defun cl-ley-19668-monday (date)
  "Ley 19.668 artículo único (D.O. 2000-03-10): a holiday on Tuesday, Wednesday
or Thursday moves to the Monday of that week; on Friday, to the Monday of the
next week. Monday, Saturday and Sunday stay."
  (let ((dow (date-day-of-week date)))
    (case dow
      ((2 3 4) (- date (1- dow)))
      (5 (+ date 3))
      (t date))))

(defun cl-iglesias-evangelicas-date (year)
  "Ley 20.299 art. 2: 31 October on a Tuesday moves to the previous Friday, on
a Wednesday to the next Friday."
  (let ((d (make-date year 10 31)))
    (case (date-day-of-week d)
      (2 (- d 4))
      (3 (+ d 2))
      (t d))))

(defparameter +santiago-standard+
  (location -33.4489d0 -70.6693d0 :elevation 570d0 :zone -4 :name "Santiago (UTC-4)")
  "Continental Chile in June: UTC-4 (winter time). Ley 21.357's solstice date
is the civil date there.")

(defun cl-pueblos-indigenas-date (year)
  "Ley 21.357: the day of the southern winter solstice (Sun at 90°) in
continental Chile; artículo transitorio: 21 June in 2021."
  (if (= year 2021)
      (make-date 2021 6 21)
      (solar-longitude-date 90d0 year :location +santiago-standard+)))

(defun cl-fiestas-patrias-extra-date (year)
  "Ley 20.215 (Código del Trabajo art. 35 ter, from 2007): 17 September when
18-19 September fall Tuesday-Wednesday, 20 September when they fall
Wednesday-Thursday. Ley 20.983 (from 2017): 17 September when they fall
Saturday-Sunday. NIL otherwise."
  (let ((dow (date-day-of-week (make-date year 9 18))))
    (cond ((and (>= year 2007) (= dow 2)) (make-date year 9 17))
          ((and (>= year 2007) (= dow 3)) (make-date year 9 20))
          ((and (>= year 2017) (= dow 6)) (make-date year 9 17)))))

(defun cl-new-year-extra-date (year)
  "Ley 20.983: 2 January when 1 January is a Sunday. NIL otherwise."
  (when (= 7 (date-day-of-week (make-date year 1 1)))
    (make-date year 1 2)))

;;; Chile (feriados legales 2000–2040 checked against data/tests/cl-holiday-gold.sexp, #16)
(define-calendar chile-holidays-calendar (:register "CL" :constructor chile-holidays-calendar)
  ;; Feriados legales of every worker (Ley 2.977 and later acts). Not here:
  ;; election days (Ley 18.700 art. 169, always on a weekend), the bank-only
  ;; 31 December, and regional days. One-off laws: data/cl/transfers.sexp.
  (:fixed "Año Nuevo" 1 1 :from 1900 :authority "Ley 2.977 art. 1")
  (:computed "Feriado nacional (2 de enero)" #'cl-new-year-extra-date :from 2017
   :authority "Ley 20.983 (D.O. 2016-12-30) — lunes 2 de enero cuando el 1 de enero es domingo")
  (:easter "Viernes Santo" -2 :from 1900 :authority "Ley 2.977 art. 1 n.º 3")
  (:easter "Sábado Santo" -1 :from 1900 :authority "Ley 2.977 art. 1 n.º 3 — viernes y sábado de la Semana Santa")
  (:fixed "Día Nacional del Trabajo" 5 1 :from 1900 :authority "Código del Trabajo; Ley 19.973 art. 2")
  (:fixed "Día de las Glorias Navales" 5 21 :from 1900 :authority "Ley 2.977 art. 1 n.º 5")
  (:computed "Corpus Christi"
             (lambda (y) (cl-ley-19668-monday (+ (easter-western y) 60))) :from 2000 :to 2006
   :authority "Ley 19.668 (D.O. 2000-03-10) — Corpus Christi al lunes de la misma semana; suprimido por Ley 20.148 desde 2007")
  (:computed "Día Nacional de los Pueblos Indígenas" #'cl-pueblos-indigenas-date :from 2021
   :authority "Ley 21.357 (D.O. 2021-06-19) — día del solsticio de invierno; 2021: 21 de junio")
  (:computed "San Pedro y San Pablo"
             (lambda (y) (cl-ley-19668-monday (make-date y 6 29))) :from 2000
   :authority "Ley 18.432; Ley 19.668 (D.O. 2000-03-10) — mar/mié/jue al lunes de esa semana, viernes al lunes siguiente")
  (:fixed "San Pedro y San Pablo" 6 29 :from 1986 :to 1999 :authority "Ley 18.432 (1985)")
  (:fixed "Virgen del Carmen" 7 16 :from 2007
   :authority "Ley 20.148 (D.O. 2007-01-06) — en reemplazo de Corpus Christi")
  (:fixed "Asunción de la Virgen" 8 15 :from 1900 :authority "Ley 2.977 art. 1 n.º 2")
  (:nth-weekday "Día de la Unidad Nacional" 9 :monday 1 :from 1999 :to 2001
   :authority "Ley 19.588 (1998) — primer lunes de septiembre; derogada por Ley 19.793 (D.O. 2002-03-06)")
  (:computed "Feriado adicional Fiestas Patrias" #'cl-fiestas-patrias-extra-date :from 2007
   :authority ("Ley 20.215 (D.O. 2007-09-14), Código del Trabajo art. 35 ter — lunes 17 o viernes 20 de septiembre"
               "Ley 20.983 (D.O. 2016-12-30) — viernes 17 de septiembre cuando 18 y 19 son sábado y domingo"))
  (:fixed "Independencia Nacional" 9 18 :from 1900 :authority "Ley 2.977 art. 1 n.º 4")
  (:fixed "Día de las Glorias del Ejército" 9 19 :from 1900 :authority "Ley 2.977 art. 1 n.º 5")
  (:computed "Encuentro de Dos Mundos"
             (lambda (y) (cl-ley-19668-monday (make-date y 10 12))) :from 2000
   :authority "Ley 3.810; Ley 19.668 (D.O. 2000-03-10) — mar/mié/jue al lunes de esa semana, viernes al lunes siguiente")
  (:fixed "Encuentro de Dos Mundos" 10 12 :from 1922 :to 1999 :authority "Ley 3.810")
  (:computed "Día Nacional de las Iglesias Evangélicas y Protestantes"
             #'cl-iglesias-evangelicas-date :from 2008
   :authority "Ley 20.299 (D.O. 2008-10-11) — 31 octubre; martes al viernes anterior, miércoles al viernes siguiente")
  (:fixed "Día de Todos los Santos" 11 1 :from 1900 :authority "Ley 2.977 art. 1 n.º 2")
  (:fixed "Inmaculada Concepción" 12 8 :from 1900 :authority "Ley 2.977 art. 1 n.º 2")
  (:fixed "Navidad" 12 25 :from 1900 :authority "Ley 2.977 art. 1 n.º 2"))

(defun brazil-holidays-calendar () (make-instance 'brazil-holidays-calendar))
(defun mexico-holidays-calendar () (make-instance 'mexico-holidays-calendar))
(defun colombia-holidays-calendar (&key year transfers)
  "Colombian national festivos (Ley 51/1983, Ley 2578/2026) plus any one-off
decree days of data/co/transfers.sexp (none so far: Colombia has no yearly
puentes). Without YEAR, every year in the file applies (the registered \"CO\"
calendar); with YEAR, only that year's days."
  (let ((tr (or transfers
                (if year
                    (co-transfers-for-year year)
                    (all-block-transfers (co-transfers))))))
    (make-instance 'colombia-holidays-calendar :transfers tr)))

(defun argentina-holidays-calendar (&key year transfers)
  "Argentine feriados nacionales (the rules of each era with the yearly decree
moves) plus the feriados con fines turísticos and one-off feriados of
data/ar/transfers.sexp. Without YEAR, every year in the file applies (the
registered \"AR\" calendar); with YEAR, only that year's days."
  (let ((tr (or transfers
                (if year
                    (ar-transfers-for-year year)
                    (all-block-transfers (ar-transfers))))))
    (make-instance 'argentina-holidays-calendar :transfers tr)))
(defun canada-holidays-calendar () (make-instance 'canada-holidays-calendar))
(defun peru-holidays-calendar () (make-instance 'peru-holidays-calendar))
(defun australia-holidays-calendar () (make-instance 'australia-holidays-calendar))
(defun venezuela-holidays-calendar () (make-instance 'venezuela-holidays-calendar))
(defun chile-holidays-calendar (&key year transfers)
  "Chilean feriados legales: the statutory rules plus the one-off laws of
data/cl/transfers.sexp. Without YEAR, every year in the file applies (the
registered \"CL\" calendar); with YEAR, only that year's days."
  (let ((tr (or transfers
                (if year
                    (cl-transfers-for-year year)
                    (all-block-transfers (cl-transfers))))))
    (make-instance 'chile-holidays-calendar :transfers tr)))
