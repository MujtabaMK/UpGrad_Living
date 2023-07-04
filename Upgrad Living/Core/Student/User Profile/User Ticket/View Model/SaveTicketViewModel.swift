//
//  SaveTicketViewModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 07/06/23.
//

import Foundation

class SaveTicketViewModel: ObservableObject {
    @Published var isLoadingData = false
    @Published var ShowAlert = false
    @Published var PrintError = ""
    
    func postSaveTicket(
        ticketCategory: String,
        group_id: String,
        ticketDisc: String,
        appId:String,
        complition: @escaping (SaveTicketModel) -> Void){
            self.isLoadingData = true
            let urlString = POST_Save_Ticket
            
            guard let url = URL(string: urlString) else { return }
            var resuest = URLRequest(url: url)
            resuest.httpMethod = "POST"
            let parameter: [String: Any] = [
                "ticketCategory": ticketCategory,
                "group_id": group_id,
                "ticketDisc": ticketDisc,
                "appId":appId,
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
                    let login = try JSONDecoder().decode(SaveTicketModel.self, from: datavalue)
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
