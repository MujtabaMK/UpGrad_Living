//
//  MediacalQuestionSubImage.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 30/03/23.
//

import SwiftUI

struct MediacalQuestionSubImage: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var text: String
    var body: some View {
        VStack{
            Image("Question_Sub_bg")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .overlay(
                    Text(text)
                        .font(.custom(OpenSans_SemiBold, size: 12))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                )
        }
    }
}

struct MediacalQuestionSubImage_Previews: PreviewProvider {
    static var previews: some View {
        MediacalQuestionSubImage(text: "")
    }
}
