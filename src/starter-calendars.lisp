(in-package #:cl-stack-calendars)

;;;; Starter calendars. Every rule cites its normative authority (statute,
;;;; executive order, ECB decision, or royal proclamation). Observance
;;;; policies are statute-named — see *OBSERVED-POLICIES* and docs/AUTHORITIES.md.
;;;; Versioned as-of snapshots (what was *known* at booking time) are a
;;;; separate axis — see VERSIONED-CALENDAR.

(define-calendar weekend-only-calendar (:register "WEEKEND")
  ;; no holiday rules — Saturday/Sunday only
  )

;;;; TARGET closing days — ECB Governing Council decision of 14 Dec 2000
;;;; (long-term calendar from 2002); calendar dates, no weekend in-lieu
;;;; (weekends are already non-settlement).
;;;; https://www.ecb.europa.eu/press/pr/date/2000/html/pr001214_4.en.html
(define-calendar target-calendar (:register "TARGET")
  (:fixed "New Year's Day" 1 1 :from 1999
   :authority "ECB Governing Council decision 14 Dec 2000 (TARGET closing days)")
  (:fixed "Labour Day" 5 1 :from 1999
   :authority "ECB Governing Council decision 14 Dec 2000 (TARGET closing days)")
  (:fixed "Christmas Day" 12 25 :from 1999
   :authority "ECB Governing Council decision 14 Dec 2000 (TARGET closing days)")
  (:fixed "Christmas Holiday" 12 26 :from 1999
   :authority "ECB Governing Council decision 14 Dec 2000 (TARGET closing days)")
  (:easter "Good Friday" -2 :from 1999
   :authority "ECB Governing Council decision 14 Dec 2000 (TARGET closing days)")
  (:easter "Easter Monday" 1 :from 1999
   :authority "ECB Governing Council decision 14 Dec 2000 (TARGET closing days)"))

;;;; US federal legal public holidays — 5 U.S.C. § 6103(a) list; in-lieu
;;;; observance for Mon–Fri schedules under § 6103(b) (Sat→Fri) and
;;;; Exec. Order No. 11582 § 3(a) (Sun→Mon). Uniform Monday Holiday Act
;;;; (Pub. L. 90-363) effective 1971-01-01.
(define-calendar us-federal-holidays-calendar (:register "USFED")
  (:fixed "New Year's Day" 1 1 :from 1900
   :observed :us-federal-in-lieu
   :authority ("5 U.S.C. § 6103(a)–(b)" "Exec. Order No. 11582 § 3(a)"))
  (:nth-weekday "Martin Luther King Jr. Day" 1 :monday 3 :from 1986
   :authority "Pub. L. 98-144; 5 U.S.C. § 6103(a) (effective first Jan 1 after two years from 1983-11-02 → 1986)")
  (:fixed "Washington's Birthday" 2 22 :observed :us-federal-in-lieu :from 1900 :to 1970
   :authority "5 U.S.C. § 6103(a) (pre–Uniform Monday Holiday Act)")
  (:nth-weekday "Washington's Birthday" 2 :monday 3 :from 1971
   :authority "Pub. L. 90-363; 5 U.S.C. § 6103(a) (effective 1971-01-01)")
  (:fixed "Memorial Day" 5 30 :observed :us-federal-in-lieu :from 1900 :to 1970
   :authority "5 U.S.C. § 6103(a) (pre–Uniform Monday Holiday Act)")
  (:nth-weekday "Memorial Day" 5 :monday -1 :from 1971
   :authority "Pub. L. 90-363; 5 U.S.C. § 6103(a) (effective 1971-01-01)")
  (:fixed "Juneteenth" 6 19 :observed :us-federal-in-lieu :from (2021 6 18)
   :authority "Pub. L. 117-17 (2021-06-17); 5 U.S.C. § 6103(a)–(b)")
  (:fixed "Independence Day" 7 4 :from 1900
   :observed :us-federal-in-lieu
   :authority ("5 U.S.C. § 6103(a)–(b)" "Exec. Order No. 11582 § 3(a)"))
  (:nth-weekday "Labor Day" 9 :monday 1 :from 1894
   :authority "5 U.S.C. § 6103(a) (Labor Day federal holiday) — research window from 1900")
  (:fixed "Columbus Day" 10 12 :observed :us-federal-in-lieu :from 1937 :to 1970
   :authority "FDR proclamation / 5 U.S.C. § 6103(a) — fixed Oct 12 until Uniform Monday Holiday Act")
  (:nth-weekday "Columbus Day" 10 :monday 2 :from 1971
   :authority "Pub. L. 90-363; 5 U.S.C. § 6103(a) (effective 1971-01-01)")
  (:fixed "Veterans Day" 11 11 :observed :us-federal-in-lieu :from 1900 :to 1970
   :authority "5 U.S.C. § 6103(a) (pre–Uniform Monday Holiday Act; Armistice/Veterans)")
  (:nth-weekday "Veterans Day" 10 :monday 4 :from 1971 :to 1977
   :authority "Pub. L. 90-363; Pub. L. 94-97 returns Nov 11 effective 1978")
  (:fixed "Veterans Day" 11 11 :observed :us-federal-in-lieu :from 1978
   :authority ("Pub. L. 94-97" "5 U.S.C. § 6103(a)–(b)" "Exec. Order No. 11582 § 3(a)"))
  (:nth-weekday "Thanksgiving Day" 11 :thursday 4 :from 1941
   :authority "5 U.S.C. § 6103(a) (fourth Thursday in November; FDR 1941 statute)")
  (:fixed "Christmas Day" 12 25 :from 1900
   :observed :us-federal-in-lieu
   :authority ("5 U.S.C. § 6103(a)–(b)" "Exec. Order No. 11582 § 3(a)")))

;;;; England & Wales bank holidays — Banking and Financial Dealings Act 1971
;;;; Sch.1 (statutory list) plus Royal Proclamations under s.1 for New Year's
;;;; Day, Early May, Good Friday (common law), Christmas Day, and weekend
;;;; substitutes published at https://www.gov.uk/bank-holidays.
;;;; Christmas+Boxing use :UK-PROCLAMATION-SUBSTITUTE (exclusive next weekday).
;;;; Special one-off / relocated bank holidays: data/gb/proclamations.sexp.

(defparameter *gb-proclamations-path*
  (merge-pathnames "data/gb/proclamations.sexp"
                   (asdf:system-source-directory "cl-stack-calendars"))
  "Sexp index of special Royal Proclamations (extras + relocated BH).")

(defun load-gb-proclamations (&optional (path *gb-proclamations-path*))
  "Return alist YEAR → (:authority A :transfers … :suppressed … :uri …)."
  (with-open-file (in path)
    (let ((form (read in)))
      (mapcar
       (lambda (block)
         (let* ((year (getf block :year))
                (auth (getf block :authority))
                (extras (mapcar (lambda (e)
                                  (make-extra-day-transfer e auth))
                                (getf block :extra)))
                (moved (getf block :moved))
                (suppressed '())
                (relocated '()))
           (dolist (entry moved)
             (destructuring-bind (from to &optional name) entry
               (push (normalize-rule-bound from) suppressed)
               (push (make-calendar-transfer :from nil :to to :name name
                                             :authority auth)
                     relocated)))
           (cons year (list :authority auth
                            :transfers (append extras (nreverse relocated))
                            :suppressed (nreverse suppressed)
                            :uri (getf block :uri)))))
       form))))

(defvar *gb-proclamations* nil)

(defun gb-proclamations ()
  (or *gb-proclamations*
      (setf *gb-proclamations* (load-gb-proclamations))))

(defun gb-proclamation-for-year (year)
  "Plist for the proclamation block keyed by YEAR, or NIL."
  (cdr (assoc year (gb-proclamations))))

(defun gb-transfers-for-year (year)
  "Extra/relocated BH TO days whose date falls in YEAR."
  (loop for (_y . plist) in (gb-proclamations)
        nconc (remove-if-not (lambda (tr) (%transfer-touches-year-p tr year))
                             (getf plist :transfers))))

(defun gb-suppressed-for-year (year)
  "Statutory rule dates suppressed (relocated) that fall in YEAR."
  (loop for (_y . plist) in (gb-proclamations)
        nconc (loop for d in (getf plist :suppressed)
                    when (= (date-year d) year)
                    collect d)))

(define-calendar uk-bank-holidays-calendar (:register "GBLO")
  ;; Common-law / customary (not in Bank Holidays Act 1871; observed as rest days).
  (:easter "Good Friday" -2 :from 1900
   :authority ("Common law Good Friday; Banking and Financial Dealings Act 1971"
               "https://www.gov.uk/bank-holidays"))
  (:fixed "Christmas Day" 12 25
   :observed :uk-proclamation-substitute :from 1900
   :authority ("Common law Christmas Day; BFDA 1971 s.1 proclamations for substitutes"
               "https://www.gov.uk/bank-holidays"))
  ;; Bank Holidays Act 1871 (England & Wales) — research window from 1900.
  (:easter "Easter Monday" 1 :from 1900
   :authority ("Bank Holidays Act 1871"
               "Banking and Financial Dealings Act 1971 Sch.1 para.1"))
  (:easter "Whit Monday" 50 :from 1900 :to 1964
   :authority "Bank Holidays Act 1871 — Whit Monday (replaced by Spring BH trial 1965)")
  (:nth-weekday "August Bank Holiday" 8 :monday 1 :from 1900 :to 1964
   :authority "Bank Holidays Act 1871 — first Monday in August (to 1964)")
  (:fixed "Boxing Day" 12 26
   :observed :uk-proclamation-substitute :from 1900
   :authority ("Bank Holidays Act 1871 (26 Dec if weekday); Holidays Extension Act 1875;"
               "BFDA 1971 Sch.1; proclamations for Saturday substitutes"
               "https://www.legislation.gov.uk/ukpga/1971/80/schedule/1"))
  ;; 1965–1970 experimental stagger (White Paper); made permanent by BFDA 1971.
  (:nth-weekday "Spring Bank Holiday" 5 :monday -1 :from 1965
   :authority ("Experimental last Monday in May from 1965; BFDA 1971 Sch.1"
               "https://www.gov.uk/bank-holidays"))
  (:nth-weekday "Summer Bank Holiday" 8 :monday -1 :from 1965
   :authority ("Experimental last Monday in August from 1965; BFDA 1971 Sch.1"
               "https://www.gov.uk/bank-holidays"))
  ;; Post-1971 additions by proclamation / statute practice.
  (:fixed "New Year's Day" 1 1
   :observed :uk-proclamation-substitute :from 1974
   :authority ("Banking and Financial Dealings Act 1971 s.1 (proclamation from 1974)"
               "https://www.gov.uk/bank-holidays"))
  (:nth-weekday "Early May Bank Holiday" 5 :monday 1 :from 1978
   :authority ("Banking and Financial Dealings Act 1971 s.1 (proclamation, from 1978)"
               "https://www.gov.uk/bank-holidays")))

(defun weekend-only-calendar () (make-instance 'weekend-only-calendar))
(defun target-calendar () (make-instance 'target-calendar))
(defun us-federal-holidays-calendar () (make-instance 'us-federal-holidays-calendar))

(defun uk-bank-holidays-calendar (&key year transfers suppressed-dates)
  "England & Wales bank holidays. YEAR attaches special proclamations
(extra BH + relocated Spring/Early May with suppressed original dates)."
  (let ((tr (or transfers (when year (gb-transfers-for-year year))))
        (sup (or suppressed-dates (when year (gb-suppressed-for-year year)))))
    (make-instance 'uk-bank-holidays-calendar
                   :transfers tr
                   :suppressed-dates sup)))

;; ISO aliases for population-order / country-code lookup
(register-calendar "US" (us-federal-holidays-calendar))
(register-calendar "GB" (uk-bank-holidays-calendar))
