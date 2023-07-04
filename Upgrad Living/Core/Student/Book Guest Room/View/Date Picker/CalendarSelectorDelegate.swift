//
//  CalendarSelectorDelegate.swift
//  calender
//
//  Created by Mujtaba Khan on 03/07/23.
//

import SwiftUI
import WWCalendarTimeSelector

class CalendarSelectorDelegate: WWCalendarTimeSelectorProtocol {
    @Binding var singleDate: Date?
    @Binding var selectedDateString: String
    @Binding var multipleDates: [Date]
    @Binding var startDateGlobal: String
    @Binding var endDateGlobal: String
    @Binding var DifferenceBetweenDays: String
    
    @State private var minDate: Date = Date()
    
    init(singleDate: Binding<Date?>, selectedDateString: Binding<String>, multipleDates: Binding<[Date]>, startDateGlobal: Binding<String>, endDateGlobal: Binding<String>, DifferenceBetweenDays: Binding<String>) {
        _singleDate = singleDate
        _selectedDateString = selectedDateString
        _multipleDates = multipleDates
        _startDateGlobal = startDateGlobal
        _endDateGlobal = endDateGlobal
        _DifferenceBetweenDays = DifferenceBetweenDays
    }
    
    func WWCalendarTimeSelectorDone(_ selector: WWCalendarTimeSelector, date: Date) {
        print("Selected \n\(date)\n---")
        singleDate = date
        print(date)
        selectedDateString = date.stringFromFormat("dd/MM/yyyy")
    }
    
    func WWCalendarTimeSelectorDone(_ selector: WWCalendarTimeSelector, dates: [Date]) {
        print("Selected Multiple Dates \n\(dates)\n---")
        if let date = dates.first {
            singleDate = date
            let firstDate = date.stringFromFormat("yyyy-MM-dd")
            
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            let Startdate = dateFormatter.date(from:firstDate)!
            let startModifiedDate = Calendar.current.date(byAdding: .day, value:0, to: Startdate)
            let FirstDate = startModifiedDate?.stringFromFormat("dd MMM yyyy")
            startDateGlobal = FirstDate ?? ""
            
            let newDate = dates.last
            let lastDate = newDate!.stringFromFormat("yyyy-MM-dd")
            
            let Enddate = dateFormatter.date(from:lastDate)!
            let EndModifiedDate = Calendar.current.date(byAdding: .day, value: 0, to: Enddate)
            let EndDate = EndModifiedDate?.stringFromFormat("dd MMM yyyy")
            endDateGlobal = EndDate ?? ""
            
            let diffInDays = Calendar.current.dateComponents([.day], from: Startdate, to: Enddate).day
            DifferenceBetweenDays = "\(diffInDays ?? 0)"
            
            if startDateGlobal == endDateGlobal{
                let newDate = dates.last
                let lastDate = newDate!.stringFromFormat("yyyy-MM-dd")
                
                let Enddate = dateFormatter.date(from:lastDate)!
                let EndModifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: Enddate)
                let EndDate = EndModifiedDate?.stringFromFormat("dd MMM yyyy")
                endDateGlobal = EndDate ?? ""
                
                let diffInDays = Calendar.current.dateComponents([.day], from: startModifiedDate!, to: EndModifiedDate!).day
                DifferenceBetweenDays = "\(diffInDays ?? 0)"
            }
        } else {
            selectedDateString = "No Date Selected"
        }
        
        print("Label Value = ", selectedDateString)
        multipleDates = dates
        
        print(startDateGlobal)
        print(endDateGlobal)
    }
    
    func WWCalendarTimeSelectorShouldSelectDate(_ selector: WWCalendarTimeSelector, date: Date) -> Bool {
        if date >= minDate{
            return true
        }
        return false
    }
}
