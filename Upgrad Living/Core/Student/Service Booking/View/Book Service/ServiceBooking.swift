//
//  ServiceBooking.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 21/06/23.
//

import SwiftUI

struct ServiceBooking: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @StateObject private var viewModel = ServiceSlotViewModel()
    @StateObject private var viewModelBook = BookServiceSlotViewModel()
    @StateObject private var viewModelDetails = ListServiceSlotViewModel()
    @StateObject private var viewModelCategory = TicketCategoryViewModel()
    
    @State private var isRequestSelect = false
    @State private var isCategory = false
    @State private var CategoryName = ""
    @State private var CategoryID = "1"
    
    @State private var arrServiceDetails = [ListServiceSlot]()
    @State private var arrBookService = [TicketCategory]()
    
    @State private var todayDate = Date()
    
    @State private var startDate =  ""
    
    @State private var isServiceConfirm = false
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    @State private var showing2ButtonAlert = false
    @State private var alertTitle = ""
    @State private var buttonTitle = ""
        
    var twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    //API
    
    @State private var arrSlotWise = [ServiceSlot]()
    @State private var currentSlotTimimgId = ""
    @State private var currentSlotId = ""
    
    
    @Binding var isBackServiceBooking: Bool
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView(showsIndicators: false) {
                    ServiceBookingTop(isBackServiceBooking: $isBackServiceBooking)
                    VStack{
                        VStack{
                            HStack(spacing: 0){
                                HStack{
                                    Image(isRequestSelect ? "Book_A_Service_UnSelect" : "Book_A_Service_Select")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 21, height: 19)
                                    
                                    Text("Book a Service")
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
                                    Image(isRequestSelect ? "Service_Booking_Select" : "Service_Booking_UnSelect")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 21, height: 19)
                                    
                                    Text("Bookings")
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
                                    HStack{
                                        Text("Pick your Service Category")
                                            .font(.custom(OpenSans_Bold, size: 16))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                            .padding(.top)
                                            .padding(.bottom)
                                        Spacer()
                                    }
                                    .padding(.leading)
                                    
                                    Button {
                                        isCategory.toggle()
                                    } label: {
                                        HStack(spacing: 15){
                                            Text(CategoryName)
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 1.0))
                                                .padding(.leading)
                                            
                                            Spacer()
                                            
                                            Image(isCategory ?  "User_Category_DeSelect" : "User_Category_Select")
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
                                    if isCategory{
                                        VStack{
                                            ForEach(arrBookService) { request in
                                                Button {
                                                    CategoryID = request.id ?? ""
                                                    CategoryName = request.name ?? ""
                                                    callServiceSlotAPI()
                                                    isCategory.toggle()
                                                } label: {
                                                    VStack{
                                                        HStack{
                                                            Text(request.name ?? "")
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
                                    VStack{
                                        HStack{
                                            Text("Choose the date")
                                                .font(.custom(OpenSans_Bold, size: 16))
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                                .padding(.top)
                                            Spacer()
                                        }
                                        .padding(.leading)
                                        
                                        Button {
                                            showDatePickerAlert()
                                        } label: {
                                            RoundedRectangle(cornerRadius: 5)
                                                .fill(.white)
                                                .frame(height: 40)
                                                .padding(.horizontal)
                                                .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                                .overlay {
                                                    HStack{
                                                        Image("Request_Calender_icon")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 25, height: 35)
                                                            .padding(.leading, 20)
                                                        
                                                        Text(startDate)
                                                            .font(.custom(OpenSans_Bold, size: 14))
                                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                                                        Spacer()
                                                    }
                                                }
                                        }
                                        .padding(.bottom, 20)
                                    }
                                    VStack{
                                        HStack{
                                            Text("Select your time slot")
                                                .font(.custom(OpenSans_Bold, size: 16))
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                                .padding(.top)
                                            Spacer()
                                        }
                                        .padding(.leading)
                                        
                                        ForEach(Array(arrSlotWise.enumerated()), id: \.offset) { index, wise in
                                            HStack{
                                                Text(wise.slotName ?? "")
                                                    .font(.custom(OpenSans_Bold, size: 14))
                                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                                    .padding(.top)
                                                Spacer()
                                            }
                                            .padding(.leading)
                                            
                                            LazyVGrid(columns: twoColumnGrid) {
                                                ForEach(wise.slotTimings ?? []) { timing in
                                                    Button {
                                                        if timing.isTimeSlotAvailable == "0"{
                                                            currentSlotTimimgId = timing.id ?? ""
                                                            currentSlotId = wise.slotID ?? ""
                                                            alertTitle = "Are you sure you want to Book This Slot?"
                                                            buttonTitle = "Book"
                                                            showing2ButtonAlert = true
                                                        }else{
                                                            alertMessage = "Current slot not available"
                                                            AlertShow = "0"
                                                            showingAlert = true
                                                        }
                                                    } label: {
                                                        SlotTimimgBookingCell(timing: timing)
                                                    }
                                                }
                                            }
                                            .padding(.horizontal)
                                        }
                                    }
                                }
                            }
                            if isRequestSelect{
                                ServiceBookingView(arrslotDetails: arrServiceDetails)
                                    .padding(.top)
                            }
                        }
                    }
                    .frame(maxWidth: getRect().width)
                    .background(colorScheme == .light ? .white : .black)
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                    .offset(y: -80)
                }
                if viewModelBook.isLoadingData{
                    LoadingView()
                }
                if viewModel.isLoadingData{
                    LoadingView()
                }
                if viewModelDetails.isLoadingData{
                    LoadingView()
                }
            }
            .onAppear{
                // Create Date Formatter
                let dateFormatter = DateFormatter()
                // Set Date Format
                dateFormatter.dateFormat = "yyyy-MM-dd"
                // Convert Date to String
                startDate =  dateFormatter.string(from: todayDate)
                callServiceSlotAPI()
                
                viewModelDetails.getBookServiceSlot(appId: studentAppID ?? "") { getDetails in
                    if getDetails.status == 1{
                        arrServiceDetails = getDetails.data ?? []
                    }else{
                        arrSlotWise = []
                        alertMessage = getDetails.msg ?? ""
                        AlertShow = "0"
                        showingAlert = true
                    }
                }
                viewModelCategory.getTicketCategory { category in
                    if category.status == 1{
                        arrBookService = category.data?.ticketCategories ?? []
                    }else{
                        alertMessage = category.msg ?? ""
                        AlertShow = "0"
                        showingAlert = true
                    }
                }
            }
            .onChange(of: isRequestSelect, perform: { _ in
                if isRequestSelect{
                    viewModelDetails.getBookServiceSlot(appId: studentAppID ?? "") { getDetails in
                        if getDetails.status == 1{
                            arrServiceDetails = getDetails.data ?? []
                        }else{
                            alertMessage = getDetails.msg ?? ""
                            AlertShow = "0"
                            showingAlert = true
                        }
                    }
                }
            })
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .alert(alertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    if AlertShow == "1"{
                        isRequestSelect = true
                    }else{
                        
                    }
                }
            }
            .alert(isPresented:$showing2ButtonAlert) {
                Alert(
                    title: Text(alertTitle),
                    message: Text(""),
                    primaryButton: .destructive(Text(buttonTitle)) {
                        if networkMonitor.isConnected{
                            viewModelBook.PostBookServiceSlot(
                                appId: studentAppID ?? "",
                                categoryId: CategoryID,
                                date: startDate,
                                slotId: currentSlotId,
                                timeSlotId: currentSlotTimimgId) { book in
                                    if book.status == 1{
                                        alertMessage = "Slot Book Successfully"
                                        AlertShow = "1"
                                        showingAlert = true
                                    }else{
                                        alertMessage = book.msg ?? ""
                                        AlertShow = "0"
                                        showingAlert = true
                                    }
                                }
                        }else{
                            alertMessage = "Please Check Your Internet Connection"
                            AlertShow = "0"
                            showingAlert = true
                        }
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
    
    //MARK: - ConvertDate Method
    func convertDate(){
        // Create Date Formatter
        let dateFormatter = DateFormatter()
        // Set Date Format
        dateFormatter.dateFormat = "yyyy-MM-dd"
        // Convert Date to String
        startDate =  dateFormatter.string(from: todayDate)
        callServiceSlotAPI()
    }
    //MARK: - Show Date Picker
    func showDatePickerAlert() {//\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n
        let alertVC = UIAlertController(title: "\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        let datePicker: UIDatePicker = UIDatePicker()
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.minimumDate = Date()
        alertVC.view.addSubview(datePicker)
        datePicker.frame.size.width = UIScreen.main.bounds.width
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.todayDate = datePicker.date
            convertDate()
        }
        alertVC.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertVC.addAction(cancelAction)
        
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            viewController.present(alertVC, animated: true, completion: nil)
        }
    }
    
    func callServiceSlotAPI(){
        if networkMonitor.isConnected{
            viewModel.getBookServiceSlot(
                appId: studentAppID ?? "",
                categoryId: CategoryID,
                date: startDate) { service in
                    if service.status == 1{
                        arrSlotWise = service.data ?? []
                    }else{
                        arrSlotWise = []
                        alertMessage = service.msg ?? ""
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
}
