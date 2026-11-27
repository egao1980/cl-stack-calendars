(in-package #:cl-stack-calendars/logic)

;;;; Per-year materialisation with a cache, and the protocol-shaped queries.
;;;;
;;;; One logic-protocol program per (calendar, year): the year window's base
;;;; facts plus the calendar's rule modules. Its model is read once into
;;;; hash tables; HOLIDAY-P and BUSINESS-DAY-P are then hash lookups. The
;;;; program is kept for EXPLAIN.

(defstruct (year-model (:constructor %make-year-model))
  (year 0 :type integer)
  program
  (holidays (make-hash-table :test 'eql) :type hash-table)   ; RD → names
  (business (make-hash-table :test 'eql) :type hash-table))  ; RD → T

(defun %make-cache-table (test)
  #+sbcl (make-hash-table :test test :synchronized t
                          :weakness (if (eq test 'eq) :key nil))
  #-sbcl (make-hash-table :test test))

(defvar *year-models* (%make-cache-table 'eq)
  "CALENDAR → (YEAR → YEAR-MODEL). Weak on the calendar under SBCL.")

(defvar *module-rules* (%make-cache-table 'equal)
  "List of module names → parsed RULE objects (parsed once).")

(defun clear-logic-cache ()
  (clrhash *year-models*)
  (clrhash *module-rules*))

(defun %rules-for (modules)
  (or (gethash modules *module-rules*)
      (setf (gethash modules *module-rules*)
            (loop for m in modules append (module-rules m)))))

(defun %read-model (program year)
  (let ((model (%make-year-model :year year :program program)))
    (multiple-value-bind (lo hi)
        (values (dt:date-rd (dt:make-date year 1 1))
                (dt:date-rd (dt:make-date year 12 31)))
      (dolist (f (lp:program-facts program :relation 'holiday))
        (destructuring-bind (rd name) (rest f)
          (when (<= lo rd hi)
            (push name (gethash rd (year-model-holidays model))))))
      (dolist (f (lp:program-facts program :relation 'business-day))
        (let ((rd (second f)))
          (when (<= lo rd hi)
            (setf (gethash rd (year-model-business model)) t)))))
    (maphash (lambda (rd names)
               (setf (gethash rd (year-model-holidays model))
                     (sort (remove-duplicates names :test #'string=) #'string<)))
             (year-model-holidays model))
    model))

(defun build-year-model (calendar year &key keep-program)
  "A fresh YEAR-MODEL for CALENDAR (a RULE-CALENDAR) and YEAR. The program
(several MB of indexed facts) is kept only with KEEP-PROGRAM, for EXPLAIN;
the cache holds the two small tables."
  (let* ((facts (calendar-year-facts calendar year))
         (modules (calendar-rule-modules calendar facts))
         (program (lp:make-program :rules (%rules-for modules) :facts facts))
         (model (%read-model program year)))
    (unless keep-program
      (setf (year-model-program model) nil))
    model))

(defun calendar-year-model (calendar year)
  "The cached YEAR-MODEL of CALENDAR for YEAR. Calendars are treated as
immutable: after a SETF of a calendar slot, call CLEAR-LOGIC-CACHE."
  (let ((years (or (gethash calendar *year-models*)
                   (setf (gethash calendar *year-models*) (%make-cache-table 'eql)))))
    (or (gethash year years)
        (setf (gethash year years) (build-year-model calendar year)))))

(defun %names-value (names)
  (when names (format nil "~{~a~^ / ~}" (remove "" names :test #'string=))))

(defun logic-holiday-p (calendar date)
  "As CL-STACK-CALENDARS:HOLIDAY-P, from the logic model. Coinciding
holidays keep every name, joined with \" / \"."
  (let ((names (gethash (dt:date-rd date)
                        (year-model-holidays (calendar-year-model calendar (dt:date-year date))))))
    (if names
        (values t (let ((v (%names-value names))) (if (equal v "") nil v)))
        (values nil nil))))

(defun logic-business-day-p (calendar date)
  "As CL-STACK-CALENDARS:BUSINESS-DAY-P, from the logic model."
  (values (gethash (dt:date-rd date)
                   (year-model-business (calendar-year-model calendar (dt:date-year date))))))

(defun logic-holidays-between (calendar start end)
  "As CL-STACK-CALENDARS:HOLIDAYS-BETWEEN: HOLIDAY-OBSERVANCEs in [START, END],
by date, one year model at a time."
  (let ((lo (dt:date-rd start)) (hi (dt:date-rd end)) (out '()))
    (loop for y from (dt:date-year start) to (dt:date-year end)
          do (let ((table (year-model-holidays (calendar-year-model calendar y))))
               (maphash (lambda (rd names)
                          (when (<= lo rd hi)
                            (push (cons rd names) out)))
                        table)))
    (loop for (rd . names) in (sort out #'< :key #'car)
          collect (cal:make-holiday-observance (dt:date-from-rd rd) (%names-value names)))))

;;; --- explanations ---------------------------------------------------------

(defun proof-authorities (proof)
  "The distinct :AUTHORITY citations of the rules PROOF used, outermost first."
  (let ((out '()))
    (labels ((walk (p)
               (let ((r (lp:proof-rule p)))
                 (when r
                   (let ((a (getf (lp:rule-properties r) :authority)))
                     (dolist (x (if (listp a) a (list a)))
                       (pushnew x out :test #'equal))))
                 (mapc #'walk (lp:proof-premises p)))))
      (walk proof))
    (nreverse out)))

(defun logic-explain-holiday (calendar date)
  "For each holiday name on DATE, (NAME PROOF AUTHORITIES). Rebuilds the
year's program (the cache does not keep programs). For a date that is not a
holiday, call LOGIC-PROTOCOL:EXPLAIN on (YEAR-MODEL-PROGRAM (BUILD-YEAR-MODEL
CALENDAR YEAR :KEEP-PROGRAM T)) for its WHY-NOT."
  (let* ((rd (dt:date-rd date))
         (model (build-year-model calendar (dt:date-year date) :keep-program t))
         (program (year-model-program model)))
    (loop for name in (gethash rd (year-model-holidays model))
          for proof = (lp:explain program (list 'holiday rd name))
          collect (list name proof (proof-authorities proof)))))

;;; --- composite calendars (#29) -------------------------------------------

(defun %member-year (calendar year)
  "(HOLIDAYS BUSINESS) tables for one constituent: its logic model when it
is a RULE-CALENDAR, else the protocol's HOLIDAY-P / BUSINESS-DAY-P."
  (if (typep calendar 'cal::rule-calendar)
      (let ((m (calendar-year-model calendar year)))
        (values (year-model-holidays m) (year-model-business m)))
      (let ((h (make-hash-table)) (b (make-hash-table)))
        (loop for rd from (dt:date-rd (dt:make-date year 1 1))
                to (dt:date-rd (dt:make-date year 12 31))
              for d = (dt:date-from-rd rd)
              do (multiple-value-bind (hp name) (cal:holiday-p calendar d)
                   (when hp (setf (gethash rd h) (list (or name "")))))
                 (when (cal:business-day-p calendar d) (setf (gethash rd b) t)))
        (values h b))))

(defun composite-year-model (calendars mode year)
  "A YEAR-MODEL for the composite of CALENDARS under MODE (:UNION or
:INTERSECTION), with the rule module :COMPOSITE-UNION / -INTERSECTION."
  (let ((facts '()))
    (loop for rd from (dt:date-rd (dt:make-date year 1 1)) to (dt:date-rd (dt:make-date year 12 31))
          do (push (list 'day rd) facts))
    (loop for c in calendars
          for i from 0
          do (push (list 'constituent i) facts)
             (multiple-value-bind (h b) (%member-year c year)
               (maphash (lambda (rd names)
                          (dolist (n names) (push (list 'member-holiday i rd n) facts)))
                        h)
               (maphash (lambda (rd v) (declare (ignore v))
                          (push (list 'member-business i rd) facts))
                        b)))
    (%read-model (lp:make-program
                  :rules (%rules-for (list (ecase mode
                                             (:union :composite-union)
                                             (:intersection :composite-intersection))))
                  :facts facts)
                 year)))

(defun logic-composite-holiday-p (calendars mode date)
  (let ((names (gethash (dt:date-rd date)
                        (year-model-holidays (composite-year-model calendars mode (dt:date-year date))))))
    (if names (values t (%names-value names)) (values nil nil))))

(defun logic-composite-business-day-p (calendars mode date)
  (values (gethash (dt:date-rd date)
                   (year-model-business (composite-year-model calendars mode (dt:date-year date))))))
