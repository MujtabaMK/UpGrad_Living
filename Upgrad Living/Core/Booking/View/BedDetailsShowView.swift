//
//  BedDetailsShowView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 04/05/23.
//

import SwiftUI
import Kingfisher

struct BedDetailsShowView: View {
    var getData: [BedDetail]
    var body: some View {
        VStack{
            ForEach(Array(getData.enumerated()), id: \.offset) { indexvalue,value in
                VStack(alignment: .leading){
                    if !(value.id?.isEmpty ?? false){
                        BedSetView(BedValue: indexvalue)
                        VStack{
                            HStack{
                                VStack{
                                    Rectangle()
                                        .fill(.clear)
                                        .frame(width: 10)
                                }
                                VStack(spacing: 12){
                                    KFImage(URL(string: value.studentImg ?? ""))
                                        .resizable()
                                        .frame(width: 59, height: 59)
                                        .clipShape(Circle())
                                    Text(value.studentName ?? "")
                                        .font(.custom(OpenSans_SemiBold, size: 12))
                                        .foregroundColor(Color(hex: 0x333333))
                                }
                                VStack{
                                    Rectangle()
                                        .fill(.clear)
                                        .frame(width: 10)
                                }
                                VStack(alignment: .leading){
                                    Text(value.specialisationName ?? "")
                                        .font(.custom(OpenSans_SemiBold, size: 12))
                                        .foregroundColor(Color(hex: 0x868686))
                                    Divider()
                                    Text("\(value.stateName ?? "") \(value.cityName ?? "")")
                                        .font(.custom(OpenSans_SemiBold, size: 12))
                                        .foregroundColor(Color(hex: 0x868686))
                                    Divider()
                                    HStack{
                                        Text("Food Preference -")
                                            .font(.custom(OpenSans_SemiBold, size: 12))
                                            .foregroundColor(Color(hex: 0x000000))
                                        Text(value.dietry ?? "")
                                            .font(.custom(OpenSans_SemiBold, size: 12))
                                            .foregroundColor(Color(hex: 0x868686))
                                    }
                                    .padding(.trailing, 5)
                                }
                            }
                        }
                        .frame(width: getRect().width - 10, height: 130, alignment: .center)
                        .background(.white)
                        .cornerRadius(12)
                        .shadow(color: .gray, radius: 5, x: 0, y: 0)
                        .offset(x: 5, y: -25)
                        
                    }else{
                        BedSetView(BedValue: indexvalue)
                        Text(value.bedstatus ?? "")
                            .font(.custom(OpenSans_SemiBold, size: 16))
                            .foregroundColor(Color(hex: 0x969696))
                            .frame(width: getRect().width - 10, height: 130, alignment: .center)
                            .background(.white)
                            .cornerRadius(12)
                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                            .offset(x: 5, y: -25)
                        
                    }
                }
            }
        }
    }
}

//struct BedDetailsShowView_Previews: PreviewProvider {
//    static var previews: some View {
//        BedDetailsShowView(showSheetPopup: .constant(false), getData: [], roomName: "")
//    }
//}
