(in-package #:cl-stack-calendars/tests)

;;;; #33: a code without a hand starter never resolves to a calendar that is
;;;; worse than its own corpus, and every calendar says whether it is
;;;; normative (cited statute rules), corpus-derived (rules inferred from the
;;;; corpus) or the corpus itself.

(defun %corpus-only-codes ()
  "Corpus codes with data whose registered calendar is not a hand starter."
  (loop for (code nil count) in (list-country-calendars)
        for cal = (find-calendar code :errorp nil)
        when (and cal (plusp count)
                  (member (calendar-provenance cal) '(:corpus :corpus-derived)))
          collect code))

(deftest corpus-only-codes-are-labelled
  "The 93 codes registered from the corpus are labelled, none as normative."
  (let ((codes (%corpus-only-codes)))
    (ok (= 93 (length codes)) (format nil "~d corpus-only codes" (length codes)))
    (dolist (code '("BH" "BN" "TC" "DJ" "VG" "GU" "PR" "MK" "AD" "XK"))
      (ok (member code codes :test #'string=) (format nil "~a corpus-only" code)))))

(deftest corpus-derived-codes-match-the-docs
  "docs/AUTHORITIES.md lists the 22 corpus-derived codes; a change to the
inference or the corpus that moves a code shows up here."
  (let ((derived (sort (remove-if-not (lambda (c)
                                        (eq :corpus-derived
                                            (calendar-provenance (find-calendar c))))
                                      (%corpus-only-codes))
                       #'string<)))
    (ok (equal derived '("AD" "AM" "BL" "CG" "CV" "FO" "GF" "GL" "GP" "HN" "LS" "MF"
                         "MQ" "NC" "PM" "RE" "SC" "SJ" "SM" "VU" "WF" "YT"))
        (format nil "corpus-derived: ~{~a~^ ~}" derived))))

(deftest-parametrize registered-corpus-code-reproduces-its-corpus
    ((code) :rows (%corpus-only-codes))
  "FIND-CALENDAR CODE has ≥ 99% of the corpus public days in 2000–2040 and
almost no day the corpus lacks."
  (multiple-value-bind (recall precision)
      (calendar-corpus-agreement (find-calendar code) code)
    (ok (>= recall 99/100) (format nil "~a recall ~,3f" code recall))
    (ok (>= precision 99/100) (format nil "~a precision ~,3f" code precision))))

(deftest bh-2024-has-eid
  "The issue's repro: find-calendar \"BH\" has the corpus Eid days."
  (let* ((from (make-date 2024 1 1)) (to (make-date 2024 12 31))
         (ours (mapcar (lambda (o) (date-rd (holiday-observance-date o)))
                       (holidays-between (find-calendar "BH") from to)))
         (corpus (mapcar (lambda (o) (date-rd (holiday-observance-date o)))
                         (holidays-between (country-calendar "BH") from to))))
    (ok (null (set-difference corpus ours))
        (format nil "BH 2024 missing ~d corpus days" (length (set-difference corpus ours))))))

(deftest provenance-labels
  (ok (eq :normative (calendar-provenance (find-calendar "USFED"))))
  (ok (eq :normative (calendar-provenance (find-calendar "GB"))))
  (ok (eq :corpus (calendar-provenance (country-calendar "FR"))))
  (ok (eq :normative (calendar-provenance (country-calendar "DE"))) "DE defers to its starter (#24)")
  (ok (eq :corpus (calendar-provenance (find-calendar "BH"))))
  (ok (eq :corpus-derived (calendar-provenance (make-corpus-inferred-calendar "AD")))))

(deftest corpus-derived-rules-say-so
  "Each inferred rule's :AUTHORITY names it corpus-derived and not normative."
  (dolist (code (%corpus-only-codes))
    (let ((cal (find-calendar code)))
      (when (eq :corpus-derived (calendar-provenance cal))
        (dolist (rule (calendar-rules cal))
          (ok (search "Corpus-derived, not normative" (holiday-rule-authority rule))
              (format nil "~a ~s authority" code (holiday-rule-name rule))))))))

(deftest corpus-derived-rule-says-when-bank-only
  "AD's corpus types Jueves Santo and Nochebuena :bank. The inferred rules
keep them (COUNTRY-CALENDAR counts bank days too) but their :AUTHORITY says
they are bank holidays, not statutory ones. Nadal (:public) does not."
  (let* ((ad (make-corpus-inferred-calendar "AD"))
         (rules (calendar-rules ad))
         (bank (remove-if-not (lambda (r) (search "(:bank)" (holiday-rule-authority r)))
                              rules)))
    (ok (find "Nochebuena" bank :key #'holiday-rule-name :test #'equal))
    (ok (find "Jueves Santo" bank :key #'holiday-rule-name :test #'equal))
    (ok (find "Nadal" rules :key #'holiday-rule-name :test #'equal))
    (ng (find "Nadal" bank :key #'holiday-rule-name :test #'equal))))

(deftest coverage-index-separates-normative
  "normative-coverage-by-population and normative-calendar-codes never count
a corpus or corpus-derived calendar as normative."
  (let ((normative (normative-calendar-codes)))
    (dolist (code (%corpus-only-codes))
      (ng (member code normative :test #'string=)
          (format nil "~a not in normative-calendar-codes" code))))
  (dolist (row (normative-coverage-by-population))
    (destructuring-bind (code pop name &key status) row
      (declare (ignore pop name))
      (when (eq status :normative)
        (ok (eq :normative (calendar-provenance (find-calendar code)))
            (format nil "~a :normative has normative provenance" code))))))

(deftest inferred-easter-dedupe-checks-every-year
  "An Easter-offset rule is dropped as a duplicate only when it lands on a
fixed rule's date in every year. It used to be tested in 2024 alone, so a
fixed 1 April day (Easter Monday 2024 is 1 April) swallowed Easter Monday in
every year."
  (let* ((days (loop for y from 2000 to 2040
                     collect (list y 4 1 "Fixed 1 April" :public)
                     collect (let ((d (+ (easter-western y) 1)))
                               (list y (date-month d) (date-day d) "Easter Monday" :public))))
         (rules (cl-stack-calendars::%infer-rules-from-days days 2000)))
    (ok (find "Easter Monday" rules :key #'holiday-rule-name :test #'equal))
    (ok (find "Fixed 1 April" rules :key #'holiday-rule-name :test #'equal))))
