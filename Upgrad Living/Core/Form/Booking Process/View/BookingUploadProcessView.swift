//
//  BookingUploadProcessView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 03/04/23.
//

import SwiftUI

struct BookingUploadProcessView: View {
    var body: some View {
        VStack{
            HStack{
                Text("05")
                    .font(.custom(OpenSans_SemiBold, size: 20))
                    .foregroundColor(Color(hex: 0x868686))
                Image("Booking_Upload_Image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 54)
                    .padding(.leading, -10)
                Text("Upload a copy of all the required documents")
                    .font(.custom(OpenSans_Bold, size: 16))
                    .foregroundColor(Color(hex: 0x333333))
                    .padding(.leading, -8)
                Spacer()
            }
            HStack{
                VLine().stroke(style: StrokeStyle(lineWidth: 0.5, dash: [5]))
                    .foregroundColor(Color(hex: 0x50B0BD))
                    .frame(width: 50,height: 410)
                    .padding(.leading, 21)
                    .padding(.top, -22)
                VStack(alignment: .leading){
                    Text("Submit the following documents")
                        .font(.custom(OpenSans_SemiBold, size: 14))
                        .foregroundColor(Color(hex: 0x868686))
                        .padding(.top, -110)
                    HStack{
                        Image("Booking_Submit_Click")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                        Text("Identity & Address proof \n(Aadhar Card, Voters ID, Passport)")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x868686))
                    }
                    .padding(.top, -100)
                    .padding(.leading)
                    HStack{
                        Image("Booking_Submit_Click")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                        Text("Passport size photograph")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x868686))
                    }
                    .padding(.top, -75)
                    .padding(.leading)
                    HStack{
                        Image("Booking_Submit_Click")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                        Text("Certificate of Medical & Physical fitness by a registered doctor")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x868686))
                    }
                    .padding(.top, -65)
                    .padding(.leading)
                    HStack{
                        Image("Booking_Submit_Click")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                        Text("Blood Group certificate")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x868686))
                    }
                    .padding(.top, -40)
                    .padding(.leading)
                    HStack{
                        Image("Booking_Submit_Click")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                        Text("Final Certifcate for Covid-19 Vaccination (1st Dose & 2nd Dose)")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x868686))
                    }
                    .padding(.top, -30)
                    .padding(.leading)
                    HStack{
                        Image("Booking_Submit_Click")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                        Text("Anti-Ragging Annexure II (to be notarized)\n")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x868686))
                        +
                        Text("Note: 2 original copies have to be physically submitted as well")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0xF47781))
                    }
                    .padding(.leading)
                    .padding(.top, -5)
                    HStack{
                        Image("Booking_Submit_Click")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                        Text("Anti-Ragging Annexure I (to be notarized)\n")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x868686))
                        +
                        Text("Note: 2 original copies have to be physically submitted as well")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0xF47781))
                    }
                    .padding(.leading)
                    .padding(.top, -1)
                }
            }
        }
    }
}

struct BookingUploadProcessView_Previews: PreviewProvider {
    static var previews: some View {
        BookingUploadProcessView()
    }
}
