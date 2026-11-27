(in-package #:cl-stack-calendars)

;;;; India (egao1980/cl-stack-calendars#42): the gazetted holidays of the
;;;; administrative offices of the Central Government located at Delhi/New
;;;; Delhi, from each year's DoPT Office Memorandum "Holidays to be observed
;;;; in Central Government Offices during the year …": Annexure-I (the 14
;;;; compulsory holidays and the 3 DoPT selects from the 12 optional ones),
;;;; with the later O.M.s that move an Islamic day after the moon is sighted
;;;; or declare a further holiday (Dr B. R. Ambedkar's birthday). Annexure-II,
;;;; the restricted holidays, is (india-holidays-calendar :restricted t).
;;;; Offices outside Delhi follow their State's coordination committee and
;;;; are not modelled; banks follow the Negotiable Instruments Act (RBI).
;;;; Research window: max(1900, 1947).

(defun load-in-dopt-holidays (&optional (path (data-path "in/dopt-holidays.sexp")))
  "Alist YEAR → plist of a data/in/dopt-holidays.sexp block: :AUTHORITY :URI
:CONFIDENCE; :TRANSFERS, the gazetted days of Annexure-I (:HOLIDAYS) with the
block's :AMENDMENTS applied; :RESTRICTED, the restricted holidays of
Annexure-II (:RESTRICTED) with the amendments whose :LIST is :RESTRICTED;
both as CALENDAR-TRANSFERs; :ROWS, every row as written with :KIND
:HOLIDAY, :AMENDMENT or :RESTRICTED; :BLOCK, the block head (rows left out).
An amendment row adds its :DATE to its list and drops the row its :REPLACES
names, ((Y M D) \"name as in the list\"); a row with :WITHDRAWN (the date of
the O.M. that withdrew it) has no effect."
  (mapcar
   (lambda (block)
     (let* ((auth (getf block :authority))
            (amendments (remove-if (lambda (a) (getf a :withdrawn))
                                   (getf block :amendments)))
            (replaced (loop for a in amendments
                            when (getf a :replaces) collect (getf a :replaces)))
            (head (loop for (k v) on block by #'cddr
                        unless (member k '(:holidays :amendments :restricted))
                          append (list k v))))
       (flet ((transfer (row)
                (make-calendar-transfer :to (getf row :date)
                                        :name (getf row :name)
                                        :authority (or (getf row :authority) auth)))
              (replacedp (row)
                (find (list (getf row :date) (getf row :name)) replaced :test #'equal)))
         (flet ((listed (rows list)
                  (append (loop for row in rows
                                unless (replacedp row)
                                  collect (transfer row))
                          (loop for a in amendments
                                when (and (getf a :date)
                                          (eq list (or (getf a :list) :gazetted)))
                                  collect (transfer a)))))
           (cons (getf block :year)
                 (list :authority auth
                       :uri (getf block :uri)
                       :confidence (getf block :confidence)
                       :transfers (listed (getf block :holidays) :gazetted)
                       :restricted (listed (getf block :restricted) :restricted)
                       :rows (append (mapcar (lambda (r) (list* :kind :holiday r))
                                             (getf block :holidays))
                                     (mapcar (lambda (r) (list* :kind :amendment r))
                                             (getf block :amendments))
                                     (mapcar (lambda (r) (list* :kind :restricted r))
                                             (getf block :restricted)))
                       :block head))))))
   (read-data-form path)))

(defvar *in-dopt-holidays* nil)

(defun in-dopt-holidays ()
  (or *in-dopt-holidays*
      (setf *in-dopt-holidays* (load-in-dopt-holidays))))

(defun in-dopt-for-year (year)
  "Plist for the DoPT OM block keyed by YEAR, or NIL."
  (cdr (assoc year (in-dopt-holidays))))

(defun in-dopt-transfers-for-year (year)
  "The gazetted days of the DoPT O.M. for YEAR (Annexure-I with its
amendments), as CALENDAR-TRANSFERs."
  (transfers-touching-year (in-dopt-holidays) year))

(defun in-dopt-restricted-for-year (year)
  "The restricted holidays (Annexure-II) of the DoPT O.M. for YEAR, as
CALENDAR-TRANSFERs: each employee may take two of them."
  (loop for (nil . plist) in (in-dopt-holidays)
        append (loop for tr in (getf plist :restricted)
                     when (= year (date-year (calendar-transfer-to tr)))
                       collect tr)))

(defun in-decree-rows ()
  "Every block head and row of data/in/dopt-holidays.sexp as a plist, with
:CALENDAR \"IN\". Each carries :ISSUED and :PUBLISHED (#93,
docs/AUTHORITIES.md)."
  (loop for (nil . plist) in (in-dopt-holidays)
        append (cons (list* :calendar "IN" (getf plist :block))
                     (mapcar (lambda (r) (list* :calendar "IN" r))
                             (getf plist :rows)))))

(defparameter *in-last-om-year* 2027
  "The last year with a DoPT holiday O.M. in data/in/dopt-holidays.sexp
(O.M. No. 12/2/2023-JCA of 16.07.2026 for 2027).")

(defun in-estimated-year-p (year)
  "True when no DoPT O.M. of data/in lists YEAR's holidays (no Annexure-I
rows; a later O.M. such as the 14 April one may still add a day): the
Islamic days of the rules are tabular estimates and there are no Hindu,
Sikh, Jain or Buddhist days."
  (notany (lambda (row) (eq :holiday (getf row :kind)))
          (getf (in-dopt-for-year year) :rows)))

(defun in-provisional-year-p (year)
  "True for a year after the last DoPT O.M. (*IN-LAST-OM-YEAR*): the fixed
days, Good Friday and estimated Islamic days only."
  (> year *in-last-om-year*))

(defun in-confidence (year)
  ":PRIMARY for a year whose O.M. was read in a DoPT or other government
copy, :PROVISIONAL after the last O.M., :ESTIMATED for an earlier year with
no O.M. listing its holidays (2000, 2001, 2005, 2006 and before)."
  (cond ((in-provisional-year-p year) :provisional)
        ((in-estimated-year-p year) :estimated)
        ((getf (in-dopt-for-year year) :confidence))))

(define-calendar india-holidays-calendar (:register "IN" :constructor india-holidays-calendar)
  ;; Gazetted holidays of the administrative offices of the Central
  ;; Government at Delhi/New Delhi: the 14 compulsory days and the 3 DoPT
  ;; chooses from the 12 optional ones, from each year's DoPT O.M.
  ;; (data/in/dopt-holidays.sexp, Annexure-I and its amendments). The rules
  ;; below give the days whose date is fixed; the Islamic ones are tabular
  ;; estimates for years no O.M. covers (IN-ESTIMATED-YEAR-P).
  (:fixed "Republic Day" 1 26 :from 1950
   :authority ("DoPT O.M. Annexure-I, compulsory holiday 1"
               "Constitution of India — Republic Day from 1950"))
  (:fixed "Independence Day" 8 15 :from 1947
   :authority "DoPT O.M. Annexure-I, compulsory holiday 2; independence 15 August 1947")
  (:fixed "Mahatma Gandhi's Birthday" 10 2 :from 1948
   :authority "DoPT O.M. Annexure-I, compulsory holiday 3")
  (:easter "Good Friday" -2 :from 1947
   :authority "DoPT O.M. Annexure-I, compulsory holiday 8")
  (:fixed "Christmas Day" 12 25 :from 1947
   :authority "DoPT O.M. Annexure-I, compulsory holiday 5")
  (:computed "Id-ul-Fitr (estimated)"
             (lambda (y) (when (in-estimated-year-p y) (eid-al-fitr y))) :from 1947
   :authority "Compulsory holiday 10; tabular 1 Shawwal, only in years no DoPT O.M. covers")
  (:computed "Id-ul-Zuha (Bakrid) (estimated)"
             (lambda (y) (when (in-estimated-year-p y) (eid-al-adha y))) :from 1947
   :authority "Compulsory holiday 11; tabular 10 Dhu al-Hijjah, only in years no DoPT O.M. covers")
  (:computed "Muharram (estimated)"
             (lambda (y) (when (in-estimated-year-p y) (islamic-date-in-gregorian-year y 1 10)))
   :from 1947
   :authority "Compulsory holiday 13; tabular 10 Muharram, only in years no DoPT O.M. covers")
  (:computed "Milad-un-Nabi or Id-e-Milad (estimated)"
             (lambda (y) (when (in-estimated-year-p y) (mawlid-date y))) :from 1947
   :authority "Compulsory holiday 14; tabular 12 Rabi' al-awwal, only in years no DoPT O.M. covers"))

(defun india-holidays-calendar (&key year transfers restricted)
  "Gazetted holidays of the Central Government's administrative offices at
Delhi/New Delhi: the fixed days, and the 17 days of each year's DoPT O.M.
(data/in/dopt-holidays.sexp, with its amendments). Without YEAR every O.M. in
the file applies (the registered \"IN\" calendar); with YEAR only that
year's. TRANSFERS, when given, replaces the file's days. RESTRICTED true
adds the restricted holidays (Annexure-II), of which each employee may take
two: they are not office closures. Years after the last O.M. are
provisional (IN-PROVISIONAL-YEAR-P); confidence by year: IN-CONFIDENCE."
  (let ((tr (or transfers
                (if year
                    (in-dopt-transfers-for-year year)
                    (all-block-transfers (in-dopt-holidays))))))
    (make-instance 'india-holidays-calendar
                   :transfers (if restricted
                                  (append tr
                                          (if year
                                              (in-dopt-restricted-for-year year)
                                              (loop for (nil . plist) in (in-dopt-holidays)
                                                    append (copy-list (getf plist :restricted)))))
                                  tr))))
