//
//  EventReminderPopUp.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 23/05/23.
//

import SwiftUI

struct EventReminderPopUp: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var show: Bool
    @Binding var alertMessage: String
    @Binding var isAlertShow: Bool
    var applicationId: String
    var eventId: String
    @State private var reminderType = ""
    @StateObject private var viewModel = EventReminderViewModel()
    
    var body: some View {
        ZStack{
            if show{
                colorScheme == .light ? Color.white.opacity(show ? 1 : 0).edgesIgnoringSafeArea(.all) : Color.black.opacity(show ? 1 : 0).edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        Button {
                            show = false
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(colorScheme == .light ? .black : .white)
                                .frame(width: 15, height: 15)
                        }
                        Spacer()
                        Text("Add Reminder")
                            .font(.custom(OpenSans_Bold, size: 20))
                            .foregroundColor(colorScheme == .light ? .black : .white)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    
                    VStack(spacing: 15){
                        Button {
                            reminderType = "1"
                        } label: {
                            Text("1 hour before")
                                .font(.custom(OpenSans_SemiBold, size: 14))
                                .foregroundColor(.black)
                                .frame(width: 175, height: 42)
                                .background(reminderType == "1" ? Color(hex: 0xF9B3B9) : Color(hex: 0xF4F4F4))
                        }
                        
                        Button {
                            reminderType = "2"
                        } label: {
                            Text("1 day before")
                                .font(.custom(OpenSans_SemiBold, size: 14))
                                .foregroundColor(.black)
                                .frame(width: 175, height: 42)
                                .background(reminderType == "2" ? Color(hex: 0xF9B3B9) : Color(hex: 0xF4F4F4))
                        }
                        
                        Button {
                            reminderType = "3"
                        } label: {
                            Text("Event Start Time")
                                .font(.custom(OpenSans_SemiBold, size: 14))
                                .foregroundColor(.black)
                                .frame(width: 175, height: 42)
                                .background(reminderType == "3" ? Color(hex: 0xF9B3B9) : Color(hex: 0xF4F4F4))
                                .padding(.bottom, 20)
                        }
                        
                        DetailsViewBottom(textName: "Done")
                            .onTapGesture {
                                if !reminderType.isEmpty{
                                    viewModel.setReminder(appId: applicationId, eventId: eventId, reminderType: reminderType) { reminder in
                                        if reminder.status == 1{
                                            alertMessage = reminder.msg ?? ""
                                            print(alertMessage)
                                            isAlertShow = true
                                            show = false
                                        }else{
                                            alertMessage = reminder.msg ?? ""
                                            print(alertMessage)
                                            isAlertShow = true
                                            show = false
                                        }
                                    }
                                }else{
                                    alertMessage = "Please Select Reminder Type"
                                    isAlertShow = true
                                }
                            }
                    }
                }
            }
        }
        .frame(maxWidth: UIScreen.main.bounds.width - 30, maxHeight: 350)
        .cornerRadius(20)
        .shadow(color: .gray, radius: 5, x: 0, y: 0)
    }
}
