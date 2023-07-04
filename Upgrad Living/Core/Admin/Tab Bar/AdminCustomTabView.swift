//
//  AdminCustomTabView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 04/07/23.
//

import SwiftUI

struct AdminCustomTabView<Content: View>: View{
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
                AdminTabBottomView(tabbarItems: tabs, selectedIndex: $selectedIndex)
            }
            .padding(.bottom, 0)
            
        }
    }
}
enum AdminTabType: Int, CaseIterable {
    case home = 0
    case services
    case events
    case Approvals
    
    var tabItem: TabItemData {
        switch self {
        case .home:
            return TabItemData(image: "Home_Tab_Un_Selected", selectedImage: "Home_Tab_Selected", title: "Home", showShow: "Show_Tab_Selected", imageHide: "")
        case .services:
            return TabItemData(image: "Services_Tab_Un_Selected", selectedImage: "Services_Tab_Selected", title: "Services", showShow: "Show_Tab_Selected", imageHide: "")
        case .events:
            return TabItemData(image: "Event_Tab_Un_Selected", selectedImage: "Event_Tab_Selected", title: "Events", showShow: "Show_Tab_Selected", imageHide: "")
        case .Approvals:
            return TabItemData(image: "Parent_Approval_UnSelect", selectedImage: "Parent_Approval_Select", title: "Approvals", showShow: "Show_Tab_Selected", imageHide: "")
        }
    }
}
