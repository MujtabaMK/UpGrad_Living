//
//  BookingLoginProcessView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 01/04/23.
//

import SwiftUI

struct BookingLoginProcessView: View {
    var body: some View {
        VStack{
            HStack{
                Text("01")
                    .font(.custom(OpenSans_SemiBold, size: 20))
                    .foregroundColor(Color(hex: 0x868686))
                Image("Booking_Login_Image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 54)
                    .padding(.leading, -10)
                Text("Log-in")
                    .font(.custom(OpenSans_Bold, size: 16))
                    .foregroundColor(Color(hex: 0x333333))
                    .padding(.leading, -8)
                Spacer()
            }
            HStack{
                VLine().stroke(style: StrokeStyle(lineWidth: 0.5, dash: [5]))
                    .foregroundColor(Color(hex: 0x50B0BD))
                    .frame(width: 50,height: 70)
                    .padding(.leading, 24)
                Text("Log-in with your ATLAS Application ID or Registered Mobile Number")
                    .font(.custom(OpenSans_SemiBold, size: 14))
                    .foregroundColor(Color(hex: 0x868686))
                    .padding(.leading, -4)
                    .padding(.top, -45)
            }
            .padding(.top, -20)
        }
    }
}

struct BookingLoginProcessView_Previews: PreviewProvider {
    static var previews: some View {
        BookingLoginProcessView()
    }
}
