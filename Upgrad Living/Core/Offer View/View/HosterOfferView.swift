//
//  HosterOfferView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 29/05/23.
//

import SwiftUI
import Kingfisher

struct HosterOfferView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @StateObject private var viewModel = OfferViewModel()
    
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var arrOffer = [HostelOffer]()
    
    @State private var isHome = false
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView(showsIndicators: false) {
                    VStack{
                        HStack{
                            Image("back_Button")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding(.leading, 30)
                                .onTapGesture {
                                    withAnimation() {
                                        isHome = true
                                    }
                                }
                            Spacer(minLength: 0)
                            Text("Deals & Offers")
                                .font(.custom(OpenSans_SemiBold, size: 18))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x000000) : .white)
                                .padding(.trailing, 30)
                            Spacer(minLength: 0)
                        }
                        .padding(.trailing)
                        .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                        Divider()
                        
                        ForEach(arrOffer) { deals in
                            VStack{
                                AllHomeOfferCell(Deals: deals)
                            }
                            .frame(width: getRect().width - 20, height: 115)
                            .background(.white)
                            .cornerRadius(15)
                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                            .padding(.vertical, 5)
                        }

                        NavigationLink(
                            "",
                            destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(0)).navigationBarHidden(true),
                            isActive: $isHome).isDetailLink(false)
                        
                    }
                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .onAppear{
                if networkMonitor.isConnected{
                    viewModel.getHostelOffer(appId: studentAppID ?? "") { offer in
                        if offer.status == 1{
                            arrOffer = offer.data ?? []
                        }else{
                            alertMessage = offer.msg ?? ""
                            AlertShow = "0"
                            showingAlert = true
                        }
                    }
                }else{
                    alertMessage = "Please Check Your Internet Connection"
                    AlertShow = "0"
                    showingAlert = true
                }
            }
            .alert(alertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    if AlertShow == "1"{
                        
                    }else{
                        
                    }
                }
            }
        }
    }
}

struct HosterOfferView_Previews: PreviewProvider {
    static var previews: some View {
        HosterOfferView()
    }
}
