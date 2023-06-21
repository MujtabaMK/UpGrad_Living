//
//  ServiceBookingView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 21/06/23.
//

import SwiftUI

struct ServiceBookingView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    var body: some View {
        VStack{
            HStack{
                Rectangle()
                    .fill(Color(hex: 0xE1F9FA))
                    .frame(width: 65, height: 100)
                    .cornerRadius(12, corners: [.topLeft, .bottomLeft])
                    .overlay {
                        VStack{
                            Spacer()
                            
                            Text("1")
                                .font(.custom(OpenSans_Bold, size: 20))
                                .foregroundColor(Color(hex: 0x00B2BA))
                                .overlay {
                                    Circle()
                                        .stroke(style: StrokeStyle(lineWidth: 0.5))
                                        .foregroundColor(Color(hex: 0x00B2BA))
                                        .frame(width: 27, height: 27)
                                }
                            
                            Spacer()
                        }
                    }
                VStack(alignment: .leading, spacing: 6){
                    Text("Dining table booking")
                        .font(.custom(OpenSans_SemiBold, size: 14))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                    
                    Text("May 12, 2023")
                        .font(.custom(OpenSans_SemiBold, size: 14))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                    
                    Text("04:00 PM - 04:30 PM")
                        .font(.custom(OpenSans_SemiBold, size: 14))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                }
                
                Spacer()
                
                Image("Service_Booking_Right_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                    .padding(.trailing)
            }
        }
        .frame(width: getRect().width - 40, height: 100)
        .background(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0x000000))
        .cornerRadius(12)
        .shadow(color: .gray, radius: 3, x: 0, y: 0)
        .padding(.bottom)
    }
}
