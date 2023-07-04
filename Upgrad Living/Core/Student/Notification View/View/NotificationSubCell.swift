//
//  NotificationSubCell.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 08/06/23.
//

import SwiftUI

struct NotificationSubCell: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var categoryID: String
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing: 10){
                if categoryID == "1"{
                    Image("Notification_Payment_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .leading)
                }else if categoryID == "2"{
                    Image("Notification_Dining_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .leading)
                }else if categoryID == "3"{
                    Image("Notification_Laundry_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .leading)
                }else if categoryID == "4"{
                    Image("Notification_Gym_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .leading)
                }else if categoryID == "5"{
                    Image("Notification_Sports_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .leading)
                }else if categoryID == "6"{
                    Image("Notification_Healthcare_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .leading)
                }else if categoryID == "7"{
                    Image("Notification_Housekeeping_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .leading)
                }else if categoryID == "8"{
                    Image("Notification_Caffee_barista_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .leading)
                }else if categoryID == "9"{
                    Image("Notification_convenience_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .leading)
                }else if categoryID == "10"{
                    Image("Notification_Approval_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .leading)
                }else{
                    Image("Notification_General_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .leading)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.custom(OpenSans_SemiBold, size: 12))
                        .foregroundColor(colorScheme == .light ? .black : .white)
                    Text(description)
                        .font(.custom(OpenSans_SemiBold, size: 12))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                }
                
                Spacer()
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
        .padding(.top)
        .frame(width: getRect().width - 40)
        .background(colorScheme == .light ? .white : .black)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 2, x: 0, y: 0)
    }
}
