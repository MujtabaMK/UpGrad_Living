//
//  AdminHomeView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 04/07/23.
//

import SwiftUI

struct AdminHomeView: View {
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
    
    @State private var isApprovalDropdown = false
    @State private var approvalID = "1"
    @State private var approvalName = "Today"
    
    
    //Current Index...
    @State var currentIndex: Int = 0
    
    @Binding var isLogout: Bool
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView(showsIndicators: false) {
                    ZStack(alignment: .top){
                        HStack{
                            Image("Admin_Upgrad_Living_icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 169, height: 30)
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Image("Admin_Notification_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25,height: 25)
                            }

                            Button {
                                alert2Message = "Are you sure you want to Logout?"
                                buttonTitle = "Logout"
                                show2Alert = true
                            } label: {
                                Image("Admin_Logout")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25,height: 25)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                    }
                    VStack{
                        AdminApprovalRequest()
                            .padding(.top)
                        AdminBookingStatus()
                            .padding(.top)
                            .padding(.bottom, 70)
                    }
                }
                .padding(.bottom)
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .alert(isPresented:$show2Alert) {
                Alert(
                    title: Text(alert2Message),
                    message: Text(""),
                    primaryButton: .destructive(Text(buttonTitle)) {
                        UserDefaults.standard.set(false, forKey: "isLogin")
                        isLogout = true
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
}
