//
//  GetAllFavoriteModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 23/05/23.
//

import Foundation

// MARK: - GetAllFavoriteModel
struct GetAllFavoriteModel: Codable {
    let status: Int?
    let msg: String?
    let data: [AllFavorites]?
}

// MARK: - Datum
struct AllFavorites: Codable, Identifiable {
    let id, eventCateg, eventName, startDate: String?
    let startTime, endTime, endDate, location: String?
    let description: String?
    let eventImg: String?
    let totalSeats, createdAt, favID, day: String?
    let month, timeStart, fulldate: String?

    enum CodingKeys: String, CodingKey {
        case id = "hos_event_id"
        case eventCateg = "event_categ"
        case eventName = "event_name"
        case startDate = "start_date"
        case startTime = "start_time"
        case endTime = "end_time"
        case endDate = "end_date"
        case location, description
        case eventImg = "event_img"
        case totalSeats = "total_seats"
        case createdAt = "created_at"
        case favID = "fav_id"
        case day, month
        case timeStart = "time_start"
        case fulldate
    }
}
