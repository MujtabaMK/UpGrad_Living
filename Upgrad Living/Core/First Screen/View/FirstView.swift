//
//  FirstView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 05/04/23.
//

import SwiftUI

struct FirstView: View {
    @State private var isBookingProcess = false
    @State private var isSecurityDeposite = false
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var showingAlert = false
    @State private var AlertMessage = String()
    @StateObject private var ViewModel = StepViewModel()
    @EnvironmentObject var networkMonitor: NetworkMonitor
    var body: some View {
        NavigationView {
            ZStack{
                Image("Flash_Screen")
                    .resizable()
                    .scaledToFill()
                VStack{
                    NavigationLink(
                        "",
                        destination: BookingProcessView().navigationBarHidden(true),
                        isActive: $isBookingProcess).isDetailLink(false)
                    NavigationLink(
                        "",
                        destination: SecurityDepositView().navigationBarHidden(true),
                        isActive: $isSecurityDeposite).isDetailLink(false)
                }
            }
            .ignoresSafeArea()
            .onAppear{
                if networkMonitor.isConnected{
                    showingAlert = false
                    ViewModel.fetchLoginDate(appId: studentAppID ?? "") { Step in
                        print("Step value = ", Step)
                        if Step.status == 1{
//                            if Step.data?.step == "0"{
//                                isBookingProcess = true
//                            }else if Step.data?.step == "1"{
//                                isSecurityDeposite = true
//                            }
                            isSecurityDeposite = true
                        }else{
                            isBookingProcess = true
                        }
                    }
                }else{
                    AlertMessage = "Please Check Your Internet Connection"
                    showingAlert = true
                }
            }
            .alert(AlertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
            .navigationBarHidden(true)
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
