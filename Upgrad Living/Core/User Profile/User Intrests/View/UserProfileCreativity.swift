//
//  UserProfileCreativity.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 02/06/23.
//

import SwiftUI

struct UserProfileCreativity: View {
    var backgroundColour: String
    var titleName: String
    @Binding var isSelect: Bool
    var body: some View {
        ZStack{
            Color(backgroundColour)
            HStack(spacing: 3){
                Text(titleName)
                    .font(.custom(OpenSans_SemiBold, size: 9))
                    .foregroundColor(Color(hex: 0x333333))
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(
                cornerRadius: 15.0)
            .strokeBorder(isSelect ? Color(hex: 0xF5868F) : .clear,
                          style: StrokeStyle(lineWidth: 3.0))
        )
    }
}
