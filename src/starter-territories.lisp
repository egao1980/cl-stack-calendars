(in-package #:cl-stack-calendars)

;;;; Register a calendar for every corpus code without a hand-maintained
;;;; DEFINE-CALENDAR starter: the corpus-derived rule calendar when it
;;;; reproduces the corpus, else the corpus itself (CORPUS-DERIVED-CALENDAR).
;;;; Neither is normative.

(register-corpus-inferred-territory-starters)
