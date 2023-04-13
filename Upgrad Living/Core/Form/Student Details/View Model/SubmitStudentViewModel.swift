//
//  SubmitStudentViewModel.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 31/03/23.
//

import Foundation

class SubmitStudentViewModel: ObservableObject {
    @Published var coins = SubmitStudentModel.self
    @Published var isLoadingData = false
    @Published var ShowAlert = false
    @Published var PrintError = ""
    
    func fetchLoginDate(firstName: String,
                        middleName: String,
                        lastName: String,
                        mobile: String,
                        email: String,
                        bloddGroup: String,
                        bloddGroupId: String,
                        gender: String,
                        dateOfBirth: String,
                        placeOfBirth: String,
                        nationality: String,
                        aadhar: String,
                        pancard: String,
                        passport: String,
                        cAddress: String,
                        cCountry: String,
                        cState: String,
                        cCity: String,
                        cPincode: String,
                        isSameAddress: String,
                        pAddress: String,
                        pCountry: String,
                        pState: String,
                        pCity: String,
                        pPincode: String,
                        appId: String,
                        complition: @escaping (SubmitStudentModel) -> Void){
        self.isLoadingData = true
        let urlString = School_Details_Submit_API
        
        guard let url = URL(string: urlString) else { return }
        var resuest = URLRequest(url: url)
        resuest.httpMethod = "POST"
        let parameter = [
            "firstName": firstName,
            "middleName": middleName,
            "lastName": lastName,
            "mobile": mobile,
            "email": email,
            "bloddGroup": bloddGroup,
            "bloddGroupId": bloddGroupId,
            "gender": gender,
            "dateOfBirth": dateOfBirth,
            "placeOfBirth": placeOfBirth,
            "nationality": nationality,
            "aadhar": aadhar,
            "pancard": pancard,
            "passport": passport,
            "cAddress": cAddress,
            "cCountry": cCountry,
            "cState": cState,
            "cCity": cCity,
            "cPincode": cPincode,
            "isSameAddress": isSameAddress,
            "pAddress" : pAddress,
            "pCountry": pCountry,
            "pState": pState,
            "pCity": pCity,
            "pPincode": pPincode,
            "appId":appId,
        ]
        print(parameter)
        
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
                let login = try JSONDecoder().decode(SubmitStudentModel.self, from: datavalue)
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
