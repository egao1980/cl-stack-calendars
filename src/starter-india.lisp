(in-package #:cl-stack-calendars)

;;;; India — Negotiable Instruments Act 1881 three national holidays +
;;;; DoPT compulsory/common gazetted set. Hindu lunar festivals (Holi,
;;;; Diwali, Dussehra, …) are announced annually in DoPT OMs — corpus in
;;;; data/in/dopt-holidays.sexp; attach via (india-holidays-calendar :year N).
;;;; Research window: max(1900, 1947).

(defparameter *in-dopt-holidays-path*
  (merge-pathnames "data/in/dopt-holidays.sexp"
                   (asdf:system-source-directory "cl-stack-calendars"))
  "DoPT OM gazetted Hindu/Buddhist/Jain/Sikh festival dates by year.")

(defun load-in-dopt-holidays (&optional (path *in-dopt-holidays-path*))
  "Return alist YEAR → (:authority A :transfers … :uri …)."
  (with-open-file (in path)
    (let ((form (read in)))
      (mapcar
       (lambda (block)
         (let* ((year (getf block :year))
                (auth (getf block :authority))
                (transfers (mapcar (lambda (e)
                                     (make-extra-day-transfer e auth))
                                   (getf block :holidays))))
           (cons year (list :authority auth
                            :transfers transfers
                            :uri (getf block :uri)))))
       form))))

(defvar *in-dopt-holidays* nil)

(defun in-dopt-holidays ()
  (or *in-dopt-holidays*
      (setf *in-dopt-holidays* (load-in-dopt-holidays))))

(defun in-dopt-for-year (year)
  "Plist for the DoPT OM block keyed by YEAR, or NIL."
  (cdr (assoc year (in-dopt-holidays))))

(defun in-dopt-transfers-for-year (year)
  "DoPT gazetted festival TO days in YEAR."
  (loop for (_y . plist) in (in-dopt-holidays)
        nconc (remove-if-not (lambda (tr) (%transfer-touches-year-p tr year))
                             (getf plist :transfers))))

(define-calendar india-holidays-calendar (:register "IN")
  (:fixed "Republic Day" 1 26 :from 1950
   :authority ("Negotiable Instruments Act 1881 — national holiday"
               "Constitution of India — Republic Day from 1950"))
  (:fixed "Independence Day" 8 15 :from 1947
   :authority ("Negotiable Instruments Act 1881 — national holiday"
               "Independence 15 August 1947"))
  (:fixed "Mahatma Gandhi's Birthday" 10 2 :from 1948
   :authority ("Negotiable Instruments Act 1881 — national holiday (Gandhi Jayanti)"))
  (:easter "Good Friday" -2 :from 1947
   :authority "DoPT gazetted holidays — Good Friday (compulsory outside optional pool)")
  (:fixed "Christmas Day" 12 25 :from 1947
   :authority "DoPT gazetted holidays — Christmas Day")
  (:computed "Id-ul-Fitr" #'eid-al-fitr :from 1947
   :authority "DoPT gazetted — Id-ul-Fitr (tabular Hijri; sighting ±1)")
  (:computed "Id-ul-Zuha (Bakrid)" #'eid-al-adha :from 1947
   :authority "DoPT gazetted — Id-ul-Zuha (tabular Hijri)")
  (:computed "Muharram"
   (lambda (y) (islamic-date-in-gregorian-year y 1 10))
   :from 1947
   :authority "DoPT gazetted — Muharram / Ashura (10 Muharram, tabular)")
  (:computed "Id-e-Milad" #'mawlid-date :from 1947
   :authority "DoPT gazetted — Prophet Mohammad's Birthday (tabular)"))

(defun india-holidays-calendar (&key year transfers)
  "Indian public holidays. YEAR attaches DoPT OM gazetted Hindu/lunar set."
  (let ((tr (or transfers
                (when year (in-dopt-transfers-for-year year)))))
    (make-instance 'india-holidays-calendar :transfers tr)))
