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
    let data: [GetDocument]?
}

// MARK: - Datum
struct GetDocument: Codable, Identifiable{
    let title, id: String?
    let docs: [Doc]?
    
    enum CodingKeys: String, CodingKey {
            case title
            case id = "groupId"
            case docs
        }
}

// MARK: - Doc
struct Doc: Codable, Identifiable {
    let id, documentName, documentNameAbbr: String?
    let documentURL: String?
    let status: String?

    enum CodingKeys: String, CodingKey {
        case id = "documentId"
        case documentName, documentNameAbbr, documentURL, status
    }
}
