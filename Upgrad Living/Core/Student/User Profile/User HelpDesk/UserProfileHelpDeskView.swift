//
//  UserProfileHelpDeskView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 03/06/23.
//

import SwiftUI

struct UserProfileHelpDeskView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    
    @State private var arrHelpdesk = [ProfileHelpDesk]()
    
    var colorsmain: [Color] = [Color(hex: 0xFAC2C7), Color(hex: 0xA3E4E6), Color(hex: 0xFFE3B8), Color(hex: 0xCDC8EC), Color(hex: 0xFACDAC),Color(hex: 0xB1D9ED)]
    var colorsicon: [Color] = [Color(hex: 0xFB6876), Color(hex: 0x2590C6), Color(hex: 0xE5A23B), Color(hex: 0x573FEC), Color(hex: 0xF37D27),Color(hex: 0x13A2A7)]
    
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
                                Text("Help Desk")
                                    .font(.custom(OpenSans_SemiBold, size: 18))
                                    .foregroundColor(colorScheme == .light ? .white : .white)
                                    .padding(.trailing, 30)
                                Spacer(minLength: 0)
                            }
                            Spacer()
                        }
                        .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                    }
                    ForEach(Array(arrHelpdesk.enumerated()), id: \.offset) { index, desk in
                        VStack(spacing: 20){
                            VStack(alignment: .leading, spacing: 5){
                                HStack{
                                    Text(desk.helpDesk ?? "")
                                        .font(.custom(OpenSans_Bold, size: 18))
                                        .foregroundColor(Color(hex: 0x333333))
                                    Spacer()
                                }
                                .padding(.leading)
                                HStack{
                                    Text(desk.contactNo ?? "")
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(Color(hex: 0x565656))
                                    
                                    Spacer()
                                    
                                    Image("Service_Phone_Call")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(colorsicon[safe: index] ?? colorsicon[safe: index - colorsicon.count])
                                        .onTapGesture {
                                            let phone = "tel://"
                                            let phoneNumberformatted = "\(phone)\(desk.contactNo ?? "")"
                                            guard let url = URL(string: phoneNumberformatted) else { return }
                                            UIApplication.shared.open(url)
                                        }
                                }
                                .padding(.horizontal)
                            }
                        }
                        .frame(width: getRect().width - 20, height: 100)
                        .background(colorsmain[safe: index] ?? colorsmain[safe: index - colorsmain.count])
                        .padding(.top, 40)
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
                if let data = UserDefaults.standard.data(forKey: "profileInfo") {
                    do {
                        let decoder = JSONDecoder()
                        // Decode Note
                        let notes = try decoder.decode(ProfileInfoModel.self, from: data)
                        print(notes)
                        arrHelpdesk = notes.data?.helpDesk ?? []
                        
                    }catch {
                        print("Unable to Decode Notes (\(error))")
                    }
                }
            }
        }
    }
}

struct UserProfileHelpDeskView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileHelpDeskView()
    }
}
