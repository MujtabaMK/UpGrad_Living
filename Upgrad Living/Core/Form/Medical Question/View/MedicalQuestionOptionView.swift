//
//  MedicalQuestionOptionView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 30/03/23.
//

import SwiftUI

struct MedicalQuestionOptionView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var text: String
    @Binding var isSelect: Bool
    var body: some View {
        HStack(spacing: 4){
            Image(isSelect ? "Medical_Question_Select" : "Mediacal_Question_Unselect")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            Text(text)
                .font(.custom(OpenSans_SemiBold, size: 11))
                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : .white)
        }
    }
}

struct MedicalQuestionOptionView_Previews: PreviewProvider {
    static var previews: some View {
        MedicalQuestionOptionView(text: "", isSelect: .constant(false))
    }
}
