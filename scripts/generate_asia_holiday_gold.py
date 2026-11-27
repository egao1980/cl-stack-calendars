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


# --- registry and writer --------------------------------------------------

COUNTRIES = {
    "KR": dict(name="South Korea", build=kr_holidays, sources=KR_SOURCES, note=KR_NOTE,
               python=lambda years: __import__("holidays").KR(years=years),
               crosscheck=kr_official_check),
}


def lisp_string(s: str) -> str:
    return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'


def build(cc: str) -> None:
    spec = COUNTRIES[cc]
    days: dict[date, list[str]] = {}
    for year in range(FIRST, LAST + 1):
        for d, name in spec["build"](year):
            assert d.year == year, (cc, d, name)
            if name not in days.setdefault(d, []):
                days[d].append(name)
    lines = [
        f";; {spec['name']} national holidays {FIRST}-{LAST}: external gold for {cc}.",
        f";; Regenerate: uv run --no-project --with holidays==0.109 python -I "
        f"scripts/generate_asia_holiday_gold.py {cc}",
        ";; :days lists every holiday as (YEAR MONTH DAY NAME); any other day is not one.",
        "(",
        f" :country {lisp_string(cc)}",
        f" :generated {lisp_string(GENERATED)}",
        f" :from {FIRST} :to {LAST}",
        f" :note {lisp_string(spec['note'])}",
        " :sources",
        " (",
    ]
    for title, uri, text in spec["sources"]:
        lines.append(f"  (:title {lisp_string(title)} :uri {lisp_string(uri)}")
        lines.append(f"   :text {lisp_string(text)})")
    lines.append(" )")
    lines.append(" :days")
    lines.append(" (")
    for d in sorted(days):
        lines.append(f"  ({d.year} {d.month} {d.day} {lisp_string(' / '.join(days[d]))})")
    lines.append(" ))")
    out = ROOT / "data" / "tests" / f"{cc.lower()}-holiday-gold.sexp"
    out.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"{cc}: {len(days)} days -> {out.relative_to(ROOT)}")
    if spec.get("crosscheck"):
        spec["crosscheck"](days)

    # Secondary check only.
    try:
        py = spec["python"](range(FIRST, LAST + 1))
    except ImportError:
        print(f"{cc}: python-holidays not installed, secondary check skipped")
        return
    ours, theirs = set(days), set(py.keys())
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
