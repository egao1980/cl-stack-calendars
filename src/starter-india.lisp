(in-package #:cl-stack-calendars)

;;;; India — three mandatory national holidays (Republic Day, Independence
;;;; Day, Gandhi Jayanti) under the Negotiable Instruments Act 1881 /
;;;; central-government practice, plus commonly gazetted all-India holidays
;;;; (Good Friday, Christmas). Remaining festivals (Holi, Diwali, Eid, …)
;;;; are announced annually in DoPT OMs and often depend on sunrise at a
;;;; reference locus (+DELHI+ / +UJJAIN+) — attach via DATA-CALENDAR or
;;;; year-specific rules; not hard-coded here without a gazetted list.

(define-calendar india-holidays-calendar (:register "IN")
  (:fixed "Republic Day" 1 26
   :authority ("Negotiable Instruments Act 1881 — national holiday"
               "Government of India / DoPT gazetted holidays"))
  (:easter "Good Friday" -2
   :authority "DoPT annual gazetted holidays (Good Friday — all-India)")
  (:fixed "Independence Day" 8 15
   :authority ("Negotiable Instruments Act 1881 — national holiday"
               "Government of India / DoPT gazetted holidays"))
  (:fixed "Mahatma Gandhi's Birthday" 10 2
   :authority ("Negotiable Instruments Act 1881 — national holiday (Gandhi Jayanti)"
               "Government of India / DoPT gazetted holidays"))
  (:fixed "Christmas Day" 12 25
   :authority "DoPT annual gazetted holidays (Christmas — all-India)"))

(defun india-holidays-calendar ()
  (make-instance 'india-holidays-calendar))
