//
//  UpcommingEventsCell.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 12/05/23.
//

import SwiftUI
import Kingfisher

struct UpcommingEventsCell: View {
    var post: AllEvent
    @Binding var isShowAlert: Bool
    @Binding var alertMessage: String
    @Binding var isEventDetails: Bool
    @Binding var isCallAPI: Bool
    @State private var EventId = ""
    @StateObject private var viewModel = AddToFavoriteViewModel()
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                ZStack(alignment: .bottom){
                    KFImage(URL(string:post.eventImg ?? ""))
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
                        .frame(height: 70)
                        VStack{
                            HStack{
                                VStack(alignment: .leading,spacing: 4){
                                    Text(post.eventName ?? "")
                                        .font(.custom(OpenSans_Bold, size: 16))
                                        .foregroundColor(Color(hex: 0xFFFFFF))
                                    HStack(spacing: 4) {
                                        Text(post.startTime ?? "")
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
                                                    isCallAPI.toggle()
                                                }else{
                                                    alertMessage = Fav.msg ?? ""
                                                    isShowAlert = true
                                                    isCallAPI.toggle()
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
                    UserDefaults.standard.set("1", forKey: "AllEvents")
                }catch{
                    print("Unable to Encode Array of Notes (\(error))")
                }
                isEventDetails = true
            }
            .cornerRadius(15)
            .padding(5)
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }
}

//struct UpcommingEventsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UpcommingEventsCell()
//    }
//}
