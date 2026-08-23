;;;; Tokyo Stock Exchange cash zaraba (MIC XTKS). Lunch excluded as two segments.
(
 :mic "XTKS"
 :name "Tokyo Stock Exchange"
 :zone "Asia/Tokyo"
 :calendar "JP"
 :source "JPX trading rules / arrowhead 4.0 notices"
 :eras (
   (:from (1949 5 16) :to (2024 11 1)
    :sessions ((:open (9 0) :close (11 30))
               (:open (12 30) :close (15 0)))
    :authority "TSE cash zaraba 09:00–11:30 / 12:30–15:00 (modern hours; 1949 reopen used a similar two-session day)")
   (:from (2024 11 5)
    :sessions ((:open (9 0) :close (11 30))
               (:open (12 30) :close (15 30)))
    :authority "JPX 2024-11-05 arrowhead 4.0: afternoon session to 15:30")))
