//
//  BedDetailsTop.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 04/05/23.
//

import SwiftUI

struct BedDetailsTop: View {
    var RoomName: String
    var RoomType: String
    var body: some View {
        VStack(alignment: .leading){
            Text("You have selected")
                .font(.custom(OpenSans_Bold, size: 16))
                .foregroundColor(Color(hex: 0x333333))
                .padding(.bottom, 2)
                .padding(.leading, 10)
            HStack{
                Spacer()
                Text("Room \(RoomName)")
                    .font(.custom(OpenSans_Bold, size: 16))
                    .foregroundColor(.white)
                Spacer()
                Rectangle()
                    .fill(.white)
                    .frame(width: 1, height: 40)
                Spacer()
                Text("\(RoomType) room")
                    .font(.custom(OpenSans_Bold, size: 16))
                    .foregroundColor(.white)
                Spacer()
            }
            .frame(width: getRect().width - 20, height: 54, alignment: .center)
            .background(Color(hex: 0x79CB8A))
            .padding(.leading, 10)
            Text("Meet your Roommates")
                .font(.custom(OpenSans_Bold, size: 14))
                .foregroundColor(Color(hex: 0x868686))
                .padding(.leading, 10)
        }
    }
}

struct BedDetailsTop_Previews: PreviewProvider {
    static var previews: some View {
        BedDetailsTop(RoomName: "", RoomType: "")
    }
}
