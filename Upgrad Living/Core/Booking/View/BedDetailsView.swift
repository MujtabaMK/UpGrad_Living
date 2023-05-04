//
//  BedDetailsView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 04/05/23.
//

import SwiftUI
import Kingfisher

struct BedDetailsView: View {
    var getBedData: [String]
    @Binding var isShowAlert: Bool
    @Binding var alertMessage: String
    @Binding var showSheetPopup: Bool
    var RoomType: String
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var studentUserID = UserDefaults.standard.string(forKey: "studentUserID")
    
    @StateObject private var viewModelBeds = GetBedViewModel()
    
    @State private var iscallView = false
    @State private var bedValue = [BedDetail]()
    @State private var RoomName = ""
    
    var body: some View {
        ZStack{
            if showSheetPopup{
                Color.white
                VStack{
                    if iscallView{
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
                                }
                            }
                            Text("You have selected")
                                .font(.custom(OpenSans_Bold, size: 16))
                                .foregroundColor(Color(hex: 0x333333))
                                .padding(.bottom, 2)
                                .padding(.leading, 10)
                            HStack{
                                Spacer()
                                Text("Room \(RoomName)")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(.white)
                                Spacer()
                                Rectangle()
                                    .fill(.white)
                                    .frame(width: 1, height: 40)
                                Spacer()
                                Text("\(RoomType) room")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .frame(maxWidth: getRect().width - 20, maxHeight: 54, alignment: .center)
                            .background(Color(hex: 0x79CB8A))
                            .padding(.leading, 10)
                            Text("Meet your Roommates")
                                .font(.custom(OpenSans_Bold, size: 14))
                                .foregroundColor(Color(hex: 0x868686))
                                .padding(.leading, 10)
                            
                            ForEach(bedValue) { value in
                                if value.bedNo == "A"{
                                    Image("Bed_A_icon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 48)
                                }else if value.bedNo == "B"{
                                    Image("Bed_B_icon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 48)
                                }else if value.bedNo == "C"{
                                    Image("Bed_C_icon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 48)
                                }else if value.bedNo == "D"{
                                    Image("Bed_D_icon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 48)
                                }
                                VStack{
                                    HStack{
                                        VStack(spacing: 12){
                                            KFImage(URL(string: value.studentImg))
                                                .resizable()
                                                .frame(width: 59, height: 59)
                                            Text(value.studentName)
                                                .font(.custom(OpenSans_SemiBold, size: 12))
                                                .foregroundColor(Color(hex: 0x333333))
                                        }
                                    }
                                }
                                
                            }
                            
                        }
                    }
                }
                .interactiveDismissDisabled()
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
        BedDetailsView(getBedData: [], isShowAlert: .constant(false), alertMessage: .constant(""), showSheetPopup: .constant(false), RoomType: "")
    }
}
