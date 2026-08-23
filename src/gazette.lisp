(in-package #:cl-stack-calendars)

;;;; Shared loader for gazetted annual holiday corpora (DoPT, Poya, Dashain, …).
;;;; Format: ((:year Y :authority A :uri U :holidays (((Y M D) "Name") …)) …)

(defun load-gazette-corpus (&optional path)
  "Return alist YEAR → (:authority A :transfers … :uri …)."
  (let ((form (read-data-form path)))
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
       form)))

(defun gazette-corpus-for-year (corpus year)
  (cdr (assoc year corpus)))

(defun gazette-transfers-for-year (corpus year)
  (loop for (_y . plist) in corpus
        nconc (remove-if-not (lambda (tr) (%transfer-touches-year-p tr year))
                             (getf plist :transfers))))
