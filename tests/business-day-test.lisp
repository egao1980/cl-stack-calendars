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

(deftest uk-christmas-boxing-exclusive-next
  "Sat+Sun Christmas pair → Mon Christmas + Tue Boxing (not both Monday)."
  (let ((cal (uk-bank-holidays-calendar)))
    ;; 2021-12-25 Saturday, 2021-12-26 Sunday
    (ok (holiday-p cal (make-date 2021 12 27))) ; Mon — Christmas
    (ok (holiday-p cal (make-date 2021 12 28))) ; Tue — Boxing
    (ng (business-day-p cal (make-date 2021 12 27)))
    (ng (business-day-p cal (make-date 2021 12 28)))))

(deftest substitute-next-keeps-weekend-and-weekday
  (let ((cal (make-instance 'rule-calendar
               :name "mech"
               :rules (list (make-fixed-holiday-rule
                             :name "X"
                             :month 1 :day 1
                             :observed :substitute-next
                             :authority "test mechanical primitive")))))
    ;; 2023-01-01 Sunday → substitute Monday 2023-01-02
    (ok (holiday-p cal (make-date 2023 1 1)))
    (ok (holiday-p cal (make-date 2023 1 2)))
    (ng (holiday-p cal (make-date 2023 1 3)))))

(deftest jp-furikae-sunday-only
  "祝日法第3条第2項: Sunday transfers; Saturday does not."
  (let ((cal (make-instance 'rule-calendar
               :name "jp"
               :rules (list (make-fixed-holiday-rule
                             :name "元日"
                             :month 1 :day 1
                             :observed :jp-furikae
                             :authority "国民の祝日に関する法律第3条第2項")))))
    ;; 2023-01-01 Sunday → 振替 2023-01-02
    (ok (holiday-p cal (make-date 2023 1 1)))
    (ok (holiday-p cal (make-date 2023 1 2)))
    ;; 2022-01-01 Saturday → no 振替 Monday
    (ok (holiday-p cal (make-date 2022 1 1)))
    (ng (holiday-p cal (make-date 2022 1 3)))))

(deftest jp-sandwich-kokumin-no-kyujitsu
  "祝日法第3条第3項: weekday between two holidays becomes a holiday."
  (let ((cal (make-instance 'rule-calendar
               :name "jp-sandwich"
               :sandwich-holidays-p t
               :sandwich-authority "国民の祝日に関する法律第3条第3項"
               :rules (list
                       (make-fixed-holiday-rule :name "A" :month 9 :day 21
                                                :authority "test")
                       (make-fixed-holiday-rule :name "B" :month 9 :day 23
                                                :authority "test")))))
    ;; 2020-09-21 Mon, 22 Tue sandwich, 23 Wed
    (ok (holiday-p cal (make-date 2020 9 21)))
    (ok (holiday-p cal (make-date 2020 9 22)))
    (ok (holiday-p cal (make-date 2020 9 23)))))

(deftest bridge-adjacent-requires-explicit-use
  "Puente-style bridge is opt-in with authority — not a silent default."
  (let ((cal (make-instance 'rule-calendar
               :name "puente"
               :rules (list (make-fixed-holiday-rule
                             :name "National Day"
                             :month 5 :day 2
                             :bridge :adjacent
                             :authority "test: collective agreement bridge")))))
    (ok (holiday-p cal (make-date 2023 5 2)))
    (ok (holiday-p cal (make-date 2023 5 1)))
    (ng (holiday-p cal (make-date 2023 5 3)))))

(deftest starter-rules-carry-authority
  (ok (holiday-rule-authority
       (first (calendar-rules (us-federal-holidays-calendar)))))
  (ok (holiday-rule-authority
       (first (calendar-rules (uk-bank-holidays-calendar)))))
  (ok (holiday-rule-authority
       (first (calendar-rules (target-calendar))))))

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
