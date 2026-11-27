(in-package #:cl-stack-calendars)

;;;; Corpus-only codes (no hand-maintained DEFINE-CALENDAR starter). Fixed and
;;;; Western-Easter rules are inferred from the country-holiday corpus; the
;;;; code is registered with that RULE-CALENDAR (provenance :CORPUS-DERIVED)
;;;; only when it reproduces the corpus (CALENDAR-CORPUS-AGREEMENT), and with
;;;; the corpus itself (provenance :CORPUS) otherwise (#33).

(defun %corpus-days (code)
  (let ((path (%country-data-path code)))
    (when (data-file-exists-p path)
      (let ((plist (%load-country-plist code)))
        (getf plist :days)))))

(defun %easter-offset-for-date (date)
  (let ((y (date-year date)))
    (- (date-rd date) (date-rd (easter-western y)))))

(defun %infer-fixed-rules (days &key (min-years 30) (from-year 2000))
  "Return list of FIXED-HOLIDAY-RULE from recurring (month day) buckets."
  (let ((buckets (make-hash-table :test #'equal)))
    (dolist (entry days)
      (destructuring-bind (y m d name &optional _type) entry
        (declare (ignore _type))
        (when (>= y from-year)
          (let ((key (cons m d)))
            (push (cons y name) (gethash key buckets))))))
    (loop for k being the hash-keys of buckets
          for rows = (gethash k buckets)
          for m = (car k)
          for d = (cdr k)
          when (>= (length rows) min-years)
            collect (make-fixed-holiday-rule
                     :name (cdr (first (sort rows #'> :key #'car)))
                     :month m :day d
                     :from from-year
                     :authority "Corpus-derived, not normative (recurring fixed date)"))))

(defun %infer-easter-rules (days &key (min-years 25) (from-year 2000))
  (let ((by-offset (make-hash-table)))
    (dolist (entry days)
      (destructuring-bind (y m d name &optional _type) entry
        (declare (ignore _type))
        (when (>= y from-year)
          (let* ((date (make-date y m d))
                 (off (%easter-offset-for-date date)))
            (when (<= -60 off 60)
              (push (cons y name) (gethash off by-offset)))))))
    (loop for off being the hash-keys of by-offset
          for rows = (gethash off by-offset)
          when (>= (length rows) min-years)
            collect (make-easter-holiday-rule
                     :name (cdr (first (sort rows #'> :key #'car)))
                     :offset off
                     :from from-year
                     :authority "Corpus-derived, not normative (recurring Western Easter offset)"))))

(defun %infer-rules-from-days (days from-year)
  "FIXED + EASTER rules inferred from corpus DAYS (public and bank entries,
the days COUNTRY-CALENDAR treats as holidays), from FROM-YEAR on. An
Easter-offset rule is dropped as a duplicate only when, in every year of the
corpus, it lands on the date of an inferred fixed rule."
  (let* ((fixed (%infer-fixed-rules days :from-year from-year))
         (easter (%infer-easter-rules days :from-year from-year))
         (fixed-keys (mapcar (lambda (r)
                               (cons (fixed-holiday-rule-month r)
                                     (fixed-holiday-rule-day r)))
                             fixed))
         (last-year (reduce #'max days :key #'first :initial-value from-year)))
    (flet ((duplicate-p (rule)
             (loop for year from from-year to last-year
                   for nominal = (rule-nominal-date rule year)
                   always (and nominal
                               (member (cons (date-month nominal) (date-day nominal))
                                       fixed-keys :test #'equal)))))
      (append fixed (remove-if #'duplicate-p easter)))))

(defun infer-rules-from-corpus (code &key (from-year 2000))
  "Infer FIXED + EASTER rules for CODE from the :PUBLIC days of its shipped
country corpus (see %INFER-RULES-FROM-DAYS)."
  (%infer-rules-from-days (%corpus-days code) from-year))

(defun %corpus-day-types (days from to)
  "Hash table RD → list of corpus types (:PUBLIC, :BANK) of DAYS in FROM..TO."
  (let ((types (make-hash-table)))
    (dolist (entry days types)
      (destructuring-bind (y m d name &optional type) entry
        (declare (ignore name))
        (when (<= from y to)
          (push (or type :public) (gethash (date-rd (make-date y m d)) types)))))))

(defun %bank-only-rule-p (rule types from to)
  "True when RULE's nominal dates in FROM..TO appear in the corpus (TYPES, from
%CORPUS-DAY-TYPES) and are typed :BANK there every time."
  (let ((seen nil))
    (loop for year from from to to
          for nominal = (rule-nominal-date rule year)
          for here = (and nominal (gethash (date-rd nominal) types))
          when here
            do (setf seen t)
               (unless (every (lambda (type) (eq type :bank)) here)
                 (return-from %bank-only-rule-p nil)))
    seen))

(defun make-corpus-inferred-calendar (code)
  "A RULE-CALENDAR of fixed and Easter rules inferred from CODE's corpus, or
NIL for a stub. Its CALENDAR-PROVENANCE is :CORPUS-DERIVED and each rule's
:AUTHORITY says it is not normative (and when the corpus types the day
:BANK only). The rules and the calendar's CALENDAR-COVERAGE are bounded to
the years the corpus covers: nothing is extrapolated, and HOLIDAY-P outside
those years signals CALENDAR-OUT-OF-RANGE. Inference finds fixed dates and
Western Easter offsets only; CORPUS-DERIVED-CALENDAR decides whether that is
enough."
  (let* ((cc (string-upcase code))
         (days (%corpus-days cc))
         (floor (civil-research-from-year cc))
         (infer-from (max 2000 floor))
         (rules (when days (infer-rules-from-corpus cc :from-year infer-from)))
         (plist (when (data-file-exists-p (%country-data-path cc))
                  (%load-country-plist cc)))
         (infer-to (or (cdr (getf plist :years)) 2040))
         (types (%corpus-day-types days infer-from infer-to)))
    (when rules
      (dolist (rule rules)
        (setf (holiday-rule-from rule) infer-from
              (holiday-rule-to rule) infer-to)
        (setf (holiday-rule-authority rule)
              (format nil "Corpus-derived, not normative: inferred from ~a, ~d–~d (recurrence only; not checked against a statute)~:[~;; a bank holiday (:bank) in the corpus, not a public one~]"
                      (or (and plist (getf plist :source)) "date-holidays")
                      infer-from infer-to
                      (%bank-only-rule-p rule types infer-from infer-to))))
      (make-instance 'rule-calendar
                     :name (or (and plist (getf plist :name)) cc)
                     :provenance :corpus-derived
                     :weekend-days (country-weekend-days cc)
                     :coverage (cons infer-from infer-to)
                     :rules rules))))

(defparameter *corpus-inference-min-agreement* 99/100
  "The share of the corpus an inferred calendar must reproduce before
CORPUS-DERIVED-CALENDAR uses it instead of the corpus: both its recall
(corpus :PUBLIC days it has) and its precision (its holidays that are corpus
days) over the corpus years, by CALENDAR-CORPUS-AGREEMENT.")

(defun calendar-corpus-agreement (calendar code &key (from 2000) (to 2040))
  "How well CALENDAR reproduces CODE's corpus over the years FROM..TO.
Returns RECALL (share of the corpus :PUBLIC days that CALENDAR has as
holidays), PRECISION (share of CALENDAR's holidays that are corpus days,
public or bank), and the lists MISSING and EXTRA of the dates behind them.
A date outside CALENDAR's coverage counts as not a holiday."
  (let* ((days (%corpus-days (string-upcase code)))
         (public (make-hash-table))
         (any (make-hash-table))
         (missing '())
         (extra '())
         (ours 0))
    (dolist (entry days)
      (destructuring-bind (y m d name &optional type) entry
        (declare (ignore name))
        (when (<= from y to)
          (let ((rd (date-rd (make-date y m d))))
            (setf (gethash rd any) t)
            (when (member type '(nil :public))
              (setf (gethash rd public) t))))))
    (handler-bind ((calendar-out-of-range #'continue))
      (loop for rd from (date-rd (make-date from 1 1)) to (date-rd (make-date to 12 31))
            for date = (date-from-rd rd)
            for holiday = (holiday-p calendar date)
            do (when holiday
                 (incf ours)
                 (unless (gethash rd any) (push date extra)))
               (when (and (gethash rd public) (not holiday))
                 (push date missing))))
    (let ((n-public (hash-table-count public)))
      (values (if (zerop n-public) 1 (- 1 (/ (length missing) n-public)))
              (if (zerop ours) 1 (- 1 (/ (length extra) ours)))
              (nreverse missing)
              (nreverse extra)))))

(defun corpus-derived-calendar (code)
  "The calendar FIND-CALENDAR returns for CODE when no hand starter exists.
This is the corpus-inferred rule calendar (provenance :CORPUS-DERIVED) when
it reaches *CORPUS-INFERENCE-MIN-AGREEMENT* in both recall and precision
against the corpus over the corpus years; otherwise the corpus itself,
(COUNTRY-CALENDAR CODE) (provenance :CORPUS). It is never a calendar that
silently drops corpus days (#33). Returns NIL for a stub."
  (let* ((cc (string-upcase code))
         (corpus (country-calendar cc))
         (years (calendar-coverage corpus)))
    (unless (eq years :none)
      (let ((inferred (make-corpus-inferred-calendar cc)))
        (if (and inferred
                 (multiple-value-bind (recall precision)
                     (calendar-corpus-agreement inferred cc
                                                :from (car years) :to (cdr years))
                   (and (>= recall *corpus-inference-min-agreement*)
                        (>= precision *corpus-inference-min-agreement*))))
            inferred
            corpus)))))

(defun register-corpus-inferred-territory-starters ()
  "Register CORPUS-DERIVED-CALENDAR under every corpus code that has data and
no hand starter. The choice between the inferred rules and the corpus is
made on first lookup (REGISTER-CALENDAR-CONSTRUCTOR)."
  (dolist (entry (list-country-calendars))
    (destructuring-bind (code name day-count) entry
      (declare (ignore name))
      (when (and (integerp day-count) (plusp day-count)
                 (not (calendar-registered-p code)))
        (register-calendar-constructor
         code (lambda () (corpus-derived-calendar code)))))))
