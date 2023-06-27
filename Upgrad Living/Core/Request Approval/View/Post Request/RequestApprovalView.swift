//
//  RequestApprovalView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 13/06/23.
//

import SwiftUI

struct RequestApprovalView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @StateObject private var viewModel = RequestApprovalViewModel()
    @StateObject private var viewModelGet = SeekApprovalViewModel()
    
    @State private var arrSeekApproval = [SeekApprovalRequest]()
    
    @State private var isReasion = false
    @State private var ReasonId = "1"
    @State private var ReasonName = "Late night"
    
    @State private var isRequestSelect = false
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    @State private var startDate = ""
    @State private var endDate = ""
    @State private var startTime = ""
    @State private var endTime = ""
    @State private var guestName = ""
    @State private var guestNo = ""
    @State private var reason = ""
    @State private var callAPI = false
    
    @Binding var isBackRequestApproval: Bool
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView(showsIndicators: false) {
                    ZStack(alignment: .top){
                        Image("Home_Top_Background")
                            .resizable()
                            .scaledToFit()
                            .frame(width: getRect().width, height: 290)
                            .padding(.top, -90)
                        VStack{
                            HStack{
                                Button {
                                    isBackRequestApproval = true
                                } label: {
                                    Image("back_Button")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .padding(.leading, 20)
                                }
                                Spacer(minLength: 0)
                                Text("Approval Requests")
                                    .font(.custom(OpenSans_SemiBold, size: 18))
                                    .foregroundColor(colorScheme == .light ? .white : .white)
                                    .padding(.trailing, 30)
                                Spacer(minLength: 0)
                            }
                            Spacer()
                        }
                        .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                    }
                    VStack{
                        HStack(spacing: 0){
                            HStack{
                                Image(isRequestSelect ? "seek_Approval_UnSelect" : "seek_Approval_Select_ton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 21, height: 19)
                                
                                Text("Seek Approval")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(isRequestSelect ? Color(hex: 0xDE1223) : Color(hex: 0xDE1223))
                            }
                            .onTapGesture {
                                isRequestSelect = false
                            }
                            .frame(maxWidth: .infinity, minHeight: 55, maxHeight: 55)
                            .background(isRequestSelect ? Color(hex: 0xFEF0F1) : Color(hex: 0xFECDD1))
                            .cornerRadius(15, corners: [.topLeft])
                            
                            HStack{
                                Image(isRequestSelect ? "Request_Selected_icon" : "Request_UnSelect_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 21, height: 19)
                                
                                Text("Requests")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(isRequestSelect ? Color(hex: 0xDE1223) : Color(hex: 0xDE1223))
                            }
                            .onTapGesture {
                                isRequestSelect = true
                            }
                            .frame(maxWidth: .infinity, minHeight: 55, maxHeight: 55)
                            .background(isRequestSelect ? Color(hex: 0xFECDD1) : Color(hex: 0xFEF0F1))
                            .cornerRadius(15, corners: [.topRight])
                        }
                        
                        if !isRequestSelect{
                            VStack{
                                Text("Select a reason")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                    .padding(.top)
                                    .padding(.bottom)
                                
                                Button {
                                    startDate = ""
                                    endDate = ""
                                    startTime = ""
                                    endTime = ""
                                    guestName = ""
                                    guestNo = ""
                                    reason = ""
                                    isReasion.toggle()
                                } label: {
                                    HStack{
                                        Text(ReasonName)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 1.0))
                                            .padding(.leading)
                                        
                                        Spacer()
                                        
                                        Image(isReasion ?  "User_Category_DeSelect" : "User_Category_Select")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 18, height: 18)
                                            .padding(.trailing)
                                    }
                                    .frame(width: getRect().width - 40, height: 44)
                                    .background(colorScheme == .light ? Color(hex: 0xF9F9F9) : Color(hex: 0x2E2E2E))
                                    .cornerRadius(5)
                                    .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                }
                                if isReasion{
                                    VStack{
                                        ForEach(arrRequestReason) { request in
                                            Button {
                                                ReasonId = request.id
                                                ReasonName = request.name
                                                isReasion.toggle()
                                            } label: {
                                                VStack{
                                                    HStack{
                                                        Text(request.name)
                                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                                            .foregroundColor(Color(hex: 0x868686))
                                                            .padding(.leading)
                                                            .padding(.top)
                                                        
                                                        Spacer()
                                                    }
                                                    HLine()
                                                        .stroke(style: StrokeStyle(lineWidth: 0.5, dash: [1]))
                                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                                        .frame(width: getRect().width - 40,height: 1)
                                                        .padding(.horizontal)
                                                }
                                            }
                                        }
                                    }
                                    .frame(width: getRect().width - 40)
                                    .background(colorScheme == .light ? Color(hex: 0xF9F9F9) : Color(hex: 0x2E2E2E))
                                    .cornerRadius(5)
                                    .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                    .offset(y: -6)
                                }
                                
                                if ReasonId == "1"{
                                    RequestLateNight(startDate: $startDate,
                                                     endDate: $endDate,
                                                     startTime: $startTime,
                                                     endTime: $endTime,
                                                     guestName: $guestName,
                                                     guestNo: $guestNo,
                                                     reason: $reason,
                                                     callAPI: $callAPI,
                                                     alertMessage: $alertMessage,
                                                     showingAlert: $showingAlert,
                                                     AlertShow: $AlertShow)
                                    .padding(.top)
                                }else if ReasonId == "2"{
                                    RequestLeave(startDate: $startDate,
                                                 endDate: $endDate,
                                                 startTime: $startTime,
                                                 endTime: $endTime,
                                                 guestName: $guestName,
                                                 guestNo: $guestNo,
                                                 reason: $reason,
                                                 callAPI: $callAPI,
                                                 alertMessage: $alertMessage,
                                                 showingAlert: $showingAlert,
                                                 AlertShow: $AlertShow)
                                    .padding(.top)
                                }else if ReasonId == "3"{
                                    RequestFoodDelivery(startDate: $startDate,
                                                        endDate: $endDate,
                                                        startTime: $startTime,
                                                        endTime: $endTime,
                                                        guestName: $guestName,
                                                        guestNo: $guestNo,
                                                        reason: $reason,
                                                        callAPI: $callAPI,
                                                        alertMessage: $alertMessage,
                                                        showingAlert: $showingAlert,
                                                        AlertShow: $AlertShow)
                                    .padding(.top)
                                }else if ReasonId == "4"{
                                    RequestInviteaGuest(startDate: $startDate,
                                                        endDate: $endDate,
                                                        startTime: $startTime,
                                                        endTime: $endTime,
                                                        guestName: $guestName,
                                                        guestNo: $guestNo,
                                                        reason: $reason,
                                                        callAPI: $callAPI,
                                                        alertMessage: $alertMessage,
                                                        showingAlert: $showingAlert,
                                                        AlertShow: $AlertShow)
                                    .padding(.top)
                                }else if ReasonId == "5"{
                                    RequestLaundry(startDate: $startDate,
                                                   endDate: $endDate,
                                                   startTime: $startTime,
                                                   endTime: $endTime,
                                                   guestName: $guestName,
                                                   guestNo: $guestNo,
                                                   reason: $reason,
                                                   callAPI: $callAPI,
                                                   alertMessage: $alertMessage,
                                                   showingAlert: $showingAlert,
                                                   AlertShow: $AlertShow)
                                }
                            }
                        }
                        if isRequestSelect{
                            ForEach(Array(arrSeekApproval.enumerated()), id: \.offset) { index,approval in
                                SeekApproval(arrSeekApproval: approval)
                                    .padding(.top)
                            }
                        }
                    }
                    .frame(maxWidth: getRect().width)
                    .background(colorScheme == .light ? .white : .black)
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                    .offset(y: -80)
                }
                if viewModel.isLoadingData{
                    LoadingView()
                }
                if viewModelGet.isLoadingData{
                    LoadingView()
                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .onChange(of: callAPI) { newValue in
                if networkMonitor.isConnected{
                    viewModel.getProfileInfo(appId: studentAppID ?? "",
                                             startDate: startDate,
                                             endDate: endDate,
                                             reasonId: ReasonId,
                                             startTime: startTime,
                                             endTime: endTime,
                                             guestName: guestName,
                                             guestNo: guestNo,
                                             reason: reason) { request in
                        if request.status == 1{
                            if ReasonId == "1"{
                                alertMessage = "Late night request added successfully"
                                AlertShow = "1"
                                showingAlert = true
                            }else if ReasonId == "2"{
                                alertMessage = "Leave request added successfully"
                                AlertShow = "1"
                                showingAlert = true
                            }else if ReasonId == "3"{
                                alertMessage = "Food delivery request added successfully"
                                AlertShow = "1"
                                showingAlert = true
                            }else if ReasonId == "4"{
                                alertMessage = "Invite a guest request added successfully"
                                AlertShow = "1"
                                showingAlert = true
                            }else if ReasonId == "5"{
                                alertMessage = "Laundry requtest added successfully"
                                AlertShow = "1"
                                showingAlert = true
                            }
                        }else{
                            alertMessage = request.msg ?? ""
                            AlertShow = "0"
                            showingAlert = true
                        }
                    }
                }else{
                    alertMessage = "Please Check Your Internet Connection"
                    AlertShow = "0"
                    showingAlert = true
                }
            }
            .onChange(of: isRequestSelect, perform: { _ in
                if isRequestSelect{
                    if networkMonitor.isConnected{
                        viewModelGet.getProfileInfo(appId: studentAppID ?? "") { seek in
                            if seek.status == 1{
                                arrSeekApproval = seek.data ?? []
                            }else{
                                alertMessage = seek.msg ?? ""
                                AlertShow = "0"
                                showingAlert = true
                            }
                        }
                    }else{
                        alertMessage = "Please Check Your Internet Connection"
                        AlertShow = "0"
                        showingAlert = true
                    }
                }
            })
            .onAppear{
                if networkMonitor.isConnected{
                    viewModelGet.getProfileInfo(appId: studentAppID ?? "") { seek in
                        if seek.status == 1{
                            arrSeekApproval = seek.data ?? []
                        }else{
                            alertMessage = seek.msg ?? ""
                            AlertShow = "0"
                            showingAlert = true
                        }
                    }
                }else{
                    alertMessage = "Please Check Your Internet Connection"
                    AlertShow = "0"
                    showingAlert = true
                }
            }
            .alert(alertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    if AlertShow == "1"{
                        startDate = ""
                        endDate = ""
                        startTime = ""
                        endTime = ""
                        guestName = ""
                        guestNo = ""
                        reason = ""
                        isRequestSelect = false
                    }else{
                        
                    }
                }
            }
        }
    }
}
