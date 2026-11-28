"""Italy: giorni festivi agli effetti civili, 2000-2040, transcribed from the
Gazzetta Ufficiale texts on normattiva.it for egao1980/cl-stack-calendars#24.
Stdlib only; data, no logic.

Cache: ~/.cache/cl-stack-calendars/it/ (normattiva pages of each act below).

Scope: the days L. 260/1949 art. 2 (as amended) makes giorni festivi, less the
ones L. 54/1977 art. 1 suppressed, plus the festa nazionale (art. 1). "Tutte le
domeniche" are festive too, but only the Sundays a statute names are listed:
the festa nazionale and the festa dell'Unità nazionale on the first Sunday of
June / November (L. 54/1977). Easter Sunday is not named, so it is not listed.
"""

OBSERVE = True  # rule engine; no weekend rule (none in L. 260/1949)

_N = "https://www.normattiva.it/uri-res/N2Ls?urn:nir:"


def _act(key, title, urn, issued, published, gu, in_force=None, note=None, summary="", to=None):
    u = _N + urn
    return dict(key=key, title=title, uri=u, issued=issued, issued_uri=u, published=published,
                published_uri=u, published_in=gu, in_force=in_force, dates_note=note, summary=summary, to=to)


IT_STATUTES = [
    _act("l-260-1949", "Legge 27 maggio 1949, n. 260, Disposizioni in materia di ricorrenze festive",
         "stato:legge:1949-05-27;260", "1949-05-27", "1949-05-31", "GU n. 124 del 31-05-1949",
         note="Normattiva states no entry into force; :FROM is the GU date.",
         summary="Art. 1: 2 giugno festa nazionale. Art. 2: giorni festivi: tutte le domeniche, 1 gennaio, "
                 "Epifania, San Giuseppe, 25 aprile, lunedì dopo Pasqua, Ascensione, Corpus Domini, 1 maggio, "
                 "SS. Pietro e Paolo, Assunzione, Ognissanti, 4 novembre, Immacolata, Natale, 26 dicembre."),
    _act("l-54-1977", "Legge 5 marzo 1977, n. 54, Disposizioni in materia di giorni festivi",
         "stato:legge:1977-03-05;54", "1977-03-05", "1977-03-07", "GU n. 63 del 07-03-1977",
         note="Normattiva states no entry into force; :FROM is the GU date.",
         summary="Art. 1: Epifania, San Giuseppe, Ascensione, Corpus Domini, SS. Pietro e Paolo cease to be "
                 "festivi agli effetti civili; from 1977 the festa nazionale della Repubblica and the festa "
                 "dell'Unità nazionale are celebrated on the first Sunday of June and of November; 2 giugno and "
                 "4 novembre cease to be festivi."),
    _act("dpr-792-1985", "D.P.R. 28 dicembre 1985, n. 792 (festività religiose, accordo con la Santa Sede)",
         "presidente.repubblica:decreto:1985-12-28;792", "1985-12-28", "1985-12-31", "GU n. 306 del 31-12-1985",
         in_force="1986-01-01",
         summary="Art. 1: festività religiose: tutte le domeniche, 1 gennaio, 6 gennaio (Epifania restored), "
                 "15 agosto, 1 novembre, 8 dicembre, 25 dicembre (29 giugno for Rome only)."),
    _act("l-336-2000", "Legge 20 novembre 2000, n. 336, Ripristino della festività nazionale del 2 giugno",
         "stato:legge:2000-11-20;336", "2000-11-20", "2000-11-22", "GU n. 273 del 22-11-2000",
         note="Normattiva states no entry into force; the act applies 'a decorrere dal 2001'.",
         summary="Art. 1: from 2001 the festa nazionale della Repubblica is again celebrated on 2 June, restored "
                 "as a giorno festivo. So 2000-06-02 (a Friday) was a working day; the 2000 festa was Sunday 4 June."),
    _act("dl-5-2011", "Decreto-legge 22 febbraio 2011, n. 5, Disposizioni per la festa nazionale del 17 marzo 2011 "
         "(convertito dalla L. 21 aprile 2011, n. 47)",
         "stato:decreto.legge:2011-02-22;5", "2011-02-22", "2011-02-23", "GU n. 44 del 23-02-2011",
         in_force="2011-02-24", to="2011-12-31",
         summary="Art. 1(1): limitatamente all'anno 2011, il giorno 17 marzo è considerato giorno festivo ai sensi "
                 "degli articoli 2 e 4 della legge 27 maggio 1949, n. 260 (150th anniversary of unification)."),
    _act("l-27-2024", "Legge 1 marzo 2024, n. 27, Istituzione della Giornata dell'Unità nazionale e delle Forze armate",
         "stato:legge:2024-03-01;27", "2024-03-01", "2024-03-16", "GU n. 64 del 16-03-2024", in_force="2024-03-17",
         summary="Art. 1: 4 November is the Giornata dell'Unità nazionale e delle Forze armate; it does not have the "
                 "civil effects of L. 260/1949 (no day off). Recorded to show 4 November stays a working day."),
    _act("l-151-2025", "Legge 8 ottobre 2025, n. 151, Istituzione della festa nazionale di San Francesco d'Assisi",
         "stato:legge:2025-10-08;151", "2025-10-08", "2025-10-10", "GU n. 236 del 10-10-2025", in_force="2026-01-01",
         summary="Art. 1(2) inserts in L. 260/1949 art. 2: 'il 4 ottobre: festa nazionale di San Francesco d'Assisi, "
                 "patrono d'Italia'. In force 1 January 2026."),
]

# (month, day, name, eras, statute). Eras before 1949 are the starter's
# (not researched); the gold starts in 2000.
IT_FIXED = [
    (1, 1, "Capodanno", [(1900, None)], "l-260-1949"),
    (1, 6, "Epifania", [(1900, 1976), (1986, None)], "dpr-792-1985"),
    (4, 25, "Anniversario della Liberazione", [(1946, None)], "l-260-1949"),
    (5, 1, "Festa del Lavoro", [(1900, None)], "l-260-1949"),
    (6, 2, "Festa della Repubblica", [(1946, 1976), (2001, None)], "l-336-2000"),
    (8, 15, "Assunzione (Ferragosto)", [(1900, None)], "l-260-1949"),
    (10, 4, "San Francesco d'Assisi", [(2026, None)], "l-151-2025"),
    (11, 1, "Ognissanti", [(1900, None)], "l-260-1949"),
    (12, 8, "Immacolata Concezione", [(1900, None)], "l-260-1949"),
    (12, 25, "Natale", [(1900, None)], "l-260-1949"),
    (12, 26, "Santo Stefano", [(1900, None)], "l-260-1949"),
]

IT_EASTER = [(1, "Lunedì dell'Angelo", [(1900, None)], "l-260-1949")]

# L. 54/1977 art. 1: the celebrations on the first Sunday of June (to 2000,
# L. 336/2000) and of November (still the law; L. 27/2024 gives 4 November no
# civil effects).
IT_NTH = [
    (6, 7, 1, "Festa della Repubblica (prima domenica di giugno)", [(1977, 2000)], "l-54-1977"),
    (11, 7, 1, "Festa dell'Unità nazionale (prima domenica di novembre)", [(1977, None)], "l-54-1977"),
]

IT_YEARS = {
    2011: dict(
        confidence="primary", covers=[],
        docs=[dict(title="Decreto-legge 22 febbraio 2011, n. 5, art. 1 (17 marzo 2011 giorno festivo)",
                   uri=_N + "stato:decreto.legge:2011-02-22;5", issued="2011-02-22",
                   issued_uri=_N + "stato:decreto.legge:2011-02-22;5", published="2011-02-23",
                   published_uri=_N + "stato:decreto.legge:2011-02-22;5", published_in="GU n. 44 del 23-02-2011")],
        days=[("03-17", "Festa nazionale per il 150º anniversario dell'Unità d'Italia", 0)],
    ),
}
