//
//  ParentRoomBooking.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 19/06/23.
//

import SwiftUI

struct ParentRoomBooking: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var viewModel = BookGuestViewModel()
    
    @State private var tapCount: Int = 1
    
    @State private var guest1 = ""
    @State private var relationGuest1 = false
    @State private var guest1Relation = "Select Relation"
    @State private var guest1RelationId = ""
    
    @State private var guest2 = ""
    @State private var relationGuest2 = false
    @State private var guest2Relation = "Select Relation"
    @State private var guest2RelationId = ""
    
    @Binding var isBackParentGuestRoom: Bool
    
    @State private var isconfirm = false
    @State private var isViewBooking = false
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    @State private var isShowDatePicker = false
    @State private var startDate = ""
    @State private var endDate = ""
    @State private var DifferenceBetweenDays = ""
    
    @State private var arrGuest = [Any]()
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView(showsIndicators: false) {
                    ZStack(alignment: .top){
                        Image("Guest_Room_Top")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: getRect().width, maxHeight: 300)
                        VStack{
                            HStack{
                                Spacer(minLength: 0)
                                Text("Guest room booking")
                                    .font(.custom(OpenSans_SemiBold, size: 18))
                                    .foregroundColor(colorScheme == .light ? .white : .white)
                                    .padding(.trailing, 30)
                                Spacer(minLength: 0)
                            }
                            Spacer()
                        }
                        .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                    }
                    ZStack(alignment: .bottomTrailing) {
                        VStack{
                            Text("View booking".uppercased())
                                .font(.custom(OpenSans_Bold, size: 14))
                                .foregroundColor(Color(hex: 0xDE1223))
                        }
                        .frame(width: 250, height: 60)
                        .background(colorScheme == .light ? .white : .black)
                        .cornerRadius(20)
                        .shadow(color: .gray, radius: 3, x: 0, y: 0)
                    }
                    .offset(y: -60)
                    .zIndex(1)
                    .onTapGesture {
                        isViewBooking = true
                    }
                    VStack{
                        VStack{
                            Text(" ")
                                .padding(.top, 30)
                            
                            HStack{
                                Image("Guest_Calender")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 21, height: 23)
                                
                                Text("Choose the dates")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(Color(hex: 0x333333))
                                
                                Image("Guest_Next_Arrow")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 18, height: 18)
                            }
                            .onTapGesture{
                                isShowDatePicker = true
                            }
                            .frame(width: 230)
                            .padding()
                            .background(Color(hex: 0xFEEEF0))
                            .cornerRadius(20)
                            .padding(.bottom, 5)
                            
                            VStack{
                                HStack{
                                    VStack(alignment: .leading,spacing: 8){
                                        Text("Check-in")
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(Color(hex: 0x868686))
                                        
                                        Text(startDate)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                    }
                                    Spacer()
                                    
                                    Rectangle()
                                        .fill(Color(hex: 0x969696))
                                        .frame(width: 0.5, height: 25)
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .leading,spacing: 8){
                                        Text("Check-out")
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(Color(hex: 0x868686))
                                        
                                        Text(endDate)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                    }
                                }
                                
                                HStack{
                                    Spacer()
                                    
                                    Text("\(DifferenceBetweenDays) nights")
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                        .padding(5)
                                        .padding(.horizontal, 5)
                                        .overlay{
                                            Rectangle()
                                                .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [1]))
                                                .foregroundColor(Color(hex: 0xDE1223))
                                        }
                                    
                                    Spacer()
                                }
                            }
                            .frame(width: 230)
                            .padding()
                            .overlay{
                                RoundedRectangle(cornerRadius: 12)
                                    .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [1]))
                                    .foregroundColor(Color(hex: 0xDE1223))
                            }
                            .padding(.bottom)
                        }
                        
                        VStack{
                            HStack{
                                Text("No. of guests")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                
                                Image("NoOfGuest")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 26, height: 20)
                                
                                Spacer()
                                
                            }
                            .padding(.leading)
                            .padding(.bottom)
                            
                            HStack{
                                Spacer()
                                
                                Button {
                                    if tapCount > 1{
                                        tapCount = tapCount - 1
                                        guest2 = ""
                                        guest2Relation = "Select Relation"
                                    }
                                } label: {
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color(hex: 0xFEEEF0))
                                        .frame(width: 40, height: 40)
                                        .overlay{
                                            Text("-")
                                                .font(.custom(OpenSans_Bold, size: 16))
                                                .foregroundColor(Color(hex: 0x868686))
                                        }
                                }
                                
                                Spacer()
                                
                                Text("\(tapCount)")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                
                                Spacer()
                                
                                Button {
                                    if tapCount < 2{
                                        tapCount = tapCount + 1
                                    }
                                } label: {
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color(hex: 0xFEEEF0))
                                        .frame(width: 40, height: 40)
                                        .overlay{
                                            Text("+")
                                                .font(.custom(OpenSans_Bold, size: 16))
                                                .foregroundColor(Color(hex: 0x868686))
                                        }
                                }
                                Spacer()
                                
                            }
                            .padding(.vertical, 8)
                            .frame(width: getRect().width - 40)
                            .overlay{
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(hex: 0xDE1223), lineWidth: 1)
                            }
                            if tapCount == 1{
                                VStack(alignment: .leading){
                                    Text("Guest 1")
                                        .font(.custom(OpenSans_SemiBold, size: 16))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                    
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color(hex: 0xFEEEF0))
                                        .frame(width: getRect().width - 40, height: 43, alignment: .leading)
                                        .overlay{
                                            HStack{
                                                Rectangle()
                                                    .fill(.clear)
                                                    .frame(width: 4, height: 43)
                                                TextField("", text: $guest1)
                                                    .disableAutocorrection(true)
                                                    .foregroundColor(Color(hex: 0x333333))
                                            }
                                        }
                                    
                                    Text("Relation")
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x868686, alpha: 1.0) : Color(hex: 0x868686, alpha: 1.0))
                                    
                                    Button {
                                        relationGuest1.toggle()
                                    } label: {
                                        HStack{
                                            Text(guest1Relation)
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                                .padding(.leading)
                                            
                                            Spacer()
                                            
                                            Image(relationGuest1 ?  "User_Category_DeSelect" : "User_Category_Select")
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
                                    if relationGuest1{
                                        VStack{
                                            ForEach(arrRelation) { category in
                                                Button {
                                                    guest1Relation = category.Name
                                                    guest1RelationId = category.id
                                                    relationGuest1.toggle()
                                                } label: {
                                                    VStack{
                                                        HStack{
                                                            Text(category.Name)
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
                                }
                            }else if tapCount == 2{
                                VStack(alignment: .leading){
                                    Text("Guest 1")
                                        .font(.custom(OpenSans_SemiBold, size: 16))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                    
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color(hex: 0xFEEEF0))
                                        .frame(width: getRect().width - 40, height: 43, alignment: .leading)
                                        .overlay{
                                            HStack{
                                                Rectangle()
                                                    .fill(.clear)
                                                    .frame(width: 4, height: 43)
                                                TextField("", text: $guest1)
                                                    .disableAutocorrection(true)
                                                    .foregroundColor(Color(hex: 0x333333))
                                            }
                                        }
                                    
                                    Text("Relation")
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x868686, alpha: 1.0) : Color(hex: 0x868686, alpha: 1.0))
                                    
                                    Button {
                                        relationGuest1.toggle()
                                    } label: {
                                        HStack{
                                            Text(guest1Relation)
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                                .padding(.leading)
                                            
                                            Spacer()
                                            
                                            Image(relationGuest1 ?  "User_Category_DeSelect" : "User_Category_Select")
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
                                    if relationGuest1{
                                        VStack{
                                            ForEach(arrRelation) { category in
                                                Button {
                                                    guest1Relation = category.Name
                                                    guest1RelationId = category.id
                                                    relationGuest1.toggle()
                                                } label: {
                                                    VStack{
                                                        HStack{
                                                            Text(category.Name)
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
                                }
                                VStack(alignment: .leading){
                                    Text("Guest 2")
                                        .font(.custom(OpenSans_SemiBold, size: 16))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                    
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color(hex: 0xFEEEF0))
                                        .frame(width: getRect().width - 40, height: 43, alignment: .leading)
                                        .overlay{
                                            HStack{
                                                Rectangle()
                                                    .fill(.clear)
                                                    .frame(width: 4, height: 43)
                                                TextField("", text: $guest2)
                                                    .disableAutocorrection(true)
                                                    .foregroundColor(Color(hex: 0x333333))
                                            }
                                        }
                                    
                                    Text("Relation")
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x868686, alpha: 1.0) : Color(hex: 0x868686, alpha: 1.0))
                                    
                                    Button {
                                        relationGuest2.toggle()
                                    } label: {
                                        HStack{
                                            Text(guest2Relation)
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                                .padding(.leading)
                                            
                                            Spacer()
                                            
                                            Image(relationGuest2 ?  "User_Category_DeSelect" : "User_Category_Select")
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
                                    if relationGuest2{
                                        VStack{
                                            ForEach(arrRelation) { category in
                                                Button {
                                                    guest2Relation = category.Name
                                                    guest2RelationId = category.id
                                                    relationGuest2.toggle()
                                                } label: {
                                                    VStack{
                                                        HStack{
                                                            Text(category.Name)
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
                                }
                            }
                            VStack(alignment: .leading){
                                Text("Please note: ")
                                    .font(.custom(OpenSans_SemiBold, size: 15))
                                    .foregroundColor(Color(hex: 0xDE1223))
                                
                                +
                                
                                Text(" Govt. issued ID card is mandatory at the time of check-in")
                                    .font(.custom(OpenSans_SemiBold, size: 15))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                            }
                            .padding(.horizontal)
                            .padding(.top)
                            .padding(.bottom)
                            
                            DetailsViewBottom(textName: "Book Now", imageName: "Guest_Book_Now_icon")
                                .onTapGesture {
                                    let dateFormatterStart = DateFormatter()
                                    dateFormatterStart.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
                                    dateFormatterStart.dateFormat = "dd MMM yyyy"
                                    let Startdate = dateFormatterStart.date(from:startDate)!
                                    let startModifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: Startdate)
                                    let FirstDate = startModifiedDate?.stringFromFormat("yyyy-MM-dd")
                                    
                                    let dateFormatterEnd = DateFormatter()
                                    dateFormatterEnd.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
                                    dateFormatterEnd.dateFormat = "dd MMM yyyy"
                                    let Enddate = dateFormatterEnd.date(from:endDate)!
                                    let EndModifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: Enddate)
                                    let LastDate = EndModifiedDate?.stringFromFormat("yyyy-MM-dd")
                                    
                                    if tapCount == 1{
                                        if guest1.isEmpty{
                                            alertMessage = "Please Enter Guest 1 Name"
                                            AlertShow = "0"
                                            showingAlert = true
                                        }else if guest1RelationId.isEmpty{
                                            alertMessage = "Please Select Guest 1 Relation"
                                            AlertShow = "0"
                                            showingAlert = true
                                        }else{
                                            let Guest1 = ["guestCategory":guest1RelationId,"guestName": guest1]
                                            arrGuest.append(Guest1)
                                            viewModel.getProfileInfo(appId: studentAppID ?? "",
                                                                     reqBy: "1",
                                                                     startDate: FirstDate ?? "",
                                                                     endDate: LastDate ?? "",
                                                                     noofGuests: "1",
                                                                     guests: arrGuest as NSArray) { guest in
                                                if guest.status == 1{
                                                    alertMessage = guest.msg ?? ""
                                                    AlertShow = "2"
                                                    showingAlert = true
                                                }else{
                                                    alertMessage = guest.msg ?? ""
                                                    AlertShow = "0"
                                                    showingAlert = true
                                                }
                                            }
                                        }
                                    }else{
                                        if guest1.isEmpty{
                                            alertMessage = "Please Enter Guest 1 Name"
                                            AlertShow = "0"
                                            showingAlert = true
                                        }else if guest1RelationId.isEmpty{
                                            alertMessage = "Please Select Guest 1 Relation"
                                            AlertShow = "0"
                                            showingAlert = true
                                        }else if guest2.isEmpty{
                                            alertMessage = "Please Enter Guest 2 Name"
                                            AlertShow = "0"
                                            showingAlert = true
                                        }else if guest2RelationId.isEmpty{
                                            alertMessage = "Please Select Guest 2 Relation"
                                            AlertShow = "0"
                                            showingAlert = true
                                        }else{
                                            let Guest1 = ["guestCategory":guest1RelationId,"guestName": guest1]
                                            let Guest2 = ["guestCategory":guest2RelationId,"guestName": guest2]
                                            arrGuest.append(Guest1)
                                            arrGuest.append(Guest2)
                                            
                                            viewModel.getProfileInfo(appId: studentAppID ?? "",
                                                                     reqBy: "1",
                                                                     startDate: FirstDate ?? "",
                                                                     endDate: LastDate ?? "",
                                                                     noofGuests: "2",
                                                                     guests: arrGuest as NSArray) { guest in
                                                if guest.status == 1{
                                                    alertMessage = guest.msg ?? ""
                                                    AlertShow = "2"
                                                    showingAlert = true
                                                }else{
                                                    alertMessage = guest.msg ?? ""
                                                    AlertShow = "0"
                                                    showingAlert = true
                                                }
                                            }
                                        }
                                    }
                                }
                        }
                        NavigationLink(
                            "",
                            destination: ParentRoomSuccessView(isHome: $isBackParentGuestRoom).navigationBarHidden(true),
                            isActive: $isconfirm).isDetailLink(false)
                        
                        NavigationLink(
                            "",
                            destination: ParentBookGuestRoomView().navigationBarHidden(true),
                            isActive: $isViewBooking).isDetailLink(false)
                    }
                    .frame(maxWidth: getRect().width)
                    .background(colorScheme == .light ? .white : .black)
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                    .offset(y: -100)
                }
                if isShowDatePicker{
                    GuestDatePopup(
                        show: $isShowDatePicker,
                        CustomStartDate: $startDate,
                        CustomEndDate: $endDate,
                        DifferenceBetweenDays: $DifferenceBetweenDays,
                        ShowAlertPopup: $showingAlert,
                        AlertMessage: $alertMessage,
                        AlertShow: $AlertShow
                    )
                }
                if viewModel.isLoadingData{
                    LoadingView()
                }
            }
            .keyboardAware()
            .navigationBarHidden(true)
            .ignoresSafeArea()
            .onAppear{
                let now = Date.now
                let StartModifiedDate = Calendar.current.date(byAdding: .day, value: 0, to: now)
                let StartDate = StartModifiedDate?.stringFromFormat("dd MMM yyyy")
                startDate = StartDate ?? ""
                
                let EndModifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: now)
                let EndDate = EndModifiedDate?.stringFromFormat("dd MMM yyyy")
                endDate = EndDate ?? ""
                
                DifferenceBetweenDays = "1"
            }
            .alert(alertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    if AlertShow == "1"{
                        isShowDatePicker = true
                    }else if AlertShow == "2"{
                        isconfirm = true
                    }else{
                        
                    }
                }
            }
        }
    }
}
