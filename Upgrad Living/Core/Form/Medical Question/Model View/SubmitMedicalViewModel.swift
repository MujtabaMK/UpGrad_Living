//
//  SubmitMedicalViewModel.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 01/04/23.
//

import Foundation

class SubmitMedicalViewModel: ObservableObject {
    @Published var coins = SubmitMedicalModel.self
    @Published var isLoadingData = false
    @Published var ShowAlert = false
    @Published var PrintError = ""

    func fetchLoginDate(dietry: String,
                        dietry_text: String,
                        f_allergies: String,
                        f_allergies_text: String,
                        health: String,
                        health_text: String,
                        medication: String,
                        medication_text: String,
                        allergies: String,
                        allergies_text: String,
                        surgery: String,
                        surgery_text: String,
                        diabetes: String,
                        diabetes_text: String,
                        hypertension: String,
                        hypertension_text: String,
                        disorders: String,
                        disorders_text: String,
                        disease: String,
                        disease_text: String,
                        communicable: String,
                        communicable_text: String,
                        liver_d: String,
                        liver_d_text: String,
                        heart_d: String,
                        heart_d_text: String,
                        arthritis: String,
                        arthritis_text: String,
                        kidney_d: String,
                        kidney_d_text: String,
                        paralysis: String,
                        paralysis_text: String,
                        congenital: String,
                        congenital_text: String,
                        handicaps: String,
                        handicaps_text: String,
                        any_d: String,
                        any_d_text: String,
                        clotting: String,
                        clotting_text: String,
                        recently_covid: String,
                        recently_covid_text: String,
                        covid_vaccine: String,
                        covid_vaccine_text: String,
                        appId: String,
                        complition: @escaping (SubmitMedicalModel) -> Void){
        self.isLoadingData = true
        let urlString = Medical_Details_Submit_API
        
        guard let url = URL(string: urlString) else { return }
        var resuest = URLRequest(url: url)
        resuest.httpMethod = "POST"
        let parameter = [
            "dietry": dietry,
            "dietry_text": dietry_text,
            "f_allergies": f_allergies,
            "f_allergies_text": f_allergies_text,
            "health": health,
            "health_text": health_text,
            "medication": medication,
            "medication_text": medication_text,
            "allergies": allergies,
            "allergies_text": allergies_text,
            "surgery": surgery,
            "surgery_text": surgery_text,
            "diabetes": diabetes,
            "diabetes_text": diabetes_text,
            "hypertension": hypertension,
            "hypertension_text": hypertension_text,
            "disorders": disorders,
            "disorders_text": disorders_text,
            "disease" : disease,
            "disease_text": disease_text,
            "communicable": communicable,
            "communicable_text": communicable_text,
            "liver_d": liver_d,
            "liver_d_text": liver_d_text,
            "heart_d": heart_d,
            "heart_d_text": heart_d_text,
            "arthritis": arthritis,
            "arthritis_text": arthritis_text,
            "kidney_d": kidney_d,
            "kidney_d_text": kidney_d_text,
            "paralysis":paralysis,
            "paralysis_text": paralysis_text,
            "congenital": congenital,
            "congenital_text": congenital_text,
            "handicaps": handicaps,
            "handicaps_text": handicaps_text,
            "any_d": any_d,
            "any_d_text": any_d_text,
            "clotting": clotting,
            "clotting_text": clotting_text,
            "recently_covid": recently_covid,
            "recently_covid_text": recently_covid_text,
            "covid_vaccine": covid_vaccine,
            "covid_vaccine_text": covid_vaccine_text,
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
                let login = try JSONDecoder().decode(SubmitMedicalModel.self, from: datavalue)
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
