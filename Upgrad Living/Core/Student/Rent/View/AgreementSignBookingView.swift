//
//  AgreementSignBookingView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 05/05/23.
//

import SwiftUI

struct AgreementSignBookingView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var studentUserID = UserDefaults.standard.string(forKey: "studentUserID")
    @State private var isRentView = false
    var body: some View {
        NavigationView {
            ZStack{
                VStack(alignment: .center){
                    Spacer()
                    Image("Agreegment_Bed_Success")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 167, height: 165)
                        .padding(.bottom, 20)
                    Text("Thank you for signing the \nagreement")
                        .font(.custom(OpenSans_Bold, size: 20))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                    Text("Please proceed to make the payment \ntowards rent")
                        .font(.custom(OpenSans_SemiBold, size: 14))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    DetailsViewBottom(textName: "Pay Rent")
                        .onTapGesture {
                            isRentView = true
                        }
                    NavigationLink(
                        "",
                        destination: RentView().navigationBarHidden(true),
                        isActive: $isRentView).isDetailLink(false)
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct AgreementSignBookingView_Previews: PreviewProvider {
    static var previews: some View {
        AgreementSignBookingView()
    }
}
