(defpackage #:cl-stack-calendars/tests
  (:use #:cl #:rove #:cl-stack-calendars #:datetime-protocol)
  (:local-nicknames (#:sp #:cl-stack-pathlib))
  (:shadowing-import-from #:datetime-protocol
   #:+ #:- #:< #:<= #:> #:>= #:= #:/= #:min #:max))
