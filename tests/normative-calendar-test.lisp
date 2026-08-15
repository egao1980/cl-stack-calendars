(in-package #:cl-stack-calendars/tests)

(deftest japan-equinox-and-furikae
  "春分の日 at Tokyo; 振替 when Sunday."
  (let ((cal (japan-holidays-calendar)))
    (ok (holiday-p cal (make-date 2026 3 20)))
    (ok (holiday-p cal (make-date 2026 5 3)))
    (ok (holiday-p cal (make-date 2026 5 4)))
    (ok (holiday-p cal (make-date 2026 5 5)))
    ;; 2023-01-01 Sunday → 振替 1/2
    (ok (holiday-p cal (make-date 2023 1 1)))
    (ok (holiday-p cal (make-date 2023 1 2)))))

(deftest japan-sandwich-keiro-equinox-2015
  "国民の休日 between 敬老の日 and 秋分の日 (Art. 3(3))."
  (let ((cal (japan-holidays-calendar)))
    (ok (holiday-p cal (make-date 2015 9 21)))
    (ok (holiday-p cal (make-date 2015 9 22)))
    (ok (holiday-p cal (make-date 2015 9 23)))))

(deftest china-statutory-and-tiaoxiu-2026
  (let ((cal (china-holidays-calendar :year 2026)))
    (ok (holiday-p cal (make-date 2026 1 1)))
    (ok (holiday-p cal (make-date 2026 2 16))) ; 除夕
    (ok (holiday-p cal (make-date 2026 2 17))) ; 初一
    (ok (holiday-p cal (make-date 2026 2 15))) ; 调休
    (ok (holiday-p cal (make-date 2026 10 1)))
    (ok (holiday-p cal (make-date 2026 10 7)))
    (ok (business-day-p cal (make-date 2026 2 14))) ; 上班
    (ng (weekend-day-p cal (make-date 2026 2 14)))))

(deftest india-national-three
  (let ((cal (india-holidays-calendar)))
    (ok (holiday-p cal (make-date 2026 1 26)))
    (ok (holiday-p cal (make-date 2026 8 15)))
    (ok (holiday-p cal (make-date 2026 10 2)))
    (ok (holiday-p cal (make-date 2026 12 25)))))

(deftest germany-federal-common
  (let ((cal (germany-holidays-calendar)))
    (ok (holiday-p cal (make-date 2026 10 3)))
    (ok (holiday-p cal (make-date 2026 5 1)))
    (ok (holiday-p cal (make-date 2026 4 3)))   ; Karfreitag
    (ok (holiday-p cal (make-date 2026 4 6))))) ; Ostermontag

(deftest france-bastille
  (let ((cal (france-holidays-calendar)))
    (ok (holiday-p cal (make-date 2026 7 14)))
    (ok (holiday-p cal (make-date 2026 5 8)))))

(deftest sweden-midsummer-and-all-saints
  (let ((cal (sweden-holidays-calendar)))
    (ok (holiday-p cal (make-date 2026 6 20)))  ; Midsommardagen
    (ok (holiday-p cal (make-date 2026 10 31))))) ; Alla helgons (Sat)
