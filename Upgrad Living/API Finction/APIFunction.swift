//
//  APIFunction.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 29/03/23.
//

import Foundation

//MARK: - saveLoginOTPData

func saveLoginOTPData(dict: OTPClass, retuenvalue: @escaping (OTPClass) -> Void){
    retuenvalue(dict)
}

////MARK: - GetLoginOTPData
//func getLoginOTPData(dict: OTPClass) -> [String: Any?]{
//    let loginData1 = [
//        "userid": dict.userid ?? "",
//        "username": dict.username ?? "",
//        "email": dict.email ?? "",
//        "mobile": dict.mobile ?? "",
//        "profileImage": dict.profileImage ?? "",
//        "usertype": dict.usertype ?? 0,
//    ] as [String : Any]
//    let loginData2 = [
//        "certification": dict.certification ?? "",
//        "discipline": dict.discipline ?? "",
//        "graduationYear": dict.graduationYear ?? "",
//        "school": dict.school ?? "",
//        "website": dict.website ?? "",
//        "schoolLogo": dict.schoolLogo ?? "",
//        "schoolAppLogoMain": dict.schoolAppLogoMain ?? "",
//        "schoolAppLogoRotate": dict.schoolAppLogoRotate ?? "",
//    ]
//    let loginData3 = [
//        "fatherName": dict.fatherName ?? "",
//        "fatherEmail": dict.fatherEmail ?? "",
//        "fatherMobile": dict.fatherMobile ?? "",
//        "motherName": dict.motherName ?? "",
//        "motherEmail": dict.motherEmail ?? "",
//        "motherMobile": dict.motherMobile ?? "",
//        "shortBio": dict.shortBio ?? "",
//        "userType": dict.userType ?? "",
//        "activation": dict.activation ?? "",
//        "registerID": dict.registerID ?? "",
//        "rollNo": dict.rollNo ?? ""
//    ]
//    let finalLoginData = loginData1 + loginData2 + loginData3
//    let defaults = UserDefaults.standard
//    defaults.set(finalLoginData, forKey: "loginDataAfterCallingOTP")
//    return finalLoginData
//}
