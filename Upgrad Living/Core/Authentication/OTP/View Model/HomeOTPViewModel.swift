//
//  HomeOTPViewModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 22/06/23.
//

import Foundation

class HomeOTPViewModel: ObservableObject {
    @Published var isLoadingData = false
    @Published var ShowAlert = false
    @Published var PrintError = ""
    
    func fetchLoginDate(
        deviceType: String,
        otp: String,
        mobile: String,
        userId: String,
        userType: String,
        token: String,
        device_name: String,
        appId: String,
        complition: @escaping (HomeOTPModel) -> Void){
            self.isLoadingData = true
            let urlString = Home_Login_OTP_Verify
            
            guard let url = URL(string: urlString) else { return }
            var resuest = URLRequest(url: url)
            resuest.httpMethod = "POST"
            let parameter = [
                "deviceType": deviceType,
                "otp":otp,
                "mobile": mobile,
                "userId": userId,
                "userType": userType,
                "token": token,
                "device_name": device_name,
                "appId": appId
            ]
            
            print(parameter)
            print(urlString)
            
            resuest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            guard let httpbody = try? JSONSerialization.data(withJSONObject: parameter, options: []) else {
                return
            }
            
            print("HTTP Body = ", httpbody)
            
            resuest.httpBody = httpbody
            
            URLSession.shared.dataTask(with: resuest) { data, response, error in
                if let error = error{
                    print("DEBUG: error fetching data \(error.localizedDescription)")
                    self.isLoadingData = false
                    self.ShowAlert = true
                    self.PrintError = error.localizedDescription
                    return
                }
                
                if let response = response as? HTTPURLResponse{
                    print("DEBUG: response \(response.statusCode)")
                }
                
                guard let datavalue = data else { return }
                print(datavalue)
                do{
                    let login = try JSONDecoder().decode(HomeOTPModel.self, from: datavalue)
                    DispatchQueue.main.async {
                        self.isLoadingData = false
                        complition(login)
                    }
                }catch let error {
                    self.isLoadingData = false
                    self.ShowAlert = true
                    self.PrintError = error.localizedDescription
                    print("DEBUG: error \(error.localizedDescription)")
                }
            }.resume()
        }
}
