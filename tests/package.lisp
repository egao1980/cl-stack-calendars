(defpackage #:cl-stack-calendars/tests
  (:use #:cl #:rove #:cl-stack-calendars #:datetime-protocol)
  (:shadowing-import-from #:datetime-protocol
   #:+ #:- #:< #:<= #:> #:>= #:= #:/= #:min #:max))
