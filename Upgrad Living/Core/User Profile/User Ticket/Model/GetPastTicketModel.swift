//
//  GetPastTicketModel.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 06/06/23.
//

import Foundation

// MARK: - GetPastTicketModel
struct GetPastTicketModel: Codable {
    let status: Int?
    let msg: String?
    let data: getPastTicketClass?
}

// MARK: - DataClass
struct getPastTicketClass: Codable {
    let ticketNo, ticketID, ticketCateg, ticketDesc: String?
    let ticketStatus, raisedAt: String?
    let ticketDoc: [TicketDoc]?

    enum CodingKeys: String, CodingKey {
        case ticketNo
        case ticketID = "ticketId"
        case ticketCateg, ticketDesc, ticketStatus, raisedAt
        case ticketDoc = "ticket_doc"
    }
}

// MARK: - TicketDoc
struct TicketDoc: Codable, Identifiable {
    let id: String?
    let docURL: String?

    enum CodingKeys: String, CodingKey {
        case id = "docId"
        case docURL
    }
}
