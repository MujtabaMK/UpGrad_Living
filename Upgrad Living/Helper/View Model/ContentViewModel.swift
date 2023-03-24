//
//  ContentViewModel.swift
//  ATLAS VMS
//
//  Created by Mujtaba Khan on 10/01/23.
//

import Foundation

final class ContentViewModel: ObservableObject {
    
    let placeholder1 = "First Name"
    let placeholder2 = "Last Name"
    let placeholder3 = "Contact No"
    let placeholder4 = "Email Id"
    let placeholder5 = "Contact Person"
    let placeholder6 = "Date"
    let placeholder7 = "Time"
    let placeholder8 = "Select Type"
    let placholderReSend = "Mobile Number"
    let placeholderCheckIn = "Contact Person"
    let placeholderPin = "Pin"
    @Published var hint1 = "First Name"
    @Published var hint2 = "Last Name"
    @Published var hint3 = "Contact No"
    @Published var hint4 = "Email Id"
    @Published var hint5 = "Contact Person"
    @Published var hint6 = "Date"
    @Published var hint7 = "Time"
    @Published var hint8 = "Type"
    @Published var hintResend = "Success"
    @Published var hintCheckIn = "Contact Person"
    @Published var hintPin = "PIN"
    @Published var text1 = ""
    @Published var text2 = ""
    @Published var text3 = ""
    @Published var text4 = ""
    @Published var text5 = ""
    @Published var text6 = ""
    @Published var text7 = ""
    @Published var text8 = ""
    @Published var textResend = ""
    @Published var textCheckIn = ""
    @Published var textPin = ""
    @Published var text1Valid = false //{
    //        didSet {
    //            hint1 = text1Valid ? "Hint 1" : "Error 1"
    //        }
    //    }
    @Published var text2Valid = true //{
    @Published var text3Valid = true//{
    @Published var text4Valid = true
    @Published var text5Valid = true
    @Published var text6Valid = true
    @Published var text7Valid = true
    @Published var text8Valid = true
    @Published var textResendValid = true
    @Published var textCheckInValid = true
    @Published var textPinValid = true
    
    func validateText1(){
        if text1.count > 2{
            text1Valid = true
            hint1 = "Success"
        }else{
            text1Valid = false
            hint1 = "Not Valid"
        }
    }
    
    func validateText2() {
        if text2.count > 2{
            text2Valid = true
            hint2 = "Success"
        }else{
            text2Valid = false
            hint2 = "Not Valid"
        }
    }
    
    func validateText3(){
        if  text3.count != 10{
            text3Valid = false
            hint3 = "Enter 10 Digit Mobile Number"
        }else if text3.count == 10 && text3.range(of:"^[0-9+]{0,1}+[0-9]{5,10}$", options: .regularExpression) != nil{
            text3Valid = true
            hint3 = "Success"
        }else{
            text3Valid = false
            hint3 = "Not Valid"
        }
    }
    
    func validateText4(){
        if text4.count > 2 && text4.range(of:"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil{
            text4Valid = true
            hint4 = "Success"
        }else{
            text4Valid = false
            hint4 = "Enter Valid Email Id"
        }
    }
    func validateText5(){
        if text5.count > 2{
            text5Valid = true
            hint5 = "Success"
        }else{
            text5Valid = false
            hint5 = "Not Valid"
        }
    }
    func validateText6(){
        if text6.count > 2{
            text6Valid = true
            hint6 = "Success"
        }else{
            text6Valid = false
            hint6 = "Not Valid"
        }
    }
    func validateText7(){
        if text7.count > 2{
            text7Valid = true
            hint7 = "Success"
        }else{
            text7Valid = false
            hint7 = "Not Valid"
        }
    }
    func validateText8(){
        if text8.count > 2{
            text8Valid = true
            hint8 = "Success"
        }else{
            text8Valid = false
            hint8 = "Not Valid"
        }
    }
    func validateTextResend(){
        if textResend.count > 2{
            textResendValid = true
            hintResend = "Success"
        }else{
            textResendValid = false
            hintResend = "Not Valid"
        }
    }
    func validateTextCheckIn(){
        if textCheckIn.count > 2{
            textCheckInValid = true
            hintCheckIn = "Success"
        }else{
            textCheckInValid = false
            hintCheckIn = "Not Valid"
        }
    }
    func validateTextPin(){
        if textPin.count == 4{
            textPinValid = true
            hintPin = "Success"
        }else{
            textPinValid = false
            hintPin = "Not Valid"
        }
    }
}
