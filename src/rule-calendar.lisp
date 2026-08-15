(in-package #:cl-stack-calendars)

(defclass rule-calendar (holiday-calendar)
  ((name :initarg :name :initform nil :accessor calendar-name)
   (weekend-days :initarg :weekend-days :initform '(6 7) :accessor calendar-weekend-days)
   (rules :initarg :rules :initform nil :accessor calendar-rules))
  (:documentation "A HOLIDAY-CALENDAR driven by a declarative list of holiday
RULES (fixed dates, nth-weekday-of-month, Easter offsets) — normally built via
DEFINE-CALENDAR."))

(defmethod holiday-p ((calendar rule-calendar) date)
  (let ((year (date-year date))
        (weekend-days (calendar-weekend-days calendar)))
    (dolist (rule (calendar-rules calendar))
      ;; An :OBSERVED shift (or, in principle, an Easter offset near a year
      ;; boundary) can move a rule's occurrence into the adjacent year, so a
      ;; rule "for" year Y-1 or Y+1 may still land on a date in year Y — most
      ;; famously New Year's Day (Jan 1) shifting back to Dec 31 of the prior
      ;; year when Jan 1 is a Saturday.
      (dolist (y (list (1- year) year (1+ year)))
        (let ((occurrence (rule-occurrence rule y weekend-days)))
          (when (and occurrence (= occurrence date))
            (return-from holiday-p (values t (holiday-rule-name rule)))))))
    (values nil nil)))

;;; --- DEFINE-CALENDAR DSL -----------------------------------------------

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun %holiday-rule-constructor-form (clause)
    "Compile one DEFINE-CALENDAR rule CLAUSE into a form that builds the
matching holiday-rule struct."
    (destructuring-bind (kind &rest args) clause
      (ecase kind
        (:fixed
         (destructuring-bind (name month day &key observed from to) args
           `(make-fixed-holiday-rule :name ,name :month ,month :day ,day
                                      :observed ,observed :from ,from :to ,to)))
        (:nth-weekday
         (destructuring-bind (name month weekday nth &key from to) args
           `(make-nth-weekday-holiday-rule :name ,name :month ,month
                                            :weekday (normalize-weekday ,weekday)
                                            :nth ,nth :from ,from :to ,to)))
        (:easter
         (destructuring-bind (name offset &key orthodox from to) args
           `(make-easter-holiday-rule :name ,name :offset ,offset :orthodox ,orthodox
                                       :from ,from :to ,to)))))))

(defmacro define-calendar (name (&key register (weekend-days ''(6 7))) &body rules)
  "Define NAME as a RULE-CALENDAR subclass built from RULES clauses:

  (:fixed NAME MONTH DAY &key OBSERVED FROM TO)
    A fixed month/day holiday (e.g. Christmas). OBSERVED is NIL (default),
    :NEAREST-WEEKDAY (US-style: Saturday->Friday, Sunday->Monday),
    :NEXT-WEEKDAY (UK-style: shift forward past the weekend), or
    :PREVIOUS-WEEKDAY (shift backward past the weekend).

  (:nth-weekday NAME MONTH WEEKDAY NTH &key FROM TO)
    The NTH (1-5, or -1 for last) WEEKDAY (1-7, or a keyword like :MONDAY)
    of MONTH — e.g. (:nth-weekday \"Memorial Day\" 5 :monday -1).

  (:easter NAME OFFSET &key ORTHODOX FROM TO)
    OFFSET days from Western (or, if ORTHODOX, Orthodox) Easter Sunday —
    e.g. (:easter \"Good Friday\" -2).

FROM/TO (on any clause) restrict the rule to years >= FROM and/or <= TO
(default: unbounded in both directions). WEEKEND-DAYS is a form evaluating to
a list of ISO weekday numbers (1=Monday..7=Sunday); default '(6 7). When
:REGISTER is given (a string), an instance is also REGISTER-CALENDAR'd under
that name.

Expands to a DEFCLASS of NAME (a subclass of RULE-CALENDAR); (MAKE-INSTANCE
'NAME) builds a working calendar."
  `(progn
     (defclass ,name (rule-calendar) ()
       (:default-initargs
        :name ,(string name)
        :weekend-days ,weekend-days
        :rules (list ,@(mapcar #'%holiday-rule-constructor-form rules))))
     ,@(when register
         `((register-calendar ,register (make-instance ',name))))
     ',name))
