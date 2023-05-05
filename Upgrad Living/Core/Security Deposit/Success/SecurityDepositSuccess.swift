//
//  SecurityDepositSuccess.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 04/04/23.
//

import SwiftUI

struct SecurityDepositSuccess: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var isButtonClick = false
    @State private var isUploadDocument = false
    var body: some View {
        NavigationView {
            VStack(alignment: .center){
                Spacer()
                Image("Security_Payment_Success")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150,height: 151)
                Text("Congratulations!!")
                    .font(.custom(OpenSans_Bold, size: 20))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFEEEF0))
                    .padding(5)
                Text("Your payment is successful!")
                    .font(.custom(OpenSans_Bold, size: 16))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFEEEF0))
                    .padding(.top, 0)
                    .padding(.bottom, 15)
                VStack(alignment: .leading){
                    Text("Please note:")
                        .font(.custom(OpenSans_SemiBold, size: 14))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFEEEF0))
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 10)
                    Text("Your parents have been notified by email & asked to provide consent for your accommodation request.\n\nThis is mandatory to move to the next step of uploading documents, creating a profile and selecting a room.")
                        .font(.custom(OpenSans_SemiBold, size: 14))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xB1B1B1))
                        .multilineTextAlignment(.leading)
                }
                .padding(.leading)
                NavigationLink("", destination: UploadDocumentsView(isBackButtonShow: .constant(false)).navigationBarHidden(true),isActive: $isUploadDocument).isDetailLink(false)
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct SecurityDepositSuccess_Previews: PreviewProvider {
    static var previews: some View {
        SecurityDepositSuccess()
    }
}
