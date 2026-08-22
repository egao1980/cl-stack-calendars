(in-package #:cl-stack-calendars)

;;;; Population-ordered normative coverage index.

(defparameter *formation-years-path*
  (merge-pathnames "data/formation-years.sexp"
                   (asdf:system-source-directory "cl-stack-calendars")))

(defparameter *population-order-path*
  (merge-pathnames "data/population-order.sexp"
                   (asdf:system-source-directory "cl-stack-calendars")))

(defun load-formation-years (&optional (path *formation-years-path*))
  "Alist CODE → (YEAR . NOTE)."
  (with-open-file (in path)
    (mapcar (lambda (row)
              (destructuring-bind (code year note) row
                (cons code (cons year note))))
            (read in))))

(defvar *formation-years* nil)

(defun formation-years ()
  (or *formation-years*
      (setf *formation-years* (load-formation-years))))

(defun country-formation-year (code)
  "Independence / modern-state year for CODE, or NIL."
  (car (cdr (assoc code (formation-years) :test #'string=))))

(defun civil-research-from-year (code)
  "Start of the normative research window for CODE: max(1900, formation)."
  (max 1900 (or (country-formation-year code) 1900)))

(defun civil-from-year (code &optional introduced-year)
  "Rule :FROM year: INTRODUCED-YEAR if the holiday was created later than the
research window start; otherwise CIVIL-RESEARCH-FROM-YEAR."
  (let ((floor (civil-research-from-year code)))
    (if introduced-year (max floor introduced-year) floor)))

(defun load-population-order (&optional (path *population-order-path*))
  "List of (CODE POPULATION-MILLIONS NAME) in descending population order."
  (with-open-file (in path) (read in)))

(defvar *population-order* nil)

(defun population-order ()
  (or *population-order*
      (setf *population-order* (load-population-order))))

(defun normative-calendar-codes ()
  "ISO / registry codes that have hand-maintained DEFINE-CALENDAR starters
(not the date-holidays corpus)."
  (remove-if (lambda (c)
               (typep (find-calendar c :errorp nil) 'country-holiday-calendar))
             (list-registered-calendars)))

(defun normative-coverage-by-population ()
  "Alist (CODE POP NAME :status :normative|:corpus|:missing) in population order."
  (mapcar
   (lambda (row)
     (destructuring-bind (code pop name) row
       (let* ((cal (find-calendar code :errorp nil))
              (status (cond ((null cal) :missing)
                            ((typep cal 'country-holiday-calendar) :corpus)
                            (t :normative))))
         (list code pop name :status status))))
   (population-order)))

(defun next-normative-gaps (&optional (n 20))
  "First N population-ordered codes still on corpus or missing."
  (let ((out '()))
    (dolist (row (normative-coverage-by-population))
      (unless (eq (getf (cdddr row) :status) :normative)
        (push row out)
        (when (>= (length out) n)
          (return))))
    (nreverse out)))

(defun %holiday-rule-from-year (rule)
  "Year component of a rule's :FROM bound, or NIL."
  (let ((from (holiday-rule-from rule)))
    (cond ((null from) nil)
          ((integerp from) from)
          ((typep from 'date) (date-year from))
          (t nil))))

(defun calendar-earliest-from-year (calendar)
  "Earliest :FROM year among RULE-CALENDAR rules, or NIL."
  (when (typep calendar 'rule-calendar)
    (let ((years (remove nil (mapcar #'%holiday-rule-from-year
                                     (calendar-rules calendar)))))
      (when years (reduce #'min years)))))

(defun major-history-gaps (&optional (min-population 50))
  "Population-ordered ≥MIN-POPULATION normative codes whose earliest rule
:FROM is more than 5 years after CIVIL-RESEARCH-FROM-YEAR (history hole)."
  (let ((out '()))
    (dolist (row (normative-coverage-by-population))
      (destructuring-bind (code pop name &key status) row
        (when (and (>= pop min-population) (eq status :normative))
          (let* ((cal (find-calendar code :errorp nil))
                 (floor (civil-research-from-year code))
                 (earliest (calendar-earliest-from-year cal)))
            (when (and earliest (> (- earliest floor) 5))
              (push (list code pop name :floor floor :earliest earliest
                          :gap (- earliest floor))
                    out))))))
    (nreverse out)))
