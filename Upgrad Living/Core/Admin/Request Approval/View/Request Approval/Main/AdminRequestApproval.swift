//
//  AdminRequestApproval.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 11/07/23.
//

import SwiftUI

struct AdminRequestApproval: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var studentusername = UserDefaults.standard.string(forKey: "studentusername")
    @State private var studentUserID = UserDefaults.standard.string(forKey: "studentUserID")
    @StateObject private var viewModelPending = AdminPendingViewModel()
    @StateObject private var viewModelPost = ParentTakeActionViewModel()
    @StateObject private var viewModelSeek = AdminPendingRequestViewModel()
    
    @State private var arrSeekApproval = [AdminRequest]()
    @State private var arrPendingParentDetails = [AdminPending]()
    
    @State private var isReasion = false
    @State private var ReasonId = "4"
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
    @State private var requestID = ""
    @State private var requestStatus = ""
    
    @Binding var isBackAdminApproval: Bool
    
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView(showsIndicators: false) {
                    AdminApprovalTop()
                    VStack{
                        HStack(spacing: 0){
                            HStack(spacing: 12){
                                ZStack(alignment: .topTrailing){
                                    Image(isRequestSelect ? "Parent_Request_Pending_UnSelect" : "Parent_Request_Pending_Select")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 21, height: 19)
                                    if arrPendingParentDetails.count > 0{
                                        Circle()
                                            .fill(Color(hex: 0xDE1223))
                                            .frame(width: 15, height: 15)
                                            .overlay {
                                                if arrPendingParentDetails.count > 9{
                                                    Text("9+")
                                                        .font(.custom(OpenSans_SemiBold, size: 9))
                                                        .foregroundColor(Color(hex: 0xFFFFFF))
                                                }else{
                                                    Text("\(arrPendingParentDetails.count)")
                                                        .font(.custom(OpenSans_SemiBold, size: 9))
                                                        .foregroundColor(Color(hex: 0xFFFFFF))
                                                }
                                            }
                                            .padding(1)
                                            .background(Color(hex: 0xFECDD1))
                                            .clipShape(Circle())
                                            .offset(x: 10, y: -8)
                                    }
                                }
                                
                                Text("Pending Requests")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(isRequestSelect ? Color(hex: 0xDE1223) : Color(hex: 0xDE1223))
                            }
                            .onTapGesture {
                                isRequestSelect = false
                            }
                            .frame(maxWidth: .infinity, minHeight: 55, maxHeight: 55)
                            .background(isRequestSelect ? Color(hex: 0xFEF0F1) : Color(hex: 0xFECDD1))
                            .cornerRadius(15, corners: [.topLeft])
                            
                            HStack(spacing: 12){
                                Image(isRequestSelect ? "Request_Selected_icon" : "Request_UnSelect_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 21, height: 19)
                                
                                Text("Past Requests")
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
                            AdminApprovalPending(startDate: $startDate,
                                                  endDate: $endDate,
                                                  startTime: $startTime,
                                                  endTime: $endTime,
                                                  guestName: $guestName,
                                                  guestNo: $guestNo,
                                                  reason: $reason,
                                                  callAPI: $callAPI,
                                                  requestID: $requestID,
                                                  requestStatus: $requestStatus,
                                                  alertMessage: $alertMessage,
                                                  showingAlert: $showingAlert,
                                                  AlertShow: $AlertShow,
                                                  arrPendingParentDetails: arrPendingParentDetails)
                        }
                        if isRequestSelect{
                            ForEach(Array(arrSeekApproval.enumerated()), id: \.offset) { index, approval in
                                AdminSeekApproval(arrSeekApproval: approval)
                                    .padding(.top)
                            }
                        }
                    }
                    .frame(maxWidth: getRect().width)
                    .background(colorScheme == .light ? .white : .black)
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                    .offset(y: -80)
                }
                if viewModelPending.isLoadingData{
                    LoadingView()
                }
                if viewModelSeek.isLoadingData{
                    LoadingView()
                }
                if viewModelPost.isLoadingData{
                    LoadingView()
                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .onChange(of: callAPI) { newValue in
                if networkMonitor.isConnected{
                    viewModelPost.postPendingRequest(
                        requestId: requestID,
                        approvedBy: studentusername ?? "",
                        approvedById: "1",
                        status: requestStatus) { parent in
                            if parent.status == 1{
                                if requestStatus == "1"{
                                    alertMessage = "Request Approved Successfully"
                                    AlertShow = "2"
                                    showingAlert = true
                                }else{
                                    alertMessage = "Request Rejected Successfully"
                                    AlertShow = "2"
                                    showingAlert = true
                                }
                            }else{
                                alertMessage = parent.msg ?? ""
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
                        viewModelSeek.getPendingInfo(userId: studentUserID ?? "") { seek in
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
                }else{
                    if networkMonitor.isConnected{
                        viewModelPending.getPendingInfo(userId: studentUserID ?? "") { Admin in
                            if Admin.status == 1{
                                arrPendingParentDetails = Admin.data ?? []
                            }else{
                                alertMessage = Admin.msg ?? ""
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
                    viewModelSeek.getPendingInfo(userId: studentUserID ?? "") { seek in
                        if seek.status == 1{
                            arrSeekApproval = seek.data ?? []
                        }else{
                            alertMessage = seek.msg ?? ""
                            AlertShow = "0"
                            showingAlert = true
                        }
                    }
                    viewModelPending.getPendingInfo(userId: studentUserID ?? "") { Admin in
                        if Admin.status == 1{
                            arrPendingParentDetails = Admin.data ?? []
                        }else{
                            alertMessage = Admin.msg ?? ""
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
                    }else if AlertShow == "2"{
                        viewModelPending.getPendingInfo(userId: studentUserID ?? "") { Parent in
                            if Parent.status == 1{
                                arrPendingParentDetails = Parent.data ?? []
                            }else{
                                alertMessage = Parent.msg ?? ""
                                AlertShow = "0"
                                showingAlert = true
                            }
                        }
                    } else{
                        
                    }
                }
            }
        }
    }
}
