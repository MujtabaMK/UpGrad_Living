//
//  ProfileViewModel.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 26/04/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var isLoadingData = false
    @Published var ShowAlert = false
    @Published var PrintError = ""
    
    func postProfile(appId: String,creativity: NSArray,sports: NSArray,entertainment: NSArray,goingOut: NSArray,stayingIn: NSArray,foodAndDrink: NSArray,values: NSArray, complition: @escaping (ProfileModel) -> Void){
        self.isLoadingData = true
        let urlString = POST_Save_Profile
        
        guard let url = URL(string: urlString) else { return }
        var resuest = URLRequest(url: url)
        resuest.httpMethod = "POST"
        let parameter: [String: Any] = [
            "appId": appId,
            "creativity": creativity,
            "sports": sports,
            "entertainment": entertainment,
            "goingOut": goingOut,
            "stayingIn": stayingIn,
            "foodAndDrink": foodAndDrink,
            "values": values
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
                let login = try JSONDecoder().decode(ProfileModel.self, from: datavalue)
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
