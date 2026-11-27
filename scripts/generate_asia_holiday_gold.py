#!/usr/bin/env python3
# /// script
# requires-python = ">=3.10"
# dependencies = ["holidays==0.109"]
# ///
"""Build the East and Southeast Asia national-holiday gold fixtures,
data/tests/<cc>-holiday-gold.sexp.

Regenerate one country (or all with no argument):

    uv run --no-project --with holidays==0.109 python -I scripts/generate_asia_holiday_gold.py KR

Each fixture lists every national holiday 2000-2040 as (YEAR MONTH DAY "name").
The days come from the primary sources cited in the fixture's :sources: the
statute or decree text, transcribed below article by article, the official
lunar calendar of the country (fetched from its astronomical authority), and
the government's own yearly lists where they are fetchable. This script never
reads the Lisp starters, so the fixture is an independent check of them.

Fetched pages are cached under ~/.cache/cl-stack-calendars/ and fetched again
only when missing; fetches retry with backoff.

Python `holidays` is a secondary source only: the script prints every day on
which it disagrees with the fixture, with no effect on the fixture.
"""

from __future__ import annotations

import html
import json
import re
import sys
import time
import urllib.request
from datetime import date, timedelta
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
FIRST, LAST = 2000, 2040
GENERATED = "2026-11-27"
CACHE = Path.home() / ".cache" / "cl-stack-calendars"
UA = "Mozilla/5.0 (cl-stack-calendars holiday gold)"
HND_URI = ("https://web.archive.org/web/2023id_/"
           "https://www.informatik.uni-leipzig.de/~duc/amlich/JavaScript/amlich-hnd.js")


def fetch(url: str, data: bytes | None = None, tries: int = 8) -> bytes:
    delay = 5
    for attempt in range(tries):
        try:
            req = urllib.request.Request(url, data=data, headers={"User-Agent": UA})
            with urllib.request.urlopen(req, timeout=120) as resp:
                return resp.read()
        except Exception:  # noqa: BLE001 - retry any transport error, then give up
            if attempt == tries - 1:
                raise
            time.sleep(delay)
            delay = min(2 * delay, 120)
    raise AssertionError("unreachable")


def cached(rel: str, url: str, min_size: int = 1) -> bytes:
    path = CACHE / rel
    if not path.exists() or path.stat().st_size < min_size:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(fetch(url))
    return path.read_bytes()


def page_text(raw: bytes) -> str:
    """Visible text of an HTML page, one cell per |."""
    t = raw.decode("utf-8", "replace")
    t = re.sub(r"<script.*?</script>", "", t, flags=re.S)
    t = re.sub(r"<style.*?</style>", "", t, flags=re.S)
    t = html.unescape(re.sub(r"<[^>]+>", "\n", t))
    return re.sub(r"\s*\n\s*", "|", t)


def easter_western(year: int) -> date:
    """Gregorian Easter Sunday (Meeus/Jones/Butcher)."""
    a, b, c = year % 19, year // 100, year % 100
    d, e = b // 4, b % 4
    f = (b + 8) // 25
    g = (b - f + 1) // 3
    h = (19 * a + b - d - g + 15) % 30
    i, k = c // 4, c % 4
    l = (32 + 2 * e + 2 * i - h - k) % 7
    m = (a + 11 * h + 22 * l) // 451
    month = (h + l - 7 * m + 114) // 31
    return date(year, month, (h + l - 7 * m + 114) % 31 + 1)


def first_weekday_on_or_after(d: date, weekday: int) -> date:
    """WEEKDAY is Python's (Monday 0 ... Sunday 6)."""
    return d + timedelta(days=(weekday - d.weekday()) % 7)


# --- South Korea ----------------------------------------------------------
#
# 「관공서의 공휴일에 관한 규정」 (대통령령), the text of each era. The 2017 text
# is the ko.wikisource copy of 대통령령 제28394호; the 2021, 2023 and 2026
# texts are the current law.go.kr text (대통령령 제36290호, 시행 2026-05-11)
# with its 개정 notes and 부칙. Lunar dates: KASI 음양력 변환 (the non-leap
# "평" month), the authority the 월력요항 itself is computed by.

LAW_KR = "https://www.law.go.kr/법령/관공서의공휴일에관한규정"
KASI_LUNC = "https://astro.kasi.re.kr/life/lunc?yyyy={y:04d}&mm={m:02d}&dd={d:02d}"
KASI_CALENDAR_DATA = "https://astro.kasi.re.kr/kor/life/post/calendarData?search_year={y}"

KR_SOURCES = [
    ("관공서의 공휴일에 관한 규정 (대통령령 제36290호, 2026. 4. 30., 시행 2026. 5. 11.) 제2조", LAW_KR,
     "1. 일요일 2. 「국경일에 관한 법률」에 따른 국경일 3. 1월 1일 4. 설날 전날, 설날, 설날 다음 날"
     "(음력 12월 말일, 1월 1일, 2일) 5. 부처님 오신 날(음력 4월 8일) 6. 노동절(5월 1일) 7. 어린이날(5월 5일) "
     "8. 현충일(6월 6일) 9. 추석 전날, 추석, 추석 다음 날(음력 8월 14일, 15일, 16일) 10. 기독탄신일(12월 25일) "
     "10의2. 「공직선거법」 제34조에 따른 임기만료에 의한 선거의 선거일 11. 그 밖에 정부에서 수시 지정하는 날. "
     "부칙: 2026년 5월 1일부터 시행; 제2조제2호(국경일 전부, 즉 제헌절)는 2026년 5월 11일부터."),
    ("관공서의 공휴일에 관한 규정 제3조 (대체공휴일) [전문개정 2021. 8. 4. 대통령령 제31930호; 개정 2023. 5. 4. "
     "제33448호, 2026. 4. 30. 제36290호]", LAW_KR,
     "① 제2조제2호부터 제10호까지의 공휴일이 다음 각 호의 어느 하나에 해당하는 경우에는 그 공휴일 다음의 첫 번째 "
     "비공휴일(제2조 각 호의 공휴일이 아닌 날)을 대체공휴일로 한다. 1. 제2조제2호, 제5호부터 제7호까지 또는 제10호의 "
     "공휴일이 토요일이나 일요일과 겹치는 경우 2. 제2조제4호 또는 제9호의 공휴일이 일요일과 겹치는 경우 3. 제2조제2호, "
     "제4호부터 제7호까지, 제9호 또는 제10호의 공휴일이 토요일ㆍ일요일이 아닌 날에 같은 조 제2호부터 제10호까지의 "
     "규정에 따른 다른 공휴일과 겹치는 경우 ② 대체공휴일이 같은 날에 겹치는 경우에는 그 대체공휴일 다음의 첫 번째 "
     "비공휴일까지 대체공휴일로 한다. ③ 대체공휴일이 토요일인 경우에는 그 다음의 첫 번째 비공휴일을 대체공휴일로 한다. "
     "(2021. 8. 4. text: 국경일 and 어린이날 on 토/일; 2023. 5. 4.: 부처님오신날, 기독탄신일 added; 2026. 4. 30.: 노동절.)"),
    ("관공서의 공휴일에 관한 규정 (대통령령 제28394호, 2017. 10. 17.) 제2조·제3조",
     "https://ko.wikisource.org/wiki/관공서의_공휴일에_관한_규정_(제28394호)",
     "제2조 2. 국경일 중 3·1절, 광복절, 개천절 및 한글날 3. 1월 1일 ... 10의2. 선거일. 제3조(대체공휴일, 대통령령 "
     "제24828호 2013. 11. 5. 신설) ① 제2조제4호 또는 제9호(설날·추석)에 따른 공휴일이 다른 공휴일과 겹칠 경우 ... "
     "다음의 첫 번째 비공휴일을 공휴일로 한다. ② 제2조제7호(어린이날)에 따른 공휴일이 토요일이나 다른 공휴일과 겹칠 "
     "경우 ... 다음의 첫 번째 비공휴일을 공휴일로 한다."),
    ("관공서의 공휴일에 관한 규정 부칙 (대통령령 제15939호 1998. 12. 18.; 제18893호 2005. 6. 30.; 제19674호 "
     "2006. 9. 6.; 제24273호 2012. 12. 28.)", LAW_KR,
     "제15939호: 1월 1일만 공휴일 (1999. 1. 1. 시행; 1월 2일 삭제). 제18893호: 식목일 삭제(공포한 날부터 시행), "
     "제헌절은 2007년 12월 31일까지 공휴일. 제19674호: 제10의2호 선거일 신설. 제24273호: 국경일 중 한글날 추가."),
    ("공직선거법 제34조 (선거일) [개정 2004. 3. 12.]",
     "https://ko.wikisource.org/wiki/공직선거법_(대한민국)",
     "① 1. 대통령선거는 그 임기만료일전 70일 이후 첫번째 수요일 2. 국회의원선거는 그 임기만료일전 50일 이후 "
     "첫번째 수요일 3. 지방의회의원 및 지방자치단체의 장의 선거는 그 임기만료일전 30일 이후 첫번째 수요일 ② 제1항의 "
     "규정에 의한 선거일이 국민생활과 밀접한 관련이 있는 민속절 또는 공휴일인 때와 선거일전일이나 그 다음날이 "
     "공휴일인 때에는 그 다음주의 수요일로 한다."),
    ("한국천문연구원(KASI) 음양력 변환", "https://astro.kasi.re.kr/life/pageView/8",
     "음력 1월 1일, 4월 8일, 8월 15일의 양력 날짜 (평달), JSON /life/lunc."),
    ("월력요항 / KASI 달력자료 2021-2028 (국경일과 공휴일)",
     "https://astro.kasi.re.kr/kor/life/post/calendarData?search_year=2027",
     "우주항공청 공고 제2026-0078호 (2027년 월력요항, 관보 2026-06-29); the KASI 달력자료 tables of each year."),
    ("임시공휴일 (규정 제2조제11호, 제4조 국무회의 심의)",
     "https://www.mpm.go.kr/mpm/comm/newsPress/newsPressRelease/",
     "2002-07-01 (월드컵 4강); 2015-08-14 (국무회의 2015-08-04); 2016-05-06 (2016-05-03); 2017-05-09 "
     "(제19대 대통령 궐위선거); 2017-10-02 (2017-09-05); 2020-08-17 (2020-07-21); 2023-10-02 (2023-09-05, "
     "인사혁신처 공고 제2023-400호); 2024-10-01 (2024-09-03); 2025-01-27 (2025-01-14); 2025-06-03 (제21대 "
     "대통령 궐위선거, 국무회의 2025-04-08). Before 제10의2호 (2006-09-06) each 선거일 was a 임시공휴일: "
     "2000-04-13, 2002-06-13, 2002-12-19, 2004-04-15, 2006-05-31."),
    ("인사혁신처 보도자료 2026-04-28 (노동절·제헌절 공휴일)",
     "https://www.mpm.go.kr/mpm/comm/newsPress/newsPressRelease/?cntId=4250&mode=view",
     "노동절(5. 1.)과 제헌절(7. 17.)을 관공서 공휴일로; 노동절과 제헌절에 대체공휴일도 적용된다."),
]

KR_NOTE = (
    "관공서의 공휴일: the days of 규정 제2조 of each era, the 제3조 대체공휴일, the 제10의2호 election days "
    "(공직선거법 제34조, computed for every term-expiry election from 2006-09-06) and the 임시공휴일 "
    "designated by the Government. Sundays are 공휴일 but not listed. 근로자의 날 before 2026 is a paid "
    "day off under its own law, not a 관공서 공휴일. Lunar dates are KASI's. Checked against the KASI "
    "달력자료 2021-2028. KASI's data.go.kr special-day API (getRestDeInfo) needs a service key and was "
    "not used."
)

# 임시공휴일 and pre-2006 election days (규정 제2조제11호).
KR_TEMPORARY = {
    date(2000, 4, 13): "제16대 국회의원 선거일",
    date(2002, 6, 13): "제3회 전국동시지방선거일",
    date(2002, 7, 1): "임시공휴일 (월드컵 4강)",
    date(2002, 12, 19): "제16대 대통령 선거일",
    date(2004, 4, 15): "제17대 국회의원 선거일",
    date(2006, 5, 31): "제4회 전국동시지방선거일",
    date(2015, 8, 14): "임시공휴일 (광복 70주년)",
    date(2016, 5, 6): "임시공휴일",
    date(2017, 5, 9): "제19대 대통령 선거일",
    date(2017, 10, 2): "임시공휴일",
    date(2020, 8, 17): "임시공휴일",
    date(2023, 10, 2): "임시공휴일",
    date(2024, 10, 1): "임시공휴일 (국군의 날)",
    date(2025, 1, 27): "임시공휴일",
    date(2025, 6, 3): "제21대 대통령 선거일",
}

# Term-expiry dates (임기만료일) that 공직선거법 제34조 counts back from.
KR_PRESIDENT_TERM_ENDS = [date(2008, 2, 24), date(2013, 2, 24), date(2022, 5, 9),
                          date(2030, 6, 3), date(2035, 6, 3), date(2040, 6, 3)]


def kasi_lunar(y: int, m: int, d: int) -> date:
    raw = cached(f"kasi/lunc-{y:04d}-{m:02d}-{d:02d}.json", KASI_LUNC.format(y=y, m=m, d=d))
    rows = [r for r in json.loads(raw) if r["LUNC_LEAP_MM"] == "평"]
    assert len(rows) == 1, (y, m, d, rows)
    r = rows[0]
    return date(int(r["SOLC_YYYY"]), int(r["SOLC_MM"]), int(r["SOLC_DD"]))


def kr_nominal(year: int) -> list[tuple[date, str, str]]:
    """규정 제2조 days of YEAR (no Sundays, elections or 임시공휴일): (date, name, kind)."""
    out = [(date(year, 1, 1), "1월 1일", "newyear")]
    seol = kasi_lunar(year, 1, 1)
    out += [(seol - timedelta(days=1), "설날 전날", "seol"), (seol, "설날", "seol"),
            (seol + timedelta(days=1), "설날 다음 날", "seol")]
    out.append((date(year, 3, 1), "3·1절", "national"))
    if year <= 2005:  # 대통령령 제18893호 (2005. 6. 30.): 식목일 삭제
        out.append((date(year, 4, 5), "식목일", "other"))
    if year >= 2026:  # 대통령령 제36290호: 노동절, 2026. 5. 1. 시행
        out.append((date(year, 5, 1), "노동절", "labor"))
    out.append((kasi_lunar(year, 4, 8), "부처님오신날" if year >= 2018 else "석가탄신일", "buddha"))
    out.append((date(year, 5, 5), "어린이날", "children"))
    out.append((date(year, 6, 6), "현충일", "other"))
    if year <= 2007 or year >= 2026:  # 제18893호 부칙 ②; 제36290호 (2026. 5. 11.)
        out.append((date(year, 7, 17), "제헌절", "national"))
    out.append((date(year, 8, 15), "광복절", "national"))
    chuseok = kasi_lunar(year, 8, 15)
    out += [(chuseok - timedelta(days=1), "추석 전날", "chuseok"), (chuseok, "추석", "chuseok"),
            (chuseok + timedelta(days=1), "추석 다음 날", "chuseok")]
    out.append((date(year, 10, 3), "개천절", "national"))
    if year >= 2013:  # 대통령령 제24273호 (2012. 12. 28.)
        out.append((date(year, 10, 9), "한글날", "national"))
    out.append((date(year, 12, 25), "기독탄신일", "xmas"))
    return out


def kr_substitute_classes(d: date) -> tuple[set, set, set, bool]:
    """(Saturday kinds, Sunday kinds, weekday-overlap kinds, Saturday-substitute allowed)
    of 규정 제3조 in force on D."""
    if d < date(2013, 11, 5):
        return set(), set(), set(), True
    if d < date(2021, 8, 4):
        # 제24828호: 설날·추석 overlapping another 공휴일 (a Sunday is one);
        # 어린이날 overlapping a Saturday or another 공휴일.
        return {"children"}, {"seol", "chuseok", "children"}, {"seol", "chuseok", "children"}, True
    weekend = {"national", "children"}
    if d >= date(2023, 5, 4):
        weekend |= {"buddha", "xmas"}
    if d >= date(2026, 5, 1):
        weekend |= {"labor"}
    return weekend, weekend | {"seol", "chuseok"}, weekend | {"seol", "chuseok"}, False


def kr_substitutes(nominal: list[tuple[date, str, str]], extra_days: set) -> list[tuple[date, str]]:
    """규정 제3조 대체공휴일 for the nominal days; EXTRA_DAYS are other 공휴일
    (elections, 임시공휴일) a substitute cannot take."""
    by_day: dict[date, list[tuple[str, str]]] = {}
    for d, name, kind in nominal:
        by_day.setdefault(d, []).append((name, kind))
    taken = set(by_day) | extra_days
    out = []
    for d in sorted(by_day):
        sat_kinds, sun_kinds, overlap_kinds, saturday_ok = kr_substitute_classes(d)
        entries = [(n, k) for n, k in by_day[d] if k != "other" or len(by_day[d]) > 1]
        if d.weekday() == 5:
            lost = [n for n, k in entries if k in sat_kinds]
        elif d.weekday() == 6:
            lost = [n for n, k in entries if k in sun_kinds]
        elif len(by_day[d]) >= 2 and any(k in overlap_kinds for _, k in by_day[d]):
            # One lost day per overlap: 2025-05-05 (부처님오신날, 어린이날) → 05-06 only.
            lost = [" · ".join(n for n, _ in by_day[d])] * (len(by_day[d]) - 1)
        else:
            lost = []
        for name in lost:
            s = d + timedelta(days=1)
            while s in taken or s.weekday() == 6 or (s.weekday() == 5 and not saturday_ok):
                s += timedelta(days=1)
            taken.add(s)
            out.append((s, f"대체공휴일 ({name})"))
    return out


def kr_election_days(year: int, holidays_of_year) -> list[tuple[date, str]]:
    """공직선거법 제34조 election days of YEAR from 2006-09-06 (규정 제10의2호)."""
    terms = []
    for end in KR_PRESIDENT_TERM_ENDS:
        terms.append((end - timedelta(days=70), "대통령 선거일"))
    for y in range(2008, LAST + 1, 4):
        terms.append((date(y, 5, 29) - timedelta(days=50), "국회의원 선거일"))
    for y in range(2010, LAST + 1, 4):
        terms.append((date(y, 6, 30) - timedelta(days=30), "전국동시지방선거일"))
    out = []
    for start, name in terms:
        if start.year != year:
            continue
        d = first_weekday_on_or_after(start, 2)
        off = holidays_of_year(d.year)
        if d in off or d - timedelta(days=1) in off or d + timedelta(days=1) in off:
            d += timedelta(days=7)  # 제34조 ②
        out.append((d, name))
    return out


def _kr_base_days(year: int) -> set:
    nominal = kr_nominal(year)
    extra = {d for d in KR_TEMPORARY if d.year == year}
    return {d for d, _, _ in nominal} | {d for d, _ in kr_substitutes(nominal, extra)} | extra


def kr_holidays(year: int) -> list[tuple[date, str]]:
    nominal = kr_nominal(year)
    elections = kr_election_days(year, _kr_base_days)
    extra = {d for d in KR_TEMPORARY if d.year == year} | {d for d, _ in elections}
    out = [(d, n) for d, n, _ in nominal]
    out += [(d, n) for d, n in KR_TEMPORARY.items() if d.year == year]
    out += elections
    out += kr_substitutes(nominal, extra)
    return out


# Where the KASI 달력자료 (published before the event) and the decrees disagree.
KR_OFFICIAL_OVERRIDES = {
    date(2023, 5, 29): "gold only: 대체공휴일 (부처님오신날), 대통령령 제33448호 (2023-05-04), after the 2023 월력요항.",
    date(2023, 10, 2): "gold only: 임시공휴일, 국무회의 2023-09-05 (after the 2023 월력요항).",
    date(2024, 10, 1): "gold only: 임시공휴일, 국무회의 2024-09-03.",
    date(2025, 1, 27): "gold only: 임시공휴일, 국무회의 2025-01-14.",
    date(2025, 6, 3): "gold only: 제21대 대통령 궐위선거 임시공휴일, 국무회의 2025-04-08.",
    date(2026, 5, 1): "gold only: 노동절, 대통령령 제36290호 (2026-05-01 시행).",
    date(2026, 7, 17): "gold only: 제헌절, 대통령령 제36290호 (2026-05-11 시행).",
}


def _kr_official_days() -> dict[int, set]:
    """The 국경일과 공휴일 table of the KASI 달력자료 page of each year 2021-2028."""
    weekday_cell = re.compile(r"\(?[월화수목금토일,]+\)?")
    span = re.compile(r"(\d+)월\s*(\d+)일\s*(?:(\d+)월)?\s*~\s*(?:(\d+)월\s*)?(\d+)일")
    single = re.compile(r"(\d+)월\s*(\d+)일")
    out = {}
    for y in range(2021, 2029):
        t = page_text(cached(f"kr/calendar-data-{y}.html", KASI_CALENDAR_DATA.format(y=y), 10000))
        i = t.find("국경일과", t.find("자료생성"))
        cells = t[i:t.find("국경일이지만", i)].split("|")[1:]
        days, segment = set(), []
        for c in cells:
            if weekday_cell.fullmatch(c.strip()):
                segment = []
                continue
            m = span.search(c) or single.search(c)
            if not m:
                segment.append(c)
                continue
            label = re.sub(r"\s+", "", "".join(segment) + c[:m.start()])
            segment = []
            if "**" in label:  # 국경일이지만 공휴일 아님
                continue
            a = date(y, int(m.group(1)), int(m.group(2)))
            if m.re is span:
                b = date(y, int(m.group(3) or m.group(4) or m.group(1)), int(m.group(5)))
            else:
                b = a
            days |= {a + timedelta(days=n) for n in range((b - a).days + 1)}
        out[y] = days
    return out


def kr_official_check(days: dict) -> None:
    official = _kr_official_days()
    diff = set()
    for year, listed in official.items():
        ours = {d for d in days if d.year == year}
        # Sundays inside a listed block (설날/추석) are 공휴일 either way.
        diff |= listed ^ ours
    unexplained = sorted(d for d in diff if d not in KR_OFFICIAL_OVERRIDES)
    assert not unexplained, unexplained
    assert set(KR_OFFICIAL_OVERRIDES) <= diff, sorted(set(KR_OFFICIAL_OVERRIDES) - diff)
    print(f"  KR 2021-2028: KASI 달력자료 agrees except {len(diff)} listed overrides")



# --- Hong Kong ------------------------------------------------------------
#
# General Holidays Ordinance (Cap. 149), Schedule as replaced by 35 of 1998
# s. 4 and amended by 23 of 2011 s. 3, and its s. 6(2) (two general holidays
# on one day: the next day that is not itself a general holiday). Lunar
# dates and Ching Ming (the "Bright & Clear" solar term) come from the Hong
# Kong Observatory Gregorian-Lunar Calendar Conversion Tables. Checked
# against the yearly gazetted lists: info.gov.hk 1999-2006 and gov.hk
# 2007-2027 (Wayback copies), and the 1823 calendar JSON 2025-2027.

CAP149 = "https://www.elegislation.gov.hk/hk/cap149"
HKO_TABLE = "https://www.hko.gov.hk/en/gts/time/calendar/text/files/T{y}e.txt"
HK_1823 = "https://www.1823.gov.hk/common/ical/en.json"

HK_SOURCES = [
    ("General Holidays Ordinance (Cap. 149), Schedule (replaced 35 of 1998 s. 4; amended 23 of 2011 s. 3)", CAP149,
     "(a) every Sunday; (b) the first day of January (or if that day is a Sunday, then the following day); "
     "(c)-(e) Lunar New Year's Day, the second and the third day of Lunar New Year (or if that day is a Sunday, "
     "then the fourth day of Lunar New Year); (f) Ching Ming Festival (Sunday: the following day); (g) Good "
     "Friday; (h) the day following Good Friday; (i) Easter Monday; (j) Labour Day, the first day of May; (k) "
     "the Birthday of the Buddha, the eighth day of the fourth lunar month; (l) Tuen Ng Festival; (m) HKSAR "
     "Establishment Day, 1 July; (n) National Day, 1 October; (o) the day following the Chinese Mid-Autumn "
     "Festival (or if that day is a Sunday, then the second day following that Festival); (p) Chung Yeung "
     "Festival; (q) Christmas Day (or if that day is a Sunday, then the second weekday after Christmas Day); "
     "(r) the first weekday after Christmas Day. (j)-(n), (p): Sunday gives the following day. Before 23 of "
     "2011, a Sunday among the three Lunar New Year days gave the day preceding Lunar New Year's Day, and a "
     "Sunday day-following-Mid-Autumn gave the day of the festival (lists 2002, 2009)."),
    ("General Holidays Ordinance (Cap. 149) s. 6(2) (replaced 35 of 1998 s. 3)", CAP149,
     "Subject to subsection (3), if in any year two general holidays fall on the same day, the next following "
     "day that is not itself a general holiday is to be observed as an additional general holiday in that year."),
    ("L.N. 191 of 1999; 9 of 2015 s. 2(a) (Cap. 149 editorial notes)", CAP149,
     "31 December 1999 appointed an additional general holiday; 3 September 2015 (70th anniversary of the "
     "victory of the Chinese people's War of Resistance) a general holiday for 2015."),
    ("Hong Kong Observatory, Gregorian-Lunar Calendar Conversion Tables",
     "https://www.hko.gov.hk/en/gts/time/conversion.htm",
     "Lunar months and days, and the 24 solar terms (Ching Ming = 'Bright & Clear'), T1999e.txt-T2041e.txt."),
    ("General holidays for 1999-2006 (info.gov.hk, Wayback)", "https://www.info.gov.hk/info/holiday_e.htm",
     "The gazetted lists, e.g. 2003: 'As the second day of the Lunar New Year falls on a Sunday, the day "
     "preceding the Lunar New Year's Day will be designated as an additional general holiday.'"),
    ("General holidays for 2007-2027 (gov.hk)", "https://www.gov.hk/en/about/abouthk/holiday/2027.htm",
     "The yearly gazetted lists (2007-2026 from Wayback captures, 2027 live)."),
    ("1823 general holidays calendar (JSON)", HK_1823, "General holidays 2025-2027."),
]

HK_NOTE = (
    "General holidays of Cap. 149 (Schedule (b)-(r) and s. 6(2)), plus the additional days appointed by "
    "resolution. Sundays are general holidays but are not listed; a scheduled day that falls on a Sunday "
    "is listed on its own date and its substitute too. Lunar dates and Ching Ming are the Hong Kong "
    "Observatory's. Checked day by day against the gazetted lists 1999-2027."
)

HK_ADDITIONAL = {
    date(2015, 9, 3): "70th anniversary of the victory of the Chinese people's War of Resistance",
}


def hko_days(year: int) -> dict:
    """{date: (lunar month, lunar day, leap?, solar term)} of the HKO table of YEAR.
    A month name that repeats the month before it is the leap month."""
    raw = cached(f"hk/hko-T{year}e.txt", HKO_TABLE.format(y=year), 10000).decode("latin-1")
    out, month, leap, day = {}, None, False, None
    row = re.compile(r"^(\d{4})/(\d+)/(\d+)\s+(\d+(?:\w\w Lunar Month)?)\s+\w+day\s*(.*)$", re.I)
    for line in raw.splitlines():
        m = row.match(line.strip())
        if not m:
            continue
        d = date(int(m.group(1)), int(m.group(2)), int(m.group(3)))
        cell, term = m.group(4), m.group(5).strip()
        if cell.lower().endswith("lunar month"):
            n = int(re.match(r"\d+", cell).group())
            leap = n == month
            month, day = n, 1
        else:
            day = int(cell)
        if month is not None:
            out[d] = (month, day, leap, term)
    return out


def hk_lunar(year: int, month: int, day: int) -> date:
    """The Gregorian date in YEAR of the non-leap lunar MONTH/DAY (HKO)."""
    hits = []
    for y in (year - 1, year, year + 1):
        for d, (m, dd, leap, _) in hko_days(y).items():
            if d.year == year and m == month and dd == day and not leap:
                hits.append(d)
    assert len(hits) == 1, (year, month, day, hits)
    return hits[0]


def hk_ching_ming(year: int) -> date:
    hits = [d for d, v in hko_days(year).items() if v[3] == "Bright & Clear"]
    assert len(hits) == 1, (year, hits)
    return hits[0]


def hk_holidays(year: int) -> list[tuple[date, str]]:
    sunday = lambda d: d.weekday() == 6
    lny = hk_lunar(year, 1, 1)
    easter = easter_western(year)
    mid_autumn = hk_lunar(year, 8, 15)
    xmas = date(year, 12, 25)
    out: list[tuple[date, str]] = []
    taken: set = set()

    def add(d, name):
        out.append((d, name))
        taken.add(d)

    def scheduled(d, name, sunday_gives=None):
        add(d, name)
        if sunday(d):
            pending.append((sunday_gives or (d + timedelta(days=1)), f"The day following {name}"))

    pending: list = []
    scheduled(date(year, 1, 1), "The first day of January")
    lny_names = ["Lunar New Year's Day", "The second day of Lunar New Year", "The third day of Lunar New Year"]
    for i, name in enumerate(lny_names):
        add(lny + timedelta(days=i), name)
    if any(sunday(lny + timedelta(days=i)) for i in range(3)):
        if year >= 2012:  # 23 of 2011 s. 3
            add(lny + timedelta(days=3), "The fourth day of Lunar New Year")
        else:
            add(lny - timedelta(days=1), "The day preceding Lunar New Year's Day")
    scheduled(hk_ching_ming(year), "Ching Ming Festival")
    add(easter - timedelta(days=2), "Good Friday")
    add(easter - timedelta(days=1), "The day following Good Friday")
    add(easter + timedelta(days=1), "Easter Monday")
    scheduled(date(year, 5, 1), "Labour Day")
    scheduled(hk_lunar(year, 4, 8), "The Birthday of the Buddha")
    scheduled(hk_lunar(year, 5, 5), "Tuen Ng Festival")
    scheduled(date(year, 7, 1), "Hong Kong Special Administrative Region Establishment Day")
    scheduled(date(year, 10, 1), "National Day")
    following = mid_autumn + timedelta(days=1)
    if not sunday(following):
        add(following, "The day following the Chinese Mid-Autumn Festival")
    elif year >= 2012:  # 23 of 2011 s. 3
        add(following + timedelta(days=1), "The second day following the Chinese Mid-Autumn Festival")
    else:  # before 23 of 2011: the day of the festival (2002, 2009 lists)
        add(mid_autumn, "Chinese Mid-Autumn Festival")
    scheduled(hk_lunar(year, 9, 9), "Chung Yeung Festival")
    # (q), (r): a weekday is any day but Sunday.
    weekdays_after = [xmas + timedelta(days=n) for n in range(1, 4) if not sunday(xmas + timedelta(days=n))]
    add(xmas, "Christmas Day")
    add(weekdays_after[0], "The first weekday after Christmas Day")
    if sunday(xmas):
        add(weekdays_after[1], "The second weekday after Christmas Day")
    for d, name in HK_ADDITIONAL.items():
        if d.year == year:
            add(d, name)
    # Sunday substitutes, then s. 6(2) for two general holidays on one day.
    counts: dict = {}
    for d, _ in out:
        counts[d] = counts.get(d, 0) + 1
    for d, name in pending:
        counts[d] = counts.get(d, 0) + 1
        out.append((d, name))
        taken.add(d)
    for d in sorted(counts):
        for _ in range(counts[d] - 1):
            s = d + timedelta(days=1)
            while s in taken or sunday(s):
                s += timedelta(days=1)
            taken.add(s)
            out.append((s, "Additional general holiday (Cap. 149 s. 6(2))"))
    return out


HK_MONTHS = {m: i + 1 for i, m in enumerate(
    ["january", "february", "march", "april", "may", "june", "july", "august", "september",
     "october", "november", "december"])}


def hk_official_days() -> dict[int, set]:
    """The gazetted general holidays (Sundays left out) of each year 2000-2027:
    info.gov.hk (2000-2006) and gov.hk (2007-2027) pages, cached from Wayback."""
    out = {}
    for y in range(2000, 2028):
        rel = f"hk/info-{y}.html" if y <= 2006 else f"hk/govhk-{y}.html"
        raw = (CACHE / rel).read_bytes()
        t = page_text(raw)
        i = t.find("Every Sunday")
        assert i > 0, rel
        end = min(k for k in (t.find('"', i), t.find("General holidays for", i), t.find("Remarks", i), len(t))
                  if k > 0)
        body = t[i:end]
        found = set()
        for m in re.finditer(r"\|(?:(\d{1,2})\s*([A-Za-z]+)|([A-Za-z]+)\s*(\d{1,2}))\|(\w+day)", body):
            day, month = (m.group(1), m.group(2)) if m.group(1) else (m.group(4), m.group(3))
            d = date(y, next(v for k, v in HK_MONTHS.items() if k.startswith(month.lower()[:3])), int(day))
            assert d.strftime("%A") == m.group(5), (rel, d, m.group(5))
            if d.weekday() != 6:
                found.add(d)
        out[y] = found
    return out


def hk_1823_days() -> set:
    raw = cached("hk/1823-en.json", HK_1823, 1000)
    events = json.loads(raw.decode("utf-8-sig"))["vcalendar"][0]["vevent"]
    days = {date(int(e["dtstart"][0][:4]), int(e["dtstart"][0][4:6]), int(e["dtstart"][0][6:]))
            for e in events}
    return {d for d in days if d.weekday() != 6}


def hk_official_check(days: dict) -> None:
    official = hk_official_days()
    diff = set()
    for year, listed in official.items():
        ours = {d for d in days if d.year == year and d.weekday() != 6}
        for d in sorted(listed ^ ours):
            print(f"  HK {d} {'official only' if d in listed else 'gold only: ' + str(days[d])}")
        diff |= listed ^ ours
    j = hk_1823_days()
    jd = j ^ {d for d in days if d.year in (2025, 2026, 2027) and d.weekday() != 6}
    print(f"  HK 2000-2027: {len(diff)} differences with the gazetted lists; 1823 JSON 2025-2027: {len(jd)}")
    assert not diff and not jd, (sorted(diff), sorted(jd))


# --- Taiwan ---------------------------------------------------------------
#
# Government-office days off (行政機關放假): the days of 紀念日及節日實施辦法 /
# 公務人員週休二日實施辦法 art. 3 by era, and from 2025-05-28 紀念日及節日實施條例
# arts. 4, 6 and 8; the 補假 rules (除夕/春節 from 2003, every holiday from 2015);
# the 兒童節/清明 rule (from 2013); and the yearly 調整放假 / 補行上班 the
# Executive Yuan decides (TW_ADJUSTMENTS). Lunar dates and 清明 are the HKO
# tables' (UTC+8, Taiwan's zone). Checked day by day against the DGPA
# 政府行政機關辦公日曆表 2000-2027.

LAW_TW_D0020033 = "https://law.moj.gov.tw/LawClass/LawAll.aspx?pcode=D0020033"
LAW_TW_A0030127 = "https://law.moj.gov.tw/LawClass/LawAll.aspx?pcode=A0030127"
LAW_TW_D0020095 = "https://law.moj.gov.tw/LawClass/LawAll.aspx?pcode=D0020095"

TW_SOURCES = [
    ("公務人員週休二日實施辦法 第3條、第11條 (A0030127; 2001-01-01 施行; 2002-08-30, 2014-09-23 修正)", LAW_TW_A0030127,
     "紀念日除開國紀念日、和平紀念日、國慶日外，不放假；民俗節日除夕、春節、民族掃墓節、端午節、中秋節放假（2011-04-01 增兒童節）。"
     "2002-08-30 修正：除夕及春節逢例假日，於次一上班日補假。2014-09-23 修正（2015 年起）：放假日逢星期六於前一上班日補假，逢星期日於次一上班日補假。"),
    ("紀念日及節日實施辦法 第5條、第5條之1 (D0020033; 2010-11-02, 2012-09-25, 2014-06-11 修正; 2025-06-06 廢止)", LAW_TW_D0020033,
     "兒童節 4月4日 放假（2011 年起）。兒童節與民族掃墓節同一日時，於前一日放假；但逢星期四時，於後一日放假（2012-09-25 修正，2013 年起）。"
     "第5條之1：紀念日及節日逢星期六於前一個上班日補假，逢星期日於後一個上班日補假；除夕及春節逢例假日，於後一個上班日補假（2015 年起）。"),
    ("紀念日及節日實施條例 第4條、第6條、第8條 (D0020095; 2025-05-28 公布施行)", LAW_TW_D0020095,
     "放假之紀念日：開國紀念日、和平紀念日、孔子誕辰紀念日（9月28日）、國慶日、臺灣光復暨金門古寧頭大捷紀念日（10月25日）、"
     "行憲紀念日（12月25日）。放假之節日：春節（農曆除夕前一日至正月初三）、兒童節、民族掃墓節、勞動節、端午節、中秋節。"
     "放假日逢例假日應予補假：逢星期六於前一個上班日、逢星期日於後一個上班日；春節逢例假日於其後之上班日補假。"),
    ("行政院人事行政總處 政府行政機關辦公日曆表 2000-2016 (xls and calendar images)",
     "https://www.dgpa.gov.tw/information?uid=30&pid=4977",
     "Yearly official calendars: 調整放假, 補行上班, 補假; 2000 was 隔週休二日 (only the 2nd and 4th Saturdays off)."),
    ("政府行政機關辦公日曆表 2017-2027 (CSV, data.gov.tw dataset 14718)", "https://data.gov.tw/dataset/14718",
     "西元日期, 星期, 是否放假 (2 = 放假), 備註; the 2025 file is the 1141020 revision after the 條例."),
    ("Hong Kong Observatory, Gregorian-Lunar Calendar Conversion Tables",
     "https://www.hko.gov.hk/en/gts/time/conversion.htm",
     "Lunar dates and 清明 at UTC+8, the zone of Taiwan; they agree with the DGPA calendars 2000-2027."),
]

TW_NOTE = (
    "行政機關放假日 (government offices): the statutory days of each era with their 補假, plus the yearly "
    "調整放假 of the Executive Yuan. Saturdays and Sundays are not listed unless a holiday falls on them; "
    ":working-days lists the Saturdays that are working days (補行上班, and every non-off Saturday of the "
    "2000 隔週休二日 regime). 勞動節 before 2026 was a day off for labourers only, not for offices. Years "
    "after 2027 follow the rules only: no 調整放假 is known for them."
)

# 行政院人事行政總處 (DGPA) 政府行政機關辦公日曆表 2000-2016, transcribed from the
# official xls / calendar images (dgpa.gov.tw information?uid=30); 2017-2027 are read
# from the data.gov.tw CSVs below. Days off on Monday-Friday (weekend holidays are
# rule days) and the Saturdays/Sundays that are working days.
TW_DGPA_2000_2016 = {
    2000: (['2000-02-04', '2000-02-07', '2000-02-28', '2000-04-03', '2000-04-04', '2000-06-06', '2000-09-12', '2000-10-10', '2000-12-25'],
           ['2000-01-15', '2000-01-29', '2000-02-19', '2000-03-04', '2000-03-18', '2000-04-01', '2000-04-08', '2000-04-15', '2000-04-29', '2000-05-06', '2000-05-20', '2000-06-03', '2000-06-17', '2000-07-01', '2000-07-15', '2000-07-29', '2000-08-05', '2000-08-19', '2000-09-02', '2000-09-16', '2000-09-30', '2000-10-07', '2000-10-21', '2000-11-04', '2000-11-18', '2000-12-02', '2000-12-16', '2000-12-30']),
    2001: (['2001-01-01', '2001-01-22', '2001-01-23', '2001-01-24', '2001-01-25', '2001-01-26', '2001-02-28', '2001-04-05', '2001-06-25', '2001-10-01', '2001-10-10'],
           ['2001-01-20']),
    2002: (['2002-01-01', '2002-02-11', '2002-02-12', '2002-02-13', '2002-02-14', '2002-02-28', '2002-04-05', '2002-10-10'],
           []),
    2003: (['2003-01-01', '2003-01-31', '2003-02-03', '2003-02-04', '2003-02-05', '2003-02-28', '2003-06-04', '2003-09-11', '2003-10-10'],
           []),
    2004: (['2004-01-01', '2004-01-21', '2004-01-22', '2004-01-23', '2004-01-26', '2004-06-22', '2004-09-28'],
           []),
    2005: (['2005-02-07', '2005-02-08', '2005-02-09', '2005-02-10', '2005-02-11', '2005-02-28', '2005-04-05', '2005-10-10'],
           ['2005-02-05']),
    2006: (['2006-01-30', '2006-01-31', '2006-02-01', '2006-02-02', '2006-02-28', '2006-04-05', '2006-05-31', '2006-10-06', '2006-10-09', '2006-10-10'],
           ['2006-10-14']),
    2007: (['2007-01-01', '2007-02-19', '2007-02-20', '2007-02-21', '2007-02-22', '2007-02-23', '2007-02-28', '2007-04-05', '2007-04-06', '2007-06-18', '2007-06-19', '2007-09-24', '2007-09-25', '2007-10-10'],
           ['2007-03-03', '2007-04-14', '2007-06-23', '2007-09-29']),
    2008: (['2008-01-01', '2008-02-06', '2008-02-07', '2008-02-08', '2008-02-11', '2008-02-28', '2008-04-04', '2008-10-10'],
           []),
    2009: (['2009-01-01', '2009-01-02', '2009-01-26', '2009-01-27', '2009-01-28', '2009-01-29', '2009-01-30', '2009-05-28', '2009-05-29'],
           ['2009-01-10', '2009-01-17', '2009-06-06']),
    2010: (['2010-01-01', '2010-02-15', '2010-02-16', '2010-02-17', '2010-02-18', '2010-02-19', '2010-04-05', '2010-06-16', '2010-09-22'],
           ['2010-02-06']),
    2011: (['2011-02-02', '2011-02-03', '2011-02-04', '2011-02-07', '2011-02-28', '2011-04-04', '2011-04-05', '2011-06-06', '2011-09-12', '2011-10-10'],
           []),
    2012: (['2012-01-23', '2012-01-24', '2012-01-25', '2012-01-26', '2012-01-27', '2012-02-27', '2012-02-28', '2012-04-04', '2012-10-10', '2012-12-31'],
           ['2012-02-04', '2012-03-03', '2012-12-22']),
    2013: (['2013-01-01', '2013-02-11', '2013-02-12', '2013-02-13', '2013-02-14', '2013-02-15', '2013-02-28', '2013-04-04', '2013-04-05', '2013-06-12', '2013-09-19', '2013-09-20', '2013-10-10'],
           ['2013-02-23', '2013-09-14']),
    2014: (['2014-01-01', '2014-01-30', '2014-01-31', '2014-02-03', '2014-02-04', '2014-02-28', '2014-04-04', '2014-06-02', '2014-09-08', '2014-10-10'],
           ['2014-12-27']),
    2015: (['2015-01-01', '2015-01-02', '2015-02-18', '2015-02-19', '2015-02-20', '2015-02-23', '2015-02-27', '2015-04-03', '2015-04-06', '2015-06-19', '2015-09-28', '2015-10-09'],
           []),
    2016: (['2016-01-01', '2016-02-08', '2016-02-09', '2016-02-10', '2016-02-11', '2016-02-12', '2016-02-29', '2016-04-04', '2016-04-05', '2016-06-09', '2016-06-10', '2016-09-15', '2016-09-16', '2016-10-10'],
           ['2016-01-30', '2016-06-04', '2016-09-10']),
}
TW_DGPA_URLS = {
    2000: 'https://www.dgpa.gov.tw/information?uid=30&pid=4977',
    2001: 'https://www.dgpa.gov.tw/information?uid=30&pid=4976',
    2002: 'https://www.dgpa.gov.tw/information?uid=30&pid=4975',
    2003: 'https://www.dgpa.gov.tw/information?uid=30&pid=4974',
    2004: 'https://www.dgpa.gov.tw/information?uid=30&pid=4973',
    2005: 'https://www.dgpa.gov.tw/information?uid=30&pid=4972',
    2006: 'https://www.dgpa.gov.tw/information?uid=30&pid=4971',
    2007: 'https://www.dgpa.gov.tw/information?uid=30&pid=4970',
    2008: 'https://www.dgpa.gov.tw/information?uid=30&pid=4969',
    2009: 'https://www.dgpa.gov.tw/information?uid=30&pid=4968',
    2010: 'https://www.dgpa.gov.tw/information?uid=30&pid=4980',
    2011: 'https://www.dgpa.gov.tw/information?uid=30&pid=4981',
    2012: 'https://www.dgpa.gov.tw/information?uid=30&pid=4982',
    2013: 'https://www.dgpa.gov.tw/information?uid=30&pid=4983',
    2014: 'https://www.dgpa.gov.tw/information?uid=30&pid=4988',
    2015: 'https://www.dgpa.gov.tw/information?uid=30&pid=4987',
    2016: 'https://www.dgpa.gov.tw/information?uid=30&pid=4989',
    2017: 'https://www.dgpa.gov.tw/FileConversion?filename=dgpa/files/202407/f9efbeb6-af1b-4adf-9034-3c8a95a5a192.csv&nfix=&name=106%e5%b9%b4%e6%94%bf%e5%ba%9c%e6%a9%9f%e9%97%9c%e8%be%a6%e5%85%ac%e6%97%a5%e6%9b%86%e8%a1%a8.csv',
    2018: 'https://www.dgpa.gov.tw/FileConversion?filename=dgpa/files/202407/d645842e-7b26-43e4-9f08-1172c61dde91.csv&nfix=&name=107%e6%94%bf%e5%ba%9c%e6%a9%9f%e9%97%9c%e8%be%a6%e5%85%ac%e6%97%a5%e6%9b%86%e8%a1%a8(%e6%95%b8%e5%ad%97%e7%89%88).csv',
    2019: 'https://www.dgpa.gov.tw/FileConversion?filename=dgpa/files/202407/5f2ff9c5-a235-4819-8c62-f064fc5bffb8.csv&nfix=&name=108%e5%b9%b4%e4%b8%ad%e8%8f%af%e6%b0%91%e5%9c%8b%e6%94%bf%e5%ba%9c%e8%a1%8c%e6%94%bf%e6%a9%9f%e9%97%9c%e8%be%a6%e5%85%ac%e6%97%a5%e6%9b%86%e8%a1%a8.csv',
    2020: 'https://www.dgpa.gov.tw/FileConversion?filename=dgpa/files/202407/4d215402-15c7-4ad9-ab90-a33f34a63f5b.csv&nfix=&name=109%e5%b9%b4%e4%b8%ad%e8%8f%af%e6%b0%91%e5%9c%8b%e6%94%bf%e5%ba%9c%e8%a1%8c%e6%94%bf%e6%a9%9f%e9%97%9c%e8%be%a6%e5%85%ac%e6%97%a5%e6%9b%86%e8%a1%a8.csv',
    2021: 'https://www.dgpa.gov.tw/FileConversion?filename=dgpa/files/202407/daec35f0-ae43-4466-aa26-bafb39aa8e0a.csv&nfix=&name=110%e4%b8%ad%e8%8f%af%e6%b0%91%e5%9c%8b%e6%94%bf%e5%ba%9c%e8%a1%8c%e6%94%bf%e6%a9%9f%e9%97%9c%e8%be%a6%e5%85%ac%e6%97%a5%e6%9b%86%e8%a1%a8.csv',
    2022: 'https://www.dgpa.gov.tw/FileConversion?filename=dgpa/files/202407/cbe02c09-d3ce-4912-ace4-69b7129efa9f.csv&nfix=&name=111%e5%b9%b4%e4%b8%ad%e8%8f%af%e6%b0%91%e5%9c%8b%e6%94%bf%e5%ba%9c%e8%a1%8c%e6%94%bf%e6%a9%9f%e9%97%9c%e8%be%a6%e5%85%ac%e6%97%a5%e6%9b%86%e8%a1%a8.csv',
    2023: 'https://www.dgpa.gov.tw/FileConversion?filename=dgpa/files/202407/dd89fe8c-25f5-4035-a31e-7c14b44a74d7.csv&nfix=&name=112%e5%b9%b4%e4%b8%ad%e8%8f%af%e6%b0%91%e5%9c%8b%e6%94%bf%e5%ba%9c%e8%a1%8c%e6%94%bf%e6%a9%9f%e9%97%9c%e8%be%a6%e5%85%ac%e6%97%a5%e6%9b%86%e8%a1%a8.csv',
    2024: 'https://www.dgpa.gov.tw/FileConversion?filename=dgpa/files/202407/777152e9-fdd1-4a61-876c-2733e7692538.csv&nfix=&name=113年中華民國政府行政機關辦公日曆表.csv',
    2025: 'https://www.dgpa.gov.tw/FileConversion?filename=dgpa/files/202407/22f9fcbc-fbb2-4387-8bcf-73b2279666c2.csv&nfix=&name=114年中華民國政府行政機關辦公日曆表.csv',
    2026: 'https://www.dgpa.gov.tw/FileConversion?filename=dgpa/files/202506/a52331bd-a189-466b-b0f0-cae3062bbf74.csv&nfix=&name=115%e5%b9%b4%e4%b8%ad%e8%8f%af%e6%b0%91%e5%9c%8b%e6%94%bf%e5%ba%9c%e8%a1%8c%e6%94%bf%e6%a9%9f%e9%97%9c%e8%be%a6%e5%85%ac%e6%97%a5%e6%9b%86%e8%a1%a8.csv',
    2027: 'https://www.dgpa.gov.tw/FileConversion?filename=dgpa/files/202607/f538b1ff-ba60-4c63-9477-10db8e6612d1.csv&nfix=&name=116%e5%b9%b4%e4%b8%ad%e8%8f%af%e6%b0%91%e5%9c%8b%e6%94%bf%e5%ba%9c%e8%a1%8c%e6%94%bf%e6%a9%9f%e9%97%9c%e8%be%a6%e5%85%ac%e6%97%a5%e6%9b%86%e8%a1%a8_utf8bom.csv',
}

TW_ADJUSTMENTS = {
    2000: ([('2000-04-03', '調整放假')],
           ['2000-01-15', '2000-01-29', '2000-02-19', '2000-03-04', '2000-03-18', '2000-04-01', '2000-04-08', '2000-04-15', '2000-04-29', '2000-05-06', '2000-05-20', '2000-06-03', '2000-06-17', '2000-07-01', '2000-07-15', '2000-07-29', '2000-08-05', '2000-08-19', '2000-09-02', '2000-09-16', '2000-09-30', '2000-10-07', '2000-10-21', '2000-11-04', '2000-11-18', '2000-12-02', '2000-12-16', '2000-12-30']),
    2001: ([('2001-01-22', '調整放假')],
           ['2001-01-20']),
    2005: ([('2005-02-07', '調整放假')],
           ['2005-02-05']),
    2006: ([('2006-10-09', '調整放假')],
           ['2006-10-14']),
    2007: ([('2007-02-23', '調整放假'), ('2007-04-06', '調整放假'), ('2007-06-18', '調整放假'), ('2007-09-24', '調整放假')],
           ['2007-03-03', '2007-04-14', '2007-06-23', '2007-09-29']),
    2009: ([('2009-01-02', '調整放假'), ('2009-01-30', '調整放假'), ('2009-05-29', '調整放假')],
           ['2009-01-10', '2009-01-17', '2009-06-06']),
    2010: ([('2010-02-19', '調整放假')],
           ['2010-02-06']),
    2012: ([('2012-01-27', '調整放假'), ('2012-02-27', '調整放假'), ('2012-12-31', '調整放假')],
           ['2012-02-04', '2012-03-03', '2012-12-22']),
    2013: ([('2013-02-15', '調整放假'), ('2013-09-20', '調整放假')],
           ['2013-02-23', '2013-09-14']),
    2014: ([],
           ['2014-12-27']),
    2015: ([('2015-01-02', '調整放假')],
           []),
    2016: ([('2016-02-12', '調整放假'), ('2016-06-10', '調整放假'), ('2016-09-16', '調整放假')],
           ['2016-01-30', '2016-06-04', '2016-09-10']),
    2017: ([('2017-02-27', '調整放假'), ('2017-05-29', '調整放假'), ('2017-10-09', '調整放假')],
           ['2017-02-18', '2017-06-03', '2017-09-30']),
    2018: ([('2018-04-06', '調整放假'), ('2018-12-31', '調整放假')],
           ['2018-03-31', '2018-12-22']),
    2019: ([('2019-02-08', '調整放假'), ('2019-03-01', '調整放假'), ('2019-10-11', '調整放假')],
           ['2019-01-19', '2019-02-23', '2019-10-05']),
    2020: ([('2020-01-23', '調整放假'), ('2020-06-26', '調整放假'), ('2020-10-02', '調整放假')],
           ['2020-02-15', '2020-06-20', '2020-09-26']),
    2021: ([('2021-02-10', '調整放假'), ('2021-09-20', '調整放假')],
           ['2021-02-20', '2021-09-11']),
    2022: ([('2022-02-04', '調整放假')],
           ['2022-01-22']),
    2023: ([('2023-01-20', '小年夜'), ('2023-01-27', '調整放假'), ('2023-02-27', '調整放假'), ('2023-04-03', '調整放假'), ('2023-06-23', '調整放假'), ('2023-10-09', '調整放假')],
           ['2023-01-07', '2023-02-04', '2023-02-18', '2023-03-25', '2023-06-17', '2023-09-23']),
    2024: ([('2024-02-08', '小年夜')],
           ['2024-02-17']),
    2025: ([('2025-01-27', '小年夜')],
           ['2025-02-08']),
}


def _tw_nominal(year: int) -> list[tuple[date, str, str]]:
    """The statutory days off of YEAR: (date, name, kind)."""
    cny = hk_lunar(year, 1, 1)
    out = [(date(year, 1, 1), "開國紀念日", "day")]
    if year >= 2026:  # 條例 第6條 (the 2025 小年夜 came before it, by decision)
        out.append((cny - timedelta(days=2), "小年夜", "spring"))
    out.append((cny - timedelta(days=1), "農曆除夕", "spring"))
    out += [(cny + timedelta(days=i), "春節", "spring") for i in range(3)]
    out.append((date(year, 2, 28), "和平紀念日", "day"))
    if year >= 2011:
        out.append((date(year, 4, 4), "兒童節", "children"))
    out.append((hk_ching_ming(year), "民族掃墓節", "day"))
    if year >= 2026:
        out.append((date(year, 5, 1), "勞動節", "day"))
    out.append((hk_lunar(year, 5, 5), "端午節", "day"))
    out.append((hk_lunar(year, 8, 15), "中秋節", "day"))
    if year >= 2025:  # 條例, from 2025-05-28
        out.append((date(year, 9, 28), "孔子誕辰紀念日", "day"))
    out.append((date(year, 10, 10), "國慶日", "day"))
    if year >= 2025:
        out.append((date(year, 10, 25), "臺灣光復暨金門古寧頭大捷紀念日", "day"))
    if year <= 2000:
        out.append((date(year, 11, 12), "國父誕辰紀念日", "day"))
    if year <= 2000 or year >= 2025:
        out.append((date(year, 12, 25), "行憲紀念日", "day"))
    return out


def _tw_rule_days(year: int) -> list[tuple[date, str]]:
    """The statutory days of YEAR with their 補假 (a 補假 for 1 January may fall
    on 31 December of the year before) and the 調整放假 of TW_ADJUSTMENTS."""
    weekend = lambda d: d.weekday() >= 5
    nominal = _tw_nominal(year)
    adjust = [(date.fromisoformat(d), n) for d, n in TW_ADJUSTMENTS.get(year, ([], []))[0]]
    out = [(d, n) for d, n, _ in nominal] + adjust
    taken = {d for d, _ in out}

    def free(d):
        return not weekend(d) and d not in taken

    def step(d, by):
        d += timedelta(days=by)
        while not free(d):
            d += timedelta(days=by)
        return d

    def place(d, name):
        taken.add(d)
        out.append((d, name))

    children = date(year, 4, 4)
    for d, name, kind in sorted(nominal):
        if kind == "spring":
            continue
        if kind == "children" and year >= 2013 and hk_ching_ming(year) == children:
            # 實施辦法 第5條: 前一日放假, 逢星期四於後一日; a weekend day so
            # reached moves by the 補假 rule (2016: Sunday → 4/5; 2021: 4/2).
            d = children + timedelta(days=1 if children.weekday() == 3 else -1)
            if not weekend(d):
                place(d, "兒童節 (與民族掃墓節同日)")
                continue
        if weekend(d) and year >= 2015:
            place(step(d, -1 if d.weekday() == 5 else 1), f"補假 ({name})")
    if year >= 2003:  # 除夕/春節 on a weekend: the following workdays
        spring = sorted(d for d, _, k in nominal if k == "spring")
        last = spring[-1]
        for d in spring:
            if weekend(d):
                last = step(last, 1)
                place(last, "補假 (春節)")
    return out


def tw_holidays(year: int) -> list[tuple[date, str]]:
    return [(d, n) for y in (year, year + 1) for d, n in _tw_rule_days(y) if d.year == year]


def tw_working_days(year: int) -> list[date]:
    return [date.fromisoformat(d) for d in TW_ADJUSTMENTS.get(year, ([], []))[1]]


def _tw_official(year: int) -> tuple[set, set]:
    """The weekday days off and the working weekend days of the DGPA calendar of YEAR."""
    if year <= 2016:
        off, work = TW_DGPA_2000_2016[year]
        return {date.fromisoformat(d) for d in off}, {date.fromisoformat(d) for d in work}
    name = "tw/dgpa-2025-1141020.csv" if year == 2025 else f"tw/dgpa-{year}.csv"
    raw = (CACHE / name).read_bytes()
    try:
        text = raw.decode("utf-8-sig")
    except UnicodeDecodeError:
        text = raw.decode("big5")
    off, work = set(), set()
    for line in text.splitlines()[1:]:
        cells = line.split(",")
        if len(cells) < 3 or not cells[0].strip().isdigit():
            continue
        d = date(int(cells[0][:4]), int(cells[0][4:6]), int(cells[0][6:8]))
        holiday = cells[2].strip() == "2"
        if holiday and d.weekday() < 5:
            off.add(d)
        if not holiday and d.weekday() >= 5:
            work.add(d)
    return off, work


def tw_official_check(days: dict) -> None:
    bad = []
    for year in range(2000, 2028):
        off, work = _tw_official(year)
        ours = {d for d in days if d.year == year and d.weekday() < 5}
        bad += [(d, "official only") for d in sorted(off - ours)]
        bad += [(d, f"gold only {days[d]}") for d in sorted(ours - off)]
        if work != set(tw_working_days(year)):
            bad.append((year, "working days", sorted(work ^ set(tw_working_days(year)))))
    for b in bad:
        print("  TW", *b)
    print(f"  TW 2000-2027: {len(bad)} differences with the DGPA calendars")
    assert not bad


# --- tabular Islamic calendar (provisional years only) ---------------------
#
# The arithmetic calendar of the starters' estimate: leap years (11y + 14) mod
# 30 < 11, 1 Muharram AH 1 = 16 July 622 (Julian). Used only for years no
# proclamation or SKB covers yet; the gold flags them provisional.

ISLAMIC_EPOCH = date(622, 7, 19)  # Julian 622-07-16
ISLAMIC_BEFORE_MONTH = [0, 0, 30, 59, 89, 118, 148, 177, 207, 236, 266, 295, 325]


def _islamic_year_start(year: int) -> date:
    y = year - 1
    days = (y // 30) * 10631 + sum(355 if (11 * k + 14) % 30 < 11 else 354 for k in range(1, y % 30 + 1))
    return ISLAMIC_EPOCH + timedelta(days=days)


def islamic_dates_in_year(g_year: int, month: int, day: int) -> list[date]:
    ah = int((g_year - 622) * 33 / 32)
    out = []
    for y in range(ah - 1, ah + 3):
        d = _islamic_year_start(y) + timedelta(days=ISLAMIC_BEFORE_MONTH[month] + day - 1)
        if d.year == g_year:
            out.append(d)
    return sorted(out)


# --- Philippines ----------------------------------------------------------
#
# Regular holidays and nationwide special (non-working) days: EO 292 Book I
# s. 26 as amended (RA 9177, 9256, 9492, 9849, 10966) and each year's
# proclamations, which list every day, move days (RA 9492 "holiday
# economics", 2023 Proc. 90), add special days and proclaim the Eid dates.
# Special working days (EDSA from 2025) are not holidays.

PH_SOURCES = [
    ("Executive Order No. 292 (Administrative Code of 1987), Book I, Chapter 7, Sec. 26, as amended by RA 9492 (2007)",
     "https://lawphil.net/statutes/repacts/ra2007/ra_9492_2007.html",
     "(1) Regular Holidays: New Year's Day (January 1), Maundy Thursday, Good Friday, Eidul Fitr (movable), "
     "Araw ng Kagitingan (April 9), Labor Day (May 1), Independence Day (June 12), National Heroes Day (last "
     "Monday of August), Bonifacio Day (November 30), Christmas Day (December 25), Rizal Day (December 30); "
     "(2) Nationwide Special Holidays: Ninoy Aquino Day (August 21), All Saints Day (November 1), Last Day of "
     "the Year (December 31). Holidays other than Christmas, New Year's, Maundy Thursday, Good Friday and "
     "Eidul Fitr may be moved to the nearest Monday by proclamation."),
    ("Republic Act No. 9177 (2002); RA 9256 (2004); RA 9849 (2009); RA 10966 (2017)",
     "https://lawphil.net/statutes/repacts/ra2009/ra_9849_2009.html",
     "RA 9177: Eidul Fitr a regular holiday. RA 9256: Ninoy Aquino Day, 21 August. RA 9849: Eidul Adha a "
     "regular holiday. RA 10966: 8 December, Feast of the Immaculate Conception, special non-working."),
    ("Yearly proclamations on regular holidays and special (non-working) days, Eid'l Fitr and Eid'l Adha, "
     "2000-2027 (lawphil.net)", "https://lawphil.net/executive/proc/proc2026/proc2026.html",
     "E.g. Proc. 368 s.2023 (2024 days), Proc. 665 s.2024 (Ninoy Aquino Day 2024 to 23 August), Proc. 727 "
     "s.2024 (2025; EDSA a special working day), Proc. 1427 s.2026 (2027; EDSA a special working day). Each "
     "year's numbers are in PH_PROCLAMATIONS of the generator."),
    ("Official Gazette (Wayback copies)", "https://www.officialgazette.gov.ph/",
     "Proc. 556 s.2018 (Eid'l Adha 2018-08-21)."),
]

PH_NOTE = (
    "Regular holidays and nationwide special (non-working) days, as the proclamations of each year 2000-2027 "
    "set them (moved days on their new date; nationwide ad-hoc days such as election days included; "
    "special working days, regional days and schools-only days left out). Eid'l Fitr and Eid'l Adha 2027 "
    "and every year from 2028 are provisional: the statutory days only, with the Eid days estimated by the "
    "tabular Islamic calendar."
)

# Every nationwide regular holiday and special (non-working) day of each year, from the
# yearly proclamations and the Eid'l Fitr / Eid'l Adha and ad-hoc proclamations
# (lawphil.net texts; Proc. 556 s.2018 from the Official Gazette on Wayback; Proc. 878
# s.2025 and 1427 s.2026 from the signed scans). 2027: the Eid days are not proclaimed yet.
PH_PROCLAIMED = {
    2000: [('2000-01-01', "New Year's Day"), ('2000-02-25', 'EDSA People Power Revolution Anniversary'), ('2000-04-09', 'Araw ng Kagitingan'), ('2000-04-20', 'Maundy Thursday'), ('2000-04-21', 'Good Friday'), ('2000-04-22', 'Black Saturday'), ('2000-05-01', 'Labor Day'), ('2000-06-12', 'Independence Day'), ('2000-08-27', 'National Heroes Day'), ('2000-11-01', "All Saints' Day"), ('2000-11-02', "All Souls' Day"), ('2000-11-30', 'Bonifacio Day'), ('2000-12-25', 'Christmas Day'), ('2000-12-30', 'Rizal Day'), ('2000-12-31', 'Last Day of the Year')],
    2001: [('2001-01-01', "New Year's Day"), ('2001-04-09', 'Araw ng Kagitingan'), ('2001-04-12', 'Maundy Thursday'), ('2001-04-13', 'Good Friday'), ('2001-04-14', 'Black Saturday'), ('2001-05-01', 'Labor Day'), ('2001-05-14', 'National and local elections'), ('2001-06-12', 'Independence Day'), ('2001-08-26', 'National Heroes Day'), ('2001-10-31', "All Saints' Day eve - afternoon only (from 12:01 pm)"), ('2001-11-01', "All Saints' Day"), ('2001-11-02', "All Souls' Day"), ('2001-11-30', 'Bonifacio Day'), ('2001-12-17', "Eid'l Fitr"), ('2001-12-24', 'Christmas Eve'), ('2001-12-25', 'Christmas Day'), ('2001-12-30', 'Rizal Day'), ('2001-12-31', 'Last Day of the Year')],
    2002: [('2002-01-01', "New Year's Day"), ('2002-02-25', 'EDSA People Power Revolution Anniversary'), ('2002-03-28', 'Maundy Thursday'), ('2002-03-29', 'Good Friday'), ('2002-03-30', 'Black Saturday'), ('2002-04-08', 'Araw ng Kagitingan'), ('2002-05-01', 'Labor Day'), ('2002-06-12', 'Independence Day'), ('2002-07-15', 'Barangay and SK elections'), ('2002-08-25', 'National Heroes Day'), ('2002-10-31', "All Saints' Day eve"), ('2002-11-01', "All Saints' Day"), ('2002-11-02', "All Souls' Day"), ('2002-11-30', 'Bonifacio Day'), ('2002-12-06', "Eid'l Fitr"), ('2002-12-24', 'Christmas Eve'), ('2002-12-25', 'Christmas Day'), ('2002-12-30', 'Rizal Day'), ('2002-12-31', 'Last Day of the Year')],
    2003: [('2003-01-01', "New Year's Day"), ('2003-02-25', 'EDSA People Power Revolution Anniversary'), ('2003-04-07', 'Araw ng Kagitingan'), ('2003-04-17', 'Maundy Thursday'), ('2003-04-18', 'Good Friday'), ('2003-04-19', 'Black Saturday'), ('2003-05-01', 'Labor Day'), ('2003-06-13', 'Independence Day'), ('2003-08-31', 'National Heroes Day'), ('2003-11-01', "All Saints' Day"), ('2003-11-26', "Eid'l Fitr"), ('2003-11-30', 'Bonifacio Day'), ('2003-12-24', 'Christmas Eve'), ('2003-12-25', 'Christmas Day'), ('2003-12-31', 'Last Day of the Year')],
    2004: [('2004-01-01', "New Year's Day"), ('2004-01-02', 'Special day in lieu of 2003 Rizal Day'), ('2004-02-25', 'EDSA People Power Revolution Anniversary'), ('2004-04-07', 'Araw ng Kagitingan'), ('2004-04-08', 'Maundy Thursday'), ('2004-04-09', 'Good Friday'), ('2004-04-10', 'Black Saturday'), ('2004-05-01', 'Labor Day'), ('2004-05-10', 'National and local elections'), ('2004-06-12', 'Independence Day'), ('2004-08-21', 'Ninoy Aquino Day'), ('2004-08-29', 'National Heroes Day'), ('2004-11-01', "All Saints' Day"), ('2004-11-15', "Eid'l Fitr"), ('2004-11-29', 'Bonifacio Day'), ('2004-12-24', 'Christmas Eve'), ('2004-12-25', 'Christmas Day'), ('2004-12-27', 'Additional special day'), ('2004-12-30', 'Rizal Day'), ('2004-12-31', 'Last Day of the Year')],
    2005: [('2005-01-01', "New Year's Day"), ('2005-02-25', 'EDSA People Power Revolution Anniversary'), ('2005-03-24', 'Maundy Thursday'), ('2005-03-25', 'Good Friday'), ('2005-03-26', 'Black Saturday'), ('2005-04-09', 'Araw ng Kagitingan'), ('2005-05-01', 'Labor Day'), ('2005-05-02', 'Labor Day'), ('2005-06-12', 'Independence Day'), ('2005-06-13', 'Independence Day'), ('2005-08-21', 'Ninoy Aquino Day'), ('2005-08-28', 'National Heroes Day'), ('2005-10-31', 'Additional special day'), ('2005-11-01', "All Saints' Day"), ('2005-11-04', "Eid'l Fitr"), ('2005-11-28', 'Bonifacio Day'), ('2005-12-25', 'Christmas Day'), ('2005-12-26', 'Additional special day'), ('2005-12-30', 'Rizal Day'), ('2005-12-31', 'Last Day of the Year')],
    2006: [('2006-01-01', "New Year's Day"), ('2006-02-25', 'EDSA People Power Revolution Anniversary'), ('2006-04-09', 'Araw ng Kagitingan'), ('2006-04-13', 'Maundy Thursday'), ('2006-04-14', 'Good Friday'), ('2006-04-15', 'Black Saturday'), ('2006-05-01', 'Labor Day'), ('2006-06-12', 'Independence Day'), ('2006-08-21', 'Ninoy Aquino Day'), ('2006-08-27', 'National Heroes Day'), ('2006-10-24', "Eid'l Fitr"), ('2006-11-01', "All Saints' Day"), ('2006-12-01', 'Bonifacio Day'), ('2006-12-25', 'Christmas Day'), ('2006-12-26', 'Additional special day'), ('2006-12-30', 'Rizal Day'), ('2006-12-31', 'Last Day of the Year')],
    2007: [('2007-01-01', "New Year's Day"), ('2007-04-05', 'Maundy Thursday'), ('2007-04-06', 'Good Friday'), ('2007-04-07', 'Black Saturday'), ('2007-04-09', 'Araw ng Kagitingan'), ('2007-05-01', 'Labor Day'), ('2007-05-14', 'National and local elections'), ('2007-06-11', 'Independence Day'), ('2007-08-20', 'Ninoy Aquino Day'), ('2007-08-27', 'National Heroes Day'), ('2007-10-12', "Eid'l Fitr"), ('2007-10-29', 'Barangay and SK elections'), ('2007-11-01', "All Saints' Day"), ('2007-11-02', "All Souls' Day"), ('2007-11-30', 'Bonifacio Day'), ('2007-12-24', 'Christmas Eve'), ('2007-12-25', 'Christmas Day'), ('2007-12-30', 'Rizal Day'), ('2007-12-31', 'Last Day of the Year')],
    2008: [('2008-01-01', "New Year's Day"), ('2008-02-25', 'EDSA People Power Revolution Anniversary'), ('2008-03-20', 'Maundy Thursday'), ('2008-03-21', 'Good Friday'), ('2008-03-22', 'Black Saturday'), ('2008-04-07', 'Araw ng Kagitingan'), ('2008-05-01', 'Labor Day'), ('2008-06-09', 'Independence Day'), ('2008-08-18', 'Ninoy Aquino Day'), ('2008-08-25', 'National Heroes Day'), ('2008-10-01', "Eid'l Fitr"), ('2008-11-01', "All Saints' Day"), ('2008-12-01', 'Bonifacio Day'), ('2008-12-25', 'Christmas Day'), ('2008-12-26', 'Additional special day'), ('2008-12-29', 'Additional special day'), ('2008-12-30', 'Rizal Day'), ('2008-12-31', 'Last Day of the Year')],
    2009: [('2009-01-01', "New Year's Day"), ('2009-01-02', 'Additional special day'), ('2009-04-06', 'Araw ng Kagitingan'), ('2009-04-09', 'Maundy Thursday'), ('2009-04-10', 'Good Friday'), ('2009-04-11', 'Black Saturday'), ('2009-05-01', 'Labor Day'), ('2009-06-12', 'Independence Day'), ('2009-08-05', 'Funeral of former President Corazon C. Aquino (special non-working)'), ('2009-08-21', 'Ninoy Aquino Day'), ('2009-08-31', 'National Heroes Day'), ('2009-09-21', "Eid'l Fitr"), ('2009-11-01', "All Saints' Day"), ('2009-11-02', "All Souls' Day"), ('2009-11-27', "Eid'l Adha"), ('2009-11-28', "Eid'l Adha"), ('2009-11-30', 'Bonifacio Day'), ('2009-12-24', 'Christmas Eve'), ('2009-12-25', 'Christmas Day'), ('2009-12-30', 'Rizal Day'), ('2009-12-31', 'Last Day of the Year')],
    2010: [('2010-01-01', "New Year's Day"), ('2010-04-01', 'Maundy Thursday'), ('2010-04-02', 'Good Friday'), ('2010-04-03', 'Black Saturday'), ('2010-04-09', 'Araw ng Kagitingan'), ('2010-05-03', 'Labor Day'), ('2010-05-10', 'National and local elections'), ('2010-06-14', 'Independence Day'), ('2010-06-30', 'Presidential inauguration'), ('2010-08-21', 'Ninoy Aquino Day'), ('2010-08-30', 'National Heroes Day'), ('2010-09-10', "Eid'l Fitr"), ('2010-10-25', 'Barangay and SK elections'), ('2010-11-01', "All Saints' Day"), ('2010-11-16', "Eid'l Adha"), ('2010-11-29', 'Bonifacio Day'), ('2010-12-24', 'Christmas Eve'), ('2010-12-25', 'Christmas Day'), ('2010-12-27', 'Rizal Day'), ('2010-12-31', 'Last Day of the Year')],
    2011: [('2011-01-01', "New Year's Day"), ('2011-04-09', 'Araw ng Kagitingan'), ('2011-04-21', 'Maundy Thursday'), ('2011-04-22', 'Good Friday'), ('2011-04-23', 'Black Saturday'), ('2011-05-01', 'Labor Day'), ('2011-06-12', 'Independence Day'), ('2011-06-20', 'Additional special day'), ('2011-08-21', 'Ninoy Aquino Day'), ('2011-08-29', 'National Heroes Day'), ('2011-08-30', "Eid'l Fitr"), ('2011-10-31', 'Additional special day'), ('2011-11-01', "All Saints' Day"), ('2011-11-07', "Eid'l Adha"), ('2011-11-30', 'Bonifacio Day'), ('2011-12-25', 'Christmas Day'), ('2011-12-30', 'Rizal Day'), ('2011-12-31', 'Last Day of the Year')],
    2012: [('2012-01-01', "New Year's Day"), ('2012-01-23', 'Chinese New Year'), ('2012-04-05', 'Maundy Thursday'), ('2012-04-06', 'Good Friday'), ('2012-04-07', 'Black Saturday'), ('2012-04-09', 'Araw ng Kagitingan'), ('2012-05-01', 'Labor Day'), ('2012-06-12', 'Independence Day'), ('2012-08-20', "Eid'l Fitr"), ('2012-08-21', 'Ninoy Aquino Day'), ('2012-08-27', 'National Heroes Day'), ('2012-10-26', "Eid'l Adha"), ('2012-11-01', "All Saints' Day"), ('2012-11-02', "All Souls' Day"), ('2012-11-30', 'Bonifacio Day'), ('2012-12-24', 'Christmas Eve'), ('2012-12-25', 'Christmas Day'), ('2012-12-30', 'Rizal Day'), ('2012-12-31', 'Last Day of the Year')],
    2013: [('2013-01-01', "New Year's Day"), ('2013-03-28', 'Maundy Thursday'), ('2013-03-29', 'Good Friday'), ('2013-03-30', 'Black Saturday'), ('2013-04-09', 'Araw ng Kagitingan'), ('2013-05-01', 'Labor Day'), ('2013-05-13', 'National and local elections'), ('2013-06-12', 'Independence Day'), ('2013-08-09', "Eid'l Fitr"), ('2013-08-21', 'Ninoy Aquino Day'), ('2013-08-26', 'National Heroes Day'), ('2013-10-15', "Eid'l Adha"), ('2013-10-28', 'Barangay and SK elections'), ('2013-11-01', "All Saints' Day"), ('2013-11-02', "All Souls' Day"), ('2013-11-30', 'Bonifacio Day'), ('2013-12-24', 'Christmas Eve'), ('2013-12-25', 'Christmas Day'), ('2013-12-30', 'Rizal Day'), ('2013-12-31', 'Last Day of the Year')],
    2014: [('2014-01-01', "New Year's Day"), ('2014-01-31', 'Chinese New Year'), ('2014-04-09', 'Araw ng Kagitingan'), ('2014-04-17', 'Maundy Thursday'), ('2014-04-18', 'Good Friday'), ('2014-04-19', 'Black Saturday'), ('2014-05-01', 'Labor Day'), ('2014-06-12', 'Independence Day'), ('2014-07-29', "Eid'l Fitr"), ('2014-08-21', 'Ninoy Aquino Day'), ('2014-08-25', 'National Heroes Day'), ('2014-10-06', "Eid'l Adha"), ('2014-11-01', "All Saints' Day"), ('2014-11-30', 'Bonifacio Day'), ('2014-12-24', 'Christmas Eve'), ('2014-12-25', 'Christmas Day'), ('2014-12-26', 'Additional special day'), ('2014-12-30', 'Rizal Day'), ('2014-12-31', 'Last Day of the Year')],
    2015: [('2015-01-01', "New Year's Day"), ('2015-01-02', 'Additional special day'), ('2015-02-19', 'Chinese New Year'), ('2015-04-02', 'Maundy Thursday'), ('2015-04-03', 'Good Friday'), ('2015-04-04', 'Black Saturday'), ('2015-04-09', 'Araw ng Kagitingan'), ('2015-05-01', 'Labor Day'), ('2015-06-12', 'Independence Day'), ('2015-07-17', "Eid'l Fitr"), ('2015-08-21', 'Ninoy Aquino Day'), ('2015-08-31', 'National Heroes Day'), ('2015-09-25', "Eid'l Adha"), ('2015-11-01', "All Saints' Day"), ('2015-11-30', 'Bonifacio Day'), ('2015-12-24', 'Christmas Eve'), ('2015-12-25', 'Christmas Day'), ('2015-12-30', 'Rizal Day'), ('2015-12-31', 'Last Day of the Year')],
    2016: [('2016-01-01', "New Year's Day"), ('2016-01-02', 'Additional special day'), ('2016-02-08', 'Chinese New Year'), ('2016-02-25', 'EDSA People Power Revolution Anniversary'), ('2016-03-24', 'Maundy Thursday'), ('2016-03-25', 'Good Friday'), ('2016-03-26', 'Black Saturday'), ('2016-04-09', 'Araw ng Kagitingan'), ('2016-05-01', 'Labor Day'), ('2016-05-09', 'National and local elections'), ('2016-06-12', 'Independence Day'), ('2016-07-06', "Eid'l Fitr"), ('2016-08-21', 'Ninoy Aquino Day'), ('2016-08-29', 'National Heroes Day'), ('2016-09-12', "Eid'l Adha"), ('2016-10-31', 'Additional special day'), ('2016-11-01', "All Saints' Day"), ('2016-11-30', 'Bonifacio Day'), ('2016-12-24', 'Christmas Eve'), ('2016-12-25', 'Christmas Day'), ('2016-12-26', 'Additional special day'), ('2016-12-30', 'Rizal Day'), ('2016-12-31', 'Last Day of the Year')],
    2017: [('2017-01-01', "New Year's Day"), ('2017-01-02', 'Additional special day'), ('2017-01-28', 'Chinese New Year'), ('2017-02-25', 'EDSA People Power Revolution Anniversary'), ('2017-04-09', 'Araw ng Kagitingan'), ('2017-04-13', 'Maundy Thursday'), ('2017-04-14', 'Good Friday'), ('2017-04-15', 'Black Saturday'), ('2017-05-01', 'Labor Day'), ('2017-06-12', 'Independence Day'), ('2017-06-26', "Eid'l Fitr"), ('2017-08-21', 'Ninoy Aquino Day'), ('2017-08-28', 'National Heroes Day'), ('2017-09-01', "Eid'l Adha"), ('2017-10-31', 'Additional special day'), ('2017-11-01', "All Saints' Day"), ('2017-11-30', 'Bonifacio Day'), ('2017-12-25', 'Christmas Day'), ('2017-12-30', 'Rizal Day'), ('2017-12-31', 'Last Day of the Year')],
    2018: [('2018-01-01', "New Year's Day"), ('2018-02-16', 'Chinese New Year'), ('2018-02-25', 'EDSA People Power Revolution Anniversary'), ('2018-03-29', 'Maundy Thursday'), ('2018-03-30', 'Good Friday'), ('2018-03-31', 'Black Saturday'), ('2018-04-09', 'Araw ng Kagitingan'), ('2018-05-01', 'Labor Day'), ('2018-05-14', 'Barangay and SK elections'), ('2018-06-12', 'Independence Day'), ('2018-06-15', "Eid'l Fitr"), ('2018-08-21', "Eid'l Adha"), ('2018-08-21', 'Ninoy Aquino Day'), ('2018-08-27', 'National Heroes Day'), ('2018-11-01', "All Saints' Day"), ('2018-11-02', "All Souls' Day"), ('2018-11-30', 'Bonifacio Day'), ('2018-12-08', 'Feast of the Immaculate Conception'), ('2018-12-24', 'Christmas Eve'), ('2018-12-25', 'Christmas Day'), ('2018-12-30', 'Rizal Day'), ('2018-12-31', 'Last Day of the Year')],
    2019: [('2019-01-01', "New Year's Day"), ('2019-02-05', 'Chinese New Year'), ('2019-02-25', 'EDSA People Power Revolution Anniversary'), ('2019-04-09', 'Araw ng Kagitingan'), ('2019-04-18', 'Maundy Thursday'), ('2019-04-19', 'Good Friday'), ('2019-04-20', 'Black Saturday'), ('2019-05-01', 'Labor Day'), ('2019-05-13', 'National and local elections'), ('2019-06-05', "Eid'l Fitr"), ('2019-06-12', 'Independence Day'), ('2019-08-12', "Eid'l Adha"), ('2019-08-21', 'Ninoy Aquino Day'), ('2019-08-26', 'National Heroes Day'), ('2019-11-01', "All Saints' Day"), ('2019-11-02', "All Souls' Day"), ('2019-11-30', 'Bonifacio Day'), ('2019-12-08', 'Feast of the Immaculate Conception'), ('2019-12-24', 'Christmas Eve'), ('2019-12-25', 'Christmas Day'), ('2019-12-30', 'Rizal Day'), ('2019-12-31', 'Last Day of the Year')],
    2020: [('2020-01-01', "New Year's Day"), ('2020-01-25', 'Chinese New Year'), ('2020-02-25', 'EDSA People Power Revolution Anniversary'), ('2020-04-09', 'Araw ng Kagitingan'), ('2020-04-09', 'Maundy Thursday'), ('2020-04-10', 'Good Friday'), ('2020-04-11', 'Black Saturday'), ('2020-05-01', 'Labor Day'), ('2020-05-25', "Eid'l Fitr"), ('2020-06-12', 'Independence Day'), ('2020-07-31', "Eid'l Adha"), ('2020-08-21', 'Ninoy Aquino Day'), ('2020-08-31', 'National Heroes Day'), ('2020-11-01', "All Saints' Day"), ('2020-11-02', "All Souls' Day"), ('2020-11-30', 'Bonifacio Day'), ('2020-12-08', 'Feast of the Immaculate Conception'), ('2020-12-24', 'Christmas Eve'), ('2020-12-25', 'Christmas Day'), ('2020-12-30', 'Rizal Day'), ('2020-12-31', 'Last Day of the Year')],
    2021: [('2021-01-01', "New Year's Day"), ('2021-02-12', 'Chinese New Year'), ('2021-02-25', 'EDSA People Power Revolution Anniversary'), ('2021-04-01', 'Maundy Thursday'), ('2021-04-02', 'Good Friday'), ('2021-04-03', 'Black Saturday'), ('2021-04-09', 'Araw ng Kagitingan'), ('2021-05-01', 'Labor Day'), ('2021-05-13', "Eid'l Fitr"), ('2021-06-12', 'Independence Day'), ('2021-07-20', "Eid'l Adha"), ('2021-08-21', 'Ninoy Aquino Day'), ('2021-08-30', 'National Heroes Day'), ('2021-11-01', "All Saints' Day"), ('2021-11-30', 'Bonifacio Day'), ('2021-12-08', 'Feast of the Immaculate Conception'), ('2021-12-25', 'Christmas Day'), ('2021-12-30', 'Rizal Day')],
    2022: [('2022-01-01', "New Year's Day"), ('2022-02-01', 'Chinese New Year'), ('2022-02-25', 'EDSA People Power Revolution Anniversary'), ('2022-04-09', 'Araw ng Kagitingan'), ('2022-04-14', 'Maundy Thursday'), ('2022-04-15', 'Good Friday'), ('2022-04-16', 'Black Saturday'), ('2022-05-01', 'Labor Day'), ('2022-05-03', "Eid'l Fitr"), ('2022-05-09', 'National and local elections'), ('2022-06-12', 'Independence Day'), ('2022-07-09', "Eid'l Adha"), ('2022-08-21', 'Ninoy Aquino Day'), ('2022-08-29', 'National Heroes Day'), ('2022-10-31', 'Additional special day'), ('2022-11-01', "All Saints' Day"), ('2022-11-30', 'Bonifacio Day'), ('2022-12-08', 'Feast of the Immaculate Conception'), ('2022-12-25', 'Christmas Day'), ('2022-12-26', 'Additional special day'), ('2022-12-30', 'Rizal Day')],
    2023: [('2023-01-01', "New Year's Day"), ('2023-01-02', 'Additional special day'), ('2023-02-24', 'EDSA People Power Revolution Anniversary'), ('2023-04-06', 'Maundy Thursday'), ('2023-04-07', 'Good Friday'), ('2023-04-08', 'Black Saturday'), ('2023-04-10', 'Araw ng Kagitingan'), ('2023-04-21', "Eid'l Fitr"), ('2023-05-01', 'Labor Day'), ('2023-06-12', 'Independence Day'), ('2023-06-28', "Eid'l Adha"), ('2023-08-21', 'Ninoy Aquino Day'), ('2023-08-28', 'National Heroes Day'), ('2023-10-30', 'Barangay and SK elections'), ('2023-11-01', "All Saints' Day"), ('2023-11-02', "All Souls' Day"), ('2023-11-27', 'Bonifacio Day'), ('2023-12-08', 'Feast of the Immaculate Conception'), ('2023-12-25', 'Christmas Day'), ('2023-12-26', 'Additional special day'), ('2023-12-30', 'Rizal Day'), ('2023-12-31', 'Last Day of the Year')],
    2024: [('2024-01-01', "New Year's Day"), ('2024-02-09', 'Additional special day'), ('2024-02-10', 'Chinese New Year'), ('2024-03-28', 'Maundy Thursday'), ('2024-03-29', 'Good Friday'), ('2024-03-30', 'Black Saturday'), ('2024-04-09', 'Araw ng Kagitingan'), ('2024-04-10', "Eid'l Fitr"), ('2024-05-01', 'Labor Day'), ('2024-06-12', 'Independence Day'), ('2024-06-17', "Eid'l Adha"), ('2024-08-23', 'Ninoy Aquino Day'), ('2024-08-26', 'National Heroes Day'), ('2024-11-01', "All Saints' Day"), ('2024-11-02', "All Souls' Day"), ('2024-11-30', 'Bonifacio Day'), ('2024-12-08', 'Feast of the Immaculate Conception'), ('2024-12-24', 'Christmas Eve'), ('2024-12-25', 'Christmas Day'), ('2024-12-30', 'Rizal Day'), ('2024-12-31', 'Last Day of the Year')],
    2025: [('2025-01-01', "New Year's Day"), ('2025-01-29', 'Chinese New Year'), ('2025-04-01', "Eid'l Fitr"), ('2025-04-09', 'Araw ng Kagitingan'), ('2025-04-17', 'Maundy Thursday'), ('2025-04-18', 'Good Friday'), ('2025-04-19', 'Black Saturday'), ('2025-05-01', 'Labor Day'), ('2025-05-12', 'National and local elections'), ('2025-06-06', "Eid'l Adha"), ('2025-06-12', 'Independence Day'), ('2025-07-27', 'Iglesia ni Cristo 111th anniversary (Sunday)'), ('2025-08-21', 'Ninoy Aquino Day'), ('2025-08-25', 'National Heroes Day'), ('2025-10-31', "All Saints' Day Eve"), ('2025-11-01', "All Saints' Day"), ('2025-11-30', 'Bonifacio Day'), ('2025-12-08', 'Feast of the Immaculate Conception'), ('2025-12-24', 'Christmas Eve'), ('2025-12-25', 'Christmas Day'), ('2025-12-30', 'Rizal Day'), ('2025-12-31', 'Last Day of the Year')],
    2026: [('2026-01-01', "New Year's Day"), ('2026-02-17', 'Chinese New Year'), ('2026-03-20', "Eid'l Fitr"), ('2026-04-02', 'Maundy Thursday'), ('2026-04-03', 'Good Friday'), ('2026-04-04', 'Black Saturday'), ('2026-04-09', 'Araw ng Kagitingan'), ('2026-05-01', 'Labor Day'), ('2026-05-27', "Eid'l Adha"), ('2026-06-12', 'Independence Day'), ('2026-08-21', 'Ninoy Aquino Day'), ('2026-08-31', 'National Heroes Day'), ('2026-11-01', "All Saints' Day"), ('2026-11-02', "All Souls' Day"), ('2026-11-30', 'Bonifacio Day'), ('2026-12-08', 'Feast of the Immaculate Conception'), ('2026-12-24', 'Christmas Eve'), ('2026-12-25', 'Christmas Day'), ('2026-12-30', 'Rizal Day'), ('2026-12-31', 'Last Day of the Year')],
    2027: [('2027-01-01', "New Year's Day"), ('2027-02-06', 'Chinese New Year'), ('2027-03-25', 'Maundy Thursday'), ('2027-03-26', 'Good Friday'), ('2027-03-27', 'Black Saturday'), ('2027-04-09', 'Araw ng Kagitingan'), ('2027-05-01', 'Labor Day'), ('2027-06-12', 'Independence Day'), ('2027-08-21', 'Ninoy Aquino Day'), ('2027-08-30', 'National Heroes Day'), ('2027-11-01', "All Saints' Day"), ('2027-11-02', "All Souls' Day"), ('2027-11-30', 'Bonifacio Day'), ('2027-12-08', 'Feast of the Immaculate Conception'), ('2027-12-24', 'Christmas Eve'), ('2027-12-25', 'Christmas Day'), ('2027-12-30', 'Rizal Day'), ('2027-12-31', 'Last Day of the Year')],
}
PH_PROCLAMATIONS = {
    2000: [('242', 'https://lawphil.net/executive/proc/proc2000/proc_242_2000.html'), ('264', 'https://lawphil.net/executive/proc/proc2000/proc_264_2000.html'), ('398', 'https://lawphil.net/executive/proc/proc2000/proc_398_2000.html')],
    2001: [('25', 'https://lawphil.net/executive/proc/proc2001/proc_25_2001.html'), ('44', 'https://lawphil.net/executive/proc/proc2001/proc_44_2001.html'), ('106', 'https://lawphil.net/executive/proc/proc2001/proc_106_2001.html'), ('120', 'https://lawphil.net/executive/proc/proc2001/proc_120_2001.html'), ('120-a', 'https://lawphil.net/executive/proc/proc2001/proc_120-a_2001.html'), ('129', 'https://lawphil.net/executive/proc/proc2001/proc_129_2001.html')],
    2002: [('151', 'https://lawphil.net/executive/proc/proc2002/proc_151_2002.html'), ('164', 'https://lawphil.net/executive/proc/proc2002/proc_164_2002.html'), ('170', 'https://lawphil.net/executive/proc/proc2002/proc_170_2002.html'), ('217', 'https://lawphil.net/executive/proc/proc2002/proc_217_2002.html'), ('277', 'https://lawphil.net/executive/proc/proc2002/proc_277_2002.html'), ('292', 'https://lawphil.net/executive/proc/proc2002/proc_292_2002.html'), ('298', 'https://lawphil.net/executive/proc/proc2002/proc_298_2002.html')],
    2003: [('331', 'https://lawphil.net/executive/proc/proc2003/proc_331_2003.html'), ('351', 'https://lawphil.net/executive/proc/proc2003/proc_351_2003.html'), ('354', 'https://lawphil.net/executive/proc/proc2003/proc_354_2003.html'), ('373', 'https://lawphil.net/executive/proc/proc2003/proc_373_2003.html'), ('498', 'https://lawphil.net/executive/proc/proc2003/proc_498_2003.html'), ('503', 'https://lawphil.net/executive/proc/proc2003/proc_503_2003.html'), ('324', 'https://lawphil.net/executive/proc/proc2003/proc_324_2003.html'), ('367', 'https://lawphil.net/executive/proc/proc2003/proc_367_2003.html'), ('374', 'https://lawphil.net/executive/proc/proc2003/proc_374_2003.html')],
    2004: [('503', 'https://lawphil.net/executive/proc/proc2003/proc_503_2003.html'), ('532', 'https://lawphil.net/executive/proc/proc2004/proc_532_2004.html'), ('549', 'https://lawphil.net/executive/proc/proc2004/proc_549_2004.html'), ('583', 'https://lawphil.net/executive/proc/proc2004/proc_583_2004.html'), ('628', 'https://lawphil.net/executive/proc/proc2004/proc_628_2004.html'), ('721', 'https://lawphil.net/executive/proc/proc2004/proc_721_2004.html'), ('727', 'https://lawphil.net/executive/proc/proc2004/proc_727_2004.html'), ('750', 'https://lawphil.net/executive/proc/proc2004/proc_750_2004.html')],
    2005: [('756', 'https://lawphil.net/executive/proc/proc2005/proc_756_2005.html'), ('785', 'https://lawphil.net/executive/proc/proc2005/proc_785_2005.html'), ('808', 'https://lawphil.net/executive/proc/proc2005/proc_808_2005.html'), ('837', 'https://lawphil.net/executive/proc/proc2005/proc_837_2005.html'), ('839', 'https://lawphil.net/executive/proc/proc2005/proc_839_2005.html'), ('856', 'https://lawphil.net/executive/proc/proc2005/proc_856_2005.html'), ('933', 'https://lawphil.net/executive/proc/proc2005/proc_933_2005.html'), ('896', 'https://lawphil.net/executive/proc/proc2005/proc_896_2005.html')],
    2006: [('1015', 'https://lawphil.net/executive/proc/proc2006/proc_1015_2006.html'), ('1048', 'https://lawphil.net/executive/proc/proc2006/proc_1048_2006.html'), ('1155', 'https://lawphil.net/executive/proc/proc2006/proc_1155_2006.html'), ('1169', 'https://lawphil.net/executive/proc/proc2006/proc_1169_2006.html'), ('974', 'https://lawphil.net/executive/proc/proc2006/proc_974_2006.html')],
    2007: [('1211', 'https://lawphil.net/executive/proc/proc2007/proc_1211_2007.html'), ('1279', 'https://lawphil.net/executive/proc/proc2007/proc_1279_2007.html'), ('1353', 'https://lawphil.net/executive/proc/proc2007/proc_1353_2007.html'), ('1397', 'https://lawphil.net/executive/proc/proc2007/proc_1397_2007.html'), ('1403', 'https://lawphil.net/executive/proc/proc2007/proc_1403_2007.html')],
    2008: [('1462', 'https://lawphil.net/executive/proc/proc2008/proc_1462_2008.html'), ('1463', 'https://lawphil.net/executive/proc/proc2008/proc_1463_2008.html'), ('1463-a', 'https://lawphil.net/executive/proc/proc2008/proc_1463-a_2008.html'), ('1471', 'https://lawphil.net/executive/proc/proc2008/proc_1471_2008.html'), ('1625', 'https://lawphil.net/executive/proc/proc2008/proc_1625_2008.html')],
    2009: [('1699', 'https://lawphil.net/executive/proc/proc2008/proc_1699_2008.html'), ('1695', 'https://lawphil.net/executive/proc/proc2008/proc_1695_2008.html'), ('1728', 'https://lawphil.net/executive/proc/proc2009/proc_1728_2009.html'), ('1752', 'https://lawphil.net/executive/proc/proc2009/proc_1752_2009.html'), ('1808', 'https://lawphil.net/executive/proc/proc2009/proc_1808_2009.html'), ('1851', 'https://lawphil.net/executive/proc/proc2009/proc_1851_2009.html'), ('1880', 'https://lawphil.net/executive/proc/proc2009/proc_1880_2009.html')],
    2010: [('1841', 'https://lawphil.net/executive/proc/proc2009/proc_1841_2009.html'), ('2020', 'https://lawphil.net/executive/proc/proc2010/proc_2020_2010.html'), ('2029', 'https://lawphil.net/executive/proc/proc2010/proc_2029_2010.html'), ('2031', 'https://lawphil.net/executive/proc/proc2010/proc_2031_2010.html'), ('2043', 'https://lawphil.net/executive/proc/proc2010/proc_2043_2010.html'), ('2085', 'https://lawphil.net/executive/proc/proc2010/proc_2085_2010.html'), ('13', 'https://lawphil.net/executive/proc/proc2010/proc_13_2010.html'), ('26', 'https://lawphil.net/executive/proc/proc2010/proc_26_2010.html'), ('48', 'https://lawphil.net/executive/proc/proc2010/proc_48_2010.html'), ('60', 'https://lawphil.net/executive/proc/proc2010/proc_60_2010.html')],
    2011: [('84', 'https://lawphil.net/executive/proc/proc2010/proc_84_2010.html'), ('150', 'https://lawphil.net/executive/proc/proc2011/proc_150_2011.html'), ('154', 'https://lawphil.net/executive/proc/proc2011/proc_154_2011.html'), ('234', 'https://lawphil.net/executive/proc/proc2011/proc_234_2011.html'), ('265', 'https://lawphil.net/executive/proc/proc2011/proc_265_2011.html'), ('276', 'https://lawphil.net/executive/proc/proc2011/proc_276_2011.html')],
    2012: [('295', 'https://lawphil.net/executive/proc/proc2011/proc_295_2011.html'), ('360', 'https://lawphil.net/executive/proc/proc2012/proc_360_2012.html'), ('361', 'https://lawphil.net/executive/proc/proc2012/proc_361_2012.html'), ('455', 'https://lawphil.net/executive/proc/proc2012/proc_455_2012.html'), ('488', 'https://lawphil.net/executive/proc/proc2012/proc_488_2012.html')],
    2013: [('459', 'https://lawphil.net/executive/proc/proc2012/proc_459_2012.html'), ('571', 'https://lawphil.net/executive/proc/proc2013/proc_571_2013.html'), ('629', 'https://lawphil.net/executive/proc/proc2013/proc_629_2013.html'), ('656', 'https://lawphil.net/executive/proc/proc2013/proc_656_2013.html'), ('658', 'https://lawphil.net/executive/proc/proc2013/proc_658_2013.html')],
    2014: [('655', 'https://lawphil.net/executive/proc/proc2013/proc_655_2013.html'), ('826', 'https://lawphil.net/executive/proc/proc2014/proc_826_2014.html'), ('875', 'https://lawphil.net/executive/proc/proc2014/proc_875_2014.html')],
    2015: [('831', 'https://lawphil.net/executive/proc/proc2014/proc_831_2014.html'), ('1070', 'https://lawphil.net/executive/proc/proc2015/proc_1070_2015.html'), ('1128', 'https://lawphil.net/executive/proc/proc2015/proc_1128_2015.html')],
    2016: [('1105', 'https://lawphil.net/executive/proc/proc2015/proc_1105_2015.html'), ('1071', 'https://lawphil.net/executive/proc/proc2015/proc_1071_2015.html'), ('1254', 'https://lawphil.net/executive/proc/proc2016/proc_1254_2016.html'), ('6', 'https://lawphil.net/executive/proc/proc2016/proc_6_2016.html'), ('56', 'https://lawphil.net/executive/proc/proc2016/proc_56_2016.html'), ('117', 'https://lawphil.net/executive/proc/proc2016/proc_117_2016.html')],
    2017: [('50', 'https://lawphil.net/executive/proc/proc2016/proc_50_2016.html'), ('117', 'https://lawphil.net/executive/proc/proc2016/proc_117_2016.html'), ('235', 'https://lawphil.net/executive/proc/proc2017/proc_235_2017.html'), ('297', 'https://lawphil.net/executive/proc/proc2017/proc_297_2017.html')],
    2018: [('269', 'https://lawphil.net/executive/proc/proc2017/proc_269_2017.html'), ('479', 'https://lawphil.net/executive/proc/proc2018/proc_479_2018.html'), ('514', 'https://lawphil.net/executive/proc/proc2018/proc_514_2018.html'), ('556', 'https://web.archive.org/web/2018/http://www.officialgazette.gov.ph/2018/08/15/proclamation-no-556-s-2018/')],
    2019: [('555', 'https://lawphil.net/executive/proc/proc2018/proc_555_2018.html'), ('719', 'https://lawphil.net/executive/proc/proc2019/proc_719_2019.html'), ('729', 'https://lawphil.net/executive/proc/proc2019/proc_729_2019.html'), ('789', 'https://lawphil.net/executive/proc/proc2019/proc_789_2019.html')],
    2020: [('845', 'https://lawphil.net/executive/proc/proc2019/proc_845_2019.html'), ('944', 'https://lawphil.net/executive/proc/proc2020/proc_944_2020.html'), ('985', 'https://lawphil.net/executive/proc/proc2020/proc_985_2020.html')],
    2021: [('986', 'https://lawphil.net/executive/proc/proc2020/proc_986_2020.html'), ('1107', 'https://lawphil.net/executive/proc/proc2021/proc_1107_2021.html'), ('1142', 'https://lawphil.net/executive/proc/proc2021/proc_1142_2021.html'), ('1189', 'https://lawphil.net/executive/proc/proc2021/proc_1189_2021.html')],
    2022: [('1236', 'https://lawphil.net/executive/proc/proc2021/proc_1236_2021.html'), ('1356', 'https://lawphil.net/executive/proc/proc2022/proc_1356_2022.html'), ('1357', 'https://lawphil.net/executive/proc/proc2022/proc_1357_2022.html'), ('2', 'https://lawphil.net/executive/proc/proc2022/proc_2_2022.html'), ('79', 'https://lawphil.net/executive/proc/proc2022/proc_79_2022.html'), ('115', 'https://lawphil.net/executive/proc/proc2022/proc_115_2022.html')],
    2023: [('42', 'https://lawphil.net/executive/proc/proc2022/proc_42_2022.html'), ('90', 'https://lawphil.net/executive/proc/proc2022/proc_90_2022.html'), ('167', 'https://lawphil.net/executive/proc/proc2023/proc_167_2023.html'), ('201', 'https://lawphil.net/executive/proc/proc2023/proc_201_2023.html'), ('258', 'https://lawphil.net/executive/proc/proc2023/proc_258_2023.html'), ('359', 'https://lawphil.net/executive/proc/proc2023/proc_359_2023.html'), ('425', 'https://lawphil.net/executive/proc/proc2023/proc_425_2023.html')],
    2024: [('368', 'https://lawphil.net/executive/proc/proc2023/proc_368_2023.html'), ('453', 'https://lawphil.net/executive/proc/proc2024/proc_453_2024.html'), ('514', 'https://lawphil.net/executive/proc/proc2024/proc_514_2024.html'), ('579', 'https://lawphil.net/executive/proc/proc2024/proc_579_2024.html'), ('665', 'https://lawphil.net/executive/proc/proc2024/proc_665_2024.html')],
    2025: [('727', 'https://lawphil.net/executive/proc/proc2024/proc_727_2024.html'), ('729', 'https://lawphil.net/executive/proc/proc2024/proc_729_2024.html'), ('839', 'https://lawphil.net/executive/proc/proc2025/proc_839_2025.html'), ('878', 'https://lawphil.net/executive/proc/proc2025/pdf/proc_878_2025.pdf'), ('911', 'https://lawphil.net/executive/proc/proc2025/proc_911_2025.html')],
    2026: [('1006', 'https://lawphil.net/executive/proc/proc2025/proc_1006_2025.html'), ('1189', 'https://lawphil.net/executive/proc/proc2026/proc_1189_2026.html'), ('1264', 'https://lawphil.net/executive/proc/proc2026/proc_1264_2026.html')],
    2027: [('1427', 'https://lawphil.net/executive/proc/proc2026/proc_1427_2026.html')],
}
PH_SPECIAL_WORKING = {
    2004: ['2004-01-22'],
    2005: ['2005-02-09'],
    2021: ['2021-11-02', '2021-12-24', '2021-12-31'],
    2022: ['2022-11-02', '2022-12-24', '2022-12-31'],
    2025: ['2025-02-25'],
    2026: ['2026-02-25'],
    2027: ['2027-02-25'],
}


def ph_statutory(year: int) -> list[tuple[date, str]]:
    """EO 292 s. 26 as amended, with the Eid days by the tabular estimate."""
    easter = easter_western(year)
    out = [(date(year, 1, 1), "New Year's Day"), (easter - timedelta(days=3), "Maundy Thursday"),
           (easter - timedelta(days=2), "Good Friday"), (date(year, 4, 9), "Araw ng Kagitingan"),
           (date(year, 5, 1), "Labor Day"), (date(year, 6, 12), "Independence Day"),
           (first_weekday_on_or_after(date(year, 8, 25), 0), "National Heroes Day"),
           (date(year, 11, 30), "Bonifacio Day"), (date(year, 12, 25), "Christmas Day"),
           (date(year, 12, 30), "Rizal Day"), (date(year, 8, 21), "Ninoy Aquino Day"),
           (date(year, 11, 1), "All Saints' Day"), (date(year, 12, 8), "Feast of the Immaculate Conception"),
           (date(year, 12, 31), "Last Day of the Year")]
    out += [(d, "Eid'l Fitr (estimated)") for d in islamic_dates_in_year(year, 10, 1)]
    out += [(d, "Eid'l Adha (estimated)") for d in islamic_dates_in_year(year, 12, 10)]
    return out


PH_LAST_EID_YEAR = 2026


def ph_holidays(year: int) -> list[tuple[date, str]]:
    if year in PH_PROCLAIMED:
        out = [(date.fromisoformat(d), n) for d, n in PH_PROCLAIMED[year]]
        if year > PH_LAST_EID_YEAR:
            out += [(d, n) for d, n in ph_statutory(year) if "estimated" in n]
        return out
    return ph_statutory(year)


# --- Indonesia ------------------------------------------------------------
#
# Hari libur nasional: the SKB 3 Menteri (Menteri Agama, Menteri
# Ketenagakerjaan, Menteri PAN-RB) of each year 2000-2027 with its amendments,
# and the Keppres that made election days national holidays. Cuti bersama
# (collective leave, mandatory for ASN only) are kept apart, in :cuti-bersama.
# Years after 2027 are provisional: the fixed and Easter days, with the
# moveable days estimated the way the starter does (tabular Islamic
# calendar; Imlek, Waisak = lunar 4/15 and Nyepi from the HKO tables).

ID_NOTE = (
    "Hari libur nasional as each year's SKB 3 Menteri (and amendments, and the election-day Keppres) set "
    "them, 2000-2027. Cuti bersama are not hari libur: they are listed under :cuti-bersama (the "
    "calendar with :cuti-bersama t). 2028-2040 are provisional: fixed and Easter days, moveable days "
    "estimated (perkiraan)."
)

ID_SOURCES = [
    ("SKB 3 Menteri tentang Hari Libur Nasional dan Cuti Bersama, 2014-2027 (JDIH Kemnaker)",
     "https://jdih.kemnaker.go.id/peraturan/detail/3089",
     "Keputusan Bersama Menteri Agama, Menteri Ketenagakerjaan dan Menteri PAN-RB of each year and every "
     "amending SKB (2020: four, 2021: two, 2022: two, 2023: two); e.g. SKB 1205/2026, 3/2026, 2/2026 "
     "(2026-09-15) for 2027. Lampiran I: hari libur nasional; lampiran II: cuti bersama."),
    ("SKB 3 Menteri 2005-2013 (menkokesra.go.id, depag.go.id / kemenag.go.id; Wayback copies)",
     "https://www.kemenkopmk.go.id/index.php/node/6444",
     "E.g. SKB Menag No. 362/2004, Menakertrans KEP.119/MEN/VII/2004 (2005); No. 1/2009 (2010)."),
    ("Keputusan Presiden: hari pemungutan suara sebagai hari libur nasional",
     "https://web.archive.org/web/20250413192447/https://peraturan.bpk.go.id/Details/55580/keppres-no-26-tahun-2004",
     "Pemilu 2009, 2014, 2019, 2024 (Keppres 10/2024); Pilkada serentak 2015, 2017, 2018, 2020, 2024 "
     "(Keppres 33/2024)."),
    ("Keppres No. 19/2002 (Imlek, from 2003); Keppres No. 24/2013 (Hari Buruh, from 2014); Keppres No. "
     "24/2016 (Hari Lahir Pancasila, from 2017); Keppres No. 8/2024 (Kebangkitan Yesus Kristus)",
     "https://setkab.go.id/pemerintah-tetapkan-hari-libur-nasional-dan-cuti-bersama-tahun-2025/",
     "The fixed days of the starter's rules and their first years."),
]

# The SKB 3 Menteri of each year 2005-2027 with its amendments (and the election-day
# Keppres): every hari libur nasional and every cuti bersama as finally in force. Texts:
# jdih.kemnaker.go.id, setkab.go.id, kemenkopmk.go.id, setneg.go.id, peraturan.bpk.go.id
# (Wayback copies where gone). 2000-2004 have no primary text found (no gold).
ID_SKB = {
    2005: {
        "instrument": 'SKB Menag No. 362/2004, Menakertrans No. KEP.119/MEN/VII/2004, MenPAN No. SKB/02/M.PAN/7/2004 tentang Hari Libur Nasional dan Cuti Bersama Tahun 2005 (2004-07-19)',
        "urls": ['https://web.archive.org/web/20090816054808/http://www.menkokesra.go.id:80/pdf/libur0506.pdf', 'https://web.archive.org/web/20040816101954/http://www.depag.go.id:80/hariliburnas.php'],
        "libur": [('2005-01-01', 'Tahun Baru Masehi'), ('2005-01-21', 'Idul Adha 1425 Hijriah'), ('2005-02-09', 'Tahun Baru Imlek 2556'), ('2005-02-10', 'Tahun Baru 1426 Hijriah'), ('2005-03-11', 'Hari Raya Nyepi'), ('2005-03-25', 'Wafat Yesus Kristus'), ('2005-04-22', 'Maulid Nabi Muhammad SAW yang diperingati hari Kamis tanggal 21 April'), ('2005-05-05', 'Kenaikan Yesus Kristus'), ('2005-05-24', 'Hari raya Waisak'), ('2005-08-17', 'Hari Kemerdekaan RI'), ('2005-09-02', "Isra Mi'raj Nabi Muhammad SAW yang diperingati hari Kamis tanggal 1 September"), ('2005-11-03', 'Idul Fitri 1 Syawal 1426 Hijriah'), ('2005-11-04', 'Idul Fitri 1 Syawal 1426 Hijriah'), ('2005-12-25', 'Hari Raya Natal')],
        "cuti": [('2005-11-02', 'Cuti Bersama'), ('2005-11-05', 'Cuti Bersama'), ('2005-11-07', 'Cuti Bersama (7 dan 8 November fakultatif)'), ('2005-11-08', 'Cuti Bersama (7 dan 8 November fakultatif)')],
    },
    2006: {
        "instrument": 'SKB Menag No. 407/2005, Menakertrans No. KEP.185/MEN/VII/2005, MenPAN No. SKB/02/M.PAN/7/2005 tentang Hari-hari Libur Nasional dan Cuti Bersama Tahun 2006 (2005-07-29)',
        "amendments": ['SKB Menag No. 10/2006, Menakertrans No. KEP.132/MEN/III/2006, MenPAN No. 01/M.PAN/3/2006 (2006-03-22): adds cuti bersama 31 Mar, 26 May, 18 Aug'],
        "urls": ['https://web.archive.org/web/20090816054808/http://www.menkokesra.go.id:80/pdf/libur0506.pdf', 'https://web.archive.org/web/20060609043751/http://menkokesra.go.id/file/skb_libur.pdf'],
        "libur": [('2006-01-01', 'Tahun Baru Masehi'), ('2006-01-10', 'Idul Adha 1426 Hijriyah'), ('2006-01-29', 'Tahun Baru Imlek 2557'), ('2006-01-31', 'Tahun Baru 1427 Hijriyah'), ('2006-03-30', 'Hari Raya Nyepi'), ('2006-04-10', 'Maulid Nabi Muhammad SAW yang diperingati hari Selasa tanggal 11 April'), ('2006-04-14', 'Wafat Yesus Kristus'), ('2006-05-13', 'Hari Raya Waisak'), ('2006-05-25', 'Kenaikan Yesus Kristus'), ('2006-08-17', 'Hari Kemerdekaan RI'), ('2006-08-21', "Isra' Mi'raj Nabi Muhammad SAW"), ('2006-10-24', 'Idul Fitri 1 Syawal 1427 Hijriyah'), ('2006-10-25', 'Idul Fitri 1 Syawal 1427 Hijriyah'), ('2006-12-25', 'Hari Raya Natal'), ('2006-12-31', 'Idul Adha 1427 Hijriyah')],
        "cuti": [('2006-03-31', 'Cuti bersama'), ('2006-05-26', 'Cuti bersama'), ('2006-08-18', 'Cuti bersama'), ('2006-10-23', 'Cuti bersama'), ('2006-10-26', 'Cuti bersama'), ('2006-10-27', 'Cuti bersama')],
    },
    2007: {
        "instrument": 'SKB Menag No. 481/2006, Menakertrans No. KEP.281/MEN/VII/2006, MenPAN No. SKB/03/M.PAN/7/2006 tentang Hari-hari Libur Nasional dan Cuti Bersama Tahun 2007 (2006-07-24)',
        "amendments": ['SKB Menag No. 97/2007, Menakertrans No. KEP.326/MEN/X/2007, MenPAN No. SKB/10/M.PAN/10/2007 (2007-10-01): cuti Idul Fitri extended to 12, 15-19 Oct; adds 26 Dec and 31 Dec'],
        "urls": ['https://web.archive.org/web/20060901152018/http://menkokesra.go.id/pdf/libur2007.pdf', 'https://web.archive.org/web/20071124194232/http://www.menkokesra.go.id/pdf/skb_libur_2007_perubahan.pdf', 'https://web.archive.org/web/20080828061148/http://www.depag.go.id:80/index.php?a=artikel&id2=libur2007'],
        "libur": [('2007-01-01', 'Tahun Baru Masehi'), ('2007-01-20', 'Tahun Baru 1428 Hijriyah'), ('2007-02-18', 'Tahun Baru Imlek 2558'), ('2007-03-19', 'Hari Raya Nyepi Tahun Baru Saka 1929'), ('2007-03-31', 'Maulid Nabi Muhammad SAW'), ('2007-04-06', 'Wafat Yesus Kristus'), ('2007-05-17', 'Kenaikan Yesus Kristus'), ('2007-06-01', 'Hari Raya Waisak'), ('2007-08-11', "Isra' Mi'raj Nabi Muhammad SAW"), ('2007-08-17', 'Hari Kemerdekaan RI'), ('2007-10-13', 'Idul Fitri 1 Syawal 1428 Hijriyah'), ('2007-10-14', 'Idul Fitri 1 Syawal 1428 Hijriyah'), ('2007-12-20', 'Idul Adha 1428 Hijriyah'), ('2007-12-25', 'Hari Raya Natal')],
        "cuti": [('2007-05-18', 'Cuti Bersama menyambung hari libur Kenaikan Yesus Kristus'), ('2007-10-12', 'Cuti Bersama sebelum dan sesudah Hari Raya Idul Fitri 1 Syawal 1428 Hijriyah'), ('2007-10-15', 'Cuti Bersama sebelum dan sesudah Hari Raya Idul Fitri 1 Syawal 1428 Hijriyah'), ('2007-10-16', 'Cuti Bersama sebelum dan sesudah Hari Raya Idul Fitri 1 Syawal 1428 Hijriyah'), ('2007-10-17', 'Cuti Bersama sebelum dan sesudah Hari Raya Idul Fitri 1 Syawal 1428 Hijriyah'), ('2007-10-18', 'Cuti Bersama sebelum dan sesudah Hari Raya Idul Fitri 1 Syawal 1428 Hijriyah'), ('2007-10-19', 'Cuti Bersama sebelum dan sesudah Hari Raya Idul Fitri 1 Syawal 1428 Hijriyah'), ('2007-12-21', 'Cuti Bersama menyambung hari libur Hari Raya Idul Adha'), ('2007-12-24', 'Cuti Bersama sebelum Natal'), ('2007-12-26', 'Cuti Bersama sesudah Natal'), ('2007-12-31', 'Cuti bersama menyambut Tahun Baru 2008')],
    },
    2008: {
        "instrument": 'SKB Menag No. 55/2007, Menakertrans No. KEP.222/MEN/V/2007, MenPAN No. SKB/03/M.PAN/5/2007 tentang Hari-hari Libur Nasional dan Cuti Bersama Tahun 2008 (2007-05-30)',
        "amendments": ['SKB perubahan (Menakertrans 1/MEN/2008 per press reports), 2008-02-05: deletes cuti bersama 8 Feb, 2 May, 19 May'],
        "urls": ['https://web.archive.org/web/20071124194229/http://www.menkokesra.go.id/pdf/skb_libur_thn2008.pdf', 'https://web.archive.org/web/20080815121633/http://www.depag.go.id:80/index.php?a=artikel&id2=libur2008'],
        "libur": [('2008-01-01', 'Tahun Baru Masehi'), ('2008-01-10', 'Tahun Baru 1429 Hijriyah'), ('2008-02-07', 'Tahun Baru Imlek 2559'), ('2008-03-07', 'Hari Raya Nyepi Tahun Baru Saka 1930'), ('2008-03-20', 'Maulid Nabi Muhammad SAW'), ('2008-03-21', 'Wafat Yesus Kristus'), ('2008-05-01', 'Kenaikan Yesus Kristus'), ('2008-05-20', 'Hari Raya Waisak Tahun 2552'), ('2008-07-30', "Isra' Mi'raj Nabi Muhammad SAW"), ('2008-08-18', 'Hari Kemerdekaan RI yang diperingati pada hari Minggu tanggal 17 Agustus 2008'), ('2008-10-01', 'Idul Fitri 1 Syawal 1429 Hijriyah'), ('2008-10-02', 'Idul Fitri 1 Syawal 1429 Hijriyah'), ('2008-12-08', 'Idul Adha 1429 Hijriyah'), ('2008-12-25', 'Hari Raya Natal'), ('2008-12-29', 'Tahun Baru 1430 Hijriyah')],
        "cuti": [('2008-01-11', 'Cuti bersama menyambung hari libur Tahun Baru 1429 Hijriyah'), ('2008-09-29', 'Cuti bersama sebelum dan sesudah Hari Raya Idul Fitri 1 Syawal 1429 Hijriyah'), ('2008-09-30', 'Cuti bersama sebelum dan sesudah Hari Raya Idul Fitri 1 Syawal 1429 Hijriyah'), ('2008-10-03', 'Cuti bersama sebelum dan sesudah Hari Raya Idul Fitri 1 Syawal 1429 Hijriyah'), ('2008-12-26', 'Cuti bersama menyambung hari libur Hari Raya Natal')],
    },
    2009: {
        "instrument": 'SKB Menag No. 4/2008, Menakertrans No. KEP.115/MEN/VI/2008, MenPAN No. SKB/06/M.PAN/6/2008 tentang Hari-hari Libur Nasional dan Cuti Bersama Tahun 2009 (2008-06-09)',
        "amendments": ['Keppres 7/2009 (9 Apr 2009 Pemilu legislatif libur nasional)', 'Keppres 17/2009 (8 Jul 2009 Pilpres libur nasional)'],
        "urls": ['https://web.archive.org/web/20090219203451/http://www.menkokesra.go.id:80/pdf/skb_libur_thn2009.pdf', 'https://web.archive.org/web/2010/http://kemenag.go.id/file/dokumen/LIBUR2009.pdf', 'https://web.archive.org/web/2010/http://kemenag.go.id/file/dokumen/Kepres7th09.pdf', 'https://web.archive.org/web/20250413192539/https://peraturan.bpk.go.id/Details/55369/keppres-no-17-tahun-2009'],
        "libur": [('2009-01-01', 'Tahun Baru Masehi'), ('2009-01-26', 'Tahun Baru Imlek 2560'), ('2009-03-09', 'Maulid Nabi Muhammad SAW'), ('2009-03-26', 'Hari Raya Nyepi Tahun Baru Saka 1931'), ('2009-04-09', 'Hari Pemungutan Suara Pemilihan Umum Anggota DPR, DPD dan DPRD'), ('2009-04-10', 'Wafat Yesus Kristus'), ('2009-05-09', 'Hari Raya Waisak Tahun 2553'), ('2009-05-21', 'Kenaikan Yesus Kristus'), ('2009-07-08', 'Hari Pemungutan Suara Pemilihan Umum Presiden dan Wakil Presiden'), ('2009-07-20', "Isra' Mi'raj Nabi Muhammad SAW"), ('2009-08-17', 'Hari Kemerdekaan RI'), ('2009-09-21', 'Idul Fitri 1 Syawal 1430 Hijriyah'), ('2009-09-22', 'Idul Fitri 1 Syawal 1430 Hijriyah'), ('2009-11-27', 'Idul Adha 1430 Hijriyah'), ('2009-12-18', 'Tahun Baru 1431 Hijriyah'), ('2009-12-25', 'Hari Raya Natal')],
        "cuti": [('2009-01-02', 'Cuti Bersama Tahun Baru Masehi'), ('2009-09-18', 'Cuti Bersama Idul Fitri'), ('2009-09-23', 'Cuti Bersama Idul Fitri'), ('2009-12-24', 'Cuti Bersama Natal')],
    },
    2010: {
        "instrument": 'SKB Menag No. 1/2009, Menakertrans No. KEP.227/MEN/VIII/2009, MenPAN No. SKB/13/M.PAN/8/2009 tentang Hari-hari Libur Nasional dan Cuti Bersama Tahun 2010 (2009-08-07)',
        "urls": ['https://web.archive.org/web/20100202163124/http://www.menkokesra.go.id:80/pdf/skb_libur_thn2010.pdf', 'https://web.archive.org/web/2010/http://kemenag.go.id/file/dokumen/HariLiburCuti2010rev3.pdf'],
        "libur": [('2010-01-01', 'Tahun Baru Masehi'), ('2010-02-14', 'Tahun Baru Imlek 2561'), ('2010-02-26', 'Maulid Nabi Muhammad SAW'), ('2010-03-16', 'Hari Raya Nyepi Tahun Baru Saka 1932'), ('2010-04-02', 'Wafat Yesus Kristus'), ('2010-05-13', 'Kenaikan Yesus Kristus'), ('2010-05-28', 'Hari Raya Waisak Tahun 2554'), ('2010-07-10', "Isra' Mi'raj Nabi Muhammad SAW"), ('2010-08-17', 'Hari Kemerdekaan RI'), ('2010-09-10', 'Idul Fitri 1 Syawal 1431 Hijriyah'), ('2010-09-11', 'Idul Fitri 1 Syawal 1431 Hijriyah'), ('2010-11-17', 'Idul Adha 1431 Hijriyah'), ('2010-12-07', 'Tahun Baru 1432 Hijriyah'), ('2010-12-25', 'Hari Raya Natal')],
        "cuti": [('2010-09-09', 'Cuti Bersama Idul Fitri'), ('2010-09-13', 'Cuti Bersama Idul Fitri'), ('2010-12-24', 'Cuti Bersama Hari Raya Natal')],
    },
    2011: {
        "instrument": 'SKB Menag No. 2/2010, Menakertrans No. KEP.110/MEN/VI/2010, MenPAN-RB No. SKB/07/M.PAN-RB/06/2010 tentang Hari Libur Nasional dan Cuti Bersama Tahun 2011 (2010-06-15)',
        "amendments": ['SKB 3 Menteri (decided 2011-05-13): cuti bersama Senin 16 Mei 2011 (before Waisak)', "SKB 3 Menteri (~2011-05-20, cited as '.../RB/5/2011 tanggal 20 Mei 2011'): cuti bersama Jumat 3 Juni 2011"],
        "urls": ['https://web.archive.org/web/2011/http://kemenag.go.id/file/dokumen/HrLibur2011.pdf', 'https://web.archive.org/web/20101024204833/http://www.menkokesra.go.id:80/content/cuti-bersama-pns-2011-sebanyak-empat-hari', 'https://web.archive.org/web/20110516070219/http://www.menkokesra.go.id:80/content/libur-16-mei-diputuskan-jumat-pagi', 'https://web.archive.org/web/20110526233004/http://www.menkokesra.go.id:80/content/3-juni-cuti-bersama-2011', 'https://web.archive.org/web/20111226120324/http://kemenag.go.id/file/dokumen/SEcutibersama11.pdf'],
        "libur": [('2011-01-01', 'Tahun Baru Masehi'), ('2011-02-03', 'Tahun Baru Imlek 2562'), ('2011-02-15', 'Maulid Nabi Muhammad SAW'), ('2011-03-05', 'Hari Raya Nyepi Tahun Baru Saka 1933'), ('2011-04-22', 'Wafat Yesus Kristus'), ('2011-05-17', 'Hari Raya Waisak Tahun 2555'), ('2011-06-02', 'Kenaikan Yesus Kristus'), ('2011-06-29', "Isra' Mi'raj Nabi Muhammad SAW"), ('2011-08-17', 'Hari Kemerdekaan RI'), ('2011-08-30', 'Idul Fitri 1 Syawal 1432 Hijriyah'), ('2011-08-31', 'Idul Fitri 1 Syawal 1432 Hijriyah'), ('2011-11-06', 'Idul Adha 1432 Hijriyah'), ('2011-11-27', 'Tahun Baru 1433 Hijriyah'), ('2011-12-25', 'Hari Raya Natal')],
        "cuti": [('2011-05-16', 'Cuti Bersama (menjelang Hari Raya Waisak)'), ('2011-06-03', 'Cuti Bersama (setelah Kenaikan Yesus Kristus)'), ('2011-08-29', 'Cuti Bersama Idul Fitri 1 Syawal 1432 Hijriyah'), ('2011-09-01', 'Cuti Bersama Idul Fitri 1 Syawal 1432 Hijriyah'), ('2011-09-02', 'Cuti Bersama Idul Fitri 1 Syawal 1432 Hijriyah'), ('2011-12-26', 'Cuti Bersama Hari Raya Natal')],
    },
    2012: {
        "instrument": 'SKB Menag No. 7/2011, Menakertrans No. 04/MEN/VII/2011, MenPAN-RB No. SKB/03/M.PAN-RB/07/2011 tentang Hari Libur Nasional dan Cuti Bersama Tahun 2012 (2011-07-13)',
        "amendments": ['SKB Menag No. 2/2012, Menakertrans No. KEP.28/MEN/I/2012, MenPAN-RB No. SKB/01/M.PAN-RB/01/2012 (2012-01-31): adds cuti bersama 31 Dec 2012'],
        "urls": ['https://web.archive.org/web/20111014013341/http://kemenag.go.id/file/dokumen/Cutibersamadanlibur2012.pdf', 'https://web.archive.org/web/20141120225943/http://kemenag.go.id/file/dokumen/revisihariliburnas2012.pdf', 'https://web.archive.org/web/20110716070103/http://www.menkokesra.go.id:80/content/libur-nasional-dan-cuti-bersama-2012'],
        "libur": [('2012-01-01', 'Tahun Baru Masehi'), ('2012-01-23', 'Tahun Baru Imlek 2563'), ('2012-02-05', 'Maulid Nabi Muhammad SAW'), ('2012-03-23', 'Hari Raya Nyepi Tahun Baru Saka 1934'), ('2012-04-06', 'Wafat Yesus Kristus'), ('2012-05-06', 'Hari Raya Waisak Tahun 2556'), ('2012-05-17', 'Kenaikan Yesus Kristus'), ('2012-06-17', "Isra' Mi'raj Nabi Muhammad SAW"), ('2012-08-17', 'Hari Kemerdekaan RI'), ('2012-08-19', 'Hari Raya Idul Fitri 1433 Hijriyah'), ('2012-08-20', 'Hari Raya Idul Fitri 1433 Hijriyah'), ('2012-10-26', 'Hari Raya Idul Adha 1433 Hijriyah'), ('2012-11-15', 'Tahun Baru Hijriyah 1434'), ('2012-12-25', 'Hari Raya Natal')],
        "cuti": [('2012-05-18', 'Cuti Bersama Kenaikan Yesus Kristus'), ('2012-08-21', 'Cuti Bersama Idul Fitri 1 Syawal 1433 Hijriyah'), ('2012-08-22', 'Cuti Bersama Idul Fitri 1 Syawal 1433 Hijriyah'), ('2012-11-16', 'Cuti Bersama Tahun Baru Hijriyah 1434'), ('2012-12-24', 'Cuti Bersama Hari Raya Natal'), ('2012-12-31', 'Cuti Bersama Tahun Baru Masehi 2013')],
    },
    2013: {
        "instrument": "SKB 3 Menteri tentang Hari Libur Nasional dan Cuti Bersama Tahun 2013 (signed 2012-07-19; cited by Kemenko Kesra as 'Nomor 5 Tahun 2012')",
        "urls": ['https://web.archive.org/web/20120724040834/http://www.menkokesra.go.id:80/content/tahun2013-ada-14-hari-libur-nasional-dan-5-hari-cuti-bersama', 'https://web.archive.org/web/20120724222423/http://www.menkokesra.go.id:80/content/skb-hari-libur-nasional-dan-cuti-bersama-2013', 'https://arsip.kemenkopmk.go.id/artikel/cuti-bersama-idul-fitri-1434-h-tanggal-5-7-agustus-2013'],
        "libur": [('2013-01-01', 'Tahun Baru 2013'), ('2013-01-24', 'Maulid Nabi Muhammad SAW'), ('2013-02-10', 'Tahun Baru Imlek 2564'), ('2013-03-12', 'Hari Raya Nyepi Tahun Baru Saka 1935'), ('2013-03-29', 'Wafat Isa Al Masih'), ('2013-05-09', 'Kenaikan Isa Almasih'), ('2013-05-25', 'Hari Raya Waisak 2557'), ('2013-06-06', "Isra Mi'raj Nabi Muhammad SAW"), ('2013-08-08', 'Hari Raya Idul Fitri 1434 H'), ('2013-08-09', 'Hari Raya Idul Fitri 1434 H'), ('2013-08-17', 'Hari Kemerdekaan RI'), ('2013-10-15', 'Hari Raya Idul Adha 1434 H'), ('2013-11-05', 'Tahun Baru 1435 H'), ('2013-12-25', 'Hari Raya Natal')],
        "cuti": [('2013-08-05', 'Cuti Bersama Hari Raya Idul Fitri 1434 H'), ('2013-08-06', 'Cuti Bersama Hari Raya Idul Fitri 1434 H'), ('2013-08-07', 'Cuti Bersama Hari Raya Idul Fitri 1434 H'), ('2013-10-14', 'Cuti Bersama Hari Raya Idul Adha 1434 H'), ('2013-12-26', 'Cuti Bersama Hari Raya Natal')],
    },
    2014: {
        "instrument": 'SKB 3 Menteri (Menag, Menakertrans, MenPAN-RB) tentang Hari Libur Nasional dan Cuti Bersama Tahun 2014 (signed 2013-08-21)',
        "amendments": ['Keppres 14/2014 (9 Apr 2014 Pemilu legislatif libur nasional)', 'Keppres 24/2014 (9 Jul 2014 Pilpres libur nasional)'],
        "urls": ['https://web.archive.org/web/20130905085338/http://www.menkokesra.go.id:80/content/skb-hari-libur-nasional-dan-cuti-bersama-tahun-2014-ditandatangani', 'https://jdih.kemnaker.go.id/peraturan/detail/522', 'https://jdih.kemnaker.go.id/peraturan/detail/533', 'https://jdih.kemnaker.go.id/peraturan/detail/425'],
        "libur": [('2014-01-01', 'Tahun Baru 2014'), ('2014-01-14', 'Maulid Nabi Muhammad SAW'), ('2014-01-31', 'Tahun Baru Imlek 2565 Kongzili'), ('2014-03-31', 'Nyepi Tahun Baru Saka 1936'), ('2014-04-09', 'Hari Pemungutan Suara Pemilu Anggota DPR, DPD dan DPRD'), ('2014-04-18', 'Wafat Isa Al Masih'), ('2014-05-01', 'Hari Buruh Internasional'), ('2014-05-15', 'Hari Raya Waisak 2558'), ('2014-05-27', "Isra' Mi'raj Nabi Muhammad SAW"), ('2014-05-29', 'Kenaikan Isa Al Masih'), ('2014-07-09', 'Hari Pemungutan Suara Pemilu Presiden dan Wakil Presiden'), ('2014-07-28', 'Hari Raya Idul Fitri 1435 Hijriah'), ('2014-07-29', 'Hari Raya Idul Fitri 1435 Hijriah'), ('2014-08-17', 'Hari Kemerdekaan RI'), ('2014-10-05', 'Hari Raya Idul Adha 1435 Hijriah'), ('2014-10-25', 'Tahun Baru Islam 1436 Hijriah'), ('2014-12-25', 'Hari Raya Natal')],
        "cuti": [('2014-07-30', 'Cuti Bersama Hari Raya Idul Fitri 1435 Hijriah'), ('2014-07-31', 'Cuti Bersama Hari Raya Idul Fitri 1435 Hijriah'), ('2014-08-01', 'Cuti Bersama Hari Raya Idul Fitri 1435 Hijriah'), ('2014-12-26', 'Cuti Bersama Hari Raya Natal')],
    },
    2015: {
        "instrument": 'SKB Menag No. 05/2014, Menakertrans No. 3/SKB/MEN/V/2014, MenPAN-RB No. 02/SKB/MENPAN/V/2014 tentang Hari Libur Nasional dan Cuti Bersama Tahun 2015 (May 2014)',
        "amendments": ['SKB Menag No. 16/2014, Menakertrans No. 310/2014, MenPAN-RB No. 07/SKB/MENPAN-RB/09/2014 (Sep 2014): adds libur Maulid 1437 H on 24 Dec 2015 and drops cuti bersama Natal 24 Dec', 'Keppres 25/2015 (2015-11-23): Pilkada serentak 9 Dec 2015 libur nasional'],
        "urls": ['https://jdih.kemnaker.go.id/peraturan/detail/532', 'https://jdih.kemnaker.go.id/peraturan/detail/549', 'https://jdih.kemnaker.go.id/peraturan/detail/1181', 'https://setkab.go.id/sukseskan-pilkada-serentak-pemerintah-tetapkan-9-desember-2015-sebagai-hari-libur-nasional/'],
        "libur": [('2015-01-01', 'Tahun Baru 2015'), ('2015-01-03', 'Maulid Nabi Muhammad SAW 1436 H'), ('2015-02-19', 'Tahun Baru Imlek 2566 Kongzili'), ('2015-03-21', 'Hari Raya Nyepi Tahun Baru Saka 1937'), ('2015-04-03', 'Wafat Isa Almasih'), ('2015-05-01', 'Hari Buruh Internasional'), ('2015-05-14', 'Kenaikan Yesus Kristus'), ('2015-05-16', 'Isra Mikraj Nabi Muhammad SAW'), ('2015-06-02', 'Hari Raya Waisak 2559'), ('2015-07-17', 'Hari Raya Idul Fitri 1436 Hijriyah'), ('2015-07-18', 'Hari Raya Idul Fitri 1436 Hijriyah'), ('2015-08-17', 'Hari Kemerdekaan RI'), ('2015-09-24', 'Hari Raya Idul Adha 1436 Hijriyah'), ('2015-10-14', 'Tahun Baru 1437 Hijriyah'), ('2015-12-09', 'Hari Pemungutan Suara Pemilihan Kepala Daerah Serentak'), ('2015-12-24', 'Maulid Nabi Muhammad SAW 1437 H'), ('2015-12-25', 'Hari Raya Natal')],
        "cuti": [('2015-07-16', 'Cuti Bersama Hari Raya Idul Fitri 1436 Hijriyah'), ('2015-07-20', 'Cuti Bersama Hari Raya Idul Fitri 1436 Hijriyah'), ('2015-07-21', 'Cuti Bersama Hari Raya Idul Fitri 1436 Hijriyah')],
    },
    2016: {
        "instrument": 'SKB Menag No. 150/2015, Menaker No. 2/SKB/MEN/VI/2015, MenPAN-RB No. 01/2015 tentang Hari Libur Nasional dan Cuti Bersama Tahun 2016 (2015-06-25)',
        "urls": ['https://jdih.kemnaker.go.id/peraturan/detail/619', 'https://setkab.go.id/jadi-hari-libur-nasional-inilah-keppres-penetapan-1-juni-sebagai-hari-lahir-pancasila/'],
        "libur": [('2016-01-01', 'Tahun Baru 2016 Masehi'), ('2016-02-08', 'Tahun Baru Imlek 2567 Kongzili'), ('2016-03-09', 'Hari Raya Nyepi Tahun Baru Saka 1938'), ('2016-03-25', 'Wafat Isa Al-Masih'), ('2016-05-01', 'Hari Buruh Internasional'), ('2016-05-05', 'Kenaikan Yesus Kristus'), ('2016-05-06', 'Isra Mikraj Nabi Muhammad SAW'), ('2016-05-22', 'Hari Raya Waisak 2560'), ('2016-07-06', 'Hari Raya Idul Fitri 1437 Hijriyah'), ('2016-07-07', 'Hari Raya Idul Fitri 1437 Hijriyah'), ('2016-08-17', 'Hari Kemerdekaan Republik Indonesia'), ('2016-09-12', 'Hari Raya Idul Adha 1437 Hijriyah'), ('2016-10-02', 'Tahun Baru Islam 1438 Hijriyah'), ('2016-12-12', 'Maulid Nabi Muhammad SAW'), ('2016-12-25', 'Hari Raya Natal')],
        "cuti": [('2016-07-04', 'Cuti Bersama Hari Raya Idul Fitri 1437 Hijriyah'), ('2016-07-05', 'Cuti Bersama Hari Raya Idul Fitri 1437 Hijriyah'), ('2016-07-08', 'Cuti Bersama Hari Raya Idul Fitri 1437 Hijriyah'), ('2016-12-26', 'Cuti Bersama Hari Raya Natal')],
    },
    2017: {
        "instrument": 'SKB Menag No. 135/2016, Menaker No. SKB 109/2016, MenPAN-RB No. 01/SKB/MENPANRB/04/2016 tentang Hari Libur Nasional dan Cuti Bersama Tahun 2017 (2016-04-14)',
        "amendments": ['SKB Menag No. 684/2016, Menaker No. 302/2016, MenPAN-RB No. SKB/02/MENPAN-RB/11/2016 (2016-11-21): adds libur 1 Jun (Hari Lahir Pancasila); cuti bersama 2 Jan, 27-30 Jun, 26 Dec (23 Jun dropped)', 'Keppres 3/2017 (2017-02-10): Pilkada serentak 15 Feb 2017 libur nasional', 'Keppres 18/2017 (2017-06-15): cuti bersama PNS 23, 27-30 Jun and 26 Dec 2017 (re-adds 23 Jun)', 'Keppres 10/2017 (2017-04-13): 19 Apr 2017 Pilkada DKI putaran II - libur only in DKI Jakarta (not national, excluded)'],
        "urls": ['https://jdih.kemnaker.go.id/peraturan/detail/1232', 'https://jdih.kemnaker.go.id/peraturan/detail/1360', 'https://jdih.kemnaker.go.id/peraturan/detail/1438', 'https://jdih.kemnaker.go.id/peraturan/detail/1444', 'https://setkab.go.id/tidak-kurangi-hak-cuti-tahunan-presiden-jokowi-tetapkan-23-juni-sebagai-cuti-bersama-idul-fitri/', 'https://setkab.go.id/selain-tambah-libur-bersama-sehari-pemerintah-juga-tambah-cuti-bersama-2017-dua-hari/'],
        "libur": [('2017-01-01', 'Tahun Baru 2017 Masehi'), ('2017-01-28', 'Tahun Baru Imlek 2568 Kongzili'), ('2017-02-15', 'Hari Pemungutan Suara Pemilihan Kepala Daerah Serentak'), ('2017-03-28', 'Hari Raya Nyepi Tahun Baru Saka 1939'), ('2017-04-14', 'Wafat Isa Al Masih'), ('2017-04-24', 'Isra Mikraj Nabi Muhammad SAW'), ('2017-05-01', 'Hari Buruh Internasional'), ('2017-05-11', 'Hari Raya Waisak 2561'), ('2017-05-25', 'Kenaikan Isa Al Masih'), ('2017-06-01', 'Hari Lahir Pancasila'), ('2017-06-25', 'Hari Raya Idul Fitri 1438 Hijriyah'), ('2017-06-26', 'Hari Raya Idul Fitri 1438 Hijriyah'), ('2017-08-17', 'Hari Kemerdekaan Republik Indonesia'), ('2017-09-01', 'Hari Raya Idul Adha 1438 Hijriyah'), ('2017-09-21', 'Tahun Baru Islam 1439 Hijriyah'), ('2017-12-01', 'Maulid Nabi Muhammad SAW'), ('2017-12-25', 'Hari Raya Natal')],
        "cuti": [('2017-01-02', 'Cuti Bersama Tahun Baru 2017 Masehi'), ('2017-06-23', 'Cuti Bersama Hari Raya Idul Fitri 1438 Hijriyah (Keppres 18/2017, PNS)'), ('2017-06-27', 'Cuti Bersama Hari Raya Idul Fitri 1438 Hijriyah'), ('2017-06-28', 'Cuti Bersama Hari Raya Idul Fitri 1438 Hijriyah'), ('2017-06-29', 'Cuti Bersama Hari Raya Idul Fitri 1438 Hijriyah'), ('2017-06-30', 'Cuti Bersama Hari Raya Idul Fitri 1438 Hijriyah'), ('2017-12-26', 'Cuti Bersama Hari Raya Natal')],
    },
    2018: {
        "instrument": 'SKB Menag No. 707/2017, Menaker No. 256/2017, MenPAN-RB No. 01/SKB/MENPAN-RB/09/2017 tentang Hari Libur Nasional dan Cuti Bersama Tahun 2018',
        "amendments": ['SKB Menag No. 223/2018, Menaker No. 46/2018, MenPAN-RB No. 13/2018 (2018-04-18): cuti Idul Fitri 11-14, 18-20 Jun', 'Keppres 13/2018 (2018-06-04): cuti bersama PNS (same dates)', 'Keppres 15/2018 (2018-06-25): Pilkada serentak 27 Jun 2018 libur nasional'],
        "urls": ['https://jdih.kemnaker.go.id/peraturan/detail/1507', 'https://jdih.kemnaker.go.id/peraturan/detail/1545', 'https://jdih.kemnaker.go.id/peraturan/detail/1554', 'https://setkab.go.id/libur-mulai-11-20-juni-cuti-bersama-lebaran-2018-tambah-3-hari/'],
        "libur": [('2018-01-01', 'Tahun Baru 2018 Masehi'), ('2018-02-16', 'Tahun Baru Imlek 2569 Kongzili'), ('2018-03-17', 'Hari Raya Nyepi Tahun Baru Saka 1940'), ('2018-03-30', 'Wafat Isa Al Masih'), ('2018-04-14', 'Isra Mikraj Nabi Muhammad SAW'), ('2018-05-01', 'Hari Buruh Internasional'), ('2018-05-10', 'Kenaikan Isa Al Masih'), ('2018-05-29', 'Hari Raya Waisak 2562'), ('2018-06-01', 'Hari Lahir Pancasila'), ('2018-06-15', 'Hari Raya Idul Fitri 1439 Hijriyah'), ('2018-06-16', 'Hari Raya Idul Fitri 1439 Hijriyah'), ('2018-06-27', 'Hari Pemungutan Suara Pemilihan Kepala Daerah Serentak'), ('2018-08-17', 'Hari Kemerdekaan Republik Indonesia'), ('2018-08-22', 'Hari Raya Idul Adha 1439 Hijriyah'), ('2018-09-11', 'Tahun Baru Islam 1440 Hijriyah'), ('2018-11-20', 'Maulid Nabi Muhammad SAW'), ('2018-12-25', 'Hari Raya Natal')],
        "cuti": [('2018-06-11', 'Cuti Bersama Hari Raya Idul Fitri 1439 Hijriyah'), ('2018-06-12', 'Cuti Bersama Hari Raya Idul Fitri 1439 Hijriyah'), ('2018-06-13', 'Cuti Bersama Hari Raya Idul Fitri 1439 Hijriyah'), ('2018-06-14', 'Cuti Bersama Hari Raya Idul Fitri 1439 Hijriyah'), ('2018-06-18', 'Cuti Bersama Hari Raya Idul Fitri 1439 Hijriyah'), ('2018-06-19', 'Cuti Bersama Hari Raya Idul Fitri 1439 Hijriyah'), ('2018-06-20', 'Cuti Bersama Hari Raya Idul Fitri 1439 Hijriyah'), ('2018-12-24', 'Cuti Bersama Hari Raya Natal')],
    },
    2019: {
        "instrument": 'SKB Menag No. 617/2018, Menaker No. 262/2018, MenPAN-RB No. 16/2018 tentang Hari Libur Nasional dan Cuti Bersama Tahun 2019 (2018-11-02)',
        "amendments": ['Keppres 10/2019 (2019-04-08): Pemilu 17 Apr 2019 libur nasional', 'Keppres 13/2019 (2019-05-27): cuti bersama PNS (same dates)'],
        "urls": ['https://jdih.kemnaker.go.id/peraturan/detail/1570', 'https://setkab.go.id/ditandatangani-3-menteri-inilah-jadwal-libur-nasional-dan-cuti-bersama-2019/', 'https://setkab.go.id/sukseskan-pemilu-2019-presiden-jokowi-tetapkan-17-april-jadi-hari-libur-nasional/'],
        "libur": [('2019-01-01', 'Tahun Baru 2019 Masehi'), ('2019-02-05', 'Tahun Baru Imlek 2570 Kongzili'), ('2019-03-07', 'Hari Raya Nyepi Tahun Baru Saka 1941'), ('2019-04-03', 'Isra Mikraj Nabi Muhammad SAW'), ('2019-04-17', 'Hari Pemungutan Suara Pemilihan Umum'), ('2019-04-19', 'Wafat Isa Al Masih'), ('2019-05-01', 'Hari Buruh Internasional'), ('2019-05-19', 'Hari Raya Waisak 2563'), ('2019-05-30', 'Kenaikan Isa Al Masih'), ('2019-06-01', 'Hari Lahir Pancasila'), ('2019-06-05', 'Hari Raya Idul Fitri 1440 Hijriyah'), ('2019-06-06', 'Hari Raya Idul Fitri 1440 Hijriyah'), ('2019-08-11', 'Hari Raya Idul Adha 1440 Hijriyah'), ('2019-08-17', 'Hari Kemerdekaan Republik Indonesia'), ('2019-09-01', 'Tahun Baru Islam 1441 Hijriyah'), ('2019-11-09', 'Maulid Nabi Muhammad SAW'), ('2019-12-25', 'Hari Raya Natal')],
        "cuti": [('2019-06-03', 'Cuti Bersama Hari Raya Idul Fitri 1440 Hijriyah'), ('2019-06-04', 'Cuti Bersama Hari Raya Idul Fitri 1440 Hijriyah'), ('2019-06-07', 'Cuti Bersama Hari Raya Idul Fitri 1440 Hijriyah'), ('2019-12-24', 'Cuti Bersama Hari Raya Natal')],
    },
    2020: {
        "instrument": 'SKB Menag No. 728/2019, Menaker No. 213/2019, MenPAN-RB No. 01/2019 tentang Hari Libur Nasional dan Cuti Bersama Tahun 2020',
        "amendments": ['Perubahan I: SKB No. 174/2020, 01/2020, 01/2020 (2020-03-09): cuti +28, 29 May, 21 Aug, 30 Oct', 'Perubahan II: SKB No. 391/2020, 02/2020, 02/2020 (2020-04-09): Idul Fitri cuti 26-29 May moved to 28-31 Dec; +28 Oct', 'Perubahan III: SKB No. 440/2020, 03/2020, 03/2020 (2020-05-20): deletes 22 May', 'Keppres 17/2020 (2020-08-18): cuti bersama ASN', 'Keppres 22/2020 (2020-11-27): Pilkada serentak 9 Dec 2020 libur nasional', 'Perubahan IV: SKB No. 744/2020, 05/2020, 06/2020 (2020-12-01): deletes 28, 29, 30 Dec'],
        "urls": ['https://jdih.kemnaker.go.id/peraturan/detail/1611', 'https://jdih.kemnaker.go.id/peraturan/detail/1647', 'https://jdih.kemnaker.go.id/peraturan/detail/1655', 'https://jdih.kemnaker.go.id/peraturan/detail/1661', 'https://jdih.kemnaker.go.id/peraturan/detail/1702', 'https://jdih.kemnaker.go.id/peraturan/detail/1701', 'https://setkab.go.id/pemerintah-keluarkan-skb-3-menteri-hapus-tiga-hari-cuti-bersama-2020/'],
        "libur": [('2020-01-01', 'Tahun Baru 2020 Masehi'), ('2020-01-25', 'Tahun Baru Imlek 2571 Kongzili'), ('2020-03-22', 'Isra Mikraj Nabi Muhammad SAW'), ('2020-03-25', 'Hari Suci Nyepi Tahun Baru Saka 1942'), ('2020-04-10', 'Wafat Isa Al Masih'), ('2020-05-01', 'Hari Buruh Internasional'), ('2020-05-07', 'Hari Raya Waisak 2564'), ('2020-05-21', 'Kenaikan Isa Al Masih'), ('2020-05-24', 'Hari Raya Idul Fitri 1441 Hijriyah'), ('2020-05-25', 'Hari Raya Idul Fitri 1441 Hijriyah'), ('2020-06-01', 'Hari Lahir Pancasila'), ('2020-07-31', 'Hari Raya Idul Adha 1441 Hijriyah'), ('2020-08-17', 'Hari Kemerdekaan Republik Indonesia'), ('2020-08-20', 'Tahun Baru Islam 1442 Hijriyah'), ('2020-10-29', 'Maulid Nabi Muhammad SAW'), ('2020-12-09', 'Hari Pemungutan Suara Pemilihan Kepala Daerah Serentak'), ('2020-12-25', 'Hari Raya Natal')],
        "cuti": [('2020-08-21', 'Cuti Bersama Tahun Baru Islam 1442 Hijriyah'), ('2020-10-28', 'Cuti Bersama Maulid Nabi Muhammad SAW'), ('2020-10-30', 'Cuti Bersama Maulid Nabi Muhammad SAW'), ('2020-12-24', 'Cuti Bersama Hari Raya Natal'), ('2020-12-31', 'Pengganti Cuti Bersama Hari Raya Idul Fitri 1441 Hijriah')],
    },
    2021: {
        "instrument": 'SKB Menag No. 642/2020, Menaker No. 4/2020, MenPAN-RB No. 4/2020 tentang Hari Libur Nasional dan Cuti Bersama Tahun 2021 (2020-09-10)',
        "amendments": ['Perubahan I: SKB No. 281/2021, 1/2021, 1/2021 (2021-02-22): deletes cuti 12 Mar, 17-19 May, 27 Dec', 'Keppres 7/2021 (2021-04-09): cuti bersama ASN 12 May, 24 Dec', 'Perubahan II: SKB No. 712/2021, 1/2021, 3/2021 (2021-06-18): 1 Muharram 10->11 Aug, Maulid 19->20 Oct, deletes cuti 24 Dec'],
        "urls": ['https://jdih.kemnaker.go.id/peraturan/detail/1682', 'https://jdih.kemnaker.go.id/peraturan/detail/1726', 'https://jdih.kemnaker.go.id/peraturan/detail/1843', 'https://setkab.go.id/inilah-perubahan-hari-libur-nasional-dan-cuti-bersama-tahun-2021/'],
        "libur": [('2021-01-01', 'Tahun Baru 2021 Masehi'), ('2021-02-12', 'Tahun Baru Imlek 2572 Kongzili'), ('2021-03-11', 'Isra Mikraj Nabi Muhammad SAW'), ('2021-03-14', 'Hari Suci Nyepi Tahun Baru Saka 1943'), ('2021-04-02', 'Wafat Isa Al Masih'), ('2021-05-01', 'Hari Buruh Internasional'), ('2021-05-13', 'Hari Raya Idul Fitri 1442 Hijriah'), ('2021-05-13', 'Kenaikan Isa Al Masih'), ('2021-05-14', 'Hari Raya Idul Fitri 1442 Hijriah'), ('2021-05-26', 'Hari Raya Waisak 2565'), ('2021-06-01', 'Hari Lahir Pancasila'), ('2021-07-20', 'Hari Raya Idul Adha 1442 Hijriah'), ('2021-08-11', 'Tahun Baru Islam 1443 Hijriah'), ('2021-08-17', 'Hari Kemerdekaan Republik Indonesia'), ('2021-10-20', 'Maulid Nabi Muhammad SAW'), ('2021-12-25', 'Hari Raya Natal')],
        "cuti": [('2021-05-12', 'Cuti Bersama Hari Raya Idul Fitri 1442 Hijriah')],
    },
    2022: {
        "instrument": 'SKB Menag No. 963/2021, Menaker No. 3/2021, MenPAN-RB No. 4/2021 tentang Hari Libur Nasional dan Cuti Bersama Tahun 2022 (2021-09-22)',
        "amendments": ['Perubahan I: SKB No. 375/2022, 1/2022, 1/2022 (2022-04-07): sets cuti bersama 29 Apr, 4-6 May', 'Keppres 4/2022: cuti bersama ASN (same dates)', 'Perubahan II: SKB No. 678/2022, 2/2022, 2/2022 (2022-07-07): Idul Adha 1443 H 9 Jul -> 10 Jul'],
        "urls": ['https://jdih.kemnaker.go.id/peraturan/detail/1919', 'https://jdih.kemnaker.go.id/peraturan/detail/2171', 'https://jdih.kemnaker.go.id/peraturan/detail/2200', 'https://setkab.go.id/inilah-skb-3-menteri-perubahan-hari-libur-nasional-dan-cuti-bersama-tahun-2022/'],
        "libur": [('2022-01-01', 'Tahun Baru 2022 Masehi'), ('2022-02-01', 'Tahun Baru Imlek 2573 Kongzili'), ('2022-02-28', 'Isra Mikraj Nabi Muhammad SAW'), ('2022-03-03', 'Hari Suci Nyepi Tahun Baru Saka 1944'), ('2022-04-15', 'Wafat Isa Al Masih/Wafat Yesus Kristus'), ('2022-05-01', 'Hari Buruh Internasional'), ('2022-05-02', 'Hari Raya Idul Fitri 1443 Hijriah'), ('2022-05-03', 'Hari Raya Idul Fitri 1443 Hijriah'), ('2022-05-16', 'Hari Raya Waisak 2566 BE'), ('2022-05-26', 'Kenaikan Isa Al Masih/Kenaikan Yesus Kristus'), ('2022-06-01', 'Hari Lahir Pancasila'), ('2022-07-10', 'Hari Raya Idul Adha 1443 Hijriah'), ('2022-07-30', 'Tahun Baru Islam 1444 Hijriah'), ('2022-08-17', 'Hari Kemerdekaan Republik Indonesia'), ('2022-10-08', 'Maulid Nabi Muhammad SAW'), ('2022-12-25', 'Hari Raya Natal')],
        "cuti": [('2022-04-29', 'Cuti Bersama Hari Raya Idul Fitri 1443 Hijriah'), ('2022-05-04', 'Cuti Bersama Hari Raya Idul Fitri 1443 Hijriah'), ('2022-05-05', 'Cuti Bersama Hari Raya Idul Fitri 1443 Hijriah'), ('2022-05-06', 'Cuti Bersama Hari Raya Idul Fitri 1443 Hijriah')],
    },
    2023: {
        "instrument": 'SKB Menag No. 1066/2022, Menaker No. 3/2022, MenPAN-RB No. 3/2022 tentang Hari Libur Nasional dan Cuti Bersama Tahun 2023 (2022-10-11)',
        "amendments": ['Perubahan I: SKB No. 327/2023, 1/2023, 1/2023 (2023-03-29): Idul Fitri cuti 21, 24-26 Apr -> 19-21, 24-25 Apr', 'Perubahan II: SKB No. 624/2023, 2/2023, 2/2023 (2023-06-16): + cuti Iduladha 28 and 30 Jun', 'Keppres 24/2022, Keppres 8/2023 and a June 2023 Keppres: cuti bersama ASN'],
        "urls": ['https://jdih.kemnaker.go.id/peraturan/detail/2242', 'https://jdih.kemnaker.go.id/peraturan/detail/2300', 'https://jdih.kemnaker.go.id/peraturan/detail/2329', 'https://setkab.go.id/pemerintah-terbitkan-skb-perubahan-libur-nasional-dan-cuti-bersama-2023-2/'],
        "libur": [('2023-01-01', 'Tahun Baru 2023 Masehi'), ('2023-01-22', 'Tahun Baru Imlek 2574 Kongzili'), ('2023-02-18', 'Isra Mikraj Nabi Muhammad saw.'), ('2023-03-22', 'Hari Suci Nyepi Tahun Baru Saka 1945'), ('2023-04-07', 'Wafat Isa Almasih'), ('2023-04-22', 'Hari Raya Idulfitri 1444 Hijriah'), ('2023-04-23', 'Hari Raya Idulfitri 1444 Hijriah'), ('2023-05-01', 'Hari Buruh Internasional'), ('2023-05-18', 'Kenaikan Isa Almasih'), ('2023-06-01', 'Hari Lahir Pancasila'), ('2023-06-04', 'Hari Raya Waisak 2567 BE'), ('2023-06-29', 'Hari Raya Iduladha 1444 Hijriah'), ('2023-07-19', 'Tahun Baru Islam 1445 Hijriah'), ('2023-08-17', 'Hari Kemerdekaan RI'), ('2023-09-28', 'Maulid Nabi Muhammad saw.'), ('2023-12-25', 'Hari Raya Natal')],
        "cuti": [('2023-01-23', 'Cuti Bersama Tahun Baru Imlek 2574 Kongzili'), ('2023-03-23', 'Cuti Bersama Hari Suci Nyepi Tahun Baru Saka 1945'), ('2023-04-19', 'Cuti Bersama Hari Raya Idulfitri 1444 Hijriah'), ('2023-04-20', 'Cuti Bersama Hari Raya Idulfitri 1444 Hijriah'), ('2023-04-21', 'Cuti Bersama Hari Raya Idulfitri 1444 Hijriah'), ('2023-04-24', 'Cuti Bersama Hari Raya Idulfitri 1444 Hijriah'), ('2023-04-25', 'Cuti Bersama Hari Raya Idulfitri 1444 Hijriah'), ('2023-06-02', 'Cuti Bersama Hari Raya Waisak 2567 BE'), ('2023-06-28', 'Cuti Bersama Hari Raya Iduladha 1444 Hijriah'), ('2023-06-30', 'Cuti Bersama Hari Raya Iduladha 1444 Hijriah'), ('2023-12-26', 'Cuti Bersama Hari Raya Natal')],
    },
    2024: {
        "instrument": 'SKB Menag No. 855/2023, Menaker No. 3/2023, MenPAN-RB No. 4/2023 tentang Hari Libur Nasional dan Cuti Bersama Tahun 2024 (2023-09-12)',
        "amendments": ['Keppres 8/2024 tentang Hari-Hari Libur (2024-01-29): consolidates holiday Keppres (revokes Keppres 251/1967, 148/1968, 10/1971, 3/1983); Kebangkitan Yesus Kristus (Paskah) formally a holiday; Isa Almasih -> Yesus Kristus', 'Keppres 7/2024: cuti bersama ASN 2024', 'Keppres 10/2024 (2024-02-06): Pemilu 14 Feb 2024 libur nasional', 'SKB Menag No. 236/2024, Menaker No. 1/2024, MenPAN-RB No. 2/2024 (2024-02-26): nomenclature change only', 'Keppres 33/2024: Pilkada serentak 27 Nov 2024 libur nasional'],
        "urls": ['https://jdih.kemnaker.go.id/peraturan/detail/2365', 'https://jdih.kemnaker.go.id/peraturan/detail/2460', 'https://jdih.kemnaker.go.id/peraturan/detail/2453', 'https://jdih.kemnaker.go.id/peraturan/detail/2457', 'https://jdih.kemnaker.go.id/peraturan/detail/2596', 'https://setkab.go.id/inilah-skb-3-menteri-libur-nasional-dan-cuti-bersama-2024/', 'https://setkab.go.id/inilah-isi-keppres-nomor-8-tahun-2024-tentang-hari-hari-libur/'],
        "libur": [('2024-01-01', 'Tahun Baru 2024 Masehi'), ('2024-02-08', 'Isra Mikraj Nabi Muhammad S.A.W.'), ('2024-02-10', 'Tahun Baru Imlek 2575 Kongzili'), ('2024-02-14', 'Hari Pemungutan Suara Pemilihan Umum Tahun 2024'), ('2024-03-11', 'Hari Suci Nyepi (Tahun Baru Saka 1946)'), ('2024-03-29', 'Wafat Yesus Kristus'), ('2024-03-31', 'Kebangkitan Yesus Kristus (Paskah)'), ('2024-04-10', 'Hari Raya Idul Fitri 1445 Hijriah'), ('2024-04-11', 'Hari Raya Idul Fitri 1445 Hijriah'), ('2024-05-01', 'Hari Buruh Internasional'), ('2024-05-09', 'Kenaikan Yesus Kristus'), ('2024-05-23', 'Hari Raya Waisak 2568 BE'), ('2024-06-01', 'Hari Lahir Pancasila'), ('2024-06-17', 'Hari Raya Idul Adha 1445 Hijriah'), ('2024-07-07', '1 Muharam Tahun Baru Islam 1446 Hijriah'), ('2024-08-17', 'Proklamasi Kemerdekaan'), ('2024-09-16', 'Maulid Nabi Muhammad S.A.W.'), ('2024-11-27', 'Hari Pemungutan Suara Pemilihan Gubernur, Bupati, dan Wali Kota Serentak'), ('2024-12-25', 'Kelahiran Yesus Kristus')],
        "cuti": [('2024-02-09', 'Cuti Bersama Tahun Baru Imlek 2575 Kongzili'), ('2024-03-12', 'Cuti Bersama Hari Suci Nyepi (Tahun Baru Saka 1946)'), ('2024-04-08', 'Cuti Bersama Hari Raya Idul Fitri 1445 Hijriah'), ('2024-04-09', 'Cuti Bersama Hari Raya Idul Fitri 1445 Hijriah'), ('2024-04-12', 'Cuti Bersama Hari Raya Idul Fitri 1445 Hijriah'), ('2024-04-15', 'Cuti Bersama Hari Raya Idul Fitri 1445 Hijriah'), ('2024-05-10', 'Cuti Bersama Kenaikan Yesus Kristus'), ('2024-05-24', 'Cuti Bersama Hari Raya Waisak 2568 BE'), ('2024-06-18', 'Cuti Bersama Hari Raya Idul Adha 1445 Hijriah'), ('2024-12-26', 'Cuti Bersama Kelahiran Yesus Kristus')],
    },
    2025: {
        "instrument": 'SKB Menag No. 1017/2024, Menaker No. 2/2024, MenPAN-RB No. 2/2024 tentang Hari Libur Nasional dan Cuti Bersama Tahun 2025 (2024-10-14)',
        "amendments": ['Keppres 2/2025: cuti bersama ASN 2025', 'SKB Menag No. 933/2025, Menaker No. 1/2025, MenPAN-RB No. 3/2025 (2025-08-07): adds cuti bersama 18 Aug 2025 (HUT ke-80 RI)'],
        "urls": ['https://jdih.kemnaker.go.id/peraturan/detail/2569', 'https://jdih.kemnaker.go.id/peraturan/detail/2712', 'https://setkab.go.id/pemerintah-tetapkan-hari-libur-nasional-dan-cuti-bersama-tahun-2025/'],
        "libur": [('2025-01-01', 'Tahun Baru 2025 Masehi'), ('2025-01-27', 'Isra Mikraj Nabi Muhammad S.A.W.'), ('2025-01-29', 'Tahun Baru Imlek 2576 Kongzili'), ('2025-03-29', 'Hari Suci Nyepi (Tahun Baru Saka 1947)'), ('2025-03-31', 'Idul Fitri 1446 Hijriah'), ('2025-04-01', 'Idul Fitri 1446 Hijriah'), ('2025-04-18', 'Wafat Yesus Kristus'), ('2025-04-20', 'Kebangkitan Yesus Kristus (Paskah)'), ('2025-05-01', 'Hari Buruh Internasional'), ('2025-05-12', 'Hari Raya Waisak 2569 BE'), ('2025-05-29', 'Kenaikan Yesus Kristus'), ('2025-06-01', 'Hari Lahir Pancasila'), ('2025-06-06', 'Idul Adha 1446 Hijriah'), ('2025-06-27', '1 Muharam Tahun Baru Islam 1447 Hijriah'), ('2025-08-17', 'Proklamasi Kemerdekaan'), ('2025-09-05', 'Maulid Nabi Muhammad S.A.W.'), ('2025-12-25', 'Kelahiran Yesus Kristus')],
        "cuti": [('2025-01-28', 'Cuti Bersama Tahun Baru Imlek 2576 Kongzili'), ('2025-03-28', 'Cuti Bersama Hari Suci Nyepi (Tahun Baru Saka 1947)'), ('2025-04-02', 'Cuti Bersama Idul Fitri 1446 Hijriah'), ('2025-04-03', 'Cuti Bersama Idul Fitri 1446 Hijriah'), ('2025-04-04', 'Cuti Bersama Idul Fitri 1446 Hijriah'), ('2025-04-07', 'Cuti Bersama Idul Fitri 1446 Hijriah'), ('2025-05-13', 'Cuti Bersama Hari Raya Waisak 2569 BE'), ('2025-05-30', 'Cuti Bersama Kenaikan Yesus Kristus'), ('2025-06-09', 'Cuti Bersama Idul Adha 1446 Hijriah'), ('2025-08-18', 'Cuti Bersama Proklamasi Kemerdekaan'), ('2025-12-26', 'Cuti Bersama Kelahiran Yesus Kristus')],
    },
    2026: {
        "instrument": 'SKB Menag No. 1497/2025, Menaker No. 2/2025, MenPAN-RB No. 5/2025 tentang Hari Libur Nasional dan Cuti Bersama Tahun 2026 (2025-09-19)',
        "amendments": ['Keppres 42/2025: cuti bersama ASN 2026'],
        "urls": ['https://www.kemenkopmk.go.id/pemerintah-tetapkan-17-hari-libur-nasional-dan-8-hari-cuti-bersama-tahun-2026', 'https://jdih.kemnaker.go.id/peraturan/detail/2723'],
        "libur": [('2026-01-01', 'Tahun Baru 2026 Masehi'), ('2026-01-16', 'Isra Mikraj Nabi Muhammad SAW'), ('2026-02-17', 'Tahun Baru Imlek 2577 Kongzili'), ('2026-03-19', 'Hari Suci Nyepi (Tahun Baru Saka 1948)'), ('2026-03-21', 'Hari Raya Idul Fitri 1447 H'), ('2026-03-22', 'Hari Raya Idul Fitri 1447 H'), ('2026-04-03', 'Wafat Yesus Kristus'), ('2026-04-05', 'Hari Kebangkitan Yesus Kristus (Paskah)'), ('2026-05-01', 'Hari Buruh Internasional'), ('2026-05-14', 'Kenaikan Yesus Kristus'), ('2026-05-27', 'Hari Raya Idul Adha 1447 H'), ('2026-05-31', 'Hari Raya Waisak 2570 BE'), ('2026-06-01', 'Hari Lahir Pancasila'), ('2026-06-16', '1 Muharam 1448 H (Tahun Baru Islam)'), ('2026-08-17', 'Hari Proklamasi Kemerdekaan'), ('2026-08-25', 'Maulid Nabi Muhammad SAW'), ('2026-12-25', 'Kelahiran Yesus Kristus')],
        "cuti": [('2026-02-16', 'Cuti Bersama Tahun Baru Imlek 2577 Kongzili'), ('2026-03-18', 'Cuti Bersama Hari Suci Nyepi (Tahun Baru Saka 1948)'), ('2026-03-20', 'Cuti Bersama Hari Raya Idul Fitri 1447 H'), ('2026-03-23', 'Cuti Bersama Hari Raya Idul Fitri 1447 H'), ('2026-03-24', 'Cuti Bersama Hari Raya Idul Fitri 1447 H'), ('2026-05-15', 'Cuti Bersama Kenaikan Yesus Kristus'), ('2026-05-28', 'Cuti Bersama Idul Adha 1447 H'), ('2026-12-24', 'Cuti Bersama Kelahiran Yesus Kristus')],
    },
    2027: {
        "instrument": 'SKB Menag No. 1205/2026, Menaker No. 3/2026, MenPAN-RB No. 2/2026 tentang Hari Libur Nasional dan Cuti Bersama Tahun 2027 (2026-09-15)',
        "urls": ['https://www.kemenkopmk.go.id/index.php/node/6444', 'https://setneg.go.id/baca/index/inilah_skb_3_menteri_libur_nasional_dan_cuti_bersama_2027', 'https://jdih.kemnaker.go.id/peraturan/detail/3089'],
        "libur": [('2027-01-01', 'Tahun Baru 2027 Masehi'), ('2027-01-05', 'Isra Mikraj Nabi Muhammad saw.'), ('2027-02-06', 'Tahun Baru Imlek 2578 Kongzili'), ('2027-03-08', 'Hari Suci Nyepi (Tahun Baru Saka 1949)'), ('2027-03-10', 'Idulfitri 1448 Hijriah'), ('2027-03-11', 'Idulfitri 1448 Hijriah'), ('2027-03-26', 'Wafat Yesus Kristus'), ('2027-03-28', 'Hari Kebangkitan Yesus Kristus (Paskah)'), ('2027-05-01', 'Hari Buruh Internasional'), ('2027-05-06', 'Kenaikan Yesus Kristus'), ('2027-05-17', 'Iduladha 1448 Hijriah'), ('2027-05-20', 'Hari Raya Waisak 2571 BE'), ('2027-06-01', 'Hari Lahir Pancasila'), ('2027-06-06', '1 Muharam Tahun Baru Islam 1449 Hijriah'), ('2027-08-15', 'Maulid Nabi Muhammad SAW'), ('2027-08-17', 'Proklamasi Kemerdekaan'), ('2027-12-25', 'Kelahiran Yesus Kristus (Natal)'), ('2027-12-26', 'Isra Mikraj Nabi Muhammad saw.')],
        "cuti": [('2027-02-05', 'Cuti Bersama Tahun Baru Imlek 2578 Kongzili'), ('2027-03-09', 'Cuti Bersama Hari Raya Idulfitri 1448 Hijriah'), ('2027-03-12', 'Cuti Bersama Hari Raya Idulfitri 1448 Hijriah'), ('2027-03-15', 'Cuti Bersama Hari Raya Idulfitri 1448 Hijriah'), ('2027-03-25', 'Cuti Bersama Wafat Yesus Kristus'), ('2027-05-18', 'Cuti Bersama Iduladha 1448 H'), ('2027-05-19', 'Cuti Bersama Waisak 2571 BE'), ('2027-12-24', 'Cuti Bersama Kelahiran Yesus Kristus (Natal)')],
    },
}


def id_estimated(year: int) -> list[tuple[date, str]]:
    """The starter's days for a year no SKB covers."""
    easter = easter_western(year)
    out = [(date(year, 1, 1), "Tahun Baru Masehi"), (date(year, 5, 1), "Hari Buruh Internasional"),
           (date(year, 6, 1), "Hari Lahir Pancasila"), (date(year, 8, 17), "Hari Kemerdekaan RI"),
           (date(year, 12, 25), "Hari Raya Natal"), (easter - timedelta(days=2), "Wafat Isa Almasih"),
           (easter, "Kebangkitan Isa Almasih"), (easter + timedelta(days=39), "Kenaikan Isa Almasih"),
           (hk_lunar(year, 1, 1), "Tahun Baru Imlek (perkiraan)"),
           (hk_lunar(year, 4, 15), "Hari Raya Waisak (perkiraan)")]
    starts = [hk_lunar(year, 2, 1), hk_lunar(year, 3, 1)]
    nyepi = next((d for d in starts if date(year, 3, 2) <= d <= date(year, 4, 15)), None)
    if nyepi:
        out.append((nyepi + timedelta(days=1), "Hari Suci Nyepi (perkiraan)"))
    for m, d, name, extra in ((7, 27, "Isra Mikraj Nabi Muhammad", 0), (10, 1, "Idul Fitri", 0),
                              (10, 1, "Idul Fitri", 1), (12, 10, "Idul Adha", 0), (1, 1, "Tahun Baru Islam", 0),
                              (3, 12, "Maulid Nabi Muhammad", 0)):
        for x in islamic_dates_in_year(year, m, d):
            x += timedelta(days=extra)
            if x.year == year:
                out.append((x, f"{name} (perkiraan)"))
    return out


def id_holidays(year: int) -> list[tuple[date, str]]:
    if year in ID_SKB:
        return [(date.fromisoformat(d), n) for d, n in ID_SKB[year]["libur"]]
    return id_estimated(year)


def id_cuti(year: int) -> list[tuple[date, str]]:
    return [(date.fromisoformat(d), n) for d, n in ID_SKB.get(year, {}).get("cuti", [])]


# --- Malaysia -------------------------------------------------------------
#
# Hari kelepasan am persekutuan: the First Schedule of the Holidays Act 1951
# (Act 369; Peninsular Malaysia and the Federal Territories) as amended, the
# yearly "Jadual Hari Kelepasan Am Persekutuan" of the Prime Minister's
# Department (BKPP, kabinet.gov.my; from 2019 the Warta Kerajaan table) with
# its amendments, and the s. 8 notifications (P.U.(B)) of additional days. The
# replacement days are not printed in the lists: they follow from s. 3 (a
# holiday on the weekly holiday, Sunday in the Saturday/Sunday states, gives
# the next day, or the day after that when the next day is itself a holiday).
# State days (1 January, Thaipusam, Nuzul Al-Quran, Hari Wilayah, ...) and the
# Friday-weekend states' replacements are out of scope. 2000-2007: no primary
# list was found, so the gold starts in 2008. 2028-2040 are provisional.

MY_NOTE = (
    "Federal public holidays (Holidays Act 1951 First Schedule; the JPM Jadual Hari Kelepasan Am "
    "Persekutuan of each year 2008-2027 with its amendments, and the s. 8 additional days), with the "
    "s. 3 replacement for a holiday on a Sunday. State and Federal Territory days are not in it. "
    "2028-2040 are provisional: fixed days and estimates (tabular Islamic dates; lunar 1/1 and 4/15 "
    "from the HKO tables; Deepavali the day before the first new moon, IST, after 17 October; the "
    "Agong's birthday the first Monday of June)."
)

MY_SOURCES = [
    ("Holidays Act 1951 (Act 369), ss. 1(2), 2, 3, 8, 9 and First Schedule (Akta Hari Kelepasan 1951)",
     "https://web.archive.org/web/2024id_/http://www.kabinet.gov.my/bkpp/pdf/akta_warta/1951_12_31_act369.pdf",
     "s. 3: a public holiday that falls on a weekly holiday (Sunday, or Friday where Friday is the weekly "
     "holiday): the day following is a public holiday, and if that day is already one, the day after. "
     "First Schedule: Maulidur Rasul, National Day, Chinese New Year (2 days; 1 in Kelantan and "
     "Terengganu), Wesak, the Agong's birthday, Hari Raya Puasa (2 days), Hari Raya Haji (1 day; 2 in "
     "Kelantan and Terengganu), Deepavali, Christmas; Labour Day (P.U.(B) 414/1972), Awal Muharam "
     "(P.U.(B) 363/2005), Malaysia Day (P.U.(B) 491/2009, from 2010)."),
    ("JPM / BKPP Jadual Hari Kelepasan Am Persekutuan 2008-2027 (kabinet.gov.my; Wayback copies)",
     "https://www.kabinet.gov.my/storage/2026/08/HKA_2027.pdf",
     "The federal table of each year; every date below is the table's, with its gazetted amendments "
     "(Deepavali 2014: Warta No. 43367; Awal Muharam 2017: Warta No. 1779; the Agong's birthday 2020: "
     "Warta No. 6489; Hari Raya Puasa 2022: PMO statement of 1 May 2022). Deepavali is not a Sarawak "
     "holiday and CNY day 2 not a Kelantan / Terengganu one; both are federal days."),
    ("Warta Kerajaan Persekutuan: Jadual Hari Kelepasan Am Persekutuan 2019-2025",
     "https://web.archive.org/web/2024id_/http://www.kabinet.gov.my/bkpp/pdf/akta_warta/20230810_HARI_KELEPASAN_2024.pdf",
     "Pemberitahuan No. 17295 (2019), 12985 (2020), 16872 (2023), 19239 (2024), 17852 (2025); the 2021 and "
     "2022 tables of 9 July 2020 and 24 June 2021."),
    ("Holidays Act 1951 s. 8 notifications: additional public holidays",
     "https://web.archive.org/web/2022id_/http://www.kabinet.gov.my/bkpp/pdf/akta_warta/20221114_PUB556.pdf",
     "P.U.(B) 70/2012 (11 April 2012), 176/2017 (24 April 2017), 325/2019 (30 July 2019), 556/2022 "
     "(18-19 November 2022), 579/2022 (28 November 2022), 154/2023 (21 April 2023), 305/2025 "
     "(15 September 2025); 9 May 2018 (PMO statement of 11 April 2018); 4 September 2017 and 10-11 May "
     "2018 as announced (no P.U.(B) copy was archived)."),
    ("PMO statement, 1 May 2022: the s. 3 replacement days",
     "https://web.archive.org/web/20220515191737id_/https://www.pmo.gov.my/wp-content/uploads/2022/05/152022-KENYATAAN-MEDIA-PERUBAHAN-CUTI-UMUM.pdf",
     "Hari Raya Aidilfitri on Monday 2 May 2022; Labour Day (Sunday 1 May) replaced on Wednesday 4 May "
     "under s. 3, except in Kedah, Kelantan, Terengganu and Johor."),
    ("JPM, 31 July 2024: no replacement day for Malaysia Day and Maulidur Rasul on 16 September 2024",
     "https://www.thestar.com.my/news/nation/2024/08/02/no-automatic-replacement-holiday-on-sept-17",
     "Two holidays on one weekday give no extra day: s. 3 covers only a holiday on the weekly holiday."),
]

MY_LISTS = {
    2008: {
        "sources": [
            ('JPM BKPP Jadual Hari Kelepasan Am Persekutuan dan Negeri 2008',
             'https://web.archive.org/web/20100816063534id_/http://www.kabinet.gov.my/pdf/persekutuan_negeri2008.pdf'),
        ],
        "days": [('2008-01-10', 'Awal Muharam (Maal Hijrah) 1429H'), ('2008-02-07', 'Tahun Baru Cina'), ('2008-02-08', 'Tahun Baru Cina (Hari Kedua)'), ('2008-03-20', 'Hari Keputeraan Nabi Muhammad S.A.W. (Maulidur Rasul)'), ('2008-05-01', 'Hari Pekerja'), ('2008-05-19', 'Hari Wesak'), ('2008-06-07', 'Hari Keputeraan Seri Paduka Baginda Yang di-Pertuan Agong'), ('2008-08-31', 'Hari Kebangsaan'), ('2008-10-01', 'Hari Raya Puasa'), ('2008-10-02', 'Hari Raya Puasa (Hari Kedua)'), ('2008-10-27', 'Hari Deepavali'), ('2008-12-08', 'Hari Raya Qurban (Haji)'), ('2008-12-25', 'Hari Krismas'), ('2008-12-29', 'Awal Muharam (Maal Hijrah) 1430H')],
    },
    2009: {
        "sources": [
            ('JPM BKPP Jadual Hari Kelepasan Am Persekutuan dan Negeri 2009',
             'https://web.archive.org/web/20100816063617id_/http://www.kabinet.gov.my/pdf/persekutuan_negeri2009.pdf'),
            ('JPM BKPP Jadual Hari Kelepasan Am Persekutuan 2009',
             'https://web.archive.org/web/20100816063459id_/http://www.kabinet.gov.my/pdf/persekutuan2009.pdf'),
        ],
        "days": [('2009-01-26', 'Tahun Baru Cina'), ('2009-01-27', 'Tahun Baru Cina (Hari Kedua)'), ('2009-03-09', 'Hari Keputeraan Nabi Muhammad S.A.W. (Maulidur Rasul)'), ('2009-05-01', 'Hari Pekerja'), ('2009-05-09', 'Hari Wesak'), ('2009-06-06', 'Hari Keputeraan Seri Paduka Baginda Yang di-Pertuan Agong'), ('2009-08-31', 'Hari Kebangsaan'), ('2009-09-20', 'Hari Raya Puasa'), ('2009-09-21', 'Hari Raya Puasa (Hari Kedua)'), ('2009-10-17', 'Hari Deepavali'), ('2009-11-27', 'Hari Raya Qurban (Haji)'), ('2009-12-18', 'Awal Muharam (Maal Hijrah)'), ('2009-12-25', 'Hari Krismas')],
    },
    2010: {
        "sources": [
            ('JPM BKPP Jadual Hari Kelepasan Am Persekutuan dan Negeri 2010',
             'https://web.archive.org/web/20091007191322id_/http://www.kabinet.gov.my/pdf/persekutuan_negeri2010.pdf'),
            ('P.U.(B) 491/2009 & 492/2009 - Hari Malaysia from 2010 (Peninsular+Putrajaya; Labuan), Notification under s.8, 9 Nov 2009',
             'https://web.archive.org/web/20100923033846id_/http://www.kabinet.gov.my/pdf/P.U.(B)HariMalaysiabagiSem.MalaysiadanWPLabuan.pdf'),
        ],
        "days": [('2010-02-14', 'Tahun Baru Cina'), ('2010-02-15', 'Tahun Baru Cina (Hari Kedua)'), ('2010-02-26', 'Hari Keputeraan Nabi Muhammad S.A.W. (Maulidur Rasul)'), ('2010-05-01', 'Hari Pekerja'), ('2010-05-28', 'Hari Wesak'), ('2010-06-05', 'Hari Keputeraan Seri Paduka Baginda Yang di-Pertuan Agong'), ('2010-08-31', 'Hari Kebangsaan'), ('2010-09-10', 'Hari Raya Puasa'), ('2010-09-11', 'Hari Raya Puasa (Hari Kedua)'), ('2010-09-16', 'Hari Malaysia'), ('2010-11-05', 'Hari Deepavali'), ('2010-11-17', 'Hari Raya Qurban (Haji)'), ('2010-12-07', 'Awal Muharam (Maal Hijrah)'), ('2010-12-25', 'Hari Krismas')],
    },
    2011: {
        "sources": [
            ('JPM BKPP Jadual HKA Persekutuan & Negeri 2011',
             'https://web.archive.org/web/20101121153518id_/http://www.kabinet.gov.my/pdf/2011_merged.pdf'),
        ],
        "days": [('2011-02-03', 'Tahun Baru Cina'), ('2011-02-04', 'Tahun Baru Cina (Hari Kedua)'), ('2011-02-15', 'Hari Keputeraan Nabi Muhammad S.A.W. (Maulidur Rasul)'), ('2011-05-01', 'Hari Pekerja'), ('2011-05-17', 'Hari Wesak'), ('2011-06-04', 'Hari Keputeraan Seri Paduka Baginda Yang di-Pertuan Agong'), ('2011-08-30', 'Hari Raya Puasa'), ('2011-08-31', 'Hari Kebangsaan'), ('2011-08-31', 'Hari Raya Puasa (Hari Kedua)'), ('2011-09-16', 'Hari Malaysia'), ('2011-10-26', 'Hari Deepavali'), ('2011-11-06', 'Hari Raya Qurban (Haji)'), ('2011-11-27', 'Awal Muharam (Maal Hijrah)'), ('2011-12-25', 'Hari Krismas')],
    },
    2012: {
        "sources": [
            ('JPM BKPP Jadual HKA Persekutuan & Negeri 2012',
             'https://web.archive.org/web/20130329200907id_/http://www.kabinet.gov.my/images/stories/kelepasanam/2012_merged.pdf'),
            ('kabinet.gov.my Hari Kelepasan Am page (cites P.U.(B) 70/2012 & 71/2012: HKA sempena Istiadat Pertabalan YDPA XIV; PDF not archived)',
             'https://web.archive.org/web/20121103220225id_/http://www.kabinet.gov.my/index.php/en/hari-kelepasan-am.html'),
        ],
        "days": [('2012-01-23', 'Tahun Baru Cina'), ('2012-01-24', 'Tahun Baru Cina (Hari Kedua)'), ('2012-02-05', 'Hari Keputeraan Nabi Muhammad S.A.W. (Maulidur Rasul)'), ('2012-04-11', 'Hari Pertabalan YDP Agong XIV (Istiadat Pertabalan)'), ('2012-05-01', 'Hari Pekerja'), ('2012-05-05', 'Hari Wesak'), ('2012-06-02', 'Hari Keputeraan Seri Paduka Baginda Yang di-Pertuan Agong'), ('2012-08-19', 'Hari Raya Puasa'), ('2012-08-20', 'Hari Raya Puasa (Hari Kedua)'), ('2012-08-31', 'Hari Kebangsaan'), ('2012-09-16', 'Hari Malaysia'), ('2012-10-26', 'Hari Raya Qurban (Haji)'), ('2012-11-13', 'Hari Deepavali'), ('2012-11-15', 'Awal Muharam (Maal Hijrah)'), ('2012-12-25', 'Hari Krismas')],
    },
    2013: {
        "sources": [
            ('JPM BKPP Jadual HKA Persekutuan & Negeri 2013',
             'https://web.archive.org/web/20130330035635id_/http://www.kabinet.gov.my/images/stories/kelepasanam/2013_merged.pdf'),
        ],
        "days": [('2013-01-24', 'Hari Keputeraan Nabi Muhammad S.A.W. (Maulidur Rasul)'), ('2013-02-10', 'Tahun Baru Cina'), ('2013-02-11', 'Tahun Baru Cina (Hari Kedua)'), ('2013-05-01', 'Hari Pekerja'), ('2013-05-24', 'Hari Wesak'), ('2013-06-01', 'Hari Keputeraan Seri Paduka Baginda Yang di-Pertuan Agong'), ('2013-08-08', 'Hari Raya Puasa'), ('2013-08-09', 'Hari Raya Puasa (Hari Kedua)'), ('2013-08-31', 'Hari Kebangsaan'), ('2013-09-16', 'Hari Malaysia'), ('2013-10-15', 'Hari Raya Qurban (Haji)'), ('2013-11-02', 'Hari Deepavali'), ('2013-11-05', 'Awal Muharam (Maal Hijrah)'), ('2013-12-25', 'Hari Krismas')],
    },
    2014: {
        "sources": [
            ('JPM BKPP Jadual HKA Persekutuan & Negeri 2014',
             'https://web.archive.org/web/20131008061109id_/http://www.kabinet.gov.my/images/stories/kelepasanam/2014_merged.pdf'),
            ('kabinet.gov.my HKA page: Deepavali 2014 amended to 22 Oct 2014 by Warta No. 43367 (6 Dec 2013); Maulidur Rasul 2015 twice (3 Jan & 24 Dec)',
             'https://web.archive.org/web/20140924012327id_/http://www.kabinet.gov.my/index.php/hari-kelepasan-am'),
            ('Warta Kerajaan Persekutuan Pemberitahuan No. 43367 (6 Dec 2013) - Deepavali 2014 amendment',
             'https://web.archive.org/web/20140109095519id_/http://www.kabinet.gov.my/images/stories/kelepasanam/warta_no43367.pdf'),
        ],
        "days": [('2014-01-14', 'Hari Keputeraan Nabi Muhammad S.A.W. (Maulidur Rasul)'), ('2014-01-31', 'Tahun Baru Cina'), ('2014-02-01', 'Tahun Baru Cina (Hari Kedua)'), ('2014-05-01', 'Hari Pekerja'), ('2014-05-13', 'Hari Wesak'), ('2014-06-07', 'Hari Keputeraan Seri Paduka Baginda Yang di-Pertuan Agong'), ('2014-07-28', 'Hari Raya Puasa'), ('2014-07-29', 'Hari Raya Puasa (Hari Kedua)'), ('2014-08-31', 'Hari Kebangsaan'), ('2014-09-16', 'Hari Malaysia'), ('2014-10-05', 'Hari Raya Qurban (Haji)'), ('2014-10-22', 'Hari Deepavali'), ('2014-10-25', 'Awal Muharam (Maal Hijrah)'), ('2014-12-25', 'Hari Krismas')],
    },
    2015: {
        "sources": [
            ('JPM BKPP Jadual HKA Persekutuan & Negeri 2015',
             'https://web.archive.org/web/20150203230515id_/http://www.kabinet.gov.my/images/stories/kelepasanam/2015_merged.pdf'),
            ('kabinet.gov.my HKA page: Deepavali 2014 amended to 22 Oct 2014 by Warta No. 43367 (6 Dec 2013); Maulidur Rasul 2015 twice (3 Jan & 24 Dec)',
             'https://web.archive.org/web/20140924012327id_/http://www.kabinet.gov.my/index.php/hari-kelepasan-am'),
        ],
        "days": [('2015-01-03', 'Hari Keputeraan Nabi Muhammad S.A.W. (Maulidur Rasul)'), ('2015-02-19', 'Tahun Baru Cina'), ('2015-02-20', 'Tahun Baru Cina (Hari Kedua)'), ('2015-05-01', 'Hari Pekerja'), ('2015-05-03', 'Hari Wesak'), ('2015-06-06', 'Hari Keputeraan Seri Paduka Baginda Yang di-Pertuan Agong'), ('2015-07-17', 'Hari Raya Puasa'), ('2015-07-18', 'Hari Raya Puasa (Hari Kedua)'), ('2015-08-31', 'Hari Kebangsaan'), ('2015-09-16', 'Hari Malaysia'), ('2015-09-24', 'Hari Raya Qurban (Haji)'), ('2015-10-14', 'Awal Muharam (Maal Hijrah)'), ('2015-11-10', 'Hari Deepavali'), ('2015-12-24', 'Hari Keputeraan Nabi Muhammad S.A.W. (Maulidur Rasul)'), ('2015-12-25', 'Hari Krismas')],
    },
    2016: {
        "sources": [
            ('JPM BKPP Jadual HKA 2016 (hka2016.pdf)',
             'https://web.archive.org/web/20150906063502id_/http://www.kabinet.gov.my/v2/pdf/hari_kelepasan_am/hka2016.pdf'),
        ],
        "days": [('2016-02-08', 'Tahun Baru Cina'), ('2016-02-09', 'Tahun Baru Cina (Hari Kedua)'), ('2016-05-01', 'Hari Pekerja'), ('2016-05-21', 'Hari Wesak'), ('2016-06-04', 'Hari Keputeraan Seri Paduka Baginda Yang di-Pertuan Agong'), ('2016-07-06', 'Hari Raya Puasa'), ('2016-07-07', 'Hari Raya Puasa (Hari Kedua)'), ('2016-08-31', 'Hari Kebangsaan'), ('2016-09-12', 'Hari Raya Qurban (Haji)'), ('2016-09-16', 'Hari Malaysia'), ('2016-10-02', 'Awal Muharam (Maal Hijrah)'), ('2016-10-29', 'Hari Deepavali'), ('2016-12-12', 'Hari Keputeraan Nabi Muhammad S.A.W. (Maulidur Rasul)'), ('2016-12-25', 'Hari Krismas')],
    },
    2017: {
        "sources": [
            ('4 September 2017 additional public holiday (SEA Games), announced by the Prime Minister on 30 August 2017 (no P.U.(B) copy archived)',
             'https://www.thestar.com.my/news/nation/2017/08/31/sept-4-public-holiday'),
            ('JPM BKPP Jadual HKA 2017 (hka2017.pdf)',
             'https://web.archive.org/web/20180413080914id_/http://www.kabinet.gov.my/bkpp/pdf/hari_kelepasan_am/hka2017.pdf'),
            ('Warta Kerajaan Persekutuan No. 1779 (31 Jan 2017): Pindaan - Awal Muharam 2017 from 21 Sep (Khamis) to 22 Sep (Jumaat), amending Warta No. 16335 of 25 Jul 2016',
             'https://web.archive.org/web/20170809035234id_/http://www.kabinet.gov.my/v2/pdf/akta_warta/Pindaan_Warta_Cuti_Awal_Muharam_2017.pdf'),
            ('P.U.(B) 176/2017 (3 Apr 2017): 24 Apr 2017 HKA, Peninsular Malaysia, s.8 (installation of YDPA XV); Labuan companion notification in separate PDF',
             'https://web.archive.org/web/20180417110420id_/http://www.kabinet.gov.my/bkpp/pdf/akta_warta/20170404_warta_HKA_tambahan_Agong_semenanjung.pdf'),
            ('Labuan companion notification for 24 Apr 2017',
             'https://web.archive.org/web/20180517050700id_/http://www.kabinet.gov.my/bkpp/pdf/akta_warta/20170404_warta_HKA_tambahan_Agong_labuan.pdf'),
        ],
        "days": [('2017-01-28', 'Tahun Baru Cina'), ('2017-01-29', 'Tahun Baru Cina (Hari Kedua)'), ('2017-04-24', 'Hari Pertabalan YDP Agong XV'), ('2017-05-01', 'Hari Pekerja'), ('2017-05-10', 'Hari Wesak'), ('2017-06-25', 'Hari Raya Puasa'), ('2017-06-26', 'Hari Raya Puasa (Hari Kedua)'), ('2017-08-31', 'Hari Kebangsaan'), ('2017-09-01', 'Hari Raya Qurban (Haji)'), ('2017-09-04', 'Cuti tambahan (SEA Games KL2017 success)'), ('2017-09-09', 'Hari Keputeraan Seri Paduka Baginda Yang di-Pertuan Agong'), ('2017-09-16', 'Hari Malaysia'), ('2017-09-22', 'Awal Muharam (Maal Hijrah)'), ('2017-10-18', 'Hari Deepavali'), ('2017-12-01', 'Hari Keputeraan Nabi Muhammad S.A.W. (Maulidur Rasul)'), ('2017-12-25', 'Hari Krismas')],
    },
    2018: {
        "sources": [
            ('Ketua Setiausaha Negara, 10 May 2018: 10 and 11 May 2018 additional public holidays nationwide under s. 8 (no P.U.(B) copy archived)',
             'https://www.nst.com.my/news/nation/2018/05/367879/public-holidays-thursday-and-friday-ali-hamsa'),
            ('JPM BKPP Jadual HKA Persekutuan 2018 (hka2018.pdf, image)',
             'https://web.archive.org/web/20180417110235id_/http://www.kabinet.gov.my/bkpp/pdf/hari_kelepasan_am/hka2018.pdf'),
            ("PMO Kenyataan Media 11 Apr 2018: HKA tambahan sempena hari mengundi PRU-14, 9 May 2018, 'seluruh Negara' (s.8 for Peninsular+Labuan; Sabah/Sarawak by own ordinances)",
             'https://web.archive.org/web/20180516214329id_/http://www.jpm.gov.my/jpm2/sites/default/files/siaran_akhbar/Kenyataan%20Media%20Hari%20Kelepasan%20Am%20Tambahan%20PRU.pdf'),
        ],
        "days": [('2018-02-16', 'Tahun Baru Cina'), ('2018-02-17', 'Tahun Baru Cina (Hari Kedua)'), ('2018-05-01', 'Hari Pekerja'), ('2018-05-09', 'Hari Mengundi PRU-14'), ('2018-05-10', 'Cuti tambahan selepas PRU-14'), ('2018-05-11', 'Cuti tambahan selepas PRU-14'), ('2018-05-29', 'Hari Wesak'), ('2018-06-15', 'Hari Raya Puasa'), ('2018-06-16', 'Hari Raya Puasa (Hari Kedua)'), ('2018-08-22', 'Hari Raya Qurban (Haji)'), ('2018-08-31', 'Hari Kebangsaan'), ('2018-09-09', 'Hari Keputeraan Seri Paduka Baginda Yang di-Pertuan Agong'), ('2018-09-11', 'Awal Muharam (Maal Hijrah)'), ('2018-09-16', 'Hari Malaysia'), ('2018-11-06', 'Hari Deepavali'), ('2018-11-20', 'Hari Keputeraan Nabi Muhammad S.A.W. (Maulidur Rasul)'), ('2018-12-25', 'Hari Krismas')],
    },
    2019: {
        "sources": [
            ('Warta Kerajaan Persekutuan Jil.62 No.36 (3 Sep 2018), Pemberitahuan No. 17295 Jadual HKA Persekutuan 2019',
             'https://web.archive.org/web/20191105051452id_/http://www.kabinet.gov.my/bkpp/pdf/akta_warta/20190822_HARI_KELEPASAN_2019.pdf'),
            ('P.U.(B) 325/2019 & 326/2019 (1 Jul 2019): 30 Jul 2019 HKA Peninsular & Labuan, s.8 (installation of YDPA XVI)',
             'https://web.archive.org/web/20191105043423id_/http://www.kabinet.gov.my/bkpp/pdf/akta_warta/20190709_warta_hari_pertabalan_agongXVI.pdf'),
        ],
        "days": [('2019-02-05', 'Tahun Baru Cina'), ('2019-02-06', 'Tahun Baru Cina (Hari Kedua)'), ('2019-05-01', 'Hari Pekerja'), ('2019-05-19', 'Hari Wesak'), ('2019-06-05', 'Hari Raya Puasa'), ('2019-06-06', 'Hari Raya Puasa (Hari Kedua)'), ('2019-07-30', 'Hari Pertabalan YDP Agong XVI'), ('2019-08-11', 'Hari Raya Qurban (Haji)'), ('2019-08-31', 'Hari Kebangsaan'), ('2019-09-01', 'Awal Muharam (Maal Hijrah)'), ('2019-09-09', 'Hari Keputeraan Seri Paduka Baginda Yang di-Pertuan Agong'), ('2019-09-16', 'Hari Malaysia'), ('2019-10-27', 'Hari Deepavali'), ('2019-11-09', 'Hari Keputeraan Nabi Muhammad S.A.W. (Maulidur Rasul)'), ('2019-12-25', 'Hari Krismas')],
    },
    2020: {
        "sources": [
            ('Warta Kerajaan Persekutuan Jil.63 No.31 (29 Jul 2019), Pemberitahuan No. 12985 Jadual HKA Persekutuan 2020',
             'https://web.archive.org/web/20220302034349id_/http://www.kabinet.gov.my/bkpp/pdf/akta_warta/20200513_Warta_HKA_2020.pdf'),
            ("Warta Kerajaan Persekutuan Jil.64 No.12 (18 Mar 2020) No. 6489 Pindaan: YDPA birthday 2020 '6 Jun Sabtu' -> '8 Jun Isnin'",
             'https://web.archive.org/web/20220302152516id_/http://www.kabinet.gov.my/bkpp/pdf/akta_warta/20200513_Warta_YdPA_2020.pdf'),
            ("PMO-hosted JPM list 2020 'UPDATED 04032020' (shows Raya Puasa 24-25 May, YDPA 8 Jun; weekday labels for 24/25 May are misprinted)",
             'https://web.archive.org/web/20200408212736id_/https://www.pmo.gov.my/wp-content/uploads/2020/03/Hari-Kelepasan-AM-UPDATED_04032020_Page_1.png'),
        ],
        "days": [('2020-01-25', 'Tahun Baru Cina'), ('2020-01-26', 'Tahun Baru Cina (Hari Kedua)'), ('2020-05-01', 'Hari Pekerja'), ('2020-05-07', 'Hari Wesak'), ('2020-05-24', 'Hari Raya Puasa'), ('2020-05-25', 'Hari Raya Puasa (Hari Kedua)'), ('2020-06-08', 'Hari Keputeraan Seri Paduka Baginda Yang di-Pertuan Agong'), ('2020-07-31', 'Hari Raya Qurban (Haji)'), ('2020-08-20', 'Awal Muharam (Maal Hijrah)'), ('2020-08-31', 'Hari Kebangsaan'), ('2020-09-16', 'Hari Malaysia'), ('2020-10-29', 'Hari Keputeraan Nabi Muhammad S.A.W. (Maulidur Rasul)'), ('2020-11-14', 'Hari Deepavali'), ('2020-12-25', 'Hari Krismas')],
    },
    2021: {
        "sources": [
            ('Warta Kerajaan Persekutuan (9 Jul 2020) Jadual HKA Persekutuan 2021',
             'https://web.archive.org/web/20220301202455id_/http://www.kabinet.gov.my/bkpp/pdf/akta_warta/20200709_warta_hka2021.pdf'),
            ('JPM BKPP hka_2021.pdf',
             'https://web.archive.org/web/20200924081740id_/http://www.kabinet.gov.my/bkpp/pdf/hari_kelepasan_am/hka_2021.pdf'),
        ],
        "days": [('2021-02-12', 'Tahun Baru Cina'), ('2021-02-13', 'Tahun Baru Cina (Hari Kedua)'), ('2021-05-01', 'Hari Pekerja'), ('2021-05-13', 'Hari Raya Puasa'), ('2021-05-14', 'Hari Raya Puasa (Hari Kedua)'), ('2021-05-26', 'Hari Wesak'), ('2021-06-07', 'Hari Keputeraan Seri Paduka Baginda Yang di-Pertuan Agong'), ('2021-07-20', 'Hari Raya Qurban (Haji)'), ('2021-08-10', 'Awal Muharam (Maal Hijrah)'), ('2021-08-31', 'Hari Kebangsaan'), ('2021-09-16', 'Hari Malaysia'), ('2021-10-19', 'Hari Keputeraan Nabi Muhammad S.A.W. (Maulidur Rasul)'), ('2021-11-04', 'Hari Deepavali'), ('2021-12-25', 'Hari Krismas')],
    },
    2022: {
        "sources": [
            ('Warta Kerajaan Persekutuan (24 Jun 2021) Jadual HKA Persekutuan 2022',
             'https://web.archive.org/web/20220301223716id_/http://www.kabinet.gov.my/bkpp/pdf/akta_warta/20210624_warta_hka2022.pdf'),
            ('PMO Kenyataan Media 1 May 2022: Raya Aidilfitri 2022 = Isnin 2 Mei; Hari Pekerja (Sun 1 May) replacement automatically Rabu 4 Mei 2022 under s.3 Act 369 / Sabah Cap.56 / Sarawak Cap.8; not for Kedah, Terengganu, Kelantan, Johor',
             'https://web.archive.org/web/20220515191737id_/https://www.pmo.gov.my/wp-content/uploads/2022/05/152022-KENYATAAN-MEDIA-PERUBAHAN-CUTI-UMUM.pdf'),
            ('P.U.(B) 556/2022 (15 Nov 2022): 18 & 19 Nov 2022 HKA Peninsular, s.8 (GE15); Labuan: P.U.(B) 557/2022',
             'https://web.archive.org/web/20221208142318id_/http://www.kabinet.gov.my/bkpp/pdf/akta_warta/20221114_PUB556.pdf'),
            ('P.U.(B) 579/2022 (25 Nov 2022): 28 Nov 2022 HKA Peninsular, s.8; Labuan: P.U.(B) 580/2022',
             'https://web.archive.org/web/20221208142317id_/http://www.kabinet.gov.my/bkpp/pdf/akta_warta/20221125_WARTA_PUB%20579_Semenanjung.pdf'),
        ],
        "days": [('2022-02-01', 'Tahun Baru Cina'), ('2022-02-02', 'Tahun Baru Cina (Hari Kedua)'), ('2022-05-01', 'Hari Pekerja'), ('2022-05-02', 'Hari Raya Puasa'), ('2022-05-03', 'Hari Raya Puasa (Hari Kedua)'), ('2022-05-15', 'Hari Wesak'), ('2022-06-06', 'Hari Keputeraan Seri Paduka Baginda Yang di-Pertuan Agong'), ('2022-07-10', 'Hari Raya Qurban (Haji)'), ('2022-07-30', 'Awal Muharam (Maal Hijrah)'), ('2022-08-31', 'Hari Kebangsaan'), ('2022-09-16', 'Hari Malaysia'), ('2022-10-09', 'Hari Keputeraan Nabi Muhammad S.A.W. (Maulidur Rasul)'), ('2022-10-24', 'Hari Deepavali'), ('2022-11-18', 'Hari kelepasan am tambahan PRU-15'), ('2022-11-19', 'Hari Mengundi PRU-15'), ('2022-11-28', 'Hari kelepasan am tambahan'), ('2022-12-25', 'Hari Krismas')],
    },
    2023: {
        "sources": [
            ('Warta Kerajaan Persekutuan Jil.66 No.28 (14 Jul 2022), Pemberitahuan No. 16872 Jadual HKA Persekutuan 2023',
             'https://web.archive.org/web/20221208142317id_/http://www.kabinet.gov.my/bkpp/pdf/akta_warta/20220725_warta_hka2023.pdf'),
            ('P.U.(B) 154/2023 (20 Apr 2023): 21 Apr 2023 HKA Peninsular, s.8 (extra Aidilfitri day); Labuan: P.U.(B) 155/2023',
             'https://web.archive.org/web/20230604013430id_/http://www.kabinet.gov.my/bkpp/pdf/akta_warta/20230420_PUB_154.pdf'),
            ('PMO news 18 Apr 2023: one extra Aidilfitri holiday (21 Apr if 1 Syawal is Sat 22 Apr), s.8 Peninsular+Labuan; Sabah/Sarawak by own ordinances',
             'https://web.archive.org/web/20230724152934id_/https://www.pmo.gov.my/ms/2023/04/pm-anwar-satu-hari-kelepasan-am-tambahan-sempena-hari-raya-aidilfitri/'),
        ],
        "days": [('2023-01-22', 'Tahun Baru Cina'), ('2023-01-23', 'Tahun Baru Cina (Hari Kedua)'), ('2023-04-21', 'Hari kelepasan am tambahan Aidilfitri'), ('2023-04-22', 'Hari Raya Puasa'), ('2023-04-23', 'Hari Raya Puasa (Hari Kedua)'), ('2023-05-01', 'Hari Pekerja'), ('2023-05-04', 'Hari Wesak'), ('2023-06-05', 'Hari Keputeraan Seri Paduka Baginda Yang di-Pertuan Agong'), ('2023-06-29', 'Hari Raya Qurban (Haji)'), ('2023-07-19', 'Awal Muharam (Maal Hijrah)'), ('2023-08-31', 'Hari Kebangsaan'), ('2023-09-16', 'Hari Malaysia'), ('2023-09-28', 'Hari Keputeraan Nabi Muhammad S.A.W. (Maulidur Rasul)'), ('2023-11-12', 'Hari Deepavali'), ('2023-12-25', 'Hari Krismas')],
    },
    2024: {
        "sources": [
            ('Warta Kerajaan Persekutuan (9 Aug 2023), Pemberitahuan No. 19239 Jadual HKA Persekutuan 2024',
             'https://web.archive.org/web/20230927184620id_/http://www.kabinet.gov.my/bkpp/pdf/akta_warta/20230810_HARI_KELEPASAN_2024.pdf'),
            ('JPM BKPP hka_2024.pdf',
             'https://web.archive.org/web/20230821135638id_/https://www.kabinet.gov.my/bkpp/pdf/hari_kelepasan_am/hka_2024.pdf'),
        ],
        "days": [('2024-02-10', 'Tahun Baru Cina'), ('2024-02-11', 'Tahun Baru Cina (Hari Kedua)'), ('2024-04-10', 'Hari Raya Puasa'), ('2024-04-11', 'Hari Raya Puasa (Hari Kedua)'), ('2024-05-01', 'Hari Pekerja'), ('2024-05-22', 'Hari Wesak'), ('2024-06-03', 'Hari Keputeraan Seri Paduka Baginda Yang di-Pertuan Agong'), ('2024-06-17', 'Hari Raya Qurban (Haji)'), ('2024-07-07', 'Awal Muharam (Maal Hijrah)'), ('2024-08-31', 'Hari Kebangsaan'), ('2024-09-16', 'Hari Keputeraan Nabi Muhammad S.A.W. (Maulidur Rasul)'), ('2024-09-16', 'Hari Malaysia'), ('2024-10-31', 'Hari Deepavali'), ('2024-12-25', 'Hari Krismas')],
    },
    2025: {
        "sources": [
            ('Warta Kerajaan Persekutuan (5 Aug 2024), Pemberitahuan No. 17852 Jadual HKA Persekutuan 2025',
             'https://web.archive.org/web/20241118160009id_/https://www.kabinet.gov.my/bkpp/pdf/akta_warta/20240812_WJW24.pdf'),
            ('JPM BKPP hka_2025.pdf',
             'https://web.archive.org/web/20250830220717id_/https://www.kabinet.gov.my/storage/2024/11/hka_2025.pdf'),
            ('P.U.(B) 305/2025 (14 Aug 2025): 15 Sep 2025 HKA Peninsular, s.8',
             'https://web.archive.org/web/20261106120557id_/https://www.kabinet.gov.my/storage/2025/08/15082025-P.U.-B-305-2025-Semenanjung.pdf'),
        ],
        "days": [('2025-01-29', 'Tahun Baru Cina'), ('2025-01-30', 'Tahun Baru Cina (Hari Kedua)'), ('2025-03-31', 'Hari Raya Puasa'), ('2025-04-01', 'Hari Raya Puasa (Hari Kedua)'), ('2025-05-01', 'Hari Pekerja'), ('2025-05-12', 'Hari Wesak'), ('2025-06-02', 'Hari Keputeraan Seri Paduka Baginda Yang di-Pertuan Agong'), ('2025-06-07', 'Hari Raya Qurban (Haji)'), ('2025-06-27', 'Awal Muharam (Maal Hijrah)'), ('2025-08-31', 'Hari Kebangsaan'), ('2025-09-05', 'Hari Keputeraan Nabi Muhammad S.A.W. (Maulidur Rasul)'), ('2025-09-15', 'Hari kelepasan am tambahan'), ('2025-09-16', 'Hari Malaysia'), ('2025-10-20', 'Hari Deepavali'), ('2025-12-25', 'Hari Krismas')],
    },
    2026: {
        "sources": [
            ('Penyimpan Mohor Besar Raja-Raja, 19 March 2026: 1 Syawal 1447 on Saturday 21 March; the Prime Minister: Friday 20 March an additional public holiday under s. 8 (Peninsular Malaysia and Labuan) (RTM)',
             'https://berita.rtm.gov.my/nasional/senarai-berita-nasional/senarai-artikel/umat-islam-di-malaysia-sambut-aidilfitri-pada-sabtu-21-mac/'),
            ('PM umum cuti tambahan Hari Raya Aidilfitri (RTM, 15 March 2026): 20 March if 1 Syawal is a Saturday, 23 March if a Friday',
             'https://berita.rtm.gov.my/?p=581444'),
            ('JPM BKPP HKA-2026.pdf (Jadual HKA Persekutuan 2026)',
             'https://web.archive.org/web/20251216120554id_/https://www.kabinet.gov.my/storage/2025/08/HKA-2026.pdf'),
        ],
        "days": [('2026-03-20', 'Hari kelepasan am tambahan Aidilfitri'), ('2026-02-17', 'Tahun Baru Cina'), ('2026-02-18', 'Tahun Baru Cina (Hari Kedua)'), ('2026-03-21', 'Hari Raya Puasa'), ('2026-03-22', 'Hari Raya Puasa (Hari Kedua)'), ('2026-05-01', 'Hari Pekerja'), ('2026-05-27', 'Hari Raya Qurban (Haji)'), ('2026-05-31', 'Hari Wesak'), ('2026-06-01', 'Hari Keputeraan Seri Paduka Baginda Yang di-Pertuan Agong'), ('2026-06-17', 'Awal Muharam (Maal Hijrah)'), ('2026-08-25', 'Hari Keputeraan Nabi Muhammad S.A.W. (Maulidur Rasul)'), ('2026-08-31', 'Hari Kebangsaan'), ('2026-09-16', 'Hari Malaysia'), ('2026-11-08', 'Hari Deepavali'), ('2026-12-25', 'Hari Krismas')],
    },
    2027: {
        "sources": [
            ('JPM BKPP HKA_2027.pdf (Jadual HKA Persekutuan 2027)',
             'https://web.archive.org/web/20260904160020id_/https://www.kabinet.gov.my/storage/2026/08/HKA_2027.pdf'),
        ],
        "days": [('2027-02-06', 'Tahun Baru Cina'), ('2027-02-07', 'Tahun Baru Cina (Hari Kedua)'), ('2027-03-10', 'Hari Raya Puasa'), ('2027-03-11', 'Hari Raya Puasa (Hari Kedua)'), ('2027-05-01', 'Hari Pekerja'), ('2027-05-17', 'Hari Raya Qurban (Haji)'), ('2027-05-20', 'Hari Wesak'), ('2027-06-06', 'Awal Muharam (Maal Hijrah)'), ('2027-06-07', 'Hari Keputeraan Seri Paduka Baginda Yang di-Pertuan Agong'), ('2027-08-15', 'Hari Keputeraan Nabi Muhammad S.A.W. (Maulidur Rasul)'), ('2027-08-31', 'Hari Kebangsaan'), ('2027-09-16', 'Hari Malaysia'), ('2027-10-28', 'Hari Deepavali'), ('2027-12-25', 'Hari Krismas')],
    },
}


MY_FIRST_LIST, MY_LAST_LIST = 2008, 2027


def new_moons_near(year: int, month: int) -> list[float]:
    """Julian Ephemeris Days of the true new moons around MONTH of YEAR (Meeus,
    Astronomical Algorithms, 2nd ed., ch. 49; periodic terms for the new moon)."""
    import math
    out = []
    k0 = math.floor((year + (month - 0.5) / 12 - 2000) * 12.3685)
    for k in range(k0 - 2, k0 + 3):
        t = k / 1236.85
        jde = (2451550.09766 + 29.530588861 * k + 0.00015437 * t * t
               - 0.000000150 * t ** 3 + 0.00000000073 * t ** 4)
        e = 1 - 0.002516 * t - 0.0000074 * t * t
        r = math.radians
        m = r(2.5534 + 29.10535670 * k - 0.0000014 * t * t - 0.00000011 * t ** 3)
        mp = r(201.5643 + 385.81693528 * k + 0.0107582 * t * t + 0.00001238 * t ** 3 - 0.000000058 * t ** 4)
        f = r(160.7108 + 390.67050284 * k - 0.0016118 * t * t - 0.00000227 * t ** 3 + 0.000000011 * t ** 4)
        om = r(124.7746 - 1.56375588 * k + 0.0020672 * t * t + 0.00000215 * t ** 3)
        s = math.sin
        jde += (-0.40720 * s(mp) + 0.17241 * e * s(m) + 0.01608 * s(2 * mp) + 0.01039 * s(2 * f)
                + 0.00739 * e * s(mp - m) - 0.00514 * e * s(mp + m) + 0.00208 * e * e * s(2 * m)
                - 0.00111 * s(mp - 2 * f) - 0.00057 * s(mp + 2 * f) + 0.00056 * e * s(2 * mp + m)
                - 0.00042 * s(3 * mp) + 0.00042 * e * s(m + 2 * f) + 0.00038 * e * s(m - 2 * f)
                - 0.00024 * e * s(2 * mp - m) - 0.00017 * s(om) - 0.00007 * s(mp + 2 * m)
                + 0.00004 * s(2 * mp - 2 * f) + 0.00004 * s(3 * m) + 0.00003 * s(mp + m - 2 * f)
                + 0.00003 * s(2 * mp + 2 * f) - 0.00003 * s(mp + m + 2 * f) + 0.00003 * s(mp - m + 2 * f)
                - 0.00002 * s(mp - m - 2 * f) - 0.00002 * s(3 * mp + m) + 0.00002 * s(4 * mp))
        a = [r(x) for x in (299.77 + 0.107408 * k - 0.009173 * t * t, 251.88 + 0.016321 * k,
                            251.83 + 26.651886 * k, 349.42 + 36.412478 * k, 84.66 + 18.206239 * k,
                            141.74 + 53.303771 * k, 207.14 + 2.453732 * k, 154.84 + 7.306860 * k,
                            34.52 + 27.261239 * k, 207.19 + 0.121824 * k, 291.34 + 1.844379 * k,
                            161.72 + 24.198154 * k, 239.56 + 25.513099 * k, 331.55 + 3.592518 * k)]
        coef = (0.000325, 0.000165, 0.000164, 0.000126, 0.000110, 0.000062, 0.000060, 0.000056,
                0.000047, 0.000042, 0.000040, 0.000037, 0.000035, 0.000023)
        jde += sum(c * s(x) for c, x in zip(coef, a))
        out.append(jde)
    return out


def jde_to_local_date(jde: float, offset_hours: float) -> date:
    """Civil date at UTC+OFFSET of a JDE (TT; delta T taken as 70 s)."""
    jd = jde - 70 / 86400 + offset_hours / 24 + 0.5
    return date(2000, 1, 1) + timedelta(days=int(jd // 1) - 2451545)


def my_deepavali_estimate(year: int) -> date:
    """The day before the first new moon (IST date) after 17 October: the end
    of amanta Ashvina after the Sun's sidereal entry into Tula. An estimate for
    years with no list; it matches 17 of the 20 listed dates 2008-2027 and is a
    day late in the other three (2008, 2014, 2017)."""
    moons = sorted(jde_to_local_date(j, 5.5) for j in new_moons_near(year, 10))
    return next(d for d in moons if d > date(year, 10, 17)) - timedelta(days=1)


def my_wesak_estimate(year: int) -> date:
    """The first full-moon day (lunar day 15 of the HKO table, UTC+8, a leap
    month included) on or after 3 May: the listed Wesak of 2008-2027 falls on
    3-31 May. An estimate for years with no list."""
    return min(d for d, (_, day, _, _) in hko_days(year).items() if day == 15 and d >= date(year, 5, 3))


def my_estimated(year: int) -> list[tuple[date, str]]:
    """The days of a year no list covers (provisional years)."""
    cny = hk_lunar(year, 1, 1)
    june = date(year, 6, 1)
    out = [(cny, "Tahun Baharu Cina (anggaran)"), (cny + timedelta(days=1), "Tahun Baharu Cina (Hari Kedua) (anggaran)"),
           (date(year, 5, 1), "Hari Pekerja"), (my_wesak_estimate(year), "Hari Wesak (anggaran)"),
           (june + timedelta(days=(0 - june.weekday()) % 7), "Hari Keputeraan Rasmi YDP Agong (anggaran)"),
           (date(year, 8, 31), "Hari Kebangsaan"), (date(year, 9, 16), "Hari Malaysia"),
           (my_deepavali_estimate(year), "Hari Deepavali (anggaran)"), (date(year, 12, 25), "Hari Krismas")]
    for m, d, name, extra in ((10, 1, "Hari Raya Puasa", 0), (10, 1, "Hari Raya Puasa (Hari Kedua)", 1),
                              (12, 10, "Hari Raya Qurban", 0), (1, 1, "Awal Muharam", 0),
                              (3, 12, "Hari Keputeraan Nabi Muhammad S.A.W.", 0)):
        for x in islamic_dates_in_year(year, m, d):
            x += timedelta(days=extra)
            if x.year == year:
                out.append((x, f"{name} (anggaran)"))
    return out


def my_replacements(days: list[tuple[date, str]]) -> list[tuple[date, str]]:
    """Act 369 s. 3: each holiday on a Sunday, in date order, gives the next day
    that is not already a holiday."""
    taken = {d for d, _ in days}
    out = []
    for d, name in sorted(days):
        if d.weekday() == 6:
            n = d + timedelta(days=1)
            while n in taken:
                n += timedelta(days=1)
            taken.add(n)
            out.append((n, f"Cuti {name}"))
    return out


def my_holidays(year: int) -> list[tuple[date, str]]:
    if year in MY_LISTS:
        days = [(date.fromisoformat(d), n) for d, n in MY_LISTS[year]["days"]]
    else:
        days = my_estimated(year)
    # A replacement may run into January; it belongs to the next year's list.
    prev = MY_LISTS.get(year - 1, {}).get("days")
    prev_days = ([(date.fromisoformat(d), n) for d, n in prev] if prev
                 else my_estimated(year - 1) if year - 1 >= MY_FIRST_LIST else [])
    extra = [x for x in my_replacements(prev_days) if x[0].year == year]
    return days + [x for x in my_replacements(days) if x[0].year == year] + extra


# --- Vietnam --------------------------------------------------------------
#
# Ngày nghỉ lễ, tết of cán bộ, công chức, viên chức (Saturday and Sunday off
# since QĐ 188/1999/QĐ-TTg): Bộ luật Lao động 1994 Điều 73 (as amended by Luật
# 84/2007, Giỗ Tổ), BLLĐ 2012 Điều 115 (Tết 5 days from 2014), BLLĐ 2019
# Điều 111-112 (Quốc khánh 2 days from 2021), NQ 28/2026/QH16 (24/11 from
# 2026) and the 2026 amending law (27/7 from 1 March 2027); and the yearly
# Thủ tướng / VPCP / Bộ LĐTBXH / Bộ Nội vụ notices that place the Tết and
# Quốc khánh days, swap weekdays off (hoán đổi) and make Saturdays working
# days (làm bù). A holiday on a Saturday or Sunday gives the next working day
# (nghỉ bù). Lunar dates: the notices, and for years with no notice Hồ Ngọc
# Đức's amlich tables (UTC+7).

VN_NOTE = (
    "Days off of government offices (cán bộ, công chức, viên chức; Saturday and Sunday are the weekly "
    "rest): the statutory days of each era, their nghỉ bù, and the yearly notices' Tết and Quốc khánh "
    "placement, hoán đổi days and làm bù Saturdays (:working-days), 2000-2027. A Saturday or Sunday "
    "inside a block is a weekly rest day, not a holiday. 2028-2040 are provisional: statutory days, "
    "Tết as giao thừa + mùng 1-4, the Quốc khánh day next to 2/9 by the 2021-2027 pattern, nghỉ bù."
)

VN_SOURCES = [
    ("Bộ luật Lao động 1994 Điều 73; Luật 35/2002/QH10; Luật 84/2007/QH11 (Giỗ Tổ Hùng Vương, from 11/04/2007)",
     "https://moit.gov.vn/upload/2005517/20210623/L%2084-2007-QH11.doc",
     "Tết dương lịch 1 ngày; Tết âm lịch bốn ngày (một ngày cuối năm và ba ngày đầu năm âm lịch); 30/4; 1/5; "
     "2/9; Giỗ Tổ Hùng Vương 10/3 âm lịch (2007). Nếu những ngày nghỉ nói trên trùng vào ngày nghỉ hàng tuần "
     "thì người lao động được nghỉ bù vào ngày tiếp theo."),
    ("Quyết định 188/1999/QĐ-TTg, Điều 1: tuần làm việc 40 giờ, nghỉ thứ bảy và chủ nhật (from 02/10/1999)",
     "https://caselaw.vn/van-ban-phap-luat/239691-quyet-dinh-so-188-1999-qd-ttg-ngay-17-09-1999-cua-thu-tuong-chinh-phu-ve-che-do-tuan-lam-viec-40-gio",
     "Saturday and Sunday are the weekly rest of cán bộ, công chức: a holiday on either gives a nghỉ bù."),
    ("Bộ luật Lao động 2012 (10/2012/QH13) Điều 115, in force 01/05/2013",
     "https://moit.gov.vn/upload/2005517/20210623/_CB99Ad01.pdf",
     "Tết Âm lịch 05 ngày (first in 2014); nghỉ bù vào ngày kế tiếp."),
    ("Bộ luật Lao động 2019 (45/2019/QH14) Điều 111(3), 112, in force 01/01/2021",
     "https://vanban.chinhphu.vn/?pageid=27160&docid=198540",
     "Quốc khánh 02 ngày (ngày 02 tháng 9 dương lịch và 01 ngày liền kề trước hoặc sau); Tết Âm lịch 05 "
     "ngày; Thủ tướng quyết định cụ thể ngày nghỉ; nghỉ bù vào ngày làm việc kế tiếp."),
    ("Nghị quyết 28/2026/QH16 về phát triển văn hóa Việt Nam, Điều 2(1) (in force 01/07/2026)",
     "https://image.sggp.org.vn/Uploaded/2026/evesfnbfjpy/2026_05_06/nq28-phat-trien-van-hoa-7155.pdf",
     "Ngày 24 tháng 11 hằng năm là Ngày Văn hóa Việt Nam; người lao động được nghỉ làm việc và hưởng nguyên lương."),
    ("Luật sửa đổi, bổ sung một số điều của Bộ luật Lao động, ... (passed 21/11/2026, in force 01/03/2027)",
     "https://baochinhphu.vn/quoc-hoi-dong-y-bo-sung-2-ngay-nghi-le-duoc-huong-nguyen-luong-102261121121448218.htm",
     "Bổ sung Ngày Tổ quốc tri ân - Ngày Thương binh, liệt sĩ (27/7) và Ngày Văn hóa Việt Nam (24/11) là ngày "
     "nghỉ lễ, Tết hưởng nguyên lương. The law's number and signed text were not yet published."),
    ("The yearly notices 2000-2027: Thủ tướng / VPCP công văn, Bộ LĐTBXH (to 2025) and Bộ Nội vụ (from 2025) thông báo",
     "https://datafiles.chinhphu.vn/cpp/files/vbpq/2026/9/10065_vpcp-kgvx_02102026_1-signed.signed.pdf",
     "E.g. 872/VPCP-KGVX (2010), 9197/VPCP-KGVX (2012), 5083/TB-BLĐTBXH (2014), 573/TB-VPCP (2018), "
     "6519/VPCP-KGVX (2019), 8056/VPCP-KGVX (2023), 6150/TB-BLĐTBXH (2025), 12590/TB-BNV and 9441/TB-BNV "
     "(2026), 10065/VPCP-KGVX (2026 Ngày Văn hóa; Tết and Quốc khánh 2027). 2000-2009: provincial UBND "
     "directives on vanban.chinhphu.vn quoting the Bộ LĐTBXH guidance; nghỉ bù days with no notice found "
     "follow the statute."),
    ("Hồ Ngọc Đức, Âm lịch Việt Nam, amlich-hnd.js tables TK21 (UTC+7)",
     HND_URI,
     "Tết (1/1 âm lịch), giao thừa and Giỗ Tổ (10/3) in years with no notice."),
]

VN_NOTICES = {
    2000: {
        "sources": [
            ('02/2000/CT-UB UBND tỉnh Cần Thơ 2000-01-14: Chỉ thị về việc tổ chức Tết Nguyên đán Canh Thìn năm 2000 (mục 10: 40h/5 ngày nghỉ Tết 6 ngày 04/02–09/02/2000, 2 ngày nghỉ bù vì mùng 1, mùng 2 trùng thứ bảy, chủ nhật; thực hiện CV 4331/LĐTBXH-BHLĐ 16/12/1999)',
             'https://vanban.chinhphu.vn/?pageid=27160&docid=9347'),
            ('01/2000/CT-UB UBND tỉnh Bạc Liêu 2000-01-18: Chỉ thị về việc tổ chức đón tết, vui xuân Canh Thìn năm 2000 (CBCC nghỉ 06 ngày 04/02–09/02, có 02 ngày nghỉ bù thứ bảy và chủ nhật)',
             'https://vanban.chinhphu.vn/?pageid=27160&docid=7413'),
            ('02/2000/CT-TTg Thủ tướng Chính phủ 2000-01-19: Chỉ thị về tổ chức đón Tết Canh Thìn, năm 2000 (không nêu ngày nghỉ)',
             'https://vanban.chinhphu.vn/?pageid=27160&docid=7243'),
            ('4331/LĐTBXH-BHLĐ Bộ Lao động - Thương binh và Xã hội 1999-12-16 — Công văn hướng dẫn nghỉ Tết Canh Thìn (được UBND Cần Thơ trích dẫn; chưa tìm thấy bản gốc trực tuyến)', None),
        ],
        "days": [
            ('2000-01-01', 'Tết Dương lịch (thứ bảy)', 'le'),
            ('2000-01-03', 'nghỉ bù Tết Dương lịch (CHƯA XÁC MINH bằng văn bản)', 'bu'),
            ('2000-02-04', 'Tết Nguyên đán (ngày cuối năm Kỷ Mão)', 'le'),
            ('2000-02-05', 'Tết Nguyên đán (mùng 1, thứ bảy)', 'le'),
            ('2000-02-06', 'Tết Nguyên đán (mùng 2, chủ nhật)', 'le'),
            ('2000-02-07', 'Tết Nguyên đán (mùng 3)', 'le'),
            ('2000-02-08', 'nghỉ bù Tết (mùng 4)', 'bu'),
            ('2000-02-09', 'nghỉ bù Tết (mùng 5)', 'bu'),
            ('2000-04-30', 'Ngày Chiến thắng (chủ nhật)', 'le'),
            ('2000-05-01', 'Quốc tế Lao động', 'le'),
            ('2000-05-02', 'nghỉ bù 30/4 (CHƯA XÁC MINH bằng văn bản)', 'bu'),
            ('2000-09-02', 'Quốc khánh (thứ bảy)', 'le'),
            ('2000-09-04', 'nghỉ bù Quốc khánh (CHƯA XÁC MINH bằng văn bản)', 'bu'),
        ],
        "working": [],
    },
    2001: {
        "sources": [
            ('01/2001/CT.UBT UBND tỉnh Cần Thơ 2001-01-02: Chỉ thị về tổ chức đón Tết Tân Tỵ, năm 2001 (mục 11: CBCC nghỉ Tết 4 ngày 23/01–26/01/2001, nhằm 29 tháng Chạp đến hết mùng 3)',
             'https://vanban.chinhphu.vn/?pageid=27160&docid=8447'),
            ('25/2000/CT.UBT UBND tỉnh Cần Thơ 2000-12-25: Chỉ thị về tổ chức đón Tết Tân Tỵ, năm 2001 (same wording, mục 10)',
             'https://vanban.chinhphu.vn/?pageid=27160&docid=8413'),
            ('27/2000/CT-TTg Thủ tướng Chính phủ 2000-12-25: Chỉ thị tổ chức đón tết Tân Tỵ năm 2001 (không nêu ngày nghỉ)',
             'https://vanban.chinhphu.vn/?pageid=27160&docid=8419'),
            ('49/2000/QĐ-BGD&ĐT Bộ Giáo dục và Đào tạo 2000-12-04: QĐ điều chỉnh thời gian nghỉ Tết Âm lịch Tân Tỵ cho giáo dục phổ thông, mầm non... (chỉ áp dụng ngành giáo dục: 22/01–28/01/2001; KHÔNG áp dụng cho CBCC)',
             'https://vanban.chinhphu.vn/?pageid=27160&docid=8429'),
        ],
        "days": [
            ('2001-01-01', 'Tết Dương lịch', 'le'),
            ('2001-01-23', 'Tết Nguyên đán (29 tháng Chạp, ngày cuối năm Canh Thìn)', 'le'),
            ('2001-01-24', 'Tết Nguyên đán (mùng 1)', 'le'),
            ('2001-01-25', 'Tết Nguyên đán (mùng 2)', 'le'),
            ('2001-01-26', 'Tết Nguyên đán (mùng 3)', 'le'),
            ('2001-04-30', 'Ngày Chiến thắng', 'le'),
            ('2001-05-01', 'Quốc tế Lao động', 'le'),
            ('2001-09-02', 'Quốc khánh (chủ nhật)', 'le'),
            ('2001-09-03', 'nghỉ bù Quốc khánh (CHƯA XÁC MINH bằng văn bản)', 'bu'),
        ],
        "working": [],
    },
    2002: {
        "sources": [
            ('01/2002/CT-UB UBND tỉnh Cần Thơ 2002-01-03: Chỉ thị về tổ chức đón tết Nhâm Ngọ, năm 2002 (mục 9: CBCC nghỉ Tết 4 ngày 11/02–14/02/2002, 30 tháng Chạp đến hết mùng 3)',
             'https://vanban.chinhphu.vn/?pageid=27160&docid=10122'),
            ('02/2002/CT-UBNDT UBND tỉnh Sóc Trăng 2002-01-07: V/v tổ chức Tết nguyên đán Nhâm Ngọ 2002 (mục 10: nghỉ 4 ngày 11/02–14/02/2002)',
             'https://vanban.chinhphu.vn/?pageid=27160&docid=10289'),
            ('03/2002/CT-UB UBND tỉnh Vĩnh Long 2002-01-24: Tổ chức đón Tết Nguyên Đán Nhâm Ngọ 2002 (CBCC nghỉ 11/02–14/02/2002)',
             'https://vanban.chinhphu.vn/?pageid=27160&docid=10658'),
        ],
        "days": [
            ('2002-01-01', 'Tết Dương lịch', 'le'),
            ('2002-02-11', 'Tết Nguyên đán (30 tháng Chạp)', 'le'),
            ('2002-02-12', 'Tết Nguyên đán (mùng 1)', 'le'),
            ('2002-02-13', 'Tết Nguyên đán (mùng 2)', 'le'),
            ('2002-02-14', 'Tết Nguyên đán (mùng 3)', 'le'),
            ('2002-04-30', 'Ngày Chiến thắng', 'le'),
            ('2002-05-01', 'Quốc tế Lao động', 'le'),
            ('2002-09-02', 'Quốc khánh', 'le'),
        ],
        "working": [],
    },
    2003: {
        "sources": [
            ('20/2002/CT-UB UBND tỉnh Cần Thơ 2002-12-26: Chỉ thị về tổ chức đón Tết Quí Mùi, năm 2003 (mục 11: CBCC nghỉ 6 ngày gồm 4 ngày Tết và 2 ngày nghỉ bù, 31/01–05/02/2003, 29 tháng Chạp đến hết mùng 5)',
             'https://vanban.chinhphu.vn/?pageid=27160&docid=11342'),
            ('01/2003/CT-UB UBND tỉnh Lạng Sơn 2003-01-14: Chỉ thị về tổ chức đón Tết Quý Mùi-năm 2003 (4 ngày 31/01–03/02 + 02 ngày nghỉ bù thứ bảy, chủ nhật)',
             'https://vanban.chinhphu.vn/?pageid=27160&docid=11436'),
        ],
        "days": [
            ('2003-01-01', 'Tết Dương lịch', 'le'),
            ('2003-01-31', 'Tết Nguyên đán (29 tháng Chạp, ngày cuối năm Nhâm Ngọ)', 'le'),
            ('2003-02-01', 'Tết Nguyên đán (mùng 1, thứ bảy)', 'le'),
            ('2003-02-02', 'Tết Nguyên đán (mùng 2, chủ nhật)', 'le'),
            ('2003-02-03', 'Tết Nguyên đán (mùng 3)', 'le'),
            ('2003-02-04', 'nghỉ bù Tết (mùng 4)', 'bu'),
            ('2003-02-05', 'nghỉ bù Tết (mùng 5)', 'bu'),
            ('2003-04-30', 'Ngày Chiến thắng', 'le'),
            ('2003-05-01', 'Quốc tế Lao động', 'le'),
            ('2003-09-02', 'Quốc khánh', 'le'),
        ],
        "working": [],
    },
    2004: {
        "sources": [
            ('08/2003/CT.UBNDT UBND tỉnh Sóc Trăng 2003-12-05: V/v tổ chức Tết nguyên đán Giáp Thân 2004 (mục 9: nghỉ 6 ngày 21/01–26/01/2004, tính cả ngày nghỉ bù thứ bảy và chủ nhật)',
             'https://vanban.chinhphu.vn/?pageid=27160&docid=12421'),
            ("UBND TP.HCM (qua báo Người Lao Động) 2004-01-10: Báo NLĐ 10/01/2004: 'Nghỉ Tết Nguyên Đán 2004: ít nhất 4 ngày rưỡi' – UBND TPHCM thông báo 9/1/2004: nghỉ 21–24/1, nghỉ bù 26/1 (40h/5 ngày)",
             'https://nld.com.vn/thoi-su-trong-nuoc/nghi-tet-nguyen-dan-2004-it-nhat-4-ngay-ruoi-79039.htm'),
            ("UBND TP.HCM (qua báo Tuổi Trẻ) 2004-04-20: Báo Tuổi Trẻ 20/04/2004: 'Nghỉ lễ và treo cờ Tổ quốc ngày 30-4 và 1-5' – 1/5 trùng thứ bảy, đơn vị 40h/5 ngày nghỉ bù 3/5",
             'https://tuoitre.vn/nghi-le-va-treo-co-to-quoc-ngay-30-4-va-1-5-29525.htm'),
        ],
        "days": [
            ('2004-01-01', 'Tết Dương lịch', 'le'),
            ('2004-01-21', 'Tết Nguyên đán (30 tháng Chạp)', 'le'),
            ('2004-01-22', 'Tết Nguyên đán (mùng 1)', 'le'),
            ('2004-01-23', 'Tết Nguyên đán (mùng 2)', 'le'),
            ('2004-01-24', 'Tết Nguyên đán (mùng 3, thứ bảy)', 'le'),
            ('2004-01-26', 'nghỉ bù Tết (mùng 5)', 'bu'),
            ('2004-04-30', 'Ngày Chiến thắng', 'le'),
            ('2004-05-01', 'Quốc tế Lao động (thứ bảy)', 'le'),
            ('2004-05-03', 'nghỉ bù 1/5', 'bu'),
            ('2004-09-02', 'Quốc khánh', 'le'),
        ],
        "working": [],
    },
    2005: {
        "sources": [
            ('04/2005/CT-UB UBND TP Cần Thơ 2005-01-14: Về tổ chức đón Tết Nguyên đán Ất Dậu năm 2005 (mục 13: CBCC nghỉ 06 ngày gồm 4 ngày Tết và 2 ngày thứ bảy, chủ nhật, 08/02–13/02/2005)',
             'https://vanban.chinhphu.vn/?pageid=27160&docid=14329'),
            ('01/2005/CT-UBNDT UBND tỉnh Sóc Trăng 2005-01-06: Về việc tổ chức Tết Nguyên Đán Ất Dậu năm 2005 (mục 9: nghỉ 04 ngày 08/02–11/02; 12, 13/02 là nghỉ cuối tuần)',
             'https://vanban.chinhphu.vn/?pageid=27160&docid=14304'),
            ('48/2004/CT-TTg Thủ tướng Chính phủ 2004-12-24: Chỉ thị về tổ chức đón tết Ất Dậu năm 2005 (không nêu ngày nghỉ)',
             'https://vanban.chinhphu.vn/?pageid=27160&docid=13666'),
            ("UBND TP.HCM (qua báo SGGP) 2004-12-22: SGGP 22/12/2004: 'Làm việc 40 giờ/tuần được nghỉ bù Tết Dương lịch thêm ngày 3-1-2005' (thông báo UBND TPHCM)",
             'https://www.sggp.org.vn/lam-viec-40-giotuan-duoc-nghi-bu-tet-duong-lich-them-ngay-3-1-2005-post39767.html'),
            ('UBND tỉnh Khánh Hòa (qua Báo Khánh Hòa) 2004-12-22: Báo Khánh Hòa 22/12/2004: Thông báo về việc treo cờ Tổ quốc và nghỉ Tết Dương lịch năm 2005 (UBND tỉnh Khánh Hòa: nghỉ 1/1–3/1/2005)',
             'https://baokhanhhoa.vn/xa-hoi/200412/thong-bao-ve-viec-treo-co-to-quoc-va-nghi-tet-duong-lich-nam-2005-1812098/'),
        ],
        "days": [
            ('2005-01-01', 'Tết Dương lịch (thứ bảy)', 'le'),
            ('2005-01-03', 'nghỉ bù Tết Dương lịch', 'bu'),
            ('2005-02-08', 'Tết Nguyên đán (30 tháng Chạp)', 'le'),
            ('2005-02-09', 'Tết Nguyên đán (mùng 1)', 'le'),
            ('2005-02-10', 'Tết Nguyên đán (mùng 2)', 'le'),
            ('2005-02-11', 'Tết Nguyên đán (mùng 3)', 'le'),
            ('2005-04-30', 'Ngày Chiến thắng (thứ bảy)', 'le'),
            ('2005-05-01', 'Quốc tế Lao động (chủ nhật)', 'le'),
            ('2005-05-02', 'nghỉ bù 30/4 (CHƯA XÁC MINH bằng văn bản)', 'bu'),
            ('2005-05-03', 'nghỉ bù 1/5 (CHƯA XÁC MINH bằng văn bản)', 'bu'),
            ('2005-09-02', 'Quốc khánh', 'le'),
        ],
        "working": [],
    },
    2006: {
        "sources": [
            ('01/CT.UBND UBND tỉnh Vĩnh Long 2006-01-05: Chỉ thị về việc tổ chức đón Tết Nguyên Đán Bính Tuất 2006 (CBCCVC nghỉ Tết 06 ngày 28/01–02/02/2006)',
             'https://vinhlong.gov.vn/Portals/1027/VanBan/2006/012006CT.doc'),
            ("UBND TP.HCM (qua báo SGGP) 2006-01-14: SGGP 14/01/2006: 'Treo cờ Tổ quốc và nghỉ Tết Nguyên đán Bính Tuất năm 2006' (UBND TPHCM: nghỉ 28–31/1; 40h/5 ngày nghỉ bù 1 và 2/2)",
             'https://www.sggp.org.vn/treo-co-to-quoc-va-nghi-tet-nguyen-dan-binh-tuat-nam-2006-post51017.html'),
            ("UBND TP.HCM (qua Dân trí) 2006-01-13: Dân trí 13/01/2006: 'Treo cờ Tổ quốc và nghỉ Tết âm lịch 4 ngày' (same TPHCM notice)",
             'https://dantri.com.vn/thoi-su/treo-co-to-quoc-va-nghi-tet-am-lich-4-ngay-1137153930.htm'),
            ("UBND TP.HCM (qua Tiền Phong) 2005-12-23: Tiền Phong 23/12/2005: 'Nghỉ bù tết dương lịch vào ngày 2/1' (UBND TPHCM)",
             'https://tienphong.vn/nghi-bu-tet-duong-lich-vao-ngay-21-post32852.tpo'),
            ("01/CT-UBND UBND tỉnh Lạng Sơn 2006-01-13: Chỉ thị về tổ chức đón tết Bính Tuất - năm 2006 (CONFLICTING: 'nghỉ năm ngày ... 28/01 đến hết 01/02/2006')",
             'https://vanban.chinhphu.vn/?pageid=27160&docid=15562'),
        ],
        "days": [
            ('2006-01-01', 'Tết Dương lịch (chủ nhật)', 'le'),
            ('2006-01-02', 'nghỉ bù Tết Dương lịch', 'bu'),
            ('2006-01-28', 'Tết Nguyên đán (29 tháng Chạp, thứ bảy)', 'le'),
            ('2006-01-29', 'Tết Nguyên đán (mùng 1, chủ nhật)', 'le'),
            ('2006-01-30', 'Tết Nguyên đán (mùng 2)', 'le'),
            ('2006-01-31', 'Tết Nguyên đán (mùng 3)', 'le'),
            ('2006-02-01', 'nghỉ bù Tết (mùng 4)', 'bu'),
            ('2006-02-02', 'nghỉ bù Tết (mùng 5)', 'bu'),
            ('2006-04-30', 'Ngày Chiến thắng (chủ nhật)', 'le'),
            ('2006-05-01', 'Quốc tế Lao động', 'le'),
            ('2006-05-02', 'nghỉ bù 30/4 (CHƯA XÁC MINH bằng văn bản)', 'bu'),
            ('2006-09-02', 'Quốc khánh (thứ bảy)', 'le'),
            ('2006-09-04', 'nghỉ bù Quốc khánh (CHƯA XÁC MINH bằng văn bản)', 'bu'),
        ],
        "working": [],
    },
    2007: {
        "sources": [
            ('01/2007/CT-UBND UBND tỉnh Tiền Giang 2007-01-10: Về việc tổ chức Tết Đinh Hợi năm 2007 (mục 15: nghỉ 16/02–21/02/2007, 29 tháng Chạp Bính Tuất đến hết mùng 5, tính cả ngày nghỉ bù thứ bảy và chủ nhật)',
             'https://vanban.chinhphu.vn/?pageid=27160&docid=19720'),
            ('01/2007/CT-TTg Thủ tướng Chính phủ 2007-01-09: Về việc tổ chức đón Tết Đinh Hợi năm 2007 (không nêu ngày nghỉ)',
             'https://vanban.chinhphu.vn/?pageid=27160&docid=19655'),
            ('84/2007/QH11 Quốc hội 2007-04-02: Luật sửa đổi, bổ sung Điều 73 BLLĐ (thêm Giỗ Tổ Hùng Vương 10/3 âm lịch; hiệu lực 11/4/2007)',
             'https://vanban.chinhphu.vn/default.aspx?pageid=27160&docid=80046'),
            ("Bộ LĐTBXH (qua báo Người Lao Động) 2007-04-18: NLĐ 18/04/2007: 'Được phép nghỉ ngày Giỗ Tổ Hùng Vương từ năm nay' — Bộ LĐTBXH đề nghị bố trí nghỉ; năm nay Giỗ Tổ nhằm 26-4",
             'https://tuoitre.vn/nld/thoi-su-trong-nuoc/duoc-phep-nghi-ngay-gio-to-hung-vuong-tu-nam-nay-186560.htm'),
        ],
        "days": [
            ('2007-01-01', 'Tết Dương lịch', 'le'),
            ('2007-02-16', 'Tết Nguyên đán (29 tháng Chạp, ngày cuối năm Bính Tuất)', 'le'),
            ('2007-02-17', 'Tết Nguyên đán (mùng 1, thứ bảy)', 'le'),
            ('2007-02-18', 'Tết Nguyên đán (mùng 2, chủ nhật)', 'le'),
            ('2007-02-19', 'Tết Nguyên đán (mùng 3)', 'le'),
            ('2007-02-20', 'nghỉ bù Tết (mùng 4)', 'bu'),
            ('2007-02-21', 'nghỉ bù Tết (mùng 5)', 'bu'),
            ('2007-04-26', 'Giỗ Tổ Hùng Vương (10/3 âm lịch) – lần đầu', 'le'),
            ('2007-04-30', 'Ngày Chiến thắng', 'le'),
            ('2007-05-01', 'Quốc tế Lao động', 'le'),
            ('2007-09-02', 'Quốc khánh (chủ nhật)', 'le'),
            ('2007-09-03', 'nghỉ bù Quốc khánh (CHƯA XÁC MINH bằng văn bản)', 'bu'),
        ],
        "working": [],
    },
    2008: {
        "sources": [
            ('UBND TP Đà Nẵng 2007-12-19: Thông báo về việc treo cờ và nghỉ lễ Tết dương lịch 2008 (UBND TP Đà Nẵng, đăng lại trên Cổng TTĐT Chính phủ)',
             'https://baochinhphu.vn/thong-bao-ve-viec-treo-co-va-nghi-le-tet-duong-lich-2008-10239253.htm'),
        ],
        "days": [
            ('2008-01-01', 'Tết Dương lịch', 'le'),
            ('2008-02-06', 'Tết Nguyên đán (30 tháng Chạp)', 'le'),
            ('2008-02-07', 'Tết Nguyên đán (mùng 1)', 'le'),
            ('2008-02-08', 'Tết Nguyên đán (mùng 2)', 'le'),
            ('2008-02-09', 'Tết Nguyên đán (mùng 3, trùng thứ Bảy)', 'le'),
            ('2008-02-11', 'Nghỉ bù mùng 3 Tết (thứ Bảy 09/02)', 'bu'),
            ('2008-04-15', 'Giỗ Tổ Hùng Vương (10/3 âm lịch)', 'le'),
            ('2008-04-30', 'Ngày Chiến thắng', 'le'),
            ('2008-05-01', 'Ngày Quốc tế Lao động', 'le'),
            ('2008-09-02', 'Quốc khánh', 'le'),
        ],
        "working": [],
    },
    2009: {
        "sources": [
            ('UBND tỉnh Đồng Nai 2009-01 (posted 2011-07-20 on portal): Lunar New Year holiday announcement 2009 (UBND tỉnh Đồng Nai thông báo nghỉ Tết Kỷ Sửu)',
             'https://dongnai.gov.vn/en/news/Administrative-news/lunar-new-year-holiday-announcement-2009-1756.html'),
        ],
        "days": [
            ('2009-01-01', 'Tết Dương lịch', 'le'),
            ('2009-01-25', 'Tết Nguyên đán (30 tháng Chạp, trùng Chủ nhật)', 'le'),
            ('2009-01-26', 'Tết Nguyên đán (mùng 1)', 'le'),
            ('2009-01-27', 'Tết Nguyên đán (mùng 2)', 'le'),
            ('2009-01-28', 'Tết Nguyên đán (mùng 3)', 'le'),
            ('2009-01-29', 'Nghỉ bù 30 Tết (Chủ nhật 25/01)', 'bu'),
            ('2009-04-04', 'Giỗ Tổ Hùng Vương (10/3 âm lịch, trùng thứ Bảy)', 'le'),
            ('2009-04-06', 'Nghỉ bù Giỗ Tổ Hùng Vương', 'bu'),
            ('2009-04-30', 'Ngày Chiến thắng', 'le'),
            ('2009-05-01', 'Ngày Quốc tế Lao động', 'le'),
            ('2009-09-02', 'Quốc khánh', 'le'),
        ],
        "working": [],
    },
    2010: {
        "sources": [
            ('872/VPCP-KGVX Văn phòng Chính phủ (ý kiến Thủ tướng; ký: BT,CN Nguyễn Xuân Phúc) 2010-02-05: Công văn V/v hoán đổi ngày nghỉ vào dịp tết âm lịch 2010 đối với cán bộ, công chức, viên chức',
             'https://moit.gov.vn/van-ban-phap-luat/van-ban-dieu-hanh/-cong-van-ve-viec-hoan-doi-ngay-nghi-vao-dip-tet-am-lich-201.html (scan: https://moit.gov.vn/upload/2005517/20210623/872-VPCP-KGVX.pdf)'),
            ('410/TB-LĐTBXH Bộ LĐTBXH 2010-02 (unverified): Thông báo về việc nghỉ làm việc ngày thứ sáu 19/02/2010 và làm việc bù thứ bảy 27/02/2010 (number from a luatvietnam listing; text NOT fetched)',
             'https://luatvietnam.vn/lao-dong/thong-bao-410-tb-ldtbxh-bo-lao-dong-thuong-binh-va-xa-hoi-49878-d6.html'),
            ('Cổng TTĐT Chính phủ 2010-02-05: Nghỉ Tết Canh Dần tới 9 ngày (Cổng TTĐT Chính phủ)',
             'https://baochinhphu.vn/nghi-tet-canh-dan-toi-9-ngay-10231132.htm'),
            ('UBND TP Cần Thơ 2010-02 (portal date 25/10/2010): Thông báo thời gian nghỉ ... Tết Nguyên đán Canh Dần năm 2010 (UBND TP Cần Thơ)',
             'https://baochinhphu.vn/thong-bao-ve-viec-treo-co-to-quoc-thoi-gian-nghi-va-truc-trong-dip-tet-nguyen-dan-canh-dan-nam-2010-10242940.htm'),
            ('UBND tỉnh Đồng Nai 2009-12: Day-off ... on occasion of New Year Day 2010 (UBND tỉnh Đồng Nai)',
             'https://dongnai.gov.vn/en/news/Our-activities/day-off-and-national-flag-hanging-on-occasion-of-new-year-day-940.html'),
            ('UBND TP Cần Thơ 2010-04-08: Thông báo thời gian nghỉ dịp Giỗ Tổ Hùng Vương, 30/4 và 1/5/2010 (UBND TP Cần Thơ)',
             'https://baochinhphu.vn/thong-bao-ve-viec-treo-co-to-quoc-thoi-gian-nghi-va-truc-trong-dip-le-gio-to-hung-vuong-ngay-mien-nam-hoan-toan-giai-phong-va-ngay-quoc-te-lao-dong-10241897.htm'),
            ('5971/VPCP-KGVX (+ thông báo BLĐTBXH ngày 25/8/2010, số chưa rõ) Văn phòng Chính phủ / Bộ LĐTBXH 2010-08-25: Hoán đổi ngày nghỉ dịp Quốc khánh 2/9 (Bộ LĐTBXH thông báo theo văn bản 5971/VPCP-KGVX)',
             'https://baochinhphu.vn/hoan-doi-ngay-nghi-dip-quoc-khanh-2-9-10236510.htm'),
            ('Sở GDĐT Hà Nội (via Cổng TTĐT CP) 2010-09-29: Các trường nơi diễn ra Đại lễ được nghỉ học (Hà Nội, schools only)',
             'https://baochinhphu.vn/cac-truong-noi-dien-ra-dai-le-duoc-nghi-hoc-10237572.htm'),
        ],
        "days": [
            ('2010-01-01', 'Tết Dương lịch', 'le'),
            ('2010-02-13', 'Tết Nguyên đán (30 tháng Chạp, trùng thứ Bảy)', 'le'),
            ('2010-02-14', 'Tết Nguyên đán (mùng 1, trùng Chủ nhật)', 'le'),
            ('2010-02-15', 'Tết Nguyên đán (mùng 2)', 'le'),
            ('2010-02-16', 'Tết Nguyên đán (mùng 3)', 'le'),
            ('2010-02-17', 'Nghỉ bù 30 Tết (thứ Bảy 13/02)', 'bu'),
            ('2010-02-18', 'Nghỉ bù mùng 1 Tết (Chủ nhật 14/02)', 'bu'),
            ('2010-02-19', 'Nghỉ hoán đổi (mùng 6 Tết), làm bù thứ Bảy 27/02', 'doi'),
            ('2010-04-23', 'Giỗ Tổ Hùng Vương (10/3 âm lịch)', 'le'),
            ('2010-04-30', 'Ngày Chiến thắng', 'le'),
            ('2010-05-01', 'Ngày Quốc tế Lao động (trùng thứ Bảy)', 'le'),
            ('2010-05-03', 'Nghỉ bù Quốc tế Lao động', 'bu'),
            ('2010-09-02', 'Quốc khánh', 'le'),
            ('2010-09-03', 'Nghỉ hoán đổi (thứ Sáu), làm bù thứ Bảy 11/09', 'doi'),
        ],
        "working": [('2010-02-27', 'Làm bù cho ngày nghỉ hoán đổi 19/02 (Tết Canh Dần) - CV 872/VPCP-KGVX'), ('2010-09-11', 'Làm bù cho ngày nghỉ hoán đổi 03/09 (Quốc khánh) - CV 5971/VPCP-KGVX')],
    },
    2011: {
        "sources": [
            ('9529/VPCP-KGVX Văn phòng Chính phủ 2010-12-31: Công văn V/v hoán đổi ngày nghỉ vào dịp Tết Âm lịch và Giỗ Tổ Hùng Vương năm 2011 đối với cán bộ, công chức, viên chức',
             'https://baochinhphu.vn/hoan-doi-ngay-nghi-vao-dip-tet-nguyen-dan-tan-mao-va-gio-to-hung-vuong-nam-2011-doi-voi-can-bo-cong-chuc-vien-chuc-10256468.htm'),
            ('24/TB-BLĐTBXH Bộ LĐTBXH 2011-01-06: Thông báo về việc hoán đổi ngày nghỉ hàng tuần vào dịp Tết Âm lịch và Giỗ Tổ Hùng Vương năm 2011',
             'https://baochinhphu.vn/lich-nghi-tet-am-lich-va-gio-to-hung-vuong-nam-2011-10258360.htm'),
            ('Bộ LĐTBXH (Văn phòng) 2011-04-05: Công văn v/v hoán đổi ngày nghỉ vào dịp Giỗ Tổ Hùng Vương năm 2011 (restates TB 24/TB-BLĐTBXH)',
             'https://baochinhphu.vn/cong-van-v-v-hoan-doi-ngay-nghi-vao-dip-gio-to-hung-vuong-nam-2011-10270089.htm'),
            ('Cổng TTĐT Hà Nội 2011-04-06: Hoán đổi ngày nghỉ vào dịp Giỗ Tổ Hùng Vương (Hà Nội portal)',
             'https://baochinhphu.vn/hoan-doi-ngay-nghi-vao-dip-gio-to-hung-vuong-10270450.htm'),
            ('UBND TP Cần Thơ 2011-01-18: Thông báo thời gian nghỉ Tết Nguyên đán Tân Mão năm 2011 (UBND TP Cần Thơ)',
             'https://baochinhphu.vn/thong-bao-thoi-gian-nghi-tet-nguyen-dan-tan-mao-nam-2011-10258272.htm'),
            ('UBND tỉnh Đồng Nai 2010-12-27: Thông báo nghỉ Tết Dương lịch năm 2011 (UBND tỉnh Đồng Nai)',
             'https://baochinhphu.vn/thong-bao-nghi-tet-duong-lich-nam-2011-10254929.htm'),
            ('UBND TP Hồ Chí Minh 2010-12-24: TP. Hồ Chí Minh thông báo việc nghỉ bù tết Dương lịch',
             'https://baochinhphu.vn/tp-ho-chi-minh-thong-bao-viec-nghi-bu-tet-duong-lich-10254270.htm'),
            ('UBND tỉnh Đồng Nai 2011-04-25: Nghỉ lễ và treo cờ dịp lễ 30-4 và 1-5 (UBND tỉnh Đồng Nai)',
             'https://baochinhphu.vn/nghi-le-va-treo-co-dip-le-30-4-va-1-5-10273705.htm'),
            ('114/TB-UBND UBND tỉnh Kon Tum 2011-04-22: Thông báo v/v treo cờ Tổ quốc, khẩu hiệu và nghỉ lễ 30/4 và 1/5',
             'https://baochinhphu.vn/thong-bao-ve-viec-treo-co-to-quoc-khau-hieu-va-nghi-le-30-4-va-1-5-10274722.htm'),
            ('UBND TP Hồ Chí Minh 2011-08-17: Nghỉ Lễ và treo cờ ... Quốc khánh 2/9 năm 2011 (UBND TPHCM)',
             'https://baochinhphu.vn/nghi-le-va-treo-co-to-quoc-nhan-ky-niem-lan-thu-66-cach-mang-thang-tam-va-quoc-khanh-2-9-10299446.htm'),
            ('UBND tỉnh Đồng Nai 2011-08-26: Nghỉ lễ và treo cờ ngày 02-9 (UBND tỉnh Đồng Nai)',
             'https://baochinhphu.vn/nghi-le-va-treo-co-ngay-02-9-102100936.htm'),
        ],
        "days": [
            ('2011-01-01', 'Tết Dương lịch (trùng thứ Bảy)', 'le'),
            ('2011-01-03', 'Nghỉ bù Tết Dương lịch', 'bu'),
            ('2011-01-31', 'Nghỉ hoán đổi (28 tháng Chạp), làm bù thứ Bảy 29/01', 'doi'),
            ('2011-02-01', 'Nghỉ hoán đổi (29 tháng Chạp), làm bù Chủ nhật 30/01', 'doi'),
            ('2011-02-02', 'Tết Nguyên đán (30 tháng Chạp)', 'le'),
            ('2011-02-03', 'Tết Nguyên đán (mùng 1)', 'le'),
            ('2011-02-04', 'Tết Nguyên đán (mùng 2)', 'le'),
            ('2011-02-05', 'Tết Nguyên đán (mùng 3, trùng thứ Bảy)', 'le'),
            ('2011-02-07', 'Nghỉ bù mùng 3 Tết (thứ Bảy 05/02)', 'bu'),
            ('2011-04-11', 'Nghỉ hoán đổi (thứ Hai), làm bù thứ Bảy 09/04', 'doi'),
            ('2011-04-12', 'Giỗ Tổ Hùng Vương (10/3 âm lịch)', 'le'),
            ('2011-04-30', 'Ngày Chiến thắng (trùng thứ Bảy)', 'le'),
            ('2011-05-01', 'Ngày Quốc tế Lao động (trùng Chủ nhật)', 'le'),
            ('2011-05-02', 'Nghỉ bù Ngày Chiến thắng', 'bu'),
            ('2011-05-03', 'Nghỉ bù Ngày Quốc tế Lao động', 'bu'),
            ('2011-09-02', 'Quốc khánh', 'le'),
        ],
        "working": [('2011-01-29', 'Làm bù cho nghỉ hoán đổi 31/01 (Tết Tân Mão)'), ('2011-01-30', 'Làm bù (Chủ nhật) cho nghỉ hoán đổi 01/02 (Tết Tân Mão)'), ('2011-04-09', 'Làm bù cho nghỉ hoán đổi 11/04 (Giỗ Tổ)')],
    },
    2012: {
        "sources": [
            ('UBND TP Hồ Chí Minh 2011-12-16: Thông báo về nghỉ Tết Dương Lịch năm 2012 (UBND TPHCM)',
             'https://baochinhphu.vn/thong-bao-ve-nghi-tet-duong-lich-nam-2012-102112637.htm'),
            ("UBND tỉnh Đồng Nai 2011-12-09: Thông báo về việc nghỉ Tết Dương lịch 2012 (UBND tỉnh Đồng Nai; text has typo '2/2/2012' for 2/1/2012)",
             'https://baochinhphu.vn/thong-bao-ve-viec-nghi-tet-duong-lich-102112020.htm'),
            ('Bộ LĐTBXH 2011-11-29: Đề nghị hoán đổi ngày nghỉ hàng tuần vào dịp nghỉ lễ, tết năm 2012 (tờ trình BLĐTBXH)',
             'https://baochinhphu.vn/de-nghi-hoan-doi-ngay-nghi-hang-tuan-vao-dip-nghi-le-tet-nam-2012-doi-voi-can-bo-cong-chuc-vien-chuc-102110995.htm'),
            ('9197/VPCP-KGVX Văn phòng Chính phủ 2011-12-27: Công văn V/v hoán đổi ngày nghỉ vào dịp Tết âm lịch năm 2012 đối với cán bộ, công chức, viên chức',
             'https://baochinhphu.vn/hoan-doi-ngay-nghi-vao-dip-tet-am-lich-nam-2012-doi-voi-can-bo-cong-chuc-vien-chuc-102113721.htm'),
            ('Cổng TTĐT CP 2011-12-28: Công chức, viên chức nghỉ Tết nguyên đán Nhâm thìn 9 ngày',
             'https://baochinhphu.vn/cong-chuc-vien-chuc-nghi-tet-nguyen-dan-nham-thin-9-ngay-102113684.htm'),
            ('UBND TP Hà Nội 2012-01-17: Thông báo về thời gian nghỉ Tết Nguyên đán Nhâm Thìn năm 2012 (UBND TP Hà Nội)',
             'https://baochinhphu.vn/thong-bao-ve-thoi-gian-nghi-tet-nguyen-dan-nham-thin-nam-2012-102116067.htm'),
        ],
        "days": [
            ('2012-01-01', 'Tết Dương lịch (trùng Chủ nhật)', 'le'),
            ('2012-01-02', 'Nghỉ bù Tết Dương lịch', 'bu'),
            ('2012-01-22', 'Tết Nguyên đán (ngày cuối năm, 29 tháng Chạp, trùng Chủ nhật)', 'le'),
            ('2012-01-23', 'Tết Nguyên đán (mùng 1)', 'le'),
            ('2012-01-24', 'Tết Nguyên đán (mùng 2)', 'le'),
            ('2012-01-25', 'Tết Nguyên đán (mùng 3)', 'le'),
            ('2012-01-26', 'Nghỉ bù ngày cuối năm (Chủ nhật 22/01)', 'bu'),
            ('2012-01-27', 'Nghỉ hoán đổi (thứ Sáu), làm bù thứ Bảy 04/02', 'doi'),
            ('2012-03-31', 'Giỗ Tổ Hùng Vương (10/3 âm lịch, trùng thứ Bảy)', 'le'),
            ('2012-04-02', 'Nghỉ bù Giỗ Tổ Hùng Vương (COMPUTED, unverified)', 'bu'),
            ('2012-04-30', 'Ngày Chiến thắng', 'le'),
            ('2012-05-01', 'Ngày Quốc tế Lao động', 'le'),
            ('2012-09-02', 'Quốc khánh (trùng Chủ nhật)', 'le'),
            ('2012-09-03', 'Nghỉ bù Quốc khánh (from search snippet of Bộ Tư pháp notice 27/08/2012, not fetched)', 'bu'),
            ('2012-12-31', 'Nghỉ hoán đổi dịp Tết Dương lịch 2013 (làm bù thứ Bảy 05/01/2013)', 'doi'),
        ],
        "working": [('2012-02-04', 'Làm bù cho nghỉ hoán đổi 27/01 (Tết Nhâm Thìn) - CV 9197/VPCP-KGVX')],
    },
    2013: {
        "sources": [
            ('9570/VPCP-KGVX Văn phòng Chính phủ 2012-11-23 — Công văn về việc hoán đổi ngày nghỉ hằng tuần vào các dịp nghỉ lễ, tết năm 2013 (cited in TB 4606)', None),
            ('4606/TB-BLĐTBXH Bộ LĐTBXH 2012-12-07: Thông báo về việc hoán đổi ngày nghỉ hằng tuần vào các dịp nghỉ lễ, tết năm 2013 (English translation on hethongphapluat.com, part of item 3 paywalled)',
             'https://hethongphapluat.com/announcement-no-4606-tb-bldtbxh-of-december-07-2012-swapping-the-weekends-during-holidays-2013.html'),
            ('Cổng TTĐT CP 2012-11-23: Hoán đổi ngày nghỉ Tết Dương lịch, Tết Nguyên đán 2013 (Cổng TTĐT CP; covers TDL, Tết, 30/4-1/5)',
             'https://baochinhphu.vn/hoan-doi-ngay-nghi-tet-duong-lich-tet-nguyen-dan-2013-102134929.htm'),
        ],
        "days": [
            ('2013-01-01', 'Tết Dương lịch', 'le'),
            ('2013-02-09', 'Tết Nguyên đán (ngày cuối năm, 29 tháng Chạp, trùng thứ Bảy)', 'le'),
            ('2013-02-10', 'Tết Nguyên đán (mùng 1, trùng Chủ nhật)', 'le'),
            ('2013-02-11', 'Tết Nguyên đán (mùng 2)', 'le'),
            ('2013-02-12', 'Tết Nguyên đán (mùng 3)', 'le'),
            ('2013-02-13', 'Nghỉ bù ngày cuối năm (thứ Bảy 09/02)', 'bu'),
            ('2013-02-14', 'Nghỉ bù mùng 1 (Chủ nhật 10/02)', 'bu'),
            ('2013-02-15', 'Nghỉ hoán đổi (mùng 6), làm bù thứ Bảy 23/02', 'doi'),
            ('2013-04-19', 'Giỗ Tổ Hùng Vương (10/3 âm lịch)', 'le'),
            ('2013-04-29', 'Nghỉ hoán đổi (thứ Hai), làm bù thứ Bảy 04/05', 'doi'),
            ('2013-04-30', 'Ngày Chiến thắng', 'le'),
            ('2013-05-01', 'Ngày Quốc tế Lao động', 'le'),
            ('2013-09-02', 'Quốc khánh', 'le'),
        ],
        "working": [('2013-01-05', 'Làm bù cho nghỉ hoán đổi 31/12/2012 (Tết Dương lịch 2013)'), ('2013-02-23', 'Làm bù cho nghỉ hoán đổi 15/02 (Tết Quý Tỵ)'), ('2013-05-04', 'Làm bù cho nghỉ hoán đổi 29/04 (30/4-1/5)')],
    },
    2014: {
        "sources": [
            ('10525/VPCP-KGVX Văn phòng Chính phủ (ký: PCN Nguyễn Khắc Định) 2013-12-12: Công văn V/v nghỉ Tết Âm lịch và hoán đổi ngày nghỉ hằng tuần vào các dịp nghỉ lễ năm 2014 đối với CBCCVC (English translation)',
             'https://hethongphapluat.com/official-dispatch-no-10525-vpcp-kgvx-of-december-12-2013-on-leave-days-of-lunar-new-year-and-shift-of-weekends-in-occasions-of-public-holidays-in-2014-for-cadres-civil-servants-public-employees.html'),
            ('5083/TB-BLĐTBXH Bộ LĐTBXH (BT Phạm Thị Hải Chuyền) 2013-12-23: Thông báo về việc nghỉ Tết Âm lịch và hoán đổi ngày nghỉ hằng tuần vào các dịp nghỉ lễ năm 2014 (full Vietnamese text)',
             'https://hethongphapluat.com/announcement-no-5083-tb-bldtbxh-dated-december-23-2013-days-off-during-tet-holiday-and-swapping-of-days-off-during-public-holidays-in-2014.html'),
            ("Cổng TTĐT CP 2013-12-13: Hoán đổi ngày nghỉ Tết Nguyên đán, các dịp lễ 2014 (Cổng TTĐT CP; contains typo '26/4/2013' for 26/4/2014)",
             'https://baochinhphu.vn/hoan-doi-ngay-nghi-tet-nguyen-dan-cac-dip-le-2014-102155503.htm'),
            ('Bộ LĐTBXH - Cục An toàn lao động 2013-12-19: Người làm trong doanh nghiệp, nghỉ Tết bao nhiêu ngày? (Cục ATLĐ answer)',
             'https://baochinhphu.vn/nguoi-lam-trong-doanh-nghiep-nghi-tet-bao-nhieu-ngay-102155926.htm'),
        ],
        "days": [
            ('2014-01-01', 'Tết Dương lịch', 'le'),
            ('2014-01-28', 'Nghỉ hoán đổi (28 tháng Chạp), làm bù thứ Bảy 25/01', 'doi'),
            ('2014-01-29', 'Nghỉ hoán đổi (29 tháng Chạp), làm bù thứ Bảy 08/02', 'doi'),
            ('2014-01-30', 'Tết Nguyên đán (30 tháng Chạp)', 'le'),
            ('2014-01-31', 'Tết Nguyên đán (mùng 1)', 'le'),
            ('2014-02-01', 'Tết Nguyên đán (mùng 2, trùng thứ Bảy)', 'le'),
            ('2014-02-02', 'Tết Nguyên đán (mùng 3, trùng Chủ nhật)', 'le'),
            ('2014-02-03', 'Tết Nguyên đán (mùng 4)', 'le'),
            ('2014-02-04', 'Nghỉ bù Tết (thứ Bảy 01/02) - label inferred', 'bu'),
            ('2014-02-05', 'Nghỉ bù Tết (Chủ nhật 02/02) - label inferred', 'bu'),
            ('2014-04-09', 'Giỗ Tổ Hùng Vương (10/3 âm lịch)', 'le'),
            ('2014-04-30', 'Ngày Chiến thắng', 'le'),
            ('2014-05-01', 'Ngày Quốc tế Lao động', 'le'),
            ('2014-05-02', 'Nghỉ hoán đổi (thứ Sáu), làm bù thứ Bảy 26/04', 'doi'),
            ('2014-09-01', 'Nghỉ hoán đổi (thứ Hai), làm bù thứ Bảy 06/09', 'doi'),
            ('2014-09-02', 'Quốc khánh', 'le'),
        ],
        "working": [('2014-01-25', 'Làm bù cho nghỉ hoán đổi 28/01 (Tết Giáp Ngọ)'), ('2014-02-08', 'Làm bù cho nghỉ hoán đổi 29/01 (Tết Giáp Ngọ)'), ('2014-04-26', 'Làm bù cho nghỉ hoán đổi 02/05 (30/4-1/5)'), ('2014-09-06', 'Làm bù cho nghỉ hoán đổi 01/09 (Quốc khánh)')],
    },
    2015: {
        "sources": [
            ('89/NQ-CP Chính phủ 2014-12-05: Nghị quyết phiên họp Chính phủ thường kỳ tháng 11/2014, mục 2: hoán đổi ngày nghỉ hằng tuần dịp lễ, Tết 2015 (bản tiếng Anh chính thức VGP)',
             'https://en.baochinhphu.vn/the-governments-regular-meeting-november-2014-11122046.htm'),
            ('Báo Điện tử Chính phủ (VGP) 2014-12-01: PM decides length of key holidays (VGP news, 01/12/2014)',
             'https://en.baochinhphu.vn/pm-decides-length-of-key-holidays-11121853.htm'),
            ('4724/TB-LĐTBXH Bộ LĐTBXH 2014-12-11: Thông báo về việc hoán đổi ngày nghỉ, ngày đi làm bù các dịp nghỉ lễ, Tết năm 2015 (cited; text quoted verbatim in BHXH VN CV 5152/BHXH-VP 23/12/2014)',
             'https://web.archive.org/web/20250908205928/https://luatvietnam.vn/lao-dong/cong-van-5152-bhxh-vp-2014-hoan-doi-ngay-nghi-ngay-di-lam-bu-cac-dip-le-tet-nam-2015-320163-d6.html'),
            ('baodautu.vn (Bộ KH&ĐT) 2015-08: Lịch nghỉ lễ 2/9/2015: 2/9 rơi vào thứ Tư, chỉ nghỉ 1 ngày, không hoán đổi (báo Đầu tư, corroboration only)',
             'https://baodautu.vn/lich-nghi-le-29-va-cac-dia-diem-ban-phao-hoa-mung-quoc-khanh-d31737.html'),
        ],
        "days": [
            ('2015-01-01', 'Tết Dương lịch', 'le'),
            ('2015-01-02', 'Nghỉ hoán đổi (làm bù thứ Bảy 27/12/2014)', 'doi'),
            ('2015-02-16', '28 tháng Chạp – nghỉ hoán đổi (làm bù thứ Bảy 14/2)', 'doi'),
            ('2015-02-17', 'Tết Nguyên đán (29 tháng Chạp)', 'le'),
            ('2015-02-18', 'Tết Nguyên đán (30 tháng Chạp, giao thừa)', 'le'),
            ('2015-02-19', 'Tết Nguyên đán (mùng 1)', 'le'),
            ('2015-02-20', 'Tết Nguyên đán (mùng 2)', 'le'),
            ('2015-02-21', 'Tết Nguyên đán (mùng 3, thứ Bảy)', 'le'),
            ('2015-02-23', 'mùng 5 – nghỉ bù cho mùng 3 trùng thứ Bảy (derived)', 'bu'),
            ('2015-04-28', 'Giỗ Tổ Hùng Vương (10/3 âm lịch)', 'le'),
            ('2015-04-29', 'Nghỉ hoán đổi (làm bù thứ Bảy 25/4)', 'doi'),
            ('2015-04-30', 'Ngày Chiến thắng', 'le'),
            ('2015-05-01', 'Ngày Quốc tế Lao động', 'le'),
            ('2015-09-02', 'Quốc khánh', 'le'),
        ],
        "working": [('2014-12-27', '(năm 2014) làm bù cho 02/01/2015 – theo NQ 89/NQ-CP và TB 4724/TB-LĐTBXH'), ('2015-02-14', 'làm bù cho 16/02/2015 (28 tháng Chạp)'), ('2015-04-25', 'làm bù cho 29/04/2015')],
    },
    2016: {
        "sources": [
            ('79/NQ-CP Chính phủ 2015-11-04: Nghị quyết phiên họp Chính phủ thường kỳ tháng 10/2015, mục 5: lịch nghỉ Tết 2016 (bản tiếng Anh chính thức VGP)',
             'https://en.baochinhphu.vn/the-governments-regular-meeting-october-2015-11124543.htm'),
            ("4659/TB-LĐTBXH Bộ LĐTBXH 2015-11-13: Thông báo về việc nghỉ lễ, tết năm 2016 (as reported by Chinhphu.vn 19/11/2015 'Lịch nghỉ lễ, tết năm 2016')",
             'https://baochinhphu.vn/lich-nghi-le-tet-nam-2016-102193901.htm'),
            ("Báo Điện tử Chính phủ 2015-10-30: Tết Âm lịch 2016 được nghỉ 9 ngày (Chinhphu.vn 30/10/2015: 'không thực hiện hoán đổi ngày nghỉ hằng tuần')",
             'https://baochinhphu.vn/tet-am-lich-2016-duoc-nghi-9-ngay-102192887.htm'),
            ('baodautu.vn 2016-04: Giỗ tổ Hùng Vương và ngày lễ 30/4 - 1/5 được nghỉ mấy ngày? (báo Đầu tư, citing Bộ LĐTBXH; corroboration)',
             'https://baodautu.vn/gio-to-hung-vuong-va-ngay-le-304---15-duoc-nghi-may-ngay-d40397.html'),
        ],
        "days": [
            ('2016-01-01', 'Tết Dương lịch (thứ Sáu)', 'le'),
            ('2016-02-07', 'Tết Nguyên đán (29 tháng Chạp = giao thừa, Chủ Nhật)', 'le'),
            ('2016-02-08', 'Tết Nguyên đán (mùng 1)', 'le'),
            ('2016-02-09', 'Tết Nguyên đán (mùng 2)', 'le'),
            ('2016-02-10', 'Tết Nguyên đán (mùng 3)', 'le'),
            ('2016-02-11', 'Tết Nguyên đán (mùng 4)', 'le'),
            ('2016-02-12', 'mùng 5 – nghỉ bù cho 07/02 trùng Chủ Nhật', 'bu'),
            ('2016-04-16', 'Giỗ Tổ Hùng Vương (thứ Bảy)', 'le'),
            ('2016-04-18', 'Nghỉ bù Giỗ Tổ Hùng Vương', 'bu'),
            ('2016-04-30', 'Ngày Chiến thắng (thứ Bảy)', 'le'),
            ('2016-05-01', 'Ngày Quốc tế Lao động (Chủ Nhật)', 'le'),
            ('2016-05-02', 'Nghỉ bù Ngày Chiến thắng', 'bu'),
            ('2016-05-03', 'Nghỉ bù Ngày Quốc tế Lao động', 'bu'),
            ('2016-09-02', 'Quốc khánh (thứ Sáu)', 'le'),
        ],
        "working": [],
    },
    2017: {
        "sources": [
            ('9794/VPCP-KGVX Văn phòng Chính phủ (ý kiến Thủ tướng Nguyễn Xuân Phúc) 2016-11-14: V/v nghỉ Tết Âm lịch năm 2017 đối với cán bộ, công chức, viên chức',
             'https://vanban.chinhphu.vn/default.aspx?pageid=27160&docid=187180'),
            ('4699/TB-LĐTBXH Bộ LĐTBXH 2016-11-24: Thông báo về việc nghỉ Tết Âm lịch năm 2017 đối với cán bộ, công chức, viên chức và người lao động',
             'https://web.archive.org/web/2025/https://luatvietnam.vn/lao-dong/thong-bao-4699-tb-ldtbxh-bo-lao-dong-thuong-binh-va-xa-hoi-110630-d6.html'),
            ('Báo Điện tử Chính phủ 2016-11-25: Thông báo nghỉ Tết Âm lịch năm 2017 (Chinhphu.vn 25/11/2016)',
             'https://baochinhphu.vn/thong-bao-nghi-tet-am-lich-nam-2017-102212799.htm'),
            ("Bộ Công Thương (moit.gov.vn) 2016-11-25: Lịch nghỉ tết 2017 (Bộ Công Thương; 'không hoán đổi'; other 2017 holidays per Điều 115 BLLĐ 2012)",
             'https://moit.gov.vn/tin-tuc/hoat-dong/lich-nghi-tet-20172.html'),
            ('Báo Điện tử Chính phủ 2017-04-25: Lịch nghỉ Lễ 30/4 và 1/5 (Chinhphu.vn 25/04/2017: 2/5 nghỉ bù cho 30/4; năm 2017 không hoán đổi)',
             'https://baochinhphu.vn/lich-nghi-le-30-4-va-1-5-102220064.htm'),
            ('Bộ Công Thương 2017-04-28: Lịch nghỉ lễ 30/4 và 1/5 năm 2017 (Bộ Công Thương)',
             'https://moit.gov.vn/tin-tuc/hoat-dong/lich-nghi-le-30-4-va-1-5-nam-20172.html'),
            ('Bộ Công Thương 2017-08-09: Quốc khánh 2/9: Người lao động được nghỉ 3 ngày (Bộ Công Thương 09/08/2017: 2/9 thứ Bảy, nghỉ bù thứ Hai 4/9)',
             'https://moit.gov.vn/tin-tuc/hoat-dong/quoc-khanh-2-9-nguoi-lao-dong-duoc-nghi-3-ngay2.html'),
        ],
        "days": [
            ('2017-01-01', 'Tết Dương lịch (Chủ Nhật)', 'le'),
            ('2017-01-02', 'Nghỉ bù Tết Dương lịch', 'bu'),
            ('2017-01-26', 'Tết Nguyên đán (29 tháng Chạp)', 'le'),
            ('2017-01-27', 'Tết Nguyên đán (30 tháng Chạp)', 'le'),
            ('2017-01-28', 'Tết Nguyên đán (mùng 1, thứ Bảy)', 'le'),
            ('2017-01-29', 'Tết Nguyên đán (mùng 2, Chủ Nhật)', 'le'),
            ('2017-01-30', 'Tết Nguyên đán (mùng 3)', 'le'),
            ('2017-01-31', 'mùng 4 – nghỉ bù cho mùng 1', 'bu'),
            ('2017-02-01', 'mùng 5 – nghỉ bù cho mùng 2', 'bu'),
            ('2017-04-06', 'Giỗ Tổ Hùng Vương (thứ Năm)', 'le'),
            ('2017-04-30', 'Ngày Chiến thắng (Chủ Nhật)', 'le'),
            ('2017-05-01', 'Ngày Quốc tế Lao động', 'le'),
            ('2017-05-02', 'Nghỉ bù Ngày Chiến thắng', 'bu'),
            ('2017-09-02', 'Quốc khánh (thứ Bảy)', 'le'),
            ('2017-09-04', 'Nghỉ bù Quốc khánh', 'bu'),
        ],
        "working": [],
    },
    2018: {
        "sources": [
            ('573/TB-VPCP Văn phòng Chính phủ 2017-12-14: Kết luận của Thủ tướng Chính phủ tại cuộc họp Thường trực Chính phủ về nghỉ lễ, tết năm 2018 của cán bộ, công chức, viên chức',
             'https://vanban.chinhphu.vn/default.aspx?pageid=27160&docid=192234'),
            ('5427/TB-LĐTBXH Bộ LĐTBXH 2017-12-22: Thông báo về nghỉ lễ, tết năm 2018 đối với cán bộ, công chức, viên chức và người lao động (Vietnamese text mirrored on hethongphapluat)',
             'https://hethongphapluat.com/notice-no-5427-tb-ldtbxh-dated-december-22-2017.html'),
            ('Báo Điện tử Chính phủ 2017-12-15: Kết luận của Thủ tướng về nghỉ lễ, tết năm 2018 (Chinhphu.vn 15/12/2017)',
             'https://baochinhphu.vn/ket-luan-cua-thu-tuong-ve-nghi-le-tet-nam-2018-102231860.htm'),
            ('Báo Điện tử Chính phủ 2018-03-09: Lịch nghỉ chính thức dịp Giỗ Tổ Hùng Vương, 30/4 và 1/5 (Chinhphu.vn 09/03/2018)',
             'https://baochinhphu.vn/lich-nghi-chinh-thuc-dip-gio-to-hung-vuong-30-4-va-1-5-102235658.htm'),
            ('6519/VPCP-KGVX Văn phòng Chính phủ 2018-07-11: V/v nghỉ lễ, tết năm 2019 (Tết DL: nghỉ 31/12/2018 – 01/01/2019, làm bù 05/01/2019)',
             'https://vanban.chinhphu.vn/?pageid=27160&docid=194090'),
        ],
        "days": [
            ('2018-01-01', 'Tết Dương lịch (thứ Hai)', 'le'),
            ('2018-02-14', 'Tết Nguyên đán (29 tháng Chạp)', 'le'),
            ('2018-02-15', 'Tết Nguyên đán (30 tháng Chạp)', 'le'),
            ('2018-02-16', 'Tết Nguyên đán (mùng 1)', 'le'),
            ('2018-02-17', 'Tết Nguyên đán (mùng 2, thứ Bảy)', 'le'),
            ('2018-02-18', 'Tết Nguyên đán (mùng 3, Chủ Nhật)', 'le'),
            ('2018-02-19', 'mùng 4 – nghỉ bù cho mùng 2', 'bu'),
            ('2018-02-20', 'mùng 5 – nghỉ bù cho mùng 3', 'bu'),
            ('2018-04-25', 'Giỗ Tổ Hùng Vương (thứ Tư)', 'le'),
            ('2018-04-30', 'Ngày Chiến thắng', 'le'),
            ('2018-05-01', 'Ngày Quốc tế Lao động', 'le'),
            ('2018-09-02', 'Quốc khánh (Chủ Nhật)', 'le'),
            ('2018-09-03', 'Nghỉ bù Quốc khánh', 'bu'),
            ('2018-12-31', 'Nghỉ hoán đổi Tết Dương lịch 2019 (làm bù thứ Bảy 05/01/2019)', 'doi'),
        ],
        "working": [],
    },
    2019: {
        "sources": [
            ('6519/VPCP-KGVX Văn phòng Chính phủ (ý kiến Thủ tướng Nguyễn Xuân Phúc) 2018-07-11: V/v nghỉ lễ, tết năm 2019 đối với cán bộ, công chức, viên chức',
             'https://vanban.chinhphu.vn/?pageid=27160&docid=194090'),
            ('3238/TB-LĐTBXH Bộ LĐTBXH 2018-08-06: Thông báo về nghỉ lễ, tết năm 2019 (English reference translation, excerpt only)',
             'https://english.luatvietnam.vn/announcement-no-3238-tb-ldtbxh-dated-august-06th-2018-of-the-ministry-of-labor-war-invalids-and-social-affairs-regarding-2019s-national-and-tet-hol-165768-Doc6.html'),
            ('luatvietnam.vn 2018: Lịch nghỉ tất cả ngày lễ, tết năm 2019 của công chức (LuatVietnam summary of TB 3238; secondary, incl. Giỗ Tổ nghỉ bù 15/4)',
             'https://luatvietnam.vn/tin-phap-luat/lich-nghi-tat-ca-ngay-le-tet-nam-2019-cua-cong-chuc-230-17931-article.html'),
        ],
        "days": [
            ('2019-01-01', 'Tết Dương lịch (thứ Ba)', 'le'),
            ('2019-02-04', 'Tết Nguyên đán (30 tháng Chạp)', 'le'),
            ('2019-02-05', 'Tết Nguyên đán (mùng 1)', 'le'),
            ('2019-02-06', 'Tết Nguyên đán (mùng 2)', 'le'),
            ('2019-02-07', 'Tết Nguyên đán (mùng 3)', 'le'),
            ('2019-02-08', 'Tết Nguyên đán (mùng 4)', 'le'),
            ('2019-04-14', 'Giỗ Tổ Hùng Vương (Chủ Nhật)', 'le'),
            ('2019-04-15', 'Nghỉ bù Giỗ Tổ Hùng Vương', 'bu'),
            ('2019-04-29', 'Nghỉ hoán đổi (làm bù thứ Bảy 04/05)', 'doi'),
            ('2019-04-30', 'Ngày Chiến thắng', 'le'),
            ('2019-05-01', 'Ngày Quốc tế Lao động', 'le'),
            ('2019-09-02', 'Quốc khánh (thứ Hai)', 'le'),
        ],
        "working": [('2019-01-05', 'làm bù cho 31/12/2018 (Tết Dương lịch)'), ('2019-05-04', 'làm bù cho 29/04/2019')],
    },
    2020: {
        "sources": [
            ('9087/VPCP-KGVX Văn phòng Chính phủ (ý kiến Thủ tướng Nguyễn Xuân Phúc) 2019-10-07 — V/v nghỉ Tết Âm lịch năm 2020 (cited in TB 4544; PDF not located on vanban.chinhphu.vn)', None),
            ('4544/TB-LĐTBXH Bộ LĐTBXH 2019-10-25: Thông báo về việc nghỉ Tết Âm lịch năm 2020 đối với cán bộ, công chức, viên chức và người lao động',
             'https://web.archive.org/web/2025/https://luatvietnam.vn/lao-dong/thong-bao-4544-tb-ldtbxh-177775-d6.html'),
            ('Báo Điện tử Chính phủ 2019-10-08: Thủ tướng chốt 7 ngày nghỉ Tết Nguyên đán Canh Tý 2020 (Chinhphu.vn 08/10/2019)',
             'https://baochinhphu.vn/thu-tuong-chot-7-ngay-nghi-tet-nguyen-dan-canh-ty-2020-102262334.htm'),
            ('Báo Điện tử Chính phủ 2020-04: Chỉ đạo, điều hành nổi bật tháng 4/2020 (Công điện TTg: đợt nghỉ Lễ 30/4 và 01/5 từ 30/4 đến hết 03/5/2020)',
             'https://baochinhphu.vn/chi-dao-dieu-hanh-cua-chinh-phu-thu-tuong-chinh-phu-noi-bat-thang-4-2020-102272124.htm'),
        ],
        "days": [
            ('2020-01-01', 'Tết Dương lịch (thứ Tư)', 'le'),
            ('2020-01-23', 'Tết Nguyên đán (29 tháng Chạp)', 'le'),
            ('2020-01-24', 'Tết Nguyên đán (30 tháng Chạp)', 'le'),
            ('2020-01-25', 'Tết Nguyên đán (mùng 1, thứ Bảy)', 'le'),
            ('2020-01-26', 'Tết Nguyên đán (mùng 2, Chủ Nhật)', 'le'),
            ('2020-01-27', 'Tết Nguyên đán (mùng 3)', 'le'),
            ('2020-01-28', 'mùng 4 – nghỉ bù cho mùng 1', 'bu'),
            ('2020-01-29', 'mùng 5 – nghỉ bù cho mùng 2', 'bu'),
            ('2020-04-02', 'Giỗ Tổ Hùng Vương (thứ Năm)', 'le'),
            ('2020-04-30', 'Ngày Chiến thắng (thứ Năm)', 'le'),
            ('2020-05-01', 'Ngày Quốc tế Lao động (thứ Sáu)', 'le'),
            ('2020-09-02', 'Quốc khánh (thứ Tư) – last year of the 1-day Quốc khánh under BLLĐ 2012', 'le'),
        ],
        "working": [],
    },
    2021: {
        "sources": [
            ('9895/VPCP-KGVX Văn phòng Chính phủ 2020-11-26: V/v nghỉ Tết Âm lịch và Quốc khánh năm 2021 (TTg Nguyễn Xuân Phúc đồng ý)',
             'https://baochinhphu.vn/thu-tuong-chot-phuong-an-nghi-tet-am-lich-7-ngay-102283382.htm'),
            ('4875/TB-LĐTBXH Bộ LĐTBXH 2020-12-10: Thông báo về việc nghỉ Tết Âm lịch và Quốc khánh năm 2021',
             'https://web.archive.org/web/20240224232444/https://www.molisa.gov.vn/baiviet/224408?tintucID=224408'),
            ('— Bộ LĐTBXH (cổng TTĐT) 2021-04: Dịp lễ 30/4 và 1/5 năm nay người lao động được nghỉ 4 ngày (MOLISA news; statutory nghỉ bù)',
             'https://molisa.gov.vn/baiviet/224849?tintucID=224849'),
        ],
        "days": [
            ('2021-01-01', 'Tết Dương lịch', 'le'),
            ('2021-02-10', 'Tết Nguyên đán (29 tháng Chạp Canh Tý)', 'le'),
            ('2021-02-11', 'Tết Nguyên đán (30 tháng Chạp, giao thừa)', 'le'),
            ('2021-02-12', 'Tết Nguyên đán (mùng 1)', 'le'),
            ('2021-02-13', 'Tết Nguyên đán (mùng 2, thứ Bảy)', 'le'),
            ('2021-02-14', 'Tết Nguyên đán (mùng 3, Chủ nhật)', 'le'),
            ('2021-02-15', 'Nghỉ bù Tết (mùng 4) cho mùng 2 trùng thứ Bảy', 'bu'),
            ('2021-02-16', 'Nghỉ bù Tết (mùng 5) cho mùng 3 trùng Chủ nhật', 'bu'),
            ('2021-04-21', 'Giỗ Tổ Hùng Vương (10/3 âm lịch)', 'le'),
            ('2021-04-30', 'Ngày Chiến thắng', 'le'),
            ('2021-05-01', 'Ngày Quốc tế Lao động (thứ Bảy)', 'le'),
            ('2021-05-03', 'Nghỉ bù 1/5 trùng thứ Bảy', 'bu'),
            ('2021-09-02', 'Quốc khánh', 'le'),
            ('2021-09-03', 'Quốc khánh (ngày liền kề sau)', 'le'),
        ],
        "working": [],
    },
    2022: {
        "sources": [
            ('245/VPCP-KGVX Văn phòng Chính phủ 2022-01-11: V/v nghỉ Tết Nguyên đán và Quốc khánh năm 2022 (PTTg Vũ Đức Đam)',
             'https://baochinhphu.vn/nghi-tet-nham-dan-tu-31-01-2022-den-het-ngay-04-02-2022-102220112154637865.htm'),
            ('119/TB-LĐTBXH Bộ LĐTBXH 2022-01 (≈12/01, unverified): Thông báo về việc nghỉ Tết Nguyên đán Nhâm Dần 2022 và Quốc khánh 2/9 (number per luatvietnam listing; date not confirmed)',
             'https://web.archive.org/web/20220529092447/http://www.molisa.gov.vn/Pages/tintuc/chitiet.aspx?tintucID=230102'),
            ('— Bộ LĐTBXH (cổng TTĐT) 2021-12: Chính thức đề xuất Thủ tướng phương án nghỉ Tết Nhâm Dần (lists Tết DL, Giỗ Tổ, 30/4-1/5 nghỉ bù per BLLĐ)',
             'https://web.archive.org/web/20221128022448/http://www.molisa.gov.vn/Pages/tintuc/chitiet.aspx?tintucID=229960'),
        ],
        "days": [
            ('2022-01-01', 'Tết Dương lịch (thứ Bảy)', 'le'),
            ('2022-01-03', 'Nghỉ bù Tết Dương lịch', 'bu'),
            ('2022-01-31', 'Tết Nguyên đán (29 tháng Chạp Tân Sửu, giao thừa)', 'le'),
            ('2022-02-01', 'Tết Nguyên đán (mùng 1)', 'le'),
            ('2022-02-02', 'Tết Nguyên đán (mùng 2)', 'le'),
            ('2022-02-03', 'Tết Nguyên đán (mùng 3)', 'le'),
            ('2022-02-04', 'Tết Nguyên đán (mùng 4)', 'le'),
            ('2022-04-10', 'Giỗ Tổ Hùng Vương (Chủ nhật)', 'le'),
            ('2022-04-11', 'Nghỉ bù Giỗ Tổ', 'bu'),
            ('2022-04-30', 'Ngày Chiến thắng (thứ Bảy)', 'le'),
            ('2022-05-01', 'Ngày Quốc tế Lao động (Chủ nhật)', 'le'),
            ('2022-05-02', 'Nghỉ bù 30/4', 'bu'),
            ('2022-05-03', 'Nghỉ bù 1/5', 'bu'),
            ('2022-09-01', 'Quốc khánh (ngày liền kề trước)', 'le'),
            ('2022-09-02', 'Quốc khánh', 'le'),
        ],
        "working": [],
    },
    2023: {
        "sources": [
            ('8056/VPCP-KGVX Văn phòng Chính phủ 2022-12-01: V/v nghỉ Tết Âm lịch và nghỉ lễ Quốc khánh năm 2023 (PTTg Vũ Đức Đam)',
             'https://vanban.chinhphu.vn/?docid=206939&pageid=27160'),
            ('?/TB-LĐTBXH Bộ LĐTBXH 2022-12-07: Thông báo lịch nghỉ tết Âm lịch và nghỉ lễ Quốc khánh năm 2023 (number not captured)',
             'https://web.archive.org/web/20230924024656/https://molisa.gov.vn/Pages/tintuc/chitiet.aspx?tintucID=233090'),
            ('— Báo Điện tử Chính phủ (EN) 2022-12-27: Ministry announces length of public holidays in 2023 (19 days)',
             'https://en.baochinhphu.vn/ministry-announces-length-of-public-holidays-in-2023-111221227083008472.htm'),
            ('— Bộ LĐTBXH (cổng TTĐT) 2023-04: Lịch nghỉ Lễ Giỗ tổ Hùng Vương, nghỉ Lễ 30/4 và 1/5 năm 2023 (MOLISA)',
             'https://www.molisa.gov.vn/baiviet/236545?tintucID=236545'),
        ],
        "days": [
            ('2023-01-01', 'Tết Dương lịch (Chủ nhật)', 'le'),
            ('2023-01-02', 'Nghỉ bù Tết Dương lịch', 'bu'),
            ('2023-01-20', 'Tết Nguyên đán (29 tháng Chạp Nhâm Dần)', 'le'),
            ('2023-01-21', 'Tết Nguyên đán (30 tháng Chạp, thứ Bảy)', 'le'),
            ('2023-01-22', 'Tết Nguyên đán (mùng 1, Chủ nhật)', 'le'),
            ('2023-01-23', 'Tết Nguyên đán (mùng 2)', 'le'),
            ('2023-01-24', 'Tết Nguyên đán (mùng 3)', 'le'),
            ('2023-01-25', 'Nghỉ bù Tết (mùng 4)', 'bu'),
            ('2023-01-26', 'Nghỉ bù Tết (mùng 5)', 'bu'),
            ('2023-04-29', 'Giỗ Tổ Hùng Vương (thứ Bảy)', 'le'),
            ('2023-04-30', 'Ngày Chiến thắng (Chủ nhật)', 'le'),
            ('2023-05-01', 'Ngày Quốc tế Lao động', 'le'),
            ('2023-05-02', 'Nghỉ bù (Giỗ Tổ trùng thứ Bảy)', 'bu'),
            ('2023-05-03', 'Nghỉ bù (30/4 trùng Chủ nhật)', 'bu'),
            ('2023-09-01', 'Quốc khánh (ngày liền kề trước)', 'le'),
            ('2023-09-02', 'Quốc khánh (thứ Bảy)', 'le'),
            ('2023-09-04', 'Nghỉ bù Quốc khánh', 'bu'),
        ],
        "working": [],
    },
    2024: {
        "sources": [
            ('8662/VPCP-KGVX Văn phòng Chính phủ 2023-11-03: V/v nghỉ Tết Âm lịch và nghỉ lễ Quốc khánh năm 2024 (TTg Phạm Minh Chính)',
             'https://vanban.chinhphu.vn/?docid=208894&pageid=27160'),
            ('?/TB-LĐTBXH Bộ LĐTBXH 2023-11: Thông báo lịch nghỉ Tết Âm lịch, Quốc khánh 2024 (number not captured)',
             'https://xaydungchinhsach.chinhphu.vn/lich-nghi-tet-nguyen-dan-giap-thin-nam-2024-11923110317204931.htm'),
            ('2450/VPCP-KGVX Văn phòng Chính phủ 2024-04-12: V/v đề xuất hoán đổi ngày làm việc dịp nghỉ lễ 30/4 và 01/5 năm 2024',
             'https://vanban.chinhphu.vn/?docid=210073&pageid=27160'),
            ('1570/TB-BLĐTBXH Bộ LĐTBXH 2024-04-12: Thông báo hoán đổi ngày làm việc dịp nghỉ lễ 30/4-01/5 năm 2024',
             'https://baochinhphu.vn/nghi-le-30-4-1-5-thu-tuong-chot-nghi-5-ngay-102240412180501967.htm'),
        ],
        "days": [
            ('2024-01-01', 'Tết Dương lịch', 'le'),
            ('2024-02-08', 'Tết Nguyên đán (29 tháng Chạp Quý Mão)', 'le'),
            ('2024-02-09', 'Tết Nguyên đán (30 tháng Chạp)', 'le'),
            ('2024-02-10', 'Tết Nguyên đán (mùng 1, thứ Bảy)', 'le'),
            ('2024-02-11', 'Tết Nguyên đán (mùng 2, Chủ nhật)', 'le'),
            ('2024-02-12', 'Tết Nguyên đán (mùng 3)', 'le'),
            ('2024-02-13', 'Nghỉ bù Tết (mùng 4)', 'bu'),
            ('2024-02-14', 'Nghỉ bù Tết (mùng 5)', 'bu'),
            ('2024-04-18', 'Giỗ Tổ Hùng Vương', 'le'),
            ('2024-04-29', 'Nghỉ hoán đổi (làm bù thứ Bảy 4/5)', 'doi'),
            ('2024-04-30', 'Ngày Chiến thắng', 'le'),
            ('2024-05-01', 'Ngày Quốc tế Lao động', 'le'),
            ('2024-09-02', 'Quốc khánh', 'le'),
            ('2024-09-03', 'Quốc khánh (ngày liền kề sau)', 'le'),
        ],
        "working": [('2024-05-04', 'làm bù cho thứ Hai 29/4/2024 (hoán đổi, TB 1570/TB-BLĐTBXH)')],
    },
    2025: {
        "sources": [
            ('8726/VPCP-KGVX Văn phòng Chính phủ 2024-11-26: V/v nghỉ Tết Âm lịch và một số dịp nghỉ lễ năm 2025 (TTg Phạm Minh Chính)',
             'https://baochinhphu.vn/tet-nguyen-dan-at-ty-2025-thu-tuong-dong-y-nghi-9-ngay-lien-tuc-102241126202134613.htm'),
            ('6150/TB-BLĐTBXH Bộ LĐTBXH 2024-12-03: Thông báo về việc nghỉ tết Âm lịch, nghỉ lễ Quốc khánh, nghỉ lễ 30/4 và 01/5 năm 2025',
             'https://baochinhphu.vn/chinh-thuc-bo-ldtbxh-thong-bao-lich-nghi-tet-nguyen-dan-at-ty-va-nghi-le-nam-2025-10224120316465192.htm'),
        ],
        "days": [
            ('2025-01-01', 'Tết Dương lịch', 'le'),
            ('2025-01-27', 'Tết Nguyên đán (28 tháng Chạp Giáp Thìn)', 'le'),
            ('2025-01-28', 'Tết Nguyên đán (29 tháng Chạp, giao thừa)', 'le'),
            ('2025-01-29', 'Tết Nguyên đán (mùng 1)', 'le'),
            ('2025-01-30', 'Tết Nguyên đán (mùng 2)', 'le'),
            ('2025-01-31', 'Tết Nguyên đán (mùng 3)', 'le'),
            ('2025-04-07', 'Giỗ Tổ Hùng Vương', 'le'),
            ('2025-04-30', 'Ngày Chiến thắng', 'le'),
            ('2025-05-01', 'Ngày Quốc tế Lao động', 'le'),
            ('2025-05-02', 'Nghỉ hoán đổi (làm bù thứ Bảy 26/4)', 'doi'),
            ('2025-09-01', 'Quốc khánh (ngày liền kề trước)', 'le'),
            ('2025-09-02', 'Quốc khánh', 'le'),
        ],
        "working": [('2025-04-26', 'làm bù cho thứ Sáu 2/5/2025 (hoán đổi, TB 6150/TB-BLĐTBXH)')],
    },
    2026: {
        "sources": [
            ('12729/VPCP-KGVX Văn phòng Chính phủ 2025-12-25: V/v nghỉ Tết Dương lịch năm 2026 (PTTg Phạm Thị Thanh Trà)',
             'https://baochinhphu.vn/thu-tuong-chinh-phu-dong-y-nghi-4-ngay-tet-duong-lich-2026-102251225095413405.htm'),
            ('12590/TB-BNV Bộ Nội vụ 2025-12-25: Thông báo hoán đổi ngày làm việc dịp nghỉ Tết Dương lịch năm 2026',
             'https://xaydungchinhsach.chinhphu.vn/lich-nghi-tet-duong-lich-2026-119251225111725138.htm'),
            ('9859/VPCP-KGVX Văn phòng Chính phủ 2025-10-13: V/v nghỉ Tết Âm lịch, nghỉ lễ Quốc khánh năm 2026 (TTg Phạm Minh Chính)',
             'https://baochinhphu.vn/thu-tuong-chinh-phu-dong-y-phuong-an-nghi-tet-binh-ngo-9-ngay-lien-tuc-102251013191235348.htm'),
            ('9441/TB-BNV Bộ Nội vụ 2025-10-16: Thông báo về việc nghỉ tết Âm lịch, nghỉ lễ Quốc khánh năm 2026',
             'https://moha.gov.vn/tin-tuc/bo-noi-vu-thong-bao-ve-viec-nghi-tet-am-lich-nghi----oid57695'),
            ('3383/BNV-CVL Bộ Nội vụ 2026-04-10: Công văn về lịch nghỉ Giỗ Tổ, 30/4-1/5/2026: thực hiện theo BLLĐ, không hoán đổi',
             'https://baochinhphu.vn/chinh-thuc-bo-noi-vu-ra-thong-bao-lich-nghi-gio-to-hung-vuong-le-30-4-1-5-102260410213402453.htm'),
            ('10065/VPCP-KGVX Văn phòng Chính phủ 2026-10-02: V/v phương án nghỉ một số dịp Lễ, Tết năm 2026 và năm 2027 (incl. 01 ngày Ngày Văn hóa VN 24/11/2026)',
             'https://datafiles.chinhphu.vn/cpp/files/vbpq/2026/9/10065_vpcp-kgvx_02102026_1-signed.signed.pdf'),
        ],
        "days": [
            ('2026-01-01', 'Tết Dương lịch', 'le'),
            ('2026-01-02', 'Nghỉ hoán đổi (làm bù thứ Bảy 10/1)', 'doi'),
            ('2026-02-16', 'Tết Nguyên đán (29 tháng Chạp Ất Tỵ, giao thừa)', 'le'),
            ('2026-02-17', 'Tết Nguyên đán (mùng 1)', 'le'),
            ('2026-02-18', 'Tết Nguyên đán (mùng 2)', 'le'),
            ('2026-02-19', 'Tết Nguyên đán (mùng 3)', 'le'),
            ('2026-02-20', 'Tết Nguyên đán (mùng 4)', 'le'),
            ('2026-04-26', 'Giỗ Tổ Hùng Vương (Chủ nhật)', 'le'),
            ('2026-04-27', 'Nghỉ bù Giỗ Tổ', 'bu'),
            ('2026-04-30', 'Ngày Chiến thắng', 'le'),
            ('2026-05-01', 'Ngày Quốc tế Lao động', 'le'),
            ('2026-08-31', 'Nghỉ hoán đổi (làm bù thứ Bảy 22/8)', 'doi'),
            ('2026-09-01', 'Quốc khánh (ngày liền kề trước)', 'le'),
            ('2026-09-02', 'Quốc khánh', 'le'),
            ('2026-11-24', 'Ngày Văn hóa Việt Nam (NQ 28/2026/QH16; nghỉ 01 ngày, không hoán đổi)', 'le'),
        ],
        "working": [('2026-01-10', 'làm bù cho thứ Sáu 2/1/2026 (hoán đổi, TB 12590/TB-BNV)'), ('2026-08-22', 'làm bù cho thứ Hai 31/8/2026 (hoán đổi, TB 9441/TB-BNV)')],
    },
    2027: {
        "sources": [
            ('10065/VPCP-KGVX Văn phòng Chính phủ 2026-10-02: V/v phương án nghỉ một số dịp Lễ, Tết năm 2026 và năm 2027',
             'https://datafiles.chinhphu.vn/cpp/files/vbpq/2026/9/10065_vpcp-kgvx_02102026_1-signed.signed.pdf'),
            ('11483/TB-BNV Bộ Nội vụ 2026-10-09: Thông báo về việc nghỉ Tết Âm lịch và nghỉ lễ Quốc khánh năm 2027',
             'https://xaydungchinhsach.chinhphu.vn/de-xuat-2-phuong-an-nghi-tet-nguyen-dan-2027-tet-dinh-mui-11926080513033257.htm'),
        ],
        "days": [
            ('2027-01-01', 'Tết Dương lịch', 'le'),
            ('2027-02-04', 'Tết Nguyên đán (28 tháng Chạp Bính Ngọ)', 'le'),
            ('2027-02-05', 'Tết Nguyên đán (29 tháng Chạp, giao thừa)', 'le'),
            ('2027-02-06', 'Tết Nguyên đán (mùng 1, thứ Bảy)', 'le'),
            ('2027-02-07', 'Tết Nguyên đán (mùng 2, Chủ nhật)', 'le'),
            ('2027-02-08', 'Tết Nguyên đán (mùng 3)', 'le'),
            ('2027-02-09', 'Nghỉ bù Tết (mùng 4)', 'bu'),
            ('2027-02-10', 'Nghỉ bù Tết (mùng 5)', 'bu'),
            ('2027-04-16', 'Giỗ Tổ Hùng Vương', 'le'),
            ('2027-04-30', 'Ngày Chiến thắng', 'le'),
            ('2027-05-01', 'Ngày Quốc tế Lao động (thứ Bảy)', 'le'),
            ('2027-05-03', 'Nghỉ bù 1/5 trùng thứ Bảy', 'bu'),
            ('2027-07-27', 'Ngày Tổ quốc tri ân, Ngày Thương binh, liệt sĩ (luật sửa đổi BLLĐ, hiệu lực 01/03/2027)', 'le'),
            ('2027-09-02', 'Quốc khánh', 'le'),
            ('2027-09-03', 'Quốc khánh (ngày liền kề sau)', 'le'),
            ('2027-11-24', 'Ngày Văn hóa Việt Nam', 'le'),
        ],
        "working": [],
    },
}


VN_LAST_NOTICE_YEAR = 2027


def hnd_year(yy: int) -> tuple[date, date]:
    """(Tết, Giỗ Tổ) of Gregorian year YY from the HND table (decodeLunarYear)."""
    js = cached("vn/amlich-hnd.js", HND_URI, 10000).decode("latin-1")
    tables = {name: [int(x, 16) for x in re.findall(r"0x[0-9a-fA-F]+", body)]
              for name, body in re.findall(r"var\s+(TK\d+)\s*=\s*new\s+Array\(([^)]*)\)", js)}
    k = tables["TK21"][yy - 2000] if yy < 2100 else tables["TK22"][yy - 2100]
    tet = date(yy, 1, 1) + timedelta(days=k >> 17)
    lengths = [(29, 30)[(k >> (4 + 11 - i)) & 1] for i in range(12)]
    month3 = tet + timedelta(days=lengths[0] + lengths[1])
    if (k & 0xF) in (1, 2):
        month3 += timedelta(days=(29, 30)[(k >> 16) & 1])
    return tet, month3 + timedelta(days=9)


def vn_quoc_khanh_adjacent(year: int) -> date:
    """The day next to 2/9 for a year with no notice, by the 2021-2027 notices:
    3/9 when 2/9 is a Monday, Thursday or Sunday, else 1/9."""
    d = date(year, 9, 2)
    return d + timedelta(days=1 if d.weekday() in (0, 3, 6) else -1)


def vn_nghi_bu(days: list[tuple[date, str]], blocked: set) -> list[tuple[date, str]]:
    """Each holiday on a Saturday or Sunday, in date order, gives the next
    working day (Monday-Friday, no holiday, no hoán đổi day)."""
    taken = {d for d, _ in days} | blocked
    out = []
    for d, name in sorted(days):
        if d.weekday() >= 5:
            n = d + timedelta(days=1)
            while n.weekday() >= 5 or n in taken:
                n += timedelta(days=1)
            taken.add(n)
            out.append((n, f"Nghỉ bù {name}"))
    return out


def vn_statutory(year: int) -> list[tuple[date, str]]:
    """The statutory days of a year with no notice."""
    tet, gio_to = hnd_year(year)
    out = [(date(year, 1, 1), "Tết Dương lịch"), (gio_to, "Giỗ Tổ Hùng Vương"),
           (date(year, 4, 30), "Ngày Chiến thắng"), (date(year, 5, 1), "Ngày Quốc tế Lao động"),
           (date(year, 7, 27), "Ngày Tổ quốc tri ân, Ngày Thương binh, liệt sĩ"),
           (date(year, 9, 2), "Quốc khánh"), (vn_quoc_khanh_adjacent(year), "Quốc khánh (ngày liền kề)"),
           (date(year, 11, 24), "Ngày Văn hóa Việt Nam")]
    out += [(tet + timedelta(days=i), "Tết Nguyên đán (ước tính)") for i in range(-1, 4)]
    return out


def _vn_by_date_year(key: str):
    for block in VN_NOTICES.values():
        for row in block[key]:
            yield date.fromisoformat(row[0]), row


def vn_holidays(year: int) -> list[tuple[date, str]]:
    if year <= VN_LAST_NOTICE_YEAR:
        return [(d, row[1]) for d, row in _vn_by_date_year("days") if d.year == year]
    days = vn_statutory(year)
    return days + [x for x in vn_nghi_bu(days, set()) if x[0].year == year]


def vn_working_days(year: int) -> list[date]:
    return sorted(d for d, _ in _vn_by_date_year("working") if d.year == year)


def vn_consistency_check(days: dict) -> None:
    """The notices against the statute: in every notice year, the statutory days
    (as the notice placed Tết and Quốc khánh) plus their nghỉ bù and the
    notice's hoán đổi days give exactly the notice's days off."""
    bad = []
    for year in range(FIRST, VN_LAST_NOTICE_YEAR + 1):
        rows = [(d, row) for d, row in _vn_by_date_year("days") if d.year == year]
        le = [(d, row[1]) for d, row in rows if row[2] == "le"]
        doi = {d for d, row in rows if row[2] == "doi"}
        # A Saturday hoán đổi of the year before (31/12) blocks nothing here.
        derived = {d for d, _ in le} | doi | {d for d, _ in vn_nghi_bu(le, doi) if d.year == year}
        listed = {d for d, _ in rows}
        if derived != listed:
            bad.append((year, sorted(derived ^ listed)))
    for b in bad:
        print("  VN nghỉ bù rule vs notices:", *b)
    print(f"  VN 2000-{VN_LAST_NOTICE_YEAR}: {len(bad)} years where the nghỉ bù rule and the notices differ")

# --- China ----------------------------------------------------------------
#
# 《全国年节及纪念日放假办法》 of each era (第二条 the days off, 第六条 a day
# on a Saturday or Sunday gives a 补假 on a working day): the 1999 text
# (国务院令第270号, from 1999-09-18), 国务院令第513号 (2008-01-01), 第644号
# (2014-01-01) and 第795号 (2025-01-01). The yearly 国务院办公厅 notices (国办发明电)
# place each holiday's 放假 window and make Saturdays and Sundays 上班 days.
# The script reads each notice's text (cached under ~/.cache/cl-stack-calendars/cn/)
# and parses the windows and 上班 days from it, checking every 星期 / 周 the
# text prints against the date. Lunar dates and 清明 are the Hong Kong
# Observatory's tables (UTC+8, the same day as Beijing time).
#
# Two fixtures:
#   cn-holiday-gold.sexp            2007-2040: the gov.cn notices 2007-2027 (primary),
#                                   then provisional years (statute days only).
#   cn-secondary-holiday-gold.sexp  2000-2006: Xinhua dispatches, Xinhua / Anhui
#                                   government republications and Wikisource
#                                   transcriptions; lower confidence.
#
# Day names: a statutory day is its festival (春节, 国庆节, 春节（除夕） ...); a
# weekday off that 第六条 owes for a statutory day on a Saturday or Sunday is
# "<festival>（补休）"; any other weekday off in a window is "<window>（调休）"
# (it is paid back by a 上班 day); a Saturday or Sunday in a window that is no
# statutory day is "<window>（休息日）". 补休 days are matched to the statutory
# weekend days in date order: each takes the first weekday off after it that is
# no statutory day (the notices of 2008-2013 spell the moves out, e.g. 2009:
# "10月3日（星期六）公休日及中秋节分别调至10月5日（星期一）、10月6日（星期二）").

CN_DIR = "cn"
CN_NOTE = (
    "Days off of the 全国年节及纪念日放假办法 and the yearly 国务院办公厅 notices: every day of each notice's "
    "放假 window is a holiday (its Saturdays and Sundays too, as the notice counts them: '共7天'), and the "
    "notice's 上班 Saturdays and Sundays are working days (:working-days). Names: the statutory festival, "
    "'<festival>（补休）' for the weekday 第六条 owes for a statutory day on a weekend, '<window>（调休）' for a "
    "weekday off paid back by a 上班 day, '<window>（休息日）' for a weekend day in a window. 2007-2027 are "
    "parsed from the State Council notices on www.gov.cn (with 国办发明电〔2019〕3号, 〔2020〕1号 and "
    "国发明电〔2015〕1号). 2028-2040 are provisional: the 第二条 days of the 2024 text only, no window, no "
    "补休, no 调休."
)
CN_SECONDARY_NOTE = (
    "LOWER CONFIDENCE. 2000-2006: no State Council notice of these years is on www.gov.cn. The days are "
    "parsed from Xinhua dispatches (2000 元旦 via Guangming Daily, 2000 国庆 via Sina), the xinhuanet copy "
    "of 国办发明电〔2003〕53号 and the Anhui government copy of 〔2005〕35号 (Wayback), and the zh.wikisource "
    "transcriptions of 〔2001〕1号, 〔2001〕45号, 〔2002〕27号 with the 2003-04-21 SARS amendment, and "
    "〔2004〕52号. No text of the 2000 春节 and 劳动节 arrangements was found: those holidays are the "
    "1999 第二条 days only. 2006-12-30/31 上班 are from the 2007 notice 国办发明电〔2006〕49号 (gov.cn)."
)

CN_STATUTE_SOURCES = [
    ("全国年节及纪念日放假办法 (国务院1999年9月18日修订, 国务院令第270号) 第二条、第六条",
     "https://xzfg.moj.gov.cn/front/law/detail?LawID=740",
     "（一）新年，放假1天(1月1日)；（二）春节，放假3天(农历正月初一、初二、初三)；（三）劳动节，放假3天(5月1日、2日、3日)；"
     "（四）国庆节，放假3天(10月1日、2日、3日)。第六条 全体公民放假的假日，如果适逢星期六、星期日，应当在工作日补假。"),
    ("国务院关于修改《全国年节及纪念日放假办法》的决定 (国务院令第513号, 2007-12-14, 自2008年1月1日起施行)",
     "https://www.ndrc.gov.cn/fzggw/jgsj/shs/sjdt/200712/t20071217_1122443.html",
     "（一）新年，放假1天（1月1日）；（二）春节，放假3天（农历除夕、正月初一、初二）；（三）清明节，放假1天（农历清明当日）；"
     "（四）劳动节，放假1天（5月1日）；（五）端午节，放假1天（农历端午当日）；（六）中秋节，放假1天（农历中秋当日）；"
     "（七）国庆节，放假3天（10月1日、2日、3日）。"),
    ("国务院关于修改《全国年节及纪念日放假办法》的决定 (国务院令第644号, 2013-12-11, 自2014年1月1日起施行)",
     "https://www.gov.cn/flfg/2013-12/11/content_2546268.htm",
     "第二条第二项修改为：“（二）春节，放假3天（农历正月初一、初二、初三）”。"),
    ("国务院关于修改《全国年节及纪念日放假办法》的决定 (国务院令第795号, 2024-11-10, 自2025年1月1日起施行)",
     "https://www.gov.cn/zhengce/content/202411/content_6986380.htm",
     "第二条第二项修改为“（二）春节，放假4天（农历除夕、正月初一至初三）”，第四项修改为“（四）劳动节，放假2天（5月1日、2日）”。"
     "增加第七条：全体公民放假的假日，可合理安排统一放假调休。"),
    ("Hong Kong Observatory, Gregorian-Lunar Calendar Conversion Tables",
     "https://www.hko.gov.hk/en/gts/time/conversion.htm",
     "农历正月初一、除夕、五月初五、八月十五 and the 清明 solar term ('Bright & Clear'), T1999e.txt-T2041e.txt."),
]

# Each notice: holiday year, number, title, URI, cache file, kind, fetch URI
# (a Wayback capture where the page is gone) and, for an amendment, what it does.
CN_NOTICES = [
    dict(year=2000, no="国务院办公厅关于2000年元旦期间放假的通知（文号未见）", kind="secondary-news",
         uri="https://www.gmw.cn/01gmrb/1999-12/17/GB/GM%5E18273%5E1%5EGM1-1716.HTM",
         fetch="https://web.archive.org/web/20060401id_/http://www.gmw.cn/01gmrb/1999-12/17/GB/GM%5E18273%5E1%5EGM1-1716.HTM",
         cache="wayback-gmw-2000-yuandan.html", section="元旦",
         note="新华社北京1999年12月16日电 (光明日报 1999-12-17)"),
    dict(year=2000, no="国务院办公厅关于2000年国庆节放假的通知（文号未见）", kind="secondary-news",
         uri="https://finance.sina.cn/sa/2000-09-14/detail-ikkntiak6511730.d.html",
         cache="secondary-sina-2000-guoqing.html", section="国庆节",
         note="新华网北京2000年9月14日电 (新浪)"),
    dict(year=2001, no="国办发明电〔2001〕1号", kind="secondary-transcription",
         uri="https://zh.wikisource.org/wiki/国务院办公厅关于2001年春节、“五一”、“十一”放假安排的通知",
         cache="ws-2001.html"),
    dict(year=2002, no="国办发明电〔2001〕45号", kind="secondary-transcription",
         uri="https://zh.wikisource.org/wiki/国务院办公厅关于2002年部分节假日休息安排的通知",
         cache="ws-2002.html"),
    dict(year=2003, no="国办发明电〔2002〕27号", kind="secondary-transcription",
         uri="https://zh.wikisource.org/wiki/国务院办公厅关于2003年部分节假日休息安排的通知",
         cache="ws-2003.html"),
    dict(year=2003, no="国务院办公厅关于2003年“五一”放假调休安排的通知（2003-04-21，文号未见）",
         kind="secondary-transcription", amends="劳动节",
         uri="https://zh.wikisource.org/wiki/国务院办公厅关于2003年“五一”放假调休安排的通知",
         cache="ws-2003-wuyi.html", note="非典: 五一按法定假日休假，暂不实行长假"),
    dict(year=2004, no="国办发明电〔2003〕53号", kind="official-republication",
         uri="http://news.xinhuanet.com/zhengfu/2004-04/02/content_1397359.htm",
         fetch="https://web.archive.org/web/20040411id_/http://news.xinhuanet.com/zhengfu/2004-04/02/content_1397359.htm",
         cache="wayback-xinhua-notice-2004.html"),
    dict(year=2005, no="国办发明电〔2004〕52号", kind="secondary-transcription",
         uri="https://zh.wikisource.org/wiki/国务院办公厅关于2005年部分节假日安排的通知",
         cache="ws-2005.html"),
    dict(year=2006, no="国办发明电〔2005〕35号", kind="official-republication",
         uri="http://www.ah.gov.cn/UserData/DocHtml/1/2013/7/12/6862126522205.html",
         fetch="https://web.archive.org/web/20160305id_/http://www.ah.gov.cn/UserData/DocHtml/1/2013/7/12/6862126522205.html",
         cache="wayback-ahgov-notice-2006.html", note="皖政办明电〔2005〕61号转发"),
    dict(year=2007, no="国办发明电〔2006〕49号", uri="https://www.gov.cn/gongbao/content/2007/content_503397.htm",
         cache="notice-2007.html"),
    dict(year=2008, no="国办发明电〔2007〕52号", uri="https://www.gov.cn/zwgk/2007-12/18/content_837184.htm",
         cache="notice-2008.html"),
    dict(year=2009, no="国办发明电〔2008〕42号", uri="https://www.gov.cn/zwgk/2008-12/10/content_1174014.htm",
         cache="notice-2009.html"),
    dict(year=2010, no="国办发明电〔2009〕27号", uri="https://www.gov.cn/zwgk/2009-12/08/content_1482691.htm",
         cache="notice-2010.html"),
    dict(year=2011, no="国办发明电〔2010〕40号", uri="https://www.gov.cn/zwgk/2010-12/10/content_1762643.htm",
         cache="notice-2011.html"),
    dict(year=2012, no="国办发明电〔2011〕45号", uri="https://www.gov.cn/zwgk/2011-12/06/content_2012097.htm",
         cache="notice-2012.html"),
    dict(year=2013, no="国办发明电〔2012〕33号", uri="https://www.gov.cn/zwgk/2012-12/10/content_2286598.htm",
         cache="notice-2013.html"),
    dict(year=2014, no="国办发明电〔2013〕28号", uri="https://www.gov.cn/zwgk/2013-12/11/content_2546204.htm",
         cache="notice-2014.html"),
    dict(year=2015, no="国办发明电〔2014〕28号", uri="https://www.gov.cn/zhengce/content/2014-12/16/content_9302.htm",
         cache="notice-2015.html"),
    dict(year=2015, no="国发明电〔2015〕1号", uri="https://www.gov.cn/zhengce/zhengceku/2015-05/13/content_9742.htm",
         cache="amend-2015-0903.html", amends="special",
         section="中国人民抗日战争暨世界反法西斯战争胜利70周年纪念日"),
    dict(year=2016, no="国办发明电〔2015〕18号", uri="https://www.gov.cn/zhengce/content/2015-12/10/content_10394.htm",
         cache="notice-2016.html"),
    dict(year=2017, no="国办发明电〔2016〕17号", uri="https://www.gov.cn/zhengce/content/2016-12/01/content_5141603.htm",
         cache="notice-2017.html"),
    dict(year=2018, no="国办发明电〔2017〕12号", uri="https://www.gov.cn/zhengce/content/2017-11/30/content_5243579.htm",
         cache="notice-2018.html"),
    dict(year=2019, no="国办发明电〔2018〕15号", uri="https://www.gov.cn/zhengce/content/2018-12/06/content_5346276.htm",
         cache="notice-2019.html"),
    dict(year=2019, no="国办发明电〔2019〕3号", uri="https://www.gov.cn/zhengce/zhengceku/2019-03/22/content_5375877.htm",
         cache="amend-2019-laodong.html", amends="劳动节"),
    dict(year=2020, no="国办发明电〔2019〕16号", uri="https://www.gov.cn/zhengce/content/2019-11/21/content_5454164.htm",
         cache="notice-2020.html"),
    dict(year=2020, no="国办发明电〔2020〕1号", uri="https://www.gov.cn/zhengce/zhengceku/2020-01/27/content_5472352.htm",
         cache="amend-2020-chunjie.html", amends="extend"),
    dict(year=2021, no="国办发明电〔2020〕27号", uri="https://www.gov.cn/zhengce/content/2020-11/25/content_5564127.htm",
         cache="notice-2021.html"),
    dict(year=2022, no="国办发明电〔2021〕11号", uri="https://www.gov.cn/zhengce/content/2021-10/25/content_5644835.htm",
         cache="notice-2022.html"),
    dict(year=2023, no="国办发明电〔2022〕16号", uri="https://www.gov.cn/zhengce/content/2022-12/08/content_5730844.htm",
         cache="notice-2023.html"),
    dict(year=2024, no="国办发明电〔2023〕7号", uri="https://www.gov.cn/zhengce/content/202310/content_6911527.htm",
         cache="notice-2024.html"),
    dict(year=2025, no="国办发明电〔2024〕12号", uri="https://www.gov.cn/zhengce/zhengceku/202411/content_6986383.htm",
         cache="notice-2025.html"),
    dict(year=2026, no="国办发明电〔2025〕7号", uri="https://www.gov.cn/zhengce/content/202511/content_7047090.htm",
         cache="notice-2026.html"),
    dict(year=2027, no="国办发明电〔2026〕10号", uri="https://www.gov.cn/zhengce/zhengceku/202611/content_7085102.htm",
         cache="notice-2027.html"),
]
CN_FIRST_PRIMARY = 2007
CN_LAST_NOTICE_YEAR = 2027

CN_WEEKDAY = {"一": 0, "二": 1, "三": 2, "四": 3, "五": 4, "六": 5, "日": 6, "天": 6}
CN_SECTION_NAMES = {"“五一”": "劳动节", "“五一”国际劳动节": "劳动节", "\"五一\"": "劳动节",
                    "“十一”": "国庆节", "新年": "元旦"}
_CN_DATE = re.compile(r"(?:(\d{4})年)?(?:(\d{1,2})\s*月)?\s*(\d{1,2})\s*日((?:\s*[（(][^）)]*[）)])?)")
_CN_SEP = re.compile(r"^\s*(?:—+|－+|-+|至)\s*")


def cn_notice_text(notice: dict) -> str:
    raw = cached(f"{CN_DIR}/{notice['cache']}", notice.get("fetch", notice["uri"]), 200)
    for enc in ("utf-8", "gb18030"):
        try:
            return page_text(raw.decode(enc).encode("utf-8"))
        except UnicodeDecodeError:
            continue
    return page_text(raw)


def _cn_body(text: str) -> str:
    start = text.find("一、")
    start = 0 if start < 0 else start
    ends = [i for i in (text.find(k, start) for k in ("节假日期间", "调休放假期间", "放假期间", "鼓励单位和个人"))
            if i > 0]
    return text[start:min(ends)] if ends else text[start:]


def cn_sections(notice: dict) -> list[tuple[str, str]]:
    """[(section name, section text)] of NOTICE: '一、元旦：…' blocks, or the whole
    body under NOTICE's :section for a dispatch or a one-holiday amendment."""
    body = _cn_body(cn_notice_text(notice))
    if notice.get("section") or notice.get("amends"):
        name = notice.get("section") or notice.get("amends")
        if notice.get("amends") == "extend":
            name = "春节"
        return [(name, body.replace("|", ""))]
    # A heading starts a line: "|二、春节：|" ("正月初七、周二" is no heading).
    parts = re.split(r"(?:^|\|)\s*([一二三四五六七八])、\s*([^：:。|]{1,14}?)\s*[：:。]", body)
    out = []
    for i in range(1, len(parts) - 2, 3):
        name = parts[i + 1].strip()
        out.append((CN_SECTION_NAMES.get(name, name), parts[i + 2].replace("|", "")))
    return out


def _cn_dates(text: str, year: int, section: str):
    """Every date of a section's TEXT as (start, end, date, weekday-or-None).
    A date with no year is in YEAR, except a December date of the 元旦 section,
    which is in YEAR - 1; a date with no month takes the month before it."""
    out, month, yr, prev_month = [], None, None, None
    for m in _CN_DATE.finditer(text):
        y, mo, d, paren = m.group(1), m.group(2), int(m.group(3)), m.group(4) or ""
        if mo and month is not None and int(mo) != month:
            prev_month = month
        if mo:
            month = int(mo)
        if month is None:
            continue
        if y:
            yr = int(y)
        elif mo:
            yr = year - 1 if (month == 12 and section == "元旦") else year
        wd = re.search(r"(?:星期|周)([一二三四五六日天])", paren)
        try:
            dt = date(yr, month, d)
        except ValueError:  # "1月29日—2月4日…其中，29日、30日、31日": the window's first month
            dt = date(yr, prev_month, d)
        if wd:
            assert dt.weekday() == CN_WEEKDAY[wd.group(1)], (section, dt, m.group(0))
        out.append((m.start(), m.end(), dt))
    return out


def _cn_weekend_run(d: date) -> list[date]:
    """D and the Saturdays and Sundays next to it."""
    run = [d]
    n = d - timedelta(days=1)
    while n.weekday() >= 5:
        run.insert(0, n)
        n -= timedelta(days=1)
    n = d + timedelta(days=1)
    while n.weekday() >= 5:
        run.append(n)
        n += timedelta(days=1)
    return run


def cn_parse_section(name: str, text: str, year: int) -> tuple[list[date], list[date]]:
    """(window days, 上班 days) of one section."""
    dates = _cn_dates(text, year, name)
    # The dates of the clauses that end in 上班, by position in the full scan (so a
    # date with no month takes the section's month).
    working = []
    pos = 0
    for clause in re.split(r"([，。；,;])", text):
        if "上班" in clause and "照常上班" not in clause and "正常上班" not in clause:
            working += [d for s, _, d in dates if pos <= s < pos + len(clause)]
        pos += len(clause)
    window = []
    # A range DATE — DATE / DATE 至 DATE (the first one: the 放假 window).
    for i, (s, e, d) in enumerate(dates):
        rest = text[e:]
        sep = _CN_SEP.match(rest)
        if sep and i + 1 < len(dates) and dates[i + 1][0] == e + sep.end():
            end = dates[i + 1][2]
            if "为法定假日" in text[dates[i + 1][1]:dates[i + 1][1] + 6]:
                continue  # 2003 amendment: "5月1日-3日为法定假日", not a window
            window = [d + timedelta(days=k) for k in range((end - d).days + 1)]
            break
    # The notices of 2000-2009 name no 上班 day for some windows: "9月27日（星期六）、9月28日
    # （星期日）两个公休日调至9月29日（星期一）、30日（星期二）" (2008 国庆节). A Saturday or
    # Sunday the section moves into its window is a 上班 day.
    if window:
        for s, e, d in dates:
            if d.weekday() >= 5 and d not in window and "调至" in text[e:e + 40] and d not in working:
                working.append(d)
    m = re.search(r"共\s*(\d+)\s*天", text)
    if window and m:
        assert int(m.group(1)) == len(window), (name, year, window, m.group(0))
    if not window and dates:
        first = dates[0][2]
        if "与周末连休" in text:
            window = _cn_weekend_run(first)
        elif "补休" in text:
            bu = [d for s, _, d in dates if "补休" in text[s:s + 16] and d != first]
            assert len(bu) == 1, (name, year, text)
            window = sorted(set(_cn_weekend_run(first)) | set(_cn_weekend_run(bu[0])) |
                            {first + timedelta(days=k) for k in range((bu[0] - first).days + 1)})
        else:
            window = [first]
    return window, working


def cn_notice_days(year: int) -> tuple[dict, set, dict, dict]:
    """({date: window name}, {上班 dates}, {date: notice no.}, {date: special name})
    of the notices for holiday YEAR, amendments applied."""
    off, working, by, special = {}, set(), {}, {}
    cancelled = set()
    for notice in [n for n in CN_NOTICES if n["year"] == year]:
        if year == 2000 and notice["section"] == "元旦":
            # "调整为：1999年12月31日、2000年1月1日、1月2日。2000年1月3日照常上班。"
            text = cn_notice_text(notice)
            assert "1999年12月31日、2000年1月1日、1月2日" in text.replace("|", ""), "2000 元旦 text"
            for d in (date(1999, 12, 31), date(2000, 1, 1), date(2000, 1, 2)):
                off[d], by[d] = "元旦", notice["no"]
            continue
        kind = notice.get("amends")
        for name, text in cn_sections(notice):
            if kind == "extend":
                m = re.search(r"延长(\d{4})年春节假期至(\d{1,2})月(\d{1,2})日", text)
                assert m, text
                end = date(int(m.group(1)), int(m.group(2)), int(m.group(3)))
                last = max(d for d, w in off.items() if w == "春节")
                d = last + timedelta(days=1)
                while d <= end:
                    off[d], by[d], special[d] = "春节", notice["no"], "春节（延长假期）"
                    if d in working:
                        working.discard(d)
                        cancelled.add(d)
                    d += timedelta(days=1)
                continue
            if kind == "劳动节":
                for d in [d for d, w in off.items() if w == "劳动节"]:
                    del off[d]
                working -= {d for d in working if d.month in (4, 5)}
                if year == 2003:
                    # "5月1日-3日为法定假日，5月3日(星期六)的公休调至5月5日(星期一)休息，5月4日(星期日)照常公休。"
                    assert "5月3日(星期六)的公休调至5月5日(星期一)休息" in text, text
                    for d in (date(2003, 5, k) for k in range(1, 6)):
                        off[d], by[d] = "劳动节", notice["no"]
                    continue
            window, up = cn_parse_section(name, text, year)
            for d in window:
                off[d], by[d] = name, notice["no"]
                if kind == "special" and d.weekday() < 5 and d == window[0]:
                    special[d] = name
            working |= set(up)
    return off, working, by, special, cancelled


def cn_statutory(year: int) -> list[tuple[date, str]]:
    """第二条 of the 放假办法 in force in YEAR (from 2000)."""
    ny = hk_lunar(year, 1, 1)
    out = [(date(year, 1, 1), "元旦")]
    if 2008 <= year <= 2013 or year >= 2025:
        out.append((ny - timedelta(days=1), "春节（除夕）"))
    out += [(ny + timedelta(days=k), "春节") for k in range(2 if 2008 <= year <= 2013 else 3)]
    if year >= 2008:
        out += [(hk_ching_ming(year), "清明节"), (hk_lunar(year, 5, 5), "端午节"),
                (hk_lunar(year, 8, 15), "中秋节")]
    labour = 3 if year <= 2007 else (2 if year >= 2025 else 1)
    out += [(date(year, 5, k), "劳动节") for k in range(1, labour + 1)]
    out += [(date(year, 10, k), "国庆节") for k in (1, 2, 3)]
    return out


def cn_label(year: int) -> tuple[dict, set, list]:
    """({date: [names]}, {上班 dates}, [problems]) for the notices of holiday YEAR:
    each window day named by the convention above. Problems: a statutory day the
    notices leave out, and the count check (weekdays off that are no statutory or
    special day = 补休 owed + 上班 days)."""
    off, working, _, special, cancelled = cn_notice_days(year)
    stat: dict[date, list[str]] = {}
    for y in {d.year for d in off} | {year}:
        for d, n in cn_statutory(y):
            if d in off or y == year:
                stat.setdefault(d, []).append(n)
    problems = []
    windows = set(off.values())
    for d in sorted(stat):
        if d not in off and d.year == year:
            base = stat[d][0].split("（")[0]
            if any(base in w for w in windows):
                problems.append(("statutory day outside its window", (d, stat[d])))
            else:
                off[d] = base  # no notice text for this holiday: the statute day alone
    names: dict[date, list[str]] = {}
    for d in sorted(off):
        if d in stat:
            names[d] = list(stat[d])
        elif d in special:
            names[d] = [special[d]]
    free = [d for d in sorted(off) if d not in names and d.weekday() < 5]
    # 第六条: a statutory day on a Saturday or Sunday owes a weekday; two festivals on one
    # weekday (国庆节 and 中秋节 on 2020-10-01) owe one for the second.
    # The weekend days first, in date order (on 2009-10-03, a Saturday, 国庆节 before
    # 中秋节, as the notice moves them), then the weekday overlaps.
    owed = [(d, n) for d in sorted(stat) if d in off and d.weekday() >= 5 for n in reversed(stat[d])] + \
        [(d, n) for d in sorted(stat) if d in off and d.weekday() < 5 for n in stat[d][:-1]]
    for d, n in owed:
        same = [f for f in free if off[f] == off[d]]
        pick = [f for f in same if f > d][:1] or same[-1:] or \
            [f for f in free if 0 < (f - d).days <= 14][:1]
        if pick:
            names[pick[0]] = [f"{n.split('（')[0]}（补休）"]
            free.remove(pick[0])
        else:
            problems.append(("第六条 补休 not given", (d, n)))
    for d in free:
        names[d] = [f"{off[d]}（调休）"]
    for d in sorted(off):
        names.setdefault(d, [f"{off[d]}（休息日）"])
    paid = len(free)
    if paid != len(working) + len(cancelled):
        problems.append(("调休 days vs 上班 days", (paid, sorted(free), sorted(working | cancelled))))
    return names, working, problems


@__import__("functools").lru_cache(maxsize=None)
def _cn_all(first: int, last: int):
    days: dict[date, list[str]] = {}
    working: set = set()
    problems = []
    for y in range(min(first, 2000), CN_LAST_NOTICE_YEAR + 1):
        n, w, p = cn_label(y)
        for d, names in n.items():
            days[d] = names
        working |= w
        problems += [(y,) + x for x in p]
    for y in range(CN_LAST_NOTICE_YEAR + 1, LAST + 1):
        for d, n in cn_statutory(y):
            days.setdefault(d, []).append(n)
    return days, working, problems


def cn_holidays(year: int) -> list[tuple[date, str]]:
    days, _, _ = _cn_all(2000, LAST)
    return [(d, " / ".join(n)) for d, n in sorted(days.items()) if d.year == year]


def cn_working_days(year: int) -> list[date]:
    _, working, _ = _cn_all(2000, LAST)
    return sorted(d for d in working if d.year == year)


def cn_consistency_check(days: dict) -> None:
    _, _, problems = _cn_all(2000, LAST)
    for p in problems:
        print("  CN notice vs statute:", *p)
    print(f"  CN 2000-{CN_LAST_NOTICE_YEAR}: {len(problems)} notice blocks where the statute and the notice differ")


def _cn_sources(first: int, last: int) -> list[tuple[str, str, str]]:
    out = list(CN_STATUTE_SOURCES)
    for n in CN_NOTICES:
        if first <= n["year"] <= last:
            body = " ".join(f"{s}：{t}" for s, t in cn_sections(n))
            kind = n.get("kind", "primary")
            title = f"{n['no']} ({n['year']}; {kind}{'; ' + n['note'] if n.get('note') else ''})"
            out.append((title, n["uri"], body))
    return out

# --- registry and writer --------------------------------------------------

COUNTRIES = {
    "KR": dict(name="South Korea", build=kr_holidays, sources=KR_SOURCES, note=KR_NOTE,
               python=lambda years: __import__("holidays").KR(years=years),
               crosscheck=kr_official_check),
    "HK": dict(name="Hong Kong", build=hk_holidays, sources=HK_SOURCES, note=HK_NOTE,
               python=lambda years: __import__("holidays").HK(years=years, categories=("public", "optional")),
               crosscheck=hk_official_check),
    "ID": dict(name="Indonesia", first=2005, build=id_holidays, cuti=id_cuti, sources=ID_SOURCES, note=ID_NOTE,
               python=lambda years: __import__("holidays").ID(years=years)),
    "PH": dict(name="Philippines", build=ph_holidays, sources=PH_SOURCES, note=PH_NOTE,
               python=lambda years: __import__("holidays").PH(years=years)),
    "MY": dict(name="Malaysia", first=MY_FIRST_LIST, build=my_holidays, sources=MY_SOURCES, note=MY_NOTE,
               python=lambda years: __import__("holidays").MY(years=years)),
    "VN": dict(name="Vietnam", build=vn_holidays, working=vn_working_days, working_label="làm bù",
               sources=VN_SOURCES, note=VN_NOTE,
               python=lambda years: __import__("holidays").VN(years=years),
               crosscheck=vn_consistency_check),
    "CN": dict(name="China", first=CN_FIRST_PRIMARY, build=cn_holidays, working=cn_working_days,
               working_label="上班", sources=lambda: _cn_sources(CN_FIRST_PRIMARY, CN_LAST_NOTICE_YEAR),
               note=CN_NOTE, python=lambda years: __import__("holidays").CN(years=years, language="zh_CN"),
               python_weekdays_only=True, crosscheck=cn_consistency_check),
    "CN-SECONDARY": dict(name="China (secondary sources)", country="CN", first=2000, last=CN_FIRST_PRIMARY - 1,
                         file="cn-secondary-holiday-gold.sexp", confidence="secondary",
                         build=cn_holidays, working=cn_working_days, working_label="上班",
                         sources=lambda: _cn_sources(2000, CN_FIRST_PRIMARY - 1), note=CN_SECONDARY_NOTE,
                         python=lambda years: __import__("holidays").CN(years=years, language="zh_CN"),
                         python_weekdays_only=True),
    "TW": dict(name="Taiwan", build=tw_holidays, working=tw_working_days, sources=TW_SOURCES, note=TW_NOTE,
               python=lambda years: __import__("holidays").TW(years=years),
               crosscheck=tw_official_check),
}


def lisp_string(s: str) -> str:
    return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'


def build(cc: str) -> None:
    spec = COUNTRIES[cc]
    first = spec.get("first", FIRST)
    last = spec.get("last", LAST)
    country = spec.get("country", cc)
    sources = spec["sources"]() if callable(spec["sources"]) else spec["sources"]
    days: dict[date, list[str]] = {}
    for year in range(first, last + 1):
        for d, name in spec["build"](year):
            assert d.year == year, (cc, d, name)
            if name not in days.setdefault(d, []):
                days[d].append(name)
    lines = [
        f";; {spec['name']} national holidays {first}-{last}: external gold for {country}.",
        f";; Regenerate: uv run --no-project --with holidays==0.109 python -I "
        f"scripts/generate_asia_holiday_gold.py {cc}",
        ";; :days lists every holiday as (YEAR MONTH DAY NAME); any other day is not one.",
        "(",
        f" :country {lisp_string(country)}",
        f" :generated {lisp_string(GENERATED)}",
        f" :from {first} :to {last}",
        f" :note {lisp_string(spec['note'])}",
        " :sources",
        " (",
    ]
    if spec.get("confidence"):
        lines.insert(lines.index(" :sources"), f" :confidence :{spec['confidence']}")
    for title, uri, text in sources:
        lines.append(f"  (:title {lisp_string(title)} :uri {lisp_string(uri)}")
        lines.append(f"   :text {lisp_string(text)})")
    lines.append(" )")
    lines.append(" :days")
    lines.append(" (")
    for d in sorted(days):
        lines.append(f"  ({d.year} {d.month} {d.day} {lisp_string(' / '.join(days[d]))})")
    lines.append(" )")
    if spec.get("working"):
        lines.append(" :working-days")
        lines.append(" (")
        for year in range(first, last + 1):
            for d in spec["working"](year):
                lines.append(f"  ({d.year} {d.month} {d.day} {lisp_string(spec.get('working_label', '補行上班'))})")
        lines.append(" )")
    if spec.get("cuti"):
        lines.append(" :cuti-bersama")
        lines.append(" (")
        for year in range(first, LAST + 1):
            for d, name in spec["cuti"](year):
                lines.append(f"  ({d.year} {d.month} {d.day} {lisp_string(name)})")
        lines.append(" )")
    if lines[-1] == " )":
        lines[-1] = " ))"
    else:
        lines.append(")")
    out = ROOT / "data" / "tests" / spec.get("file", f"{cc.lower()}-holiday-gold.sexp")
    out.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"{cc}: {len(days)} days -> {out.relative_to(ROOT)}")
    if spec.get("crosscheck"):
        spec["crosscheck"](days)

    # Secondary check only.
    try:
        py = spec["python"](range(first, last + 1))
    except ImportError:
        print(f"{cc}: python-holidays not installed, secondary check skipped")
        return
    ours, theirs = set(days), set(py.keys())
    if spec.get("python_weekdays_only"):
        # python-holidays lists no Saturday or Sunday of a window that is no statutory day.
        ours = {d for d in ours if d.weekday() < 5}
        theirs = {d for d in theirs if d.weekday() < 5}
    for d in sorted(ours - theirs):
        print(f"  {cc} {d} gold only: {days[d]}")
    for d in sorted(theirs - ours):
        print(f"  {cc} {d} python-holidays only: {py.get(d)}")
    print(f"{cc}: {len(ours ^ theirs)} differences with python-holidays {__import__('holidays').__version__}")


def main(argv: list[str]) -> int:
    for cc in argv or sorted(COUNTRIES):
        build(cc.upper())
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
