(in-package #:cl-stack-calendars)

(defclass composite-calendar (holiday-calendar)
  ((name :initarg :name :initform nil :accessor calendar-name)
   (calendars :initarg :calendars :reader composite-calendar-calendars)
   (mode :initarg :mode :initform :union :reader composite-calendar-mode)
   (weekend-days :initarg :weekend-days :initform nil :accessor %composite-weekend-override))
  (:documentation "Combine holiday calendars. :UNION = holiday if any constituent
is; :INTERSECTION = holiday only if all are (joint settlement)."))

(defun make-composite-calendar (calendars &key name (mode :union) weekend-days)
  (make-instance 'composite-calendar
                 :name name :calendars calendars :mode mode
                 :weekend-days weekend-days))

(defmethod calendar-weekend-days ((calendar composite-calendar))
  (or (%composite-weekend-override calendar)
      (calendar-weekend-days (first (composite-calendar-calendars calendar)))
      '(6 7)))

(defmethod holiday-p ((calendar composite-calendar) date)
  (ecase (composite-calendar-mode calendar)
    (:union
     (dolist (c (composite-calendar-calendars calendar) (values nil nil))
       (multiple-value-bind (hp name) (holiday-p c date)
         (when hp (return (values t (or name (calendar-name c))))))))
    (:intersection
     (let ((names '()))
       (dolist (c (composite-calendar-calendars calendar) (values t (format nil "~{~a~^+~}" (nreverse names))))
         (multiple-value-bind (hp name) (holiday-p c date)
           (unless hp (return (values nil nil)))
           (push (or name (calendar-name c)) names)))))))
