//
//  WalkThrough1.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 24/03/23.
//

import SwiftUI

struct WalkThrough1: View {
    @State private var isWalkThrough2 = false
    @State private var isLogin = false
    var body: some View {
        NavigationView {
            ZStack{
                Image("Walk_Through1")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                VStack(alignment: .center){
                    Image("Walh_Through1_Top")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width, height: 345)
                        .padding(.top, 6)
                    Text("A home away")
                        .font(.custom(OpenSans_Bold, size: 25))
                        .foregroundColor(.white)
                        .padding(.top, -40)
                    Text("from home")
                        .font(.custom(OpenSans_Bold, size: 25))
                        .foregroundColor(.white)
                        .padding(.bottom, 6)
                    Text("Where your story begins.......")
                        .font(.custom(OpenSans_SemiBold, size: 16))
                        .foregroundColor(.white)
                        .padding(.bottom, 6)
                    Button {
                        withAnimation {
                            isWalkThrough2 = true
                        }
                    } label: {
                        Text("Continue")
                            .frame(width: 250, alignment: .center)
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(hex: 0xD9404C))
                            .clipShape(Capsule())
                            .padding(.bottom)
                    }
                    Image("step_1")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 38, height: 10)
                        .padding(.bottom)
                    
                    Button {
                        UserDefaults.standard.set(true, forKey: "isWalkThrough")
                        isLogin = true
                    } label: {
                        Text("Skip")
                            .underline()
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(Color(hex: 0xFFFFFF,alpha: 0.8))
                    }
                    
                    NavigationLink(
                        "",
                        destination: WalkThrough2().navigationBarHidden(true),
                        isActive: $isWalkThrough2).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: LoginView().navigationBarHidden(true),
                        isActive: $isLogin).isDetailLink(false)
                }
                .padding(.bottom, 40)
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onEnded({ value in
                    if value.translation.width < 0 {
                        // left
                        withAnimation {
                            isWalkThrough2 = true
                        }
                    }
                    
                    if value.translation.width > 0 {
                        // right
                        
                    }
                    if value.translation.height < 0 {
                        // up
                    }
                    
                    if value.translation.height > 0 {
                        // down
                    }
                }))
        }
    }
}

struct WalkThrough1_Previews: PreviewProvider {
    static var previews: some View {
        WalkThrough1()
    }
}
