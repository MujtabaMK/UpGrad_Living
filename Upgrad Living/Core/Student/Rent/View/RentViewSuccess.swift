//
//  RentViewSuccess.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 05/05/23.
//

import SwiftUI

struct RentViewSuccess: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
        NavigationView {
            VStack(alignment: .center){
                Spacer()
                Image("Security_Payment_Success")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150,height: 151)
                Text("Payment successful!")
                    .font(.custom(OpenSans_Bold, size: 20))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFEEEF0))
                    .padding(5)
                    .padding(.bottom, 5)
                Text("Thank you for paying the rent.")
                    .font(.custom(OpenSans_Bold, size: 14))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                    .padding(.top, 0)
                Text("The receipt will be sent to your email.")
                    .font(.custom(OpenSans_Bold, size: 14))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                    .padding(.top, 0)
                    .padding(.bottom, 20)
                HStack(spacing: 0){
                    Text("Get ready to pack your bags...... ")
                        .font(.custom(OpenSans_SemiBold, size: 16))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                    Image("pack_Bag_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 34, height: 38)
                }
                .padding(.leading)
                .padding(.bottom)
                
                DetailsViewBottom(textName: "Check-in")
                    .onTapGesture {
                        
                    }
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct RentViewSuccess_Previews: PreviewProvider {
    static var previews: some View {
        RentViewSuccess()
    }
}
