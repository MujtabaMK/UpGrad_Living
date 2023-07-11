//
//  ParentRequestInviteaGuest.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 19/06/23.
//

import SwiftUI

struct ParentRequestInviteaGuest: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    @State private var todayDate = Date()
    
    @Binding var startDate: String
    @Binding var endDate: String
    @Binding var startTime: String
    @Binding var endTime: String
    @Binding var guestName: String
    @Binding var guestNo: String
    @Binding var reason: String
    @Binding var callAPI: Bool
    @Binding var requestID: String
    @Binding var requestStatus: String
    
    @Binding var alertMessage: String
    @Binding var showingAlert: Bool
    @Binding var AlertShow: String
    
    var arrPending: ParentPending
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Spacer()
                    
                    Text(arrPending.requestCategory ?? "")
                        .font(.custom(OpenSans_Bold, size: 16))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                    
                    Spacer()
                }
                .frame(width: getRect().width - 40, height: 48)
                .background(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0x2E2E2E))
                .cornerRadius(5, corners: [.topLeft, .topRight])
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(hex: 0xDE1223), lineWidth: 1)
                )
                VStack(alignment: .leading){
                    Text("Date")
                        .font(.custom(OpenSans_SemiBold, size: 14))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0x333333,alpha: 1.0))
                        .padding(.top)
                        .padding(.leading)
                    
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.white)
                        .frame(height: 40)
                        .padding(.horizontal)
                        .overlay {
                            HStack{
                                Image("Request_Calender_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 35)
                                    .padding(.leading, 20)
                                
                                Spacer()
                                
                                Text(arrPending.startDate ?? "")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x6B6A6A) : Color(hex: 0x6B6A6A))
                                Spacer()
                            }
                        }
                    
                        .padding(.bottom, 5)
                    
                    HStack(spacing: 20){
                        VStack(alignment: .leading){
                            Text("Start Time")
                                .font(.custom(OpenSans_SemiBold, size: 14))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                                .padding(.top, 5)
                            
                            RoundedRectangle(cornerRadius: 5)
                                .fill(.white)
                                .frame(height: 40)
                                .overlay {
                                    HStack{
                                        Image("Request_Time_icon")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 24, height: 24)
                                            .padding(.leading, 5)
                                            .padding(.trailing, 5)
                                        
                                        Text(arrPending.startTime ?? "")
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x6B6A6A) : Color(hex: 0x6B6A6A))
                                        Spacer()
                                    }
                                }
                            
                        }
                        
                        VStack(alignment: .leading){
                            Text("End Time")
                                .font(.custom(OpenSans_SemiBold, size: 14))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                                .padding(.top, 5)
                            
                            RoundedRectangle(cornerRadius: 5)
                                .fill(.white)
                                .frame(height: 40)
                                .overlay {
                                    HStack{
                                        Image("Request_Time_icon")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 24, height: 24)
                                            .padding(.leading, 5)
                                            .padding(.trailing, 5)
                                        
                                        Text(arrPending.endTime ?? "")
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x6B6A6A) : Color(hex: 0x6B6A6A))
                                        Spacer()
                                    }
                                }
                            
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading){
                        Text("Reason for invitation")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0x333333, alpha: 1.0))
                            .padding(.top, 5)
                            .padding(.leading)
                        
                        TextEditor(text: $reason)
                            .disabled(true)
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x333333))
                            .background(colorScheme == .light ? .white : .white)
                            .cornerRadius(5)
                            .frame(height: 50)
                            .padding(.horizontal)
                    }
                    .padding(.bottom, 5)
                    
                    VStack(alignment: .leading) {
                        Text("Guest name")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(Color(hex: 0x333333))
                            .padding(.horizontal)
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.white)
                            .frame(height: 40)
                            .padding(.horizontal)
                            .overlay {
                                HStack{
                                    Rectangle()
                                        .fill(.clear)
                                        .frame(width: 20, height: 40)
                                    TextField("", text: $guestName)
                                        .disabled(true)
                                        .font(.custom(OpenSans_SemiBold, size: 12))
                                        .foregroundColor(Color(hex: 0x333333))
                                        .disableAutocorrection(true)
                                }
                            }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Guest mobile number")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(Color(hex: 0x333333))
                            .padding(.horizontal)
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.white)
                            .frame(height: 40)
                            .padding(.horizontal)
                            .overlay {
                                HStack{
                                    Rectangle()
                                        .fill(.clear)
                                        .frame(width: 20, height: 40)
                                    
                                    TextField("", text: $guestNo)
                                        .disabled(true)
                                        .font(.custom(OpenSans_SemiBold, size: 12))
                                        .foregroundColor(Color(hex: 0x333333))
                                        .disableAutocorrection(true)
                                    
                                }
                            }
                    }
                    .padding(.bottom)
                    
                    if arrPending.isEdit == "1"{
                        HStack{
                            Button {
                                requestID = arrPending.id ?? ""
                                requestStatus = "2"
                                callAPI.toggle()
                            } label: {
                                Capsule()
                                    .strokeBorder(Color(hex: 0xB20710), lineWidth: 1)
                                    .frame(width: 110, height: 50)
                                    .overlay {
                                        HStack(spacing: 4){
                                            Text("Reject")
                                                .font(.custom(OpenSans_SemiBold, size: 15))
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0xDE1223) : Color(hex:0xDE1223))
                                        }
                                    }
                            }
                            
                            Spacer()
                            
                            Button {
                                requestID = arrPending.id ?? ""
                                requestStatus = "1"
                                callAPI.toggle()
                            } label: {
                                Capsule()
                                    .fill(
                                        LinearGradient(
                                            colors: [Color(hex: 0xEE2C3C),
                                                     Color(hex: 0xB20710)],
                                            startPoint: .leading,
                                            endPoint: .trailing)
                                    )
                                    .frame(width: 160, height: 50)
                                    .overlay{
                                        HStack{
                                            Spacer()
                                            Text("Approve")//Save & Continue
                                                .font(.custom(OpenSans_SemiBold, size: 15))
                                                .foregroundColor(.white)
                                            Spacer()
                                        }
                                    }
                            }
                        }
                        .padding(.bottom)
                        .padding(.horizontal)
                    }else{
                        HStack{
                            Image("Seek_Pending_icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 21, height: 21)
                            
                            Text("Pending by admin")
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0x333333, alpha: 1.0))
                            
                            Spacer()
                        }
                        .padding(.bottom)
                        .padding(.horizontal)
                    }
                }
                .frame(width: getRect().width - 40)
                .background(Color(hex: 0xFEEEF0))
                .cornerRadius(5, corners: [.bottomLeft, .bottomRight])
                .padding(.bottom)
                .offset(y: -13)
                .zIndex(1)
            }
        }
        .onAppear{
            UITextView.appearance().backgroundColor = .clear
        }
    }
}
