(in-package #:cl-stack-calendars/tests)

;;;; Composite and versioned calendars keep constituents' working days (#29).

(defun ru-2024 () (russian-holidays-calendar :year 2024))

(deftest versioned-delegates-working-days
  "2024-04-27 (Saturday) is a working day by decree; a snapshot keeps it."
  (let ((ru (ru-2024))
        (v (make-versioned-calendar)))
    (add-calendar-snapshot v ru :version-tag "a")
    (ok (business-day-p ru (make-date 2024 4 27)))
    (ok (business-day-p v (make-date 2024 4 27)))
    (ng (weekend-day-p v (make-date 2024 4 27)))))

(deftest composite-union-working-day-needs-every-constituent
  (let* ((ru (ru-2024))
         (ru-only (make-composite-calendar (list ru)))
         (with-weekend (make-composite-calendar (list ru (weekend-only-calendar)))))
    (ok (business-day-p ru-only (make-date 2024 4 27))
        "one constituent working on Saturday: the union works")
    (ng (business-day-p with-weekend (make-date 2024 4 27))
        "a Sat/Sun constituent keeps Saturday a weekend in a union")))

(deftest composite-intersection-working-day-from-any-constituent
  (let ((joint (make-composite-calendar (list (ru-2024) (weekend-only-calendar))
                                        :mode :intersection)))
    (ok (business-day-p joint (make-date 2024 4 27)))
    (ng (business-day-p joint (make-date 2024 4 28)))))

(deftest composite-union-weekends-from-every-constituent
  "A Fri/Sat constituent makes Friday a weekend in a union with Sat/Sun."
  (let* ((fri-sat (make-data-calendar :name "FS" :weekend-days '(5 6)))
         (union (make-composite-calendar (list (us-federal-holidays-calendar) fri-sat)))
         (joint (make-composite-calendar (list (us-federal-holidays-calendar) fri-sat)
                                         :mode :intersection)))
    (ok (weekend-day-p union (make-date 2024 4 19)))
    (ng (business-day-p union (make-date 2024 4 19)))
    (ok (equal '(5 6 7) (calendar-weekend-days union)))
    (ok (equal '(6) (calendar-weekend-days joint)))
    (ng (weekend-day-p joint (make-date 2024 4 19)))
    (ng (weekend-day-p joint (make-date 2024 4 21)))
    (ok (weekend-day-p joint (make-date 2024 4 20)))))

(deftest composite-empty-signals
  (ok (signals (make-composite-calendar nil :mode :intersection) 'calendar-error))
  (ok (signals (make-composite-calendar nil) 'calendar-error)))

(deftest composite-union-names-every-holiday-constituent
  (let* ((a (make-data-calendar :holidays (list (cons (make-date 2024 3 5) "A"))))
         (b (make-data-calendar :holidays (list (cons (make-date 2024 3 5) "B"))))
         (union (make-composite-calendar (list a b))))
    (ok (equal "A; B" (nth-value 1 (holiday-p union (make-date 2024 3 5)))))))
