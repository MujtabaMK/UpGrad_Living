//
//  EventsBookingView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 12/05/23.
//

import SwiftUI
import Introspect

struct EventsBookingView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isEventConfirm = false
    @State private var isFav = false
    @State private var isHome = false
    var isToHome: Bool
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView{
                    VStack{
                        ZStack(alignment: .top){
                            Image("Event_1")
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
                                        isFav.toggle()
                                    } label: {
                                        Image(isFav ? "Home_Bookmark_Select" : "Home_Bookmark_Not_Select")
                                            .padding(.trailing)
                                    }
                                }
                            }
                            .padding(.top)
                        }
                        VStack{
                            HStack{
                                Image("Events_Ticket_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 57, height: 42)
                                
                                Text("69")
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
                            Text("Campus Event")
                                .font(.custom(OpenSans_Bold, size: 20))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                            
                            HStack{
                                Image("Event_Calender")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                VStack(alignment: .leading){
                                    Text("May 2, 2022")
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x120D26) : Color(hex: 0xFFFFFF))
                                    Text("Tuesday, 4:00PM - 9:00PM")
                                        .font(.custom(OpenSans_Regular, size: 12))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x747688) : Color(hex: 0x747688))
                                }
                            }
                            HStack{
                                Image("Event_Location")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                VStack(alignment: .leading){
                                    Text("Unwind Lounge")
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
                            
                            ExpandableText("Enjoy your favorite dishes and a lovely time with your friends and family and have a great time. Food from local food trucks will be available for purchase.", lineLimit: 3)
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                        }
                        .padding(.top)
                        .padding(.horizontal)
                        .cornerRadius(15, corners: [.topLeft, .topRight])
                        
                        NavigationLink(
                            "",
                            destination: FirstView(EventScreen: "1").navigationBarHidden(true),
                            isActive: $isHome).isDetailLink(false)
                        
                        NavigationLink(
                            "",
                            destination: EventTicketConfirmView().navigationBarHidden(true),
                            isActive: $isEventConfirm).isDetailLink(false)
                        
                        DetailsViewBottom(textName: "Book Ticket", imageName: "Event_Book_Next_icon")
                            .padding(.top)
                            .padding(.bottom, 90)
                            .onTapGesture {
                                isEventConfirm = true
                            }
                    }
                    .padding(.bottom, 70)
                }
               // LoadingViewEvents()
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }
}

struct EventsBookingView_Previews: PreviewProvider {
    static var previews: some View {
        EventsBookingView(isToHome: false)
    }
}
