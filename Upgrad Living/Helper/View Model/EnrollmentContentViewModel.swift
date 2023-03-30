//
//  EnrollmentContentViewModel.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 30/03/23.
//

import Foundation

final class EnrollmentContentViewModel: ObservableObject {
    
    let placeholderApplicationID = "ATLAS Application ID*"
    let placeholderSchool = "School*"
    let placeholderProgram = "Program*"
    let placeholderDegree = "Degree*"
    let placeholderSpeclization = "Specialization*"
    
    @Published var hintApplicationId = "ATLAS Application ID"
    @Published var hintSchool = "ATLAS Application ID"
    @Published var hintProgram = "ATLAS Application ID"
    @Published var hintDegree = "ATLAS Application ID"
    @Published var hintSpeclization = "ATLAS Application ID"
    
    @Published var textApplicationID = ""
    @Published var textSchool = ""
    @Published var textProgram = ""
    @Published var textDegree = ""
    @Published var textSpeclization = ""
    
    @Published var textApplicationIDValid = false
    @Published var textSchoolValid = false
    @Published var textProgramValid = false
    @Published var textDegreeValid = false
    @Published var textSpeclizationValid = false
    
    func validateTextApplicationId(){
        if textApplicationID.count > 2{
            textApplicationIDValid = true
            hintApplicationId = "Success"
        }else{
            textApplicationIDValid = false
            hintApplicationId = "Not Valid"
        }
    }
    
    func validateTextSchool(){
        if textSchool.count > 2{
            textSchoolValid = true
            hintSchool = "Success"
        }else{
            textSchoolValid = false
            hintSchool = "Not Valid"
        }
    }
    
    func validateTextProgram(){
        if textProgram.count > 2{
            textProgramValid = true
            hintProgram = "Success"
        }else{
            textProgramValid = false
            hintProgram = "Not Valid"
        }
    }
    
    func validateTextDegree(){
        if textDegree.count > 2{
            textDegreeValid = true
            hintDegree = "Success"
        }else{
            textDegreeValid = false
            hintDegree = "Not Valid"
        }
    }
    
    func validateTextSpeclization(){
        if textSpeclization.count > 2{
            textSpeclizationValid = true
            hintSpeclization = "Success"
        }else{
            textSpeclizationValid = false
            hintSpeclization = "Not Valid"
        }
    }
}
