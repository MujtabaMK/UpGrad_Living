//
//  BookingStudentProcessView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 03/04/23.
//

import SwiftUI

struct BookingStudentProcessView: View {
    var body: some View {
        VStack{
            HStack{
                Text("06")
                    .font(.custom(OpenSans_SemiBold, size: 20))
                    .foregroundColor(Color(hex: 0x868686))
                Image("Booking_Student_Image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 54)
                    .padding(.leading, -10)
                Text("Create a student profile")
                    .font(.custom(OpenSans_Bold, size: 16))
                    .foregroundColor(Color(hex: 0x333333))
                    .padding(.leading, -8)
                Spacer()
            }
            HStack{
                VLine().stroke(style: StrokeStyle(lineWidth: 0.5, dash: [5]))
                    .foregroundColor(Color(hex: 0x50B0BD))
                    .frame(width: 44,height: 70)
                    .padding(.leading, 14)
                Text("Tell us more about your preferences, habits and interests")
                    .font(.custom(OpenSans_SemiBold, size: 14))
                    .foregroundColor(Color(hex: 0x868686))
                    .padding(.top, -45)
            }
            .padding(.top, -20)
        }
    }
}

struct BookingStudentProcessView_Previews: PreviewProvider {
    static var previews: some View {
        BookingStudentProcessView()
    }
}
