//
//  LoginModel.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 24/03/23.
//

import Foundation

// MARK: - Login
struct LoginModel: Codable {
    let status: Int?
    let msg: String?
    let data: LoginClass?
}

// MARK: - LoginClass
struct LoginClass: Codable {
    let studentMobile, studentAppID: String?

    enum CodingKeys: String, CodingKey {
        case studentMobile = "student_mobile"
        case studentAppID = "student_app_id"
    }
}
