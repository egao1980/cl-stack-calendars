(in-package #:cl-stack-calendars/tests)

(defun %hm (tod)
  (list (time-of-day-hour tod) (time-of-day-minute tod)))

(defun %session-hms (mic date)
  (mapcar (lambda (seg)
            (list (%hm (exchange-session-spec-open seg))
                  (%hm (exchange-session-spec-close seg))))
          (exchange-sessions-for-date (find-exchange mic) date)))

(deftest exchange-hours-registry
  (let ((mics (list-exchanges)))
    (ok (equal mics (sort (copy-list mics) #'string<)))
    (dolist (mic '("XNYS" "XNAS" "XLON" "XTKS" "XHKG" "XSHG" "XSHE"
                   "XETR" "XPAR" "XASX" "XTSE" "XNSE" "BVMF" "XKRX" "XSES"
                   "XAMS" "XBRU" "XLIS" "XMIL" "XMAD" "XDUB" "XSWX" "XSTO"
                   "XCSE" "XHEL" "XOSL" "XWBO" "XWAR" "XTAI" "XBKK" "XIDX"
                   "XKLS" "XPHS" "XSTC" "XBOM" "XIST" "XSAU" "XTAE"
                   "XCME" "XNYM" "XCEC" "XCBT" "IFEU" "XLME" "XSGE" "XIMC"))
      (ok (find mic mics :test #'string=) mic))
    (let ((ex (find-exchange "xnys")))
      (ok (string= (exchange-hours-mic ex) "XNYS"))
      (ok (string= (exchange-hours-zone ex) "America/New_York"))
      (ok (string= (exchange-hours-calendar-name ex) "USFED")))))

(deftest nyse-hour-eras
  (ok (equal (%session-hms "XNYS" (make-date 1950 6 5))
             '(((10 0) (15 0)))))           ; Monday
  (ok (equal (%session-hms "XNYS" (make-date 1950 6 3))
             '(((10 0) (12 0)))))           ; Saturday
  (ok (null (%session-hms "XNYS" (make-date 1952 5 31)))) ; Saturday already closed
  (ok (equal (%session-hms "XNYS" (make-date 1952 9 26))
             '(((10 0) (15 0)))))
  (ok (equal (%session-hms "XNYS" (make-date 1952 9 29))
             '(((10 0) (15 30)))))
  (ok (equal (%session-hms "XNYS" (make-date 1974 10 1))
             '(((10 0) (16 0)))))
  (ok (equal (%session-hms "XNYS" (make-date 1985 9 27))
             '(((10 0) (16 0)))))
  (ok (equal (%session-hms "XNYS" (make-date 1985 9 30))
             '(((9 30) (16 0)))))
  (ok (equal (%session-hms "XNYS" (make-date 2024 6 3))
             '(((9 30) (16 0)))))
  (ok (null (%session-hms "XNYS" (make-date 2024 6 1))))) ; Saturday

(deftest nyse-early-closes
  (let ((ex (find-exchange "XNYS")))
    (ok (equal (%hm (exchange-early-close ex (make-date 2024 11 29))) '(13 0)))
    (ok (equal (%session-hms "XNYS" (make-date 2024 11 29))
               '(((9 30) (13 0)))))
    (ok (equal (%hm (exchange-early-close ex (make-date 1992 11 27))) '(14 0)))
    (ok (equal (%hm (exchange-early-close ex (make-date 2024 12 24))) '(13 0)))
    (ok (equal (%hm (exchange-early-close ex (make-date 2025 7 3))) '(13 0)))
    (ng (exchange-early-close ex (make-date 2024 7 3))) ; Wednesday
    (ok (equal (%hm (exchange-early-close ex (make-date 2002 7 5))) '(13 0)))
    (ng (exchange-early-close ex (make-date 2013 7 5)))
    (ok (equal (%hm (exchange-early-close ex (make-date 2003 12 26))) '(13 0)))
    (ok (equal (%hm (exchange-early-close ex (make-date 1999 12 31))) '(13 0)))))

(deftest tse-hours-extension-2024
  (ok (equal (%session-hms "XTKS" (make-date 2024 11 1))
             '(((9 0) (11 30)) ((12 30) (15 0)))))
  (ok (equal (%session-hms "XTKS" (make-date 2024 11 5))
             '(((9 0) (11 30)) ((12 30) (15 30)))))
  (let ((dur-old (exchange-session-duration "XTKS" (make-date 2024 11 1)))
        (dur-new (exchange-session-duration "XTKS" (make-date 2024 11 5))))
    (ok (= (duration-seconds dur-old) 18000))   ; 2.5h + 2.5h
    (ok (= (duration-seconds dur-new) 19800)))) ; 2.5h + 3h

(deftest hkex-hour-phases
  (ok (equal (%session-hms "XHKG" (make-date 2011 3 4))
             '(((10 0) (12 30)) ((14 30) (16 0)))))
  (ok (equal (%session-hms "XHKG" (make-date 2011 3 7))
             '(((9 30) (12 0)) ((13 30) (16 0)))))
  (ok (equal (%session-hms "XHKG" (make-date 2012 3 5))
             '(((9 30) (12 0)) ((13 0) (16 0)))))
  (ok (= (duration-seconds (exchange-session-duration "XHKG" (make-date 2012 3 5)))
         19800)))

(deftest nse-open-moves
  (ok (equal (%session-hms "XNSE" (make-date 2009 12 31))
             '(((9 55) (15 30)))))
  (ok (equal (%session-hms "XNSE" (make-date 2010 1 4))
             '(((9 0) (15 30)))))
  (ok (equal (%session-hms "XNSE" (make-date 2010 10 18))
             '(((9 15) (15 30))))))

(deftest krx-and-sgx-hour-changes
  (ok (equal (%session-hms "XKRX" (make-date 2016 7 29))
             '(((9 0) (15 0)))))
  (ok (equal (%session-hms "XKRX" (make-date 2016 8 1))
             '(((9 0) (15 30)))))
  (ok (equal (%session-hms "XSES" (make-date 2011 7 29))
             '(((9 0) (12 30)) ((14 0) (17 0)))))
  (ok (equal (%session-hms "XSES" (make-date 2011 8 1))
             '(((9 0) (17 0)))))
  (ok (equal (%session-hms "XSES" (make-date 2017 11 13))
             '(((9 0) (12 0)) ((13 0) (17 0))))))

(deftest lunch-excluded-from-open-p
  (multiple-value-bind (open close pairs)
      (exchange-session-bounds "XTKS" (make-date 2024 6 3))
    (declare (ignore open close))
    (ok (= (length pairs) 2))
    (destructuring-bind ((am-open am-close) (pm-open pm-close)) pairs
      (ok (exchange-open-p "XTKS" am-open :date (make-date 2024 6 3)))
      (ng (exchange-open-p "XTKS" am-close :date (make-date 2024 6 3)))
      (let ((lunch (make-instant
                    (floor (+ (instant-seconds am-close) (instant-seconds pm-open)) 2))))
        (ng (exchange-open-p "XTKS" lunch :date (make-date 2024 6 3))))
      (ok (exchange-open-p "XTKS" pm-open :date (make-date 2024 6 3)))
      (ng (exchange-open-p "XTKS" pm-close :date (make-date 2024 6 3))))))

(deftest lse-sets-and-early-close
  (ok (equal (%session-hms "XLON" (make-date 1986 10 24))
             '(((9 30) (15 30)))))
  (ok (equal (%session-hms "XLON" (make-date 1986 10 27))
             '(((9 0) (17 0)))))
  (ok (equal (%session-hms "XLON" (make-date 1997 10 20))
             '(((8 0) (16 30)))))
  (ok (equal (%session-hms "XLON" (make-date 2024 12 24))
             '(((8 0) (12 30)))))
  (ok (equal (%session-hms "XLON" (make-date 2022 12 30))
             '(((8 0) (12 30)))))) ; Friday before NYE Saturday

(deftest saturday-session-bounds
  (multiple-value-bind (open close)
      (exchange-session-bounds "XNYS" (make-date 1950 6 3))
    (ok (< open close))
    (ok (= (duration-seconds (exchange-session-duration "XNYS" (make-date 1950 6 3)))
           7200))))

(deftest eu-and-asia-hour-eras
  (ok (equal (%session-hms "XAMS" (make-date 2024 6 3)) '(((9 0) (17 30)))))
  (ok (equal (%session-hms "XDUB" (make-date 2024 6 3)) '(((8 0) (16 30)))))
  (ok (equal (%session-hms "XOSL" (make-date 2024 6 3)) '(((9 0) (16 20)))))
  (ok (equal (%session-hms "XHEL" (make-date 2024 6 3)) '(((10 0) (18 30)))))
  (ok (equal (%session-hms "XTAI" (make-date 2000 12 29)) '(((9 0) (12 0)))))
  (ok (equal (%session-hms "XTAI" (make-date 2001 1 2)) '(((9 0) (13 30)))))
  (ok (equal (%session-hms "XBKK" (make-date 2024 3 22))
             '(((10 0) (12 30)) ((14 30) (16 30)))))
  (ok (equal (%session-hms "XBKK" (make-date 2024 3 25))
             '(((10 0) (12 30)) ((14 0) (16 30)))))
  (ok (equal (%session-hms "XPHS" (make-date 2011 9 30)) '(((9 30) (12 0)))))
  (ok (equal (%session-hms "XPHS" (make-date 2012 1 2))
             '(((9 30) (12 0)) ((13 30) (15 30)))))
  (ok (equal (%session-hms "XIDX" (make-date 2024 6 3))
             '(((9 0) (12 0)) ((13 30) (15 50)))))
  (ok (equal (%session-hms "XIDX" (make-date 2024 6 7))
             '(((9 0) (11 30)) ((14 0) (15 50)))))) ; Friday

(deftest sun-thu-markets
  (ok (equal (%session-hms "XSAU" (make-date 2013 6 26)) '(((10 0) (15 0))))) ; Wed
  (ok (null (%session-hms "XSAU" (make-date 2013 6 27)))) ; Thu old weekend
  (ok (null (%session-hms "XSAU" (make-date 2013 6 29)))) ; transition
  (ok (equal (%session-hms "XSAU" (make-date 2013 6 30)) '(((10 0) (15 0))))) ; Sun
  (ok (null (%session-hms "XSAU" (make-date 2024 6 7))))  ; Friday
  (ok (equal (%session-hms "XTAE" (make-date 2024 6 2)) '(((10 0) (17 15))))) ; Sun
  (ok (null (%session-hms "XTAE" (make-date 2024 6 7))))) ; Fri

(deftest commodity-overnight-sessions
  (ok (eq (exchange-hours-kind (find-exchange "XCME")) :commodities))
  (ok (equal (%session-hms "XCME" (make-date 2024 6 3))
             '(((17 0) (16 0)))))
  (ok (null (%session-hms "XCME" (make-date 2024 6 1)))) ; Saturday
  (ok (= (duration-seconds (exchange-session-duration "XCME" (make-date 2024 6 3)))
         82800)) ; 17:00 Sun–16:00 Mon = 23h
  (multiple-value-bind (open close)
      (exchange-session-bounds "XCME" (make-date 2024 6 3))
    (let* ((zone (resolve-zone-id "America/Chicago"))
           (open-z (instant-in-zone open zone))
           (close-z (instant-in-zone close zone)))
      (ok (= (zoned-moment-date open-z) (make-date 2024 6 2)))
      (ok (= (zoned-moment-date close-z) (make-date 2024 6 3)))
      (ok (exchange-open-p "XCME" open))
      (ng (exchange-open-p "XCME" close))))
  (ok (equal (%session-hms "IFEU" (make-date 2024 6 3)) '(((1 0) (23 0)))))
  (ok (equal (%session-hms "XLME" (make-date 2024 6 3)) '(((1 0) (19 0)))))
  (ok (equal (%session-hms "XIMC" (make-date 2024 6 3)) '(((9 0) (23 30)))))
  (let ((shfe (find-exchange "XSGE"))
        (d (make-date 2024 6 3)))
    (ok (exchange-session-spec-overnight
         (first (exchange-sessions-for-date shfe d))))
    (ok (= (duration-seconds (exchange-session-duration "XSGE" d))
           (+ (* 4 3600)   ; 21:00–01:00
              (* 75 60)    ; 09:00–10:15
              3600         ; 10:30–11:30
              (* 90 60)))))) ; 13:30–15:00 = 4h + 1.25h + 1h + 1.5h = 7.75h = 27900s
