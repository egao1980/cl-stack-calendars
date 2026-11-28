"""Slovakia: dni pracovného pokoja 2000-2040, transcribed from slov-lex.sk for
egao1980/cl-stack-calendars#23. Stdlib only; data, no logic.

Cache: ~/.cache/cl-stack-calendars/sk/ (dated versions of 241/1993 Z. z. and the amending acts)

Scope: the days of rest of zákon 241/1993 Z. z. § 2: the state holidays of § 1
(unless § 2(3) excludes them) and the sviatky of § 2(2). Sundays are days of
rest anyway; no holiday is a named Sunday. State holidays that are not days of
rest: 28 October (from 2021), 1 September (from 2024), 17 November (from 1 Nov
2025). § 4b: 8 May and 15 September 2026 are not days of rest. § 4a: 30
October 2018 was one.
"""

OBSERVE = True

_SL = "https://static.slov-lex.sk/static/SK/ZZ/"


def _zz(key, year, no, date, title, adopted, published, in_force, summary, note=None, to=None):
    u = f"{_SL}{year}/{no}/{date}.html"
    return dict(key=key, title=title, uri=u, issued=adopted, issued_uri=u, published=published, published_uri=u,
                published_in=f"Zbierka zákonov {no}/{year} Z. z.", in_force=in_force, dates_note=note,
                summary=summary, to=to)


SK_STATUTES = [
    _zz("zz-241-1993", 1993, 241, "20001128", "Zákon č. 241/1993 Z. z. o štátnych sviatkoch, dňoch pracovného pokoja "
        "a pamätných dňoch", "1993-10-20", "1993-10-27", None,
        "§ 1 state holidays (1 Jan, 5 Jul, 29 Aug, 1 Sep) and § 2 days of rest: 6 Jan, Good Friday, Easter Monday, "
        "1 May, 8 May, 15 Sep, 1 Nov, 24-26 Dec.",
        note="The 2000-11-28 version is the earliest dated text on slov-lex; the act's in-force date is not shown."),
    _zz("zz-442-2001", 2001, 442, "20011115", "Zákon č. 442/2001 Z. z. (17. november)", "2001-10-25", "2001-11-08",
        "2001-11-15", "Čl. I: § 1 e) 17. november – Deň boja za slobodu a demokraciu (a state holiday and so a day of "
        "rest). Čl. II: účinnosť 15. novembra 2001.", to="2025-10-31"),
    _zz("zz-281-2018", 2018, 281, "20181011", "Zákon č. 281/2018 Z. z. (§ 4a, 30. október 2018)", "2018-09-12",
        "2018-10-11", "2018-10-11", "§ 4a: V roku 2018 je 30. október – výročie Deklarácie slovenského národa "
        "štátnym sviatkom.", to="2018-12-31"),
    _zz("zz-530-2023", 2023, 530, "20240101", "Zákon č. 530/2023 Z. z., čl. III", "2023-12-19", "2023-12-30",
        "2024-01-01", "Čl. III: § 2 ods. 3 also excludes § 1 písm. d) (1 September) from the days of rest."),
    _zz("zz-261-2025", 2025, 261, "20251101", "Zákon č. 261/2025 Z. z., čl. IV", "2025-09-24", "2025-10-09",
        "2025-11-01", "Čl. IV: § 2 ods. 3 excludes § 1 písm. d), e) and f) (17 November) from the days of rest; § 4b: "
        "V roku 2026 nie sú sviatky uvedené v § 2 ods. 2 písm. e) a j) (15 September, 8 May) dňami pracovného "
        "pokoja."),
]

SK_FIXED = [
    (1, 1, "Deň vzniku Slovenskej republiky", [(1993, None)], "zz-241-1993"),
    (1, 6, "Zjavenie Pána", [(1993, None)], "zz-241-1993"),
    (5, 1, "Sviatok práce", [(1993, None)], "zz-241-1993"),
    (5, 8, "Deň víťazstva nad fašizmom", [(1993, 2025), (2027, None)], "zz-261-2025"),
    (7, 5, "Sviatok svätého Cyrila a svätého Metoda", [(1993, None)], "zz-241-1993"),
    (8, 29, "Výročie Slovenského národného povstania", [(1993, None)], "zz-241-1993"),
    (9, 1, "Deň Ústavy Slovenskej republiky", [(1993, 2023)], "zz-530-2023"),
    (9, 15, "Sedembolestná Panna Mária", [(1993, 2025), (2027, None)], "zz-261-2025"),
    (11, 1, "Sviatok Všetkých svätých", [(1993, None)], "zz-241-1993"),
    (11, 17, "Deň boja za slobodu a demokraciu", [("2001-11-15", "2025-10-31")], "zz-442-2001"),
    (12, 24, "Štedrý deň", [(1993, None)], "zz-241-1993"),
    (12, 25, "Prvý sviatok vianočný", [(1993, None)], "zz-241-1993"),
    (12, 26, "Druhý sviatok vianočný", [(1993, None)], "zz-241-1993"),
]

SK_EASTER = [
    (-2, "Veľký piatok", [(1993, None)], "zz-241-1993"),
    (1, "Veľkonočný pondelok", [(1993, None)], "zz-241-1993"),
]


def _doc(st):
    return {k: st.get(k) for k in ("title", "uri", "issued", "issued_uri", "published", "published_uri",
                                   "published_in", "dates_note")}


SK_YEARS = {
    2018: dict(confidence="primary", covers=[], docs=[_doc(SK_STATUTES[2])],
               days=[("10-30", "Výročie Deklarácie slovenského národa", 0)]),
}
