//
//  ParentApprovalTop.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 20/06/23.
//

import SwiftUI

struct ParentApprovalTop: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    var body: some View {
        ZStack(alignment: .top){
            Image("Home_Top_Background")
                .resizable()
                .scaledToFit()
                .frame(width: getRect().width, height: 290)
                .padding(.top, -90)
            VStack{
                HStack{
                    Spacer(minLength: 0)
                    Text("Approval Requests")
                        .font(.custom(OpenSans_SemiBold, size: 18))
                        .foregroundColor(colorScheme == .light ? .white : .white)
                        .padding(.trailing, 30)
                    Spacer(minLength: 0)
                }
                Spacer()
            }
            .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
        }
    }
}
