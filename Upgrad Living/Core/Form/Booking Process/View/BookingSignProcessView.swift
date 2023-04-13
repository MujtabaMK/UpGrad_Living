//
//  BookingSignProcessView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 03/04/23.
//

import SwiftUI

struct BookingSignProcessView: View {
    var body: some View {
        VStack{
            HStack{
                Text("08")
                    .font(.custom(OpenSans_SemiBold, size: 20))
                    .foregroundColor(Color(hex: 0x868686))
                Image("Booking_Sign_Image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 54)
                    .padding(.leading, -10)
                Text("Digitally Sign the agreement")
                    .font(.custom(OpenSans_Bold, size: 16))
                    .foregroundColor(Color(hex: 0x333333))
                    .padding(.leading, -8)
                Spacer()
            }
            HStack{
                VLine().stroke(style: StrokeStyle(lineWidth: 0.5, dash: [5]))
                    .foregroundColor(Color(hex: 0x50B0BD))
                    .frame(width: 44,height: 70)
                    .padding(.leading, 25)
                Text("Parent to Digitally sign the Student Housing Services Agreement")
                    .font(.custom(OpenSans_SemiBold, size: 14))
                    .foregroundColor(Color(hex: 0x868686))
                    .padding(.top, -45)
            }
            .padding(.top, -20)
        }
    }
}

struct BookingSignProcessView_Previews: PreviewProvider {
    static var previews: some View {
        BookingSignProcessView()
    }
}
