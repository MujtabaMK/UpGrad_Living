//
//  BookGuestRoomCell.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 10/06/23.
//

import SwiftUI

struct BookGuestRoomCell: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var arrguest: GetGuest
    
    var body: some View {
        VStack{
            HStack{
                Image("Guest_Room_Confirm_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 62, height: 67)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 8){
                    HStack(spacing: 2){
                        Text("Reference Number#")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                        
                        Text(arrguest.id ?? "")
                            .font(.custom(OpenSans_Bold, size: 14))
                            .foregroundColor(Color(hex: 0xDE1223))
                    }
                    Text(arrguest.dateInfo ?? "")
                        .font(.custom(OpenSans_SemiBold, size: 14))
                        .foregroundColor(Color(hex: 0x868686))
                }
                
                Spacer()
                
                Image("Profile_arrow_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                
            }
            .padding()
        }
        .frame(width: getRect().width - 20)
        .background(colorScheme == .light ? .white : .black)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 4, x: 0, y: 0)
    }
}
