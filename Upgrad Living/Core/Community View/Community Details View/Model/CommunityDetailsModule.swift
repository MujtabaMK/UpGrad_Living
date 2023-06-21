//
//  CommunityDetailsModule.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 02/06/23.
//

import Foundation

// MARK: - CommunityDetailsModule
struct CommunityDetailsModule: Codable {
    let status: Int?
    let msg: String?
    let data: CommunityDetailsClass?
}

// MARK: - DataClass
struct CommunityDetailsClass: Codable {
    let clubDetails: ClubDetails?
    let details: [Detail]?
    let gallery: [Gallery]?
}

// MARK: - ClubDetails
struct ClubDetails: Codable {
    let clubID, clubName, title, note: String?
    let clubImg: String?

    enum CodingKeys: String, CodingKey {
        case clubID = "clubId"
        case clubName, title, note, clubImg
    }
}

// MARK: - Detail
struct Detail: Codable {
    let title, descrption: String?
}

// MARK: - Gallery
struct Gallery: Codable {
    let date: String?
    let images: [ClubImage]?
}

// MARK: - Image
struct ClubImage: Codable {
    let image: String?
}
