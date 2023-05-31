//
//  ServiceMealTimeView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 30/05/23.
//

import SwiftUI

struct ServiceMealTimeView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var ImageName: String
    var StartTime: String
    var EndTime: String
    var body: some View {
        ZStack{
            Image(ImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 120)
            VStack(spacing: -6){
                Text(StartTime)
                    .font(.custom(OpenSans_SemiBold, size: 12))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                Text("-")
                    .font(.custom(OpenSans_SemiBold, size: 12))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                Text(EndTime)
                    .font(.custom(OpenSans_SemiBold, size: 12))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
            }
            .offset(y: 32)
        }
    }
}
