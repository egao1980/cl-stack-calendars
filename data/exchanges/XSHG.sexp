;;;; Shanghai Stock Exchange cash A-share continuous session.
(
 :mic "XSHG"
 :name "Shanghai Stock Exchange"
 :zone "Asia/Shanghai"
 :calendar "CN"
 :source "SSE trading rules (unchanged cash hours since 1990s)"
 :eras (
   (:from (1990 12 19)
    :sessions ((:open (9 30) :close (11 30))
               (:open (13 0) :close (15 0)))
    :authority "SSE cash 09:30–11:30 / 13:00–15:00 from 1990-12-19 reopen")))
