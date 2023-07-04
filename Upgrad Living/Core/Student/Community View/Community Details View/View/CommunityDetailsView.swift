//
//  CommunityDetailsView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 01/06/23.
//

import SwiftUI
import Kingfisher

struct CommunityDetailsView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @StateObject private var viewModel = CommunityDetailsViewModule()
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    @Binding var isCommunityBack: Bool
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    @State private var clubId = ""
    @State private var ClubName = ""
    @State private var ClubTitle = ""
    @State private var ClubImage = ""
    @State private var ClubNotes = ""
    @State private var arrClubDetails = [Detail]()
    @State private var arrDetails = [Gallery]()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing){
                ScrollView(showsIndicators: false) {
                    VStack{
                        HStack{
                            Image("back_Button")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding(.leading, 30)
                                .onTapGesture {
                                    withAnimation() {
                                        isCommunityBack = true
                                    }
                                }
                            Spacer(minLength: 0)
                            Text(ClubName)
                                .font(.custom(OpenSans_SemiBold, size: 18))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x000000) : .white)
                                .padding(.trailing, 30)
                            Spacer(minLength: 0)
                        }
                        .padding(.trailing)
                        .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                        Divider()
                        
                        KFImage(URL(string: ClubImage))
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(5)
                            .frame(width: getRect().width - 20, height: 145)
                        
                        VStack(alignment: .center) {
                            Text(ClubTitle)
                                .font(.custom(OpenSans_Bold, size: 16))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x000000, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                .padding(.vertical, 10)
                        }
                        
                        VStack(alignment: .leading) {
                            ForEach(Array(arrClubDetails.enumerated()), id: \.offset) { index, community in
                                HStack(spacing: 15){
                                    Image("community_Diverse_icon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 26, height: 26)
                                    VStack(alignment: .leading) {
                                        Text(community.title ?? "")
                                            .font(.custom(OpenSans_Bold, size: 16))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                        
                                        Text(community.descrption ?? "")
                                            .font(.custom(OpenSans_SemiBold, size: 12))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x7C7C7C) : Color(hex: 0x7C7C7C))
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        VStack(alignment: .center) {
                            Text(ClubNotes)
                                .font(.custom(OpenSans_Bold, size: 16))
                                .foregroundColor(Color(hex: 0xFF6229))
                                .padding(.horizontal)
                                .frame(width: getRect().width - 60)
                                .multilineTextAlignment(.center)
                            Image("Home_Time_Line")
                                .resizable()
                                .scaledToFit()
                                .frame(width: getRect().width - 60, height: 8)
                        }
                        .padding(.top)
                        Spacer()
                        VStack{
                            CommunityEventGallary(arrDetails: arrDetails)
                        }
                    }
                }
                //                Button {
                //
                //                } label: {
                //                    Image("Community_capture")
                //                        .resizable()
                //                        .scaledToFit()
                //                        .frame(width: 90, height: 90)
                //                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .onAppear{
                if let data = UserDefaults.standard.data(forKey: "community") {
                    do {
                        // Create JSON Decoder
                        let decoder = JSONDecoder()
                        
                        // Decode Note
                        let notes = try decoder.decode(CommunityData.self, from: data)
                        print(notes)
                        clubId = notes.id ?? ""
                        
                    } catch {
                        print("Unable to Decode Notes (\(error))")
                    }
                }
                
                if networkMonitor.isConnected{
                    viewModel.getCommunityDetails(appId: studentAppID ?? "", clubId: clubId) { club in
                        if club.status == 1{
                            ClubName = club.data?.clubDetails?.clubName ?? ""
                            ClubTitle = club.data?.clubDetails?.title ?? ""
                            ClubImage = club.data?.clubDetails?.clubImg ?? ""
                            ClubNotes = club.data?.clubDetails?.note ?? ""
                            arrClubDetails = club.data?.details ?? []
                            arrDetails = club.data?.gallery ?? []
                        }else{
                            alertMessage = club.msg ?? ""
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
