//
//  NotificationView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 08/06/23.
//

import SwiftUI

struct NotificationView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    @Binding var isBackNotification: Bool    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView(showsIndicators: false) {
                    VStack{
                        HStack{
                            Button {
                                isBackNotification = true
                            } label: {
                                Image("back_Button")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .padding(.leading, 30)
                            }
                            Spacer(minLength: 0)
                            
                            Text("Notification")
                                .font(.custom(OpenSans_Bold, size: 18))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x000000) : .white)
                                .padding(.trailing, 30)
                            Spacer(minLength: 0)
                        }
                        .padding(.trailing)
                        .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                        
                        Divider()
                        
                        if arrNotificationClick.count < 0{
                            VStack(spacing: 15){
                                Spacer()
                                Image("No_Notification_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 193, height: 191)
                                
                                Text("No Notifications yet!")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                                
                                Text("We’ll notify you once we have \nsomething for you")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                                    .multilineTextAlignment(.center)
                                Spacer()
                            }
                        }
                        
                        ForEach(Array(arrNotificationClick.enumerated()), id: \.offset) { index, noti in
                            VStack(alignment: .leading){
                                Text(noti.NotificationDate)
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                    .padding(.leading, 5)
                                    .padding(.top, 15)
                                
                                NotificationCell(arrGetNotifi: noti.NotificationArray)
                            }
                        }
                        .padding(.bottom)
                    }
                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }
}
