//
//  EventTabView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 20/05/23.
//

import SwiftUI

struct EventTabView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @State private var isHome = false
    
    @State private var SearchText = ""
    @State private var isFilter = false
    @State private var isEvent = false
    @State private var CheckFavriate = false
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    var body: some View {
        NavigationView {            
            ZStack{
                VStack{
                    HStack{
                        Button {
                            isHome = true
                        } label: {
                            Image("back_Button")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding(.leading, 30)
                        }
                        Spacer(minLength: 0)
                        Text("Events")
                            .font(.custom(OpenSans_SemiBold, size: 18))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x000000) : .white)
                            .padding(.trailing, 30)
                        Spacer(minLength: 0)
                        
                        Image(CheckFavriate ? "Home_Bookmark_Select" : "Home_Bookmark_Not_Select")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.trailing)
                            .onTapGesture {
                                CheckFavriate.toggle()
                            }
                    }
                    .padding(.trailing)
                    .padding(.top)
                    Divider()
                    
                    VStack{
                        
                        SearchBarEvent(text: $SearchText, isFilterClick: $isFilter)
                        
                        ScrollView(showsIndicators: false) {
                            ForEach(arrEvents1) { Event in
                                Button {
                                    withAnimation {
                                        isEvent = true
                                    }
                                } label: {
//                                    UpcommingEventsCell(post: Event, isShowAlert: $showingAlert,alertMessage: $alertMessage)
//                                        .padding(.horizontal, 15)
//                                        .padding(.leading, 5)
//                                        .frame(width: getRect().width, height: 300, alignment: .center)
//                                    NavigationLink(
//                                        "",
//                                        destination: EventsBookingView(isToHome: false).navigationBarHidden(true),
//                                        isActive: $isEvent).isDetailLink(false)
                                }
                            }
                        }
                        
                        NavigationLink(
                            "",
                            destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(0)).navigationBarHidden(true),
                            isActive: $isHome).isDetailLink(false)
                    }
                    if isFilter{
                        VStack(alignment: .leading){
                            HStack{
                                Button {
                                    withAnimation {
                                        isFilter = false
                                    }
                                } label: {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 15, height: 15)
                                        .padding(.leading, 20)
                                        .foregroundColor(colorScheme == .light ? .black : .white)
                                }
                                Spacer()
                                Text("Filter")
                                    .font(.custom(OpenSans_Bold, size: 20))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                                Spacer()
                            }
                            VStack(alignment: .leading){
                                Text("Date")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                                    .padding(.leading)
                                
                                HStack{
                                    
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: isFilter ? 150 : 0)
                        .transition(.move(edge: isFilter ? .bottom : .top))
                        .background(colorScheme == .light ? .white : .black)
                        .cornerRadius(15, corners: [.topLeft, .topRight])
                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

