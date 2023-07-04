//
//  ServiceBookingTicket.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 21/06/23.
//

import SwiftUI
import Kingfisher

struct ServiceBookingTicket: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @State var imageData: Data?
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    @State private var Imagevalue = Image("")
    @State private var isPresented = false
    @State private var sharedItems: [Any] = []
    
    var qrImage: String
    var eventDate: String
    var eventTime: String
    var eventLocation: String
    var bookTicketPDF: String
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("Your Ticket")
                    .font(.custom(OpenSans_Bold, size: 16))
                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                Spacer()
                Button {
                    withAnimation {
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                        .foregroundColor(colorScheme == .light ? .black : .white)
                        .padding(.trailing, 20)
                }
            }
            
            TicketView
            
            HStack{
                Button {
                    downloadAndSharePDF(pdfURL: bookTicketPDF)
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
                        .sheet(isPresented: $isPresented) {
                            ActivityView(activityItems: sharedItems)
                        }
                }
                
                Button {
                    downloadAndSharePDF(pdfURL: bookTicketPDF)
                } label: {
                    ZStack(alignment: .leading){
                        Text("Download Booking")//Save & Continue
                            .font(.custom(OpenSans_SemiBold, size: 15))
                            .frame(width: 200, alignment: .center)
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .padding()
                            .foregroundColor(.white)
                            .background(
                                LinearGradient(
                                    colors: [Color(hex: 0xEE2C3C),
                                             Color(hex: 0xB20710)],
                                    startPoint: .leading,
                                    endPoint: .trailing))
                            .clipShape(Capsule())
                        Image("Ticket_Save")//Form_Button_icon
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 19, height: 19)
                            .padding(.leading, 20)
                    }
                }
            }
        }
        .alert(alertMessage, isPresented: $showingAlert) {
            Button("OK", role: .cancel) {
                
            }
        }
    }
    var TicketView: some View{
        ZStack(alignment: .top){
            Image("Event_Ticket_Background")
                .resizable()
                .scaledToFit()
                .frame(width: 305, height: 487)
                .padding(.top, -50)
            VStack{
                KFTicketView
                
                Imagevalue
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                VStack(alignment: .center){
                    Text("Show this code at the event")
                        .font(.custom(OpenSans_SemiBold, size: 12))
                        .foregroundColor(Color(hex: 0xFFFFFF))
                }
                VStack(alignment: .leading, spacing: 10){
                    HStack{
                        Image("Ticket_Calender")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        Text(eventDate)
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(Color(hex: 0x333333))
                    }
                    HStack{
                        Image("Book_Service_Time_icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        Text(eventTime)
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(Color(hex: 0x333333))
                    }
                    HStack{
                        Image("Ticket_Location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        Text(eventLocation)
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(Color(hex: 0x333333))
                    }
                }
                .padding(.leading, -50)
                .padding(.top, 30)
            }
        }
        .padding(.top, 50)
        .padding(.vertical)
    }
    
    var KFTicketView: some View{
        KFImage(URL(string: qrImage))
            .onSuccess { imageResult in
                let uiImage = imageResult.image
                let swiftUIImage = Image(uiImage: uiImage)
                // Use the swiftUIImage here
                Imagevalue = swiftUIImage
            }
            .resizable()
            .renderingMode(.original)
            .scaledToFit()
            .frame(width: 0, height: 0)
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
