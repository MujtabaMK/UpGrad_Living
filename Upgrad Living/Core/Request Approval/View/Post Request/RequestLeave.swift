//
//  RequestLeave.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 14/06/23.
//

import SwiftUI

struct RequestLeave: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    @State private var todayDate = Date()
    @State private var DifferenceBetweenDays = "0"
    
    @State private var StartDate = Date()
    @State private var EndDate = Date()
    
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
                        HStack(spacing: 20){
                            VStack(alignment: .leading){
                                Text("From Date")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                                    .padding(.top, 5)
                                
                                Button {
                                    showDatePickerAlertStart()
                                } label: {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.white)
                                        .frame(height: 40)
                                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                        .overlay {
                                            HStack{
                                                Image("Request_Calender_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 24, height: 24)
                                                    .padding(.leading, 5)
                                                    .padding(.trailing, 5)
                                                
                                                Text(startDate)
                                                    .font(.custom(OpenSans_Bold, size: 14))
                                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                                                Spacer()
                                            }
                                        }
                                }
                            }
                            
                            VStack(alignment: .leading){
                                Text("To Date")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                                    .padding(.top, 5)
                                
                                Button {
                                    showDatePickerAlertEnd()
                                } label: {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.white)
                                        .frame(height: 40)
                                        .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                        .overlay {
                                            HStack{
                                                Image("Request_Calender_icon")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 24, height: 24)
                                                    .padding(.leading, 5)
                                                    .padding(.trailing, 5)
                                                
                                                Text(endDate)
                                                    .font(.custom(OpenSans_Bold, size: 14))
                                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                                                Spacer()
                                            }
                                        }
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 5)
                        .padding(.bottom)
                        
                        VStack(alignment: .leading){
                            HStack{
                                Text("No. of days")
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(Color(hex: 0x333333))
                                
                                Rectangle()
                                    .fill(Color(hex: 0x969696))
                                    .frame(width: 0.5, height: 10)
                                
                                Text(DifferenceBetweenDays)
                                    .font(.custom(OpenSans_SemiBold, size: 14))
                                    .foregroundColor(Color(hex: 0xDE1223))
                                
                            }
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading){
                            Text("Reason for Leave")
                                .font(.custom(OpenSans_SemiBold, size: 14))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0x333333, alpha: 1.0))
                                .padding(.top, 5)
                                .padding(.leading)
                            
                            TextEditor(text: $reason)
                                .font(.custom(OpenSans_SemiBold, size: 12))
                                .foregroundColor(Color(hex: 0x868686))
                                .disableAutocorrection(true)
                                .background(.white)
                                .cornerRadius(5)
                                .frame(height: 50)
                                .padding(.horizontal)
                                .shadow(color: .gray, radius: 2, x: 0, y: 0)
                                .ignoresSafeArea(.keyboard, edges: .bottom)
                                .toolbar {
                                    ToolbarItemGroup(placement: .keyboard) {
                                        Spacer()
                                        Button("Done") {
                                            hideKeyboard()
                                        }
                                    }
                                }
                        }
                        .padding(.bottom)
                    }
                    .padding(.top)
                    .frame(width: getRect().width - 40)
                    .background(Color(hex: 0xFEEEF0))
                    .cornerRadius(10)
                    .padding(.bottom)
                    
                    Button {
                        if startDate.isEmpty{
                            alertMessage = "Please select start date"
                            AlertShow = "0"
                            showingAlert = true
                        }else if endDate.isEmpty{
                            alertMessage = "Please select end date"
                            AlertShow = "0"
                            showingAlert = true
                        }else if reason.isEmpty{
                            alertMessage = "Please enter reason for leave"
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
    }
    
    //MARK: - ConvertDate Method
    func convertDateStart(){
        // Create Date Formatter
        let dateFormatter = DateFormatter()
        // Set Date Format
        dateFormatter.dateFormat = "yyyy-MM-dd"
        // Convert Date to String
        startDate =  dateFormatter.string(from: todayDate)
        
    }
    //MARK: - Show Date Picker
    func showDatePickerAlertStart() {//\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n
        let alertVC = UIAlertController(title: "\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        let datePicker: UIDatePicker = UIDatePicker()
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.minimumDate = Date()
        alertVC.view.addSubview(datePicker)
        datePicker.frame.size.width = UIScreen.main.bounds.width
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.todayDate = datePicker.date
            self.StartDate = self.todayDate
            convertDateStart()
        }
        alertVC.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertVC.addAction(cancelAction)
        
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            viewController.present(alertVC, animated: true, completion: nil)
        }
    }
    
    //MARK: - ConvertDate Method
    func convertDateEnd(){
        // Create Date Formatter
        let dateFormatter = DateFormatter()
        // Set Date Format
        dateFormatter.dateFormat = "yyyy-MM-dd"
        // Convert Date to String
        endDate =  dateFormatter.string(from: todayDate)
        
        let diffInDays = Calendar.current.dateComponents([.day], from: StartDate, to: EndDate).day
        DifferenceBetweenDays = "\(diffInDays ?? 0)"
        
    }
    //MARK: - Show Date Picker
    func showDatePickerAlertEnd() {//\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n
        let alertVC = UIAlertController(title: "\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        let datePicker: UIDatePicker = UIDatePicker()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from:startDate)!
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.minimumDate = date
        alertVC.view.addSubview(datePicker)
        datePicker.frame.size.width = UIScreen.main.bounds.width
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.todayDate = datePicker.date
            self.EndDate = self.todayDate
            convertDateEnd()
        }
        alertVC.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertVC.addAction(cancelAction)
        
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            viewController.present(alertVC, animated: true, completion: nil)
        }
    }
}
