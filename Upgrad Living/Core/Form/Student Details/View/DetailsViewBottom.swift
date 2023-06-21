//
//  DetailsViewBottom.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 29/03/23.
//

import SwiftUI

struct DetailsViewBottom: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var textName: String
    var imageName: String?
    var body: some View {
        ZStack(alignment: .trailing){
            Text(textName)//Save & Continue
                .font(.custom(OpenSans_SemiBold, size: 15))
                .frame(width: 230, alignment: .center)
                .font(.custom(OpenSans_SemiBold, size: 14))
                .padding()
                .foregroundColor(.white)
                .background(
                    LinearGradient(
                        colors: [colorScheme == .light ?  Color(hex: 0xB20710) : Color(hex: 0xD24752),
                                 colorScheme == .light ? Color(hex: 0xEE2C3C) : Color(hex: 0xE73241)],
                        startPoint: .leading,
                        endPoint: .trailing))
                .clipShape(Capsule())
            
            Image(imageName ?? "")//Form_Button_icon
                .resizable()
                .scaledToFit()
                .frame(width: 27, height: 27)
                .padding(.trailing, 15)
        }
    }
}

struct DetailsViewBottom_Previews: PreviewProvider {
    static var previews: some View {
        DetailsViewBottom(textName: "", imageName: "")
    }
}
