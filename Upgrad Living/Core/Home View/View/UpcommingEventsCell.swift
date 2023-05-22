//
//  UpcommingEventsCell.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 12/05/23.
//

import SwiftUI

struct UpcommingEventsCell: View {
    var post: EventsModel
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                ZStack(alignment: .bottom){
                    Image(post.eventImage)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(15)
                    
                    VStack {
                        HStack{
                            Spacer()
                            Rectangle()
                                .fill(
                                    LinearGradient(colors: [Color(hex: 0x969696, alpha: 1.0), Color(hex: 0x969696, alpha: 0.7)], startPoint: .leading, endPoint: .trailing)
                                )
                                .frame(width: 42, height: 48)
                                .overlay {
                                    VStack(spacing: 1){
                                        Text(post.day)
                                            .font(.custom(OpenSans_Bold, size: 15))
                                            .foregroundColor(.black)
                                        Text(post.month)
                                            .font(.custom(OpenSans_Bold, size: 13))
                                            .foregroundColor(.black)
                                    }
                                }
                                .cornerRadius(10)
                                .padding(.trailing)
                        }
                        VStack{
                            
                        }
                        .frame(height: 70)
                        VStack{
                            HStack{
                                VStack(alignment: .leading,spacing: 4){
                                    Text(post.title)
                                        .font(.custom(OpenSans_Bold, size: 16))
                                        .foregroundColor(Color(hex: 0xFFFFFF))
                                    HStack(spacing: 4) {
                                        Text(post.time)
                                            .font(.custom(OpenSans_SemiBold, size: 12))
                                            .foregroundColor(Color(hex: 0xFFFFFF))
                                        Rectangle()
                                            .fill(.white)
                                            .frame(width: 0.3, height: 12)
                                        Text(post.dateFull)
                                            .font(.custom(OpenSans_SemiBold, size: 12))
                                            .foregroundColor(Color(hex: 0xFFFFFF))
                                    }
                                    HStack{
                                        Image("Home_Event_Location")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 17, height: 17)
                                        Text(post.address)
                                            .font(.custom(OpenSans_SemiBold, size: 12))
                                            .foregroundColor(Color(hex: 0xFFFFFF))
                                    }
                                }
                                Spacer()
                                VStack{
                                    Button {
                                        
                                    } label: {
                                        Image("Home_Bookmark_Not_Select")
                                    }
                                    Spacer()
                                }
                                .padding(.top, 25)
                            }
                            .padding(.horizontal)
                        }
                        .frame(width: proxy.size.width, height: 110)
                        .background(
                            LinearGradient(colors: [Color(hex: 0x1C1B19, alpha: 1.0), Color(hex: 0x1C1B19, alpha: 0.35)], startPoint: .top, endPoint: .bottom)
                            
                        )
                        .cornerRadius(15, corners: [.bottomRight, .bottomLeft])
                    }
                }
            }
            .cornerRadius(15)
            .padding(5)
            .navigationBarHidden(true)            
        }
    }
}

//struct UpcommingEventsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UpcommingEventsCell()
//    }
//}
