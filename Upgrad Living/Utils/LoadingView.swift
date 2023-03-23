//
//  LoadingView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 23/03/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(hex: 0x000000, alpha: 0.6)
            VStack{
                Text("In order to write about life first you must live it")
                    .font(.custom(OpenSans_SemiBold, size: 16))
                    .foregroundColor(Color(hex: 0x969696))
                    .padding(.top, 50)
                HStack{
                    Spacer(minLength: 0)
                    Text("– Ernest Hemingway")
                        .font(.custom(OpenSans_SemiBold, size: 12))
                        .foregroundColor(Color(hex: 0x969696))
                        .frame(alignment: .trailing)
                }
                .padding(.trailing, 20)
                .padding(.bottom, 12)
                
                Text("Loading")
                    .font(.custom(OpenSans_SemiBold, size: 16))
                    .foregroundColor(Color(hex: 0xCC1120))
                    .padding(6)
                LottieView(name: "Loading", loopMode: .loop)
                            .frame(width: 100, height: 20)
                            .padding(.bottom, 20)
            }
            .frame(width: UIScreen.main.bounds.width - 90)
            .background(.white)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.white)
                    .shadow(color: .gray, radius: 10, x: 0, y: 0)
            )
        }.ignoresSafeArea()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
