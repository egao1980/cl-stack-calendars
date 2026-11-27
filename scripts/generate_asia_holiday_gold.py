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


# --- registry and writer --------------------------------------------------

COUNTRIES = {
    "KR": dict(name="South Korea", build=kr_holidays, sources=KR_SOURCES, note=KR_NOTE,
               python=lambda years: __import__("holidays").KR(years=years),
               crosscheck=kr_official_check),
    "HK": dict(name="Hong Kong", build=hk_holidays, sources=HK_SOURCES, note=HK_NOTE,
               python=lambda years: __import__("holidays").HK(years=years, categories=("public", "optional")),
               crosscheck=hk_official_check),
    "PH": dict(name="Philippines", build=ph_holidays, sources=PH_SOURCES, note=PH_NOTE,
               python=lambda years: __import__("holidays").PH(years=years)),
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
