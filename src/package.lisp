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
   #:uk-bank-holidays-calendar))

(in-package #:cl-stack-calendars)
