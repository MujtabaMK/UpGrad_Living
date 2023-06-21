//
//  WalkThrough2.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 24/03/23.
//

import SwiftUI

struct WalkThrough2: View {
    @State private var isWalkThrough3 = false
    @State private var isLogin = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack{
            Image("Walk_Through2")
                .resizable()
                .renderingMode(.original)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            VStack{
                Image("Walk_Through2_Top")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width - 40, height: 344)
                    .padding(.top, 6)
                Text("In the mood")
                    .font(.custom(OpenSans_Bold, size: 25))
                    .foregroundColor(.white)
                Text("for food?")
                    .font(.custom(OpenSans_Bold, size: 25))
                    .foregroundColor(.white)
                    .padding(.bottom, 6)
                Text("Good food, good mood!")
                    .font(.custom(OpenSans_SemiBold, size: 16))
                    .foregroundColor(Color(hex: 0xFFFFFF, alpha: 0.7))
                    .padding(.bottom, 6)
                Button {
                    withAnimation {
                        isWalkThrough3 = true
                    }
                } label: {
                    Text("Continue")
                        .frame(width: 250, alignment: .center)
                        .font(.custom(OpenSans_SemiBold, size: 14))
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(hex: 0x372E7A))
                        .clipShape(Capsule())
                        .padding(.bottom)
                }
                Image("step_2")
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
                    destination: WalkThrough3().navigationBarHidden(true),
                    isActive: $isWalkThrough3).isDetailLink(false)
                
                NavigationLink(
                    "",
                    destination: LoginView().navigationBarHidden(true),
                    isActive: $isLogin).isDetailLink(false)
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onEnded({ value in
                if value.translation.width < 0 {
                    // left
                    withAnimation {
                        isWalkThrough3 = true
                    }
                }
                
                if value.translation.width > 0 {
                    // right
                    withAnimation(.easeInOut) {
                        presentationMode.wrappedValue.dismiss()
                    }
                    
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

struct WalkThrough2_Previews: PreviewProvider {
    static var previews: some View {
        WalkThrough2()
    }
}
