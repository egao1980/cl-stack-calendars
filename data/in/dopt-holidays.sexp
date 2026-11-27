;;;; India — gazetted holidays of the administrative offices of the Central
;;;; Government located at Delhi/New Delhi, one block per year: the DoPT Office
;;;; Memorandum "Holidays to be observed in Central Government Offices during
;;;; the year …". :holidays is Annexure-I (the 14 compulsory holidays and the 3
;;;; DoPT selects from the 12 optional ones) and :restricted Annexure-II, both
;;;; as printed (names and dates; weekdays checked by
;;;; scripts/generate_asia_holiday_gold.py IN). :amendments are the later O.M.s:
;;;; 14 April (Dr B. R. Ambedkar's birthday), moon-sighting changes of an
;;;; Islamic holiday (:replaces names the listed day it moves; :withdrawn marks
;;;; an O.M. withdrawn by a later one), closures of the Delhi offices (2010
;;;; Commonwealth Games, 2023 G-20) and restricted-list corrections (:list
;;;; :restricted). Text-only corrigenda and the half-day closing of 22.01.2024
;;;; are left out. 2000, 2005 and 2006 have no annual O.M. (only the 14 April
;;;; one); 2001 has none. Every block and row carries :issued (the O.M. date)
;;;; and :published (#93), NIL with a :dates-note when not found.
;;;; Read by india-holidays-calendar (src/starter-india.lisp).

(
 (:year 2000
  :authority "No DoPT holiday O.M. for 2000 was found; this block holds only the later O.M.s, and the Islamic days of 2000 are tabular estimates"
  :uri nil
  :issued nil :published nil :dates-note "no annual O.M. for 2000 was found (see docs/AUTHORITIES.md)"
  :holidays (
   )
  :restricted (
   )
  :amendments (
   (:date (2000 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/5/2000-JCA dated 27.03.2000: declares 14 April a holiday for all Central Government offices"
    :note "Date typed '2?nd' overwritten by hand to 27th; closed holiday."
    :issued (2000 3 27) :issued-uri "https://web.archive.org/web/20210924054654id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2000-JCA-27032000.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2002
  :confidence :primary
  :authority "DoPT O.M. No. 12/6/2001-JCA dated 10.07.2001: Holidays to be observed in Central Government Offices during the year 2002, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html"
  :note "HTML compilation 'Holiday Policy & Hours of Work' (jcm3.html) reproducing the OM text; Annexure-I footnote: '* Holi - 29th March - holiday on account of Good Friday'. No Christmas Eve RH."
  :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2002 1 26) :name "Republic Day"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 2 23) :name "Idul' Zuha (Bakrid)"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 3 12) :name "Maha Shivaratri"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 3 25) :name "Muharram"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 3 29) :name "Good Friday"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 4 25) :name "Mahabir Jayanti"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 5 25) :name "Milad-Un-Nabi (Birthday of Prophet Md.)"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 5 26) :name "Buddha Purnima"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 8 15) :name "Independence Day"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 8 30) :name "Janmashtami"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 10 2) :name "Mahatma Gandhi Birthday"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 10 14) :name "Dussehra (Mahanavami)"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 10 15) :name "Dussehra(Vijaya Dashami"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 11 4) :name "Diwali (Deepavali)"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 11 19) :name "Guru Nanak's Birthday"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 12 6) :name "Idu'l Fitr"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 12 25) :name "Christmas Day"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2002 1 1) :name "New Year's Day"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 1 14) :name "Makara Sankaranti"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 1 14) :name "Pongal"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 1 21) :name "Guru Gobind Singh's Birthday"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 2 17) :name "Bansanta Panchami /Shree Panchami"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 2 27) :name "Guru Ravidas's Birthday"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 3 8) :name "Maharishi Dayanand Sarasvati Jayanti"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 3 28) :name "Holi (Holikadahana, Dolyatra)"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 3 29) :name "Holi"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 4 13) :name "Chaitra Sukhladi / Gudi Padava / Ugadi / Cheti Chand"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 4 14) :name "Vaisakhi"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 4 14) :name "Mesadi"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 4 14) :name "Vishu"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 4 15) :name "Vaisakhadi(Bengal)/ Bahag Bihu"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 4 21) :name "Ram Navmi"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 7 12) :name "Rath Yatra"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 8 21) :name "Parasi New Year"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 8 21) :name "Onam"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 8 22) :name "Rakha Bandhan"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 9 10) :name "Ganesh Chaturthi/ Vinayaka Chaturthi"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 9 21) :name "Hazarat Ali's Birthday"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 10 12) :name "Dussehra (Maha Saptami)"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 10 13) :name "Dussehra (Maha Astami)"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 10 21) :name "Maharishi Valmiki's Birthday"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 11 3) :name "Deepavali (South India)"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 11 3) :name "Naraka Chaturdasi"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 11 5) :name "Govardhan Puja"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 11 6) :name "Bhai Duj"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 11 29) :name "Jumat-Ul-Vida"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2002 12 8) :name "Guru Teg Bahadur Martyrdrom Day"
    :issued (2001 7 10) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   ))
 (:year 2003
  :confidence :primary
  :authority "DoPT O.M. No. 12/4/2002-JCA dated 15.07.2002: Holidays to be observed in Central Government Offices during the year 2003, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html"
  :note "Same HTML compilation as 2002."
  :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2003 1 26) :name "Republic Day"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 2 12) :name "Idul' Zuha (Bakrid)"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 3 14) :name "Muharram"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 3 19) :name "Holi"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 4 11) :name "Ram Navami"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 4 15) :name "Mahavir Jayanti"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 4 18) :name "Good Friday"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 5 14) :name "Milad-Un-Nabi (Birthday of Prophet Md.)"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 5 16) :name "Buddha Purnima"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 8 15) :name "Independence Day"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 8 20) :name "Janmashtami"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 10 2) :name "Mahatma Gandhi Birthday"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 10 4) :name "Dussehra(Vijaya Dashami"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 10 25) :name "Diwali (Deepavali)"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 11 8) :name "Guru Nanak's Birthday"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 11 26) :name "Idu'l Fitr"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 12 25) :name "Christmas Day"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2003 1 1) :name "New Year's Day"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 1 9) :name "Guru Govind Singh's Birthday"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 1 14) :name "Makara Sankaranti"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 1 15) :name "Pongal"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 2 6) :name "Bansanta Panchami /Shree Panchami"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 2 16) :name "Guru Ravidas's Birthday"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 2 26) :name "Maharishi Dayanand Sarasvati Jayanti"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 3 1) :name "Maha Shivaratri"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 3 18) :name "Holi (Holikadahana, Dolyatra)"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 4 2) :name "Chaitra Sukhladi / Gudi Padava / Ugadi / Cheti Chand"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 4 14) :name "Vaisakhi"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 4 14) :name "Mesadi"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 4 15) :name "Vishu"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 4 15) :name "Vaisakhadi(Bengal)/ Bahag Bihu"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 7 1) :name "Rath Yatra"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 8 12) :name "Raksha Bandhan"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 8 21) :name "Parasi New Year"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 8 31) :name "Ganesh Chaturthi/ Vinayaka Chaturthi"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 9 8) :name "Onam"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 9 10) :name "Hazarat Ali's Birthday"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 10 2) :name "Dussehra(Maha Saptami) (Additional)"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 10 3) :name "Dussehra (Maha Astami) (Additional)"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 10 4) :name "Dussehra ( Maha Navami) (Additional)"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 10 10) :name "Maharishi Valmiki's Birthday"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 10 24) :name "Deepavali (South India)"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 10 24) :name "Naraka Chaturdasi"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 10 25) :name "Govardhan Puja"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 10 26) :name "Bhai Duj"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 11 21) :name "Jumat-Ul-Vida"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 11 28) :name "Guru Teg Bahadur Martyrdrom Day"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 12 24) :name "Christmas Eve"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2003 12 29) :name "Guru Govind Singh's Birthday"
    :issued (2002 7 15) :issued-uri "https://web.archive.org/web/20071022070447id_/http://persmin.gov.in/cirular_reports/jca/jcm3.html" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   (:date (2003 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/4/2003-JCA dated 04.04.2003: declares 14 April a holiday for all Central Government offices"
    :issued (2003 4 4) :issued-uri "https://web.archive.org/web/20210924050258id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2003-JCA-04042003.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2004
  :confidence :primary
  :authority "DoPT O.M. No. 12/5/2003-JCA dated 03.07.2003: Holidays to be observed in Central Government Offices during the year 2004, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf"
  :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2004 1 26) :name "Republic Day"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 2 2) :name "Idu'Z Zuha (Bakrid)"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 2 18) :name "Maha Shivaratri"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 3 2) :name "Muharram"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 3 30) :name "Ram Navami"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 4 3) :name "Mahavir Jayanti"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 4 9) :name "Good Friday"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 5 2) :name "Milad-Un-Nabi (Birthday of Prophet Md.)"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 5 4) :name "Buddha Purnima"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 8 15) :name "Independence Day"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 9 7) :name "Janmashtami"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 10 2) :name "Mahatma Gandhi Birthday"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 10 22) :name "Dussehra(Vijaya Dashami"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 11 12) :name "Diwali (Deepavali)"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 11 15) :name "Idu'l Fitr"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 11 26) :name "Guru Nanak's Birthday"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 12 25) :name "Christmas Day"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2004 1 1) :name "New Year's Day"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 1 5) :name "Guru Govind Singh's Birthday"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 1 15) :name "Makara Sankaranti"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 1 16) :name "Pongal"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 1 26) :name "Bansanta Panchami /Shree Panchami"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 2 6) :name "Guru Ravidas's Birthday"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 2 15) :name "Maharishi Dayanand Sarasvati Jayanti"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 3 6) :name "Holi (Holikadahana, Dolyatra)"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 3 21) :name "Chaitra Sukhladi / Gudi Padava / Ugadi / Cheti Chand"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 4 13) :name "Vaisakhi"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 4 13) :name "Mesadi"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 4 14) :name "Vishu"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 4 14) :name "Vaisakhadi(Bengal)/ Bahag Bihu (Assam)"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 6 19) :name "Rath Yatra"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 8 19) :name "Ganesh Chaturthi/ Vinayaka Chaturthi"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 8 20) :name "Parsi New Year"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 8 28) :name "Onam"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 8 29) :name "Raksha Bandhan"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 8 30) :name "Hazarat Ali's Birthday"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 10 20) :name "Dussehra(Maha Saptami) (Additional)"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 10 21) :name "Dussehra (Maha Astami) (Additional)"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 10 22) :name "Dussehra ( Maha Navami) (Additional)"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 10 28) :name "Maharishi Valmiki's Birthday"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 11 11) :name "Deepavali (South India)"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 11 11) :name "Naraka Chaturdasi"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 11 12) :name "Jamat-Ul-Vida"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 11 13) :name "Govardhan Puja"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 11 14) :name "Bhai Duj"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 11 24) :name "Guru Teg Bahadur Martyrdrom Day"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2004 12 24) :name "Christmas Eve"
    :issued (2003 7 3) :issued-uri "https://web.archive.org/web/20040212035045id_/http://persmin.nic.in:80/holiday.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   (:date (2004 9 18) :name "Ganesh Chaturthi/ Vinayaka Chaturthi" :list :restricted
    :replaces ((2004 8 19) "Ganesh Chaturthi/ Vinayaka Chaturthi")
    :authority "DoPT O.M. No. 12/5/2003-JCA dated 02.01.2004: amends the list"
    :note "Adhika Masa correction from Positional Astronomy Centre."
    :issued (2004 1 2) :issued-uri "https://web.archive.org/web/20040325125758id_/http://www.persmin.nic.in:80/ganesh.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2005
  :authority "No DoPT holiday O.M. for 2005 was found; this block holds only the later O.M.s, and the Islamic days of 2005 are tabular estimates"
  :uri nil
  :issued nil :published nil :dates-note "no annual O.M. for 2005 was found (see docs/AUTHORITIES.md)"
  :holidays (
   )
  :restricted (
   )
  :amendments (
   (:date (2005 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/5/2005-JCA dated 22.03.2005: declares 14 April a holiday for all Central Government offices"
    :note "Word .doc, text readable with strings."
    :issued (2005 3 22) :issued-uri "https://web.archive.org/web/20050512201212id_/http://persmin.nic.in:80/holidays/HolidayOn14April2005.doc" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2006
  :authority "No DoPT holiday O.M. for 2006 was found; this block holds only the later O.M.s, and the Islamic days of 2006 are tabular estimates"
  :uri nil
  :issued nil :published nil :dates-note "no annual O.M. for 2006 was found (see docs/AUTHORITIES.md)"
  :holidays (
   )
  :restricted (
   )
  :amendments (
   (:date (2006 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/5/2005-JCA dated 22.03.2006: declares 14 April a holiday for all Central Government offices"
    :issued (2006 3 22) :issued-uri "https://web.archive.org/web/20210924070104id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2005-JCA-22032006.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2007
  :confidence :primary
  :authority "DoPT O.M. No. 12/2/2006-JCA dated 15.06.2006: Holidays to be observed in Central Government Offices during the year 2007, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf"
  :note "Date day is handwritten ('15th' read from scan). 18 gazetted rows: Idu'l Zuha twice (01-01 and 12-21); footnote says no Idu'l Zuha holiday in 2008."
  :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2007 1 1) :name "Idu'l Zuha (Bakrid)"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 1 26) :name "Republic Day"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 1 30) :name "Muharram"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 2 16) :name "Maha Shivratri"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 3 27) :name "Ram Navami"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 3 31) :name "Mahavir Jayanti"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 4 1) :name "Milad-Un-Nabi (Birthday of Prophet Mohammed)"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 4 6) :name "Good Friday"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 5 2) :name "Buddha Purnima"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 8 15) :name "Independence Day"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 9 4) :name "Janmashtami"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 10 2) :name "Mahatma Gandhi's Birthday"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 10 14) :name "Idu'l Fitr"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 10 21) :name "Dussehra"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 11 9) :name "Diwali (Deepavali)"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 11 24) :name "Guru Nanak's Birthday"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 12 21) :name "Idu'l Zuha (Bakrid) [* falls twice in 2007; no Idu'l Zuha holiday during 2008]"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 12 25) :name "Christmas Day"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2007 1 1) :name "New Year Day"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 1 5) :name "Guru Govind Singh's Birthday"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 1 14) :name "Makara Samkranti"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 1 15) :name "Pongal"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 1 23) :name "Basanta Panchami /Shree Panchami"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 2 2) :name "Guru Ravidas' Birthday"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 2 12) :name "Maharishi Dayanand Sarasvati Jayanti"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 3 3) :name "Holikadahana (Dolyatra)"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 3 4) :name "Holi"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 3 19) :name "Chaitra Sukhladi / Gudi Padava / Ugadi / Cheti Chand"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 4 8) :name "Easter"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 4 14) :name "Vaisakhi"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 4 14) :name "Mesadi"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 4 14) :name "Vishu"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 4 15) :name "Vaisakhadi(Bengal)/ Bahag Bihu (Assam)"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 7 16) :name "Rath Yatra"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 7 28) :name "Hazarat Ali's Birthday"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 8 20) :name "Parsi New Year"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 8 27) :name "Onam"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 8 28) :name "Raksha Bandhan"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 9 3) :name "Janmashtami (Smarta)"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 9 15) :name "Ganesh Chaturthi / Vinayaka Chaturthi"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 10 12) :name "Jamat-Ul-Vida"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 10 18) :name "Dussehra(Maha Saptami) (Additional)"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 10 19) :name "Dussehra (Maha Ashtami) (Additional)"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 10 20) :name "Dussehra (Maha Navami) (Additional)"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 10 26) :name "Maharishi Valmiki's Birthday"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 11 8) :name "Deepavali (South India)"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 11 8) :name "Naraka Chaturdasi"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 11 10) :name "Govardhan Puja"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 11 11) :name "Bhai Duj"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 11 24) :name "Guru Teg Bahadur's Martyrdrom Day"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2007 12 24) :name "Christmas Eve"
    :issued (2006 6 15) :issued-uri "https://web.archive.org/web/20101129151008id_/http://persmin.gov.in/HolidayList/2007_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   ))
 (:year 2008
  :confidence :primary
  :authority "DoPT O.M. No. 12/1/2007-JCA dated 30.07.2007: Holidays to be observed in Central Government Offices during the year 2008, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf"
  :note "Milad-un-Nabi and Good Friday both 21 March; Gandhi Jayanti and Idu'l Fitr both 2 October."
  :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2008 1 19) :name "Muharram"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 1 26) :name "Republic Day"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 3 6) :name "Maha Shivratri"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 3 21) :name "Milad-Un-Nabi or Id-E-Milad (Birthday of Prophet Md.)"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 3 21) :name "Good Friday"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 3 22) :name "Holi"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 4 14) :name "Ram Navami (Vaisnava)"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 4 18) :name "Mahavir Jayanti"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 5 20) :name "Buddha Purnima"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 8 15) :name "Independence Day"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 10 2) :name "Mahatma Gandhi's Birthday"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 10 2) :name "Idu'l Fitr"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 10 9) :name "Dussehra (Vijaya Dashami)"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 10 28) :name "Diwali (Deepavali)"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 11 13) :name "Guru Nanak's Birthday"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 12 9) :name "Idu'l Zuha (Bakrid)"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 12 25) :name "Christmas Day"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2008 1 1) :name "New Year Day"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 1 5) :name "Guru Govind Singh's Birthday"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 1 14) :name "Makara Samkranti (N. India)"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 1 15) :name "Makara Samkranti ( Bengal)"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 1 15) :name "Pongal"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 2 11) :name "Basanta Panchami /Shree Panchami"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 2 19) :name "Sivaji Jayanti"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 2 21) :name "Guru Ravidas' Birthday"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 3 2) :name "Swami Dayanand Saraswati Jayanti"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 3 21) :name "Holika Dahana (Dol yatra)"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 3 23) :name "Easter (Sunday)"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 4 7) :name "Chaitra Sukhladi / Gudi Padava / Ugadi / Cheti Chand"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 4 13) :name "Vaisakhi"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 4 13) :name "Vishu"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 4 14) :name "Mesadi"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 4 14) :name "Vaisakhadi(Bengal)/ Bahag Bihu (Assam)"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 5 8) :name "Birthday of Rabindranath"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 7 4) :name "Rath Yatra"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 7 17) :name "Hazarat Ali's Birthday"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 8 16) :name "Raksha Bandhan"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 8 19) :name "Parsi New Year"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 8 24) :name "Janmashtami (Smarta& Vaishnava)"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 9 3) :name "Ganesh Chaturthi /VinayakaChaturthi"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 9 12) :name "Onam"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 9 26) :name "Jamat-Ul-Vida"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 10 6) :name "Dussehra(Maha Saptami) (additional)"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 10 7) :name "Dussehra (Maha Ashtami) (Additional)"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 10 8) :name "Dussehra (Maha Navmi)"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 10 14) :name "Maharishi Valmiki's Birthday"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 10 27) :name "Deepavali (South India)"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 10 27) :name "Naraka Chaturdasi"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 10 29) :name "Govardhan Puja"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 10 30) :name "Bhai Duj"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 11 24) :name "Guru Teg Bahadur's Martyrdrom Day"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2008 12 24) :name "Christmas Eve"
    :issued (2007 7 30) :issued-uri "https://web.archive.org/web/20101129151245id_/http://persmin.gov.in/HolidayList/2008_Eng.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   (:date (2008 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/3/2008-JCA dated 07.04.2008: declares 14 April a holiday for all Central Government offices"
    :note "Day of date handwritten (7th)."
    :issued (2008 4 7) :issued-uri "https://web.archive.org/web/20210924063134id_/https://documents.doptcirculars.nic.in/D2/D02est/12_3_2008-JCA-07042008.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2009
  :confidence :primary
  :authority "DoPT O.M. No. 12/11/2008-JCA dated 11.06.2008: Holidays to be observed in Central Government Offices during the year 2009, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf"
  :note "OCR text layer, annexure tables garbled; transcribed from page images. 18 gazetted rows: Muharram twice (01-08 and 12-28); footnote: likely no Muharram holiday in 2010."
  :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2009 1 8) :name "Muharram"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 1 26) :name "Republic Day"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 3 10) :name "Milad-Un-Nabi or Id-E-Milad (Birthday of Prophet Md.)"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 3 11) :name "Holi (Dola Yatra)"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 4 3) :name "Ram Navami"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 4 7) :name "Mahavir Jayanti"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 4 10) :name "Good Friday"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 5 9) :name "Buddha Purnima"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 8 14) :name "Janamashtami (Vaisnava)"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 8 15) :name "Independence Day"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 9 21) :name "Idu'l Fitr"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 9 28) :name "Dussehra (Vijaya Dashami)"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 10 2) :name "Mahatma Gandhi's Birthday"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 10 17) :name "Diwali (Deepavali)"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 11 2) :name "Guru Nanak's Birthday"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 11 28) :name "Idu'l Zuha (Bakrid)"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 12 25) :name "Christmas Day"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 12 28) :name "Muharram"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2009 1 1) :name "New Year Day"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 1 5) :name "Guru Govind Singh's Birthday"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 1 13) :name "Makara Samkranti (North India)"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 1 14) :name "Makara Samkranti (Bengal)"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 1 14) :name "Pongal (South India)"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 1 31) :name "Basanta Panchami /Shree Panchami"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 2 9) :name "Guru Ravidas' Birthday"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 2 19) :name "Sivaji Jayanti"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 2 19) :name "Swami Dayanand Saraswati Jayanti"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 2 23) :name "Maha Shivaratri"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 3 10) :name "Holika Dahana"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 3 27) :name "Chaitra / Gudi Padava / Ugadi / Cheti Chand"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 4 12) :name "Easter (Sunday)"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 4 13) :name "Vaisakhi"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 4 13) :name "Vishu"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 4 14) :name "Mesadi"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 4 15) :name "Vaisakhadi(Bengal)/ Bahag Bihu (Assam)"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 5 9) :name "Birthday of Rabindranath"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 6 24) :name "Rath Yatra"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 7 7) :name "Hazarat Ali's Birthday"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 8 5) :name "Raksha Bandhan"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 8 19) :name "Parsi New Year"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 8 23) :name "Ganesh Chaturthi / Vinayaka Chaturthi"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 9 2) :name "Onam"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 9 18) :name "Jamat-Ul-Vida"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 9 25) :name "Maha Saptami"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 9 26) :name "Maha Ashtami"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 9 27) :name "Maha Navmi"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 10 4) :name "Maharishi Valmiki's Birthday"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 10 17) :name "Deepavali (South India)"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 10 17) :name "Naraka Chaturdasi"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 10 18) :name "Govardhan Puja"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 10 19) :name "Bhai Duj"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 11 24) :name "Guru Teg Bahadur's Martyrdrom Day"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2009 12 24) :name "Christmas Eve"
    :issued (2008 6 11) :issued-uri "https://web.archive.org/web/20101129151545id_/http://persmin.gov.in/WriteReadData/Estt/12_11_2008-JCA.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   (:date (2009 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/6/2009-JCA-2 dated 02.04.2009: declares 14 April a holiday for all Central Government offices"
    :issued (2009 4 2) :issued-uri "https://web.archive.org/web/20210924062043id_/https://documents.doptcirculars.nic.in/D2/D02est/12_6_2009-JCA2-02042009.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2010
  :confidence :primary
  :authority "DoPT O.M. No. 12/5/2009-JCA-2 dated 09.06.2009: Holidays to be observed in Central Government Offices during the year 2010, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf"
  :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2010 1 26) :name "Republic Day"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 2 27) :name "Milad-Un-Nabi or Id-E-Milad (Birthday of Prophet Mohammad)"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 3 1) :name "Holi"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 3 24) :name "Ram Navami"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 3 28) :name "Mahavir Jayanti"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 4 2) :name "Good Friday"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 5 27) :name "Buddha Purnima"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 8 15) :name "Independence Day"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 9 2) :name "Janamashtami (Vaisnava)"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 9 11) :name "Idu'l Fitr"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 10 2) :name "Mahatma Gandhi's birthday"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 10 17) :name "Dussehra (Vijaya Dashami)"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 11 5) :name "Diwali (Deepavali)"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 11 17) :name "Idu'l Zuha (Bakrid)"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 11 21) :name "Guru Nanak's birthday"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 12 17) :name "Muharram"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 12 25) :name "Christmas Day"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2010 1 1) :name "New Year's Day"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 1 5) :name "Guru Gobind Singh's birthday"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 1 14) :name "Makar Sankranti"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 1 14) :name "Pongal (South India)"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 1 20) :name "Basanta Panchami /Sri Panchami"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 1 30) :name "Guru Ravidas' birthday"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 2 8) :name "Swami Dayanand Saraswati Jayanti"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 2 12) :name "Maha Shivratri"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 2 19) :name "Shivaji Jayanti"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 2 28) :name "Holika Dahan (Dol yatra)"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 3 16) :name "Chaitra Sukladi/ Gudi Padava/Ugadi/ Cheti Chand"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 4 4) :name "Easter (Sunday)"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 4 14) :name "Vaisakhi"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 4 14) :name "Vishu"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 4 14) :name "Mesadi"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 4 15) :name "Vaisakhadi(Bengal) / Bahag Bihu (Assam)"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 5 9) :name "Guru Rabindranath's Birthday"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 6 26) :name "Hazarat Ali's Birthday"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 7 13) :name "Rath Yatra"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 8 19) :name "Parsi New Year's day"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 8 23) :name "Onam"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 8 24) :name "Raksha Bandhan"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 9 10) :name "Jamat-Ul-Vida"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 9 11) :name "Ganesh Chaturthi / Vinayaka Chaturthi"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 10 14) :name "(Maha Saptami) (Additional)"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 10 15) :name "Dussehra (Maha Ashtami) (Additional)"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 10 16) :name "Dussehra (Maha Navmi)"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 10 22) :name "Maharishi Valmiki's birthday"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 11 5) :name "Deepavali (South India)"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 11 5) :name "Narak Chaturdasi"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 11 6) :name "Govardhan Puja"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 11 7) :name "Bhai Duj"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 11 24) :name "Guru Teg Bahadur's Martyrdom Day"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 12 24) :name "Christmas Eve"
    :issued (2009 6 9) :issued-uri "https://web.archive.org/web/20101129151625id_/http://persmin.gov.in/WriteReadData/Estt/12_5_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   (:date (2010 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/3/2010-JCA-2 dated 29.03.2010: declares 14 April a holiday for all Central Government offices"
    :issued (2010 3 29) :issued-uri "https://web.archive.org/web/20210924053913id_/https://documents.doptcirculars.nic.in/D2/D02est/12_3_2010-JCA2-29032010.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2010 10 14) :name "Closing Ceremony of the Commonwealth Games-2010" :list :gazetted
    :authority "DoPT O.M. No. 12/7/2009-JCA-2 dated 07.07.2010: amends the list"
    :note "Delhi/New Delhi offices only (NI Act holiday)."
    :issued (2010 7 7) :issued-uri "https://web.archive.org/web/20101009093214id_/http://persmin.gov.in/writereaddata/Estt/12_7_2009-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2011
  :confidence :primary
  :authority "DoPT O.M. No. 12/1/2010-JCA-2 dated 21.06.2010: Holidays to be observed in Central Government Offices during the year 2011, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf"
  :note "OCR text layer garbled; transcribed from page images. Holi (20 March, Sunday) appears only as RH."
  :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2011 1 26) :name "Republic Day"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 2 16) :name "Milad-Un-Nabi or Id-E-Milad (Birthday of Prophet Mohammad)"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 3 2) :name "Maha Shivaratri"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 4 12) :name "Ram Navami"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 4 16) :name "Mahavir Jayanti"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 4 22) :name "Good Friday"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 5 17) :name "Buddha Purnima"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 8 15) :name "Independence Day"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 8 22) :name "Janamashtami (Vaisnava)"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 8 31) :name "Idu'l Fitr"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 10 2) :name "Mahatma Gandhi's birthday"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 10 6) :name "Dussehra (Vijaya Dashami)"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 10 26) :name "Diwali (Deepavali)"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 11 7) :name "Idu'l Zuha (Bakrid)"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 11 10) :name "Guru Nanak's birthday"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 12 6) :name "Muharram"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 12 25) :name "Christmas Day"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2011 1 1) :name "New Year's Day"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 1 5) :name "Guru Gobind Singh's birthday"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 1 14) :name "Makar Sankranti"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 1 15) :name "Pongal"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 2 8) :name "Basanta Panchami /Sri Panchami"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 2 18) :name "Guru Ravidas' birthday"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 2 19) :name "Shivaji Jayanti"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 2 27) :name "Swami Dayananda Saraswati Jayanti"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 3 19) :name "Holika Dahan (Dol yatra)"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 3 20) :name "Holi"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 4 4) :name "Chaitra Sukladi/Gudi Padava/Ugadi/Cheti Chand"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 4 14) :name "Vaisakhi"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 4 14) :name "Vishu"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 4 14) :name "Mesadi"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 4 15) :name "Vaisakhadi(Bengal)/ Bahag Bihu (Assam)"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 4 24) :name "Easter Sunday"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 5 9) :name "Guru Rabindranath's Birthday"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 6 16) :name "Hazarat Ali's Birthday"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 7 3) :name "Rath Yatra"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 8 13) :name "Raksha Bandhan"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 8 19) :name "Parsi New Year's day"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 8 26) :name "Jamat-Ul-Vida"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 9 1) :name "Ganesh Chaturthi / Vinayaka Chaturthi"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 9 9) :name "Onam"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 10 3) :name "(Maha Saptami) (Additional)"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 10 4) :name "Dussehra (Maha Ashtami) (Additional)"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 10 5) :name "Dussehra (Maha Navmi)"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 10 11) :name "Maharishi Valmiki's birthday"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 10 26) :name "Deepavali (South India)"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 10 26) :name "Narak Chaturdasi"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 10 27) :name "Govardhan Puja"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 10 28) :name "Bhai Duj"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 11 1) :name "Pratihar Sashthi or Surya Sashthi (Chhat Puja)"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 11 24) :name "Guru Teg Bahadur's Martyrdom Day"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 12 24) :name "Christmas Eve"
    :issued (2010 6 21) :issued-uri "https://web.archive.org/web/20101129151218id_/http://persmin.gov.in/WriteReadData/Estt/12_1_2010-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   (:date (2011 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/2/2011-JCA-2 dated 21.03.2011: declares 14 April a holiday for all Central Government offices"
    :issued (2011 3 21) :issued-uri "https://web.archive.org/web/20210924061005id_/https://documents.doptcirculars.nic.in/D2/D02est/12_2_2011-JCA2-21032011.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2011 12 31) :name "Birthday of Shri Guru Gobind Singh" :list :restricted
    :authority "DoPT O.M. No. 12/1/2010-JCA-2 dated 27.06.2011: amends the list"
    :note "RH shifted from 5 Jan 2012 to 31 Dec 2011 (lunar tithi criterion); adds an RH to 2011."
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20210924065910id_/https://documents.doptcirculars.nic.in/D2/D02est/12_1_2010-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2012
  :confidence :primary
  :authority "DoPT O.M. No. 12/3/2011-JCA-2 dated 27.06.2011: Holidays to be observed in Central Government Offices during the year 2012, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf"
  :note "Transcribed from page images. In this archived copy RH 'Jamat-Ul-Vida' (17 Aug) is struck through by hand. No Guru Gobind Singh RH (moved to 31.12.2011)."
  :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2012 1 26) :name "Republic Day"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 2 5) :name "Milad-Un-Nabi or Id-E-Milad (Birthday of Prophet Mohammad)"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 2 20) :name "Maha Shivaratri"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 3 8) :name "Holi"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 4 5) :name "Mahavir Jayanti"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 4 6) :name "Good Friday"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 5 6) :name "Buddha Purnima"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 8 10) :name "Janamashtami (Vaisnava)"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 8 15) :name "Independence day"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 8 20) :name "Idu'l Fitr"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 10 2) :name "Mahatma Gandhi's birthday"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 10 24) :name "Dussehra (Vijaya Dashami)"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 10 27) :name "Idu'l Zuha (Bakrid)"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 11 13) :name "Diwali (Deepavali)"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 11 25) :name "Muharram"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 11 28) :name "Guru Nanak's birthday"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 12 25) :name "Christmas Day"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2012 1 1) :name "New Year's Day"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 1 14) :name "Makar Sankranti"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 1 15) :name "Pongal"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 1 28) :name "Basanta Panchami /Sri Panchami"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 2 7) :name "Guru Ravidas' birthday"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 2 16) :name "Swami Dayananda Saraswati Jayanti"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 2 19) :name "Shivaji Jayanti"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 3 7) :name "Holika Dahan"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 3 23) :name "Chaitra Sukladi/Gudi Padava/Ugadi/Cheti Chand"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 4 1) :name "Ram Navmi"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 4 8) :name "Easter Sunday"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 4 13) :name "Vaisakhi"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 4 13) :name "Vishu"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 4 14) :name "Mesadi"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 4 14) :name "Vaisakhadi(Bengal)/ Bahag Bihu (Assam)"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 5 8) :name "Guru Rabindranath's birthday"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 6 4) :name "Hazarat Ali's Birthday"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 6 21) :name "Rath Yatra"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 8 2) :name "Raksha Bandhan"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 8 17) :name "Jamat-Ul-Vida [struck through by hand in this copy]"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 8 18) :name "Parsi New Year's day"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 8 21) :name "Vinayaka Chaturthi"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 8 29) :name "Onam"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 9 19) :name "Ganesh Chaturthi"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 10 21) :name "(Maha Saptami) (Additional)"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 10 22) :name "Dussehra (Maha Ashtami) (Additional)"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 10 23) :name "Dussehra (Maha Navmi)"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 10 29) :name "Maharishi Valmiki's birthday"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 11 2) :name "Karaka Chaturthi (Karva Chouth)"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 11 12) :name "Naraka Chaturdasi"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 11 13) :name "Deepavali (South India)"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 11 14) :name "Govardhan Puja"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 11 15) :name "Bhai Duj"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 11 19) :name "Pratihar Sashthi or Surya Sashthi (Chhat Puja)"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 11 24) :name "Guru Teg Bahadur's Martyrdom Day"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2012 12 24) :name "Christmas Eve"
    :issued (2011 6 27) :issued-uri "https://web.archive.org/web/20110703050721id_/http://persmin.gov.in/WriteReadData/CircularPortal/D2/D02est/12_3_2011-JCA-2-1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   (:date (2012 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/2/2012-JCA-2 dated 27.03.2012: declares 14 April a holiday for all Central Government offices"
    :issued (2012 3 27) :issued-uri "https://web.archive.org/web/20210924062207id_/https://documents.doptcirculars.nic.in/D2/D02est/12_2_2012-JCA-2-27032012A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2013
  :confidence :primary
  :authority "DoPT O.M. No. 12/4/2012-JCA-2 dated 05.06.2012: Holidays to be observed in Central Government Offices during the year 2013, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf"
  :note "Annexure-II numbering repeats S.No. 10 and 31."
  :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2013 1 25) :name "Milad-Un-Nabi or Id-E-Milad (Birthday of Prophet Mohammad)"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 1 26) :name "Republic Day"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 3 27) :name "Holi"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 3 29) :name "Good Friday"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 4 19) :name "Ram Navami"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 4 24) :name "Mahavir Jayanti"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 5 25) :name "Buddha Purnima"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 8 9) :name "Idu'l Fitr"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 8 15) :name "Independence day"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 8 28) :name "Janmashtami"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 10 2) :name "Mahatma Gandhi's birthday)"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 10 13) :name "Dussehra"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 10 16) :name "Id-ul-Zuha(Bakrid)"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 11 3) :name "Diwali (Deepavali)"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 11 14) :name "Muharram"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 11 17) :name "Guru Nanak's Birthday"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 12 25) :name "Christmas Day"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2013 1 1) :name "New Year's Day"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 1 13) :name "Makar Sankranti"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 1 14) :name "Pongal"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 1 18) :name "Guru Gobind Singh's Birthday"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 2 14) :name "Sri Panchami"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 2 15) :name "Basanta Panchami"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 2 19) :name "Shivaji Jayanti"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 2 25) :name "Guru Ravidas's Birthday"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 3 7) :name "Swami Dayananda Saraswati Jayanti"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 3 10) :name "Maha Shivratri"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 3 26) :name "Holika Dahan"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 3 31) :name "Easter Sunday"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 4 11) :name "Chaitra Sukladi/ Gudi Padava/ Ugadi/ Cheti Chand"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 4 13) :name "Vaisakhi"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 4 13) :name "Vishu"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 4 14) :name "Mesadi"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 4 15) :name "Vaisakhadi(Bengal)/ Bahag Bihu (Assam)"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 5 9) :name "Guru Rabindranath's birthday"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 5 24) :name "Hazarat Ali's Birthday"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 7 10) :name "Rath Yatra"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 8 2) :name "Jamat-Ul-Vida"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 8 18) :name "Parsi New Year's day"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 8 20) :name "Raksha Bandhan"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 9 9) :name "Vinayaka Chaturthi/ Ganesh Chaturthi"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 9 16) :name "Onam"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 10 11) :name "Dussehra (Maha Saptami) (Additional)"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 10 12) :name "Dussehra (Maha Ashtami) (Additional)"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 10 13) :name "Dussehra (Maha Navmi)"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 10 18) :name "Maharishi Valmiki's birthday"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 10 22) :name "Karaka Chaturthi (Karva Chouth)"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 11 2) :name "Deepavali (South India)"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 11 2) :name "Naraka Chaturdasi"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 11 3) :name "Govardhan Puja"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 11 5) :name "Bhai Duj"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 11 8) :name "Pratihar Sashthi or Surya Sashthi (Chhat Puja)"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 11 24) :name "Guru Teg Bahadur's Martyrdom Day"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2013 12 24) :name "Christmas Eve"
    :issued (2012 6 5) :issued-uri "https://web.archive.org/web/20210924060422id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2012-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   (:date (2013 11 15) :name "Muharram" :list :gazetted
    :replaces ((2013 11 14) "Muharram")
    :authority "DoPT O.M. No. 12/10/2013-JCA-2 dated 11.11.2013: changes the date of the holiday in Delhi/New Delhi after the moon was sighted"
    :note "Delhi/New Delhi offices."
    :issued (2013 11 11) :issued-uri "https://web.archive.org/web/20210622104409id_/https://documents.doptcirculars.nic.in/D2/D02est/12_10_2013-JCA-2.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2014
  :confidence :primary
  :authority "DoPT O.M. No. 12/5/2013-JCA-2 dated 11.06.2013: Holidays to be observed in Central Government Offices during the year 2014, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf"
  :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2014 1 14) :name "Milad-Un-Nabi or Id-E-Milad (Birthday of Prophet Mohammad)"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 1 26) :name "Republic Day"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 3 17) :name "Holi"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 4 8) :name "Ram Navami"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 4 13) :name "Mahavir Jayanti"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 4 18) :name "Good Friday"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 5 14) :name "Buddha Purnima"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 7 29) :name "Idu'l Fitr"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 8 15) :name "Independence day"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 8 18) :name "Janmashtami"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 10 2) :name "Mahatma Gandhi's Birthday"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 10 3) :name "Dussehra"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 10 6) :name "Id-ul-Zuha(Bakrid)"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 10 23) :name "Diwali (Deepavali)"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 11 4) :name "Muharram"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 11 6) :name "Guru Nanak's Birthday"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 12 25) :name "Christmas Day"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2014 1 1) :name "New Year's Day"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 1 7) :name "Guru Gobind Singh's Birthday"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 1 14) :name "Makar Sankranti"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 1 14) :name "Pongal"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 2 4) :name "Basant Panchami /Sri Panchami"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 2 14) :name "Guru Ravidas's Birthday"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 2 19) :name "Shivaji Jayanti"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 2 24) :name "Swami Dayananda Saraswati Jayanti"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 2 27) :name "Maha Shivaratri"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 3 16) :name "Holika Dahan"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 3 31) :name "Chaitra Sukladi/Gudi Padava/ Ugadi/ Cheti Chand"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 4 14) :name "Vaisakhi/Vishu / Masadi"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 4 15) :name "Vaisakhadi(Bengal)/ Bahag Bihu (Assam)"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 4 20) :name "Easter Sunday"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 5 9) :name "Guru Rabindranath's birthday"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 5 13) :name "Hazarat Ali's Birthday"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 6 29) :name "Rath Yatra"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 7 25) :name "Jamat-Ul-Vida"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 8 10) :name "Raksha Bandhan"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 8 18) :name "Parsi New Year's day/ Nauroz"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 8 29) :name "Vinayaka Chaturthi/ Ganesh Chaturthi"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 9 7) :name "Onam"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 10 1) :name "Dussehra (Maha Saptami) (Additional)"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 10 2) :name "Dussehra (Maha Ashtami) (Additional)"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 10 3) :name "Dussehra (Maha Navmi)"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 10 8) :name "Maharishi Valmiki's Birthday"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 10 11) :name "Karaka Chaturthi (Karva Chouth)"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 10 22) :name "Deepavali (South India)"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 10 22) :name "Naraka Chaturdasi"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 10 24) :name "Govardhan Puja"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 10 25) :name "Bhai Duj"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 10 29) :name "Pratihar Sashthi/Surya Sashthi (Chhat Puja)"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 11 24) :name "Guru Teg Bahadur's Martyrdom Day"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 12 24) :name "Christmas Eve"
    :issued (2013 6 11) :issued-uri "https://web.archive.org/web/20210924052201id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-11062013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   (:date (2014 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/4/2014-JCA-2 dated 12.03.2014: declares 14 April a holiday for all Central Government offices"
    :issued (2014 3 12) :issued-uri "https://web.archive.org/web/20210924071438id_/https://documents.doptcirculars.nic.in/D2/D02est/12_4_2014-JCA-2-12032014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2014 12 28) :name "Birthday of Shri Guru Gobind Singh" :list :restricted
    :authority "DoPT O.M. No. 12/5/2013-JCA-2 dated 03.09.2013: amends the list"
    :note "Second occurrence in 2014 added to Annexure-II."
    :issued (2013 9 3) :issued-uri "https://web.archive.org/web/20210924054322id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2013-JCA-2-03092013.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2015
  :confidence :primary
  :authority "DoPT O.M. No. 12/5/2014-JCA-2 dated 06.06.2014: Holidays to be observed in Central Government Offices during the year 2015, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf"
  :note "18 gazetted rows: Milad-un-Nabi twice (01-04 and 12-24, starred)."
  :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2015 1 4) :name "Milad-Un-Nabi or Id-E-Milad (Birthday of Prophet Mohammad)"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 1 26) :name "Republic Day"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 3 6) :name "Holi"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 3 28) :name "Ram Navami"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 4 2) :name "Mahavir Jayanti"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 4 3) :name "Good Friday"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 5 4) :name "Buddha Purnima"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 7 18) :name "Idu'l Fitr"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 8 15) :name "Independence day"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 9 5) :name "Janmashtami"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 9 25) :name "Id-ul-Zuha(Bakrid)"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 10 2) :name "Mahatma Gandhi's Birthday"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 10 22) :name "Dussehra"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 10 24) :name "Muharram"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 11 11) :name "Diwali (Deepavali)"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 11 25) :name "Guru Nanak's Birthday"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 12 24) :name "Milad-Un-Nabi or Id-E-Milad (Birthday of Prophet Mohammad) [* falls twice in the year 2015]"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 12 25) :name "Christmas Day"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2015 1 1) :name "New Year's Day"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 1 14) :name "Makar Sankranti"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 1 15) :name "Pongal"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 1 24) :name "Basant Panchami /Sri Panchami"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 2 3) :name "Guru Ravidas's Birthday"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 2 14) :name "Swami Dayananda Saraswati Jayanti"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 2 19) :name "Shivaji Jayanti"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 3 5) :name "Holika Dahan"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 3 21) :name "Chaitra Sukladi/Gudi Padava/Ugadi/Cheti Chand"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 4 5) :name "Easter Sunday"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 4 14) :name "Vaisakhi/Vishu/Masadi"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 4 15) :name "Vaisakhadi(Bengal)/ Bahag Bihu (Assam)"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 5 3) :name "Hazarat Ali's Birthday"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 5 9) :name "Guru Rabindranath's birthday"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 7 17) :name "Jamat-ul-Vida"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 7 18) :name "Rath Yatra"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 8 18) :name "Parsi New Year's day/Nauroz"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 8 28) :name "Onam"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 8 29) :name "Raksha Bandhan"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 9 17) :name "Vinayaka Chaturthi/ Ganesh Chaturthi"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 10 20) :name "Dussehra (Maha Saptami) (Additional)"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 10 21) :name "Dussehra (Maha Ashtami) (Additional)"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 10 22) :name "Dussehra (Maha Navmi)"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 10 27) :name "Maharishi Valmiki's Birthday"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 10 30) :name "Karaka Chaturthi (Karva Chouth)"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 11 10) :name "Deepavali (South India)"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 11 10) :name "Naraka Chaturdasi"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 11 12) :name "Govardhan Puja"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 11 13) :name "Bhai Duj"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 11 17) :name "Pratihar Sashthi or Surya Sashthi (Chhat Puja)"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 11 24) :name "Guru Teg Bahadur's Martyrdom Day"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 12 24) :name "Christmas Eve"
    :issued (2014 6 6) :issued-uri "https://web.archive.org/web/20210924053044id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014_JCA_2-06062014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   (:date (2015 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/6/2015-JCA-2 dated 19.03.2015: declares 14 April a holiday for all Central Government offices"
    :issued (2015 3 19) :issued-uri "https://web.archive.org/web/20210924064413id_/https://documents.doptcirculars.nic.in/D2/D02est/12_6_2015_JCA-2-19032015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2015 2 17) :name "Maha Shivratri" :list :restricted
    :authority "DoPT O.M. No. 12/5/2014-JCA-2 dated 10.07.2014: amends the list"
    :note "Corrigendum adding omitted RH to Annexure-II."
    :issued (2014 7 10) :issued-uri "https://web.archive.org/web/20210924062929id_/https://documents.doptcirculars.nic.in/D2/D02est/12_5_2014-JCA-2-10072014.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2016
  :confidence :primary
  :authority "DoPT O.M. No. 12/7/2015-JCA-2 dated 11.06.2015: Holidays to be observed in Central Government Offices during the year 2016, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf"
  :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2016 1 26) :name "Republic Day"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 3 24) :name "Holi"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 3 25) :name "Good Friday"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 4 15) :name "Ram Navami"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 4 20) :name "Mahavir Jayanti"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 5 21) :name "Buddha Purnima"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 7 6) :name "Idu'l Fitr"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 8 15) :name "Independence day"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 8 25) :name "Janmashtami"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 9 12) :name "Id-ul-Zuha(Bakrid)"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 10 2) :name "Mahatma Gandhi's Birthday"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 10 11) :name "Dussehra"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 10 12) :name "Muharram"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 10 30) :name "Diwali (Deepavali)"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 11 14) :name "Guru Nanak's Birthday"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 12 13) :name "Milad-Un-Nabi or Id-E-Milad (Birthday of Prophet Mohammad)"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 12 25) :name "Christmas Day"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2016 1 1) :name "New Year's Day"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 1 14) :name "Makar Sankranti"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 1 15) :name "Pongal"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 1 16) :name "Guru Govind Singh's Birthday"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 2 12) :name "Basant Panchami / Sri Panchami"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 2 19) :name "Shivaji Jayanti"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 2 22) :name "Guru Ravidas's Birthday"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 3 4) :name "Swami Dayananda Saraswati Jayanti"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 3 7) :name "Maha Shivaratri"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 3 23) :name "Holika Dahan, Dolyatra"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 3 27) :name "Easter Sunday"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 4 8) :name "Chaitra Sukladi/Gudi Padava/ Ugadi/ Cheti Chand"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 4 13) :name "Vaisakhi/Vishu"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 4 14) :name "Masadi/Vaisakhadi,Bahag Bihu (Asam)"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 4 21) :name "Hazarat Ali's Birthday"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 5 8) :name "Guru Rabindranath's birthday"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 7 1) :name "Jamat-Ul-Vida"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 7 6) :name "Rath Yatra"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 8 17) :name "Parsi New Year's day/ Nauraj"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 8 18) :name "Raksha Bandhan"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 9 5) :name "Ganesh Chaturthi/Vinayaka Chaturthi"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 9 14) :name "Onam"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 10 8) :name "Dussehra (Maha Saptami) (Additional)"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 10 9) :name "Dussehra (Maha Ashtami) (Additional)"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 10 10) :name "Dussehra (Maha Navmi)"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 10 16) :name "Maharishi Valmiki's Birthday"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 10 19) :name "Karaka Chaturthi (Karva Chouth)"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 10 29) :name "Deepavali (South India)"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 10 29) :name "Naraka Chaturdasi"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 10 31) :name "Govardhan Puja"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 11 1) :name "Bhai Duj"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 11 6) :name "Pratihar Sashthi or Surya Sashthi (Chhat Puja)"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 11 24) :name "Guru Teg Bahadur's Martyrdom Day"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 12 24) :name "Christmas Eve"
    :issued (2015 6 11) :issued-uri "https://web.archive.org/web/20210924070746id_/https://documents.doptcirculars.nic.in/D2/D02est/12_7_2015-JCA-2-11062015.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   (:date (2016 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/6/2016-JCA-2 dated 21.03.2016: declares 14 April a holiday for all Central Government offices"
    :issued (2016 3 21) :issued-uri "https://web.archive.org/web/20210924054048id_/https://documents.doptcirculars.nic.in/D2/D02est/12_6_2016-JCA-2-21032016.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 7 7) :name "Id-ul-Fitr" :list :gazetted
    :replaces ((2016 7 6) "Idu'l Fitr")
    :authority "DoPT O.M. No. 12/10/2016-JCA2 dated 05.07.2016: changes the date of the holiday in Delhi/New Delhi after the moon was sighted"
    :note "Delhi/New Delhi offices. File name says 05062016 but OM is dated 05 July 2016."
    :issued (2016 7 5) :issued-uri "https://web.archive.org/web/20210925130318id_/https://documents.doptcirculars.nic.in/D2/D02est/12_10_2016-JCA2-05062016.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 9 13) :name "Id-ul-Zuha (Bakrid)" :list :gazetted
    :replaces ((2016 9 12) "Id-ul-Zuha(Bakrid)")
    :authority "DoPT O.M. No. 12/11/2016-JCA2 dated 06.09.2016: changes the date of the holiday in Delhi/New Delhi after the moon was sighted"
    :note "Delhi/New Delhi offices."
    :issued (2016 9 6) :issued-uri "https://web.archive.org/web/20210924061759id_/https://documents.doptcirculars.nic.in/D2/D02est/12_11_2016-JCA2-06092016.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2016 12 12) :name "Milad-Un-Nabi or Id-E-Milad" :list :gazetted
    :replaces ((2016 12 13) "Milad-Un-Nabi or Id-E-Milad (Birthday of Prophet Mohammad)")
    :authority "DoPT O.M. No. 12/18/2016-JCA2 dated 07.12.2016: changes the date of the holiday in Delhi/New Delhi after the moon was sighted"
    :note "Delhi/New Delhi offices."
    :issued (2016 12 7) :issued-uri "https://web.archive.org/web/20210924051721id_/https://documents.doptcirculars.nic.in/D2/D02est/12_18_2016-JCA2-07122016.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2017
  :confidence :primary
  :authority "DoPT O.M. No. 12/8/2016-JCA-2 dated 24.06.2016: Holidays to be observed in Central Government Offices during the year 2017, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf"
  :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2017 1 26) :name "Republic Day"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 2 24) :name "Maha Shivaratri"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 3 13) :name "Holi"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 4 4) :name "Ram Navami"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 4 9) :name "Mahavir Jayanti"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 4 14) :name "Good Friday"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 5 10) :name "Buddha Purnima"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 6 26) :name "Idu'l Fitr"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 8 15) :name "Independence day"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 9 2) :name "Id-ul-Zuha(Bakrid)"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 9 30) :name "Dussehra"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 10 1) :name "Muharram"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 10 2) :name "Mahatma Gandhi's Birthday"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 10 19) :name "Diwali (Deepavali)"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 11 4) :name "Guru Nanak's Birthday"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 12 2) :name "Milad-un-Nabi or Id-e-Milad (birthday of Prophet Mohammad)"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 12 25) :name "Christmas Day"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2017 1 1) :name "New Year's Day"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 1 5) :name "Guru Govind Singh's Birthday"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 1 14) :name "Makar Sankranti"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 1 14) :name "Pongal"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 2 1) :name "Basant Panchami / Sri Panchami"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 2 10) :name "Guru Ravidas's Birthday"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 2 19) :name "Shivaji Jayanti"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 2 21) :name "Swami Dayananda Saraswati Jayanti"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 3 12) :name "Holika Dahan/Dolyatra"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 3 28) :name "Chaitra Sukladi/Gudi Padava/Ugadi/Cheti Chand"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 4 11) :name "Hazarat Ali's Birthday"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 4 13) :name "Vaisakhi/Vishu"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 4 14) :name "Mesadi"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 4 15) :name "Vaisakhadi(Bengal)/ Bahag Bihu (Assam)"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 4 16) :name "Easter Sunday"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 5 9) :name "Guru Rabindranath's birthday"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 6 23) :name "Jamat-Ul-Vida"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 6 25) :name "Rath Yatra"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 8 7) :name "Raksha Bandhan"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 8 15) :name "Janmashtami (Vaishnav)"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 8 17) :name "Parsi New Year's day/Nauraj"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 8 25) :name "Vinayaka Chaturthi/ Ganesh Chaturthi"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 9 4) :name "Onam"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 9 27) :name "Dussehra (Maha Saptami) (Additional)"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 9 28) :name "Dussehra (Maha Ashtami) (Additional)"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 9 29) :name "Dussehra (Maha Navmi)"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 10 5) :name "Maharishi Valmiki's Birthday"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 10 8) :name "Karaka Chaturthi (Karva Chouth)"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 10 18) :name "Deepavali (South India)"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 10 18) :name "Naraka Chaturdasi"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 10 20) :name "Govardhan Puja"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 10 21) :name "Bhai Duj"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 10 26) :name "Pratihar Sashthi or Surya Sashthi (Chhat Puja)"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 11 24) :name "Guru Teg Bahadur's Martyrdom Day"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2017 12 24) :name "Christmas Eve"
    :issued (2016 6 24) :issued-uri "https://web.archive.org/web/20210924060339id_/https://documents.doptcirculars.nic.in/D2/D02est/12_8_2016-JCA-2-24062016A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   (:date (2017 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/6/2016-JCA-2 dated 05.04.2017: declares 14 April a holiday for all Central Government offices"
    :issued (2017 4 5) :issued-uri "https://web.archive.org/web/20210924063531id_/https://documents.doptcirculars.nic.in/D2/D02est/12_6_2016-JCA-2-05042017.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2018
  :confidence :primary
  :authority "DoPT O.M. No. 12/3/2017-JCA-2 dated 14.06.2017: Holidays to be observed in Central Government Offices during the year 2018, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf"
  :note "OCR text layer."
  :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2018 1 26) :name "Republic Day"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 2 14) :name "Maha Shivaratri"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 3 2) :name "Holi"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 3 29) :name "Mahavir Jayanti"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 3 30) :name "Good Friday"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 4 30) :name "Buddha Purnima"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 6 16) :name "Idu'l Fitr"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 8 15) :name "Independence day"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 8 22) :name "Id-ul-Zuha (Bakrid)"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 9 3) :name "Janmashtami"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 9 21) :name "Muharram"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 10 2) :name "Mahatma Gandhi's (Birthday"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 10 19) :name "Dussehra"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 11 7) :name "Diwali (Deepavali)"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 11 21) :name "Milad-un-Nabi or Id-e-Milad (Birthday of Prophet Mohammad)"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 11 23) :name "Guru Nanak's Birthday"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 12 25) :name "Christmas Day"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2018 1 1) :name "New Year's Day"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 1 14) :name "Makar Sankranti"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 1 14) :name "Pongal"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 1 22) :name "Basant Panchami /Sri Panchami"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 1 31) :name "Guru Ravidas's Birthday"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 2 10) :name "Swami Dayananda Saraswati Jayanti"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 2 19) :name "Shivaji Jayanti"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 3 1) :name "Holika Dahan/Dolyatra"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 3 18) :name "Chaitra Sukladi/Gudi Padava/Ugadi/Cheti Chand"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 3 25) :name "Ram Navami"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 4 1) :name "Easter Sunday"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 4 1) :name "Hazarat Ali's Birthday"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 4 14) :name "Vaisakhi/ Vishu / Mesadi"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 4 15) :name "Vaisakhadi(Bengal)/ Bahag Bihu (Assam)"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 5 9) :name "Guru Rabindranath's birthday"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 6 15) :name "Jamat-Ul-Vida"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 7 14) :name "Rath Yatra"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 8 17) :name "Parsi New Year's day/Nauraj"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 8 25) :name "Onam or Thiru Onam Day"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 8 26) :name "Raksha Bandhan"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 9 13) :name "Vinayaka Chaturthi/ Ganesh Chaturthi"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 10 16) :name "Dussehra (Maha Saptami) (Additional)"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 10 17) :name "Dussehra (Maha Ashtami) (Additional)"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 10 18) :name "Dussehra (Maha Navmi)"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 10 24) :name "Maharishi Valmiki's Birthday"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 10 27) :name "Karaka Chaturthi (Karva Chouth)"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 11 6) :name "Deepavali (South India)"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 11 6) :name "Naraka Chaturdasi"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 11 8) :name "Govardhan Puja"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 11 9) :name "Bhai Duj"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 11 13) :name "Pratihar Sashthi or Surya Sashthi (Chhat Puja)"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 11 24) :name "Guru Teg Bahadur's Martyrdom Day"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 12 24) :name "Christmas Eve"
    :issued (2017 6 14) :issued-uri "https://web.archive.org/web/20180618234308id_/http://documents.doptcirculars.nic.in:80/D2/D02est/12_3_2017-JCA-2-14062017A.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   (:date (2018 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/6/2016-JCA-2 dated 02.04.2018: declares 14 April a holiday for all Central Government offices"
    :note "Day of OM date handwritten ('2nd' as read)."
    :issued (2018 4 2) :issued-uri "https://web.archive.org/web/20210924055149id_/https://documents.doptcirculars.nic.in/D2/D02est/12_6_2016_JCA_20001.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 8 23) :name "Id-ul-Zuha (Bakrid)" :list :gazetted
    :replaces ((2018 8 22) "Id-ul-Zuha (Bakrid)")
    :withdrawn (2018 8 20)
    :authority "DoPT O.M. No. 12/4/2018-JCA2 dated 14.08.2018: changes the date of the holiday in Delhi/New Delhi after the moon was sighted"
    :issued (2018 8 14) :issued-uri "https://web.archive.org/web/20201022205245id_/https://dopt.gov.in/sites/default/files/Change%20of%20date%20of%20holiday%20on%20account%20of%20Id-ul-Zuha.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2018 8 22) :name "Id-ul-Zuha (Bakrid)" :list :gazetted
    :authority "DoPT O.M. No. 12/4/2018-JCA2 dated 20.08.2018: changes the date of the holiday in Delhi/New Delhi after the moon was sighted"
    :note "Supersedes 14.08.2018 OM; holiday back on 22 Aug (as in original list). Hindi version: Id-ul-ZuhaCtByJ.pdf."
    :issued (2018 8 20) :issued-uri "https://web.archive.org/web/20210924071913id_/https://documents.doptcirculars.nic.in/D2/D02est/Bakridc3shC.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2019
  :confidence :primary
  :authority "DoPT O.M. No. 12/2/2018-JCA-2 dated 11.07.2018: Holidays to be observed in Central Government Offices during the year 2019, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf"
  :note "OCR text layer; checked against page image."
  :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2019 1 26) :name "Republic Day"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 3 4) :name "Maha Shivaratri"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 3 21) :name "Holi"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 4 17) :name "Mahavir Jayanti"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 4 19) :name "Good Friday"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 5 18) :name "Buddha Purnima"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 6 5) :name "Id-ul-Fitr"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 8 12) :name "Id-Uz-Zuha (Bakrid)"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 8 15) :name "Independence Day"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 8 24) :name "Janmashtami"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 9 10) :name "Muharram"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 10 2) :name "Mahatma Gandhi's Birthday"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 10 8) :name "Dussehra"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 10 27) :name "Diwali (Deepavali)"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 11 10) :name "Milad-un-Nabi or Id-e-Milad (Birthday of Prophet Mohammad)"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 11 12) :name "Guru Nanak's Birthday"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 12 25) :name "Christmas Day"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2019 1 1) :name "New Year's Day"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 1 13) :name "Lohri"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 1 14) :name "Makar Sankranti"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 1 15) :name "Pongal"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 2 10) :name "Basant Panchami /Sri Panchami"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 2 19) :name "Guru Ravidas's Birthday"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 2 19) :name "Shivaji Jayanti"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 3 1) :name "Swami Dayananda Saraswati Jayanti"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 3 20) :name "Holika Dahan"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 3 21) :name "Dolyatra"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 3 21) :name "Hazarat Ali's Birthday"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 4 6) :name "Chaitra Sukladi/Gudi Padava/Ugadi/ Cheti Chand"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 4 13) :name "Ram Navami (Smarta)"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 4 14) :name "Vaiskhi/Vishu/Mesadi"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 4 15) :name "Vaisakhadi(Bengal)/ Bahag Bihu (Assam)"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 4 21) :name "Easter Sunday"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 5 9) :name "Guru Rabindranath's Birthday"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 5 31) :name "Jamat-Ul-Vida"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 7 4) :name "Rath Yatra"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 8 15) :name "Raksha Bandhan"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 8 17) :name "Parsi New Year's day/Nauraj"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 9 2) :name "Vinayaka Chaturthi/ Ganesh Chaturthi"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 9 11) :name "Onam or Thiru Onam Day"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 10 5) :name "Dussehra (Maha Saptami) (Additional)"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 10 6) :name "Dussehra (Maha Ashtami) (Additional)"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 10 7) :name "Dussehra (Maha Navmi)"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 10 13) :name "Maharishi Valmiki's Birthday"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 10 17) :name "Karaka Chaturthi (Karva Chouth)"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 10 27) :name "Naraka Chaturdasi"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 10 28) :name "Govardhan Puja"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 10 29) :name "Bhai Duj"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 11 2) :name "Pratihar Shashthi or Surya Shashthi (Chhat Puja)"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 11 24) :name "Guru Teg Bahadur's Martyrdom Day"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2019 12 24) :name "Christmas Eve"
    :issued (2018 7 11) :issued-uri "https://web.archive.org/web/20201022211018id_/https://dopt.gov.in/sites/default/files/holiday%20list%202019%202_1.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   (:date (2019 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/6/2016-JCA-2 dated 15.03.2019: declares 14 April a holiday for all Central Government offices"
    :note "Sunday; declared under NI Act s.25."
    :issued (2019 3 15) :issued-uri "https://web.archive.org/web/20210924060124id_/https://documents.doptcirculars.nic.in/D2/D02est/Ambedkar%20holidayj9btr.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2020
  :confidence :primary
  :authority "DoPT O.M. No. 12/1/2019-JCA-2 dated 18.06.2019: Holidays to be observed in Central Government Offices during the year 2020, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf"
  :note "Date day '18' handwritten."
  :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2020 1 26) :name "Republic Day"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 3 10) :name "Holi"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 4 2) :name "Ram Navami"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 4 6) :name "Mahavir Jayanti"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 4 10) :name "Good Friday"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 5 7) :name "Budha Purnima"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 5 25) :name "Id-ul-Fitr"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 8 1) :name "Id-ul-Zuha (Bakrid)"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 8 12) :name "Janmashtami"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 8 15) :name "Independence Day"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 8 30) :name "Muharram"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 10 2) :name "Mahatma Gandhi's Birthday"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 10 25) :name "Dussehra"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 10 30) :name "Milad-un-Nabi or Id-e-Milad (Birthday of Prophet Mohammad)"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 11 14) :name "Diwali (Deepavali)"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 11 30) :name "Guru Nanak's Birthday"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 12 25) :name "Christmas Day"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2020 1 1) :name "New Year's Day"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 1 2) :name "Guru Gobind Singh's Birthday"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 1 13) :name "Lohri"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 1 15) :name "Makar Sankranti/ Pongal"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 1 30) :name "Basant Panchami /Sri Panchami"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 2 9) :name "Guru Ravi Das's Birthday"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 2 18) :name "Swami Dayananda Saraswati Jayanti"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 2 19) :name "Shivaji Jayanti"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 2 21) :name "Maha Shivaratri"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 3 9) :name "Holika Dahan/Dolyatra"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 3 9) :name "Hazarat Ali's Birthday"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 3 25) :name "Chaitra Sukladi / Gudi Padava/Ugadi /Cheti Chand"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 4 12) :name "Easter Sunday"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 4 13) :name "Vaisakhi/Vishu"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 4 14) :name "Mesadi/ Vaisakhadi (Bengal)/Bahag Bihu (Assam)"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 5 8) :name "Guru Rabindranath's birthday"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 5 22) :name "Jamat-Ul-Vida"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 6 23) :name "Rath Yatra"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 8 3) :name "Raksha Bandhan"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 8 11) :name "Janmashtami (Smarta)"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 8 16) :name "Parsi New Year's day/Nauraj"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 8 22) :name "Vinayaka Chaturthi/ Ganesh Chaturthi"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 8 31) :name "Onam or Thiru Onam Day"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 10 23) :name "Dussehra (Maha Saptami) (Additional)"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 10 24) :name "Dussehra (Maha Ashtami) (Maha Navmi)(Additional)"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 10 26) :name "Vijay Dashmi (Bengal, Kerala)"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 10 31) :name "Maharishi Valmiki's Birthday"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 11 4) :name "Karaka Chaturthi (Karwa Chouth)"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 11 14) :name "Naraka Chaturdasi"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 11 15) :name "Govardhan Puja"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 11 16) :name "Bhai Duj"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 11 20) :name "Pratihar Shashthi or Surya Shashthi (Chhat Puja)"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 11 24) :name "Guru Teg Bahadur's Martyrdom Day"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2020 12 24) :name "Christmas Eve"
    :issued (2019 6 18) :issued-uri "https://web.archive.org/web/20190819163128id_/https://dopt.gov.in/sites/default/files/Holiday%20list%202020.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   (:date (2020 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/4/2020-JCA2 dated 08.04.2020: declares 14 April a holiday for all Central Government offices"
    :issued (2020 4 8) :issued-uri "https://web.archive.org/web/20210924071718id_/https://documents.doptcirculars.nic.in/D2/D02est/1242020-JCA2OOCrF.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2021
  :confidence :primary
  :authority "DoPT O.M. No. 12/9/2020-JCA-2 dated 10.06.2020: Holidays to be observed in Central Government Offices during the year 2021, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf"
  :note "dopt.gov.in file 'Holiday list (1).pdf'; earlier 2020-09 capture of the same URL is a truncated different digest."
  :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2021 1 26) :name "Republic Day"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 3 29) :name "Holi"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 4 2) :name "Good Friday"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 4 21) :name "Ram Navami"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 4 25) :name "Mahavir Jayanti"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 5 14) :name "Id-ul-Fitr"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 5 26) :name "Budha Purnima"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 7 21) :name "Id-ul-Zuha (Bakrid)"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 8 15) :name "Independence Day"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 8 19) :name "Muharram"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 8 30) :name "Janmashtami"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 10 2) :name "Mahatma Gandhi's Birthday"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 10 15) :name "Dussehra"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 10 19) :name "Milad-un-Nabi or Id-e-Milad (Birthday of Prophet Mohammad)"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 11 4) :name "Diwali (Deepavali)"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 11 19) :name "Guru Nanak's Birthday"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 12 25) :name "Christmas Day"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2021 1 1) :name "New Year's Day"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 1 13) :name "Lohri"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 1 14) :name "Makar Sankranti/Magha Bihu/ Pongal"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 1 20) :name "Guru Gobind Singh's Birthday"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 2 16) :name "Basant Panchami /Sri Panchami"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 2 19) :name "Shivaji Jayanti"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 2 26) :name "Hazarat Ali's Birthday"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 2 27) :name "Guru Ravi Das's Birthday"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 3 8) :name "Swami Dayananda Saraswati Jayanti"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 3 11) :name "Maha Shivaratri"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 3 28) :name "Holika Dahan/Dolyatra"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 4 4) :name "Easter Sunday"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 4 13) :name "Chaitra Sukladi / Gudi Padava / Ugadi / Cheti Chand / Vaisakhi /Vishu"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 4 14) :name "Mesadi Tamil New Year's Day"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 4 15) :name "Vaisakhadi (Bengal) / Bahag Bihu (Assam)"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 5 7) :name "Jamat-Ul-Vida"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 5 9) :name "Guru Rabindranath's birthday"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 7 12) :name "Rath Yatra"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 8 16) :name "Parsi New Year's day/Nauraj"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 8 21) :name "Onam or Thiru Onam Day"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 8 22) :name "Raksha Bandhan"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 8 30) :name "Janmashtami (Smarta)"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 9 10) :name "Vinayaka Chaturthi/ Ganesh Chaturthi"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 10 12) :name "Dussehra (Saptami)"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 10 13) :name "Dussehra (Mahashtami)"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 10 14) :name "Dussehra (Mahanavmi)"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 10 20) :name "Maharishi Valmiki's Birthday"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 10 24) :name "Karaka Chaturthi (Karwa Chouth)"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 11 3) :name "Naraka Chaturdasi"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 11 5) :name "Govardhan Puja"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 11 6) :name "Bhai Duj"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 11 10) :name "Pratihar Shashthi or Surya Shashthi (Chhat Puja)"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 11 24) :name "Guru Teg Bahadur's Martyrdom Day"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 12 24) :name "Christmas Eve"
    :issued (2020 6 10) :issued-uri "https://web.archive.org/web/20210809113919id_/https://dopt.gov.in/sites/default/files/Holiday%20list%20(1).pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   (:date (2021 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/4/2020-JCA dated 31.03.2021: declares 14 April a holiday for all Central Government offices"
    :note "Same document as doptcirculars 'Ambedkar holiday 2021m2h8H.pdf'."
    :issued (2021 3 31) :issued-uri "https://web.archive.org/web/20210422054946id_/https://dopt.gov.in/sites/default/files/Ambedkar%20holiday%202021.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2021 8 20) :name "Muharram" :list :gazetted
    :replaces ((2021 8 19) "Muharram")
    :authority "DoPT O.M. No. 12/13/2016-JCA-2 dated 11.08.2021: changes the date of the holiday in Delhi/New Delhi after the moon was sighted"
    :note "Delhi/New Delhi offices."
    :issued (2021 8 11) :issued-uri "https://web.archive.org/web/20210817052405id_/https://documents.doptcirculars.nic.in/D2/D02est/MuharramhiZm8.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2022
  :confidence :primary
  :authority "DoPT O.M. No. 12/5/2021-JCA-2 dated 08.06.2021: Holidays to be observed in Central Government Offices during the year 2022, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf"
  :note "First Wayback capture (20210824035455) is truncated at 1 MiB; this capture is complete."
  :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2022 1 26) :name "Republic Day"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 3 1) :name "Maha Shivratri"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 3 18) :name "Holi"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 4 14) :name "Mahavir Jayanti"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 4 15) :name "Good Friday"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 5 3) :name "Id-ul-Fitr"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 5 16) :name "Budha Purnima"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 7 10) :name "Id-ul-Zuha (Bakrid)"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 8 9) :name "Muharram"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 8 15) :name "Independence Day"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 8 19) :name "Janmashtami"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 10 2) :name "Mahatma Gandhi's Birthday"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 10 5) :name "Dussehra"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 10 9) :name "Milad-un-Nabi or Id-e-Milad (Birthday of Prophet Mohammad)"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 10 24) :name "Diwali (Deepavali)"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 11 8) :name "Guru Nanak's Birthday"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 12 25) :name "Christmas Day"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2022 1 1) :name "New Year's Day"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 1 9) :name "Guru Gobind Singh's Birthday"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 1 13) :name "Lohri"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 1 14) :name "Makar Sankranti/Magha Bihu/ Pongal"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 2 5) :name "Basant Panchami /Sri Panchami"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 2 15) :name "Hazarat Ali's Birthday"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 2 16) :name "Guru Ravi Das's Birthday"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 2 19) :name "Shiva ji Jayanti"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 2 26) :name "Swami Dayananda Saraswati Jayanti"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 3 17) :name "Holika Dahan"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 3 18) :name "Dolyatra"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 4 2) :name "Chaitra Sukladi /Gudi Padava/Ugadi/ Cheti Chand"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 4 10) :name "Ram Navami"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 4 14) :name "Vaisakhi /Vishu/ Meshadi"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 4 15) :name "Vaisakhadi (Bengal) / Bahag Bihu (Assam)"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 4 17) :name "Easter Sunday"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 4 29) :name "Jamat-Ul-Vida"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 5 9) :name "Guru Rabindranath's birthday"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 7 1) :name "Rath Yatra"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 8 11) :name "Raksha Bandhan"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 8 16) :name "Parsi New Year's day/Nauraj"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 8 18) :name "Janmashtami (Smarta)"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 8 31) :name "Vinayaka Chaturthi/ Ganesh Chaturthi"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 9 8) :name "Onam or Thiru Onam Day"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 10 2) :name "Dussehra (Saptami)"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 10 3) :name "Dussehra (Mahashtami)"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 10 4) :name "Dussehra (Mahanavmi)"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 10 9) :name "Maharishi Valmiki's Birthday"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 10 13) :name "Karaka Chaturthi (KarwaChouth)"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 10 24) :name "Naraka Chaturdasi"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 10 25) :name "Govardhan Puja"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 10 26) :name "Bhai Duj"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 10 30) :name "PratiharShashthi or Surya Shashthi (Chhat Puja)"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 11 24) :name "Guru Teg Bahadur's Martyrdom Day"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 12 24) :name "Christmas Eve"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2022 12 29) :name "Guru Gobind Singh's Birthday"
    :issued (2021 6 8) :issued-uri "https://web.archive.org/web/20220218080122id_/https://dopt.gov.in/sites/default/files/holiday%20list%202022..pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   (:date (2022 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/4/2020-JCA dated 04.04.2022: declares 14 April a holiday for all Central Government offices"
    :issued (2022 4 4) :issued-uri "https://web.archive.org/web/20220406013711id_/https://documents.doptcirculars.nic.in/D2/D02est/Ambedkar%20holidayC1scD.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2023
  :confidence :primary
  :authority "DoPT O.M. No. 12/5/2022-JCA dated 16.06.2022: Holidays to be observed in Central Government Offices during the year 2023, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf"
  :note "Date day handwritten ('16'). OCR text layer; Annexure-II checked against page image."
  :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2023 1 26) :name "Republic Day"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 3 8) :name "Holi"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 3 30) :name "Ram Navami"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 4 4) :name "Mahavir Jayanti"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 4 7) :name "Good Friday"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 4 22) :name "Id-ul-Fitr"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 5 5) :name "Budha Purnima"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 6 29) :name "Id-ul-Zuha (Bakrid)"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 7 29) :name "Muharram"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 8 15) :name "Independence Day"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 9 7) :name "Janmashtami (Vaishnva)"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 9 28) :name "Milad-un-Nabi or Id-e-Milad (Birthday of Prophet Mohammad)"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 10 2) :name "Mahatma Gandhi's Birthday"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 10 24) :name "Dussehra"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 11 12) :name "Diwali (Deepavali)"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 11 27) :name "Guru Nanak's Birthday"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 12 25) :name "Christmas Day"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2023 1 1) :name "New Year's Day"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 1 14) :name "Makar Sankranti/Magha Bihu/"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 1 15) :name "Pongal"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 1 26) :name "Basant Panchami /Sri Panchami"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 2 5) :name "Hazarat Ali's Birthday, Guru Ravi Das's Birthday"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 2 15) :name "Birthday of Swami Dayananda Saraswati"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 2 18) :name "Maha Shivratri"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 2 19) :name "Shiva ji Jayanti"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 3 7) :name "holika dahan, dolyatra"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 3 22) :name "Chaitra Sukladi /Gudi Padava/Ugadi/ Cheti Chand"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 4 9) :name "Easter Sunday"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 4 14) :name "Vaisakhi /Vishu/ Meshadi"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 4 15) :name "Vaisakhadi (Bengal) / Bahag Bihu (Assam)"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 4 21) :name "Jamat-Ul-Vida"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 5 9) :name "Birthday of Guru Rabindranath' Tagore"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 6 20) :name "Rath Yatra"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 8 16) :name "Parsi New Year's day/Nauraj"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 8 20) :name "Vinayaka Chaturthi"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 8 29) :name "Onam or Thiru Onam Day"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 8 30) :name "Raksha Bandhan"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 9 6) :name "Janmashtami (Smarta)"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 9 19) :name "Ganesh Chaturthi"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 10 21) :name "Dussehra (Saptami)"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 10 22) :name "Dussehra (Mahashtami)"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 10 23) :name "Dussehra (Mahanavmi)"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 10 28) :name "Maharishi Valmiki's Birthday"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 11 1) :name "Karaka Chaturthi (Karwa Chouth)"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 11 12) :name "Naraka Chaturdasi"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 11 13) :name "Govardhan Puja"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 11 15) :name "Bhai Duj"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 11 19) :name "Pratihar Shashthi or Surya Shashthi (Chhat Puja)"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 11 24) :name "Guru Teg Bahadur's Martyrdom Day"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 12 24) :name "Christmas Eve"
    :issued (2022 6 16) :issued-uri "https://web.archive.org/web/20220717230825id_/https://documents.doptcirculars.nic.in/D2/D02est/Naresh_NIC_1_20220616164953373JH62n.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   (:date (2023 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/4/2020-JCA dated 11.04.2023: declares 14 April a holiday for all Central Government offices"
    :issued (2023 4 11) :issued-uri "https://web.archive.org/web/20230507152400id_/https://dopt.gov.in/sites/default/files/Declaration%20of%20Holiday%20on%2014th%20April%202023%20-%20Birthday%20of%20Dr%20B.R%20Ambedkar.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2023 9 8) :name "Closing of Central Government Offices located in Delhi on the occasion of G-20 Summit" :list :gazetted
    :authority "DoPT O.M. No. 12/7/2023-JCA dated 24.08.2023: amends the list"
    :note "Delhi only; closure 08-09-2023 to 10-09-2023 (9th/10th are Sat/Sun)."
    :issued (2023 8 24) :issued-uri "https://web.archive.org/web/20230901090353id_/https://documents.doptcirculars.nic.in/D2/D02est/ClosingOfficesG20Tdn5b.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2024
  :confidence :primary
  :authority "DoPT O.M. No. 12/2/2023-JCA dated 03.07.2023: Holidays to be observed in Central Government Offices during the year 2024, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF"
  :note "Annexure-II numbering repeats S.No. 31 (34 rows, last numbered 33)."
  :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2024 1 26) :name "Republic Day"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 3 25) :name "Holi"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 3 29) :name "Good Friday"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 4 11) :name "Id-ul-Fitr"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 4 17) :name "Ram Navami"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 4 21) :name "Mahavir Jayanti"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 5 23) :name "Budha Purnima"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 6 17) :name "Id-ul-Zuha (Bakrid)"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 7 17) :name "Muharram"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 8 15) :name "Independence Day"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 8 26) :name "Janmashtami (Vaishnva)"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 9 16) :name "Milad-un-Nabi or Id-e-Milad (Birthday of Prophet Mohammad)"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 10 2) :name "Mahatma Gandhi's Birthday"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 10 12) :name "Dussehra"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 10 31) :name "Diwali (Deepavali)"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 11 15) :name "Guru Nanak's Birthday"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 12 25) :name "Christmas Day"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2024 1 1) :name "New Year's Day"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 1 13) :name "Lohri"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 1 14) :name "Makar Sankranti"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 1 15) :name "Magha Bihu/ Pongal"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 1 17) :name "Guru Gobind Singh's Birthday"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 1 25) :name "Hazarat Ali's Birthday"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 2 14) :name "Sri Panchami, Basant Panchami"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 2 19) :name "Shiva ji Jayanti"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 2 24) :name "Guru Ravi Das's Birthday"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 3 6) :name "Birthday of Swami Dayananda Saraswati"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 3 8) :name "Maha Shivratri"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 3 24) :name "Holika dahan"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 3 25) :name "Dolyatra"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 3 31) :name "Easter Sunday"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 4 5) :name "Jamat-Ul-Vida"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 4 9) :name "Chaitra Sukladi /Gudi Padava/Ugadi/ Cheti Chand"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 4 13) :name "Vaisakhi /Vishu"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 4 14) :name "Meshadi (Tamil New Year's Day) / Vaisakhadi (Bengal) / Bahag Bihu (Assam)"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 5 8) :name "Birthday of Guru Rabindranath Tagore"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 7 7) :name "Rath Yatra"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 8 15) :name "Parsi New Year's day/Nauraj"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 8 19) :name "Raksha Bandhan"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 9 7) :name "Ganesh Chaturthi /Vinayaka Chaturthi"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 9 15) :name "Onam or Thiru Onam Day"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 10 10) :name "Dusshera (Saptami)"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 10 11) :name "Dussehra (Mahashtami) /Dussehra (Mahanavmi)"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 10 17) :name "Maharishi Valmiki's Birthday"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 10 20) :name "Karaka Chaturthi (Karwa Chouth)"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 10 31) :name "Naraka Chaturdasi"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 11 2) :name "Govardhan Puja"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 11 3) :name "Bhai Duj"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 11 7) :name "Pratihar Shashthi or Surya Shashthi (Chhat Puja)"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 11 24) :name "Guru Teg Bahadur's Martyrdom Day"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2024 12 24) :name "Christmas Eve"
    :issued (2023 7 3) :issued-uri "https://web.archive.org/web/20231129084328id_/https://dopt.gov.in/sites/default/files/Holiday%20to%20be%20observed%20in%20Central%20government%20offices%20during%20the%20year%202024.PDF" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   (:date (2024 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/4/2020-JCA dated 14.03.2024: declares 14 April a holiday for all Central Government offices"
    :note "Sunday. OM date day handwritten (read as 14th; uncertain)."
    :issued (2024 3 14) :issued-uri "https://web.archive.org/web/20241106105551id_/https://dopt.gov.in/sites/default/files/Declaration%20of%20Holiday%20on%2014th%20April%202024.PDF" :published (2024 3 28) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=9491" :published-in "Department of Posts No. Y-21/01/2023-PE-II of 28.03.2024 forwarding the O.M.")
   ))
 (:year 2025
  :confidence :primary
  :authority "DoPT O.M. No. 12/2/2023-JCA dated 09.07.2024: Holidays to be observed in Central Government Offices during the year 2025, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf"
  :note "First Wayback capture (20240714065013) is truncated at 1 MiB; this capture is complete. Gandhi Jayanti and Dussehra both 2 October."
  :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles"
  :holidays (
   (:date (2025 1 26) :name "Republic Day"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 2 26) :name "Maha Shivaratri"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 3 14) :name "Holi"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 3 31) :name "Id-ul-Fitr"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 4 10) :name "Mahavir Jayanti"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 4 18) :name "Good Friday"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 5 12) :name "Budha Purnima"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 6 7) :name "Id-ul-Zuha (Bakrid)"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 7 6) :name "Muharram"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 8 15) :name "Independence Day"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 8 16) :name "Janmashtami"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 9 5) :name "Milad-un-Nabi or Id-e-Milad (Birthday of Prophet Mohammad)"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 10 2) :name "Mahatma Gandhi's Birthday"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 10 2) :name "Dussehra"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 10 20) :name "Diwali (Deepavali)"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 11 5) :name "Guru Nanak's Birthday"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 12 25) :name "Christmas Day"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   )
  :restricted (
   (:date (2025 1 1) :name "New Year's Day"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 1 6) :name "Guru Gobind Singh's Birthday"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 1 14) :name "Makar Sankranti/Magha Bihu/ Pongal/ Hazarat Ali's Birthday"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 2 2) :name "Basant Panchami /Sri Panchami"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 2 12) :name "Guru Ravi Das's Birthday"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 2 19) :name "Shiva ji Jayanti"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 2 23) :name "Birthday of Swami Dayananda Saraswati"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 3 13) :name "Holika Dahan"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 3 14) :name "Dolyatra"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 3 28) :name "Jamat-Ul-Vida"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 3 30) :name "Chaitra Sukladi /Gudi Padava/Ugadi/ Cheti Chand"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 4 6) :name "Ram Navmi"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 4 13) :name "Vaisakhi /Vishu"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 4 14) :name "Meshadi (Tamil New Year's Day)"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 4 15) :name "Vaisakhadi (Bengal) / Bahag Bihu (Assam)"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 4 20) :name "Easter Sunday"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 5 9) :name "Guru Rabindranath's birthday"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 6 27) :name "Rath Yatra"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 8 9) :name "Raksha Bandhan"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 8 15) :name "Parsi New Year's day/Nauraj"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 8 15) :name "Janmashtami (Smarta)"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 8 27) :name "Ganesh Chaturthi/Vinayaka Chaturthi"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 9 5) :name "Onam or Thiru Onam Day"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 9 29) :name "Dussehra (Saptami)"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 9 30) :name "Dussehra (Mahashtami)"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 10 1) :name "Dussehra (Mahanavmi)"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 10 7) :name "Maharishi Valmiki's Birthday"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 10 10) :name "Karaka Chaturthi (KarwaChouth)"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 10 20) :name "Naraka Chaturdasi"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 10 22) :name "Govardhan Puja"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 10 23) :name "Bhai Duj"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 10 28) :name "Pratihar Shashthi or Surya Shashthi (Chhat Puja)"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 11 24) :name "Guru Teg Bahadur's Martyrdom Day"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   (:date (2025 12 24) :name "Christmas Eve"
    :issued (2024 7 9) :issued-uri "https://web.archive.org/web/20240901015019id_/https://dopt.gov.in/sites/default/files/List%20of%20holidays%202025.pdf" :published (2024 10 16) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=11198" :published-in "Department of Posts No. Y-21/2/2024-PE-II-DOP of 16.10.2024 forwarding the O.M. to all circles")
   )
  :amendments (
   (:date (2025 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/4/2020-JCA2 dated 27.03.2025: declares 14 April a holiday for all Central Government offices"
    :issued (2025 3 27) :issued-uri "https://web.archive.org/web/20250415132649id_/https://documents.doptcirculars.nic.in/D2/D02est/Holiday%20on%2014th%20April%202025%20Birthday%20of%20Dr%20B%20R%20AmbedkarDHZ8b.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   ))
 (:year 2026
  :confidence :primary
  :authority "DoPT O.M. No. 12/2/2023-JCA dated 03.07.2025: Holidays to be observed in Central Government Offices during the year 2026, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf"
  :note "Hazarat Ali's Birthday appears twice in RH list (01-03 and 12-23)."
  :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found"
  :holidays (
   (:date (2026 1 26) :name "Republic Day"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 3 4) :name "Holi"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 3 21) :name "Id-ul-Fitr"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 3 26) :name "Ram Navami"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 3 31) :name "Mahavir Jayanti"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 4 3) :name "Good Friday"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 5 1) :name "Budha Purnima"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 5 27) :name "Id-ul-Zuha (Bakrid)"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 6 26) :name "Muharram"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 8 15) :name "Independence Day"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 8 26) :name "Milad-un-Nabi or Id-e-Milad (Birthday of Prophet Mohammad)"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 9 4) :name "Janmashtami (Vaishnva)"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 10 2) :name "Mahatma Gandhi's Birthday"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 10 20) :name "Dussehra"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 11 8) :name "Diwali (Deepavali)"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 11 24) :name "Guru Nanak's Birthday"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 12 25) :name "Christmas Day"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :restricted (
   (:date (2026 1 1) :name "New Year's Day"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 1 3) :name "Hazarat Ali's Birthday"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 1 14) :name "Makar Sankranti"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 1 14) :name "Magha Bihu / Pongal"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 1 23) :name "Sri Panchami, Basant Panchami"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 2 1) :name "Guru Ravi Das's Birthday"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 2 12) :name "Birthday of Swami Dayananda Saraswati"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 2 15) :name "Maha Shivratri"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 2 19) :name "Shiva ji Jayanti"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 3 3) :name "Holika dahan"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 3 3) :name "Dolyatra"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 3 19) :name "Chaitra Sukladi /Gudi Padava/Ugadi/ Cheti Chand"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 3 20) :name "Jamat-Ul-Vida"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 4 5) :name "Easter Sunday"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 4 14) :name "Vaisakhi /Visu/ Meshadi (Tamil New Year's Day)"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 4 15) :name "Vaisakhadi (Bengal) / Bahag Bihu (Assam)"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 5 9) :name "Birthday of Guru Rabindranath Tagore"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 7 16) :name "Rath Yatra"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 8 15) :name "Parsi New Year's day / Nauraj"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 8 26) :name "Onam or Thiru Onam Day"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 8 28) :name "Raksha Bandhan"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 9 14) :name "Ganesh Chaturthi /Vinayak Chaturthi"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 10 18) :name "Dusshera (Saptami)"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 10 19) :name "Dussehra (Mahashtami)"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 10 20) :name "Dussehra (Mahanavmi)"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 10 26) :name "Maharishi Valmiki's Birthday"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 10 29) :name "Karaka Chaturthi (Karwa Chouth)"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 11 8) :name "Naraka Chaturdasi"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 11 9) :name "Govardhan Puja"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 11 11) :name "Bhai Duj"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 11 15) :name "Pratihar Shashthi or Surya Shashthi (Chhat Puja)"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 11 24) :name "Guru Teg Bahadur's Martyrdom Day"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 12 23) :name "Hazarat Ali's Birthday"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   (:date (2026 12 24) :name "Christmas Eve"
    :issued (2025 7 3) :issued-uri "https://web.archive.org/web/20250909093922id_/https://documents.doptcirculars.nic.in/D2/D02est/Holidays%20to%20be%20observed%20in%20Central%20Government%20Offices%20during%20the%20year%2020265vgBs.pdf" :published nil :dates-note "DoPT posts its O.M.s on dopt.gov.in / persmin.gov.in with no date of publication, and no dated forwarding circular or Gazette notice of this one was found")
   )
  :amendments (
   (:date (2026 4 14) :name "Birthday of Dr. B.R. Ambedkar" :list :gazetted
    :authority "DoPT O.M. No. 12/4/2020-JCA dated 09.04.2026: declares 14 April a holiday for all Central Government offices"
    :note "Copy forwarded by the Department of Posts (page 2 of the PDF)"
    :issued (2026 4 9) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=14760" :published (2026 4 10) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=14760" :published-in "Department of Posts No. Y-21/1/2026-PE-II of 10.04.2026 forwarding the O.M.")
   ))
 (:year 2027
  :confidence :primary
  :authority "DoPT O.M. No. 12/2/2023-JCA dated 16.07.2026: Holidays to be observed in Central Government Offices during the year 2027, Annexure-I (Delhi/New Delhi) and Annexure-II (restricted holidays)"
  :uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435"
  :note "India Post forwarding copy (Y-21/2/2026-PE-II-DOP). Independence Day and Milad-un-Nabi both 15 August."
  :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles"
  :holidays (
   (:date (2027 1 26) :name "Republic Day"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 3 10) :name "Id-ul-Fitr"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 3 23) :name "Holi"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 3 26) :name "Good Friday"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 4 15) :name "Ram Navami"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 4 19) :name "Mahavir Jayanti"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 5 17) :name "Id-ul-Zuha (Bakrid)"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 5 20) :name "Budha Purnima"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 6 16) :name "Muharram"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 8 15) :name "Independence Day"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 8 15) :name "Milad-un-Nabi or Id-e-Milad (Prophet Mohammad's Birthday)"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 8 25) :name "Janmashtami (Vaishnav)"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 10 2) :name "Mahatma Gandhi's Birthday"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 10 9) :name "Dussehra (Vijaya Dashmi)"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 10 29) :name "Diwali (Deepavali)"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 11 14) :name "Guru Nanak's Birthday"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 12 25) :name "Christmas Day"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   )
  :restricted (
   (:date (2027 1 1) :name "New Year's Day"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 1 14) :name "Makar Sankranti / Magha Bihu"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 1 15) :name "Pongal, Guru Gobind Singh's Birthday"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 2 11) :name "Sri Panchami, Basant Panchami"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 2 19) :name "Shiva Ji Jayanti"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 2 20) :name "Guru Ravi Das's Birthday"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 3 2) :name "Swami Dayananda Saraswati's Birthday"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 3 5) :name "Jamat-Ul-Vida"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 3 6) :name "Maha Shivratri"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 3 22) :name "Holika Dahan, Dolyatra"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 3 28) :name "Easter Sunday"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 4 7) :name "Chaitra Sukladi /Gudi Padava/Ugadi/ Cheti Chand /1st Navratra"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 4 14) :name "Vaisakhi /Vishu/ Meshadi (Tamil New Year's Day)"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 4 15) :name "Vaisakhadi (Bengal) / Bahag Bihu (Assam)"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 5 9) :name "Guru Rabindranath Tagore's Birthday"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 7 5) :name "Rath Yatra"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 8 15) :name "Parsi New Year's day/Navroz"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 8 17) :name "Raksha Bandhan"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 9 4) :name "Ganesh Chaturthi /Vinayak Chaturthi"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 9 12) :name "Onam or Thiru Onam Day"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 10 6) :name "Dusshera (Saptami)"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 10 7) :name "Dussehra (Mahashtami)"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 10 8) :name "Dussehra (Mahanavmi)"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 10 15) :name "Maharishi Valmiki's Birthday"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 10 18) :name "Karaka Chaturthi (Karwa Chouth)"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 10 28) :name "Naraka Chaturdasi"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 10 30) :name "Govardhan Puja"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 10 31) :name "Bhai Duj"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 11 4) :name "Pratihar Shashthi or Surya Shashthi (Chhath Puja)"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 11 24) :name "Guru Teg Bahadur's Martyrdom Day"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 12 12) :name "Hazarat Ali's Birthday"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   (:date (2027 12 24) :name "Christmas Eve"
    :issued (2026 7 16) :issued-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published (2026 9 8) :published-uri "https://utilities.cept.gov.in/dop/pdfbind.ashx?id=15435" :published-in "Department of Posts No. Y-21/2/2026-PE-II-DOP of 08.09.2026 forwarding the O.M. to all circles")
   )
  :amendments (
   ))
)
