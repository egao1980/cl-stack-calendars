"""Greece: official holidays (επίσημες αργίες) 2000-2040, for
egao1980/cl-stack-calendars#22. Stdlib only; data, no logic. LOWER CONFIDENCE.

Cache: ~/.cache/cl-stack-calendars/gr/ (ypergasias.gov.gr ΦΕΚ PDFs and press releases; apdkritis.gov.gr;
secondary copies of the ministerial decisions, files named secondary-*)

Scope: the official holidays of the public sector (ΠΝΠ 29.12.1980 / Ν.
1157/1981, read on a government page, not in the ΦΕΚ), which also carries the
private-sector mandatory days of Ν. 4808/2021 art. 60 (ΦΕΚ Α' 101/2021, read):
1 and 6 January, Clean Monday, 25 March, Good Friday, Easter Monday, 1 May,
Holy Spirit Monday, 15 August, 28 October, 25 and 26 December. When 1 May falls
in Holy Week or on Easter Monday, the Ministry of Labour moves it by decision
(Ν. 4468/2017 art. 14 from 2017): 2013, 2016, 2021, 2022 and 2024 are rows here.
The decisions were read only in secondary copies (taxheaven, e-nomothesia):
the ΦΕΚ store could not be fetched. The ministry's press releases confirm the
2021, 2022 and 2024 dates. Future moves are not projected (2027, 2032, 2033,
2039, 2040 will need a decision).
"""

OBSERVE = True

_YP = "https://ypergasias.gov.gr/"

GR_STATUTES = [
    dict(key="pnp-1980", title="ΠΝΠ της 29.12.1980 (κυρώθηκε με τον Ν. 1157/1981): αργίες του δημοσίου",
         uri="https://www.apdkritis.gov.gr/el/%CE%B1%CF%81%CE%B3%CE%AF%CE%B5%CF%82", issued="1980-12-29", issued_uri=None,
         published=None, published_uri=None, published_in=None, in_force=None,
         dates_note="SECONDARY: the list as a government page (apdkritis.gov.gr) states it; the ΦΕΚ was not read.",
         summary="Public-sector official holidays: 1 and 6 January, Clean Monday, 25 March, Good Friday, Easter "
                 "Monday, 1 May, Holy Spirit Monday, 15 August, 28 October, 25 and 26 December."),
    dict(key="n-4808-2021", title="Ν. 4808/2021, άρθρο 60 (ημέρες υποχρεωτικής αργίας)",
         uri="https://ypergasias.gov.gr/ekdothike-i-efarmostiki-egkyklios-gia-to-neo-plaisio-pou-diepei-yperories-diefthetisi-tou-chronou-ergasias-dialeimmata-argies-prostasia-apo-tis-apolyseis/", issued="2021-06-19",
         issued_uri=None, published="2021-06-19",
         published_uri=None, published_in="ΦΕΚ Α' 101/19.06.2021",
         in_force="2021-06-19",
         dates_note="The signed ΦΕΚ was read in the Ministry of Labour's copy (cached as "
                    "ypergasias-n4808-2021-FEK-A-101.pdf, its download path not recorded); the URI is the ministry's "
                    "page on circular 64597/2021, which applies art. 60.",
         summary="Private-sector mandatory holidays: 1 Jan, 6 Jan, 25 Mar, Easter Monday, 1 May, 15 Aug, 28 Oct, "
                 "25 Dec, 26 Dec."),
]

GR_FIXED = [
    (1, 1, "Πρωτοχρονιά", [(1900, None)], "pnp-1980"),
    (1, 6, "Θεοφάνεια", [(1900, None)], "pnp-1980"),
    (3, 25, "Ευαγγελισμός / Εθνική Εορτή", [(1900, None)], "pnp-1980"),
    (5, 1, "Εργατική Πρωτομαγιά", [(1900, None)], "pnp-1980"),
    (8, 15, "Κοίμηση της Θεοτόκου", [(1900, None)], "pnp-1980"),
    (10, 28, "Επέτειος του Όχι", [(1940, None)], "pnp-1980"),
    (12, 25, "Χριστούγεννα", [(1900, None)], "pnp-1980"),
    (12, 26, "Σύναξις Θεοτόκου", [(1900, None)], "pnp-1980"),
]

_O = {"orthodox": True}
GR_EASTER = [
    (-48, "Καθαρά Δευτέρα", [(1900, None)], "pnp-1980", _O),
    (-2, "Μεγάλη Παρασκευή", [(1900, None)], "pnp-1980", _O),
    (1, "Δευτέρα του Πάσχα", [(1900, None)], "pnp-1980", _O),
    (50, "Αγίου Πνεύματος", [(1900, None)], "pnp-1980", _O),
]


def _ya(no, signed, fek, fek_date, uri, note):
    return dict(title=f"Υπουργική απόφαση {no} (μετάθεση της αργίας της 1ης Μαΐου)", uri=uri, issued=signed,
                issued_uri=None, published=fek_date, published_uri=None, published_in=f"ΦΕΚ Β' {fek}",
                dates_note="SECONDARY: " + note)


_TH = "https://www.taxheaven.gr/circulars/"
_MOVES = {
    2013: ("9280/196", "2013-04-01", "774/03.04.2013", "2013-04-03", _TH + "16105/ar-prwt-9280-196-1-4-2013", "05-07",
           "text read on taxheaven only."),
    2016: ("12618/288", "2016-03-17", "826/28.03.2016", "2016-03-28", _TH + "23224/ariom-12618-288-17-3-2016", "05-03",
           "text read on taxheaven only."),
    2021: ("18743/2021", "2021-04-14", "1661/23.04.2021", "2021-04-23",
           _YP + "tin-triti-4-maiou-2021-metatithetai-i-argia-tis-protomagias/", "05-04",
           "decision text on taxheaven; the date is confirmed by the ministry's press release (the URI)."),
    2022: ("33566/2022", "2022-04-07", "1758/11.04.2022", "2022-04-11",
           _YP + "tin-deftera-2-maiou-2022-metatithetai-i-argia-tis-protomagias/", "05-02",
           "decision text on taxheaven; the date is confirmed by the ministry's press release (the URI)."),
    2024: ("15102/2024", "2024-02-26", "1406/04.03.2024", "2024-03-04",
           _YP + "domna-michailidou-tin-triti-7-maiou-metatithetai-i-argia-tis-protomagias/", "05-07",
           "decision text on taxheaven and e-nomothesia; the date is confirmed by the ministry's press release."),
}

GR_YEARS = {y: dict(confidence="secondary", covers=[], docs=[_ya(no, signed, fek, fd, uri, note)],
                    days=[(moved, "Εργατική Πρωτομαγιά (μετάθεση)", 0)], suppressed=[("05-01", "Εργατική Πρωτομαγιά", 0)])
            for y, (no, signed, fek, fd, uri, moved, note) in _MOVES.items()}
