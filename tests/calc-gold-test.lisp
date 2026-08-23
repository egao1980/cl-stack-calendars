(in-package #:cl-stack-calendars/tests)

;;;; Computed holiday dates vs data/tests/calc-gold.sexp (HKO, dateutil,
;;;; pyluach, Kuwaiti JDN). Official gazettes stay in external-gold-test.

(defparameter *calc-gold-path*
  (merge-pathnames "data/tests/calc-gold.sexp"
                   (asdf:system-source-directory "cl-stack-calendars")))

(defun load-calc-gold (&optional (path *calc-gold-path*))
  (with-open-file (in path) (read in)))

(defparameter *calc-gold* (load-calc-gold))

(defun calc-block (source kind)
  (find-if (lambda (b)
             (and (equal (getf b :source) source)
                  (eq (getf b :kind) kind)))
           (getf *calc-gold* :blocks)))

(defun %fmt-ymd (y m d)
  (format nil "~4,'0d-~2,'0d-~2,'0d" y m d))

(defun %date-on-cal-p (cal y m d)
  (holiday-p cal (make-date y m d)))

(defparameter *hko-allow*
  ;; See datetime-protocol data/tests/CHRONO.md — 闰十一月 / 中气 midnight.
  '((2033 :zhongqiu)))

(deftest calc-gold-hko-china-hong-kong
  "HKO 春节/清明/端午/中秋 vs CN (放假办法 from-years) and HK lunar NY."
  (let ((rows (getf (calc-block "hko" :chinese-festival) :rows))
        (cn (china-holidays-calendar))
        (hk (hong-kong-holidays-calendar))
        (bad 0))
    (ok (> (length rows) 400) "HKO festival block")
    (dolist (row rows)
      (destructuring-bind (year name y m d) row
        (unless (member (list year name) *hko-allow* :test #'equal)
          (when (and (eq name :chinese-new-year) (<= 1949 year))
            (unless (%date-on-cal-p cn y m d)
              (incf bad)
              (when (<= bad 8)
                (ok nil (format nil "CN missing 春节 ~a" (%fmt-ymd y m d))))))
          (when (and (eq name :chinese-new-year) (<= 1997 year))
            (unless (%date-on-cal-p hk y m d)
              (incf bad)
              (when (<= bad 8)
                (ok nil (format nil "HK missing lunar NY ~a" (%fmt-ymd y m d))))))
          (when (and (eq name :qingming) (<= 2008 year))
            (unless (%date-on-cal-p cn y m d)
              (incf bad)
              (when (<= bad 8)
                (ok nil (format nil "CN missing 清明 ~a" (%fmt-ymd y m d))))))
          (when (and (eq name :duanwu) (<= 2008 year))
            (unless (%date-on-cal-p cn y m d)
              (incf bad)
              (when (<= bad 8)
                (ok nil (format nil "CN missing 端午 ~a" (%fmt-ymd y m d))))))
          (when (and (eq name :zhongqiu) (<= 2008 year))
            (unless (%date-on-cal-p cn y m d)
              (incf bad)
              (when (<= bad 8)
                (ok nil (format nil "CN missing 中秋 ~a" (%fmt-ymd y m d)))))))))
    (ok (zerop bad) (format nil "HKO→CN/HK mismatches: ~d" bad))))

(deftest calc-gold-easter-hong-kong
  "dateutil Western Easter → HK Good Friday / Easter Monday (from 1997)."
  (let ((rows (getf (calc-block "dateutil" :easter-western) :rows))
        (hk (hong-kong-holidays-calendar))
        (bad 0))
    (dolist (row rows)
      (destructuring-bind (year y m d) row
        (when (<= 1997 year 2050)
          (let* ((easter (make-date y m d))
                 (gf (+ easter -2))
                 (em (+ easter 1)))
            (unless (holiday-p hk gf)
              (incf bad)
              (when (<= bad 8)
                (ok nil (format nil "HK missing Good Friday ~a" year))))
            (unless (holiday-p hk em)
              (incf bad)
              (when (<= bad 8)
                (ok nil (format nil "HK missing Easter Monday ~a" year))))))))
    (ok (zerop bad) (format nil "HK Easter mismatches: ~d" bad))))

(deftest calc-gold-hebrew-israel
  "pyluach RH / YK / Sukkot / Passover / Shavuot vs IL (from 1948)."
  (let ((rows (getf (calc-block "pyluach" :hebrew-holiday) :rows))
        (il (israel-holidays-calendar))
        (bad 0))
    (dolist (row rows)
      (destructuring-bind (hy name y m d) row
        (declare (ignore hy))
        (when (and (<= 1948 y 2050)
                   (member name '(:rosh-hashanah :yom-kippur :sukkot :passover :shavuot)))
          (unless (%date-on-cal-p il y m d)
            (incf bad)
            (when (<= bad 8)
              (ok nil (format nil "IL missing ~a ~a" name (%fmt-ymd y m d))))))))
    (ok (zerop bad) (format nil "IL Hebrew mismatches: ~d" bad))))

(deftest calc-gold-islamic-tabular-function
  "Kuwaiti Eid / 1 Muharram match the tabular conversion starters call."
  (let ((rows (getf (calc-block "kuwaiti-jdn" :islamic-civil) :rows))
        (bad 0))
    (dolist (row rows)
      (destructuring-bind (iy name y m d) row
        (let ((got (date-from-rd
                    (ecase name
                      (:islamic-new-year (fixed-from-islamic-date iy 1 1))
                      (:eid-al-fitr (fixed-from-islamic-date iy 10 1))
                      (:eid-al-adha (fixed-from-islamic-date iy 12 10))
                      (:mawlid (fixed-from-islamic-date iy 3 12))))))
          (unless (value= (make-date y m d) got)
            (incf bad)
            (when (<= bad 8)
              (ok nil (format nil "~a AH~d gold ~a got ~a"
                              name iy (%fmt-ymd y m d)
                              (%fmt-ymd (date-year got) (date-month got) (date-day got)))))))))
    (ok (zerop bad) (format nil "tabular Islamic mismatches: ~d" bad))))
