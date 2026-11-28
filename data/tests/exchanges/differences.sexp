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
 ;; XICE, XOSL
 (:mic "XICE" :date (2008 1 2) :kind :session :gold t :ours nil
  :why "The Nasdaq OMX Nordic exchange holiday schedule lists Nasdaq Iceland closed on 2 January (2008 list; 2009 Swedish page '1-2/1'); exchange_calendars has a session."
  :source "https://web.archive.org/web/20090207122443/http://nasdaqomxnordic.com:80/tradinghours")
 (:mic "XICE" :date (2009 1 2) :kind :session :gold t :ours nil
  :why "The Nasdaq OMX Nordic exchange holiday schedule lists Nasdaq Iceland closed on 2 January (2008 list; 2009 Swedish page '1-2/1'); exchange_calendars has a session."
  :source "https://web.archive.org/web/20090207122443/http://nasdaqomxnordic.com:80/tradinghours")
 (:mic "XICE" :from (2008 1 3) :to (2008 3 28) :kind :hours
  :gold ((9 30) nil nil (15 30)) :ours ((10 0) nil nil (16 23))
  :why "From 2007-03-26 to 2010-01-03 ICEX opened at 10:00 and closed at 17:23 CET (15:23 Reykjavik in CET summer time, 16:23 in winter); 09:30–15:30 only from 2010-01-04 (NASDAQ OMX Iceland IT notice 122/09). exchange_calendars has 09:30–15:30 throughout."
  :source "https://rss.globenewswire.com/news-release/2007/02/22/104069/0/en/ICEX-Trading-Hours-Changed-on-26-March-2007.html")
 (:mic "XICE" :from (2008 3 31) :to (2008 10 24) :kind :hours
  :gold ((9 30) nil nil (15 30)) :ours ((10 0) nil nil (15 23))
  :why "From 2007-03-26 to 2010-01-03 ICEX opened at 10:00 and closed at 17:23 CET (15:23 Reykjavik in CET summer time, 16:23 in winter); 09:30–15:30 only from 2010-01-04 (NASDAQ OMX Iceland IT notice 122/09). exchange_calendars has 09:30–15:30 throughout."
  :source "https://rss.globenewswire.com/news-release/2007/02/22/104069/0/en/ICEX-Trading-Hours-Changed-on-26-March-2007.html")
 (:mic "XICE" :from (2008 10 27) :to (2009 3 27) :kind :hours
  :gold ((9 30) nil nil (15 30)) :ours ((10 0) nil nil (16 23))
  :why "From 2007-03-26 to 2010-01-03 ICEX opened at 10:00 and closed at 17:23 CET (15:23 Reykjavik in CET summer time, 16:23 in winter); 09:30–15:30 only from 2010-01-04 (NASDAQ OMX Iceland IT notice 122/09). exchange_calendars has 09:30–15:30 throughout."
  :source "https://rss.globenewswire.com/news-release/2007/02/22/104069/0/en/ICEX-Trading-Hours-Changed-on-26-March-2007.html")
 (:mic "XICE" :from (2009 3 30) :to (2009 10 23) :kind :hours
  :gold ((9 30) nil nil (15 30)) :ours ((10 0) nil nil (15 23))
  :why "From 2007-03-26 to 2010-01-03 ICEX opened at 10:00 and closed at 17:23 CET (15:23 Reykjavik in CET summer time, 16:23 in winter); 09:30–15:30 only from 2010-01-04 (NASDAQ OMX Iceland IT notice 122/09). exchange_calendars has 09:30–15:30 throughout."
  :source "https://rss.globenewswire.com/news-release/2007/02/22/104069/0/en/ICEX-Trading-Hours-Changed-on-26-March-2007.html")
 (:mic "XICE" :from (2009 10 26) :to (2009 12 31) :kind :hours
  :gold ((9 30) nil nil (15 30)) :ours ((10 0) nil nil (16 23))
  :why "From 2007-03-26 to 2010-01-03 ICEX opened at 10:00 and closed at 17:23 CET (15:23 Reykjavik in CET summer time, 16:23 in winter); 09:30–15:30 only from 2010-01-04 (NASDAQ OMX Iceland IT notice 122/09). exchange_calendars has 09:30–15:30 throughout."
  :source "https://rss.globenewswire.com/news-release/2007/02/22/104069/0/en/ICEX-Trading-Hours-Changed-on-26-March-2007.html")
 (:mic "XOSL" :from (2008 9 1) :to (2012 8 3) :kind :hours
  :gold ((9 0) nil nil (16 20)) :ours ((9 0) nil nil (17 20))
  :why "Oslo Børs extended its opening hours to 17:30 (continuous trading to 17:20, closing call to 17:30) from 2008-09-01 and reduced them again from 2012-08-06; exchange_calendars keeps 16:20."
  :source "https://web.archive.org/web/20101220224530/http://oslobors.no/ob_eng/Oslo-Boers/About-us/Press-room/Press-releases/(year)/2008")
 (:mic "XOSL" :date (2009 4 8) :kind :early-close :gold nil :ours (13 10)
  :why "Oslo Børs Opening Hours 2009: on the Wednesday before Maundy Thursday continuous trading ends 13:10; exchange_calendars has its Easter-Wednesday early close only from 2011."
  :source "https://web.archive.org/web/20090509192023/http://www.oslobors.no/ob_eng/Oslo-Boers/About-us/Opening-Hours")
 ;; XATH
 (:mic "XATH" :date (2000 4 21) :kind :session :gold nil :ours t
  :why "ASE 'Exchange Holidays 2000': April shows only 28 (Orthodox Good Friday); Western Good Friday not a holiday in 2000."
  :source "https://web.archive.org/web/20000312085823/http://www.ase.gr/Announce/Holidays.htm")
 (:mic "XATH" :date (2000 4 24) :kind :session :gold nil :ours t
  :why "As 2000-04-21 (Western Easter Monday not listed)."
  :source "https://web.archive.org/web/20000312085823/http://www.ase.gr/Announce/Holidays.htm")
 (:mic "XATH" :date (2001 1 2) :kind :session :gold t :ours nil
  :why "ASE Market Holidays 2001 lists 'Tuesday 2 January'; also in the Euronext Athens database (02/01/2001)."
  :source "https://web.archive.org/web/20011217235444/http://www.ase.gr/content/en/about/holidays/")
 (:mic "XATH" :date (2001 12 31) :kind :session :gold t :ours nil
  :why "Euronext Athens database: 'EURO 31/12/2001' (euro changeover). Not yet on the ASE page snapshot of 2001-12-17 - medium confidence."
  :source "https://athens.euronext.com/en/trade/trading-model/calendar?page=27")
 (:mic "XATH" :date (2008 3 5) :kind :session :gold nil :ours t
  :why "Database lists 04/03/2008 but not 05/03/2008; ec closes both. Low confidence (no year-specific ASE page for 2008 found)."
  :source "https://athens.euronext.com/en/trade/trading-model/calendar?page=24")
 (:mic "XATH" :date (2014 12 31) :kind :session :gold nil :ours t
  :why "Database 2014 list has 24, 25, 26 Dec but not 31 Dec; ec closes 31 Dec 2014. Medium confidence."
  :source "https://athens.euronext.com/en/trade/trading-model/calendar?page=18")
 (:mic "XATH" :date (2021 5 4) :kind :session :gold t :ours nil
  :why "Database: 'Labour Day 04/05/2021' (moved public holiday) - market closed."
  :source "https://athens.euronext.com/en/trade/trading-model/calendar?page=7")
 (:mic "XATH" :date (2022 5 2) :kind :session :gold t :ours nil
  :why "Database: 'Labour Day 02/05/2022' - market closed."
  :source "https://athens.euronext.com/en/trade/trading-model/calendar?page=6")
 (:mic "XATH" :date (2024 5 7) :kind :session :gold t :ours nil
  :why "Database: 'Labour Day (Greece) 07/05/2024' (and 01/05/2024 'Labour Day') - both closed."
  :source "https://athens.euronext.com/en/trade/trading-model/calendar?page=4")
 (:mic "XATH" :date (2027 12 31) :kind :session :gold t :ours nil
  :why "Euronext Athens 2027 holidays include 'New Year's Eve 31/12/2027'."
  :source "https://athens.euronext.com/en/trade/trading-model/calendar")
 (:mic "XATH" :from (2000 1 3) :to (2008 9 26) :kind :hours
  :gold ((10 0) nil nil (17 0)) :ours ((10 15) nil nil (17 20))
  :why "The modeled day runs from the opening auction (10:15) to the end of trading at close (17:20), per the Euronext Athens Cash Markets Schedule (March 2026); exchange_calendars opens at 10:00, when no phase of that schedule starts. No earlier ASE/ATHEX schedule was found, so the earlier years keep the current schedule unverified."
  :source "https://athens.euronext.com/sites/default/files/2026-04/Euronext_Athens_PRD_OASIS_Cash_Markets_Schedule_March2026_ver3_0.pdf")
 (:mic "XATH" :from (2008 9 29) :to (2028 12 29) :kind :hours
  :gold ((10 0) nil nil (17 20)) :ours ((10 15) nil nil (17 20))
  :why "The modeled day runs from the opening auction (10:15) to the end of trading at close (17:20), per the Euronext Athens Cash Markets Schedule (March 2026); exchange_calendars opens at 10:00, when no phase of that schedule starts. No earlier ASE/ATHEX schedule was found, so the earlier years keep the current schedule unverified."
  :source "https://athens.euronext.com/sites/default/files/2026-04/Euronext_Athens_PRD_OASIS_Cash_Markets_Schedule_March2026_ver3_0.pdf")
 ;; XWAR
 (:mic "XWAR" :from (2011 1 3) :to (2013 4 12) :kind :hours
  :gold ((9 0) nil nil (17 0)) :ours ((9 0) nil nil (17 20))
  :why "GPW schedule from 2011-01-01: continuous trading 09:00-17:20, closing auction 17:20-17:30; exchange_calendars has 17:00 throughout."
  :source "https://web.archive.org/web/20120113200502/http://www.gpw.pl/harmonogram_sesji")
 (:mic "XWAR" :from (2013 4 15) :to (2028 12 29) :kind :hours
  :gold ((9 0) nil nil (17 0)) :ours ((9 0) nil nil (16 50))
  :why "GPW session details: continuous trading 09:00-16:50, closing auction 16:50-17:00. The modeled close is the end of continuous trading (as for the 2011 era and Xetra); exchange_calendars uses the end of the closing auction."
  :source "https://www.gpw.pl/szczegoly-sesji")
 ;; XPRA
 (:mic "XPRA" :from (2020 11 30) :to (2028 12 29) :kind :hours
  :gold ((9 0) nil nil (16 20)) :ours ((9 0) nil nil (16 15))
  :why "PSE Harmonogram burzovniho dne (updated 30 Nov 2020): opening auction 08:50-09:00, continuous 09:00-16:10, closing auction 16:10-16:15, trading at close 16:15-16:25. exchange_calendars' 16:20 matches no phase; the model closes at the end of the closing auction."
  :source "https://www.pse.cz/obchodovani/informace-o-obchodovani/kalendar-burzovnich-dni")
 ;; XIST
 (:mic "XIST" :from (2016 11 14) :to (2019 10 3) :kind :hours
  :gold ((10 0) nil nil (18 0)) :ours ((10 0) (13 0) (14 0) (18 0))
  :why "Schedule effective 14 Nov 2016: continuous 10:00-13:00, midday call auction 13:00-13:55, continuous 14:00-18:00; the lunch break was removed from 2019-10-04 (notice 2019/56). exchange_calendars has no lunch break."
  :source "https://web.archive.org/web/20161117175157/http://www.borsaistanbul.com/images/default-source/kurumsal/equity-market-continuous-trading-normal-days-november-14-2016.jpg?sfvrsn=0")
 ;; XTKS
 ;;;; XTKS: exchange source vs exchange_calendars (ec). Sessions: none differ (rule + JP base = ec on
 ;;;; every weekday 2000-2028, incl. 2020-10-01 closed in both).

 (:mic "XTKS" :kind :hours :from (2000 1 4) :to (2011 11 18)
  :gold ((9 0) (11 30) (12 30) (15 0)) :ours ((9 0) (11 0) (12 30) (15 0))
  :why "Morning session ended 11:00 until the lunch-break shortening on 2011-11-21 (excluding the half-holidays below, which closed 11:00 with no afternoon session)."
  :source "https://www.jpx.co.jp/files/tse/about/press/b7gje60000029nqk-att/shiryou20110927.pdf ; https://www.jpx.co.jp/files/tse/rules-participants/public-comment/data/101124-ks_1.pdf")
 (:mic "XTKS" :date (2000 1 4) :kind :early-close :gold nil :ours (11 0) :why "Daihakkai half-holiday, morning session only (secondary copy of TSE notice)" :source "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124")
 (:mic "XTKS" :date (2000 12 29) :kind :early-close :gold nil :ours (11 0) :why "Dainokai half-holiday" :source "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124")
 (:mic "XTKS" :date (2001 1 4) :kind :early-close :gold nil :ours (11 0) :why "Daihakkai half-holiday" :source "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124")
 (:mic "XTKS" :date (2001 12 28) :kind :early-close :gold nil :ours (11 0) :why "Dainokai half-holiday" :source "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124")
 (:mic "XTKS" :date (2002 1 4) :kind :early-close :gold nil :ours (11 0) :why "Daihakkai half-holiday" :source "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124")
 (:mic "XTKS" :date (2002 12 30) :kind :early-close :gold nil :ours (11 0) :why "Dainokai half-holiday" :source "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124")
 (:mic "XTKS" :date (2003 1 6) :kind :early-close :gold nil :ours (11 0) :why "Daihakkai half-holiday" :source "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124")
 (:mic "XTKS" :date (2003 12 30) :kind :early-close :gold nil :ours (11 0) :why "Dainokai half-holiday" :source "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124")
 (:mic "XTKS" :date (2004 1 5) :kind :early-close :gold nil :ours (11 0) :why "Daihakkai half-holiday" :source "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124")
 (:mic "XTKS" :date (2004 12 30) :kind :early-close :gold nil :ours (11 0) :why "Dainokai half-holiday" :source "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124")
 (:mic "XTKS" :date (2005 1 4) :kind :early-close :gold nil :ours (11 0) :why "Daihakkai half-holiday" :source "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124")
 (:mic "XTKS" :date (2005 12 30) :kind :early-close :gold nil :ours (11 0) :why "Dainokai half-holiday" :source "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124")
 (:mic "XTKS" :date (2006 1 4) :kind :early-close :gold nil :ours (11 0) :why "Daihakkai half-holiday" :source "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124")
 (:mic "XTKS" :date (2006 12 29) :kind :early-close :gold nil :ours (11 0) :why "Dainokai half-holiday" :source "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124")
 (:mic "XTKS" :date (2007 1 4) :kind :early-close :gold nil :ours (11 0) :why "Daihakkai half-holiday" :source "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124")
 (:mic "XTKS" :date (2007 12 28) :kind :early-close :gold nil :ours (11 0) :why "Dainokai half-holiday" :source "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124")
 (:mic "XTKS" :date (2008 1 4) :kind :early-close :gold nil :ours (11 0) :why "Daihakkai half-holiday" :source "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124")
 (:mic "XTKS" :date (2008 12 30) :kind :early-close :gold nil :ours (11 0) :why "Dainokai half-holiday" :source "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124")
 (:mic "XTKS" :date (2009 1 5) :kind :early-close :gold nil :ours (11 0) :why "Daihakkai half-holiday (last)" :source "https://mondovisione.com/news/tokyo-stock-exchange-sets-the-date-for-the-last-first-business-day-of-the-year-i-2011124")
 ;; XKRX
 ;;;; XKRX: KRX source vs exchange_calendars (ec). Everything else in the KRX lists 2009-2027 equals ec.
 ;;;; 2028-04-12 (election) and 2028-07-17 (Constitution Day) are ec-session / KR-holiday too, but no
 ;;;; KRX 2028 list exists yet -> no row (the KR base is probably right; re-check when KRX publishes 2028).

 (:mic "XKRX" :date (2026 7 17) :kind :session :gold t :ours nil
  :why "Constitution Day (제헌절) restored as a public holiday; KRX 2026 holiday list: 2026-07-17 제헌절"
  :source "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp (search_bas_yy=2026, KRX)")
 (:mic "XKRX" :date (2027 7 19) :kind :session :gold t :ours nil
  :why "Substitute holiday for Constitution Day (Jul 17, 2027 is Saturday); KRX 2027 holiday list: 2027-07-19 제헌절(대체휴일)"
  :source "https://open.krx.co.kr/contents/MKD/01/0110/01100305/MKD01100305.jsp (search_bas_yy=2027, KRX)")
 (:mic "XKRX" :kind :hours :from (2026 11 19) :to (2026 11 19)
  :gold ((9 0) nil nil (15 30)) :ours ((10 0) nil nil (16 30))
  :why "CSAT day 2026: regular session shifted one hour (KRX announcement 2026-11-05; secondary report only)"
  :source "https://khan.co.kr/article/202611051125001")
 ;; XTAI
 ;;;; XTAI: TWSE sources vs exchange_calendars (ec), Mon-Fri 2000-01-03..2027-12-31.
 ;;;; 2000-2026: TWSE monthly statistics (FMTQIK) checked day by day; 2027: TWSE yearly list.

 (:mic "XTAI" :kind :hours :from (2000 1 4) :to (2000 12 29) :gold ((9 0) nil nil (13 30)) :ours ((9 0) nil nil (12 0)) :why "Mon-Fri session 09:00-12:00 until 2000; extended to 13:30 from 2001-01-02 (Saturday trading ended)" :source "https://wwwc.twse.com.tw/downloads/zh/about/company/Annual/90/10.pdf ; https://www.twse.com.tw/staticFiles/product/publication/twse60/html/178/")
 (:mic "XTAI" :date (2000 1 3) :kind :session :gold t :ours nil :why "No session in TWSE statistics (TWSE data for 2000 starts 2000-01-04)" :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000101&response=json")
 (:mic "XTAI" :date (2000 2 2) :kind :session :gold t :ours nil :why "Lunar New Year market closure (TWSE statistics: no session)" :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000201&response=json")
 (:mic "XTAI" :date (2000 2 9) :kind :session :gold nil :ours t :why "TWSE traded (session in TWSE statistics); ec closes it" :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000201&response=json")
 (:mic "XTAI" :date (2000 4 3) :kind :session :gold t :ours nil :why "Adjusted holiday (調整放假) closed; no session in TWSE statistics" :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000401&response=json")
 (:mic "XTAI" :date (2000 8 23) :kind :session :gold t :ours nil :why "Typhoon closure; no session in TWSE statistics" :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000801&response=json")
 (:mic "XTAI" :date (2000 12 25) :kind :session :gold t :ours nil :why "Constitution Day (行憲紀念日, a day off until 2000); no session in TWSE statistics" :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20001201&response=json")
 (:mic "XTAI" :date (2001 1 19) :kind :session :gold t :ours nil :why "Lunar New Year market closure; no session in TWSE statistics" :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20010101&response=json")
 (:mic "XTAI" :date (2001 7 30) :kind :session :gold t :ours nil :why "Typhoon closure; no session in TWSE statistics" :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20010701&response=json")
 (:mic "XTAI" :date (2001 9 12) :kind :session :gold t :ours nil :why "No session in TWSE statistics; reason unknown" :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20010901&response=json")
 (:mic "XTAI" :date (2001 9 17) :kind :session :gold t :ours nil :why "Typhoon closure; no session in TWSE statistics" :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20010901&response=json")
 (:mic "XTAI" :date (2001 9 18) :kind :session :gold t :ours nil :why "Typhoon closure; no session in TWSE statistics" :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20010901&response=json")
 (:mic "XTAI" :date (2005 5 2) :kind :session :gold t :ours nil :why "Labor Day observed (May 1 Sunday); no session in TWSE statistics" :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20050501&response=json")
 (:mic "XTAI" :date (2011 5 2) :kind :session :gold t :ours nil :why "Labor Day observed (May 1 Sunday); no session in TWSE statistics" :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20110501&response=json")
 (:mic "XTAI" :date (2022 2 4) :kind :session :gold t :ours nil :why "Adjusted holiday (調整放假), TWSE 2022 list: 不交易亦不交割" :source "https://www.twse.com.tw/rwd/zh/holidaySchedule/holidaySchedule?date=20220101&response=json")
 (:mic "XTAI" :date (2023 1 18) :kind :session :gold t :ours nil :why "TWSE 2023 list: 市場無交易，僅辦理結算交割作業 (no trading)" :source "https://www.twse.com.tw/rwd/zh/holidaySchedule/holidaySchedule?date=20230101&response=json")
 (:mic "XTAI" :date (2024 10 31) :kind :session :gold t :ours nil :why "Typhoon: Taipei City work suspension, market closed (TWSE news)" :source "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=8a8216d69236c2e30192dd5179d70328&response=json")
 (:mic "XTAI" :date (2026 7 10) :kind :session :gold t :ours nil :why "Typhoon: Taipei City work suspension, market closed (TWSE news)" :source "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=8a8216d69ef76943019f46cb86bf0111&response=json")
 (:mic "XTAI" :date (2026 10 23) :kind :session :gold t :ours nil :why "Typhoon: Taipei City work suspension, market closed (TWSE news)" :source "https://www.twse.com.tw/rwd/zh/news/newsDetail?id=8a8216d6a0fa351b01a1638507a10203&response=json")
 (:mic "XTAI" :date (2027 2 2) :kind :session :gold t :ours nil :why "TWSE 2027 list: 市場無交易，僅辦理結算交割作業 (no trading)" :source "https://www.twse.com.tw/rwd/zh/holidaySchedule/holidaySchedule?date=20270101&response=json")
 (:mic "XTAI" :date (2027 2 3) :kind :session :gold t :ours nil :why "TWSE 2027 list: 市場無交易，僅辦理結算交割作業 (no trading)" :source "https://www.twse.com.tw/rwd/zh/holidaySchedule/holidaySchedule?date=20270101&response=json")
 (:mic "XTAI" :date (2027 4 6) :kind :session :gold t :ours nil :why "TWSE 2027 list: 兒童節 補假 (Children's Day Apr 4 Sunday)" :source "https://www.twse.com.tw/rwd/zh/holidaySchedule/holidaySchedule?date=20270101&response=json")
 (:mic "XTAI" :date (2027 12 24) :kind :session :gold t :ours nil :why "TWSE 2027 list: 行憲紀念日 補假 (Dec 25 Saturday)" :source "https://www.twse.com.tw/rwd/zh/holidaySchedule/holidaySchedule?date=20270101&response=json")
 (:mic "XKRX" :date (2000 11 15) :kind :hours :gold ((10 0) nil nil (16 0)) :ours ((9 0) nil nil (15 0))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2001 11 7) :kind :hours :gold ((10 0) nil nil (16 0)) :ours ((9 0) nil nil (15 0))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2002 11 6) :kind :hours :gold ((10 0) nil nil (16 0)) :ours ((9 0) nil nil (15 0))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2003 11 5) :kind :hours :gold ((10 0) nil nil (16 0)) :ours ((9 0) nil nil (15 0))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2004 11 17) :kind :hours :gold ((10 0) nil nil (16 0)) :ours ((9 0) nil nil (15 0))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2005 11 23) :kind :hours :gold ((10 0) nil nil (16 0)) :ours ((9 0) nil nil (15 0))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2006 11 16) :kind :hours :gold ((10 0) nil nil (16 0)) :ours ((9 0) nil nil (15 0))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2007 11 15) :kind :hours :gold ((10 0) nil nil (16 0)) :ours ((9 0) nil nil (15 0))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2008 11 13) :kind :hours :gold ((10 0) nil nil (16 0)) :ours ((9 0) nil nil (15 0))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2009 11 12) :kind :hours :gold ((10 0) nil nil (16 0)) :ours ((9 0) nil nil (15 0))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2010 11 18) :kind :hours :gold ((10 0) nil nil (16 0)) :ours ((9 0) nil nil (15 0))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2011 11 10) :kind :hours :gold ((10 0) nil nil (16 0)) :ours ((9 0) nil nil (15 0))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2012 11 8) :kind :hours :gold ((10 0) nil nil (16 0)) :ours ((9 0) nil nil (15 0))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2013 11 7) :kind :hours :gold ((10 0) nil nil (16 0)) :ours ((9 0) nil nil (15 0))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2014 11 13) :kind :hours :gold ((10 0) nil nil (16 0)) :ours ((9 0) nil nil (15 0))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2015 11 12) :kind :hours :gold ((10 0) nil nil (16 0)) :ours ((9 0) nil nil (15 0))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2016 11 17) :kind :hours :gold ((10 0) nil nil (16 30)) :ours ((9 0) nil nil (15 30))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2017 11 16) :kind :hours :gold ((10 0) nil nil (16 30)) :ours ((9 0) nil nil (15 30))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2017 11 23) :kind :hours :gold ((10 0) nil nil (16 30)) :ours ((9 0) nil nil (15 30))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2018 11 15) :kind :hours :gold ((10 0) nil nil (16 30)) :ours ((9 0) nil nil (15 30))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2019 11 14) :kind :hours :gold ((10 0) nil nil (16 30)) :ours ((9 0) nil nil (15 30))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2020 12 3) :kind :hours :gold ((10 0) nil nil (16 30)) :ours ((9 0) nil nil (15 30))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2022 11 17) :kind :hours :gold ((10 0) nil nil (16 30)) :ours ((9 0) nil nil (15 30))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2023 11 16) :kind :hours :gold ((10 0) nil nil (16 30)) :ours ((9 0) nil nil (15 30))
  :why "exchange_calendars shifts the session one hour for the CSAT (대학수학능력시험) day; no KRX notice or report for this year was found (KRX press archive and KIND notices of that year not reachable), so the regular hours stand until one is cited (follow-up issue)."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2028 12 28) :kind :hours :gold ((10 0) nil nil (15 30)) :ours ((9 0) nil nil (15 30))
  :why "exchange_calendars opens 2028-12-28 at 10:00; no KRX rule or notice gives a late open on a late-December day (the 10:00 open is the first trading day of the year)."
  :source "https://kind.krx.co.kr/external/2024/12/17/000102/20241216000236/70780.htm")
 (:mic "XKRX" :date (2028 4 12) :kind :session :gold t :ours nil
  :why "National Assembly election day (공직선거법 제34조), a public holiday in the KR calendar; KRX closes on the public holidays of the Regulation on Government and Public Offices Holidays (Global KRX Trading Hours). The KRX 2028 list is not published yet; exchange_calendars has a session."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XKRX" :date (2028 7 17) :kind :session :gold t :ours nil
  :why "Constitution Day (제헌절), a public holiday again from 2026 (KRX lists 2026-07-17 and 2027-07-19 as closed); KRX closes on the public holidays of the Regulation on Government and Public Offices Holidays (Global KRX Trading Hours). The KRX 2028 list is not published yet; exchange_calendars has a session."
  :source "https://global.krx.co.kr/contents/GLB/06/0602/0602020204/GLB0602020204T1.jsp")
 (:mic "XTAI" :date (2000 1 15) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000101&response=json")
 (:mic "XTAI" :date (2000 1 29) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000101&response=json")
 (:mic "XTAI" :date (2000 2 19) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000201&response=json")
 (:mic "XTAI" :date (2000 3 4) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000301&response=json")
 (:mic "XTAI" :date (2000 4 1) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000401&response=json")
 (:mic "XTAI" :date (2000 4 8) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000401&response=json")
 (:mic "XTAI" :date (2000 4 15) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000401&response=json")
 (:mic "XTAI" :date (2000 4 29) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000401&response=json")
 (:mic "XTAI" :date (2000 5 6) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000501&response=json")
 (:mic "XTAI" :date (2000 5 20) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000501&response=json")
 (:mic "XTAI" :date (2000 6 3) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000601&response=json")
 (:mic "XTAI" :date (2000 6 17) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000601&response=json")
 (:mic "XTAI" :date (2000 7 15) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000701&response=json")
 (:mic "XTAI" :date (2000 7 29) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000701&response=json")
 (:mic "XTAI" :date (2000 8 5) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000801&response=json")
 (:mic "XTAI" :date (2000 8 19) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000801&response=json")
 (:mic "XTAI" :date (2000 9 2) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000901&response=json")
 (:mic "XTAI" :date (2000 9 16) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000901&response=json")
 (:mic "XTAI" :date (2000 9 30) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20000901&response=json")
 (:mic "XTAI" :date (2000 10 7) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20001001&response=json")
 (:mic "XTAI" :date (2000 10 21) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20001001&response=json")
 (:mic "XTAI" :date (2000 11 4) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20001101&response=json")
 (:mic "XTAI" :date (2000 11 18) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20001101&response=json")
 (:mic "XTAI" :date (2000 12 2) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20001201&response=json")
 (:mic "XTAI" :date (2000 12 16) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20001201&response=json")
 (:mic "XTAI" :date (2000 12 30) :kind :session :gold nil :ours t
  :why "Trading Saturday (alternate Saturdays in 2000), 09:00-12:00: a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20001201&response=json")
 (:mic "XTAI" :date (2006 10 14) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20061001&response=json")
 (:mic "XTAI" :date (2007 3 3) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20070301&response=json")
 (:mic "XTAI" :date (2007 4 14) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20070401&response=json")
 (:mic "XTAI" :date (2007 6 23) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20070601&response=json")
 (:mic "XTAI" :date (2007 9 29) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20070901&response=json")
 (:mic "XTAI" :date (2009 1 10) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20090101&response=json")
 (:mic "XTAI" :date (2009 1 17) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20090101&response=json")
 (:mic "XTAI" :date (2009 6 6) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20090601&response=json")
 (:mic "XTAI" :date (2010 2 6) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20100201&response=json")
 (:mic "XTAI" :date (2012 2 4) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20120201&response=json")
 (:mic "XTAI" :date (2012 3 3) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20120301&response=json")
 (:mic "XTAI" :date (2012 12 22) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20121201&response=json")
 (:mic "XTAI" :date (2013 2 23) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20130201&response=json")
 (:mic "XTAI" :date (2013 9 14) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20130901&response=json")
 (:mic "XTAI" :date (2014 12 27) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20141201&response=json")
 (:mic "XTAI" :date (2016 1 30) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20160101&response=json")
 (:mic "XTAI" :date (2016 6 4) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20160601&response=json")
 (:mic "XTAI" :date (2016 9 10) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20160901&response=json")
 (:mic "XTAI" :date (2017 2 18) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20170201&response=json")
 (:mic "XTAI" :date (2017 6 3) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20170601&response=json")
 (:mic "XTAI" :date (2017 9 30) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20170901&response=json")
 (:mic "XTAI" :date (2018 3 31) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20180301&response=json")
 (:mic "XTAI" :date (2018 12 22) :kind :session :gold nil :ours t
  :why "Make-up working Saturday (補行上班) with a full trading session (補行交易): a session in TWSE monthly statistics; exchange_calendars has no weekend sessions."
  :source "https://www.twse.com.tw/rwd/zh/afterTrading/FMTQIK?date=20181201&response=json")
 ;; XHKG
 ;;;; XHKG: dates where an HKEX source disagrees with exchange_calendars (gold).
 ;;;; All 13 ec weather closures 2008-2024 that have an HKEX notice agree (2008-08-22 only via the delay-open
 ;;;; notice); 2001-07-06 / 2001-07-25 have no HKEX source (no row). All half days in the circulars for

 (:mic "XHKG" :from (2000 1 3) :to (2011 3 4) :kind :hours
  :gold ((10 0) (12 0) (13 0) (16 0)) :ours ((10 0) (12 30) (14 30) (16 0))
  :why "Before phase 1 of the trading-hours extension the securities market traded 10:00-12:30 and 14:30-16:00 (table 'Current' column in the 2011-01-24 release); ec uses a 12:00-13:00 break."
  :source "https://www.hkex.com.hk/news/news-release/2011/1101243news?sc_lang=en")
 (:mic "XHKG" :from (2011 3 7) :to (2012 3 2) :kind :hours
  :gold ((9 30) (12 0) (13 0) (16 0)) :ours ((9 30) (12 0) (13 30) (16 0))
  :why "Phase 1 (from 2011-03-07): afternoon session 13:30-16:00; 13:00 only from phase 2 on 2012-03-05."
  :source "https://www.hkex.com.hk/News/News-Release/2011/110303news?sc_lang=en")
 (:mic "XHKG" :date (2008 2 6) :kind :early-close :gold nil :ours (12 30)
  :why "Lunar New Year's Eve (weekday): half-day trading on the eves of Christmas, New Year and Lunar New Year (CMD/TMO/089/07); ec has LNY-eve half days only from 2014."
  :source "https://www.hkex.com.hk/-/media/hkex-market/services/circulars-and-notices/participant-and-members-circulars/sehk/2007/ctmo089e")
 (:mic "XHKG" :date (2011 2 2) :kind :early-close :gold nil :ours (12 30)
  :why "SEHK holiday schedule for 2011: '2 February 2011 (Wednesday) - Eve of Lunar New Year' is a half day trading day (pre-2011-03-07 morning session ends 12:30)."
  :source "https://www.hkex.com.hk/-/media/HKEX-Market/Services/Circulars-and-Notices/Participant-and-Members-Circulars/SEHK/2010/ctmo02010e")
 (:mic "XHKG" :date (2003 7 24) :kind :late-open :gold nil :ours (10 30)
  :why "Typhoon Imbudo: trading resumed 10:30 after Signal No. 8 was lowered (normal open then 10:00)."
  :source "https://www.hkex.com.hk/News/News-Release/2003/0307242news?sc_lang=en")
 (:mic "XHKG" :date (2003 9 2) :kind :early-close :gold nil :ours (12 30)
  :why "No afternoon session: Typhoon Signal No. 8."
  :source "https://www.hkex.com.hk/News/News-Release/2003/030902news?sc_lang=en")
 (:mic "XHKG" :date (2008 6 25) :kind :late-open :gold nil :ours (14 30)
  :why "Typhoon Fengshen: no morning session; trading resumed 14:30."
  :source "https://www.hkex.com.hk/News/News-Release/2008/080625news?sc_lang=en")
 ;; XSHG
 ;;;; XSHG: dates where an SSE source disagrees with exchange_calendars (gold). Everything else in the
 ;;;; SSE lists 2003, 2005-2006 (secondary), 2008-2026 agrees with ec. 2000-2002 and 2004-01-19..21 have
 ;;;; no source (see XSHG.sexp :gaps), so no rows.

 (:mic "XSHG" :date (2016 1 4) :kind :early-close :gold nil :ours (13 33)
  :why "Index circuit breaker: SSE halted stocks/funds/CBs from 13:33 for the rest of the day (上证公告(熔断)〔2016〕02号). Unscheduled halt for the rest of the day, modelled as an early close."
  :source "https://www.sse.com.cn/disclosure/announcement/general/c/c_20160104_4031718.shtml")
 (:mic "XSHG" :date (2016 1 7) :kind :early-close :gold nil :ours (9 58)
  :why "Index circuit breaker: halted from 09:58 for the rest of the day (上证公告(熔断)〔2016〕04号); earlier 09:42-09:57 15-minute halt (〔2016〕03号)."
  :source "https://www.sse.com.cn/disclosure/announcement/general/c/c_20160107_4033042.shtml")
 (:mic "XHKG" :date (2001 7 6) :kind :session :gold nil :ours t
  :why "exchange_calendars closes the day (Typhoon Utor). No HKEx notice of a securities-market closure was found: the only HKEx release, of 2001-07-05, terminates Rolling Forex trading after Typhoon Signal No. 8 was hoisted at 20:30 and does not cover the next day. The day stays a session until a notice is cited (follow-up issue)."
  :source "https://www.hkex.com.hk/News/News-Release/2001/010705news")
 (:mic "XHKG" :date (2001 7 25) :kind :session :gold nil :ours t
  :why "exchange_calendars closes the day (Typhoon Yutu). No HKEx notice was found (HKEx news releases of 2001 probed); the day stays a session until a notice is cited (follow-up issue)."
  :source "https://www.hkex.com.hk/News/News-Release/2001/010705news")
 ;; XNSE
 ;;;; XNSE: dates where NSE circulars disagree with exchange_calendars (gold = ec XBOM calendar).
 ;;;; Session rows only for years with an NSE yearly list (see XNSE.sexp :gaps); hours rows from XNSE-hours.md.

 (:mic "XNSE" :date (2010 11 5) :kind :session :gold T :ours NIL
  :why "NSE trading holiday: Laxmi Puja (Muhurat evening session only, not a regular session)"
  :source "https://nsearchives.nseindia.com/content/circulars/cmtr13713.pdf")
 (:mic "XNSE" :date (2011 10 26) :kind :session :gold T :ours NIL
  :why "NSE trading holiday: Laxmi Puja (Muhurat evening session only, not a regular session)"
  :source "https://nsearchives.nseindia.com/content/circulars/cmtr16348.pdf")
 (:mic "XNSE" :date (2012 11 13) :kind :session :gold T :ours NIL
  :why "NSE trading holiday: Diwali – Laxmi Puja (Muhurat evening session only, not a regular session)"
  :source "https://nsearchives.nseindia.com/content/circulars/CMTR19539.pdf")
 (:mic "XNSE" :date (2013 11 14) :kind :session :gold NIL :ours T
  :why "holiday of 14 Nov 2013 revoked; normal market timings"
  :source "https://nsearchives.nseindia.com/content/circulars/CMTR24977.pdf")
 (:mic "XNSE" :date (2013 11 15) :kind :session :gold T :ours NIL
  :why "NSE trading holiday: Moharram (moved per RBI holiday notice)"
  :source "https://nsearchives.nseindia.com/content/circulars/CMTR24977.pdf")
 (:mic "XNSE" :date (2015 2 28) :kind :session :gold NIL :ours T
  :why "Live trading session (Saturday) - Union Budget"
  :source "https://nsearchives.nseindia.com/content/circulars/CMTR28939.pdf")
 (:mic "XNSE" :date (2020 2 1) :kind :session :gold NIL :ours T
  :why "Live trading session (Saturday) - Union Budget"
  :source "https://nsearchives.nseindia.com/content/circulars/CMTR43290.pdf")
 (:mic "XNSE" :date (2026 2 1) :kind :session :gold NIL :ours T
  :why "Live trading session (Sunday) - Union Budget"
  :source "https://nsearchives.nseindia.com/content/circulars/CMTR72349.pdf")
 (:mic "XNSE" :from (2000 1 3) :to (2010 1 1) :kind :hours :gold ((9 15) nil nil (15 30)) :ours ((9 55) nil nil (15 30))
  :why "NSE press release 17 Dec 2009: \"the current market open timing of 9.55 a.m. shall continue\" until the 09:00 open takes effect on 4 Jan 2010 (start of the 09:55 era before 2000 not established)"
  :source "https://nsearchives.nseindia.com/content/press/17122009.htm")
 (:mic "XNSE" :from (2010 1 4) :to (2010 10 15) :kind :hours :gold ((9 15) nil nil (15 30)) :ours ((9 0) nil nil (15 30))
  :why "NSE CM circular download no. 13705 (16 Dec 2009): Normal Market open 9:00 a.m., close unchanged 3:30 pm; postponed to 4 Jan 2010 by download no. 13708; 09:15 normal-market open only from 18 Oct 2010 (pre-open, download no. 15981)"
  :source "https://nsearchives.nseindia.com/content/circulars/cmtr13705.pdf")
 ;; XBOM
 ;;;; XBOM: dates where NSE circulars disagree with exchange_calendars (gold = ec XBOM calendar).
 ;;;; Session rows only for years with an NSE yearly list (see XNSE.sexp :gaps); hours rows from XNSE-hours.md.

 (:mic "XBOM" :date (2010 11 5) :kind :session :gold T :ours NIL
  :why "NSE trading holiday: Laxmi Puja (Muhurat evening session only, not a regular session)"
  :source "https://nsearchives.nseindia.com/content/circulars/cmtr13713.pdf")
 (:mic "XBOM" :date (2011 10 26) :kind :session :gold T :ours NIL
  :why "NSE trading holiday: Laxmi Puja (Muhurat evening session only, not a regular session)"
  :source "https://nsearchives.nseindia.com/content/circulars/cmtr16348.pdf")
 (:mic "XBOM" :date (2012 11 13) :kind :session :gold T :ours NIL
  :why "NSE trading holiday: Diwali – Laxmi Puja (Muhurat evening session only, not a regular session)"
  :source "https://nsearchives.nseindia.com/content/circulars/CMTR19539.pdf")
 (:mic "XBOM" :date (2013 11 14) :kind :session :gold NIL :ours T
  :why "holiday of 14 Nov 2013 revoked; normal market timings"
  :source "https://nsearchives.nseindia.com/content/circulars/CMTR24977.pdf")
 (:mic "XBOM" :date (2013 11 15) :kind :session :gold T :ours NIL
  :why "NSE trading holiday: Moharram (moved per RBI holiday notice)"
  :source "https://nsearchives.nseindia.com/content/circulars/CMTR24977.pdf")
 (:mic "XBOM" :date (2015 2 28) :kind :session :gold NIL :ours T
  :why "Live trading session (Saturday) - Union Budget"
  :source "https://nsearchives.nseindia.com/content/circulars/CMTR28939.pdf")
 (:mic "XBOM" :date (2020 2 1) :kind :session :gold NIL :ours T
  :why "Live trading session (Saturday) - Union Budget"
  :source "https://nsearchives.nseindia.com/content/circulars/CMTR43290.pdf")
 (:mic "XBOM" :date (2026 2 1) :kind :session :gold NIL :ours T
  :why "Live trading session (Sunday) - Union Budget"
  :source "https://nsearchives.nseindia.com/content/circulars/CMTR72349.pdf")
 (:mic "XBOM" :from (2000 1 3) :to (2010 1 1) :kind :hours :gold ((9 15) nil nil (15 30)) :ours ((9 55) nil nil (15 30))
  :why "NSE press release 17 Dec 2009: \"the current market open timing of 9.55 a.m. shall continue\" until the 09:00 open takes effect on 4 Jan 2010 (start of the 09:55 era before 2000 not established)"
  :source "https://nsearchives.nseindia.com/content/press/17122009.htm")
 (:mic "XBOM" :from (2010 1 4) :to (2010 10 15) :kind :hours :gold ((9 15) nil nil (15 30)) :ours ((9 0) nil nil (15 30))
  :why "NSE CM circular download no. 13705 (16 Dec 2009): Normal Market open 9:00 a.m., close unchanged 3:30 pm; postponed to 4 Jan 2010 by download no. 13708; 09:15 normal-market open only from 18 Oct 2010 (pre-open, download no. 15981)"
  :source "https://nsearchives.nseindia.com/content/circulars/cmtr13705.pdf")
 ;; XASX
 ;;;; XASX: dates where ASX's own calendars/notices disagree with exchange_calendars XASX (gold).

 (:mic "XASX" :date (2009 12 24) :kind :early-close :gold nil :ours (14 10)
  :why "ASX Trading Calendar 2009: Last Business Day before Christmas Day CLOSE EARLY, \"Normal trading ceases at 14:10 (Sydney time)\"; ec has no early closes before 2010"
  :source "https://web.archive.org/web/20110707053534/http://asx.com.au/about/asx-trading-calendar-2009.htm")
 (:mic "XASX" :date (2009 12 31) :kind :early-close :gold nil :ours (14 10)
  :why "ASX Trading Calendar 2009: Last Business Day of the Year CLOSE EARLY, \"Normal trading ceases at 14:10 (Sydney time)\""
  :source "https://web.archive.org/web/20110707053534/http://asx.com.au/about/asx-trading-calendar-2009.htm")
 (:mic "XASX" :date (2017 12 22) :kind :early-close :gold (14 10) :ours nil
  :why "Notice 1357.16.11: \"From 2017 ASX will only close early when the last trading day before Christmas and New Year's Holidays are the respective Eve ... ASX trade will not observe an early close on the 22nd or 29th December 2017\""
  :source "https://asxonline.com/public/notices/2016/nov/1357.16.11.html")
 (:mic "XASX" :date (2017 12 29) :kind :early-close :gold (14 10) :ours nil
  :why "Notice 1357.16.11 (see 2017-12-22); 2017 calendar page has no CLOSE EARLY row"
  :source "https://asxonline.com/public/notices/2016/nov/1357.16.11.html")
 (:mic "XASX" :date (2023 12 22) :kind :early-close :gold (14 10) :ours nil
  :why "ASX Trade 2023 calendar: \"Last Business day before Christmas Day Friday 22 December OPEN\" (normal hours; 24 Dec 2023 is a Sunday)"
  :source "https://asxonline.com/content/dam/asxonline/public/notices/2022/august/asx-trade-2023-notice-attachment.pdf")
 (:mic "XASX" :date (2023 12 29) :kind :early-close :gold (14 10) :ours nil
  :why "ASX Trade 2023 calendar: \"Last Business day of the Year Friday 29 December OPEN\""
  :source "https://asxonline.com/content/dam/asxonline/public/notices/2022/august/asx-trade-2023-notice-attachment.pdf")
 (:mic "XASX" :date (2028 12 22) :kind :early-close :gold (14 10) :ours nil
  :why "Rule-derived (no 2028 calendar yet): since 2017 ASX closes early only when the last trading day is Christmas Eve itself; 24 Dec 2028 is a Sunday"
  :source "https://asxonline.com/public/notices/2016/nov/1357.16.11.html")
 (:mic "XASX" :date (2028 12 29) :kind :early-close :gold (14 10) :ours nil
  :why "Rule-derived (no 2028 calendar yet): 31 Dec 2028 is a Sunday, so Fri 29 Dec is not New Year's Eve"
  :source "https://asxonline.com/public/notices/2016/nov/1357.16.11.html")
 (:mic "XNSE" :date (2009 4 30) :kind :session :gold nil :ours t
  :why "exchange_calendars closes the day (Lok Sabha poll in Mumbai). The NSE 2009 list (NSE/CMTR/11733) does not list it and no partial-modification circular was found (download numbers 12260-12420 probed); the day stays a session until the circular is cited (follow-up issue)."
  :source "https://nsearchives.nseindia.com/content/circulars/cmtr11733.htm")
 (:mic "XBOM" :date (2009 4 30) :kind :session :gold nil :ours t
  :why "exchange_calendars closes the day (Lok Sabha poll in Mumbai). The NSE 2009 list (NSE/CMTR/11733) does not list it and no partial-modification circular was found (download numbers 12260-12420 probed); the day stays a session until the circular is cited (follow-up issue)."
  :source "https://nsearchives.nseindia.com/content/circulars/cmtr11733.htm")
 ;; XSES
 ;;;; XSES: dates where SGX sources disagree with exchange_calendars (gold).
 ;;;; Closures 2020-2026: the MOM lists agree with ec exactly (no rows). 2000-2019 closure disagreements
 ;;;; between ec and our SG corpus are NOT resolved by an exchange source (see XSES.sexp :gaps).

 (:mic "XSES" :kind :hours :from (2000 1 3) :to (2011 7 29) :gold ((9 0) nil nil (17 0)) :ours ((9 0) (12 30) (14 0) (17 0))
  :why "SGX RN 8.2.1 (effective up to 31 Jul 2011): morning 09:00-12:30, afternoon 14:00-17:00; ec has no break" :source "https://rulebook.sgx.com/node/1771/revisions/1771/view")
 (:mic "XSES" :kind :hours :from (2017 11 13) :to (2026 12 31) :gold ((9 0) nil nil (17 0)) :ours ((9 0) (12 0) (13 0) (17 0))
  :why "SGX RN 8.2.1 from 13 Nov 2017: Mid-Day Break 12:00-13:00; ec has no break" :source "https://rulebook.sgx.com/node/1771/revisions/9710/view")
 (:mic "XSES" :kind :early-close :date (2020 1 24) :gold nil :ours (12 0)
  :why "eve of Chinese New Year: SGX half-day trading (Trading Phase 09:00-12:00, RN 8.2.1); ec has no half days. Date rule secondary" :source "https://rulebook.sgx.com/node/1771")
 (:mic "XSES" :kind :early-close :date (2020 12 24) :gold nil :ours (12 0)
  :why "Christmas Eve: SGX half-day trading (Trading Phase 09:00-12:00, RN 8.2.1); ec has no half days. Date rule secondary" :source "https://rulebook.sgx.com/node/1771")
 (:mic "XSES" :kind :early-close :date (2020 12 31) :gold nil :ours (12 0)
  :why "New Year's Eve: SGX half-day trading (Trading Phase 09:00-12:00, RN 8.2.1); ec has no half days. Date rule secondary" :source "https://rulebook.sgx.com/node/1771")
 (:mic "XSES" :kind :early-close :date (2021 2 11) :gold nil :ours (12 0)
  :why "eve of Chinese New Year: SGX half-day trading (Trading Phase 09:00-12:00, RN 8.2.1); ec has no half days. Date rule secondary" :source "https://rulebook.sgx.com/node/1771")
 (:mic "XSES" :kind :early-close :date (2021 12 24) :gold nil :ours (12 0)
  :why "Christmas Eve: SGX half-day trading (Trading Phase 09:00-12:00, RN 8.2.1); ec has no half days. Date rule secondary" :source "https://rulebook.sgx.com/node/1771")
 (:mic "XSES" :kind :early-close :date (2021 12 31) :gold nil :ours (12 0)
  :why "New Year's Eve: SGX half-day trading (Trading Phase 09:00-12:00, RN 8.2.1); ec has no half days. Date rule secondary" :source "https://rulebook.sgx.com/node/1771")
 (:mic "XSES" :kind :early-close :date (2022 1 31) :gold nil :ours (12 0)
  :why "eve of Chinese New Year: SGX half-day trading (Trading Phase 09:00-12:00, RN 8.2.1); ec has no half days. Date rule secondary" :source "https://rulebook.sgx.com/node/1771")
 (:mic "XSES" :kind :early-close :date (2024 2 9) :gold nil :ours (12 0)
  :why "eve of Chinese New Year: SGX half-day trading (Trading Phase 09:00-12:00, RN 8.2.1); ec has no half days. Date rule secondary" :source "https://rulebook.sgx.com/node/1771")
 (:mic "XSES" :kind :early-close :date (2024 12 24) :gold nil :ours (12 0)
  :why "Christmas Eve: SGX half-day trading (Trading Phase 09:00-12:00, RN 8.2.1); ec has no half days. Date rule secondary" :source "https://rulebook.sgx.com/node/1771")
 (:mic "XSES" :kind :early-close :date (2024 12 31) :gold nil :ours (12 0)
  :why "New Year's Eve: SGX half-day trading (Trading Phase 09:00-12:00, RN 8.2.1); ec has no half days. Date rule secondary" :source "https://rulebook.sgx.com/node/1771")
 (:mic "XSES" :kind :early-close :date (2025 1 28) :gold nil :ours (12 0)
  :why "eve of Chinese New Year: SGX half-day trading (Trading Phase 09:00-12:00, RN 8.2.1); ec has no half days. Date rule secondary" :source "https://rulebook.sgx.com/node/1771")
 (:mic "XSES" :kind :early-close :date (2025 12 24) :gold nil :ours (12 0)
  :why "Christmas Eve: SGX half-day trading (Trading Phase 09:00-12:00, RN 8.2.1); ec has no half days. Date rule secondary" :source "https://rulebook.sgx.com/node/1771")
 (:mic "XSES" :kind :early-close :date (2025 12 31) :gold nil :ours (12 0)
  :why "New Year's Eve: SGX half-day trading (Trading Phase 09:00-12:00, RN 8.2.1); ec has no half days. Date rule secondary" :source "https://rulebook.sgx.com/node/1771")
 (:mic "XSES" :kind :early-close :date (2026 2 16) :gold nil :ours (12 0)
  :why "eve of Chinese New Year: SGX half-day trading (Trading Phase 09:00-12:00, RN 8.2.1); ec has no half days. Date rule secondary" :source "https://rulebook.sgx.com/node/1771")
 (:mic "XSES" :kind :early-close :date (2026 12 24) :gold nil :ours (12 0)
  :why "Christmas Eve: SGX half-day trading (Trading Phase 09:00-12:00, RN 8.2.1); ec has no half days. Date rule secondary" :source "https://rulebook.sgx.com/node/1771")
 (:mic "XSES" :kind :early-close :date (2026 12 31) :gold nil :ours (12 0)
  :why "New Year's Eve: SGX half-day trading (Trading Phase 09:00-12:00, RN 8.2.1); ec has no half days. Date rule secondary" :source "https://rulebook.sgx.com/node/1771")
 ;; XKLS
 ;;;; XKLS: dates where Bursa Malaysia / KLSE sources disagree with exchange_calendars (ec 4.13.3) gold.
 ;;;; Exchange lists used from 2001 (first KLSE list); 2000 and 2010 have no exchange list (see XKLS.sexp :gaps).

 (:mic "XKLS" :date (2001 1 23) :kind :session :gold T :ours NIL :why "KLSE Holidays 2001 (page updated 28/11/01): Chinese New Year 23, 24, 25 Jan - exchange closed the CNY eve; ec has a 12:30 early close" :source "https://web.archive.org/web/20011212194147/http://www.klse.com.my/website/aboutus/holidays.htm")
 (:mic "XKLS" :date (2001 3 5) :kind :session :gold NIL :ours T :why "KLSE Holidays 2001: Hari Raya Haji 6 Mar (Tue); ec closes Mon 5 Mar" :source "https://web.archive.org/web/20011212194147/http://www.klse.com.my/website/aboutus/holidays.htm")
 (:mic "XKLS" :date (2001 3 6) :kind :session :gold T :ours NIL :why "KLSE Holidays 2001: Hari Raya Haji 6 Mar" :source "https://web.archive.org/web/20011212194147/http://www.klse.com.my/website/aboutus/holidays.htm")
 (:mic "XKLS" :date (2001 5 7) :kind :session :gold T :ours NIL :why "KLSE Holidays 2001: Wesak Day 7 May (Mon)" :source "https://web.archive.org/web/20011212194147/http://www.klse.com.my/website/aboutus/holidays.htm")
 (:mic "XKLS" :date (2001 11 14) :kind :session :gold T :ours NIL :why "KLSE Holidays 2001: Deepavali 14 Nov (Wed)" :source "https://web.archive.org/web/20011212194147/http://www.klse.com.my/website/aboutus/holidays.htm")
 (:mic "XKLS" :date (2001 12 19) :kind :session :gold T :ours NIL :why "KLSE Holidays 2001: Hari Raya Puasa 17, 18, 19 Dec (Mon-Wed)" :source "https://web.archive.org/web/20011212194147/http://www.klse.com.my/website/aboutus/holidays.htm")
 (:mic "XKLS" :date (2002 12 5) :kind :session :gold NIL :ours T :why "KLSE Holidays 2002 (updated 22/4/02): Hari Raya Puasa 6, 7* Dec (Fri, Sat; * subject to change). Provisional list, no later 2002 copy - moderate confidence" :source "https://web.archive.org/web/20021006135355/http://www.klse.com.my/website/aboutus/holidays.htm")
 (:mic "XKLS" :date (2003 11 24) :kind :session :gold NIL :ours T :why "KLSE Holidays 2003 (page updated 1/12/03, after the event): Hari Raya Puasa 25, 26 Nov only" :source "https://web.archive.org/web/20031209160400/http://www.klse.com.my/website/aboutus/holidays.htm")
 (:mic "XKLS" :date (2004 11 12) :kind :session :gold NIL :ours T :why "Bursa Malaysia Holidays 2004 (snapshot 2004-10-11): Deepavali 11* Nov, Hari Raya Puasa 15, 16* Nov; no 12 Nov. Provisional (*) - moderate confidence" :source "https://web.archive.org/web/20041011074234/http://www.klse.com.my/website/aboutus/holidays.htm")
 (:mic "XKLS" :date (2007 5 2) :kind :session :gold NIL :ours T :why "Bursa Malaysia Holidays 2007 (snapshot 2007-11-12, after the event): Workers' Day and Wesak Day both Tue 1 May; no replacement day listed (the page rule replaces Sunday holidays only) - moderate confidence" :source "https://web.archive.org/web/20071112045423/http://www.klse.com.my/website/bm/about_us/our_holidays.html")
 (:mic "XKLS" :date (2008 7 3) :kind :session :gold NIL :ours T :why "Not a holiday: Bursa Malaysia Holidays 2008 lists no 3 Jul closure. Search results (not fetched) report an unscheduled equities suspension that day after a trading-system hardware failure; ec closes the whole day - treat as outage, not calendar" :source "https://web.archive.org/web/20081217102440/http://www.klse.com.my/website/bm/about_us/our_holidays.html")
 (:mic "XKLS" :date (2021 12 3) :kind :session :gold T :ours NIL :why "Bursa closed Fri 3 Dec 2021 for the Federal Territories public holiday (Bursa notice 2 Dec 2021, Mondo Visione reprint; secondary)" :source "https://mondovisione.com/media-and-resources/news/closure-of-bursa-malaysia-in-conjunction-with-public-holiday-for-federal-territo-2021122")
 (:mic "XKLS" :date (2022 5 16) :kind :session :gold T :ours NIL :why "Bursa media release 11 May 2022: closed Mon 16 May 2022, Wesak Day replacement" :source "https://web.archive.org/web/20220513071850/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-the-wesak-day-replacement-holiday")
 (:mic "XKLS" :date (2022 11 18) :kind :session :gold T :ours NIL :why "Bursa media release 15 Nov 2022: closed Fri 18 Nov 2022, special holiday (GE15)" :source "https://web.archive.org/web/20221115141728/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-the-special-holiday")
 (:mic "XKLS" :date (2022 11 28) :kind :session :gold T :ours NIL :why "Bursa media release 25 Nov 2022: closed Mon 28 Nov 2022, special public holiday" :source "https://web.archive.org/web/20221125041505/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-the-special-public-holiday")
 (:mic "XKLS" :date (2023 2 6) :kind :session :gold T :ours NIL :why "Bursa media release 30 Jan 2023: Thaipusam Sun 5 Feb 2023, public holiday Mon 6 Feb, resume Tue 7 Feb" :source "https://web.archive.org/web/20230130072507/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-federal-territory-day-and-thaipusam")
 (:mic "XKLS" :date (2024 3 27) :kind :session :gold NIL :ours T :why "Bursa media release 26 Mar 2024: Nuzul Al-Quran closure is Thu 28 Mar 2024, not Wed 27 Mar" :source "https://web.archive.org/web/20240627133942/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-nuzul-al-quran-5")
 (:mic "XKLS" :date (2024 3 28) :kind :session :gold T :ours NIL :why "Bursa media release 26 Mar 2024: closed Thu 28 Mar 2024 for Nuzul Al-Quran" :source "https://web.archive.org/web/20240627133942/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-nuzul-al-quran-5")
 (:mic "XKLS" :date (2025 9 15) :kind :session :gold T :ours NIL :why "Bursa notice 25 Aug 2025 (Mondo Visione reprint; secondary): closed 15 Sep 2025, additional public holiday for Malaysia Day" :source "https://mondovisione.com/media-and-resources/news/closure-of-bursa-malaysia-in-conjunction-with-upcoming-public-holidays-in-septem-2025825/")
 (:mic "XKLS" :date (2026 3 20) :kind :session :gold T :ours NIL :why "Bursa notice 18 Mar 2026 (Mondo Visione reprint; secondary): closed Fri 20 Mar and Mon 23 Mar 2026; ec has a 12:30 early close on 20 Mar" :source "https://mondovisione.com/media-and-resources/news/closure-of-bursa-malaysia-in-conjunction-with-hari-raya-aidilfitri-public-holida-2026318")
 (:mic "XKLS" :date (2026 6 2) :kind :session :gold T :ours NIL :why "Bursa notice 20 May 2026 (Mondo Visione reprint; secondary): closed 1 and 2 Jun 2026 (Agong birthday; Wesak Day 31 May replacement)" :source "https://mondovisione.com/news/closure-of-bursa-malaysia-in-conjunction-with-the-aidiladha-birthday-of-his-maj-2026520/")
 (:mic "XKLS" :date (2024 2 9) :kind :early-close :gold (12 30) :ours NIL :why "CNY eve: full-day trading reinstated (Bursa notice 26 Jan 2024, Mondo Visione reprint); calendar 2024 page has no half-day row" :source "https://mondovisione.com/news/full-day-trading-on-the-eve-of-chinese-new-year-closure-of-bursa-malaysia-in-co-2024126")
 (:mic "XKLS" :date (2024 4 9) :kind :early-close :gold (12 30) :ours NIL :why "Hari Raya eve: Bursa media release 8 Apr 2024 - both markets under normal trading hours on 9 Apr 2024" :source "https://web.archive.org/web/20240510103445/https://www.bursamalaysia.com/about_bursa/media_centre/closure-of-bursa-malaysia-in-conjunction-with-hari-raya-aidilfitri-2024")
 (:mic "XKLS" :date (2025 1 28) :kind :early-close :gold (12 30) :ours NIL :why "CNY eve: Bursa calendar 2025 note b - normal trading hours on the eve of CNY and Hari Raya Aidilfitri" :source "https://web.archive.org/web/20250205181612/https://www.bursamalaysia.com/about_bursa/about_us/calendar")
 (:mic "XKLS" :date (2026 2 16) :kind :early-close :gold (12 30) :ours NIL :why "CNY eve: Bursa calendar 2026 note b - normal trading hours on the eve of CNY and Hari Raya Aidilfitri" :source "https://web.archive.org/web/20260911115934/https://www.bursamalaysia.com/about_bursa/about_us/calendar")
 (:mic "XKLS" :from (2000 1 3) :to (2028 12 29) :kind :hours :gold ((9 0) NIL NIL (17 0)) :ours ((9 0) (12 30) (14 30) (17 0)) :why "Bursa/KLSE equities have a lunch break: morning session 9:00-12:30, afternoon 14:30-17:00 (pre-opening 14:00; continuous to 16:45, pre-close, trading at last 16:50-17:00); ec models no break" :source "https://web.archive.org/web/20201130115703/https://www.bursamalaysia.com/trade/trading_resources/equities/trading_sessions")
 ;; XIDX
 ;;;; XIDX: dates where IDX/JSX sources disagree with exchange_calendars 4.13.3 (gold). Rows only for years with an exchange list.

(:mic "XIDX" :date (2005 12 30) :kind :session :gold nil :ours t
 :why "BEJ 2005 calendar (Peng-58/BEJ-DAG/U/04-2005, 27 Apr 2005) closes only 26 Dec in December ('Libur Bursa'); 30 Dec 2005 is a trading day on it. ec closes 30 Dec. A later year-end notice may exist (not found); low confidence."
 :source "https://web.archive.org/web/20061012054454/http://www.jsx.co.id/misc/revisi%20libur%202006.gif")
(:mic "XIDX" :date (2006 12 29) :kind :session :gold nil :ours t
 :why "BEJ 2006 calendar (Peng-398/BEJ-DAG/U/10-2005 with 2006 revisions) has only 25 Dec in December; ec closes 29 Dec (last weekday). Later notice not found; low confidence."
 :source "https://web.archive.org/web/20061019130208/http://www.jsx.co.id/misc/libur%20bursa2007-2006.png")
(:mic "XIDX" :date (2007 12 31) :kind :session :gold nil :ours t
 :why "BEJ 2007 calendar (Peng-397/BEJ-DAG/10-2006) closes 20, 21, 24, 25 Dec, not 31 Dec; ec closes 31 Dec. Later notice not found; low confidence."
 :source "https://web.archive.org/web/20061019130208/http://www.jsx.co.id/misc/libur%20bursa2007-2006.png")
(:mic "XIDX" :date (2022 4 29) :kind :session :gold t :ours nil
 :why "IDX Trading Holiday 2022 (v2, per SKB 375/2022 of 7 Apr 2022) closes 29 Apr and 4-6 May 2022 as Commemoration (cuti bersama) of Eid al-Fitr 1443 H; ec trades."
 :source "https://web.archive.org/web/20221003144151/https://www.idx.co.id/media/10970/2022_eng-v2.jpg")
(:mic "XIDX" :date (2022 5 4) :kind :session :gold t :ours nil
 :why "IDX Trading Holiday 2022 (v2, per SKB 375/2022 of 7 Apr 2022) closes 29 Apr and 4-6 May 2022 as Commemoration (cuti bersama) of Eid al-Fitr 1443 H; ec trades."
 :source "https://web.archive.org/web/20221003144151/https://www.idx.co.id/media/10970/2022_eng-v2.jpg")
(:mic "XIDX" :date (2022 5 5) :kind :session :gold t :ours nil
 :why "IDX Trading Holiday 2022 (v2, per SKB 375/2022 of 7 Apr 2022) closes 29 Apr and 4-6 May 2022 as Commemoration (cuti bersama) of Eid al-Fitr 1443 H; ec trades."
 :source "https://web.archive.org/web/20221003144151/https://www.idx.co.id/media/10970/2022_eng-v2.jpg")
(:mic "XIDX" :date (2022 5 6) :kind :session :gold t :ours nil
 :why "IDX Trading Holiday 2022 (v2, per SKB 375/2022 of 7 Apr 2022) closes 29 Apr and 4-6 May 2022 as Commemoration (cuti bersama) of Eid al-Fitr 1443 H; ec trades."
 :source "https://web.archive.org/web/20221003144151/https://www.idx.co.id/media/10970/2022_eng-v2.jpg")
(:mic "XIDX" :date (2025 8 18) :kind :session :gold t :ours nil
 :why "IDX set 18 Aug 2025 (government-added cuti bersama) as Hari Libur Bursa, revising Peng-00213/BEI.POP/10-2024 (secondary: Republika 8 Aug 2025); ec trades."
 :source "https://ekonomi.republika.co.id/berita/t0obef423/bei-tetapkan-18-agustus-2025-libur-perdagangan-bursa")
(:mic "XIDX" :date (2027 1 5) :kind :session :gold t :ours nil
 :why "IDX Kalender Libur Bursa 2027 (Peng-00169/BEI.POP/09-2026) lists Isra Mikraj; ec (4.13.3) lacks the 2027 SKB dates."
 :source "https://web.archive.org/web/20261107161932/https://www.idx.co.id/StaticData/NewsAndAnnouncement/ANNOUNCEMENTSTOCK/Exchange/Libur%20Bursa%20Peng-00169%20ID-No.%20Peng-00169BEI.POP09-2026.pdf")
(:mic "XIDX" :date (2027 2 5) :kind :session :gold t :ours nil
 :why "IDX Kalender Libur Bursa 2027 (Peng-00169/BEI.POP/09-2026) lists Cuti Bersama Imlek; ec (4.13.3) lacks the 2027 SKB dates."
 :source "https://web.archive.org/web/20261107161932/https://www.idx.co.id/StaticData/NewsAndAnnouncement/ANNOUNCEMENTSTOCK/Exchange/Libur%20Bursa%20Peng-00169%20ID-No.%20Peng-00169BEI.POP09-2026.pdf")
(:mic "XIDX" :date (2027 3 8) :kind :session :gold t :ours nil
 :why "IDX Kalender Libur Bursa 2027 (Peng-00169/BEI.POP/09-2026) lists Nyepi; ec (4.13.3) lacks the 2027 SKB dates."
 :source "https://web.archive.org/web/20261107161932/https://www.idx.co.id/StaticData/NewsAndAnnouncement/ANNOUNCEMENTSTOCK/Exchange/Libur%20Bursa%20Peng-00169%20ID-No.%20Peng-00169BEI.POP09-2026.pdf")
(:mic "XIDX" :date (2027 3 9) :kind :session :gold t :ours nil
 :why "IDX Kalender Libur Bursa 2027 (Peng-00169/BEI.POP/09-2026) lists Cuti Bersama Idul Fitri; ec (4.13.3) lacks the 2027 SKB dates."
 :source "https://web.archive.org/web/20261107161932/https://www.idx.co.id/StaticData/NewsAndAnnouncement/ANNOUNCEMENTSTOCK/Exchange/Libur%20Bursa%20Peng-00169%20ID-No.%20Peng-00169BEI.POP09-2026.pdf")
(:mic "XIDX" :date (2027 3 10) :kind :session :gold t :ours nil
 :why "IDX Kalender Libur Bursa 2027 (Peng-00169/BEI.POP/09-2026) lists Idul Fitri; ec (4.13.3) lacks the 2027 SKB dates."
 :source "https://web.archive.org/web/20261107161932/https://www.idx.co.id/StaticData/NewsAndAnnouncement/ANNOUNCEMENTSTOCK/Exchange/Libur%20Bursa%20Peng-00169%20ID-No.%20Peng-00169BEI.POP09-2026.pdf")
(:mic "XIDX" :date (2027 3 11) :kind :session :gold t :ours nil
 :why "IDX Kalender Libur Bursa 2027 (Peng-00169/BEI.POP/09-2026) lists Idul Fitri; ec (4.13.3) lacks the 2027 SKB dates."
 :source "https://web.archive.org/web/20261107161932/https://www.idx.co.id/StaticData/NewsAndAnnouncement/ANNOUNCEMENTSTOCK/Exchange/Libur%20Bursa%20Peng-00169%20ID-No.%20Peng-00169BEI.POP09-2026.pdf")
(:mic "XIDX" :date (2027 3 12) :kind :session :gold t :ours nil
 :why "IDX Kalender Libur Bursa 2027 (Peng-00169/BEI.POP/09-2026) lists Cuti Bersama Idul Fitri; ec (4.13.3) lacks the 2027 SKB dates."
 :source "https://web.archive.org/web/20261107161932/https://www.idx.co.id/StaticData/NewsAndAnnouncement/ANNOUNCEMENTSTOCK/Exchange/Libur%20Bursa%20Peng-00169%20ID-No.%20Peng-00169BEI.POP09-2026.pdf")
(:mic "XIDX" :date (2027 3 15) :kind :session :gold t :ours nil
 :why "IDX Kalender Libur Bursa 2027 (Peng-00169/BEI.POP/09-2026) lists Cuti Bersama Idul Fitri; ec (4.13.3) lacks the 2027 SKB dates."
 :source "https://web.archive.org/web/20261107161932/https://www.idx.co.id/StaticData/NewsAndAnnouncement/ANNOUNCEMENTSTOCK/Exchange/Libur%20Bursa%20Peng-00169%20ID-No.%20Peng-00169BEI.POP09-2026.pdf")
(:mic "XIDX" :date (2027 3 25) :kind :session :gold t :ours nil
 :why "IDX Kalender Libur Bursa 2027 (Peng-00169/BEI.POP/09-2026) lists Cuti Bersama Wafat Yesus Kristus; ec (4.13.3) lacks the 2027 SKB dates."
 :source "https://web.archive.org/web/20261107161932/https://www.idx.co.id/StaticData/NewsAndAnnouncement/ANNOUNCEMENTSTOCK/Exchange/Libur%20Bursa%20Peng-00169%20ID-No.%20Peng-00169BEI.POP09-2026.pdf")
(:mic "XIDX" :date (2027 5 17) :kind :session :gold t :ours nil
 :why "IDX Kalender Libur Bursa 2027 (Peng-00169/BEI.POP/09-2026) lists Idul Adha; ec (4.13.3) lacks the 2027 SKB dates."
 :source "https://web.archive.org/web/20261107161932/https://www.idx.co.id/StaticData/NewsAndAnnouncement/ANNOUNCEMENTSTOCK/Exchange/Libur%20Bursa%20Peng-00169%20ID-No.%20Peng-00169BEI.POP09-2026.pdf")
(:mic "XIDX" :date (2027 5 18) :kind :session :gold t :ours nil
 :why "IDX Kalender Libur Bursa 2027 (Peng-00169/BEI.POP/09-2026) lists Cuti Bersama Idul Adha; ec (4.13.3) lacks the 2027 SKB dates."
 :source "https://web.archive.org/web/20261107161932/https://www.idx.co.id/StaticData/NewsAndAnnouncement/ANNOUNCEMENTSTOCK/Exchange/Libur%20Bursa%20Peng-00169%20ID-No.%20Peng-00169BEI.POP09-2026.pdf")
(:mic "XIDX" :date (2027 5 19) :kind :session :gold t :ours nil
 :why "IDX Kalender Libur Bursa 2027 (Peng-00169/BEI.POP/09-2026) lists Cuti Bersama Waisak; ec (4.13.3) lacks the 2027 SKB dates."
 :source "https://web.archive.org/web/20261107161932/https://www.idx.co.id/StaticData/NewsAndAnnouncement/ANNOUNCEMENTSTOCK/Exchange/Libur%20Bursa%20Peng-00169%20ID-No.%20Peng-00169BEI.POP09-2026.pdf")
(:mic "XIDX" :date (2027 5 20) :kind :session :gold t :ours nil
 :why "IDX Kalender Libur Bursa 2027 (Peng-00169/BEI.POP/09-2026) lists Waisak; ec (4.13.3) lacks the 2027 SKB dates."
 :source "https://web.archive.org/web/20261107161932/https://www.idx.co.id/StaticData/NewsAndAnnouncement/ANNOUNCEMENTSTOCK/Exchange/Libur%20Bursa%20Peng-00169%20ID-No.%20Peng-00169BEI.POP09-2026.pdf")
(:mic "XIDX" :date (2027 12 24) :kind :session :gold t :ours nil
 :why "IDX Kalender Libur Bursa 2027 (Peng-00169/BEI.POP/09-2026) lists Cuti Bersama Natal; ec (4.13.3) lacks the 2027 SKB dates."
 :source "https://web.archive.org/web/20261107161932/https://www.idx.co.id/StaticData/NewsAndAnnouncement/ANNOUNCEMENTSTOCK/Exchange/Libur%20Bursa%20Peng-00169%20ID-No.%20Peng-00169BEI.POP09-2026.pdf")
(:mic "XIDX" :from (2000 1 3) :to (2012 12 28) :kind :hours :gold ((9 0) nil nil (15 50)) :ours ((9 30) (12 0) (13 30) (16 0))
 :why "JSX/IDX regular market: Mon-Thu Sesi I 09:30-12:00, Sesi II 13:30-16:00; FRIDAY 09:30-11:30 / 14:00-16:00 (Fridays mismatch as ((9 30) (11 30) (14 0) (16 0)); the test will split this into weekly runs - regenerate exact rows from the model). JSX Mekanisme Perdagangan page 2003; open moved to 09:00 on 2 Jan 2013. ec uses 09:00-15:50 throughout."
 :source "https://web.archive.org/web/20031008160117/http://www.jsx.co.id:80/trading.asp?cmd=menu1")
(:mic "XIDX" :from (2013 1 2) :to (2020 3 27) :kind :hours :gold ((9 0) nil nil (15 50)) :ours ((9 0) (12 0) (13 30) (15 50))
 :why "IDX regular market Mon-Thu 09:00:00-12:00:00 / 13:30:00-15:49:59, FRIDAY 09:00-11:30 / 14:00-15:49:59 (Friday rows ((9 0) (11 30) (14 0) (15 50))); pre-closing 15:50-16:00 not counted. ec has no lunch break. Split into weekly runs by the test."
 :source "https://web.archive.org/web/20191207111354/https://www.idx.co.id/en-us/investor/trading-hours/")
(:mic "XIDX" :from (2020 3 30) :to (2023 3 31) :kind :hours :gold ((9 0) nil nil (15 50)) :ours ((9 0) (11 30) (13 30) (14 50))
 :why "COVID-19 hours, Kep-00031/BEI/03-2020: Mon-Fri 09:00:00-11:30:00 / 13:30:00-14:49:59 (pre-closing 14:50-15:00), same on Fridays; in force (IDX pages Jun 2020, Jun 2021, Jan 2022) until normal hours returned on 3 Apr 2023 (secondary: Bisnis.com 3 Apr 2023). Start 30 Mar 2020 per OJK/IDX reports (secondary)."
 :source "https://web.archive.org/web/20200606143204/https://www.idx.co.id/en-us/investor/trading-hours/")
(:mic "XIDX" :from (2023 4 3) :to (2028 12 29) :kind :hours :gold ((9 0) nil nil (15 50)) :ours ((9 0) (12 0) (13 30) (15 50))
 :why "Normal hours restored 3 Apr 2023 (secondary): Mon-Thu 09:00-12:00 / 13:30-15:49:59, FRIDAY 09:00-11:30 / 14:00-15:49:59 (as the 2019 page). ec has no lunch break. Split into weekly runs by the test."
 :source "https://web.archive.org/web/20191207111354/https://www.idx.co.id/en-us/investor/trading-hours/")
 ;; XPHS
 ;;;; XPHS: dates where PSE memoranda disagree with exchange_calendars 4.13.3 (gold). Exchange-source years 2013-2026 (holiday memoranda from 2015).

(:mic "XPHS" :date (2017 12 8) :kind :session :gold nil :ours t
 :why "No PSE non-trading memorandum for 8 Dec 2017 (CN-2017-0076 of 13 Dec lists only 25 Dec and 1 Jan); Immaculate Conception became a special non-working day from 2018 (RA 10966); PSE issued CN-2017-0074 that day. ec closes. Medium confidence (absence of notice)."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2017-0076.pdf")
(:mic "XPHS" :date (2020 1 13) :kind :session :gold t :ours nil
 :why "CN-2020-0002: no trading at PSE on 13 Jan 2020 (Taal Volcano ash). ec trades."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2020-0002.pdf")
(:mic "XPHS" :date (2020 3 17) :kind :session :gold t :ours nil
 :why "CN-2020-0021: no trading from 17 Mar 2020 until further notice (COVID-19 ECQ); CN-2020-0025 resumes 19 Mar. ec trades."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2020-0021.pdf")
(:mic "XPHS" :date (2020 3 18) :kind :session :gold t :ours nil
 :why "CN-2020-0021 / CN-2020-0025: trading suspended 17-18 Mar 2020, resumed Thursday 19 Mar. ec trades."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2020-0025.pdf")
(:mic "XPHS" :date (2020 11 12) :kind :session :gold t :ours nil
 :why "CN-2020-0096: NO trading today, 12 Nov 2020 (Typhoon Ulysses). ec trades."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2020-0096.pdf")
(:mic "XPHS" :date (2021 12 24) :kind :session :gold nil :ours t
 :why "CN-2021-0063: half-day trading on 24 Dec 2021 (close 12:10); ec closes the whole day."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2021-0063.pdf")
(:mic "XPHS" :date (2021 12 31) :kind :session :gold nil :ours t
 :why "CN-2021-0063: half-day trading on 31 Dec 2021 (close 12:10); ec closes the whole day."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2021-0063.pdf")
(:mic "XPHS" :date (2022 1 4) :kind :session :gold t :ours nil
 :why "CN-2022-0002: trading cancelled 4 Jan 2022 (trading-engine connection failure). ec trades."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2022-0002.pdf")
(:mic "XPHS" :date (2022 2 25) :kind :session :gold t :ours nil
 :why "CN-2022-0006: no trading on 25 Feb 2022, EDSA People Power anniversary (special non-working day). ec trades."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2022-0006.pdf")
(:mic "XPHS" :date (2022 9 26) :kind :session :gold t :ours nil
 :why "CN-2022-0035: no trading on 26 Sep 2022 (Super Typhoon Karding). ec trades."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2022-0035.pdf")
(:mic "XPHS" :date (2022 12 26) :kind :session :gold t :ours nil
 :why "CN-2022-0050: no trading on 26 Dec 2022 (additional special non-working day). ec trades."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2022-0050.pdf")
(:mic "XPHS" :date (2024 7 24) :kind :session :gold t :ours nil
 :why "CN-2024-0038: no trading on 24 Jul 2024 (Typhoon Carina). ec trades."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2024-0038.pdf")
(:mic "XPHS" :date (2026 11 2) :kind :session :gold t :ours nil
 :why "CN-2026-0052: no trading on 2 Nov 2026 (All Souls' Day special non-working day). ec trades."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2026-0052.pdf")
(:mic "XPHS" :date (2015 9 30) :kind :late-open :gold nil :ours (10 35)
 :why "CN-2015-0128: adjusted schedule, market open 10:35."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2015-0128.pdf")
(:mic "XPHS" :date (2018 12 3) :kind :late-open :gold nil :ours (10 15)
 :why "CN-2018-0060: market opened at 10:15 after a system failure."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2018-0060.pdf")
(:mic "XPHS" :date (2019 10 9) :kind :late-open :gold nil :ours (9 45)
 :why "CN-2019-0045: market open 9:45."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2019-0045.pdf")
(:mic "XPHS" :date (2024 12 9) :kind :late-open :gold nil :ours (9 55)
 :why "CN-2024-0061: market open 09:55."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2024-0061.pdf")
(:mic "XPHS" :date (2025 3 24) :kind :late-open :gold nil :ours (11 10)
 :why "CN-2025-0015: market open 11:10."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2025-0015.pdf")
(:mic "XPHS" :from (2000 1 3) :to (2011 9 30) :kind :hours :gold ((9 30) nil nil (15 30)) :ours ((9 30) nil nil (12 0))
 :why "Morning-only session 09:30-12:00 until Sep 2011: CN-2011-0013 reports 'the PSE extended trading hours starting October 1 until 1:00 PM'. No 2000-2010 PSE document retrieved; repo era kept."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2011-0013.pdf")
(:mic "XPHS" :from (2011 10 3) :to (2011 12 29) :kind :hours :gold ((9 30) nil nil (15 30)) :ours ((9 30) nil nil (13 0))
 :why "CN-2011-0013: trading extended to 1:00 PM from 1 Oct 2011 (no lunch break)."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2011-0013.pdf")
(:mic "XPHS" :from (2012 1 2) :to (2020 3 13) :kind :hours :gold ((9 30) nil nil (15 30)) :ours ((9 30) (12 0) (13 30) (15 30))
 :why "09:30-12:00 / 13:30-15:30 with a 12:00-13:30 recess (CN-2014-0057 'close of trading 3:30 p.m.'; CN-2015-0128 recess 12:00, resume 13:30, close 15:30; CN-2018-0055 survey 9:30-12:00 / 1:30-3:30). Start 2 Jan 2012 from the repo's source. ec has no break."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2018-0055.pdf")
(:mic "XPHS" :from (2020 3 16) :to (2021 12 3) :kind :hours :gold ((9 30) nil nil (15 30)) :ours ((9 30) nil nil (13 0))
 :why "COVID shortened hours 09:30-13:00 (CN-2020-0017 for 16 Mar; CN-2020-0025 from 19 Mar; extended by CN-2020-0035, -0042, -0046 'until further notice'; ended by CN-2021-0059 effective 6 Dec 2021). 17-18 Mar 2020 closed."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2020-0046.pdf")
(:mic "XPHS" :from (2021 12 6) :to (2022 1 13) :kind :hours :gold ((9 30) nil nil (15 30)) :ours ((9 30) (12 0) (13 0) (15 0))
 :why "CN-2021-0059: from 6 Dec 2021 market open 09:30, recess 12:00, resumption 13:00, pre-close 14:45, run-off 14:50, close 15:00."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2021-0059.pdf")
(:mic "XPHS" :from (2022 1 14) :to (2022 2 28) :kind :hours :gold ((9 30) nil nil (15 30)) :ours ((9 30) nil nil (13 0))
 :why "CN-2022-0004: shortened hours 09:30-13:00 from 14 Jan 2022 (Omicron); CN-2022-0009 returns to the full-day schedule effective 1 Mar 2022."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2022-0004.pdf")
(:mic "XPHS" :from (2022 3 1) :to (2024 2 29) :kind :hours :gold ((9 30) nil nil (15 30)) :ours ((9 30) (12 0) (13 0) (15 0))
 :why "CN-2022-0009: from 1 Mar 2022 open 09:30, recess 12:00, resumption 13:00, pre-close 14:45, run-off 14:50, close 15:00."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2022-0009.pdf")
(:mic "XPHS" :from (2024 3 1) :to (2028 12 29) :kind :hours :gold ((9 30) nil nil (15 30)) :ours ((9 30) (12 0) (13 0) (15 15))
 :why "Closing VWAP session 15:00-15:15 from 1 Mar 2024 (CN-2024-0012 go-live); PSE 'Trading Hours & Holidays' page: open 9:30, recess 12:00, resume 1:00, run-off 2:50, Closing VWAP Session 3:00, Market Close 3:15. If the close is taken as end of run-off, use 15:00."
 :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2024-0012.pdf")
 ;; XBKK
 ;;;; XBKK: dates where SET sources disagree with exchange_calendars (gold).

 (:mic "XBKK" :kind :session :date (2020 4 13) :gold nil :ours t :why "Songkran 2020 postponed (COVID); not in SET 2020 holiday list - SET open" :source "https://web.archive.org/web/20210818095853/https://www.set.or.th/set/holiday.do?year=2020")
 (:mic "XBKK" :kind :session :date (2020 4 14) :gold nil :ours t :why "Songkran 2020 postponed; SET open" :source "https://web.archive.org/web/20210818095853/https://www.set.or.th/set/holiday.do?year=2020")
 (:mic "XBKK" :kind :session :date (2020 4 15) :gold nil :ours t :why "Songkran 2020 postponed; SET open" :source "https://web.archive.org/web/20210818095853/https://www.set.or.th/set/holiday.do?year=2020")
 (:mic "XBKK" :kind :session :date (2020 7 27) :gold t :ours nil :why "SET 2020 list: substitute Songkran holiday (Mon 27 Jul)" :source "https://web.archive.org/web/20210818095853/https://www.set.or.th/set/holiday.do?year=2020")
 (:mic "XBKK" :kind :session :date (2020 9 4) :gold t :ours nil :why "SET 2020 list: substitute Songkran holiday (Fri 4 Sep)" :source "https://web.archive.org/web/20210818095853/https://www.set.or.th/set/holiday.do?year=2020")
 (:mic "XBKK" :kind :session :date (2020 9 7) :gold t :ours nil :why "SET 2020 list: substitute Songkran holiday (Mon 7 Sep)" :source "https://web.archive.org/web/20210818095853/https://www.set.or.th/set/holiday.do?year=2020")
 (:mic "XBKK" :kind :session :date (2020 12 11) :gold t :ours nil :why "SET 2020 list: special holiday (Fri 11 Dec)" :source "https://web.archive.org/web/20210818095853/https://www.set.or.th/set/holiday.do?year=2020")
 (:mic "XBKK" :kind :session :date (2021 10 25) :gold nil :ours t :why "SET 2021 list closes Fri 22 Oct (Chulalongkorn Day substitute), not Mon 25 Oct" :source "https://web.archive.org/web/20210818093150/https://www.set.or.th/set/holiday.do?year=2021")
 (:mic "XBKK" :kind :session :date (2023 1 3) :gold nil :ours t :why "SET 2023 list: only Mon 2 Jan (substitute New Year); 3 Jan government-only special holiday not adopted" :source "https://web.archive.org/web/20230620111333/https://www.set.or.th/api/set/holiday/year/2023?lang=en")
 (:mic "XBKK" :kind :session :date (2024 1 2) :gold nil :ours t :why "BOT moved the year-end substitute from 2 Jan 2024 to 29 Dec 2023; SET traded 2 Jan 2024 (SET index close 1,433.38). Secondary evidence" :source "https://www.thairath.co.th/money/investment/stocks/2752222")
 (:mic "XBKK" :kind :session :date (2026 10 16) :gold t :ours nil :why "BOT 26/2569 and SEC special holiday (Bangkok, IMF/WB meetings); SET closed. Secondary report of SEC notice" :source "https://www.pptvhd36.com/wealth/stock-investment/278867")
 (:mic "XBKK" :kind :session :date (2026 12 16) :gold t :ours nil :why "BOT 61/2569 and SEC special holiday for securities firms and TFEX; SET closed. Secondary report" :source "https://www.posttoday.com/business/stockholder/752147")
 (:mic "XBKK" :kind :hours :from (2000 1 4) :to (2024 3 22) :gold ((10 0) nil nil (16 30)) :ours ((10 0) (12 30) (14 30) (16 30)) :why "SET has a midday break 12:30-14:30 (afternoon pre-open from 14:00); ec has none. Per SET News 22/2024 cited in data/exchanges/XBKK.sexp (not re-fetched: set.or.th returns 403)" :source "data/exchanges/XBKK.sexp")
 (:mic "XBKK" :kind :hours :from (2024 3 25) :to (2028 12 29) :gold ((10 0) nil nil (16 30)) :ours ((10 0) (12 30) (14 0) (16 30)) :why "SET afternoon session from 14:00 effective 25 Mar 2024 (SET News 22/2024, as cited in the repo); ec has no break" :source "data/exchanges/XBKK.sexp")
 (:mic "XIDX" :from (2005 1 7) :to (2012 12 28) :kind :hours
  :gold ((9 0) nil nil (15 50)) :ours ((9 30) (11 30) (14 0) (16 0))
  :why "Fridays before 2013: JSX/IDX session I 09:30-11:30, session II 14:00-16:00 (Friday prayer break). exchange_calendars has no break, no Friday hours and the 2013 hours throughout."
  :source "https://web.archive.org/web/20031008160117/http://www.jsx.co.id:80/trading.asp?cmd=menu1")
 (:mic "XIDX" :from (2013 1 4) :to (2028 12 29) :kind :hours
  :gold ((9 0) nil nil (15 50)) :ours ((9 0) (11 30) (14 0) (15 50))
  :why "Fridays from 2013 (outside the 2020-03-30..2023-03-31 COVID era): session I 09:00-11:30, session II 14:00-15:49:59. exchange_calendars has no break."
  :source "https://web.archive.org/web/20191207111354/https://www.idx.co.id/en-us/investor/trading-hours/")
 (:mic "XPHS" :from (2024 3 1) :to (2028 12 29) :kind :hours
  :gold ((9 30) nil nil (15 30)) :ours ((9 30) (12 0) (13 0) (15 0))
  :why "From 2022-03-01 the PSE trades 09:30-12:00 / 13:00-15:00 (CN-2022-0009); the closing VWAP session 15:00-15:15 added on 2024-03-01 (CN-2024-0012) follows the run-off and is not counted. exchange_calendars has 09:30-15:30 without a recess."
  :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2024-0012.pdf")
 (:mic "XPHS" :date (2015 11 18) :kind :session :gold nil :ours t
  :why "exchange_calendars closes the day (APEC summit, NCR special non-working day). No PSE memorandum for it was found (the 2015 memoranda cover only nationwide days); NCR-only days do not close PSE unless PhilPaSS closes (CN-2015-0067). Stays a session until a memorandum is cited (follow-up issue)."
  :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2015-0067.pdf")
 (:mic "XPHS" :date (2015 11 19) :kind :session :gold nil :ours t
  :why "As 2015-11-18 (APEC); no PSE memorandum found."
  :source "https://documents.pse.com.ph/CircularOPSPDF/CN-2015-0067.pdf")
 (:mic "XKLS" :date (2002 12 4) :kind :early-close :gold (12 30) :ours nil
  :why "exchange_calendars has a half day (eve of Chinese New Year or Hari Raya). The KLSE/Bursa holiday lists of 2001-2009 show no half days, and Bursa introduced the half-day closure on those eves 'with immediate effect' on 30 Sep 2010; a full day is kept."
  :source "https://web.archive.org/web/20011212194147/http://www.klse.com.my/website/aboutus/holidays.htm")
 (:mic "XKLS" :date (2005 2 8) :kind :early-close :gold (12 30) :ours nil
  :why "exchange_calendars has a half day (eve of Chinese New Year or Hari Raya). The KLSE/Bursa holiday lists of 2001-2009 show no half days, and Bursa introduced the half-day closure on those eves 'with immediate effect' on 30 Sep 2010; a full day is kept."
  :source "https://web.archive.org/web/20011212194147/http://www.klse.com.my/website/aboutus/holidays.htm")
 (:mic "XKLS" :date (2005 11 2) :kind :early-close :gold (12 30) :ours nil
  :why "exchange_calendars has a half day (eve of Chinese New Year or Hari Raya). The KLSE/Bursa holiday lists of 2001-2009 show no half days, and Bursa introduced the half-day closure on those eves 'with immediate effect' on 30 Sep 2010; a full day is kept."
  :source "https://web.archive.org/web/20011212194147/http://www.klse.com.my/website/aboutus/holidays.htm")
 (:mic "XKLS" :date (2007 10 12) :kind :early-close :gold (12 30) :ours nil
  :why "exchange_calendars has a half day (eve of Chinese New Year or Hari Raya). The KLSE/Bursa holiday lists of 2001-2009 show no half days, and Bursa introduced the half-day closure on those eves 'with immediate effect' on 30 Sep 2010; a full day is kept."
  :source "https://web.archive.org/web/20011212194147/http://www.klse.com.my/website/aboutus/holidays.htm")
 (:mic "XKLS" :date (2008 2 6) :kind :early-close :gold (12 30) :ours nil
  :why "exchange_calendars has a half day (eve of Chinese New Year or Hari Raya). The KLSE/Bursa holiday lists of 2001-2009 show no half days, and Bursa introduced the half-day closure on those eves 'with immediate effect' on 30 Sep 2010; a full day is kept."
  :source "https://web.archive.org/web/20011212194147/http://www.klse.com.my/website/aboutus/holidays.htm")
 (:mic "XKLS" :date (2008 9 30) :kind :early-close :gold (12 30) :ours nil
  :why "exchange_calendars has a half day (eve of Chinese New Year or Hari Raya). The KLSE/Bursa holiday lists of 2001-2009 show no half days, and Bursa introduced the half-day closure on those eves 'with immediate effect' on 30 Sep 2010; a full day is kept."
  :source "https://web.archive.org/web/20011212194147/http://www.klse.com.my/website/aboutus/holidays.htm")
 (:mic "XIDX" :date (2008 2 8) :kind :session :gold nil :ours t
  :why "No IDX list for 2008-2009 (see the calendar's :gaps): exchange_calendars closes it; the SKB 2008 data has no cuti bersama that day. Kept until an IDX list or announcement is cited."
  :source "https://web.archive.org/web/20121219163825/http://www.idx.co.id:80/en-us/home/newsannouncement/tradingholiday.aspx")
 (:mic "XIDX" :date (2008 9 29) :kind :session :gold t :ours nil
  :why "No IDX list for 2008-2009 (see the calendar's :gaps): the SKB 2008 cuti bersama (data/id/skb.sexp) closes it; exchange_calendars has a session. Kept until an IDX list or announcement is cited."
  :source "https://web.archive.org/web/20121219163825/http://www.idx.co.id:80/en-us/home/newsannouncement/tradingholiday.aspx")
 (:mic "XIDX" :date (2008 10 9) :kind :session :gold nil :ours t
  :why "No IDX list for 2008-2009 (see the calendar's :gaps): exchange_calendars closes it (the October 2008 market suspension after the 8 Oct halt); known only from secondary reports. Kept until an IDX list or announcement is cited."
  :source "https://web.archive.org/web/20121219163825/http://www.idx.co.id:80/en-us/home/newsannouncement/tradingholiday.aspx")
 (:mic "XIDX" :date (2008 10 10) :kind :session :gold nil :ours t
  :why "No IDX list for 2008-2009 (see the calendar's :gaps): as 2008-10-09: suspension known only from secondary reports. Kept until an IDX list or announcement is cited."
  :source "https://web.archive.org/web/20121219163825/http://www.idx.co.id:80/en-us/home/newsannouncement/tradingholiday.aspx")
 (:mic "XIDX" :date (2008 12 26) :kind :session :gold t :ours nil
  :why "No IDX list for 2008-2009 (see the calendar's :gaps): the SKB 2008 cuti bersama closes it; exchange_calendars has a session. Kept until an IDX list or announcement is cited."
  :source "https://web.archive.org/web/20121219163825/http://www.idx.co.id:80/en-us/home/newsannouncement/tradingholiday.aspx")
 (:mic "XIDX" :date (2008 12 31) :kind :session :gold nil :ours t
  :why "No IDX list for 2008-2009 (see the calendar's :gaps): exchange_calendars closes 31 Dec; the IDX year-end Libur Bursa rule is evidenced from 2010 only. Kept until an IDX list or announcement is cited."
  :source "https://web.archive.org/web/20121219163825/http://www.idx.co.id:80/en-us/home/newsannouncement/tradingholiday.aspx")
 (:mic "XIDX" :date (2009 12 31) :kind :session :gold nil :ours t
  :why "No IDX list for 2008-2009 (see the calendar's :gaps): exchange_calendars closes 31 Dec; the IDX year-end Libur Bursa rule is evidenced from 2010 only. Kept until an IDX list or announcement is cited."
  :source "https://web.archive.org/web/20121219163825/http://www.idx.co.id:80/en-us/home/newsannouncement/tradingholiday.aspx")
 ;; BVMF
 ; BVMF: dates where B3 / BM&FBOVESPA sources disagree with exchange_calendars (gold-later/BVMF-gold.sexp).
 ; Holidays 2011-2026: no disagreement. Every :SESSION NIL T row in diffs/BVMF.txt (ec closed, BR civil calendar open)
 ; is a B3 closure: Carnaval Mon/Tue, Corpus Christi, 25/1, 9/7, 20/11 (SP, to 2021), 24/12, last weekday of the

 (:mic "BVMF" :date (2011 3 9) :kind :late-open :gold nil :ours (13 0)
  :why "Quarta-Feira de Cinzas 2011: 'a negociação nos mercados da BM&FBOVESPA começará às 13h' (2011 calendar news 05/11/2010). ec's late opens start in 2016."
  :source "http://web.archive.org/web/2011id_/http://www.bmfbovespa.com.br/pt-br/noticias/2010/Confira-o-calendario-de-feriados-do-mercado-para-2011-2010-11-05.aspx?idioma=pt-br")
 (:mic "BVMF" :date (2012 2 22) :kind :late-open :gold nil :ours (13 0)
  :why "Quarta-Feira de Cinzas 2012: trading from 13h (2012 calendar news 29/11/2011)."
  :source "http://web.archive.org/web/20120101000000id_/http://www.bmfbovespa.com.br/pt-br/noticias/2011/BMFBOVESPA-divulga-o-calendario-do-mercado-2012-2011-11-29.aspx?idioma=pt-br")
 (:mic "BVMF" :date (2013 2 13) :kind :late-open :gold nil :ours (13 0)
  :why "Quarta-Feira de Cinzas 2013: trading from 13h (2013 calendar news 07/12/2012)."
  :source "http://web.archive.org/web/2013id_/http://www.bmfbovespa.com.br/pt-br/noticias/2012/BMFBOVESPA-divulga-o-calendario-do-mercado-2013-2012-12-07.aspx?idioma=pt-br")
 (:mic "BVMF" :date (2014 3 5) :kind :late-open :gold nil :ours (13 0)
  :why "Quarta-Feira de Cinzas 2014: 'Das 13h às 17h – fase de negociação' (news 27/02/2014)."
  :source "http://web.archive.org/web/2014id_/http://www.bmfbovespa.com.br/pt-br/noticias/2014/Horarios-de-Negociacao-em-05-03-2014-Quarta-Feira-de-Cinzas-2014-02-27.aspx")
 (:mic "BVMF" :from (2010 10 18) :to (2011 3 11) :kind :hours :gold ((10 0) nil nil (17 0)) :ours ((11 0) nil nil (18 0))
  :why "Brazilian summer time: 'a partir de 18 de outubro ... O pregão regular funcionará em sessão contínua, das 11h às 18h' (news 13/10/2010); back to 10h-17h from 14/03/2011 (news 11/03/2011). Gold starts 2011, so the effective run is 2011-01-03..2011-03-11."
  :source "http://web.archive.org/web/2010id_/http://www.bmfbovespa.com.br/pt-br/noticias/2010/BMFBOVESPA-divulga-novos-horarios-de-negociacao-nos-segmentos-de-acoes-e-derivativos-2010-10-13.aspx")
 (:mic "BVMF" :from (2011 10 17) :to (2012 3 9) :kind :hours :gold ((10 0) nil nil (17 0)) :ours ((11 0) nil nil (18 0))
  :why "'a partir de 17/10/2011 ... O pregão regular funcionará em sessão contínua, das 11h às 18h' (news 07/10/2011); 'O pregão regular volta a abrir às 10h a partir de 12/03' with 10h-17h (news 24/02/2012)."
  :source "http://web.archive.org/web/2011id_/http://www.bmfbovespa.com.br/pt-br/noticias/2011/BMFBOVESPA-tera-novos-horarios-de-negociacao-a-partir-de-1710-2011-10-07.aspx")
 (:mic "BVMF" :from (2015 12 21) :to (2016 3 11) :kind :hours :gold ((10 0) nil nil (17 0)) :ours ((10 0) nil nil (18 0))
  :why "'o horário de negociação no segmento Bovespa passará a ser das 10h às 18h do dia 21/12/2015 ao dia 11/03/2016' (news 26/11/2015, Ofício Circular 127/2015-DP not retrieved). Includes Ash Wednesday 2016-02-10 (late open 13:00 in both)."
  :source "http://web.archive.org/web/2015id_/http://www.bmfbovespa.com.br/pt-br/noticias/2015/Horario-de-verao-2015-11-26.aspx")
 (:mic "BVMF" :from (2018 2 14) :to (2018 2 14) :kind :hours :gold ((10 0) nil nil (17 0)) :ours ((10 0) nil nil (18 0))
  :why "Ash Wednesday 14/02/2018: 13h-17h55 continuous, closing call 17h55-18h (OC 008/2018-PRE). Regular grid on that day (late open 13:00 in both ec and B3) closes 18:00, i.e. an 18:00 close in the 2017/18 summer-time era; the era's start/end dates were not found (see BVMF-hours.md)."
  :source "https://www.b3.com.br/data/files/12/A3/6B/AB/75761610C2BD3316790D8AA8/OC%20008-2018-PRE%20-%20Horarios%20de%20Negociacao,%20de%20Pos-Negociacao%20e%20de%20Registro%20de%20Operacoes%2014022018.pdf")
 (:mic "BVMF" :from (2019 3 6) :to (2019 3 6) :kind :hours :gold ((10 0) nil nil (17 0)) :ours ((10 0) nil nil (18 0))
  :why "Ash Wednesday 06/03/2019: 13h-17h55, call 17h55-18h (OC 016/2019, 22/02/2019). Regular close 18:00 (late open 13:00 in both) before the US DST start (10/03/2019); era bounds not found."
  :source "https://www.b3.com.br/data/files/38/56/FE/B3/707196100FB88096AC094EA8/OC%20016-2019%20Hor%C3%A1rios%20de%20Negocia%C3%A7%C3%A3o,%20de%20P%C3%B3s-Negocia%C3%A7%C3%A3o,%20do%20Tesouro%20Direto%20e%20da%20Unidade%20de%20Financiamentos%20em%2006.03.19%20PT.pdf")
 (:mic "BVMF" :from (2022 3 14) :to (2022 11 4) :kind :hours :gold ((10 0) nil nil (18 0)) :ours ((10 0) nil nil (17 0))
  :why "US summer time: from 14/03/2022 mercado a vista 10:00-16:55 + closing call 16:55-17:00 (OC 020/2022-PRE; B3 news 14/03/2022 'voltam a terminar suas negociações às 17h'); back to 17:55/18:00 from 07/11/2022 (OC 125/2022-PRE)."
  :source "https://www.b3.com.br/data/files/40/B4/53/5E/BC4EE710301EBDE7AC094EA8/OC%20020-2022%20PRE%20Novos%20Hor%C3%A1rios%20de%20Negocia%C3%A7%C3%A3o%20(PT).pdf")
 (:mic "BVMF" :from (2025 3 10) :to (2025 10 31) :kind :hours :gold ((10 0) nil nil (18 0)) :ours ((10 0) nil nil (17 0))
  :why "From 10/03/2025 mercado a vista 10:00-16:55, call 16:55-17:00 (OC 014/2025-PRE; reaffirmed OC 017/2025-VNC from 30/06/2025); 10:00-17:55, call to 18:00 from 03/11/2025 (OC 040/2025-VNC, OC 043/2025-VNC)."
  :source "https://b3.com.br/data/files/63/C3/B3/53/16A1591029BEEC39AC094EA8/OC%20014-2025%20PRE%20Novos%20Horarios%20de%20Negociacao%202025%20vf%20(PT).pdf")
 (:mic "BVMF" :from (2026 3 9) :to (2026 10 30) :kind :hours :gold ((10 0) nil nil (18 0)) :ours ((10 0) nil nil (17 0))
  :why "From 09/03/2026 mercado à vista 10:00-16:55, call 16:55-17:00 (OC 005/2026-PRE Anexo 3); 10:00-17:55, call to 18:00 from 03/11/2026 (OC 050/2026-VNC, OC 055/2026-VNC; 02/11 is Finados)."
  :source "https://www.b3.com.br/data/files/E3/B2/C2/12/BC09C910F37907C9AC094EA8/OC%20005-2026%20PRE%20NOVOS%20HORARIOS%20DE%20NEGOCIACAO_PT.pdf")
 ;; XTSE
 ; XTSE: dates where the TMX/TSE source disagrees with exchange_calendars 4.13.3.
 ; Holidays 2000-2027: no disagreement. The TMX rules (XTSE.sexp) reproduce ec's closures exactly, including Family Day from 2008,
 ;   the Civic Holiday, the in-lieu Mondays/Tuesdays, Remembrance Day and NDTR as sessions, and 2001-09-11/12 as closed.

 (:mic "XTSE" :date (2001 12 24) :kind :early-close :gold nil :ours (13 0)
  :why "TSE Notice 2001-228 (27 Aug 2001): 'the Exchange will close at 1:00 p.m. on Monday, December 24th, 2001.'"
  :source "https://web.archive.org/web/2010id_/http://www.tsx.com:80/en/pdf/notices/2001/999016868__27Aug01.Holiday.Schedule..228.kd.pdf")
 (:mic "XTSE" :date (2002 12 24) :kind :early-close :gold nil :ours (13 0)
  :why "TSE Notice 2002-241 (13 Nov 2002): 'the Exchange will close at 1:00 p.m. (EST) on Tuesday, December 24th, 2002'; notice 2002-262 adds an extended (last-sale) session until 1:30 p.m."
  :source "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/November13-2002_ChristmasNewYearClosing-241.pdf")
 (:mic "XTSE" :date (2003 12 24) :kind :early-close :gold nil :ours (13 0)
  :why "TSX Notice 2003-173 (26 Nov 2003): 'the Exchange will close at 1:00 p.m. (EST) on Wednesday, December 24th, 2003', with a 30-minute last-sale session to 1:30 p.m."
  :source "https://web.archive.org/web/2010id_/http://www.tsx.com/en/pdf/notices/November26-2003_YearEndHolidayClosings-173.pdf")
 (:mic "XTSE" :date (2004 12 24) :kind :early-close :gold nil :ours (13 0)
  :why "TSX Notice 2004-036 (3 Dec 2004): 'will close at 1:00 PM on Friday, December 24, 2004, with an Extended Trading Session until 1:30 p.m.'"
  :source "https://web.archive.org/web/2005id_/http://www.tsx.com:80/en/pdf/notices/December3-2004_YearEndHolidaySettlementsBulletin-036.pdf")
 (:mic "XTSE" :date (2008 12 24) :kind :early-close :gold nil :ours (13 0)
  :why "TSX Group 'Stock Market Hours & Holidays' page (snapshot 2008-11-21): 'Christmas Eve - December 24, 2008 - markets close at 1:00 p.m. ET'."
  :source "https://web.archive.org/web/20081121id_/http://www.tsx.com/en/about_tsx/market_hours.html")
 ;; XSAU
 ; XSAU: dates where Tadawul / Saudi Exchange sources disagree with exchange_calendars 4.13.3 (gold 2021-2026).
 ; Pattern: ec reads the Saudi Exchange Holiday Calendar's "DD/MM/YYYY - DD/MM/YYYY" range literally as the
 ; closed days, but in most entries that range is (last trading day) - (resumption day); the entry text

 (:mic "XSAU" :date (2021 2 22) :kind :session :gold NIL :ours T
  :why "Founding Day became a holiday in 2022; Tadawul's 2021 calendar has no February holiday (first Founding Day entry is 22/02/2022)."
  :source "https://web.archive.org/web/20230401222718id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar")
 (:mic "XSAU" :date (2021 5 11) :kind :session :gold T :ours NIL
  :why "Eid Al-Fitr 2021: trading ends Monday 28/9/1442 = 10/5/2021, resumes Monday 5/10/1442 = 17/5/2021 (Tadawul Ramadan/Eid press release 2021-04-06; Argaam 2021-05-11 'closed ... starting from today, May 11')."
  :source "https://mondovisione.com/media-and-resources/news/trading-hours-during-the-holy-month-of-ramadan-eid-al-fiter-holiday-for-the-saud-202146/")
 (:mic "XSAU" :date (2021 5 12) :kind :session :gold T :ours NIL
  :why "Eid Al-Fitr 2021 closure 11-16 May (as above)."
  :source "https://mondovisione.com/media-and-resources/news/trading-hours-during-the-holy-month-of-ramadan-eid-al-fiter-holiday-for-the-saud-202146/")
 (:mic "XSAU" :date (2022 4 28) :kind :session :gold NIL :ours T
  :why "Eid Al-Fitr 2022: trading discontinues at the end of Thursday 28 April 2022, resumes Sunday 8 May 2022; 28 Apr is the last session."
  :source "https://mondovisione.com/media-and-resources/news/trading-hours-during-the-holy-month-of-ramadan-eid-al-fiter-holiday-for-the-saud-1-2022320")
 (:mic "XSAU" :date (2022 5 8) :kind :session :gold NIL :ours T
  :why "Eid Al-Fitr 2022: trading resumes Sunday 8 May 2022 (7 Shawwal 1443)."
  :source "https://mondovisione.com/media-and-resources/news/trading-hours-during-the-holy-month-of-ramadan-eid-al-fiter-holiday-for-the-saud-1-2022320")
 (:mic "XSAU" :date (2022 7 13) :kind :session :gold NIL :ours T
  :why "Eid Al-Adha 2022: 'Trading will discontinue at the end of trading day 6/7/2022. Trading will resume after the holiday on 13/7/2022.'"
  :source "https://web.archive.org/web/20230401222718id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar")
 (:mic "XSAU" :date (2022 9 22) :kind :session :gold T :ours NIL
  :why "National Day 2022 (23 Sep = Friday) observed Thursday: 'National Day of Saudi Arabia is on 22/9/2022.'"
  :source "https://web.archive.org/web/20230401222718id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar")
 (:mic "XSAU" :date (2023 4 25) :kind :session :gold NIL :ours T
  :why "Eid Al-Fitr 2023: 'discontinue at the end of trading day 17-04-2023. Trading will resume after the holiday on 25-04-2023.'"
  :source "https://web.archive.org/web/20230401222718id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar")
 (:mic "XSAU" :date (2023 6 25) :kind :session :gold T :ours NIL
  :why "Eid Al-Adha 2023 (final): 'discontinue at the end of trading day Thursday 22-06-2023 ... resume ... Sunday 02-07-2023'. ec follows the provisional entry (ends 26-06-2023)."
  :source "https://web.archive.org/web/20260719180652id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar")
 (:mic "XSAU" :date (2023 6 26) :kind :session :gold T :ours NIL
  :why "Eid Al-Adha 2023 closure 25-29 June (as above)."
  :source "https://web.archive.org/web/20260719180652id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar")
 (:mic "XSAU" :date (2023 7 2) :kind :session :gold NIL :ours T
  :why "Eid Al-Adha 2023: trading resumes Sunday 02-07-2023."
  :source "https://web.archive.org/web/20260719180652id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar")
 (:mic "XSAU" :date (2023 9 24) :kind :session :gold T :ours NIL
  :why "National Day 2023 (23 Sep = Saturday): 'Trading will discontinue at the end of trading day 21-09-2023. Trading will resume after the holiday on 25-09-2023.' Sunday 24 Sep closed."
  :source "https://web.archive.org/web/20260719180652id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar")
 (:mic "XSAU" :date (2024 4 14) :kind :session :gold NIL :ours T
  :why "Eid Al-Fitr 2024: 'Trading will discontinue at the end of trading day 04/04/2024. Trading will resume after the holiday on 14/04/2024.'"
  :source "https://web.archive.org/web/20250317103459id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar")
 (:mic "XSAU" :date (2024 4 15) :kind :session :gold NIL :ours T
  :why "Eid Al-Fitr 2024: trading resumed 14/04/2024, so 15 Apr is a session."
  :source "https://web.archive.org/web/20250317103459id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar")
 (:mic "XSAU" :date (2024 6 13) :kind :session :gold NIL :ours T
  :why "Eid Al-Adha 2024: 'Trading will discontinue at the end of trading day 13/06/2024.' (13 Jun is the last session)."
  :source "https://web.archive.org/web/20250317103459id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar")
 (:mic "XSAU" :date (2024 6 23) :kind :session :gold NIL :ours T
  :why "Eid Al-Adha 2024: 'Trading will resume after the holiday on 23/06/2024.'"
  :source "https://web.archive.org/web/20250317103459id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar")
 (:mic "XSAU" :date (2025 2 23) :kind :session :gold T :ours NIL
  :why "Founding Day 2025 (22 Feb = Saturday) observed Sunday: 'Founding Day of Saudi Arabia is on 23/02/2025.'; Argaam 2025-02-16: 'closed on Sunday, Feb. 23 ... resume on Monday, Feb. 24'."
  :source "https://web.archive.org/web/20250317103459id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar")
 (:mic "XSAU" :date (2025 3 27) :kind :session :gold NIL :ours T
  :why "Eid Al-Fitr 2025: 'Trading will discontinue at the end of trading day 27/03/2025. Trading will resume after the holiday on 03/04/2025.' (range printed 27/03/2025 - 02/04/2025)."
  :source "https://web.archive.org/web/20260719180652id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar")
 (:mic "XSAU" :date (2025 6 4) :kind :session :gold NIL :ours T
  :why "Eid Al-Adha 2025: 'Trading will discontinue at the end of trading day 04/06/2025.' (4 Jun is the last session)."
  :source "https://web.archive.org/web/20260719180652id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar")
 (:mic "XSAU" :date (2025 6 10) :kind :session :gold T :ours NIL
  :why "Eid Al-Adha 2025: 'Trading will resume after the holiday on 11/06/2025.' (range 05/06/2025 - 10/06/2025), so 10 Jun is closed."
  :source "https://web.archive.org/web/20260719180652id_/https://www.saudiexchange.sa/wps/portal/saudiexchange/about-saudi-exchange/exchange-media-centre/saudi-exchange-holiday-calendar")
 ;; XTAE
 (:mic "XTAE" :date (2013 1 22) :kind :session :gold t :ours nil
  :why "Knesset (19th) election day: TASE vacation schedule 2013 lists Election Day Tuesday 22 January as non-trading."
  :source "https://content.tase.co.il/media/pqrowxtp/file_0010_vacation_schedule_2013_eng.pdf")
 (:mic "XTAE" :date (2015 3 17) :kind :session :gold t :ours nil
  :why "Knesset (20th) election day: TASE vacation schedule 2015 lists Election Day Tuesday 17 March as non-trading."
  :source "https://content.tase.co.il/media/dp0kghj1/file_0010_vacation_schedule_2015_eng.pdf")
 (:mic "XTAE" :date (2018 10 30) :kind :session :gold t :ours nil
  :why "Municipal election day: TASE vacation schedule 2018 lists 'Israel Municipal Election Day' Tuesday 30 October as non-trading."
  :source "https://content.tase.co.il/media/fz0nyrzy/file_0010_vacation_schedule_2018_eng.pdf")
 (:mic "XTAE" :date (2020 6 7) :kind :session :gold t :ours nil
  :why "No trading on Sunday 7 June 2020: TASE management cancelled the trading day during a Histadrut-directed workers' sanction (Globes, 7 June 2020; secondary, no TASE notice found)."
  :source "https://en.globes.co.il/en/article-1001331393")
 (:mic "XTAE" :date (2024 2 27) :kind :session :gold t :ours nil
  :why "Municipal election day (postponed from 31 Oct 2023): market closed (Globes 26 Feb 2024: 'The market will be closed tomorrow for the municipal elections'; secondary, not in the TASE 2024 PDF)."
  :source "https://en.globes.co.il/en/article-1001472244")
 (:mic "XTAE" :date (2026 1 4) :kind :session :gold t :ours nil
  :why "First week of the Monday-Friday trading week: 'As of January 4th, 2026, the trading on TASE takes place Monday to Friday'; no Sunday session on 4 Jan 2026 (Globes 4 Jan 2026: 'From today, the trading week ... changes')."
  :source "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule")
 (:mic "XTAE" :date (2026 10 27) :kind :session :gold t :ours nil
  :why "Knesset election day: TASE vacation schedule 2026 lists 'Knesset Election Day' Tuesday 27 October as non-trading."
  :source "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule")
 (:mic "XTAE" :date (2028 3 10) :kind :session :gold t :ours nil
  :why "Friday before Purim on Sunday 12 March 2028: TASE vacation schedule 2028 lists Friday 10 March as non-trading ('*Friday before holiday Sunday is a non-trading day')."
  :source "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule")
 (:mic "XTAE" :date (2020 3 2) :kind :session :gold nil :ours t
  :why "Knesset election day 2020: exchange_calendars closes it. The TASE 2020 vacation schedule (created 2019-02-03, before the election was called) does not list it and no TASE notice was found; every other Knesset election day in the lists is a non-trading day, so the closure is likely. Kept as a session until a source is cited (follow-up issue)."
  :source "https://content.tase.co.il/media/hk4pgzy4/file_0010_vacation_schedule_2020_eng.pdf")
 (:mic "XTAE" :from (2013 1 1) :to (2013 6 13) :kind :hours :gold ((9 59) nil nil (17 15)) :ours ((9 45) nil nil (16 17))
  :why "2009-01-01..2013-06-13 timetable: TA-100 opening 09:45, pre-closing 16:16-16:17 (TASE notice of 2008-12-18). exchange_calendars has the 2020 hours throughout."
  :source "https://mondovisione.com/news/start-of-new-tel-aviv-stock-exchange-trading-hours-2011124")
 (:mic "XTAE" :from (2013 1 6) :to (2013 6 9) :kind :early-close :gold (15 40) :ours nil
  :why "Before 2013-06-16 Sunday hours were those of the other days (16:17 close); exchange_calendars has a 15:40 Sunday early close throughout."
  :source "https://mondovisione.com/news/start-of-new-tel-aviv-stock-exchange-trading-hours-2011124")
 (:mic "XTAE" :from (2013 6 16) :to (2020 1 26) :kind :early-close :gold (15 40) :ours nil
  :why "2013-06-16..2020-01-30: Sunday trading ends 16:15, as the era's regular Sunday hours (:sunday), not an early close (Globes 2013-05-23)."
  :source "https://en.globes.co.il/en/article-1000846491")
 (:mic "XTAE" :from (2013 6 16) :to (2020 1 26) :kind :hours :gold ((9 59) nil nil (17 15)) :ours ((9 45) nil nil (16 15))
  :why "Sundays 2013-06-16..2020-01-26: 09:45 opening, pre-closing 16:14-16:15 (Globes 2013-05-23; the 16:15 time is inferred from the 10-minute gap to the closing trade)."
  :source "https://en.globes.co.il/en/article-1000846491")
 (:mic "XTAE" :from (2013 6 17) :to (2020 1 30) :kind :hours :gold ((9 59) nil nil (17 15)) :ours ((9 45) nil nil (17 15))
  :why "Monday-Thursday 2013-06-17..2020-01-30: opening auction of index shares at 09:45; it moved to 10:00 (window 09:59-10:00) on 2020-02-02 (WFE Focus, Feb 2020)."
  :source "https://focus.world-exchanges.org/articles/tase-announces-new-trading-hours")
 (:mic "XTAE" :from (2020 2 2) :to (2020 3 1) :kind :early-close :gold (15 40) :ours nil
  :why "Sundays 2020-02-02..2020-03-01 still ended 16:15; the 15:40 Sunday close starts on 2020-03-08 (WFE Focus, Feb 2020)."
  :source "https://focus.world-exchanges.org/articles/tase-announces-new-trading-hours")
 (:mic "XTAE" :from (2020 2 2) :to (2020 3 1) :kind :hours :gold ((9 59) nil nil (17 15)) :ours ((9 59) nil nil (16 15))
  :why "Sundays 2020-02-02..2020-03-01: pre-closing 16:15 until the 35-minute shortening of 2020-03-08 (WFE Focus, Feb 2020)."
  :source "https://focus.world-exchanges.org/articles/tase-announces-new-trading-hours")
 (:mic "XTAE" :from (2020 3 8) :to (2025 12 28) :kind :early-close :gold (15 40) :ours nil
  :why "2020-03-08..2025-12-28: the 15:40 Sunday close is the era's regular Sunday hours (:sunday), not an early close; the session times agree with exchange_calendars."
  :source "https://focus.world-exchanges.org/articles/tase-announces-new-trading-hours")
 (:mic "XTAE" :from (2020 3 8) :to (2025 12 28) :kind :hours :gold ((9 59) nil nil (17 15)) :ours ((9 59) nil nil (15 40))
  :why "Sundays 2020-03-08..2025-12-28: regular Sunday hours 09:59-15:40 (WFE Focus, Feb 2020); exchange_calendars models the same day as 17:15 hours with a 15:40 early close."
  :source "https://focus.world-exchanges.org/articles/tase-announces-new-trading-hours")
 (:mic "XTAE" :from (2026 1 9) :to (2028 12 29) :kind :early-close :gold (13 50) :ours nil
  :why "Fridays from 2026-01-09: regular Friday hours (:friday), pre-closing 13:34-13:35; exchange_calendars gives 13:50, the end of trade-at-last, as an early close. Under this model's convention (close = end of continuous trading) the Friday close is 13:35."
  :source "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule")
 (:mic "XTAE" :from (2026 1 9) :to (2028 12 22) :kind :hours :gold ((9 59) nil nil (17 15)) :ours ((9 59) nil nil (13 35))
  :why "Fridays from 2026-01-09: regular Friday hours 09:59-13:35 (TASE vacation page: Friday pre-closing 13:34-13:35)."
  :source "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule")
 (:mic "XTAE" :from (2026 4 3) :to (2028 10 6) :kind :early-close :gold (14 15) :ours nil
  :why "Interim days of Passover / Sukkot that fall on a Friday keep the standard Friday hours from 2026 (TASE 2026 list: 'Trading hours on a Friday that falls during the interim days (e.g. April 3, 2026) will follow the standard Friday trading hours'); exchange_calendars gives the 14:15 interim close."
  :source "https://www.tase.co.il/en/content/knowledge_center/trading_vacation_schedule")
 (:mic "BVMF" :from (2020 3 9) :to (2024 11 1) :kind :hours :gold ((10 0) nil nil (18 0)) :ours ((10 0) nil nil (17 0))
  :why "From 2020 B3 closes at 17:00 while New York is on daylight time and at 18:00 on standard time (OC 094/2020-PRE, OC 020/2022-PRE, OC 027/2023-PRE, OC 132/2024-PRE, OC 014/2025-PRE, OC 005/2026-PRE); exchange_calendars keeps 18:00 from 2019-11-04 on. The 2020, 2021 and 2024 daylight-time eras are inferred from the pattern (their OCs were not retrieved)."
  :source "https://www.b3.com.br/pt_br/noticias/inicio-do-horario-de-verao-dos-estados-unidos.htm")
 (:mic "BVMF" :date (2015 2 18) :kind :late-open :gold nil :ours (13 0)
  :why "Ash Wednesday: B3 opens at 13:00 in every year evidenced, 2011-2014 and 2016-2026 (notices in calendars/BVMF.sexp); the 2015 notice is in the web.archive.org index but would not fetch, so the rule is applied unverified. exchange_calendars starts the late open in 2016."
  :source "http://web.archive.org/web/2015id_/http://www.bmfbovespa.com.br/pt-br/noticias/2015/Horario-de-verao-2015-11-26.aspx")
 (:mic "XTSE" :date (2007 12 24) :kind :early-close :gold nil :ours (13 0)
  :why "Christmas Eve on a weekday closes at 13:00 in every year a TSE/TSX notice was found (2001-2004, 2008, 2010, 2012-2015, 2018-2021, 2024-2027); no notice was found for this year, so the rule is applied. exchange_calendars has a full day."
  :source "https://web.archive.org/web/20081121id_/http://www.tsx.com/en/about_tsx/market_hours.html")
 (:mic "XTSE" :date (2009 12 24) :kind :early-close :gold nil :ours (13 0)
  :why "Christmas Eve on a weekday closes at 13:00 in every year a TSE/TSX notice was found (2001-2004, 2008, 2010, 2012-2015, 2018-2021, 2024-2027); no notice was found for this year, so the rule is applied. exchange_calendars has a full day."
  :source "https://web.archive.org/web/20081121id_/http://www.tsx.com/en/about_tsx/market_hours.html")
 ;; CME Group (#48): XCME equity, XCBT grains, XCEC metals, XNYM energy against exchange_calendars CMES
 (:mic "XCBT" :date (2009 1 2) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((9 30) nil nil (13 15))
  :why "CME Globex New Year's holiday schedule 2009: grains trades ((9 30) nil nil (13 15)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20130309115356/http://www.cmegroup.com/tools-information/holiday-calendar/files/2009-holiday-calendars.zip")
 (:mic "XCBT" :date (2011 12 27) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((9 30) nil nil (13 15))
  :why "CME Globex Christmas holiday schedule 2011: grains trades ((9 30) nil nil (13 15)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCBT" :date (2012 1 3) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((9 30) nil nil (13 15))
  :why "CME Globex New Year's holiday schedule 2012: grains trades ((9 30) nil nil (13 15)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20130309115256/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-holiday-calendars.zip")
 (:mic "XCBT" :from (2009 1 5) :to (2012 5 11) :kind :hours
  :gold ((17 0) nil nil (16 0)) :ours ((18 0) (7 15) (9 30) (13 15))
  :why "exchange_calendars CMES gives every CME Group product one 17:00-16:00 CT day; the CME Globex holiday schedules give the grains regular session of this era (hours file eras, cited per era)."
  :source "https://web.archive.org/web/20171210124214/http://www.cmegroup.com:80/tools-information/holiday-calendar.html")
 (:mic "XCBT" :from (2012 5 14) :to (2013 4 5) :kind :hours
  :gold ((17 0) nil nil (16 0)) :ours ((19 0) nil nil (14 0))
  :why "exchange_calendars CMES gives every CME Group product one 17:00-16:00 CT day; the CME Globex holiday schedules give the grains regular session of this era (hours file eras, cited per era)."
  :source "https://web.archive.org/web/20171210124214/http://www.cmegroup.com:80/tools-information/holiday-calendar.html")
 (:mic "XCBT" :date (2012 7 5) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((9 30) nil nil (14 0))
  :why "CME Globex Memorial Day holiday schedule 2012: grains trades ((9 30) nil nil (14 0)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20120915003402/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-4th-of-july.xls")
 (:mic "XCBT" :date (2012 12 26) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((9 30) nil nil (14 0))
  :why "CME Globex Christmas holiday schedule 2012: grains trades ((9 30) nil nil (14 0)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20120107060254/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-christmas.pdf")
 (:mic "XCBT" :date (2013 1 2) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((9 30) nil nil (14 0))
  :why "CME Globex New Year's holiday schedule 2013: grains trades ((9 30) nil nil (14 0)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20130309115301/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-martin-luther-king.xls")
 (:mic "XCBT" :from (2013 4 8) :to (2015 5 26) :kind :hours
  :gold ((17 0) nil nil (16 0)) :ours ((19 0) (7 45) (8 30) (13 15))
  :why "exchange_calendars CMES gives every CME Group product one 17:00-16:00 CT day; the CME Globex holiday schedules give the grains regular session of this era (hours file eras, cited per era)."
  :source "https://web.archive.org/web/20171210124214/http://www.cmegroup.com:80/tools-information/holiday-calendar.html")
 (:mic "XCBT" :date (2013 7 5) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 15))
  :why "CME Globex Independence Day holiday schedule 2013: grains trades ((8 30) nil nil (13 15)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCBT" :date (2013 12 26) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 15))
  :why "CME Globex Christmas holiday schedule 2013: grains trades ((8 30) nil nil (13 15)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCBT" :date (2014 1 2) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 15))
  :why "CME Globex Christmas holiday schedule 2013: grains trades ((8 30) nil nil (13 15)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCBT" :date (2014 7 7) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 15))
  :why "CME Globex Independence Day holiday schedule 2014: grains trades ((8 30) nil nil (13 15)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XCBT" :date (2014 12 26) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 15))
  :why "CME Globex Christmas holiday schedule 2014: grains trades ((8 30) nil nil (13 15)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XCBT" :date (2015 1 2) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 15))
  :why "CME Globex New Year's holiday schedule 2015: grains trades ((8 30) nil nil (13 15)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20140326160333/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-new-years-holiday-schedule.xls")
 (:mic "XCBT" :date (2013 11 29) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (12 0))
  :why "CME Globex Thanksgiving holiday schedule 2013: grains trades ((8 30) nil nil (12 0)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCBT" :date (2014 11 28) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (12 0))
  :why "CME Globex Thanksgiving holiday schedule 2014: grains trades ((8 30) nil nil (12 0)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XCBT" :from (2015 5 27) :to (2027 12 31) :kind :hours
  :gold ((17 0) nil nil (16 0)) :ours ((19 0) (7 45) (8 30) (13 20))
  :why "exchange_calendars CMES gives every CME Group product one 17:00-16:00 CT day; the CME Globex holiday schedules give the grains regular session of this era (hours file eras, cited per era)."
  :source "https://web.archive.org/web/20171210124214/http://www.cmegroup.com:80/tools-information/holiday-calendar.html")
 (:mic "XCBT" :date (2015 11 27) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (12 5))
  :why "CME Globex Thanksgiving holiday schedule 2015: grains trades ((8 30) nil nil (12 5)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip")
 (:mic "XCBT" :date (2016 11 25) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (12 5))
  :why "CME Globex Thanksgiving holiday schedule 2016: grains trades ((8 30) nil nil (12 5)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip")
 (:mic "XCBT" :date (2017 11 24) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (12 5))
  :why "CME Globex Thanksgiving holiday schedule 2017: grains trades ((8 30) nil nil (12 5)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip")
 (:mic "XCBT" :date (2018 11 23) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (12 5))
  :why "CME Globex Thanksgiving holiday schedule 2018: grains trades ((8 30) nil nil (12 5)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip")
 (:mic "XCBT" :date (2019 11 29) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (12 5))
  :why "CME Globex Thanksgiving holiday schedule 2019: grains trades ((8 30) nil nil (12 5)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip")
 (:mic "XCBT" :date (2020 11 27) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (12 5))
  :why "CME Globex Thanksgiving holiday schedule 2020: grains trades ((8 30) nil nil (12 5)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20201125140635/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-thanksgiving-schedule.xls")
 (:mic "XCBT" :date (2021 11 26) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (12 5))
  :why "CME Globex Thanksgiving holiday schedule 2021: grains trades ((8 30) nil nil (12 5)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20220917175604/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-thanksgiving-holiday-schedule.xls")
 (:mic "XCBT" :date (2022 11 25) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (12 5))
  :why "CME Globex Thanksgiving holiday schedule 2022: grains trades ((8 30) nil nil (12 5)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20220704065423/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-thanksgiving-holiday-schedule.xls")
 (:mic "XCBT" :date (2016 7 5) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 20))
  :why "CME Globex Independence Day holiday schedule 2016: grains trades ((8 30) nil nil (13 20)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip")
 (:mic "XCBT" :date (2017 7 5) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 20))
  :why "CME Globex Independence Day holiday schedule 2017: grains trades ((8 30) nil nil (13 20)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip")
 (:mic "XCBT" :date (2017 12 26) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 20))
  :why "CME Globex Christmas holiday schedule 2017: grains trades ((8 30) nil nil (13 20)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip")
 (:mic "XCBT" :date (2018 1 2) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 20))
  :why "CME Globex New Year's holiday schedule 2018: grains trades ((8 30) nil nil (13 20)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip")
 (:mic "XCBT" :date (2018 7 5) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 20))
  :why "CME Globex Independence Day holiday schedule 2018: grains trades ((8 30) nil nil (13 20)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip")
 (:mic "XCBT" :date (2018 12 26) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 20))
  :why "CME Globex Christmas holiday schedule 2018: grains trades ((8 30) nil nil (13 20)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip")
 (:mic "XCBT" :date (2019 1 2) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 20))
  :why "CME Globex New Year's holiday schedule 2019: grains trades ((8 30) nil nil (13 20)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip")
 (:mic "XCBT" :date (2019 7 5) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 20))
  :why "CME Globex Independence Day holiday schedule 2019: grains trades ((8 30) nil nil (13 20)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip")
 (:mic "XCBT" :date (2019 12 26) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 20))
  :why "CME Globex Christmas holiday schedule 2019: grains trades ((8 30) nil nil (13 20)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20201111233949/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-christmas-holiday-schedule.xls")
 (:mic "XCBT" :date (2020 1 2) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 20))
  :why "CME Globex New Year's holiday schedule 2020: grains trades ((8 30) nil nil (13 20)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip")
 (:mic "XCBT" :date (2021 7 6) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 20))
  :why "CME Globex Independence Day holiday schedule 2021: grains trades ((8 30) nil nil (13 20)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20260830100327/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-holiday-calendars.zip")
 (:mic "XCBT" :date (2022 7 5) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 20))
  :why "CME Globex Independence Day holiday schedule 2022: grains trades ((8 30) nil nil (13 20)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20220704065450/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-independence-day-holiday-schedule.xls")
 (:mic "XCBT" :date (2023 11 24) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 20))
  :why "CME Globex holiday schedule: grains trades ((8 30) nil nil (13 20)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XCBT" :date (2024 11 29) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 20))
  :why "CME Globex holiday schedule: grains trades ((8 30) nil nil (13 20)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCBT" :date (2025 11 28) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 20))
  :why "CME Globex holiday schedule: grains trades ((8 30) nil nil (13 20)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCBT" :date (2026 11 27) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 20))
  :why "CME Globex holiday schedule: grains trades ((8 30) nil nil (13 20)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCBT" :date (2027 11 26) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((8 30) nil nil (13 20))
  :why "CME Globex holiday schedule: grains trades ((8 30) nil nil (13 20)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCEC" :from (2009 1 2) :to (2015 9 8) :kind :hours
  :gold ((17 0) nil nil (16 0)) :ours ((17 0) nil nil (16 15))
  :why "exchange_calendars CMES gives every CME Group product one 17:00-16:00 CT day; the CME Globex holiday schedules give the metals regular session of this era (hours file eras, cited per era)."
  :source "https://web.archive.org/web/20171210124214/http://www.cmegroup.com:80/tools-information/holiday-calendar.html")
 (:mic "XCME" :date (2009 1 2) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((5 0) nil nil (15 15))
  :why "CME Globex New Year's holiday schedule 2009: equity trades ((5 0) nil nil (15 15)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20130309115356/http://www.cmegroup.com/tools-information/holiday-calendar/files/2009-holiday-calendars.zip")
 (:mic "XCME" :date (2011 12 27) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((5 0) nil nil (15 15))
  :why "CME Globex Christmas holiday schedule 2011: equity trades ((5 0) nil nil (15 15)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCME" :date (2012 1 3) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((5 0) nil nil (15 15))
  :why "CME Globex New Year's holiday schedule 2012: equity trades ((5 0) nil nil (15 15)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20130309115256/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-holiday-calendars.zip")
 (:mic "XCME" :date (2012 12 26) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((5 0) nil nil (15 15))
  :why "CME Globex Christmas holiday schedule 2012: equity trades ((5 0) nil nil (15 15)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20120107060254/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-christmas.pdf")
 (:mic "XCME" :from (2009 1 5) :to (2012 12 24) :kind :hours
  :gold ((17 0) nil nil (16 0)) :ours ((17 0) nil nil (15 15))
  :why "exchange_calendars CMES gives every CME Group product one 17:00-16:00 CT day; the CME Globex holiday schedules give the equity regular session of this era (hours file eras, cited per era)."
  :source "https://web.archive.org/web/20171210124214/http://www.cmegroup.com:80/tools-information/holiday-calendar.html")
 (:mic "XCME" :from (2012 12 27) :to (2015 9 8) :kind :hours
  :gold ((17 0) nil nil (16 0)) :ours ((17 0) nil nil (16 15))
  :why "exchange_calendars CMES gives every CME Group product one 17:00-16:00 CT day; the CME Globex holiday schedules give the equity regular session of this era (hours file eras, cited per era)."
  :source "https://web.archive.org/web/20171210124214/http://www.cmegroup.com:80/tools-information/holiday-calendar.html")
 (:mic "XCME" :date (2013 1 2) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((5 0) nil nil (16 15))
  :why "CME Globex New Year's holiday schedule 2013: equity trades ((5 0) nil nil (16 15)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20130309115301/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-martin-luther-king.xls")
 (:mic "XCME" :date (2013 12 26) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((5 0) nil nil (16 15))
  :why "CME Globex Christmas holiday schedule 2013: equity trades ((5 0) nil nil (16 15)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCME" :date (2014 1 2) :kind :hours :gold ((17 0) nil nil (16 0)) :ours ((5 0) nil nil (16 15))
  :why "CME Globex Christmas holiday schedule 2013: equity trades ((5 0) nil nil (16 15)) that day (a late open with no overnight session, or the day's own hours); CMES keeps 17:00-16:00."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XNYM" :from (2009 1 2) :to (2015 9 8) :kind :hours
  :gold ((17 0) nil nil (16 0)) :ours ((17 0) nil nil (16 15))
  :why "exchange_calendars CMES gives every CME Group product one 17:00-16:00 CT day; the CME Globex holiday schedules give the energy regular session of this era (hours file eras, cited per era)."
  :source "https://web.archive.org/web/20171210124214/http://www.cmegroup.com:80/tools-information/holiday-calendar.html")
 (:mic "XCBT" :date (2009 1 19) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Martin Luther King Jr. Day); CMES has a session."
  :source "https://web.archive.org/web/20090126144353/http://cmegroup.com:80/tools-information/holiday-calendar/files/2009-martin-luther-king.pdf")
 (:mic "XCBT" :date (2009 2 16) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Presidents Day); CMES has a session."
  :source "https://web.archive.org/web/20090206002053/http://cmegroup.com:80/tools-information/holiday-calendar/files/2009-presidents-day.pdf")
 (:mic "XCBT" :date (2009 5 25) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Memorial Day); CMES has a session."
  :source "https://web.archive.org/web/20090611163557/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-memorial-day.pdf")
 (:mic "XCBT" :date (2009 7 3) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Independence Day); CMES has a session."
  :source "https://web.archive.org/web/20090612061133/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-4th-of-july.pdf")
 (:mic "XCBT" :date (2009 9 7) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Labor Day); CMES has a session."
  :source "https://web.archive.org/web/20091007030433/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-labor-day.pdf")
 (:mic "XCBT" :date (2009 11 26) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Thanksgiving Day); CMES has a session."
  :source "https://web.archive.org/web/20130309115356/http://www.cmegroup.com/tools-information/holiday-calendar/files/2009-holiday-calendars.zip")
 (:mic "XCBT" :date (2010 1 18) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Martin Luther King Jr. Day); CMES has a session."
  :source "https://web.archive.org/web/20100331064226/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-martin-luther-king.pdf")
 (:mic "XCBT" :date (2010 2 15) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Presidents Day); CMES has a session."
  :source "https://web.archive.org/web/20100215064641/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-presidents-day.pdf")
 (:mic "XCBT" :date (2010 5 31) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Memorial Day); CMES has a session."
  :source "https://web.archive.org/web/20100601094225/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-memorial-day.pdf")
 (:mic "XCBT" :date (2010 7 5) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Independence Day); CMES has a session."
  :source "https://web.archive.org/web/20100602005637/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-4th-of-july.pdf")
 (:mic "XCBT" :date (2010 9 6) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Labor Day); CMES has a session."
  :source "https://web.archive.org/web/20100602005641/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-labor-day.pdf")
 (:mic "XCBT" :date (2010 11 25) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Thanksgiving Day); CMES has a session."
  :source "https://web.archive.org/web/20101122094012/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-thanksgiving.pdf")
 (:mic "XCBT" :date (2010 12 31) :kind :early-close :gold nil :ours (12 0)
  :why "CME Globex New Year's holiday schedule 2011: grains closes 12:00 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20101214061245/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2011-new-years.pdf")
 (:mic "XCBT" :date (2011 1 17) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Martin Luther King Jr. Day); CMES has a session."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCBT" :date (2011 2 21) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Presidents Day); CMES has a session."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCBT" :date (2011 5 30) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Memorial Day); CMES has a session."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCBT" :date (2011 7 4) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Independence Day); CMES has a session."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCBT" :date (2011 9 5) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Labor Day); CMES has a session."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCBT" :date (2011 11 10) :kind :session :gold t :ours nil
  :why "CME Globex Veterans Day holiday schedule 2011: grains closed (Veterans Day); CMES has a session."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCBT" :date (2011 11 24) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Thanksgiving Day); CMES has a session."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCBT" :date (2012 1 16) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Martin Luther King Jr. Day); CMES has a session."
  :source "https://web.archive.org/web/20120105160459/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2012-martin-luther-king.pdf")
 (:mic "XCBT" :date (2012 2 20) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Presidents Day); CMES has a session."
  :source "https://web.archive.org/web/20120107064434/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-presidents-day.pdf")
 (:mic "XCBT" :date (2012 5 28) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Memorial Day); CMES has a session."
  :source "https://web.archive.org/web/20120915003402/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-4th-of-july.xls")
 (:mic "XCBT" :date (2012 7 3) :kind :early-close :gold nil :ours (12 0)
  :why "CME Globex Memorial Day holiday schedule 2012: grains closes 12:00 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20120915003402/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-4th-of-july.xls")
 (:mic "XCBT" :date (2012 7 4) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Independence Day); CMES has a session."
  :source "https://web.archive.org/web/20120915003402/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-4th-of-july.xls")
 (:mic "XCBT" :date (2012 9 3) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Labor Day); CMES has a session."
  :source "https://web.archive.org/web/20120915003609/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-labor-day.xls")
 (:mic "XCBT" :date (2012 11 22) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Thanksgiving Day); CMES has a session."
  :source "https://web.archive.org/web/20111125001004/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2012-thanksgiving.pdf")
 (:mic "XCBT" :date (2013 1 21) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Martin Luther King Jr. Day); CMES has a session."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCBT" :date (2013 2 18) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Presidents Day); CMES has a session."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCBT" :date (2013 5 27) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Memorial Day); CMES has a session."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCBT" :date (2013 7 3) :kind :early-close :gold nil :ours (12 0)
  :why "CME Globex Independence Day holiday schedule 2013: grains closes 12:00 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCBT" :date (2013 7 4) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Independence Day); CMES has a session."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCBT" :date (2013 9 2) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Labor Day); CMES has a session."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCBT" :date (2013 11 28) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Thanksgiving Day); CMES has a session."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCBT" :date (2013 11 29) :kind :early-close :gold (12 0) :ours nil
  :why "CME Globex Thanksgiving holiday schedule 2013: grains no early close; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCBT" :date (2014 1 20) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Martin Luther King Jr. Day); CMES has a session."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XCBT" :date (2014 2 17) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Presidents Day); CMES has a session."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XCBT" :date (2014 5 26) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Memorial Day); CMES has a session."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XCBT" :date (2014 7 3) :kind :early-close :gold nil :ours (12 0)
  :why "CME Globex Independence Day holiday schedule 2014: grains closes 12:00 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XCBT" :date (2014 7 4) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Independence Day); CMES has a session."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XCBT" :date (2014 9 1) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Labor Day); CMES has a session."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XCBT" :date (2014 11 27) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Thanksgiving Day); CMES has a session."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XCBT" :date (2014 11 28) :kind :early-close :gold (12 0) :ours nil
  :why "CME Globex Thanksgiving holiday schedule 2014: grains no early close; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XCBT" :date (2015 1 19) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Martin Luther King Jr. Day); CMES has a session."
  :source "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip")
 (:mic "XCBT" :date (2015 2 16) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Presidents Day); CMES has a session."
  :source "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip")
 (:mic "XCBT" :date (2015 5 25) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Memorial Day); CMES has a session."
  :source "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip")
 (:mic "XCBT" :date (2015 7 2) :kind :early-close :gold nil :ours (12 0)
  :why "CME Globex Independence Day holiday schedule 2015: grains closes 12:00 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip")
 (:mic "XCBT" :date (2015 7 3) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Independence Day); CMES has a session."
  :source "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip")
 (:mic "XCBT" :date (2015 9 7) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Labor Day); CMES has a session."
  :source "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip")
 (:mic "XCBT" :date (2015 11 26) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Thanksgiving Day); CMES has a session."
  :source "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip")
 (:mic "XCBT" :date (2015 11 27) :kind :early-close :gold (12 0) :ours nil
  :why "CME Globex Thanksgiving holiday schedule 2015: grains no early close; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip")
 (:mic "XCBT" :date (2015 12 24) :kind :early-close :gold (12 0) :ours (12 5)
  :why "CME Globex Christmas holiday schedule 2015: grains closes 12:05 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip")
 (:mic "XCBT" :date (2016 1 18) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Martin Luther King Jr. Day); CMES has a session."
  :source "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip")
 (:mic "XCBT" :date (2016 2 15) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Presidents Day); CMES has a session."
  :source "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip")
 (:mic "XCBT" :date (2016 5 30) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Memorial Day); CMES has a session."
  :source "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip")
 (:mic "XCBT" :date (2016 7 4) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Independence Day); CMES has a session."
  :source "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip")
 (:mic "XCBT" :date (2016 9 5) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Labor Day); CMES has a session."
  :source "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip")
 (:mic "XCBT" :date (2016 11 24) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Thanksgiving Day); CMES has a session."
  :source "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip")
 (:mic "XCBT" :date (2016 11 25) :kind :early-close :gold (12 0) :ours nil
  :why "CME Globex Thanksgiving holiday schedule 2016: grains no early close; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip")
 (:mic "XCBT" :date (2016 12 23) :kind :early-close :gold nil :ours (12 5)
  :why "CME Globex Christmas holiday schedule 2016: grains closes 12:05 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip")
 (:mic "XCBT" :date (2017 1 16) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Martin Luther King Jr. Day); CMES has a session."
  :source "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip")
 (:mic "XCBT" :date (2017 2 20) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Presidents Day); CMES has a session."
  :source "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip")
 (:mic "XCBT" :date (2017 5 29) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Memorial Day); CMES has a session."
  :source "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip")
 (:mic "XCBT" :date (2017 7 3) :kind :early-close :gold nil :ours (12 5)
  :why "CME Globex Independence Day holiday schedule 2017: grains closes 12:05 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip")
 (:mic "XCBT" :date (2017 7 4) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Independence Day); CMES has a session."
  :source "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip")
 (:mic "XCBT" :date (2017 9 4) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Labor Day); CMES has a session."
  :source "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip")
 (:mic "XCBT" :date (2017 11 23) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Thanksgiving Day); CMES has a session."
  :source "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip")
 (:mic "XCBT" :date (2017 11 24) :kind :early-close :gold (12 0) :ours nil
  :why "CME Globex Thanksgiving holiday schedule 2017: grains no early close; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip")
 (:mic "XCBT" :date (2017 12 22) :kind :early-close :gold nil :ours (12 5)
  :why "CME Globex Christmas holiday schedule 2017: grains closes 12:05 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip")
 (:mic "XCBT" :date (2018 1 15) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Martin Luther King Jr. Day); CMES has a session."
  :source "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip")
 (:mic "XCBT" :date (2018 2 19) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Presidents Day); CMES has a session."
  :source "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip")
 (:mic "XCBT" :date (2018 5 28) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Memorial Day); CMES has a session."
  :source "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip")
 (:mic "XCBT" :date (2018 7 3) :kind :early-close :gold nil :ours (12 5)
  :why "CME Globex Independence Day holiday schedule 2018: grains closes 12:05 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip")
 (:mic "XCBT" :date (2018 7 4) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Independence Day); CMES has a session."
  :source "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip")
 (:mic "XCBT" :date (2018 9 3) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Labor Day); CMES has a session."
  :source "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip")
 (:mic "XCBT" :date (2018 11 22) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Thanksgiving Day); CMES has a session."
  :source "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip")
 (:mic "XCBT" :date (2018 11 23) :kind :early-close :gold (12 0) :ours nil
  :why "CME Globex Thanksgiving holiday schedule 2018: grains no early close; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip")
 (:mic "XCBT" :date (2018 12 5) :kind :session :gold nil :ours t
  :why "CME Group press release, 2 Dec 2018: only U.S. equity and interest-rate products close for the National Day of Mourning; \"All other markets on CME Globex ... will remain open for regular trading hours\": grains trades; CMES has no session."
  :source "https://web.archive.org/web/20181205161404/https://www.cmegroup.com/media-room/press-releases/2018/12/02/cme_group_u_s_equityinterestratemarketstoclosefornationaldayofmo.html")
 (:mic "XCBT" :date (2018 12 24) :kind :early-close :gold (12 0) :ours (12 5)
  :why "CME Globex Christmas holiday schedule 2018: grains closes 12:05 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip")
 (:mic "XCBT" :date (2019 1 21) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Martin Luther King Jr. Day); CMES has a session."
  :source "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip")
 (:mic "XCBT" :date (2019 2 18) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Presidents Day); CMES has a session."
  :source "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip")
 (:mic "XCBT" :date (2019 5 27) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Memorial Day); CMES has a session."
  :source "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip")
 (:mic "XCBT" :date (2019 7 3) :kind :early-close :gold nil :ours (12 5)
  :why "CME Globex Independence Day holiday schedule 2019: grains closes 12:05 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip")
 (:mic "XCBT" :date (2019 7 4) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Independence Day); CMES has a session."
  :source "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip")
 (:mic "XCBT" :date (2019 9 2) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Labor Day); CMES has a session."
  :source "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip")
 (:mic "XCBT" :date (2019 11 28) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Thanksgiving Day); CMES has a session."
  :source "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip")
 (:mic "XCBT" :date (2019 11 29) :kind :early-close :gold (12 0) :ours nil
  :why "CME Globex Thanksgiving holiday schedule 2019: grains no early close; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip")
 (:mic "XCBT" :date (2019 12 24) :kind :early-close :gold (12 0) :ours (12 5)
  :why "CME Globex Christmas holiday schedule 2019: grains closes 12:05 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20201111233949/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-christmas-holiday-schedule.xls")
 (:mic "XCBT" :date (2020 1 20) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Martin Luther King Jr. Day); CMES has a session."
  :source "https://web.archive.org/web/20260815194202/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-mlk-day-schedule.xls")
 (:mic "XCBT" :date (2020 2 17) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Presidents Day); CMES has a session."
  :source "https://web.archive.org/web/20260730111834/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-holiday-calendars.zip")
 (:mic "XCBT" :date (2020 5 25) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Memorial Day); CMES has a session."
  :source "https://web.archive.org/web/20221226124229/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-memorial-day-schedule.xls")
 (:mic "XCBT" :date (2020 7 2) :kind :early-close :gold nil :ours (12 5)
  :why "CME Globex Independence Day holiday schedule 2020: grains closes 12:05 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20220707015539/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-independence-day-schedule.xls")
 (:mic "XCBT" :date (2020 7 3) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Independence Day); CMES has a session."
  :source "https://web.archive.org/web/20220707015539/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-independence-day-schedule.xls")
 (:mic "XCBT" :date (2020 9 7) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Labor Day); CMES has a session."
  :source "https://web.archive.org/web/20210126094838/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-labor-day-schedule.xls")
 (:mic "XCBT" :date (2020 11 26) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Thanksgiving Day); CMES has a session."
  :source "https://web.archive.org/web/20201125140635/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-thanksgiving-schedule.xls")
 (:mic "XCBT" :date (2020 11 27) :kind :early-close :gold (12 0) :ours nil
  :why "CME Globex Thanksgiving holiday schedule 2020: grains no early close; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20201125140635/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-thanksgiving-schedule.xls")
 (:mic "XCBT" :date (2020 12 24) :kind :early-close :gold (12 0) :ours (12 5)
  :why "CME Globex Christmas holiday schedule 2020: grains closes 12:05 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20260730111834/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-holiday-calendars.zip")
 (:mic "XCBT" :date (2021 1 18) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Martin Luther King Jr. Day); CMES has a session."
  :source "https://web.archive.org/web/20260830100327/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-holiday-calendars.zip")
 (:mic "XCBT" :date (2021 2 15) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Presidents Day); CMES has a session."
  :source "https://web.archive.org/web/20210214015315/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-presidents-day-holiday-schedule.xls")
 (:mic "XCBT" :date (2021 5 31) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Memorial Day); CMES has a session."
  :source "https://web.archive.org/web/20220917171238/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-memorial-day-holiday-schedule.xls")
 (:mic "XCBT" :date (2021 7 5) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Independence Day); CMES has a session."
  :source "https://web.archive.org/web/20260830100327/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-holiday-calendars.zip")
 (:mic "XCBT" :date (2021 9 6) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Labor Day); CMES has a session."
  :source "https://web.archive.org/web/20260830100327/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-holiday-calendars.zip")
 (:mic "XCBT" :date (2021 11 25) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Thanksgiving Day); CMES has a session."
  :source "https://web.archive.org/web/20220917175604/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-thanksgiving-holiday-schedule.xls")
 (:mic "XCBT" :date (2021 11 26) :kind :early-close :gold (12 0) :ours nil
  :why "CME Globex Thanksgiving holiday schedule 2021: grains no early close; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220917175604/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-thanksgiving-holiday-schedule.xls")
 (:mic "XCBT" :date (2022 1 17) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Martin Luther King Jr. Day); CMES has a session."
  :source "https://web.archive.org/web/20220117212230/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-mlk-day-holiday-schedule.xls")
 (:mic "XCBT" :date (2022 2 21) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Presidents Day); CMES has a session."
  :source "https://web.archive.org/web/20220704073810/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-presidents-day-holiday-schedule.xls")
 (:mic "XCBT" :date (2022 5 30) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Memorial Day); CMES has a session."
  :source "https://web.archive.org/web/20220704065438/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-memorial-day-holiday-schedule.xls")
 (:mic "XCBT" :date (2022 6 20) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Juneteenth); CMES has a session."
  :source "https://web.archive.org/web/20220620200210/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-juneteenth-holiday-schedule.xls")
 (:mic "XCBT" :date (2022 7 4) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Independence Day); CMES has a session."
  :source "https://web.archive.org/web/20220704065450/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-independence-day-holiday-schedule.xls")
 (:mic "XCBT" :date (2022 9 5) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Labor Day); CMES has a session."
  :source "https://web.archive.org/web/20220704065441/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-labor-day-holiday-schedule.xls")
 (:mic "XCBT" :date (2022 11 24) :kind :session :gold t :ours nil
  :why "CME Globex holiday schedule: grains closed (Thanksgiving Day); CMES has a session."
  :source "https://web.archive.org/web/20220704065423/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-thanksgiving-holiday-schedule.xls")
 (:mic "XCBT" :date (2022 11 25) :kind :early-close :gold (12 0) :ours nil
  :why "CME Globex Thanksgiving holiday schedule 2022: grains no early close; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220704065423/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-thanksgiving-holiday-schedule.xls")
 (:mic "XCBT" :date (2023 1 16) :kind :session :gold t :ours nil
  :why "CME Clearing holiday advisories 2023: grains closed (Martin Luther King Jr. Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XCBT" :date (2023 2 20) :kind :session :gold t :ours nil
  :why "CME Clearing holiday advisories 2023: grains closed (Presidents Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XCBT" :date (2023 5 29) :kind :session :gold t :ours nil
  :why "CME Clearing holiday advisories 2023: grains closed (Memorial Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XCBT" :date (2023 6 19) :kind :session :gold t :ours nil
  :why "CME Clearing holiday advisories 2023: grains closed (Juneteenth); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XCBT" :date (2023 7 4) :kind :session :gold t :ours nil
  :why "CME Clearing holiday advisories 2023: grains closed (Independence Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XCBT" :date (2023 9 4) :kind :session :gold t :ours nil
  :why "CME Clearing holiday advisories 2023: grains closed (Labor Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XCBT" :date (2023 11 23) :kind :session :gold t :ours nil
  :why "CME Clearing holiday advisories 2023: grains closed (Thanksgiving Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XCBT" :date (2023 11 24) :kind :early-close :gold (12 0) :ours (12 5)
  :why "CME Clearing holiday advisories 2023: grains closes 12:05 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XCBT" :date (2024 1 15) :kind :session :gold t :ours nil
  :why "CME Clearing holiday advisories 2024: grains closed (Martin Luther King Jr. Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCBT" :date (2024 2 19) :kind :session :gold t :ours nil
  :why "CME Clearing holiday advisories 2024: grains closed (Presidents Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCBT" :date (2024 5 27) :kind :session :gold t :ours nil
  :why "CME Clearing holiday advisories 2024: grains closed (Memorial Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCBT" :date (2024 6 19) :kind :session :gold t :ours nil
  :why "CME Clearing holiday advisories 2024: grains closed (Juneteenth); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCBT" :date (2024 7 4) :kind :session :gold t :ours nil
  :why "CME Clearing holiday advisories 2024: grains closed (Independence Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCBT" :date (2024 9 2) :kind :session :gold t :ours nil
  :why "CME Clearing holiday advisories 2024: grains closed (Labor Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCBT" :date (2024 11 28) :kind :session :gold t :ours nil
  :why "CME Clearing holiday advisories 2024: grains closed (Thanksgiving Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCBT" :date (2024 11 29) :kind :early-close :gold (12 0) :ours (12 5)
  :why "CME Clearing holiday advisories 2024: grains closes 12:05 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCBT" :date (2024 12 24) :kind :early-close :gold (12 0) :ours (12 5)
  :why "CME Clearing holiday advisories 2024: grains closes 12:05 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCBT" :date (2025 1 9) :kind :session :gold nil :ours t
  :why "CME Group U.S. National Day of Mourning Trading Schedule, January 9, 2025 (President Jimmy Carter): grains trades; CMES has no session."
  :source "https://web.archive.org/web/20250218194143/https://www.cmegroup.com/trading-hours/files/day-of-mourning-january-9-2024.pdf")
 (:mic "XCBT" :date (2025 1 20) :kind :session :gold t :ours nil
  :why "CME Clearing New Year's advisory 2025: grains closed (Martin Luther King Jr. Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCBT" :date (2025 2 17) :kind :session :gold t :ours nil
  :why "CME Clearing New Year's advisory 2025: grains closed (Presidents Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCBT" :date (2025 5 26) :kind :session :gold t :ours nil
  :why "CME Clearing New Year's advisory 2025: grains closed (Memorial Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCBT" :date (2025 6 19) :kind :session :gold t :ours nil
  :why "CME Clearing New Year's advisory 2025: grains closed (Juneteenth); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCBT" :date (2025 7 4) :kind :session :gold t :ours nil
  :why "CME Clearing New Year's advisory 2025: grains closed (Independence Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCBT" :date (2025 9 1) :kind :session :gold t :ours nil
  :why "CME Clearing New Year's advisory 2025: grains closed (Labor Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCBT" :date (2025 11 27) :kind :session :gold t :ours nil
  :why "CME Clearing New Year's advisory 2025: grains closed (Thanksgiving Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCBT" :date (2025 11 28) :kind :early-close :gold (12 0) :ours (12 5)
  :why "CME Clearing New Year's advisory 2025: grains closes 12:05 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCBT" :date (2025 12 24) :kind :early-close :gold (12 0) :ours (12 5)
  :why "CME Clearing New Year's advisory 2025: grains closes 12:05 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCBT" :date (2026 1 19) :kind :session :gold t :ours nil
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: grains closed (Martin Luther King Jr. Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCBT" :date (2026 2 16) :kind :session :gold t :ours nil
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: grains closed (Presidents Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCBT" :date (2026 5 25) :kind :session :gold t :ours nil
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: grains closed (Memorial Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCBT" :date (2026 6 19) :kind :session :gold t :ours nil
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: grains closed (Juneteenth); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCBT" :date (2026 7 3) :kind :session :gold t :ours nil
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: grains closed (Independence Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCBT" :date (2026 9 7) :kind :session :gold t :ours nil
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: grains closed (Labor Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCBT" :date (2026 11 26) :kind :session :gold t :ours nil
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: grains closed (Thanksgiving Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCBT" :date (2026 11 27) :kind :early-close :gold (12 0) :ours (12 5)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: grains closes 12:05 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCBT" :date (2026 12 24) :kind :early-close :gold (12 0) :ours (12 5)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: grains closes 12:05 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCBT" :date (2027 1 18) :kind :session :gold t :ours nil
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: grains closed (Martin Luther King Jr. Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCBT" :date (2027 2 15) :kind :session :gold t :ours nil
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: grains closed (Presidents Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCBT" :date (2027 5 31) :kind :session :gold t :ours nil
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: grains closed (Memorial Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCBT" :date (2027 6 18) :kind :early-close :gold (12 0) :ours nil
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: grains no early close; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCBT" :date (2027 7 5) :kind :session :gold t :ours nil
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: grains closed (Independence Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCBT" :date (2027 9 6) :kind :session :gold t :ours nil
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: grains closed (Labor Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCBT" :date (2027 11 25) :kind :session :gold t :ours nil
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: grains closed (Thanksgiving Day); CMES has a session. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCBT" :date (2027 11 26) :kind :early-close :gold (12 0) :ours (12 5)
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: grains closes 12:05 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCEC" :date (2009 1 19) :kind :early-close :gold (12 0) :ours nil
  :why "CME Globex holiday schedule: metals no early close on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20090126144353/http://cmegroup.com:80/tools-information/holiday-calendar/files/2009-martin-luther-king.pdf")
 (:mic "XCEC" :date (2009 2 16) :kind :early-close :gold (12 0) :ours nil
  :why "CME Globex holiday schedule: metals no early close on Presidents Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20090206002053/http://cmegroup.com:80/tools-information/holiday-calendar/files/2009-presidents-day.pdf")
 (:mic "XCEC" :date (2009 5 22) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex Memorial Day holiday schedule 2009: metals closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20090611163557/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-memorial-day.pdf")
 (:mic "XCEC" :date (2009 5 25) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Memorial Day holiday schedule 2009: metals closes 12:15 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20090611163557/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-memorial-day.pdf")
 (:mic "XCEC" :date (2009 7 3) :kind :early-close :gold (12 0) :ours (12 30)
  :why "CME Globex Independence Day holiday schedule 2009: metals closes 12:30 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20090612061133/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-4th-of-july.pdf")
 (:mic "XCEC" :date (2009 9 4) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex Labor Day holiday schedule 2009: metals closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20091007030433/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-labor-day.pdf")
 (:mic "XCEC" :date (2009 9 7) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Labor Day holiday schedule 2009: metals closes 12:15 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20091007030433/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-labor-day.pdf")
 (:mic "XCEC" :date (2009 10 9) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex Columbus Day holiday schedule 2009: metals closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20130309115356/http://www.cmegroup.com/tools-information/holiday-calendar/files/2009-holiday-calendars.zip")
 (:mic "XCEC" :date (2009 11 26) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2009: metals closes 12:15 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115356/http://www.cmegroup.com/tools-information/holiday-calendar/files/2009-holiday-calendars.zip")
 (:mic "XCEC" :date (2009 11 27) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2009: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115356/http://www.cmegroup.com/tools-information/holiday-calendar/files/2009-holiday-calendars.zip")
 (:mic "XCEC" :date (2009 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Christmas holiday schedule 2009: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20100215055401/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-christmas.pdf")
 (:mic "XCEC" :date (2010 1 15) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2010: metals closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20100331064226/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-martin-luther-king.pdf")
 (:mic "XCEC" :date (2010 1 18) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2010: metals closes 12:15 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20100331064226/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-martin-luther-king.pdf")
 (:mic "XCEC" :date (2010 2 12) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex Presidents Day holiday schedule 2010: metals closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20100215064641/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-presidents-day.pdf")
 (:mic "XCEC" :date (2010 2 15) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Presidents Day holiday schedule 2010: metals closes 12:15 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20100215064641/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-presidents-day.pdf")
 (:mic "XCEC" :date (2010 5 28) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex Memorial Day holiday schedule 2010: metals closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20100601094225/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-memorial-day.pdf")
 (:mic "XCEC" :date (2010 5 31) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Memorial Day holiday schedule 2010: metals closes 12:15 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20100601094225/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-memorial-day.pdf")
 (:mic "XCEC" :date (2010 7 2) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex Independence Day holiday schedule 2010: metals closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20100602005637/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-4th-of-july.pdf")
 (:mic "XCEC" :date (2010 7 5) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Independence Day holiday schedule 2010: metals closes 12:15 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20100602005637/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-4th-of-july.pdf")
 (:mic "XCEC" :date (2010 9 3) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex Labor Day holiday schedule 2010: metals closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20100602005641/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-labor-day.pdf")
 (:mic "XCEC" :date (2010 9 6) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Labor Day holiday schedule 2010: metals closes 12:15 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20100602005641/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-labor-day.pdf")
 (:mic "XCEC" :date (2010 10 8) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex Columbus Day holiday schedule 2010: metals closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20100821133122/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-columbus-day.pdf")
 (:mic "XCEC" :date (2010 11 25) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2010: metals closes 12:15 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20101122094012/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-thanksgiving.pdf")
 (:mic "XCEC" :date (2010 11 26) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2010: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20101122094012/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-thanksgiving.pdf")
 (:mic "XCEC" :date (2010 12 31) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex New Year's holiday schedule 2011: metals closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20101214061245/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2011-new-years.pdf")
 (:mic "XCEC" :date (2011 1 14) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2011: metals closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCEC" :date (2011 1 17) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2011: metals closes 12:15 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCEC" :date (2011 2 21) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Presidents Day holiday schedule 2011: metals closes 12:15 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCEC" :date (2011 5 30) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Memorial Day holiday schedule 2011: metals closes 12:15 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCEC" :date (2011 7 4) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Independence Day holiday schedule 2011: metals closes 12:15 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCEC" :date (2011 9 5) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Labor Day holiday schedule 2011: metals closes 12:15 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCEC" :date (2011 11 10) :kind :session :gold t :ours nil
  :why "CME Globex Veterans Day holiday schedule 2011: metals closed (Veterans Day); CMES has a session."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCEC" :date (2011 11 24) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2011: metals closes 12:15 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCEC" :date (2011 11 25) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2011: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCEC" :date (2012 1 16) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2012: metals closes 12:15 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20120105160459/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2012-martin-luther-king.pdf")
 (:mic "XCEC" :date (2012 2 20) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Presidents Day holiday schedule 2012: metals closes 12:15 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20120107064434/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-presidents-day.pdf")
 (:mic "XCEC" :date (2012 5 28) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Memorial Day holiday schedule 2012: metals closes 12:15 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20120915003402/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-4th-of-july.xls")
 (:mic "XCEC" :date (2012 7 4) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Memorial Day holiday schedule 2012: metals closes 12:15 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20120915003402/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-4th-of-july.xls")
 (:mic "XCEC" :date (2012 9 3) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Labor Day holiday schedule 2012: metals closes 12:15 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20120915003609/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-labor-day.xls")
 (:mic "XCEC" :date (2012 11 22) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2012: metals closes 12:15 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20111125001004/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2012-thanksgiving.pdf")
 (:mic "XCEC" :date (2012 11 23) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2012: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20111125001004/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2012-thanksgiving.pdf")
 (:mic "XCEC" :date (2012 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Christmas holiday schedule 2012: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20120107060254/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-christmas.pdf")
 (:mic "XCEC" :date (2013 1 21) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2013: metals closes 12:15 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCEC" :date (2013 2 18) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Presidents Day holiday schedule 2013: metals closes 12:15 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCEC" :date (2013 5 27) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Memorial Day holiday schedule 2013: metals closes 12:15 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCEC" :date (2013 7 4) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Independence Day holiday schedule 2013: metals closes 12:15 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCEC" :date (2013 9 2) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Labor Day holiday schedule 2013: metals closes 12:15 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCEC" :date (2013 11 28) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2013: metals closes 12:15 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCEC" :date (2013 11 29) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2013: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCEC" :date (2013 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Christmas holiday schedule 2013: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCEC" :date (2014 1 20) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2014: metals closes 12:15 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XCEC" :date (2014 2 17) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Presidents Day holiday schedule 2014: metals closes 12:15 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XCEC" :date (2014 11 28) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2014: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XCEC" :date (2014 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Christmas holiday schedule 2014: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XCEC" :date (2015 11 27) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2015: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip")
 (:mic "XCEC" :date (2015 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Christmas holiday schedule 2015: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip")
 (:mic "XCEC" :date (2016 11 25) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2016: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip")
 (:mic "XCEC" :date (2017 11 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2017: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip")
 (:mic "XCEC" :date (2018 11 23) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2018: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip")
 (:mic "XCEC" :date (2018 12 5) :kind :session :gold nil :ours t
  :why "CME Group press release, 2 Dec 2018: only U.S. equity and interest-rate products close for the National Day of Mourning; \"All other markets on CME Globex ... will remain open for regular trading hours\": metals trades; CMES has no session."
  :source "https://web.archive.org/web/20181205161404/https://www.cmegroup.com/media-room/press-releases/2018/12/02/cme_group_u_s_equityinterestratemarketstoclosefornationaldayofmo.html")
 (:mic "XCEC" :date (2018 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Christmas holiday schedule 2018: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip")
 (:mic "XCEC" :date (2019 11 29) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2019: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip")
 (:mic "XCEC" :date (2019 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Christmas holiday schedule 2019: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20201111233949/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-christmas-holiday-schedule.xls")
 (:mic "XCEC" :date (2020 11 27) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2020: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20201125140635/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-thanksgiving-schedule.xls")
 (:mic "XCEC" :date (2020 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Christmas holiday schedule 2020: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20260730111834/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-holiday-calendars.zip")
 (:mic "XCEC" :date (2021 11 26) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2021: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220917175604/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-thanksgiving-holiday-schedule.xls")
 (:mic "XCEC" :date (2022 1 17) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2022: metals closes 13:30 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220117212230/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-mlk-day-holiday-schedule.xls")
 (:mic "XCEC" :date (2022 2 21) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Globex Presidents Day holiday schedule 2022: metals closes 13:30 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220704073810/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-presidents-day-holiday-schedule.xls")
 (:mic "XCEC" :date (2022 5 30) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Globex Memorial Day holiday schedule 2022: metals closes 13:30 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220704065438/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-memorial-day-holiday-schedule.xls")
 (:mic "XCEC" :date (2022 6 20) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Globex Juneteenth holiday schedule 2022: metals closes 13:30 CT on Juneteenth; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220620200210/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-juneteenth-holiday-schedule.xls")
 (:mic "XCEC" :date (2022 7 4) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Globex Independence Day holiday schedule 2022: metals closes 13:30 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220704065450/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-independence-day-holiday-schedule.xls")
 (:mic "XCEC" :date (2022 9 5) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Globex Labor Day holiday schedule 2022: metals closes 13:30 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220704065441/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-labor-day-holiday-schedule.xls")
 (:mic "XCEC" :date (2022 11 24) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Globex Thanksgiving holiday schedule 2022: metals closes 13:30 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220704065423/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-thanksgiving-holiday-schedule.xls")
 (:mic "XCEC" :date (2022 11 25) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2022: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220704065423/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-thanksgiving-holiday-schedule.xls")
 (:mic "XCEC" :date (2023 1 16) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2023: metals closes 13:30 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XCEC" :date (2023 2 20) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2023: metals closes 13:30 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XCEC" :date (2023 5 29) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2023: metals closes 13:30 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XCEC" :date (2023 6 19) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2023: metals closes 13:30 CT on Juneteenth; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XCEC" :date (2023 7 4) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2023: metals closes 13:30 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XCEC" :date (2023 9 4) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2023: metals closes 13:30 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XCEC" :date (2023 11 23) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2023: metals closes 13:30 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XCEC" :date (2023 11 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Clearing holiday advisories 2023: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XCEC" :date (2024 1 15) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2024: metals closes 13:30 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCEC" :date (2024 2 19) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2024: metals closes 13:30 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCEC" :date (2024 5 27) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2024: metals closes 13:30 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCEC" :date (2024 6 19) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2024: metals closes 13:30 CT on Juneteenth; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCEC" :date (2024 7 4) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2024: metals closes 13:30 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCEC" :date (2024 9 2) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2024: metals closes 13:30 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCEC" :date (2024 11 28) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2024: metals closes 13:30 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCEC" :date (2024 11 29) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Clearing holiday advisories 2024: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCEC" :date (2024 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Clearing holiday advisories 2024: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCEC" :date (2025 1 9) :kind :session :gold nil :ours t
  :why "CME Group National Day of Mourning trading schedule, 9 Jan 2025: equities close 08:30 CT, interest rates and ags 12:15 CT, FX, energy and metals normal hours: metals trades; CMES has no session."
  :source "https://web.archive.org/web/20250218194143/https://www.cmegroup.com/trading-hours/files/day-of-mourning-january-9-2024.pdf")
 (:mic "XCEC" :date (2025 1 20) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing New Year's advisory 2025: metals closes 13:30 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCEC" :date (2025 2 17) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing New Year's advisory 2025: metals closes 13:30 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCEC" :date (2025 5 26) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing New Year's advisory 2025: metals closes 13:30 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCEC" :date (2025 6 19) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing New Year's advisory 2025: metals closes 13:30 CT on Juneteenth; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCEC" :date (2025 7 4) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing New Year's advisory 2025: metals closes 13:30 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCEC" :date (2025 9 1) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing New Year's advisory 2025: metals closes 13:30 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCEC" :date (2025 11 27) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing New Year's advisory 2025: metals closes 13:30 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCEC" :date (2025 11 28) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Clearing New Year's advisory 2025: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCEC" :date (2025 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Clearing New Year's advisory 2025: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCEC" :date (2026 1 19) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: metals closes 13:30 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCEC" :date (2026 2 16) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: metals closes 13:30 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCEC" :date (2026 5 25) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: metals closes 13:30 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCEC" :date (2026 6 19) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: metals closes 13:30 CT on Juneteenth; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCEC" :date (2026 7 3) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: metals closes 13:30 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCEC" :date (2026 9 7) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: metals closes 13:30 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCEC" :date (2026 11 26) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: metals closes 13:30 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCEC" :date (2026 11 27) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCEC" :date (2026 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCEC" :date (2027 1 18) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: metals closes 13:30 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCEC" :date (2027 2 15) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: metals closes 13:30 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCEC" :date (2027 5 31) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: metals closes 13:30 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCEC" :date (2027 6 18) :kind :early-close :gold (12 0) :ours nil
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: metals no early close; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCEC" :date (2027 7 5) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: metals closes 13:30 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCEC" :date (2027 9 6) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: metals closes 13:30 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCEC" :date (2027 11 25) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: metals closes 13:30 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCEC" :date (2027 11 26) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: metals closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCME" :date (2009 1 19) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2009: equity closes 10:30 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20090126144353/http://cmegroup.com:80/tools-information/holiday-calendar/files/2009-martin-luther-king.pdf")
 (:mic "XCME" :date (2009 2 16) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Presidents Day holiday schedule 2009: equity closes 10:30 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20090206002053/http://cmegroup.com:80/tools-information/holiday-calendar/files/2009-presidents-day.pdf")
 (:mic "XCME" :date (2009 5 25) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Memorial Day holiday schedule 2009: equity closes 10:30 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20090611163557/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-memorial-day.pdf")
 (:mic "XCME" :date (2009 7 3) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Independence Day holiday schedule 2009: equity closes 10:30 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20090612061133/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-4th-of-july.pdf")
 (:mic "XCME" :date (2009 9 7) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Labor Day holiday schedule 2009: equity closes 10:30 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20091007030433/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-labor-day.pdf")
 (:mic "XCME" :date (2009 11 26) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Thanksgiving holiday schedule 2009: equity closes 10:30 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115356/http://www.cmegroup.com/tools-information/holiday-calendar/files/2009-holiday-calendars.zip")
 (:mic "XCME" :date (2009 11 27) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2009: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115356/http://www.cmegroup.com/tools-information/holiday-calendar/files/2009-holiday-calendars.zip")
 (:mic "XCME" :date (2009 12 24) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Christmas holiday schedule 2009: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20100215055401/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-christmas.pdf")
 (:mic "XCME" :date (2010 1 18) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2010: equity closes 10:30 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20100331064226/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-martin-luther-king.pdf")
 (:mic "XCME" :date (2010 2 15) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Presidents Day holiday schedule 2010: equity closes 10:30 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20100215064641/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-presidents-day.pdf")
 (:mic "XCME" :date (2010 4 2) :kind :session :gold nil :ours t
  :why "CME Globex Good Friday holiday schedule 2010: equity trades; CMES has no session."
  :source "https://web.archive.org/web/20100601111916/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-good-friday.pdf")
 (:mic "XCME" :date (2010 5 31) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Memorial Day holiday schedule 2010: equity closes 10:30 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20100601094225/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-memorial-day.pdf")
 (:mic "XCME" :date (2010 7 5) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Independence Day holiday schedule 2010: equity closes 10:30 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20100602005637/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-4th-of-july.pdf")
 (:mic "XCME" :date (2010 9 6) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Labor Day holiday schedule 2010: equity closes 10:30 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20100602005641/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-labor-day.pdf")
 (:mic "XCME" :date (2010 11 25) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Thanksgiving holiday schedule 2010: equity closes 10:30 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20101122094012/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-thanksgiving.pdf")
 (:mic "XCME" :date (2010 11 26) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2010: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20101122094012/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-thanksgiving.pdf")
 (:mic "XCME" :date (2011 1 17) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2011: equity closes 10:30 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCME" :date (2011 2 21) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Presidents Day holiday schedule 2011: equity closes 10:30 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCME" :date (2011 5 30) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Memorial Day holiday schedule 2011: equity closes 10:30 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCME" :date (2011 7 4) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Independence Day holiday schedule 2011: equity closes 10:30 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCME" :date (2011 9 5) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Labor Day holiday schedule 2011: equity closes 10:30 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCME" :date (2011 11 10) :kind :session :gold t :ours nil
  :why "CME Globex Veterans Day holiday schedule 2011: equity closed (Veterans Day); CMES has a session."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCME" :date (2011 11 24) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Thanksgiving holiday schedule 2011: equity closes 10:30 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCME" :date (2011 11 25) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2011: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XCME" :date (2012 1 16) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2012: equity closes 10:30 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20120105160459/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2012-martin-luther-king.pdf")
 (:mic "XCME" :date (2012 2 20) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Presidents Day holiday schedule 2012: equity closes 10:30 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20120107064434/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-presidents-day.pdf")
 (:mic "XCME" :date (2012 4 6) :kind :session :gold nil :ours t
  :why "CME Globex Good Friday holiday schedule 2012: equity trades; CMES has no session."
  :source "https://web.archive.org/web/20120107070731/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-good-friday.pdf")
 (:mic "XCME" :date (2012 5 28) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Memorial Day holiday schedule 2012: equity closes 10:30 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20120915003402/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-4th-of-july.xls")
 (:mic "XCME" :date (2012 7 3) :kind :early-close :gold nil :ours (12 15)
  :why "CME Globex Memorial Day holiday schedule 2012: equity closes 12:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20120915003402/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-4th-of-july.xls")
 (:mic "XCME" :date (2012 7 4) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Memorial Day holiday schedule 2012: equity closes 10:30 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20120915003402/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-4th-of-july.xls")
 (:mic "XCME" :date (2012 9 3) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Labor Day holiday schedule 2012: equity closes 10:30 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20120915003609/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-labor-day.xls")
 (:mic "XCME" :date (2012 11 22) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Thanksgiving holiday schedule 2012: equity closes 10:30 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20111125001004/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2012-thanksgiving.pdf")
 (:mic "XCME" :date (2012 11 23) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2012: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20111125001004/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2012-thanksgiving.pdf")
 (:mic "XCME" :date (2012 12 24) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Christmas holiday schedule 2012: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20120107060254/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-christmas.pdf")
 (:mic "XCME" :date (2013 1 21) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2013: equity closes 10:30 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCME" :date (2013 2 18) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Presidents Day holiday schedule 2013: equity closes 10:30 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCME" :date (2013 5 27) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Memorial Day holiday schedule 2013: equity closes 10:30 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCME" :date (2013 7 3) :kind :early-close :gold nil :ours (12 15)
  :why "CME Globex Independence Day holiday schedule 2013: equity closes 12:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCME" :date (2013 7 4) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Independence Day holiday schedule 2013: equity closes 10:30 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCME" :date (2013 9 2) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Labor Day holiday schedule 2013: equity closes 10:30 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCME" :date (2013 11 28) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Thanksgiving holiday schedule 2013: equity closes 10:30 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCME" :date (2013 11 29) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2013: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCME" :date (2013 12 24) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Christmas holiday schedule 2013: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XCME" :date (2014 1 20) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2014: equity closes 10:30 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XCME" :date (2014 2 17) :kind :early-close :gold (12 0) :ours (10 30)
  :why "CME Globex Presidents Day holiday schedule 2014: equity closes 10:30 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XCME" :date (2014 7 3) :kind :early-close :gold nil :ours (12 15)
  :why "CME Globex Independence Day holiday schedule 2014: equity closes 12:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XCME" :date (2014 11 28) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2014: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XCME" :date (2014 12 24) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Christmas holiday schedule 2014: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XCME" :date (2015 4 3) :kind :session :gold nil :ours t
  :why "CME Globex Good Friday holiday schedule 2015: equity trades; CMES has no session."
  :source "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip")
 (:mic "XCME" :date (2015 11 27) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2015: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip")
 (:mic "XCME" :date (2015 12 24) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Christmas holiday schedule 2015: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip")
 (:mic "XCME" :date (2016 11 25) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2016: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip")
 (:mic "XCME" :date (2017 7 3) :kind :early-close :gold nil :ours (12 15)
  :why "CME Globex Independence Day holiday schedule 2017: equity closes 12:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip")
 (:mic "XCME" :date (2017 11 24) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2017: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip")
 (:mic "XCME" :date (2018 7 3) :kind :early-close :gold nil :ours (12 15)
  :why "CME Globex Independence Day holiday schedule 2018: equity closes 12:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip")
 (:mic "XCME" :date (2018 11 23) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2018: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip")
 (:mic "XCME" :date (2018 12 5) :kind :session :gold nil :ours t
  :why "CME Group press release: U.S. Equity, Interest Rate Markets to Close for National Day of Mourning (President George H. W. Bush): equity trades; CMES has no session."
  :source "https://web.archive.org/web/20181205161404/https://www.cmegroup.com/media-room/press-releases/2018/12/02/cme_group_u_s_equityinterestratemarketstoclosefornationaldayofmo.html")
 (:mic "XCME" :date (2018 12 24) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Christmas holiday schedule 2018: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip")
 (:mic "XCME" :date (2019 7 3) :kind :early-close :gold nil :ours (12 15)
  :why "CME Globex Independence Day holiday schedule 2019: equity closes 12:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip")
 (:mic "XCME" :date (2019 11 29) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2019: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip")
 (:mic "XCME" :date (2019 12 24) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Christmas holiday schedule 2019: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20201111233949/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-christmas-holiday-schedule.xls")
 (:mic "XCME" :date (2020 11 27) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2020: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20201125140635/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-thanksgiving-schedule.xls")
 (:mic "XCME" :date (2020 12 24) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Christmas holiday schedule 2020: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20260730111834/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-holiday-calendars.zip")
 (:mic "XCME" :date (2021 4 2) :kind :session :gold nil :ours t
  :why "CME Globex Good Friday holiday schedule 2021: equity trades (Good Friday); CMES has no session."
  :source "https://web.archive.org/web/20210402141803/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-good-friday-holiday-schedule.xls")
 (:mic "XCME" :date (2021 11 26) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2021: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220917175604/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-thanksgiving-holiday-schedule.xls")
 (:mic "XCME" :date (2022 11 25) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2022: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220704065423/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-thanksgiving-holiday-schedule.xls")
 (:mic "XCME" :date (2023 4 7) :kind :session :gold nil :ours t
  :why "CME Clearing Good Friday advisory 2023 (second correction): equity trades (Good Friday: \"Equities will trade an abbreviated session ... but will not be settled\"); CMES has no session."
  :source "https://web.archive.org/web/20230203065333/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-good-friday-advisory.pdf")
 (:mic "XCME" :date (2023 7 3) :kind :early-close :gold nil :ours (12 15)
  :why "CME Clearing holiday advisories 2023: equity closes 12:15 CT; CMES gives every CME Group product no early close. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XCME" :date (2023 11 24) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Clearing holiday advisories 2023: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XCME" :date (2024 7 3) :kind :early-close :gold nil :ours (12 15)
  :why "CME Clearing holiday advisories 2024: equity closes 12:15 CT; CMES gives every CME Group product no early close. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCME" :date (2024 11 29) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Clearing holiday advisories 2024: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCME" :date (2024 12 24) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Clearing holiday advisories 2024: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XCME" :date (2025 1 9) :kind :session :gold nil :ours t
  :why "CME Group U.S. National Day of Mourning Trading Schedule, January 9, 2025 (President Jimmy Carter): equity trades (National Day of Mourning: equity settlements \"copy/pasted from the prior business day\"); CMES has no session."
  :source "https://web.archive.org/web/20250218194143/https://www.cmegroup.com/trading-hours/files/day-of-mourning-january-9-2024.pdf")
 (:mic "XCME" :date (2025 7 3) :kind :early-close :gold nil :ours (12 15)
  :why "CME Clearing New Year's advisory 2025: equity closes 12:15 CT; CMES gives every CME Group product no early close. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCME" :date (2025 11 28) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Clearing New Year's advisory 2025: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCME" :date (2025 12 24) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Clearing New Year's advisory 2025: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XCME" :date (2026 4 3) :kind :session :gold nil :ours t
  :why "CME Clearing Good Friday advisory and settlement times 2026: equity trades (Good Friday: equities abbreviated session, not settled); CMES has no session."
  :source "https://web.archive.org/web/20260202002306/https://www.cmegroup.com/tools-information/holiday-calendar/files/2026/2026-good-friday-clearing-advisory.pdf")
 (:mic "XCME" :date (2026 11 27) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCME" :date (2026 12 24) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCME" :date (2027 6 18) :kind :early-close :gold (12 0) :ours nil
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: equity no early close; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XCME" :date (2027 11 26) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: equity closes 12:15 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XNYM" :date (2009 1 19) :kind :early-close :gold (12 0) :ours nil
  :why "CME Globex holiday schedule: energy no early close on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20090126144353/http://cmegroup.com:80/tools-information/holiday-calendar/files/2009-martin-luther-king.pdf")
 (:mic "XNYM" :date (2009 2 16) :kind :early-close :gold (12 0) :ours nil
  :why "CME Globex holiday schedule: energy no early close on Presidents Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20090206002053/http://cmegroup.com:80/tools-information/holiday-calendar/files/2009-presidents-day.pdf")
 (:mic "XNYM" :date (2009 5 22) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex Memorial Day holiday schedule 2009: energy closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20090611163557/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-memorial-day.pdf")
 (:mic "XNYM" :date (2009 5 25) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Memorial Day holiday schedule 2009: energy closes 12:15 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20090611163557/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-memorial-day.pdf")
 (:mic "XNYM" :date (2009 7 3) :kind :early-close :gold (12 0) :ours (12 30)
  :why "CME Globex Independence Day holiday schedule 2009: energy closes 12:30 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20090612061133/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-4th-of-july.pdf")
 (:mic "XNYM" :date (2009 9 4) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex Labor Day holiday schedule 2009: energy closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20091007030433/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-labor-day.pdf")
 (:mic "XNYM" :date (2009 9 7) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Labor Day holiday schedule 2009: energy closes 12:15 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20091007030433/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-labor-day.pdf")
 (:mic "XNYM" :date (2009 10 9) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex Columbus Day holiday schedule 2009: energy closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20130309115356/http://www.cmegroup.com/tools-information/holiday-calendar/files/2009-holiday-calendars.zip")
 (:mic "XNYM" :date (2009 11 26) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2009: energy closes 12:15 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115356/http://www.cmegroup.com/tools-information/holiday-calendar/files/2009-holiday-calendars.zip")
 (:mic "XNYM" :date (2009 11 27) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2009: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115356/http://www.cmegroup.com/tools-information/holiday-calendar/files/2009-holiday-calendars.zip")
 (:mic "XNYM" :date (2009 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Christmas holiday schedule 2009: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20100215055401/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2009-christmas.pdf")
 (:mic "XNYM" :date (2010 1 15) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2010: energy closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20100331064226/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-martin-luther-king.pdf")
 (:mic "XNYM" :date (2010 1 18) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2010: energy closes 12:15 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20100331064226/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-martin-luther-king.pdf")
 (:mic "XNYM" :date (2010 2 12) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex Presidents Day holiday schedule 2010: energy closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20100215064641/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-presidents-day.pdf")
 (:mic "XNYM" :date (2010 2 15) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Presidents Day holiday schedule 2010: energy closes 12:15 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20100215064641/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-presidents-day.pdf")
 (:mic "XNYM" :date (2010 5 28) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex Memorial Day holiday schedule 2010: energy closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20100601094225/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-memorial-day.pdf")
 (:mic "XNYM" :date (2010 5 31) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Memorial Day holiday schedule 2010: energy closes 12:15 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20100601094225/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-memorial-day.pdf")
 (:mic "XNYM" :date (2010 7 2) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex Independence Day holiday schedule 2010: energy closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20100602005637/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-4th-of-july.pdf")
 (:mic "XNYM" :date (2010 7 5) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Independence Day holiday schedule 2010: energy closes 12:15 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20100602005637/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-4th-of-july.pdf")
 (:mic "XNYM" :date (2010 9 3) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex Labor Day holiday schedule 2010: energy closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20100602005641/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-labor-day.pdf")
 (:mic "XNYM" :date (2010 9 6) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Labor Day holiday schedule 2010: energy closes 12:15 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20100602005641/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-labor-day.pdf")
 (:mic "XNYM" :date (2010 10 8) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex Columbus Day holiday schedule 2010: energy closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20100821133122/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-columbus-day.pdf")
 (:mic "XNYM" :date (2010 11 25) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2010: energy closes 12:15 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20101122094012/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-thanksgiving.pdf")
 (:mic "XNYM" :date (2010 11 26) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2010: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20101122094012/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2010-thanksgiving.pdf")
 (:mic "XNYM" :date (2010 12 31) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex New Year's holiday schedule 2011: energy closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20101214061245/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2011-new-years.pdf")
 (:mic "XNYM" :date (2011 1 14) :kind :early-close :gold nil :ours (15 15)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2011: energy closes 15:15 CT; CMES gives every CME Group product no early close."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XNYM" :date (2011 1 17) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2011: energy closes 12:15 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XNYM" :date (2011 2 21) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Presidents Day holiday schedule 2011: energy closes 12:15 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XNYM" :date (2011 5 30) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Memorial Day holiday schedule 2011: energy closes 12:15 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XNYM" :date (2011 7 4) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Independence Day holiday schedule 2011: energy closes 12:15 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XNYM" :date (2011 9 5) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Labor Day holiday schedule 2011: energy closes 12:15 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XNYM" :date (2011 11 10) :kind :session :gold t :ours nil
  :why "CME Globex Veterans Day holiday schedule 2011: energy closed (Veterans Day); CMES has a session."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XNYM" :date (2011 11 24) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2011: energy closes 12:15 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XNYM" :date (2011 11 25) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2011: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20130309115411/http://www.cmegroup.com/tools-information/holiday-calendar/files/2011-holiday-calendars.zip")
 (:mic "XNYM" :date (2012 1 16) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2012: energy closes 12:15 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20120105160459/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2012-martin-luther-king.pdf")
 (:mic "XNYM" :date (2012 2 20) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Presidents Day holiday schedule 2012: energy closes 12:15 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20120107064434/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-presidents-day.pdf")
 (:mic "XNYM" :date (2012 5 28) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Memorial Day holiday schedule 2012: energy closes 12:15 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20120915003402/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-4th-of-july.xls")
 (:mic "XNYM" :date (2012 7 4) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Memorial Day holiday schedule 2012: energy closes 12:15 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20120915003402/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-4th-of-july.xls")
 (:mic "XNYM" :date (2012 9 3) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Labor Day holiday schedule 2012: energy closes 12:15 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20120915003609/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-labor-day.xls")
 (:mic "XNYM" :date (2012 11 22) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2012: energy closes 12:15 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20111125001004/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2012-thanksgiving.pdf")
 (:mic "XNYM" :date (2012 11 23) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2012: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20111125001004/http://www.cmegroup.com:80/tools-information/holiday-calendar/files/2012-thanksgiving.pdf")
 (:mic "XNYM" :date (2012 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Christmas holiday schedule 2012: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20120107060254/http://www.cmegroup.com/tools-information/holiday-calendar/files/2012-christmas.pdf")
 (:mic "XNYM" :date (2013 1 21) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2013: energy closes 12:15 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XNYM" :date (2013 2 18) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Presidents Day holiday schedule 2013: energy closes 12:15 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XNYM" :date (2013 5 27) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Memorial Day holiday schedule 2013: energy closes 12:15 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XNYM" :date (2013 7 4) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Independence Day holiday schedule 2013: energy closes 12:15 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XNYM" :date (2013 9 2) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Labor Day holiday schedule 2013: energy closes 12:15 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XNYM" :date (2013 11 28) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Thanksgiving holiday schedule 2013: energy closes 12:15 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XNYM" :date (2013 11 29) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2013: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XNYM" :date (2013 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Christmas holiday schedule 2013: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20140326193052/http://www.cmegroup.com/tools-information/holiday-calendar/files/2013-holiday-calendars.zip")
 (:mic "XNYM" :date (2014 1 20) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2014: energy closes 12:15 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XNYM" :date (2014 2 17) :kind :early-close :gold (12 0) :ours (12 15)
  :why "CME Globex Presidents Day holiday schedule 2014: energy closes 12:15 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XNYM" :date (2014 11 28) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2014: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XNYM" :date (2014 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Christmas holiday schedule 2014: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20150326121739/http://www.cmegroup.com/tools-information/holiday-calendar/files/2014-holiday-calendars.zip")
 (:mic "XNYM" :date (2015 11 27) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2015: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip")
 (:mic "XNYM" :date (2015 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Christmas holiday schedule 2015: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20160808150227/http://www.cmegroup.com/tools-information/holiday-calendar/files/2015-holiday-calendars.zip")
 (:mic "XNYM" :date (2016 11 25) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2016: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20170628115819/http://www.cmegroup.com/tools-information/holiday-calendar/files/2016-holiday-calendars.zip")
 (:mic "XNYM" :date (2017 11 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2017: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20210126094835/https://www.cmegroup.com/tools-information/holiday-calendar/files/2017-holiday-calendars.zip")
 (:mic "XNYM" :date (2018 11 23) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2018: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip")
 (:mic "XNYM" :date (2018 12 5) :kind :session :gold nil :ours t
  :why "CME Group press release, 2 Dec 2018: only U.S. equity and interest-rate products close for the National Day of Mourning; \"All other markets on CME Globex ... will remain open for regular trading hours\": energy trades; CMES has no session."
  :source "https://web.archive.org/web/20181205161404/https://www.cmegroup.com/media-room/press-releases/2018/12/02/cme_group_u_s_equityinterestratemarketstoclosefornationaldayofmo.html")
 (:mic "XNYM" :date (2018 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Christmas holiday schedule 2018: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20260830100225/https://www.cmegroup.com/tools-information/holiday-calendar/files/2018-holiday-calendars.zip")
 (:mic "XNYM" :date (2019 11 29) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2019: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20210126094837/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-holiday-calendars.zip")
 (:mic "XNYM" :date (2019 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Christmas holiday schedule 2019: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20201111233949/https://www.cmegroup.com/tools-information/holiday-calendar/files/2019-christmas-holiday-schedule.xls")
 (:mic "XNYM" :date (2020 11 27) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2020: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20201125140635/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-thanksgiving-schedule.xls")
 (:mic "XNYM" :date (2020 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Christmas holiday schedule 2020: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20260730111834/https://www.cmegroup.com/tools-information/holiday-calendar/files/2020-holiday-calendars.zip")
 (:mic "XNYM" :date (2021 11 26) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2021: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220917175604/https://www.cmegroup.com/tools-information/holiday-calendar/files/2021-thanksgiving-holiday-schedule.xls")
 (:mic "XNYM" :date (2022 1 17) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Globex Martin Luther King Jr. Day holiday schedule 2022: energy closes 13:30 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220117212230/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-mlk-day-holiday-schedule.xls")
 (:mic "XNYM" :date (2022 2 21) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Globex Presidents Day holiday schedule 2022: energy closes 13:30 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220704073810/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-presidents-day-holiday-schedule.xls")
 (:mic "XNYM" :date (2022 5 30) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Globex Memorial Day holiday schedule 2022: energy closes 13:30 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220704065438/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-memorial-day-holiday-schedule.xls")
 (:mic "XNYM" :date (2022 6 20) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Globex Juneteenth holiday schedule 2022: energy closes 13:30 CT on Juneteenth; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220620200210/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-juneteenth-holiday-schedule.xls")
 (:mic "XNYM" :date (2022 7 4) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Globex Independence Day holiday schedule 2022: energy closes 13:30 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220704065450/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-independence-day-holiday-schedule.xls")
 (:mic "XNYM" :date (2022 9 5) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Globex Labor Day holiday schedule 2022: energy closes 13:30 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220704065441/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-labor-day-holiday-schedule.xls")
 (:mic "XNYM" :date (2022 11 24) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Globex Thanksgiving holiday schedule 2022: energy closes 13:30 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220704065423/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-thanksgiving-holiday-schedule.xls")
 (:mic "XNYM" :date (2022 11 25) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Globex Thanksgiving holiday schedule 2022: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT."
  :source "https://web.archive.org/web/20220704065423/https://www.cmegroup.com/tools-information/holiday-calendar/files/2022-thanksgiving-holiday-schedule.xls")
 (:mic "XNYM" :date (2023 1 16) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2023: energy closes 13:30 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XNYM" :date (2023 2 20) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2023: energy closes 13:30 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XNYM" :date (2023 5 29) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2023: energy closes 13:30 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XNYM" :date (2023 6 19) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2023: energy closes 13:30 CT on Juneteenth; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XNYM" :date (2023 7 4) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2023: energy closes 13:30 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XNYM" :date (2023 9 4) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2023: energy closes 13:30 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XNYM" :date (2023 11 23) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2023: energy closes 13:30 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XNYM" :date (2023 11 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Clearing holiday advisories 2023: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20230203071256/https://www.cmegroup.com/tools-information/holiday-calendar/files/2023-mlk-day-advisory.pdf")
 (:mic "XNYM" :date (2024 1 15) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2024: energy closes 13:30 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XNYM" :date (2024 2 19) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2024: energy closes 13:30 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XNYM" :date (2024 5 27) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2024: energy closes 13:30 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XNYM" :date (2024 6 19) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2024: energy closes 13:30 CT on Juneteenth; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XNYM" :date (2024 7 4) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2024: energy closes 13:30 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XNYM" :date (2024 9 2) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2024: energy closes 13:30 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XNYM" :date (2024 11 28) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing holiday advisories 2024: energy closes 13:30 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XNYM" :date (2024 11 29) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Clearing holiday advisories 2024: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XNYM" :date (2024 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Clearing holiday advisories 2024: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241214013801/https://www.cmegroup.com/tools-information/holiday-calendar/files/2024-mlk-day-advisory.pdf")
 (:mic "XNYM" :date (2025 1 9) :kind :session :gold nil :ours t
  :why "CME Group National Day of Mourning trading schedule, 9 Jan 2025: equities close 08:30 CT, interest rates and ags 12:15 CT, FX, energy and metals normal hours: energy trades; CMES has no session."
  :source "https://web.archive.org/web/20250218194143/https://www.cmegroup.com/trading-hours/files/day-of-mourning-january-9-2024.pdf")
 (:mic "XNYM" :date (2025 1 20) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing New Year's advisory 2025: energy closes 13:30 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XNYM" :date (2025 2 17) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing New Year's advisory 2025: energy closes 13:30 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XNYM" :date (2025 5 26) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing New Year's advisory 2025: energy closes 13:30 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XNYM" :date (2025 6 19) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing New Year's advisory 2025: energy closes 13:30 CT on Juneteenth; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XNYM" :date (2025 7 4) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing New Year's advisory 2025: energy closes 13:30 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XNYM" :date (2025 9 1) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing New Year's advisory 2025: energy closes 13:30 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XNYM" :date (2025 11 27) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Clearing New Year's advisory 2025: energy closes 13:30 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XNYM" :date (2025 11 28) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Clearing New Year's advisory 2025: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XNYM" :date (2025 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Clearing New Year's advisory 2025: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20241212010848/https://www.cmegroup.com/tools-information/holiday-calendar/files/2025-new-years-advisory.pdf")
 (:mic "XNYM" :date (2026 1 19) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: energy closes 13:30 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XNYM" :date (2026 2 16) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: energy closes 13:30 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XNYM" :date (2026 5 25) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: energy closes 13:30 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XNYM" :date (2026 6 19) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: energy closes 13:30 CT on Juneteenth; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XNYM" :date (2026 7 3) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: energy closes 13:30 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XNYM" :date (2026 9 7) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: energy closes 13:30 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XNYM" :date (2026 11 26) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: energy closes 13:30 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XNYM" :date (2026 11 27) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XNYM" :date (2026 12 24) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Group trading-hours page, 2026 Globex holiday schedule: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XNYM" :date (2027 1 18) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: energy closes 13:30 CT on Martin Luther King Jr. Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XNYM" :date (2027 2 15) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: energy closes 13:30 CT on Presidents Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XNYM" :date (2027 5 31) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: energy closes 13:30 CT on Memorial Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XNYM" :date (2027 6 18) :kind :early-close :gold (12 0) :ours nil
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: energy no early close; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XNYM" :date (2027 7 5) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: energy closes 13:30 CT on Independence Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XNYM" :date (2027 9 6) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: energy closes 13:30 CT on Labor Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XNYM" :date (2027 11 25) :kind :early-close :gold (12 0) :ours (13 30)
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: energy closes 13:30 CT on Thanksgiving Day; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html")
 (:mic "XNYM" :date (2027 11 26) :kind :early-close :gold (12 0) :ours (12 45)
  :why "CME Group trading-hours page, 2027 Globex holiday schedule: energy closes 12:45 CT; CMES gives every CME Group product a close at 12:00 CT. 2023 on: the hours-file rule from the 2021-2022 CME schedules (CME publishes no schedule files after 2022); the document cited confirms the holiday."
  :source "https://web.archive.org/web/20261030143142/https://www.cmegroup.com/trading-hours.html"))
