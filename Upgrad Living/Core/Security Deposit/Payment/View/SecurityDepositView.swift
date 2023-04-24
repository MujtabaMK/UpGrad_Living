//
//  SecurityDepositView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 04/04/23.
//

import SwiftUI

struct SecurityDepositView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var isPaymentSuccess = false
    @State private var isButtonClick = false
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                SecurityDepositTopView()
                    .frame(height: 320)
                VStack(alignment: .center) {
                    Text("Security Deposit: 50,000/-")
                        .foregroundColor(.white)
                        .font(.custom(OpenSans_Bold, size: 18))
                        .padding(8)
                        .frame(
                            width: UIScreen.main.bounds.width,
                            alignment: .center)
                        .background(Color(hex: 0xF36773))
                        .padding(.top, -12)
                }
                VStack(alignment: .leading) {
                    Text("Please note:")
                        .font(.custom(OpenSans_SemiBold, size: 18))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x000000) : .white)
                        .frame(alignment: .leading)
                        .padding(.top)
                        .padding(.leading)
                    SecurityDepositBottomView(textvalue: "This is an interest free security deposit")
                    SecurityDepositBottomView(textvalue: "The security deposit will be fully refunded only on completion of 11 month stay")
                    SecurityDepositBottomView(textvalue: "However, if you cancel your booking on or before 15th May 2023, this security deposit will be fully refunded")
                }
                NavigationLink(
                    "",
                    destination: DepositPaymentView().navigationBarHidden(true),
                    isActive: $isPaymentSuccess).isDetailLink(false)
                VStack(alignment: .center) {
                    DetailsViewBottom(textName: "Pay Now", imageName: "")
                        .padding()
                        .frame(alignment: .center)
                        .onTapGesture {
                            if networkMonitor.isConnected{
                                isButtonClick = true
                                isPaymentSuccess = true
                            }else{
                                alertMessage = "Please Check Your Internet Connection"
                                showingAlert = true
                            }
                        }
                        .shadow(
                            color: isButtonClick ? .gray : .clear,
                            radius: isButtonClick ? 10 : 0,
                            x: 0,
                            y: 0
                        )
                }
                .frame(width: UIScreen.main.bounds.width)
                Spacer(minLength: 0)
            }
            .alert(alertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    if AlertShow == "1"{
                        
                    }else{
                        isButtonClick = false
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct SecurityDepositView_Previews: PreviewProvider {
    static var previews: some View {
        SecurityDepositView()
    }
}
