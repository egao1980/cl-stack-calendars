"""Estonia: riigipühad 2000-2040, for egao1980/cl-stack-calendars#21. Stdlib only;
data, no logic. LOWER CONFIDENCE.

Riigi Teataja (riigiteataja.ee) serves its texts only through a script-driven
page that could not be read, so the list and the 2005 amendment are taken from
search results quoting the consolidated Pühade ja tähtpäevade seadus (PTS);
python-holidays agrees on every day.

Scope: PTS § 2 riigipühad: 1 Jan, 24 Feb, Good Friday, Easter Sunday
(ülestõusmispühade 1. püha), 1 May, Pentecost (nelipühade 1. püha), 23 and 24
June, 20 August, 24 December from 2005 (RT I 2005, 24, 185, in force 20 May
2005), 25 and 26 December. No weekend substitute and no transfers.
"""

OBSERVE = True

_RT = "https://www.riigiteataja.ee/akt/PTS"

EE_STATUTES = [
    dict(key="pts", title="Pühade ja tähtpäevade seadus, § 2 (riigipühad)", uri=_RT, issued=None, issued_uri=None,
         published=None, published_uri=None, published_in="Riigi Teataja", in_force=None,
         dates_note="SECONDARY: the act's text was not read (Riigi Teataja did not render); its adoption and RT "
                    "issue are not recorded here.",
         summary="Riigipühad: uusaasta, iseseisvuspäev (24 Feb), suur reede, ülestõusmispühade 1. püha, kevadpüha "
                 "(1 May), nelipühade 1. püha, võidupüha (23 Jun), jaanipäev (24 Jun), taasiseseisvumispäev (20 Aug), "
                 "jõululaupäev (24 Dec), esimene and teine jõulupüha."),
    dict(key="rt-2005-24-185", title="Pühade ja tähtpäevade seaduse muutmise seadus (jõululaupäev), RT I 2005, 24, 185",
         uri=_RT, issued="2005-04-14", issued_uri=None, published=None, published_uri=None,
         published_in="RT I 2005, 24, 185", in_force="2005-05-20",
         dates_note="SECONDARY: the adoption date and in-force date are from search results quoting the "
                    "consolidated text ('[RT I 2005, 24, 185 - jõust. 20.05.2005]'); the RT publication date was "
                    "not read.", summary="§ 2 p 8¹: 24. detsember – jõululaupäev."),
]

EE_FIXED = [
    (1, 1, "uusaasta", [(1991, None)], "pts"),
    (2, 24, "iseseisvuspäev", [(1991, None)], "pts"),
    (5, 1, "kevadpüha", [(1991, None)], "pts"),
    (6, 23, "võidupüha", [(1991, None)], "pts"),
    (6, 24, "jaanipäev", [(1991, None)], "pts"),
    (8, 20, "taasiseseisvumispäev", [(1991, None)], "pts"),
    (12, 24, "jõululaupäev", [(2005, None)], "rt-2005-24-185"),
    (12, 25, "esimene jõulupüha", [(1991, None)], "pts"),
    (12, 26, "teine jõulupüha", [(1991, None)], "pts"),
]

EE_EASTER = [
    (-2, "suur reede", [(1991, None)], "pts"),
    (0, "ülestõusmispühade 1. püha", [(1991, None)], "pts"),
    (49, "nelipühade 1. püha", [(1991, None)], "pts"),
]

EE_YEARS = {}
