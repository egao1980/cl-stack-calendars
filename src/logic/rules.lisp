(in-package #:cl-stack-calendars/logic)

;;;; Observance policies as named rule modules (stratified Datalog).
;;;;
;;;; Every module keeps the statute it implements in :AUTHORITY; each rule it
;;;; contributes carries (:module NAME :authority …) in its RULE-PROPERTIES,
;;;; so a proof of (holiday D NAME) cites the statutes it used.
;;;;
;;;; Base facts (FACTS.LISP builds them per calendar and year window; dates
;;;; are Rata Die integers, so <, <=, >= compare dates):
;;;;
;;;;   (day D) (next-day D E) (weekday D W) (month-day D M DOM) (window-start D)
;;;;   (weekend-dow D)                  D's weekday is in CALENDAR-WEEKEND-DAYS
;;;;   (working-override D)             decree working day (CALENDAR-WORKING-DAYS)
;;;;   (suppressed D)                   proclamation removed D (SUPPRESSED-DATES)
;;;;   (transfer-to D NAME)             decree extra day off (CALENDAR-TRANSFERS)
;;;;   (transfer-from D)                a rest day the decree itself moves
;;;;   (nominal D NAME POLICY)          a rule's nominal date, POLICY a statute
;;;;                                    keyword or :NONE (validity window and
;;;;                                    :OBSERVED-FROM already applied)
;;;;   (era KEY D)                      calendar-level eras (JP sandwich/furikae)
;;;;   (succ N N+1)                     small counters for the substitute queue
;;;;
;;;; NEXT is reserved by logic-protocol (Dedalus time-step heads), hence
;;;; NEXT-DAY. Nominal date arithmetic (Easter, nth weekday, equinoxes, lunar
;;;; dates) stays in Lisp: the Datalog backend has no function symbols and
;;;; no arithmetic. Only the decisions about which day wins live here.

(defstruct (rule-module (:constructor %make-rule-module))
  (name nil :type keyword)
  (authority nil)
  (uri nil)
  (forms '() :type list))

(defvar *rule-modules* (make-hash-table :test 'eq)
  "NAME → RULE-MODULE.")

(defmacro define-rule-module (name (&key authority uri) &body forms)
  "Register rule module NAME: FORMS are logic-protocol surface rules
(rule HEAD :- LIT…), read in this package. AUTHORITY cites the statute."
  `(setf (gethash ,name *rule-modules*)
         (%make-rule-module :name ,name :authority ',authority :uri ',uri
                            :forms ',forms)))

(defun find-rule-module (name)
  (or (gethash name *rule-modules*)
      (error 'cal:calendar-error
             :message (format nil "no logic rule module ~s" name))))

(defun list-rule-modules ()
  (sort (loop for k being the hash-keys of *rule-modules* collect k)
        #'string< :key #'symbol-name))

(defun module-rules (module)
  "MODULE's forms parsed into RULE objects that cite its authority."
  (let ((m (if (rule-module-p module) module (find-rule-module module))))
    (loop for form in (rule-module-forms m)
          for i from 0
          collect (lp:parse-rule form
                                 :name (format nil "~(~a~)/~d" (rule-module-name m) i)
                                 :properties (list :module (rule-module-name m)
                                                   :authority (rule-module-authority m))))))

;;; --- precedence (every rule calendar) -----------------------------------
;;;
;;; What beats what, by construction (one stratum each, no clause order):
;;;   suppressed  >  holiday  >  working-day override  >  weekend.
;;; A day that any live nominal or decree transfer names is OCCUPIED, and no
;;; substitute may land on an occupied day, whichever rule is listed first.

(define-rule-module :core-precedence
    (:authority "cl-stack-calendars engine contract: a suppressed date is never a holiday; a holiday is never a business day; a decree working day is not a weekend day")
  (rule (nominal-live ?d ?n ?p) :- (nominal ?d ?n ?p) (not (suppressed ?d)))
  (rule (occupied ?d) :- (nominal-live ?d ?n ?p))
  (rule (occupied ?d) :- (transfer-to ?d ?n) (not (suppressed ?d)))
  (rule (rest-dow ?d) :- (weekend-dow ?d) (not (working-override ?d)))
  (rule (holiday ?d ?n) :- (observed ?d ?n) (not (suppressed ?d)))
  (rule (holiday-day ?d) :- (holiday ?d ?n))
  (rule (business-day ?d) :- (day ?d) (not (rest-dow ?d)) (not (holiday-day ?d))))

(define-rule-module :nominal-observance
    (:authority "The rule's own :AUTHORITY: a holiday with no observance policy is observed on its nominal date")
  (rule (observed ?d ?n) :- (nominal-live ?d ?n :none)))

(define-rule-module :decree-transfers
    (:authority "Government decree weekend transfers (e.g. Постановление Правительства РФ; cuti bersama; proclamations): the TO date is a day off")
  (rule (observed ?d ?n) :- (transfer-to ?d ?n)))

;;; --- US: 5 U.S.C. § 6103(b) + EO 11582 § 3(a) ------------------------------

(define-rule-module :us-federal-in-lieu
    (:authority ("5 U.S.C. § 6103(b) (Saturday → preceding Friday)"
                 "Exec. Order No. 11582 § 3(a) (Sunday → following Monday)")
     :uri ("https://uscode.house.gov/view.xhtml?req=granuleid:USC-prelim-title5-section6103"
           "https://www.federalregister.gov/executive-order/11582"))
  (rule (in-lieu ?d ?n ?d) :- (nominal-live ?d ?n :us-federal-in-lieu) (not (weekend-dow ?d)))
  (rule (in-lieu ?f ?n ?d) :- (nominal-live ?d ?n :us-federal-in-lieu) (weekday ?d 6) (next-day ?f ?d))
  (rule (in-lieu ?m ?n ?d) :- (nominal-live ?d ?n :us-federal-in-lieu) (weekday ?d 7) (next-day ?d ?m))
  (rule (observed ?t ?n) :- (in-lieu ?t ?n ?d))
  ;; § 6103(b) is unconditional: the in-lieu day is a holiday even when it
  ;; is already one. Nothing vanishes; the coincidence is a fact to report.
  (rule (in-lieu-collision ?t ?n ?m) :- (in-lieu ?t ?n ?d) (nominal-live ?t ?m ?p) (/= ?n ?m)))

;;; --- exclusive substitutes: one FIFO queue per policy -------------------
;;;
;;; A policy module says which nominal days ARRIVE (need a substitute) and
;;; which days are FREE (may take one). The queue walks the window day by
;;; day: the k-th arrival takes the k-th free day after it. Exclusivity and
;;; date order come from the walk, not from the order rules are listed in.

(define-rule-module :substitute-queue
    (:authority "Exclusive substitute days, assigned in date order (BFDA 1971 proclamations: Christmas and Boxing Day substitutes are distinct days; ТК РФ ст. 112 ч. 2)")
  (rule (queue ?p) :- (arrive ?p ?d ?n))
  (rule (arrive-day ?p ?d) :- (arrive ?p ?d ?n))
  (rule (q-in ?p ?d 0 0) :- (queue ?p) (window-start ?d))
  (rule (q-out ?p ?d ?a1 ?s) :- (q-in ?p ?d ?a ?s) (arrive-day ?p ?d) (succ ?a ?a1))
  (rule (q-arrival ?p ?d ?a1) :- (q-in ?p ?d ?a ?s) (arrive-day ?p ?d) (succ ?a ?a1))
  (rule (q-out ?p ?d ?a ?s1) :- (q-in ?p ?d ?a ?s) (not (arrive-day ?p ?d)) (free ?p ?d)
        (< ?s ?a) (succ ?s ?s1))
  (rule (q-served ?p ?d ?s1) :- (q-in ?p ?d ?a ?s) (not (arrive-day ?p ?d)) (free ?p ?d)
        (< ?s ?a) (succ ?s ?s1))
  (rule (q-out ?p ?d ?a ?s) :- (q-in ?p ?d ?a ?s) (not (arrive-day ?p ?d)) (not (free ?p ?d)))
  (rule (q-out ?p ?d ?a ?s) :- (q-in ?p ?d ?a ?s) (not (arrive-day ?p ?d)) (free ?p ?d) (= ?s ?a))
  (rule (q-in ?p ?e ?a ?s) :- (q-out ?p ?d ?a ?s) (next-day ?d ?e))
  (rule (substitute ?p ?t ?h) :- (q-served ?p ?t ?k) (q-arrival ?p ?h ?k))
  (rule (observed ?t ?n) :- (substitute ?p ?t ?h) (arrive ?p ?h ?n)))

(define-rule-module :uk-proclamation-substitute
    (:authority ("Banking and Financial Dealings Act 1971 s.1 & Sch.1; Royal Proclamations (substitute weekday when a bank holiday falls on a weekend — normally the following Monday; exclusive across Christmas/Boxing)")
     :uri ("https://www.legislation.gov.uk/ukpga/1971/80" "https://www.gov.uk/bank-holidays"))
  ;; The bank holiday is the substitute weekday; the weekend date itself is
  ;; not listed (gov.uk lists only the substitute).
  (rule (observed ?d ?n) :- (nominal-live ?d ?n :uk-proclamation-substitute) (not (weekend-dow ?d)))
  (rule (arrive :uk-proclamation-substitute ?d ?n) :-
        (nominal-live ?d ?n :uk-proclamation-substitute) (weekend-dow ?d))
  (rule (free :uk-proclamation-substitute ?d) :- (day ?d) (not (weekend-dow ?d)) (not (occupied ?d))))

(define-rule-module :ru-tk-112-transfer
    (:authority ("Трудовой кодекс РФ ст. 112 ч. 2 — при совпадении выходного и нерабочего праздничного дня выходной переносится на следующий рабочий день, за исключением праздников 1–8 января (их переносит Правительство РФ)"
                 "Трудовой кодекс РФ ст. 112 ч. 5 — Правительство РФ переносит выходные дни (постановление о переносе)")
     :uri ("http://www.consultant.ru/document/cons_doc_LAW_34683/"))
  (rule (observed ?d ?n) :- (nominal-live ?d ?n :ru-tk-112-transfer))
  (rule (ru-decree-block ?d) :- (month-day ?d 1 ?dom) (<= ?dom 8))
  ;; A rest day that the year's decree moves itself (its FROM date) is not
  ;; moved a second time by ч. 2: e.g. 2019-02-23 → 2019-05-10, so
  ;; 2019-02-25 stays a working day.
  (rule (arrive :ru-tk-112-transfer ?d ?n) :-
        (nominal-live ?d ?n :ru-tk-112-transfer) (weekend-dow ?d)
        (not (ru-decree-block ?d)) (not (transfer-from ?d)))
  ;; "следующий рабочий день": a decree working Saturday is a working day.
  (rule (free :ru-tk-112-transfer ?d) :- (day ?d) (not (rest-dow ?d)) (not (occupied ?d))))

;;; --- Japan: 祝日法 第3条 ---------------------------------------------------

(define-rule-module :jp-shukujitsu
    (:authority "国民の祝日に関する法律第2条 — 国民の祝日 (the nominal dates)")
  (rule (shukujitsu ?d) :- (nominal-live ?d ?n ?p)))

(define-rule-module :jp-kokumin-no-kyujitsu
    (:authority ("国民の祝日に関する法律第3条第3項 — その前日及び翌日が国民の祝日である日（国民の祝日でない日に限る。）は休日とする（昭和60年法律第103号）")
     :uri ("https://www8.cao.go.jp/chosei/shukujitsu/gaiyou.html"))
  ;; Sunday is excluded as the engine does (it is a rest day already, and a
  ;; 国民の休日 is not a 祝日, so it would never trigger 振替).
  (rule (observed ?m "国民の休日") :-
        (era :sandwich-from ?f) (shukujitsu ?a) (next-day ?a ?m) (next-day ?m ?b) (shukujitsu ?b)
        (not (shukujitsu ?m)) (not (weekday ?m 7)) (>= ?m ?f)))

(define-rule-module :jp-furikae
    (:authority ("国民の祝日に関する法律第3条第2項 — 祝日が日曜日に当たるとき、その日後においてその日に最も近い国民の祝日でない日を休日とする（平成19年法律第5号）"
                 "昭和48年法律第10号 (1973-04-12): 日曜日の祝日の翌日を休日とする")
     :uri ("https://www8.cao.go.jp/chosei/shukujitsu/gaiyou.html"))
  (rule (furikae-sunday ?d) :- (shukujitsu ?d) (weekday ?d 7) (era :furikae-from ?f) (>= ?d ?f))
  ;; 1973-04-12 .. 2006-12-31: the next day only, and only if it is not a 祝日.
  (rule (observed ?m "振替休日") :-
        (furikae-sunday ?d) (era :furikae-chain-from ?c) (< ?d ?c) (next-day ?d ?m)
        (not (shukujitsu ?m)))
  ;; From 2007-01-01: the nearest following day that is not a 祝日.
  (rule (furikae-walk ?d ?e) :-
        (furikae-sunday ?d) (era :furikae-chain-from ?c) (>= ?d ?c) (next-day ?d ?e))
  (rule (furikae-walk ?d ?e2) :- (furikae-walk ?d ?e) (shukujitsu ?e) (next-day ?e ?e2))
  (rule (observed ?e "振替休日") :- (furikae-walk ?d ?e) (not (shukujitsu ?e))))

;;; --- composite calendars (#29) ------------------------------------------
;;;
;;; Facts: (constituent C), (day D), (member-holiday C D NAME),
;;; (member-business C D). Constituent models come from their own programs.

(define-rule-module :composite-union
    (:authority "Joint settlement: a day is a holiday if any constituent has one, and a business day only when every constituent works (cl-stack-calendars#29)")
  (rule (holiday ?d ?n) :- (member-holiday ?c ?d ?n))
  (rule (holiday-day ?d) :- (holiday ?d ?n))
  (rule (blocked ?d) :- (constituent ?c) (day ?d) (not (member-business ?c ?d)))
  (rule (business-day ?d) :- (day ?d) (not (blocked ?d))))

(define-rule-module :composite-intersection
    (:authority "A day is a holiday only when every constituent has one (no constituents: no holidays), and a business day when any constituent works (cl-stack-calendars#29)")
  (rule (has-constituent :yes) :- (constituent ?c))
  (rule (missing ?d) :- (constituent ?c) (day ?d) (not (member-holiday-day ?c ?d)))
  (rule (member-holiday-day ?c ?d) :- (member-holiday ?c ?d ?n))
  (rule (holiday-day ?d) :- (day ?d) (has-constituent :yes) (not (missing ?d)))
  (rule (holiday ?d ?n) :- (holiday-day ?d) (member-holiday ?c ?d ?n))
  (rule (business-day ?d) :- (member-business ?c ?d)))
