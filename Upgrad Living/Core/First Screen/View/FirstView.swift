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
    @State private var isSecuritySuccess = false
    @State private var isUploadDocument = false
    @State private var isStudentProfile = false
    @State private var isHomeView = false
    @State private var isBookingView = false
    @State private var isBookingSuccess = false
    @State private var isBedAgreementShow = false
    @State private var isRentSuccess = false
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
                    NavigationLink(
                        "",
                        destination: SecurityDepositSuccess().navigationBarHidden(true),
                        isActive: $isSecuritySuccess).isDetailLink(false)
                    NavigationLink(
                        "",
                        destination: UploadDocumentsView(isBackButtonShow: .constant(false)).navigationBarHidden(true),
                        isActive: $isUploadDocument).isDetailLink(false)
                    NavigationLink(
                        "",
                        destination: StudentProfileView(isBackButtonShow: .constant(false)).navigationBarHidden(true),
                        isActive: $isStudentProfile).isDetailLink(false)
                    NavigationLink(
                        "",
                        destination: HomeViewTabBar().navigationBarHidden(true),
                        isActive: $isHomeView).isDetailLink(false)
                    NavigationLink(
                        "",
                        destination: BookingView().navigationBarHidden(true),
                        isActive: $isBookingView).isDetailLink(false)
                    NavigationLink(
                        "",
                        destination: BedSuccesView().navigationBarHidden(true),
                        isActive: $isBookingSuccess).isDetailLink(false)
                    NavigationLink(
                        "",
                        destination: AgreementSignBookingView().navigationBarHidden(true),
                        isActive: $isBedAgreementShow).isDetailLink(false)
                    NavigationLink(
                        "",
                        destination: RentViewSuccess().navigationBarHidden(true),
                        isActive: $isRentSuccess).isDetailLink(false)
                }
            }
            .ignoresSafeArea()
            .onAppear{
                if networkMonitor.isConnected{
                    showingAlert = false
                    ViewModel.fetchLoginDate(appId: studentAppID ?? "") { Step in
                        print("Step value = ", Step)
                        if Step.status == 1{
                            if Step.data?.step == "0"{
                                isBookingProcess = true
                            }else if Step.data?.step == "1"{
                                isSecurityDeposite = true
                            }else if Step.data?.step == "2"{
                                isUploadDocument = true
                            }else if Step.data?.step == "201"{
                                isSecuritySuccess = true
                            }else if Step.data?.step == "3"{
                                isBookingView = true
                            }else if Step.data?.step == "301"{
                                isStudentProfile = true
                            }else if Step.data?.step == "4"{
                                isBookingSuccess = true
                            }
                           // isBedAgreementShow = true
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
