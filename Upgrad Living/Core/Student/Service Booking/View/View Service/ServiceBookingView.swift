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
    
    @State private var isServiceTicket = false
    
    @State private var qrImage = ""
    @State private var eventDate = ""
    @State private var eventTime = ""
    @State private var eventLocation = ""
    @State private var bookTicketPDF = ""
    
    var arrslotDetails: [ListServiceSlot]
    
    var body: some View {
        VStack{
            ForEach(Array(arrslotDetails.enumerated()), id: \.offset) { index ,detail in
                Button {
                    qrImage = detail.image ?? ""
                    eventDate = detail.fulldate ?? ""
                    eventTime = detail.slotTiming ?? ""
                    eventLocation = detail.categoryName ?? ""
                    bookTicketPDF = detail.ticketPDF ?? ""
                    isServiceTicket = true
                } label: {
                    VStack{
                        HStack{
                            Rectangle()
                                .fill(Color(hex: 0xE1F9FA))
                                .frame(width: 65, height: 100)
                                .cornerRadius(12, corners: [.topLeft, .bottomLeft])
                                .overlay {
                                    VStack{
                                        Spacer()
                                        
                                        Text("\(index + 1)")
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
                                Text(detail.categoryName ?? "")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                
                                Text(detail.fulldate ?? "")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                
                                Text(detail.slotTiming ?? "")
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
                    .background(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0x2E2E2E))
                    .cornerRadius(12)
                    .shadow(color: .gray, radius: 3, x: 0, y: 0)
                    .padding(.bottom)
                }
            }
            
            NavigationLink(
                "",
                destination:ServiceBookingTicket(
                    qrImage: qrImage,
                    eventDate: eventDate,
                    eventTime: eventTime,
                    eventLocation: eventLocation,
                    bookTicketPDF: bookTicketPDF).navigationBarHidden(true),
                isActive: $isServiceTicket).isDetailLink(false)
        }
    }
}
