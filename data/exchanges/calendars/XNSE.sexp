;;;; XNSE — National Stock Exchange of India, Capital Market (cash equity) segment trading days
;;;; Sources cached under ~/.cache/cl-stack-calendars/exchanges/xnse/.
;;;; NSE notifies trading holidays once a year (December) in a Capital Market Segment circular
;;;; "Trading holidays for the calendar year YYYY" (clause 2 of Chapter IX of the Bye-Laws, Regulation 2.3.1
;;;; Part A CM Regulations), then changes them by "partial modification" circulars (Mumbai poll days, NI-Act
;;;; holidays, RBI date shifts) and adds weekend live sessions (Union Budget, 20 Jan 2024) by circular.
;;;; The list follows the Maharashtra state holiday list, NOT the central (DoPT) list behind our "IN"
;;;; civil calendar: Maharashtra Day, Ambedkar Jayanti, Ganesh Chaturthi, Diwali Balipratipada are holidays;
;;;; Buddha Pournima, Janmashtami, Milad-un-Nabi etc. are normally not. => no civil base.
;;;; Rules = the fixed-date holidays present in every list 2009-2026 (no weekend substitution);
;;;; all lunisolar/Islamic holidays are per-year notices (:closed), one notice per yearly circular.
;;;; Diwali Laxmi Pujan: listed holiday with an evening Muhurat session - kept closed (see XNSE-hours.md).
;;;; First year with an exchange list here: see :gaps (lists found for 2009-2026).
(:name "XNSE"
 :title "NSE Capital Market segment trading days"
 :authority "NSE Capital Market Segment circular \"Trading holidays for the calendar year YYYY\" (issued each December under clause 2 of Chapter IX of the NSE Bye-Laws and Regulation 2.3.1 of Part A of the CM Regulations)"
 :authority-uri "https://nsearchives.nseindia.com/content/circulars/CMTR71775.pdf"
 :rules ((:fixed "Republic Day" 1 26 :authority "NSE yearly holiday circulars 2009-2026 (e.g. NSE/CMTR/71775: \"January 26, 2026 Monday Republic Day\")")
         (:fixed "Dr. Baba Saheb Ambedkar Jayanti" 4 14 :authority "NSE yearly holiday circulars 2009-2026 (e.g. NSE/CMTR/65587: \"April 14, 2025 Monday Dr. Baba Saheb Ambedkar Jayanti\")")
         (:fixed "Maharashtra Day" 5 1 :authority "NSE yearly holiday circulars 2009-2026 (\"May Day\" in 2010-2014, \"Maharashtra Day\" in 2009 and from 2015)")
         (:fixed "Independence Day" 8 15 :authority "NSE yearly holiday circulars 2009-2026")
         (:fixed "Mahatma Gandhi Jayanti" 10 2 :authority "NSE yearly holiday circulars 2009-2026")
         (:fixed "Christmas" 12 25 :authority "NSE yearly holiday circulars 2009-2026")
         (:easter "Good Friday" -2 :authority "NSE yearly holiday circulars 2009-2026"))
 :notices
 (
  (:title "NSE circular NSE/CMTR/11733 (054/2008): Trading holidays for the calendar year 2009"
   :year 2009
   :uri "https://nsearchives.nseindia.com/content/circulars/cmtr11733.htm"
   :issued (2008 12 8) :issued-uri "https://nsearchives.nseindia.com/content/circulars/cmtr11733.htm"
   :published (2008 12 8) :published-uri "https://nsearchives.nseindia.com/content/circulars/cmtr11733.htm"
   :published-in "NSE circular, Capital Market Segment (Download Ref No NSE/CMTR/11733, Circular Ref. No 054/2008)"
   :dates-note "Weekday holidays listed: 2009-01-08 Moharram; 2009-01-26 Republic Day; 2009-02-23 Mahashivratri; 2009-03-10 Id-E- Milad; 2009-03-11 Holi; 2009-04-03 Ram Navmi; 2009-04-07 Mahavir Jayanti; 2009-04-10 Good Friday; 2009-04-14 Dr. Ambedkar Jayanti; 2009-05-01 Maharashtra Day; 2009-09-21 Ramzan ID; 2009-09-28 Dasara; 2009-10-02 Gandhi Jayanti; 2009-10-19 Bhau Bhij; 2009-11-02 Gurunanak Jayanti; 2009-12-25 Christmas; 2009-12-28 Moharram (falls twice in 2009). Weekend holidays listed: 2009-05-09 Buddha Pournima; 2009-08-15 Independence Day; 2009-08-23 Ganesh Chaturthi; 2009-10-17 Laxmi Puja."
   :closed (((2009 1 8) "Moharram")
            ((2009 2 23) "Mahashivratri")
            ((2009 3 10) "Id-E- Milad")
            ((2009 3 11) "Holi")
            ((2009 4 3) "Ram Navmi")
            ((2009 4 7) "Mahavir Jayanti")
            ((2009 9 21) "Ramzan ID")
            ((2009 9 28) "Dasara")
            ((2009 10 19) "Bhau Bhij")
            ((2009 11 2) "Gurunanak Jayanti")
            ((2009 12 28) "Moharram (falls twice in 2009)"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular (download no. 13194): Trading Holiday on October 13, 2009 on account of Assembly Elections in Maharashtra"
   :year 2009
   :uri "https://nsearchives.nseindia.com/content/circulars/cmtr13194.htm"
   :issued (2009 10 6) :issued-uri "https://nsearchives.nseindia.com/content/circulars/cmtr13194.htm"
   :published (2009 10 6) :published-uri "https://nsearchives.nseindia.com/content/circulars/cmtr13194.htm"
   :published-in "NSE circular, Capital Market Operations"
   :dates-note "\"in partial modification of the circular NSE/CMO/054/2008 (download no. NSE/CMTR/11733) dated December 08, 2008, the Exchange here by notifies Tuesday, October 13, 2009 as a trading holiday on account of Assembly Elections in Maharashtra\"."
   :closed (((2009 10 13) "Assembly Elections in Maharashtra"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/13713 (061): Trading holidays for the calendar year 2010"
   :year 2010
   :uri "https://nsearchives.nseindia.com/content/circulars/cmtr13713.pdf"
   :issued (2009 12 17) :issued-uri "https://nsearchives.nseindia.com/content/circulars/cmtr13713.pdf"
   :published (2009 12 17) :published-uri "https://nsearchives.nseindia.com/content/circulars/cmtr13713.pdf"
   :published-in "NSE circular, Capital Market Segment (Download Ref No NSE/CMTR/13713, Circular Ref. No 061)"
   :dates-note "Weekday holidays listed: 2010-01-01 New Year; 2010-01-26 Republic Day; 2010-02-12 Mahashivratri; 2010-03-01 Holi; 2010-03-24 Ram Navmi; 2010-04-02 Good Friday; 2010-04-14 Dr. Ambedkar Jayanti; 2010-09-10 Ramzan ID; 2010-11-05 Laxmi Puja; 2010-11-17 Bakri Id; 2010-12-17 Moharum. Weekend holidays listed: 2010-03-28 Mahavir Jayanti; 2010-05-01 May Day; 2010-08-15 Independence Day; 2010-09-11 Ganesh Chaturthi; 2010-10-02 Gandhi Jayanti; 2010-10-17 Dasara; 2010-11-07 Bhau Bhij; 2010-11-21 Gurunanak Jayanti; 2010-12-25 Christmas."
   :closed (((2010 1 1) "New Year")
            ((2010 2 12) "Mahashivratri")
            ((2010 3 1) "Holi")
            ((2010 3 24) "Ram Navmi")
            ((2010 9 10) "Ramzan ID")
            ((2010 11 5) "Laxmi Puja")
            ((2010 11 17) "Bakri Id")
            ((2010 12 17) "Moharum"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/16348 (126): Trading holidays for the calendar year 2011"
   :year 2011
   :uri "https://nsearchives.nseindia.com/content/circulars/cmtr16348.pdf"
   :issued (2010 11 22) :issued-uri "https://nsearchives.nseindia.com/content/circulars/cmtr16348.pdf"
   :published (2010 11 22) :published-uri "https://nsearchives.nseindia.com/content/circulars/cmtr16348.pdf"
   :published-in "NSE circular, Capital Market Segment (Download Ref No NSE/CMTR/16348, Circular Ref. No 126)"
   :dates-note "Weekday holidays listed: 2011-01-26 Republic Day; 2011-03-02 Mahashivratri; 2011-04-12 Ram Navmi; 2011-04-14 Dr. Ambedkar Jayanti; 2011-04-22 Good Friday; 2011-08-15 Independence Day; 2011-08-31 Ramzan ID; 2011-09-01 Ganesh Chaturthi; 2011-10-06 Dasara; 2011-10-26 Laxmi Puja; 2011-10-27 Diwali - Balipratipada; 2011-11-07 Bakri Id; 2011-11-10 Gurunanak Jayanti; 2011-12-06 Moharum. Weekend holidays listed: 2011-01-01 New Year; 2011-03-20 Holi; 2011-04-16 Mahavir Jayanti; 2011-05-01 May Day; 2011-10-02 Gandhi Jayanti; 2011-12-25 Christmas."
   :closed (((2011 3 2) "Mahashivratri")
            ((2011 4 12) "Ram Navmi")
            ((2011 8 31) "Ramzan ID")
            ((2011 9 1) "Ganesh Chaturthi")
            ((2011 10 6) "Dasara")
            ((2011 10 26) "Laxmi Puja")
            ((2011 10 27) "Diwali - Balipratipada")
            ((2011 11 7) "Bakri Id")
            ((2011 11 10) "Gurunanak Jayanti")
            ((2011 12 6) "Moharum"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/19539 (066/2011): Trading holidays for the calendar year 2012"
   :year 2012
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR19539.pdf"
   :issued (2011 12 9) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR19539.pdf"
   :published (2011 12 9) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR19539.pdf"
   :published-in "NSE circular, Capital Market Segment (Download Ref No NSE/CMTR/19539, Circular Ref. No 066/2011)"
   :dates-note "Weekday holidays listed: 2012-01-26 Republic Day; 2012-02-20 Mahashivratri; 2012-03-08 Holi; 2012-04-05 Mahavir Jayanti; 2012-04-06 Good Friday; 2012-05-01 May Day; 2012-08-15 Independence Day; 2012-08-20 Ramzan ID; 2012-09-19 Ganesh Chaturthi; 2012-10-02 Gandhi Jayanti; 2012-10-24 Dasera; 2012-11-13 Diwali – Laxmi Puja; 2012-11-14 Diwali - Balipratipada; 2012-11-28 Gurunanak Jayanti; 2012-12-25 Christmas. Weekend holidays listed: 2012-01-01 New Year; 2012-04-01 Ram Navami; 2012-04-14 Ambedkar Jayanti; 2012-10-27 Bakri Id; 2012-11-25 Moharram."
   :closed (((2012 2 20) "Mahashivratri")
            ((2012 3 8) "Holi")
            ((2012 4 5) "Mahavir Jayanti")
            ((2012 8 20) "Ramzan ID")
            ((2012 9 19) "Ganesh Chaturthi")
            ((2012 10 24) "Dasera")
            ((2012 11 13) "Diwali – Laxmi Puja")
            ((2012 11 14) "Diwali - Balipratipada")
            ((2012 11 28) "Gurunanak Jayanti"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/22317 (79/2012): Trading holidays for the calendar year 2013"
   :year 2013
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR22317.pdf"
   :issued (2012 12 17) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR22317.pdf"
   :published (2012 12 17) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR22317.pdf"
   :published-in "NSE circular, Capital Market Segment (Download Ref No NSE/CMTR/22317, Circular Ref. No 79/2012)"
   :dates-note "Weekday holidays listed: 2013-03-27 Holi; 2013-03-29 Good Friday; 2013-04-19 Ram Navmi; 2013-04-24 Mahavir Jayanti; 2013-05-01 May Day; 2013-08-09 Ramzan ID; 2013-08-15 Independence Day; 2013-09-09 Ganesh Chaturthi; 2013-10-02 Gandhi Jayanti; 2013-10-16 Bakri ID; 2013-11-04 Diwali-Balipratipada; 2013-11-14 Moharram; 2013-12-25 Christmas. Weekend holidays listed: 2013-01-26 Republic Day; 2013-03-10 Mahashivratri; 2013-04-14 Dr. Ambedkar Jayanti; 2013-10-13 Dasera; 2013-11-03 Diwali-Laxmi Puja; 2013-11-17 Gurunank Jayanti. Muhurat trading on November 03, 2013 (evening special session on the Diwali Laxmi Pujan holiday; not representable, day kept as listed)."
   :closed (((2013 3 27) "Holi")
            ((2013 4 19) "Ram Navmi")
            ((2013 4 24) "Mahavir Jayanti")
            ((2013 8 9) "Ramzan ID")
            ((2013 9 9) "Ganesh Chaturthi")
            ((2013 10 16) "Bakri ID")
            ((2013 11 4) "Diwali-Balipratipada")
            ((2013 11 14) "Moharram"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/24977 (93/2013): Trading holiday (Moharram moved from 14 to 15 November 2013)"
   :year 2013
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR24977.pdf"
   :issued (2013 11 13) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR24977.pdf"
   :published (2013 11 13) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR24977.pdf"
   :published-in "NSE circular, Capital Market Segment"
   :dates-note "\"This is with reference to RBI Holiday Notice, holiday on November 14, 2013 is revoked and November 15, 2013 is declared as a holiday ... in partial modification of Exchange circular No. NSE/CMTR/79/2012 dated December 17, 2012\"."
   :closed (((2013 11 15) "Moharram (moved per RBI holiday notice)"))
   :open (((2013 11 14) "holiday of 14 Nov 2013 revoked; normal market timings"))
   :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/25326 (99/2013): Trading holidays for the calendar year 2014"
   :year 2014
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR25326.pdf"
   :issued (2013 12 20) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR25326.pdf"
   :published (2013 12 20) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR25326.pdf"
   :published-in "NSE circular, Capital Market Segment (Download Ref No NSE/CMTR/25326, Circular Ref. No 99/2013)"
   :dates-note "Weekday holidays listed: 2014-02-27 Mahashivratri; 2014-03-17 Holi; 2014-04-08 Ram Navami; 2014-04-14 Dr. Baba Saheb Ambedkar Jayanti; 2014-04-18 Good Friday; 2014-05-01 May Day; 2014-07-29 Ramzan ID; 2014-08-15 Independence Day; 2014-08-29 Ganesh Chaturthi; 2014-10-02 Mahatma Gandhi Jayanti; 2014-10-03 Dasera; 2014-10-06 Bakri ID; 2014-10-23 Diwali-Laxmi Pujan; 2014-10-24 Diwali-Balipratipada; 2014-11-04 Moharram; 2014-11-06 Gurunanak Jayanti; 2014-12-25 Christmas. Weekend holidays listed: 2014-01-26 Republic Day; 2014-04-13 Mahavir Jayanti. Muhurat trading on October 23, 2014 (evening special session on the Diwali Laxmi Pujan holiday; not representable, day kept as listed)."
   :closed (((2014 2 27) "Mahashivratri")
            ((2014 3 17) "Holi")
            ((2014 4 8) "Ram Navami")
            ((2014 7 29) "Ramzan ID")
            ((2014 8 29) "Ganesh Chaturthi")
            ((2014 10 3) "Dasera")
            ((2014 10 6) "Bakri ID")
            ((2014 10 23) "Diwali-Laxmi Pujan")
            ((2014 10 24) "Diwali-Balipratipada")
            ((2014 11 4) "Moharram")
            ((2014 11 6) "Gurunanak Jayanti"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/26360 (021/2014): Trading Holiday on April 24, 2014 on account of Parliamentary Elections"
   :year 2014
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR26360.pdf"
   :issued (2014 4 3) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR26360.pdf"
   :published (2014 4 3) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR26360.pdf"
   :published-in "NSE circular, Capital Market Segment"
   :dates-note "Partial modification of NSE/CMTR/25326 (holidays 2014): Thursday 24 April 2014 trading holiday, Parliamentary Elections in Mumbai."
   :closed (((2014 4 24) "Parliamentary Elections in Mumbai"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/27792 (52/2014): Trading Holiday on October 15, 2014 on account of General Assembly Elections"
   :year 2014
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR27792.pdf"
   :issued (2014 10 13) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR27792.pdf"
   :published (2014 10 13) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR27792.pdf"
   :published-in "NSE circular, Capital Market Segment"
   :dates-note "\"In partial modification to the circular no. 99/2013 (Download no. NSE/CMTR/25326) dated December 20, 2013\"."
   :closed (((2014 10 15) "General Assembly Elections in Maharashtra"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/28337 (66/2014): Trading holidays for the calendar year 2015"
   :year 2015
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR28337.pdf"
   :issued (2014 12 12) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR28337.pdf"
   :published (2014 12 12) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR28337.pdf"
   :published-in "NSE circular, Capital Market Segment (Download Ref No NSE/CMTR/28337, Circular Ref. No 66/2014)"
   :dates-note "Weekday holidays listed: 2015-01-26 Republic Day; 2015-02-17 Mahashivratri; 2015-03-06 Holi; 2015-04-02 Mahavir Jayanti; 2015-04-03 Good Friday; 2015-04-14 Dr. Baba Saheb Ambedkar Jayanti; 2015-05-01 Maharashtra Day; 2015-09-17 Ganesh Chaturthi; 2015-09-25 Bakri ID; 2015-10-02 Mahatma Gandhi Jayanti; 2015-10-22 Dasera; 2015-11-11 Diwali-Laxmi Pujan; 2015-11-12 Diwali-Balipratipada; 2015-11-25 Gurunanak Jayanti; 2015-12-25 Christmas. Weekend holidays listed: 2015-03-28 Ram Navami; 2015-07-18 Id-Ul-Fitr (Ramzan ID); 2015-08-15 Independence Day; 2015-10-24 Moharram. Muhurat trading on November 11, 2015 (evening special session on the Diwali Laxmi Pujan holiday; not representable, day kept as listed)."
   :closed (((2015 2 17) "Mahashivratri")
            ((2015 3 6) "Holi")
            ((2015 4 2) "Mahavir Jayanti")
            ((2015 9 17) "Ganesh Chaturthi")
            ((2015 9 25) "Bakri ID")
            ((2015 10 22) "Dasera")
            ((2015 11 11) "Diwali-Laxmi Pujan")
            ((2015 11 12) "Diwali-Balipratipada")
            ((2015 11 25) "Gurunanak Jayanti"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/28939 (9/2015): Live Trading Session on February 28, 2015"
   :year 2015
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR28939.pdf"
   :issued (2015 2 20) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR28939.pdf"
   :published (2015 2 20) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR28939.pdf"
   :published-in "NSE circular, Capital Market Segment"
   :dates-note "Saturday 2015-02-28, presentation of Union Budget; live trading session at normal market timings (settled 2 Mar 2015 per NSCCL NSE/CMPT/28950)."
   :closed ()
   :open (((2015 2 28) "Live trading session (Saturday) - Union Budget"))
   :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/31297 (73/2015): Trading holidays for the calendar year 2016"
   :year 2016
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR31297.pdf"
   :issued (2015 12 7) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR31297.pdf"
   :published (2015 12 7) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR31297.pdf"
   :published-in "NSE circular, Capital Market Segment (Download Ref No NSE/CMTR/31297, Circular Ref. No 73/2015)"
   :dates-note "Weekday holidays listed: 2016-01-26 Republic Day; 2016-03-07 Mahashivratri; 2016-03-24 Holi; 2016-03-25 Good Friday; 2016-04-14 Dr. Baba Saheb Ambedkar Jayanti; 2016-04-15 Ram Navami; 2016-04-19 Mahavir Jayanti; 2016-07-06 Id-Ul-Fitr (Ramzan ID); 2016-08-15 Independence Day; 2016-09-05 Ganesh Chaturthi; 2016-09-13 Bakri ID; 2016-10-11 Dasera; 2016-10-12 Moharram; 2016-10-31 Diwali-Balipratipada; 2016-11-14 Gurunanak Jayanti. Weekend holidays listed: 2016-05-01 Maharashtra Day; 2016-10-02 Mahatma Gandhi Jayanti; 2016-10-30 Diwali-Laxmi Pujan; 2016-12-25 Christmas. Muhurat trading on October 30, 2016 (evening special session on the Diwali Laxmi Pujan holiday; not representable, day kept as listed)."
   :closed (((2016 3 7) "Mahashivratri")
            ((2016 3 24) "Holi")
            ((2016 4 15) "Ram Navami")
            ((2016 4 19) "Mahavir Jayanti")
            ((2016 7 6) "Id-Ul-Fitr (Ramzan ID)")
            ((2016 9 5) "Ganesh Chaturthi")
            ((2016 9 13) "Bakri ID")
            ((2016 10 11) "Dasera")
            ((2016 10 12) "Moharram")
            ((2016 10 31) "Diwali-Balipratipada")
            ((2016 11 14) "Gurunanak Jayanti"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/33746 (64/2016): Trading holidays for the calendar year 2017"
   :year 2017
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR33746.pdf"
   :issued (2016 12 5) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR33746.pdf"
   :published (2016 12 5) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR33746.pdf"
   :published-in "NSE circular, Capital Market Segment (Download Ref No NSE/CMTR/33746, Circular Ref. No 64/2016)"
   :dates-note "Weekday holidays listed: 2017-01-26 Republic Day; 2017-02-24 Mahashivratri; 2017-03-13 Holi; 2017-04-04 Ram Navami; 2017-04-14 Good Friday; 2017-05-01 Maharashtra Day; 2017-06-26 Id-Ul-Fitr (Ramzan ID); 2017-08-15 Independence Day; 2017-08-25 Ganesh Chaturthi; 2017-10-02 Mahatama Gandhi Jayanti; 2017-10-19 Diwali-Laxmi Pujan; 2017-10-20 Diwali-Balipratipada; 2017-12-25 Christmas. Weekend holidays listed: 2017-04-09 Mahavir Jayanti; 2017-09-02 Bakri ID; 2017-09-30 Dasera; 2017-10-01 Moharram; 2017-11-04 Gurunanak Jayanti. Muhurat trading on October 19, 2017 (evening special session on the Diwali Laxmi Pujan holiday; not representable, day kept as listed)."
   :closed (((2017 2 24) "Mahashivratri")
            ((2017 3 13) "Holi")
            ((2017 4 4) "Ram Navami")
            ((2017 6 26) "Id-Ul-Fitr (Ramzan ID)")
            ((2017 8 25) "Ganesh Chaturthi")
            ((2017 10 19) "Diwali-Laxmi Pujan")
            ((2017 10 20) "Diwali-Balipratipada"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/36475 (71/2017): Trading holidays for the calendar year 2018"
   :year 2018
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR36475.pdf"
   :issued (2017 12 12) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR36475.pdf"
   :published (2017 12 12) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR36475.pdf"
   :published-in "NSE circular, Capital Market Segment (Download Ref No NSE/CMTR/36475, Circular Ref. No 71/2017)"
   :dates-note "Weekday holidays listed: 2018-01-26 Republic Day; 2018-02-13 Mahashivratri; 2018-03-02 Holi; 2018-03-29 Mahavir Jayanti; 2018-03-30 Good Friday; 2018-05-01 Maharashtra Day; 2018-08-15 Independence Day; 2018-08-22 Bakri ID; 2018-09-13 Ganesh Chaturthi; 2018-09-20 Moharram; 2018-10-02 Mahatama Gandhi Jayanti; 2018-10-18 Dasera; 2018-11-07 Diwali-Laxmi Pujan; 2018-11-08 Diwali-Balipratipada; 2018-11-23 Gurunanak Jayanti; 2018-12-25 Christmas. Weekend holidays listed: 2018-03-25 Ram Navami; 2018-04-14 Dr.Baba Saheb Ambedkar Jayanti; 2018-06-16 Id-Ul-Fitr (Ramzan ID). Muhurat trading on November 07, 2018 (evening special session on the Diwali Laxmi Pujan holiday; not representable, day kept as listed)."
   :closed (((2018 2 13) "Mahashivratri")
            ((2018 3 2) "Holi")
            ((2018 3 29) "Mahavir Jayanti")
            ((2018 8 22) "Bakri ID")
            ((2018 9 13) "Ganesh Chaturthi")
            ((2018 9 20) "Moharram")
            ((2018 10 18) "Dasera")
            ((2018 11 7) "Diwali-Laxmi Pujan")
            ((2018 11 8) "Diwali-Balipratipada")
            ((2018 11 23) "Gurunanak Jayanti"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/39612 (115/2018): Trading holidays for the calendar year 2019"
   :year 2019
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR39612.pdf"
   :issued (2018 12 7) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR39612.pdf"
   :published (2018 12 7) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR39612.pdf"
   :published-in "NSE circular, Capital Market Segment (Download Ref No NSE/CMTR/39612, Circular Ref. No 115/2018)"
   :dates-note "Weekday holidays listed: 2019-03-04 Mahashivratri; 2019-03-21 Holi; 2019-04-17 Mahavir Jayanti; 2019-04-19 Good Friday; 2019-05-01 Maharashtra Day; 2019-06-05 Id-Ul-Fitr (Ramzan ID); 2019-08-12 Bakri Id; 2019-08-15 Independence Day; 2019-09-02 Ganesh Chaturthi; 2019-09-10 Moharram; 2019-10-02 Mahatma Gandhi Jayanti; 2019-10-08 Dasera; 2019-10-28 Diwali-Balipratipada; 2019-11-12 Gurunanak Jayanti; 2019-12-25 Christmas. Weekend holidays listed: 2019-01-26 Republic Day; 2019-04-13 Ram Navami; 2019-04-14 Dr.Baba Saheb Ambedkar Jayanti; 2019-10-27 Diwali-Laxmi Pujan. Muhurat trading on October 27, 2019 (evening special session on the Diwali Laxmi Pujan holiday; not representable, day kept as listed)."
   :closed (((2019 3 4) "Mahashivratri")
            ((2019 3 21) "Holi")
            ((2019 4 17) "Mahavir Jayanti")
            ((2019 6 5) "Id-Ul-Fitr (Ramzan ID)")
            ((2019 8 12) "Bakri Id")
            ((2019 9 2) "Ganesh Chaturthi")
            ((2019 9 10) "Moharram")
            ((2019 10 8) "Dasera")
            ((2019 10 28) "Diwali-Balipratipada")
            ((2019 11 12) "Gurunanak Jayanti"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/40536 (30/2019): Trading Holiday on April 29, 2019 on account of Parliamentary Elections"
   :year 2019
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR40536.pdf"
   :issued (2019 3 26) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR40536.pdf"
   :published (2019 3 26) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR40536.pdf"
   :published-in "NSE circular, Capital Market Segment"
   :dates-note "\"In partial modification to the Exchange circular (Download no. NSE/CMTR/39612) dated December 07, 2018, the Exchange here by notifies Monday, April 29, 2019 as a trading holiday on account of Parliamentary Elections in Mumbai.\""
   :closed (((2019 4 29) "Parliamentary Elections in Mumbai"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/MSD/42319 (53/2019): Trading Holiday on October 21, 2019 on account of Assembly Elections in Maharashtra"
   :year 2019
   :uri "https://nsearchives.nseindia.com/content/circulars/MSD42319.pdf"
   :issued (2019 10 7) :issued-uri "https://nsearchives.nseindia.com/content/circulars/MSD42319.pdf"
   :published (2019 10 7) :published-uri "https://nsearchives.nseindia.com/content/circulars/MSD42319.pdf"
   :published-in "NSE circular, Member Service Department (all segments)"
   :dates-note "Trading holiday for CM, F&O and CD; commodity segment evening session only."
   :closed (((2019 10 21) "Assembly Elections in Maharashtra"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/42877 (146/2019): Trading holidays for the calendar year 2020"
   :year 2020
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR42877.pdf"
   :issued (2019 12 11) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR42877.pdf"
   :published (2019 12 11) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR42877.pdf"
   :published-in "NSE circular, Capital Market Segment (Download Ref No NSE/CMTR/42877, Circular Ref. No 146/2019)"
   :dates-note "Weekday holidays listed: 2020-02-21 Mahashivratri; 2020-03-10 Holi; 2020-04-02 Ram Navami; 2020-04-06 Mahavir Jayanti; 2020-04-10 Good Friday; 2020-04-14 Dr.Baba Saheb Ambedkar Jayanti; 2020-05-01 Maharashtra Day; 2020-05-25 Id-Ul-Fitr (Ramzan ID); 2020-10-02 Mahatma Gandhi Jayanti; 2020-11-16 Diwali-Balipratipada; 2020-11-30 Gurunanak Jayanti; 2020-12-25 Christmas. Weekend holidays listed: 2020-01-26 Republic Day; 2020-08-01 Bakri Id; 2020-08-15 Independence Day; 2020-08-22 Ganesh Chaturthi; 2020-08-30 Moharram; 2020-10-25 Dasera. Muhurat trading on November 14, 2020 (evening special session on the Diwali Laxmi Pujan holiday; not representable, day kept as listed)."
   :closed (((2020 2 21) "Mahashivratri")
            ((2020 3 10) "Holi")
            ((2020 4 2) "Ram Navami")
            ((2020 4 6) "Mahavir Jayanti")
            ((2020 5 25) "Id-Ul-Fitr (Ramzan ID)")
            ((2020 11 16) "Diwali-Balipratipada")
            ((2020 11 30) "Gurunanak Jayanti"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/43290 (05/2020): Live Trading Session on February 01, 2020"
   :year 2020
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR43290.pdf"
   :issued (2020 1 22) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR43290.pdf"
   :published (2020 1 22) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR43290.pdf"
   :published-in "NSE circular, Capital Market Segment"
   :dates-note "Saturday 2020-02-01, presentation of Union Budget: Pre-Open 09:00-09:08, Normal Market 09:15-15:30."
   :closed ()
   :open (((2020 2 1) "Live trading session (Saturday) - Union Budget"))
   :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/46623 (113/2020): Trading holidays for the calendar year 2021"
   :year 2021
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR46623.pdf"
   :issued (2020 12 11) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR46623.pdf"
   :published (2020 12 11) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR46623.pdf"
   :published-in "NSE circular, Capital Market Segment (Download Ref No NSE/CMTR/46623, Circular Ref. No 113/2020)"
   :dates-note "Weekday holidays listed: 2021-01-26 Republic Day; 2021-03-11 Mahashivratri; 2021-03-29 Holi; 2021-04-02 Good Friday; 2021-04-14 Dr.Baba Saheb Ambedkar Jayanti; 2021-04-21 Ram Navami; 2021-05-13 Id-Ul-Fitr (Ramzan ID); 2021-07-21 Bakri Id; 2021-08-19 Moharram; 2021-09-10 Ganesh Chaturthi; 2021-10-15 Dussehra; 2021-11-04 Diwali-Laxmi Pujan; 2021-11-05 Diwali-Balipratipada; 2021-11-19 Gurunanak Jayanti. Weekend holidays listed: 2021-04-25 Mahavir Jayanti; 2021-05-01 Maharashtra Day; 2021-08-15 Independence Day; 2021-10-02 Mahatma Gandhi Jayanti; 2021-12-25 Christmas. Muhurat trading on November 04, 2021 (evening special session on the Diwali Laxmi Pujan holiday; not representable, day kept as listed)."
   :closed (((2021 3 11) "Mahashivratri")
            ((2021 3 29) "Holi")
            ((2021 4 21) "Ram Navami")
            ((2021 5 13) "Id-Ul-Fitr (Ramzan ID)")
            ((2021 7 21) "Bakri Id")
            ((2021 8 19) "Moharram")
            ((2021 9 10) "Ganesh Chaturthi")
            ((2021 10 15) "Dussehra")
            ((2021 11 4) "Diwali-Laxmi Pujan")
            ((2021 11 5) "Diwali-Balipratipada")
            ((2021 11 19) "Gurunanak Jayanti"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/50560 (117/2021): Trading holidays for the calendar year 2022"
   :year 2022
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR50560.pdf"
   :issued (2021 12 10) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR50560.pdf"
   :published (2021 12 10) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR50560.pdf"
   :published-in "NSE circular, Capital Market Segment (Download Ref No NSE/CMTR/50560, Circular Ref. No 117/2021)"
   :dates-note "Weekday holidays listed: 2022-01-26 Republic Day; 2022-03-01 Mahashivratri; 2022-03-18 Holi; 2022-04-14 Dr. Baba Saheb Ambedkar Jayanti; 2022-04-15 Good Friday; 2022-05-03 Id-Ul-Fitr (Ramzan ID); 2022-08-09 Moharram; 2022-08-15 Independence Day; 2022-08-31 Ganesh Chaturthi; 2022-10-05 Dussehra; 2022-10-24 Diwali-Laxmi Pujan; 2022-10-26 Diwali-Balipratipada; 2022-11-08 Gurunanak Jayanti. Weekend holidays listed: 2022-04-10 Ram Navami; 2022-05-01 Maharashtra Day; 2022-07-10 Bakri Id; 2022-10-02 Mahatma Gandhi Jayanti; 2022-12-25 Christmas. Muhurat trading on October 24, 2022 (evening special session on the Diwali Laxmi Pujan holiday; not representable, day kept as listed)."
   :closed (((2022 3 1) "Mahashivratri")
            ((2022 3 18) "Holi")
            ((2022 5 3) "Id-Ul-Fitr (Ramzan ID)")
            ((2022 8 9) "Moharram")
            ((2022 8 31) "Ganesh Chaturthi")
            ((2022 10 5) "Dussehra")
            ((2022 10 24) "Diwali-Laxmi Pujan")
            ((2022 10 26) "Diwali-Balipratipada")
            ((2022 11 8) "Gurunanak Jayanti"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/54757 (150/2022): Trading holidays for the calendar year 2023"
   :year 2023
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR54757.pdf"
   :issued (2022 12 8) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR54757.pdf"
   :published (2022 12 8) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR54757.pdf"
   :published-in "NSE circular, Capital Market Segment (Download Ref No NSE/CMTR/54757, Circular Ref. No 150/2022)"
   :dates-note "Weekday holidays listed: 2023-01-26 Republic Day; 2023-03-07 Holi; 2023-03-30 Ram Navami; 2023-04-04 Mahavir Jayanti; 2023-04-07 Good Friday; 2023-04-14 Dr. Baba Saheb Ambedkar Jayanti; 2023-05-01 Maharashtra Day; 2023-06-28 Bakri Id; 2023-08-15 Independence Day; 2023-09-19 Ganesh Chaturthi; 2023-10-02 Mahatma Gandhi Jayanti; 2023-10-24 Dussehra; 2023-11-14 Diwali-Balipratipada; 2023-11-27 Gurunanak Jayanti; 2023-12-25 Christmas. Weekend holidays listed: 2023-02-18 Mahashivratri; 2023-04-22 Id-Ul-Fitr (Ramzan ID); 2023-07-29 Moharram; 2023-11-12 Diwali-Laxmi Pujan. Muhurat trading on November 12, 2023 (evening special session on the Diwali Laxmi Pujan holiday; not representable, day kept as listed)."
   :closed (((2023 3 7) "Holi")
            ((2023 3 30) "Ram Navami")
            ((2023 4 4) "Mahavir Jayanti")
            ((2023 6 28) "Bakri Id")
            ((2023 9 19) "Ganesh Chaturthi")
            ((2023 10 24) "Dussehra")
            ((2023 11 14) "Diwali-Balipratipada")
            ((2023 11 27) "Gurunanak Jayanti"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/57285 (76/2023): Change in Trading Holiday (Bakri Id 28 -> 29 June 2023)"
   :year 2023
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR57285.zip"
   :issued (2023 6 27) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR57285.zip"
   :published (2023 6 27) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR57285.zip"
   :published-in "NSE circular, Capital Market Segment (zip: circular + Maharashtra GAD notification of 26 Jun 2023)"
   :dates-note "\"Current Trading Holiday June 28, 2023 / Revised Trading Holiday June 29, 2023\", following the Maharashtra general administration department notification dated June 26, 2023."
   :closed (((2023 6 29) "Bakri Id (revised date)"))
   :open (((2023 6 28) "Bakri Id holiday moved to 29 June"))
   :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/59722 (154/2023): Trading holidays for the calendar year 2024"
   :year 2024
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR59722.pdf"
   :issued (2023 12 12) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR59722.pdf"
   :published (2023 12 12) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR59722.pdf"
   :published-in "NSE circular, Capital Market Segment (Download Ref No NSE/CMTR/59722, Circular Ref. No 154/2023)"
   :dates-note "Weekday holidays listed: 2024-01-26 Republic Day; 2024-03-08 Mahashivratri; 2024-03-25 Holi; 2024-03-29 Good Friday; 2024-04-11 Id-Ul-Fitr (Ramadan Eid); 2024-04-17 Shri Ram Navmi; 2024-05-01 Maharashtra Day; 2024-06-17 Bakri Id; 2024-07-17 Moharram; 2024-08-15 Independence Day/Parsi New Year; 2024-10-02 Mahatma Gandhi Jayanti; 2024-11-01 Diwali Laxmi Pujan; 2024-11-15 Gurunanak Jayanti; 2024-12-25 Christmas. Weekend holidays listed: 2024-04-14 Dr. Baba Saheb Ambedkar Jayanti; 2024-04-21 Shri Mahavir Jayanti; 2024-09-07 Ganesh Chaturthi; 2024-10-12 Dussehra; 2024-11-02 Diwali-Balipratipada. Muhurat trading on November 01, 2024 (evening special session on the Diwali Laxmi Pujan holiday; not representable, day kept as listed)."
   :closed (((2024 3 8) "Mahashivratri")
            ((2024 3 25) "Holi")
            ((2024 4 11) "Id-Ul-Fitr (Ramadan Eid)")
            ((2024 4 17) "Shri Ram Navmi")
            ((2024 6 17) "Bakri Id")
            ((2024 7 17) "Moharram")
            ((2024 11 1) "Diwali Laxmi Pujan")
            ((2024 11 15) "Gurunanak Jayanti"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/60338 (11/2024): Trading Holiday on January 22, 2024 on account of Holiday declared under Negotiable Instrument Act"
   :year 2024
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR60338.zip"
   :issued (2024 1 19) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR60338.zip"
   :published (2024 1 19) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR60338.zip"
   :published-in "NSE circular, Capital Market Segment (zip: circular + Govt of Maharashtra notification + RBI press release 2023-2024/1716)"
   :dates-note "Public holiday under NI Act s. 25 declared by Maharashtra on 19 Jan 2024 (Shri Ram Lalla Pran Pratishtha)."
   :closed (((2024 1 22) "Public holiday under Negotiable Instruments Act (Maharashtra)"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/MSD/60340 (05/2024): Live trading session on Saturday, January 20, 2024 on Primary site"
   :year 2024
   :uri "https://nsearchives.nseindia.com/content/circulars/MSD60340.pdf"
   :issued (2024 1 19) :issued-uri "https://nsearchives.nseindia.com/content/circulars/MSD60340.pdf"
   :published (2024 1 19) :published-uri "https://nsearchives.nseindia.com/content/circulars/MSD60340.pdf"
   :published-in "NSE circular, Member Service Department"
   :dates-note "Withdraws the DR-site special-session circulars NSE/MSD/59999, 60300, 60318; \"Exchange shall be conducting regular trading sessions on Saturday, January 20,2024 from primary site in Equity and Equity Derivatives segments as per regular market timings\"."
   :closed ()
   :open (((2024 1 20) "Regular trading session (Saturday) replacing the 22 Jan 2024 holiday"))
   :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/61518 (52/2024): Trading Holiday on May 20, 2024 on account of Parliamentary Elections"
   :year 2024
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR61518.pdf"
   :issued (2024 4 8) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR61518.pdf"
   :published (2024 4 8) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR61518.pdf"
   :published-in "NSE circular, Capital Market Segment"
   :dates-note "\"In partial modification to Exchange circular reference no. NSE/CMTR/59722 dated December 12,2023 ... Monday, May 20, 2024 as a trading holiday on account of Parliamentary Elections in Mumbai\"."
   :closed (((2024 5 20) "Parliamentary Elections in Mumbai"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/64960 (154/2024): Trading Holiday on November 20, 2024 on account of Assembly Elections in Maharashtra"
   :year 2024
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR64960.pdf"
   :issued (2024 11 8) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR64960.pdf"
   :published (2024 11 8) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR64960.pdf"
   :published-in "NSE circular, Capital Market Segment"
   :dates-note "\"In partial modification to Exchange circular reference no. NSE/CMTR/59722 dated December 12, 2023\"."
   :closed (((2024 11 20) "Assembly Elections in Maharashtra"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/65587 (170/2024): Trading holidays for the calendar year 2025"
   :year 2025
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR65587.pdf"
   :issued (2024 12 13) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR65587.pdf"
   :published (2024 12 13) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR65587.pdf"
   :published-in "NSE circular, Capital Market Segment (Download Ref No NSE/CMTR/65587, Circular Ref. No 170/2024)"
   :dates-note "Weekday holidays listed: 2025-02-26 Mahashivratri; 2025-03-14 Holi; 2025-03-31 Id-Ul-Fitr (Ramadan Eid); 2025-04-10 Shri Mahavir Jayanti; 2025-04-14 Dr. Baba Saheb Ambedkar Jayanti; 2025-04-18 Good Friday; 2025-05-01 Maharashtra Day; 2025-08-15 Independence Day; 2025-08-27 Ganesh Chaturthi; 2025-10-02 Mahatma Gandhi Jayanti/Dussehra; 2025-10-21 Diwali Laxmi Pujan; 2025-10-22 Diwali-Balipratipada; 2025-11-05 Prakash Gurpurb Sri Guru Nanak Dev; 2025-12-25 Christmas. Weekend holidays listed: 2025-01-26 Republic Day; 2025-04-06 Shri Ram Navami; 2025-06-07 Bakri Id; 2025-07-06 Muharram. Muhurat trading on October 21, 2025 (evening special session on the Diwali Laxmi Pujan holiday; not representable, day kept as listed)."
   :closed (((2025 2 26) "Mahashivratri")
            ((2025 3 14) "Holi")
            ((2025 3 31) "Id-Ul-Fitr (Ramadan Eid)")
            ((2025 4 10) "Shri Mahavir Jayanti")
            ((2025 8 27) "Ganesh Chaturthi")
            ((2025 10 21) "Diwali Laxmi Pujan")
            ((2025 10 22) "Diwali-Balipratipada")
            ((2025 11 5) "Prakash Gurpurb Sri Guru Nanak Dev"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/65729 (172/2024): Live Trading Session on February 01, 2025 - Presentation of Union Budget"
   :year 2025
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR65729.pdf"
   :issued (2024 12 23) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR65729.pdf"
   :published (2024 12 23) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR65729.pdf"
   :published-in "NSE circular, Capital Market Segment"
   :dates-note "Saturday 2025-02-01: Pre-Open 09:00-09:08, Normal Market 09:15-15:30 (standard market timings); settlement holiday, no T0 session."
   :closed ()
   :open (((2025 2 1) "Live trading session (Saturday) - Union Budget"))
   :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/71775 (172/2025): Trading holidays for the calendar year 2026"
   :year 2026
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR71775.pdf"
   :issued (2025 12 12) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR71775.pdf"
   :published (2025 12 12) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR71775.pdf"
   :published-in "NSE circular, Capital Market Segment (Download Ref No NSE/CMTR/71775, Circular Ref. No 172/2025)"
   :dates-note "Weekday holidays listed: 2026-01-26 Republic Day; 2026-03-03 Holi; 2026-03-26 Shri Ram Navami; 2026-03-31 Shri Mahavir Jayanti; 2026-04-03 Good Friday; 2026-04-14 Dr. Baba Saheb Ambedkar Jayanti; 2026-05-01 Maharashtra Day; 2026-05-28 Bakri Id; 2026-06-26 Muharram; 2026-09-14 Ganesh Chaturthi; 2026-10-02 Mahatma Gandhi Jayanti; 2026-10-20 Dussehra; 2026-11-10 Diwali-Balipratipada; 2026-11-24 Prakash Gurpurb Sri Guru Nanak Dev; 2026-12-25 Christmas. Weekend holidays listed: 2026-02-15 Mahashivratri; 2026-03-21 Id-Ul-Fitr (Ramadan Eid); 2026-08-15 Independence Day; 2026-11-08 Diwali Laxmi Pujan. Muhurat trading on November 08,2026 (evening special session on the Diwali Laxmi Pujan holiday; not representable, day kept as listed)."
   :closed (((2026 3 3) "Holi")
            ((2026 3 26) "Shri Ram Navami")
            ((2026 3 31) "Shri Mahavir Jayanti")
            ((2026 5 28) "Bakri Id")
            ((2026 6 26) "Muharram")
            ((2026 9 14) "Ganesh Chaturthi")
            ((2026 10 20) "Dussehra")
            ((2026 11 10) "Diwali-Balipratipada")
            ((2026 11 24) "Prakash Gurpurb Sri Guru Nanak Dev"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/72260 (07/2026): Trading Holiday on January 15, 2026 on account of Municipal Corporation Election in Maharashtra"
   :year 2026
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR72260.pdf"
   :issued (2026 1 12) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR72260.pdf"
   :published (2026 1 12) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR72260.pdf"
   :published-in "NSE circular, Capital Market Segment"
   :dates-note "\"In partial modification to Exchange circular reference no. NSE/CMTR/71775\". BSE lists the same day as \"MCGM Election Day\"."
   :closed (((2026 1 15) "Municipal Corporation Election in Maharashtra"))
   :open () :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/72349 (11/2026): Live Trading Session on February 01, 2026 - Presentation of Union Budget"
   :year 2026
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR72349.pdf"
   :issued (2026 1 16) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR72349.pdf"
   :published (2026 1 16) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR72349.pdf"
   :published-in "NSE circular, Capital Market Segment"
   :dates-note "Sunday 2026-02-01: Pre-Open 09:00-09:08, Normal Market 09:15-15:30; settlement holiday, no T0 session."
   :closed ()
   :open (((2026 2 1) "Live trading session (Sunday) - Union Budget"))
   :early-closes () :late-opens ())
  (:title "NSE circular NSE/CMTR/76941 (149/2026): Muhurat Trading session on account of Diwali"
   :year 2026
   :uri "https://nsearchives.nseindia.com/content/circulars/CMTR76941.pdf"
   :issued (2026 10 19) :issued-uri "https://nsearchives.nseindia.com/content/circulars/CMTR76941.pdf"
   :published (2026 10 19) :published-uri "https://nsearchives.nseindia.com/content/circulars/CMTR76941.pdf"
   :published-in "NSE circular, Capital Market Segment"
   :dates-note "\"In continuation to circular No. NSE/CMTR/71775 ... a special live trading session shall be held on Sunday, November 08, 2026 on account of Muhurat trading\" (pre-open from 14:05). Modelled as a special session (:special-sessions): the day stays a holiday."
   :closed () :open () :early-closes () :late-opens ()
   :special-sessions (((2026 11 8) ((:open (14 20) :close (15 15))) "Diwali Muhurat trading: normal market (continuous trading) 14:20-15:15; pre-open 14:05-14:20, closing auction 15:15-15:50")))
 )
 :bases ((:calendar "IN" :from nil :to (2008 12 31)
          :authority "Stand-in only: no NSE yearly list was found for 2000-2008 (see :gaps), so the Central Government holidays of the IN calendar close the exchange in those years. NSE follows the Maharashtra list, so these years are approximate; the exchange_calendars cross-check starts in 2009."))
 :gaps ((:years "2000-2008" :note "NSE yearly CM holiday circulars for these years were not located. Old circulars are on nsearchives.nseindia.com/content/circulars/ as cmtrNNNNN.(htm|zip|pdf) (seen from no. ~4000, Mar 2003); lists were located by probing download numbers around each December (2009 list = no. 11733), but the December windows for 2002-2007 were not probed (time budget; the archive host returns 403 after request bursts), and no index of old circulars is reachable (nseindia.com API 403). Best evidence for these years is ec only; our current IN civil calendar is wrong for them (NSE follows the Maharashtra list). Calibration: no. 4004 = 7 Mar 2003, 5000 = 20 Apr 2004, 6000 = 5 Apr 2005, 7001 = 27 Dec 2005, 8001 = 12 Oct 2006, 9000 = 5 Jun 2007, 10001 = 1 Jan 2008.")
        (:years "2009" :note "ec closes Thu 2009-04-30 (Lok Sabha poll in Mumbai); the NSE modification circular was not found (no. 12260-12420 probed). Not in the 2009 list; left unresolved - not emitted as a difference.")
        (:years "2027-2028" :note "Not yet published (the 2027 list is due in December 2026).")))
