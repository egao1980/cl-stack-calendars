#!/usr/bin/env python3
"""Freeze Korean and Vietnamese lunar festival dates into data/tests/lunisolar-festival-gold.sexp.

Run (network; Python only through uv, isolated):

    uv run --no-project python -I scripts/generate_lunisolar_festival_gold.py

Primary sources:

  kasi  Korea Astronomy and Space Science Institute, 음양력 변환
        https://astro.kasi.re.kr/life/pageView/8 (JSON /life/lunc?yyyy=&mm=&dd=,
        the non-leap "평" entry). 설날 = 음력 1/1, 추석 = 음력 8/15, 1948-2050.
  hnd   Ho Ngoc Duc, Am lich Viet Nam, amlich-hnd.js v0.8 tables TK20/TK21/TK22
        (Internet Archive copy of the offline Leipzig site)
        https://web.archive.org/web/2023id_/https://www.informatik.uni-leipzig.de/~duc/amlich/JavaScript/amlich-hnd.js
        Tết = âm lịch 1/1, Giỗ Tổ Hùng Vương = 10/3, 1945-2100.

Month-by-month gold for the engine lives in datetime-protocol
(data/tests/lunisolar-gold.sexp); this file locks the holiday dates the KR
and VN calendars publish.
"""

from __future__ import annotations

import hashlib
import json
import re
import sys
import tempfile
import time
import urllib.request
from concurrent.futures import ThreadPoolExecutor
from datetime import date, timedelta
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "data" / "tests" / "lunisolar-festival-gold.sexp"
CACHE = Path(tempfile.gettempdir()) / "lunisolar-festival-gold-cache"
UA = "cl-stack-calendars lunisolar-gold refresh (https://github.com/egao1980/cl-stack-calendars)"
KASI_PAGE = "https://astro.kasi.re.kr/life/pageView/8"
KASI_LUNC = "https://astro.kasi.re.kr/life/lunc?yyyy={y:04d}&mm={m:02d}&dd={d:02d}"
HND_URI = ("https://web.archive.org/web/2023id_/"
           "https://www.informatik.uni-leipzig.de/~duc/amlich/JavaScript/amlich-hnd.js")


def fetch(url: str, tries: int = 4) -> bytes:
    for attempt in range(tries):
        try:
            req = urllib.request.Request(url, headers={"User-Agent": UA})
            with urllib.request.urlopen(req, timeout=60) as resp:
                return resp.read()
        except Exception:  # noqa: BLE001 - retry any transport error
            if attempt == tries - 1:
                raise
            time.sleep(2 * (attempt + 1))
    raise AssertionError("unreachable")


def cached(name: str, url: str) -> bytes:
    path = CACHE / name
    if path.exists() and path.stat().st_size > 0:
        return path.read_bytes()
    blob = fetch(url)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(blob)
    return blob


def kasi_solar(y: int, m: int, d: int) -> date:
    rows = json.loads(cached(f"kasi/lunc-{y:04d}-{m:02d}-{d:02d}.json", KASI_LUNC.format(y=y, m=m, d=d)))
    regular = [r for r in rows if r["LUNC_LEAP_MM"] == "평"]
    if len(regular) != 1:
        raise SystemExit(f"KASI lunar {y}/{m}/{d}: {rows}")
    r = regular[0]
    return date(int(r["SOLC_YYYY"]), int(r["SOLC_MM"]), int(r["SOLC_DD"]))


def kasi_rows() -> list[tuple]:
    jobs = [(y, kind, m, d) for y in range(1948, 2051)
            for kind, m, d in ((":seollal", 1, 1), (":chuseok", 8, 15))]
    with ThreadPoolExecutor(max_workers=4) as pool:
        dates = list(pool.map(lambda j: kasi_solar(j[0], j[2], j[3]), jobs))
    return [(y, kind, g.year, g.month, g.day) for (y, kind, _, _), g in zip(jobs, dates)]


def hnd_rows() -> tuple[list[tuple], str]:
    blob = cached("hnd/amlich-hnd.js", HND_URI)
    js = blob.decode("latin-1")
    tables = {name: [int(x, 16) for x in re.findall(r"0x[0-9a-fA-F]+", body)]
              for name, body in re.findall(r"var\s+(TK\d+)\s*=\s*new\s+Array\(([^)]*)\)", js)}
    rows = []
    for yy in range(1945, 2101):
        k = (tables["TK20"][yy - 1900] if yy < 2000 else
             tables["TK21"][yy - 2000] if yy < 2100 else tables["TK22"][yy - 2100])
        # decodeLunarYear(): Tết offset from 1 Jan, then regular month lengths.
        tet = date(yy, 1, 1) + timedelta(days=k >> 17)
        lengths = [(29, 30)[(k >> (4 + 11 - i)) & 1] for i in range(12)]
        leap_month = k & 0xF
        month3 = tet + timedelta(days=lengths[0] + lengths[1])
        if leap_month in (1, 2):
            month3 += timedelta(days=(29, 30)[(k >> 16) & 1])
        gio_to = month3 + timedelta(days=9)
        rows.append((yy, ":tet", tet.year, tet.month, tet.day))
        rows.append((yy, ":gio-to", gio_to.year, gio_to.month, gio_to.day))
    return rows, hashlib.sha256(blob).hexdigest()


def main() -> int:
    kasi = kasi_rows()
    hnd, sha = hnd_rows()
    want = {(2027, ":seollal"): (2027, 2, 7), (2028, ":seollal"): (2028, 1, 27),
            (2040, ":chuseok"): (2040, 9, 21), (2033, ":chuseok"): (2033, 9, 8),
            (2007, ":tet"): (2007, 2, 17), (2030, ":tet"): (2030, 2, 2),
            (2009, ":gio-to"): (2009, 4, 4), (2037, ":gio-to"): (2037, 4, 24),
            (2038, ":gio-to"): (2038, 4, 13)}
    index = {(r[0], r[1]): r[2:] for r in kasi + hnd}
    for key, value in want.items():
        if index.get(key) != value:
            raise SystemExit(f"anchor {key}: expected {value}, got {index.get(key)}")
    with OUT.open("w", encoding="utf-8") as fp:
        fp.write(";; Korean / Vietnamese lunar festival gold — regenerate:\n")
        fp.write(";;   uv run --no-project python -I scripts/generate_lunisolar_festival_gold.py\n")
        fp.write(";; Row: (YEAR KIND GY GM GD).\n(\n")
        fp.write(f" :generated {json.dumps(date.today().isoformat())}\n :sources (\n")
        fp.write(f"  (:id \"kasi\" :kind :official :uri {json.dumps(KASI_PAGE)} :api \"https://astro.kasi.re.kr/life/lunc\")\n")
        fp.write(f"  (:id \"hnd\" :kind :published-table :uri {json.dumps(HND_URI)} :sha256 {json.dumps(sha)})\n )\n")
        fp.write(" :blocks (\n")
        for source, rows in (("kasi", kasi), ("hnd", hnd)):
            fp.write(f"  (:source {json.dumps(source)} :kind :lunar-festival\n   :rows (\n")
            for y, kind, gy, gm, gd in rows:
                fp.write(f"     ({y} {kind} {gy} {gm} {gd})\n")
            fp.write("   ))\n")
        fp.write(" )\n)\n")
    print(f"wrote {OUT} kasi={len(kasi)} hnd={len(hnd)}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
