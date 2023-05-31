//
//  MultipleDatePopup.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 23/05/23.
//

import SwiftUI

struct MultipleDatePopup: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var dateRange: ClosedRange<Date>? = nil
    @Binding var show: Bool
    @State var ShowVisitoeView = false
    @Binding var CustomStartDate: String
    @Binding var CustomEndDate: String
    
    var body: some View {
        ZStack {
            if show {
                colorScheme == .light ? Color.white.opacity(show ? 1 : 0).edgesIgnoringSafeArea(.all) : Color.black.opacity(show ? 1 : 0).edgesIgnoringSafeArea(.all)
                VStack {
                    
                    Text("Date Range").font(.title).padding()
                    MultiDatePicker(dateRange: self.$dateRange)
                    if let range = dateRange {
                        Text("\(range)").padding()
                    } else {
                        Text("Select two dates").padding()
                    }
                    
                    HStack(spacing: 10){
                        Spacer()
                        Button(action: {
                            // Dismiss the PopUp
                            withAnimation(.linear(duration: 0.3)) {
                                show = false
                            }
                        }, label: {
                            Text("Cancel")
                                .font(.title2)
                                .foregroundColor(colorScheme == .light ? .red : .red)
                        })
                        
                        Button(action: {
                            // Dismiss the PopUp
                            withAnimation(.linear(duration: 0.3)) {
                                getDateRange(dateRange: dateRange)
                                show = false
                            }
                        }, label: {
                            Text("OK")
                                .font(.title2)
                                .foregroundColor(colorScheme == .light ? .black : .white)
                        })
                    }
                }
            }
        }
        .frame(maxWidth: UIScreen.main.bounds.width - 30)
        .cornerRadius(20)
    }
    func getDateRange(dateRange: ClosedRange<Date>?){
        if let range = dateRange {
            var newRange = String()
            newRange = "\(range)"
            let fullnamearr = newRange.components(separatedBy: ".")
            let FirstString = fullnamearr[0]
            let Startfullarr = FirstString.components(separatedBy: " ")
            let StartDateString = Startfullarr[0]
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let Startdate = dateFormatter.date(from:StartDateString)!
            let startModifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: Startdate)
            let FirstDate = startModifiedDate?.stringFromFormat("yyyy-MM-dd")
            CustomStartDate = FirstDate ?? ""
            UserDefaults.standard.set(FirstDate, forKey: "DashboardCustomStartDate")
            
            let LastString = fullnamearr[3]
            let Endfullarr = LastString.components(separatedBy: " ")
            let EndDateString = Endfullarr[0]
            let dateFormatterEnd = DateFormatter()
            dateFormatterEnd.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            dateFormatterEnd.dateFormat = "yyyy-MM-dd"
            let Enddate = dateFormatter.date(from:EndDateString)!
            let EndModifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: Enddate)
            let LastDate = EndModifiedDate?.stringFromFormat("yyyy-MM-dd")
            CustomEndDate = LastDate ?? ""
            UserDefaults.standard.set(LastDate, forKey: "DashboardCustomEndDate")
        }
    }
}
// MARK: - Format dates
extension Date{
    public func stringFromFormat(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
