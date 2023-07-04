//
//  RequestLateNight.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 13/06/23.
//

import SwiftUI

struct RequestLateNight: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    @FocusState private var focusField: LateNightField?
    
    @State private var todayDate = Date()
    
    @Binding var startDate: String
    @Binding var endDate: String
    @Binding var startTime: String
    @Binding var endTime: String
    @Binding var guestName: String
    @Binding var guestNo: String
    @Binding var reason: String
    @Binding var callAPI: Bool
    
    @Binding var alertMessage: String
    @Binding var showingAlert: Bool
    @Binding var AlertShow: String
    
    var body: some View {
        ZStack{
            ScrollView(showsIndicators: false){
                VStack{
                    VStack(alignment: .leading){
                        Text("Select Date")
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0x333333,alpha: 1.0))
                            .padding(.top)
                            .padding(.leading)
                        
                        Button {
                            showDatePickerAlert()
                        } label: {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(.white)
                                .frame(height: 40)
                                .padding(.horizontal)
                                .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                .overlay {
                                    HStack{
                                        Image("Request_Calender_icon")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 25, height: 35)
                                            .padding(.leading, 20)
                                        
                                        Text(startDate)
                                            .font(.custom(OpenSans_Bold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                }
                        }
                        .padding(.bottom, 5)
                        
                        HStack(spacing: 20){
                            VStack(alignment: .leading){
                                Text("Start Time")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                                    .padding(.top, 5)
                                
                                Button {
                                    showStartTimePickerAlert()
                                } label: {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.white)
                                        .frame(height: 40)
                                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                        .overlay {
                                            HStack{
                                                Image("Request_Time_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 24, height: 24)
                                                    .padding(.leading, 5)
                                                    .padding(.trailing, 5)
                                                
                                                Text(startTime)
                                                    .font(.custom(OpenSans_Bold, size: 14))
                                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                                                Spacer()
                                            }
                                        }
                                }
                            }
                            
                            VStack(alignment: .leading){
                                Text("End Time")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                                    .padding(.top, 5)
                                
                                Button {
                                    showEndTimePickerAlert()
                                } label: {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.white)
                                        .frame(height: 40)
                                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                        .overlay {
                                            HStack{
                                                Image("Request_Time_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 24, height: 24)
                                                    .padding(.leading, 5)
                                                    .padding(.trailing, 5)
                                                
                                                Text(endTime)
                                                    .font(.custom(OpenSans_Bold, size: 14))
                                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                                                Spacer()
                                            }
                                        }
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading){
                            Text("Reason for late night")
                                .font(.custom(OpenSans_SemiBold, size: 14))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0x333333, alpha: 1.0))
                                .padding(.top, 5)
                                .padding(.leading)
                            
                            TextEditor(text: $reason)
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x333333))
                                .focused($focusField, equals: .textField)
                                .disableAutocorrection(true)
                                .background(colorScheme == .light ? .white : .white)
                                .cornerRadius(5)
                                .frame(height: 50)
                                .padding(.horizontal)
                                .shadow(color: .gray, radius: 2, x: 0, y: 0)
                        }
                        .padding(.bottom)
                    }
                    .frame(width: getRect().width - 40)
                    .background(Color(hex: 0xFEEEF0))
                    .cornerRadius(10)
                    .padding(.bottom)
                    
                    Button {
                        if startDate.isEmpty{
                            alertMessage = "Please select date"
                            AlertShow = "0"
                            showingAlert = true
                        }else if startTime.isEmpty{
                            alertMessage = "Please select start time"
                            AlertShow = "0"
                            showingAlert = true
                        }else if endTime.isEmpty{
                            alertMessage = "Please select end time"
                            AlertShow = "0"
                            showingAlert = true
                        }else if startTime > endTime{
                            alertMessage = "Please Correct the time"
                            AlertShow = "0"
                            showingAlert = true
                        }else if reason.isEmpty{
                            alertMessage = "Please enter reason for late night"
                            AlertShow = "0"
                            showingAlert = true
                        }else{
                            callAPI.toggle()
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(colorScheme == .light ? LinearGradient(colors: [Color(hex: 0xB20710), Color(hex: 0xEE2C3C)], startPoint: .trailing, endPoint: .leading) : LinearGradient(colors: [Color(hex: 0xD24752), Color(hex: 0xE73241)], startPoint: .trailing, endPoint: .leading))
                            .frame(width: 280, height: 50)
                            .overlay {
                                Text("Submit")
                                    .font(.custom(OpenSans_SemiBold, size: 15))
                                    .foregroundColor(.white)
                            }
                    }
                }
            }
        }
        .onAppear{
            UITextView.appearance().backgroundColor = .clear
        }
    }
    
    private enum LateNightField {
        case textField
    }
    
    //MARK: - ConvertDate Method
    func convertDate(){
        // Create Date Formatter
        let dateFormatter = DateFormatter()
        // Set Date Format
        dateFormatter.dateFormat = "yyyy-MM-dd"
        // Convert Date to String
        startDate =  dateFormatter.string(from: todayDate)
    }
    
    //MARK: - Show Date Picker
    func showDatePickerAlert() {//\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n
        let alertVC = UIAlertController(title: "\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        let datePicker: UIDatePicker = UIDatePicker()
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.minimumDate = Date()
        alertVC.view.addSubview(datePicker)
        datePicker.frame.size.width = UIScreen.main.bounds.width
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.todayDate = datePicker.date
            convertDate()
        }
        alertVC.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertVC.addAction(cancelAction)
        
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            viewController.present(alertVC, animated: true, completion: nil)
        }
    }
    
    //MARK: - Convert Start Time Method
    func convertStartTime(){
        // Create Date Formatter
        let dateFormatter = DateFormatter()
        // Set Date Format
        dateFormatter.dateFormat = "HH:mm:ss"
        // Convert Date to String
        startTime =  dateFormatter.string(from: todayDate)
    }
    
    //MARK: - Convert End Time Method
    func convertEndTime(){
        // Create Date Formatter
        let dateFormatter = DateFormatter()
        // Set Date Format
        dateFormatter.dateFormat = "HH:mm:ss"
        // Convert Date to String
        endTime =  dateFormatter.string(from: todayDate)
    }
    
    //MARK: - Show Time Picker
    func showStartTimePickerAlert() {//\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n
        let alertVC = UIAlertController(title: "\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        let datePicker: UIDatePicker = UIDatePicker()

        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        alertVC.view.addSubview(datePicker)
        datePicker.frame.size.width = UIScreen.main.bounds.width
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.todayDate = datePicker.date
            convertStartTime()
        }
        alertVC.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertVC.addAction(cancelAction)
        
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            viewController.present(alertVC, animated: true, completion: nil)
        }
    }
    
    //MARK: - Show Time Picker
    func showEndTimePickerAlert() {//\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n
        let alertVC = UIAlertController(title: "\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        let datePicker: UIDatePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        alertVC.view.addSubview(datePicker)
        datePicker.frame.size.width = UIScreen.main.bounds.width
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.todayDate = datePicker.date
            convertEndTime()
        }
        alertVC.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertVC.addAction(cancelAction)
        
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            viewController.present(alertVC, animated: true, completion: nil)
        }
    }
}
