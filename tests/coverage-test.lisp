(in-package #:cl-stack-calendars/tests)

;;;; Corpus coverage: out-of-range queries and stubs signal (#32).

(deftest corpus-out-of-range-signals
  (let ((de (country-calendar "DE")))
    (ok (equal '(2000 . 2040) (calendar-coverage de)))
    (ok (holiday-p de (make-date 2024 10 3)))
    (ok (signals (holiday-p de (make-date 1999 12 25)) 'calendar-out-of-range))
    (ok (signals (holiday-p de (make-date 2041 10 3)) 'calendar-out-of-range))
    (ok (signals (business-days-between de (make-date 2040 12 1) (make-date 2041 2 1))
                 'calendar-out-of-range))))

(deftest corpus-out-of-range-restarts
  (let ((de (country-calendar "DE")))
    (ok (null (handler-bind ((calendar-out-of-range #'continue))
                (holiday-p de (make-date 2041 10 3)))))
    (ok (eq :assumed (handler-bind ((calendar-out-of-range
                                      (lambda (c) (use-value :assumed c))))
                       (holiday-p de (make-date 2041 10 3)))))
    (handler-case (holiday-p de (make-date 1999 12 25))
      (calendar-out-of-range (c)
        (ok (eq de (calendar-out-of-range-calendar c)))
        (ok (equal '(2000 . 2040) (calendar-out-of-range-coverage c)))))))

(deftest corpus-non-strict-keeps-silent-nil
  (let ((de (country-calendar "DE" :strict nil)))
    (ng (holiday-p de (make-date 2041 10 3)))
    (ok (holiday-p de (make-date 2024 10 3)))))

(deftest corpus-stub-signals
  (let ((ps (country-calendar "PS")))
    (ok (country-calendar-stub-p ps))
    (ok (eq :none (calendar-coverage ps)))
    (ok (signals (holiday-p ps (make-date 2024 1 1)) 'calendar-out-of-range))
    (ng (country-calendar-stub-p (country-calendar "DE")))
    (ng (find-calendar "PS" :errorp nil) "no inferred starter for a stub")))

(deftest corpus-inferred-starter-stays-in-its-window
  (let ((ad (make-corpus-inferred-calendar "AD")))
    (ok (equal '(2000 . 2040) (calendar-coverage ad)))
    (ok (holidays-between ad (make-date 2024 1 1) (make-date 2024 12 31)))
    (ok (signals (holiday-p ad (make-date 1950 1 1)) 'calendar-out-of-range))
    (ok (signals (holiday-p ad (make-date 2090 1 1)) 'calendar-out-of-range))
    (ok (every (lambda (r) (search "Corpus-derived, not normative"
                                   (princ-to-string
                                    (cl-stack-calendars::holiday-rule-authority r))))
               (calendar-rules ad)))))

(deftest normative-starters-are-unbounded
  (ok (null (calendar-coverage (find-calendar "USFED"))))
  (ok (null (calendar-coverage (find-calendar "JP")))))
