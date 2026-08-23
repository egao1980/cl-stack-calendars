;;;; Rebuild data/countries/index.sexp (+ missing stubs) from shipped country sexps.
;;;;
;;;; The per-country :days tables are a frozen dump of commenthol/date-holidays
;;;; (CC BY-SA 3.0). date-holidays is JS-only — we do not ship a Node generator.
;;;;
;;;; Usage: ros -l scripts/generate-country-holidays.lisp -q
;;;;    or: sbcl --script scripts/generate-country-holidays.lisp

(setf *debugger-hook*
      (lambda (c h)
        (declare (ignore h))
        (format *error-output* "~&error: ~a~%" c)
        (uiop:quit 1)))

(defparameter *repo-root*
  (uiop:pathname-parent-directory-pathname
   (uiop:pathname-directory-pathname *load-truename*)))

(defparameter *countries-dir*
  (merge-pathnames "data/countries/" *repo-root*))

(defparameter *stub-extras*
  '(("PS" "Palestine" "ISO 3166-1; not in date-holidays — extend from local decree")
    ("NCY" "Northern Cyprus" "Unrecognized; extend from local calendar")
    ("PMR" "Transnistria" "Unrecognized; extend from local calendar")
    ("ABH" "Abkhazia" "Limited recognition — extend from local calendar")
    ("OST" "South Ossetia" "Limited recognition — extend from local calendar")
    ("SOL" "Somaliland" "Unrecognized — extend from local calendar")))

(defun read-sexp (path)
  (with-open-file (in path :external-format :utf-8)
    (read in)))

(defun country-sexp-path (code)
  (merge-pathnames (format nil "~a.sexp" code) *countries-dir*))

(defun write-stub (code name note)
  (let ((path (country-sexp-path code)))
    (when (probe-file path)
      (return-from write-stub nil))
    (with-open-file (out path :direction :output :if-exists :error
                         :external-format :utf-8)
      (format out ";; Stub — add :days from local statute/decree.~%")
      (format out "(~%")
      (format out " :code ~s~%" code)
      (format out " :name ~s~%" name)
      (format out " :source \"stub\"~%")
      (format out " :note ~s~%" note)
      (format out " :days ()~%")
      (format out ")~%"))
    t))

(defun country-files ()
  (remove-if (lambda (p)
               (string-equal (pathname-name p) "index"))
             (directory (merge-pathnames "*.sexp" *countries-dir*))))

(defun file-row (path)
  (let* ((plist (read-sexp path))
         (code (getf plist :code))
         (name (getf plist :name))
         (days (getf plist :days)))
    (list code name (length days) (equal (getf plist :source) "stub"))))

(defun write-index (rows)
  (let* ((stub-codes (mapcar #'first *stub-extras*))
         (regular (sort (remove-if (lambda (r) (member (first r) stub-codes :test #'equal))
                                   rows)
                        #'string< :key #'first))
         (stubs (mapcar (lambda (code)
                          (or (find code rows :key #'first :test #'equal)
                              (list code
                                    (second (find code *stub-extras* :key #'first :test #'equal))
                                    0)))
                        stub-codes))
         (all (append regular stubs))
         (path (merge-pathnames "index.sexp" *countries-dir*))
         (*print-case* :downcase))
    (with-open-file (out path :direction :output :if-exists :supersede
                         :external-format :utf-8)
      (format out ";; Country holiday index (date-holidays + stubs)~%")
      (format out "(~%")
      (dolist (row all)
        (format out " (~s ~s ~d)~%" (first row) (second row) (third row)))
      (format out ")~%"))
    (length all)))

(dolist (extra *stub-extras*)
  (destructuring-bind (code name note) extra
    (when (write-stub code name note)
      (format t "~&wrote stub ~a~%" code))))

(let* ((rows (mapcar #'file-row (country-files)))
       (n (write-index rows))
       (days (reduce #'+ rows :key #'third)))
  (format t "~&index: ~d countries, ~d day entries~%" n days))

(uiop:quit 0)
