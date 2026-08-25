(defsystem "cl-stack-calendars"
  :version "0.4.0"
  :description "Holiday and trading calendars for cl-stack (business days, sessions, versioned as-of)"
  :author "egao1980"
  :license "MIT"
  :depends-on ("datetime-protocol" "datetime-protocol/calendars" "cl-stack-pathlib")
  :properties (:cl-repo (:ci (:sources (("rove" :ql)))))
  :serial t
  :pathname "src"
  :components ((:file "package")
               (:file "conditions")
               (:file "data")
               (:file "protocol")
               (:file "rules")
               (:file "transfer")
               (:file "gazette")
               (:file "rule-calendar")
               (:file "data-calendar")
               (:file "composite-calendar")
               (:file "versioned-calendar")
               (:file "trading-session")
               (:file "registry")
               (:file "starter-calendars")
               (:file "starter-russian")
               (:file "starter-japan")
               (:file "starter-china")
               (:file "starter-india")
               (:file "starter-eu")
               (:file "starter-asia")
               (:file "starter-americas")
               (:file "starter-africa")
               (:file "starter-mena")
               (:file "starter-small")
               (:file "coverage")
               (:file "country-calendar")
               (:file "corpus-inference")
               (:file "starter-territories")
               (:file "starter-subnational")
               (:file "exchange-hours"))
  :in-order-to ((test-op (test-op "cl-stack-calendars/tests"))))

(defsystem "cl-stack-calendars/tests"
  :depends-on ("cl-stack-calendars" "cl-stack-tzdata" "rove")
  :pathname "tests"
  :serial t
  :components ((:file "package")
               (:file "business-day-test")
               (:file "russian-calendar-test")
               (:file "normative-calendar-test")
               (:file "country-calendar-test")
               (:file "holiday-suite-test")
               (:file "external-gold-test")
               (:file "calc-gold-test")
               (:file "trading-session-test")
               (:file "exchange-hours-test")
               (:file "data-root-test"))
  :perform (test-op (o c)
             (unless (symbol-call :rove :run c)
               (error "tests failed for ~A" (component-name c)))))
