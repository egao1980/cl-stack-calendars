(in-package #:cl-stack-calendars/tests)

(deftest data-root-default-is-system-data
  (let ((root (data-root)))
    (ok (data-file-exists-p (data-path "countries/index.sexp")))
    (ok (data-file-exists-p (data-path "countries/DE.sexp")))
    (ok (or (search "data" (sp:as-posix root))
            (search "data" (string (sp:as-posix root)))))))

(deftest data-root-directory-override
  (uiop:with-temporary-file (:pathname tmp :keep t)
    (delete-file tmp)
    (let* ((dir (uiop:ensure-directory-pathname tmp))
           (cc (merge-pathnames "countries/" dir)))
      (unwind-protect
           (progn
             (ensure-directories-exist cc)
             (sp:write-text (merge-pathnames "index.sexp" cc)
                            "((\"ZZ\" \"Zedland\" 1))")
             (sp:write-text (merge-pathnames "ZZ.sexp" cc)
                            "(:code \"ZZ\" :name \"Zedland\" :days ((2024 3 14 \"Pi Day\" :public)))")
             (with-data-root (dir)
               (ok (equal (first (first (list-country-calendars t))) "ZZ"))
               (ok (holiday-p (country-calendar "ZZ") (make-date 2024 3 14)))
               (ng (holiday-p (country-calendar "ZZ") (make-date 2024 3 15)))))
        (uiop:delete-directory-tree dir :validate t :if-does-not-exist :ignore)))))

(deftest data-root-zip-client-bundle
  "Client-app shape: one data.zip of the sexp tree, opened via zip://."
  (uiop:with-temporary-file (:pathname zip :type "zip" :keep t)
    (unwind-protect
         (progn
           (sp:write-zip-file
            zip
            '(("countries/index.sexp" "((\"ZZ\" \"Zedland\" 1))")
              ("countries/ZZ.sexp"
               "(:code \"ZZ\" :name \"Zedland\" :days ((2026 1 1 \"New Year\" :public)))")
              ("formation-years.sexp" "((\"ZZ\" 1999 \"test\"))")))
           (with-data-root (zip)
             (ok (sp:zip-filesystem-p (sp:path-filesystem (data-root))))
             (ok (uiop:string-prefix-p "zip://" (sp:as-uri (data-root))))
             (ok (holiday-p (country-calendar "ZZ") (make-date 2026 1 1)))
             (ok (= 1999 (country-formation-year "ZZ")))))
      (ignore-errors (delete-file zip))
      (sp:clear-zip-filesystem-cache))))
