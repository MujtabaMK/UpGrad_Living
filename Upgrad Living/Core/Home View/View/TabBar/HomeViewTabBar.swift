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
    @Binding var isEventDetails: Bool
    @Binding var RoomieId: String
    @Binding var NewSelectedIndex: Int
    @Binding var isofferView: Bool
    @Binding var isBackEvent: Bool
    @Binding var isBackDining: Bool
    @Binding var isDiningView: Bool
    @Binding var isBackLaundry: Bool
    @Binding var isLaundryView: Bool
    @Binding var isBackGym: Bool
    @Binding var isGymView: Bool
    @Binding var isBackSport: Bool
    @Binding var isSportView: Bool
    @Binding var isBackHeltcare: Bool
    @Binding var isHeltcareView: Bool
    @Binding var isBackHouseKeeping: Bool
    @Binding var isHouseKeepingView: Bool
    @Binding var isBackConvenience: Bool
    @Binding var isConvenienceView: Bool
    @Binding var isBackCoffee: Bool
    @Binding var isCoffeeView: Bool
    
    @Binding var isBackCommunity: Bool
    @Binding var isCommunityView: Bool
    
    @Binding var isBackUserProfile: Bool
    @Binding var isUserProfile: Bool
    
    @Binding var isBackisNotification: Bool
    @Binding var isNotification: Bool
    
    @Binding var isBackGuestRoom: Bool
    @Binding var isGuestRoom: Bool
    
    @Binding var isBackRequestApproval: Bool
    @Binding var isRequestApproval: Bool
    
    @Binding var isBackServiceBooking: Bool
    @Binding var isServiceBooking: Bool
    
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
                                    isGuestRoom = true
                                } label: {
                                    VStack(spacing: -5){
                                        Image("Home_Book_Space")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 74, height: 74)
                                        Text("Guest room\n booking")
                                            .font(.custom(OpenSans_SemiBold, size: 12))
                                            .foregroundColor(Color(hex: 0x00B2BA))
                                    }
                                }
                                Spacer()
                                Button {
                                    isServiceBooking = true
                                } label: {
                                    VStack(spacing: -5){
                                        Image("Home_Student_Connect")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 74, height: 74)
                                        Text("Pay in\n store")
                                            .font(.custom(OpenSans_SemiBold, size: 12))
                                            .foregroundColor(Color(hex: 0x00B2BA))
                                    }
                                }
                                Spacer()
                                Button {
                                    isRequestApproval = true
                                } label: {
                                    VStack(spacing: -5){
                                        Image("Home_Request_Approval")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 74, height: 74)
                                        Text("Approval\n Requests")
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
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                selectedIndex = NewSelectedIndex
            }
        }
    }
    
    @ViewBuilder
    func getTabView(type: TabType) -> some View {
        switch type {
        case .home:
            HomeView(pageIndex: Page.withIndex(0), isEvent: $isEvent, isBackEvent: $isBackEvent, isProfile: $isProfile, isEventDetails: $isEventDetails, RoomieId: $RoomieId, isofferView: $isofferView, isUserProfile: $isUserProfile, isNotification: $isNotification)
        case .services:
            ServiceView(isBackDining: $isBackDining, isDiningView: $isDiningView, isBackLaundray: $isBackLaundry, isLaundryView: $isLaundryView, isGymView: $isGymView, isSportView: $isSportView, isHeltcareView: $isHeltcareView, isHouseKeepingView: $isHouseKeepingView, isConvenienceView: $isConvenienceView, isCoffeeView: $isCoffeeView)
        case .community:
            CommunityView(isCommunityView: $isCommunityView)
        case .events:
            EventAllView(isEventDetails: $isEventDetails, isBackEvent: $isBackEvent)
        }
    }
}
