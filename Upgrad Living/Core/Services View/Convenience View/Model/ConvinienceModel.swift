//
//  ConvinienceModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 31/05/23.
//

import Foundation

// MARK: - ConvinienceModel
struct ConvinienceModel: Codable {
    let status: Int?
    let msg: String?
    let data: ConvinienceClass?
}

// MARK: - ConvinienceClass
struct ConvinienceClass: Codable {
    let timings: ConvinienceTimings?
    let offers: [ConvinienceOffer]?
    let notes: [ConvinienceNote]?
}

// MARK: - Note
struct ConvinienceNote: Codable {
    let noteID, note, startTime, startDate: String?
    let endDate, endTime, notesCateg, createdAt: String?

    enum CodingKeys: String, CodingKey {
        case noteID = "note_id"
        case note
        case startTime = "start_time"
        case startDate = "start_date"
        case endDate = "end_date"
        case endTime = "end_time"
        case notesCateg = "notes_categ"
        case createdAt = "created_at"
    }
}

// MARK: - Offer
struct ConvinienceOffer: Codable, Identifiable {
    let id, name, productName, description: String?
    let offerImage: String?

    enum CodingKeys: String, CodingKey {
        case id = "offer_id"
        case name
        case productName = "product_name"
        case description
        case offerImage = "offer_image"
    }
}

// MARK: - Timings
struct ConvinienceTimings: Codable {
    let time1, time2: String?

    enum CodingKeys: String, CodingKey {
        case time1 = "time_1"
        case time2 = "time_2"
    }
}
