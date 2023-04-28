//
//  HomeViewTabBar.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 28/04/23.
//

import SwiftUI

struct HomeViewTabBar: View {
    @State var selectedIndex: Int = 0
    @State private var isButtonSelected = false
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom){
                CustomTabView(tabs: TabType.allCases.map({ $0.tabItem }), selectedIndex: $selectedIndex) { index in
                    let type = TabType(rawValue: index) ?? .home
                    getTabView(type: type)
                }
                
                VStack{
                    VStack{
                        
                        
                    }
                    .frame(maxWidth: .infinity)
                    
                    Button {
                        isButtonSelected.toggle()
                    } label: {
                        Circle()
                            .fill(Color.tabBarColour)
                            .frame(width: 68, height: 68)
                            .padding(.bottom, 30)
                            .overlay {
                                Image(isButtonSelected ? "Home_Button_Open" : "Home_Button_NotOpen")
                                    .resizable()
                                    .renderingMode(.original)
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                    .padding(.bottom, 30)
                            }
                        
                            
                    }
                }

            }
            .navigationBarHidden(true)
        }
    }
    
    @ViewBuilder
    func getTabView(type: TabType) -> some View {
        switch type {
        case .home:
            HomeView()
        case .services:
            HomeView()
        case .community:
            HomeView()
        case .events:
            HomeView()
        }
    }
}

struct HomeViewTabBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewTabBar()
    }
}
