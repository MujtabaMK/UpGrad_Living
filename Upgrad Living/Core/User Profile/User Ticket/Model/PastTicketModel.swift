//
//  PastTicketModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 06/06/23.
//

import Foundation

// MARK: - PastTicketModel
struct PastTicketModel: Codable {
    let status: Int?
    let msg: String?
    let data: [PastTicket]?
}

// MARK: - Datum
struct PastTicket: Codable, Identifiable {
    let id,ticketNo , ticketCateg, ticketDesc: String?
    let ticketStatus, raisedAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "ticketId"
        case ticketNo
        case ticketCateg, ticketDesc, ticketStatus, raisedAt
    }
}
