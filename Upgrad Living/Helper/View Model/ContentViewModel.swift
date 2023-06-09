//
//  ContentViewModel.swift
//  ATLAS VMS
//
//  Created by Mujtaba Khan on 10/01/23.
//

import Foundation

final class StudentContentViewModel: ObservableObject {
    
    let placeholderFirstName = "First Name*"
    let placeholderMiddleName = "Middle Name"
    let placeholderLastName = "Last Name*"
    let placeholderMobileNumber = "Mobile Number*"
    let placeholderEmail = "Email*"
    let placeholderBloodGroup = "Blood Group*"
    let placeholderGender = "Gender*"
    let placeholderDOB = "Date of Birth*"
    let placeholderPOB = "Place of Birth*"
    let placeholderNationality = "Nationality*"
    let placeholderAadhar = "Aadhar Card*"
    let placeholderPan = "PAN Card No."
    let placeholderPassport = "Passport No."
    let placeholderCurrentAddress = "Address of Current Residence*"
    let placeholderCurrentCountry = "Country*"
    let placeholderCurrentState = "State*"
    let placeholderCurrentCity = "City*"
    let placeholderCurrentPinCode = "Pin Code*"
    let placeholderPermanentAddress = "Address of Permanent Residence*"
    let placeholderPermanentCountry = "Country*"
    let placeholderPermanentState = "State*"
    let placeholderPermanentCity = "City*"
    let placeholderPermanentPinCode = "Pin Code*"
    
    @Published var hintFirstName = "First Name"
    @Published var hintMiddleName = "Middle Name"
    @Published var hintLastName = "Last Name"
    @Published var hintMobileNumber = "Mobile Number"
    @Published var hintEmail = "Email"
    @Published var hintBloodGroup = "Blood Group"
    @Published var hintGender = "Gender"
    @Published var hintDOB = "Date of Birth"
    @Published var hintPOB = "Place of Birth"
    @Published var hintNationality = "Nationality"
    @Published var hintAadhar = "Aadhar Card"
    @Published var hintPan = "PAN Card No."
    @Published var hintPassport = "Passport No."
    @Published var hintCurrentAddress = "Address of Current Residence"
    @Published var hintCurrentCountry = "Country"
    @Published var hintCurrentState = "State"
    @Published var hintCurrentCity = "City"
    @Published var hintCurrentPinCode = "Pin Code"
    @Published var hintPermanentAddress = "Address of Permanent Residence"
    @Published var hintPermanentCountry = "Country"
    @Published var hintPermanentState = "State"
    @Published var hintPermanentCity = "City"
    @Published var hintPermanentPinCode = "Pin Code"
    
    @Published var textFirstName = ""
    @Published var textMiddleName = ""
    @Published var textLastName = ""
    @Published var textMobileNumber = ""
    @Published var textEmail = ""
    @Published var textBloodGroup = ""
    @Published var textGender = ""
    @Published var textDOB = ""
    @Published var textPOB = ""
    @Published var textNationality = ""
    @Published var textAadharCard = ""
    @Published var textPanCard = ""
    @Published var textPassport = ""
    @Published var textCurrentAddress = ""
    @Published var textCurrentCountry = ""
    @Published var textCurrentState = ""
    @Published var textCurrentCity = ""
    @Published var textCurrentPinCode = ""
    @Published var textPermanentAddress = ""
    @Published var textPermanentCountry = ""
    @Published var textPermanentState = ""
    @Published var textPermanentCity = ""
    @Published var textPermanentPinCode = ""
    
    @Published var textFirstNameValid = false
    @Published var textMiddleNameValid = true
    @Published var textLastNameValid = true
    @Published var textMobileNumberValid = true
    @Published var textEmailValid = true
    @Published var textBloodGroupValid = true
    @Published var textGenderValid = true
    @Published var textDOBValid = true
    @Published var textPOBValid = true
    @Published var textNationalityValid = true
    @Published var textAadharValid = true
    @Published var textPanValid = true
    @Published var textPassportValid = true
    @Published var textCurrentAddressValid = true
    @Published var textCurrentCountryValid = true
    @Published var textCurrentStateValid = true
    @Published var textCurrentCityValid = true
    @Published var textCurrentPinCodeValid = true
    @Published var textPermanentAddressValid = true
    @Published var textPermanentCountryValid = true
    @Published var textPermanentStateValid = true
    @Published var textPermanentCityValid = true
    @Published var textPermanentPinCodeValid = true
    
    func validateTextFirstName(){
        if textFirstName.count > 2{
            textFirstNameValid = true
            hintFirstName = "Success"
        }else{
            textFirstNameValid = false
            hintFirstName = "Not Valid"
        }
    }
    
    func validateTextMiddleName() {
        if textMiddleName.count > 0{
            textMiddleNameValid = true
            hintMiddleName = "Success"
        }else{
            textMiddleNameValid = false
            hintMiddleName = "Not Valid"
        }
    }
    
    func validateTextLastName() {
        if textLastName.count > 2{
            textLastNameValid = true
            hintLastName = "Success"
        }else{
            textLastNameValid = false
            hintLastName = "Not Valid"
        }
    }
    
    func validateTextMobileNumber(){
        if  textMobileNumber.count != 10{
            textMobileNumberValid = false
            hintMobileNumber = "Enter 10 Digit Mobile Number"
        }else if textMobileNumber.count == 10 && textMobileNumber.range(of:"^[0-9+]{0,1}+[0-9]{5,10}$", options: .regularExpression) != nil{
            textMobileNumberValid = true
            hintMobileNumber = "Success"
        }else{
            textMobileNumberValid = false
            hintMobileNumber = "Not Valid"
        }
    }
    func validateTextEmail(){
        if textEmail.count > 2 && textEmail.range(of:"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil{
            textEmailValid = true
            hintEmail = "Success"
        }else{
            textEmailValid = false
            hintEmail = "Enter Valid Email Id"
        }
    }
    func validateTextBloodGroup() {
        if textBloodGroup.count > 1{
            textBloodGroupValid = true
            hintBloodGroup = "Success"
        }else{
            textBloodGroupValid = false
            hintBloodGroup = "Not Valid"
        }
    }
    func validateTextGender() {
        if textGender.count > 1{
            textGenderValid = true
            hintGender = "Success"
        }else{
            textGenderValid = false
            hintGender = "Not Valid"
        }
    }
    func validateTextDOB() {
        if textDOB.count > 2{
            textDOBValid = true
            hintDOB = "Success"
        }else{
            textDOBValid = false
            hintDOB = "Not Valid"
        }
    }
    func validateTextPOB() {
        if textPOB.count > 2{
            textPOBValid = true
            hintPOB = "Success"
        }else{
            textPOBValid = false
            hintPOB = "Not Valid"
        }
    }
    func validateTextNationality() {
        if textNationality.count > 2{
            textNationalityValid = true
            hintNationality = "Success"
        }else{
            textNationalityValid = false
            hintNationality = "Not Valid"
        }
    }
    func validateTextAadhar() {
        if textAadharCard.count > 1{
            textAadharValid = true
            hintAadhar = "Success"
        }else{
            textAadharValid = false
            hintAadhar = "Not Valid"
        }
    }
    func validateTextPan() {
        if textPanCard.count > 2{
            textPanValid = true
            hintPan = "Success"
        }else{
            textNationalityValid = false
            hintPan = "Not Valid"
        }
    }
    func validateTextPassport() {
        if textPassport.count > 2{
            textPassportValid = true
            hintPassport = "Success"
        }else{
            textPassportValid = false
            hintPassport = "Not Valid"
        }
    }
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
        if textCurrentState.count > 1{
            textCurrentStateValid = true
            hintCurrentState = "Success"
        }else{
            textCurrentStateValid = false
            hintCurrentState = "Not Valid"
        }
    }
    func validateTextCity() {
        if textCurrentCity.count > 1{
            textCurrentCityValid = true
            hintCurrentCity = "Success"
        }else{
            textCurrentCityValid = false
            hintCurrentCity = "Not Valid"
        }
    }
    func validateTextCurrentPinCode() {
        if textCurrentPinCode.count > 1{
            textCurrentPinCodeValid = true
            hintCurrentPinCode = "Success"
        }else{
            textCurrentPinCodeValid = false
            hintCurrentPinCode = "Not Valid"
        }
    }
    func validateTextPermentAddress() {
        if textPermanentAddress.count > 2{
            textPermanentCountryValid = true
            hintPermanentAddress = "Success"
        }else{
            textPermanentCountryValid = false
            hintPermanentAddress = "Not Valid"
        }
    }
    func validateTextPermentCountry() {
        if textPermanentCountry.count > 1{
            textPermanentCountryValid = true
            hintPermanentCountry = "Success"
        }else{
            textPermanentCountryValid = false
            hintPermanentCountry = "Not Valid"
        }
    }
    func validateTextPermentState() {
        if textPermanentState.count > 1{
            textPermanentStateValid = true
            hintPermanentState = "Success"
        }else{
            textPermanentStateValid = false
            hintPermanentState = "Not Valid"
        }
    }
    func validateTextPermentCity() {
        if textPermanentCity.count > 1{
            textPermanentCityValid = true
            hintPermanentCity = "Success"
        }else{
            textPermanentCityValid = false
            hintPermanentCity = "Not Valid"
        }
    }
    func validateTextPermentPinCode() {
        if textPermanentPinCode.count > 1{
            textPermanentPinCodeValid = true
            hintPermanentPinCode = "Success"
        }else{
            textPermanentPinCodeValid = false
            hintPermanentPinCode = "Not Valid"
        }
    }
}
