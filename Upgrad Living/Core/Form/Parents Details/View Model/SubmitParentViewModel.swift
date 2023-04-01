//
//  SubmitParentViewModel.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 01/04/23.
//

import Foundation

class SubmitParentViewModel: ObservableObject {
    @Published var coins = SubmitParentModel.self
    @Published var isLoadingData = false
    @Published var ShowAlert = false
    @Published var PrintError = ""

    func fetchLoginDate(fFirstName: String,
                        fMiddleName: String,
                        fLastName: String,
                        fMobile: String,
                        fEmail: String,
                        mFirstName: String,
                        mMiddleName: String,
                        mLastName: String,
                        mMobile: String,
                        mEmail: String,
                        gFirstName: String,
                        gMiddleName: String,
                        gLastName: String,
                        gMobile: String,
                        gEmail: String,
                        gRelation: String,
                        gAddress: String,
                        gCountry: String,
                        gState: String,
                        gCity: String,
                        gPincode: String,
                        appId: String,
                        complition: @escaping (SubmitParentModel) -> Void){
        self.isLoadingData = true
        let urlString = Parent_Details_Submit_API
        
        guard let url = URL(string: urlString) else { return }
        var resuest = URLRequest(url: url)
        resuest.httpMethod = "POST"
        let parameter = [
            "fFirstName": fFirstName,
            "fMiddleName": fMiddleName,
            "fLastName": fLastName,
            "fMobile": fMobile,
            "fEmail": fEmail,
            "mFirstName": mFirstName,
            "mMiddleName": mMiddleName,
            "mLastName": mLastName,
            "mMobile": mMobile,
            "mEmail": mEmail,
            "gFirstName": gFirstName,
            "gMiddleName": gMiddleName,
            "gLastName": gLastName,
            "gMobile": gMobile,
            "gEmail": gEmail,
            "gRelation": gRelation,
            "gAddress": gAddress,
            "gCountry": gCountry,
            "gState": gState,
            "gCity": gCity,
            "gPincode" : gPincode,
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
                let login = try JSONDecoder().decode(SubmitParentModel.self, from: datavalue)
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
