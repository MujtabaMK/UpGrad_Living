//
//  LoginView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 23/03/23.
//

import SwiftUI
import Combine

struct LoginView: View {
    @State private var txtMobile = ""
    @State private var isShowOTP = false
    @State private var isShowAlert = false
    @State private var isApplicationId = false
    @State private var showingAlert = false
    @State private var AlertMessage = String()
    @StateObject var viewModel = LoginViewModel()
    @EnvironmentObject var networkMonitor: NetworkMonitor
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
                    VStack(alignment: .center){
                        Text("Enter Your")
                            .font(.custom(OpenSans_Regular, size: 14))
                            .foregroundColor(Color(hex: 0x868686, alpha: 1.0))
                        +
                        Text(" ATLAS Application ID")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(Color(hex: 0x333333))
                        +
                        Text(" (OR) your")
                            .font(.custom(OpenSans_Regular, size: 14))
                            .foregroundColor(Color(hex: 0x868686, alpha: 1.0))
                        +
                        Text(" Registered Mobile Number")
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
                        
                    }
                    .padding()
                    VStack{
                        Button {
                            if txtMobile.count == 10 || txtMobile.count == 7 || txtMobile.count == 8{
                                if networkMonitor.isConnected{
                                    viewModel.fetchLoginDate(mobile: txtMobile) { loginData in
                                        if loginData.status == 1{
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
                                    newMobile: $txtMobile,
                                    isApplicationId: $isApplicationId
                                ).navigationBarHidden(true),
                                isActive: $isShowOTP).isDetailLink(false)
                        }
                    }
                    .padding(.bottom, 20)
                }
                .frame(width: UIScreen.main.bounds.width - 60)
                .background(.white)
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(color: .gray, radius: 10, x: 0, y: 0)
                )
                if viewModel.isLoadingData{
                    LoadingView()
                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
