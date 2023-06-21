//
//  ServiceView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 29/05/23.
//

import SwiftUI
import WaterfallGrid

struct ServiceView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var isBackDining: Bool
    @Binding var isDiningView: Bool
    @Binding var isBackLaundray: Bool
    @Binding var isLaundryView: Bool
    @Binding var isGymView: Bool
    @Binding var isSportView: Bool
    @Binding var isHeltcareView: Bool
    @Binding var isHouseKeepingView: Bool
    @Binding var isConvenienceView: Bool
    @Binding var isCoffeeView: Bool
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    HStack{
                        Spacer(minLength: 0)
                        Text("Services")
                            .font(.custom(OpenSans_SemiBold, size: 18))
                            .foregroundColor(colorScheme == .light ? .black : .white)
                            .padding(.trailing, 30)
                        Spacer(minLength: 0)
                    }
                    .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                    Divider()
                    Text("A plethora of amenities to cater to the diverse needs of our students!")
                        .font(.custom(OpenSans_Bold, size: 18))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                    
                    WaterfallGrid(Array(arrServce.enumerated()), id: \.offset){ indexvalue,value in
                        Button {
                            if indexvalue == 0{
                                isDiningView = true
                            }else if indexvalue == 1{
                                isLaundryView = true
                            }else if indexvalue == 2{
                                isGymView = true
                            }else if indexvalue == 3{
                                isSportView = true
                            }else if indexvalue == 4{
                                isHeltcareView = true
                            }else if indexvalue == 5{
                                isHouseKeepingView = true
                            }else if indexvalue == 6{
                                isConvenienceView = true
                            }else if indexvalue == 7{
                                isCoffeeView = true
                            }
                        } label: {
                            Image(value.NewImageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    .gridStyle(
                        columnsInPortrait: 2,
                        columnsInLandscape: 2,
                        spacing: 8,
                        animation: .easeInOut(duration: 0.5)
                    )
                    .scrollOptions(direction: .vertical)
                    .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                    .padding(.bottom, 30)
                }
            }
            .padding(.bottom, 50)
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }
}
