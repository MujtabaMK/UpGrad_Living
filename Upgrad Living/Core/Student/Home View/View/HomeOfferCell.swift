//
//  HomeOfferCell.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 12/05/23.
//

import SwiftUI
import Kingfisher

struct HomeOfferCell: View {
    var Deals: Offer
    var body: some View {
        VStack{
            HStack(spacing: 20){
                KFImage(URL(string: Deals.offerImage ?? ""))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 98, height: 96)
                    .padding(.leading, 5)
                VStack(alignment: .leading){
                    HStack(spacing: 1){
                        Text(Deals.name ?? "")
                            .font(.custom(OpenSans_Bold, size: 20))
                            .foregroundColor(Color(hex: 0x333333))
                    }
                    HStack(spacing: 2){
                        Text("On")
                            .font(.custom(OpenSans_SemiBold, size: 16))
                            .foregroundColor(Color(hex: 0x868686))
                        Text(Deals.productName ?? "")
                            .font(.custom(OpenSans_Bold, size: 16))
                            .foregroundColor(Color(hex: 0x969696))
                    }
                    .padding(.bottom, 4)
                    Text(Deals.description ?? "")
                        .font(.custom(OpenSans_Regular, size: 12))
                        .foregroundColor(Color(hex: 0x969696))
                }
                Spacer()
            }
        }
    }
}

//struct HomeOfferCell_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeOfferCell()
//    }
//}
