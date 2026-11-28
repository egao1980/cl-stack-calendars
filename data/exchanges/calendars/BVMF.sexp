;;;; BVMF exchange trading-day calendar (#49). B3 S.A. / BM&FBOVESPA cash equities (Listado B3).
;;;; Exchange lists found for 2011-2026 (first year with an exchange list: 2011). 2000-2010, 2027, 2028: no primary
;;;; list retrieved (see :gaps). Rules are stated from nil because ec's closures 2000-2010 follow exactly the same
;;;; pattern, but only 2011+ is evidenced by B3 documents.
;;;; Base = BR national holidays (Lei 662/1949 etc.; 20 Nov national from 2024). B3 adds pontos facultativos
;;;; (Carnaval Mon+Tue, Corpus Christi, 24 Dec, last business day of the year) and, until 2021, the São Paulo
;;;; city/state holidays (25 Jan, 9 Jul, 20 Nov).
;;;; New date function needed: LAST-WEEKDAY-OF-YEAR (year) = the last Monday-Friday on or before 31 December
;;;; (31 Dec on a weekday, else Fri 30 Dec (31 Dec Saturday) or Fri 29 Dec (31 Dec Sunday)). See BVMF-hours.md.
;;;; Ash Wednesday 13:00 late opens are given per year in notices (rule in BVMF-hours.md), not as rules.

(:name "BVMF"
 :title "B3 (BM&FBOVESPA) cash equities trading days"
 :authority "B3 S.A. - Brasil, Bolsa, Balcão, yearly Ofício Circular 'Calendário de Feriados' and 'Calendário de negociação - Feriados' page (BM&FBOVESPA news/calendar pages 2010-2016 via web.archive.org)"
 :authority-uri "https://www.b3.com.br/pt_br/solucoes/plataformas/puma-trading-system/para-participantes-e-traders/calendario-de-negociacao/feriados/"
 :bases ((:calendar "BR" :from nil :to nil
          :authority "Every B3 holiday list 2011-2026 closes on all BR national holidays falling on weekdays (Quadro A 'Feriados nacionais e pontos facultativos'); 20 Nov national from 2024 (OC 207/2023-PRE, OC 215/2023-PRE): https://www.b3.com.br/data/files/39/05/97/98/A339C8103152D4C8AC094EA8/OC%20215-2023%20PRE%20Calendario%20de%20Feriados%202024%20-%20Feriado%2020.11(PT).pdf"))
 :rules (
   (:easter "Carnaval (segunda-feira)" -48
    :authority "B3/BM&FBOVESPA lists 2011-2026, ponto facultativo closed every year (e.g. OC 111/2016-DP: 27/02/2017; OC 041/2026-VNC: 16/02/2026): https://www.b3.com.br/data/files/29/37/6B/FF/D8BA8510EC7C8985790D8AA8/OC%20111-2016-DP%20Calend%C3%A1rio%202017%20-%20Feriados.pdf")
   (:easter "Carnaval (terça-feira)" -47
    :authority "B3/BM&FBOVESPA lists 2011-2026 (e.g. OC 111/2016-DP: 28/02/2017; OC 041/2026-VNC: 17/02/2026)")
   (:easter "Corpus Christi" 60
    :authority "B3/BM&FBOVESPA lists 2011-2026, closed every year (2020: kept closed on 11/06/2020 although São Paulo moved its holiday, OC 068/2020-PRE and OC 072/2020-PRE): https://www.b3.com.br/data/files/0B/D3/7F/D1/83592710547B5127AC094EA8/OC%20072-2020%20PRE%20%20Funcionamento%20da%20B3%20em%2011_06%2009_07%20e%2020_11.pdf")
   (:fixed "Aniversário de São Paulo" 1 25 :to 2021
    :authority "BM&FBOVESPA/B3 lists 2011-2021 (e.g. 2011 news 05/11/2010; OC 049/2018-VOP Quadro 2: 'Não haverá negociação nos mercados de renda variável'); from 2022 B3 trades on São Paulo municipal holidays (OC 150/2020-PRE as restated in CE 109/2021-VNC): https://b3.com.br/data/files/D5/F2/DA/8F/32535810F534EB48AC094EA8/CE%20109-2021-VNC%20Calendario%20de%20feriados%202022_F_REVISADO_F%20_004__RR.pdf")
   (:fixed "Revolução Constitucionalista (feriado estadual SP)" 7 9 :to 2021
    :authority "BM&FBOVESPA/B3 lists 2012-2021 (2012 news 29/11/2011; OC 021/2017-DO Quadro 2; OC 049/2018-VOP Quadro 2); 2020 opened by OC 072/2020-PRE (notice below); trades from 2022 (CE 109/2021-VNC; 2024 and 2026 lists: 'haverá funcionamento normal do pregão')")
   (:fixed "Consciência Negra (feriado municipal SP)" 11 20 :from 2006 :to 2021
    :authority "BM&FBOVESPA/B3 lists 2012-2021 (2012 news 29/11/2011; 2013 news 07/12/2012; OC 111/2016-DP Tabela 2; OC 049/2018-VOP Quadro 2); 2020 opened by OC 072/2020-PRE; 2022-2023 traded (OC 151/2022-PRE, B3 2023 page 'Haverá negociação'); national holiday from 2024 via base BR. :from 2006 = first weekday occurrence ec closes (no B3 list before 2011).")
   (:fixed "Véspera de Natal" 12 24
    :authority "BM&FBOVESPA/B3 lists 2012-2026 closed on every weekday 24 Dec (2012, 2013, 2014, 2015, 2018, 2019, 2020, 2021, 2024, 2025, 2026; 2024+: 'expediente interno nas instituições bancárias sem sessão de negociação'): https://www.b3.com.br/data/files/20/57/01/AA/06A1F910ADC36BE9AC094EA8/OC%20041-2026-VNC%20ERRATA%20-%20CALENDARIO%20DE%20FERIADOS%20EM%202026_PT.pdf")
   (:computed "Último dia útil do ano (expediente interno nas instituições bancárias)" last-weekday-of-year
    :authority "BM&FBOVESPA/B3 lists 2011-2026: 'Último dia útil do ano (expediente interno nas instituições bancárias)' / 'sem sessão de negociação na B3' = 31 Dec, or 30 Dec (2011, 2016, 2022) / 29 Dec (2017, 2023) when 31 Dec falls on a weekend. NEW FUNCTION last-weekday-of-year (see BVMF-hours.md)."))
 :notices (
   (:title "BM&FBOVESPA: Confira o calendário de feriados do mercado para 2011" :year 2011
    :uri "http://web.archive.org/web/2011id_/http://www.bmfbovespa.com.br/pt-br/noticias/2010/Confira-o-calendario-de-feriados-do-mercado-para-2011-2010-11-05.aspx?idioma=pt-br"
    :issued (2010 11 5) :issued-uri "http://web.archive.org/web/2011id_/http://www.bmfbovespa.com.br/pt-br/noticias/2010/Confira-o-calendario-de-feriados-do-mercado-para-2011-2010-11-05.aspx?idioma=pt-br"
    :published (2010 11 5) :published-uri "http://web.archive.org/web/2010id_/http://www.bmfbovespa.com.br/pt-br/regulacao/calendario-do-mercado/calendario-do-mercado.aspx?idioma=pt-br"
    :published-in "BM&FBOVESPA website news + 'Calendário do Mercado' page (web.archive.org); refers to an Ofício Circular not retrieved"
    :dates-note "News dated 05/11/2010. 'Não haverá negociação nos mercados da Bolsa': 25/1, 7-8/3, 21/4, 22/4, 23/6, 7/9, 12/10, 2/11, 15/11, 30/12 (último dia útil). 9 Mar (Quarta-Feira de Cinzas) trading from 13h."
    :closed () :open () :early-closes ()
    :late-opens (((2011 3 9) (13 0) "Quarta-Feira de Cinzas: negociação começará às 13h")))
   (:title "BM&FBOVESPA divulga o calendário 2012" :year 2012
    :uri "http://web.archive.org/web/20120101000000id_/http://www.bmfbovespa.com.br/pt-br/noticias/2011/BMFBOVESPA-divulga-o-calendario-do-mercado-2012-2011-11-29.aspx?idioma=pt-br"
    :issued (2011 11 29) :issued-uri "http://web.archive.org/web/20120101000000id_/http://www.bmfbovespa.com.br/pt-br/noticias/2011/BMFBOVESPA-divulga-o-calendario-do-mercado-2012-2011-11-29.aspx?idioma=pt-br"
    :published (2011 11 29) :published-uri "http://web.archive.org/web/20120101000000id_/http://www.bmfbovespa.com.br/pt-br/noticias/2011/BMFBOVESPA-divulga-o-calendario-do-mercado-2012-2011-11-29.aspx?idioma=pt-br"
    :published-in "BM&FBOVESPA website news (web.archive.org)"
    :dates-note "No trading in equities/fixed income/derivatives: 25/1, 20-21/2, 6/4, 1/5, 7/6, 9/7, 7/9, 12/10, 2/11, 15/11, 20/11, 24/12, 25/12, 31/12. 22 Feb (Quarta-Feira de Cinzas) from 13h."
    :closed () :open () :early-closes ()
    :late-opens (((2012 2 22) (13 0) "Quarta-Feira de Cinzas: negociação terá início às 13h")))
   (:title "BM&FBOVESPA divulga o calendário do mercado 2013" :year 2013
    :uri "http://web.archive.org/web/2013id_/http://www.bmfbovespa.com.br/pt-br/noticias/2012/BMFBOVESPA-divulga-o-calendario-do-mercado-2013-2012-12-07.aspx?idioma=pt-br"
    :issued (2012 12 7) :issued-uri "http://web.archive.org/web/2013id_/http://www.bmfbovespa.com.br/pt-br/noticias/2012/BMFBOVESPA-divulga-o-calendario-do-mercado-2013-2012-12-07.aspx?idioma=pt-br"
    :published (2012 12 7) :published-uri "http://web.archive.org/web/2013id_/http://www.bmfbovespa.com.br/pt-br/noticias/2012/BMFBOVESPA-divulga-o-calendario-do-mercado-2013-2012-12-07.aspx?idioma=pt-br"
    :published-in "BM&FBOVESPA website news (web.archive.org)"
    :dates-note "No trading: 1/1, 25/1, 11-12/2, 29/3, 1/5, 30/5, 9/7, 15/11, 20/11, 24/12, 25/12, 31/12. 13 Feb (Quarta-Feira de Cinzas) from 13h."
    :closed () :open () :early-closes ()
    :late-opens (((2013 2 13) (13 0) "Quarta-Feira de Cinzas: negociação terá início às 13h")))
   (:title "BM&FBOVESPA Calendário do Mercado: dias em que não haverá negociação na Bolsa em 2014" :year 2014
    :uri "http://web.archive.org/web/20140301000000id_/http://www.bmfbovespa.com.br/pt-br/regulacao/calendario-do-mercado/calendario-do-mercado.aspx?idioma=pt-br"
    :issued nil :issued-uri nil
    :published nil :published-uri "http://web.archive.org/web/20140301000000id_/http://www.bmfbovespa.com.br/pt-br/regulacao/calendario-do-mercado/calendario-do-mercado.aspx?idioma=pt-br"
    :published-in "BM&FBOVESPA website 'Calendário do Mercado' page (web.archive.org capture ~2014-03); Ash Wednesday hours from news 27/02/2014"
    :dates-note "Page lists names only (day numbers are images): Confraternização Universal, Carnaval x2, Paixão de Cristo, Tiradentes, Dia do Trabalho, Corpus Christi, Revolução Constitucionalista, Consciência Negra, Véspera de Natal, Natal, Véspera de Ano Novo. Ash Wednesday 05/03/2014: 'Das 13h às 17h – fase de negociação' (http://web.archive.org/web/2014id_/http://www.bmfbovespa.com.br/pt-br/noticias/2014/Horarios-de-Negociacao-em-05-03-2014-Quarta-Feira-de-Cinzas-2014-02-27.aspx)."
    :closed () :open () :early-closes ()
    :late-opens (((2014 3 5) (13 0) "Quarta-Feira de Cinzas: 13h-17h")))
   (:title "Bolsa fechada na abertura da Copa do Mundo (12/06/2014)" :year 2014 :confidence :secondary
    :uri "https://www.infomoney.com.br/?p=446440"
    :issued (2014 6 11) :issued-uri "https://www.infomoney.com.br/?p=446440"
    :published (2014 6 11) :published-uri "https://www.infomoney.com.br/?p=446440"
    :published-in "InfoMoney news (secondary; no BM&FBOVESPA notice found)"
    :dates-note "'as negociações da BM&FBovespa ficarão fechadas na próxima quinta-feira' (12/06/2014, São Paulo holiday for the World Cup opening match). ec also closed."
    :closed (((2014 6 12) "Abertura da Copa do Mundo (feriado em São Paulo)"))
    :open () :early-closes () :late-opens ())
   (:title "BM&FBOVESPA divulga calendário de feriados de 2015" :year 2015
    :uri "http://web.archive.org/web/2015id_/http://www.bmfbovespa.com.br/pt-br/noticias/2014/BMFBOVESPA-divulga-calendario-de-feriados-de-2015-2014-11-19.aspx?idioma=pt-br"
    :issued (2014 11 19) :issued-uri "http://web.archive.org/web/2015id_/http://www.bmfbovespa.com.br/pt-br/noticias/2014/BMFBOVESPA-divulga-calendario-de-feriados-de-2015-2014-11-19.aspx?idioma=pt-br"
    :published (2014 11 19) :published-uri "http://web.archive.org/web/2015id_/http://www.bmfbovespa.com.br/pt-br/noticias/2014/BMFBOVESPA-divulga-calendario-de-feriados-de-2015-2014-11-19.aspx?idioma=pt-br"
    :published-in "BM&FBOVESPA website news (web.archive.org)"
    :dates-note "No trading: 1/1, 16-17/2, 3/4, 21/4, 1/5, 4/6, 9/7, 7/9, 12/10, 2/11, 20/11, 24/12, 25/12, 31/12. Ash Wednesday 2015 notice (news 04/02/2015) exists in the archive index but could not be fetched."
    :closed () :open () :early-closes () :late-opens ())
   (:title "BM&FBOVESPA Calendário do mercado 2016 (Feriados)" :year 2016
    :uri "http://web.archive.org/web/20160414070538id_/http://www.bmfbovespa.com.br:80/pt_br/servicos/negociacao/puma-trading-system-bm-fbovespa/para-participantes-e-traders/calendario-de-negociacao/feriados/"
    :issued nil :issued-uri nil
    :published (2016 4 14) :published-uri "http://web.archive.org/web/20160414070538id_/http://www.bmfbovespa.com.br:80/pt_br/servicos/negociacao/puma-trading-system-bm-fbovespa/para-participantes-e-traders/calendario-de-negociacao/feriados/"
    :published-in "BM&FBOVESPA website, Calendário de negociação - Feriados (web.archive.org capture 2016-04-14)"
    :dates-note "Undated page; :published = capture date (upper bound). 'Dias em que não haverá negociação na Bolsa': 1/1, 25/1, 8-9/2, 25/3, 21/4, 26/5, 7/9, 12/10, 2/11, 15/11, 30/12 (último dia útil). 10/02 Quarta-feira de Cinzas from 13h."
    :closed () :open () :early-closes ()
    :late-opens (((2016 2 10) (13 0) "Quarta-feira de Cinzas: negociação terá início às 13h")))
   (:title "Ofício Circular 111/2016-DP: Calendário 2017 – Feriados" :year 2017
    :uri "https://www.b3.com.br/data/files/29/37/6B/FF/D8BA8510EC7C8985790D8AA8/OC%20111-2016-DP%20Calend%C3%A1rio%202017%20-%20Feriados.pdf"
    :issued (2016 11 23) :issued-uri "https://www.b3.com.br/data/files/29/37/6B/FF/D8BA8510EC7C8985790D8AA8/OC%20111-2016-DP%20Calend%C3%A1rio%202017%20-%20Feriados.pdf"
    :published (2016 11 23) :published-uri "https://www.b3.com.br/data/files/29/37/6B/FF/D8BA8510EC7C8985790D8AA8/OC%20111-2016-DP%20Calend%C3%A1rio%202017%20-%20Feriados.pdf"
    :published-in "BM&FBOVESPA Ofício Circular 111/2016-DP"
    :dates-note "Tabelas 1 and 2: no trading in equities, derivatives, private fixed income: 27-28/2, 14/4, 21/4, 1/5, 15/6, 7/9, 12/10, 2/11, 15/11, 25/12, 29/12 (expediente interno); SP: 25/1, 20/11. Ash Wednesday 01/03/2017 from 13h."
    :closed () :open () :early-closes ()
    :late-opens (((2017 3 1) (13 0) "Quarta-feira de Cinzas: negociação e registro terão início às 13h")))
   (:title "Ofício Circular 021/2017-DO: Calendário 2018 – Feriados" :year 2018
    :uri "https://www.b3.com.br/data/files/97/84/C2/FA/2D5EF5103EE99DF5790D8AA8/OC%20021-2017-DO_Feriados%202018_v6_R2.pdf"
    :issued (2017 11 22) :issued-uri "https://www.b3.com.br/data/files/97/84/C2/FA/2D5EF5103EE99DF5790D8AA8/OC%20021-2017-DO_Feriados%202018_v6_R2.pdf"
    :published (2017 11 22) :published-uri "https://www.b3.com.br/data/files/97/84/C2/FA/2D5EF5103EE99DF5790D8AA8/OC%20021-2017-DO_Feriados%202018_v6_R2.pdf"
    :published-in "B3 Ofício Circular 021/2017-DO"
    :dates-note "Quadros 1 and 2 (no trading): 1/1, 12-13/2, 30/3, 1/5, 31/5, 7/9, 12/10, 2/11, 15/11, 24/12, 25/12, 31/12; SP: 25/1, 9/7, 20/11. Ash Wednesday 14/02/2018 from 13h; OC 008/2018-PRE (05/02/2018, https://www.b3.com.br/data/files/12/A3/6B/AB/75761610C2BD3316790D8AA8/OC%20008-2018-PRE%20-%20Horarios%20de%20Negociacao,%20de%20Pos-Negociacao%20e%20de%20Registro%20de%20Operacoes%2014022018.pdf): 13h-17h55 continuous, closing call 17h55-18h."
    :closed () :open () :early-closes ()
    :late-opens (((2018 2 14) (13 0) "Quarta-Feira de Cinzas: 13h-18h")))
   (:title "Ofício Circular 049/2018-VOP: Calendário 2019 – Feriados" :year 2019
    :uri "https://www.b3.com.br/data/files/AF/A3/17/B1/13E97610F157B776AC094EA8/OC%20049-2018-VOP%20Feriados%202019_v7%20R_2.pdf"
    :issued (2018 12 11) :issued-uri "https://www.b3.com.br/data/files/AF/A3/17/B1/13E97610F157B776AC094EA8/OC%20049-2018-VOP%20Feriados%202019_v7%20R_2.pdf"
    :published (2018 12 11) :published-uri "https://www.b3.com.br/data/files/AF/A3/17/B1/13E97610F157B776AC094EA8/OC%20049-2018-VOP%20Feriados%202019_v7%20R_2.pdf"
    :published-in "B3 Ofício Circular 049/2018-VOP"
    :dates-note "Quadro 1: 1/1, 4-5/3, 19/4, 1/5, 20/6, 15/11, 24/12, 25/12, 31/12 (+ weekend 21/4, 7/9, 12/10, 2/11); Quadro 2 (SP): 25/1, 9/7, 20/11 - no equities trading. Ash Wednesday 06/03/2019 from 13h; OC 016/2019 (22/02/2019, https://www.b3.com.br/data/files/38/56/FE/B3/707196100FB88096AC094EA8/OC%20016-2019%20Hor%C3%A1rios%20de%20Negocia%C3%A7%C3%A3o,%20de%20P%C3%B3s-Negocia%C3%A7%C3%A3o,%20do%20Tesouro%20Direto%20e%20da%20Unidade%20de%20Financiamentos%20em%2006.03.19%20PT.pdf): 13h-17h55, call 17h55-18h."
    :closed () :open () :early-closes ()
    :late-opens (((2019 3 6) (13 0) "Quarta-Feira de Cinzas: 13h-18h")))
   (:title "Ofício Circular 003/2020-VOP: Calendário 2020 – Feriados (retifica OC 084/2019-PRE)" :year 2020
    :uri "https://www.b3.com.br/data/files/97/C7/BB/E1/F50BF6109A4874F6AC094EA8/OC%20003-2020-VOP%20Feriados%202020.pdf"
    :issued (2020 1 16) :issued-uri "https://www.b3.com.br/data/files/97/C7/BB/E1/F50BF6109A4874F6AC094EA8/OC%20003-2020-VOP%20Feriados%202020.pdf"
    :published (2020 1 16) :published-uri "https://www.b3.com.br/data/files/97/C7/BB/E1/F50BF6109A4874F6AC094EA8/OC%20003-2020-VOP%20Feriados%202020.pdf"
    :published-in "B3 Ofício Circular 003/2020-VOP (replaces OC 084/2019-PRE of 07/11/2019, not retrieved)"
    :dates-note "Quadro 1: 1/1, 24-25/2, 10/4, 21/4, 1/5, 11/6, 7/9, 12/10, 2/11, 24/12, 25/12, 31/12; Quadro 2 (SP): 9/7, 20/11 (later opened, see OC 072/2020-PRE). Ash Wednesday 26/02/2020 13h (OC 012/2020-PRE, 18/02/2020: 13h-17h55, call to 18h, https://www.b3.com.br/data/files/96/76/D2/45/20A50710F4D5B107AC094EA8/OC%20012-2020%20PRE%20Hor%C3%A1rios%20de%20Negocia%C3%A7%C3%A3o%20e%20de%20P%C3%B3s-Negocia%C3%A7%C3%A3o%20dos%20Segmentos.pdf)."
    :closed () :open () :early-closes ()
    :late-opens (((2020 2 26) (13 0) "Quarta-feira de Cinzas: 13h-18h")))
   (:title "Ofício Circular 068/2020-PRE: Funcionamento da B3 em 20, 21, 22 e 25/05/2020" :year 2020
    :uri "https://www.b3.com.br/data/files/B7/95/7D/9E/20E22710547B5127AC094EA8/OC%20068-2020%20PRE%20-funcionamentoB3_19_05.pdf"
    :issued (2020 5 19) :issued-uri "https://www.b3.com.br/data/files/B7/95/7D/9E/20E22710547B5127AC094EA8/OC%20068-2020%20PRE%20-funcionamentoB3_19_05.pdf"
    :published (2020 5 19) :published-uri "https://www.b3.com.br/data/files/B7/95/7D/9E/20E22710547B5127AC094EA8/OC%20068-2020%20PRE%20-funcionamentoB3_19_05.pdf"
    :published-in "B3 Ofício Circular 068/2020-PRE"
    :dates-note "São Paulo anticipated holidays (COVID-19) to 20-25/05/2020; B3 kept all activities on 20, 21, 22 and 25/05/2020 (sessions anyway in rules) and kept 11/06/2020 (Corpus Christi) closed ('ficando mantido o calendário original anual')."
    :closed () :open () :early-closes () :late-opens ())
   (:title "Ofício Circular 072/2020-PRE: Funcionamento da B3 em 11/06/20, 09/07/2020 e 20/11/2020" :year 2020
    :uri "https://www.b3.com.br/data/files/0B/D3/7F/D1/83592710547B5127AC094EA8/OC%20072-2020%20PRE%20%20Funcionamento%20da%20B3%20em%2011_06%2009_07%20e%2020_11.pdf"
    :issued (2020 6 8) :issued-uri "https://www.b3.com.br/data/files/0B/D3/7F/D1/83592710547B5127AC094EA8/OC%20072-2020%20PRE%20%20Funcionamento%20da%20B3%20em%2011_06%2009_07%20e%2020_11.pdf"
    :published (2020 6 8) :published-uri "https://www.b3.com.br/data/files/0B/D3/7F/D1/83592710547B5127AC094EA8/OC%20072-2020%20PRE%20%20Funcionamento%20da%20B3%20em%2011_06%2009_07%20e%2020_11.pdf"
    :published-in "B3 Ofício Circular 072/2020-PRE"
    :dates-note "11/06/20 not a business day (closed); 09/07/20 and 20/11/20: 'as atividades de negociação, liquidação, registro e depósito centralizado de ativos funcionarão normalmente'."
    :closed ()
    :open (((2020 7 9) "SP state holiday anticipated to May 2020 (OC 072/2020-PRE): normal session")
           ((2020 11 20) "SP municipal holiday anticipated to May 2020 (OC 072/2020-PRE): normal session"))
    :early-closes () :late-opens ())
   (:title "B3 Calendário do mercado 2021 (Calendário de negociação - Feriados)" :year 2021
    :uri "https://www.b3.com.br/pt_br/solucoes/plataformas/puma-trading-system/para-participantes-e-traders/calendario-de-negociacao/feriados/"
    :issued nil :issued-uri nil
    :published nil :published-uri "https://www.b3.com.br/pt_br/solucoes/plataformas/puma-trading-system/para-participantes-e-traders/calendario-de-negociacao/feriados/"
    :published-in "B3 website, Calendário de negociação - Feriados (2021 tab, live page fetched 2026-11-28); the 2021 Ofício Circular 150/2020-PRE (17/11/2020) was not retrieved"
    :dates-note "No trading in equities: 1/1, 25/1, 15-16/2, 2/4, 21/4, 3/6, 9/7, 7/9, 12/10, 2/11, 15/11, 24/12, 31/12. 17/02 Quarta-feira de Cinzas from 13h (also OC 003/2021-PRE, 21/01/2021: 13h-17h55, call to 18h, https://www.b3.com.br/data/files/01/87/E1/32/5C6277108F39C077AC094EA8/OC%20003-2021%20PRE%20%20Hor%C3%A1rio%20Quarta-feira%20Cinzas%202021_R%20(002).pdf). São Paulo anticipated holidays to 26/03-01/04/2021; B3 kept activities (OC 018/2021-PRE of 19/03/2021, cited by CE 001/2021-VPF, https://www.b3.com.br/data/files/09/72/54/BA/6B068710240ED387AC094EA8/CE%20001-2021-VPF%20Antecipa%C3%A7%C3%A3o%20Feriados_REVISADO_TIME%20DE%20OFICIOS.pdf); original calendar (3/6, 9/7 closed) kept."
    :closed () :open () :early-closes ()
    :late-opens (((2021 2 17) (13 0) "Quarta-feira de Cinzas: 13h-18h")))
   (:title "Comunicado Externo 109/2021-VNC: Calendário de Feriados em 2022" :year 2022
    :uri "https://b3.com.br/data/files/D5/F2/DA/8F/32535810F534EB48AC094EA8/CE%20109-2021-VNC%20Calendario%20de%20feriados%202022_F_REVISADO_F%20_004__RR.pdf"
    :issued (2021 10 28) :issued-uri "https://b3.com.br/data/files/D5/F2/DA/8F/32535810F534EB48AC094EA8/CE%20109-2021-VNC%20Calendario%20de%20feriados%202022_F_REVISADO_F%20_004__RR.pdf"
    :published (2021 10 28) :published-uri "https://b3.com.br/data/files/D5/F2/DA/8F/32535810F534EB48AC094EA8/CE%20109-2021-VNC%20Calendario%20de%20feriados%202022_F_REVISADO_F%20_004__RR.pdf"
    :published-in "B3 Comunicado Externo 109/2021-VNC (restates OC 150/2020-PRE of 17/11/2020)"
    :dates-note "Closed: 28/2, 1/3, 15/4, 21/4, 16/6, 7/9, 12/10, 2/11, 15/11, 30/12 (expediente interno). From 2022 São Paulo municipal holidays are trading days. Ash Wednesday 02/03/2022 13h (OC 017/2022-PRE, 03/02/2022, https://www.b3.com.br/data/files/FC/73/92/C0/390CE7101F598BE7AC094EA8/OC%20017-2022%20PRE%20Hor%C3%A1rio%20Quarta-feira%20Cinzas%202022%20(PT).pdf)."
    :closed () :open () :early-closes ()
    :late-opens (((2022 3 2) (13 0) "Quarta-feira de Cinzas: 13h-18h")))
   (:title "Ofício Circular 182/2023-PRE: Retificação – Calendário de Feriados em 2023 (replaces OC 151/2022-PRE)" :year 2023
    :uri "https://www.b3.com.br/data/files/2D/72/7B/D8/5F69B810E97E07B8DC0D8AA8/OC%20182-2023%20PRE%20Retifica%C3%A7%C3%A3o%20-%20Calend%C3%A1rio%20de%20Feriados%202023%20(PT).pdf"
    :issued (2022 11 17) :issued-uri "https://www.b3.com.br/data/files/1C/F2/F3/05/42535810F534EB48AC094EA8/OC%20151-2022%20PRE%20Calendario%20de%20Feriados%20em%202023%20e%20funcionamento%20da%20B3%20em%2022.02.2023%20_Quarta-Feira%20de%20Cinzas_%20_PT_.pdf"
    :published (2023 11 3) :published-uri "https://www.b3.com.br/data/files/2D/72/7B/D8/5F69B810E97E07B8DC0D8AA8/OC%20182-2023%20PRE%20Retifica%C3%A7%C3%A3o%20-%20Calend%C3%A1rio%20de%20Feriados%202023%20(PT).pdf"
    :published-in "B3 Ofício Circular 151/2022-PRE (17/11/2022), retified by 182/2023-PRE (03/11/2023; US Veterans Day change only)"
    :dates-note "Quadro A: 20-21/2, 7/4, 21/4, 1/5, 8/6, 7/9, 12/10, 2/11, 15/11, 25/12, 29/12 (sem sessão). SP municipal holidays (25/1, 20/11) are trading days. Ash Wednesday 22/02/2023 13h-17h55."
    :closed () :open () :early-closes ()
    :late-opens (((2023 2 22) (13 0) "Quarta-Feira de Cinzas: 13h-18h")))
   (:title "Ofício Circular 048/2024-PRE: Retificação do Calendário de Feriados 2024 (replaces OC 215/2023-PRE, OC 166/2023-PRE)" :year 2024
    :uri "https://www.b3.com.br/data/files/86/B4/A7/07/4D2CE810C54843E8DC0D8AA8/OC%20048-2024%20PRE%20%20Retificacao%20do%20Calendario%20de%20Feriados%202024%20%20(PT).pdf"
    :issued (2023 10 17) :issued-uri "https://www.b3.com.br/data/files/92/94/5A/0A/80E3B810DDBC40B8DC0D8AA8/OC%20166-2023%20PRE%20Calend%C3%A1rio%20de%20Feriados%202024%20e%20Funcionamento%20da%20B3%20em%2014.02.2024%20(Quarta-Feira%20de%20Cinzas)%20(PT).pdf"
    :published (2024 4 9) :published-uri "https://www.b3.com.br/data/files/86/B4/A7/07/4D2CE810C54843E8DC0D8AA8/OC%20048-2024%20PRE%20%20Retificacao%20do%20Calendario%20de%20Feriados%202024%20%20(PT).pdf"
    :published-in "B3 Ofícios Circulares 166/2023-PRE (17/10/2023), 215/2023-PRE (22/12/2023, adds national 20/11), 048/2024-PRE (09/04/2024)"
    :dates-note "Quadro A: 1/1, 12-13/2, 29/3, 1/5, 30/5, 15/11, 20/11 (new national holiday, OC 207/2023-PRE 07/12/2023), 24/12, 25/12, 31/12 (sem sessão de negociação). 9 Jul: normal session. Ash Wednesday 14/02/2024 13h-17h55."
    :closed () :open () :early-closes ()
    :late-opens (((2024 2 14) (13 0) "Quarta-Feira de Cinzas: 13h-18h")))
   (:title "Ofício Circular 026/2025-PRE: Retificação – Calendário de Feriados 2025 e Funcionamento da B3 em 05/03/2025" :year 2025
    :uri "https://b3.com.br/data/files/AC/20/51/03/F384591029BEEC39AC094EA8/OC%20026-2025%20PRE%20Retificacao%20-%20Calendario%20de%20Feriados%202025%20e%20Funcionamento%20da%20B3%20em%2005032025%20(Quarta-Feira%20de%20Cinzas)(PT).pdf"
    :issued (2025 2 27) :issued-uri "https://b3.com.br/data/files/AC/20/51/03/F384591029BEEC39AC094EA8/OC%20026-2025%20PRE%20Retificacao%20-%20Calendario%20de%20Feriados%202025%20e%20Funcionamento%20da%20B3%20em%2005032025%20(Quarta-Feira%20de%20Cinzas)(PT).pdf"
    :published (2025 2 27) :published-uri "https://www.b3.com.br/pt_br/noticias/calendario-de-feriados-2025.htm"
    :published-in "B3 Ofício Circular 026/2025-PRE (retifies OC 149/2024-PRE, not retrieved); B3 news 'Calendário de feriados 2025'"
    :dates-note "Quadro A: 1/1, 3-4/3, 18/4, 21/4, 1/5, 19/6, 20/11, 24/12, 25/12, 31/12 (sem sessão). Ash Wednesday 05/03/2025 13h-17h55."
    :closed () :open () :early-closes ()
    :late-opens (((2025 3 5) (13 0) "Quarta-Feira de Cinzas: 13h-18h")))
   (:title "Ofício Circular 041/2026-VNC: ERRATA – Calendário de feriados em 2026 (OC 054/2025-VNC, OC 003/2026-VNC)" :year 2026
    :uri "https://www.b3.com.br/data/files/20/57/01/AA/06A1F910ADC36BE9AC094EA8/OC%20041-2026-VNC%20ERRATA%20-%20CALENDARIO%20DE%20FERIADOS%20EM%202026_PT.pdf"
    :issued (2025 12 4) :issued-uri "https://www.b3.com.br/data/files/C2/E3/28/AD/4FAEA9105B12E5A9AC094EA8/OC%20054-2025-VNC%20CALENDARIO%20DE%20FERIADOS%20EM%202026%20E%20FUNCIONAMENTO%20DA%20B3%20EM%2018022026%20QUARTAFEIRA%20DE%20CINZAS_PT.pdf"
    :published (2026 6 30) :published-uri "https://www.b3.com.br/pt_br/noticias/calendario-de-negociacao-da-b3-confira-o-funcionamento-da-bolsa-em-2026.htm"
    :published-in "B3 Ofícios Circulares 054/2025-VNC (04/12/2025) and 041/2026-VNC (30/06/2026, US Independence Day change only); B3 news 09/01/2026"
    :dates-note "Quadro A: 1/1, 16-17/2, 3/4, 21/4, 1/5, 4/6, 7/9, 12/10, 2/11, 20/11, 24/12, 25/12, 31/12 (sem sessão). 9 Jul: 'haverá funcionamento normal do pregão'. Ash Wednesday 18/02/2026: pre-opening 12h45, trading from 13h to 17h55."
    :closed () :open () :early-closes ()
    :late-opens (((2026 2 18) (13 0) "Quarta-feira de Cinzas: 13h-18h"))))
 :gaps (
   (:years "2000-2010"
    :note "No B3/Bovespa holiday list retrieved. Searched: web.archive.org CDX for bmfbovespa.com.br/pt-br/ and pt_br/ (filters feriad/calend), bovespa.com.br and bmf.com.br (CDX timed out 504/000 repeatedly), archived 'Calendário do Mercado' page (captures from 2009-06 and 2010-03 already show the 2011 list), web search for Bovespa holiday Ofícios (b3.com.br/data/files hosts old Bovespa 'DG' circulars, none found for holidays). The 2011 news links an Ofício Circular and a 'Calendário 2010' page not captured. ec's 2000-2010 closures follow the same rules (Carnaval, Corpus Christi, 25/1, 9/7, 20/11 from 2006, 24/12, last weekday) - plausible but unverified.")
   (:years "2015 (Ash Wednesday only)"
    :note "News 'Horarios-de-Negociacao-em-18022015-Quarta-Feira-de-Cinzas-2015-02-04' is in the web.archive.org index but every fetch failed; 13h late open on 18/02/2015 unverified.")
   (:years "2027"
    :note "Ofício Circular 057/2026-VNC (17/11/2026) with the 2027 calendar is reported by press (investidor10, suno) but the PDF URL was not found on b3.com.br (ofícios listing page did not include it). Rules forecast: 1/1, 8-9/2, 26/3, 21/4, 27/5, 7/9, 12/10, 2/11, 15/11 (Mon), 20/11 (Sat), 24/12, 31/12; Ash Wednesday 10/02/2027 13h (press).")
   (:years "2028" :note "Not yet published.")))
