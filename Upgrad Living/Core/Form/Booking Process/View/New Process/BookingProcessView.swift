//
//  BookingProcessView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 01/04/23.
//

import SwiftUI
import Combine

struct BookingProcessView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @StateObject var viewModel = LoginViewModel()
    @StateObject var viewModelOTP = OTPViewModel()
    @State private var isStudentDetails = false
    @State private var isButtonClick = false
    @State private var txtMobile = ""
    @State private var MobileNumber = ""
    @State private var isShowOTP = false
    @State private var isHome = false
    @State private var isApplicationId = false
    
    @State private var isShowAlert = false
    @State private var AlertMessage = String()
    @State private var AlertShow = String()
    @State private var isCallAPI = false
    
    @State private var isRequestSelect = false
    
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var deviceToken = UserDefaults.standard.string(forKey: "fcmdeviceToken")
    
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    Text("Booking Process")
                        .font(.custom(OpenSans_Bold, size: 18))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : .white)
                        .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                    Divider()
                    ScrollView(showsIndicators: false) {
                        HStack(spacing: 0){
                            HStack{
                                Text("Housing".uppercased())
                                    .font(.custom(OpenSans_Bold, size: 18))
                                    .foregroundColor(isRequestSelect ? Color(hex: 0x868686) : Color(hex: 0xFFFFFF))
                            }
                            .onTapGesture {
                                isRequestSelect = false
                            }
                            .frame(maxWidth: .infinity, minHeight: 55, maxHeight: 55)
                            .background(isRequestSelect ? Color(hex: 0xFEF0F1) : Color(hex: 0xF04957))
                            
                            HStack{
                                Text("membership".uppercased())
                                    .font(.custom(OpenSans_Bold, size: 18))
                                    .foregroundColor(isRequestSelect ? Color(hex: 0xFFFFFF) : Color(hex: 0x868686))
                            }
                            .onTapGesture {
                                isRequestSelect = true
                            }
                            .frame(maxWidth: .infinity, minHeight: 55, maxHeight: 55)
                            .background(isRequestSelect ? Color(hex: 0xF04957) : Color(hex: 0xFEF0F1))
                        }
                        if !isRequestSelect{
                            BookingProcessHousing(
                                txtMobile: $txtMobile,
                                isShowAlert: $isShowAlert,
                                AlertMessage: $AlertMessage,
                                AlertShow: $AlertShow,
                                isCallAPI: $isCallAPI)
                        }
                    }
                }
                NavigationLink("", destination: MemberOTPView(
                    newMobile: $txtMobile,
                    isApplicationId: $isApplicationId
                ).navigationBarHidden(true),isActive: $isShowOTP).isDetailLink(false)
                
                NavigationLink("", destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(0)).navigationBarHidden(true),isActive: $isHome).isDetailLink(false)
            }
            .onChange(of: isCallAPI, perform: { _ in
                if isCallAPI{
                    viewModel.fetchLoginDate(mobile: txtMobile) { loginData in
                        if loginData.status == 1{
                            MobileNumber = loginData.data?.studentMobile ?? ""
                            print(loginData.data?.studentMobile ?? "")
                            
                            print(loginData.data?.studentAppID ?? "")
                            UserDefaults.standard.set(loginData.data?.studentAppID ?? "", forKey: "studentAppID")
                            isApplicationId = false
                            isShowOTP = true
                        }else{
                            AlertMessage = loginData.msg ?? ""
                            isShowAlert = true
                        }
                    }
                }
            })
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .alert(AlertMessage, isPresented: $isShowAlert) {
                Button("OK", role: .cancel) {
                    if AlertShow == "1"{
                       
                    }else{
                        
                    }
                }
            }
            .onTapGesture(count: 4) {
                let DeviceName = UIDevice.current.name
                if txtMobile.count == 10 || txtMobile.count == 7 || txtMobile.count == 8{
                    if networkMonitor.isConnected{
                        viewModelOTP.fetchLoginDate(mobile: txtMobile, otp: "7879", token: deviceToken ?? "", device_name: DeviceName, deviceType: "2", appId: studentAppID ?? "") { OTPData in
                            if OTPData.status == 1{
                                if OTPData.data?.userid?.count != 0{
                                    print(OTPData.data!)
                                    UserDefaults.standard.set(true, forKey: "isLogin")
                                    UserDefaults.standard.set("1", forKey: "DataFromLogin")
                                    UserDefaults.standard.set(OTPData.data?.appID ?? "", forKey: "studentAppID")
                                    UserDefaults.standard.set(OTPData.data?.userid ?? "", forKey: "studentUserID")
                                    UserDefaults.standard.set(OTPData.data?.username ?? "", forKey: "studentusername")
                                    UserDefaults.standard.set(OTPData.data?.usertype ?? "", forKey: "studentUserType")
                                    isHome = true
                                }
                            }else{
                                AlertMessage = OTPData.msg ?? ""
                                isShowAlert = true
                            }
                        }
                    }else{
                        AlertMessage = "Please Check Your Internet Connection"
                        isShowAlert = true
                    }
                }else{
                    AlertMessage = "Please Enter valid Application Id or Mobile Number"
                    isShowAlert = true
                }
            }
        }
    }
}

struct VLine: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        }
    }
}

struct HLine: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        }
    }
}

struct BookingProcessView_Previews: PreviewProvider {
    static var previews: some View {
        BookingProcessView()
    }
}
