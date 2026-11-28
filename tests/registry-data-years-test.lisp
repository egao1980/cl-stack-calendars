(in-package #:cl-stack-calendars/tests)

;;;; #14: a calendar found by code carries every year of its data file
;;;; (proclamations, decrees, gazettes), so FIND-CALENDAR is as complete as
;;;; the (CONSTRUCTOR :YEAR Y) calendar on every day of Y.

(defparameter *year-data-calendars*
  '(("GB" uk-bank-holidays-calendar)
    ("GBLO" uk-bank-holidays-calendar)
    ("RU" russian-holidays-calendar)
    ("CN" china-holidays-calendar)
    ("IN" india-holidays-calendar)
    ("ID" indonesia-holidays-calendar)
    ("PH" philippines-holidays-calendar)
    ("TH" thailand-holidays-calendar)
    ("TH-BANK" thailand-bank-holidays-calendar)
    ("KR" south-korea-holidays-calendar)
    ("MY" malaysia-holidays-calendar)
    ("NP" nepal-holidays-calendar)
    ("BD" bangladesh-holidays-calendar)
    ("PK" pakistan-holidays-calendar)
    ("KH" cambodia-holidays-calendar)
    ("SG" singapore-holidays-calendar)
    ("CO" colombia-holidays-calendar)
    ("CL" chile-holidays-calendar)
    ("AR" argentina-holidays-calendar)
    ("TW" taiwan-holidays-calendar)
    ("VN" vietnam-holidays-calendar)
    ("KW" kuwait-holidays-calendar)
    ("OM" oman-holidays-calendar)
    ("IQ" iraq-holidays-calendar)
    ("EG" egypt-holidays-calendar)
    ("DZ" algeria-holidays-calendar)
    ("MA" morocco-holidays-calendar)
    ("IR" iran-holidays-calendar)
    ("KZ" kazakhstan-holidays-calendar)
    ("SN" senegal-holidays-calendar)
    ("ZA" south-africa-holidays-calendar)
    ("KE" kenya-holidays-calendar)
    ("NG" nigeria-holidays-calendar)
    ("ZW" zimbabwe-holidays-calendar)
    ("ZM" zambia-holidays-calendar)
    ("MW" malawi-holidays-calendar)
    ("MG" madagascar-holidays-calendar)
    ("IT" italy-holidays-calendar)
    ("NL" netherlands-holidays-calendar)
    ("DE" germany-holidays-calendar)
    ("IE" ireland-holidays-calendar)
    ("PT" portugal-holidays-calendar)
    ("TARGET" target-calendar)
    ("HR" croatia-holidays-calendar)
    ("SI" slovenia-holidays-calendar)
    ("SK" slovakia-holidays-calendar)
    ("CZ" czechia-holidays-calendar)
    ("HU" hungary-holidays-calendar)
    ("PL" poland-holidays-calendar)
    ("RO" romania-holidays-calendar)
    ("BG" bulgaria-holidays-calendar)
    ("GR" greece-holidays-calendar)
    ("CY" cyprus-holidays-calendar)
    ("EE" estonia-holidays-calendar)
    ("LV" latvia-holidays-calendar)
    ("LT" lithuania-holidays-calendar)
    ("SE" sweden-holidays-calendar)
    ("FI" finland-holidays-calendar))
  "Registered code → constructor that takes :YEAR. Every registered calendar
whose constructor takes :YEAR is listed here or in *YEAR-DATA-EXCEPTIONS*.")

(defparameter *year-data-exceptions*
  '((sri-lanka-holidays-calendar
     "data/lk/poya-days.sexp holds new-moon dates, not Poya days; the registered LK leaves it out"))
  "Constructors whose registered calendar deliberately leaves the data file
out, each with the reason.")

(defun %year-disagreements (registered year-calendar year)
  "Dates of YEAR on which REGISTERED and YEAR-CALENDAR differ in HOLIDAY-P or
BUSINESS-DAY-P, as (Y M D) lists."
  (loop for rd from (date-rd (make-date year 1 1)) to (date-rd (make-date year 12 31))
        for date = (date-from-rd rd)
        unless (and (eq (and (holiday-p registered date) t)
                        (and (holiday-p year-calendar date) t))
                    (eq (and (business-day-p registered date) t)
                        (and (business-day-p year-calendar date) t)))
          collect (list (date-year date) (date-month date) (date-day date))))

(deftest-parametrize registered-calendar-carries-every-data-year
    ((code constructor) :rows *year-data-calendars*)
  (let ((registered (find-calendar code))
        (bad '()))
    (loop for year from 1990 to 2040
          for diff = (%year-disagreements registered
                                          (funcall constructor :year year) year)
          when diff do (push (cons year diff) bad))
    (ok (null bad)
        (format nil "find-calendar ~s vs (~(~a~) :year Y): ~s"
                code constructor (subseq bad 0 (min 3 (length bad)))))))

(deftest every-year-constructor-is-listed
  "A registered calendar whose constructor (the function named like its
class) takes :YEAR is in *YEAR-DATA-CALENDARS* or *YEAR-DATA-EXCEPTIONS*, so
a new one cannot ship without the sweep."
  #+sbcl (require :sb-introspect)
  (let ((listed (append (mapcar #'second *year-data-calendars*)
                        (mapcar #'first *year-data-exceptions*))))
    (dolist (name (list-registered-calendars))
      (let ((ctor (type-of (find-calendar name))))
        (when (and (fboundp ctor)
                   #+sbcl
                   (member "YEAR"
                           (uiop:symbol-call :sb-introspect :function-lambda-list ctor)
                           :test #'string=
                           :key (lambda (x) (if (symbolp x) (symbol-name x) "")))
                   #-sbcl nil)
          (ok (member ctor listed)
              (format nil "~a (~(~a~)) takes :year but is not swept" name ctor)))))))

(deftest lk-registered-leaves-out-new-moon-poya-file
  "The registered LK applies no poya-days.sexp day: 2024-01-03 and
2024-05-02 (new moons the file calls Poya Day and Day after Vesak Poya) are
not holidays. The real Poya days (2024-01-25 Duruthu, 2024-05-23 Vesak) are
not in the file either (#61)."
  (dolist (day '((2024 1 3) (2024 5 2)))
    (let ((date (apply #'make-date day)))
      (ng (holiday-p (find-calendar "LK") date))
      (ok (holiday-p (sri-lanka-holidays-calendar :year 2024) date)))))

(deftest-parametrize data-file-days-without-legal-basis-are-gone
    ((code y m d) :rows
     '(;; CO: Ley 51/1983 fixes 20 Jul; no decree "puentes" exist.
       ("CO" 2024 7 22) ("CO" 2024 12 16) ("CO" 2025 7 21) ("CO" 2025 12 15)
       ("CO" 2026 7 21)
       ;; CL: no Ley 20.215 / 20.983 case applies on 17 Sep 2025 or 2026.
       ("CL" 2025 9 17) ("CL" 2026 9 17)))
  (ng (holiday-p (find-calendar code) (make-date y m d))
      (format nil "~a ~d-~2,'0d-~2,'0d" code y m d)))

(deftest cn-2020-spring-festival-extension
  "国办发明电〔2020〕1号: the 2020 Spring Festival holiday ran to 2 February,
so Saturday 1 February was no longer a working day."
  (dolist (cal (list (find-calendar "CN") (china-holidays-calendar :year 2020)))
    (ok (holiday-p cal (make-date 2020 1 31)))
    (ng (business-day-p cal (make-date 2020 2 1)))
    (ng (business-day-p cal (make-date 2020 2 2)))
    (ok (business-day-p cal (make-date 2020 2 3)))))

(deftest-parametrize gb-registered-proclamations
    ((y m d holiday) :rows
     ;; London Gazette proclamations (BFDA 1971 s.1(2)-(3)) and gov.uk:
     '((1995 5 1 nil) (1995 5 8 t)                 ; Gazette 53715 p.9221
       (2002 5 27 nil) (2002 6 3 t) (2002 6 4 t)   ; Gazette 56043 p.13411
       (2011 4 29 t)                               ; Gazette 59637 (L-59637-1268656)
       (2012 5 28 nil) (2012 6 4 t) (2012 6 5 t)   ; Gazette 59806 (L-59806-1377705)
       (2020 5 4 nil) (2020 5 8 t)                 ; Gazette notice 3326938
       (2022 5 30 nil) (2022 6 2 t) (2022 6 3 t)   ; Gazette notice 3673202
       (2022 9 19 t)                               ; Gazette notice 4158896
       (2023 5 8 t)))                              ; Gazette notice 4203714
  (dolist (code '("GB" "GBLO"))
    (let ((cal (find-calendar code)))
      (ok (eq holiday (and (holiday-p cal (make-date y m d)) t))
          (format nil "~a ~d-~2,'0d-~2,'0d holiday ~a" code y m d holiday))
      (ok (eq holiday (and (holiday-p (uk-bank-holidays-calendar) (make-date y m d)) t))
          (format nil "(uk-bank-holidays-calendar) ~d-~2,'0d-~2,'0d" y m d)))))

(deftest ru-registered-carries-decree-transfers
  "Постановление Правительства РФ от 10.08.2023 № 1314 (2024)."
  (let ((ru (find-calendar "RU")))
    (ok (business-day-p ru (make-date 2024 4 27)))   ; working Saturday
    (ok (holiday-p ru (make-date 2024 4 29)))
    (ok (holiday-p ru (make-date 2024 4 30)))
    (ok (holiday-p ru (make-date 2024 5 10)))
    (ok (business-day-p ru (make-date 2024 12 28)))
    (ok (holiday-p ru (make-date 2024 12 30)))
    (ok (holiday-p ru (make-date 2024 12 31)))
    (ok (business-day-p (russian-holidays-calendar) (make-date 2024 4 27)))))

(deftest rule-name-wins-over-adjacent-year-transfer
  "A decree day that is also a rule holiday keeps the rule's name. HOLIDAY-P
reads the previous year's map first, and that map used to hold the 2026
transfers too, so CN 2026-01-01 was named 调休 instead of 元旦. Since #26 the
notice's other days carry their festival too: 2026-01-02 is 元旦（调休）."
  (dolist (cal (list (china-holidays-calendar :year 2026) (find-calendar "CN")))
    (multiple-value-bind (holiday name) (holiday-p cal (make-date 2026 1 1))
      (ok holiday)
      (ok (equal name "元旦") (format nil "2026-01-01 name ~s" name)))
    (multiple-value-bind (holiday name) (holiday-p cal (make-date 2026 1 2))
      (ok holiday)
      (ok (equal name "元旦（调休）") (format nil "2026-01-02 name ~s" name)))))

(deftest-parametrize govuk-gold-vs-registered-gb
    ((code source) :rows '(("GB" "govuk") ("GBLO" "govuk")
                           ("GB" "govuk-archive") ("GBLO" "govuk-archive")))
  "gov.uk England & Wales (live 2019–2028, archived 2012–2018) vs the
calendar FIND-CALENDAR returns, with no :YEAR."
  (let ((block (find source (external-gold-blocks)
                     :key (lambda (b) (getf b :source)) :test #'string=)))
    (ok block (format nil "external gold block ~s" source))
    (when block
      (let ((miss (external-block-mismatches
                   (list* :calendar code :year-bound nil block))))
        (ok (null (getf miss :only-external))
            (format nil "~a misses ~a days: ~a" code source
                    (%fmt-keys (getf miss :only-external))))
        (ok (null (getf miss :only-ours))
            (format nil "~a extras vs ~a: ~a" code source
                    (%fmt-keys (getf miss :only-ours))))))))

(defun %holiday-keys (calendar from to)
  (mapcar (lambda (o) (%date-key (holiday-observance-date o)))
          (holidays-between calendar (make-date from 1 1) (make-date to 12 31))))

(deftest gb-corpus-is-england-and-wales
  "country-calendar \"GB\" (date-holidays, hand-corrected) has the Summer bank
holiday and the 2002/2011/2012 proclamations: on weekdays it equals the
starter over 2000–2040 and gov.uk over 2012–2028. (The corpus also lists a
weekend nominal date beside its substitute; that presentation is separate.)"
  (let* ((corpus (country-calendar "GB"))
         (ours (remove-if-not #'%weekday-key-p (%holiday-keys corpus 2000 2040)))
         (starter (remove-if-not #'%weekday-key-p
                                 (%holiday-keys (find-calendar "GB") 2000 2040)))
         (govuk (loop for source in '("govuk" "govuk-archive")
                      for block = (find source (external-gold-blocks)
                                        :key (lambda (b) (getf b :source))
                                        :test #'string=)
                      append (%block-day-keys block :weekdays t)))
         (ours-2012 (remove-if-not (lambda (k) (<= 2012 (first k) 2028)) ours)))
    (ok (= 41 (count-if (lambda (k) (= 8 (second k))) ours)) "41 Summer bank holidays")
    (ok (null (set-exclusive-or ours starter :test #'equal))
        (format nil "corpus vs starter: ~a"
                (%fmt-keys (set-exclusive-or ours starter :test #'equal))))
    (ok (null (set-exclusive-or ours-2012 govuk :test #'equal))
        (format nil "corpus vs gov.uk: ~a"
                (%fmt-keys (set-exclusive-or ours-2012 govuk :test #'equal))))))

(deftest registered-data-follows-data-root
  "A registered data-file calendar is rebuilt after CLEAR-DATA-CACHES, so a
relocated data root is honoured and the year maps are not stale."
  (let ((before (find-calendar "RU")))
    (ok (eq before (find-calendar "RU")))
    (clear-data-caches)
    (let ((after (find-calendar "RU")))
      (ok (not (eq before after)))
      (ok (holiday-p after (make-date 2024 4 29))))))
