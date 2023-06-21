//
//  GuestRoomSuccessMiddleView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 09/06/23.
//

import SwiftUI

struct GuestRoomSuccessMiddleView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(spacing: 2) {
                Text("Your ")
                    .font(.custom(OpenSans_SemiBold, size: 14))
                    .foregroundColor(Color(hex: 0x868686))
                
                Text("Booking reference no.")
                    .font(.custom(OpenSans_SemiBold, size: 14))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                
                Text(" is ")
                    .font(.custom(OpenSans_SemiBold, size: 14))
                    .foregroundColor(Color(hex: 0x868686))
                
                Text("23415")
                    .font(.custom(OpenSans_SemiBold, size: 14))
                    .foregroundColor(Color(hex: 0xDE1223))
            }
        }
        .padding(.bottom, 30)
    }
}

struct GuestRoomSuccessMiddleView_Previews: PreviewProvider {
    static var previews: some View {
        GuestRoomSuccessMiddleView()
    }
}
