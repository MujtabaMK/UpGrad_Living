//
//  ParentContentViewModel.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 30/03/23.
//

import Foundation

final class ParentContentViewModel: ObservableObject {
    
    //Father
    let placeholderFatherFirstName = "Father’s First Name*"
    let placeholderFatherMiddleName = "Father’s Middle Name"
    let placeholderFatherLastName = "Father’s Last Name*"
    let placeholderFatherMobileNumber = "Father's Mobile Number*"
    let placeholderFatherEmail = "Father's Email*"
    
    //Mother
    let placeholderMotherFirstName = "Mother’s First Name*"
    let placeholderMotherMiddleName = "Mother’s Middle Name"
    let placeholderMotherLastName = "Mother’s Last Name*"
    let placeholderMotherMobileNumber = "Mother’s Mobile Number*"
    let placeholderMotherEmail = "Mother’s Email*"
    
    //Guardian
    let placeholderGuardianFirstName = "Guardian’s First Name"
    let placeholderGuardianMiddleName = "Guardian’s Middle Name"
    let placeholderGuardianLastName = "Guardian’s Last Name"
    let placeholderGuardianMobileNumber = "Guardian’s Mobile Number"
    let placeholderGuardianEmail = "Guardian’s Email"
    let placeholderGuardianRelationship = "Relationship to you"
    
    //Adress
    let placeholderCurrentAddress = "Address of Current Residence"
    let placeholderCurrentCountry = "Country"
    let placeholderCurrentState = "State"
    let placeholderCurrentCity = "City"
    let placeholderCurrentPincode = "Pin Code"
    
    //Father
    @Published var hintFatherFirstName = "Father’s First Name"
    @Published var hintFatherMiddleName = "Father’s Middle Name"
    @Published var hintFatherLastName = "Father’s Last Name"
    @Published var hintFatherMobileNumber = "Father’s Mobile Number"
    @Published var hintFatherEmail = "Father’s Email"
    
    //Mother
    @Published var hintMotherFirstName = "Mother’s First Name"
    @Published var hintMotherMiddleName = "Mother’s Middle Name"
    @Published var hintMotherLastName = "Mother’s Last Name"
    @Published var hintMotherMobileNumber = "Mother’s Mobile Number"
    @Published var hintMotherEmail = "Mother’s Email"
    
    //Guardian
    @Published var hintGuardianFirstName = "Guardian’s First Name"
    @Published var hintGuardianMiddleName = "Guardian’s Middle Name"
    @Published var hintGuardianLastName = "Guardian’s Last Name"
    @Published var hintGuardianMobileNumber = "Guardian’s Mobile Number"
    @Published var hintGuardianEmail = "Guardian’s Email"
    @Published var hintGuardianRelationship = "Relationship to you"
    
    //Adress
    @Published var hintCurrentAddress = "Address of Current Residence"
    @Published var hintCurrentCountry = "Country"
    @Published var hintCurrentState = "State"
    @Published var hintCurrentCity = "City"
    @Published var hintCurrentPincode = "Pin Code"
    
    //Father
    @Published var textFatherFirstName = ""
    @Published var textFatherMiddleName = ""
    @Published var textFatherLastName = ""
    @Published var textFatherMobileNumber = ""
    @Published var textFatherEmail = ""
    
    //Mother
    @Published var textMotherFirstName = ""
    @Published var textMotherMiddleName = ""
    @Published var textMotherLastName = ""
    @Published var textMotherMobileNumber = ""
    @Published var textMotherEmail = ""
    
    //Guardian
    @Published var textGuardianFirstName = ""
    @Published var textGuardianMiddleName = ""
    @Published var textGuardianLastName = ""
    @Published var textGuardianMobileNumber = ""
    @Published var textGuardianEmail = ""
    @Published var textGuardianRelationship = ""
    
    //Aadress
    @Published var textCurrentAddress = ""
    @Published var textCurrentCountry = ""
    @Published var textCurrentState = ""
    @Published var textCurrentCity = ""
    @Published var textCurrentPincode = ""
    
    
    //Father
    @Published var textFatherFirstNameValid = false
    @Published var textFatherMiddleNameValid = false
    @Published var textFatherLastNameValid = false
    @Published var textFatherMobileNumberValid = true
    @Published var textFatherEmailValid = true
    
    //Mother
    @Published var textMotherFirstNameValid = false
    @Published var textMotherMiddleNameValid = false
    @Published var textMotherLastNameValid = false
    @Published var textMotherMobileNumberValid = true
    @Published var textMotherEmailValid = true
    
    //Guardian
    @Published var textGuardianFirstNameValid = false
    @Published var textGuardianMiddleNameValid = false
    @Published var textGuardianLastNameValid = false
    @Published var textGuardianMobileNumberValid = true
    @Published var textGuardianEmailValid = true
    @Published var textGuardianRelationshipValid = true
    
    //Aadress
    @Published var textCurrentAddressValid = true
    @Published var textCurrentCountryValid = true
    @Published var textCurrentStateValid = true
    @Published var textCurrentCityValid = true
    @Published var textCurrentPincodeValid = true
    
    //Father
    func validateTextFatherFirstName(){
        if textFatherFirstName.count > 2{
            textFatherFirstNameValid = true
            hintFatherFirstName = "Success"
        }else{
            textFatherFirstNameValid = false
            hintFatherFirstName = "Not Valid"
        }
    }
    func validateTextFatherMiddleName(){
        if textFatherMiddleName.count > 0{
            textFatherMiddleNameValid = true
            hintFatherMiddleName = "Success"
        }else{
            textFatherMiddleNameValid = false
            hintFatherMiddleName = "Not Valid"
        }
    }
    func validateTextFatherLastName(){
        if textFatherLastName.count > 2{
            textFatherLastNameValid = true
            hintFatherLastName = "Success"
        }else{
            textFatherLastNameValid = false
            hintFatherLastName = "Not Valid"
        }
    }
    func validateTextFatherMobileNumber(){
        if  textFatherMobileNumber.count != 10{
            textFatherMobileNumberValid = false
            hintFatherMobileNumber = "Enter 10 Digit Mobile Number"
        }else if textFatherMobileNumber.count == 10 && textFatherMobileNumber.range(of:"^[0-9+]{0,1}+[0-9]{5,10}$", options: .regularExpression) != nil{
            textFatherMobileNumberValid = true
            hintFatherMobileNumber = "Success"
        }else{
            textFatherMobileNumberValid = false
            hintFatherMobileNumber = "Not Valid"
        }
    }
    func validateTextFatherEmail(){
        if textFatherEmail.count > 2 && textFatherEmail.range(of:"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil{
            textFatherEmailValid = true
            hintFatherEmail = "Success"
        }else{
            textFatherEmailValid = false
            hintFatherEmail = "Enter Valid Email Id"
        }
    }
    
    //Mother
    func validateTextMotherFirstName(){
        if textMotherFirstName.count > 2{
            textMotherFirstNameValid = true
            hintMotherFirstName = "Success"
        }else{
            textMotherFirstNameValid = false
            hintMotherFirstName = "Not Valid"
        }
    }
    func validateTextMotherMiddleName(){
        if textMotherMiddleName.count > 0{
            textMotherMiddleNameValid = true
            hintMotherMiddleName = "Success"
        }else{
            textMotherMiddleNameValid = false
            hintMotherMiddleName = "Not Valid"
        }
    }
    func validateTextMotherLastName(){
        if textMotherLastName.count > 2{
            textMotherLastNameValid = true
            hintMotherLastName = "Success"
        }else{
            textMotherLastNameValid = false
            hintMotherLastName = "Not Valid"
        }
    }
    func validateTextMotherMobileNumber(){
        if  textMotherMobileNumber.count != 10{
            textMotherMobileNumberValid = false
            hintMotherMobileNumber = "Enter 10 Digit Mobile Number"
        }else if textMotherMobileNumber.count == 10 && textMotherMobileNumber.range(of:"^[0-9+]{0,1}+[0-9]{5,10}$", options: .regularExpression) != nil{
            textMotherMobileNumberValid = true
            hintMotherMobileNumber = "Success"
        }else{
            textMotherMobileNumberValid = false
            hintMotherMobileNumber = "Not Valid"
        }
    }
    func validateTextMotherEmail(){
        if textMotherEmail.count > 2 && textMotherEmail.range(of:"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil{
            textMotherEmailValid = true
            hintMotherEmail = "Success"
        }else{
            textMotherEmailValid = false
            hintMotherEmail = "Enter Valid Email Id"
        }
    }
    
    //Guardian
    func validateTextGuardianFirstName(){
        if textGuardianFirstName.count > 0{
            textGuardianFirstNameValid = true
            hintGuardianFirstName = "Success"
        }else{
            textGuardianFirstNameValid = false
            hintGuardianFirstName = "Not Valid"
        }
    }
    func validateTextGuardianMiddleName(){
        if textGuardianMiddleName.count > 0{
            textGuardianMiddleNameValid = true
            hintGuardianMiddleName = "Success"
        }else{
            textGuardianMiddleNameValid = false
            hintGuardianMiddleName = "Not Valid"
        }
    }
    func validateTextGuardianLastName(){
        if textGuardianLastName.count > 0{
            textGuardianLastNameValid = true
            hintGuardianLastName = "Success"
        }else{
            textGuardianLastNameValid = false
            hintGuardianLastName = "Not Valid"
        }
    }
    func validateTextGuardianMobileNumber(){
        if  textGuardianMobileNumber.count != 10{
            textGuardianMobileNumberValid = false
            hintGuardianMobileNumber = "Enter 10 Digit Mobile Number"
        }else if textGuardianMobileNumber.count == 10 && textGuardianMobileNumber.range(of:"^[0-9+]{0,1}+[0-9]{5,10}$", options: .regularExpression) != nil{
            textGuardianMobileNumberValid = true
            hintGuardianMobileNumber = "Success"
        }else{
            textGuardianMobileNumberValid = false
            hintGuardianMobileNumber = "Not Valid"
        }
    }
    func validateTextGuardianEmail(){
        if textGuardianEmail.count > 2 && textGuardianEmail.range(of:"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil{
            textGuardianEmailValid = true
            hintGuardianEmail = "Success"
        }else{
            textGuardianEmailValid = false
            hintGuardianEmail = "Enter Valid Email Id"
        }
    }
    
    func validateTextGuardianRelationship(){
        if textGuardianRelationship.count > 0{
            textGuardianRelationshipValid = true
            hintGuardianRelationship = "Success"
        }else{
            textGuardianRelationshipValid = false
            hintGuardianRelationship = "Not Valid"
        }
    }
    
    //Aadress
    func validateTextCurrentAddress() {
        if textCurrentAddress.count > 2{
            textCurrentAddressValid = true
            hintCurrentAddress = "Success"
        }else{
            textCurrentAddressValid = false
            hintCurrentAddress = "Not Valid"
        }
    }
    func validateTextCountry() {
        if textCurrentCountry.count > 2{
            textCurrentCountryValid = true
            hintCurrentCountry = "Success"
        }else{
            textCurrentCountryValid = false
            hintCurrentCountry = "Not Valid"
        }
    }
    func validateTextState() {
        if textCurrentState.count > 2{
            textCurrentStateValid = true
            hintCurrentState = "Success"
        }else{
            textCurrentStateValid = false
            hintCurrentState = "Not Valid"
        }
    }
    func validateTextCity() {
        if textCurrentCity.count > 2{
            textCurrentCityValid = true
            hintCurrentCity = "Success"
        }else{
            textCurrentCityValid = false
            hintCurrentCity = "Not Valid"
        }
    }
    func validateTextPincode() {
        if textCurrentPincode.count > 2{
            textCurrentPincodeValid = true
            hintCurrentPincode = "Success"
        }else{
            textCurrentPincodeValid = false
            hintCurrentPincode = "Not Valid"
        }
    }
}
