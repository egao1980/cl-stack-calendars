;;;; XLIS - Euronext Lisbon cash. Includes EURONEXT from 2003 (EURONEXT rules would also generate GF/EM/26 Dec in 2000-2002,
;;;; which ec also closes). Hours: Euronext trades Lisbon on the CET clock: 09:00-17:30 CET = 08:00-16:30 Europe/Lisbon;
;;;; half days 14:00/14:05 CET = 13:00/13:05 Lisbon. See XLIS-hours.md.
(:name "XLIS"
 :title "Euronext Lisbon trading days"
 :authority "Euronext yearly calendar notices (Lisbon included from the 2003 calendar)" :authority-uri "https://www.euronext.com/sites/www.euronext.com/files/euronext_calendar_of_cash_business_days.pdf"
 :include ("EURONEXT")
 :bases ((:calendar "PT" :from nil :to (2002 12 31) :authority "ASSUMPTION - no BVLP / Euronext Lisbon 2000-2002 trading calendar found; ec closes PT national holidays + Carnival + 13 Jun (Santo Antonio, Lisbon) + 24 Dec in 2000-2002"))
 :rules ()
 :gaps (
   (:years "2000-2002" :note "Euronext Lisbon (ex-BVLP) lists for 2000, 2001, 2002 not found (web.archive.org was offline during the search). First Euronext list naming Lisbon: Trading Announcement 2002-519 (2003 calendar). ec 2000-2002 extra closures: 2000-03-07, 04-25, 06-13, 06-22, 08-15, 10-05, 11-01, 12-01, 12-08; 2001-02-27, 04-25, 06-13, 06-14, 08-15, 10-05, 11-01, 12-24; 2002-02-12, 04-25, 05-30, 06-10, 08-15, 11-01, 12-24 - all unverified."))
 :notices (
 ))
