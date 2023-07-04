//
//  BedSuccessTopView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 04/05/23.
//

import SwiftUI

struct BedSuccessTopView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
        ZStack{
            Color(hex: 0xFDE1E3)
            VStack(alignment: .center){
                Image("BedBookingConfirm")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 86, height: 81)
                    .padding()
                Text("Congratulations!")
                    .font(.custom(OpenSans_Bold, size: 20))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                    .frame(width: 200, alignment: .center)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 5)
                Text("Your booking has been confirmed!")
                    .font(.custom(OpenSans_Bold, size: 16))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                    .frame(width: 200, alignment: .center)
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 30)
        }
        .ignoresSafeArea()
    }
}

struct BedSuccessTopView_Previews: PreviewProvider {
    static var previews: some View {
        BedSuccessTopView()
    }
}
