//
//  StudentProfileCreativity.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 11/04/23.
//

import SwiftUI

struct StudentProfileCreativity: View {
    var backgroundColour: String
    var imageName: String
    var titleName: String
    @Binding var isSelect: Bool
    var body: some View {
        ZStack{
            Color(backgroundColour)
            HStack(spacing: 3){
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 23)
                Text(titleName)
                    .font(.custom(OpenSans_SemiBold, size: 10))
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

struct StudentProfileCreativity_Previews: PreviewProvider {
    static var previews: some View {
        StudentProfileCreativity(backgroundColour: "", imageName: "", titleName: "", isSelect: .constant(false))
    }
}
