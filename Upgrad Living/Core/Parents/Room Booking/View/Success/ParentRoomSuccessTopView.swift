//
//  ParentRoomSuccessTopView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 19/06/23.
//

import SwiftUI

struct ParentRoomSuccessTopView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .center) {
                Image("Security_Payment_Success")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150,height: 151)
                Text("Payment successful!")
                    .font(.custom(OpenSans_Bold, size: 20))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFEEEF0))
                    .padding(5)
                    .padding(.bottom)
                Text("Thank you for reserving the guest room with us.")
                    .font(.custom(OpenSans_Bold, size: 14))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                    .padding(.top, 0)
                    .padding(.bottom, 5)
            }
        }
    }
}
