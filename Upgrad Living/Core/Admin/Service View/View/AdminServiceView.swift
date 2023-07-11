//
//  AdminServiceView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 10/07/23.
//

import SwiftUI

struct AdminServiceView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @State private var isFilterClick: Bool = false
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView(showsIndicators: false) {
                    HStack{
                        Text("")
                            .frame(width: 24)
                            .padding(.leading)
                        
                        Spacer()
                        
                        Text("Booked Services")
                            .font(.custom(OpenSans_Bold, size: 18))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x000000) : .white)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                isFilterClick = true
                            }
                        } label: {
                            Image("Filter_Event")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .padding(.trailing)
                                .foregroundColor(colorScheme == .light ? .black : .white)
                        }
                    }
                    .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                    Divider()
                    
                    VStack{
                        ForEach((1...10), id: \.self) { index in
                            AdminServiceCell()
                                .padding(5)
                        }
                    }
                }
                .padding(.bottom, 70)
                
                if isFilterClick{
                    VStack(alignment: .leading){
                        HStack{
                            Button {
                                withAnimation {
                                    isFilterClick = false
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
                        .padding(.top)
                        VStack(alignment: .leading){
                            Text("Categories")
                                .font(.custom(OpenSans_Bold, size: 16))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                                .padding(.leading)
                            
                            Text("Date")
                                .font(.custom(OpenSans_Bold, size: 16))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                                .padding(.leading)
                        }
                    }
                    .frame(maxWidth: getRect().width - 10, maxHeight: isFilterClick ? 500 : 0)
                    .transition(.move(edge: isFilterClick ? .bottom : .top))
                    .background(colorScheme == .light ? .white : .black)
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                    .shadow(color: .gray, radius: 2, x: 0, y: 0)
                    .offset(y: 20)
                }
            }
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
    }
}
