//
//  CustomTabView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 28/04/23.
//

import SwiftUI

struct CustomTabView<Content: View>: View {
    
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
                TabBottomView(tabbarItems: tabs, selectedIndex: $selectedIndex)
            }
            .padding(.bottom, 0)
            
        }
    }
}

enum TabType: Int, CaseIterable {
    case home = 0
    case services
    case community
    case events
    
    var tabItem: TabItemData {
        switch self {
        case .home:
            return TabItemData(image: "Home_Tab_Un_Selected", selectedImage: "Home_Tab_Selected", title: "Home", showShow: "Show_Tab_Selected", imageHide: "")
        case .services:
            return TabItemData(image: "Services_Tab_Un_Selected", selectedImage: "Services_Tab_Selected", title: "Services", showShow: "Show_Tab_Selected", imageHide: "")
        case .community:
            return TabItemData(image: "Community_Tab_Un_Selected", selectedImage: "Community_Tab_Selected", title: "Community", showShow: "Show_Tab_Selected", imageHide: "")
        case .events:
            return TabItemData(image: "Event_Tab_Un_Selected", selectedImage: "Event_Tab_Selected", title: "Events", showShow: "Show_Tab_Selected", imageHide: "")
        }
    }
}
