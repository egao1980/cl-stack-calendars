(
 :mic "XPHS"
 :name "Philippine Stock Exchange"
 :zone "Asia/Manila"
 :calendar "XPHS"
 :kind :equity
 :source "PSE TPA 2011-0108 / Inquirer 2011-09; afternoon from 2012-01-02"
 :eras (
   (:from (1993 1 4) :to (2011 9 30)
    :sessions ((:open (9 30) :close (12 0)))
    :authority "PSE morning-only 09:30–12:00 through Sep 2011")
   (:from (2011 10 3) :to (2011 12 29)
    :sessions ((:open (9 30) :close (13 0)))
    :authority "PSE 2011-10-03: extended to 13:00 (no lunch)")
   (:from (2012 1 2) :to (2020 3 13)
    :sessions ((:open (9 30) :close (12 0))
               (:open (13 30) :close (15 30)))
    :authority "PSE 2012-01-02: 09:30-12:00 / 13:30-15:30 (CN-2014-0057, CN-2015-0128, CN-2018-0055) https://documents.pse.com.ph/CircularOPSPDF/CN-2018-0055.pdf")
   (:from (2020 3 16) :to (2021 12 3)
    :sessions ((:open (9 30) :close (13 0)))
    :authority "COVID-19: 09:30-13:00, CN-2020-0017 (16 Mar), CN-2020-0025 (resumed 19 Mar), extended by CN-2020-0035/0042/0046 https://documents.pse.com.ph/CircularOPSPDF/CN-2020-0025.pdf")
   (:from (2021 12 6) :to (2022 1 13)
    :sessions ((:open (9 30) :close (12 0))
               (:open (13 0) :close (15 0)))
    :authority "CN-2021-0059: pre-pandemic full day, 09:30-12:00 / 13:00-15:00 https://documents.pse.com.ph/CircularOPSPDF/CN-2021-0059.pdf")
   (:from (2022 1 14) :to (2022 2 28)
    :sessions ((:open (9 30) :close (13 0)))
    :authority "CN-2022-0004 (Omicron): 09:30-13:00; CN-2022-0009 ends it on 28 Feb https://documents.pse.com.ph/CircularOPSPDF/CN-2022-0004.pdf")
   (:from (2022 3 1) :to (2024 2 29)
    :sessions ((:open (9 30) :close (12 0))
               (:open (13 0) :close (15 0)))
    :authority "CN-2022-0009: 09:30-12:00 / 13:00-15:00 https://documents.pse.com.ph/CircularOPSPDF/CN-2022-0009.pdf")
   (:from (2024 3 1)
    :sessions ((:open (9 30) :close (12 0))
               (:open (13 0) :close (15 0)))
    :authority "From 2024-03-01 a closing VWAP session 15:00-15:15 follows the run-off (CN-2024-0012); the model keeps the close at 15:00, the end of continuous trading and run-off, as before 2024 https://documents.pse.com.ph/CircularOPSPDF/CN-2024-0012.pdf")))
