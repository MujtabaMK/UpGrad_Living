//
//  PaymentMethod6Month.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 03/04/23.
//

import SwiftUI

struct PaymentMethod6Month: View {
    @Binding var isSelect: Bool
    var body: some View {
        VStack{
            HStack{
                Image(isSelect ? "Room_Select_Radio" : "Room_UnSelect_Radio")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding(.leading, 12)
                
                HStack{
                    VLine().stroke(style: StrokeStyle(lineWidth: 0.5))
                        .foregroundColor(Color(hex: 0x333333))
                        .frame(width: 20,height: 30)
                    VStack(alignment: .leading){
                        Text("PAY IN")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(Color(hex: 0x333333))
                        +
                        Text(" ONE")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(Color(hex: 0xDE1223))
                        +
                        Text(" INSTALLMENT")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(Color(hex: 0x333333))
                        
                        Text("11 months")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x868686))
                    }
                }
            }
        }
        .padding()
    }
}

struct PaymentMethod6Month_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethod6Month(isSelect: .constant(false))
    }
}
