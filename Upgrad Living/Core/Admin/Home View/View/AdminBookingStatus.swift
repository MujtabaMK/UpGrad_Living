//
//  AdminBookingStatus.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 04/07/23.
//

import SwiftUI

struct AdminBookingStatus: View {
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
    @State private var BookingName = "Today"
    
    @State var progress: Double = 0
    
    @State private var applicationRecivedAmount = 0.0
    @State private var securityDepositAmount = 0.0
    @State private var roomSelectedAmount = 0.0
    @State private var rentPaidAmount = 0.0
    @State private var agreementSignedAmount = 0.0
    
    var body: some View {
        VStack{
            HStack{
                Text("Booking Status")
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
                        ForEach(arrAdminDrop) { category in
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
                    .offset(y: -23)
                }
            }
            VStack{
                Spacer()
                ZStack{
                    CircularProgressView(progress: progress)
                        .padding(.top)
                    
                    VStack{
                        Text("\(progress * 100, specifier: "%.0f")%")
                            .font(.custom(OpenSans_Bold, size: 20))
                            .foregroundColor(Color(hex: 0xEE2C3C))
                        
                        Text("Security Deposit \npaid")
                            .font(.custom(OpenSans_Bold, size: 16))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                            .multilineTextAlignment(.center)
                    }
                }
                .frame(width: 200, height: 200)
            }
            VStack{
                VStack{
                    HStack{
                        Text("Applications Received")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0x333333, alpha: 1.0))
                            .padding()
                            .background(colorScheme == .light ? Color(hex: 0xFCFCFC) : Color(hex: 0xFCFCFC))
                            .cornerRadius(12)
                            .shadow(color: .gray, radius: 2, x: 0, y: 0)
                            .overlay{
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(hex: 0xF1F1FA), lineWidth: 1)
                            }
                        
                        Spacer()
                        
                        Text("550")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x868686))
                    }
                    .padding(.top)
                    
                    ProgressView("", value: applicationRecivedAmount, total: 100)
                        .tint(Color(hex: 0xEE2C3C))
                        .scaleEffect(x: 1, y: 2, anchor: .center)
                        .padding(.top, -5)
                        .padding(.bottom)
                }
                VStack{
                    HStack{
                        Text("Security Deposit Paid")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0x333333, alpha: 1.0))
                            .padding()
                            .background(colorScheme == .light ? Color(hex: 0xFCFCFC) : Color(hex: 0xFCFCFC))
                            .cornerRadius(12)
                            .shadow(color: .gray, radius: 2, x: 0, y: 0)
                            .overlay{
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(hex: 0xF1F1FA), lineWidth: 1)
                            }
                        
                        Spacer()
                        
                        Text("342")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x868686))
                    }
                    .padding(.top)
                    
                    ProgressView("", value: securityDepositAmount, total: 100)
                        .tint(Color(hex: 0x685BC7))
                        .scaleEffect(x: 1, y: 2, anchor: .center)
                }
                VStack{
                    HStack{
                        Text("Room Selected")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0x333333, alpha: 1.0))
                            .padding()
                            .background(colorScheme == .light ? Color(hex: 0xFCFCFC) : Color(hex: 0xFCFCFC))
                            .cornerRadius(12)
                            .shadow(color: .gray, radius: 2, x: 0, y: 0)
                            .overlay{
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(hex: 0xF1F1FA), lineWidth: 1)
                            }
                        
                        Spacer()
                        
                        Text("250")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x868686))
                    }
                    .padding(.top)
                    
                    ProgressView("", value: roomSelectedAmount, total: 100)
                        .tint(Color(hex: 0x3CA0D1))
                        .scaleEffect(x: 1, y: 2, anchor: .center)
                }
                VStack{
                    HStack{
                        Text("Rent Paid")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0x333333, alpha: 1.0))
                            .padding()
                            .background(colorScheme == .light ? Color(hex: 0xFCFCFC) : Color(hex: 0xFCFCFC))
                            .cornerRadius(12)
                            .shadow(color: .gray, radius: 2, x: 0, y: 0)
                            .overlay{
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(hex: 0xF1F1FA), lineWidth: 1)
                            }
                        
                        Spacer()
                        
                        Text("200")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x868686))
                    }
                    .padding(.top)
                    
                    ProgressView("", value: rentPaidAmount, total: 100)
                        .tint(Color(hex: 0xED5D2B))
                        .scaleEffect(x: 1, y: 2, anchor: .center)
                }
                VStack{
                    HStack{
                        Text("Agreement Signed")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0x333333, alpha: 1.0))
                            .padding()
                            .background(colorScheme == .light ? Color(hex: 0xFCFCFC) : Color(hex: 0xFCFCFC))
                            .cornerRadius(12)
                            .shadow(color: .gray, radius: 2, x: 0, y: 0)
                            .overlay{
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(hex: 0xF1F1FA), lineWidth: 1)
                            }
                        
                        Spacer()
                        
                        Text("190")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x868686))
                    }
                    .padding(.top)
                    
                    ProgressView("", value: agreementSignedAmount, total: 100)
                        .tint(Color(hex: 0xEDA02B))
                        .scaleEffect(x: 1, y: 2, anchor: .center)
                }
            }
        }
        .padding(.horizontal)
        .onAppear{
            progress = 0.7
            applicationRecivedAmount = 80
            securityDepositAmount = 70
            roomSelectedAmount = 60
            rentPaidAmount = 50
            agreementSignedAmount = 20
        }
    }
}
