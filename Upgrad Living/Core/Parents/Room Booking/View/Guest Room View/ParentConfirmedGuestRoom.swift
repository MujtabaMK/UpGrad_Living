//
//  ParentConfirmedGuestRoom.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 19/06/23.
//

import SwiftUI

struct ParentConfirmedGuestRoom: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var viewModel = GetGuestDetailsViewModel()
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    @State private var isPresented = false
    @State private var sharedItems: [Any] = []
    
    @State private var arrGuest = [GetGuestDetail]()
    @State private var refrenceNo = ""
    @State private var startDate = ""
    @State private var endDate = ""
    @State private var nights = ""
    @State private var totalGuests = ""
    @State private var pdfURLString = ""
    
    var refrenceID: String
    
    var body: some View {
        NavigationView {
            ZStack{
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
                                        presentationMode.wrappedValue.dismiss()
                                    }
                                }
                            Spacer(minLength: 0)
                            Text("Booking Confirmation")
                                .font(.custom(OpenSans_Bold, size: 18))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x000000) : .white)
                                .padding(.trailing, 30)
                            Spacer(minLength: 0)
                        }
                        .padding(.trailing)
                        .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                        Divider()
                        
                        VStack(spacing: 20){
                            Image("Guest_Room_Confirm_icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 140, height: 140)
                                .cornerRadius(10)
                                .padding(.top)
                            
                            HStack{
                                Text("Reference Number#")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                
                                Text(refrenceNo)
                                    .font(.custom(OpenSans_Bold, size: 14))
                                    .foregroundColor(Color(hex: 0xDE1223))
                            }
                            .padding(5)
                            .padding(.horizontal)
                            .background(colorScheme == .light ? .white : .black)
                            .cornerRadius(5)
                            .shadow(color: .gray, radius: 3, x: 0, y: 0)
                            .padding(.bottom)
                            
                            HStack(spacing: 20){
                                Spacer()
                                VStack(alignment: .center){
                                    HStack{
                                        VStack(alignment: .center, spacing: 8){
                                            Text("No. of guests")
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(Color(hex: 0x868686))
                                                .multilineTextAlignment(.leading)
                                            
                                            Text(totalGuests)
                                                .font(.custom(OpenSans_SemiBold, size: 14))
                                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                                .multilineTextAlignment(.leading)
                                        }
                                        .padding(.horizontal)
                                    }
                                }
                                .padding(.vertical)
                                .background(colorScheme == .light ? Color(hex: 0xF6F6F6) : Color(hex: 0x2E2E2E))
                                .cornerRadius(5)
                                .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                Spacer()
                            }
                            
                            ForEach(Array(arrGuest.enumerated()), id: \.offset) { index, guest in
                                HStack{
                                    VStack(alignment: .leading,spacing: 12){
                                        Text("Guest \(index + 1)")
                                            .font(.custom(OpenSans_SemiBold, size: 10))
                                            .foregroundColor(Color(hex: 0x868686))
                                            .padding(.leading)
                                        
                                        Text(guest.guestName ?? "")
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                            .padding(.leading)
                                    }
                                    Spacer()
                                }
                                .padding(.vertical)
                                .frame(width: getRect().width - 40)
                                .background(colorScheme == .light ? Color(hex: 0xF6F6F6) : Color(hex: 0x2E2E2E))
                                .cornerRadius(5)
                                .padding(.bottom, 5)
                            }
                            HStack{
                                Spacer()
                                
                                VStack(alignment: .leading,spacing: 12){
                                    Text("Check-in")
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(Color(hex: 0x868686))
                                        .padding(.leading)
                                    
                                    HStack{
                                        Image("Guest_Calender")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 18, height: 20)
                                        
                                        Text(startDate)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                        
                                        Spacer()
                                    }
                                    .padding(.leading)
                                }
                                Spacer()
                                
                                Rectangle()
                                    .fill(Color(hex: 0x969696))
                                    .frame(width: 0.5, height: 25)
                                
                                Spacer()
                                
                                VStack(alignment: .leading,spacing: 12){
                                    Text("Check-out")
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(Color(hex: 0x868686))
                                        .padding(.leading)
                                    
                                    HStack{
                                        Image("Guest_Calender")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 18, height: 20)
                                        
                                        Text(endDate)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                        
                                        Spacer()
                                    }
                                    .padding(.leading)
                                }
                                
                                Spacer()
                            }
                            .padding(.vertical)
                            .frame(width: getRect().width - 40)
                            .background(colorScheme == .light ? Color(hex: 0xF6F6F6) : Color(hex: 0x2E2E2E))
                            .cornerRadius(5)
                            
                            HStack{
                                Spacer()
                                
                                Text("\(nights) nights")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                    .padding(5)
                                    .padding(.horizontal, 5)
                                    .overlay{
                                        Rectangle()
                                            .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [1]))
                                            .foregroundColor(Color(hex: 0xDE1223))
                                    }
                                
                                Spacer()
                            }
                            .padding(.bottom)
                            
                            HStack(spacing: 25){
                                Button {
                                    downloadAndSharePDF(pdfURL: pdfURLString)
                                } label: {
                                    Capsule()
                                        .strokeBorder(Color(hex: 0xB20710), lineWidth: 1)
                                        .frame(width: 90, height: 50)
                                        .overlay {
                                            HStack(spacing: 4){
                                                Image("Ticket_Send")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 18, height: 18)
                                                Text("Send")
                                                    .font(.custom(OpenSans_SemiBold, size: 15))
                                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                                            }
                                        }
//                                        .sheet(isPresented: $isPresented) {
//                                            ActivityView(activityItems: sharedItems)
//                                        }
                                }
                                
                                Button {
                                    downloadAndSharePDF(pdfURL: pdfURLString)
                                } label: {
                                    Capsule()
                                        .fill(
                                            LinearGradient(
                                                colors: [Color(hex: 0xEE2C3C),
                                                      Color(hex: 0xB20710)],
                                                startPoint: .leading,
                                                endPoint: .trailing)
                                        )
                                        .frame(width: 200)
                                        .overlay{
                                            HStack{
                                                Spacer()
                                                Image("Ticket_Save")//Form_Button_icon
                                                    .resizable()
                                                    .scaledToFit()
                                                    .foregroundColor(.white)
                                                    .frame(width: 19, height: 19)
                                                
                                                Text("Download Voucher")//Save & Continue
                                                    .font(.custom(OpenSans_SemiBold, size: 15))
                                                    .foregroundColor(.white)
                                                Spacer()
                                            }
                                        }
                                }
                            }
                            .padding(.bottom)
                        }
                    }
                    .padding(.bottom, 70)
                }
                if viewModel.isLoadingData{
                    LoadingView()
                }
            }
            .navigationBarHidden(true)
            .ignoresSafeArea()
            .onAppear{
                if networkMonitor.isConnected{
                    viewModel.getGuesDetailstInfo(appId: studentAppID ?? "", bookingId: refrenceID) { guest in
                        if guest.status == 1{
                            refrenceNo = guest.data?.refrenceID ?? ""
                            startDate = guest.data?.startDate ?? ""
                            endDate = guest.data?.endDate ?? ""
                            nights = guest.data?.nights ?? ""
                            totalGuests = guest.data?.totalGuests ?? ""
                            pdfURLString = guest.data?.pdfURL ?? ""
                            arrGuest = guest.data?.guestDetails ?? []
                        }else{
                            alertMessage = guest.msg ?? ""
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
    
    @discardableResult
    func share(
        items: [Any],
        excludedActivityTypes: [UIActivity.ActivityType]? = nil
    ) -> Bool {
        guard let source = UIApplication.shared.windows.last?.rootViewController else {
            return false
        }
        let vc = UIActivityViewController(
            activityItems: items,
            applicationActivities: nil
        )
        vc.excludedActivityTypes = excludedActivityTypes
        vc.popoverPresentationController?.sourceView = source.view
        source.present(vc, animated: true)
        return true
    }
    
    
    private func downloadAndSharePDF(pdfURL: String) {
        guard let pdfURL = URL(string: pdfURL) else {
            // Handle invalid URL
            return
        }
        
        URLSession.shared.downloadTask(with: pdfURL) { (location, _, error) in
            if let location = location {
                let destinationURL = FileManager.default.temporaryDirectory
                    .appendingPathComponent(pdfURL.lastPathComponent)
                
                // Remove existing file if it exists
                if FileManager.default.fileExists(atPath: destinationURL.path) {
                    do {
                        try FileManager.default.removeItem(at: destinationURL)
                    } catch {
                        // Handle file removal error
                        print("Error removing existing file:", error)
                    }
                }
                
                do {
                    try FileManager.default.moveItem(at: location, to: destinationURL)
                    DispatchQueue.main.async {
                        isPresented = true
                        share(items: [destinationURL])
                    }
                } catch {
                    // Handle file move error
                    print("Error moving file:", error)
                }
            } else if let error = error {
                // Handle download error
                print("Error downloading file:", error)
            }
        }.resume()
    }
}
