;;;; Write docs/COVERAGE.md: the per-calendar coverage table, read from the
;;;; code and its fixtures so the table cannot drift from them.
;;;;
;;;;   cl-repo run -- ros -l scripts/generate-coverage-table.lisp -q
;;;;
;;;; Per calendar (every registered :NORMATIVE starter, every gold fixture):
;;;;   provenance        CALENDAR-PROVENANCE of FIND-CALENDAR
;;;;   corpus defers     the code is in *COUNTRY-CALENDAR-NORMATIVE*
;;;;   scope             the parenthesis of the primary gold fixture's header
;;;;                     line ("(federal)", "(government offices)", …)
;;;;   gold              :FROM-:TO of data/tests/<cc>-holiday-gold.sexp
;;;;                     (primary) and <cc>-secondary-holiday-gold.sexp
;;;;   other checks      data/tests/external-gold.sexp blocks, the RU
;;;;                     production calendar
;;;;   provisional from  the first year <CC>-PROVISIONAL-YEAR-P (or
;;;;                     MENA-PROVISIONAL-YEAR-P) is true
;;;;   confidence        the runs of years 2000-2040 whose <CC>-CONFIDENCE
;;;;                     (MENA-CONFIDENCE, CN-NOTICE-CONFIDENCE) is not :PRIMARY
;;;;   sources           how many sources the primary gold cites, and the first
;;;;
;;;; Then the Islamic table: for every gold fixture year whose Eid al-Fitr
;;;; days come from a list (their names do not say "estimated"), the first
;;;; listed Eid al-Fitr day minus the tabular 1 Shawwal of datetime-protocol.
;;;; Then the exchanges table: one row per MIC (XNYS's gold is
;;;; data/tests/xnys-gold.sexp, 1953-2030).

(setf *debugger-hook*
      (lambda (c h)
        (declare (ignore h))
        (format *error-output* "~&error: ~a~%" c)
        (uiop:quit 1)))

(asdf:load-system "cl-stack-calendars")

(defpackage #:cl-stack-calendars/coverage-table
  (:use #:cl)
  (:local-nicknames (#:cal #:cl-stack-calendars) (#:dt #:datetime-protocol)))

(in-package #:cl-stack-calendars/coverage-table)

(defparameter *root*
  (uiop:pathname-parent-directory-pathname
   (uiop:pathname-directory-pathname *load-truename*)))

(defparameter *years* '(2000 . 2040)
  "The span the confidence runs are computed over.")

(defun repo-path (relative)
  (merge-pathnames relative *root*))

(defun read-fixture (path)
  "The plist of fixture PATH and its first line without the \";; \"."
  (with-open-file (in path :external-format :utf-8)
    (let ((first-line (read-line in nil "")))
      (file-position in 0)
      (values (let ((*read-eval* nil)
                    (*package* (find-package '#:cl-stack-calendars/coverage-table)))
                (read in))
              (string-left-trim "; " first-line)))))

(defun year-of (bound)
  (if (consp bound) (first bound) bound))

(defun span (from to)
  (if (and from to)
      (format nil "~d–~d" (year-of from) (year-of to))
      "—"))

(defun header-scope (label)
  "The parenthesis of a fixture header such as \"Canada (federal) national
holidays 2000-2040: …\", else \"nationwide\"."
  (let ((open (position #\( label))
        (close (position #\) label)))
    (if (and open close (< open close))
        (subseq label (1+ open) close)
        "nationwide")))

(defun truncate-text (text n)
  (if (<= (length text) n)
      text
      (concatenate 'string (subseq text 0 (1- n)) "…")))

(defun cell (text)
  "TEXT made safe for a Markdown table cell."
  (substitute #\/ #\| (substitute #\Space #\Newline text)))

;;; --- gold fixtures -----------------------------------------------------------

(defstruct gold code kind label plist)

(defun gold-fixtures ()
  (loop for path in (directory (repo-path "data/tests/*-holiday-gold.sexp"))
        for name = (pathname-name path)
        collect (multiple-value-bind (plist label) (read-fixture path)
                  (make-gold :code (getf plist :country)
                             :kind (if (search "-secondary-" name) :secondary :primary)
                             :label label
                             :plist plist))))

(defun gold-for (golds code kind)
  (find-if (lambda (g) (and (string= (gold-code g) code) (eq (gold-kind g) kind)))
           golds))

(defun external-checks ()
  "Hash table code → list of \"<source> <from>–<to>\" from the external fixtures.
The XNYS gold is in the exchanges table (EXCHANGE-GOLD)."
  (let ((out (make-hash-table :test #'equal)))
    (flet ((add (code text)
             (setf (gethash code out) (append (gethash code out) (list text)))))
      (let ((ext (read-fixture (repo-path "data/tests/external-gold.sexp"))))
        (dolist (block (getf ext :blocks))
          (let ((code (getf block :calendar)))
            (add (if (string= code "GBLO") "GB" code)
                 (format nil "~a ~a" (getf block :source)
                         (span (getf block :from) (getf block :to)))))))
      (let ((ru (read-fixture (repo-path "data/tests/ru-production-calendar-gold.sexp"))))
        (add "RU" (format nil "production calendar ~a"
                          (span (getf ru :from) (getf ru :to))))))
    out))

;;; --- what the code says --------------------------------------------------------

(defun calendar-symbol (code suffix)
  (let ((symbol (find-symbol (format nil "~:@(~a~)-~a" code suffix) '#:cl-stack-calendars)))
    (and symbol (fboundp symbol) (symbol-function symbol))))

(defun mena-code-p (code)
  (assoc code cal::*mena-last-list-year* :test #'string=))

(defun provisional-from (code)
  (let ((predicate (or (calendar-symbol code "PROVISIONAL-YEAR-P")
                       (and (mena-code-p code)
                            (lambda (y) (cal::mena-provisional-year-p code y))))))
    (when predicate
      (loop for y from 1990 to 2060
            when (ignore-errors (funcall predicate y))
              return y))))

(defun confidence-function (code)
  (or (calendar-symbol code "CONFIDENCE")
      (and (string= code "CN") #'cal::cn-notice-confidence)
      (and (mena-code-p code) (lambda (y) (cal::mena-confidence code y)))))

(defun confidence-runs (code)
  "\"secondary 2000–2006; provisional 2028–2040\" for the years whose
confidence is not :PRIMARY, or NIL."
  (let ((fn (confidence-function code))
        (runs '()))
    (when fn
      (loop for y from (car *years*) to (cdr *years*)
            for value = (ignore-errors (funcall fn y))
            do (if (and runs (eq (first (first runs)) value) (= (third (first runs)) (1- y)))
                   (setf (third (first runs)) y)
                   (push (list value y y) runs)))
      (format nil "~{~a~^; ~}"
              (loop for (value from to) in (reverse runs)
                    unless (member value '(:primary nil))
                      collect (format nil "~(~a~) ~a" value
                                      (if (= from to) from (span from to))))))))

(defun normative-codes ()
  (sort (loop for name in (cal:list-registered-calendars)
              for calendar = (ignore-errors (cal:find-calendar name :errorp nil))
              when (and calendar (eq :normative (ignore-errors (cal:calendar-provenance calendar))))
                collect name)
        #'string<))

(defun provenance (code)
  (let ((calendar (ignore-errors (cal:find-calendar code :errorp nil))))
    (if calendar
        (string-downcase (princ-to-string (cal:calendar-provenance calendar)))
        "—")))

(defun defers-p (code)
  (assoc code cal::*country-calendar-normative* :test #'string=))

;;; --- Islamic dates -------------------------------------------------------------

(defparameter *fitr-words*
  '("fitr" "fitri" "korit" "ramazan" "ramadan bayram" "aidilfitri" "puasa"
    "ораза" "الفطر" "fetr" "idd-ul-fitr" "id-ul-fitr" "eid'l fitr")
  "Lower-case fragments of the Eid al-Fitr names in the gold fixtures.")

(defparameter *not-first-day-words*
  '("estimat" "perkiraan" "extra" "before" "after" "extension" "holiday" "day 2"
    "second" "وقفة" "إضافي" "عطلة")
  "Fragments of names that mark an eve, an extension, a bridge or an estimate,
not the listed 1 Shawwal.")

(defun fitr-name-p (name)
  (let ((down (string-downcase name)))
    (and (some (lambda (w) (search w down)) *fitr-words*)
         (notany (lambda (w) (search w down)) *not-first-day-words*))))

(defun listed-year-p (code year)
  "True when YEAR of CODE is neither provisional nor estimated."
  (let ((from (provisional-from code))
        (fn (confidence-function code)))
    (and (or (null from) (< year from))
         (not (member (and fn (ignore-errors (funcall fn year)))
                      '(:estimated :provisional))))))

(defun fitr-offsets (gold)
  "List of (YEAR . OFFSET): the first listed Eid al-Fitr day of each listed
year (LISTED-YEAR-P), minus the tabular 1 Shawwal, when within 3 days."
  (let ((by-year (make-hash-table))
        (code (gold-code gold)))
    (dolist (row (getf (gold-plist gold) :days))
      (destructuring-bind (y m d name &rest more) row
        (declare (ignore more))
        (when (and (stringp name) (fitr-name-p name) (listed-year-p code y))
          (let ((tabular (dt:eid-al-fitr y)))
            (when tabular
              (let ((offset (- (dt:date-rd (dt:make-date y m d)) (dt:date-rd tabular))))
                (when (<= -3 offset 3)
                  (let ((old (gethash y by-year)))
                    (when (or (null old) (< offset old))
                      (setf (gethash y by-year) offset))))))))))
    (sort (loop for y being the hash-keys of by-year using (hash-value o)
                collect (cons y o))
          #'< :key #'car)))

(defun offset-summary (offsets)
  (let ((counts (make-hash-table)))
    (dolist (o offsets) (incf (gethash (cdr o) counts 0)))
    (format nil "~{~a~^, ~}"
            (loop for k in (sort (loop for k being the hash-keys of counts collect k) #'<)
                  collect (format nil "~:[~@d~;0~*~] d: ~d" (zerop k) k (gethash k counts))))))

;;; --- output ---------------------------------------------------------------------

(defun exchange-gold (mic)
  "The gold fixture of MIC: data/tests/exchanges/<MIC>-gold.sexp, or for XNYS
data/tests/xnys-gold.sexp (the NYSE's own record 1953–1969, exchange_calendars
1970–2030; #50)."
  (let ((path (repo-path (if (string= mic "XNYS")
                             "data/tests/xnys-gold.sexp"
                             (format nil "data/tests/exchanges/~a-gold.sexp" mic)))))
    (when (probe-file path) (read-fixture path))))

(defun exchange-differences ()
  (let ((path (repo-path "data/tests/exchanges/differences.sexp")))
    (when (probe-file path) (read-fixture path))))

(defun notice-years (calendar)
  "The span of years the notices of CALENDAR (own and included) date."
  (let ((years (loop for notice in (cal:exchange-calendar-notices calendar)
                     for issued = (or (getf notice :year) (getf notice :issued))
                     when (integerp issued) collect issued
                     when (consp issued) collect (first issued))))
    (if years (format nil "~d–~d" (reduce #'min years) (reduce #'max years)) "—")))

(defun write-exchanges (stream)
  (format stream "~%## Exchanges~%~%")
  (format stream "One row per MIC in `data/exchanges/`. \"Calendar\" is the holiday calendar the ~
exchange queries use, with its provenance: `exchange` for the exchange's own trading-holiday ~
calendar (`data/exchanges/calendars/`, rules and notices from the exchange), otherwise the civil ~
calendar the MIC still uses. \"Notices\" counts the exchange notice rows (each with `:issued` / ~
`:published`) and the years they date. \"Gold\" is the `exchange_calendars` cross-check in ~
`data/tests/exchanges/` (every session, regular hours, early close and late open of those ~
years); \"Recorded differences\" are the gold days where the exchange's own notice wins ~
(`data/tests/exchanges/differences.sexp`). XNYS's gold is `data/tests/xnys-gold.sexp`: ~
1953–1969 built from the NYSE's own record (every row with its source URL), 1970–2030 ~
`exchange_calendars`; the `NYSE` calendar is modeled from 1953 and signals ~
`calendar-out-of-range` before (#50).~%~%")
  (format stream "| MIC | Name | Calendar | Provenance | Notices | Gold | Sessions | Early closes | Late opens | Recorded differences |~%")
  (format stream "|---|---|---|---|---|---|---|---|---|---|~%")
  (let ((differences (exchange-differences)))
    (dolist (mic (cal:list-exchanges))
      (let* ((ex (cal:find-exchange mic))
             (name (cal:exchange-hours-calendar-name ex))
             (calendar (and name (cal:find-calendar name :errorp nil)))
             (exchangep (typep calendar 'cal:exchange-holiday-calendar))
             (gold (exchange-gold mic)))
        (format stream "| ~a | ~a | ~a | ~a | ~a | ~a | ~a | ~a | ~a | ~a |~%"
                mic (cell (cal::exchange-hours-name ex)) (or name "—")
                (provenance name)
                (if exchangep
                    (format nil "~d (~a)" (length (cal:exchange-calendar-notices calendar))
                            (notice-years calendar))
                    "—")
                (if gold (span (getf gold :from) (getf gold :to)) "—")
                (if gold (getf gold :session-count) "—")
                (if gold (length (getf gold :early-closes)) "—")
                (if gold (length (getf gold :late-opens)) "—")
                (if gold
                    (count mic differences :key (lambda (row) (getf row :mic)) :test #'equal)
                    "—"))))))

(defun write-coverage (stream)
  (let* ((golds (gold-fixtures))
         (external (external-checks))
         (codes (sort (remove-duplicates
                       (append (normative-codes)
                               (mapcar #'gold-code golds)
                               (mapcar #'car cal::*country-calendar-normative*))
                       :test #'string=)
                      #'string<)))
    (format stream "# Calendar coverage~%~%")
    (format stream "Generated by `scripts/generate-coverage-table.lisp` from the code and the ~
fixtures in `data/tests/`. Do not edit it by hand: run~%~%```~%cl-repo run -- ros -l scripts/generate-coverage-table.lisp -q~%```~%~%")
    (format stream "Column meanings are in [AUTHORITIES.md](AUTHORITIES.md#coverage-per-calendar). ~
\"Gold\" is the fixture a test compares every day of those years against (0 differences); ~
\"primary\" fixtures are built from the official texts, \"secondary\" ones from copies, news or ~
other secondary sources. \"Provisional from\" is the first year with no published list or decree: ~
from then on the calendar applies the statute and estimates the rest. \"Confidence\" lists the ~
years whose `…-confidence` function does not answer `:primary`.~%~%")
    (format stream "| Code | Provenance | Corpus defers | Scope | Gold primary | Gold secondary | Other checks | Provisional from | Confidence (not primary), ~d–~d | Gold sources |~%"
            (car *years*) (cdr *years*))
    (format stream "|---|---|---|---|---|---|---|---|---|---|~%")
    (dolist (code codes)
      (let* ((primary (gold-for golds code :primary))
             (secondary (gold-for golds code :secondary))
             (sources (and primary (getf (gold-plist primary) :sources)))
             (first-title (and sources (getf (first sources) :title))))
        (format stream "| ~a | ~a | ~:[—~;yes~] | ~a | ~a | ~a | ~a | ~a | ~a | ~a |~%"
                code
                (provenance code)
                (defers-p code)
                (cell (if primary (header-scope (gold-label primary)) "—"))
                (if primary (span (getf (gold-plist primary) :from) (getf (gold-plist primary) :to)) "—")
                (if secondary
                    (cell (format nil "~a (~a)"
                                  (span (getf (gold-plist secondary) :from) (getf (gold-plist secondary) :to))
                                  (header-scope (gold-label secondary))))
                    "—")
                (cell (format nil "~{~a~^; ~}" (or (gethash code external) '("—"))))
                (or (provisional-from code) "—")
                (cell (let ((runs (confidence-runs code)))
                        (if (and runs (plusp (length runs))) runs "—")))
                (if sources
                    (cell (format nil "~d: ~a" (length sources) (truncate-text first-title 70)))
                    "—"))))
    (format stream "~%## Islamic dates: listed Eid al-Fitr against tabular 1 Shawwal~%~%")
    (format stream "For each gold year that has an official list (not provisional, not :estimated), the ~
first listed Eid al-Fitr day minus the tabular 1 Shawwal (`datetime-protocol:eid-al-fitr`, ~
the arithmetic civil calendar). Eves, extensions, bridge days and estimates are skipped by ~
name; a fixture that names every day of its block alike (OM) drops out. A positive offset ~
means the list put Eid after the tabular date. A calendar uses the tabular date, named ~
\"(estimated)\", only in years without a list.~%~%")
    (format stream "| Code | Fixture | Years measured | Offsets (days: years) | Exact |~%|---|---|---|---|---|~%")
    (dolist (gold (sort (copy-list golds) #'string< :key (lambda (g) (format nil "~a~a" (gold-code g) (gold-kind g)))))
      (let ((offsets (fitr-offsets gold)))
        (when offsets
          (format stream "| ~a | ~(~a~) | ~a | ~a | ~d% |~%"
                  (gold-code gold) (gold-kind gold)
                  (span (car (first offsets)) (car (car (last offsets))))
                  (offset-summary offsets)
                  (round (* 100 (count 0 offsets :key #'cdr)) (length offsets))))))))

(with-open-file (out (repo-path "docs/COVERAGE.md") :direction :output
                                                    :if-exists :supersede
                                                    :external-format :utf-8)
  (write-coverage out)
  (write-exchanges out))

(format t "~&wrote ~a~%" (repo-path "docs/COVERAGE.md"))
(uiop:quit 0)
