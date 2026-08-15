(in-package #:cl-stack-calendars)

(defclass rule-calendar (holiday-calendar)
  ((name :initarg :name :initform nil :accessor calendar-name)
   (weekend-days :initarg :weekend-days :initform '(6 7) :accessor calendar-weekend-days)
   (rules :initarg :rules :initform nil :accessor calendar-rules)
   ;; 祝日法第3条第3項 (and analogues): insert weekdays sandwiched by holidays.
   (sandwich-holidays-p :initarg :sandwich-holidays-p :initform nil
                        :accessor calendar-sandwich-holidays-p)
   (sandwich-authority :initarg :sandwich-authority :initform nil
                       :accessor calendar-sandwich-authority))
  (:documentation "A HOLIDAY-CALENDAR driven by a declarative list of holiday
RULES — normally built via DEFINE-CALENDAR. Observance policies on rules must
cite their normative authority (:AUTHORITY)."))

(defun %rule-calendar-year-map (calendar year)
  "Hash-table RD → holiday name for all RULE occurrences in YEAR, applying
exclusive observance so later rules skip dates claimed by earlier ones.
When CALENDAR-SANDWICH-HOLIDAYS-P, also apply 祝日法-style sandwiched days."
  (let ((weekend-days (calendar-weekend-days calendar))
        (claimed '())
        (pairs '()))
    (dolist (rule (calendar-rules calendar))
      (let ((dates (rule-occurrences rule year weekend-days claimed)))
        (dolist (d dates)
          (push (cons d (or (holiday-rule-name rule) t)) pairs)
          (push d claimed))))
    (when (calendar-sandwich-holidays-p calendar)
      (setf pairs (apply-sandwich-holidays pairs)))
    (let ((map (make-hash-table :test #'eql)))
      (dolist (pair pairs)
        (setf (gethash (date-rd (car pair)) map) (cdr pair)))
      map)))

(defmethod holiday-p ((calendar rule-calendar) date)
  (let ((year (date-year date)))
    (dolist (y (list (1- year) year (1+ year)))
      (let ((name (gethash (date-rd date) (%rule-calendar-year-map calendar y))))
        (when name
          (return-from holiday-p (values t (unless (eq name t) name))))))
    (values nil nil)))

;;; --- DEFINE-CALENDAR DSL -----------------------------------------------

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun %bound-form (bound)
    "Compile :FROM/:TO: year integer, (Y M D) list → MAKE-DATE, or NIL."
    (cond ((null bound) nil)
          ((integerp bound) bound)
          ((and (consp bound) (= (length bound) 3) (every #'integerp bound))
           `(make-date ,@bound))
          (t `(normalize-rule-bound ,bound))))

  (defun %holiday-rule-constructor-form (clause)
    "Compile one DEFINE-CALENDAR rule CLAUSE into a form that builds the
matching holiday-rule struct. :AUTHORITY is required for observed/bridge
rearrangements in starter calendars (normative source of truth)."
    (destructuring-bind (kind &rest args) clause
      (ecase kind
        (:fixed
         (destructuring-bind (name month day &key observed bridge from to authority) args
           `(make-fixed-holiday-rule :name ,name :month ,month :day ,day
                                      :observed ,observed :bridge ,bridge
                                      :authority ',authority
                                      :from ,(%bound-form from)
                                      :to ,(%bound-form to))))
        (:nth-weekday
         (destructuring-bind (name month weekday nth &key observed bridge from to authority) args
           `(make-nth-weekday-holiday-rule :name ,name :month ,month
                                            :weekday (normalize-weekday ,weekday)
                                            :nth ,nth
                                            :observed ,observed :bridge ,bridge
                                            :authority ',authority
                                            :from ,(%bound-form from)
                                            :to ,(%bound-form to))))
        (:easter
         (destructuring-bind (name offset &key orthodox observed bridge from to authority) args
           `(make-easter-holiday-rule :name ,name :offset ,offset :orthodox ,orthodox
                                       :observed ,observed :bridge ,bridge
                                       :authority ',authority
                                       :from ,(%bound-form from)
                                       :to ,(%bound-form to))))))))

(defmacro define-calendar (name (&key register (weekend-days ''(6 7))
                                   sandwich-holidays-p sandwich-authority)
                           &body rules)
  "Define NAME as a RULE-CALENDAR subclass from RULES.

Each clause:

  (:fixed NAME MONTH DAY &key OBSERVED BRIDGE FROM TO AUTHORITY)
  (:nth-weekday NAME MONTH WEEKDAY NTH &key OBSERVED BRIDGE FROM TO AUTHORITY)
  (:easter NAME OFFSET &key ORTHODOX OBSERVED BRIDGE FROM TO AUTHORITY)

AUTHORITY is the normative citation (statute, EO, ECB decision, proclamation).
It is the source of truth for civil :FROM/:TO and for OBSERVED rearrangements.

Statute-named OBSERVED (prefer these):

  :US-FEDERAL-IN-LIEU          5 U.S.C. § 6103(b) + EO 11582 § 3(a)
  :UK-PROCLAMATION-SUBSTITUTE  BFDA 1971 + Royal Proclamations / gov.uk
  :JP-FURIKAE                  祝日法第3条第2項 (Sunday only)

Mechanical primitives (:NEAREST-WEEKDAY, :NEXT-WEEKDAY, …) are implementation
atoms — do not use them in starters without an AUTHORITY that implies them.

:BRIDGE :ADJACENT is not a general legal default; only with AUTHORITY.

:SANDWICH-HOLIDAYS-P with :SANDWICH-AUTHORITY enables 祝日法第3条第3項-style
weekdays sandwiched between two holidays."
  `(progn
     (defclass ,name (rule-calendar) ()
       (:default-initargs
        :name ,(string name)
        :weekend-days ,weekend-days
        :sandwich-holidays-p ,sandwich-holidays-p
        :sandwich-authority ',sandwich-authority
        :rules (list ,@(mapcar #'%holiday-rule-constructor-form rules))))
     ,@(when register
         `((register-calendar ,register (make-instance ',name))))
     ',name))
