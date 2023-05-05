//
//  BedSuccesView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 04/05/23.
//

import SwiftUI

struct BedSuccesView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var isShowView = false
    @StateObject private var viewModel = BedSuccessViewModel()
    @State private var RoomName = ""
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    var body: some View {
        ZStack{
            VStack{
                if isShowView{
                    BedSuccessTopView()
                        .frame(height: 320)
                    VStack(alignment: .center) {
                        Text("Your room no. is \(RoomName)")
                            .foregroundColor(.white)
                            .font(.custom(OpenSans_Bold, size: 18))
                            .padding(8)
                            .frame(
                                width: UIScreen.main.bounds.width,
                                alignment: .center)
                            .background(Color(hex: 0xF36773))
                            .padding(.top, -12)
                    }
                    VStack(alignment: .leading, spacing: 12){
                        Text("Please note:")
                            .font(.custom(OpenSans_Bold, size: 16))
                            .foregroundColor(colorScheme == .light ? .black : .white)
                            .padding(.top)
                        Text("The upGrad Living Agreement will be sent to you by email which needs to be docusigned and sent back to us, post which you can make the payment towards your rent.")
                            .font(.custom(OpenSans_SemiBold, size: 16))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : .gray)
                    }
                    .padding(.leading)
                    Spacer()
                }
            }
            if viewModel.isLoadingData{
                LoadingView()
            }
        }
        .onAppear{
            if networkMonitor.isConnected{
                viewModel.getRoomDetails(appId: studentAppID ?? "") { getRoom in
                    if getRoom.status == 1{
                        RoomName = getRoom.data?.roomName ?? ""
                        isShowView = true
                    }else{
                        alertMessage = getRoom.msg ?? ""
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

struct BedSuccesView_Previews: PreviewProvider {
    static var previews: some View {
        BedSuccesView()
    }
}
