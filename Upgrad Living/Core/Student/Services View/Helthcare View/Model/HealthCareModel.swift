//
//  HealthCareModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 31/05/23.
//

import Foundation

// MARK: - HealthCareModel
struct HealthCareModel: Codable {
    let status: Int?
    let msg: String?
    let data: HealthCareClass?
}

// MARK: - HealthCareClass
struct HealthCareClass: Codable {
    let doctors: [ServiceDoctor]?
    let notes: [ServiceNote]?
}

// MARK: - Doctor
struct ServiceDoctor: Codable {
    let startTime, endTime, docName, docMobNo: String?
}

// MARK: - Note
struct ServiceNote: Codable, Identifiable {
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
