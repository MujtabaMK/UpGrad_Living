//
//  RoomTypeView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 30/03/23.
//

import SwiftUI

struct RoomTypeView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var submitViewModel = SubmitRoomTypeViewModel()
    @State private var borderColor = Color(hex: 0x3CA0D1)
    @State private var SelectedValue = "3"
    @State private var RoomName = "Four Sharing"
    @State private var PaymentMethod = "6 Months"
    @State private var showMedicalQuestion = false
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    @State private var isButtonClick = false
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    HStack{
                        Button {
                            withAnimation() {
                                presentationMode.wrappedValue.dismiss()
                            }
                        } label: {
                            Image("back_Button")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding(.leading, 20)
                        }
                        Spacer(minLength: 0)
                    }
                    .padding(.top)
                    Divider()
                    ScrollView(showsIndicators: false){
                        VStack{
                            DetailsViewTop(Step: "4")
                                .padding(.bottom)
                        }
                        VStack{
                            if SelectedValue == "3"{
                                RoomTypeQuardView(isSelect: .constant(true))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color(hex: 0x3CA0D1), lineWidth: 1)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                    )
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.white)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                    )
                                    .padding(.horizontal, 10)
                                    .padding(.bottom, 10)
                                    .onTapGesture {
                                        SelectedValue = "3"
                                        RoomName = "Four Sharing"
                                    }
                                RoomTypeTripleView(isSelect: .constant(false))
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.white)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                    )
                                    .padding(.horizontal, 10)
                                    .padding(.bottom, 10)
                                    .onTapGesture {
                                        SelectedValue = "4"
                                        RoomName = "Triple Sharing"
                                    }
                                RoomTypeTwinView(isSelect: .constant(false))
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.white)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                    )
                                    .padding(.horizontal, 10)
                                    .padding(.bottom, 10)
                                    .onTapGesture {
                                        SelectedValue = "5"
                                        RoomName = "Twin Sharing"
                                    }
                            }else if SelectedValue == "4"{
                                RoomTypeQuardView(isSelect: .constant(false))
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.white)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                    )
                                    .padding(.horizontal, 10)
                                    .padding(.bottom, 10)
                                    .onTapGesture {
                                        SelectedValue = "3"
                                        RoomName = "Four Sharing"
                                    }
                                RoomTypeTripleView(isSelect: .constant(true))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color(hex: 0x3CA0D1), lineWidth: 1)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                    )
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.white)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                    )
                                    .padding(.horizontal, 10)
                                    .padding(.bottom, 10)
                                    .onTapGesture {
                                        SelectedValue = "4"
                                        RoomName = "Triple Sharing"
                                    }
                                RoomTypeTwinView(isSelect: .constant(false))
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.white)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                    )
                                    .padding(.horizontal, 10)
                                    .padding(.bottom, 10)
                                    .onTapGesture {
                                        SelectedValue = "5"
                                        RoomName = "Twin Sharing"
                                    }
                            }else{
                                RoomTypeQuardView(isSelect: .constant(false))
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.white)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                    )
                                    .padding(.horizontal, 10)
                                    .padding(.bottom, 10)
                                    .onTapGesture {
                                        SelectedValue = "3"
                                        RoomName = "Four Sharing"
                                    }
                                RoomTypeTripleView(isSelect: .constant(false))
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.white)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                    )
                                    .padding(.horizontal, 10)
                                    .padding(.bottom, 10)
                                    .onTapGesture {
                                        SelectedValue = "4"
                                        RoomName = "Triple Sharing"
                                    }
                                RoomTypeTwinView(isSelect: .constant(true))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color(hex: 0x3CA0D1), lineWidth: 1)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                    )
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.white)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                    )
                                    .padding(.horizontal, 10)
                                    .padding(.bottom, 10)
                                    .onTapGesture {
                                        SelectedValue = "5"
                                        RoomName = "Twin Sharing"
                                    }
                            }
                        }
                        VStack{
                            Text("Select the Payment Option")
                                .foregroundColor(.white)
                                .font(.custom(OpenSans_Bold, size: 16))
                                .padding(8)
                                .frame(width: UIScreen.main.bounds.width - 20)
                                .background(Color(hex: 0x3CA0D1))
                                .padding(.bottom)
                        }
                        VStack{
                            if PaymentMethod == "6 Months"{
                                PaymentMethod6Month(isSelect: .constant(true))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color(hex: 0x3CA0D1), lineWidth: 1)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                    )
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.white)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                    )
                                    .padding(.horizontal, 10)
                                    .padding(.bottom, 10)
                                    .onTapGesture {
                                        PaymentMethod = "6 Months"
                                    }
                                
                                PaymentMethod11Month(isSelect: .constant(false))
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.white)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                    )
                                    .padding(.horizontal, 10)
                                    .padding(.bottom, 10)
                                    .onTapGesture {
                                        PaymentMethod = "11 Months"
                                    }
                            }else{
                                PaymentMethod6Month(isSelect: .constant(false))
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.white)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                    )
                                    .padding(.horizontal, 10)
                                    .padding(.bottom, 10)
                                    .onTapGesture {
                                        PaymentMethod = "6 Months"
                                    }
                                
                                PaymentMethod11Month(isSelect: .constant(true))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color(hex: 0x3CA0D1), lineWidth: 1)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                    )
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.white)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                    )
                                    .padding(.horizontal, 10)
                                    .padding(.bottom, 10)
                                    .onTapGesture {
                                        PaymentMethod = "11 Months"
                                    }
                            }
                        }
                        NavigationLink("", destination: MedicalQuestionView().navigationBarHidden(true),isActive: $showMedicalQuestion).isDetailLink(false)
                        VStack{
                            DetailsViewBottom(textName: "Save & Continue", imageName: "Form_Button_icon_Step4")
                                .onTapGesture {
                                    isButtonClick = true
                                    submitViewModel.fetchLoginDate(
                                        roomType: RoomName,
                                        paymentOption: PaymentMethod,
                                        roomTypeId: SelectedValue,
                                        appId: studentAppID ?? "") { RoomData in
                                            if RoomData.status == 1{
                                                showMedicalQuestion = true
                                            }else{
                                                alertMessage = RoomData.msg ?? ""
                                                AlertShow = "0"
                                                showingAlert = true
                                            }
                                        }
                                }
                                .shadow(color: isButtonClick ? .gray : .clear, radius: isButtonClick ? 10 : 0, x: 0, y: 0)
                        }
                        .padding(.bottom)
                    }
                }
                if submitViewModel.isLoadingData{
                    LoadingView()
                }
            }
            .alert(alertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    if AlertShow == "1"{
                    }else{
                        isButtonClick = false
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct RoomTypeView_Previews: PreviewProvider {
    static var previews: some View {
        RoomTypeView()
    }
}
