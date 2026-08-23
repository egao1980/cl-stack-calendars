(in-package #:cl-stack-calendars/tests)

;;;; Systematic holiday / calendar verification.
;;;;
;;;; Spot-check eras stay in business-day-test / normative-calendar-test.
;;;; This file is the sweep: gold table, protocol invariants, every registered
;;;; calendar, country corpus, starter↔corpus agreement, exchange attachments.

(defparameter *holiday-gold-path*
  (merge-pathnames "data/tests/holiday-gold.sexp"
                   (asdf:system-source-directory "cl-stack-calendars")))

(defun load-holiday-gold (&optional (path *holiday-gold-path*))
  (with-open-file (in path) (read in)))

(defparameter *holiday-gold-rows* (load-holiday-gold))

(defun holiday-gold-ids (rows)
  (mapcar (lambda (row)
            (destructuring-bind (spec y m d holidayp &optional name) row
              (declare (ignore holidayp name))
              (format nil "~a-~4,'0d-~2,'0d-~2,'0d"
                      (if (consp spec)
                          (format nil "~a~a" (first spec) (second spec))
                          spec)
                      y m d)))
          rows))

(defun suite-year-calendar (code year)
  (cond
    ((string-equal code "CN") (china-holidays-calendar :year year))
    ((or (string-equal code "GB") (string-equal code "GBLO"))
     (uk-bank-holidays-calendar :year year))
    ((string-equal code "RU") (russian-holidays-calendar :year year))
    ((string-equal code "IN") (india-holidays-calendar :year year))
    ((string-equal code "ID") (indonesia-holidays-calendar :year year))
    ((string-equal code "KR") (south-korea-holidays-calendar :year year))
    ((string-equal code "PH") (philippines-holidays-calendar :year year))
    ((string-equal code "TH") (thailand-holidays-calendar :year year))
    ((string-equal code "MY") (malaysia-holidays-calendar :year year))
    ((string-equal code "CL") (chile-holidays-calendar :year year))
    ((string-equal code "CO") (colombia-holidays-calendar :year year))
    ((string-equal code "NP") (nepal-holidays-calendar :year year))
    ((string-equal code "LK") (sri-lanka-holidays-calendar :year year))
    ((string-equal code "KH") (cambodia-holidays-calendar :year year))
    ((string-equal code "SG") (singapore-holidays-calendar :year year))
    (t (find-calendar code))))

(defun suite-resolve-calendar (spec)
  "SPEC is a registry name, (CODE YEAR), or CODE-CORPUS for country-calendar."
  (cond ((and (stringp spec) (<= 8 (length spec))
              (string= spec "-CORPUS" :start1 (- (length spec) 7)))
         (country-calendar (subseq spec 0 (- (length spec) 7))))
        ((stringp spec) (find-calendar spec))
        ((and (consp spec) (= (length spec) 2))
         (suite-year-calendar (first spec) (second spec)))
        (t (error "bad holiday-gold spec: ~s" spec))))

(defun suite-ymd (y m d)
  (make-date y m d))

(defun suite-date-iso (date)
  (format nil "~4,'0d-~2,'0d-~2,'0d" (date-year date) (date-month date) (date-day date)))

(defun name-has-substring-p (name needle)
  (and (stringp name) (stringp needle)
       (search (string-downcase needle) (string-downcase name))))

(defun valid-weekend-days-p (days)
  (and (consp days)
       (every (lambda (d) (and (integerp d) (<= 1 d 7))) days)
       (= (length days) (length (remove-duplicates days)))))

(defun year-in-range-p (range year)
  (or (null range)
      (and (consp range) (integerp (car range)) (integerp (cdr range))
           (<= (car range) year (cdr range)))))

(defun collect-holiday-dates (calendar start end)
  (loop for d = start then (+ d 1)
        while (<= d end)
        for (hp name) = (multiple-value-list (holiday-p calendar d))
        when hp collect (cons d name)))

(defun holidays-between-problems (calendar start end)
  "NIL if HOLIDAYS-BETWEEN matches the holiday-p walk; otherwise problem strings."
  (let* ((walked (collect-holiday-dates calendar start end))
         (listed (holidays-between calendar start end))
         (problems '()))
    (unless (= (length walked) (length listed))
      (push (format nil "count listed=~d walk=~d" (length listed) (length walked))
            problems))
    (unless (or (null listed)
                (apply #'<= (mapcar #'holiday-observance-date listed)))
      (push "not sorted" problems))
    (unless (every (lambda (o) (holiday-observance-p o)) listed)
      (push "non-observance in list" problems))
    (loop for a in listed and b in walked
          unless (and (= (holiday-observance-date a) (car b))
                      (equal (holiday-observance-name a) (cdr b)))
            do (push (format nil "mismatch ~a" (suite-date-iso (holiday-observance-date a)))
                     problems)
               (return))
    (dolist (o listed)
      (multiple-value-bind (hp name) (holiday-p calendar (holiday-observance-date o))
        (unless hp
          (push (format nil "listed ~a not holiday-p" (suite-date-iso (holiday-observance-date o)))
                problems))
        (unless (equal name (holiday-observance-name o))
          (push (format nil "name drift ~a" (suite-date-iso (holiday-observance-date o)))
                problems))
        (unless (or (null name) (stringp name))
          (push (format nil "name not string ~s" name) problems))))
    (values (nreverse problems) listed)))

(defun business-day-problems (calendar start end)
  (loop for d = start then (+ d 1)
        while (<= d end)
        for biz = (business-day-p calendar d)
        for we = (weekend-day-p calendar d)
        for hp = (holiday-p calendar d)
        unless (eq (and (not we) (not hp) t) (and biz t))
          collect (format nil "~a biz=~a we=~a hp=~a" (suite-date-iso d) biz we hp)))

(defun navigation-problems (calendar start end)
  (let ((problems '())
        (first-biz nil)
        (last-biz nil))
    (loop for d = start then (+ d 1)
          while (<= d end)
          when (business-day-p calendar d)
            do (unless first-biz (setf first-biz d))
               (setf last-biz d))
    (unless (zerop (business-days-between calendar start start))
      (push "identical-date count ≠ 0" problems))
    (when (and first-biz last-biz (< first-biz last-biz))
      (unless (= (add-business-days calendar first-biz 0) first-biz)
        (push "add 0 ≠ identity" problems))
      (let ((n (business-days-between calendar first-biz last-biz)))
        (unless (plusp n)
          (push "first→last count not positive" problems))
        (unless (= n (- (business-days-between calendar last-biz first-biz)))
          (push "business-days-between not antisymmetric" problems))
        (unless (= (add-business-days calendar first-biz n) last-biz)
          (push "add(first, n) ≠ last" problems))
        (unless (= (add-business-days calendar last-biz (- n)) first-biz)
          (push "add(last, -n) ≠ first" problems))))
    (nreverse problems)))

(defun assert-year-invariants (calendar year &key label)
  (let ((start (make-date year 1 1))
        (end (make-date year 12 31))
        (tag (or label (calendar-name calendar))))
    (multiple-value-bind (hb-problems listed)
        (holidays-between-problems calendar start end)
      (ok (null hb-problems)
          (format nil "~a/~d holidays-between: ~a" tag year (or (first hb-problems) "ok")))
      (ok (null (business-day-problems calendar start end))
          (format nil "~a/~d business-day identity" tag year))
      (ok (null (navigation-problems calendar start end))
          (format nil "~a/~d navigation" tag year))
      listed)))

(defparameter *suite-major-codes*
  '("USFED" "US" "GBLO" "GB" "TARGET" "WEEKEND" "JP" "CN" "IN" "RU" "USSR"
    "DE" "FR" "IT" "ES" "NL" "BE" "AT" "PL" "SE" "BR" "MX" "CA" "AU"
    "KR" "HK" "TW" "ID" "SG" "CH" "IL" "TR" "ZA" "US-CA" "DE-BY" "ES-CT"))

(defparameter *exchange-calendars-without-starter* '("IS"))

;;; --- gold table -------------------------------------------------------

(deftest-parametrize holiday-gold
    ((spec y m d holidayp name)
     :ids (holiday-gold-ids *holiday-gold-rows*)
     :rows *holiday-gold-rows*)
  (let* ((cal (suite-resolve-calendar spec))
         (date (suite-ymd y m d)))
    (ok cal (format nil "resolve ~s" spec))
    (multiple-value-bind (hp holiday-name) (holiday-p cal date)
      (if holidayp
          (ok hp (format nil "~s ~a is a holiday" spec (suite-date-iso date)))
          (ng hp (format nil "~s ~a is not a holiday" spec (suite-date-iso date))))
      (when (and holidayp name)
        (ok (name-has-substring-p holiday-name name)
            (format nil "~s ~a name ~s contains ~s" spec (suite-date-iso date)
                    holiday-name name)))
      (when hp
        (ng (business-day-p cal date)
            (format nil "~s ~a holiday ⇒ ¬business-day" spec (suite-date-iso date)))
        (ok (or (null holiday-name) (stringp holiday-name))
            (format nil "~s holiday name string or nil" spec)))
      (unless hp
        (ok (eq (and (not (weekend-day-p cal date)) t)
                (and (business-day-p cal date) t))
            (format nil "~s ~a non-holiday business ≡ ¬weekend"
                    spec (suite-date-iso date)))))))

;;; --- every registered calendar loads ----------------------------------

(deftest all-registered-calendars-load
  (let ((names (list-registered-calendars)))
    (ok (>= (length names) 80) "registry has the hand-starter set")
    (dolist (name names)
      (let ((cal (find-calendar name :errorp nil)))
        (ok cal (format nil "find-calendar ~s" name))
        (ok (typep cal 'holiday-calendar) (format nil "~s is holiday-calendar" name))
        (ok (stringp (calendar-name cal)) (format nil "~s calendar-name" name))
        (ok (valid-weekend-days-p (calendar-weekend-days cal))
            (format nil "~s weekend days ~s" name (calendar-weekend-days cal)))
        (ok (progn (holiday-p cal (make-date 2024 6 12)) t)
            (format nil "~s holiday-p 2024-06-12" name))))))

(deftest find-calendar-missing-signals
  (ok (signals (find-calendar "NO-SUCH-CALENDAR") 'calendar-not-found))
  (ok (null (find-calendar "NO-SUCH-CALENDAR" :errorp nil))))

(deftest aliases-share-rules
  (ok (equal (calendar-weekend-days (find-calendar "US"))
             (calendar-weekend-days (find-calendar "USFED"))))
  (ok (eq (holiday-p (find-calendar "US") (make-date 2024 7 4))
          (holiday-p (find-calendar "USFED") (make-date 2024 7 4))))
  (ok (eq (holiday-p (find-calendar "GB") (make-date 2024 12 25))
          (holiday-p (find-calendar "GBLO") (make-date 2024 12 25)))))

;;; --- year sweeps ------------------------------------------------------

(deftest major-calendars-year-invariants-2024-2026
  (dolist (code *suite-major-codes*)
    (let ((cal (find-calendar code :errorp nil)))
      (ok cal (format nil "major ~s registered" code))
      (when cal
        (dolist (year '(2024 2026))
          (assert-year-invariants cal year :label code))))))

(deftest normative-calendars-2024-holidays-between
  "Every hand starter: 2024 holidays-between is consistent and bounded."
  (dolist (code (normative-calendar-codes))
    (let ((cal (find-calendar code)))
      (ok (valid-weekend-days-p (calendar-weekend-days cal))
          (format nil "~a weekend" code))
      (multiple-value-bind (problems listed)
          (holidays-between-problems cal (make-date 2024 1 1) (make-date 2024 12 31))
        (ok (null problems)
            (format nil "~a 2024 holidays-between: ~a" code (or (first problems) "ok")))
        (ok (<= (length listed) 80)
            (format nil "~a 2024 holiday count ~d ≤ 80" code (length listed)))
        (when (and (= (length code) 2)
                   (not (member code '("PS") :test #'string=)))
          (ok (>= (length listed) 1)
              (format nil "~a has at least one 2024 holiday" code)))))))

(deftest year-boundary-holidays-between
  (dolist (code '("USFED" "JP" "TARGET" "DE" "RU"))
    (let* ((cal (find-calendar code))
           (start (make-date 2023 12 20))
           (end (make-date 2024 1 10))
           (listed (holidays-between cal start end)))
      (ok (every (lambda (o)
                   (and (<= start (holiday-observance-date o) end)
                        (holiday-p cal (holiday-observance-date o))))
                 listed)
          (format nil "~a cross-year holidays-between in range" code)))))

;;; --- protocol ---------------------------------------------------------

(deftest protocol-adjust-date-conventions
  (let ((cal (weekend-only-calendar))
        (sat (make-date 2024 1 6))
        (sun (make-date 2024 1 7))
        (mon (make-date 2024 1 8))
        (month-end-sun (make-date 2024 3 31)))
    (ok (= (adjust-date cal mon :unadjusted) mon))
    (ok (= (adjust-date cal mon :following) mon))
    (ok (= (adjust-date cal sat :following) (make-date 2024 1 8)))
    (ok (= (adjust-date cal sat :preceding) (make-date 2024 1 5)))
    (ok (= (adjust-date cal sat :nearest) (make-date 2024 1 5)))
    (ok (= (adjust-date cal sun :nearest) (make-date 2024 1 8)))
    (ok (= (adjust-date cal month-end-sun :following) (make-date 2024 4 1)))
    (ok (= (adjust-date cal month-end-sun :modified-following) (make-date 2024 3 29)))
    (ok (= (adjust-date cal (make-date 2024 6 1) :modified-preceding)
           (make-date 2024 6 3))) ; Sat 1 Jun 2024 → following Mon (preceding is May)
    (ok (= (adjust-date cal sat :modified-following) (make-date 2024 1 8)))))

(deftest protocol-leap-day-2024
  (let ((cal (us-federal-holidays-calendar))
        (leap (make-date 2024 2 29)))
    (ok (= (date-day-of-week leap) 4) "2024-02-29 Thursday")
    (ng (holiday-p cal leap))
    (ok (business-day-p cal leap))))

(deftest protocol-composite-union-and-intersection
  (let* ((us (us-federal-holidays-calendar))
         (de (germany-holidays-calendar))
         (union (make-composite-calendar (list us de) :mode :union :name "US+DE"))
         (joint (make-composite-calendar (list us de) :mode :intersection :name "US&DE"))
         (jul4 (make-date 2024 7 4))
         (oct3 (make-date 2024 10 3))
         (plain (make-date 2024 6 12)))
    (ok (holiday-p union jul4))
    (ok (holiday-p union oct3))
    (ng (holiday-p joint jul4))
    (ng (holiday-p joint oct3))
    (ok (holiday-p joint (make-date 2024 1 1)))
    (ng (holiday-p union plain))
    (ng (holiday-p joint plain))))

(deftest protocol-data-calendar-roundtrip
  (let ((cal (make-data-calendar :name "gold-scratch")))
    (add-data-calendar-holiday cal (make-date 2024 3 15) "Ides")
    (ok (holiday-p cal (make-date 2024 3 15)))
    (ok (string= (nth-value 1 (holiday-p cal (make-date 2024 3 15))) "Ides"))
    (ng (holiday-p cal (make-date 2024 3 14)))
    (ok (= 1 (length (holidays-between cal (make-date 2024 3 1) (make-date 2024 3 31)))))))

(deftest protocol-empty-holidays-between
  (let ((cal (weekend-only-calendar)))
    (ok (null (holidays-between cal (make-date 2024 1 1) (make-date 2024 1 31))))
    (ok (null (holidays-between cal (make-date 2024 7 4) (make-date 2024 7 3))))))

;;; --- starter vs corpus ------------------------------------------------

(defparameter *starter-corpus-core*
  ;; weekday statutory dates both sources should mark as holidays
  '(("US" 2024 7 4)
    ("US" 2024 12 25)
    ("DE" 2024 10 3)
    ("DE" 2024 5 1)
    ("FR" 2024 7 14)
    ("JP" 2024 1 1)
    ("GB" 2024 12 25)
    ("IT" 2024 8 15)
    ("BR" 2024 9 7)
    ("KR" 2024 10 3)
    ("HK" 2024 7 1)
    ("CA" 2024 7 1)
    ("AU" 2024 1 26)))

(deftest starter-agrees-with-corpus-on-core-dates
  (dolist (row *starter-corpus-core*)
    (destructuring-bind (code y m d) row
      (let ((starter (find-calendar code :errorp nil))
            (corpus (country-calendar code))
            (date (make-date y m d)))
        (ok starter (format nil "starter ~a" code))
        (ok (holiday-p starter date)
            (format nil "starter ~a ~a holiday" code (suite-date-iso date)))
        (ok (holiday-p corpus date)
            (format nil "corpus ~a ~a holiday" code (suite-date-iso date)))))))

;;; --- country corpus ---------------------------------------------------

(deftest all-country-calendars-load-and-2024-consistent
  (let ((codes (country-calendar-codes))
        (start (make-date 2024 1 1))
        (end (make-date 2024 12 31)))
    (ok (>= (length codes) 200))
    (dolist (code codes)
      (let ((cal (country-calendar code)))
        (ok cal (format nil "country-calendar ~a" code))
        (ok (string= (country-calendar-code cal) code))
        (ok (valid-weekend-days-p (calendar-weekend-days cal))
            (format nil "corpus ~a weekend" code))
        (when (or (null (country-calendar-year-range cal))
                  (year-in-range-p (country-calendar-year-range cal) 2024))
          (multiple-value-bind (problems listed)
              (holidays-between-problems cal start end)
            (declare (ignore listed))
            (ok (null problems)
                (format nil "corpus/~a 2024: ~a" code (or (first problems) "ok")))))))))

;;; --- gazette constructors vs bare registry ----------------------------

(deftest year-bound-constructors-add-gazette-days
  (ng (holiday-p (find-calendar "CN") (make-date 2026 2 15)))
  (ok (holiday-p (china-holidays-calendar :year 2026) (make-date 2026 2 15)))
  (ng (holiday-p (find-calendar "IN") (make-date 2024 11 1)))
  (ok (holiday-p (india-holidays-calendar :year 2024) (make-date 2024 11 1)))
  (ok (holiday-p (find-calendar "GBLO") (make-date 2022 5 30)))
  (ng (holiday-p (uk-bank-holidays-calendar :year 2022) (make-date 2022 5 30)))
  (ok (business-day-p (russian-holidays-calendar :year 2024) (make-date 2024 4 27)))
  (ng (business-day-p (find-calendar "RU") (make-date 2024 4 27))))

;;; --- exchange holiday overlay -----------------------------------------

(deftest exchange-calendar-attachments-resolve
  (load-all-exchange-hours)
  (dolist (mic (list-exchanges))
    (let* ((ex (find-exchange mic))
           (cname (exchange-hours-calendar-name ex)))
      (ok (or (null cname) (stringp cname))
          (format nil "~a calendar-name type" mic))
      (when cname
        (let ((cal (find-calendar cname :errorp nil)))
          (if (member cname *exchange-calendars-without-starter* :test #'string=)
              (ok (null cal) (format nil "~a uses documented missing ~s" mic cname))
              (ok cal (format nil "~a calendar ~s registered" mic cname))))))))

(deftest exchange-holiday-closes-cash-session
  "Civil holiday overlay is on EXCHANGE-SESSION-BOUNDS, not the raw week mask."
  (load-all-exchange-hours)
  (ok (exchange-trading-day-p (find-exchange "XNYS") (make-date 2024 7 4))
      "Jul 4 2024 is a Thursday — hours still have a session")
  (ok (signals (exchange-session-bounds "XNYS" (make-date 2024 7 4)) 'calendar-error))
  (ok (exchange-session-bounds "XNYS" (make-date 2024 7 5)))
  (ok (signals (exchange-session-bounds "XETR" (make-date 2024 10 3)) 'calendar-error))
  (ok (exchange-session-bounds "XETR" (make-date 2024 10 4))))

;;; --- authority on every starter rule ----------------------------------

(deftest normative-rules-cite-authority
  (dolist (code (normative-calendar-codes))
    (let ((cal (find-calendar code)))
      (when (typep cal 'rule-calendar)
        (dolist (rule (calendar-rules cal))
          (ok (holiday-rule-authority rule)
              (format nil "~a rule ~s has :authority"
                      code (holiday-rule-name rule))))))))
