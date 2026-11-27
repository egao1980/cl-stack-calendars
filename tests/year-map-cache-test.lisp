(in-package #:cl-stack-calendars/tests)

;;;; Per-year cache for rule calendars (#34).

(defun fresh-registered (code)
  "A new instance of the registered calendar CODE's class (empty cache)."
  (make-instance (class-of (find-calendar code))))

(defun seconds-of (thunk)
  (let ((start (get-internal-real-time)))
    (funcall thunk)
    (/ (- (get-internal-real-time) start) internal-time-units-per-second)))

(deftest year-map-cache-benchmark-kr
  "41 years of KR took ~57 s before the cache; the bound is generous for CI."
  (let* ((kr (fresh-registered "KR"))
         (result nil)
         (secs (seconds-of (lambda ()
                             (setf result (holidays-between kr (make-date 2000 1 1)
                                                            (make-date 2040 12 31)))))))
    (ok (> (length result) 400) "KR has holidays in 2000–2040")
    (ok (< secs 10) (format nil "KR 41-year holidays-between took ~,2f s" secs))
    (let ((again (seconds-of (lambda ()
                               (business-days-between kr (make-date 2000 1 1)
                                                      (make-date 2040 12 31))))))
      (ok (< again 5) (format nil "warm KR business-days-between took ~,2f s" again)))))

(deftest year-map-cache-thread-safe
  "Concurrent first use from several threads gives the sequential answer."
  (flet ((days (cal)
           (mapcar (lambda (o) (date-rd (holiday-observance-date o)))
                   (holidays-between cal (make-date 2010 1 1) (make-date 2020 12 31)))))
    (let* ((expected (days (fresh-registered "CN")))
           (cal (fresh-registered "CN"))
           (results (make-array 8 :initial-element nil))
           (threads (loop for i below 8
                          collect (let ((i i))
                                    (sb-thread:make-thread
                                     (lambda () (setf (aref results i) (days cal))))))))
      (mapc #'sb-thread:join-thread threads)
      (ok (> (length expected) 100))
      (ok (every (lambda (r) (equal r expected)) results)))))

(deftest year-map-cache-invalidated-by-setf
  (let ((cal (make-instance 'rule-calendar
                            :rules (list (cl-stack-calendars::make-fixed-holiday-rule
                                          :name "A" :month 3 :day 5)))))
    (ok (holiday-p cal (make-date 2024 3 5)))
    (setf (calendar-rules cal)
          (list (cl-stack-calendars::make-fixed-holiday-rule :name "B" :month 3 :day 6)))
    (ng (holiday-p cal (make-date 2024 3 5)))
    (ok (holiday-p cal (make-date 2024 3 6)))
    (setf (calendar-suppressed-dates cal) (list (make-date 2024 3 6)))
    (ng (holiday-p cal (make-date 2024 3 6)))))
