(in-package #:cl-stack-calendars)

(defclass composite-calendar (holiday-calendar)
  ((name :initarg :name :initform nil :accessor calendar-name)
   (calendars :initarg :calendars :reader composite-calendar-calendars)
   (mode :initarg :mode :initform :union :reader composite-calendar-mode)
   (weekend-days :initarg :weekend-days :initform nil :accessor %composite-weekend-override))
  (:documentation "Combine holiday calendars.

:UNION (joint settlement): a business day only when every constituent has
one. Holiday if any constituent has a holiday; weekend if any constituent has
a weekend (each constituent's own WEEKEND-DAY-P, so a decree working Saturday
counts only when every constituent works).

:INTERSECTION: a business day when any constituent has one. Holiday only if
every constituent has a holiday; weekend only if every constituent has a
weekend.

:WEEKEND-DAYS, when given, replaces the constituents' weekends (and their
working-day overrides) with a plain weekday list."))

(defun make-composite-calendar (calendars &key name (mode :union) weekend-days)
  "A COMPOSITE-CALENDAR over the non-empty list CALENDARS (see its class
documentation for :UNION and :INTERSECTION). Signals CALENDAR-ERROR for an
empty CALENDARS or an unknown MODE."
  (make-instance 'composite-calendar
                 :name name :calendars calendars :mode mode
                 :weekend-days weekend-days))

(defmethod initialize-instance :after ((calendar composite-calendar) &key)
  (unless (composite-calendar-calendars calendar)
    (error 'calendar-error :message "a composite calendar needs at least one calendar"))
  (unless (member (composite-calendar-mode calendar) '(:union :intersection))
    (error 'calendar-error
           :message (format nil "unknown composite mode ~s (want :union or :intersection)"
                            (composite-calendar-mode calendar)))))

(defun %composite-quantifier (calendar)
  "SOME for :UNION, EVERY for :INTERSECTION: how the constituents' holidays
and weekends combine."
  (ecase (composite-calendar-mode calendar)
    (:union #'some)
    (:intersection #'every)))

(defmethod calendar-weekend-days ((calendar composite-calendar))
  (or (%composite-weekend-override calendar)
      (sort (copy-list
             (reduce (ecase (composite-calendar-mode calendar)
                       (:union #'union)
                       (:intersection #'intersection))
                     (mapcar #'calendar-weekend-days
                             (composite-calendar-calendars calendar))))
            #'cl:<)))

(defmethod weekend-day-p ((calendar composite-calendar) date)
  (let ((override (%composite-weekend-override calendar)))
    (if override
        (and (member (date-day-of-week date) override) t)
        (and (funcall (%composite-quantifier calendar)
                      (lambda (c) (weekend-day-p c date))
                      (composite-calendar-calendars calendar))
             t))))

(defmethod business-day-p ((calendar composite-calendar) date)
  (if (%composite-weekend-override calendar)
      (call-next-method)
      ;; :UNION — open only when every constituent is open;
      ;; :INTERSECTION — open when any constituent is.
      (and (funcall (ecase (composite-calendar-mode calendar)
                      (:union #'every)
                      (:intersection #'some))
                    (lambda (c) (business-day-p c date))
                    (composite-calendar-calendars calendar))
           t)))

(defmethod holiday-p ((calendar composite-calendar) date)
  "Name: the distinct names of the constituents that have a holiday on DATE,
joined with \"; \" (:UNION) or \"+\" (:INTERSECTION), in constituent order."
  (let ((names '())
        (flags '()))
    (dolist (c (composite-calendar-calendars calendar))
      (multiple-value-bind (hp name) (holiday-p c date)
        (push (and hp t) flags)
        (when hp (push (or name (calendar-name c)) names))))
    (if (funcall (%composite-quantifier calendar) #'identity flags)
        (values t (format nil (ecase (composite-calendar-mode calendar)
                                (:union "~{~a~^; ~}")
                                (:intersection "~{~a~^+~}"))
                          (remove-duplicates (reverse names) :test #'equal :from-end t)))
        (values nil nil))))
