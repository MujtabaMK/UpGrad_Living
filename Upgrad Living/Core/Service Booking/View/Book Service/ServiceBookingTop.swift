//
//  ServiceBookingTop.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 26/06/23.
//

import SwiftUI

struct ServiceBookingTop: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var isBackServiceBooking: Bool
    
    var body: some View {
        ZStack(alignment: .top){
            Image("Home_Top_Background")
                .resizable()
                .scaledToFit()
                .frame(width: getRect().width, height: 290)
                .padding(.top, -90)
            VStack{
                HStack{
                    Button {
                        isBackServiceBooking = true
                    } label: {
                        Image("back_Button")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.leading, 20)
                    }
                    Spacer(minLength: 0)
                    Text("Service Booking")
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
