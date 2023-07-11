//
//  AdminViewTabBar.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 04/07/23.
//

import SwiftUI

struct AdminViewTabBar: View {
    @State var selectedIndex: Int = 0
    @State private var isButtonSelected = false
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var offsetButton: CGFloat = 0
    @State private var offsetView: CGFloat = 0
        
    @Binding var NewSelectedIndex: Int
    @Binding var isAdminLogout: Bool
    @Binding var isEventDetails: Bool
    @Binding var isBackAdminApproval: Bool
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom){
                AdminCustomTabView(tabs: AdminTabType.allCases.map({ $0.tabItem }), selectedIndex: $selectedIndex) { index in
                    let type = AdminTabType(rawValue: index) ?? .home
                    getTabView(type: type)
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                print(NewSelectedIndex)
                selectedIndex = NewSelectedIndex
            }
        }
    }
    @ViewBuilder
    func getTabView(type: AdminTabType) -> some View {
        switch type {
        case .home:
            AdminHomeView(isLogout: $isAdminLogout)
        case .services:
            AdminServiceView()
        case .events:
            AdminEventAllView(isEventDetails: $isEventDetails)
        case .Approvals:
            AdminRequestApproval(isBackAdminApproval: $isBackAdminApproval)
        }
    }
}
