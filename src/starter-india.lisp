(in-package #:cl-stack-calendars)

;;;; India — Negotiable Instruments Act 1881 three national holidays +
;;;; DoPT compulsory/common gazetted set. Hindu lunar festivals (Holi,
;;;; Diwali, Dussehra, …) are announced annually in DoPT OMs and need a
;;;; Hindu calendar locus — attach via DATA-CALENDAR / year rules.
;;;; Research window: max(1900, 1947).

(define-calendar india-holidays-calendar (:register "IN")
  (:fixed "Republic Day" 1 26 :from 1950
   :authority ("Negotiable Instruments Act 1881 — national holiday"
               "Constitution of India — Republic Day from 1950"))
  (:fixed "Independence Day" 8 15 :from 1947
   :authority ("Negotiable Instruments Act 1881 — national holiday"
               "Independence 15 August 1947"))
  (:fixed "Mahatma Gandhi's Birthday" 10 2 :from 1948
   :authority ("Negotiable Instruments Act 1881 — national holiday (Gandhi Jayanti)"))
  (:easter "Good Friday" -2 :from 1947
   :authority "DoPT gazetted holidays — Good Friday (compulsory outside optional pool)")
  (:fixed "Christmas Day" 12 25 :from 1947
   :authority "DoPT gazetted holidays — Christmas Day")
  (:computed "Id-ul-Fitr" #'eid-al-fitr :from 1947
   :authority "DoPT gazetted — Id-ul-Fitr (tabular Hijri; sighting ±1)")
  (:computed "Id-ul-Zuha (Bakrid)" #'eid-al-adha :from 1947
   :authority "DoPT gazetted — Id-ul-Zuha (tabular Hijri)")
  (:computed "Muharram"
   (lambda (y) (islamic-date-in-gregorian-year y 1 10))
   :from 1947
   :authority "DoPT gazetted — Muharram / Ashura (10 Muharram, tabular)")
  (:computed "Id-e-Milad" #'mawlid-date :from 1947
   :authority "DoPT gazetted — Prophet Mohammad's Birthday (tabular)"))

(defun india-holidays-calendar ()
  (make-instance 'india-holidays-calendar))
