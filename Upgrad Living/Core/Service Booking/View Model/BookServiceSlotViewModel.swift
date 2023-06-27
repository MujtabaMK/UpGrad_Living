//
//  BookServiceSlotViewModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 23/06/23.
//

import Foundation

class BookServiceSlotViewModel: ObservableObject {
    @Published var isLoadingData = false
    @Published var ShowAlert = false
    @Published var PrintError = ""
    
    func PostBookServiceSlot(
        appId: String,
        categoryId: String,
        date: String,
        slotId: String,
        timeSlotId: String,
        complition: @escaping (BookServiceSlotModel) -> Void){
            
        self.isLoadingData = true
        let urlString = POST_Book_Service_Slot
        
        guard let url = URL(string: urlString) else { return }
        var resuest = URLRequest(url: url)
        resuest.httpMethod = "POST"
        let parameter: [String: Any] = [
            "appId":appId,
            "categoryId": categoryId,
            "date": date,
            "slotId": slotId,
            "timeSlotId": timeSlotId
        ]
        
        print(urlString)
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
                let login = try JSONDecoder().decode(BookServiceSlotModel.self, from: datavalue)
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
