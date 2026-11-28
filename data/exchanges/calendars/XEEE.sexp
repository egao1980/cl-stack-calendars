;;;; XEEE draft (cl-stack-calendars #49). Holidays identical to ec for 2000-2028.

(:name "XEEE"
 :title "EEX (European Energy Exchange) derivatives trading days"
 :authority "EEX Holiday Calendar Derivatives & Emissions Spot (19/06/2025): 'applicable continuously for all years until further notice'" :authority-uri "https://www.eex.com/fileadmin/EEX/Downloads/Trading/Calendar/Holiday_Calendar/EEX_Trading_Calendar_Emissions_Spot__Derivatives.pdf"
 :rules ((:fixed "New Year" 1 1 :authority "https://www.eex.com/fileadmin/EEX/Downloads/Trading/Calendar/Holiday_Calendar/EEX_Trading_Calendar_Emissions_Spot__Derivatives.pdf")
         (:easter "Good Friday" -2 :authority "EEX Holiday Calendar")
         (:easter "Easter Monday" 1 :authority "EEX Holiday Calendar")
         (:fixed "Labour Day" 5 1 :authority "EEX Holiday Calendar")
         (:fixed "Christmas Eve" 12 24 :authority "EEX Holiday Calendar (power/emissions/agri closed; gas orderbook and freight trade registration 08:00-13:00)")
         (:fixed "Christmas Day" 12 25 :authority "EEX Holiday Calendar")
         (:fixed "Boxing Day" 12 26 :authority "EEX Holiday Calendar")
         (:fixed "New Year's Eve" 12 31 :authority "EEX Holiday Calendar (gas/freight 08:00-13:00)"))
 :notices (
   (:title "EEX Holiday Calendar (Derivatives + Emissions Spot)"
    :uri "https://www.eex.com/fileadmin/EEX/Downloads/Trading/Calendar/Holiday_Calendar/EEX_Trading_Calendar_Emissions_Spot__Derivatives.pdf"
    :issued (2025 6 19) :issued-uri "https://www.eex.com/fileadmin/EEX/Downloads/Trading/Calendar/Holiday_Calendar/EEX_Trading_Calendar_Emissions_Spot__Derivatives.pdf"
    :published nil :published-uri "https://www.eex.com/en/trading-resources/trading-information/calendar"
    :published-in "EEX website, Trading calendar page"
    :dates-note "Footer date 19/06/2025 on the sheet; standing calendar 'applicable continuously for all years until further notice'. No earlier yearly lists found (web.archive.org not reachable)."
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Exchange days are all business days Monday to Friday which are not one of: 1 Jan, Good Friday, Easter Monday, 1 May, 24 Dec*, 25 Dec, 26 Dec, 31 Dec* (*gas and freight derivatives 08:00-13:00 CET).")
   (:title "EEX: 25 years (first trade 15 June 2000 at Leipzig Power Exchange)"
    :uri "https://www.eex.com/fileadmin/Global/News/EEX/EEX_Press_Release/2025/20250616_EEX_25th_Anniversary.pdf"
    :issued (2025 6 16) :issued-uri "https://www.eex.com/fileadmin/Global/News/EEX/EEX_Press_Release/2025/20250616_EEX_25th_Anniversary.pdf"
    :published (2025 6 16) :published-uri "https://www.eex.com/fileadmin/Global/News/EEX/EEX_Press_Release/2025/20250616_EEX_25th_Anniversary.pdf"
    :published-in "EEX press release"
    :dates-note nil
    :closed ()
    :open ()
    :early-closes ()
    :late-opens ()
    :note "Start of exchange: LPX first trade 15 June 2000; EEX Frankfurt started August 2000; merger to European Energy Exchange AG (Leipzig) 2002 (EEX Group milestones https://www.eex-group.com/en/about/milestones).")
 ))
