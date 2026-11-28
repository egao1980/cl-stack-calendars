;; XMAD gold from Python exchange_calendars XMAD — regenerate:
;;   uv run --no-project --with exchange_calendars --with 'pandas<3' python -I scripts/generate_exchange_gold.py XMAD
;; A cross-check, not the authority: see tests/exchange-gold-test.lisp.
(
 :generated "2026-11-28"
 :source (:id "exchange_calendars" :calendar "XMAD" :version "4.13.3" :license "Apache-2.0" :uri "https://github.com/gerrymanoim/exchange_calendars")
 :mic "XMAD" :zone "Europe/Madrid"
 :from (2024 1 1) :to (2028 12 31) :session-count 1280
 :closed (
   (2024 1 1)
   (2024 3 29)
   (2024 4 1)
   (2024 5 1)
   (2024 12 25)
   (2024 12 26)
   (2025 1 1)
   (2025 4 18)
   (2025 4 21)
   (2025 5 1)
   (2025 12 25)
   (2025 12 26)
   (2026 1 1)
   (2026 4 3)
   (2026 4 6)
   (2026 5 1)
   (2026 12 25)
   (2027 1 1)
   (2027 3 26)
   (2027 3 29)
   (2028 4 14)
   (2028 4 17)
   (2028 5 1)
   (2028 12 25)
   (2028 12 26)
 )
 :weekend-sessions (
 )
 :hours (
   ((2024 1 2) (2028 12 29) (9 0) nil nil (17 30))
 )
 :early-closes (
   ((2024 12 24) (14 0))
   ((2024 12 31) (14 0))
   ((2025 12 24) (14 0))
   ((2025 12 31) (14 0))
   ((2026 12 24) (14 0))
   ((2026 12 31) (14 0))
   ((2027 12 24) (14 0))
   ((2027 12 31) (14 0))
 )
 :late-opens (
 ))
