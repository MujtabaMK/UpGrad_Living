//
//  HomeViewTabBar.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 28/04/23.
//

import SwiftUI
import SwiftUIPager

struct HomeViewTabBar: View {
    @State var selectedIndex: Int = 0
    @State private var isButtonSelected = false
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var offsetButton: CGFloat = 0
    @State private var offsetView: CGFloat = 0
    @Binding var isEvent: Bool
    @Binding var isEventsAll: Bool
    @Binding var isProfile: Bool
    
    var body: some View {
        NavigationView {
                ZStack(alignment: .bottom){
                    
                    CustomTabView(tabs: TabType.allCases.map({ $0.tabItem }), selectedIndex: $selectedIndex) { index in
                        let type = TabType(rawValue: index) ?? .home
                        getTabView(type: type)
                    }
                    VStack{
                        VStack{
                            if isButtonSelected{
                                HStack{
                                    Spacer()
                                    Button {
                                        
                                    } label: {
                                        VStack(spacing: -5){
                                            Image("Home_Book_Space")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 74, height: 74)
                                            Text("Book a space\n or a guest room")
                                                .font(.custom(OpenSans_SemiBold, size: 12))
                                                .foregroundColor(Color(hex: 0x00B2BA))
                                        }
                                    }
                                    Spacer()
                                    Button {
                                        
                                    } label: {
                                        VStack(spacing: -5){
                                            Image("Home_Student_Connect")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 74, height: 74)
                                            Text("Student\n Connect")
                                                .font(.custom(OpenSans_SemiBold, size: 12))
                                                .foregroundColor(Color(hex: 0x00B2BA))
                                        }
                                    }
                                    Spacer()
                                    Button {
                                        
                                    } label: {
                                        VStack(spacing: -5){
                                            Image("Home_Request_Approval")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 74, height: 74)
                                            Text("Parental\n Approval")
                                                .font(.custom(OpenSans_SemiBold, size: 12))
                                                .foregroundColor(Color(hex: 0x00B2BA))
                                        }
                                    }
                                    Spacer()
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: isButtonSelected ? 150 : 0)
                        .transition(.move(edge: isButtonSelected ? .top : .bottom))
                        .offset(y: -20)
                        .background(LinearGradient(
                            colors: [colorScheme == .light ? Color(hex: 0xF5F5F5,alpha: 0.9) : Color(hex: 0x201F1F, alpha: 0.9),
                                     colorScheme == .light ? Color(hex: 0xF5F5F5,alpha: 1.0) : Color(hex: 0x201F1F, alpha: 1.0)
                                    ],
                            startPoint: .top,
                            endPoint: .bottom)
                        )
                        .offset(y: 38)
                        .transition(.move(edge: isButtonSelected ? .top : .bottom))
                        
                        
                        Button {
                            withAnimation() {
                                isButtonSelected.toggle()
                                //                            self.offsetButton = -20
                                //                            self.offsetView = 40
                            }
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
            HomeView(pageIndex: Page.withIndex(0), isEvent: $isEvent, isEventAll: $isEventsAll, isProfile: $isProfile)
        case .services:
            HomeView(pageIndex: Page.withIndex(0), isEvent: .constant(false), isEventAll: .constant(false), isProfile: .constant(false))
        case .community:
            HomeView(pageIndex: Page.withIndex(0), isEvent: .constant(false), isEventAll: .constant(false), isProfile: .constant(false))
        case .events:
            EventTabView()
        }
    }
}

struct HomeViewTabBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewTabBar(isEvent: .constant(false), isEventsAll: .constant(false), isProfile: .constant(false))
    }
}
