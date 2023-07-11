//
//  ParentPendingModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 19/06/23.
//

import Foundation

// MARK: - ParentPendingModel
struct ParentPendingModel: Codable {
    let status: Int?
    let msg: String?
    let data: [ParentPending]?
}

// MARK: - Datum
struct ParentPending: Codable, Identifiable {
    let id, requestCategory, guestName, guestNo: String?
    let reasonCateg, startDate, endDate, startTime: String?
    let endTime, reason, days: String?
    let isEdit: String?

    enum CodingKeys: String, CodingKey {
        case id = "requestId"
        case requestCategory, guestName, guestNo, reasonCateg, startDate, endDate, startTime, endTime, reason, days, isEdit
    }
}
