(in-package #:cl-stack-calendars)

(defclass rule-calendar (holiday-calendar)
  ((name :initarg :name :initform nil :accessor calendar-name)
   (weekend-days :initarg :weekend-days :initform '(6 7) :accessor calendar-weekend-days)
   (rules :initarg :rules :initform nil :accessor calendar-rules)
   ;; 祝日法第3条第3項 (and analogues): insert weekdays sandwiched by holidays.
   (sandwich-holidays-p :initarg :sandwich-holidays-p :initform nil
                        :accessor calendar-sandwich-holidays-p)
   (sandwich-authority :initarg :sandwich-authority :initform nil
                       :accessor calendar-sandwich-authority)
   ;; Year/date from which sandwich applies (e.g. JP Art. 3(3) from 1985).
   (sandwich-from :initarg :sandwich-from :initform nil
                  :accessor calendar-sandwich-from)
   ;; Decree transfers: TO dates become holidays (перенос выходных).
   (transfers :initarg :transfers :initform nil :accessor calendar-transfers)
   ;; Compensatory working Saturdays/Sundays (override weekend-day-p).
   (working-days :initarg :working-days :initform nil :accessor calendar-working-days)
   ;; Dates that rules would mark as holidays but a proclamation/decree
   ;; suppressed or moved (e.g. UK Spring BH relocated for a Jubilee).
   (suppressed-dates :initarg :suppressed-dates :initform nil
                     :accessor calendar-suppressed-dates))
  (:documentation "A HOLIDAY-CALENDAR driven by a declarative list of holiday
RULES — normally built via DEFINE-CALENDAR. Observance policies on rules must
cite their normative authority (:AUTHORITY). TRANSFERS encode annual Government
decree weekend moves; WORKING-DAYS encode compensatory work weekends;
SUPPRESSED-DATES remove rule holidays relocated by proclamation."))

(defmethod weekend-day-p ((calendar rule-calendar) date)
  (and (member (date-day-of-week date) (calendar-weekend-days calendar))
       (not (find date (calendar-working-days calendar)
                  :key #'calendar-working-day-date :test #'=))
       t))

(defun %suppressed-date-p (calendar date)
  (find date (calendar-suppressed-dates calendar) :test #'=))

(defun %rule-calendar-year-map (calendar year)
  "Hash-table RD → holiday name for all RULE occurrences in YEAR, applying
exclusive observance, optional sandwich days, and decree TRANSFERS whose
TO date falls in YEAR (or adjacent for Dec 31 ↔ Jan moves)."
  (let ((weekend-days (calendar-weekend-days calendar))
        (claimed '())
        (pairs '()))
    (dolist (rule (calendar-rules calendar))
      (let ((dates (rule-occurrences rule year weekend-days claimed)))
        (dolist (d dates)
          (unless (%suppressed-date-p calendar d)
            (push (cons d (or (holiday-rule-name rule) t)) pairs)
            (push d claimed)))))
    (when (and (calendar-sandwich-holidays-p calendar)
               (let ((sf (calendar-sandwich-from calendar)))
                 (cond ((null sf) t)
                       ((integerp sf) (>= year sf))
                       (t t))))
      (setf pairs (apply-sandwich-holidays pairs)))
    (dolist (tr (calendar-transfers calendar))
      (let ((to (calendar-transfer-to tr)))
        (when (and to
                   (<= (1- year) (date-year to) (1+ year))
                   (not (%suppressed-date-p calendar to)))
          (push (cons to (or (calendar-transfer-name tr) "перенос выходного")) pairs)
          (push to claimed))))
    (let ((map (make-hash-table :test #'eql)))
      (dolist (pair pairs)
        (setf (gethash (date-rd (car pair)) map) (cdr pair)))
      map)))

(defmethod holiday-p ((calendar rule-calendar) date)
  (when (%suppressed-date-p calendar date)
    (return-from holiday-p (values nil nil)))
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
         (destructuring-bind (name month day &key observed observed-from bridge from to authority) args
           `(make-fixed-holiday-rule :name ,name :month ,month :day ,day
                                      :observed ,observed
                                      :observed-from ,(%bound-form observed-from)
                                      :bridge ,bridge
                                      :authority ',authority
                                      :from ,(%bound-form from)
                                      :to ,(%bound-form to))))
        (:nth-weekday
         (destructuring-bind (name month weekday nth &key observed observed-from bridge from to authority) args
           `(make-nth-weekday-holiday-rule :name ,name :month ,month
                                            :weekday (normalize-weekday ,weekday)
                                            :nth ,nth
                                            :observed ,observed
                                            :observed-from ,(%bound-form observed-from)
                                            :bridge ,bridge
                                            :authority ',authority
                                            :from ,(%bound-form from)
                                            :to ,(%bound-form to))))
        (:easter
         (destructuring-bind (name offset &key orthodox observed observed-from bridge from to authority) args
           `(make-easter-holiday-rule :name ,name :offset ,offset :orthodox ,orthodox
                                       :observed ,observed
                                       :observed-from ,(%bound-form observed-from)
                                       :bridge ,bridge
                                       :authority ',authority
                                       :from ,(%bound-form from)
                                       :to ,(%bound-form to))))
        (:computed
         (destructuring-bind (name compute &key observed observed-from bridge from to authority) args
           `(make-computed-holiday-rule :name ,name :compute ,compute
                                         :observed ,observed
                                         :observed-from ,(%bound-form observed-from)
                                         :bridge ,bridge
                                         :authority ',authority
                                         :from ,(%bound-form from)
                                         :to ,(%bound-form to))))))))

(defmacro define-calendar (name (&key register (weekend-days ''(6 7))
                                   sandwich-holidays-p sandwich-authority
                                   sandwich-from)
                           &body rules)
  "Define NAME as a RULE-CALENDAR subclass from RULES.

Each clause:

  (:fixed NAME MONTH DAY &key OBSERVED OBSERVED-FROM BRIDGE FROM TO AUTHORITY)
  (:nth-weekday NAME MONTH WEEKDAY NTH &key OBSERVED OBSERVED-FROM BRIDGE FROM TO AUTHORITY)
  (:easter NAME OFFSET &key ORTHODOX OBSERVED OBSERVED-FROM BRIDGE FROM TO AUTHORITY)
  (:computed NAME COMPUTE &key OBSERVED OBSERVED-FROM BRIDGE FROM TO AUTHORITY)
    ;; COMPUTE is a form evaluating to (YEAR) → DATE (equinoxes, Chinese lunar, …)

AUTHORITY is the normative citation (statute, EO, ECB decision, proclamation).
It is the source of truth for civil :FROM/:TO and for OBSERVED rearrangements.

Statute-named OBSERVED (prefer these):

  :US-FEDERAL-IN-LIEU          5 U.S.C. § 6103(b) + EO 11582 § 3(a)
  :UK-PROCLAMATION-SUBSTITUTE  BFDA 1971 + Royal Proclamations / gov.uk
  :JP-FURIKAE                  祝日法第3条第2項 (Sunday only)
  :RU-TK-112-TRANSFER          ТК РФ ст. 112 ч. 2 (except Jan 1–8)

:OBSERVED-FROM limits when OBSERVED applies (year or date) — e.g. JP 振替 from 1973.

Mechanical primitives (:NEAREST-WEEKDAY, :NEXT-WEEKDAY, …) are implementation
atoms — do not use them in starters without an AUTHORITY that implies them.

:BRIDGE :ADJACENT is not a general legal default; only with AUTHORITY.

:SANDWICH-HOLIDAYS-P with :SANDWICH-AUTHORITY enables 祝日法第3条第3項-style
weekdays sandwiched between two holidays. :SANDWICH-FROM (year) bounds when
sandwich applies (JP Art. 3(3) from 1985).

Annual Government decree transfers are attached at instance time via
CALENDAR-TRANSFERS / MAKE-RUSSIAN-HOLIDAYS-CALENDAR — not in this macro."
  `(progn
     (defclass ,name (rule-calendar) ()
       (:default-initargs
        :name ,(string name)
        :weekend-days ,weekend-days
        :sandwich-holidays-p ,sandwich-holidays-p
        :sandwich-authority ',sandwich-authority
        :sandwich-from ,(%bound-form sandwich-from)
        :rules (list ,@(mapcar #'%holiday-rule-constructor-form rules))))
     ,@(when register
         `((register-calendar ,register (make-instance ',name))))
     ',name))
