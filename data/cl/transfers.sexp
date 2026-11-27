;;;; Chile — one-off feriados legales, each declared by its own act.
;;;;
;;;; Recurring days are rules in chile-holidays-calendar since 0.16.0 (#16):
;;;; the Fiestas Patrias days of Ley 20.215 / Ley 20.983, 2 January (Ley 20.983)
;;;; and the rest. This file used to list some of those years as "D.O. corpus
;;;; backfill" and the bank-only 31 December for 2024-2026; both are gone.
;;;; Texts: https://www.bcn.cl/leychile/navegar?idLey=N
;;;; Format: ((:year Y :authority A :uri U :holidays (((Y M D) "Name") …)) …)
(
(:year 2022
  :authority "Ley 21.482 (D.O. 2022-09-10) — feriado nacional el 16 de septiembre de 2022"
  :uri "https://www.bcn.cl/leychile/navegar?idNorma=1181203"
  :holidays (
              ((2022 9 16) "Feriado nacional")
              ))

(:year 2017
  :authority "Ley 17.374 art. 43 (texto Ley 19.790) — el día del censo es feriado legal; Censo 2017"
  :uri "https://www.bcn.cl/leychile/navegar?idNorma=28960"
  :holidays (
              ((2017 4 19) "Censo Nacional de Población y Vivienda")
              ))

(:year 2010
  :authority "Ley 20.450 (D.O. 2010-07-19) — feriados el 17 y 20 de septiembre de 2010"
  :uri "https://www.bcn.cl/leychile/navegar?idLey=20450"
  :holidays (
              ((2010 9 17) "Feriado Bicentenario")
              ((2010 9 20) "Feriado Bicentenario")
              ))

(:year 2004
  :authority "Ley 19.973 art. 1 (D.O. 2004-09-10) — feriado el 17 de septiembre de 2004"
  :uri "https://www.bcn.cl/leychile/navegar?idLey=19973"
  :holidays (
              ((2004 9 17) "Feriado nacional")
              ))

(:year 2002
  :authority "Ley 17.374 art. 43 (texto Ley 19.790, D.O. 2002-02-01) — el día del censo es feriado legal; Censo 2002"
  :uri "https://www.bcn.cl/leychile/navegar?idNorma=28960"
  :holidays (
              ((2002 4 24) "Censo Nacional de Población y Vivienda")
              ))
)
