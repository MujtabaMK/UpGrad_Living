//
//  HomeRoomiesView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 11/05/23.
//

import SwiftUI
import Kingfisher

struct HomeRoomiesView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var isProfile: Bool
    @Binding var RoomieId: String
    var arrRoomie: [Roomy]
    
    var body: some View {
        if arrRoomie.count > 0{
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
                            RoomieId = Room.studentAppID ?? ""
                            UserDefaults.standard.set(Room.studentAppID ?? "", forKey: "RoomieAppID")
                            isProfile = true
                        } label: {
//                            bckimg
//                                .overlay {
//                                    KFImage(URL(string: Room.studentImg ?? ""))
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 95, height: 110)
//                                        .mask { bckimg }
//                                }
                            
                            KFImage(URL(string: Room.studentImg ?? ""))
                                .placeholder{
                                        ProgressView()
                                            .progressViewStyle(CircularProgressViewStyle(tint: Color("Student_Profile1")))
                                    }
                                .resizable()
                                .scaledToFill()
                                .frame(width: 110, height: 110)
                                .clipShape(Circle())
                                .clipped()
                                .padding(5)
                                .background(colorScheme == .light ? .white : Color(hex: 0x2E2E2E))
                                .clipShape(Circle())
                                .shadow(color: .gray, radius: 3, x: 0, y: 0)
                                .overlay {
                                    Circle()
                                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [1]))
                                        .foregroundColor(Color(hex: 0xDE1223))
                                }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    var bckimg: some View {
        Image("Roomie_Background")
            .resizable()
            .scaledToFit()
            .frame(width: 101, height: 107)
    }
}

//struct HomeRoomiesView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeRoomiesView(isProfile: .constant(false))
//    }
//}
