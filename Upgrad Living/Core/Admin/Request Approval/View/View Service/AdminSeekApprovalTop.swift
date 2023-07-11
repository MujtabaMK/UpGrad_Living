//
//  AdminSeekApprovalTop.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 11/07/23.
//

import SwiftUI
import Kingfisher

struct AdminSeekApprovalTop: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    var arrSeekApproval: AdminRequest
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                
                Text(arrSeekApproval.requestCategory ?? "")
                    .font(.custom(OpenSans_Bold, size: 14))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                
                Spacer()
            }
            if !(arrSeekApproval.studntName?.isEmpty ?? false){
                Divider()
                
                HStack{
                    Spacer()
                    
                    KFImage(URL(string: arrSeekApproval.studentImg ?? ""))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 44, height: 44)
                        .clipShape(Circle())
                    
                    Text(arrSeekApproval.studntName ?? "")
                        .font(.custom(OpenSans_SemiBold, size: 14))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                    
                    Rectangle()
                        .fill(colorScheme == .light ? .black : .white)
                        .frame(width: 1, height: 11)
                    
                    Text(arrSeekApproval.roomName ?? "")
                        .font(.custom(OpenSans_SemiBold, size: 14))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                    
                    Spacer()
                }
            }
        }
    }
}
