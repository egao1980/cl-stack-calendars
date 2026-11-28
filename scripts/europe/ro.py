"""Romania: zile de sărbătoare legală în care nu se lucrează, 2000-2040, for
egao1980/cl-stack-calendars#22. Stdlib only; data, no logic.

Cache: ~/.cache/cl-stack-calendars/ro/ (cdep.ro act pages and texts; senat.ro signed law PDFs, with OCR transcripts)

Sources: legislatie.just.ro refused every connection, so the texts are those of
the Chamber of Deputies legislative database (cdep.ro) and the signed law forms
the Senate publishes (senat.ro). Each amending law sets no date of its own, so
it is in force 3 days after its Monitorul Oficial (Constituția art. 78).

Scope: Legea 75/1996 art. 1, then Codul muncii (Legea 53/2003) art. 134,
renumbered art. 139: the national days. The two days for each of three
religious holidays of other denominations apply only to their members, and the
Government's bridge days (alin. (4), Legea 153/2019) only to the public
budget sector, so neither is listed. Easter and Rusalii are named as "prima şi
a doua zi", so both Sundays are listed.
"""

OBSERVE = True

_CDEP = "https://www.cdep.ro/ords/pls/legis/legis_pck.htp_act?ida="
_SEN = "https://www.senat.ro/legis/PDF/"


def _law(key, title, ida, adopted, mof, mof_date, in_force, summary, pdf=None, note=None, to=None):
    u = _CDEP + str(ida)
    return dict(key=key, title=title, uri=u, issued=adopted, issued_uri=pdf or u, published=mof_date,
                published_uri=u, published_in=f"Monitorul Oficial, Partea I, nr. {mof}", in_force=in_force,
                dates_note=note or "In force 3 days after publication (Constituția art. 78); text from the cdep.ro "
                                   "database (no official character) and the signed Senate form.",
                summary=summary, to=to)


RO_STATUTES = [
    _law("l-75-1996", "Legea nr. 75/1996 pentru stabilirea zilelor de sărbătoare legală în care nu se lucrează", 8614,
         "1996-07-12", "150", "1996-07-17", None,
         "Art. 1: 1 şi 2 ianuarie; prima şi a doua zi de Paşte; 1 mai; 1 decembrie; 25 şi 26 decembrie.",
         note="Text from the cdep.ro database (no official character); no in-force date shown. Repealed by Legea "
              "53/2003.", to="2003-02-28"),
    _law("l-53-2003", "Legea nr. 53/2003 – Codul muncii, art. 134 (art. 139 after the 2011 republication)", 41525,
         "2003-01-24", "72", "2003-02-05", "2003-03-01",
         "Art. 134(1): 1 şi 2 ianuarie; prima şi a doua zi de Paşti; 1 mai; 1 decembrie; prima şi a doua zi de "
         "Crăciun. In force 1 March 2003 (art. 298).",
         note="Text from the cdep.ro database (no official character); republished M.Of. 345 of 18 May 2011."),
    _law("l-202-2008", "Legea nr. 202/2008 pentru modificarea alin. (1) al art. 134 din Codul muncii", 83213,
         "2008-10-21", "728", "2008-10-28", "2008-10-31",
         "Adds 'prima şi a doua zi de Rusalii' and 'Adormirea Maicii Domnului' (15 August): first observed 2009.",
         pdf="https://www.cdep.ro/proiecte/2007/800/40/1/leg_pl841_07.pdf"),
    _law("l-147-2012", "Legea nr. 147/2012 pentru modificarea art. 139 alin. (1) din Codul muncii", 112137,
         "2012-07-23", "509", "2012-07-24", "2012-07-27",
         "Adds '30 noiembrie – Sfântul Apostol Andrei cel Întâi chemat, Ocrotitorul României' (from 2012).",
         pdf=_SEN + "2011/11L592FP.pdf"),
    _law("l-176-2016", "Legea nr. 176/2016 pentru modificarea alin. (1) al art. 139 din Codul muncii", 139678,
         "2016-10-07", "808", "2016-10-13", "2016-10-16",
         "Adds '24 ianuarie – Ziua Unirii Principatelor Române' (first day off 24 January 2017).",
         pdf=_SEN + "2015/15L594FP.pdf"),
    _law("l-220-2016", "Legea nr. 220/2016 pentru completarea alin. (1) al art. 139 din Codul muncii", 140450,
         "2016-11-17", "931", "2016-11-18", "2016-11-21",
         "Adds '1 iunie' after '1 mai' (first day off 1 June 2017).", pdf=_SEN + "2016/16L371FP.pdf"),
    _law("l-64-2018", "Legea nr. 64/2018 pentru completarea alin. (1) al art. 139 din Codul muncii", 149963,
         "2018-03-12", "226", "2018-03-13", "2018-03-16",
         "Adds 'Vinerea Mare, ultima zi de vineri înaintea Paștelui' (first 6 April 2018).", pdf=_SEN + "2018/18L119FP.pdf"),
    _law("l-52-2023", "Legea nr. 52/2023 pentru completarea alin. (1) al art. 139 din Codul muncii", 192392,
         "2023-03-03", "186", "2023-03-06", "2023-03-09",
         "Adds '6 ianuarie – Botezul Domnului – Boboteaza' and '7 ianuarie – Soborul Sfântului Proroc Ioan "
         "Botezătorul' (first 2024).", pdf=_SEN + "2022/22L635LP.pdf",
         note="Issued = promulgation (Decret 189/2023); only the form sent for promulgation was read (the promulgated "
              "PDF is 404). In force 3 days after publication."),
]

RO_FIXED = [
    (1, 1, "Anul Nou", [(1900, None)], "l-53-2003"),
    (1, 2, "Anul Nou (a doua zi)", [(1900, None)], "l-53-2003"),
    (1, 6, "Botezul Domnului – Boboteaza", [(2024, None)], "l-52-2023"),
    (1, 7, "Soborul Sfântului Proroc Ioan Botezătorul", [(2024, None)], "l-52-2023"),
    (1, 24, "Ziua Unirii Principatelor Române", [(2017, None)], "l-176-2016"),
    (5, 1, "Ziua Muncii", [(1900, None)], "l-53-2003"),
    (6, 1, "Ziua Copilului", [(2017, None)], "l-220-2016"),
    (8, 15, "Adormirea Maicii Domnului", [(2009, None)], "l-202-2008"),
    (11, 30, "Sfântul Apostol Andrei", [(2012, None)], "l-147-2012"),
    (12, 1, "Ziua Națională", [(1990, None)], "l-53-2003"),
    (12, 25, "Crăciunul", [(1900, None)], "l-53-2003"),
    (12, 26, "A doua zi de Crăciun", [(1900, None)], "l-53-2003"),
]

_O = {"orthodox": True}
RO_EASTER = [
    (-2, "Vinerea Mare", [(2018, None)], "l-64-2018", _O),
    (0, "Paștele", [(1900, None)], "l-53-2003", _O),
    (1, "A doua zi de Paști", [(1900, None)], "l-53-2003", _O),
    (49, "Rusaliile", [(2009, None)], "l-202-2008", _O),
    (50, "A doua zi de Rusalii", [(2009, None)], "l-202-2008", _O),
]

RO_YEARS = {}
