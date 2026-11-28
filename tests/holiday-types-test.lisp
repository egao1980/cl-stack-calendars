(in-package #:cl-stack-calendars/tests)

;;;; Corpus holiday types are exposed and filterable; a date with several
;;;; corpus rows keeps every name, and its type resolves public over bank (#35).

(deftest corpus-duplicate-date-keeps-both-names
  "GT 2000-06-30 is both Día de las Fuerzas Armadas (:public) and Día del
Empleado Bancario (:bank)."
  (let* ((gt (country-calendar "GT"))
         (d (make-date 2000 6 30)))
    (multiple-value-bind (holidayp name) (holiday-p gt d)
      (ok holidayp)
      (ok (equal "Día de las Fuerzas Armadas; Día del Empleado Bancario" name)))
    (let ((info (holiday-info gt d)))
      (ok (equal '("Día de las Fuerzas Armadas" "Día del Empleado Bancario")
                 (mapcar #'holiday-observance-name info)))
      (ok (equal '(:public :bank) (mapcar #'holiday-observance-type info))))))

(deftest corpus-public-not-demoted-by-bank
  "The later :bank row no longer demotes a :public date (34 corpus cases)."
  (flet ((type-on (code y m d)
           (holiday-observance-type
            (first (holidays-between (country-calendar code)
                                     (make-date y m d) (make-date y m d))))))
    (ok (eq :public (type-on "GT" 2000 6 30)))
    (ok (eq :public (type-on "JP" 2006 1 2)))
    (ok (eq :public (type-on "AS" 2004 12 24)))
    (ok (eq :bank (type-on "GT" 2001 7 2)))))

(deftest corpus-types-filter
  (let ((public (country-calendar "GT" :types '(:public)))
        (bank (country-calendar "GT" :types '(:bank)))
        (bank-only (make-date 2001 7 2))   ; Monday, Día del Empleado Bancario
        (shared (make-date 2000 6 30)))
    (ng (holiday-p public bank-only))
    (ok (business-day-p public bank-only))
    (ok (holiday-p bank bank-only))
    (ng (business-day-p bank bank-only))
    (ok (equal "Día de las Fuerzas Armadas" (nth-value 1 (holiday-p public shared))))
    (ok (equal "Día del Empleado Bancario" (nth-value 1 (holiday-p bank shared))))
    (ok (equal '(:bank) (mapcar #'holiday-observance-type (holiday-info bank shared))))
    (ok (every (lambda (o) (eq :public (holiday-observance-type o)))
               (holidays-between public (make-date 2001 1 1) (make-date 2001 12 31))))
    ;; The default keeps every corpus type.
    (ok (holiday-p (country-calendar "GT") bank-only))
    (ok (equal '(:public :bank) (calendar-holiday-types (country-calendar "GT"))))
    (ok (equal '(:bank) (calendar-holiday-types bank)))))

(deftest corpus-types-cache-key
  (ok (eq (country-calendar "GT" :types '(:bank))
          (country-calendar "GT" :types '(:bank))))
  (ok (eq (country-calendar "GT" :types '(:public :bank))
          (country-calendar "GT" :types '(:bank :public))))
  (ng (eq (country-calendar "GT" :types '(:bank))
          (country-calendar "GT"))))

(deftest corpus-types-unknown-signals
  (ok (signals (country-calendar "GT" :types '(:pubic)) 'type-error))
  (ok (signals (country-calendar "GT" :types :public) 'type-error)))

(deftest normative-types-add-corpus-bank-rows
  "DE defers to its starter; :BANK adds the corpus bank rows (Heiliger Abend,
Silvester) on top, labelled :BANK."
  (let ((default (country-calendar "DE"))
        (public (country-calendar "DE" :types '(:public)))
        (both (country-calendar "DE" :types '(:public :bank)))
        (bank (country-calendar "DE" :types '(:bank)))
        (eve (make-date 2024 12 24))
        (xmas (make-date 2024 12 25)))
    (ng (holiday-p default eve))
    (ng (holiday-p public eve))
    (ok (holiday-p public xmas))
    (ok (holiday-p both eve))
    (ng (business-day-p both eve))
    (ok (equal "Heiliger Abend" (nth-value 1 (holiday-p both eve))))
    (ok (equal '(:bank) (mapcar #'holiday-observance-type (holiday-info both eve))))
    (ok (eq :public (holiday-observance-type (first (holiday-info both xmas)))))
    (ok (holiday-p bank eve))
    (ng (holiday-p bank xmas))
    (ok (business-day-p bank xmas))
    (ok (equal '(:bank)
               (remove-duplicates
                (mapcar #'holiday-observance-type
                        (holidays-between bank (make-date 2024 1 1) (make-date 2024 12 31))))))
    (ok (eq :normative (calendar-provenance both)))))

(deftest holiday-info-generic-calendar
  "HOLIDAY-INFO works on any calendar: one observance with the HOLIDAY-P name."
  (let ((us (find-calendar "USFED")))
    (let ((info (holiday-info us (make-date 2024 7 4))))
      (ok (= 1 (length info)))
      (ok (holiday-observance-name (first info))))
    (ok (null (holiday-info us (make-date 2024 7 5))))))
