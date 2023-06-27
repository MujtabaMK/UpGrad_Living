//
//  LoginOTPModel.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 29/03/23.
//

import Foundation

// MARK: - LoginOTPModel
struct OTPModel: Codable {
    let status: Int?
    let msg: String?
    let data: OTPClass?
}

// MARK: - OTPClass
struct OTPClass: Codable {
    let userid, username, email, mobile: String?
    let profileImage: String?
    let usertype: Int?
    let certification, discipline, graduationYear, school: String?
    let website: String?
    let schoolLogo, schoolAppLogoMain, schoolAppLogoRotate: String?
    let appID,fatherName, fatherEmail, fatherMobile, motherName: String?
    let motherEmail, motherMobile, facebook, instagram: String?
    let twitter, shortBio, userType, activation: String?
    let password, registerID, behance, googlePlus: String?
    let linkedin, rollNo: String?

    enum CodingKeys: String, CodingKey {
        case userid, username, email, mobile
        case profileImage = "profile_image"
        case usertype, certification, discipline
        case graduationYear = "graduation_year"
        case school, website
        case schoolLogo = "school_logo"
        case schoolAppLogoMain = "school_app_logo_main"
        case schoolAppLogoRotate = "school_app_logo_rotate"
        case appID = "appId"
        case fatherName = "father_name"
        case fatherEmail = "father_email"
        case fatherMobile = "father_mobile"
        case motherName = "mother_name"
        case motherEmail = "mother_email"
        case motherMobile = "mother_mobile"
        case facebook, instagram, twitter
        case shortBio = "short_bio"
        case userType = "user_type"
        case activation, password
        case registerID = "register_id"
        case behance
        case googlePlus = "google_plus"
        case linkedin
        case rollNo = "roll_no"
    }
}
