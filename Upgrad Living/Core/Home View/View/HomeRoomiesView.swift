//
//  HomeRoomiesView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 11/05/23.
//

import SwiftUI

struct HomeRoomiesView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var isProfile: Bool
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Your Roomies")
                    .font(.custom(OpenSans_Bold, size: 20))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x1A1A1A) : Color(hex: 0xFFFFFF, alpha: 0.8))
                Spacer()
            }
            .padding(.horizontal)
            HStack{
                ForEach(arrRoomie) { Room in
                    Button {
                        //isProfile = true
                    } label: {
                        bckimg
                            .overlay {
                                Image(Room.Image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 95, height: 110)
                                    .mask { bckimg }
                            }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    var bckimg: some View {
        Image("Roomie_Background")
            .resizable()
            .scaledToFit()
            .frame(width: 101, height: 107)
    }
}

struct HomeRoomiesView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRoomiesView(isProfile: .constant(false))
    }
}
