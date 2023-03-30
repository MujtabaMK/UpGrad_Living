//
//  DetailsViewBottom.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 29/03/23.
//

import SwiftUI

struct DetailsViewBottom: View {
    var body: some View {
        ZStack(alignment: .trailing){
            Text("Save & Continue")
                .font(.custom(OpenSans_SemiBold, size: 15))
                .frame(width: 250, alignment: .center)
                .font(.custom(OpenSans_SemiBold, size: 14))
                .padding()
                .foregroundColor(.white)
                .background(
                    LinearGradient(
                        colors: [Color(hex: 0xEE2C3C),
                                 Color(hex: 0xB20710)],
                        startPoint: .leading,
                        endPoint: .trailing))
                .clipShape(Capsule())
            
            Image("Form_Button_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 27, height: 27)
                .padding(.trailing, 15)
        }
    }
}

struct DetailsViewBottom_Previews: PreviewProvider {
    static var previews: some View {
        DetailsViewBottom()
    }
}
