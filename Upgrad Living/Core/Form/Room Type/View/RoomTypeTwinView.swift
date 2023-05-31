//
//  RoomTypeTwinView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 30/03/23.
//

import SwiftUI

struct RoomTypeTwinView: View {
    @Binding var isSelect: Bool
    var body: some View {
        VStack{
            HStack{
                Image(isSelect ? "Room_Select_Radio" : "Room_UnSelect_Radio")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding(.leading, 12)
                VStack(alignment: .leading){
                    HStack(spacing: 4){
                        Text("Twin Sharing Room")
                            .font(.custom(OpenSans_Bold, size: 14))
                            .foregroundColor(Color(hex: 0x333333))
                        Image("Twin_Sharing")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 18)
                    }
                    Divider()
                    HStack(spacing: 6){
                        Text("\u{20B9}60,000 per month")
                            .font(.custom(OpenSans_SemiBold, size: 13))
                            .foregroundColor(Color(hex: 0x333333))
//                        ZStack{
//                            Text("\u{20B9}60,000 per month")
//                                .font(.custom(OpenSans_SemiBold, size: 12))
//                                .foregroundColor(Color(hex: 0x868686))
//                            Rectangle()
//                                .fill(Color(hex: 0x868686))
//                                .frame(width: 60,height: 0.5)
//                        }
                    }
                    Text("**Inaugural Offer**")
                        .font(.custom(OpenSans_SemiBoldItalic, size: 12))
                        .foregroundColor(Color(hex: 0xC1101B))
                    
                }
                .padding(.horizontal)
            }
        }
        .padding(10)
    }
}

struct RoomTypeTwinView_Previews: PreviewProvider {
    static var previews: some View {
        RoomTypeTwinView(isSelect: .constant(false))
    }
}
