//
//  CommunityEventGallary.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 01/06/23.
//

import SwiftUI
import Kingfisher

struct CommunityEventGallary: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    var arrDetails: [Gallery]
    
    var body: some View {
        VStack{
            HStack{
                Text("Event Gallery")
                    .font(.custom(OpenSans_Bold, size: 16))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x000000, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                Spacer()
            }
            .padding(.horizontal, 6)
            .padding(.bottom)
            
            VStack(alignment: .leading, spacing: 0){
                ForEach(Array(arrDetails.enumerated()), id: \.offset) {index, detail in
                    Text(detail.date ?? "")
                        .font(.custom(OpenSans_SemiBold, size: 12))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x7B6F72) : Color(hex: 0xECECEC))
                        .padding(.leading, 6)
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(Array((detail.images?.enumerated())!), id: \.offset) { index, newImage in
                                KFImage(URL(string: newImage.image ?? ""))
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(15)
                                    .frame(width: 200, height: 200)
                                    .padding(.top, -45)
                            }
                        }
                    }
                }
            }
        }
        .padding(20)
        .background(colorScheme == .light ? Color(hex: 0xEDEDED) : Color(hex: 0x2E2E2E))
    }
}
