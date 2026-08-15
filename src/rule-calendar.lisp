(in-package #:cl-stack-calendars)

(defclass rule-calendar (holiday-calendar)
  ((name :initarg :name :initform nil :accessor calendar-name)
   (weekend-days :initarg :weekend-days :initform '(6 7) :accessor calendar-weekend-days)
   (rules :initarg :rules :initform nil :accessor calendar-rules))
  (:documentation "A HOLIDAY-CALENDAR driven by a declarative list of holiday
RULES (fixed dates, nth-weekday-of-month, Easter offsets) — normally built via
DEFINE-CALENDAR."))

(defun %rule-calendar-year-map (calendar year)
  "Hash-table RD → holiday name for all RULE occurrences in YEAR, applying
exclusive observance so later rules skip dates claimed by earlier ones."
  (let ((weekend-days (calendar-weekend-days calendar))
        (claimed '())
        (map (make-hash-table :test #'eql)))
    (dolist (rule (calendar-rules calendar))
      (let ((dates (rule-occurrences rule year weekend-days claimed)))
        (dolist (d dates)
          (setf (gethash (date-rd d) map) (or (holiday-rule-name rule) t))
          (push d claimed))))
    map))

(defmethod holiday-p ((calendar rule-calendar) date)
  (let ((year (date-year date)))
    ;; Observance / bridge / exclusive-next can move a rule's dates into an
    ;; adjacent year (NYD Sat→prior Fri; Christmas+Boxing into early January).
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
matching holiday-rule struct."
    (destructuring-bind (kind &rest args) clause
      (ecase kind
        (:fixed
         (destructuring-bind (name month day &key observed bridge from to) args
           `(make-fixed-holiday-rule :name ,name :month ,month :day ,day
                                      :observed ,observed :bridge ,bridge
                                      :from ,(%bound-form from)
                                      :to ,(%bound-form to))))
        (:nth-weekday
         (destructuring-bind (name month weekday nth &key observed bridge from to) args
           `(make-nth-weekday-holiday-rule :name ,name :month ,month
                                            :weekday (normalize-weekday ,weekday)
                                            :nth ,nth
                                            :observed ,observed :bridge ,bridge
                                            :from ,(%bound-form from)
                                            :to ,(%bound-form to))))
        (:easter
         (destructuring-bind (name offset &key orthodox observed bridge from to) args
           `(make-easter-holiday-rule :name ,name :offset ,offset :orthodox ,orthodox
                                       :observed ,observed :bridge ,bridge
                                       :from ,(%bound-form from)
                                       :to ,(%bound-form to))))))))

(defmacro define-calendar (name (&key register (weekend-days ''(6 7))) &body rules)
  "Define NAME as a RULE-CALENDAR subclass built from RULES clauses:

  (:fixed NAME MONTH DAY &key OBSERVED BRIDGE FROM TO)
  (:nth-weekday NAME MONTH WEEKDAY NTH &key OBSERVED BRIDGE FROM TO)
  (:easter NAME OFFSET &key ORTHODOX OBSERVED BRIDGE FROM TO)

OBSERVED rearranges a holiday that coincides with a weekend:

  NIL                 celebrate the nominal date only
  :NEAREST-WEEKDAY    US federal move (Sat→Fri, Sun→Mon)
  :NEXT-WEEKDAY       move to the next free weekday (exclusive vs earlier rules)
  :PREVIOUS-WEEKDAY   move to the previous weekday
  :MONDAY             Commonwealth Mondayise (Sat/Sun → following free Monday)
  :SUBSTITUTE-NEXT    keep the nominal date and add the next free weekday
                      (Japan 振替休日 style)

BRIDGE grows a continuous holiday season around an observed weekday:

  :ADJACENT           Tuesday → also Monday; Thursday → also Friday (puente)

FROM/TO are the civil validity window (year integer, (Y M D), or NIL).
Rules are applied in order; :NEXT-WEEKDAY/:MONDAY/:SUBSTITUTE-NEXT skip
dates already claimed so Christmas+Boxing don't collapse onto one Monday.

WEEKEND-DAYS defaults to '(6 7). :REGISTER (string) also REGISTER-CALENDAR's
an instance."
  `(progn
     (defclass ,name (rule-calendar) ()
       (:default-initargs
        :name ,(string name)
        :weekend-days ,weekend-days
        :rules (list ,@(mapcar #'%holiday-rule-constructor-form rules))))
     ,@(when register
         `((register-calendar ,register (make-instance ',name))))
     ',name))
