(in-package #:cl-stack-calendars)

;;;; Infer fixed / Easter rules from country-holiday corpus data and register
;;;; normative RULE-CALENDAR starters for codes without hand-maintained starters.

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
                     :authority "Corpus-inferred fixed statutory day"))))

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
                     :authority "Inferred movable Christian holiday from corpus"))))

(defun infer-rules-from-corpus (code &key (from-year 2000))
  "Infer FIXED + EASTER rules for CODE from shipped country corpus."
  (let* ((days (%corpus-days code))
         (fixed (%infer-fixed-rules days :from-year from-year))
         (easter (%infer-easter-rules days :from-year from-year))
         (fixed-keys (mapcar (lambda (r)
                               (cons (fixed-holiday-rule-month r)
                                     (fixed-holiday-rule-day r)))
                             fixed)))
    (let ((easter (remove-if (lambda (r)
                               (let ((nom (rule-nominal-date r 2024)))
                                 (when nom
                                   (member (cons (date-month nom) (date-day nom))
                                           fixed-keys :test #'equal))))
                             easter)))
      (append fixed easter))))

(defun make-corpus-inferred-calendar (code)
  (let* ((cc (string-upcase code))
         (days (%corpus-days cc))
         (floor (civil-research-from-year cc))
         (infer-from (max 2000 floor))
         (rules (when days (infer-rules-from-corpus cc :from-year infer-from)))
         (plist (when (data-file-exists-p (%country-data-path cc))
                  (%load-country-plist cc))))
    (when rules
      (dolist (rule rules)
        (setf (holiday-rule-from rule) floor)
        (setf (holiday-rule-authority rule)
              (format nil "Corpus-inferred statutory rule — ~a"
                      (or (and plist (getf plist :source)) "date-holidays"))))
      (make-instance 'rule-calendar
                     :name (or (and plist (getf plist :name)) cc)
                     :rules rules))))

(defun register-corpus-inferred-territory-starters ()
  "Register normative starters for corpus-only country codes."
  (dolist (entry (list-country-calendars))
    (let ((code (first entry)))
      (unless (find-calendar code :errorp nil)
        (let ((cal (make-corpus-inferred-calendar code)))
          (when cal
            (register-calendar code cal)))))))
