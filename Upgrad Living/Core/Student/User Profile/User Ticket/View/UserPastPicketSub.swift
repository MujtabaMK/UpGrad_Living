//
//  UserPastPicketSub.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 06/06/23.
//

import SwiftUI

struct UserPastPicketSub: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var PastTicket: PastTicket
    
    var body: some View {
        VStack{
            HStack(spacing: 2){
                Text(PastTicket.ticketNo ?? "")
                    .font(.custom(OpenSans_Bold, size: 16))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                
                Text("-")
                
                Text(PastTicket.ticketCateg ?? "")
                    .font(.custom(OpenSans_Bold, size: 16))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x868686, alpha: 1.0) : Color(hex: 0x868686, alpha: 1.0))
                
                Spacer()
                
                Image("Profile_arrow_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
            }
            .padding(.horizontal)
            
            HStack(spacing: 2){
                Text("Raised")
                    .font(.custom(OpenSans_SemiBold, size: 12))
                    .foregroundColor(Color(hex: 0x969696))
                
                Text("-")
                    .font(.custom(OpenSans_SemiBold, size: 12))
                    .foregroundColor(Color(hex: 0x969696))
                
                Text(PastTicket.raisedAt ?? "")
                    .font(.custom(OpenSans_SemiBold, size: 12))
                    .foregroundColor(Color(hex: 0x969696))
                
                Spacer()
            }
            .padding(.horizontal)
            
            ZStack(alignment: .center) {
                if PastTicket.ticketStatus == "Open"{
                    Rectangle()
                        .fill(Color(hex: 0xCAEDEF))
                        .frame(height: 30)
                        .cornerRadius(10, corners: [.bottomRight, .bottomLeft])
                    
                    Text(PastTicket.ticketStatus ?? "")
                        .font(.custom(OpenSans_SemiBold, size: 14))
                        .foregroundColor(Color(hex: 0x000000))
                }else if PastTicket.ticketStatus == "Closed"{
                    Rectangle()
                        .fill(Color(hex: 0xFAC2C7))
                        .frame(height: 30)
                        .cornerRadius(10, corners: [.bottomRight, .bottomLeft])
                    
                    Text(PastTicket.ticketStatus ?? "")
                        .font(.custom(OpenSans_SemiBold, size: 14))
                        .foregroundColor(Color(hex: 0x000000))
                }else{
                    Rectangle()
                        .fill(Color(hex: 0xFACDAC))
                        .frame(height: 30)
                        .cornerRadius(10, corners: [.bottomRight, .bottomLeft])
                    
                    Text(PastTicket.ticketStatus ?? "")
                        .font(.custom(OpenSans_SemiBold, size: 14))
                        .foregroundColor(Color(hex: 0x000000))
                }
            }
        }
        .padding(.top)
        .frame(width: getRect().width - 20)
        .background(colorScheme == .light ? .white : .black)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 4, x: 0, y: 0)
    }
}
