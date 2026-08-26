;;;; Install runtime deps for fetch-external-gold.lisp via cl-repository-client.
;;;; Same stack as cl-stack-tzdata/scripts/ci-install-update.lisp:
;;;;   cl-stack-http × http-backend-async × event-backend-libuv + cl-stack-ssl.
;;;;
;;;;   ros -l scripts/install-external-gold.lisp -q
;;;;   ros -l scripts/fetch-external-gold.lisp -q

(setf *debugger-hook*
      (lambda (c h)
        (declare (ignore h))
        (format *error-output* "~&UNHANDLED: ~A~%" c)
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

(call-with-ci-muffles (lambda () (asdf:load-system "cl-repository-client")))

(cl-repo:add-registry "https://ghcr.io" :namespace "egao1980/cl-systems" :priority :prepend)

(call-with-ci-muffles
 (lambda ()
   (cl-repo:ensure-systems '("cl-stack-http" "http-backend-async")
     :with '("event-backend-libuv" "cl-stack-ssl"))))

(format t "~&; install-external-gold: done~%")
(uiop:quit 0)
