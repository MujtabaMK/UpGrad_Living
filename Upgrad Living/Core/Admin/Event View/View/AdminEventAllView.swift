//
//  AdminEventAllView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 10/07/23.
//

import SwiftUI

struct AdminEventAllView: View {
    @Binding var isEventDetails: Bool
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @StateObject private var viewModel = GetAllEventViewModel()
    @StateObject private var viewModeFav = GetAllFavoriteViewModel()
    @StateObject private var viewModelCategory = CategoryViewModel()
    
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    @State private var isHome = false
    
    @State private var arrAllEvent = [AllEvent]()
    @State private var arrAllFav = [AllFavorites]()
    @State private var arrCreativity = [FilterCatagory]()
    @State private var arrCreavitySelected = [String]()
    @State private var isEventFav = false
    @State private var isEventsave = false
    
    @State var isCallAPI = false
    
    //Filter
    @State private var SearchText = ""
    @State private var isTextEditingEnded = false
    @State private var isFilter = false
    @State private var isTodaySelect = false
    @State private var isTomorrrowSelect = false
    @State private var isThisWeekSelect = false
    @State private var isChooseFromCalender = false
    @State private var startDate = ""
    @State private var endDate = ""
    @State private var FilterType = ""
    @State private var noEvents = false
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    HStack{
                        Spacer(minLength: 0)
                        Text("Events")
                            .font(.custom(OpenSans_SemiBold, size: 18))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x000000) : .white)
                        Spacer(minLength: 0)
                    }
                    .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                    Divider()
                    
                    VStack{
                        if !noEvents{
                            SearchBarEvent(text: $SearchText, isFilterClick: $isFilter)
                        }
                        
                        ScrollView(showsIndicators: false) {
                            ForEach(Array(searchResults.enumerated()), id: \.offset) { index, Event in
                                AdminUpcommingEventsCell(post: Event, isShowAlert: $showingAlert,alertMessage: $alertMessage, isEventDetails: $isEventDetails, isCallAPI: $isCallAPI)
                                    .padding(.horizontal, 15)
                                    .padding(.leading, 5)
                                    .frame(width: getRect().width, height: 300)
                            }
                        }
                    }
                    if isFilter{
                        VStack(alignment: .leading){
                            HStack{
                                Button {
                                    withAnimation {
                                        isFilter = false
                                    }
                                } label: {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 15, height: 15)
                                        .padding(.leading, 20)
                                        .foregroundColor(colorScheme == .light ? .black : .white)
                                }
                                Spacer()
                                Text("Filter")
                                    .font(.custom(OpenSans_Bold, size: 20))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                                Spacer()
                            }
                            .padding(.top)
                            VStack(alignment: .leading){
                                Text("Categories")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                                    .padding(.leading)
                                LazyVGrid(columns: threeColumnGrid) {
                                    ForEach(arrCreativity) { cat in
                                        Button {
                                            if let indexNew = arrCreavitySelected.firstIndex(of: cat.id ?? "")  {
                                                arrCreavitySelected.remove(at: indexNew)
                                                print(arrCreavitySelected)
                                            } else {
                                                arrCreavitySelected.append(cat.id ?? "")
                                                print(arrCreavitySelected)
                                            }
                                        } label: {
                                            Text(cat.categName ?? "")
                                                .font(.custom(OpenSans_SemiBold, size: 10))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                                                .background(.white)
                                                .cornerRadius(15)
                                                .overlay(
                                                    RoundedRectangle(
                                                        cornerRadius: 15.0)
                                                    .strokeBorder(arrCreavitySelected.contains(cat.id ?? "") ? Color(hex: 0xF5868F) : .gray,
                                                                  style: StrokeStyle(lineWidth: arrCreavitySelected.contains(cat.id ?? "") ? 2.0 : 1.0))
                                                )
                                                .padding(.horizontal, 6)
                                        }
                                    }
                                }
                                
                                Text("Date")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                                    .padding(.leading)
                                VStack(alignment: .leading){
                                    HStack{
                                        Button {
                                            let date = Date()
                                            let df = DateFormatter()
                                            
                                            df.dateFormat = "yyyy-MM-dd" // prints out "Dec 10, 2021"
                                            print(df.string(from: date))
                                            let CurrentDate = df.string(from: date)
                                            startDate = CurrentDate
                                            endDate = CurrentDate
                                            print(startDate)
                                            FilterType = "1"
                                            isTodaySelect = true
                                            isTomorrrowSelect = false
                                            isThisWeekSelect = false
                                            isChooseFromCalender = false
                                        } label: {
                                            Text("Today")
                                                .font(.custom(OpenSans_SemiBold, size: 10))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .frame(minWidth: 0, maxWidth: 80, minHeight: 50)
                                                .background(.white)
                                                .cornerRadius(15)
                                                .overlay(
                                                    RoundedRectangle(
                                                        cornerRadius: 15.0)
                                                    .strokeBorder(isTodaySelect ? Color(hex: 0xF5868F) : .gray,
                                                                  style: StrokeStyle(lineWidth: isTodaySelect ? 2.0 : 1.0))
                                                )
                                        }
                                        
                                        Button {
                                            startDate = yesterDay()
                                            endDate = yesterDay()
                                            print(startDate)
                                            FilterType = "2"
                                            isTodaySelect = false
                                            isTomorrrowSelect = true
                                            isThisWeekSelect = false
                                            isChooseFromCalender = false
                                        } label: {
                                            Text("Tomorrow")
                                                .font(.custom(OpenSans_SemiBold, size: 10))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .frame(minWidth: 0, maxWidth: 80, minHeight: 50)
                                                .background(.white)
                                                .cornerRadius(15)
                                                .overlay(
                                                    RoundedRectangle(
                                                        cornerRadius: 15.0)
                                                    .strokeBorder(isTomorrrowSelect ? Color(hex: 0xF5868F) : .gray,
                                                                  style: StrokeStyle(lineWidth: isTomorrrowSelect ? 2.0 : 1.0))
                                                )
                                        }
                                        
                                        Button {
                                            let dateStart = Date().startOfWeek
                                            let dfStart = DateFormatter()
                                            
                                            dfStart.dateFormat = "yyyy-MM-dd" // prints out "Dec 10, 2021"
                                            let CurrentDate = dfStart.string(from: dateStart)
                                            startDate = CurrentDate
                                            print(startDate)
                                            
                                            let dateEnd = Date().endOfWeek
                                            let dfEnd = DateFormatter()
                                            
                                            dfEnd.dateFormat = "yyyy-MM-dd" // prints out "Dec 10, 2021"
                                            let EndDate = dfEnd.string(from: dateEnd)
                                            endDate = EndDate
                                            print(endDate)
                                            
                                            FilterType = "3"
                                            isTodaySelect = false
                                            isTomorrrowSelect = false
                                            isThisWeekSelect = true
                                            isChooseFromCalender = false
                                        } label: {
                                            Text("This Week")
                                                .font(.custom(OpenSans_SemiBold, size: 10))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .frame(minWidth: 0, maxWidth: 80, minHeight: 50)
                                                .background(.white)
                                                .cornerRadius(15)
                                                .overlay(
                                                    RoundedRectangle(
                                                        cornerRadius: 15.0)
                                                    .strokeBorder(isThisWeekSelect ? Color(hex: 0xF5868F) : .gray,
                                                                  style: StrokeStyle(lineWidth: isThisWeekSelect ? 2.0 : 1.0))
                                                )
                                        }
                                    }
                                    .padding(.leading, 3)
                                    
                                    Button {
                                        FilterType = "4"
                                        isTodaySelect = false
                                        isTomorrrowSelect = false
                                        isThisWeekSelect = false
                                        isChooseFromCalender = true
                                    } label: {
                                        HStack(spacing: 6){
                                            Image("Choose_From_Calender")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 21, height: 21)
                                            Text("Choose from calender")
                                                .font(.custom(OpenSans_SemiBold, size: 10))
                                                .foregroundColor(Color(hex: 0x333333))
                                            Image("Event_Filter_Next")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 4.5, height: 9)
                                        }
                                        .frame(minWidth: 0, maxWidth: 200, minHeight: 50)
                                        .background(.white)
                                        .cornerRadius(15)
                                        .overlay(
                                            RoundedRectangle(
                                                cornerRadius: 15.0)
                                            .strokeBorder(isChooseFromCalender ? Color(hex: 0xF5868F) : .gray,
                                                          style: StrokeStyle(lineWidth: isChooseFromCalender ? 2.0 : 1.0))
                                        )
                                        .padding(.leading, 3)
                                        .padding(.bottom, 20)
                                    }
                                    
                                    HStack{
                                        Spacer()
                                        Button {
                                            arrCreavitySelected = []
                                            isTodaySelect = false
                                            isTomorrrowSelect = false
                                            isThisWeekSelect = false
                                            isChooseFromCalender = false
                                            startDate = ""
                                            endDate = ""
                                        } label: {
                                            Text("Clear")
                                                .font(.custom(OpenSans_SemiBold, size: 15))
                                                .foregroundColor(Color(hex: 0x333333))
                                                .padding()
                                                .frame(width: 130)
                                                .background(.white)
                                                .cornerRadius(50)
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 50)
                                                        .strokeBorder(Color(hex: 0xB20710), lineWidth: 1)
                                                }
                                        }
                                        Spacer()
                                        Button {
                                            if networkMonitor.isConnected{
                                                viewModel.getAllEvents(appId: studentAppID ?? "",eventCategories: arrCreavitySelected as NSArray, filter: FilterType, startDate: startDate, endDate: endDate) { Event in
                                                    if Event.status == 1{
                                                        isEventFav = false
                                                        isFilter = false
                                                        arrAllEvent = Event.data ?? []
                                                        if arrAllEvent.count > 0{
                                                            noEvents = false
                                                        }else{
                                                            noEvents = true
                                                        }
                                                    }else{
                                                        noEvents = true
                                                        arrAllEvent = Event.data ?? []
                                                        alertMessage = Event.msg ?? ""
                                                        AlertShow = "0"
                                                        isFilter = false
                                                        if alertMessage != "Oops! No Data."{
                                                            showingAlert = true
                                                        }
                                                    }
                                                }
                                            }else{
                                                alertMessage = "Please Check Your Internet Connection"
                                                AlertShow = "0"
                                                showingAlert = true
                                            }
                                        } label: {
                                            Text("Apply Filter")
                                                .font(.custom(OpenSans_SemiBold, size: 15))
                                                .frame(width: 140, alignment: .center)
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
                                    .padding(.bottom, 30)
                                }
                            }
                        }
                        .frame(maxWidth: getRect().width - 10, maxHeight: isFilter ? 500 : 0)
                        .transition(.move(edge: isFilter ? .bottom : .top))
                        .background(colorScheme == .light ? .white : .black)
                        .cornerRadius(15, corners: [.topLeft, .topRight])
                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                        .offset(y: 10)
                        .padding(.bottom, 80)
                    }
                }
                
                if isChooseFromCalender{
                    MultipleDatePopup(show: $isChooseFromCalender, CustomStartDate: $startDate, CustomEndDate: $endDate)
                }
                if noEvents{
                    VStack{
                        Image("No_Events")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 207, height: 207)
                            .padding(.bottom)
                        
                        Text("No Upcoming Event")
                            .font(.custom(OpenSans_Bold, size: 20))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                        Text("Check this space for more info....")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0xDE1223) : Color(hex: 0xDE1223))
                    }
                }
            }
            .padding(.bottom, 50)
            .navigationBarHidden(true)
            .ignoresSafeArea()
            .onAppear{
                if networkMonitor.isConnected{
                    viewModel.getAllEvents(appId: studentAppID ?? "",eventCategories: arrCreavitySelected as NSArray, filter: "", startDate: "", endDate: "") { Event in
                        if Event.status == 1{
                            isEventFav = false
                            arrAllEvent = Event.data ?? []
                            if arrAllEvent.count > 0{
                                noEvents = false
                            }else{
                                noEvents = true
                            }
                        }else{
                            noEvents = true
                            alertMessage = Event.msg ?? ""
                            AlertShow = "0"
                            if alertMessage != "Oops! No Data."{
                                showingAlert = true
                            }
                        }
                    }
                    viewModelCategory.getCategory(appId: studentAppID ?? "") { category in
                        if category.status == 1{
                            arrCreativity = category.data ?? []
                        }
                    }
                }else{
                    alertMessage = "Please Check Your Internet Connection"
                    AlertShow = "0"
                    showingAlert = true
                }
            }
            .onChange(of: isCallAPI, perform: { newValue in
                if networkMonitor.isConnected{
                    viewModel.getAllEvents(appId: studentAppID ?? "",eventCategories: arrCreavitySelected as NSArray, filter: "", startDate: "", endDate: "") { Event in
                        if Event.status == 1{
                            isEventFav = false
                            arrAllEvent = Event.data ?? []
                        }else{
                            alertMessage = Event.msg ?? ""
                            AlertShow = "0"
                            showingAlert = true
                        }
                    }
                    viewModelCategory.getCategory(appId: studentAppID ?? "") { category in
                        if category.status == 1{
                            arrCreativity = category.data ?? []
                        }
                    }
                }else{
                    alertMessage = "Please Check Your Internet Connection"
                    AlertShow = "0"
                    showingAlert = true
                }
            })
            .alert(alertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    if AlertShow == "1"{
                        
                    }else{
                        
                    }
                }
            }
        }
    }
    //MARK: - Search Variable
    var searchResults: [AllEvent] {
        if SearchText.isEmpty {
            return arrAllEvent
        } else {
            return arrAllEvent.filter {
                $0.eventName!.contains(SearchText) ||
                $0.eventName!.lowercased().contains(SearchText) ||
                $0.eventName!.uppercased().contains(SearchText)
            }
        }
    }
}
