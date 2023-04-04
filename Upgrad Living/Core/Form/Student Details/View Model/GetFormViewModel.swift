//
//  GetFormViewModel.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 04/04/23.
//

import Foundation

class GetFormViewModel: ObservableObject {
    @Published var coins = GetFormModel.self
    @Published var isLoadingData = false
    @Published var ShowAlert = false
    @Published var PrintError = ""

    func fetchLoginDate(appId: String,complition: @escaping (GetFormModel) -> Void){
        self.isLoadingData = true
        let urlString = GET_App_Details
        
        guard let url = URL(string: urlString) else { return }
        var resuest = URLRequest(url: url)
        resuest.httpMethod = "POST"
        let parameter = [
            "appId": appId,
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
                let login = try JSONDecoder().decode(GetFormModel.self, from: datavalue)
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
