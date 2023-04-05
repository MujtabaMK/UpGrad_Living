//
//  SecurityDepositSuccess.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 04/04/23.
//

import SwiftUI

struct SecurityDepositSuccess: View {
    @State private var isButtonClick = false
    var body: some View {
        NavigationView {
            VStack(alignment: .center){
                Image("Security_Payment_Success")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150,height: 151)
                Text("Payment successful!")
                    .font(.custom(OpenSans_Bold, size: 20))
                    .foregroundColor(Color(hex: 0x333333))
                    .padding(5)
                Text("Thank you for making the security deposit. \nThe receipt will be sent to your email.")
                    .font(.custom(OpenSans_SemiBold, size: 14))
                    .foregroundColor(Color(hex: 0x868686))
                    .multilineTextAlignment(.center)
                    .padding(5)
                    .padding(.bottom, 20)
                Text("Please proceed to \nupload your documents")
                    .font(.custom(OpenSans_SemiBold, size: 16))
                    .foregroundColor(Color(hex: 0x333333))
                    .multilineTextAlignment(.center)
                    .padding(10)
                
                Text("Upload Documents")
                    .font(.custom(OpenSans_SemiBold, size: 15))
                    .frame(width: 250, alignment: .center)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(hex: 0xAFAFAF))
                    .clipShape(Capsule())
                    .padding(5)
                    .padding(.bottom, 3)
                    .onTapGesture {
                        isButtonClick = true
                    }
                    .shadow(color: isButtonClick ? .gray : .clear, radius: isButtonClick ? 10 : 0, x: 0, y: 0)
                Text("*You will be able to upload the \ndocuments only post 15th April 2023")
                    .font(.custom(OpenSans_SemiBold, size: 14))
                    .foregroundColor(Color(hex: 0xDE1223))
                    .multilineTextAlignment(.center)
                Spacer()
            }
        }
    }
}

struct SecurityDepositSuccess_Previews: PreviewProvider {
    static var previews: some View {
        SecurityDepositSuccess()
    }
}
