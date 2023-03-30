//
//  MasterViewModel.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 29/03/23.
//

import Foundation

class MasterViewModel: ObservableObject{
    @Published var VMSMasterData : MasterModel?
    @Published var isLoadingData = false
    @Published var ShowAlert = false
    @Published var PrintError = ""
    @Published var arrCountry = [countries]()
    @Published var arrGender = [gender]()
    @Published var arrBloodGroup = [BloodGroup]()

    func MasterGet(MasterComplition: @escaping (MasterModel) -> Void){
        self.isLoadingData = true
        let urlString = Master_API
        guard let url = URL(string: urlString) else { return }
        
        
        URLSession.shared.dataTask(with: url) { newdata, response, error in
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
            
            guard let datavalue = newdata else { return }
            print(datavalue)
            do{
                let VMSData = try JSONDecoder().decode(MasterModel.self, from: datavalue)
                DispatchQueue.main.async {
                    self.VMSMasterData = VMSData
                    self.arrCountry = VMSData.data?.countries ?? []
                    self.arrGender = VMSData.data?.gender ?? []
                    self.arrBloodGroup = VMSData.data?.bloodGroups ?? []
                    self.isLoadingData = false
                    MasterComplition(VMSData)
                }
            }catch let error {
                DispatchQueue.main.async {
                    self.isLoadingData = false
                    self.ShowAlert = true
                    self.PrintError = error.localizedDescription
                    print("DEBUG: error \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
