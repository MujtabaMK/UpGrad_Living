//
//  GetAllEventModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 23/05/23.
//

import Foundation

// MARK: - GetAllEventModel
struct GetAllEventModel: Codable {
    let status: Int?
    let msg: String?
    let data: [AllEvent]?
}

// MARK: - Datum
struct AllEvent: Codable, Identifiable {
    let id, eventCateg, eventName, startDate: String?
    let startTime, endTime, endDate, location: String?
    let description: String?
    let eventImg: String?
    let totalSeats, createdAt, categID, categName: String?
    let day, month, timeStart, fulldate: String?
    let isFavorate, availableSeats, isTicketBooked: String?
    let qrURL: String?
    let ticketPDF: String?
    let fulltimewithdate: String?

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
        case categID = "categ_id"
        case categName = "categ_name"
        case day, month
        case timeStart = "time_start"
        case fulldate, isFavorate, availableSeats, isTicketBooked
        case qrURL = "qrUrl"
        case ticketPDF = "ticketPdf"
        case fulltimewithdate
    }
}
