(in-package #:cl-stack-calendars)

;;;; Configurable data root for the shipped .sexp tree.
;;;;
;;;; Default: <system>/data/  (or $CL_STACK_CALENDARS_DATA).
;;;; Client apps set this to a directory, a .zip of that tree, or a zip:// URI
;;;; so a dumped image can ship one archive instead of ~300 sexp files.

(defvar *data-root* nil
  "Resolved pathlib PATH for the calendars data tree. NIL → DEFAULT-DATA-ROOT.")

(defvar *countries-data-directory* nil
  "Override for the countries corpus. NIL → (data-path \"countries/\").
   Directory, .zip, or zip:// URI.")

(defvar *exchanges-data-directory* nil
  "Override for exchange-hours sexps. NIL → (data-path \"exchanges/\").")

(defun %zip-file-p (string)
  (let ((n (length string)))
    (and (>= n 4) (string-equal (subseq string (- n 4)) ".zip"))))

(defun %designator-string (designator)
  (etypecase designator
    (sp:path (sp:as-posix designator))
    (pathname (or (uiop:unix-namestring designator) (namestring designator)))
    (string designator)))

(defun resolve-data-root (designator)
  "Coerce DESIGNATOR to a pathlib PATH (directory, zip archive, or URI)."
  (when (sp:path-p designator)
    (return-from resolve-data-root
      (if (sp:directory-pathname-p designator)
          designator
          (if (and (not (sp:zip-filesystem-p (sp:path-filesystem designator)))
                   (%zip-file-p (sp:as-posix designator)))
              (sp:zip-path (sp:as-posix designator) "/")
              designator))))
  (let ((s (%designator-string designator)))
    (cond
      ((sp:uri-scheme s)
       (sp:ensure-path s))
      ((%zip-file-p s)
       (let ((abs (uiop:unix-namestring
                   (uiop:ensure-absolute-pathname s (uiop:getcwd)))))
         (sp:zip-path abs "/")))
      (t
       (sp:ensure-path s :directory t)))))

(defun default-data-root ()
  "Env CL_STACK_CALENDARS_DATA, else the system's data/ directory."
  (or (uiop:getenv "CL_STACK_CALENDARS_DATA")
      (merge-pathnames "data/"
                       (asdf:system-source-directory "cl-stack-calendars"))))

(defun data-root ()
  "Resolved data root as a pathlib PATH."
  (or *data-root*
      (setf *data-root* (resolve-data-root (default-data-root)))))

(defun data-path (&rest parts)
  "Join PARTS onto DATA-ROOT (works for directories and zip://).
   A final component ending in `/` is a directory."
  (if (null parts)
      (data-root)
      (let* ((p (apply #'sp:join (data-root) parts))
             (last (car (last parts))))
        (if (and (stringp last) (plusp (length last))
                 (char= (char last (1- (length last))) #\/))
            (sp:ensure-directory p)
            p))))

(defun ensure-data-path (designator)
  "Coerce a user path / URI / pathlib path to a PATH."
  (cond
    ((sp:path-p designator) designator)
    ((and (stringp designator) (sp:uri-scheme designator))
     (sp:ensure-path designator))
    (t (sp:ensure-path
        (if (pathnamep designator)
            (or (uiop:unix-namestring
                 (uiop:ensure-absolute-pathname designator (uiop:getcwd)))
                (namestring designator))
            (string designator))))))

(defun read-data-form (designator)
  "READ the first sexp from DESIGNATOR (dir file, zip://, pathlib path)."
  (with-input-from-string (in (sp:read-text (ensure-data-path designator)))
    (read in)))

(defun data-file-exists-p (designator)
  (sp:exists-p (ensure-data-path designator)))

(defun countries-data-directory ()
  (if *countries-data-directory*
      (resolve-data-root *countries-data-directory*)
      (data-path "countries/")))

(defun exchanges-data-directory ()
  (if *exchanges-data-directory*
      (resolve-data-root *exchanges-data-directory*)
      (data-path "exchanges/")))

(defun clear-data-caches ()
  "Drop every cache that was loaded from *DATA-ROOT*."
  (when (fboundp 'clear-country-calendar-cache)
    (clear-country-calendar-cache))
  (let ((cache (find-symbol "*EXCHANGE-HOURS-CACHE*" :cl-stack-calendars)))
    (when (and cache (boundp cache) (hash-table-p (symbol-value cache)))
      (clrhash (symbol-value cache))))
  (dolist (sym '(*formation-years* *population-order*
                 *gb-proclamations* *ru-transfer-decrees*
                 *cn-transfer-notices* *in-dopt-holidays*
                 *id-cuti-bersama* *kr-temporary-holidays*
                 *ph-proclamations* *th-transfers* *my-transfers*
                 *np-gazette* *lk-poya* *sg-gazette* *kh-gazette*
                 *co-transfers* *cl-transfers*))
    (when (boundp sym)
      (setf (symbol-value sym) nil)))
  t)

(defun write-data-zip (destination &optional (root (data-root)))
  "Pack the sexp tree at ROOT into DESTINATION (client-app `data.zip`)."
  (sp:zip-tree root destination))

(defun set-data-root (designator)
  "Point the sexp tree at DESIGNATOR (directory, .zip, zip://, or NIL = default).
   Clears loaded corpora. For client bundles: (set-data-root \"data.zip\")."
  (setf *data-root* (if designator (resolve-data-root designator) nil))
  (clear-data-caches)
  (data-root))

(defmacro with-data-root ((designator) &body body)
  `(let ((*data-root* nil)
         (*countries-data-directory* nil)
         (*exchanges-data-directory* nil))
     (unwind-protect
          (progn (set-data-root ,designator) ,@body)
       (set-data-root nil))))
