//
//  ParentHelpdeskcell.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 07/07/23.
//

import SwiftUI

struct ParentHelpdeskcell: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var backgroundTopColour: Color
    var backgroundBottomColour: Color
    var desk: PatentEmergenyContact
    
    @State private var whatsUPNumber = ""
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Spacer()
                    
                    Text(desk.helpDesk ?? "")
                        .font(.custom(OpenSans_Bold, size: 16))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                    
                    Spacer()
                }
            }
            .padding(.vertical, 5)
            .padding(.horizontal)
            .background(Color(hex: 0xFAC2C7))
            .offset(y: -8)
            VStack{
                HStack(spacing: 20){
                    Spacer()
                    
                    Image("Service_Phone_Call")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .onTapGesture {
                            let phone = "tel://"
                            let phoneNumberformatted = "\(phone)\(desk.contactNo ?? "")"
                            guard let url = URL(string: phoneNumberformatted) else { return }
                            UIApplication.shared.open(url)
                        }
                    
                    Image("Service_Phone_WhatsUp")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 23)
                        .onTapGesture {
                            whatsUPNumber = desk.whatsappNo ?? ""
                            openWhatsapp(whatsUPNumberCode: "+91\(whatsUPNumber)")
                        }
                    
                    Image("Service_Phone_email")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 29, height: 19)
                        .onTapGesture {
                            openMail(emailTo: desk.email ?? "", subject: "", body: "")
                        }
                    
                    Image("Service_Phone_message")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26, height: 24)
                        .onTapGesture {
                            let sms = "sms:+91\(desk.contactNo ?? "")&body="
                            let strURL = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
                            UIApplication.shared.open(URL(string: strURL)!, options: [:], completionHandler: nil)
                        }
                    
                    Spacer()
                }
            }
        }
    }
    
    func openWhatsapp(whatsUPNumberCode: String){
        let urlWhats = "whatsapp://send?phone=\(whatsUPNumberCode)"
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed){
            if let whatsappURL = URL(string: urlString) {
                if UIApplication.shared.canOpenURL(whatsappURL){
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(whatsappURL, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(whatsappURL)
                    }
                }
                else {
                    print("Install Whatsapp")
                }
            }
        }
    }
    
    func openMail(emailTo:String, subject: String, body: String) {
        if let url = URL(string: "mailto:\(emailTo)?subject=\(subject.fixToBrowserString())&body=\(body.fixToBrowserString())"),
           UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
