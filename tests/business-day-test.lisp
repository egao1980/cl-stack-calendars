(in-package #:cl-stack-calendars/tests)

(deftest us-federal-memorial-day
  (let ((cal (us-federal-holidays-calendar)))
    (ok (holiday-p cal (make-date 2024 5 27))) ; Memorial Day 2024
    (ng (business-day-p cal (make-date 2024 5 27)))
    (ok (business-day-p cal (make-date 2024 5 28)))))

(deftest us-federal-holiday-start-dates
  "Civil :FROM/:TO windows — not the same axis as versioned calendar-as-of."
  (let ((cal (us-federal-holidays-calendar)))
    ;; Juneteenth: first federal observance 2021-06-18 (Sat 19 → Fri observed)
    (ok (holiday-p cal (make-date 2021 6 18)))
    (ng (holiday-p cal (make-date 2020 6 19)))
    ;; MLK Day first observed 1986
    (ok (holiday-p cal (make-date 1986 1 20)))
    (ng (holiday-p cal (make-date 1985 1 21)))
    ;; Veterans Day: Monday form 1971–1977, then back to Nov 11
    (ok (holiday-p cal (make-date 1975 10 27))) ; 4th Monday Oct 1975
    (ng (holiday-p cal (make-date 1975 11 11)))
    (ok (holiday-p cal (make-date 1980 11 11))) ; Tue — post-1978 Nov 11 form
    ;; Memorial Day: May 30 before Uniform Monday Holiday Act (1969-05-30 = Fri)
    (ok (holiday-p cal (make-date 1969 5 30)))
    (ng (holiday-p cal (make-date 1971 5 30))) ; 1971 → last Monday (May 31)
    (ok (holiday-p cal (make-date 1971 5 31)))))

(deftest rule-from-date-bound
  (let ((cal (make-instance 'rule-calendar
               :name "x"
               :rules (list (make-fixed-holiday-rule
                             :name "X"
                             :month 6 :day 19
                             :from (make-date 2021 6 19))))))
    (ng (holiday-p cal (make-date 2021 6 18)))
    (ok (holiday-p cal (make-date 2021 6 19)))
    (ok (holiday-p cal (make-date 2022 6 19)))))

(deftest target-good-friday
  (let ((cal (target-calendar)))
    (ok (holiday-p cal (make-date 2024 3 29)))
    (ok (business-day-p cal (make-date 2024 3 28)))))

(deftest adjust-modified-following
  (let ((cal (weekend-only-calendar)))
    ;; Sat 2024-01-06 → Mon 2024-01-08 under :following
    (ok (= (adjust-date cal (make-date 2024 1 6) :following)
           (make-date 2024 1 8)))
    (ok (= (adjust-date cal (make-date 2024 1 6) :preceding)
           (make-date 2024 1 5)))))

(deftest versioned-as-of
  (let* ((v (make-versioned-calendar :name "X"))
         (old (make-data-calendar :name "old"))
         (new (make-data-calendar :name "new"))
         (t0 (make-instant 1000))
         (t1 (make-instant 2000)))
    (add-data-calendar-holiday old (make-date 2024 1 1) "Old Year")
    (add-calendar-snapshot v old :version-tag "2024.1" :recorded-at t0)
    (add-calendar-snapshot v new :version-tag "2025.1" :recorded-at t1)
    (ok (holiday-p (calendar-as-of v :version "2024.1") (make-date 2024 1 1)))
    ;; as-of 1500 → snapshot recorded at t0=1000 (old), which still has the holiday
    (ok (holiday-p (calendar-as-of v :as-of (make-instant 1500)) (make-date 2024 1 1)))
    (ok (holiday-p (calendar-as-of v :as-of t0) (make-date 2024 1 1)))
    (ng (holiday-p (calendar-as-of v :version "2025.1") (make-date 2024 1 1)))))
