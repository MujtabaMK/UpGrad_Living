//
//  PostDocumentModel.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 26/04/23.
//

import Foundation

// MARK: - PostDocumentModel
struct PostDocumentModel: Codable {
    let status: Int?
    let msg: String?
    let data: PostDocumentClass?
}

// MARK: - PostDocumentClass
struct PostDocumentClass: Codable {
    let fileName: String?
    let fileURL: String?

    enum CodingKeys: String, CodingKey {
        case fileName = "file_name"
        case fileURL = "file_url"
    }
}
