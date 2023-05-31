//
//  ServiceHelthCareView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 31/05/23.
//

import SwiftUI

struct ServiceHelthCareView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @StateObject private var viewModelHealth = HealthCareViewModel()
    
    @Binding var isBackHeltcare: Bool
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    @State private var arrDoctor = [ServiceDoctor]()
    @State private var arrNotes = [Note]()
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ZStack(alignment: .top){
                    Image("Service_HealthCare_Top")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: getRect().width, maxHeight: 300)
                    HStack{
                        Button {
                            isBackHeltcare = true
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
                        HStack{
                            Text("Healthcare")
                                .font(.custom(OpenSans_Bold, size: 18))
                                .foregroundColor(colorScheme == .light ?  Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                .padding(.top, 20)
                                .padding(.leading)
                                .multilineTextAlignment(.leading)
                            Spacer()
                            Image("Service_Phone_Call")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .padding(.top, 20)
                        }
                        .padding(.horizontal)
                        Rectangle()
                            .fill(
                                LinearGradient(colors: [Color(hex: 0x2F94C7), Color(hex: 0x48C2C5)], startPoint: .leading, endPoint: .trailing)
                            )
                            .frame(width: getRect().width, height: 4)
                            .padding(.leading)
                        
                        Text("Our Health Center has a dedicated medical team including a doctor and nurse who are available to provide the desired health consultation and care to our students as a first point of contact.")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                            .padding(.leading)
                        Text("Our healthcare staff is highly qualified, experienced and committed to ensuring the health and well-being of our students.")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                            .padding(.leading)
                        
                        VStack(alignment: .leading) {
                            Text("*General Medicines and First Aid kit available*")
                                .font(.custom(OpenSans_Bold, size: 18))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x000000) : Color(hex: 0xFFFFFF))
                                .padding(.leading)
                                .padding(.top)
                        }
                        
                        VStack(alignment: .leading){
                            HStack{
                                Text("Clinic timings")
                                    .font(.custom(OpenSans_Bold, size: 18))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                Image("Service_Clinic_Timing")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                            }
                            .padding(.top)
                            
                            VStack(alignment: .leading) {
                                ForEach(Array(arrDoctor.enumerated()), id: \.offset) { index, Doctor in
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color(hex: 0xFFFAFA))
                                        .frame(width: getRect().width - 40, height: 95)
                                        .padding(.leading)
                                        .overlay {
                                            VStack{
                                                HStack{
                                                    Spacer()
                                                    Text(Doctor.docName ?? "")
                                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                                        .foregroundColor(Color(hex: 0x000000))
                                                        .padding(.top, 5)
                                                    Spacer()
                                                    Button {
                                                        let phone = "tel://"
                                                        let phoneNumberformatted = "\(phone)\(Doctor.docMobNo ?? "")"
                                                        guard let url = URL(string: phoneNumberformatted) else { return }
                                                        UIApplication.shared.open(url)
                                                    } label: {
                                                        Image("Service_Phone_Call")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 24, height: 24)
                                                            .padding(.top, 5)
                                                            .padding(.trailing)
                                                    }
                                                }
                                                Text("\(Doctor.startTime ?? "") - \(Doctor.endTime ?? "")")
                                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                                    .foregroundColor(Color(hex: 0x868686))
                                                    .frame(width: 183, height: 33)
                                                    .background(Color(hex: 0xFEEEF0))
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 8)
                                                            .stroke(Color(hex: 0x6FB7D8), lineWidth: 1)
                                                    }
                                            }
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
                                    if notes.notesCateg == "5"{
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
                    
                    if viewModelHealth.isLoadingData{
                        LoadingView()
                    }
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
                    viewModelHealth.getHealthCareDetails(appId: studentAppID ?? "") { Health in
                        if Health.status == 1{
                            arrDoctor = Health.data?.doctors ?? []
                        }else{
                            alertMessage = Health.msg ?? ""
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
