//
//  BookingParentProcessView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 03/04/23.
//

import SwiftUI

struct BookingParentProcessView: View {
    var body: some View {
        VStack{
            HStack{
                Text("04")
                    .font(.custom(OpenSans_SemiBold, size: 20))
                    .foregroundColor(Color(hex: 0x868686))
                Image("Booking_Parent_Image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 54)
                    .padding(.leading, -10)
                Text("Parent Consent")
                    .font(.custom(OpenSans_Bold, size: 16))
                    .foregroundColor(Color(hex: 0x333333))
                    .padding(.leading, -8)
                Spacer()
            }
            HStack{
                VLine().stroke(style: StrokeStyle(lineWidth: 0.5, dash: [5]))
                    .foregroundColor(Color(hex: 0x50B0BD))
                    .frame(width: 44,height: 70)
                    .padding(.leading, 13)
                Text("Authorization by either Parent of Consent via email")
                    .font(.custom(OpenSans_SemiBold, size: 14))
                    .foregroundColor(Color(hex: 0x868686))
                    .padding(.top, -45)
                    .padding(.leading, -2)
           }
            .padding(.top, -20)
        }
    }
}

struct BookingParentProcessView_Previews: PreviewProvider {
    static var previews: some View {
        BookingParentProcessView()
    }
}
