(in-package #:cl-stack-calendars/tests)

;;;; Exchange trading-holiday calendars (data/exchanges/calendars/, #49).

(defparameter *exchange-calendar-mics*
  '("XLON" "IFEU" "XLME"
    "XPAR" "XAMS" "XBRU" "XLIS" "XDUB" "XMIL" "XMAT"
    "XETR" "XEUR" "XEEE" "XSWX" "XWBO" "XMAD")
  "MICs whose exchange queries use the exchange's own calendar (provenance
:EXCHANGE). #49 moves the rest off their national civil calendars by region.")

(defparameter *exchange-calendar-mics-without-gold*
  '("IFEU" "XLME" "XMAT")
  "Exchange-calendar MICs that Python exchange_calendars does not cover;
their key dates are checked in EXCHANGE-CALENDARS-WITHOUT-GOLD.")

(deftest exchange-calendars-are-the-exchanges-own
  (dolist (mic *exchange-calendar-mics*)
    (let* ((ex (find-exchange mic))
           (calendar (exchange-calendar ex)))
      (ok (typep calendar 'exchange-holiday-calendar)
          (format nil "~a uses an exchange calendar" mic))
      (ok (eq (calendar-provenance calendar) :exchange))
      (ok (stringp (exchange-calendar-authority calendar))
          (format nil "~a calendar cites its authority" mic))
      (unless (member mic *exchange-calendar-mics-without-gold* :test #'string=)
        (ok (member mic (%exchange-gold-mics) :test #'string=)
            (format nil "~a has an exchange_calendars gold" mic))))))

(defun %trading-days (mic &rest ymds)
  (let ((ex (find-exchange mic)))
    (mapcar (lambda (ymd) (exchange-trading-day-p ex (apply #'make-date ymd))) ymds)))

(defun %early-close-hm (mic ymd)
  (let ((tod (exchange-early-close (find-exchange mic) (apply #'make-date ymd))))
    (and tod (%hm tod))))

(deftest exchange-calendars-without-gold
  "IFEU, XLME and XMAT have no exchange_calendars counterpart: their notices'
key dates."
  ;; ICE Futures Europe Brent: closed only on New Year's Day, Good Friday and
  ;; Christmas Day (Sunday -> Monday); UK bank holidays are trading days.
  (ok (equal (%trading-days "IFEU" '(2024 3 29) '(2022 12 26) '(2023 1 2))
             '(nil nil nil)))
  (ok (equal (%trading-days "IFEU" '(2024 4 1) '(2024 12 26) '(2021 12 27)
                            '(2022 9 19) '(2023 5 8))
             '(t t t t t)))
  (ok (equal (%early-close-hm "IFEU" '(2024 12 24)) '(19 0)))
  ;; LME: UK bank holidays closed, plus Christmas Eve 2007; open on the
  ;; 2022 State Funeral bank holiday (Notice 22/226).
  (ok (equal (%trading-days "XLME" '(2024 5 6) '(2007 12 24) '(2023 5 8))
             '(nil nil nil)))
  (ok (equal (%trading-days "XLME" '(2022 9 19)) '(t)))
  (ok (equal (%early-close-hm "XLME" '(2009 12 24)) '(16 0)))
  ;; MATIF follows the Euronext days; open on Whit Monday and 14 July 2000.
  (ok (equal (%trading-days "XMAT" '(2024 4 1) '(2024 12 26) '(2024 5 1))
             '(nil nil nil)))
  (ok (equal (%trading-days "XMAT" '(2000 6 12) '(2000 7 14) '(2024 5 9))
             '(t t t)))
  ;; A Euronext half day written in CET is 13:05 in Lisbon.
  (ok (equal (%early-close-hm "XLIS" '(2024 12 24)) '(13 5)))
  (ok (equal (%early-close-hm "XPAR" '(2024 12 24)) '(14 5))))

(defun %notice-date-ok-p (notice key)
  (let ((date (getf notice key))
        (uri (getf notice (if (eq key :issued) :issued-uri :published-uri))))
    (or (and (consp date) (= 3 (length date)) (stringp uri))
        (stringp (getf notice :dates-note)))))

(deftest exchange-notices-are-bitemporal
  "#93: every exchange notice row records :ISSUED / :PUBLISHED with their
URIs and :PUBLISHED-IN, or a :DATES-NOTE saying why a date is NIL."
  (let ((rows (exchange-notice-rows)))
    (dolist (row rows)
      (destructuring-bind (name . notice) row
        (let ((label (format nil "~a ~a" name (getf notice :title))))
          (ok (stringp (getf notice :title)) label)
          (ok (stringp (getf notice :uri)) (format nil "~a cites a URI" label))
          (ok (%notice-date-ok-p notice :issued) (format nil "~a :issued" label))
          (ok (%notice-date-ok-p notice :published) (format nil "~a :published" label))
          (ok (or (stringp (getf notice :published-in)) (getf notice :dates-note))
              (format nil "~a :published-in" label)))))))

(deftest exchange-calendar-rules-cite-authority
  (dolist (name (exchange-calendar-names))
    (let ((plist (read-data-form (data-path (format nil "exchanges/calendars/~a.sexp" name)))))
      (ok (stringp (getf plist :authority)) (format nil "~a :authority" name))
      (dolist (clause (getf plist :rules))
        (ok (stringp (getf (member-if #'keywordp (cddr clause)) :authority))
            (format nil "~a rule ~a cites its authority" name (second clause))))
      (dolist (base (getf plist :bases))
        (ok (stringp (getf base :authority))
            (format nil "~a base ~a cites its authority" name (getf base :calendar)))
        (ok (find-calendar (getf base :calendar) :errorp nil)
            (format nil "~a base ~a is registered" name (getf base :calendar)))))))

(deftest exchange-calendar-semantics
  "A notice closure beats a notice opening, which beats the rules and bases."
  (let ((c (make-instance 'exchange-holiday-calendar
                          :name "TEST"
                          :rules (make-instance 'rule-calendar
                                                :rules (list (cl-stack-calendars::%holiday-rule-from-clause
                                                              '(:fixed "Christmas Day" 12 25 :authority "t"))))
                          :bases '((:calendar "GBLO" :from (2020 1 1) :authority "t"
                                    :except ("Spring Bank Holiday")))
                          :notices '((:title "t"
                                      :closed (((2024 12 24) "Christmas Eve"))
                                      :open (((2024 12 25) "traded") ((2024 8 26) "traded"))
                                      :early-closes (((2024 12 23) (12 30) "half day")))))))
    (ok (holiday-p c (make-date 2024 12 24)))
    (ng (holiday-p c (make-date 2024 12 25)))
    (ok (holiday-p c (make-date 2023 12 25)))
    (ng (holiday-p c (make-date 2024 8 26)))
    (ok (holiday-p c (make-date 2024 5 6)))          ; GBLO Early May bank holiday
    (ng (holiday-p c (make-date 2024 5 27)))         ; excepted by name
    (ng (holiday-p c (make-date 2019 5 6)))          ; before the base era
    (ok (equal (%hm (cl-stack-calendars::exchange-calendar-early-close c (make-date 2024 12 23)))
               '(12 30)))
    (ok (eq (calendar-provenance c) :exchange))))
