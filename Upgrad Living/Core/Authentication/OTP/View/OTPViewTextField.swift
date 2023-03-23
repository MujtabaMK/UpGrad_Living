//
//  OTPViewTextField.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 23/03/23.
//

import SwiftUI
import Combine

struct OTPViewTextField: View {
    @Binding var text : String
    var body: some View {
        TextField("", text: $text)
            .keyboardType(.numberPad)
            .frame(width: 45, height: 45)
            .multilineTextAlignment(.center)
            .font(Font.custom(OpenSans_Bold, size: 14))
            .foregroundColor(.black)
            .onReceive(Just(text)) { newValue in
                if text.count > 1 {
                    text = String(text.prefix(1))
                }
            }
            .overlay(
                RoundedRectangle(
                    cornerRadius: 10).strokeBorder(Color(hex: 0x969696),
                                                  style: StrokeStyle(lineWidth: 0.5))
            )
            .padding(.horizontal, 8)
    }
}

struct OTPViewTextField_Previews: PreviewProvider {
    static var previews: some View {
        OTPViewTextField(text: .constant(""))
    }
}
