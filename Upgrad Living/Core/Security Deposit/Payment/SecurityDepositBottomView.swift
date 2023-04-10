//
//  SecurityDepositBottomView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 04/04/23.
//

import SwiftUI

struct SecurityDepositBottomView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var textvalue: String
    var body: some View {
        HStack{
            Image("Booking_Submit_Click")
                .resizable()
                .scaledToFit()
                .frame(width: 14, height: 14)
            Text(textvalue)
                .font(.custom(OpenSans_SemiBold, size: 14))
                .foregroundColor(colorScheme == .light ? Color(hex: 0x000000) : .white)
                .padding(.trailing, 2)
        }.padding(.leading)
    }
}

struct SecurityDepositBottomView_Previews: PreviewProvider {
    static var previews: some View {
        SecurityDepositBottomView(textvalue: "")
    }
}
