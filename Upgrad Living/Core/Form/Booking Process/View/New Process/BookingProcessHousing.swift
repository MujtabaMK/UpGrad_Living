//
//  BookingProcessHousing.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 22/06/23.
//

import SwiftUI
import Combine

struct BookingProcessHousing: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var isStudentDetails = false
    @State private var isButtonClick = false
    
    @Binding var txtMobile: String
    @Binding var isShowAlert: Bool
    @Binding var AlertMessage: String
    @Binding var AlertShow: String
    @Binding var isCallAPI: Bool
    
    var body: some View {
        ZStack(alignment: .top){
            VStack{
                VStack{
                    VStack{
                        VStack{
                            BookingProcessLogin_Image()
                        }
                    }
                    .padding(.top, 40)
                }
                .frame(maxWidth: UIScreen.main.bounds.width - 60)
                .background(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0xFFF4F6))
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0xFFF4F6))
                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                )
                .padding(.top, 200)
                
                VStack{
                    VStack(alignment: .center, spacing: 4){
                        Text("Enter Your")
                            .font(.custom(OpenSans_Regular, size: 14))
                            .foregroundColor(Color(hex: 0x868686, alpha: 1.0))
                        +
                        Text(" ATLAS Application ID")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(Color(hex: 0x333333))
                        
                        Text(" (OR) ")
                            .font(.custom(OpenSans_Regular, size: 14))
                            .foregroundColor(Color(hex: 0x868686, alpha: 1.0))
                        
                        Text("your ")
                            .font(.custom(OpenSans_Regular, size: 14))
                            .foregroundColor(Color(hex: 0x868686, alpha: 1.0))
                        +
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
                                .frame(width: 250, height: 40)
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
                                cornerRadius: 4).strokeBorder(Color(hex: 0xB90F1D),
                                                              style: StrokeStyle(lineWidth: 0.5))
                        )
                        .background(colorScheme == .light ? .white : .white)
                    }
                }
                .padding(.vertical, 20)
                .frame(width: getRect().width - 60)
                .background(colorScheme == .light ? .white : Color(hex: 0xFEEEF0, alpha: 1.0))
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(colorScheme == .light ? .white : Color(hex: 0xFEEEF0, alpha: 1.0))
                        .shadow(color: .gray, radius: 10, x: 0, y: 0)
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .strokeBorder(Color(hex: 0xB90F1D), style: StrokeStyle(lineWidth: 0.5))
                }
                .padding(.top)
                
                VStack{
                    DetailsViewBottom(textName: "Get OTP", imageName: "lets_go_Image")
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                        .onTapGesture {
                            withAnimation {
                                if txtMobile.count == 10 || txtMobile.count == 7 || txtMobile.count == 8{
                                    if networkMonitor.isConnected{
                                        isCallAPI.toggle()
                                        isStudentDetails = true
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
                        .shadow(color: isButtonClick ? .gray : .clear, radius: isButtonClick ? 10 : 0, x: 0, y: 0)
                }
            }
            HStack{
                Text("The booking process at upGrad Living consists of \nnine easy steps...\n\n")
                    .font(.custom(OpenSans_Bold, size: 20))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : .white)
                    .padding(.leading, 5)
                Image("Booking_Process_Top")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 186, height: 205)
            }
            .padding(.top)
            .zIndex(1)
            .offset(y: 10)
        }
    }
}
