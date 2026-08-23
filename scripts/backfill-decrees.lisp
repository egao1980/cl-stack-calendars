;;;; Backfill decree/gazette corpora from country sexp where extras are named.
;;;; Merges 2010–2023 blocks into existing transfer files (keeps 2024+ primary).
;;;;
;;;; Usage: ros -l scripts/backfill-decrees.lisp -q

(setf *debugger-hook*
      (lambda (c h)
        (declare (ignore h))
        (format *error-output* "~&error: ~a~%" c)
        (uiop:quit 1)))

(defparameter *repo-root*
  (uiop:pathname-parent-directory-pathname
   (uiop:pathname-directory-pathname *load-truename*)))

(defun read-sexp (path)
  (with-open-file (in path :external-format :utf-8)
    (read in)))

(defun country-days (code)
  (getf (read-sexp (merge-pathnames (format nil "data/countries/~a.sexp" code)
                                    *repo-root*))
        :days))

(defun contains-p (needle string)
  (and needle string (search needle string :test #'char-equal)))

(defun year-blocks (days match-fn &key (from 2010) (to 2023))
  (let ((map (make-hash-table)))
    (dolist (row days)
      (destructuring-bind (y m d name &rest _) row
        (declare (ignore _))
        (when (and (<= from y to) (funcall match-fn name))
          (push (list (list y m d) name) (gethash y map)))))
    (mapcar (lambda (year)
              (cons year (nreverse (gethash year map))))
            (sort (loop for y being the hash-keys of map collect y) #'>))))

(defun make-block (year holidays authority uri)
  (list :year year
        :authority (uiop:strcat authority (princ-to-string year))
        :uri uri
        :holidays holidays))

(defun write-blocks (path header blocks)
  (let ((*print-case* :downcase)
        (*print-pretty* nil))
    (with-open-file (out path :direction :output :if-exists :supersede
                         :external-format :utf-8)
      (write-string header out)
      (format out "(~%")
      (loop for block in blocks
            for first = t then nil
            do (unless first (format out "~%~%"))
               (format out "(:year ~d~%" (getf block :year))
               (format out "  :authority ~s~%" (getf block :authority))
               (format out "  :uri ~s~%" (getf block :uri))
               (format out "  :holidays (~%")
               (dolist (h (getf block :holidays))
                 (destructuring-bind ((y m d) name) h
                   (format out "              ((~d ~d ~d) ~s)~%" y m d name)))
               (format out "              ))"))
      (format out "~%)~%"))))

(defun keep-recent (blocks min-year)
  (remove-if (lambda (b) (< (getf b :year) min-year)) blocks))

(defun sort-year-desc (blocks)
  (sort (copy-list blocks) #'> :key (lambda (b) (getf b :year))))

;;; CL — Feriado Adicional / Día adicional
(let* ((path (merge-pathnames "data/cl/transfers.sexp" *repo-root*))
       (existing (read-sexp path))
       (recent (keep-recent existing 2024))
       (backfill (mapcar (lambda (pair)
                           (make-block (car pair) (cdr pair)
                                       "D.O. — feriado adicional Fiestas Patrias "
                                       "https://www.diariooficial.interior.gob.cl/"))
                         (year-blocks (country-days "CL")
                                      (lambda (n)
                                        (or (contains-p "Feriado Adicional" n)
                                            (contains-p "Día adicional" n))))))
       (blocks (sort-year-desc (append recent backfill))))
  (dolist (b backfill)
    (setf (getf b :authority)
          (format nil "D.O. — feriado adicional Fiestas Patrias ~d (corpus backfill)"
                  (getf b :year))))
  (write-blocks path
                ";;;; Diario Oficial — feriados adicionales / puentes (Fiestas Patrias etc.).
;;;; Coverage: 2010–2026 (2024–2026 primary; 2010–2023 corpus backfill).
"
                blocks)
  (format t "~&CL transfers: ~d year blocks (2010–2023)~%" (length backfill)))

(format t "~&PH/TH/MY/CO: no corpus bridge pattern — 2024–2026 primary blocks unchanged~%")

;;; IN DoPT — curated Annexure-I Hindu/Buddhist/Sikh set (DoPT OMs 2010–2019)
(defparameter *in-dopt-2010-2019*
  '((2019 (3 21 "Holi") (5 18 "Buddha Purnima") (8 24 "Janmashtami")
          (10 8 "Dussehra") (10 27 "Diwali") (11 12 "Guru Nanak Jayanti"))
    (2018 (3 2 "Holi") (4 30 "Buddha Purnima") (9 3 "Janmashtami")
          (10 19 "Dussehra") (11 7 "Diwali") (11 23 "Guru Nanak Jayanti"))
    (2017 (3 13 "Holi") (5 10 "Buddha Purnima") (8 15 "Janmashtami")
          (9 30 "Dussehra") (10 19 "Diwali") (11 4 "Guru Nanak Jayanti"))
    (2016 (3 24 "Holi") (5 21 "Buddha Purnima") (8 25 "Janmashtami")
          (10 11 "Dussehra") (10 30 "Diwali") (11 14 "Guru Nanak Jayanti"))
    (2015 (3 6 "Holi") (5 4 "Buddha Purnima") (9 5 "Janmashtami")
          (10 22 "Dussehra") (11 11 "Diwali") (11 25 "Guru Nanak Jayanti"))
    (2014 (3 17 "Holi") (5 14 "Buddha Purnima") (8 18 "Janmashtami")
          (10 3 "Dussehra") (10 23 "Diwali") (11 6 "Guru Nanak Jayanti"))
    (2013 (3 27 "Holi") (5 25 "Buddha Purnima") (8 28 "Janmashtami")
          (10 13 "Dussehra") (11 3 "Diwali") (11 17 "Guru Nanak Jayanti"))
    (2012 (3 8 "Holi") (5 6 "Buddha Purnima") (8 10 "Janmashtami")
          (10 24 "Dussehra") (11 13 "Diwali") (11 28 "Guru Nanak Jayanti"))
    (2011 (3 20 "Holi") (5 17 "Buddha Purnima") (8 22 "Janmashtami")
          (10 6 "Dussehra") (10 26 "Diwali") (11 10 "Guru Nanak Jayanti"))
    (2010 (3 1 "Holi") (5 27 "Buddha Purnima") (9 2 "Janmashtami")
          (10 17 "Dussehra") (11 5 "Diwali") (11 21 "Guru Nanak Jayanti"))))

(let* ((path (merge-pathnames "data/in/dopt-holidays.sexp" *repo-root*))
       (existing (read-sexp path))
       (recent (keep-recent existing 2020))
       (backfill (mapcar (lambda (row)
                           (destructuring-bind (year &rest entries) row
                             (make-block year
                                         (mapcar (lambda (e)
                                                   (destructuring-bind (mo da name) e
                                                     (list (list year mo da) name)))
                                                 entries)
                                         "DoPT OM — holidays for Central Government offices "
                                         "https://dopt.gov.in/")))
                         *in-dopt-2010-2019*))
       (blocks (sort-year-desc (append recent backfill))))
  (write-blocks path
                ";;;; DoPT Office Memorandum — gazetted compulsory holidays (Hindu/Buddhist/Sikh).
;;;; Attach via (india-holidays-calendar :year N). Islamic set remains computed.
;;;; Coverage: 2010–2026 (DoPT OMs / holiday lists).

"
                blocks)
  (format t "~&IN DoPT: added ~d year blocks (2010–2019)~%" (length backfill)))

(uiop:quit 0)
