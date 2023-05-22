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
    
    var body: some View {
        NavigationView {            
            ZStack{
                VStack{
                    VStack{
                        
                        SearchBarEvent(text: $SearchText, isFilterClick: $isFilter)
                        
                        ScrollView(showsIndicators: false) {
                            ForEach(arrEvents1) { Event in
                                Button {
                                    withAnimation {
                                        isEvent = true
                                    }
                                } label: {
                                    UpcommingEventsCell(post: Event)
                                        .padding(.horizontal, 15)
                                        .padding(.leading, 5)
                                        .frame(width: getRect().width, height: 300, alignment: .center)
                                    NavigationLink(
                                        "",
                                        destination: EventsBookingView(isToHome: false).navigationBarHidden(true),
                                        isActive: $isEvent).isDetailLink(false)
                                }
                            }
                        }
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
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }
}

