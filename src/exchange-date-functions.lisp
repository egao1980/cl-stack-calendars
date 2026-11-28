(in-package #:cl-stack-calendars)

;;;; Named date functions for exchange rules (#49). Exchange calendar files
;;;; name them in :COMPUTED rules and :FUNCTION early-close / late-open rules
;;;; (EXCHANGE-DATE-FUNCTION); data is read without evaluation. Each takes a
;;;; Gregorian YEAR and returns a DATE, or NIL when the day does not occur
;;;; that year. One small function per exchange rule, so each can move to
;;;; the logic family on its own later.

;;; --- year end ---------------------------------------------------------------

(defun last-weekday-of-year (year)
  "The last Monday-Friday on or before 31 December of YEAR (B3: 'último dia
útil do ano', no trading session)."
  (loop for date = (make-date year 12 31) then (- date 1)
        when (<= 1 (date-day-of-week date) 5)
          return date))

(defun krx-year-end-closing-day (year)
  "KRX 연말휴장일: 31 December, or the Friday before when 31 December falls on
a Saturday or Sunday (Global KRX: 'Last day of the year (other than a public
holiday or Saturday)')."
  (last-weekday-of-year year))

(defun first-business-day-of-year (calendar-name year)
  "The first business day of YEAR on the registered calendar CALENDAR-NAME."
  (let ((calendar (find-calendar calendar-name)))
    (loop for date = (make-date year 1 1) then (+ date 1)
          when (business-day-p calendar date)
            return date)))

(defun krx-first-trading-day (year)
  "The first KRX trading day of YEAR (개장일), when the regular session opens
an hour late for the market opening ceremony."
  (first-business-day-of-year "XKRX" year))

(defun last-business-day-before (calendar-name date)
  "The last business day before DATE on the registered calendar CALENDAR-NAME."
  (let ((calendar (find-calendar calendar-name)))
    (loop for d = (- date 1) then (- d 1)
          when (business-day-p calendar d)
            return d)))

(defun asx-last-trading-day-before-christmas (year)
  "The last ASX trading day before Christmas Day of YEAR (early close 14:10
until 2016, whatever its weekday)."
  (last-business-day-before "XASX" (make-date year 12 25)))

(defun asx-last-trading-day-of-year (year)
  "The last ASX trading day of YEAR (early close 14:10 until 2016)."
  (last-business-day-before "XASX" (make-date (1+ year) 1 1)))

(defun nyse-election-day (year)
  "NYSE Election Day closing: the Tuesday after the first Monday of November,
every year through 1968, then presidential years only (1972-1980), per the
NYSE's History of New York Stock Exchange Holidays. NIL in other years."
  (when (or (<= year 1968) (zerop (mod year 4)))
    (+ (nth-weekday-of-month year 11 1 1) 1)))

;;; --- Lunar New Year ---------------------------------------------------------

(defun hk-lunar-new-year-eve (year)
  "The day before Lunar New Year's Day (農曆年初一) of YEAR (HKEX Rule 501(1):
no afternoon session on the eve of Lunar New Year). It may be a weekend day,
when the rule does not apply."
  (- (chinese-new-year-date year) 1))

(defun lunar-new-year-eve (year)
  "The day before Lunar New Year's Day of YEAR on the UTC+8 meridian (China,
Hong Kong, Singapore, Malaysia). It may be a weekend day."
  (- (chinese-new-year-date year) 1))

;;; --- Hebrew calendar (TASE) -------------------------------------------------
;;;
;;; Months in Tishrei = 1 numbering (datetime-protocol HEBREW-*): Tishrei-based
;;; dates go through HEBREW-HOLIDAY-IN-GREGORIAN-YEAR, Nisan-based ones through
;;; HEBREW-FROM-NISAN-IN-GREGORIAN-YEAR (offset 0 = Nisan, -1 = Adar / Adar II,
;;; 1 = Iyar, 2 = Sivan, 4 = Av).

(defun il-purim (year)
  "Purim: 14 Adar (14 Adar II in a leap year)."
  (hebrew-from-nisan-in-gregorian-year year -1 14))

(defun il-erev-pesach (year)
  "Passover eve: 14 Nisan."
  (hebrew-from-nisan-in-gregorian-year year 0 14))

(defun il-erev-pesach-seventh (year)
  "Eve of the seventh day of Passover: 20 Nisan."
  (hebrew-from-nisan-in-gregorian-year year 0 20))

(defun il-independence-day-observed (year)
  "Yom HaAtzmaut as observed: 5 Iyar, brought forward to Thursday when 5 Iyar
falls on a Friday (4 Iyar) or Saturday (3 Iyar), and postponed to Tuesday
(6 Iyar) when it falls on a Monday from 2004."
  (let ((date (hebrew-from-nisan-in-gregorian-year year 1 5)))
    (when date
      (case (date-day-of-week date)
        (5 (- date 1))
        (6 (- date 2))
        (1 (if (>= year 2004) (+ date 1) date))
        (t date)))))

(defun il-memorial-day-observed (year)
  "Yom HaZikaron as observed: the day before IL-INDEPENDENCE-DAY-OBSERVED."
  (let ((date (il-independence-day-observed year)))
    (when date (- date 1))))

(defun il-erev-shavuot (year)
  "Shavuot eve: 5 Sivan."
  (hebrew-from-nisan-in-gregorian-year year 2 5))

(defun il-tisha-bav-observed (year)
  "Tisha B'Av as observed: 9 Av, postponed to Sunday 10 Av when 9 Av is a
Saturday."
  (let ((date (hebrew-from-nisan-in-gregorian-year year 4 9)))
    (when date
      (if (= (date-day-of-week date) 6) (+ date 1) date))))

(defun il-erev-rosh-hashanah (year)
  "Rosh Hashanah eve: 29 Elul, the day before 1 Tishrei."
  (let ((date (hebrew-holiday-in-gregorian-year year 1 1)))
    (when date (- date 1))))

(defun il-erev-yom-kippur (year)
  "Yom Kippur eve: 9 Tishrei."
  (hebrew-holiday-in-gregorian-year year 1 9))

(defun il-erev-sukkot (year)
  "Sukkot eve: 14 Tishrei."
  (hebrew-holiday-in-gregorian-year year 1 14))

(defun il-erev-simchat-torah (year)
  "Simchat Torah eve (Hoshana Rabbah): 21 Tishrei."
  (hebrew-holiday-in-gregorian-year year 1 21))
