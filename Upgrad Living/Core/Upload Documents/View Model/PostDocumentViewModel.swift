//
//  PostDocumentViewModel.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 26/04/23.
//

import Foundation

class PostDocumentViewModel: ObservableObject {
    @Published var coins = PostDocumentModel.self
    @Published var isLoadingData = false
    @Published var ShowAlert = false
    @Published var PrintError = ""
    
    func postUploadDocument(file_name: String,file_base64: String,file_ext: String,doc_upload_doc_id: String,appId: String, complition: @escaping (PostDocumentModel) -> Void){
        self.isLoadingData = true
        let urlString = POST_Upload_Document
        
        guard let url = URL(string: urlString) else { return }
        var resuest = URLRequest(url: url)
        resuest.httpMethod = "POST"
        let parameter = [
            "file_name": file_name,
            "file_base64":file_base64,
            "file_ext": file_ext,
            "doc_upload_doc_id": doc_upload_doc_id,
            "appId": appId
        ]
                
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
                let login = try JSONDecoder().decode(PostDocumentModel.self, from: datavalue)
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
