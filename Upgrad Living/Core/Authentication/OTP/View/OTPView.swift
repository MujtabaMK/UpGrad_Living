//
//  OTPView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 23/03/23.
//

import SwiftUI
import Combine

struct OTPView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var OTP1 = ""
    @State private var OTP2 = ""
    @State private var OTP3 = ""
    @State private var OTP4 = ""
    @FocusState private var loginFieldFocus: LogInField?
    @State private var isBookingView = false
    @State private var Last4DigitMobileNumber = ""
    @Binding var newMobile: String
    @Binding var isApplicationId: Bool
    @Environment(\.presentationMode) var presentaionMode
    @State private var showingAlert = false
    @State private var AlertMessage = String()
    @StateObject var viewModel = OTPViewModel()
    @StateObject private var loginViewModel = LoginViewModel()
    @StateObject private var stepViewModel = StepViewModel()
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var loginDict = [String: Any?]()
    @State private var isSecurityDeposite = false
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    var body: some View {
        NavigationView{
            ZStack{
                LoginTopView()
                VStack{
                    HStack(alignment: .top){
                        Button {
                            presentaionMode.wrappedValue.dismiss()
                        } label: {
                            Image("back_button")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                        Spacer(minLength: 0)
                    }
                    .padding(.leading)
                    .padding(.top, 30)
                    Spacer()
                    
                    VStack{
                        Image("Upgrad_Login_Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 181, height: 32)
                            .padding()
                            .padding(.top, 8)
                            .padding(.bottom)
                        VStack(alignment: .center){
                            Text("Verify your Application ID/ Mobile No. ")
                                .font(.custom(OpenSans_SemiBold, size: 14))
                                .foregroundColor(Color(hex: 0x333333))
                                .padding(.bottom, 4)
                            Text("We’ve sent the verification code to your mobile number")
                                .font(.custom(OpenSans_Regular, size: 14))
                                .foregroundColor(Color(hex: 0x868686, alpha: 1.0))
                            +
                            Text(" \(Last4DigitMobileNumber)")
                                .font(.custom(OpenSans_SemiBold, size: 14))
                                .foregroundColor(Color(hex: 0x333333))
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .center){
                            HStack{
                                OTPViewTextField(text: $OTP1)
                                    .focused($loginFieldFocus, equals: .otp1)
                                    .onChange(of: OTP1, perform: { newValue in
                                        if !OTP1.isEmpty{
                                            loginFieldFocus = .otp2
                                        }
                                    })
                                    .toolbar {
                                        ToolbarItemGroup(placement: .keyboard) {
                                            Spacer()
                                            Button("Done") {
                                                hideKeyboard()
                                            }
                                        }
                                    }
                                
                                OTPViewTextField(text: $OTP2)
                                    .focused($loginFieldFocus, equals: .otp2)
                                    .onChange(of: OTP2, perform: { newValue in
                                        if !OTP2.isEmpty{
                                            loginFieldFocus = .otp3
                                        }else{
                                            loginFieldFocus = .otp1
                                        }
                                    })
                                
                                OTPViewTextField(text: $OTP3)
                                    .focused($loginFieldFocus, equals: .otp3)
                                    .onChange(of: OTP3, perform: { newValue in
                                        if !OTP3.isEmpty{
                                            loginFieldFocus = .otp4
                                        }else{
                                            loginFieldFocus = .otp2
                                        }
                                    })
                                
                                OTPViewTextField(text: $OTP4)
                                    .focused($loginFieldFocus, equals: .otp4)
                                    .onChange(of: OTP4, perform: { newValue in
                                        if !OTP4.isEmpty{
                                            hideKeyboard()
                                        }else{
                                            loginFieldFocus = .otp3
                                        }
                                    })
                            }
                        }
                        .padding(1)
                        VStack {
                            HStack{
                                Spacer()
                                Button {
                                    loginViewModel.fetchLoginDate(mobile: newMobile) { loginData in
                                        if loginData.status == 1{
                                            
                                        }
                                    }
                                } label: {
                                    Text("Didn’t receive code?")
                                        .font(.custom(OpenSans_Regular, size: 12))
                                        .foregroundColor(Color(hex: 0x868686, alpha: 1.0))
                                    +
                                    Text(" Resend OTP")
                                        .font(.custom(OpenSans_SemiBold, size: 12))
                                        .foregroundColor(Color(hex: 0x333333))
                                }
                            }
                        }
                        .frame(alignment: .trailing)
                        VStack(alignment: .center){
                            Button {
                                let MobileOTP = OTP1 + OTP2 + OTP3 + OTP4
                                if MobileOTP.count == 4{
                                    if networkMonitor.isConnected{
                                        viewModel.fetchLoginDate(mobile: newMobile, otp: MobileOTP) { OTPData in
                                            if OTPData.status == 1{
                                                if OTPData.data?.userid?.count != 0{
                                                    saveLoginOTPData(dict: OTPData.data!) { returnvalue in
                                                        print("DEBUG: School Name = ",returnvalue.school ?? "")
                                                    }
                                                    //                                                loginDict = getLoginOTPData(dict: OTPData.data!)
                                                    UserDefaults.standard.set(true, forKey: "isLogin")
                                                    stepViewModel.fetchLoginDate(appId: studentAppID ?? "") { Step in
                                                        if Step.status == 1{
                                                            if Step.data?.step == "0"{
                                                                isBookingView = true
                                                            }else if Step.data?.step == "1"{
                                                                isSecurityDeposite = true
                                                            }
                                                        }else{
                                                            isBookingView = true
                                                        }
                                                    }
                                                }
                                            }else{
                                                AlertMessage = OTPData.msg ?? ""
                                                showingAlert = true
                                            }
                                        }
                                    }else{
                                        AlertMessage = "Please Check Your Internet Connection"
                                        showingAlert = true
                                    }
                                }
                            } label: {
                                Text("Verify")
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
                                    .alert(AlertMessage, isPresented: $showingAlert) {
                                        Button("OK", role: .cancel) { }
                                    }
                            }
                        }
                        .padding(.bottom, 20)
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width - 60)
                    .background(colorScheme == .light ? .white : Color(hex: 0xFEEEF0, alpha: 1.0))
                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(colorScheme == .light ? .white : Color(hex: 0xFEEEF0, alpha: 1.0))
                            .shadow(color: .gray, radius: 10, x: 0, y: 0)
                    )
                    Spacer()
                    NavigationLink("", destination: BookingProcessView().navigationBarHidden(true),isActive: $isBookingView).isDetailLink(false)
                    NavigationLink(
                        "",
                        destination: SecurityDepositView().navigationBarHidden(true),
                        isActive: $isSecurityDeposite).isDetailLink(false)
                }
                .onAppear{
                    let lastDigit = Last4dight(MobileNumber: newMobile)
                    Last4DigitMobileNumber = isApplicationId ?  "***\(lastDigit)" : "+91***\(lastDigit)"
                    print(Last4DigitMobileNumber)
                    
                }
                if viewModel.isLoadingData{
                    LoadingView()
                }
                if loginViewModel.isLoadingData{
                    LoadingView()
                }
            }
            .background(colorScheme == .light ? .white : Color(hex: 0xD24752))
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
        .onAppear{
            let lastDigit = Last4dight(MobileNumber: newMobile)
            Last4DigitMobileNumber = isApplicationId ?  "***\(lastDigit)" : "+91***\(lastDigit)"
            print(Last4DigitMobileNumber)
            
        }
    }
    func Last4dight(MobileNumber: String) -> String{
        let MobileNumberLast4 = MobileNumber.suffix(4)
        return String(MobileNumberLast4)
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView(newMobile: .constant(""), isApplicationId: .constant(false))
    }
}

