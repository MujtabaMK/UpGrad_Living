//
//  PostTicketPhotoModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 06/06/23.
//

import Foundation

// MARK: - PostTicketPhotoModel
struct PostTicketPhotoModel: Codable {
    let status: Int?
    let msg: String?
    let data: PostImagePhotoClass?
}

// MARK: - DataClass
struct PostImagePhotoClass: Codable {
    let id: Int?
    let fileURL: String?

    enum CodingKeys: String, CodingKey {
        case id
        case fileURL = "file_url"
    }
}
