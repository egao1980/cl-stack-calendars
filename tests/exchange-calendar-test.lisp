(in-package #:cl-stack-calendars/tests)

;;;; Exchange trading-holiday calendars (data/exchanges/calendars/, #49).

(defparameter *exchange-calendar-mics*
  '("XLON" "IFEU" "XLME"
    "XPAR" "XAMS" "XBRU" "XLIS" "XDUB" "XMIL" "XMAT"
    "XETR" "XEUR" "XEEE" "XSWX" "XWBO" "XMAD"
    "XSTO" "XCSE" "XHEL" "XICE" "XOSL"
    "XWAR" "XBUD" "XPRA" "XATH" "XIST"
    "XTKS" "XOSE" "XKRX" "XTAI"
    "XHKG" "XSHG" "XSHE" "XSGE" "XINE" "XDCE" "XZCE"
    "XNSE" "XBOM" "XIMC" "XASX"
    "XSES" "XKLS" "XIDX" "XPHS" "XBKK" "XSTC"
    "BVMF" "XTSE" "XSAU" "XTAE")
  "MICs whose exchange queries use the exchange's own calendar (provenance
:EXCHANGE). #49 moved them off their national civil calendars by region; the
CME family (#48) is next.")

(defparameter *exchange-calendar-mics-without-gold*
  '("IFEU" "XLME" "XMAT" "XOSE" "XSGE" "XINE" "XDCE" "XZCE" "XIMC" "XSTC")
  "Exchange-calendar MICs that Python exchange_calendars does not cover;
their key dates are checked in EXCHANGE-CALENDARS-WITHOUT-GOLD and the
regional *-EXCHANGE-KEY-DATES tests.")

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

(deftest cee-exchange-key-dates
  "CEE, Athens and Istanbul (#49, 0.41.0): exchange-only closures and sessions."
  ;; BSE does not trade on Hungarian working Saturdays (BSE resolutions).
  (ok (equal (%trading-days "XBUD" '(2024 12 7)) '(nil)))
  ;; GPW closes on 24 and 31 December; ATHEX on Western Good Friday.
  (ok (equal (%trading-days "XWAR" '(2024 12 24) '(2024 12 31)) '(nil nil)))
  (ok (equal (%trading-days "XATH" '(2024 3 29)) '(nil)))
  ;; Borsa Istanbul: the 2023 earthquake closure (KAP notice of 2023-02-08)
  ;; and the 12:30 half day on 28 October.
  (ok (equal (%trading-days "XIST" '(2023 2 8) '(2023 2 14) '(2023 2 15))
             '(nil nil t)))
  (ok (equal (%early-close-hm "XIST" '(2024 10 28)) '(12 30)))
  (ok (equal (%early-close-hm "XIST" '(2027 10 28)) '(12 30))))

(defun %session-hm (mic ymd)
  (mapcar (lambda (s) (list (%hm (exchange-session-spec-open s))
                            (%hm (exchange-session-spec-close s))))
          (exchange-sessions-for-date (find-exchange mic) (apply #'make-date ymd))))

(deftest north-asia-exchange-key-dates
  "XTKS, XOSE, XKRX and XTAI: key dates from the exchanges' own notices."
  ;; TSE: 1-3 Jan and 31 Dec closed (Rule 3); 2020-10-01 arrowhead halt;
  ;; half-holiday (morning only) on the first/last day until 2009-01-05.
  (ok (equal (%trading-days "XTKS" '(2024 1 2) '(2024 1 3) '(2024 12 31) '(2020 10 1))
             '(nil nil nil nil)))
  (ok (equal (%session-hm "XTKS" '(2008 12 30)) '(((9 0) (11 0)))))
  (ok (equal (%session-hm "XTKS" '(2009 12 30)) '(((9 0) (11 0)) ((12 30) (15 0)))))
  (ok (equal (%session-hm "XTKS" '(2011 11 21)) '(((9 0) (11 30)) ((12 30) (15 0)))))
  ;; OSE: holiday trading from 2022-09-23; the 2021-09-17 night session was cancelled.
  (ok (equal (%trading-days "XOSE" '(2022 9 23) '(2023 1 3) '(2022 9 22)) '(t t t)))
  (ok (equal (%trading-days "XOSE" '(2022 1 3) '(2024 1 1)) '(nil nil)))
  (ok (equal (%session-hm "XOSE" '(2021 9 17)) '(((8 45) (15 15)))))
  (ok (equal (%session-hm "XOSE" '(2024 11 5)) '(((8 45) (15 45)) ((17 0) (6 0)))))
  ;; KRX: year-end closing day, first trading day 10:00, CSAT day 10:00-16:30.
  (ok (equal (%trading-days "XKRX" '(2023 12 29) '(2022 12 30) '(2024 12 31)) '(nil nil nil)))
  (ok (equal (%session-hm "XKRX" '(2025 1 2)) '(((10 0) (15 30)))))
  (ok (equal (%session-hm "XKRX" '(2025 1 3)) '(((9 0) (15 30)))))
  (ok (equal (%session-hm "XKRX" '(2021 11 18)) '(((10 0) (16 30)))))
  (ok (null (exchange-late-open (find-exchange "XKRX") (make-date 2025 1 2)))
      "the first-day open is regular hours, not an overlay")
  ;; TWSE: make-up Saturday 2018-12-22 traded, 2019 make-up Saturdays did not;
  ;; Lunar New Year no-trading days; Labor Day.
  (ok (equal (%trading-days "XTAI" '(2018 12 22) '(2000 1 15)) '(t t)))
  (ok (equal (%session-hm "XTAI" '(2018 12 22)) '(((9 0) (13 30)))))
  (ok (equal (%trading-days "XTAI" '(2023 1 18) '(2024 5 1) '(2024 10 31)) '(nil nil nil))))

(deftest greater-china-exchange-key-dates
  "XHKG, XSHG, XSHE and the mainland futures exchanges: key dates from the
exchanges' notices (#49, #92)."
  ;; SARS 2003: every mainland exchange closed 2003-05-06..09, reopened 05-12.
  (dolist (mic '("XSHG" "XSHE" "XSGE" "XDCE" "XZCE"))
    (ok (equal (%trading-days mic '(2003 5 6) '(2003 5 7) '(2003 5 8) '(2003 5 9) '(2003 5 12))
               '(nil nil nil nil t))
        (format nil "~a 2003 SARS closure" mic)))
  ;; 2024-02-09 (除夕) closed on all mainland markets.
  (dolist (mic '("XSHG" "XSHE" "XSGE" "XINE" "XDCE" "XZCE"))
    (ok (equal (%trading-days mic '(2024 2 9)) '(nil)) (format nil "~a 2024-02-09" mic)))
  ;; SHFE Saturday session 2002-09-28; 调休 weekend working days do not trade.
  (ok (equal (%trading-days "XSGE" '(2002 9 28) '(2024 2 4)) '(t nil)))
  (ok (equal (%trading-days "XSHG" '(2024 2 4)) '(nil)))
  ;; SHFE night leg: none before 2013-12-23, none on the first trading day
  ;; after a weekday holiday, none during the 2020 suspension.
  (ok (equal (length (%session-hm "XSGE" '(2013 12 20))) 3))
  (ok (equal (first (%session-hm "XSGE" '(2013 12 23))) '((21 0) (1 0))))
  (ok (equal (first (%session-hm "XSGE" '(2024 10 8))) '((9 0) (10 15)))
      "first trading day after National Day: day session only")
  (ok (equal (first (%session-hm "XSGE" '(2024 10 9))) '((21 0) (1 0))))
  (ok (equal (first (%session-hm "XSGE" '(2024 10 14))) '((21 0) (1 0)))
      "after a plain weekend the night leg stays")
  (ok (equal (first (%session-hm "XSGE" '(2020 3 2))) '((9 0) (10 15))))
  (ok (equal (first (%session-hm "XSGE" '(2020 5 7))) '((21 0) (1 0))))
  (ok (equal (first (%session-hm "XINE" '(2018 3 26))) '((9 0) (10 15))))
  (ok (equal (first (%session-hm "XINE" '(2018 3 27))) '((21 0) (2 30))))
  ;; HKEX: Lunar New Year eve half day (Rule 501(1)); weather closure.
  (ok (equal (%early-close-hm "XHKG" '(2027 2 5)) '(12 0)))
  (ok (equal (%early-close-hm "XHKG" '(2008 2 6)) '(12 30)))
  (ok (equal (%trading-days "XHKG" '(2024 9 6)) '(nil)))
  ;; SSE index circuit breaker 2016-01-07: halted from 09:58.
  (ok (equal (%early-close-hm "XSHG" '(2016 1 7)) '(9 58))))

(deftest india-asx-exchange-key-dates
  "XNSE, XBOM, XIMC and XASX: key dates from the exchanges' notices."
  ;; NSE/CMTR/57285 moves Bakri Id 2023 from 28 to 29 June: a later notice's
  ;; opening revokes the yearly list's closure.
  (ok (equal (%trading-days "XNSE" '(2023 6 28) '(2023 6 29)) '(t nil)))
  (ok (equal (%trading-days "XBOM" '(2023 6 28) '(2023 6 29)) '(t nil)))
  ;; Budget-day weekend sessions; Diwali Laxmi Pujan with Muhurat.
  (ok (equal (%trading-days "XNSE" '(2026 2 1) '(2015 2 28) '(2026 11 8)) '(t t nil)))
  (ok (equal (%segments-hm (exchange-special-sessions-for-date
                            (find-exchange "XNSE") (make-date 2026 11 8)))
             '(((14 20) (15 15)))))
  (ok (equal (%segments-hm (exchange-special-sessions-for-date
                            (find-exchange "XBOM") (make-date 2026 11 8)))
             '(((14 20) (15 30)))))
  ;; NSE hours eras: 09:55 open until 2010-01-01.
  (ok (equal (%session-hm "XNSE" '(2009 12 31)) '(((9 55) (15 30)))))
  ;; MCX 2025: morning-only and evening-only holidays (secondary copy).
  (ok (equal (%trading-days "XIMC" '(2025 10 21) '(2025 2 26)) '(nil t)))
  (ok (equal (%session-hm "XIMC" '(2025 2 26)) '(((17 0) (23 30)))))
  (ok (equal (%early-close-hm "XIMC" '(2025 1 1)) '(17 0)))
  ;; ASX: 14:10 early closes; from 2017 only on 24/31 Dec; Day of Mourning.
  (ok (equal (%early-close-hm "XASX" '(2016 12 23)) '(14 10)))
  (ok (equal (%early-close-hm "XASX" '(2011 12 30)) '(14 10)))
  (ok (null (%early-close-hm "XASX" '(2017 12 22))))
  (ok (equal (%early-close-hm "XASX" '(2024 12 24)) '(14 10)))
  (ok (equal (%trading-days "XASX" '(2022 9 22) '(2024 6 10) '(2024 3 11)) '(nil nil t))))

(deftest southeast-asia-exchange-key-dates
  "XSES, XKLS, XIDX, XPHS, XBKK and XSTC: key dates from the exchanges' notices."
  ;; SGX half days: eve of Chinese New Year, Christmas and New Year; 12:30
  ;; Trading Phase end until 2017-11-12, 12:00 from 2017-11-13 (RN 8.2.1).
  (ok (equal (%early-close-hm "XSES" '(2016 12 30)) nil))
  (ok (equal (%early-close-hm "XSES" '(2015 12 24)) '(12 30)))
  (ok (equal (%early-close-hm "XSES" '(2024 2 9)) '(12 0)))
  ;; Bursa: half-day eves 2010-2022, full days from 2024; ad-hoc 2023-04-21.
  (ok (equal (%early-close-hm "XKLS" '(2022 1 31)) '(12 30)))
  (ok (null (%early-close-hm "XKLS" '(2024 2 9))))
  (ok (equal (%trading-days "XKLS" '(2023 4 21) '(2024 2 1)) '(nil nil)))
  ;; IDX: 31 Dec Libur Bursa from 2010; COVID-era hours; cuti bersama.
  (ok (equal (%trading-days "XIDX" '(2021 12 31) '(2007 12 31)) '(nil t)))
  (ok (equal (%session-hm "XIDX" '(2021 6 4)) '(((9 0) (11 30)) ((13 30) (14 50)))))
  (ok (equal (%session-hm "XIDX" '(2019 6 14)) '(((9 0) (11 30)) ((14 0) (15 50)))))
  ;; PSE: 2022-01-04 trading cancelled; 2021-12-24 half day; COVID hours.
  (ok (equal (%trading-days "XPHS" '(2022 1 4)) '(nil)))
  (ok (equal (%early-close-hm "XPHS" '(2021 12 24)) '(12 10)))
  (ok (equal (%session-hm "XPHS" '(2021 6 1)) '(((9 30) (13 0)))))
  ;; SET: closed after the 2006 coup.
  (ok (equal (%trading-days "XBKK" '(2006 9 20)) '(nil)))
  ;; HOSE: Tết closures from the yearly notices.
  (ok (equal (%trading-days "XSTC" '(2021 2 10) '(2021 2 17)) '(nil t))))

(deftest americas-mena-exchange-key-dates
  "BVMF, XTSE, XSAU and XTAE: key dates from the exchanges' notices."
  ;; B3: no session on 24 Dec or the last weekday of the year; Ash Wednesday
  ;; opens 13:00; São Paulo 9 July closed through 2021, open from 2022.
  (ok (equal (%trading-days "BVMF" '(2024 12 24) '(2023 12 29) '(2021 7 9) '(2022 7 8))
             '(nil nil nil t)))
  (ok (equal (%session-hm "BVMF" '(2025 3 5)) '(((13 0) (18 0)))))
  (ok (equal (%session-hm "BVMF" '(2025 6 2)) '(((10 0) (17 0)))))
  (ok (equal (%session-hm "BVMF" '(2010 12 1)) '(((11 0) (18 0)))))
  (ok (null (%early-close-hm "BVMF" '(2024 12 23))))
  ;; TSX: Christmas Eve 13:00, New Year's Eve regular hours; open on the
  ;; 2022-09-19 State Funeral and on Remembrance Day.
  (ok (equal (%early-close-hm "XTSE" '(2024 12 24)) '(13 0)))
  (ok (null (%early-close-hm "XTSE" '(2024 12 31))))
  (ok (equal (%trading-days "XTSE" '(2022 9 19) '(2024 11 11)) '(t t)))
  ;; Tadawul: Thu-Fri weekend to 2013-06-26, Fri-Sat after; 10:00-13:00 in
  ;; the 2020 COVID era.
  (ok (equal (%trading-days "XSAU" '(2012 6 2) '(2012 6 7) '(2014 6 1) '(2014 6 6))
             '(t nil t nil)))
  (ok (equal (%session-hm "XSAU" '(2020 4 5)) '(((10 0) (13 0)))))
  ;; TASE: Sun-Thu until 2025-12-28, Mon-Fri from 2026-01-05; Sunday and
  ;; Friday hours; Hebrew-calendar closures; Knesset election day.
  (ok (equal (%session-hm "XTAE" '(2024 6 2)) '(((9 59) (15 40)))))
  (ok (equal (%session-hm "XTAE" '(2026 1 9)) '(((9 59) (13 35)))))
  (ok (equal (%trading-days "XTAE" '(2025 12 28) '(2026 1 4) '(2026 1 9)) '(t nil t)))
  (ok (equal (%trading-days "XTAE" '(2024 3 24) '(2024 3 25) '(2022 5 4) '(2022 11 1))
             '(nil t nil nil))
      "Purim closed, Shushan Purim trades, Memorial Day moved up, election day"))

(deftest civil-fixes-found-by-exchange-lists
  "#123: Norway's Ascension Day; #124: Iceland's First Day of Summer is the
first Thursday after 18 April."
  (let ((no (find-calendar "NO"))
        (is (find-calendar "IS")))
    (ok (holiday-p no (make-date 2024 5 9)))
    (ok (holiday-p no (make-date 2027 5 6)))
    (dolist (y '(2002 2013 2019 2024 2030))
      (ok (holiday-p is (make-date y 4 25)) (format nil "IS ~d-04-25" y)))
    ;; 18 April 2019 and 2030 is Maundy Thursday (Skírdagur), a holiday anyway.
    (dolist (y '(2002 2013 2024))
      (ng (holiday-p is (make-date y 4 18)) (format nil "IS ~d-04-18" y)))
    ;; Oslo Børs: closed on Ascension; Nasdaq Iceland on Sumardagurinn fyrsti.
    (ok (equal (%trading-days "XOSL" '(2024 5 9)) '(nil)))
    (ok (equal (%trading-days "XICE" '(2024 4 25) '(2024 4 18)) '(nil t)))))

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
