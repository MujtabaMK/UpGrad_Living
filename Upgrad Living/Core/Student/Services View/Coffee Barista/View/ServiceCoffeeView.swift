//
//  ServiceCoffeeView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 31/05/23.
//

import SwiftUI
import Kingfisher

struct ServiceCoffeeView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var arrNotes = [Note]()
    @Binding var isBackCoffee: Bool
    
    @StateObject private var viewModelCon = ConvinienceViewModel()
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    @State private var time1 = ""
    @State private var time2 = ""
    
    @State private var arrOffer = [ConvinienceOffer]()
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ZStack(alignment: .top){
                    Image("Service_Coffee_Barista_Top")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: getRect().width, maxHeight: 300)
                    HStack{
                        Button {
                            isBackCoffee = true
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
                        Text("Coffee Barista")
                            .font(.custom(OpenSans_Bold, size: 18))
                            .foregroundColor(colorScheme == .light ?  Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                            .padding(.top, 20)
                            .padding(.leading)
                            .multilineTextAlignment(.leading)
                        Rectangle()
                            .fill(
                                LinearGradient(colors: [Color(hex: 0x008990), Color(hex: 0x00C5CF)], startPoint: .leading, endPoint: .trailing)
                            )
                            .frame(width: getRect().width, height: 4)
                            .padding(.leading)
                        
                        Text("The 24x7 Coffee Barista is a cozy and comfortable space where students can study, relax and socialize over a cup of coffee. It offers a variety of caffeinated and non-caffeinated beverages and light snacks like croissants and brownies to kickstart your morning or just unwind after a long day.")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                            .padding(.leading)
                        
                        VStack(alignment: .leading){
                            VStack(alignment: .leading) {
                                HStack{
                                    Text("Cafe Timings")
                                        .font(.custom(OpenSans_Bold, size: 18))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                    Image("Service_Cafe_Timing")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24, height: 24)
                                }
                                .padding(.top)
                                
                                HStack{
                                    Text(time1)
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x868686))
                                        .padding(5)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(hex: 0x4DAEB3), lineWidth: 1)
                                        }
                                    
                                    Text(time2)
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x868686))
                                        .padding(5)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(hex: 0x4DAEB3), lineWidth: 1)
                                        }
                                }
                                .padding(.bottom, 5)
                                
                                if arrOffer.count > 0{
                                    VStack(alignment: .leading) {
                                        HStack{
                                            Text("Offers of the day")
                                                .font(.custom(OpenSans_Bold, size: 18))
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                            Image("Service_Coffee_offer")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 24, height: 24)
                                        }
                                        .padding(.top)
                                        
                                        ForEach(arrOffer) { offer in
                                            VStack{
                                                HStack(spacing: 20){
                                                    KFImage(URL(string: offer.offerImage ?? ""))
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 98, height: 96)
                                                        .padding(.leading, 15)
                                                    VStack(alignment: .leading){
                                                        HStack(spacing: 1){
                                                            Text(offer.name ?? "")
                                                                .font(.custom(OpenSans_Bold, size: 20))
                                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                                                        }
                                                        HStack(spacing: 2){
                                                            Text("On")
                                                                .font(.custom(OpenSans_SemiBold, size: 16))
                                                                .foregroundColor(Color(hex: 0x868686))
                                                            Text(offer.productName ?? "")
                                                                .font(.custom(OpenSans_Bold, size: 16))
                                                                .foregroundColor(Color(hex: 0x969696))
                                                        }
                                                        .padding(.bottom, 4)
                                                        Text(offer.description ?? "")
                                                            .font(.custom(OpenSans_Regular, size: 12))
                                                            .foregroundColor(Color(hex: 0x969696))
                                                    }
                                                    Spacer()
                                                }
                                            }
                                            .frame(width: getRect().width - 20, height: 115)
                                            .background(colorScheme == .light ? Color(hex: 0xFFFFFF) : Color(hex: 0x2E2E2E))
                                            .cornerRadius(15)
                                            .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                            .padding(.vertical, 5)
                                        }
                                    }
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
                                        if notes.notesCateg == "9"{
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
                if networkMonitor.isConnected{
                    viewModelCon.getConvinienceDetails(appId: studentAppID ?? "", type: "1") { con in
                        if con.status == 1{
                            time1 = con.data?.timings?.time1 ?? ""
                            time2 = con.data?.timings?.time2 ?? ""
                            arrOffer = con.data?.offers ?? []
                        }else{
                            alertMessage = con.msg ?? ""
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
