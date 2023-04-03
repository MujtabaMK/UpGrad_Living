//
//  BookingPayProcessView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 03/04/23.
//

import SwiftUI

struct BookingPayProcessView: View {
    var body: some View {
        VStack{
            HStack{
                Text("03")
                    .font(.custom(OpenSans_SemiBold, size: 20))
                    .foregroundColor(Color(hex: 0x868686))
                Image("Booking_Pay_Image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 54)
                    .padding(.leading, -10)
                Text("Pay Security deposit fee")
                    .font(.custom(OpenSans_Bold, size: 16))
                    .foregroundColor(Color(hex: 0x333333))
                    .padding(.leading, -8)
                Spacer()
            }
            HStack{
                VLine().stroke(style: StrokeStyle(lineWidth: 0.5, dash: [5]))
                    .foregroundColor(Color(hex: 0x50B0BD))
                    .frame(width: 44,height: 70)
                    .padding(.leading, -16)
                Text("Pay an Interest Free Security \nDeposit of Rs. 50,000")
                    .font(.custom(OpenSans_SemiBold, size: 14))
                    .foregroundColor(Color(hex: 0x868686))
                    .padding(.top, -45)
                    .padding(.leading, -2)
           }
            .padding(.top, -20)
        }

    }
}

struct BookingPayProcessView_Previews: PreviewProvider {
    static var previews: some View {
        BookingPayProcessView()
    }
}
