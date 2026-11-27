(in-package #:cl-stack-calendars/tests)

;;;; Observance substitutes do not depend on rule order (#27).

(define-calendar probe-order-ab ()
  (:fixed "A" 5 1 :observed :ru-tk-112-transfer :authority "x")
  (:fixed "B" 5 2 :authority "x"))

(define-calendar probe-order-ba ()
  (:fixed "B" 5 2 :authority "x")
  (:fixed "A" 5 1 :observed :ru-tk-112-transfer :authority "x"))

(define-calendar probe-order-nearest ()
  (:fixed "Eve" 12 24 :authority "x")
  (:fixed "Xmas" 12 25 :observed :us-federal-in-lieu :authority "x"))

(define-calendar probe-order-new-year ()
  (:fixed "NYE" 12 31 :observed :uk-proclamation-substitute :authority "x")
  (:fixed "NY" 1 1 :observed :uk-proclamation-substitute :authority "x"))

(define-calendar probe-order-coincide ()
  (:fixed "Zeta" 4 25 :authority "x")
  (:easter "Alpha" 1 :authority "x"))

(defun observance-days (calendar start end)
  (mapcar (lambda (o)
            (list (suite-date-iso (holiday-observance-date o))
                  (holiday-observance-name o)))
          (holidays-between calendar start end)))

(deftest observance-substitute-skips-later-listed-holiday
  (let ((expected '(("2022-05-01" "A") ("2022-05-02" "B") ("2022-05-03" "A"))))
    (ok (equal expected (observance-days (make-instance 'probe-order-ab)
                                         (make-date 2022 4 30) (make-date 2022 5 6))))
    (ok (equal expected (observance-days (make-instance 'probe-order-ba)
                                         (make-date 2022 4 30) (make-date 2022 5 6))))))

(deftest observance-ru-1994-may-3
  "1 May 1994 (Sunday) moves past the 2 May holiday to Tuesday 3 May."
  (let ((ru (find-calendar "RU")))
    (ok (holiday-p ru (make-date 1994 5 2)))
    (ok (holiday-p ru (make-date 1994 5 3)))
    (ng (business-day-p ru (make-date 1994 5 3)))
    (ok (business-day-p ru (make-date 1994 5 4)))))

(deftest observance-nearest-weekday-skips-claimed
  "Xmas on Saturday cannot take Friday 24 (already a holiday): it is not lost."
  (ok (equal '(("2021-12-23" "Xmas") ("2021-12-24" "Eve"))
             (observance-days (make-instance 'probe-order-nearest)
                              (make-date 2021 12 20) (make-date 2021 12 31)))))

(deftest observance-claims-cross-year-boundary
  "Sat 31 Dec 2022 and Sun 1 Jan 2023 substitutes are exclusive: Mon 2, Tue 3."
  (ok (equal '(("2023-01-02" "NYE") ("2023-01-03" "NY"))
             (observance-days (make-instance 'probe-order-new-year)
                              (make-date 2022 12 28) (make-date 2023 1 6)))))

(deftest observance-coinciding-holidays-keep-both-names
  "Easter Monday 2011 is 25 April: the day carries both names."
  (multiple-value-bind (hp name)
      (holiday-p (make-instance 'probe-order-coincide) (make-date 2011 4 25))
    (ok hp)
    (ok (equal name "Alpha; Zeta"))))

(deftest observance-uk-christmas-substitute-names
  "gov.uk bank-holidays.json (frozen in data/tests/external-gold.sexp): in
2022 Christmas falls on Sunday, so Mon 26 is Boxing Day and Tue 27 is the
Christmas Day substitute."
  (let ((gb (uk-bank-holidays-calendar :year 2022)))
    (ok (equal "Boxing Day" (nth-value 1 (holiday-p gb (make-date 2022 12 26)))))
    (ok (equal "Christmas Day" (nth-value 1 (holiday-p gb (make-date 2022 12 27)))))))

;;; --- property: every registered rule calendar, every rule order ----------

(defun copy-rule-calendar (calendar rules)
  "A shallow copy of CALENDAR whose rule list is RULES."
  (let ((copy (allocate-instance (class-of calendar))))
    (dolist (slot (sb-mop:class-slots (class-of calendar)))
      (let ((name (sb-mop:slot-definition-name slot)))
        (when (slot-boundp calendar name)
          (setf (slot-value copy name) (slot-value calendar name)))))
    (setf (calendar-rules copy) rules)
    copy))

(defun shuffled (list seed)
  "LIST in a deterministic pseudo-random order (Fisher-Yates over an LCG)."
  (let ((v (coerce list 'vector))
        (s seed))
    (loop for i from (1- (length v)) downto 1
          do (setf s (mod (+ (* s 1103515245) 12345) 2147483648))
             (rotatef (aref v i) (aref v (mod s (1+ i)))))
    (coerce v 'list)))

(defun year-map-alist (calendar year)
  (let ((rows '()))
    (maphash (lambda (rd name) (push (cons rd name) rows))
             (cl-stack-calendars::%rule-calendar-year-map calendar year))
    (sort rows #'< :key #'car)))

(defun registered-rule-calendars ()
  (let ((seen '()))
    (dolist (name (sort (list-registered-calendars) #'string<) (nreverse seen))
      (let ((cal (find-calendar name)))
        (when (and (typep cal 'rule-calendar)
                   (rest (calendar-rules cal))
                   (not (member cal seen :test #'eq)))
          (push cal seen))))))

(deftest observance-independent-of-rule-order
  "For every registered rule calendar and every year 1990–2050, reversing or
shuffling the rule list gives the same year maps."
  (let ((calendars (registered-rule-calendars))
        (bad '()))
    (ok (> (length calendars) 100) "registered rule calendars found")
    (dolist (cal calendars)
      (let* ((rules (calendar-rules cal))
             (variants (list (copy-rule-calendar cal (reverse rules))
                             (copy-rule-calendar cal (shuffled rules 20261127)))))
        (loop for year from 1990 to 2050
              for base = (year-map-alist cal year)
              do (dolist (v variants)
                   (unless (equal base (year-map-alist v year))
                     (push (list (calendar-name cal) year) bad))))))
    (ok (null bad)
        (format nil "order-dependent year maps: ~s"
                (subseq bad 0 (min 20 (length bad)))))))
