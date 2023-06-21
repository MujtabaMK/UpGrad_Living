//
//  GuestDatePopup.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 10/06/23.
//

import SwiftUI

struct GuestDatePopup: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var dateRange: ClosedRange<Date>? = nil
    
    @State private var Date1 = Date()
    @State private var Date2 = Date()
    
    @Binding var show: Bool
    @State var ShowVisitoeView = false
    @Binding var CustomStartDate: String
    @Binding var CustomEndDate: String
    @Binding var DifferenceBetweenDays: String
    @Binding var ShowAlertPopup: Bool
    @Binding var AlertMessage: String
    @Binding var AlertShow: String
    
    var body: some View {
        ZStack {
            if show {
                Color.black.opacity(show ? 0 : 0).edgesIgnoringSafeArea(.all)
                VStack {
                    let now = Date.now
                    let StartModifiedDate = Calendar.current.date(byAdding: .day, value: -1, to: now)
                    
                    MultiDatePicker(dateRange: self.$dateRange, minDate: StartModifiedDate)
                        
                    HStack(spacing: 10){
                        Spacer()
                        Button(action: {
                            // Dismiss the PopUp
                            withAnimation(.linear(duration: 0.3)) {
                                show = false
                            }
                        }, label: {
                            Text("Cancel")
                                .font(.title3)
                                .foregroundColor(colorScheme == .light ? .red : .red)
                        })
                        
                        Button(action: {
                            // Dismiss the PopUp
                            withAnimation(.linear(duration: 0.3)) {
                                getDateRangeGuest(dateRange: dateRange)
                                show = false
                            }
                        }, label: {
                            Text("OK")
                                .font(.title3)
                                .foregroundColor(colorScheme == .light ? .black : .black)
                        })
                    }
                    .padding(.trailing)
                    .padding(.bottom)
                }
                .background(.white)
                .cornerRadius(5)
                .shadow(color: .gray, radius: 4, x: 0, y: 0)
            }
        }
        .onAppear{
            Date1 =  Calendar.current.date(byAdding: .day, value: -1, to: Date1) ?? Date()
            dateRange = Date1...Date2
        }
        .onChange(of: dateRange, perform: { newValue in
            print("Range selected: \(String(describing: dateRange))")
        })
        .frame(maxWidth: UIScreen.main.bounds.width - 40)
        .cornerRadius(20)
    }
    
    func getDateRangeGuest(dateRange: ClosedRange<Date>?){
        if let range = dateRange {
            var newRange = String()
            newRange = "\(range)"
            print(newRange)
            
            let fullnamearr = newRange.components(separatedBy: ".")
            let FirstString = fullnamearr[0]
            let Startfullarr = FirstString.components(separatedBy: " ")
            let StartDateString = Startfullarr[0]
            
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let Startdate = dateFormatter.date(from:StartDateString)!
            let startModifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: Startdate)
            let FirstDate = startModifiedDate?.stringFromFormat("dd MMM yyyy")
            CustomStartDate = FirstDate ?? ""
            print(CustomStartDate)
            
            let LastString = fullnamearr[3]
            let Endfullarr = LastString.components(separatedBy: " ")
            let EndDateString = Endfullarr[0]
            let dateFormatterEnd = DateFormatter()
            dateFormatterEnd.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            dateFormatterEnd.dateFormat = "yyyy-MM-dd"
            let Enddate = dateFormatter.date(from:EndDateString)!
            let EndModifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: Enddate)
            let LastDate = EndModifiedDate?.stringFromFormat("dd MMM yyyy")
            CustomEndDate = LastDate ?? ""
                        
            let diffInDays = Calendar.current.dateComponents([.day], from: Startdate, to: Enddate).day
            DifferenceBetweenDays = "\(diffInDays ?? 0)"
        }else{
            AlertShow = "1"
            AlertMessage = "Please select date for atlist one nights"
            ShowAlertPopup = true
        }
    }
}

extension Calendar {
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from) // <1>
        let toDate = startOfDay(for: to) // <2>
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate) // <3>
        
        return numberOfDays.day!
    }
}

