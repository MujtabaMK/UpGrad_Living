//
//  CommunityView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 01/06/23.
//

import SwiftUI
import Kingfisher

struct CommunityView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @StateObject private var viewModel = CommunityViewModel()
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    @State private var arrCommunity = [CommunityData]()
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    var colors: [Color] = [Color(hex: 0xF17B51), Color(hex: 0x43BFC5), Color(hex: 0xEE606C), Color(hex: 0x46BF87), Color(hex: 0x9A92DA)].shuffled()

    @Binding var isCommunityView: Bool
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ZStack{
                    VStack{
                        HStack{
                            Spacer()
                            Text("Community")
                                .font(.custom(OpenSans_SemiBold, size: 18))
                                .foregroundColor(colorScheme == .light ? .black : .white)
                                .padding(.trailing, 30)
                            Spacer()
                        }
                        .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                        ForEach(Array(arrCommunity.enumerated()), id: \.offset)  { index, community in
                            VStack{
                                VStack{
                                    KFImage(URL(string: community.clubImg ?? ""))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: getRect().width - 50, height: 145)
                                        .cornerRadius(5)
                                    
                                    Text(community.description ?? "")
                                        .padding(.horizontal, 30)
                                        .font(.custom(OpenSans_SemiBold, size: 12))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                    
                                }
                                .frame(width: getRect().width - 40, height: 300)
                                .background(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0x2E2E2E))
                                VStack{
                                    Button {
                                        do{
                                            // Create JSON Encoder
                                            let encoder = JSONEncoder()
                                            
                                            // Encode Note
                                            let data = try encoder.encode(community)
                                            
                                            // Write/Set Data
                                            UserDefaults.standard.set(data, forKey: "community")
                                        }catch{
                                            print("Unable to Encode Array of Notes (\(error))")
                                        }
                                        isCommunityView = true
                                    } label: {
                                        HStack{
                                            Spacer()
                                            Text(community.clubName ?? "")
                                                .font(.custom(OpenSans_Bold, size: 14))
                                                .foregroundColor(.black)
                                            Image(systemName: "chevron.forward.2")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 18, height: 18)
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                    }
                                }
                                .frame(width: getRect().width - 36, height: 37)
                                .background(colors[safe: index] ?? colors[safe: index - colors.count])
                                .padding(.top, -8)
                            }
                            .cornerRadius(12)
                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                            .padding(.bottom)
                        }
                    }
                }
                .padding(.bottom, 90)
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .onAppear{
                if networkMonitor.isConnected{
                    viewModel.getCommunity(appId: studentAppID ?? "") { community in
                        if community.status == 1{
                            arrCommunity = community.data ?? []
                        }else{
                            alertMessage = community.msg ?? ""
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
