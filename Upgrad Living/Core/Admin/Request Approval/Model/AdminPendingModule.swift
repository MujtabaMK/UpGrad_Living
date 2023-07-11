//
//  AdminPendingModule.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 11/07/23.
//

import Foundation

// MARK: - AdminPendingModule
struct AdminPendingModule: Codable {
    let status: Int?
    let msg: String?
    let data: [AdminPending]?
}

// MARK: - Datum
struct AdminPending: Codable, Identifiable {
    let id, isEdit, requestCategory, guestName: String?
    let guestNo, reasonCateg, startDate, endDate: String?
    let startTime, endTime, reason, days: String?
    let roomName, studntName: String?
    let studentImg: String?

    enum CodingKeys: String, CodingKey {
        case id = "requestId"
        case isEdit, requestCategory, guestName, guestNo, reasonCateg, startDate, endDate, startTime, endTime, reason, days, roomName, studntName, studentImg
    }
}
