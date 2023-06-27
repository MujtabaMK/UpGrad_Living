//
//  BookingProcessLogin_Image.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 03/04/23.
//

import SwiftUI

struct BookingProcessLogin_Image: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
        VStack{
            Image("Login_Image_Booking")//1
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width - 80, height: 112)
            Image("Submit_Image_Booking")//2
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width - 80, height: 275)
                .padding(.top, -35)
            Image("Pay_Security_Booking_Image")//3
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width - 80, height: 110)
                .padding(.top, -35)
            Image("Parent_Consent_Booking_Image")//4
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width - 80, height: 111)
                .padding(.top, -35)
            Image("Upload_Booking_Image")//5
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width - 80, height: 449)
                .padding(.top, -40)
            Image("Create_Booking_Image")//6
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width - 80, height: 111)
                .padding(.top, -40)
            Image("Select_Booking_Image")//7
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width - 80, height: 135)
                .padding(.top, -40)
            Image("Digital_Booking_Image")//8
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width - 80, height: 112)
                .padding(.top, -35)
            Image("Pay_Housing_Booking_Image")//9
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width - 80, height: 132)
                .padding(.top, -35)
            Image("Check_In_Booking_Image")//10
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width - 80, height: 104)
                .padding(.top, -35)
                .padding(.bottom, 30)
        }
    }
}

struct BookingProcessLogin_Image_Previews: PreviewProvider {
    static var previews: some View {
        BookingProcessLogin_Image()
    }
}
