(in-package #:cl-stack-calendars/tests)

(deftest us-federal-memorial-day
  (let ((cal (us-federal-holidays-calendar)))
    (ok (holiday-p cal (make-date 2024 5 27))) ; Memorial Day 2024
    (ng (business-day-p cal (make-date 2024 5 27)))
    (ok (business-day-p cal (make-date 2024 5 28)))))

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
