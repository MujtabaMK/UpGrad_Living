//
//  BookingRoomProcessView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 03/04/23.
//

import SwiftUI

struct BookingRoomProcessView: View {
    var body: some View {
        VStack{
            HStack{
                Text("07")
                    .font(.custom(OpenSans_SemiBold, size: 20))
                    .foregroundColor(Color(hex: 0x868686))
                Image("Booking_Room_Image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 54)
                    .padding(.leading, -10)
                Text("Select your room as per availability")
                    .font(.custom(OpenSans_Bold, size: 16))
                    .foregroundColor(Color(hex: 0x333333))
                    .padding(.leading, -8)
                Spacer()
            }
            HStack{
                VLine().stroke(style: StrokeStyle(lineWidth: 0.5, dash: [5]))
                    .foregroundColor(Color(hex: 0x50B0BD))
                    .frame(width: 44,height: 60)
                Text("Check the seat map and select your room")
                    .font(.custom(OpenSans_SemiBold, size: 14))
                    .foregroundColor(Color(hex: 0x868686))
                    .padding(.top, -25)
           }
            .padding(.top, -20)
        }
    }
}

struct BookingRoomProcessView_Previews: PreviewProvider {
    static var previews: some View {
        BookingRoomProcessView()
    }
}
