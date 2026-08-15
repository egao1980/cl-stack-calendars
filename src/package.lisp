(defpackage #:cl-stack-calendars
  (:nicknames #:stack-calendars)
  (:use #:cl #:datetime-protocol)
  (:shadowing-import-from #:datetime-protocol
   #:+ #:- #:< #:<= #:> #:>= #:= #:/= #:min #:max)
  (:export
   ;; conditions
   #:calendar-error
   #:calendar-error-message
   #:calendar-not-found
   #:calendar-not-found-calendar-name
   #:invalid-holiday-rule
   #:session-boundary-error
   #:session-boundary-error-session
   #:session-boundary-error-date
   #:session-boundary-error-boundary

   ;; core protocol
   #:holiday-calendar
   #:business-day-p
   #:holiday-p
   #:holidays-between
   #:next-business-day
   #:previous-business-day
   #:add-business-days
   #:business-days-between
   #:adjust-date
   #:weekend-day-p
   #:calendar-weekend-days
   #:calendar-name
   #:calendar-as-of

   ;; holiday-observance value type
   #:holiday-observance
   #:holiday-observance-p
   #:make-holiday-observance
   #:holiday-observance-date
   #:holiday-observance-name

   ;; rule-calendar / DSL
   #:rule-calendar
   #:calendar-rules
   #:define-calendar
   #:make-fixed-holiday-rule
   #:make-nth-weekday-holiday-rule
   #:make-easter-holiday-rule
   #:make-computed-holiday-rule
   #:holiday-rule-authority
   #:holiday-rule-name
   #:holiday-rule-from
   #:holiday-rule-to

   ;; decree transfers / compensatory working days
   #:calendar-transfer
   #:make-calendar-transfer
   #:calendar-transfer-from
   #:calendar-transfer-to
   #:calendar-transfer-name
   #:calendar-transfer-authority
   #:calendar-working-day
   #:make-calendar-working-day
   #:calendar-working-day-date
   #:calendar-transfers
   #:calendar-working-days

   ;; data-calendar
   #:data-calendar
   #:calendar-holidays-table
   #:make-data-calendar
   #:add-data-calendar-holiday
   #:load-data-calendar
   #:write-data-calendar-file

   ;; composite-calendar
   #:composite-calendar
   #:make-composite-calendar
   #:composite-calendar-calendars
   #:composite-calendar-mode

   ;; versioned-calendar
   #:versioned-calendar
   #:make-versioned-calendar
   #:versioned-calendar-snapshots
   #:calendar-snapshot
   #:make-calendar-snapshot
   #:snapshot-version-tag
   #:snapshot-recorded-at
   #:snapshot-calendar
   #:add-calendar-snapshot

   ;; trading / business hours
   #:trading-session
   #:trading-session-p
   #:make-trading-session
   #:trading-session-name
   #:trading-session-zone
   #:trading-session-open
   #:trading-session-close
   #:trading-session-overnight-p
   #:trading-session-labeled-by
   #:trading-session-calendar
   #:session-bounds
   #:session-open-p
   #:trading-day
   #:next-session-open
   #:session-duration

   ;; named registry
   #:register-calendar
   #:find-calendar
   #:unregister-calendar
   #:list-registered-calendars

   ;; starter calendars
   #:weekend-only-calendar
   #:target-calendar
   #:us-federal-holidays-calendar
   #:uk-bank-holidays-calendar
   #:ussr-holidays-calendar
   #:russian-holidays-calendar
   #:make-russian-holidays-calendar
   #:load-ru-transfer-decrees
   #:ru-decree-for-year
   #:japan-holidays-calendar
   #:china-holidays-calendar
   #:load-cn-transfer-notices
   #:cn-notice-for-year
   #:india-holidays-calendar
   #:germany-holidays-calendar
   #:france-holidays-calendar
   #:italy-holidays-calendar
   #:spain-holidays-calendar
   #:netherlands-holidays-calendar
   #:belgium-holidays-calendar
   #:austria-holidays-calendar
   #:poland-holidays-calendar
   #:sweden-holidays-calendar
   #:indonesia-holidays-calendar
   #:bangladesh-holidays-calendar
   #:philippines-holidays-calendar
   #:vietnam-holidays-calendar
   #:thailand-holidays-calendar
   #:south-korea-holidays-calendar
   #:myanmar-holidays-calendar
   #:malaysia-holidays-calendar
   #:taiwan-holidays-calendar
   #:brazil-holidays-calendar
   #:mexico-holidays-calendar
   #:colombia-holidays-calendar
   #:argentina-holidays-calendar
   #:canada-holidays-calendar
   #:peru-holidays-calendar
   #:australia-holidays-calendar
   #:nigeria-holidays-calendar
   #:ethiopia-holidays-calendar
   #:dr-congo-holidays-calendar
   #:tanzania-holidays-calendar
   #:south-africa-holidays-calendar
   #:kenya-holidays-calendar
   #:uganda-holidays-calendar
   #:ghana-holidays-calendar
   #:pakistan-holidays-calendar
   #:egypt-holidays-calendar
   #:turkey-holidays-calendar
   #:iran-holidays-calendar
   #:saudi-arabia-holidays-calendar
   #:algeria-holidays-calendar
   #:morocco-holidays-calendar
   #:ukraine-holidays-calendar
   #:population-order
   #:formation-years
   #:country-formation-year
   #:civil-research-from-year
   #:civil-from-year
   #:normative-coverage-by-population
   #:next-normative-gaps
   #:normative-calendar-codes

   ;; country / territory corpus (date-holidays)
   #:country-holiday-calendar
   #:country-calendar
   #:load-country-calendar
   #:list-country-calendars
   #:country-calendar-codes
   #:country-calendar-code
   #:country-calendar-source
   #:country-calendar-license
   #:country-calendar-note
   #:country-calendar-year-range
   #:clear-country-calendar-cache))

(in-package #:cl-stack-calendars)
