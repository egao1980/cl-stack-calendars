(in-package #:cl-stack-calendars/tests)

;;;; XNYS / XNAS sessions and early closes vs data/tests/xnys-gold.sexp
;;;; (Python exchange_calendars XNYS, 1970–2030; see scripts/generate_xnys_gold.py).
;;;; The fixture lists weekday closures; every other weekday is a session.

(defun load-xnys-gold (&optional (path (data-path "tests/xnys-gold.sexp")))
  (read-data-form path))

(defparameter *xnys-gold* (load-xnys-gold))

;;; Intentional differences from exchange_calendars: (MIC (Y M D) KIND).
;;; Empty — every session date and early close in range agrees.
(defparameter *xnys-gold-allow* '())

(defun %xnys-gold-allowed-p (mic date kind)
  (member (list mic (%date-key date) kind) *xnys-gold-allow* :test #'equal))

(defun %xnys-gold-closed-table ()
  (let ((table (make-hash-table)))
    (dolist (ymd (getf *xnys-gold* :closed) table)
      (setf (gethash (date-rd (apply #'make-date ymd)) table) t))))

(defun %xnys-gold-early-table ()
  (let ((table (make-hash-table)))
    (dolist (row (getf *xnys-gold* :early-closes) table)
      (destructuring-bind (ymd hm) row
        (setf (gethash (date-rd (apply #'make-date ymd)) table) hm)))))

(defun %compare-exchange-with-xnys-gold (mic from)
  "Return (values SESSIONS MISMATCHES) comparing MIC with the gold from FROM."
  (let* ((ex (find-exchange mic))
         (closed (%xnys-gold-closed-table))
         (early (%xnys-gold-early-table))
         (end (apply #'make-date (getf *xnys-gold* :to)))
         (sessions 0)
         (bad 0))
    (flet ((miss (date kind fmt &rest args)
             (unless (%xnys-gold-allowed-p mic date kind)
               (incf bad)
               (when (<= bad 12)
                 (ok nil (format nil "~a ~a ~a: ~?" mic (%date-key date) kind fmt args))))))
      (loop for date = from then (+ date 1)
            while (<= date end)
            do (let ((gold-session (and (<= (date-day-of-week date) 5)
                                        (not (gethash (date-rd date) closed))))
                     (ours (exchange-trading-day-p ex date)))
                 (when gold-session (incf sessions))
                 (unless (eq gold-session ours)
                   (miss date :session "gold ~a, ours ~a" gold-session ours))
                 (when (and gold-session ours)
                   (let ((gold-hm (gethash (date-rd date) early))
                         (our-tod (exchange-early-close ex date)))
                     (unless (equal gold-hm (and our-tod (%hm our-tod)))
                       (miss date :early-close "gold ~a, ours ~a"
                             gold-hm (and our-tod (%hm our-tod)))))))))
    (values sessions bad)))

(deftest xnys-gold-every-session-and-early-close
  "Every XNYS session date and early close 1970–2030 matches exchange_calendars."
  (multiple-value-bind (sessions bad)
      (%compare-exchange-with-xnys-gold "XNYS"
                                        (apply #'make-date (getf *xnys-gold* :from)))
    (ok (= sessions (getf *xnys-gold* :session-count))
        (format nil "gold session checksum ~d" sessions))
    (ok (zerop bad) (format nil "XNYS mismatches: ~d" bad))))

(deftest xnas-follows-nyse-gold
  "Nasdaq follows the NYSE holiday schedule (exchange_calendars XNAS = XNYS since 1990)."
  (multiple-value-bind (sessions bad)
      (%compare-exchange-with-xnys-gold "XNAS" (make-date 1990 1 1))
    (ok (> sessions 10000))
    (ok (zerop bad) (format nil "XNAS mismatches: ~d" bad))))

(deftest nyse-calendar-issue-11
  "egao1980/cl-stack-calendars#11: NYSE holidays, not US federal ones."
  (let ((ex (find-exchange "XNYS"))
        (nyse (find-calendar "NYSE")))
    (ok (string= (exchange-hours-calendar-name ex) "NYSE"))
    (ok (string= (exchange-hours-calendar-name (find-exchange "XNAS")) "NYSE"))
    ;; Thanksgiving and Christmas 2026: closed everywhere.
    (dolist (d (list (make-date 2026 11 26) (make-date 2026 12 25)))
      (ng (exchange-trading-day-p ex d))
      (ok (null (exchange-sessions-for-date ex d)))
      (ok (signals (exchange-session-bounds "XNYS" d) 'calendar-error)))
    ;; Good Friday closed; Columbus Day and Veterans Day open.
    (ok (holiday-p nyse (make-date 2026 4 3)))
    (ng (exchange-trading-day-p ex (make-date 2026 4 3)))
    (dolist (d (list (make-date 2026 10 12) (make-date 2026 11 11)))
      (ok (exchange-trading-day-p ex d))
      (ok (exchange-session-bounds "XNYS" d)))
    ;; Day after Thanksgiving 2026: 13:00 early close kept.
    (ok (equal (%session-hms "XNYS" (make-date 2026 11 27)) '(((9 30) (13 0)))))
    ;; NYSE Rule 7.2: Saturday New Year's Day is not observed on Friday Dec 31.
    (ok (exchange-trading-day-p ex (make-date 2021 12 31)))
    (ng (holiday-p nyse (make-date 2021 12 31)))
    (ok (exchange-trading-day-p ex (make-date 2027 12 31)))
    ;; …but other Saturday holidays close the Friday before.
    (ok (holiday-p nyse (make-date 2027 6 18)))   ; Juneteenth Sat 2027-06-19
    (ok (holiday-p nyse (make-date 2026 7 3)))    ; Independence Day Sat 2026
    (ok (holiday-p nyse (make-date 2022 6 20)))   ; Juneteenth Sun → Mon
    (ng (holiday-p nyse (make-date 2021 6 18)))   ; Juneteenth only from 2022
    (ng (holiday-p nyse (make-date 1997 1 20)))   ; MLK only from 1998
    (ok (holiday-p nyse (make-date 1998 1 19)))
    ;; Special closures.
    (dolist (ymd '((2001 9 11) (2001 9 14) (2004 6 11) (2007 1 2) (2012 10 29)
                   (2012 10 30) (2018 12 5) (2025 1 9)))
      (multiple-value-bind (hp name) (holiday-p nyse (apply #'make-date ymd))
        (ok hp (format nil "NYSE closed ~a" ymd))
        (ok (stringp name) (format nil "closure ~a has a name" ymd))))))

(deftest exchange-days-between-eras-are-closed
  "Eras end on the last trading day: the weekend / holiday before an hours
change is in no era. Those days are closed, not an error."
  (dolist (mic (list-exchanges))
    (let* ((ex (find-exchange mic))
           (eras (sort (copy-list (exchange-hours-eras ex))
                       (lambda (a b)
                         (or (null (exchange-era-from a))
                             (and (exchange-era-from b)
                                  (< (exchange-era-from a) (exchange-era-from b))))))))
      (loop for (a b) on eras
            while (and b (exchange-era-to a))
            do (loop for d = (+ (exchange-era-to a) 1) then (+ d 1)
                     while (< d (exchange-era-from b))
                     do (ng (exchange-trading-day-p ex d)
                            (format nil "~a closed between eras on ~a" mic d)))))))
