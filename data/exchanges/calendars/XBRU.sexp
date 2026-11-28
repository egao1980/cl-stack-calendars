;;;; XBRU - Euronext Brussels cash. Draft research data. Includes EURONEXT.
(:name "XBRU"
 :title "Euronext Brussels trading days"
 :authority "Euronext yearly calendar notices" :authority-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
 :include ("EURONEXT")
 :rules ((:fixed "Labour Day (pre-harmonisation)" 5 1 :from 2001 :to 2001 :authority "https://web.archive.org/web/2004id_/http://www.euronext.com:80/en/news/news_archive/calendars/news.jsp?newsId=27&language=EN"))
 :gaps (
   (:years "2000" :note "No Euronext Brussels / Brussels Exchanges 2000 holiday list found. ec closes 1 Jun 2000 (Ascension), 12 Jun 2000 (Whit Monday), 21 Jul 2000 (national day) in addition to GF/EM/1 May/25-26 Dec; unverified."))
 :notices (
   (:title "Euronext calendar 2001 - Brussels specifics"
    :uri "https://web.archive.org/web/2004id_/http://www.euronext.com:80/en/news/news_archive/calendars/news.jsp?newsId=27&language=EN"
    :year 2001
    :issued (2000 11 7) :issued-uri "https://web.archive.org/web/2004id_/http://www.euronext.com:80/en/news/news_archive/calendars/news.jsp?newsId=27&language=EN"
    :published (2000 11 7) :published-uri "https://web.archive.org/web/2004id_/http://www.euronext.com:80/en/news/news_archive/calendars/news.jsp?newsId=27&language=EN"
    :published-in "Euronext press release" :dates-note "Brussels open 30 Apr 2001, closed 1 May 2001 (Labour Day rule above)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ())
 ))
