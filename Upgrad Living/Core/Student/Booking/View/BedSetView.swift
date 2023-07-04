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
                StrokeText(text: "A", width: 1.0, color:  Color(hex: 0xF47781))
                    .foregroundColor(Color(hex: 0xFFFFFF))
                    .font(.custom(OpenSans_Bold, size: 35))
            }else if BedValue == 1{
                StrokeText(text: "B", width: 1.0, color:  Color(hex: 0xF47781))
                    .foregroundColor(Color(hex: 0xFFFFFF))
                    .font(.custom(OpenSans_Bold, size: 35))
            }else if BedValue == 2{
                StrokeText(text: "C", width: 1.0, color:  Color(hex: 0xF47781))
                    .foregroundColor(Color(hex: 0xFFFFFF))
                    .font(.custom(OpenSans_Bold, size: 35))
            }else if BedValue == 3{
                StrokeText(text: "D", width: 1.0, color:  Color(hex: 0xF47781))
                    .foregroundColor(Color(hex: 0xFFFFFF))
                    .font(.custom(OpenSans_Bold, size: 35))
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
