//
//  ParentTabBottomView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 19/06/23.
//

import SwiftUI

struct ParentTabBottomView: View {
    let tabbarItems: [TabItemData]
    var height: CGFloat = 70
    var width: CGFloat = UIScreen.main.bounds.width
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack {

            Spacer()
            Button {
                self.selectedIndex = 0
            } label: {
                let item = tabbarItems[0]
                let isSelected = selectedIndex == 0
                TabItemView(data: item, isSelected: isSelected)
            }
            Spacer()
            Button {
                self.selectedIndex = 1
            } label: {
                let item = tabbarItems[1]
                let isSelected = selectedIndex == 1
                TabItemView(data: item, isSelected: isSelected)
            }
            Spacer()
            Button {
                self.selectedIndex = 2
            } label: {
                let item = tabbarItems[2]
                let isSelected = selectedIndex == 2
                TabItemView(data: item, isSelected: isSelected)
            }
            Spacer()
            
        }
        .frame(width: width, height: height)
        .background(Color.tabBarColour)
        .cornerRadius(18, corners: [.topLeft, .topRight])
        .shadow(radius: 5, x: 0, y: 4)
    }
}
