//
//  HomeOfferView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 12/05/23.
//

import SwiftUI

struct HomeOfferView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var arrDeals: [Offer]
    var body: some View {
        VStack{
            HStack{
                Text("Deals & Offers")
                    .font(.custom(OpenSans_Bold, size: 20))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x1A1A1A) : Color(hex: 0xFFFFFF))
                
                Spacer()
                Button {
                    
                } label: {
                    Text("See All")
                        .font(.custom(OpenSans_SemiBold, size: 12))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                }
                
                Image(systemName: "arrowtriangle.forward.fill")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 6, height: 9)
            }
            .padding(.horizontal)
            
            ForEach(arrDeals) { deals in
                Button {
                    
                } label: {
                    VStack{
                        HomeOfferCell(Deals: deals)
                    }
                    .frame(width: getRect().width - 20, height: 115)
                    .background(.white)
                    .cornerRadius(15)
                    .shadow(color: .gray, radius: 5, x: 0, y: 0)
                    .padding(.vertical, 5)
                }
            }
        }
    }
}

//struct HomeOfferView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeOfferView()
//    }
//}
