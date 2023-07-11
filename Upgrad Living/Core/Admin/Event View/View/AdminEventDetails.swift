//
//  AdminEventDetails.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 10/07/23.
//

import SwiftUI
import Kingfisher

struct AdminEventDetails: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @StateObject private var viewModel = BookTicketViewModel()
    @StateObject private var viewModelfav = AddToFavoriteViewModel()
    
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var isAllEvent = UserDefaults.standard.string(forKey: "AllEvents")
    
    @State private var isEventConfirm = false
    @State private var isFav = false
    @State private var isHome = false
    
    @State private var isResident = false
    
    @State private var bckImage = ""
    @State private var availableTicket = ""
    @State private var eventName = ""
    @State private var eventDate = ""
    @State private var eventTime = ""
    @State private var location = ""
    @State private var Description = ""
    @State private var isTicketBook = ""
    @State private var eventId = ""
    @State private var qrURL = ""
    @State private var eventTimeToPass = ""
    @State private var FavCheck = ""
    @State private var bookTicketPDF = ""
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    var isToHome: Bool
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView{
                        ZStack(alignment: .top){
                            KFImage(URL(string: bckImage))
                                .resizable()
                                .scaledToFill()
                                .frame(width: getRect().width, height: 200)
                            VStack{
                                HStack{
                                    Button {
                                        if isToHome{
                                            isHome = true
                                        }else{
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
                                    Text("Events Details")
                                        .font(.custom(OpenSans_SemiBold, size: 18))
                                        .foregroundColor(colorScheme == .light ? .white : .white)
                                        .padding(.trailing, 30)
                                    Spacer(minLength: 0)
                                    Button {
                                        if networkMonitor.isConnected{
                                            viewModelfav.AddToFavorite(appId: studentAppID ?? "", eventId: eventId) { Fav in
                                                if Fav.status == 1{
                                                    alertMessage = Fav.msg ?? ""
                                                    showingAlert = true
                                                }else{
                                                    alertMessage = Fav.msg ?? ""
                                                    showingAlert = true
                                                }
                                            }
                                        }else{
                                            alertMessage = "Please Check Your Internet Connection"
                                            showingAlert = true
                                        }
                                        isFav.toggle()
                                    } label: {
                                        Rectangle()
                                            .fill(Color(hex: 0x979797, alpha: 0.8))
                                            .frame(width: 41, height: 39)
                                            .cornerRadius(10)
                                            .padding(.trailing)
                                            .overlay{
                                                Image(isFav ? "Home_Bookmark_Select" : "Home_Bookmark_Not_Select")
                                                    .renderingMode(.template)
                                                    .foregroundColor(.white)
                                                    .padding(.trailing)
                                                    
                                            }
                                    }
                                }
                            }
                            .padding(.top, UIDevice.current.hasNotch ? 40 : 20)
                        }
                        VStack{
                            HStack{
                                Image("Events_Ticket_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 57, height: 42)
                                
                                Text(availableTicket)
                                    .font(.custom(OpenSans_Bold, size: 20))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x00B2BA) : Color(hex: 0x00B2BA))
                                Text("Tickets Sold")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                            }
                        }
                        .frame(width: 295, height: 68)
                        .background(colorScheme == .light ? .white : .black)
                        .cornerRadius(20)
                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                        VStack(alignment: .leading){
                            Text(eventName)
                                .font(.custom(OpenSans_Bold, size: 20))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                            
                            HStack{
                                Image("Event_Calender")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                VStack(alignment: .leading){
                                    Text(eventDate)
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x120D26) : Color(hex: 0xFFFFFF))
                                    Text(eventTime)
                                        .font(.custom(OpenSans_Regular, size: 12))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x747688) : Color(hex: 0x747688))
                                }
                                Spacer()
                            }
                            HStack{
                                Image("Event_Location")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                VStack(alignment: .leading){
                                    Text(location)
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x120D26) : Color(hex: 0xFFFFFF))
                                    Text("upGrad Living Hostel ")
                                        .font(.custom(OpenSans_Regular, size: 12))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x747688) : Color(hex: 0x747688))
                                }
                            }
                            HStack{
                                Text("Booked tickets")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                
                                Spacer()
                                
                                Button {
                                    isResident = true
                                } label: {
                                    Text("Resident")
                                        .font(.custom(OpenSans_SemiBold, size: 12))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : isResident ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                        .padding(8)
                                        .background(isResident ? Color(hex: 0xCFF6F8) : .clear)
                                        .cornerRadius(15)
                                        .overlay{
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(Color(hex: 0x969696), lineWidth: 1)
                                        }
                                }
                                
                                Button {
                                    isResident = false
                                } label: {
                                    Text("Day Scholar")
                                        .font(.custom(OpenSans_SemiBold, size: 12))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : isResident ? Color(hex: 0xFFFFFF, alpha: 0.8) : Color(hex: 0x333333, alpha: 1.0))
                                        .padding(8)
                                        .background(isResident ? .clear : Color(hex: 0xCFF6F8))
                                        .cornerRadius(15)
                                        .overlay{
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(Color(hex: 0x969696), lineWidth: 1)
                                        }
                                }
                            }
                            .padding(.trailing)
                            
                            ForEach(0..<10) { index in
                                VStack{
                                    HStack{
                                        Rectangle()
                                            .fill(colorScheme == .light ? Color(hex: 0xEDEDED) : Color(hex: 0xEDEDED))
                                            .frame(width: 45, height: 65)
                                            .cornerRadius(12, corners: [.topLeft, .bottomLeft])
                                            .overlay {
                                                VStack{
                                                    Spacer()
                                                    
                                                    Text("\(index + 1)")
                                                        .font(.custom(OpenSans_Bold, size: 20))
                                                        .foregroundColor(Color(hex: 0x333333))
                                                    
                                                    Spacer()
                                                }
                                            }
                                        HStack{
                                           Image("Dean")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 46, height: 46)
                                                .clipShape(Circle())
                                            
                                            Text("Nita Kumar")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                            
                                            Image("Admin_Resident_Star")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 18, height: 18)
                                            
                                            Text("Resident")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                        }
                                        
                                        Spacer()
                                    }
                                }
                                .frame(width: getRect().width - 40, height: 65)
                                .background(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0x2E2E2E))
                                .cornerRadius(12)
                                .shadow(color: .gray, radius: 3, x: 0, y: 0)
                                .padding(.bottom)
                            }
                        }
                        .frame(maxWidth: getRect().width, alignment: .leading)
                        .padding(.top)
                        .padding(.leading)
                        .cornerRadius(15, corners: [.topLeft, .topRight])
                        
                        NavigationLink(
                            "",
                            destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(2)).navigationBarHidden(true),
                            isActive: $isHome).isDetailLink(false)
                }
                if viewModel.isLoadingData{
                    LoadingViewEvents()
                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .onAppear{
                // Read/Get Data
                if let data = UserDefaults.standard.data(forKey: "eventfromHome") {
                    do {
                        if isAllEvent == "1"{
                            // Create JSON Decoder
                            let decoder = JSONDecoder()

                            
                            // Decode Note
                            let notes = try decoder.decode(AllEvent.self, from: data)
                            print(notes)

                            bckImage = notes.eventImg ?? ""
                            availableTicket = notes.availableSeats ?? ""
                            eventName = notes.eventName ?? ""
                            eventDate = notes.fulldate ?? ""
                            
                            eventTime = "\(notes.startTime ?? "") - \(notes.endTime ?? "")"
                            location = notes.location ?? ""
                            Description = notes.description ?? ""
                            isTicketBook = notes.isTicketBooked ?? ""
                            eventId = notes.id ?? ""
                            qrURL = notes.qrURL ?? ""
                            eventTimeToPass = notes.timeStart ?? ""
                            FavCheck = notes.isFavorate ?? ""
                            bookTicketPDF = notes.ticketPDF ?? ""
                            if FavCheck == "1"{
                                isFav = true
                            }else{
                                isFav = false
                            }
                            
                            print(isTicketBook)
                        }else{
                            // Create JSON Decoder
                            let decoder = JSONDecoder()
                            
                            // Decode Note
                            let notes = try decoder.decode(Event.self, from: data)
                            print(notes)

                            bckImage = notes.eventImg ?? ""
                            availableTicket = notes.availableSeats ?? ""
                            eventName = notes.eventName ?? ""
                            eventDate = notes.fulldate ?? ""
                            
                            eventTime = "\(notes.startTime ?? "") - \(notes.endTime ?? "")"
                            location = notes.location ?? ""
                            Description = notes.description ?? ""
                            isTicketBook = notes.isTicketBooked ?? ""
                            eventId = notes.id ?? ""
                            qrURL = notes.qrURL ?? ""
                            eventTimeToPass = notes.timeStart ?? ""
                            print(isTicketBook)
                            bookTicketPDF = notes.ticketPDF ?? ""
                            FavCheck = notes.isFavorate ?? ""
                            if FavCheck == "1"{
                                isFav = true
                            }else{
                                isFav = false
                            }
                        }
                    } catch {
                        print("Unable to Decode Notes (\(error))")
                    }
                }
            }
            .alert(alertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    if AlertShow == "1"{
                        
                    }else{
                        
                    }
                }
            }
        }
    }
}
