//
//  HomeViewTop.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 11/05/23.
//

import SwiftUI
import Kingfisher

struct HomeViewTop: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentusername")
    var ProfileImage: String
    var StudentName: String
    @Binding var isUserProfile: Bool
    @Binding var isNotification: Bool
    
    var body: some View {
        NavigationView {            
            ZStack{
                Image("Home_Top_Background")
                    .resizable()
                    .scaledToFit()
                    .frame(width: getRect().width, height: getRect().height)
                    .padding(.top, -90)
                VStack{
                    if UIDevice.current.name.contains("iPhone 14 Pro"){
                        HStack{
                            Button {
                                isUserProfile = true
                            } label: {
                                KFImage(URL(string: ProfileImage))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 44, height: 44)
                                    .clipShape(Circle())
                                    .onTapGesture {
                                        isUserProfile = true
                                    }
                                VStack(alignment: .leading){
                                    Text("Welcome, ")
                                        .font(.custom(OpenSans_SemiBold, size: 12))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0xFFFFFF, alpha: 0.8) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                    Text(StudentName)
                                        .font(.custom(OpenSans_Bold, size: 18))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0xFFFFFF))
                                        .onTapGesture {
                                            isUserProfile = true
                                        }
                                }
                                Spacer()
                            }
                            
                            HStack(spacing: 15){
                                
                                Button {
                                    isNotification = true
                                } label: {
                                    Image("Home_Notification")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25,height: 25)
                                }
                                
                                Button {
                                    
                                } label: {
                                    Image("Home_emergency")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25,height: 25)
                                }
                            }
                        }
                        .padding(.top, -30)
                        .padding([.leading, .trailing], 10)
                    }else{
                        HStack{
                            Button {
                                isUserProfile = true
                            } label: {
                                KFImage(URL(string: ProfileImage))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 44, height: 44)
                                    .clipShape(Circle())
                                    .onTapGesture {
                                        isUserProfile = true
                                    }
                                VStack(alignment: .leading){
                                    Text("Welcome, ")
                                        .font(.custom(OpenSans_SemiBold, size: 12))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0xFFFFFF, alpha: 0.8) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                    Text(StudentName)
                                        .font(.custom(OpenSans_Bold, size: 18))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0xFFFFFF))
                                        .onTapGesture {
                                            isUserProfile = true
                                        }
                                }
                                Spacer()
                            }
                            
                            HStack(spacing: 15){
                                
                                Button {
                                    isNotification = true
                                } label: {
                                    Image("Home_Notification")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25,height: 25)
                                }
                                
                                Button {
                                    
                                } label: {
                                    Image("Home_emergency")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25,height: 25)
                                }
                            }
                        }
                        .padding(.top, UIDevice.current.hasNotch ? -30 : -30)
                        .padding([.leading, .trailing], 10)
                    }
                    VStack{
                        StrokeText(text: "What’s on the menu today?", width: 1.0, color: Color(hex: 0xFFFFFF, alpha: 0.8))
                            .foregroundColor(Color(hex: 0xD9404C))
                            .font(.custom(OpenSans_Bold, size: 25))
                            .padding(.top, UIDevice.current.hasNotch ? -10 : 10)
                    }
                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }
}
