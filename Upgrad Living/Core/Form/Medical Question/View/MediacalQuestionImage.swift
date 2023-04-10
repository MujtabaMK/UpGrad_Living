//
//  MediacalQuestionImage.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 30/03/23.
//

import SwiftUI

struct MediacalQuestionImage: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var text: String
    var body: some View {
        VStack{
            Image("Question_Bg")
                .resizable()
                .scaledToFit()
                .frame(width: 34, height: 34)
                .overlay(
                    Text(text)
                        .font(.custom(OpenSans_SemiBold, size: 14))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                        .padding(.top, -5)
                        .padding(.leading, 5)
                )
        }
    }
}

struct MediacalQuestionImage_Previews: PreviewProvider {
    static var previews: some View {
        MediacalQuestionImage(text: "01")
    }
}
