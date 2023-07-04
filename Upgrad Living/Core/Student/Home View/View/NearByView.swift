//
//  NearByView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 12/05/23.
//

import SwiftUI

struct NearByView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Nearby You")
                    .font(.custom(OpenSans_Bold, size: 20))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x1A1A1A) : Color(hex: 0xFFFFFF))
                    .padding(.bottom, 10)
                Spacer()
            }
            .padding(.horizontal)
            HStack{
                Button {
                    let url = URL(string: "http://maps.apple.com/?q=transport+near+me")
                    if UIApplication.shared.canOpenURL(url!) {
                          UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                    }
                } label: {
                    Image("Transport_icon")
                        .resizable()
                        .scaledToFill()
                }
                Button {
                    let url = URL(string: "http://maps.apple.com/?q=food+near+me")
                    if UIApplication.shared.canOpenURL(url!) {
                          UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                    }
                } label: {
                    Image("Food_icon")
                        .resizable()
                        .scaledToFill()
                }
            }
            .padding(.horizontal)
            
            HStack{
                Button {
                    let url = URL(string: "http://maps.apple.com/?q=healt+care+near+me")
                    if UIApplication.shared.canOpenURL(url!) {
                          UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                    }
                } label: {
                    Image("Healthcare_icon")
                        .resizable()
                        .scaledToFill()
                }
                Button {
                    let url = URL(string: "http://maps.apple.com/?q=entertainment+near+me")
                    if UIApplication.shared.canOpenURL(url!) {
                          UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                    }
                } label: {
                    Image("Entertainment_icon")
                        .resizable()
                        .scaledToFill()
                }
            }
            .padding(.horizontal)
        }
        .padding(.bottom, 100)
    }
}

//struct NearByView_Previews: PreviewProvider {
//    static var previews: some View {
//        NearByView()
//    }
//}
