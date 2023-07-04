//
//  UpcomingEvents.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 29/04/23.
//

import SwiftUI
import Kingfisher

struct UpcomingEvents: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @StateObject private var viewModel = AddToFavoriteViewModel()
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    //Current Index...
    @State var currentIndex: Int = 0
    @State private var isBookMarkSelect = false
    @Binding var isEvents : Bool
    @Binding var isEventsAll: Bool
    var arrEvents: [Event]
    @Binding var isShowAlert: Bool
    @Binding var alertMessage: String
    @Binding var callHomeAPIAgain: Bool
    @State private var EventId = ""
    
    var body: some View {
        if arrEvents.count > 0{
            VStack{
                HStack{
                    Text("Upcoming events")
                        .font(.custom(OpenSans_Bold, size: 20))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x1A1A1A) : Color(hex: 0xFFFFFF))
                    
                    Spacer()
                    Button {
                        isEventsAll = true
                    } label: {
                        Text("See All")
                            .font(.custom(OpenSans_SemiBold, size: 12))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                    }
                    
                    Image(systemName: "arrowtriangle.forward.fill")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 6, height: 9)
                    
                }
                .padding(.horizontal)
                SnapCarouselEvents(spacing: getRect().height < 750 ? 0 : 0,trailingSpace: getRect().height < 750 ? 100 : 150,index: $currentIndex, items: arrEvents) { events in
                    CardView(post: events)
                    //UpcommingEventsCell(isEvents: $isEvents, post: events)
                }
                .frame(height: 260)
            }
        }
    }
    @ViewBuilder
    func CardView(post: Event) -> some View{
        GeometryReader { proxy in
            ZStack(alignment: .bottom){
                KFImage(URL(string: post.eventImg ?? ""))
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                
                VStack {
                    HStack{
                        Spacer()
                        Rectangle()
                            .fill(
                                LinearGradient(colors: [Color(hex: 0x969696, alpha: 1.0), Color(hex: 0x969696, alpha: 0.7)], startPoint: .leading, endPoint: .trailing)
                            )
                            .frame(width: 42, height: 48)
                            .overlay {
                                VStack(spacing: 1){
                                    Text(post.day ?? "")
                                        .font(.custom(OpenSans_Bold, size: 15))
                                        .foregroundColor(.black)
                                    Text(post.month ?? "")
                                        .font(.custom(OpenSans_Bold, size: 13))
                                        .foregroundColor(.black)
                                }
                            }
                            .cornerRadius(10)
                            .padding(.trailing)
                        
                    }
                    VStack{
                        
                    }
                    .frame(height: getRect().height < 750 ? 20 : 5)
                    VStack{
                        HStack{
                            VStack(alignment: .leading,spacing: 4){
                                Text(post.eventName ?? "")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(Color(hex: 0xFFFFFF))
                                HStack(spacing: 4) {
                                    Text(post.timeStart ?? "")
                                        .font(.custom(OpenSans_SemiBold, size: 12))
                                        .foregroundColor(Color(hex: 0xFFFFFF))
                                    Rectangle()
                                        .fill(.white)
                                        .frame(width: 0.3, height: 12)
                                    Text(post.fulldate ?? "")
                                        .font(.custom(OpenSans_SemiBold, size: 12))
                                        .foregroundColor(Color(hex: 0xFFFFFF))
                                }
                                HStack{
                                    Image("Home_Event_Location")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 17, height: 17)
                                    Text(post.location ?? "")
                                        .font(.custom(OpenSans_SemiBold, size: 12))
                                        .foregroundColor(Color(hex: 0xFFFFFF))
                                }
                            }
                            Spacer()
                            VStack{
                                Button {
                                    EventId = post.id ?? ""
                                    if networkMonitor.isConnected{
                                        viewModel.AddToFavorite(appId: studentAppID ?? "", eventId: EventId) { Fav in
                                            if Fav.status == 1{
                                                alertMessage = Fav.msg ?? ""
                                                isShowAlert = true
                                                callHomeAPIAgain.toggle()
                                            }else{
                                                alertMessage = Fav.msg ?? ""
                                                isShowAlert = true
                                                callHomeAPIAgain.toggle()
                                            }
                                        }
                                    }else{
                                        alertMessage = "Please Check Your Internet Connection"
                                        isShowAlert = true
                                    }
                                } label: {
                                    Image(post.isFavorate == "1" ? "Home_Bookmark_Select" : "Home_Bookmark_Not_Select")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                }
                                Spacer()
                            }
                            .padding(.top, 25)
                        }
                        .padding(.horizontal)
                    }
                    .frame(width: proxy.size.width, height: 110)
                    .background(
                        LinearGradient(colors: [Color(hex: 0x1C1B19, alpha: 1.0), Color(hex: 0x1C1B19, alpha: 0.35)], startPoint: .top, endPoint: .bottom)
                    )
                    .cornerRadius(15, corners: [.bottomRight, .bottomLeft])
                }
            }
        }
        .onTapGesture {
            do{
                // Create JSON Encoder
                let encoder = JSONEncoder()
                
                // Encode Note
                let data = try encoder.encode(post)
                
                // Write/Set Data
                UserDefaults.standard.set(data, forKey: "eventfromHome")
                UserDefaults.standard.set("0", forKey: "AllEvents")
            }catch{
                print("Unable to Encode Array of Notes (\(error))")
            }
            
            isEvents = true
        }
        .cornerRadius(15)
        .padding(5)
        
    }
}

//struct UpcomingEvents_Previews: PreviewProvider {
//    static var previews: some View {
//        UpcomingEvents(isEvents: .constant(false), isEventsAll: .constant(false))
//    }
//}
