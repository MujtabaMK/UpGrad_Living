//
//  BookingSubmitProcessView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 03/04/23.
//

import SwiftUI

struct BookingSubmitProcessView: View {
    var body: some View {
        VStack{
            HStack{
                Text("02")
                    .font(.custom(OpenSans_SemiBold, size: 20))
                    .foregroundColor(Color(hex: 0x868686))
                Image("Booking_Submit_Image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 54)
                    .padding(.leading, -10)
                Text("Submit the application for Student Housing")
                    .font(.custom(OpenSans_Bold, size: 16))
                    .foregroundColor(Color(hex: 0x333333))
                    .padding(.leading, -8)
                Spacer()
            }
            HStack{
                VLine().stroke(style: StrokeStyle(lineWidth: 0.5, dash: [5]))
                    .foregroundColor(Color(hex: 0x50B0BD))
                    .frame(width: 50,height: 210)
                    .padding(.leading, 13)
                    .padding(.top, -22)
                VStack(alignment: .leading){
                    Text("Fill the below details")
                        .font(.custom(OpenSans_SemiBold, size: 14))
                        .foregroundColor(Color(hex: 0x868686))
                        .padding(.top, -62)
                        .padding(.leading, -6)
                    HStack{
                        Image("Booking_Submit_Click")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                        Text("Student’s details")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x868686))
                    }
                    .padding(.top, -52)
                    .padding(.leading)
                    HStack{
                        Image("Booking_Submit_Click")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                        Text("Parent’s details ")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x868686))
                    }
                    .padding(.top, -42)
                    .padding(.leading)
                    HStack{
                        Image("Booking_Submit_Click")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                        Text("Enrollment details")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x868686))
                    }
                    .padding(.top, -32)
                    .padding(.leading)
                    HStack{
                        Image("Booking_Submit_Click")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                        Text("Selection of room category and payment option")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x868686))
                    }
                    .padding(.top, -22)
                    .padding(.leading)
                    HStack{
                        Image("Booking_Submit_Click")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                        Text("Dietary requirements")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x868686))
                    }
                    .padding(.top, -5)
                    .padding(.leading)
                    HStack{
                        Image("Booking_Submit_Click")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                        Text("Submit the declaration")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x868686))
                    }
                    .padding(.leading)
                    .padding(.top, -2)
                }
            }
        }
    }
}

struct BookingSubmitProcessView_Previews: PreviewProvider {
    static var previews: some View {
        BookingSubmitProcessView()
    }
}
