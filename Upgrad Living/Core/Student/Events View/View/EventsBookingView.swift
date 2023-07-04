//
//  EventsBookingView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 12/05/23.
//

import SwiftUI
import Kingfisher

struct EventsBookingView: View {
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
    @State private var isReminder = false
    
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
                                Text("Tickets Available")
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
                                Button {
                                    isReminder = true
                                } label: {
                                    HStack{
                                        Image(systemName: "plus")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(Color(hex: 0xDE1223))
                                            .frame(width: 9, height: 20)
                                        Text("Add Reminder")
                                            .font(.custom(OpenSans_SemiBold, size: 9))
                                            .foregroundColor(Color(hex: 0xDE1223))
                                    }
                                    .padding(7)
                                    .overlay(
                                        RoundedRectangle(
                                            cornerRadius: 5.0)
                                        .strokeBorder(Color(hex: 0xDE1223),
                                                      style: StrokeStyle(lineWidth: 1.0))
                                    )
                                    .padding(.trailing)
                                }
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
                            Text("About Event")
                                .font(.custom(OpenSans_Bold, size: 16))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                            
                            ExpandableText(Description, lineLimit: 3)
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                        }
                        .frame(maxWidth: getRect().width, alignment: .leading)
                        .padding(.top)
                        .padding(.leading)
                        .cornerRadius(15, corners: [.topLeft, .topRight])
                        
                        NavigationLink(
                            "",
                            destination: FirstView(EventScreen: "1", newSelectedIndex: .constant(3)).navigationBarHidden(true),
                            isActive: $isHome).isDetailLink(false)
                        
                        NavigationLink(
                            "",
                            destination: EventTicketConfirmView(qrImage: qrURL, eventName: eventName, eventDate: eventDate, eventTime: eventTimeToPass, eventLocation: location, bookTicketPDF: bookTicketPDF).navigationBarHidden(true),
                            isActive: $isEventConfirm).isDetailLink(false)
                        
                    DetailsViewBottom(textName: isTicketBook == "1" ? "View Ticket" : "Book Ticket", imageName: "Event_Book_Next_icon")
                            .padding(.top)
                            .padding(.bottom, 90)
                            .onTapGesture {
                                if isTicketBook == "1"{
                                    isEventConfirm = true
                                }else{
                                    if networkMonitor.isConnected{
                                        viewModel.getCategory(appId: studentAppID ?? "", eventId: eventId) { Ticket in
                                            if Ticket.status == 1{
                                                qrURL = Ticket.data?.image ?? ""
                                                eventName = Ticket.data?.eventName ?? ""
                                                eventDate = Ticket.data?.fulldate ?? ""
                                                eventTime = Ticket.data?.timeStart ?? ""
                                                location = Ticket.data?.location ?? ""
                                                bookTicketPDF = Ticket.data?.ticketPDF ?? ""
                                                isEventConfirm = true
                                            }else{
                                                alertMessage = Ticket.msg ?? ""
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
                    .padding(.bottom, 70)
                }
                if viewModel.isLoadingData{
                    LoadingViewEvents()
                }
               
                if isReminder{
                    EventReminderPopUp(show: $isReminder, alertMessage: $alertMessage, isAlertShow: $showingAlert, applicationId: studentAppID ?? "", eventId: eventId)
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

struct EventsBookingView_Previews: PreviewProvider {
    static var previews: some View {
        EventsBookingView(isToHome: false)
    }
}
