;;;; XPAR - Euronext Paris cash. Draft research data. Includes EURONEXT (rules from 2000; 1 May covered here for 2000-2001).
(:name "XPAR"
 :title "Euronext Paris trading days"
 :authority "Euronext Paris / Euronext yearly calendar notices" :authority-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
 :include ("EURONEXT")
 :rules ((:fixed "Labour Day (pre-harmonisation)" 5 1 :from 2000 :to 2001 :authority "https://www.euronext.com/sites/www.euronext.com/files/nouveau_marche_calendar_of_business_day.pdf; https://www.euronext.com/sites/www.euronext.com/files/paris_bourse_calendar_of_business_days.pdf"))
 :notices (
   (:title "Calendrier des marches / Calendar of business days an 2000 (Bulletin du Nouveau Marche N 99-R-068)"
    :uri "https://www.euronext.com/sites/www.euronext.com/files/nouveau_marche_calendar_of_business_day.pdf"
    :year 2000
    :issued (1999 10 5) :issued-uri "https://www.euronext.com/sites/www.euronext.com/files/nouveau_marche_calendar_of_business_day.pdf"
    :published (1999 10 5) :published-uri "https://www.euronext.com/sites/www.euronext.com/files/nouveau_marche_calendar_of_business_day.pdf"
    :published-in "SBF-ParisBourse Bulletin du Nouveau Marche N 99-R-068" :dates-note "Markets 'Bourse de Paris', 'Nouveau Marche', MONEP equity options. 1 Jan 2000 Saturday. Pre-Euronext (Euronext formed 22 Sep 2000)."
    :closed (((2000 5 1) "Fete du Travail") ((2000 6 12) "Lundi de Pentecote") ((2000 7 14) "Fete Nationale"))
    :open ()
    :early-closes ()
    :late-opens ())
   (:title "Calendrier des marches / Calendar of business days an 2001 (Decisions et avis N 2000-4660)"
    :uri "https://www.euronext.com/sites/www.euronext.com/files/paris_bourse_calendar_of_business_days.pdf"
    :year 2001
    :issued (2000 11 7) :issued-uri "https://www.euronext.com/sites/www.euronext.com/files/paris_bourse_calendar_of_business_days.pdf"
    :published (2000 11 7) :published-uri "https://www.euronext.com/sites/www.euronext.com/files/paris_bourse_calendar_of_business_days.pdf"
    :published-in "Euronext Paris Decisions et avis N 2000-4660" :dates-note "Lists 1 Jan, GF 13 Apr, EM 16 Apr, 1 May, Whit Monday 4 Jun, 25+26 Dec, 31 Dec (euro changeover). No half day announced for 24 Dec 2001."
    :closed (((2001 5 1) "Fete du Travail (Paris/Brussels only in 2001)"))
    :open ()
    :early-closes ()
    :late-opens ())
 ))
