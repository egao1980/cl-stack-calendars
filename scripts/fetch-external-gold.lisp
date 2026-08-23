;;;; Refresh data/tests/external-gold.sexp from official lists.
;;;;
;;;; Usage:
;;;;   ros -l scripts/install-external-gold.lisp -q   ; once (cl-repo)
;;;;   ros -l scripts/fetch-external-gold.lisp -q
;;;;
;;;; HTTP via cl-stack-http × http-backend-async × event-backend-libuv (dogfood).
;;;; Official:
;;;;   gov.uk bank-holidays.json (England & Wales) — OGL v3
;;;;   内閣府 syukujitsu.csv (国民の祝日・休日) — government work, CP932
;;;;
;;;; vacanza/holidays is a Python library with no CL client. This script keeps
;;;; existing vacanza blocks from the sexp (pinned dump). Official lists win.

(setf *debugger-hook*
      (lambda (c h)
        (declare (ignore h))
        (format *error-output* "~&error: ~a~%" c)
        (uiop:quit 1)))

(setf asdf:*compile-file-failure-behaviour* :warn)

(defun call-with-ci-muffles (fn)
  #+sbcl
  (handler-bind ((sb-ext:defconstant-uneql
                  (lambda (c)
                    (declare (ignore c))
                    (let ((r (find-restart 'continue)))
                      (when r (invoke-restart r))))))
    (funcall fn))
  #-sbcl
  (funcall fn))

(defparameter *repo-root*
  (uiop:pathname-parent-directory-pathname
   (uiop:pathname-directory-pathname *load-truename*)))

(defparameter *workspace-root*
  (uiop:pathname-parent-directory-pathname *repo-root*))

(defun %ensure-ca-file ()
  "cl-stack-ssl overlay OpenSSL has no system trust store unless staged.
   Use SSL_CERT_FILE when already set; else pick a common CA bundle."
  (unless (or (uiop:getenv "SSL_CERT_FILE") (uiop:getenv "SSL_CERT_DIR"))
    (dolist (path '("/etc/ssl/cert.pem"
                    "/etc/ssl/certs/ca-certificates.crt"
                    "/opt/homebrew/etc/openssl@3/cert.pem"
                    "/usr/local/etc/openssl@3/cert.pem"))
      (when (probe-file path)
        (setf (uiop:getenv "SSL_CERT_FILE") (uiop:native-namestring path))
        (return)))))

(defun %ql-setup ()
  (unless (find-package :ql)
    (let ((setup (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname))))
      (when (probe-file setup)
        (load setup))))
  (when (find-package :ql)
    (let ((ql-local (find-symbol "*LOCAL-PROJECT-DIRECTORIES*" :ql)))
      (when (and ql-local (boundp ql-local) (uiop:directory-exists-p *workspace-root*))
        (pushnew (truename *workspace-root*) (symbol-value ql-local)
                 :test #'equal)))))

(defun %load-http-stack ()
  "Workspace Quicklisp local-projects, or cl-repo ASDF registry from install-external-gold."
  (%ql-setup)
  (when (asdf:find-system "cl-repository-client" nil)
    (call-with-ci-muffles (lambda () (asdf:load-system "cl-repository-client")))
    (let ((cfg (find-symbol "CONFIGURE-ASDF-SOURCE-REGISTRY"
                           :cl-repository-client/asdf-integration))
          (init (find-symbol "LOAD-SYSTEM-INIT-FILES"
                            :cl-repository-client/asdf-integration)))
      (when (and cfg (fboundp cfg)) (funcall cfg))
      (when (and init (fboundp init)) (funcall init))))
  (call-with-ci-muffles
   (lambda ()
     (asdf:load-system "cl-stack-ssl")
     (asdf:load-system "event-backend-libuv")
     (asdf:load-system "http-backend-async")
     (asdf:load-system "cl-stack-http"))))

(%ensure-ca-file)
(%load-http-stack)

(setf http-backend-async:*event-backend-maker*
      (lambda () (event-backend-libuv:make-libuv-backend)))
(setf cl-stack-http:*preferred-backend* :async)
(cl-stack-http:ensure-http-backend :async)

(defpackage #:calendars-external-gold
  (:use #:cl)
  (:local-nicknames (#:http #:cl-stack-http)))
(in-package #:calendars-external-gold)

(defparameter *repo-root*
  (uiop:pathname-parent-directory-pathname
   (uiop:pathname-directory-pathname *load-truename*)))

(defparameter *out*
  (merge-pathnames "data/tests/external-gold.sexp" *repo-root*))

(defparameter *govuk-uri* "https://www.gov.uk/bank-holidays.json")
(defparameter *cao-uri* "https://www8.cao.go.jp/chosei/shukujitsu/syukujitsu.csv")
(defparameter *vacanza-uri* "https://github.com/vacanza/holidays")

(defun iso-today ()
  (multiple-value-bind (sec min hour day month year)
      (decode-universal-time (get-universal-time) 0)
    (declare (ignore sec min hour))
    (format nil "~4,'0d-~2,'0d-~2,'0d" year month day)))

(defun seq-map (fn seq)
  (cond ((null seq) '())
        ((vectorp seq) (map 'list fn seq))
        (t (mapcar fn seq))))

(defun jget (table key)
  (gethash key table))

(defun day< (a b)
  (destructuring-bind (ay am ad &rest _) a
    (declare (ignore _))
    (destructuring-bind (by bm bd &rest __) b
      (declare (ignore __))
      (or (< ay by)
          (and (= ay by) (< am bm))
          (and (= ay by) (= am bm) (< ad bd))))))

(defun split-ymd (s separator)
  (let* ((p1 (position separator s))
         (p2 (and p1 (position separator s :start (1+ p1)))))
    (unless (and p1 p2)
      (error "not a Y?M?D date: ~s" s))
    (list (parse-integer s :end p1)
          (parse-integer s :start (1+ p1) :end p2)
          (parse-integer s :start (1+ p2)))))

(defun fetch-bytes (uri)
  ;; Pin HTTP/1.1 — gov.uk ALPN-selects h2; we only need the JSON/CSV body.
  (http:get uri :force-binary t :raise-for-status t :http-version :http/1.1))

(defun fetch-govuk ()
  (let* ((res (fetch-bytes *govuk-uri*))
         (data (http:response-json res))
         (events (jget (jget data "england-and-wales") "events")))
    (sort (seq-map (lambda (ev)
                     (append (split-ymd (jget ev "date") #\-)
                             (list (jget ev "title"))))
                   events)
          #'day<)))

(defun fetch-cao-jp ()
  (let ((res (fetch-bytes *cao-uri*))
        (days '()))
    (http:map-response-lines
     res
     (lambda (line)
       (let ((comma (position #\, line)))
         (when comma
           (let ((ymd (string-trim '(#\Space #\Tab) (subseq line 0 comma)))
                 (name (string-trim '(#\Space #\Tab) (subseq line (1+ comma)))))
             (when (find #\/ ymd)
               (push (append (split-ymd ymd #\/) (list name)) days))))))
     :encoding :cp932)
    (sort days #'day<)))

(defun year-span (days)
  (let ((years (mapcar #'first days)))
    (values (reduce #'min years) (reduce #'max years))))

(defun load-existing ()
  (when (probe-file *out*)
    (with-open-file (in *out*)
      (read in))))

(defun vacanza-blocks (gold)
  (remove-if-not (lambda (b) (equal (getf b :source) "vacanza"))
                 (getf gold :blocks)))

(defun vacanza-source (gold)
  (find "vacanza" (getf gold :sources)
        :key (lambda (s) (getf s :id)) :test #'equal))

(defun write-days (out days)
  (format out "   :days (~%")
  (dolist (row days)
    (destructuring-bind (y m d name) row
      (format out "     (~d ~d ~d ~s)~%" y m d name)))
  (format out "   )~%"))

(defun write-block (out source calendar year-bound from to compare days)
  (format out "  (:source ~s :calendar ~s :year-bound ~a~%"
          source calendar (if year-bound "t" "nil"))
  (format out "   :from ~d :to ~d :compare ~s~%" from to compare)
  (write-days out days)
  (format out "  )~%"))

(defun write-vacanza-block (out block)
  (write-block out
               (getf block :source)
               (getf block :calendar)
               (getf block :year-bound)
               (getf block :from)
               (getf block :to)
               (getf block :compare)
               (getf block :days)))

(defun main ()
  (let* ((existing (load-existing))
         (govuk (fetch-govuk))
         (cao (fetch-cao-jp))
         (vacanza (vacanza-blocks existing))
         (vsrc (or (vacanza-source existing)
                   '(:id "vacanza" :kind :computational
                     :uri "https://github.com/vacanza/holidays"
                     :version "0.82" :license "MIT"))))
    (ensure-directories-exist (uiop:pathname-directory-pathname *out*))
    (let ((*print-case* :downcase)
          (*print-pretty* nil))
    (with-open-file (out *out* :direction :output :if-exists :supersede)
      (format out ";; External holiday gold — regenerate: ros -l scripts/fetch-external-gold.lisp -q~%")
      (format out ";; Official lists beat vacanza; vacanza blocks are a frozen dump (no CL client).~%")
      (format out "(~%")
      (format out " :generated ~s~%" (iso-today))
      (format out " :sources (~%")
      (format out "  (:id \"govuk\" :kind :official :calendar \"GBLO\" :year-bound t~%")
      (format out "   :uri ~s :license \"OGL-3.0\")~%" *govuk-uri*)
      (format out "  (:id \"cao-jp\" :kind :official :calendar \"JP\"~%")
      (format out "   :uri ~s :license \"Japan-government-work\")~%" *cao-uri*)
      (format out "  (:id ~s :kind ~s~%" (getf vsrc :id) (getf vsrc :kind))
      (format out "   :uri ~s :version ~s~%" (getf vsrc :uri) (getf vsrc :version))
      (format out "   :license ~s)~%" (getf vsrc :license))
      (format out " )~%")
      (format out " :blocks (~%")
      (multiple-value-bind (lo hi) (year-span govuk)
        (write-block out "govuk" "GBLO" t lo hi :all govuk))
      (multiple-value-bind (lo hi) (year-span cao)
        (write-block out "cao-jp" "JP" nil lo hi :all cao))
      (mapc (lambda (b) (write-vacanza-block out b)) vacanza)
      (format out " )~%")
      (format out ")~%")))
    (format t "~&wrote ~a govuk=~d cao-jp=~d vacanza=~d~%"
            *out* (length govuk) (length cao)
            (loop for b in vacanza sum (length (getf b :days))))))

(main)
(uiop:quit 0)
