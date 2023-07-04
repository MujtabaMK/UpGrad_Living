//
//  GetGuestModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 12/06/23.
//

import Foundation

// MARK: - GetGuestModel
struct GetGuestModel: Codable {
    let status: Int?
    let msg: String?
    let data: [GetGuest]?
}

// MARK: - Datum
struct GetGuest: Codable, Identifiable {
    let id, dateInfo: String?

    enum CodingKeys: String, CodingKey {
        case id = "refrenceId"
        case dateInfo
    }
}
