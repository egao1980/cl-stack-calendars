"""Portugal: feriados obrigatórios, 2000-2040, transcribed from the Diário da
República for egao1980/cl-stack-calendars#24. Stdlib only; data, no logic.

Cache: ~/.cache/cl-stack-calendars/pt/ (files.diariodarepublica.pt PDFs)
  dr-1s-2009-02-030.pdf   DR 1.ª série n.º 30 of 12 Feb 2009 (Lei 7/2009, Código do Trabalho, art. 234.º)
  dr-1s-2012-06-121.pdf   DR 1.ª série n.º 121 of 25 Jun 2012 (Lei 23/2012, art. 234.º and art. 10.º)
  lei-8-2016.pdf          DR 1.ª série n.º 64 of 1 Apr 2016, p. 1112 (Lei 8/2016)

Scope: art. 234.º(1) feriados obrigatórios, Easter Sunday included (the
article names it). Carnaval and the feriado municipal (art. 235.º) are
optional or local and left out. The 2000-2008 list (Código do Trabalho 2003
art. 208.º, before it DL 874/76) was not read; those years are the
PT-SECONDARY fixture.
"""

OBSERVE = True

_F = "https://files.diariodarepublica.pt/"
_CT = "https://diariodarepublica.pt/dr/detalhe/lei/7-2009-602073"
_L23 = "https://diariodarepublica.pt/dr/detalhe/lei/23-2012-178501"
_L8 = "https://diariodarepublica.pt/dr/detalhe/lei/8-2016-74007209"

PT_STATUTES = [
    dict(key="ct-2009", title="Lei n.º 7/2009, de 12 de fevereiro (Código do Trabalho), art. 234.º",
         uri=_CT, issued="2009-02-04", issued_uri=_F + "gratuitos/1s/2009/02/03000.pdf",
         published="2009-02-12", published_uri=_F + "gratuitos/1s/2009/02/03000.pdf",
         published_in="Diário da República, 1.ª série, n.º 30, 12 de fevereiro de 2009", in_force="2009-02-17",
         dates_note="Issued = promulgation (4 Feb 2009; approved 21 Jan 2009). Art. 14.º sets no general date: "
                    "the ordinary vacatio legis of Lei 74/98 (fifth day after publication) gives 17 Feb 2009.",
         summary="Art. 234.º(1): São feriados obrigatórios os dias 1 de Janeiro, de Sexta-Feira Santa, de Domingo de "
                 "Páscoa, 25 de Abril, 1 de Maio, de Corpo de Deus, 10 de Junho, 15 de Agosto, 5 de Outubro, 1 de "
                 "Novembro, 1, 8 e 25 de Dezembro."),
    dict(key="lei-23-2012", title="Lei n.º 23/2012, de 25 de junho (terceira alteração ao Código do Trabalho)",
         uri=_L23, issued="2012-06-18", issued_uri=_F + "gratuitos/1s/2012/06/12100.pdf",
         published="2012-06-25", published_uri=_F + "gratuitos/1s/2012/06/12100.pdf",
         published_in="Diário da República, 1.ª série, n.º 121, 25 de junho de 2012", in_force="2012-08-01",
         to="2015-12-31",
         dates_note="Issued = promulgation (18 Jun 2012). Art. 11.º: in force on the first day of the second month "
                    "after publication; art. 10.º(1): the removal of the four feriados takes effect on 1 Jan 2013.",
         summary="Art. 234.º(1) reduced to 1 de janeiro, Sexta-Feira Santa, Domingo de Páscoa, 25 de abril, 1 de "
                 "maio, 10 de junho, 15 de agosto, 8 e 25 de dezembro: Corpo de Deus, 5 de outubro, 1 de novembro "
                 "and 1 de dezembro are not feriados in 2013-2015."),
    dict(key="lei-8-2016", title="Lei n.º 8/2016, de 1 de abril (décima alteração ao Código do Trabalho, "
         "restabelecendo feriados nacionais)", uri=_L8, issued=None,
         issued_uri=_F + "1s/2016/04/06400/0111201112.pdf", published="2016-04-01",
         published_uri=_F + "1s/2016/04/06400/0111201112.pdf",
         published_in="Diário da República, 1.ª série, n.º 64, 1 de abril de 2016, p. 1112", in_force="2016-04-02",
         dates_note="The page shows the approval date (23 Feb 2016) but the promulgation date was not read. Art. "
                    "3.º: in force the day after publication.",
         summary="Restores Corpo de Deus, 5 de outubro, 1 de novembro and 1 de dezembro in art. 234.º(1)."),
]

_FOUR = [(1900, 2012), (2016, None)]

PT_FIXED = [
    (1, 1, "Ano Novo", [(1900, None)], "ct-2009"),
    (4, 25, "Dia da Liberdade", [(1974, None)], "ct-2009"),
    (5, 1, "Dia do Trabalhador", [(1900, None)], "ct-2009"),
    (6, 10, "Dia de Portugal, de Camões e das Comunidades Portuguesas", [(1900, None)], "ct-2009"),
    (8, 15, "Assunção de Nossa Senhora", [(1900, None)], "ct-2009"),
    (10, 5, "Implantação da República", [(1910, 2012), (2016, None)], "lei-8-2016"),
    (11, 1, "Dia de Todos-os-Santos", _FOUR, "lei-8-2016"),
    (12, 1, "Restauração da Independência", _FOUR, "lei-8-2016"),
    (12, 8, "Imaculada Conceição", [(1900, None)], "ct-2009"),
    (12, 25, "Natal", [(1900, None)], "ct-2009"),
]

PT_EASTER = [
    (-2, "Sexta-Feira Santa", [(1900, None)], "ct-2009"),
    (0, "Domingo de Páscoa", [(1900, None)], "ct-2009"),
    (60, "Corpo de Deus", _FOUR, "lei-8-2016"),
]

PT_YEARS = {}
