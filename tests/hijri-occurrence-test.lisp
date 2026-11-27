(in-package #:cl-stack-calendars/tests)

;;;; Computed rules yield every occurrence in a Gregorian year (#28, #43).

(defun tabular-hijri-date (hijri-year month day)
  (date-from-rd (fixed-from-islamic-date hijri-year month day)))

(define-calendar probe-hijri-list ()
  (:computed "Twice" (lambda (y) (list (make-date y 3 1) (make-date y 9 1)))
   :authority "x"))

(deftest computed-rule-may-return-a-list
  (let ((cal (make-instance 'probe-hijri-list)))
    (ok (holiday-p cal (make-date 2024 3 1)))
    (ok (holiday-p cal (make-date 2024 9 1)))
    (ng (holiday-p cal (make-date 2024 6 1)))))

(deftest hijri-second-occurrence-in-gregorian-year
  "Gregorian 2000 holds Eid al-Fitr 1420 (January) and 1421 (December)."
  (let ((tn (find-calendar "TN")))
    (ok (holiday-p tn (tabular-hijri-date 1420 10 1)))
    (ok (holiday-p tn (tabular-hijri-date 1421 10 1)))
    (ok (= 2000 (date-year (tabular-hijri-date 1421 10 1)))))
  (ok (holiday-p (find-calendar "AE") (tabular-hijri-date 1427 12 10))
      "AE Eid al-Adha 1427 (late December 2006)"))

(deftest hijri-block-crosses-new-year
  "Kurban Bayramı 1427 runs four days from late December 2006 into 2007."
  (let* ((tr (find-calendar "TR"))
         (start (tabular-hijri-date 1427 12 10)))
    (ok (= 2006 (date-year start)))
    (dotimes (k 4)
      (ok (holiday-p tr (+ start k))
          (format nil "TR Kurban day ~d on ~a" (1+ k) (suite-date-iso (+ start k)))))))

(defparameter *diyanet-double-years*
  ;; Diyanet İşleri Başkanlığı, "Dini Günler" (1900–2027), official lookup:
  ;; https://vakithesaplama.diyanet.gov.tr/dini_gunler.php — each row lists
  ;; both dates and notes "… YILINDA İKİ … BULUNMAKTADIR". Queried 2026-11-27.
  '(("RAMAZAN BAYRAMI 1. GÜN" (2000 1 8) (2000 12 27))
    ("KURBAN BAYRAMI 1. GÜN" (2006 1 10) (2006 12 31)))
  "Official Turkish dates for Gregorian years that hold a Hijri date twice.")

(deftest hijri-second-occurrence-matches-diyanet
  "TR has both occurrences that Diyanet lists. Tabular dates may differ from
Diyanet by one day (2000-12-28 vs 27): the method is a separate question."
  (let ((tr (find-calendar "TR")))
    (dolist (row *diyanet-double-years*)
      (dolist (ymd (rest row))
        (let ((d (apply #'make-date ymd)))
          (ok (or (holiday-p tr d) (holiday-p tr (+ d 1)))
              (format nil "TR ~a around ~a" (first row) (suite-date-iso d))))))
    (ok (holiday-p tr (make-date 2006 12 31)) "Kurban 2006-12-31 exact")))

(deftest hijri-one-eid-per-hijri-year
  "Every Hijri year 1410–1471 gives one Eid al-Fitr (1 Shawwal) and one Eid
al-Adha (10 Dhu al-Hijjah) in each Islamic-holiday starter, whatever the
Gregorian year. ID takes its 2000–2027 Eid days from the SKB 3 Menteri, MY
its 2008–2027 days from the JPM lists and PK its 2004–2026 days from the
moon-sighting notifications, which may differ from the tabular date by a day
(#41, #40, #47), so those years are left out here; asia-holiday-gold-test
checks them."
  (let ((missing '()))
    (dolist (code '("SA" "AE" "EG" "TN" "TR" "ID" "MY" "PK" "DZ" "MA" "JO" "KW"))
      (let ((cal (find-calendar code)))
        (loop for h from 1410 to 1471
              do (dolist (md '((10 1) (12 10)))
                   (let ((d (tabular-hijri-date h (first md) (second md))))
                     (unless (or (holiday-p cal d)
                                 (and (string= code "ID")
                                      (not (cl-stack-calendars::id-estimated-year-p (date-year d))))
                                 (and (string= code "MY")
                                      (not (my-estimated-year-p (date-year d))))
                                 (and (string= code "PK")
                                      (not (pk-estimated-year-p (date-year d)))))
                       (push (list code h (suite-date-iso d)) missing)))))))
    (ok (null missing)
        (format nil "missing Eids: ~s" (subseq missing 0 (min 20 (length missing)))))))
