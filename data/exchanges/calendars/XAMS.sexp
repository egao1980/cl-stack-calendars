;;;; XAMS - Euronext Amsterdam cash. Draft research data. Includes EURONEXT (Labour Day only from 2002).
(:name "XAMS"
 :title "Euronext Amsterdam trading days"
 :authority "Euronext yearly calendar notices" :authority-uri "https://www.euronext.com/en/trading/trading-hours-holidays"
 :include ("EURONEXT")
 :rules ()
 :gaps (
   (:years "2000" :note "No AEX/Euronext Amsterdam 2000 list found. ec closes 1 May 2000, 1 Jun 2000 (Ascension), 12 Jun 2000 (Whit Monday); unverified. Whether Amsterdam closed on 1 May 2000 is doubtful given it was open on 1 May 2001."))
 :notices (
   (:title "Euronext calendar 2001 - Amsterdam specifics"
    :uri "https://web.archive.org/web/2004id_/http://www.euronext.com:80/en/news/news_archive/calendars/news.jsp?newsId=27&language=EN"
    :year 2001
    :issued (2000 11 7) :issued-uri "https://web.archive.org/web/2004id_/http://www.euronext.com:80/en/news/news_archive/calendars/news.jsp?newsId=27&language=EN"
    :published (2000 11 7) :published-uri "https://web.archive.org/web/2004id_/http://www.euronext.com:80/en/news/news_archive/calendars/news.jsp?newsId=27&language=EN"
    :published-in "Euronext press release" :dates-note "Amsterdam closed Mon 30 Apr 2001 (Koninginnedag), OPEN Tue 1 May 2001 (EURONEXT Labour Day rule starts 2002)."
    :closed (((2001 4 30) "Koninginnedag (Queen's Day) 2001"))
    :open ()
    :early-closes ()
    :late-opens ())
 ))
