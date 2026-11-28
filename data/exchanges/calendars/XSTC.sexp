;;;; XSTC exchange trading-day calendar (#49), Ho Chi Minh City Stock Exchange (HOSE).
;;;; Rule (HOSE trading regulation): trading Monday-Friday "trừ các ngày nghỉ theo quy định của Bộ luật Lao động".
;;;; HOSE's yearly holiday notices show it closes the statutory holidays, their nghỉ bù AND the government's
;;;; hoán đổi (swapped) weekdays, and never trades on the make-up Saturday ("HOSE will not implement trading on
;;;; Saturday ..."). That is exactly the VN civil calendar (statutory rules + data/vn/notices.sexp :tet,
;;;; :quoc-khanh, :holidays; :working Saturdays are weekend days for HOSE). So: base VN for all years;
;;;; notices list HOSE's own closures where its notice was found (redundant with the base, as evidence).
;;;; hsx.vn is a JS app (api.hsx.vn); notices were read from staticfile.hsx.vn and from HOSE's disclosure copies
;;;; on Vietstock (static2.vietstock.vn PDFs = HOSE's own document; en.vietstock.vn = HOSE notice text).

(:name "XSTC"
 :title "Ho Chi Minh City Stock Exchange (HOSE) trading days"
 :authority "HOSE trading regulation (Quy định giao dịch, website version, attached to 51/TTr-HTGD of 26/04/2025), section 2; HOSE yearly Notices of Holiday Schedule" :authority-uri "https://static2.vietstock.vn/vietstock/2025/4/29/20250429_20250429___hose___quy_dinh_giao_dich_dang_website_hose.pdf"
 :bases ((:calendar "VN" :from nil :to nil
          :authority "HOSE regulation: 'Thời gian giao dịch chứng khoán niêm yết từ thứ hai đến thứ sáu hàng tuần, trừ các ngày nghỉ theo quy định của Bộ luật Lao động'; HOSE notices 2016, 2021-2026 match the government Tết / holiday schedules incl. hoán đổi days (2024-04-29, 2025-05-02, 2026-01-02, 2026-08-31)."))
 :rules ()
 :gaps (
   (:years "2000-2015" :note "No HOSE (HoSTC to 2007) yearly holiday notice retrieved; web.archive.org unreachable; hsx.vn news is served by api.hsx.vn (JS app). Base VN only. NOTE: from the first session (28 Jul 2000) HoSTC traded only Mondays, Wednesdays and Fridays, mornings 09:00-11:00 (Nhân Dân, 25 years of HOSE trading, https://nhandan.vn/25-nam-to-chuc-hoat-dong-giao-dich-chung-khoan-tai-so-giao-dich-chung-khoan-thanh-pho-ho-chi-minh-post898745.html - secondary); the date of the move to five sessions a week was not found - see XSTC-hours.md.")
   (:years "2017-2020" :note "HOSE holiday notices for these years not found (searched en.vietstock.vn and staticfile.hsx.vn via web search). Base VN only.")
   (:years "2027-2028" :note "HOSE 2027 notice not yet issued (HOSE publishes in December of the prior year). Base VN only."))
 :notices (
   (:title "HOSE Announcement No.613/TB-SGDHCM: holiday schedule 2016" :year 2016
    :uri "https://en.vietstock.vn/2015/06/hose-notice-of-holiday-schedule-2016-36-207307.htm"
    :issued (2015 6 3) :issued-uri "https://en.vietstock.vn/2015/06/hose-notice-of-holiday-schedule-2016-36-207307.htm"
    :published (2015 6 4) :published-uri "https://en.vietstock.vn/2015/06/hose-notice-of-holiday-schedule-2016-36-207307.htm"
    :published-in "HOSE announcement, English text as disclosed on Vietstock"
    :dates-note "Issued June 2015, before the government's 2016 Tết decision; dates as in the notice."
    :closed (((2016 1 1) "New Year") ((2016 2 8) "Lunar New Year") ((2016 2 9) "Lunar New Year") ((2016 2 10) "Lunar New Year") ((2016 2 11) "Lunar New Year") ((2016 2 12) "Lunar New Year") ((2016 4 18) "Hung Kings' Day") ((2016 5 2) "Liberation Day and Labor Day") ((2016 5 3) "Liberation Day and Labor Day") ((2016 9 2) "National Day"))
    :open () :early-closes () :late-opens ())
   (:title "HOSE: Notice of Holiday Schedule 2021" :year 2021
    :uri "https://en.vietstock.vn/2020/12/hose-notice-of-holiday-schedule-2021-36-430999.htm"
    :issued nil :issued-uri nil
    :published (2020 12 15) :published-uri "https://en.vietstock.vn/2020/12/hose-notice-of-holiday-schedule-2021-36-430999.htm"
    :published-in "HOSE notice, English text as disclosed on Vietstock"
    :dates-note "Disclosure timestamp 15-12-2020 16:11; HOSE issue date not shown."
    :closed (((2021 1 1) "New Year") ((2021 2 10) "Lunar New Year") ((2021 2 11) "Lunar New Year") ((2021 2 12) "Lunar New Year") ((2021 2 15) "Lunar New Year") ((2021 2 16) "Lunar New Year") ((2021 4 21) "Hung Kings' Day") ((2021 4 30) "Liberation Day") ((2021 5 3) "Labor Day (nghỉ bù)") ((2021 9 2) "National Day") ((2021 9 3) "National Day"))
    :open () :early-closes () :late-opens ())
   (:title "HOSE: Notice of Holiday Schedule 2022" :year 2022
    :uri "https://en.vietstock.vn/2021/12/hose--notice-of-holiday-schedule-2022-36-465293.htm"
    :issued nil :issued-uri nil
    :published (2021 12 23) :published-uri "https://en.vietstock.vn/2021/12/hose--notice-of-holiday-schedule-2022-36-465293.htm"
    :published-in "HOSE notice, English text as disclosed on Vietstock"
    :dates-note "Disclosure timestamp 23-12-2021 12:20; HOSE issue date not shown."
    :closed (((2022 1 3) "New Year (nghỉ bù)") ((2022 1 31) "Lunar New Year") ((2022 2 1) "Lunar New Year") ((2022 2 2) "Lunar New Year") ((2022 2 3) "Lunar New Year") ((2022 2 4) "Lunar New Year") ((2022 4 11) "Hung Kings' Day (nghỉ bù)") ((2022 5 2) "Liberation Day and Labor Day (nghỉ bù)") ((2022 5 3) "Liberation Day and Labor Day (nghỉ bù)") ((2022 9 1) "National Day") ((2022 9 2) "National Day"))
    :open () :early-closes () :late-opens ())
   (:title "HOSE: Notice of Holiday Schedule 2023" :year 2023
    :uri "https://en.vietstock.vn/2022/12/hose-notice-of-holiday-schedule-2023-36-496898.htm"
    :issued nil :issued-uri nil
    :published (2022 12 14) :published-uri "https://en.vietstock.vn/2022/12/hose-notice-of-holiday-schedule-2023-36-496898.htm"
    :published-in "HOSE notice, English text as disclosed on Vietstock"
    :dates-note "Disclosure timestamp 14-12-2022 14:53; HOSE issue date not shown."
    :closed (((2023 1 2) "New Year (nghỉ bù)") ((2023 1 20) "Lunar New Year") ((2023 1 23) "Lunar New Year") ((2023 1 24) "Lunar New Year") ((2023 1 25) "Lunar New Year") ((2023 1 26) "Lunar New Year") ((2023 5 1) "Hung Kings' Day, Liberation Day and Labor Day") ((2023 5 2) "Hung Kings' Day, Liberation Day and Labor Day") ((2023 5 3) "Hung Kings' Day, Liberation Day and Labor Day") ((2023 9 1) "National Day") ((2023 9 4) "National Day"))
    :open () :early-closes () :late-opens ())
   (:title "HOSE: Update on Holiday Schedule in 2024 (Liberation Day and Labor Day)" :year 2024
    :uri "https://static2.vietstock.vn/vietstock/2024/4/22/20240422_hose_240422_update_on_holiday_schedule_in_2024__tl_2.pdf"
    :issued (2024 4 19) :issued-uri "https://static2.vietstock.vn/vietstock/2024/4/22/20240422_hose_240422_update_on_holiday_schedule_in_2024__tl_2.pdf"
    :published (2024 4 22) :published-uri "https://static2.vietstock.vn/vietstock/2024/4/22/20240422_hose_240422_update_on_holiday_schedule_in_2024__tl_2.pdf"
    :published-in "HOSE disclosure (PDF) as hosted by Vietstock"
    :dates-note "Updates the 2024 schedule for the hoán đổi of Mon 29 Apr (make-up Sat 4 May, no trading). The original 2024 HOSE schedule was not retrieved."
    :closed (((2024 4 29) "Liberation Day and Labor Day (hoán đổi)") ((2024 4 30) "Liberation Day") ((2024 5 1) "Labor Day"))
    :open () :early-closes () :late-opens ())
   (:title "Lunar New Year 2024 trading holiday (HOSE/HNX/VSDC notices, as reported)" :year 2024
    :uri "https://baodautu.vn/thi-truong-chung-khoan-dong-cua-giao-dich-5-phien-nghi-tet-nguyen-dan-giap-thin-2024-d208588.html"
    :issued nil :issued-uri nil
    :published (2024 2 5) :published-uri "https://baodautu.vn/thi-truong-chung-khoan-dong-cua-giao-dich-5-phien-nghi-tet-nguyen-dan-giap-thin-2024-d208588.html"
    :published-in "Báo Đầu tư report (05/02/2024)"
    :dates-note "Market closed 5 sessions, 8/2/2024 (29 Tết) to 14/2/2024, reopening 15/2/2024."
    :confidence :secondary
    :closed (((2024 2 8) "Lunar New Year") ((2024 2 9) "Lunar New Year") ((2024 2 12) "Lunar New Year") ((2024 2 13) "Lunar New Year") ((2024 2 14) "Lunar New Year"))
    :open () :early-closes () :late-opens ())
   (:title "HOSE: Notice of Holiday Schedule 2025" :year 2025
    :uri "https://static2.vietstock.vn/vietstock/2024/12/27/20241227_hose_241227_notice_of_holiday_schedule_2025____pv.pdf"
    :issued (2024 12 26) :issued-uri "https://static2.vietstock.vn/vietstock/2024/12/27/20241227_hose_241227_notice_of_holiday_schedule_2025____pv.pdf"
    :published (2024 12 27) :published-uri "https://static2.vietstock.vn/vietstock/2024/12/27/20241227_hose_241227_notice_of_holiday_schedule_2025____pv.pdf"
    :published-in "HOSE disclosure (PDF) as hosted by Vietstock"
    :dates-note "'The Hochiminh Stock Exchange will not trade on April 26, 2025 because it is a Saturday' (make-up day for the 2 May hoán đổi)."
    :closed (((2025 1 1) "New Year") ((2025 1 27) "Lunar New Year") ((2025 1 28) "Lunar New Year") ((2025 1 29) "Lunar New Year") ((2025 1 30) "Lunar New Year") ((2025 1 31) "Lunar New Year") ((2025 4 7) "Hung Kings' Day") ((2025 4 30) "Liberation Day") ((2025 5 1) "Labor Day") ((2025 5 2) "Liberation Day and Labor Day (hoán đổi)") ((2025 9 1) "National Day") ((2025 9 2) "National Day"))
    :open () :early-closes () :late-opens ())
   (:title "HOSE: Notice of trading holiday schedule for 2026" :year 2026
    :uri "https://staticfile.hsx.vn/Uploads/UploadDocuments/2428610/20251209%20-%20HOSE%20-%20Notice%20of%20trading%20holiday%20schedule%20for%202026%20-%20PV.pdf"
    :issued (2025 12 9) :issued-uri "https://staticfile.hsx.vn/Uploads/UploadDocuments/2428610/20251209%20-%20HOSE%20-%20Notice%20of%20trading%20holiday%20schedule%20for%202026%20-%20PV.pdf"
    :published (2025 12 9) :published-uri "https://staticfile.hsx.vn/Uploads/UploadDocuments/2428610/20251209%20-%20HOSE%20-%20Notice%20of%20trading%20holiday%20schedule%20for%202026%20-%20PV.pdf"
    :published-in "HOSE website (staticfile.hsx.vn)"
    :dates-note "HOSE will not trade on Sat 10 Jan 2026 and Sat 22 Aug 2026 (make-up days for the 2 Jan and 31 Aug hoán đổi). A later 'Updated New Year 2026 Trading Holiday' notice (26 Dec 2025, listed on FiinPro) was not retrieved."
    :closed (((2026 1 1) "New Year") ((2026 1 2) "New Year (hoán đổi)") ((2026 2 16) "Lunar New Year") ((2026 2 17) "Lunar New Year") ((2026 2 18) "Lunar New Year") ((2026 2 19) "Lunar New Year") ((2026 2 20) "Lunar New Year") ((2026 4 27) "Hung Kings' Day (nghỉ bù)") ((2026 4 30) "Liberation Day") ((2026 5 1) "Labor Day") ((2026 8 31) "National Day (hoán đổi)") ((2026 9 1) "National Day") ((2026 9 2) "National Day"))
    :open () :early-closes () :late-opens ())))
