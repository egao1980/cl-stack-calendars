(in-package #:cl-stack-calendars/tests)

;;;; Diff our starters against pinned external gold
;;;; (data/tests/external-gold.sexp — official gov.uk / 内閣府 + vacanza/holidays).
;;;; Not date-holidays: that corpus is already ingested as country-calendar.

(defun load-external-gold (&optional (path (data-path "tests/external-gold.sexp")))
  (read-data-form path))

(defparameter *external-gold* (load-external-gold))

;;; Weekday-only known disagreements vs vacanza (source extras or our scope).
;;; Official gov.uk / 内閣府 blocks must stay empty here — those are bugs.
(defparameter *external-gold-allow*
  '(;; vacanza US keeps the weekend nominal; we move it. Weekday compare
    ;; already drops those. Remaining extras are state/unofficial.
    ))

(defun external-gold-blocks ()
  (getf *external-gold* :blocks))

(defun %ymd-key (y m d)
  (list y m d))

(defun %date-key (date)
  (list (date-year date) (date-month date) (date-day date)))

(defun %weekday-key-p (key)
  (<= 1 (date-day-of-week (apply #'make-date key)) 5))

(defun %block-day-keys (block &key weekdays)
  (let ((keys (mapcar (lambda (row) (subseq row 0 3)) (getf block :days))))
    (if weekdays (remove-if-not #'%weekday-key-p keys) keys)))

(defun %our-day-keys (calendar from to &key weekdays)
  (let ((keys (mapcar (lambda (o) (%date-key (holiday-observance-date o)))
                      (holidays-between calendar (make-date from 1 1)
                                        (make-date to 12 31)))))
    (if weekdays (remove-if-not #'%weekday-key-p keys) keys)))

(defun %allow-p (source calendar key)
  (find (list* source calendar key) *external-gold-allow*
        :test (lambda (a b) (equal (subseq a 0 5) (subseq b 0 5)))))

(defun %calendar-for-block (block year)
  (let ((code (getf block :calendar)))
    (if (getf block :year-bound)
        (suite-year-calendar code year)
        (find-calendar code))))

(defparameter *vacanza-strict-calendars*
  ;; GBLO is locked by gov.uk, not vacanza (weekend keep vs move).
  '("USFED" "TARGET" "DE" "FR" "JP"))

(defun external-block-mismatches (block)
  "Return plist (:only-external keys :only-ours keys) after allowlist.
Only years that appear in the external block are compared."
  (let* ((source (getf block :source))
         (code (getf block :calendar))
         (weekdays (eq (getf block :compare) :weekdays))
         (ext-all (%block-day-keys block :weekdays weekdays))
         (years (sort (remove-duplicates (mapcar #'first ext-all)) #'<))
         (only-ext '())
         (only-ours '()))
    (dolist (year years)
      (let* ((cal (%calendar-for-block block year))
             (ext (remove-if-not (lambda (k) (= (first k) year)) ext-all))
             (ours (%our-day-keys cal year year :weekdays weekdays)))
        (dolist (k ext)
          (unless (or (member k ours :test #'equal)
                      (%allow-p source code k))
            (push k only-ext)))
        (dolist (k ours)
          (unless (or (member k ext :test #'equal)
                      (%allow-p source code k))
            (push k only-ours)))))
    (list :only-external (nreverse only-ext)
          :only-ours (nreverse only-ours))))

(defun %fmt-keys (keys)
  (format nil "~{~{~4,'0d-~2,'0d-~2,'0d~}~^, ~}" (subseq keys 0 (min 12 (length keys)))))

(deftest official-govuk-england-wales
  "gov.uk England & Wales vs year-bound GBLO (proclamations included)."
  (let* ((block (find "govuk" (external-gold-blocks)
                      :key (lambda (b) (getf b :source)) :test #'string=))
         (miss (external-block-mismatches block)))
    (ok (null (getf miss :only-external))
        (format nil "gov.uk dates we miss (~d): ~a"
                (length (getf miss :only-external))
                (%fmt-keys (getf miss :only-external))))
    (ok (null (getf miss :only-ours))
        (format nil "GBLO extras vs gov.uk (~d): ~a"
                (length (getf miss :only-ours))
                (%fmt-keys (getf miss :only-ours))))))

(deftest official-cao-japan
  "内閣府 国民の祝日・休日 CSV vs JP starter (1955–2027)."
  (let* ((block (find "cao-jp" (external-gold-blocks)
                      :key (lambda (b) (getf b :source)) :test #'string=))
         (miss (external-block-mismatches block)))
    (ok (null (getf miss :only-external))
        (format nil "CAO dates we miss (~d): ~a"
                (length (getf miss :only-external))
                (%fmt-keys (getf miss :only-external))))
    (ok (null (getf miss :only-ours))
        (format nil "JP extras vs CAO (~d): ~a"
                (length (getf miss :only-ours))
                (%fmt-keys (getf miss :only-ours))))))

(deftest vacanza-independent-computational
  "vacanza/holidays (not date-holidays) vs federal/national starters.
KR/HK/AU/CA/… are dumped for inspection but not asserted — gazette and
subdivision scope diverge."
  (dolist (block (remove-if-not (lambda (b) (string= (getf b :source) "vacanza"))
                                (external-gold-blocks)))
    (let ((code (getf block :calendar)))
      (when (member code *vacanza-strict-calendars* :test #'string=)
        (let* ((miss (external-block-mismatches block))
               (ext (getf miss :only-external))
               (ours (getf miss :only-ours)))
          (ok (null ext)
              (format nil "vacanza/~a we miss (~d): ~a" code (length ext) (%fmt-keys ext)))
          (ok (null ours)
              (format nil "vacanza/~a extras (~d): ~a" code (length ours) (%fmt-keys ours))))))))
