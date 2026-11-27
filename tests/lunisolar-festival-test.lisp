(in-package #:cl-stack-calendars/tests)

;;;; Korean and Vietnamese lunar holidays vs data/tests/lunisolar-festival-gold.sexp
;;;; (scripts/generate_lunisolar_festival_gold.py): KASI 음양력 (설날, 추석,
;;;; 1948–2050) and Hồ Ngọc Đức's tables (Tết, Giỗ Tổ Hùng Vương, 1945–2100).
;;;; See egao1980/cl-stack-calendars#38: both calendars used to be computed at
;;;; Beijing time (UTC+8).

(defparameter *lunisolar-festival-gold*
  (read-data-form (data-path "tests/lunisolar-festival-gold.sexp")))

(defun %festival-rows (source kind)
  (let ((block (find source (getf *lunisolar-festival-gold* :blocks)
                     :key (lambda (b) (getf b :source)) :test #'equal)))
    (remove kind (getf block :rows) :key #'second :test-not #'eq)))

(defun %assert-festival-days (cal source kind offsets &key (from 1900) (to 2100))
  "Every gold KIND date of SOURCE in FROM..TO, shifted by each of OFFSETS, is a
holiday of CAL."
  (let ((bad 0) (rows (%festival-rows source kind)))
    (ok (> (length rows) 50) (format nil "~a ~a rows: ~d" source kind (length rows)))
    (dolist (row rows)
      (destructuring-bind (year k y m d) row
        (declare (ignore k))
        (when (<= from year to)
          (dolist (off offsets)
            (let ((day (+ (make-date y m d) off)))
              (unless (holiday-p cal day)
                (incf bad)
                (when (<= bad 10)
                  (ok nil (format nil "~a ~a ~d~@d not a holiday: ~a"
                                  source kind year off (%fmt-ymd y m d))))))))))
    (ok (zerop bad) (format nil "~a ~a mismatches: ~d" source kind bad))))

(deftest lunisolar-festival-kasi-korea
  "설날 (eve, day, next) and 추석 (eve, day, next) 1948–2050 at KASI dates."
  (let ((kr (south-korea-holidays-calendar)))
    (%assert-festival-days kr "kasi" :seollal '(-1 0 1) :from 1948 :to 2050)
    (%assert-festival-days kr "kasi" :chuseok '(-1 0 1) :from 1948 :to 2050)))

(deftest lunisolar-festival-hnd-vietnam
  "Tết (giao thừa, mùng 1–3) 1945–2100 and Giỗ Tổ Hùng Vương 2007–2100 at
Hồ Ngọc Đức dates."
  (let ((vn (find-calendar "VN")))
    (%assert-festival-days vn "hnd" :tet '(-1 0 1 2) :from 1945 :to 2100)
    (%assert-festival-days vn "hnd" :gio-to '(0) :from 2007 :to 2100)))

(deftest lunisolar-issue-38-dates
  "The dates #38 reported, against KASI and Hồ Ngọc Đức."
  (let ((kr (south-korea-holidays-calendar))
        (vn (find-calendar "VN")))
    (ok (holiday-p kr (make-date 2027 2 8)) "설날 2027 다음날")
    (ng (holiday-p kr (make-date 2027 2 5)) "2027-02-05 is not 설날")
    (ok (holiday-p kr (make-date 2028 1 28)))
    (ng (holiday-p kr (make-date 2028 1 25)))
    (ok (holiday-p kr (make-date 2040 9 22)))
    (ng (holiday-p kr (make-date 2040 9 19)))
    (ok (holiday-p kr (make-date 2033 9 8)) "추석 2033")
    (ng (holiday-p kr (make-date 2033 10 7)))
    (ok (holiday-p vn (make-date 2007 2 16)) "Giao thừa 2007")
    (ok (holiday-p vn (make-date 2030 2 2)) "Tết 2030")
    (ok (holiday-p vn (make-date 2009 4 4)) "Giỗ Tổ 2009")
    (ng (holiday-p vn (make-date 2009 4 5)))
    (ok (holiday-p vn (make-date 2037 4 24)))
    (ok (holiday-p vn (make-date 2038 4 13)))))
