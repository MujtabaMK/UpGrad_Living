//
//  ServiceSportView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 31/05/23.
//

import SwiftUI

struct ServiceSportView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var arrNotes = [Note]()
    @Binding var isBackSport: Bool
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ZStack(alignment: .top){
                    Image("Service_Sports_Top")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: getRect().width, maxHeight: 300)
                    HStack{
                        Button {
                            isBackSport = true
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
                    .padding(.top, 50)
                    VStack(alignment: .leading){
                        Text("Multi-sport Turf")
                            .font(.custom(OpenSans_Bold, size: 18))
                            .foregroundColor(colorScheme == .light ?  Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                            .padding(.top, 20)
                            .padding(.leading)
                            .multilineTextAlignment(.leading)
                        Rectangle()
                            .fill(
                                LinearGradient(colors: [Color(hex: 0xC72A89), Color(hex: 0xEE85B4)], startPoint: .leading, endPoint: .trailing)
                            )
                            .frame(width: getRect().width, height: 4)
                            .padding(.leading)
                        
                        Text("Our indoor multi-sport turf provides the ultimate playground for students. Whether you're practicing your soccer skills or playing a game of box cricket, our state-of-the-art turf can handle it all. The turf has been designed to be durable, versatile and long-lasting to provide the students a safe space to enjoy a variety of sports.")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                            .padding(.leading)
                        
                        VStack(alignment: .leading){
                            VStack(alignment: .leading) {
                                HStack{
                                    Text("Indoor Games timings")
                                        .font(.custom(OpenSans_Bold, size: 18))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                    Image("Service_Indore_Game_Timing")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24, height: 24)
                                }
                                .padding(.top)
                                HStack{
                                    Text("05:30 am - 12:30 pm")
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x868686))
                                        .padding(5)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(hex: 0x8079C9), lineWidth: 1)
                                        }
                                    
                                    Text("03:00 pm - 10:30 pm")
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x868686))
                                        .padding(5)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(hex: 0x8079C9), lineWidth: 1)
                                        }
                                }
                                .padding(.bottom, 5)
                                Divider()
                                
                                HStack{
                                    Text("Box Cricket timings")
                                        .font(.custom(OpenSans_Bold, size: 18))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                    Image("Box_Circket_Timing")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24, height: 24)
                                }
                                .padding(.top)
                                HStack{
                                    Text("05:30 am - 12:30 pm")
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x868686))
                                        .padding(5)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(hex: 0x8079C9), lineWidth: 1)
                                        }
                                    
                                    Text("03:30 pm - 10:30 pm")
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x868686))
                                        .padding(5)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(hex: 0x8079C9), lineWidth: 1)
                                        }
                                }
                                .padding(.bottom, 5)
                                Divider()
                            }
                            VStack(alignment: .leading) {
                                HStack{
                                    Text("Pickleball timings")
                                        .font(.custom(OpenSans_Bold, size: 18))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                    Image("Service_Pickleball_Timing")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24, height: 24)
                                }
                                .padding(.top)
                                HStack{
                                    Text("05:30 am - 12:30 pm")
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x868686))
                                        .padding(5)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(hex: 0x8079C9), lineWidth: 1)
                                        }
                                    
                                    Text("03:30 pm - 10:30 pm")
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x868686))
                                        .padding(5)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(hex: 0x8079C9), lineWidth: 1)
                                        }
                                }
                                .padding(.bottom, 5)
                                Divider()
                                
                                HStack{
                                    Text("Turf Football timings")
                                        .font(.custom(OpenSans_Bold, size: 18))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                    Image("Service_Turf_Foodball_Timing")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24, height: 24)
                                }
                                .padding(.top)
                                HStack{
                                    Text("05:30 am - 12:30 pm")
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x868686))
                                        .padding(5)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(hex: 0x8079C9), lineWidth: 1)
                                        }
                                    
                                    Text("03:30 pm - 10:30 pm")
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x868686))
                                        .padding(5)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(hex: 0x8079C9), lineWidth: 1)
                                        }
                                }
                            }
                            
           
                        }
                        .padding(.leading)
                        .padding(.bottom)
                        VStack(alignment: .leading){
                            Text("*Please note:")
                                .font(.custom(OpenSans_SemiBold, size: 15))
                                .foregroundColor(Color(hex: 0xD9404C))
                            
                            VStack(alignment: .leading){
                                ForEach(arrNotes) { notes in
                                    if notes.notesCateg == "4"{
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

