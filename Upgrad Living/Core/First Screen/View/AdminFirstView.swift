//
//  AdminFirstView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 04/07/23.
//

import SwiftUI

struct AdminFirstView: View {
    
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @AppStorage("SendPageTo") private var SendPageTo = ""
    @AppStorage("studentUserType") private var studentUserType = ""
    @AppStorage("DataFromLogin") private var DataFromLogin = ""
    
    @State private var isAdminView = false
    @State private var isAdminLogout = false
    
    
    var EventScreen: String
    @Binding var newSelectedIndex: Int
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("Blank_Launch_Screen")
                    .resizable()
                    .scaledToFill()
                if EventScreen == ""{
                    Image("Upgrad_Logo_White")
                        .resizable()
                        .frame(width: 281, height: 40)
                }else{
                    LoadingView()
                }
                
                VStack{
                    NavigationLink(
                        "",
                        destination: AdminViewTabBar(
                            NewSelectedIndex: $newSelectedIndex,
                            isAdminLogout: $isAdminLogout
                        ).navigationBarHidden(true),
                        isActive: $isAdminView).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: LoginView().navigationBarHidden(true),
                        isActive: $isAdminLogout).isDetailLink(false)
                }
            }
            .navigationBarHidden(true)
            .ignoresSafeArea()
            .onAppear{
                isAdminView = true
            }
        }
    }
}
