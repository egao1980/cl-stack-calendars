(in-package #:cl-stack-calendars/tests)

(deftest country-index-covers-iso-and-territories
  (let* ((idx (list-country-calendars t))
         (codes (mapcar #'first idx)))
    (ok (>= (length codes) 200))
    (ok (member "US" codes :test #'string=))
    (ok (member "DE" codes :test #'string=))
    (ok (member "TW" codes :test #'string=)) ; limited recognition / separate calendar
    (ok (member "XK" codes :test #'string=)) ; Kosovo
    (ok (member "EH" codes :test #'string=)) ; Western Sahara
    (ok (member "PS" codes :test #'string=)) ; stub
    (ok (member "NCY" codes :test #'string=))))

(deftest country-calendar-germany-unity-day
  (let ((cal (country-calendar "DE")))
    (ok (holiday-p cal (make-date 2024 10 3)))
    (ok (string= (country-calendar-code cal) "DE"))
    (ok (country-calendar-source cal))))

(deftest country-calendar-taiwan-new-year
  (let ((cal (country-calendar "TW")))
    (ok (holiday-p cal (make-date 2024 1 1)))
    (ok (holiday-p cal (make-date 2024 2 10))))) ; 農曆春節 region — at least one lunar NY day

(deftest country-calendar-kosovo-independence
  (let ((cal (country-calendar "XK")))
    (ok (holiday-p cal (make-date 2024 2 17)))))

(deftest country-stub-palestine-empty
  "A stub has no data: strict HOLIDAY-P signals, :STRICT NIL answers NIL (#32)."
  (let ((cal (country-calendar "PS")))
    (ok (country-calendar-stub-p cal))
    (ok (signals (holiday-p cal (make-date 2024 1 1)) 'calendar-out-of-range))
    (ng (holiday-p (country-calendar "PS" :strict nil) (make-date 2024 1 1)))
    (ok (country-calendar-note cal))))
