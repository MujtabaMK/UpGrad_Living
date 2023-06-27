//
//  RoomTypeQuardView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 30/03/23.
//

import SwiftUI

struct RoomTypeQuardView: View {
    @Binding var isSelect: Bool
    var body: some View {
        VStack{
            HStack{
                Image(isSelect ? "Room_Select_Radio" : "Room_UnSelect_Radio")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding(.leading, 12)
                VStack(alignment: .leading, spacing: 5){
                    HStack(spacing: 4){
                        Text("Quad Sharing Room".uppercased())
                            .font(.custom(OpenSans_Bold, size: 14))
                            .foregroundColor(Color(hex: 0x333333))
                        Image("Quad_Sharing")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 18)
                    }
                    Divider()
                    HStack(spacing: 6){
                        Text("\u{20B9}45,000 per month")
                            .font(.custom(OpenSans_SemiBold, size: 13))
                            .foregroundColor(Color(hex: 0x333333))
                        ZStack(alignment: .center){
                            Text("\u{20B9}49,000 per month")
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x868686))
                                .strikethrough(true, color: Color(hex: 0x868686))
//                            Rectangle()
//                                .fill(Color(hex: 0x868686))
//                                .frame(width: 60,height: 0.5)
                        }
                    }
                    HStack(spacing: 0){
                        Text("**")
                            .font(.custom(OpenSans_SemiBoldItalic, size: 12))
                            .foregroundColor(Color(hex: 0xC1101B))
                        Text("Inaugural Offer")
                            .font(.custom(OpenSans_SemiBoldItalic, size: 12))
                            .foregroundColor(Color(hex: 0xC1101B))
                        Text("**")
                            .font(.custom(OpenSans_SemiBoldItalic, size: 12))
                            .foregroundColor(Color(hex: 0xC1101B))
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(10)
    }
}

struct RoomTypeQuardView_Previews: PreviewProvider {
    static var previews: some View {
        RoomTypeQuardView(isSelect: .constant(false))
    }
}
