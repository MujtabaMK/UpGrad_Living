//
//  GetDocumentModel.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 26/04/23.
//

import Foundation

struct GetDocumentModel: Codable {
    let status: Int?
    let msg: String?
    let data: [Document]?
}

// MARK: - Datum
struct Document: Codable {
    let documentID, documentName: String?
    let documentURL: String?
    let status: String?

    enum CodingKeys: String, CodingKey {
        case documentID = "documentId"
        case documentName, documentURL, status
    }
}
