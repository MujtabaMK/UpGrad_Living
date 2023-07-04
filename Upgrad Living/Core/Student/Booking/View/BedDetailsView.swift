//
//  BedDetailsView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 04/05/23.
//

import SwiftUI

struct BedDetailsView: View {
    var getBedData: [String]
    @Binding var isShowAlert: Bool
    @Binding var alertMessage: String
    @Binding var showSheetPopup: Bool
    @Binding var isShowSuccessView: Bool
    var RoomType: String
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var studentUserID = UserDefaults.standard.string(forKey: "studentUserID")
    
    @StateObject private var viewModelBeds = GetBedViewModel()
    @StateObject private var viewModelPostFloor = PostFloorViewModel()
    
    @State private var iscallView = false
    @State private var bedValue = [BedDetail]()
    @State private var RoomName = ""
    @State private var StudentId = ""
    @State private var InsterId = ""
    
    var body: some View {
        ZStack{
            if showSheetPopup{
                Color.white
                VStack{
                    if iscallView{
                        ScrollView{
                            VStack(alignment: .leading){
                                HStack{
                                    Spacer()
                                    Button {
                                        showSheetPopup = false
                                    } label: {
                                        Image(systemName: "xmark")
                                            .resizable()
                                            .renderingMode(.template)
                                            .frame(width: 15, height: 15)
                                            .foregroundColor(.black)
                                            .padding(.trailing, 20)
                                            .padding(.top, 20)
                                    }
                                }
                                BedDetailsTop(RoomName: RoomName, RoomType: RoomType)
                                BedDetailsShowView(getData: bedValue)
                                HStack{
                                    Spacer()
                                    Button {
                                        showSheetPopup = false
                                    } label: {
                                        Capsule()
                                            .strokeBorder(Color(hex: 0xB20710), lineWidth: 1)
                                            .frame(width: 110)
                                            .overlay {
                                                Text("Go Back")
                                                    .font(.custom(OpenSans_SemiBold, size: 15))
                                                    .foregroundColor(Color(hex: 0x333333))
                                                    .padding()
                                            }
                                    }
                                    Spacer()
                                    Button {
                                        if networkMonitor.isConnected{
                                            viewModelPostFloor.postFloor(
                                                appId: studentAppID ?? "",
                                                insertId: InsterId) { getFloorSelectData in
                                                    if getFloorSelectData.status == 1{
                                                        showSheetPopup = false
                                                        isShowSuccessView = true
                                                    }else{
                                                        alertMessage = getFloorSelectData.msg ?? ""
                                                        isShowAlert = true
                                                        showSheetPopup = false
                                                    }
                                                }
                                        }else{
                                            alertMessage = "Please Check Your Internet Connection"
                                            isShowAlert = true
                                            showSheetPopup = false
                                        }
                                    } label: {
                                        Text("Confirm")
                                            .font(.custom(OpenSans_SemiBold, size: 15))
                                            .frame(width: 130, alignment: .center)
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
                                    }
                                    Spacer()
                                }
                                .padding(.bottom, 20)
                            }
                        }
                    }
                }
                .interactiveDismissDisabled()
            }
            if viewModelPostFloor.isLoadingData{
                LoadingView()
            }
        }
        .onAppear{
            let BookId    = getBedData[1]
            let isCall = getBedData[2]
            if isCall == "0"{
                if networkMonitor.isConnected{
                    viewModelBeds.getFloor(
                        appId: studentAppID ?? "",
                        userid: studentUserID ?? "",
                        bedId: BookId) { getBed in
                            if getBed.status == 1{
                                bedValue = getBed.data?.bedDetails ?? []
                                RoomName = getBed.data?.roomName ?? ""
                                InsterId = getBed.data?.insertID ?? ""
                                iscallView = true
                                showSheetPopup = true
                            }else{
                                alertMessage = getBed.msg ?? ""
                                isShowAlert = true
                                showSheetPopup = false
                            }
                        }
                }else{
                    alertMessage = "Please Check Your Internet Connection"
                    isShowAlert = true
                    showSheetPopup = false
                }
            }else{
                alertMessage = "Already Booked"
                isShowAlert = true
                showSheetPopup = false
            }
        }
        .onChange(of: getBedData) { newValue in
            let BookId    = getBedData[1]
            let isCall = getBedData[2]
            if isCall == "0"{
                if networkMonitor.isConnected{
                    viewModelBeds.getFloor(
                        appId: studentAppID ?? "",
                        userid: studentUserID ?? "",
                        bedId: BookId) { getBed in
                            if getBed.status == 1{
                                bedValue = getBed.data?.bedDetails ?? []
                                RoomName = getBed.data?.roomName ?? ""
                                InsterId = getBed.data?.insertID ?? ""
                                iscallView = true
                                showSheetPopup = true
                            }else{
                                alertMessage = getBed.msg ?? ""
                                isShowAlert = true
                                showSheetPopup = false
                            }
                        }
                }else{
                    alertMessage = "Please Check Your Internet Connection"
                    isShowAlert = true
                    showSheetPopup = false
                }
            }else{
                alertMessage = "Already Booked"
                isShowAlert = true
                showSheetPopup = false
            }
        }
    }
}

struct BedDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BedDetailsView(getBedData: [], isShowAlert: .constant(false), alertMessage: .constant(""), showSheetPopup: .constant(false), isShowSuccessView: .constant(false), RoomType: "")
    }
}
