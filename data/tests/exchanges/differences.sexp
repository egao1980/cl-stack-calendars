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
  :source "https://www.hkex.com.hk/News/News-Release/2001/010705news"))
