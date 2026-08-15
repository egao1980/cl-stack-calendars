(defsystem "cl-stack-calendars"
  :version "0.1.0"
  :description "Holiday and trading calendars for cl-stack (business days, sessions, versioned as-of)"
  :author "egao1980"
  :license "MIT"
  :depends-on ("datetime-protocol" "datetime-protocol/calendars")
  :serial t
  :pathname "src"
  :components ((:file "package")
               (:file "conditions")
               (:file "protocol")
               (:file "rules")
               (:file "rule-calendar")
               (:file "data-calendar")
               (:file "composite-calendar")
               (:file "versioned-calendar")
               (:file "trading-session")
               (:file "registry")
               (:file "starter-calendars"))
  :in-order-to ((test-op (test-op "cl-stack-calendars/tests"))))

(defsystem "cl-stack-calendars/tests"
  :depends-on ("cl-stack-calendars" "cl-stack-tzdata" "rove")
  :pathname "tests"
  :serial t
  :components ((:file "package")
               (:file "business-day-test")
               (:file "trading-session-test"))
  :perform (test-op (o c)
             (unless (symbol-call :rove :run c)
               (error "tests failed for ~A" (component-name c)))))
