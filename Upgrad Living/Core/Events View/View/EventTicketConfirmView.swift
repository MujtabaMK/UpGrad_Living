//
//  EventTicketConfirmView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 13/05/23.
//

import SwiftUI

struct EventTicketConfirmView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @State var imageData: Data?
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
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
                    let image = TicketView.snapshot()
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                    alertMessage = "Your Ticket Save Successfully"
                    showingAlert = true
                } label: {
                    Capsule()
                        .strokeBorder(Color(hex: 0xB20710), lineWidth: 1)
                        .frame(width: 163, height: 50)
                        .overlay {
                            HStack(spacing: 4){
                                Image("Ticket_Save")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                Text("Save")
                                    .font(.custom(OpenSans_SemiBold, size: 15))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                                    .padding()
                            }
                        }
                }
                
                Button {
                    let image = TicketView.snapshot()
                    share(items: [image])
                } label: {
                    Capsule()
                        .strokeBorder(Color(hex: 0xB20710), lineWidth: 1)
                        .frame(width: 163, height: 50)
                        .overlay {
                            HStack(spacing: 4){
                                Image("Ticket_Send")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                Text("Send")
                                    .font(.custom(OpenSans_SemiBold, size: 15))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                                    .padding()
                            }
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
                Image("QR_Image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 212, height: 212)
                VStack(alignment: .center){
                    Text("Show this code at the event")
                        .font(.custom(OpenSans_SemiBold, size: 12))
                        .foregroundColor(Color(hex: 0xFFFFFF))
                        .padding(.top, -20)
                }
                VStack(alignment: .leading, spacing: 2){
                    Text("Campus Event")
                        .font(.custom(OpenSans_Bold, size: 16))
                        .foregroundColor(Color(hex: 0x333333))
                        .padding(.bottom, 12)
                    HStack{
                        Image("Ticket_Calender")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        
                        Text("May 2, 2023")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(Color(hex: 0x333333))
                        +
                        Text("|")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(Color(hex: 0x333333))
                        +
                        Text("4:00 PM")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(Color(hex: 0x333333))
                    }
                    .padding(.bottom, 3)
                    HStack{
                        Image("Ticket_Location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        Text("Unwind Lounge")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(Color(hex: 0x333333))
                    }
                }
                .padding(.leading, -50)
                .padding(.top, 60)
            }
        }
        .padding(.top, 50)
        .padding(.vertical)
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
}

struct EventTicketConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        EventTicketConfirmView()
    }
}
