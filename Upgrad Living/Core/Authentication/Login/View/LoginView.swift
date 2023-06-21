//
//  LoginView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 23/03/23.
//

import SwiftUI
import Combine

struct LoginView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var txtMobile = ""
    @State private var MobileNumber = ""
    @State private var isShowOTP = false
    @State private var isShowAlert = false
    @State private var isApplicationId = false
    
    @State private var showingAlert = false
    @State private var AlertMessage = String()
    @State private var AlertShow = String()
    
    @StateObject var viewModel = LoginViewModel()
    @StateObject var viewModelOTP = OTPViewModel()
    @StateObject private var stepViewModel = StepViewModel()
    @EnvironmentObject var networkMonitor: NetworkMonitor
    
    @State private var loginDict = [String: Any?]()
    //
    @State private var isBookingProcess = false
    @State private var isSecurityDeposite = false
    @State private var isSecuritySuccess = false
    @State private var isUploadDocument = false
    @State private var isStudentProfile = false
    @State private var isHomeView = false
    @State private var isBookingView = false
    @State private var isBookingSuccess = false
    
    @State private var isSelectedIndex = 3
    
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var deviceToken = UserDefaults.standard.string(forKey: "fcmdeviceToken")    
    
    var body: some View {
        NavigationView{
            ZStack{
                LoginTopView()
                VStack{
                    Image("Upgrad_Login_Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 181, height: 32)
                        .padding()
                        .padding(.top, 8)
                        .padding(.bottom)
                    VStack(alignment: .center, spacing: 4){
                        Text("Enter Your")
                            .font(.custom(OpenSans_Regular, size: 14))
                            .foregroundColor(Color(hex: 0x868686, alpha: 1.0))
//                        +
//                        Text(" ATLAS Application ID")
//                            .font(.custom(OpenSans_SemiBold, size: 14))
//                            .foregroundColor(Color(hex: 0x333333))
//
//                        Text(" (OR) ")
//                            .font(.custom(OpenSans_Regular, size: 14))
//                            .foregroundColor(Color(hex: 0x868686, alpha: 1.0))
//
//                        Text("your ")
//                            .font(.custom(OpenSans_Regular, size: 14))
//                            .foregroundColor(Color(hex: 0x868686, alpha: 1.0))
                        //+
                        Text("Registered Mobile Number")
                            .font(.custom(OpenSans_Bold, size: 14))
                            .foregroundColor(Color(hex: 0x333333))
                    }
                    .padding(.horizontal)
                                        
                    VStack(alignment: .center){
                        HStack{
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 4, height: 40)
                            TextField("", text: $txtMobile)
                                .keyboardType(.phonePad)
                                .disableAutocorrection(true)
                                .multilineTextAlignment(.leading)
                                .frame(height: 40)
                                .cornerRadius(4)
                                .foregroundColor(.black)
                                .toolbar {
                                    ToolbarItemGroup(placement: .keyboard) {
                                        Spacer()
                                        Button("Done") {
                                            hideKeyboard()
                                        }
                                    }
                                }
                                .onChange(of: txtMobile, perform: { newValue in
                                    if(newValue.range(of:"^[0-9+]{0,1}+[0-9]{5,10}$", options: .regularExpression) != nil) {
                                        
                                    } else {
                                        
                                    }
                                })
                                .onReceive(Just(txtMobile)) { newValue in
                                    if txtMobile.count > 10 {
                                        txtMobile = String(txtMobile.prefix(10))
                                    }
                                }
                        }
                        .overlay(
                            RoundedRectangle(
                                cornerRadius: 4).strokeBorder(Color(hex: 0x969696),
                                                              style: StrokeStyle(lineWidth: 0.5))
                        )
                        .background(colorScheme == .light ? .white : .white)
                    }
                    
                    HStack{
                        Spacer()
                        VStack {
                            Button {
                                
                            } label: {
                                Text("Not Registered yet! ")
                                    .font(.custom(OpenSans_SemiBold, size: 12))
                                    .foregroundColor(Color(hex: 0x969696))
                                
                                +
                                
                                Text(" Please Register")
                                    .font(.custom(OpenSans_SemiBold, size: 12))
                                    .foregroundColor(Color(hex: 0xB90F1D))
                                    .underline()
                            }
                        }
                    }
                    
                    VStack{
                        Button {
                            if txtMobile.count == 10 || txtMobile.count == 7 || txtMobile.count == 8{
                                if networkMonitor.isConnected{
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
                                }else{
                                    AlertMessage = "Please Check Your Internet Connection"
                                    isShowAlert = true
                                }
                            }else{
                                AlertMessage = "Please Enter valid Application Id or Mobile Number"
                                isShowAlert = true
                            }
                        } label: {
                            Text("Get OTP")
                                .frame(width: 250, alignment: .center)
                                .font(.custom(OpenSans_SemiBold, size: 14))
                                .padding()
                                .foregroundColor(.white)
                                .background(
                                    LinearGradient(
                                        colors: [Color(hex: 0xEE2C3C),
                                                 Color(hex: 0xB20710)],
                                        startPoint: .leading,
                                        endPoint: .trailing))
                                .clipShape(Capsule())
                                .alert(AlertMessage, isPresented: $isShowAlert) {
                                    Button("OK", role: .cancel) { }
                                }
                            NavigationLink(
                                "",
                                destination: OTPView(
                                    newMobile: $MobileNumber,
                                    isApplicationId: $isApplicationId
                                ).navigationBarHidden(true),
                                isActive: $isShowOTP).isDetailLink(false)
                        }
                    }
                    .padding(.bottom, 20)
                    
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
                            destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(0)).navigationBarHidden(true),
                            isActive: $isHomeView).isDetailLink(false)
                        NavigationLink(
                            "",
                            destination: BookingView().navigationBarHidden(true),
                            isActive: $isBookingView).isDetailLink(false)
                        NavigationLink(
                            "",
                            destination: BedSuccesView().navigationBarHidden(true),
                            isActive: $isBookingSuccess).isDetailLink(false)
                    }
                    .frame(height: 0)
                }
                .frame(width: UIScreen.main.bounds.width - 50)
                .background(colorScheme == .light ? .white : Color(hex: 0xFEEEF0, alpha: 1.0))
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(colorScheme == .light ? .white : Color(hex: 0xFEEEF0, alpha: 1.0))
                        .shadow(color: .gray, radius: 10, x: 0, y: 0)
                )
                if viewModel.isLoadingData{
                    LoadingView()
                }
            }
            .onTapGesture(count: 4, perform: {
                if txtMobile.count == 10{
                    if networkMonitor.isConnected{
                        let DeviceName = UIDevice.current.name
                        
                        viewModelOTP.fetchLoginDate(mobile: txtMobile, otp: "7879", token: deviceToken ?? "", device_name: DeviceName, deviceType: "2", appId: "") { OTPData in
                            if OTPData.status == 1{
                                if OTPData.data?.userid?.count != 0{
                                    saveLoginOTPData(dict: OTPData.data!) { returnvalue in
                                        print("DEBUG: School Name = ",returnvalue.school ?? "")
                                    }
                                    UserDefaults.standard.set(true, forKey: "isLogin")
                                    UserDefaults.standard.set(OTPData.data?.userid ?? "", forKey: "studentUserID")
                                    UserDefaults.standard.set(OTPData.data?.username ?? "", forKey: "studentusername")
                                    UserDefaults.standard.set(OTPData.data?.appID ?? "", forKey: "studentAppID")
                                    
                                    stepViewModel.fetchLoginDate(appId: OTPData.data?.appID ?? "") { Step in
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
                                        }else{
                                            isBookingView = true
                                        }
                                    }
                                }
                            }else{
                                AlertMessage = OTPData.msg ?? ""
                                AlertShow = "0"
                                showingAlert = true
                            }
                        }
                    }else{
                        AlertMessage = "Please Check Your Internet Connection"
                        AlertShow = "0"
                        showingAlert = true
                    }
                }else{
                    AlertMessage = "Please enter 10 digit mobile number"
                    AlertShow = "0"
                    showingAlert = true
                }
            })
            .background(colorScheme == .light ? .white : Color(hex: 0xD24752))
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .alert(AlertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    if AlertShow == "1"{
                       
                    }else{
                        
                    }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
