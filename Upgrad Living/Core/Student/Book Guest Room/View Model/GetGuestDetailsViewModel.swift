//
//  GetGuestDetailsViewModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 12/06/23.
//

import Foundation

class GetGuestDetailsViewModel: ObservableObject {
    @Published var isLoadingData = false
    @Published var ShowAlert = false
    @Published var PrintError = ""
    
    func getGuesDetailstInfo(
        appId: String,
        bookingId: String,
        complition: @escaping (GetGuestDetailsModel) -> Void){
            self.isLoadingData = true
            let urlString = GET_Book_Guest_Room_Details
            
            guard let url = URL(string: urlString) else { return }
            var resuest = URLRequest(url: url)
            resuest.httpMethod = "POST"
            let parameter: [String: Any] = [
                "appId":appId,
                "bookingId": bookingId
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
                    let login = try JSONDecoder().decode(GetGuestDetailsModel.self, from: datavalue)
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
