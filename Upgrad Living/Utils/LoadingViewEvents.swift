//
//  LoadingViewEvents.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 13/05/23.
//

import SwiftUI

struct LoadingViewEvents: View {
    var body: some View {
        ZStack{
            Color(hex: 0x000000, alpha: 0.6)
            VStack{
                Image("Event_Loader_icon")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 120, height: 122)
                    .padding(.top, 30)
                VStack{
                    Text("Hold on!")
                        .font(.custom(OpenSans_SemiBold, size: 16))
                        .foregroundColor(Color(hex: 0xDE1223))
                    Text("We are confirming your \nbooking...")
                        .font(.custom(OpenSans_SemiBold, size: 14))
                        .foregroundColor(Color(hex: 0x868686))
                        .multilineTextAlignment(.center)
                        .padding(6)
                }
            }
            .frame(width: 250, height: 300)
            .background(.white)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .shadow(color: .gray, radius: 10, x: 0, y: 0)
            )
        }.ignoresSafeArea()
    }
}

struct LoadingViewEvents_Previews: PreviewProvider {
    static var previews: some View {
        LoadingViewEvents()
    }
}
