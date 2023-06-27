//
//  HomeOTPModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 22/06/23.
//

import Foundation

// MARK: - HomeOTPModel
struct HomeOTPModel: Codable {
    let status: Int?
    let msg: String?
    let data: HomeOTPClass?
}

// MARK: - HomeOTPClass
struct HomeOTPClass: Codable {
    let userid, usertype, appID, username: String?
    let email, mobile: String?

    enum CodingKeys: String, CodingKey {
        case userid, usertype
        case appID = "appId"
        case username, email, mobile
    }
}
