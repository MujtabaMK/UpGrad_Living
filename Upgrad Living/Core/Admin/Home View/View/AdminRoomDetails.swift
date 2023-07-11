//
//  AdminRoomDetails.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 05/07/23.
//

import SwiftUI
import Charts

struct AdminRoomDetails: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @StateObject private var viewModelMeal = ParentHomeViewModel()
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    @State private var alert2Message = ""
    @State private var show2Alert = false
    @State private var buttonTitle = ""
    
    @State private var isBookingDropdown = false
    @State private var BookingID = "1"
    @State private var BookingName = "1 Bed"
    
    var body: some View {
        VStack{
            HStack{
                Text("Room Details")
                    .font(.custom(OpenSans_Bold, size: 20))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x1A1A1A, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                
                Spacer()
                
                Button {
                    isBookingDropdown.toggle()
                } label: {
                    HStack{
                        Image(isBookingDropdown ? "Admin_Drop_Up" : "Admin_Drop_Down")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                        
                        Text(BookingName)
                            .font(.custom(OpenSans_Regular, size: 12))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                    }
                    .padding(.horizontal)
                    .frame(width: 130, height: 34)
                    .cornerRadius(40)
                    .overlay{
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color(hex: 0xF1F1FA), lineWidth: 1)
                    }
                }
            }
            .padding(.top)
            .padding(.bottom, 20)
            
            if isBookingDropdown{
                HStack{
                    Spacer()
                    VStack{
                        ForEach(arrBeds) { category in
                            Button {
                                BookingName = category.name
                                BookingID = category.id
                                isBookingDropdown.toggle()
                            } label: {
                                VStack{
                                    HStack{
                                        Text(category.name)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(Color(hex: 0x868686))
                                            .padding(.leading)
                                            .padding(.top)
                                        
                                        Spacer()
                                    }
                                    HLine()
                                        .stroke(style: StrokeStyle(lineWidth: 0.5, dash: [1]))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                        .frame(width: getRect().width - 40,height: 1)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                    .frame(width: 130)
                    .background(colorScheme == .light ? Color(hex: 0xF9F9F9) : Color(hex: 0x2E2E2E))
                    .cornerRadius(15)
                    .shadow(color: .gray, radius: 2, x: 0, y: 0)
                    .offset(y: -20)
                }
            }
            VStack {
                // 1. Add a chart element
                if #available(iOS 16.0, *) {
                    Chart(revenueData) { item in
                        // 2. Bar mark for each revenur item in the array
                        BarMark(
                            x: .value("Period", item.period),
                            y: .value("Amount", item.amount)
                        )
                    }
                } else {
                    // Fallback on earlier versions
                }
            }
            .padding()
        }
        .padding(.horizontal)
    }
}
