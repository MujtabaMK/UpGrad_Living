//
//  ServiceGymView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 31/05/23.
//

import SwiftUI

struct ServiceGymView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var arrNotes = [Note]()
    
    @Binding var isBackGym: Bool
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ZStack(alignment: .top){
                    Image("Service_gym_Top")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: getRect().width, maxHeight: 300)
                    HStack{
                        Button {
                            isBackGym = true
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
                        Text("Gym & Fitness Studio")
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
                        
                        Text("Our state-of-the-art gym is equipped with modern and high-quality exercise equipment that caters to all fitness levels and preferences. Additionally, our fitness studio offers a variety of group classes such as yoga, Pilates, and Zumba, among others, that are conducted by certified trainers.")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                            .padding(.leading)
                        
                        VStack(alignment: .leading){
                            HStack{
                                Text("Gym timings")
                                    .font(.custom(OpenSans_Bold, size: 18))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                Image("Service_Gym_Timing")
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
                                            .stroke(Color(hex: 0xD96DAE), lineWidth: 1)
                                    }
                                
                                Text("03:00 pm - 10:30 pm")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x868686))
                                    .padding(5)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color(hex: 0xD96DAE), lineWidth: 1)
                                    }
                            }
                            .padding(.bottom, 5)
                            Divider()
                            
                            HStack{
                                Text("Fitness studio timings")
                                    .font(.custom(OpenSans_Bold, size: 18))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                Image("Fitness_Studio_Timing")
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
                                            .stroke(Color(hex: 0xD96DAE), lineWidth: 1)
                                    }
                                
                                Text("03:30 pm - 08:30 pm")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x868686))
                                    .padding(5)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color(hex: 0xD96DAE), lineWidth: 1)
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
                                    if notes.notesCateg == "3"{
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
