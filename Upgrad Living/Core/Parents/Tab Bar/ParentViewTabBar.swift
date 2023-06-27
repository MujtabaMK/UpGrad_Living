//
//  ParentViewTabBar.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 19/06/23.
//

import SwiftUI

struct ParentViewTabBar: View {
    @State var selectedIndex: Int = 0
    @State private var isButtonSelected = false
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var offsetButton: CGFloat = 0
    @State private var offsetView: CGFloat = 0
    
    @Binding var isBackParentGuestRoom: Bool
    @Binding var isBackParentHelpdesk: Bool
    @Binding var isParentHelpdesk: Bool
    @Binding var isBackParentApproval: Bool
    @Binding var isParentLogout: Bool
    
    @Binding var NewSelectedIndex: Int
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom){
                ParentCustomTabView(tabs: ParentTabType.allCases.map({ $0.tabItem }), selectedIndex: $selectedIndex) { index in
                    let type = ParentTabType(rawValue: index) ?? .home
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
    func getTabView(type: ParentTabType) -> some View {
        switch type {
        case .home:
            ParentHomeView(isParentHelpdesk: $isParentHelpdesk, isBackParentHelpdesk: $isBackParentHelpdesk, isLogout: $isParentLogout)
            
        case .RoomBooking:
            ParentRoomBooking(isBackParentGuestRoom: $isBackParentGuestRoom)
            
        case .Approvals:
            ParentApproval(isBackParentApproval: $isBackParentApproval)
            
        }
    }
}
