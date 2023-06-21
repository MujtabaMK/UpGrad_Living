//
//  UserCheckInCheckOut.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 16/06/23.
//

import SwiftUI

struct UserCheckInCheckOut: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    @Binding var show: Bool
    
    @Binding var studentDate: String
    @Binding var exitTime: String
    @Binding var entryTime: String
    
    var body: some View {
        ZStack{
            if show {
                Color.black.opacity(show ? 0.4 : 0).edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        Spacer()
                        Button {
                            show = false
                        } label: {
                            Image(systemName: "xmark")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(colorScheme == .light ? .gray : .white)
                        }
                    }
                    .padding(.trailing)
                    .padding(.bottom)
                    
                    Image("User_CheckIN_CheckOut_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 206, height: 105)
                        .padding(.bottom, 20)
                    
                    Text(studentDate)
                        .font(.custom(OpenSans_Bold, size: 18))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x00000, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                    
                    HStack{
                        Spacer()
                        
                        Text("Exit time")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x616161) : Color(hex: 0x616161))
                        
                        Spacer()
                        
                        Rectangle()
                            .strokeBorder(style: StrokeStyle(lineWidth: 0.2, dash: [2]))
                            .foregroundColor(.clear)
                            .frame(width: 1)
                        
                        
                        Spacer()
                        
                        Text("Entry time")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x616161) : Color(hex: 0x616161))
                        
                        Spacer()
                        
                    }
                    .frame(height: 31)
                    .background(Color(hex: 0xFDDFE3))
                    
                    HStack{
                        Spacer()
                        Text(exitTime)
                            .font(.custom(OpenSans_Bold, size: 16))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                        Spacer()
                        
                        Rectangle()
                            .strokeBorder(style: StrokeStyle(lineWidth: 0.2, dash: [2]))
                            .foregroundColor(Color(hex: 0x969696))
                            .frame(width: 1)
                        
                        Spacer()
                        Text(entryTime)
                            .font(.custom(OpenSans_Bold, size: 16))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                        
                        Spacer()
                    }
                    .frame(height: 48)
                    .padding(.top, -6)
                    
                    Rectangle()
                        .strokeBorder(style: StrokeStyle(lineWidth: 0.2, dash: [2]))
                        .foregroundColor(Color(hex: 0x969696))
                        .frame(width: getRect().width - 40, height: 0.5)
                        .padding(.top, -8)
                    
                    VStack{
                        Text("Please note:")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                        
                        +
                        
                        Text(" Above timings shown are 1st exit from the hostel and ")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                        
                        +
                        
                        Text(" last entry into the hostel")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                        
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 20)
                .background(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0x2E2E2E))
                .cornerRadius(20)
                .frame(width: getRect().width - 40, height: 450)
                .shadow(color: .gray, radius: 4, x: 0, y: 0)
            }
        }
    }
}
