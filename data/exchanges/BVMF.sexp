;;;; B3 / Bovespa cash (MIC BVMF).
(
 :mic "BVMF"
 :name "B3 S.A. - Brasil, Bolsa, Balcão"
 :zone "America/Sao_Paulo"
 :calendar "BR"
 :source "B3 / Bovespa cash session notices"
 :eras (
   (:from (1990 1 2)
    :sessions ((:open (10 0) :close (17 0)))
    :authority "Bovespa/B3 cash regular session 10:00–17:00"))
 :early-close-rules (
   (:kind :christmas-eve-weekday :from (1990 1 2) :close (13 0)
    :authority "B3 Christmas Eve weekday early close 13:00")
   (:kind :new-years-eve-weekday :from (1990 1 2) :close (13 0)
    :authority "B3 New Year's Eve weekday early close 13:00")))
