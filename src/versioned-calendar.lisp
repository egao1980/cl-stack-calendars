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
              :documentation "List of CALENDAR-SNAPSHOT, newest RECORDED-AT first.
Every write path (the :SNAPSHOTS initarg, SETF, ADD-CALENDAR-SNAPSHOT) keeps it
sorted; the list itself is never mutated in place, so a reader always sees a
consistent list."))
  (:documentation "Ordered series of immutable calendar snapshots, the
knowledge-time (recorded-at) axis of a calendar. Updates add a snapshot rather
than mutate one. CALENDAR-AS-OF selects by :VERSION or by :AS-OF instant, by
RECORDED-AT whatever the insertion order. Two snapshots with the same
RECORDED-AT: the one added later wins (in a :SNAPSHOTS list, the one earlier in
the list). ADD-CALENDAR-SNAPSHOT is safe to call from several threads;
VERSIONED-CALENDAR-WITH-SNAPSHOT is the functional form."))

(defun make-versioned-calendar (&key name snapshots)
  (make-instance 'versioned-calendar :name name :snapshots snapshots))

(defun %snapshot-newer-p (a b)
  (> (snapshot-recorded-at a) (snapshot-recorded-at b)))

(defun %sort-snapshots (snapshots)
  "A fresh list of SNAPSHOTS, newest RECORDED-AT first. Ties keep their order."
  (stable-sort (copy-list snapshots) #'%snapshot-newer-p))

(defun %insert-snapshot (snap snapshots)
  "A list with SNAP inserted into the newest-first SNAPSHOTS, before every
snapshot recorded at or before it (so a tie puts SNAP first). SNAPSHOTS is not
modified; its tail is shared."
  (let ((at (snapshot-recorded-at snap))
        (head '())
        (tail snapshots))
    (loop while (and tail (> (snapshot-recorded-at (car tail)) at))
          do (push (pop tail) head))
    (nreconc head (cons snap tail))))

(defun %update-snapshots (versioned function)
  "Set VERSIONED's snapshot list to (FUNCALL FUNCTION old-list), atomically:
on SBCL a compare-and-swap loop, so concurrent updates are never lost.
FUNCTION must not modify its argument and may be called more than once."
  #+sbcl
  (loop
    (let* ((old (slot-value versioned 'snapshots))
           (new (funcall function old)))
      (when (eq old (sb-ext:compare-and-swap (slot-value versioned 'snapshots) old new))
        (return new))))
  #-sbcl
  (setf (slot-value versioned 'snapshots)
        (funcall function (slot-value versioned 'snapshots))))

(defmethod initialize-instance :after ((calendar versioned-calendar) &key)
  (setf (slot-value calendar 'snapshots)
        (%sort-snapshots (slot-value calendar 'snapshots))))

(defmethod (setf versioned-calendar-snapshots) :around (snapshots (calendar versioned-calendar))
  (call-next-method (%sort-snapshots snapshots) calendar))

(defun add-calendar-snapshot (versioned calendar &key version-tag recorded-at)
  "Add a snapshot of CALENDAR to VERSIONED at RECORDED-AT (default now) and
return it. The snapshot list stays sorted newest first, so a backfilled older
snapshot never shadows a newer one. Safe to call from several threads.

A VERSION-TAG already present signals DUPLICATE-SNAPSHOT-VERSION, with
restarts REPLACE-SNAPSHOT (drop the old snapshot(s) with that tag) and CONTINUE
(keep both)."
  (let ((snap (make-calendar-snapshot calendar
                                      :version-tag version-tag
                                      :recorded-at recorded-at))
        (mode nil))
    (%update-snapshots
     versioned
     (lambda (snaps)
       (when (and version-tag (null mode)
                  (find version-tag snaps :key #'snapshot-version-tag :test #'equal))
         (restart-case
             (error 'duplicate-snapshot-version :calendar versioned
                                                :version-tag version-tag)
           (replace-snapshot ()
             :report "Replace the existing snapshot(s) with this version tag."
             (setf mode :replace))
           (continue ()
             :report "Keep both snapshots."
             (setf mode :keep))))
       (%insert-snapshot snap
                         (if (eq mode :replace)
                             (remove version-tag snaps :key #'snapshot-version-tag
                                                       :test #'equal)
                             snaps))))
    snap))

(defun versioned-calendar-with-snapshot (versioned calendar &key version-tag recorded-at)
  "A new versioned calendar: VERSIONED's snapshots plus one of CALENDAR at
RECORDED-AT (default now). VERSIONED is unchanged. A duplicate VERSION-TAG
signals as in ADD-CALENDAR-SNAPSHOT."
  (let ((copy (make-instance (class-of versioned)
                             :name (calendar-name versioned)
                             :snapshots (versioned-calendar-snapshots versioned))))
    (add-calendar-snapshot copy calendar :version-tag version-tag
                                         :recorded-at recorded-at)
    copy))

(defmethod calendar-as-of ((calendar versioned-calendar) &key version as-of)
  "The snapshot calendar for VERSION (the latest-recorded snapshot with that
tag), for AS-OF (the snapshot with the greatest RECORDED-AT <= AS-OF), or the
latest-recorded snapshot. The list is sorted newest first on every write, so
each lookup is the first match."
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

(defmethod weekend-days-on ((calendar versioned-calendar) date)
  (weekend-days-on (calendar-as-of calendar) date))

(defmethod weekend-day-p ((calendar versioned-calendar) date)
  (weekend-day-p (calendar-as-of calendar) date))

(defmethod business-day-p ((calendar versioned-calendar) date)
  (business-day-p (calendar-as-of calendar) date))
