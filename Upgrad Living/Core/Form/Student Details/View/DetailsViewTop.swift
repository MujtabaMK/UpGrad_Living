//
//  DetailsViewTop.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 29/03/23.
//

import SwiftUI

struct DetailsViewTop: View {
    var Step: String
    var body: some View {
        VStack{
            HStack{
                Text("Step")
                    .font(.custom(OpenSans_SemiBold, size: 14))
                    .foregroundColor(Color(hex: 0x868686))
                if Step == "1"{
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(hex: 0xFDE1E3))
                        .overlay(
                            Text("1")
                                .font(.custom(OpenSans_SemiBold, size: 14))
                                .foregroundColor(Color(hex: 0x868686))
                        )
                }
                
                Text("of")
                    .font(.custom(OpenSans_SemiBold, size: 14))
                    .foregroundColor(Color(hex: 0x868686))
                
                if Step == "1"{
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(hex: 0xF1F0F0))
                        .overlay(
                            Text("5")
                                .font(.custom(OpenSans_SemiBold, size: 14))
                                .foregroundColor(Color(hex: 0x868686))
                        )
                }
            }
            .padding(.bottom, 5)
            if Step == "1"{
                HStack{
                    Image("Student_Top_Image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 235, height: 235, alignment: .leading)
                        Spacer()
                    Text("Begin your journey by telling us about you...")
                        .font(.custom(OpenSans_Bold, size: 20))
                        .foregroundColor(Color(hex: 0x333333))
                        Spacer()
                }
                Text("Student’s Details")
                    .foregroundColor(.white)
                    .font(.custom(OpenSans_Bold, size: 16))
                    .padding(8)
                    .frame(width: UIScreen.main.bounds.width - 20)
                    .background(Color(hex: 0xF15865))
                    .padding(.top, -30)
            }
        }
    }
}

struct DetailsViewTop_Previews: PreviewProvider {
    static var previews: some View {
        DetailsViewTop(Step: "1")
    }
}
