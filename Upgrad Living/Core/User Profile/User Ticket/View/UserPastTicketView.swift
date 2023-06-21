//
//  UserPastTicketView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 06/06/23.
//

import SwiftUI
import Kingfisher

struct UserPastTicketView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @StateObject private var viewModel = GetPastTicketViewModel()
    
    @State private var ticketNo = ""
    @State private var ticketdescription = ""
    @State private var ticketCategory = ""
    @State private var arrImages = [TicketDoc]()
    
    @State private var alertMessage = String()
    @State private var showingalert = false
    @State private var AlertShow = String()
    
    var ticketId: String
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView(showsIndicators: false) {
                    ZStack{
                        Image("Home_Top_Background")
                            .resizable()
                            .scaledToFit()
                            .frame(width: getRect().width, height: 290)
                            .padding(.top, -90)
                        VStack{
                            HStack{
                                Button {
                                    presentationMode.wrappedValue.dismiss()
                                } label: {
                                    Image("back_Button")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .padding(.leading, 20)
                                }
                                Spacer(minLength: 0)
                                Text("Tickets")
                                    .font(.custom(OpenSans_Bold, size: 18))
                                    .foregroundColor(colorScheme == .light ? .white : .white)
                                    .padding(.trailing, 30)
                                Spacer(minLength: 0)
                            }
                            Spacer()
                        }
                        .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                    }
                    VStack{
                        VStack{
                            Text("Ticket No \(ticketNo)")
                                .font(.custom(OpenSans_Bold, size: 16))
                                .foregroundColor(Color(hex: 0x333333))
                                .padding()
                                .padding(.horizontal)
                                .background(Color(hex: 0xFEEEF0))
                                .cornerRadius(2)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 2)
                                        .strokeBorder(style: StrokeStyle(lineWidth: 0.5, dash: [1]))
                                        .foregroundColor(Color(hex: 0xDE1223))
                                }
                                .padding(.top, 20)
                                .padding(.bottom, 20)
                            
                            HStack{
                                Text("Ticket Category")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                
                                Spacer()
                            }
                            .padding(.leading)
                            
                            HStack{
                                Text(ticketCategory)
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                    .padding(.leading)
                                
                                Spacer()
                            }
                            .frame(width: getRect().width - 40, height: 44)
                            .background(colorScheme == .light ? Color(hex: 0xF9F9F9) : Color(hex: 0x2E2E2E))
                            .cornerRadius(5)
                            .padding(.bottom, 20)
                            
                            HStack{
                                Text("Ticket Description")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                
                                Spacer()
                            }
                            .padding(.leading)
                            
                            HStack{
                                Text(ticketdescription)
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                    .padding(.leading)
                                    .padding(.vertical, 20)
                                
                                Spacer()
                            }
                            .frame(width: getRect().width - 40)
                            .background(colorScheme == .light ? Color(hex: 0xF9F9F9) : Color(hex: 0x2E2E2E))
                            .cornerRadius(5)
                            .padding(.bottom, 20)
                            
                            HStack(spacing: 2){
                                Text("Media")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                
                                Text(String(arrImages.count))
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                                
                                Image("User_Attechment_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14, height: 12)
                                
                                Spacer()
                            }
                            .padding(.leading)
                            
                            HStack{
                                ForEach(arrImages) { image in
                                    KFImage(URL(string: image.docURL ?? ""))
                                        .placeholder{
                                                ProgressView()
                                                    .progressViewStyle(CircularProgressViewStyle(tint: Color("Student_Profile1")))
                                            }
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(8)
                                        .frame(width: 104, height: 98)
                                }
                                Spacer()
                            }
                            .padding(.leading)
                        }
                    }
                    .frame(maxWidth: getRect().width)
                    .background(colorScheme == .light ? .white : .black)
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                    .offset(y: -80)
                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .onAppear{
                if networkMonitor.isConnected{
                    clearKingFisherCache()
                    viewModel.getPastTicket(ticketId: ticketId) { ticket in
                        if ticket.status == 1{
                            ticketNo = ticket.data?.ticketNo ?? ""
                            ticketCategory = ticket.data?.ticketCateg ?? ""
                            ticketdescription = ticket.data?.ticketDesc ?? ""
                            arrImages = ticket.data?.ticketDoc ?? []
                        }else{
                            alertMessage = ticket.msg ?? ""
                            AlertShow = "0"
                            showingalert = true
                        }
                    }
                }else{
                    alertMessage = "Please Check Your Internet Connection"
                    AlertShow = "0"
                    showingalert = true
                }
            }
            .alert(alertMessage, isPresented: $showingalert) {
                Button("OK", role: .cancel) {
                    if AlertShow == "1"{
                        
                    }else{
                        
                    }
                }
            }
        }
    }
    func clearKingFisherCache(){
        KingfisherManager.shared.cache.clearMemoryCache()
        KingfisherManager.shared.cache.clearDiskCache()
        KingfisherManager.shared.cache.cleanExpiredDiskCache()
    }
}
