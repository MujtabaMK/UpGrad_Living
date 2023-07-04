//
//  BookGuestRoomView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 10/06/23.
//

import SwiftUI

struct BookGuestRoomView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var viewModel = GetGuestViewModel()
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    @State private var arrGuestInfo = [GetGuest]()
    @State private var refrenceID = ""
    
    @State private var isGuestRoomDetails = false
    
    
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
                                        presentationMode.wrappedValue.dismiss()
                                    }
                                }
                            Spacer(minLength: 0)
                            Text("Booking Confirmation")
                                .font(.custom(OpenSans_Bold, size: 18))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x000000) : .white)
                                .padding(.trailing, 30)
                            Spacer(minLength: 0)
                        }
                        .padding(.trailing)
                        .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                        Divider()
                        
                        VStack(spacing: 15){
                            ForEach(arrGuestInfo) { info in
                                BookGuestRoomCell(arrguest: info)
                                    .onTapGesture {
                                        refrenceID = info.id ?? ""
                                        isGuestRoomDetails = true
                                    }
                            }
                        }
                        .padding(.top)
                        .padding(.bottom)
                        
                        NavigationLink(
                            "",
                            destination: ConfirmedGuestRoom(refrenceID: refrenceID).navigationBarHidden(true),
                            isActive: $isGuestRoomDetails).isDetailLink(false)
                    }
                }
                if viewModel.isLoadingData{
                    LoadingView()
                }
            }
            .navigationBarHidden(true)
            .ignoresSafeArea()
            .onAppear{
                if networkMonitor.isConnected{
                    viewModel.getGuestInfo(appId: studentAppID ?? "") { guestInfo in
                        if guestInfo.status == 1{
                            arrGuestInfo = guestInfo.data ?? []
                        }else{
                            alertMessage = guestInfo.msg ?? ""
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

struct BookGuestRoomView_Previews: PreviewProvider {
    static var previews: some View {
        BookGuestRoomView()
    }
}
