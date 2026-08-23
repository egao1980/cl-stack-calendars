;;;; Extract gazette corpora from data/countries/*.sexp for lunar/variable holidays.
;;;; Usage: ros -l scripts/extract-gazette-corpus.lisp -q

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

(defun year-blocks (days match-fn label-fn &key (from 2000) (to 2040))
  (let ((map (make-hash-table)))
    (dolist (row days)
      (destructuring-bind (y m d name &rest _) row
        (declare (ignore _))
        (when (and (<= from y to) (funcall match-fn name))
          (push (list (list y m d) (funcall label-fn name))
                (gethash y map)))))
    (mapcar (lambda (year)
              (cons year (nreverse (gethash year map))))
            (sort (loop for y being the hash-keys of map collect y) #'>))))

(defun write-gazette (path header blocks authority uri)
  (ensure-directories-exist (uiop:pathname-directory-pathname path))
  (let ((*print-case* :downcase)
        (*print-pretty* nil))
    (with-open-file (out path :direction :output :if-exists :supersede
                         :external-format :utf-8)
      (write-line header out)
      (format out "(~%")
      (loop for (year . holidays) in blocks
            for first = t then nil
            do (unless first (terpri out))
               (format out " (:year ~d~%" year)
               (format out "  :authority ~s~%"
                       (uiop:strcat authority " — " (princ-to-string year)))
               (format out "  :uri ~s~%" uri)
               (format out "  :holidays (~%")
               (dolist (h holidays)
                 (destructuring-bind ((y m d) name) h
                   (format out "              ((~d ~d ~d) ~s)~%" y m d name)))
               (format out "              ))~%"))
      (format out ")~%"))))

(defun lk-match-p (name)
  (or (contains-p "පෝය" name)
      (contains-p "වෙසක්" name)
      (contains-p "දීපවාලි" name)))

(defun lk-label (name)
  (cond ((contains-p "දීපවාලි" name) "Deepavali")
        ((contains-p "වෙසක් පෝය දිනට පසු" name) "Day after Vesak Poya")
        ((contains-p "වෙසක්" name) "Vesak Poya")
        (t "Poya Day")))

(defun sg-match-p (name)
  (or (contains-p "Vesak" name)
      (contains-p "Deepavali" name)
      (contains-p "Hari Raya" name)))

(write-gazette
 (merge-pathnames "data/lk/poya-days.sexp" *repo-root*)
 ";;;; Sri Lanka gazetted Poya / Vesak / Deepavali (from MOE circulars; corpus 2000–2040)."
 (year-blocks (country-days "LK") #'lk-match-p #'lk-label)
 "Gazetted public holiday"
 "https://www.documents.gov.lk/")

(write-gazette
 (merge-pathnames "data/sg/gazette-holidays.sexp" *repo-root*)
 ";;;; Singapore MOM gazetted holidays (Vesak, Deepavali, Hari Raya). Corpus 2000–2040."
 (year-blocks (country-days "SG") #'sg-match-p #'identity)
 "MOM gazetted public holiday"
 "https://www.mom.gov.sg/employment-practices/public-holidays")

(format t "~&Wrote LK and SG gazette corpora~%")
(uiop:quit 0)
