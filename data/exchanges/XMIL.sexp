;;;; Euronext Milan / Borsa Italiana cash (MIC XMIL). Holidays: calendars/XMIL.sexp.
(
 :mic "XMIL"
 :name "Euronext Milan"
 :zone "Europe/Rome"
 :calendar "XMIL"
 :kind :equity
 :source "Borsa Italiana / Euronext Milan cash 09:00–17:30"
 :eras (
   (:from (1994 1 3)
    :sessions ((:open (9 0) :close (17 30)))
    :authority "Borsa Italiana MTA: opening auction to 09:00, continuous 09:00–17:25, closing auction 17:25–17:30 (Borsa Italiana, Orari di negoziazione 28 giugno 2010: https://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/orarineg28giugno2010.pdf); today continuous to 17:30, closing auction to 17:35 (change date not found). The modeled close is the closing-auction call, 17:30. No early closes: Borsa Italiana closes on 24 and 31 December (calendars/XMIL.sexp). Before 2010 not checked.")))
