# Holiday rules on the logic family: migration design (DRAFT)

**Status:** draft for review, 2026-11-27, on cl-stack-calendars 0.4.1 (`origin/main` @ 8a114e0). Nothing here changes released behaviour. The prototype lives in new files only (`src/logic/`, `tests/logic/`) behind the secondary system `cl-stack-calendars/logic`. The primary system does not load it.

**Why:** the workspace rule *rules and logic go through the logic family* ([logic.md](https://github.com/egao1980/cl-stack/blob/main/docs/capabilities/logic.md), Track L). The engine review (#27, #28, #29, #31, #33, #34, #36) found that most of the engine's correctness bugs come from hand-rolled precedence: a `claimed` list threaded through rules in clause order, `ecase` policy tables, a `cond` stack in `%rule-calendar-year-map`, and first-match loops in the composite calendar.

**Coordination:** engine bugs are being fixed in place separately, after the NYSE fix (#11). This draft touches none of those code paths. It reads the engine's internals (`rule-nominal-date`, `rule-valid-at-p`, `%observed-applies-at-p`, the calendar slots) and leaves them alone.

---

## 1. Today's precedence semantics, precisely

This is what the code on `main` does, not what it should do. Function names refer to `src/rules.lisp`, `src/rule-calendar.lisp`, `src/composite-calendar.lisp`, `src/versioned-calendar.lisp` and `src/corpus-inference.lisp`.

### 1.1 One year map (`%rule-calendar-year-map calendar Y`)

The steps run in this fixed order:

1. **Rules, in definition order.** A list `claimed` starts empty.
   - If the calendar has `furikae-chain-p` (only JP), each rule contributes only its nominal date when the rule is valid (`rule-valid-at-p`). Per-rule `:observed` is ignored.
   - Otherwise `rule-occurrences` computes the nominal date. If `:observed-from` applies, it maps the statute keyword onto a mechanical atom (`canonicalize-observed`) and runs `observe-dates` (the `ecase` table):

     | Policy (atom) | Dates produced |
     |---|---|
     | none | the nominal date |
     | `:us-federal-in-lieu` → `:nearest-weekday` | Sat → Fri, Sun → Mon (`shift-nearest-past-weekend`). **Ignores `claimed`** |
     | `:uk-proclamation-substitute` → `:next-weekday` | the first day ≥ nominal that is not a weekend day and not in `claimed`. This applies **to weekday nominals too**: a weekday holiday whose date is already claimed moves forward. The weekend date itself is not listed |
     | `:ru-tk-112-transfer` | the nominal date, plus the first non-weekend, unclaimed day ≥ nominal when the nominal is a weekend day outside 1–8 January |
     | `:jp-furikae` (per rule) | the nominal date, plus the next free weekday when the nominal is a Sunday |
     | `:substitute-next`, `:monday`, `:previous-weekday` | mechanical atoms (no starter uses them) |
     | `:bridge :adjacent` | adds Mon before a Tue holiday or Fri after a Thu holiday (no starter uses it) |

     "Weekend" here is `(member dow weekend-days)`. It ignores `calendar-working-days`.
   - `observe-dates` then **removes every date already in `claimed`**. The result can be empty: the holiday disappears.
   - Each surviving date that is not in `suppressed-dates` is recorded and pushed onto `claimed`.
2. **国民の休日 (sandwich)** runs if `sandwich-holidays-p` and the year bound passes. A **date** bound always passes (#36 item 3). A day D is inserted when D is not in the set, D+1 is in it, and D is not a Sunday. The set contains everything recorded so far, including substitutes.
3. **振替休日 chain** (JP only). For a Sunday ≥ `furikae-from` that is in the set: before `furikae-chain-from` the observance is the next day, unless that day is in the set. From `furikae-chain-from` on, it is the first following day not in the set. The set includes sandwich days.
4. **Decree transfers.** Every `transfer-to` date in years Y−1…Y+1 that is not suppressed is recorded. It is pushed onto `claimed`, but no rule reads `claimed` after this step.
5. **Hash table.** The records are stored newest first, so on a shared date the earliest-recorded name wins. Rule names beat transfer names, and the first rule listed beats later ones.

### 1.2 Queries

- `holiday-p`: a suppressed date → NIL. Otherwise it looks the date up in the maps of Y−1, Y and Y+1, in that order, and the first hit wins. That is three full map builds per call (#34).
- `weekend-day-p` (rule-calendar): `dow ∈ weekend-days` **and** the date is not a `calendar-working-days` entry (linear `find`).
- `business-day-p`: not `weekend-day-p` and not `holiday-p`.

So for business days the order is: **suppressed > holiday > working-day override > weekend**. A decree working day that is also a holiday is not a business day. This matters in RU, where every decree FROM date is recorded as a working day, including 6 and 7 January 2024, which stay holidays.

Inside the holiday set: **the first rule listed claims the day**. A later rule either moves (if its policy reads `claimed`) or disappears. Transfers never displace anything.

### 1.3 Composite and versioned

- `composite-calendar :union`: the first constituent with a holiday wins (its name). `:intersection`: every constituent must have one, and an **empty constituent list makes every date a holiday** (#29). The weekend is the `:weekend-days` override or the **first** constituent's `calendar-weekend-days`. `weekend-day-p` is the protocol default, so **working-day overrides are lost** (#29).
- `versioned-calendar`: delegates `holiday-p` and `calendar-weekend-days` to `calendar-as-of`, but not `weekend-day-p`, so the overrides are lost there too.

### 1.4 Corpus inference (`corpus-inference.lisp`)

These are selection heuristics, not precedence:

- a fixed (month, day) bucket recurring in ≥ 30 years from 2000 becomes a rule;
- a Western-Easter offset within ±60 days recurring in ≥ 25 years becomes a rule;
- an Easter rule is dropped when its **2024** date shares a month/day with a fixed rule;
- the name comes from the latest year;
- the result is registered under the ISO code whenever no hand starter exists, whatever its coverage (#33).

---

## 2. Mapping onto the logic family

### 2.1 Recommended backend: `logic-backend-datalog` (stratified negation)

| Candidate | Verdict |
|---|---|
| **logic-protocol + logic-backend-datalog 0.2.0** | **Use it.** Observance is deterministic, so no choice is needed. Everything in §1.1–1.3 fits stratified Datalog over a finite per-year window of day facts. The backend is published, incremental, and gives proofs and why-not traces. The prototype runs on it unchanged. |
| ASP (`logic-backend-asp`, L5) | Not needed, and it does not exist yet. Exclusive substitutes could be written as a choice rule with "at most one substitute per day" and `#minimize` on lateness, but optimal answers can tie, and a tie means a non-deterministic calendar. The deterministic first-in-first-out walk in §2.3 is the statute's own reading. ASP fits corpus inference instead (§2.6). |
| Prolog (L6) | Not needed: the rules do not search and have no function symbols beyond day successor. |
| policy-protocol | Wrong shape (permit / forbid / ask over requests). Its layers-only-tighten model does not describe observance. |
| sat-protocol | For analysis and selection, not for evaluation. Corpus inference is a weighted set cover (`minimize`). Questions such as "can two substitutes ever collide in this calendar" go through the `logic-protocol/sat` bridge once it lands (L2). |

### 2.2 What stays in Lisp

The Datalog backend has **no arithmetic and no function symbols**, by design (finite evaluation, analysable subset). So **nominal dates stay Lisp functions**: Easter, nth weekday, equinoxes, lunar and Hijri dates (#28 becomes "return a list" in the nominal generator). They become **base facts**. Day arithmetic becomes facts too: `(day D)`, `(next-day D D+1)`, `(weekday D W)`, `(month-day D M DOM)`, with dates as Rata Die integers so that `<`, `<=` and `>=` compare dates. `next` is reserved by logic-protocol for Dedalus heads, hence `next-day`.

Base facts per (calendar, year): the window runs from 1 December of Y−1 to 31 January of Y+1, which is about 427 days. Facts:

- `(nominal D NAME POLICY)` for each rule's nominal date of Y−1, Y and Y+1 inside the window, after the validity window and `:observed-from` are applied;
- `(weekend-dow D)`, `(working-override D)`, `(suppressed D)`, `(transfer-to D NAME)`, `(transfer-from D)`;
- `(era :sandwich-from D)`, `(era :furikae-from D)`, `(era :furikae-chain-from D)`;
- `(succ N N+1)` for N in 0…64 (queue counters);
- `(window-start D)`.

That is about 3,500 facts per year.

### 2.3 Rule modules (prototype: `src/logic/rules.lisp`)

Each observance policy is a **named rule module that keeps its statute** (`define-rule-module NAME (:authority … :uri …) rules…`). Every rule carries `(:module NAME :authority …)` in its `rule-properties`, so `logic-explain-holiday` returns the proof together with the statutes it used (`proof-authorities`). Which modules a calendar loads is a data lookup (`*policy-modules*`), not a decision chain.

**Core precedence** (every rule calendar). Each line is one stratum, and clause order plays no part:

```lisp
(rule (nominal-live ?d ?n ?p) :- (nominal ?d ?n ?p) (not (suppressed ?d)))
(rule (occupied ?d)           :- (nominal-live ?d ?n ?p))
(rule (occupied ?d)           :- (transfer-to ?d ?n) (not (suppressed ?d)))
(rule (rest-dow ?d)           :- (weekend-dow ?d) (not (working-override ?d)))   ; override beats weekend
(rule (holiday ?d ?n)         :- (observed ?d ?n) (not (suppressed ?d)))         ; suppressed beats holiday
(rule (holiday-day ?d)        :- (holiday ?d ?n))
(rule (business-day ?d)       :- (day ?d) (not (rest-dow ?d)) (not (holiday-day ?d)))  ; holiday beats override
```

**Occupancy is computed before any substitute is placed.** A substitute may land only on a day that no live nominal and no transfer names. This is the "two passes" fix of #27, obtained by stratification.

**US federal in-lieu** (5 U.S.C. § 6103(b), EO 11582 § 3(a)): `in-lieu` is Sat → the preceding Fri and Sun → the following Mon, through `next-day`. The in-lieu day is observed **unconditionally**, as § 6103(b) reads. If it is already a holiday, both names are kept and an `in-lieu-collision` fact records it. Nothing vanishes (#27 item 2).

**Exclusive substitutes: one first-in-first-out queue per policy** (`:substitute-queue`). A policy module defines `(arrive P D NAME)` (this nominal needs a substitute) and `(free P D)` (this day may take one). The queue walks the window day by day with `(q-in P D ARRIVED SERVED)` / `(q-out …)`, using `succ` facts as counters. On an arrival day ARRIVED goes up by one. On a free day with ARRIVED > SERVED, SERVED goes up by one and the day becomes the SERVED-th substitute. `(substitute P T H)` joins the k-th served day with the k-th arrival. The recursion is positive; it negates only lower strata (`arrive-day`, `free`). The k-th weekend holiday therefore takes the k-th free day after it, in **date order**, whatever order the rules are written in.

- `:uk-proclamation-substitute`: a weekday nominal is observed as is. A weekend nominal arrives and is not itself listed. A free day is a non-weekend day that is not occupied.
- `:ru-tk-112-transfer` (ТК РФ ст. 112 ч. 2 and ч. 5): the nominal is observed. A nominal on a weekend day arrives unless it is in 1–8 January (`(month-day ?d 1 ?dom) (<= ?dom 8)`) **or the year's decree moves that day itself** (`transfer-from`, ч. 5). A free day is a day that is not a rest day (a decree working Saturday counts as a working day) and is not occupied.

**Japan** (祝日法 第3条):

- `:jp-shukujitsu`: `(shukujitsu D)` for each live nominal (国民の祝日).
- `:jp-kokumin-no-kyujitsu` (第3条第3項): D is a holiday when both its neighbours are 祝日, D is not one, D is not a Sunday, and D ≥ `sandwich-from`. The rule reads 祝日 only, so it does not depend on whether substitutes were computed first. A date bound is honoured to the day (#36 item 3).
- `:jp-furikae` (第3条第2項): a Sunday 祝日 on or after `furikae-from`. Before `furikae-chain-from` it observes the next day when that day is not a 祝日 (昭和48年法律第10号). From then on, a walk `furikae-walk` finds the nearest following day that is not a 祝日 (平成19年法律第5号).

**Decree transfers**: `(observed D NAME) :- (transfer-to D NAME)`.

### 2.4 Composite modes as rule-set union / intersection (#29)

Composite calendars become one program over **constituent models**: `(constituent C)`, `(member-holiday C D NAME)`, `(member-business C D)`. A constituent that is a rule calendar takes these facts from its own year model; any other `holiday-calendar` takes them from `holiday-p` / `business-day-p`.

- `:composite-union` (joint settlement): a day is a holiday if any constituent has one, keeping every name. It is a business day only when every constituent works (`blocked` = some constituent is not a business day). Each constituent's own working-day overrides and weekend therefore count. This holds even with different weekends, such as US + AE.
- `:composite-intersection`: a day is a holiday only when every constituent has one, and an empty constituent list gives **no** holidays. It is a business day when any constituent works.

Versioned calendars need no rules: delegating `weekend-day-p` and `business-day-p` to `calendar-as-of` is the fix (#29), and it belongs to the in-place engine work.

### 2.5 Era-aware weekends (#31)

`(weekend-dow D)` is already a per-day base fact, so an era-aware weekend (`(from-date . weekend-days)` eras) changes only the fact builder. The US in-lieu module uses explicit Saturday / Sunday weekdays, as § 6103(b) does. On a Fri/Sat weekend calendar it should not apply at all, and the builder can refuse that combination (`unsupported-observance`).

### 2.6 Corpus inference (#33)

Inference is a **selection** problem: choose a small rule set that reproduces the corpus. Candidates (fixed, Easter offset, Orthodox offset, nth weekday, Hijri) are facts that state which corpus days each one covers. Weak constraints (logic-protocol 0.2 `:weak` rules, `weak-instances` → a SAT objective) cost each uncovered corpus day, each spurious day and each rule, and sat-protocol `minimize` (CDCL backend) picks the optimum. The registration gate ("≥ 99 % of the corpus days, else register the corpus") is then a policy over the result's coverage fact. This replaces the 30/25-year thresholds and the 2024-only de-duplication. It is an offline tool, so its speed does not matter.

---

## 3. Order-dependent bugs that disappear by construction

| Bug | Why it cannot happen on the logic engine |
|---|---|
| #27.1 a substitute swallows a later-listed holiday (RU 1994-05-03) | Occupancy is a lower stratum than substitutes. No substitute lands on any live nominal, whatever its position in the rule list. Prototype: `probe-ab` = `probe-ba` = 05-01 A, 05-02 B, 05-03 A; RU 1994 has 3 May |
| #27.2 `:us-federal-in-lieu` drops a holiday on a collision | The in-lieu day is derived unconditionally. A collision keeps both names and yields an `in-lieu-collision` fact. Prototype: 2021-12-24 "Eve / Xmas" |
| #27.3 `claimed` not shared across New Year | The window spans 1 Dec … 31 Jan, and the queue runs through it. Prototype: NYE → 2023-01-02, NY → 2023-01-03 |
| #27 "names lost on coincidences" (408 drops in 125 calendars) | `holiday` is a relation, so every name on a date is kept. Whether a coincidence earns a substitute becomes an explicit policy module, not an accident |
| UK substitute **names** (same dates, wrong labels) | The engine moves Boxing Day off its own weekday because Christmas claimed it first. With the queue, Boxing Day stays on 26 December and Christmas takes the 27th, as gov.uk lists them (2005, 2011, 2016, 2022, 2033, 2039) |
| #29 composite / versioned drop working-day overrides; the empty intersection is all holidays; the union uses the first constituent's weekend | Composite modes are rule modules over each constituent's own business-day facts. With an empty constituent set there is nothing to intersect. Prototype tests `composite-keeps-working-days` |
| #36.3 `:sandwich-from` date bound ignored | Eras are dates (RD) compared per day |
| ТК РФ ст. 112 applied on top of a decree that already moved the same day (2019-02-25, 2025-02-24, 2025-03-10 come out as days off) | `arrive` requires `(not (transfer-from ?d))`: the decree (ч. 5) and the automatic transfer (ч. 2) are one decision, made once |

Not fixed by the logic move itself: #28 (one nominal per year; the nominal generator must return a list), #31 (weekend data and the cache key), #33's data gap, #34's caching (made trivial by §5), and #36 items 1, 2, 4, 5, 6 and 7.

---

## 4. Prototype and results

```
src/logic/package.lisp   ; cl-stack-calendars/logic
src/logic/rules.lisp     ; define-rule-module + the modules of §2.3–2.4
src/logic/facts.lisp     ; calendar-year-facts, module selection, unsupported-observance (+ skip-rule)
src/logic/engine.lisp    ; per-year programs, cache, logic-holiday-p / -business-day-p / -holidays-between,
                         ; logic-explain-holiday, composite models
tests/logic/             ; cl-stack-calendars/logic/tests
```

Run it with `cl-repo run -- sbcl --non-interactive --eval '(asdf:test-system "cl-stack-calendars/logic")'`. Set `CAL_LOGIC_SWEEP=1` to add the sweep over every registered calendar.

The test compares the prototype with the current engine, day by day (`holiday-p` and `business-day-p`), and asserts the **exact** list of adjudicated differences.

### 4.1 2000–2040, the four requested calendars

| Calendar | Day differences | Name differences | Verdict |
|---|---|---|---|
| USFED | 0 | 0 | identical |
| GBLO | 0 | 12 (26/27 Dec in 2005, 2011, 2016, 2022, 2033, 2039) | same dates; **prototype names right** (gov.uk: 26th Boxing Day, 27th Christmas substitute) |
| JP | 0 | 0 | identical, including GW 2008/2020 chains and the 2009/2015/2026 Silver Week 国民の休日 |
| RU (registered, no decree) | 0 | 0 | identical |
| RU with each year's decree (`russian-holidays-calendar :year Y`, 2000–2040) | 3 | — | **prototype right**: 2019-02-25, 2025-02-24 and 2025-03-10 were working days. Decrees № 1163 (2018) and № 1335 (2024) moved 23 Feb → 10 May 2019, and 23 Feb → 8 May and 8 Mar → 13 Jun 2025. The engine also applies ч. 2 and gives an extra day off. RU 2024 (working Saturday 27 April, 29–30 April and 30–31 December off) is identical |
| RU 1994 (#27) | 1 | — | **prototype right**: 1994-05-03 is the substitute for Sunday 1 May. The engine loses it |

### 4.2 Sweep: every registered rule calendar, 1990–2050

All **228** registered rule calendars build on the prototype. The shipped corpus uses only `:us-federal-in-lieu`, `:uk-proclamation-substitute`, `:ru-tk-112-transfer` and JP's calendar-level 第3条. Across 61 years × 228 calendars, the **only** day whose holiday or business status differs is **RU 1994-05-03**. On **397 days in 124 calendars**, the prototype keeps several names where the engine keeps the first rule's name only. These are #27's coincidences; the review counted 408 in 125 calendars with a slightly different method.

The sweep compares through the engine's own year maps (three per year, exactly as `holiday-p` reads them) rather than 3 × 365 `holiday-p` calls, so it finishes in about 45 s. Run it with `CAL_LOGIC_SWEEP=1`. It asserts the exact result.

---

## 5. Performance

Measured on SBCL 2.6.9, arm64 (macOS), logic-backend-datalog 0.2.0. Cold means the cache is empty.

| What | Engine today | Prototype |
|---|---|---|
| One year, cold | one year map ≈ 0.07 ms on average (1.0 s for 228 × 61 × 3 maps), but `holiday-p` builds 3 of them **per call** and caches none | **≈ 3.2 ms** per (calendar, year) on average (43.8 s for 228 × 61): USFED 3.1, JP 3.7, GBLO 6.9, RU 7.7 ms. About 2,000–3,500 facts and 9–30 rules |
| Then `holiday-p` / `business-day-p` | 3 map builds per call (CN ≈ 2.8 ms per call, #34) | one hash lookup: 14,975 `business-day-p` calls in **4 ms** (KR, CN, JP) |
| `holidays-between` 2000–2040, KR | **39.5 s** here (56.6 s in #34) | **0.24 s** cold |
| `holidays-between` 2000–2040, CN | 28.7 s | **0.20 s** cold |
| `holidays-between` 2000–2040, JP | 7.3 s | **0.15 s** cold |
| Memory | none kept | the cache keeps two small hash tables per year. A program (CN 2024: 11 MB consed while building) is rebuilt only for `explain` |

Where a cold year goes (CN 2024: 1,914 facts, 9 rules): building the facts in Lisp (nominals for three years plus the day facts) takes 2.4 ms. `make-program` with the rules alone takes 0.05 ms, and adding the facts takes 2.7 ms. So rule compilation and stratification cost nothing here, and evaluation runs in a few milliseconds. The fact builder is the place to optimise: share the day facts across calendars, compute the nominals once.

So the Datalog backend does a year in **milliseconds**. Per uncached year it is about 40 times slower than one legacy map. #34's 57 s comes from rebuilding uncached maps per day, not from rule evaluation. With per-year materialisation and a cache (weak on the calendar and synchronised, as in `engine.lisp`), every query after the first in a year is a hash lookup, and multi-decade queries run 50–160 times faster. The cache must be invalidated on `setf` of a calendar slot. The prototype documents `clear-logic-cache` for that; the real migration adds the invalidation to the accessors.

Proofs: a substitute's proof threads the queue walk from the window start. For RU 1994-05-03 the proof height is 314. It is correct but too long to show. See gap B.

---

## 6. Public API: unchanged

`holiday-p`, `business-day-p`, `weekend-day-p`, `holidays-between`, `business-days-between`, `next-business-day`, `previous-business-day`, `add-business-days`, `adjust-date`, `event-schedule`, `define-calendar` and its clause syntax, the statute keywords, `make-composite-calendar`, `versioned-calendar` and the registry keep their signatures. Only the methods on `rule-calendar` and `composite-calendar` change their bodies to read the cached year model. `holidays-between` and `business-days-between` gain per-year methods.

The visible changes, each one a bug fix listed in §3:

- coinciding holidays return all their names, joined with " / ";
- the UK substitute labels;
- the RU days listed in §4.

Additive: `explain-holiday` (proof plus statutes) and `explain-business-day` (why-not).

---

## 7. Migration steps

1. **Land this draft's design** (no code in the primary system).
2. **Fix the in-place engine bugs first** (after #11): #36, #29 delegation for `versioned-calendar`, #31 cache key. These do not touch precedence, so they make no difference to the comparison.
3. **Shadow engine.** Add `cl-stack-calendars/logic` as a real secondary system: rule modules for every remaining atom (`:substitute-next`, `:monday`, `:previous-weekday`, `:bridge`, per-rule `:jp-furikae`), and #28's list-returning nominals. Add a comparison harness `compare-engines` with an exact adjudicated-difference file under `tests/`, and run it in CI over **1990–2050 for every registered calendar**, plus `russian-holidays-calendar :year Y`, `uk-bank-holidays-calendar :year Y` and the other per-year decree constructors (CN, KR, TW, VN, ID, PH, TH, MY…).
4. **Adjudicate** every difference against its statute, decree or gazette, and record it in the difference file with the citation. The engine side is only "right" where the in-place fixes agree.
5. **Switch.** `holiday-p` / `business-day-p` / `weekend-day-p` on `rule-calendar` and `composite-calendar` read the logic year model. The old year map stays one release behind `*calendar-engine* :legacy` for rollback. The existing test suite must pass **untouched** (Track L acceptance), plus a new explanation test (`explain-holiday` for RU 1994-05-03 names ТК РФ ст. 112).
6. **Delete** the `claimed` machinery, `observe-dates` / `apply-move-observed`, the sandwich and furikae passes and the `cond` stack. Release a minor version (0.5.0).
7. **Corpus inference** on sat-protocol (§2.6), with the coverage gate (#33).

---

## 8. Risks

- **Silent behaviour drift.** Mitigated by the exact difference file: CI fails on any new or vanished difference.
- **Name changes.** Callers that compare names see " / " joins and corrected UK labels. These go in the release notes.
- **Window edge.** A substitute chain that starts before 1 December of Y−1 is not seen. No calendar comes close; a property test can check that `year-model` is stable when the window is widened.
- **Queue bound.** The counters stop at 64 pending substitutes per window. The worst calendar has about 10. The real version signals when a window would exceed it.
- **Cache and threads.** `holiday-p` becomes stateful. Use synchronised, weak tables and invalidate on `setf`. `with-data-root` must clear the logic cache too (#36 item 6).
- **Portability.** `:weakness` / `:synchronized` are SBCL-only in the prototype. The real version needs a portable lock and weak table (trivial-garbage is already in the resolved dependency set; check for a cl-stack equivalent before depending on it directly).
- **Performance of very large calendars** (CN with hundreds of decree days): still milliseconds per year in the sweep, but measure again with every per-year decree constructor attached.

## 9. Gaps in the logic libraries (filed upstream, to fix there first)

| # | Gap | Effect here | Issue |
|---|---|---|---|
| A | No stratified aggregates (`min`, `count`) and no successor built-in | "First free day after D" needs a queue walk with `succ` counter facts and a `next-day` chain; with `min` it would be one rule | [logic-protocol#7](https://github.com/egao1980/logic-protocol/issues/7) |
| B | Proofs of long linear recursions are as deep as the walk (height 314 for one substitute) | `explain-holiday` must summarise them; the protocol should offer depth-bounded or chain-compressed proofs, or a cheap rules-used summary | [logic-protocol#8](https://github.com/egao1980/logic-protocol/issues/8) |
| C | `next` (and `choice`, `weak`) are reserved even as body relations, and the error reads "not a body literal" | A confusing first failure; document the reserved names and say so in the condition | [logic-protocol#9](https://github.com/egao1980/logic-protocol/issues/9) |

None of them blocks the migration: the prototype runs on the published logic-protocol 0.2.0 and logic-backend-datalog 0.2.0. A blocks only the simpler formulation, and B blocks showing proofs to users. Checked and **not** a gap: rule compilation and stratification per program (0.05 ms for 9 rules; the open logic-protocol#5 and #6 about re-stratification do not matter at this size). ASP (L5) and Prolog (L6) are not needed.

## 10. Proposed PR sequence

1. **This draft** (docs + prototype in new files). Not merged until reviewed.
2. In-place fixes (#11 first, then #36, #31, #29 versioned delegation). Separate track, already planned.
3. logic-protocol / logic-backend-datalog: gaps A–C (logic-protocol#7, #8, #9; their repos, their releases). Not blocking.
4. `cl-stack-calendars/logic` complete: every policy atom, #28 list nominals, `compare-engines` + the adjudicated difference file in CI (1990–2050, all calendars and per-year decree constructors).
5. Switch-over: `rule-calendar` / `composite-calendar` methods read the logic year model, with `explain-holiday`. The existing suite stays untouched and green. Release 0.5.0.
6. Removal of the legacy year map and its policy tables (0.6.0).
7. Corpus inference on sat-protocol with the coverage gate (#33).
