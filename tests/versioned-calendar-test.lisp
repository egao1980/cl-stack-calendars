(in-package #:cl-stack-calendars/tests)

;;;; Versioned calendars select snapshots by RECORDED-AT, never by insertion
;;;; order, and concurrent adds lose nothing (#30).

(defun %tagged-calendar (tag)
  (make-data-calendar :name tag))

(defun %tag-as-of (v &rest args)
  (calendar-name (apply #'calendar-as-of v args)))

(deftest versioned-as-of-ignores-insertion-order
  "A backfilled older snapshot does not shadow a newer one."
  (let ((v (make-versioned-calendar)))
    (add-calendar-snapshot v (%tagged-calendar "new") :version-tag "new"
                                                      :recorded-at (make-instant 200))
    (add-calendar-snapshot v (%tagged-calendar "old") :version-tag "old-backfill"
                                                      :recorded-at (make-instant 100))
    (ok (equal "new" (%tag-as-of v :as-of (make-instant 250))))
    (ok (equal "old" (%tag-as-of v :as-of (make-instant 150))))
    (ok (equal "new" (%tag-as-of v)))
    (ok (equal '("new" "old-backfill")
               (mapcar #'snapshot-version-tag (versioned-calendar-snapshots v))))))

(deftest versioned-as-of-oldest-first-initargs
  ":SNAPSHOTS given oldest first are ordered newest first."
  (let* ((a (make-calendar-snapshot (%tagged-calendar "a") :version-tag "a"
                                                           :recorded-at (make-instant 10)))
         (b (make-calendar-snapshot (%tagged-calendar "b") :version-tag "b"
                                                           :recorded-at (make-instant 20)))
         (c (make-calendar-snapshot (%tagged-calendar "c") :version-tag "c"
                                                           :recorded-at (make-instant 30)))
         (v (make-versioned-calendar :snapshots (list a b c))))
    (ok (equal '("c" "b" "a")
               (mapcar #'snapshot-version-tag (versioned-calendar-snapshots v))))
    (ok (equal "c" (%tag-as-of v)))
    (ok (equal "b" (%tag-as-of v :as-of (make-instant 25))))
    (ok (signals (calendar-as-of v :as-of (make-instant 5)) 'calendar-not-found))))

(deftest versioned-setf-snapshots-sorts
  (let ((v (make-versioned-calendar)))
    (setf (versioned-calendar-snapshots v)
          (list (make-calendar-snapshot (%tagged-calendar "x") :version-tag "x"
                                                               :recorded-at (make-instant 1))
                (make-calendar-snapshot (%tagged-calendar "y") :version-tag "y"
                                                               :recorded-at (make-instant 2))))
    (ok (equal "y" (%tag-as-of v)))))

(deftest versioned-tie-later-add-wins
  "Two snapshots recorded at the same instant: the later add wins."
  (let ((v (make-versioned-calendar)))
    (add-calendar-snapshot v (%tagged-calendar "first") :version-tag "first"
                                                        :recorded-at (make-instant 100))
    (add-calendar-snapshot v (%tagged-calendar "second") :version-tag "second"
                                                         :recorded-at (make-instant 100))
    (ok (equal "second" (%tag-as-of v)))
    (ok (equal "second" (%tag-as-of v :as-of (make-instant 100))))))

(deftest versioned-duplicate-tag-signals
  (let ((v (make-versioned-calendar)))
    (add-calendar-snapshot v (%tagged-calendar "one") :version-tag "t"
                                                      :recorded-at (make-instant 100))
    (ok (signals (add-calendar-snapshot v (%tagged-calendar "two") :version-tag "t"
                                                                   :recorded-at (make-instant 200))
                 'duplicate-snapshot-version))
    (ok (= 1 (length (versioned-calendar-snapshots v))))))

(deftest versioned-duplicate-tag-replace-restart
  (let ((v (make-versioned-calendar)))
    (add-calendar-snapshot v (%tagged-calendar "one") :version-tag "t"
                                                      :recorded-at (make-instant 100))
    (handler-bind ((duplicate-snapshot-version
                     (lambda (c)
                       (invoke-restart (find-restart 'replace-snapshot c)))))
      (add-calendar-snapshot v (%tagged-calendar "two") :version-tag "t"
                                                        :recorded-at (make-instant 200)))
    (ok (= 1 (length (versioned-calendar-snapshots v))))
    (ok (equal "two" (%tag-as-of v :version "t")))))

(deftest versioned-duplicate-tag-continue-keeps-both
  (let ((v (make-versioned-calendar)))
    (add-calendar-snapshot v (%tagged-calendar "one") :version-tag "t"
                                                      :recorded-at (make-instant 200))
    (handler-bind ((duplicate-snapshot-version #'continue))
      (add-calendar-snapshot v (%tagged-calendar "two") :version-tag "t"
                                                        :recorded-at (make-instant 100)))
    (ok (= 2 (length (versioned-calendar-snapshots v))))
    ;; :VERSION picks the most recently recorded of the tag.
    (ok (equal "one" (%tag-as-of v :version "t")))))

(deftest versioned-with-snapshot-is-functional
  "VERSIONED-CALENDAR-WITH-SNAPSHOT returns a new calendar; the old one is unchanged."
  (let* ((v (make-versioned-calendar :name "V"))
         (v1 (versioned-calendar-with-snapshot v (%tagged-calendar "a")
                                               :version-tag "a" :recorded-at (make-instant 1)))
         (v2 (versioned-calendar-with-snapshot v1 (%tagged-calendar "b")
                                               :version-tag "b" :recorded-at (make-instant 2))))
    (ok (null (versioned-calendar-snapshots v)))
    (ok (= 1 (length (versioned-calendar-snapshots v1))))
    (ok (equal "b" (%tag-as-of v2)))
    (ok (equal "V" (calendar-name v2)))))

#+sbcl
(deftest versioned-concurrent-adds-lose-nothing
  (let* ((v (make-versioned-calendar))
         (threads 8)
         (per-thread 200)
         (workers
           (loop for i below threads
                 collect (let ((i i))
                           (sb-thread:make-thread
                            (lambda ()
                              (dotimes (j per-thread)
                                (add-calendar-snapshot
                                 v (%tagged-calendar "c")
                                 :version-tag (format nil "~d-~d" i j)
                                 :recorded-at (make-instant (+ (* j threads) i))))))))))
    (mapc #'sb-thread:join-thread workers)
    (let ((snaps (versioned-calendar-snapshots v)))
      (ok (= (* threads per-thread) (length snaps)))
      (ok (loop for (a b) on snaps
                always (or (null b)
                           (>= (snapshot-recorded-at a) (snapshot-recorded-at b))))))))
