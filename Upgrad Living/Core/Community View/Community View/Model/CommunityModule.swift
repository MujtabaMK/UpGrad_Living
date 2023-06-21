//
//  CommunityModule.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 01/06/23.
//

import Foundation

// MARK: - CommunityModule
struct CommunityModule: Codable {
    let status: Int?
    let msg: String?
    let data: [CommunityData]?
}

// MARK: - Datum
struct CommunityData: Codable, Identifiable {
    let id, clubName, description: String?
    let clubImg: String?

    enum CodingKeys: String, CodingKey {
        case id = "clubId"
        case clubName, description, clubImg
    }
}
