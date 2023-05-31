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
    @State private var isEvent = false
    @State private var isEventsAll = false
    @State private var isProfile = false
    @State private var isEventDetails = false
    @State private var isofferView = false
    @State private var isBackEvent = false
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var showingAlert = false
    @State private var isBackDining = false
    @State private var isDiningView = false
    @State private var isBackLaundry = false
    @State private var isLaundryView = false
    @State private var isBackGym = false
    @State private var isGymView = false
    @State private var isBackSport = false
    @State private var isSportView = false
    @State private var isBackHeltcare = false
    @State private var isHeltcareView = false
    @State private var isBackHouseKeeping = false
    @State private var isHouseKeepingView = false
    @State private var isBackConvenience = false
    @State private var isConvenienceView = false
    @State private var isBackCoffee = false
    @State private var isCoffeeView = false
    @State private var RoomieId = ""
    @State private var AlertMessage = String()
    @StateObject private var ViewModel = StepViewModel()
    @EnvironmentObject var networkMonitor: NetworkMonitor
    
    @State private var scale = 1.0
    
    var EventScreen: String
    @Binding var newSelectedIndex: Int
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("Blank_Launch_Screen")
                    .resizable()
                    .scaledToFill()
                if EventScreen == ""{
                    Image("Upgrad_Logo_White")
                        .resizable()
                        .frame(width: 281, height: 40)
                }else{
                    LoadingView()
                }
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
                        destination: HomeViewTabBar(
                            isEvent: $isEvent,
                         isEventsAll: $isEventsAll,
                            isProfile: $isProfile,
                            isEventDetails: $isEventDetails,
                            RoomieId: $RoomieId,
                            NewSelectedIndex: $newSelectedIndex,
                            isofferView: $isofferView,
                            isBackEvent: $isBackEvent,
                            isBackDining: $isBackDining,
                            isDiningView: $isDiningView,
                            isBackLaundry: $isBackLaundry,
                            isLaundryView: $isLaundryView ,
                            isBackGym: $isBackGym,
                            isGymView: $isGymView,
                            isBackSport: $isBackSport,
                            isSportView: $isSportView,
                            isBackHeltcare: $isBackHeltcare,
                            isHeltcareView: $isHeltcareView,
                            isBackHouseKeeping: $isBackHouseKeeping,
                            isHouseKeepingView: $isHouseKeepingView,
                            isBackConvenience: $isBackConvenience,
                            isConvenienceView: $isConvenienceView,
                            isBackCoffee: $isBackCoffee,
                            isCoffeeView: $isCoffeeView
                        ).navigationBarHidden(true),
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
                VStack{
                    NavigationLink(
                        "",
                        destination: EventsBookingView(isToHome: true).navigationBarHidden(true),
                        isActive: $isEvent).isDetailLink(false)
                    NavigationLink(
                        "",
                        destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(0)).navigationBarHidden(true),
                        isActive: $isBackEvent).isDetailLink(false)
                    NavigationLink(
                        "",
                        destination: ProfileView(RoomieId: RoomieId).navigationBarHidden(true),
                        isActive: $isProfile).isDetailLink(false)
                    NavigationLink(
                        "",
                        destination: EventsBookingView(isToHome: true).navigationBarHidden(true),
                        isActive: $isEventDetails).isDetailLink(false)
                    NavigationLink(
                        "",
                        destination: HosterOfferView().navigationBarHidden(true),
                        isActive: $isofferView).isDetailLink(false)
                }
                VStack{ //services
                    NavigationLink(
                        "",
                        destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(1)).navigationBarHidden(true),
                        isActive: $isBackDining).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: ServiceDiningView(isBackDining: $isBackDining).navigationBarHidden(true),
                        isActive: $isDiningView).isDetailLink(false)
                    NavigationLink(
                        "",
                        destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(1)).navigationBarHidden(true),
                        isActive: $isBackLaundry).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: ServiceLaundryView(isBackLaundry: $isBackLaundry).navigationBarHidden(true),
                        isActive: $isLaundryView).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(1)).navigationBarHidden(true),
                        isActive: $isBackGym).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: ServiceGymView(isBackGym: $isBackGym).navigationBarHidden(true),
                        isActive: $isGymView).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(1)).navigationBarHidden(true),
                        isActive: $isBackSport).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: ServiceSportView(isBackSport: $isBackSport).navigationBarHidden(true),
                        isActive: $isSportView).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(1)).navigationBarHidden(true),
                        isActive: $isBackHeltcare).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: ServiceHelthCareView(isBackHeltcare: $isBackHeltcare).navigationBarHidden(true),
                        isActive: $isHeltcareView).isDetailLink(false)
                }
                VStack{
                    NavigationLink(
                        "",
                        destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(1)).navigationBarHidden(true),
                        isActive: $isBackHouseKeeping).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: ServiceHouseKeepingView(isBackHouseKeeping: $isBackHouseKeeping).navigationBarHidden(true),
                        isActive: $isHouseKeepingView).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(1)).navigationBarHidden(true),
                        isActive: $isBackConvenience).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: ServiceConvenienceView(isBackConvenience: $isBackConvenience).navigationBarHidden(true),
                        isActive: $isConvenienceView).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(1)).navigationBarHidden(true),
                        isActive: $isBackCoffee).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: ServiceCoffeeView(isBackCoffee: $isBackCoffee).navigationBarHidden(true),
                        isActive: $isCoffeeView).isDetailLink(false)
                }
                if ViewModel.isLoadingData{
                    LoadingView()
                }
            }
            .ignoresSafeArea()
            .onAppear{
                    if networkMonitor.isConnected{
                        showingAlert = false
                        ViewModel.fetchLoginDate(appId: studentAppID ?? "") { Step in
                            print("Step value = ", Step)
                            if Step.status == 1{
//                                if Step.data?.step == "0"{
//                                    isBookingProcess = true
//                                }else if Step.data?.step == "1"{
//                                    isSecurityDeposite = true
//                                }else if Step.data?.step == "2"{
//                                    isUploadDocument = true
//                                }else if Step.data?.step == "201"{
//                                    isSecuritySuccess = true
//                                }else if Step.data?.step == "3"{
//                                    isBookingView = true
//                                }else if Step.data?.step == "301"{
//                                    isStudentProfile = true
//                                }else if Step.data?.step == "4"{
//                                    isBookingSuccess = true
//                                }else if Step.data?.step == "5"{
//                                    isHomeView = true
//                                }
                                isHomeView = true
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
            .ignoresSafeArea()
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView(EventScreen: "", newSelectedIndex: .constant(0))
    }
}
