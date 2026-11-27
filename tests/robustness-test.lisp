(in-package #:cl-stack-calendars/tests)

;;;; Engine robustness (#36).

(deftest adjust-date-unknown-convention-signals
  (let ((cal (us-federal-holidays-calendar))
        (sat (make-date 2024 6 1)))
    (ok (signals (adjust-date cal sat :bogus) 'invalid-convention))
    (handler-case (adjust-date cal sat :bogus)
      (invalid-convention (c)
        (ok (eq :bogus (invalid-convention-convention c)))))
    (ok (= (make-date 2024 6 3)
           (handler-bind ((invalid-convention (lambda (c) (use-value :following c))))
             (adjust-date cal sat :bogus))))))

(deftest business-day-search-is-bounded
  (let ((never (make-data-calendar :weekend-days '(1 2 3 4 5 6 7)))
        (d (make-date 2024 6 3)))
    (ok (signals (next-business-day never d) 'no-business-day))
    (ok (signals (previous-business-day never d) 'no-business-day))
    (ok (signals (adjust-date never d :following) 'calendar-error))))

(define-calendar probe-all-weekend-substitute (:weekend-days '(1 2 3 4 5 6 7))
  (:fixed "H" 6 1 :observed :next-weekday :authority "x"))

(deftest weekend-shift-is-bounded
  (ok (signals (holiday-p (make-instance 'probe-all-weekend-substitute) (make-date 2024 6 1))
               'calendar-error))
  (ok (signals (cl-stack-calendars::shift-forward-past-weekend (make-date 2024 6 1) '(1 2 3 4 5 6 7))
               'calendar-error)))

(define-calendar probe-sandwich-from-date (:sandwich-holidays-p t :sandwich-authority "x"
                                           :sandwich-from (2000 6 1))
  (:fixed "A" 3 1 :authority "x")
  (:fixed "B" 3 3 :authority "x")
  (:fixed "C" 9 5 :authority "x")
  (:fixed "D" 9 7 :authority "x"))

(deftest sandwich-from-date-bound
  "A (Y M D) :SANDWICH-FROM applies from that day, not from the year start."
  (let ((cal (make-instance 'probe-sandwich-from-date)))
    (ng (holiday-p cal (make-date 2000 3 2)) "before the bound")
    (ok (holiday-p cal (make-date 2000 9 6)) "after the bound")
    (ng (holiday-p cal (make-date 1999 9 6)) "earlier year")
    (ok (holiday-p cal (make-date 2001 3 2)) "later year")))

(deftest transfer-lookups-return-fresh-lists
  "Mutating a lookup result must not touch the cached decree corpus."
  (let* ((first-call (cl-stack-calendars::ru-transfers-for-year 2024))
         (n (length first-call)))
    (ok (plusp n))
    (setf (cdr (last first-call)) (list :junk))
    (ok (= n (length (cl-stack-calendars::ru-transfers-for-year 2024))))
    (ok (notany #'keywordp (cl-stack-calendars::ru-transfers-for-year 2023)))))

(deftest dead-and-duplicate-definitions-removed
  (ng (fboundp 'cl-stack-calendars::rule-active-p))
  (ng (fboundp 'cl-stack-calendars::%cn-transfer-touches-year-p)))

(deftest lazy-caches-concurrent-first-use
  (clear-data-caches)
  (let* ((codes '("DE" "FR" "TW" "XK" "JP" "BR" "ZA" "AU"))
         (results (make-array (length codes) :initial-element nil))
         (threads (loop for code in codes
                        for i from 0
                        collect (let ((code code) (i i))
                                  (sb-thread:make-thread
                                   (lambda ()
                                     (setf (aref results i)
                                           (length (holidays-between (country-calendar code)
                                                                     (make-date 2024 1 1)
                                                                     (make-date 2024 12 31))))))))))
    (mapc #'sb-thread:join-thread threads)
    (ok (every (lambda (n) (and (integerp n) (plusp n))) results))
    (ok (every #'= results
               (mapcar (lambda (code)
                         (length (holidays-between (country-calendar code)
                                                   (make-date 2024 1 1) (make-date 2024 12 31))))
                       codes)))))

(deftest clear-data-caches-drops-rule-calendar-caches
  "Year maps built from one data root are not reused after the root changes."
  (let ((cal (make-instance 'probe-sandwich-from-date)))
    (holiday-p cal (make-date 2000 9 6))
    (let ((before (cl-stack-calendars::%rule-calendar-cache cal)))
      (ok (plusp (hash-table-count before)))
      (clear-data-caches)
      (holiday-p cal (make-date 2000 9 6))
      (ok (not (eq before (cl-stack-calendars::%rule-calendar-cache cal)))))))
