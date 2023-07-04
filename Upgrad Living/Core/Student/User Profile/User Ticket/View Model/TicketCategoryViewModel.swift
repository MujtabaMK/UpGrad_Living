//
//  TicketCategoryViewModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 06/06/23.
//

import Foundation

class TicketCategoryViewModel: ObservableObject {
    @Published var isLoadingData = false
    @Published var ShowAlert = false
    @Published var PrintError = ""
    
    func getTicketCategory(complition: @escaping (TicketCategoryModel) -> Void){
        self.isLoadingData = true
        let urlString = GET_Ticket_Category
        
        guard let url = URL(string: urlString) else { return }
        var resuest = URLRequest(url: url)
        resuest.httpMethod = "GET"
        
        resuest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
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
                let login = try JSONDecoder().decode(TicketCategoryModel.self, from: datavalue)
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
