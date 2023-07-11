//
//  AdminServiceCell.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 10/07/23.
//

import SwiftUI

struct AdminServiceCell: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
        HStack(spacing: 20){
            Image("Dean")
                .resizable()
                .scaledToFill()
                .frame(width: 66, height: 66)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4){
                HStack{
                    Text("Nita Kumar")
                        .font(.custom(OpenSans_SemiBold, size: 13))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                    
                    Image("Admin_Resident_Star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                    
                    Text("Day Scholar")
                        .font(.custom(OpenSans_SemiBold, size: 13))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                }
                
                Text("Dining table booking")
                    .font(.custom(OpenSans_SemiBold, size: 13))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                
                HStack{
                    Text("May 12, 2023")
                        .font(.custom(OpenSans_SemiBold, size: 13))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                    
                    Rectangle()
                        .fill(colorScheme == .light ? Color(hex: 0x333333, alpha: 1) : Color(hex: 0xFFFFFF, alpha: 0.8))
                        .frame(width: 1, height: 15)
                    
                    Text("04:00 PM - 04:30 PM")
                        .font(.custom(OpenSans_SemiBold, size: 13))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                }
            }
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 6)
        .frame(width: getRect().width - 40)
        .background(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0x2E2E2E))
        .cornerRadius(10)
        .shadow(color: .gray, radius: 2, x: 0, y: 0)
    }
}
