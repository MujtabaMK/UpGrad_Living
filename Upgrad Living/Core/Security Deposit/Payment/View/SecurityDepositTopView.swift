//
//  SecurityDepositTopView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 04/04/23.
//

import SwiftUI

struct SecurityDepositTopView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
        ZStack{
            Color(hex: 0xFDE1E3)
            VStack(alignment: .center){
                Image("Security_Deposit_Top_Image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 86, height: 81)
                    .padding()
                Text("Book your bed and get ready to dream in comfort!")
                    .font(.custom(OpenSans_Bold, size: 20))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x000000) : .white)
                    .frame(width: 200, alignment: .center)
                    .multilineTextAlignment(.center)
                
            }
            .padding(.top, 30)
        }
        .ignoresSafeArea()
    }
}

struct SecurityDepositTopView_Previews: PreviewProvider {
    static var previews: some View {
        SecurityDepositTopView()
    }
}
