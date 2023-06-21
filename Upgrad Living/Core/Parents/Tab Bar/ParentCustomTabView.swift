//
//  ParentCustomTabView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 19/06/23.
//

import SwiftUI

struct ParentCustomTabView<Content: View>: View{
    let tabs: [TabItemData]
    @Binding var selectedIndex: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                ForEach(tabs.indices) { index in
                    content(index)
                        .tag(index)
                }
            }
            
            VStack {
                Spacer()
                ParentTabBottomView(tabbarItems: tabs, selectedIndex: $selectedIndex)
            }
            .padding(.bottom, 0)
            
        }
    }
}
enum ParentTabType: Int, CaseIterable {
    case home = 0
    case RoomBooking
    case Approvals
    
    var tabItem: TabItemData {
        switch self {
        case .home:
            return TabItemData(image: "Parent_Home_icon_UnSelect", selectedImage: "Parent_Home_icon_Selected", title: "Home", showShow: "Show_Tab_Selected", imageHide: "")
        case .RoomBooking:
            return TabItemData(image: "Parent_Booking_UnSelect", selectedImage: "Parent_Booking_Select", title: "Room Booking", showShow: "Show_Tab_Selected", imageHide: "")
        case .Approvals:
            return TabItemData(image: "Parent_Approval_UnSelect", selectedImage: "Parent_Approval_Select", title: "Approvals", showShow: "Show_Tab_Selected", imageHide: "")
        }
    }
}
