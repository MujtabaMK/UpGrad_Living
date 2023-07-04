//
//  BookingView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 02/05/23.
//

import SwiftUI
import WebKit

struct BookingView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var studentUserID = UserDefaults.standard.string(forKey: "studentUserID")
    @State private var BookingData = UserDefaults.standard.string(forKey: "BookingData")
    @StateObject private var viewModelFloor = GetFloorViewModel()
    
    @State var title: String = ""
    @State var error: Error? = nil
    @State private var isLoadig = true
    @State private var SelectedItem = ""
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    @State private var arrFloor = [Floor]()
    @State var floorUrl = ""
    @State private var GenderName = ""
    @State private var RoomType = ""
    @State private var RoomPrefrence = ""
    @State var isCallWeb = false
    @State var selectedItem = ""
    @State var isCallLoad = false
    @State var getData = [String]()
    @State var isAPI = false
    @State var isShowSheetPopup = false
    @State var isShowSuccessView = false
    @State var isShowLoader = false
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.white
                VStack{
                    Text("Room Selection")
                        .font(.custom(OpenSans_SemiBold, size: 18))
                        .foregroundColor(colorScheme == .light ? .black : .black)
                        .padding(.trailing, 30)
                        .padding(.top)
                    Divider()
                    
                    HStack{
                        HStack{
                            Spacer()
                            Image(GenderName == "Female" ? "booking_girls_bed" :"booking_boys_bed")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 15, height: 16)
                            Text(GenderName.uppercased())
                                .font(.custom(OpenSans_Bold, size: 10))
                                .foregroundColor(Color(hex: 0x868686))
                            Spacer()
                            Divider()
                                .frame(height: 20)
                            Spacer()
                        }
                        HStack{
                            if RoomType == "Four Sharing"{
                                Image("Four_Sharing_Bed")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 33, height: 11)
                                
                                Text(RoomType.uppercased())
                                    .font(.custom(OpenSans_Bold, size: 10))
                                    .foregroundColor(Color(hex: 0x868686))
                                Spacer()
                            }else if RoomType == "Triple Sharing"{
                                Image("Triple_Sharing_Bed")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 33, height: 11)
                                
                                Text(RoomType.uppercased())
                                    .font(.custom(OpenSans_Bold, size: 10))
                                    .foregroundColor(Color(hex: 0x868686))
                                Spacer()
                            }else if RoomType == "Double Sharing"{
                                Image("Twin_Sharing_Bed")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 33, height: 11)
                                
                                Text(RoomType.uppercased())
                                    .font(.custom(OpenSans_Bold, size: 10))
                                    .foregroundColor(Color(hex: 0x868686))
                                Spacer()
                            }else if RoomType == "Twin Sharing"{
                                Image("Twin_Sharing_Bed")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 33, height: 11)
                                
                                Text(RoomType.uppercased())
                                    .font(.custom(OpenSans_Bold, size: 10))
                                    .foregroundColor(Color(hex: 0x868686))
                                Spacer()
                            }
                        }
                        Divider()
                            .frame(height: 20)
                        Text(RoomPrefrence.uppercased())
                            .font(.custom(OpenSans_Bold, size: 10))
                            .foregroundColor(Color(hex: 0x868686))
                            .padding(.trailing, 8)
                        Spacer()
                        
                    }
                    .frame(maxWidth: getRect().width, maxHeight: 30)
                    .background(Color(hex: 0xF2F1F1))
                    .padding(.top, -8)
                    
                    ScrollView([.vertical, .horizontal]){
                        HStack(spacing: 1){
                            ForEach(arrFloor) { floor in
                                Button {
                                    floorUrl = "https://booking.upgradliving.com/demo/bedSelectionAppLink/\(floor.id ?? "")/\(studentAppID ?? "")/1"
                                    print(floorUrl)
                                    isCallWeb = true
                                    isCallLoad = true
                                    self.setSelectItem(item: floor.livingFloorCode ?? "")
                                } label: {
                                    Rectangle()
                                        .fill(selectedItem == floor.livingFloorCode ? Color(hex: 0xF36773) : Color(hex: 0xF8A4AB))
                                        .frame(width: 57, height: 45)
                                        .overlay {
                                            VStack{
                                                Text(floor.livingFloorCode ?? "")
                                                    .font(.custom(OpenSans_SemiBold, size: 12))
                                                    .foregroundColor(selectedItem == floor.livingFloorCode ? .white : .black)
                                                Text("Floor")
                                                    .font(.custom(OpenSans_SemiBold, size: 12))
                                                    .foregroundColor(selectedItem == floor.livingFloorCode ? .white : .black)
                                            }
                                        }
                                }
                            }
                        }
                    }
                    .frame(maxWidth: getRect().width, maxHeight: 50)
                    HStack(spacing: 8){
                        Spacer()
                        Rectangle()
                            .fill(Color(hex: 0xCCCCCC))
                            .frame(width: 21, height: 21)
                            .cornerRadius(5)
                        Text("Available")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x333333))
                        
                        Rectangle()
                            .fill(Color(hex: 0xDE1223))
                            .frame(width: 21, height: 21)
                            .cornerRadius(5)
                        Text("Sold")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(Color(hex: 0x333333))
                        
                    }
                    .frame(maxWidth: getRect().width)
                    .padding(.top, 6)
                    .padding(.trailing, 25)
                    
                    if isShowSuccessView{
                        NavigationLink(
                            "",
                            destination: BedSuccesView().navigationBarHidden(true),
                            isActive: $isShowSuccessView).isDetailLink(false)
                    }
                    
                    if isCallWeb{
                        WebViewBooking(title: $title, CallLoad: $isCallLoad,isToCallAPI: $isAPI, sendData: $getData, url: URL(string: floorUrl)!)
                            .onLoadStatusChanged { loading, error in
                                if loading {
                                    print("Loading started")
                                    self.title = "Loading…"
                                    isLoadig = true
                                }else {
                                    isLoadig = false
                                    isCallLoad = false
                                    print("Done loading.")
                                    if let error = error {
                                        self.error = error
                                        if self.title.isEmpty {
                                            self.title = "Error"
                                        }
                                    }else if self.title.isEmpty {
                                        self.title = "Some Place"
                                    }
                                }
                            }
                    }
                    if isAPI{
                        BedDetailsView(getBedData: getData, isShowAlert: $showingAlert, alertMessage: $alertMessage, showSheetPopup: $isShowSheetPopup, isShowSuccessView: $isShowSuccessView, RoomType: RoomType)
                            .sheet(isPresented: $isShowSheetPopup) {
                                BedDetailsView(getBedData: getData, isShowAlert: $showingAlert, alertMessage: $alertMessage, showSheetPopup: $isShowSheetPopup, isShowSuccessView: $isShowSuccessView, RoomType: RoomType)
                            }
                    }
                }
                if isShowLoader{
                    LoadingView()
                }
                if isLoadig{
                    LoadingView()
                }
            }
            .onAppear{
                if networkMonitor.isConnected{
                    viewModelFloor.getFloor(appId: studentAppID ?? "") { FloorData in
                        if FloorData.status == 1{
                            GenderName = FloorData.data?.floorType ?? ""
                            RoomType = FloorData.data?.roomType ?? ""
                            RoomPrefrence = FloorData.data?.dietry ?? ""
                            arrFloor = FloorData.data?.floors ?? []
                            let NewFloorId = arrFloor[0].id
                            floorUrl = "https://booking.upgradliving.com/demo/bedSelectionAppLink/\(NewFloorId ?? "")/\(studentAppID ?? "")/1"
                            setSelectItem(item: arrFloor[0].livingFloorCode ?? "")
                            isCallWeb = true
                        }else{
                            alertMessage = FloorData.msg ?? ""
                            AlertShow = "0"
                            showingAlert = true
                            isCallWeb = false
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
                        
                    }else{
                        
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
    func setSelectItem(item: String) {
        selectedItem = item
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
