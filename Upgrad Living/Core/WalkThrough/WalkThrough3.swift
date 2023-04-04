//
//  WalkThrough3.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 24/03/23.
//

import SwiftUI

struct WalkThrough3: View {
    @State private var isLogin = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack{
            Image("Walk_Through3")
                .resizable()
                .renderingMode(.original)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            VStack{
                Image("Walk_Through3_Top")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: UIScreen.main.bounds.width, height: 399)
                    .padding(.top, 15)
                    .padding(.bottom, 5)
                Text("Less hassle")
                    .font(.custom(OpenSans_Bold, size: 25))
                    .foregroundColor(.white)
                Text("more dazzle")
                    .font(.custom(OpenSans_Bold, size: 25))
                    .foregroundColor(.white)
                    .padding(.bottom, 6)
                Text("The place to be!")
                    .font(.custom(OpenSans_SemiBold, size: 16))
                    .foregroundColor(Color(hex: 0xFFFFFF, alpha: 0.7))
                    .padding(.bottom, 6)
                Button {
                    withAnimation {
                        UserDefaults.standard.set(true, forKey: "isWalkThrough")
                        isLogin = true
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
                Image("step_3")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 38, height: 10)
                    .padding(.bottom, 10)
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
                        UserDefaults.standard.set(true, forKey: "isWalkThrough")
                        isLogin = true
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

struct WalkThrough3_Previews: PreviewProvider {
    static var previews: some View {
        WalkThrough3()
    }
}
