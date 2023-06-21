//
//  ServiceHouseKeepingView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 31/05/23.
//

import SwiftUI

struct ServiceHouseKeepingView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var arrNotes = [Note]()
    @Binding var isBackHouseKeeping: Bool
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ZStack(alignment: .top){
                    Image("Service_HouseKeeping_Top")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: getRect().width, maxHeight: 300)
                    HStack{
                        Button {
                            isBackHouseKeeping = true
                        } label: {
                            Image("back_Button")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding(.leading, 20)
                                .padding(.top)
                        }
                        Spacer()
                    }
                    .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                    VStack(alignment: .leading){
                        Text("Housekeeping")
                            .font(.custom(OpenSans_Bold, size: 18))
                            .foregroundColor(colorScheme == .light ?  Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                            .padding(.top, 20)
                            .padding(.leading)
                            .multilineTextAlignment(.leading)
                        Rectangle()
                            .fill(
                                LinearGradient(colors: [Color(hex: 0xED7E2B), Color(hex: 0xEDA02B)], startPoint: .leading, endPoint: .trailing)
                            )
                            .frame(width: getRect().width, height: 4)
                            .padding(.leading)
                        
                        Text("We provide comprehensive housekeeping services to the students residing in the hostel.Our skilled housekeeping staff is trained to handle various tasks efficiently, ensuring that the hostel remains a pleasant and inviting place to live.")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                            .padding(.leading)
                        
                        VStack(alignment: .leading){
                            VStack(alignment: .leading) {
                                HStack{
                                    Text("Housekeeping Schedule")
                                        .font(.custom(OpenSans_Bold, size: 18))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                    Image("Service_HouseKeeping_Timing")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24, height: 24)
                                }
                                .padding(.top)
                                Text("Once a day")
                                    .font(.custom(OpenSans_Bold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x868686))
                                    .frame(width: getRect().width - 20, height: 33)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color(hex: 0xF2A66B), lineWidth: 1)
                                    }
                            }
                        }
                        .padding(.leading)
                        .padding(.bottom)
                        if arrNotes.count > 0{
                            VStack(alignment: .leading){
                                Text("*Please note:")
                                    .font(.custom(OpenSans_SemiBold, size: 15))
                                    .foregroundColor(Color(hex: 0xD9404C))
                                
                                VStack(alignment: .leading){
                                    ForEach(arrNotes) { notes in
                                        if notes.notesCateg == "6"{
                                            Text(notes.note ?? "")
                                                .font(.custom(OpenSans_SemiBold, size: 15))
                                                .foregroundColor(Color(hex: 0xD9404C))
                                                .padding(2)
                                        }
                                    }
                                }
                            }
                            .padding(5)
                            .frame(width: getRect().width - 20, alignment: .leading)
                            .padding(.leading, 5)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .strokeBorder(style: StrokeStyle(lineWidth: 0.2, dash: [1]))
                            }
                            .padding(.leading, 20)
                        }
                    }
                    .padding(.bottom)
                    .frame(maxWidth: getRect().width)
                    .background(colorScheme == .light ? .white : .black)
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                    .padding(.top, 290)
                }
            }
            .navigationBarHidden(true)
            .ignoresSafeArea()
            .onAppear{
                if let data = UserDefaults.standard.data(forKey: "notesfromMeal") {
                    do {
                        let decoder = JSONDecoder()
                        // Decode Note
                        let notes = try decoder.decode([Note].self, from: data)
                        print(notes)
                        arrNotes = notes
                        
                    }catch {
                        print("Unable to Decode Notes (\(error))")
                    }
                }
            }
        }
    }
}
