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


# --- registry and writer --------------------------------------------------

COUNTRIES = {
    "KR": dict(name="South Korea", build=kr_holidays, sources=KR_SOURCES, note=KR_NOTE,
               python=lambda years: __import__("holidays").KR(years=years),
               crosscheck=kr_official_check),
    "HK": dict(name="Hong Kong", build=hk_holidays, sources=HK_SOURCES, note=HK_NOTE,
               python=lambda years: __import__("holidays").HK(years=years, categories=("public", "optional")),
               crosscheck=hk_official_check),
    "TW": dict(name="Taiwan", build=tw_holidays, working=tw_working_days, sources=TW_SOURCES, note=TW_NOTE,
               python=lambda years: __import__("holidays").TW(years=years),
               crosscheck=tw_official_check),
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
    lines.append(" )")
    if spec.get("working"):
        lines.append(" :working-days")
        lines.append(" (")
        for year in range(FIRST, LAST + 1):
            for d in spec["working"](year):
                lines.append(f"  ({d.year} {d.month} {d.day} \"補行上班\")")
        lines.append(" )")
    lines.append(")")
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
