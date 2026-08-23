;;;; SIX Swiss Exchange cash (MIC XSWX). Continuous to 17:20; official close 17:30.
(
 :mic "XSWX"
 :name "SIX Swiss Exchange"
 :zone "Europe/Zurich"
 :calendar "CH"
 :kind :equity
 :source "SIX trading hours — shares 09:00–17:30 (auction 17:20–17:30)"
 :eras (
   (:from (1995 1 2)
    :sessions ((:open (9 0) :close (17 30)))
    :authority "SIX shares / funds 09:00–17:30 CET (continuous to 17:20)"))
 :early-close-rules (
   (:kind :christmas-eve-or-preceding-friday :from (1995 1 2) :close (14 0)
    :authority "SIX Christmas Eve (or preceding Friday) early close")
   (:kind :new-years-eve-or-preceding-friday :from (1995 1 2) :close (14 0)
    :authority "SIX New Year's Eve (or preceding Friday) early close")))
