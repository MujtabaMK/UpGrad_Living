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
            Color(hex: 0x000000, alpha: 0.2)
            VStack{
                Text("In order to write about life first you must live it")
                    .font(.custom(OpenSans_SemiBold, size: 18))
                    .foregroundColor(Color(hex: 0x969696))
                    .padding(6)
                HStack{
                    Spacer(minLength: 0)
                    Text("– Ernest Hemingway")
                        .font(.custom(OpenSans_SemiBold, size: 14))
                        .foregroundColor(Color(hex: 0x969696))
                        .frame(alignment: .trailing)
                }.padding(.trailing, 20)
                
                Text("Loading")
                    .font(.custom(OpenSans_SemiBold, size: 18))
                    .foregroundColor(Color(hex: 0xCC1120))
                    .padding()
            }
            .frame(width: UIScreen.main.bounds.width - 90, height: 200)
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

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
