//
//  HomeLoginModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 22/06/23.
//

import Foundation

// MARK: - HomeLoginModel
struct HomeLoginModel: Codable {
    let status: Int?
    let msg: String?
    let data: HomeLoginClass?
}

// MARK: - HomeLoginClass
struct HomeLoginClass: Codable {
    let userid, usertype, appID, username: String?
    let email, mobile: String?

    enum CodingKeys: String, CodingKey {
        case userid, usertype
        case appID = "appId"
        case username, email, mobile
    }
}
