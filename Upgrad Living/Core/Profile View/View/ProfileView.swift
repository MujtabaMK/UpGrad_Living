//
//  ProfileView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 16/05/23.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isHome = false
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView(showsIndicators: false){
                    VStack{
                        ZStack(alignment: .top){
                            Image("Profile_bg_Image")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getRect().width, height: 200)
                            VStack{
                                HStack{
                                    Button {
                                        isHome = true
                                    } label: {
                                        Image("back_Button")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                            .padding(.leading, 20)
                                    }
                                    Spacer(minLength: 0)
                                    Text("Your Roomie")
                                        .font(.custom(OpenSans_SemiBold, size: 18))
                                        .foregroundColor(colorScheme == .light ? .black : .black)
                                        .padding(.trailing, 30)
                                    Spacer(minLength: 0)
                                }
                                bckimg
                                    .overlay {
                                        Image("Jon_Deo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 95, height: 110)
                                            .mask { bckimg }
                                    }
                                    .padding(.top, 50)
                            }
                            .padding(.top)
                        }
                        VStack{
                            HStack{
                                Spacer()
                                Text("Jane Doe")
                                    .font(.custom(OpenSans_Bold, size: 18))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                                Spacer()
                            }
                        }
                        .frame(width: 295, height: 68)
                        .background(colorScheme == .light ? .white : .black)
                        .cornerRadius(20)
                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                        
                        VStack(alignment: .leading){
                            
                        }
                        .frame(maxWidth: getRect().width)
                        .background(colorScheme == .light ? .white : .black)
                        .cornerRadius(14, corners: [.topLeft, .topRight])
                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                        
                        NavigationLink(
                            "",
                            destination: FirstView(EventScreen: "2").navigationBarHidden(true),
                            isActive: $isHome).isDetailLink(false)
                    }
                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }
    var bckimg: some View {
        Image("Roomie_Background")
            .resizable()
            .scaledToFit()
            .frame(width: 201, height: 107)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
