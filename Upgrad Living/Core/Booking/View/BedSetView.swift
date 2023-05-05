//
//  BedSetView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 04/05/23.
//

import SwiftUI

struct BedSetView: View {
    var BedValue: Int
    var body: some View {
        VStack(alignment: .leading){
            if BedValue == 0{
                Image("Bed_A_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 48)
            }else if BedValue == 1{
                Image("Bed_B_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 48)
            }else if BedValue == 2{
                Image("Bed_C_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 48)
            }else if BedValue == 3{
                Image("Bed_D_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 48)
            }
        }
        .padding(.leading, 15)
    }
}

struct BedSetView_Previews: PreviewProvider {
    static var previews: some View {
        BedSetView(BedValue: 0)
    }
}
