//
//  LaundryModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 30/05/23.
//

import Foundation

// MARK: - LaundryModel
struct LaundryModel: Codable {
    let status: Int?
    let msg: String?
    let data: LaundryClass?
}

// MARK: - DataClass
struct LaundryClass: Codable {
    let laundryTimings: [LaundryTiming]?
    let notes: [LaundryNote]?
}

// MARK: - LaundryTiming
struct LaundryTiming: Codable, Equatable {
    let day, startTime, endTime, floor: String?
}

// MARK: - Note
struct LaundryNote: Codable, Identifiable {
    let id, note, startTime, startDate: String?
    let endDate, endTime, notesCateg, createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "note_id"
        case note
        case startTime = "start_time"
        case startDate = "start_date"
        case endDate = "end_date"
        case endTime = "end_time"
        case notesCateg = "notes_categ"
        case createdAt = "created_at"
    }
}
