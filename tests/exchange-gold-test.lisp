(in-package #:cl-stack-calendars/tests)

;;;; Every session date, regular hours, early close and late open of each MIC
;;;; with a fixture data/tests/exchanges/<MIC>-gold.sexp (Python
;;;; exchange_calendars, scripts/generate_exchange_gold.py) is compared with
;;;; the exchange model. exchange_calendars is a cross-check, not the
;;;; authority: where the exchange's own notice differs, the notice wins and
;;;; the difference is a row of data/tests/exchanges/differences.sexp
;;;; (:MIC :DATE :KIND :GOLD :OURS :WHY :SOURCE). Every other difference fails.

(defun %exchange-gold-files ()
  (sort (remove-if-not (lambda (p)
                         (let ((name (sp:name p)))
                           (and (string-equal (sp:extension p) "sexp")
                                (search "-gold" name))))
                       (sp:iterdir (data-path "tests/exchanges")))
        #'string< :key #'sp:name))

(defun %exchange-gold-mics ()
  (mapcar (lambda (p)
            (let ((name (sp:name p)))
              (subseq name 0 (search "-gold" name))))
          (%exchange-gold-files)))

(defun load-exchange-gold (mic)
  (read-data-form (data-path (format nil "tests/exchanges/~a-gold.sexp" mic))))

(defun load-exchange-gold-differences ()
  (read-data-form (data-path "tests/exchanges/differences.sexp")))

(defun %ymd-table (rows &key (key #'identity))
  (let ((table (make-hash-table)))
    (dolist (row rows table)
      (setf (gethash (date-rd (apply #'make-date (funcall key row))) table)
            (if (eq key #'identity) t (second row))))))

(defun %hours-at (runs date)
  "The (OPEN BREAK-START BREAK-END CLOSE) run of the gold covering DATE."
  (loop for (from to . hours) in runs
        when (<= (apply #'make-date from) date (apply #'make-date to))
          return hours))

(defun %our-hours (segs)
  "(OPEN BREAK-START BREAK-END CLOSE) of our segments, as (H M) lists."
  (let ((first (first segs))
        (last (car (last segs))))
    (list (%hm (exchange-session-spec-open first))
          (and (cdr segs) (%hm (exchange-session-spec-close first)))
          (and (cdr segs) (%hm (exchange-session-spec-open last)))
          (%hm (exchange-session-spec-close last)))))

(defun %regular-sessions (exchange date)
  "Our segments on DATE without the early close / late open overlay."
  (exchange-regular-sessions-for-date exchange date))

(defun compare-exchange-with-gold (mic)
  "Return (values SESSIONS MISMATCHES) for MIC against its gold. Each
mismatch is (DATE-KEY KIND GOLD OURS)."
  (let* ((gold (load-exchange-gold mic))
         (ex (find-exchange mic))
         (closed (%ymd-table (getf gold :closed)))
         (weekend (%ymd-table (getf gold :weekend-sessions)))
         (early (%ymd-table (getf gold :early-closes) :key #'first))
         (late (%ymd-table (getf gold :late-opens) :key #'first))
         (runs (getf gold :hours))
         (end (apply #'make-date (getf gold :to)))
         (sessions 0)
         (out '()))
    (flet ((miss (date kind g o) (push (list (%date-key date) kind g o) out)))
      (loop for date = (apply #'make-date (getf gold :from)) then (+ date 1)
            while (<= date end)
            do (let* ((rd (date-rd date))
                      (gold-session (if (<= (date-day-of-week date) 5)
                                        (not (gethash rd closed))
                                        (and (gethash rd weekend) t)))
                      (segs (exchange-sessions-for-date ex date))
                      (ours (and segs t)))
                 (when gold-session (incf sessions))
                 (unless (eq gold-session ours)
                   (miss date :session gold-session ours))
                 (when (and gold-session ours)
                   (let ((g-early (gethash rd early))
                         (g-late (gethash rd late))
                         (o-early (let ((tod (exchange-early-close ex date)))
                                    (and tod (%hm tod))))
                         (o-late (let ((tod (exchange-late-open ex date)))
                                   (and tod (%hm tod)))))
                     (unless (equal g-early o-early)
                       (miss date :early-close g-early o-early))
                     (unless (equal g-late o-late)
                       (miss date :late-open g-late o-late))
                     (let ((g-hours (%hours-at runs date))
                           (o-hours (%our-hours (%regular-sessions ex date))))
                       (when (and g-hours (not (equal g-hours o-hours)))
                         (miss date :hours g-hours o-hours))))))))
    (values sessions (nreverse out))))

(defun %difference-recorded-p (mic mismatch differences)
  (destructuring-bind (key kind gold ours) mismatch
    (find-if (lambda (row)
               (and (string= (getf row :mic) mic)
                    (eq (getf row :kind) kind)
                    (let ((d (getf row :date)))
                      ;; :DATE (Y M D), or :FROM / :TO for a run of dates.
                      (if d
                          (equal d key)
                          (<= (apply #'make-date (getf row :from))
                              (apply #'make-date key)
                              (apply #'make-date (getf row :to)))))
                    (equal (getf row :gold) gold)
                    (equal (getf row :ours) ours)))
             differences)))

(defun unrecorded-exchange-differences (mic)
  "Mismatches of MIC against its gold that differences.sexp does not record."
  (let ((differences (load-exchange-gold-differences)))
    (multiple-value-bind (sessions mismatches) (compare-exchange-with-gold mic)
      (values (remove-if (lambda (m) (%difference-recorded-p mic m differences))
                         mismatches)
              sessions))))

(deftest-parametrize exchange-gold
    ((mic) :rows (%exchange-gold-mics))
  (multiple-value-bind (bad sessions) (unrecorded-exchange-differences mic)
    (let ((gold (load-exchange-gold mic)))
      (ok (= sessions (getf gold :session-count))
          (format nil "~a gold session checksum ~d" mic sessions)))
    (loop for m in bad
          repeat 12
          do (ok nil (format nil "~a ~{~a ~a gold ~s ours ~s~}" mic m)))
    (ok (null bad) (format nil "~a unrecorded differences: ~d" mic (length bad)))))

(deftest exchange-gold-differences-are-cited
  "Every recorded difference says why and cites the exchange's notice, and
still differs (a stale row fails)."
  (let ((differences (load-exchange-gold-differences))
        (mics (%exchange-gold-mics)))
    (dolist (row differences)
      (ok (and (stringp (getf row :why)) (stringp (getf row :source)))
          (format nil "~a ~a cited" (getf row :mic) (getf row :date)))
      (ok (member (getf row :mic) mics :test #'string=)
          (format nil "~a has a gold" (getf row :mic))))
    (dolist (mic mics)
      (let ((mismatches (nth-value 1 (compare-exchange-with-gold mic))))
        (dolist (row differences)
          (when (and (string= (getf row :mic) mic) (getf row :date))
            (ok (find-if (lambda (m)
                           (and (equal (first m) (getf row :date))
                                (eq (second m) (getf row :kind))))
                         mismatches)
                (format nil "~a ~a ~a still differs" mic (getf row :date)
                        (getf row :kind)))))))))
