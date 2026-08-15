(in-package #:cl-stack-calendars)

(defclass calendar-snapshot ()
  ((version-tag :initarg :version-tag :reader snapshot-version-tag)
   (recorded-at :initarg :recorded-at :reader snapshot-recorded-at)
   (calendar :initarg :calendar :reader snapshot-calendar))
  (:documentation "Immutable calendar view keyed by VERSION-TAG and RECORDED-AT."))

(defun calendar-snapshot-p (x) (typep x 'calendar-snapshot))

(defun make-calendar-snapshot (calendar &key version-tag recorded-at)
  (make-instance 'calendar-snapshot
                 :calendar calendar
                 :version-tag version-tag
                 :recorded-at (or recorded-at (now))))

(defclass versioned-calendar (holiday-calendar)
  ((name :initarg :name :initform nil :accessor calendar-name)
   (snapshots :initarg :snapshots :initform nil :accessor versioned-calendar-snapshots
              :documentation "List of CALENDAR-SNAPSHOT, newest first."))
  (:documentation "Ordered series of immutable calendar snapshots. Updates
APPEND a snapshot rather than mutate. CALENDAR-AS-OF selects by :VERSION or
:AS-OF instant."))

(defun make-versioned-calendar (&key name snapshots)
  (make-instance 'versioned-calendar :name name :snapshots snapshots))

(defun add-calendar-snapshot (versioned calendar &key version-tag recorded-at)
  (let ((snap (make-calendar-snapshot calendar
                                      :version-tag version-tag
                                      :recorded-at recorded-at)))
    (push snap (versioned-calendar-snapshots versioned))
    snap))

(defmethod calendar-as-of ((calendar versioned-calendar) &key version as-of)
  (let ((snaps (versioned-calendar-snapshots calendar)))
    (cond
      ((and version as-of)
       (error 'calendar-error :message "provide only one of :version or :as-of"))
      (version
       (let ((snap (find version snaps :key #'snapshot-version-tag :test #'equal)))
         (unless snap
           (error 'calendar-not-found :calendar-name version
                  :message (format nil "no snapshot ~s" version)))
         (snapshot-calendar snap)))
      (as-of
       (let ((snap (find-if (lambda (s) (<= (snapshot-recorded-at s) as-of))
                            snaps)))
         (unless snap
           (error 'calendar-not-found
                  :message (format nil "no snapshot recorded on or before ~a" as-of)))
         (snapshot-calendar snap)))
      (t
       (snapshot-calendar (or (first snaps)
                              (error 'calendar-not-found
                                     :message "versioned-calendar has no snapshots")))))))

(defmethod holiday-p ((calendar versioned-calendar) date)
  (holiday-p (calendar-as-of calendar) date))

(defmethod calendar-weekend-days ((calendar versioned-calendar))
  (calendar-weekend-days (calendar-as-of calendar)))
