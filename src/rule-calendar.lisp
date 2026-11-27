(in-package #:cl-stack-calendars)

(defun %make-calendar-cache ()
  "A hash table safe for concurrent readers and writers (SBCL :SYNCHRONIZED).
Entries are computed outside any lock; two threads that race on a missing
year compute equal maps, and the later write wins."
  #+sbcl (make-hash-table :test #'eql :synchronized t)
  #-sbcl (make-hash-table :test #'eql))

(defmacro %cached ((calendar key) &body compute)
  "The cache entry KEY of rule CALENDAR, computed by COMPUTE when missing."
  (let ((cache (gensym "CACHE")) (k (gensym "KEY")) (v (gensym "V")) (hit (gensym "HIT")))
    `(let ((,cache (%rule-calendar-cache ,calendar))
           (,k ,key))
       (multiple-value-bind (,v ,hit) (gethash ,k ,cache)
         (if ,hit
             ,v
             (setf (gethash ,k ,cache) (progn ,@compute)))))))

(defun %date-set (dates &key (key #'identity))
  (let ((set (make-hash-table :test #'eql)))
    (dolist (d dates set)
      (setf (gethash (date-rd (funcall key d)) set) t))))

(defclass rule-calendar (weekend-spec-mixin holiday-calendar)
  ((name :initarg :name :initform nil :accessor calendar-name)
   ;; Year → holiday map, plus working-day / suppressed-date sets (#34).
   ;; Replaced (never cleared in place) when a SETF accessor changes inputs.
   (cache :initform (%make-calendar-cache) :accessor %rule-calendar-cache)
   (rules :initarg :rules :initform nil :accessor calendar-rules)
   ;; 祝日法第3条第3項 (and analogues): insert weekdays sandwiched by holidays.
   (sandwich-holidays-p :initarg :sandwich-holidays-p :initform nil
                        :accessor calendar-sandwich-holidays-p)
   (sandwich-authority :initarg :sandwich-authority :initform nil
                       :accessor calendar-sandwich-authority)
   ;; Year/date from which sandwich applies (e.g. JP Art. 3(3) from 1985).
   (sandwich-from :initarg :sandwich-from :initform nil
                  :accessor calendar-sandwich-from)
   ;; 祝日法第3条第2項: Sunday 祝日 → 翌日 (from 1973-04-12); chain over
   ;; consecutive 祝日 only from FURIKAE-CHAIN-FROM (平成19年, 2007-01-01).
   (furikae-chain-p :initarg :furikae-chain-p :initform nil
                    :accessor calendar-furikae-chain-p)
   (furikae-from :initarg :furikae-from :initform nil
                 :accessor calendar-furikae-from)
   (furikae-chain-from :initarg :furikae-chain-from :initform nil
                       :accessor calendar-furikae-chain-from)
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
SUPPRESSED-DATES remove rule holidays relocated by proclamation. :WEEKEND-DAYS
is a weekday list or an era list (WEEKEND-SPEC-MIXIN)."))

(defmethod weekend-day-p ((calendar rule-calendar) date)
  (and (member (date-day-of-week date) (weekend-days-on calendar date))
       (not (gethash (date-rd date)
                     (%cached (calendar :working-days)
                              (%date-set (calendar-working-days calendar)
                                         :key #'calendar-working-day-date))))
       t))

(defun %suppressed-date-p (calendar date)
  (values (gethash (date-rd date)
                   (%cached (calendar :suppressed)
                            (%date-set (calendar-suppressed-dates calendar))))))

(defun %rule-calendar-observed-p (calendar)
  "True when some rule of CALENDAR can place a substitute day. The furikae
chain pass replaces per-rule observance, so it never does."
  (and (not (calendar-furikae-chain-p calendar))
       (some #'rule-observed (calendar-rules calendar))))

(defun %rule-year-entries (calendar year)
  "Every nominal date of every rule valid in YEAR, as a list (RULE NOMINAL
KEEP-P DIRECTION YEAR); KEEP-P and DIRECTION come from OBSERVANCE-MOVES. A
computed rule can contribute several entries (RULE-NOMINAL-DATES)."
  (let ((weekend-days (calendar-weekend-spec calendar))
        (observe-p (%rule-calendar-observed-p calendar)))
    (loop for rule in (calendar-rules calendar)
          append (loop for nominal in (rule-nominal-dates rule year)
                       when (rule-valid-at-p rule nominal)
                         collect (let ((observed
                                         (and observe-p
                                              (%observed-applies-at-p (rule-observed-from rule) nominal)
                                              (rule-observed rule))))
                                   (multiple-value-bind (keep direction)
                                       (observance-moves nominal observed weekend-days)
                                     (list rule nominal keep direction year)))))))

(defun %rule-entry-name (rule)
  (or (holiday-rule-name rule) t))

(defun %substitute-entry< (a b)
  "Placement order for substitutes: by nominal date, then by rule name."
  (let ((da (second a)) (db (second b)))
    (if (= da db)
        (and (string< (princ-to-string (%rule-entry-name (first a)))
                      (princ-to-string (%rule-entry-name (first b))))
             t)
        (< da db))))

(defun %observe-rule-entries (calendar year)
  "Pairs (DATE . NAME) for the rule occurrences whose nominal date is in YEAR.

Two passes, so the result is the same for any order of the rules:

1. Every kept nominal date in YEAR-1 .. YEAR+1 is claimed (the adjacent years
   only when a rule has an OBSERVED policy, so a Dec 31 and a Jan 1
   substitute cannot take the same day).
2. Substitutes are placed in nominal-date order (ties by name). Each one skips
   weekend days, every claimed day and every substitute placed before it.

Two rules on the same nominal date both keep it; HOLIDAY-P then reports both
names. :BRIDGE extras are added last and claim nothing."
  (let* ((weekend-days (calendar-weekend-spec calendar))
         (years (if (%rule-calendar-observed-p calendar)
                    (list (1- year) year (1+ year))
                    (list year)))
         (entries (loop for y in years append (%rule-year-entries calendar y)))
         (claimed (make-hash-table :test #'eql))
         (dates-by-entry (make-hash-table :test #'eq))
         (pairs '()))
    (flet ((claim (d) (setf (gethash (date-rd d) claimed) t))
           (claimedp (d) (values (gethash (date-rd d) claimed)))
           (emit (entry d)
             (when (and (= (fifth entry) year) (not (%suppressed-date-p calendar d)))
               (push d (gethash entry dates-by-entry))
               (push (cons d (%rule-entry-name (first entry))) pairs))))
      (dolist (e entries)
        (when (and (third e) (not (%suppressed-date-p calendar (second e))))
          (claim (second e))
          (emit e (second e))))
      (dolist (e (stable-sort (remove-if-not #'fourth entries) #'%substitute-entry<))
        (let ((d (place-substitute (second e) (fourth e) weekend-days #'claimedp)))
          (claim d)
          (emit e d)))
      (dolist (e entries)
        (let ((bridge (rule-bridge (first e)))
              (dates (gethash e dates-by-entry)))
          (when (and bridge dates)
            (dolist (d (set-difference (apply-bridge-days dates weekend-days bridge)
                                       dates :test #'=))
              (emit e d))))))
    pairs))

(defun %merge-holiday-names (names)
  "One holiday name for coinciding holidays: the distinct string NAMES,
sorted and joined with \"; \", or T when none of them is a string."
  (let ((strings (sort (remove-duplicates (remove-if-not #'stringp names)
                                          :test #'string=)
                       #'string<)))
    (if strings (format nil "~{~a~^; ~}" strings) t)))

(defun %rule-calendar-year-map (calendar year)
  "Hash-table RD → holiday name for all RULE occurrences in YEAR, applying
observance substitutes (independent of rule order, see
%OBSERVE-RULE-ENTRIES), optional sandwich days, and decree TRANSFERS whose TO
date falls in YEAR (or adjacent for Dec 31 ↔ Jan moves)."
  (let ((pairs (%observe-rule-entries calendar year)))
    (when (and (calendar-sandwich-holidays-p calendar)
               (let ((sf (calendar-sandwich-from calendar)))
                 (cond ((null sf) t)
                       ((integerp sf) (>= year sf))
                       (t t))))
      (setf pairs (apply-sandwich-holidays pairs)))
    (when (calendar-furikae-chain-p calendar)
      (flet ((%as-date (bound)
               (cond ((null bound) nil)
                     ((integerp bound) (make-date bound 1 1))
                     (t bound))))
        (setf pairs (apply-jp-furikae-chain
                     pairs
                     (%as-date (calendar-furikae-from calendar))
                     (%as-date (calendar-furikae-chain-from calendar))))))
    (let ((names (make-hash-table :test #'eql))
          (map (make-hash-table :test #'eql)))
      (dolist (pair pairs)
        (push (cdr pair) (gethash (date-rd (car pair)) names)))
      (maphash (lambda (rd day-names)
                 (setf (gethash rd map) (%merge-holiday-names day-names)))
               names)
      ;; Decree transfers name a day only when no rule already does.
      (dolist (tr (calendar-transfers calendar))
        (let ((to (calendar-transfer-to tr)))
          (when (and to
                     (<= (1- year) (date-year to) (1+ year))
                     (not (%suppressed-date-p calendar to)))
            (unless (gethash (date-rd to) map)
              (setf (gethash (date-rd to) map)
                    (or (calendar-transfer-name tr) "перенос выходного"))))))
      map)))

(defun %cached-year-map (calendar year)
  "%RULE-CALENDAR-YEAR-MAP of YEAR, computed once per calendar instance."
  (%cached (calendar year)
           (%rule-calendar-year-map calendar year)))

(defun clear-calendar-cache (calendar)
  "Drop CALENDAR's cached year maps and day sets. SETF of a RULE-CALENDAR
accessor does this itself; call it after changing a rule or a list in place.
Returns CALENDAR."
  (when (typep calendar 'rule-calendar)
    (setf (%rule-calendar-cache calendar) (%make-calendar-cache)))
  calendar)

(macrolet ((invalidate-after (&rest accessors)
             `(progn
                ,@(loop for accessor in accessors
                        collect `(defmethod (setf ,accessor) :after (new (calendar rule-calendar))
                                   (declare (ignore new))
                                   (clear-calendar-cache calendar))))))
  (invalidate-after calendar-rules calendar-transfers calendar-working-days
                    calendar-suppressed-dates calendar-weekend-days
                    calendar-sandwich-holidays-p calendar-sandwich-from
                    calendar-furikae-chain-p calendar-furikae-from
                    calendar-furikae-chain-from))

(defmethod holiday-p ((calendar rule-calendar) date)
  (when (%suppressed-date-p calendar date)
    (return-from holiday-p (values nil nil)))
  (let ((year (date-year date))
        (rd (date-rd date)))
    (dolist (y (list (1- year) year (1+ year)))
      (let ((name (gethash rd (%cached-year-map calendar y))))
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

(defmacro define-calendar (name (&key register (weekend-days nil weekend-days-p)
                                      sandwich-holidays-p sandwich-authority
                                      sandwich-from
                                      furikae-chain-p furikae-from
                                      furikae-chain-from)
                                &body rules)
  "Define NAME as a RULE-CALENDAR subclass from RULES.

Each clause:

  (:fixed NAME MONTH DAY &key OBSERVED OBSERVED-FROM BRIDGE FROM TO AUTHORITY)
  (:nth-weekday NAME MONTH WEEKDAY NTH &key OBSERVED OBSERVED-FROM BRIDGE FROM TO AUTHORITY)
  (:easter NAME OFFSET &key ORTHODOX OBSERVED OBSERVED-FROM BRIDGE FROM TO AUTHORITY)
  (:computed NAME COMPUTE &key OBSERVED OBSERVED-FROM BRIDGE FROM TO AUTHORITY)
    ;; COMPUTE is a form evaluating to (YEAR) → NIL, a DATE or a list of
    ;; DATEs (equinoxes, Chinese lunar, every Hijri occurrence, …)

AUTHORITY is the normative citation (statute, EO, ECB decision, proclamation).
It is the source of truth for civil :FROM/:TO and for OBSERVED rearrangements.

WEEKEND-DAYS is a form giving a weekday list such as '(5 6) or an era list
such as '((nil 4 5) ((2013 6 29) 5 6)). Without it, a calendar with REGISTER
takes COUNTRY-WEEKEND-DAYS of that code (the cited weekend table; (6 7) for
codes it does not list).

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
sandwich applies (JP Art. 3(3) first GW 1986).

:FURIKAE-CHAIN-P applies Art. 3(2) after sandwich: 翌日 from :FURIKAE-FROM
(1973-04-12); chain over consecutive 祝日 only from :FURIKAE-CHAIN-FROM
(平成19年法律第5号, 2007-01-01).

Annual Government decree transfers are attached at instance time via
CALENDAR-TRANSFERS / MAKE-RUSSIAN-HOLIDAYS-CALENDAR — not in this macro."
  `(progn
     (defclass ,name (rule-calendar) ()
       (:default-initargs
        :name ,(string name)
        :weekend-days ,(cond (weekend-days-p weekend-days)
                             (register `(country-weekend-days ,register))
                             (t ''(6 7)))
        :sandwich-holidays-p ,sandwich-holidays-p
        :sandwich-authority ',sandwich-authority
        :sandwich-from ,(%bound-form sandwich-from)
        :furikae-chain-p ,furikae-chain-p
        :furikae-from ,(%bound-form furikae-from)
        :furikae-chain-from ,(%bound-form furikae-chain-from)
        :rules (list ,@(mapcar #'%holiday-rule-constructor-form rules))))
     ,@(when register
         `((register-calendar ,register (make-instance ',name))))
     ',name))
