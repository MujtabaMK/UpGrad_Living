//
//  BookTicketModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 23/05/23.
//

import Foundation

// MARK: - CategoryModel
struct BookTicketModel: Codable {
    let status: Int?
    let msg: String?
    let data: BookTicketClass?
}

// MARK: - DataClass
struct BookTicketClass: Codable {
    let eventName, location, day, month: String?
    let timeStart, fulldate: String?
    let image: String?
    let ticketPDF: String?

    enum CodingKeys: String, CodingKey {
        case eventName = "event_name"
        case location, day, month
        case timeStart = "time_start"
        case fulldate, image
        case ticketPDF = "ticketPdf"
    }
}
