;;;; Days where the exchange's own source disagrees with the exchange_calendars
;;;; gold (data/tests/exchanges/<MIC>-gold.sexp). The exchange wins; each row
;;;; says why and cites it. Read by tests/exchange-gold-test.lisp: a row must
;;;; match a mismatch exactly (:GOLD / :OURS as the test reports them; :HOURS
;;;; values are (OPEN BREAK-START BREAK-END CLOSE)), and a stale row fails.
;;;; :DATE (Y M D) for one day, :FROM / :TO for a run.
(
 (:mic "XETR" :from (2003 1 2) :to (2003 10 31) :kind :hours
  :gold ((9 0) nil nil (17 30)) :ours ((9 0) nil nil (20 0))
  :why "Xetra continuous trading ran to 20:00 from 2000-06-02 until 2003-10-31 and returned to 17:30 on 2003-11-03 (Eurex circular 116/03 of 2003-10-31 moves Eurex equity options to 17:30 'to harmonize trading times with Xetra'); exchange_calendars keeps 17:30 throughout. The 2000 start is in the era before the gold range."
  :source "https://www.eurex.com/resource/blob/294630/0f1d69ec085846ab4fc215e24d592449/data/cf1162003e.pdf.pdf")
 (:mic "XEUR" :date (2015 5 25) :kind :session :gold t :ours nil
  :why "Eurex circular 164/14: the Management Board decided 'as an exception, not to offer any trading on Whit Monday, 25 May 2015'; the 2015 Eurex trading calendar lists 25 May as closed for trading in all derivatives. exchange_calendars has a session."
  :source "https://www.eurex.com/ex-en/find/circulars/Trading-calendar-Holiday-regulation-for-25-May-2015-Whit-Monday-adjustment-for-3-October-2014-German-Unification-Day--185982")
 ;; XPAR
(:mic "XPAR" :date (2001 12 24) :kind :early-close :gold (14 5) :ours nil
 :why "2001 calendar notice announces no half day for 24 Dec 2001; no end-of-year 2001 notice found (source silent, low confidence)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/paris_bourse_calendar_of_business_days.pdf")
(:mic "XPAR" :date (2002 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/paris_bourse_calendar_of_business_days_2.pdf")
(:mic "XPAR" :date (2002 12 31) :kind :early-close :gold (14 5) :ours nil
 :why "Yearly notice lists a half day only for 24 Dec; 31 Dec not mentioned (full day per notice; no later end-of-year notice found - medium confidence)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/paris_bourse_calendar_of_business_days_2.pdf")
(:mic "XPAR" :date (2003 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/euronext_calendar_of_cash_business_days.pdf")
(:mic "XPAR" :date (2003 12 31) :kind :early-close :gold (14 5) :ours nil
 :why "Yearly notice lists a half day only for 24 Dec; 31 Dec not mentioned (full day per notice; no later end-of-year notice found - medium confidence)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/euronext_calendar_of_cash_business_days.pdf")
(:mic "XPAR" :date (2004 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/press_release_2.pdf")
(:mic "XPAR" :date (2004 12 31) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/press_release_2.pdf")
(:mic "XPAR" :date (2007 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2007.pdf")
(:mic "XPAR" :date (2007 12 31) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2007.pdf")
(:mic "XPAR" :date (2008 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2.pdf")
(:mic "XPAR" :date (2008 12 31) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2.pdf")
(:mic "XPAR" :date (2009 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_02_oct_2008.pdf")
(:mic "XPAR" :date (2009 12 31) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_02_oct_2008.pdf")
(:mic "XPAR" :date (2010 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_15_oct_2009.pdf")
(:mic "XPAR" :date (2010 12 31) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_15_oct_2009.pdf")
(:mic "XPAR" :date (2012 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_2012.pdf")
(:mic "XPAR" :date (2012 12 31) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_2012.pdf")
(:mic "XPAR" :date (2013 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://web.archive.org/web/2013id_/https://europeanequities.nyx.com/en/product-news/2013-holiday-calendar")
(:mic "XPAR" :date (2013 12 31) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://web.archive.org/web/2013id_/https://europeanequities.nyx.com/en/product-news/2013-holiday-calendar")
(:mic "XPAR" :date (2015 12 31) :kind :session :gold t :ours nil
 :why "Euronext 2015 calendar lists Thursday 31 December 2015 (New Year's Eve) as a closure; ec has a 14:05 half day."
 :source "https://web.archive.org/web/20150412111106id_/https://www.euronext.com/en/trading-calendars-hours")
 ;; XAMS
(:mic "XAMS" :date (2001 5 1) :kind :session :gold nil :ours t
 :why "Euronext 2001 calendar: Amsterdam open on 1 May 2001 (Labour Day closure only in Paris/Brussels until full harmonisation in 2002)."
 :source "https://web.archive.org/web/2004id_/http://www.euronext.com:80/en/news/news_archive/calendars/news.jsp?newsId=27&language=EN")
(:mic "XAMS" :date (2001 12 24) :kind :early-close :gold (14 5) :ours nil
 :why "2001 calendar notice announces no half day for 24 Dec 2001; no end-of-year 2001 notice found (source silent, low confidence)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/paris_bourse_calendar_of_business_days.pdf")
(:mic "XAMS" :date (2002 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/paris_bourse_calendar_of_business_days_2.pdf")
(:mic "XAMS" :date (2002 12 31) :kind :early-close :gold (14 5) :ours nil
 :why "Yearly notice lists a half day only for 24 Dec; 31 Dec not mentioned (full day per notice; no later end-of-year notice found - medium confidence)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/paris_bourse_calendar_of_business_days_2.pdf")
(:mic "XAMS" :date (2003 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/euronext_calendar_of_cash_business_days.pdf")
(:mic "XAMS" :date (2003 12 31) :kind :early-close :gold (14 5) :ours nil
 :why "Yearly notice lists a half day only for 24 Dec; 31 Dec not mentioned (full day per notice; no later end-of-year notice found - medium confidence)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/euronext_calendar_of_cash_business_days.pdf")
(:mic "XAMS" :date (2004 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/press_release_2.pdf")
(:mic "XAMS" :date (2004 12 31) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/press_release_2.pdf")
(:mic "XAMS" :date (2007 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2007.pdf")
(:mic "XAMS" :date (2007 12 31) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2007.pdf")
(:mic "XAMS" :date (2008 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2.pdf")
(:mic "XAMS" :date (2008 12 31) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2.pdf")
(:mic "XAMS" :date (2009 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_02_oct_2008.pdf")
(:mic "XAMS" :date (2009 12 31) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_02_oct_2008.pdf")
(:mic "XAMS" :date (2010 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_15_oct_2009.pdf")
(:mic "XAMS" :date (2010 12 31) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_15_oct_2009.pdf")
(:mic "XAMS" :date (2012 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_2012.pdf")
(:mic "XAMS" :date (2012 12 31) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_2012.pdf")
(:mic "XAMS" :date (2013 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://web.archive.org/web/2013id_/https://europeanequities.nyx.com/en/product-news/2013-holiday-calendar")
(:mic "XAMS" :date (2013 12 31) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://web.archive.org/web/2013id_/https://europeanequities.nyx.com/en/product-news/2013-holiday-calendar")
(:mic "XAMS" :date (2015 12 31) :kind :session :gold t :ours nil
 :why "Euronext 2015 calendar lists Thursday 31 December 2015 (New Year's Eve) as a closure; ec has a 14:05 half day."
 :source "https://web.archive.org/web/20150412111106id_/https://www.euronext.com/en/trading-calendars-hours")
 ;; XBRU
(:mic "XBRU" :date (2001 12 24) :kind :early-close :gold (14 5) :ours nil
 :why "2001 calendar notice announces no half day for 24 Dec 2001; no end-of-year 2001 notice found (source silent, low confidence)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/paris_bourse_calendar_of_business_days.pdf")
(:mic "XBRU" :date (2002 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/paris_bourse_calendar_of_business_days_2.pdf")
(:mic "XBRU" :date (2002 12 31) :kind :early-close :gold (14 5) :ours nil
 :why "Yearly notice lists a half day only for 24 Dec; 31 Dec not mentioned (full day per notice; no later end-of-year notice found - medium confidence)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/paris_bourse_calendar_of_business_days_2.pdf")
(:mic "XBRU" :date (2003 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/euronext_calendar_of_cash_business_days.pdf")
(:mic "XBRU" :date (2003 12 31) :kind :early-close :gold (14 5) :ours nil
 :why "Yearly notice lists a half day only for 24 Dec; 31 Dec not mentioned (full day per notice; no later end-of-year notice found - medium confidence)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/euronext_calendar_of_cash_business_days.pdf")
(:mic "XBRU" :date (2004 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/press_release_2.pdf")
(:mic "XBRU" :date (2004 12 31) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/press_release_2.pdf")
(:mic "XBRU" :date (2007 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2007.pdf")
(:mic "XBRU" :date (2007 12 31) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2007.pdf")
(:mic "XBRU" :date (2008 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2.pdf")
(:mic "XBRU" :date (2008 12 31) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2.pdf")
(:mic "XBRU" :date (2009 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_02_oct_2008.pdf")
(:mic "XBRU" :date (2009 12 31) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_02_oct_2008.pdf")
(:mic "XBRU" :date (2010 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_15_oct_2009.pdf")
(:mic "XBRU" :date (2010 12 31) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_15_oct_2009.pdf")
(:mic "XBRU" :date (2012 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_2012.pdf")
(:mic "XBRU" :date (2012 12 31) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_2012.pdf")
(:mic "XBRU" :date (2013 12 24) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://web.archive.org/web/2013id_/https://europeanequities.nyx.com/en/product-news/2013-holiday-calendar")
(:mic "XBRU" :date (2013 12 31) :kind :early-close :gold (14 5) :ours (14 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://web.archive.org/web/2013id_/https://europeanequities.nyx.com/en/product-news/2013-holiday-calendar")
(:mic "XBRU" :date (2015 12 31) :kind :session :gold t :ours nil
 :why "Euronext 2015 calendar lists Thursday 31 December 2015 (New Year's Eve) as a closure; ec has a 14:05 half day."
 :source "https://web.archive.org/web/20150412111106id_/https://www.euronext.com/en/trading-calendars-hours")
 ;; XLIS
(:mic "XLIS" :date (2003 12 24) :kind :early-close :gold (13 5) :ours (13 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/euronext_calendar_of_cash_business_days.pdf")
(:mic "XLIS" :date (2003 12 31) :kind :early-close :gold (13 5) :ours nil
 :why "Yearly notice lists a half day only for 24 Dec; 31 Dec not mentioned (full day per notice; no later end-of-year notice found - medium confidence)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/euronext_calendar_of_cash_business_days.pdf")
(:mic "XLIS" :date (2004 12 24) :kind :early-close :gold (13 5) :ours (13 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/press_release_2.pdf")
(:mic "XLIS" :date (2004 12 31) :kind :early-close :gold (13 5) :ours (13 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/press_release_2.pdf")
(:mic "XLIS" :date (2007 12 24) :kind :early-close :gold (13 5) :ours (13 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2007.pdf")
(:mic "XLIS" :date (2007 12 31) :kind :early-close :gold (13 5) :ours (13 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2007.pdf")
(:mic "XLIS" :date (2008 12 24) :kind :early-close :gold (13 5) :ours (13 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2.pdf")
(:mic "XLIS" :date (2008 12 31) :kind :early-close :gold (13 5) :ours (13 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_2.pdf")
(:mic "XLIS" :date (2009 12 24) :kind :early-close :gold (13 5) :ours (13 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_02_oct_2008.pdf")
(:mic "XLIS" :date (2009 12 31) :kind :early-close :gold (13 5) :ours (13 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_02_oct_2008.pdf")
(:mic "XLIS" :date (2010 12 24) :kind :early-close :gold (13 5) :ours (13 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_15_oct_2009.pdf")
(:mic "XLIS" :date (2010 12 31) :kind :early-close :gold (13 5) :ours (13 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_of_cash_business_days_15_oct_2009.pdf")
(:mic "XLIS" :date (2012 12 24) :kind :early-close :gold (13 5) :ours (13 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_2012.pdf")
(:mic "XLIS" :date (2012 12 31) :kind :early-close :gold (13 5) :ours (13 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://www.euronext.com/sites/www.euronext.com/files/calendar_2012.pdf")
(:mic "XLIS" :date (2013 12 24) :kind :early-close :gold (13 5) :ours (13 0)
 :why "Yearly notice: markets close at 14:00 CET (closing auction 14:00, trading-at-last to 14:05 per 2010 hours notice; ec takes the TAL end). Convention question, see hours md."
 :source "https://web.archive.org/web/2013id_/https://europeanequities.nyx.com/en/product-news/2013-holiday-calendar")
(:mic "XLIS" :date (2013 12 31) :kind :early-close :gold (13 5) :ours (13 0)
 :why "Yearly notice: markets close at 14:00 CET (see 24 Dec row)."
 :source "https://web.archive.org/web/2013id_/https://europeanequities.nyx.com/en/product-news/2013-holiday-calendar")
(:mic "XLIS" :date (2015 12 31) :kind :session :gold t :ours nil
 :why "Euronext 2015 calendar lists Thursday 31 December 2015 (New Year's Eve) as a closure; ec has a 14:05 half day."
 :source "https://web.archive.org/web/20150412111106id_/https://www.euronext.com/en/trading-calendars-hours")
 ;; XMIL
(:mic "XMIL" :date (2027 12 24) :kind :session :gold nil :ours t
 :why "Borsa Italiana 2027 calendar: 24 Dec 2027 closed for TAH only; Euronext 2027 Info-Flash: Milan half trading day (close time TBA)."
 :source "https://www.borsaitaliana.it/borsaitaliana/calendario-e-orari-di-negoziazione/calendario-borsa-orari-di-negoziazione.en.htm")
(:mic "XMIL" :date (2027 12 31) :kind :session :gold nil :ours t
 :why "Same as 24 Dec 2027: half trading day in Milan."
 :source "https://www.euronext.com/en/media/16439/download")
)
