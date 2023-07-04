//
//  ParentFirstView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 04/07/23.
//

import SwiftUI

struct ParentFirstView: View {
    
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @AppStorage("SendPageTo") private var SendPageTo = ""
    @AppStorage("studentUserType") private var studentUserType = ""
    @AppStorage("DataFromLogin") private var DataFromLogin = ""
    
    //Parent...
    @State private var isParentHome = false
    
    @State private var isBackParentGuestRoom = false
    
    @State private var isBackParentHelpdesk = false
    @State private var isParentHelpdesk = false
    
    @State private var isBackParentApproval = false
    @State private var isParentLogout = false
    
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
                
                VStack{//Parent
                    
                    NavigationLink(
                        "",
                        destination: ParentViewTabBar(
                            isBackParentGuestRoom: $isBackParentGuestRoom,
                            isBackParentHelpdesk: $isBackParentHelpdesk,
                            isParentHelpdesk: $isParentHelpdesk,
                            isBackParentApproval: $isBackParentApproval,
                            isParentLogout: $isParentLogout,
                            NewSelectedIndex: $newSelectedIndex
                        ).navigationBarHidden(true),
                        isActive: $isParentHome).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(0)).navigationBarHidden(true),
                        isActive: $isBackParentHelpdesk).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: ParentHelpdesk(isBackParentHelpdesk: $isBackParentHelpdesk).navigationBarHidden(true),
                        isActive: $isParentHelpdesk).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(0)).navigationBarHidden(true),
                        isActive: $isBackParentApproval).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(0)).navigationBarHidden(true),
                        isActive: $isBackParentGuestRoom).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: LoginView().navigationBarHidden(true),
                        isActive: $isParentLogout).isDetailLink(false)
                }
            }
            .navigationBarHidden(true)
            .ignoresSafeArea()
            .onAppear{
                isParentHome = true
            }
        }
    }
}
