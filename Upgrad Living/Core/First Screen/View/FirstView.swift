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
    @AppStorage("SendPageTo") private var SendPageTo = ""
    @AppStorage("studentUserType") private var studentUserType = ""
    @AppStorage("DataFromLogin") private var DataFromLogin = ""
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
    @State private var isBackNotification = false
    @State private var isNotification = false
    
    @State private var isBackCommunity = false
    @State private var isCommunityView = false
    
    @State private var isBackUserProfile = false
    @State private var isUserProfile = false
    @State private var isLogout = false
    
    @State private var isBackGuestRoom = false
    @State private var isGuestRoom = false
    
    @State private var isBackRequestApproval = false
    @State private var isRequestApproval = false
    
    @State private var isBackServiceBooking = false
    @State private var isServiceBooking = false
    
    //Parent...
    @State private var isParentHome = false
        
    //Admin
    @State private var isAdminView = false
    
    @State private var RoomieId = ""
    @State private var AlertMessage = String()
    @StateObject private var ViewModel = StepViewModel()
    @EnvironmentObject var networkMonitor: NetworkMonitor
    
    @State private var scale = 1.0
    
    var EventScreen: String
    @Binding var newSelectedIndex: Int
    
    
    @ObservedObject var appState = AppState.shared
    @State var navigate = false
    
//    var pushNavigationBinding : Binding<Bool> {
//           .init { () -> Bool in
//               appState.pageToNavigationTo != nil
//           } set: { (newValue) in
//               if !newValue { appState.pageToNavigationTo = nil }
//           }
//       }
    
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
                        destination: StudentDetailsFirstView().navigationBarHidden(true),
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
                            isCoffeeView: $isCoffeeView,
                            isBackCommunity: $isBackCommunity,
                            isCommunityView: $isCommunityView,
                            isBackUserProfile: $isBackUserProfile,
                            isUserProfile: $isUserProfile,
                            isBackisNotification: $isBackNotification,
                            isNotification: $isNotification,
                            isBackGuestRoom: $isBackGuestRoom,
                            isGuestRoom: $isGuestRoom,
                            isBackRequestApproval: $isBackRequestApproval,
                            isRequestApproval: $isRequestApproval,
                            isBackServiceBooking: $isBackServiceBooking,
                            isServiceBooking: $isServiceBooking
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
                   
                }
                VStack{
                    NavigationLink(
                        "",
                        destination: RentViewSuccess().navigationBarHidden(true),
                        isActive: $isRentSuccess).isDetailLink(false)
                    
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
                    
                    NavigationLink(
                        "",
                        destination: LoginView().navigationBarHidden(true),
                        isActive: $isLogout).isDetailLink(false)
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
                }
                VStack{
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
                    
                    NavigationLink(
                        "",
                        destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(2)).navigationBarHidden(true),
                        isActive: $isBackCommunity).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: CommunityDetailsView(isCommunityBack: $isBackCommunity).navigationBarHidden(true),
                        isActive: $isCommunityView).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(0)).navigationBarHidden(true),
                        isActive: $isBackUserProfile).isDetailLink(false)
                 
                }
                VStack{
                    NavigationLink(
                        "",
                        destination: UserProfile(isBackUserProfile: $isBackUserProfile, isLogout: $isLogout).navigationBarHidden(true),
                        isActive: $isUserProfile).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(0)).navigationBarHidden(true),
                        isActive: $isBackNotification).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: NotificationView(isBackNotification: $isBackNotification).navigationBarHidden(true),
                        isActive: $isNotification).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(0)).navigationBarHidden(true),
                        isActive: $isBackGuestRoom).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: BookGuestRoom(isBackGuestRoom: $isBackGuestRoom).navigationBarHidden(true),
                        isActive: $isGuestRoom).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(0)).navigationBarHidden(true),
                        isActive: $isBackRequestApproval).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: RequestApprovalView(isBackRequestApproval: $isBackRequestApproval).navigationBarHidden(true),
                        isActive: $isRequestApproval).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: ServiceBooking(isBackServiceBooking: $isBackServiceBooking).navigationBarHidden(true),
                        isActive: $isServiceBooking).isDetailLink(false)
                    
                    NavigationLink(
                        "",
                        destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(0)).navigationBarHidden(true),
                        isActive: $isBackServiceBooking).isDetailLink(false)
                    
//                    if navigate{
//                        if SendPageTo == "1"{
//                            NavigationLink(
//                                "",
//                                destination: ServiceSportView(isBackSport: $isBackSport).navigationBarHidden(true),
//                                isActive: .constant(true)).isDetailLink(false)
//                        }else if SendPageTo == "2"{
//                            NavigationLink(
//                                "",
//                                destination: NotificationView(isBackNotification: $isBackNotification).navigationBarHidden(true),
//                                isActive: .constant(true)).isDetailLink(false)
//                        }
//                    }
                }
                VStack{//Parent
                        
                    NavigationLink(
                        "",
                        destination: ParentFirstView(
                            EventScreen: "",
                            newSelectedIndex: $newSelectedIndex
                        ).navigationBarHidden(true),
                        isActive: $isParentHome).isDetailLink(false)
                    
                    //Admin...
                    
                    NavigationLink(
                        "",
                        destination: AdminFirstView(
                            EventScreen: "",
                            newSelectedIndex: $newSelectedIndex
                        ).navigationBarHidden(true),
                        isActive: $isAdminView).isDetailLink(false)
                    
                }
                if ViewModel.isLoadingData{
                    LoadingView()
                }
            }
            .onReceive(appState.$pageToNavigationTo) { (nav) in
                if nav != nil {
                    navigate = true
                }
            }
            .onAppear{
                if DataFromLogin == "2"{
                    if studentUserType == "1"{
                        isAdminView = true
                    }else if studentUserType == "2"{
                        isParentHome = true
                    }else if studentUserType == "3"{
                        isHomeView = true
                    }
                }else{
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
                                }else if Step.data?.step == "5"{
                                    isHomeView = true
                                }
                               // isHomeView = true
                                //isParentHome = true
                            }else{
                                isBookingProcess = true
                            }
                        }
                    }else{
                        AlertMessage = "Please Check Your Internet Connection"
                        showingAlert = true
                    }
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
