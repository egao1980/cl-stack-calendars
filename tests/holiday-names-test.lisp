(in-package #:cl-stack-calendars/tests)

;;;; Holiday names (#12): a substitute day says so where the authority labels
;;;; it; the items folded into earlier releases stay fixed.

(defun %name-on (calendar y m d)
  (multiple-value-bind (holidayp name) (holiday-p calendar (make-date y m d))
    (and holidayp name)))

(deftest usfed-in-lieu-day-says-observed
  "5 U.S.C. 6103(b): the in-lieu day is named \"<holiday> (observed)\"; the
weekend date itself is not a day off (deliberate, see README)."
  (let ((us (find-calendar "USFED")))
    (ok (equal "Independence Day (observed)" (%name-on us 2026 7 3)))
    (ng (holiday-p us (make-date 2026 7 4)))
    (ng (business-day-p us (make-date 2026 7 3)))
    (ok (equal "Independence Day" (%name-on us 2025 7 4)))
    (ok (equal "New Year's Day (observed)" (%name-on us 2021 12 31)))
    (ok (equal "Christmas Day (observed)" (%name-on us 2022 12 26)))
    (ok (equal "Juneteenth (observed)" (%name-on us 2022 6 20)))))

(deftest gb-substitute-day-keeps-govuk-title
  "gov.uk bank-holidays.json titles the substitute day with the holiday's own
name (its notes field says \"Substitute day\"): GB keeps that title."
  (let ((gb (find-calendar "GB")))
    (ok (equal "Boxing Day" (%name-on gb 2022 12 26)))
    (ok (equal "Christmas Day" (%name-on gb 2022 12 27)))
    (ok (equal "New Year's Day" (%name-on gb 2023 1 2)))
    (ng (holiday-p gb (make-date 2022 12 25)))))

(deftest au-substitute-day-label
  "Fair Work Act s. 115: the weekend holiday stays one; the added day is the
\"(substitute day)\" of the official data set."
  (let ((au (find-calendar "AU")))
    (ok (equal "Christmas Day" (%name-on au 2022 12 25)))
    (ok (equal "Boxing Day" (%name-on au 2022 12 26)))
    (ok (equal "Christmas Day (substitute day)" (%name-on au 2022 12 27)))
    (ok (equal "New Year's Day (substitute day)" (%name-on au 2023 1 2)))))

(deftest substitute-name-default-keeps-name
  "A calendar without :SUBSTITUTE-NAME keeps the holiday's name on its
substitute day."
  (ok (equal "Christmas Day" (%name-on (find-calendar "MW") 2022 12 27))))

(deftest cn-2026-names-after-festival
  "#12 item 2, fixed in 0.24.0: the festival names, not 调休 everywhere."
  (let ((cn (find-calendar "CN")))
    (ok (equal "中秋节" (%name-on cn 2026 9 25)))
    (ok (equal "国庆节" (%name-on cn 2026 10 1)))
    (ok (business-day-p cn (make-date 2026 9 20)))))

(deftest de-bank-days-only-on-request
  "#12 item 3: corpus DE defers to the starter (0.31.0); bank days by :TYPES (0.37.0)."
  (ng (holiday-p (country-calendar "DE") (make-date 2024 12 24)))
  (ok (holiday-p (country-calendar "DE" :types '(:public :bank)) (make-date 2024 12 24))))
